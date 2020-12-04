Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D662D0C37
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E5089DDF;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C356E1F5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 19:20:49 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id w18so3850797vsk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 11:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3RfmsOD4R8FThIOERGPH+DqSWdV2gOeuwbTDc0BCACk=;
 b=ED+Yl2tvlFfU7xMIOOS47zHVQLtV6INZZvh0HH4yw3SWBHzU4MNC4rXbzHM74kG9XR
 ZbMTZuU01dpnUQoaIPQ4jp4DxhYBqUy6YSa2lSiV5e7KaadOuv9DX5WExV5QLyD1+xVI
 t7pP0QhkyrRZgM0PgtgIA9asldGrwLJB3gyatruE0iDpoVWVyQWb4WpwEA6OpOjQ7r7W
 O8/doy3IHvTaswQkkK2DdJdjTY3MHBe7FBbhVTULX0yQuwmsP7d6Lbo/5hthSTlEYqKj
 eSz+5Qwdv8NWKzfHNTgp97QES+8Y9kdQd2+XsngGpRfAIK3Ac8j2BGZRCemAbfAll7HF
 NrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3RfmsOD4R8FThIOERGPH+DqSWdV2gOeuwbTDc0BCACk=;
 b=C6e+FTWl+zYO2tFlJ+PJimJsDn3DK9y8SIVwn8y+DCvwyj/v6AyGZnjmj1ZgMMmn0m
 prnqi7rFB9HTqE8IotKwzwRnmpRNmotfwzJ8c9dIsvHnDyeezvvpkkPSKDey4XGNUPuK
 278GEXfwgJ2JSi6st/g5Kt3hMaf18xNDHuGzOaL1ETkNEuqs4gA+rbjFgtjghpgEt3N0
 cs9vn7Rv9nxooC3yJZT7eqRB8bM2MIAD/V5qGLoVY5bBboQfSpC2VeLP/eI0BCtd/TMd
 jxQ3FKUKDJQAgTdCe4hA5+nGWUwcaTk4FHCKDLEt/0mAH3c9tYKb32/nYWOkpU2HOeOZ
 wdFA==
X-Gm-Message-State: AOAM532dmImwj4Mktbukgegb/eHig67wLgUUNlC8LWMH9vH9zX15Ux7j
 Cm81jzDn4UHkSTvyMW6rSup4CjVmpk6YOSQO80M=
X-Google-Smtp-Source: ABdhPJwqY8Cz8zt67T3BVJvNnRhGnl8wOKMvKKSfumPMETzn1knT8+JsYs3DxXmbQCcxhs6RK/0aE+HMmFZIhWrNP7o=
X-Received: by 2002:a67:d204:: with SMTP id y4mr5725128vsi.60.1607109648459;
 Fri, 04 Dec 2020 11:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20201204035318.332419-1-jim.cromie@gmail.com>
 <20201204035318.332419-2-jim.cromie@gmail.com>
 <X8pY/H512EMR3bUX@intel.com>
In-Reply-To: <X8pY/H512EMR3bUX@intel.com>
From: jim.cromie@gmail.com
Date: Fri, 4 Dec 2020 12:20:21 -0700
Message-ID: <CAJfuBxysOxnm846u71f0rQCH9NX-7AMe4brmiD0vqfGeQKuVOw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm: RFC add choice to use dynamic debug in
 drm-debug
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Baron <jbaron@akamai.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgNCwgMjAyMCBhdCA4OjQyIEFNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQg
MDg6NTM6MTdQTSAtMDcwMCwgSmltIENyb21pZSB3cm90ZToKPiA+IGRybSdzIGRlYnVnIHN5c3Rl
bSB1c2VzIGRpc3RpbmN0IGNhdGVnb3JpZXMgb2YgZGVidWcgbWVzc2FnZXMsIG1hcHBlZAo+ID4g
dG8gYml0cyBpbiBkcm0uZGVidWcuICBDdXJyZW50bHksIGNvZGUgZG9lcyBhIGxvdCBvZiB1bmxp
a2VseSBiaXQtbWFzawo+ID4gY2hlY2tzIG9uIGRybS5kZWJ1ZyAoaW4gZHJtX2RlYnVnX2VuYWJs
ZWQpLCB3ZSBjYW4gdXNlIGR5bmFtaWMgZGVidWcKPiA+IGluc3RlYWQsIGFuZCBnZXQgYWxsIHRo
YXQganVtcF9sYWJlbCBnb29kbmVzcy4KPgo+IHdoYXRpcyBqdW1wX2xhYmVsPwoKU29ycnksIEkg
c2hvdWxkIGhhdmUgYXQgbGVhc3QgY2FwaXRhbGl6ZWQgdGhhdCwgYW5kIHNwZWxsZWQgaXQgZGlm
ZmVyZW50bHkKCmtlcm5lbC9NYWtlZmlsZQoxMTg6b2JqLSQoQ09ORklHX0pVTVBfTEFCRUwpICs9
IGp1bXBfbGFiZWwubwoKaXQgaXMgdGhlIGhvdC1wYXRjaGluZyBzdWJzdHJhdGUgdW5kZXJuZWF0
aCBpdCBhbGwuCnN0YXRpYy1rZXksIHN0YXRpYy1jYWxsLCBldGM/CmR5bmFtaWMtZGVidWcgdXNl
cyBzdGF0aWMta2V5IGRpcmVjdGx5LgoKCgo+Cj4gT25lIHRoaW5nIHRoYXQgYnVncyBtZSBhYm91
dCB0aGUgY3VycmVudCBkcm1fZGJnKCkgc3R1ZmYgaXMgdGhhdAo+IGl0J3MgYSBmdW5jdGlvbiwg
YW5kIHRodXMgd2UgcGF5IHRoZSBjb3N0IG9mIHNldHRpbmcgdXAgdGhlCj4gYXJndW1lbnRzIGV2
ZW4gd2hlbiBkZWJ1Z3MgYXJlIG5vdCBlbmFibGVkLiBJIHBsYXllZCBhcm91bmQgYSBiaXQKPiB3
aXRoIG1ha2luZyBpdCBhIG1hY3JvIGFnYWluIHdpdGggdGhlIHVubGlrZWx5IGJpdCBjaGVjayBt
b3ZlZAo+IGludG8gdGhlIG1hY3JvLiBUaGF0IGRpZCBzZWVtIHRvIG1ha2Ugc29tZSBvZiB0aGUg
YXNtIGEgYml0IG5pY2VyCj4gd2hlcmUgdGhlIGRlYnVnIHN0dWZmIGdvdCBzaG92ZWQgb3V0IHRo
ZSBtYWluIGNvZGVwYXRoLCBidXQKPiBpdCBkaWQgcmVzdWx0IGluIGEgc2xpZ2h0IG5ldCBpbmNy
ZWFzZSBpbiBjb2RlIHNpemUuIFdoYXQgSSBkaWRuJ3QKPiBoYXZlIHRpbWUgdG8gZG8gaXMgY2hl
Y2sgaWYgdGhpcyBoYXMgYW55IG1lYXN1cmFibGUgc3BlZWQgZWZmZWN0Cj4gb24gZWcuIFRFU1Rf
T05MWSBjb21taXRzLgo+Cj4gQW5kIHdoaWxlIGRvaW5nIHRoYXQgSSBzdGFydGVkIHRvIHBvbmRl
ciBpZiB3ZSBjb3VsZCB1c2Ugc29tZXRoaW5nCj4gbGlrZSB0aGUgYWx0ZXJuYXRlKCkgaW5zdHJ1
Y3Rpb24gc3R1ZmYgdG8gcGF0Y2ggdGhlIGNvZGUgYXQgcnVudGltZQo+IGluIG9yZGVyIHRvIHR1
cm4gYWxsIHRob3NlIGRlYnVnIGNoZWNrcyBpbnRvIG5vcHMgd2hlbiBkZWJ1Z2dpbmcKPiBpcyBu
b3QgZW5hYmxlZC4gQnV0IEkgY291bGRuJ3QgaW1tZWRpYXRlbHkgZmluZCBhbnkgZ2VuZXJpYwo+
IGluZnJhc3RydWN0dXJlIGZvciBpdC4gU28gbm93IEkgd29uZGVyIGlmIHRoaXMganVtcF9sYWJl
bCBpcyBzb21ldGhpbmcKPiBsaWtlIHRoYXQ/Cj4KCnRoaXMgaXMgdGhlIGRyb2lkIHlvdXJlIGxv
b2tpbmcgZm9yIDstKQoKPiA+Cgo+IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
