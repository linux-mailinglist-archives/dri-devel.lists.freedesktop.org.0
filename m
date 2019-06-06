Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7036DC2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954D6892E0;
	Thu,  6 Jun 2019 07:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1D892E0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 07:49:53 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id i8so1071447oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 00:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSEeIKVyMhLTgNDkAVC0UpcWgRhvLMSCMRp6xlSDUsw=;
 b=sSgaeWQY7KyaPTaRTFXMSFwXoe0aoPIA5NjNNaIlTMG8HSTryBes+SHBUCWN7xUn/M
 /TETNMjAZ9/XvJP7HJr4oq+unv9WjdCr72TtTqhsaZv/0G0750MAE4WbdwFMGbUxDjmF
 1iXGbPgESNH2fMIlxxV5hj4U06WIAs4SH5B7B8Od9aYnDBk0N1XDSdlFVi+eMrcybSxI
 PkO0c0pB8A9I0cHDUCET+n8F6lcaVrgjUkm4FxjtPfY7lIFEKPMhMGo0Q1a2qmb0dpF2
 IPlgbRaepuPCULNrTLB0HO3n28sRH9A6b4R/5XYfiK7lm2wr6EwCpn5O9JqHRQmroKdj
 +p8w==
X-Gm-Message-State: APjAAAWUdjaiLB8Yza/zkCCciDrGnoV3DxiXtf2UyjEIgOEn5sKPCrRR
 yTbAGGbKXdC0vPU1ROSCsJJxWSLuK6PKYFuhVW2k3Gip8Do=
X-Google-Smtp-Source: APXvYqz/6vAeTLoeFZrFaTEbX1ixHAAaxVkk8nIqrAeTCzEjhXGOibZyPAb7VyWJ3Gst5JL40IMhZ2i8AgdReEpGu+w=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr13212247otp.106.1559807392572; 
 Thu, 06 Jun 2019 00:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111330.25324-1-tzimmermann@suse.de>
 <20190605090308.efdkhxqnaydorubm@sirius.home.kraxel.org>
 <fe2df569-da1f-a54c-8a8e-e921a979278f@suse.de>
 <20190605155847.gabpvcoc6zf3twfv@sirius.home.kraxel.org>
 <3b574a1c-8dee-962f-e2ad-4959e75321d7@suse.de>
 <20190606074515.wlyzzlqdv7r2urum@sirius.home.kraxel.org>
In-Reply-To: <20190606074515.wlyzzlqdv7r2urum@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Jun 2019 09:49:41 +0200
Message-ID: <CAKMK7uFdge88oqrm0X5p1VmDKk3bbRs9O8ToOy3VwSFEp7LuNA@mail.gmail.com>
Subject: Re: [PATCH] drm: Ignore drm_gem_vram_mm_funcs in generated
 documentation
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fSEeIKVyMhLTgNDkAVC0UpcWgRhvLMSCMRp6xlSDUsw=;
 b=TSGmeMOw9v2hRtex3uux9Kuxyl5RHNDXbRTutG9PA/e03nDpum4Lsc3hZ9Sz2KJq65
 ypGSlsMl8aK8+R4Rvg2XkjFNQlpcQdY2Bvf5Tu1RgnqNjkfdSnhZQkX/Vo6SsHwYj5K7
 S0Sm/xfgm7p7/6boqBUpJ+M6psBQ6Dx/hRXcw=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA5OjQ1IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDA4OjM5OjEyQU0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4gSGkKPiA+Cj4gPiBBbSAwNS4wNi4xOSB1
bSAxNzo1OCBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4gPiA+IE9uIFdlZCwgSnVuIDA1LCAyMDE5
IGF0IDExOjU5OjA0QU0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4gPj4gSGkK
PiA+ID4+Cj4gPiA+PiBBbSAwNS4wNi4xOSB1bSAxMTowMyBzY2hyaWViIEdlcmQgSG9mZm1hbm46
Cj4gPiA+Pj4gT24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDE6MTM6MzBQTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6Cj4gPiA+Pj4+IFRoZSBkb2N1bWVudGF0aW9uIHRvb2xzIGludGVy
cHJldCBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MgYXMgZnVuY3Rpb24gYW5kCj4gPiA+Pj4+IHRoZXJl
IGFwcGVhcnMgdG8gYmUgbm8gd2F5IG9mIGlubGluZS1kb2N1bWVudGluZyBjb25zdGFudHMuCj4g
PiA+Pj4KPiA+ID4+Pj4gLS8qKgo+ID4gPj4+PiArLyoKPiA+ID4+Pj4gICAqIGRybV9nZW1fdnJh
bV9tbV9mdW5jcyAtIEZ1bmN0aW9ucyBmb3IgJnN0cnVjdCBkcm1fdnJhbV9tbQo+ID4gPj4+Cj4g
PiA+Pj4gInN0cnVjdCBkcm1fZ2VtX3ZyYW1fbW1fZnVuY3MiID8KPiA+ID4+Pgo+ID4gPj4+IChz
ZWUgaW5jbHVkZS9kcm0vZHJtX2dlbS5oIHdoZXJlIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5j
cyBpcwo+ID4gPj4+IGRvY3VtZW50ZWQgdGhhdCB3YXkpLgo+ID4gPj4KPiA+ID4+IFRoZSBkb2N1
bWVudGVkIHNvdXJjZSBsaW5lIGlzCj4gPiA+Pgo+ID4gPj4gICBjb25zdCBzdHJ1Y3QgZHJtX3Zy
YW1fbW1fZnVuY3MgZHJtX2dlbV92cmFtX21tX2Z1bmNzID0gewo+ID4gPj4KPiA+ID4+IGFuZCBJ
IHRyaWVkIHRvIGRvY3VtZW50IHRoZSBwdXJwb3NlIG9mIHRoZSBjb25zdGFudCAnZHJtX2dlbV92
cmFtX21tX2Z1bmNzJy4KPiA+ID4KPiA+ID4gQWguICBNaXNzZWQgdGhhdCBkZXRhaWwuCj4gPiA+
Cj4gPiA+PiBEb2N1bWVudGluZyBnbG9iYWwgY29uc3RhbnRzIGlzIG5vdCBkZXNjcmliZWQgaW4g
dGhlIGtlcm5lbCBndWlkZSBhbmQgSQo+ID4gPj4gY291bGQgbm90IGZpbmQgYSBzb3VyY2UtY29k
ZSBleGFtcGxlIGVpdGhlci4gRnVuY3Rpb24gYW5kIHN0cnVjdCBzdHlsZQo+ID4gPj4gd2l0aCAn
LScgZGlkbid0IHdvcms7IG1lbWJlci1maWVsZCBzdHlsZSB3aXRoICdAJyBuZWl0aGVyLiBUaGUg
b25seSB3YXkKPiA+ID4+IHNlZW1zIHRvIGJlIGFkZGluZyBpdCB0byBhbiAucnN0IGZpbGUgaW4g
RG9jdW1lbnRhdGlvbi4gQnV0IHRoZW4gaXQncwo+ID4gPj4gbm90IHBhcnQgb2YgdGhlIEFQSSBk
b2N1bWVudGF0aW9uLCBidXQgc29tZXdoZXJlIGluIHRoZSB0ZXh0Lgo+ID4gPgo+ID4gPiBPaywg
cGF0Y2ggaXMgZmluZSB0aGVuLgo+ID4gPgo+ID4gPiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gPgo+ID4gVGhhbmtzLgo+ID4KPiA+ID4gKGNhbiB5b3UgY29t
bWl0ICYgcHVzaCB5b3Vyc2VsZiBtZWFud2hpbGU/KQo+ID4KPiA+IE5vdCB5ZXQuIFRoZSByZXNw
ZWN0aXZlIGJ1ZyByZXBvcnQgaXMgc3RpbGwgb3Blbi4KPgo+IE9rLCBJJ2xsIHB1c2ggaXQgdGhl
bi4KCllvdSBzaG91bGQgaGF2ZSBjb21taXQgcmlnaHRzIGZvciBkcm0tbWlzYywgSSBqdXN0IGNo
ZWNrZWQuIEF0IGxlYXN0CnRoZXJlJ3MgYSB0emltbWVybWFubiBhY2NvdW50IGluIHRoZSBkcm0t
bWlzYyBncm91cC4KCmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVy
LXRvb2xzL2dldHRpbmctc3RhcnRlZC5odG1sCgouLi4gdG8gZ2V0IHlvdSBnb2luZy4gSWYgdGhp
bmdzIGRvbid0IHdvcmsgcGxzIHBpbmcgb24gI2RyaS1kZXZlbCBvbiBmcmVlbm9kZS4KLURhbmll
bAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
KzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
