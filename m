Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C35F95D5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4863D6EB72;
	Tue, 12 Nov 2019 16:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228396EB72
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 16:41:43 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a13so2849949uaq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 08:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CMEiw8U8DqaCf3I6mhUgmoE2htMdtfLaz5BBpcrujeA=;
 b=efjjUuqBVGDEndECnlb+mjTvuSviSjUd3R42R3eJzLaTPUCmo+6pGvwhAnm1qfjJSO
 WwBQMuVvXmWsW9zmtIrRJkZqpiW8tU23DOUrFzvmDCdKWJXcVJqzwke0FVo1wEJ5g0MN
 9GQn68Fo5G5pFetG5iBpAzC0LvdXfV9kgJx3Mc2tRBAtVYcfeKuL9s//L9KPB7Ld2bGJ
 P+WXo3BMxIUki+9Cow0OuGu/nIW2cGDKvyxeYfe7d3NDmoOm7fUlN1keQs6SmU1US+j4
 pc524UfI7/fCtRzw4XZNZ9fjPyPRe+/mB6WzDkNqv8nmZO5To8cm0G7ivvMv/1TyzVxs
 8Kjg==
X-Gm-Message-State: APjAAAW1iCDqAEsrDVtrMXeGf4ctavDjJu1j1zI3lfbvqr8ng4IARtB4
 NrEb70X1GFR3YObFaGIgYCVeJlx8TjDcL/ondZ7Www==
X-Google-Smtp-Source: APXvYqyUr+eXbTvK00A0AiIt3bG6YgoqvLO/EPw582awp+RKyGXTr5Tb+D+r4JI8WEqiin1EWeerlCJCVCMlrM6QmfA=
X-Received: by 2002:ab0:314a:: with SMTP id e10mr9711098uam.98.1573576901837; 
 Tue, 12 Nov 2019 08:41:41 -0800 (PST)
MIME-Version: 1.0
References: <536af56f-924d-f089-a2d8-180f4dee1613@pr.hu>
 <CAKb7UvhZ9VR_X5Nqv01EDvnWF2RXXt5fCdYEa5KUy8owKh4CwQ@mail.gmail.com>
 <35cdaafe-461e-56ec-d3d3-47fdd6468251@pr.hu>
 <CAKb7Uvh2L0oHMwNss-h1BFXGYeEXOUDLHB9TnaNEm4-oNhjMRw@mail.gmail.com>
 <6af6c1c5-0b99-e034-8a9c-83d4e1171115@pr.hu>
 <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
In-Reply-To: <d2788b17-3179-ef9d-419a-635e784c6297@pr.hu>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 12 Nov 2019 11:41:30 -0500
Message-ID: <CAKb7UvikHeUOj06oqBYnq2==KJ-CGDyZjHsbtbZtA+3r9jK68A@mail.gmail.com>
Subject: Re: UDL device cannot get its own screen
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
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
Cc: xorg@lists.x.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgOToyMyBBTSBCw7ZzesO2cm3DqW55aSBab2x0w6FuIDx6
Ym9zem9yQHByLmh1PiB3cm90ZToKPiBCdXQgbm8sIGFsbCBHUFUgZGV2aWNlcyAobm93IG9ubHkg
b25lLCB0aGUgVURMIGRldmljZSkgaGF2ZSBzY3JlZW4gMAo+IChhLmsuYS4gRElTUExBWT06MC4w
KSBzZXQgd2hlbiBBdXRvQmluZEdQVSBpcyB0cnVlOgo+Cj4gWyAgMjQ0NC41NzZdIHhmODZBdXRv
Q29uZmlnT3V0cHV0RGV2aWNlczogeGY4Nk51bVNjcmVlbnMgMiB4Zjg2TnVtR1BVU2NyZWVucyAx
Cj4gWyAgMjQ0NC41NzZdIHhmODZBdXRvQ29uZmlnT3V0cHV0RGV2aWNlczogR1BVICMwIGRyaXZl
ciAnbW9kZXNldHRpbmcnICdtb2Rlc2V0JyBzY3JuSW5kZXgKPiAyNTYgb3JpZ0luZGV4IDI1NyBw
U2NyZWVuLT5teU51bSAyNTYgY29uZlNjcmVlbi0+c2NyZWVubnVtIDAKPiBjb25mU2NyZWVuLT5k
ZXZpY2UtPmlkZW50aWZpZXIgJ0ludGVsMCcKPiAgIGNvbmZTY3JlZW4tPmRldmljZS0+c2NyZWVu
IDAgY29uZlNjcmVlbi0+ZGV2aWNlLT5teVNjcmVlblNlY3Rpb24tPnNjcmVlbm51bSAwCj4gY29u
ZlNjcmVlbi0+ZGV2aWNlLT5teVNjcmVlblNlY3Rpb24tPmRldmljZS0+c2NyZWVuIDAKPgo+IFNv
bWVob3csIE9wdGlvbiAiRGV2aWNlIiBzaG91bGQgZW5zdXJlIHRoYXQgdGhlIFVETCBkZXZpY2Ug
aXMgYWN0dWFsbHkKPiB0cmVhdGVkIGFzIGEgZnJhbWVidWZmZXIgdGhhdCBjYW4gYmUgcmVuZGVy
ZWQgaW50byAoaS5lLiB0byBiZSBtb2Rlc2V0KDIpCj4gaW5zdGVhZCBvZiBtb2Rlc2V0KEduKSkg
YW5kIGl0IHNob3VsZCBiZSB3b2tlbiB1cCBhdXRvbWF0aWNhbGx5Lgo+Cj4gVGhpcyBpcyB3aGF0
IEF1dG9CaW5kR1BVIGlzIHN1cHBvc2VkIHRvIGRvLCBpc24ndCBpdD8KPgo+IEJ1dCBpbnN0ZWFk
IG9mIGFzc2lnbmluZyB0byBzY3JlZW4gMCwgaXQgc2hvdWxkIGJlIGFzc2lnbmVkIHRvIHdoYXRl
dmVyCj4gc2NyZWVuIG51bWJlciBpdCBpcyBjb25maWd1cmVkIGFzLgo+Cj4gSSBrbm93IGl0J3Mg
bm90IGEgY29tbW9uIHVzZSBjYXNlIG5vd2FkYXlzLCBidXQgSSByZWFsbHkgd2FudCBzZXBhcmF0
ZQo+IGZ1bGxzY3JlZW4gYXBwcyBvbiB0aGVpciBpbmRlcGVuZGVudCBzY3JlZW5zLCBpbmNsdWRp
bmcgYSBzdGFuZGFsb25lIFVETAo+IGRldmljZSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxhdHRl
cnMgYXMgYSBYaW5lcmFtYSBleHRlbnNpb24gdG8gc29tZQo+IG90aGVyIGRldmljZS4KCklmIHlv
dSBzZWUgYSAiRyIsIHRoYXQgbWVhbnMgaXQncyBiZWluZyB0cmVhdGVkIGFzIGEgR1BVIGRldmlj
ZSwgd2hpY2gKaXMgKm5vdCogd2hhdCB5b3Ugd2FudCBpZiB5b3Ugd2FudCBzZXBhcmF0ZSBzY3Jl
ZW5zLiBZb3UgbmVlZCB0byB0cnkKdG8gY29udmluY2UgdGhpbmdzIHRvICpub3QqIHNldCB0aGUg
ZGV2aWNlcyB1cCBhcyBHUFUgZGV2aWNlcywgYnV0Cmluc3RlYWQgcHV0IGVhY2ggZGV2aWNlIChh
bmQgZWFjaCBvbmUgb2YgaXRzIGhlYWRzLCB2aWEgWmFwaG9kSGVhZHMpCm5vIGEgc2VwYXJhdGUg
ZGV2aWNlLCB3aGljaCBpbiB0dXJuIHdpbGwgaGF2ZSBhIHNlcGFyYXRlIHNjcmVlbi4KCiAgLWls
aWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
