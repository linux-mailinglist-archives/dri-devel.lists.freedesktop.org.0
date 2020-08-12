Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF77242A97
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 15:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C305A6E0FC;
	Wed, 12 Aug 2020 13:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B746E0FC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 13:49:35 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id x24so1972148otp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6p588ldpfa1PVpJ16iQTZFtp7YHBAN7hgleJ+hPyMLw=;
 b=Aof0WnwL4Zpy/TzlXE9WxgzQzSIBn9eQBLvK3uaFdobVRSFA6hoRM5PP9kBt33r8D2
 lUkSV5tiTUP0ENvEe+exQdP2uazJOa6dDn/xLZES9iVUFHXzn1wKBT8sSRou9DXjSvgN
 rCHCsdVGAFiBdxpYbmuqYBeZCtvokMeYDr+lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6p588ldpfa1PVpJ16iQTZFtp7YHBAN7hgleJ+hPyMLw=;
 b=YkwhVQeIg6BQ2HFJJFrlS02Eu+X6qC0NaoYB4sD+CCKf23T/fBFFyVOdUBNAVthVhK
 o0SqXWgV0sdBxaYt/uNLQn8oKuiHRVghz5eDIxrXgIBAQOKjIkcOtuY5oQ16ms7ZYUFh
 dwIaIJtZ/lLwMyw35//oOHOXmTJCeCBgJgUaVyrB4iS4cF44jdXvmHpQKg6dAY9nhySy
 MrpOZp2wtMVfKAKXYReTZZdhQm+f37d7nMT9cHj/8SEUmoq4vFogCN5sjGQDrHT5PrrN
 um63hawnVSRONomp8SFpEHcgUl5fAQu78mcEQDlze/QFGt4IEYitbxkjSC9wUuVI64zz
 JroQ==
X-Gm-Message-State: AOAM53093/qaCY8zbmuoC6bSJzISJnBrN56goxxFL8gLxR3RsITPAKjy
 BAVetM6sVk5vacVK49L6D/ihHgcoejXFe4ovZHk4LQ==
X-Google-Smtp-Source: ABdhPJxEe0H3WGYtNYF7iiy0/vriF3AdeNpxSoMQy6gs/xutnGtPjqYzCu6cznAdYnnxukUfyTao/pCs1WdiecXZaJk=
X-Received: by 2002:a9d:7283:: with SMTP id t3mr8920536otj.303.1597240174269; 
 Wed, 12 Aug 2020 06:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200807133658.1866-1-christian.koenig@amd.com>
 <1975d7d1-8f94-5852-6ccc-19fde4d4a919@gmail.com>
In-Reply-To: <1975d7d1-8f94-5852-6ccc-19fde4d4a919@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 12 Aug 2020 15:49:23 +0200
Message-ID: <CAKMK7uF7nTgJE38Krhnw9Ca4FtFpw4b=nFr8-tWqPxTkRrh=Pw@mail.gmail.com>
Subject: Re: RFC: How to adjust the trace pid?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Shashank.Sharma@amd.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTIsIDIwMjAgYXQgMzo0MiBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQaW5nPyBEYW5pZWwsIERhdmUg
YW55IG9waW5pb24gb24gdGhpcz8KClR5cGUgcGF0Y2gsIGNjOiB0cmFjaW5nIHBlb3BsZSwgc2Vl
IHdoYXQgdGhleSBzYXk/IHRiaCBJIGhhdmUgbm8gaWRlYSwKYnV0IHRoZXkgaGF2ZSBiZWVuIG1h
a2luZyB1bmhhcHB5IG5vaXNlcyBhYm91dCBzb21lIG9mIHRoZSB0cmlja3MKd2UndmUgcGxheWVk
IGluIHRoZSBwYXN0IGluIGk5MTUgdHJhY2Vwb2ludHMuIFNvIG5vdCBldmVyeXRoaW5nIGlzCmNv
b2wgaW4gdGhlcmUuCgpPdGhlcndpc2UgSSBndWVzcyBqdXN0IGFkZCBhbm90aGVyIHRyYWNlcG9p
bnQgcGFyYW1ldGVyIHRvIGR1bXAgdGhlCmNvcnJlY3QgdXNlcnNwYWNlIG1tLgoKM3JkIG9wdGlv
biBjb3VsZCBiZSB0byBkdW1wIHRoZSBjdXJyZW50IG1tIChzaW5jZSBJJ20gYXNzdW1pbmcgdGhv
c2UKdGhyZWFkcyBkbyBrdGhyZWFkX3VzZS91bnVzZV9tbSB0byBpbXBlcnNvbmF0ZSB0aGUgcmln
aHQgdXNlcnNwYWNlCnByb2Nlc3MgY29ycmVjdGx5KSBpbiB0aGUgdHJhY2Vwb2ludCBpbmZyYXN0
cnVjdHVyZSB0b28/CgpDaGVlcnMsIERhbmllbAoKPiBDaHJpc3RpYW4uCj4KPiBBbSAwNy4wOC4y
MCB1bSAxNTozNiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4gPiBIaSBldmVyeWJvZHksCj4g
Pgo+ID4gaW4gYW1kZ3B1IHdlIGdvdCB0aGUgZm9sbG93aW5nIGlzc3VlIHdoaWNoIEknbSBzZWVr
aW5nIGFkdmlzZSBob3cgdG8gY2xlYW5seSBoYW5kbGUgaXQuCj4gPgo+ID4gV2UgaGF2ZSBhIGJ1
bmNoIG9mIHRyYWNlIHBvaW50cyB3aGljaCBhcmUgcmVsYXRlZCB0byB0aGUgVk0gc3Vic3lzdGVt
IGFuZCBleGVjdXRlZCBpbiBlaXRoZXIgYSB3b3JrIGl0ZW0sIGt0aHJlYWQgb3IgZm9yZWlnbiBw
cm9jZXNzIGNvbnRleHQuCj4gPgo+ID4gTm93IHRyYWNpbmcgdGhlIHBpZCBvZiB0aGUgY29udGV4
dCB3aGljaCB3ZSBhcmUgZXhlY3V0aW5nIGluIGlzIG5vdCByZWFsbHkgdGhhdCB1c2VmdWwsIHNv
IEknbSB3b25kZXJpbmcgaWYgd2UgY291bGQganVzdCBvdmVyd3JpdGUgdGhlIHBpZCByZWNvcmRl
ZCBpbiB0aGUgdHJhY2UgZW50cnk/Cj4gPgo+ID4gVGhlIGZvbGxvd2luZyBwYXRjaCBkb2VzIGV4
YWN0bHkgdGhhdCBmb3IgdGhlIHZtX2dyYWJfaWQoKSB0cmFjZSBwb2ludCwgYnV0IEknbSBub3Qg
MTAwJSBzdXJlIGlmIHRoYXQgaXMgbGVnYWwgb3Igbm90Lgo+ID4KPiA+IEFueSBpZGVhcz8gQ29t
bWVudHM/Cj4gPgo+ID4gVGhhbmtzLAo+ID4gQ2hyaXN0aWFuLgo+ID4KPiA+Cj4KCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
