Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE656425D4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4389487;
	Wed, 12 Jun 2019 12:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285589496
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:31:42 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b7so15174397otl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 05:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cw9cIxD/V8srVbuzeKHnYwUvD54/fZ4oeePdtfd6npE=;
 b=HY8JPoDULzh/whx0VIzZ9EjGWUKpErmCE2+J6Gc98ud/4iFmM5XZ5i680IqwaIOOIi
 rUUyk8gltYh8kQo4ZJ4K80JIkJ+Q8IJdZFtPqOK9YI2G4V+NEQj+PH4/Q3j/8r1xAAa5
 ttB0SVh17hTkhCHrgc4AiP/4hqjWJ72dmOKb4IqBBsNvxbysqhao3psZQMHw7iLo8pBg
 jKVBagDhS5us7bzVgY+HmPpEcrPvNbQiwdUYeSHae/Zxn0O1josotP2dqQIifZUySwvu
 ojAVKSL9+gp5TSLWC4SLqbA0ArpdFG2JiLhyPl4+K7BGCQ5co4u+Eh+He9gambIS7jK+
 O1AQ==
X-Gm-Message-State: APjAAAVCQPEHXuK1xEpECPfok0KpInOuxaogPSq08Q92P89WmRpqjoCh
 aOy/2YOgEGrBadLJo4x1tZ02PGmVX5AYEaQHXLSWlQ==
X-Google-Smtp-Source: APXvYqxc3wrKNMOvXdraId0BEa65SFH2yOW9PY8dW+4kdM5yYcW2XLl2oYZocs1hUUAUMgZW1Pi2mh5kfN45m7XTOE8=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr7448614otk.204.1560342700811; 
 Wed, 12 Jun 2019 05:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
 <f9e5925d-37d1-df04-db19-a963beeccde5@ti.com>
In-Reply-To: <f9e5925d-37d1-df04-db19-a963beeccde5@ti.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 12 Jun 2019 14:31:29 +0200
Message-ID: <CAKMK7uHQXGZqggkaCK5gNMpzobuNrh3AA-xu-mYepkcxNHgj3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/omapdrm: drop fb_debug_enter/leave
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Cw9cIxD/V8srVbuzeKHnYwUvD54/fZ4oeePdtfd6npE=;
 b=OqpPwuaXGevx69vTveNsz0xlhTqelXo0sWp6StZdlHQGt8AhdVN1TZK10/Mw68d7H0
 ge9w7Z2PsBKw76oWtazB4vSNzWcOa1kJCFeMyPLp+u77baEU6nDccwmLITibKf3iInyo
 Oii4LfAluMOXk2zzeUNaWfWgBxz79q7hAw4uc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTE6MTkgQU0gVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8wNi8yMDE5IDEyOjEyLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gVGhpcyBpcyBhIG5vLW9wIG9uIGF0b21pYyBkcml2ZXJzIGJlY2F1c2Ug
d2l0aCBhdG9taWMgaXQncyBzaW1wbHkgdG9vCj4gPiBjb21wbGljYXRlZCB0byBnZXQgYWxsIHRo
ZSBsb2NraW5nIGFuZCB3b3JrZXJzIGFuZCBub25ibG9ja2luZwo+ID4gc3luY2hyb25pemF0aW9u
IGNvcnJlY3QsIGZyb20gZXNzZW50aWFsbHkgYW4gTk1JIGNvbnRleHQuIFdlbGwsIHRvbwo+ID4g
Y29tcGxpY2F0ZWQgPSBpbXBvc3NpYmxlLiBBbHNvLCBvbWFwZHJtIG5ldmVyIGltcGxlbWVudGVk
IHRoZQo+ID4gbW9kZV9zZXRfYmFzZV9hdG9taWMgaG9vaywgc28gSSBraW5kYSB3b25kZXIgd2h5
IHRoaXMgd2FzIGV2ZXIgYWRkZWQuCj4gPgo+ID4gRHJvcCB0aGUgaG9va3MuCj4KPiBmOWIzNGEw
ZmE0ZTI1ZDljMGI3MmYxMjQ2ODBjMzdjMGMzOGY5OTM0Cj4KPiBJdCB3YXMganVzdCBvcGVuIGNv
ZGluZyBEUk1fRkJfSEVMUEVSX0RFRkFVTFRfT1BTLCB0byBnZXQgcmlkIG9mCj4gIkluaXRpYWxp
emVyIGVudHJ5IGRlZmluZWQgdHdpY2UiIHdhcm5pbmcuCj4KPiBBY2tlZC1ieTogVG9taSBWYWxr
ZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPgo+IE9yIEkgY2FuIHBpY2sgaXQgdXAgdG8g
bXkgYnJhbmNoIGlmIHRoaXMgaXMgbm90IHBhcnQgb2YgYSBiaWdnZXIgc2VyaWVzLgoKTm90IHBh
cnQgb2YgYSBiaWdnZXIgc2VyaWVzLCB0aGVyZSdzIHN0aWxsIGEgYnVuY2ggb2YgcmVhbCB1c2Vy
cyBvZgp0aGlzIGluLXRyZWUuIEFsdGhvdWdoIGdpdmVuIGhvdyBhYnNvbHV0ZWx5IG5vIG9uZSBz
ZWVtcyB0byBjYXJlIHRvCm1ha2Uga2dkYiB3b3JrIG9uIHRvcCBvZiBhdG9taWMgZHJpdmVycyBJ
J20gaG9waW5nIEkgY2FuIHN1bnNldCBhbGwKdGhpcyBjb2RlIHNvb24uCi1EYW5pZWwKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkg
NzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
