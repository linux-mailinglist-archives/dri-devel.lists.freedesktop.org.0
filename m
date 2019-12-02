Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927D10E71E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 09:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BBF89B9F;
	Mon,  2 Dec 2019 08:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCF89B97
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 08:55:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f4so5349536wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 00:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c8TtAQLPKuN1WcQJrqPrwS1JTgSMHdpZhxAvN9ThAMU=;
 b=T3blSizNTK2Aft60teR+wyX8uoF8nLhvvSwjTudA5NPnb8cAcvxG5oZyYHEFyx1D/S
 gslRQ8/HeSOgZ5DMD44Ec1if/OIJZiJH1VaN0HDwnPeVJmHDqkD7rr3YZg6I2BXAPgB3
 ag0W7Ql5vc6FL4oSh3cYaTn+4Q0eTeZSSVfyJkwDBBLIv/UXxK7na3HBEo8yK/rvlH0f
 CjiNQfTdNdntdy9saE+JJzbBov+YnYYeUyC2DihrBtv58wL4x8sVyzz9nX9bsNS3iPBz
 aqGAQDlslJj478R5yqEHmFMZsEOc6oM1hiM458Sjh64gNzt95hHPAfFlHAaJd6ethQi6
 c0YQ==
X-Gm-Message-State: APjAAAWwgVkLyGK8CK84x9lRCKTuEXJ9p9qLz9v51AwQBOqPXYi1jGUE
 dtzjGNZDmYIKuMbmt1J2BkHOkw==
X-Google-Smtp-Source: APXvYqxmtdTk6LMaQnkuKbMTq39fhimr3bvLAUgIcn0/zSZMPoPCAxRyLnZB0ESW7ei0+XMZBXb1Og==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr25895748wme.73.1575276934927; 
 Mon, 02 Dec 2019 00:55:34 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r15sm40418208wrc.5.2019.12.02.00.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 00:55:34 -0800 (PST)
Date: Mon, 2 Dec 2019 09:55:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 7/8] drm/panfrost: Add the panfrost_gem_mapping concept
Message-ID: <20191202085532.GY624164@phenom.ffwll.local>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
 <20191129135908.2439529-8-boris.brezillon@collabora.com>
 <20191129201459.GS624164@phenom.ffwll.local>
 <20191129223629.3aaab761@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129223629.3aaab761@collabora.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c8TtAQLPKuN1WcQJrqPrwS1JTgSMHdpZhxAvN9ThAMU=;
 b=I9UNuYxrlcBjCIkvdieElnyRrwi05HIV3hy43x8E8cIPtA2yT6HG1AIYQ21EEnKHTx
 GZRI1HgkGeaQQ68MluzkqfSRGBGsXTrnwJi4BnK+0IjGG7cHViRO1Np+qydWJRv14QnV
 bDV9wxUnHkaB8XIPjQCHaIoxEK6lanq3tkROo=
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MzY6MjlQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIEZyaSwgMjkgTm92IDIwMTkgMjE6MTQ6NTkgKzAxMDAKPiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gT24gRnJpLCBOb3YgMjksIDIwMTkg
YXQgMDI6NTk6MDdQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+ID4gPiBXaXRoIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgcGVyLUZEIGFkZHJlc3Mgc3BhY2UsIHRoZSBzYW1lIEJPIGNhbiBi
ZSBtYXBwZWQKPiA+ID4gaW4gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2UgaWYgdGhlIEJPIGlzIGds
b2JhbGx5IHZpc2libGUgKEdFTV9GTElOSykgIAo+ID4gCj4gPiBBbHNvIGRtYS1idWYgc2VsZi1p
bXBvcnRzIGZvciB3YXlsYW5kL2RyaTMgLi4uCj4gCj4gSW5kZWVkLCBJJ2xsIGV4dGVuZCB0aGUg
Y29tbWl0IG1lc3NhZ2UgdG8gbWVudGlvbiB0aGF0IGNhc2UuCj4gCj4gPiAKPiA+ID4gYW5kIG9w
ZW5lZCBpbiBkaWZmZXJlbnQgY29udGV4dC4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9l
cyBub3QKPiA+ID4gdGFrZSBjYXNlIGludG8gYWNjb3VudCwgYW5kIGF0dGFjaGVzIHRoZSBtYXBw
aW5nIGRpcmVjdGx5IHRvIHRoZQo+ID4gPiBwYW5mcm9zdF9nZW1fb2JqZWN0Lgo+ID4gPiAKPiA+
ID4gTGV0J3MgY3JlYXRlIGEgcGFuZnJvc3RfZ2VtX21hcHBpbmcgc3RydWN0IGFuZCBhbGxvdyBt
dWx0aXBsZSBtYXBwaW5ncwo+ID4gPiBwZXIgQk8uCj4gPiA+IAo+ID4gPiBUaGUgbWFwcGluZ3Mg
YXJlIHJlZmNvdW50ZWQsIHdoaWNoIGhlbHBzIHNvbHZlIGFub3RoZXIgcHJvYmxlbSB3aGVyZQo+
ID4gPiBtYXBwaW5ncyB3ZXJlIHRlYXJlZCBkb3duIChHRU0gaGFuZGxlIGNsb3NlZCBieSB1c2Vy
c3BhY2UpIHdoaWxlIEdQVQo+ID4gPiBqb2JzIGFjY2Vzc2luZyB0aG9zZSBCT3Mgd2VyZSBzdGls
bCBpbi1mbGlnaHQuIEpvYnMgbm93IGtlZXAgYQo+ID4gPiByZWZlcmVuY2Ugb24gdGhlIG1hcHBp
bmdzIHRoZXkgdXNlLiAgCj4gPiAKPiA+IHVoIHdoYXQuCj4gPiAKPiA+IHRiaCB0aGlzIHNvdW5k
cyBiYWQgZW5vdWdoIChhcyBpbiBob3cgZGlkIGEgZGVza3RvcCBvbiBwYW5mcm9zdCBldmVyIHdv
cmspCj4gCj4gV2VsbCwgd2UgZGlkbid0IGRpc2NvdmVyIHRoaXMgcHJvYmxlbSB1bnRpbCByZWNl
bnRseSBiZWNhdXNlOgo+IAo+IDEvIFdlIGhhdmUgYSBCTyBjYWNoZSBpbiBtZXNhLCBhbmQgdW50
aWwgcmVjZW50bHksIHRoaXMgY2FjaGUgY291bGQKPiBvbmx5IGdyb3cgKG5vIGVudHJ5IGV2aWN0
aW9uIGFuZCBubyBNQURWSVNFIHN1cHBvcnQpLCBtZWFuaW5nIHRoYXQgQk9zCj4gd2VyZSBzdGF5
aW5nIGFyb3VuZCBmb3JldmVyIHVudGlsIHRoZSBhcHAgd2FzIGtpbGxlZC4KClVoLCBzbyB3aGVy
ZSB3YXMgdGhlIHVzZXJzcGFjZSB3aGVuIHdlIG1lcmdlZCB0aGlzPwoKPiAyLyBNYXBwaW5ncyB3
ZXJlIHRlYXJlZCBkb3duIGF0IEJPIGRlc3RydWN0aW9uIHRpbWUgYmVmb3JlIGNvbW1pdAo+IGE1
ZWZiNGM5YTU2MiAoImRybS9wYW5mcm9zdDogUmVzdHJ1Y3R1cmUgdGhlIEdFTSBvYmplY3QgY3Jl
YXRpb24iKSwgYW5kCj4gam9icyBhcmUgcmV0YWluaW5nIHJlZmVyZW5jZXMgdG8gYWxsIHRoZSBC
TyB0aGV5IGFjY2Vzcy4KPiAKPiAzLyBUaGUgbWVzYSBkcml2ZXIgd2FzIHNlcmlhbGl6aW5nIEdQ
VSBqb2JzLCBhbmQgb25seSByZWxlYXNpbmcgdGhlIEJPCj4gcmVmZXJlbmNlIHdoZW4gdGhlIGpv
YiB3YXMgZG9uZSAod2FpdCBvbiB0aGUgY29tcGxldGlvbiBmZW5jZSkuIFRoaXMKPiBoYXMgcmVj
ZW50bHkgYmVlbiBjaGFuZ2VkLCBhbmQgbm93IEJPcyBhcmUgcmV0dXJuZWQgdG8gdGhlIGNhY2hl
IGFzCj4gc29vbiBhcyB0aGUgam9iIGhhcyBiZWVuIHN1Ym1pdHRlZCB0byB0aGUga2VybmVsLiBX
aGVuIHRoYXQKPiBoYXBwZW5zLHRob3NlIEJPcyBhcmUgbWFya2VkIHB1cmdlYWJsZSB3aGljaCBt
ZWFucyB0aGUga2VybmVsIGNhbgo+IHJlY2xhaW0gdGhlbSB3aGVuIGl0J3MgdW5kZXIgbWVtb3J5
IHByZXNzdXJlLgo+IAo+IFNvIHllcywga2VybmVsIDUuNCB3aXRoIGEgcmVjZW50IG1lc2EgdmVy
c2lvbiBpcyBjdXJyZW50bHkgc3ViamVjdCB0bwo+IEdQVSBwYWdlLWZhdWx0IHN0b3JtcyB3aGVu
IHRoZSBzeXN0ZW0gc3RhcnRzIHJlY2xhaW1pbmcgbWVtb3J5Lgo+IAo+ID4gdGhhdCBJIHRoaW5r
IHlvdSByZWFsbHkgd2FudCBhIGZldyBpZ3RzIHRvIHRlc3QgdGhpcyBzdHVmZi4KPiAKPiBJJ2xs
IHNlZSB3aGF0IEkgY2FuIGNvbWUgdXAgd2l0aCAobm90IHN1cmUgaG93IHRvIGVhc2lseSBkZXRl
Y3QKPiBwYWdlZmF1bHRzIGZyb20gdXNlcnNwYWNlKS4KClRoZSBkdW1iIGFwcHJvYWNoIHdlIGRv
IGlzIGp1c3QgdGhyYXNoIG1lbW9yeSBhbmQgY2hlY2sgbm90aGluZyBoYXMgYmxvd24KdXAgKHdo
aWNoIHRoZSBydW5uZXIgZG9lcyBieSBsb29raW5nIGF0IHRoZSBkbWVzZyBhbmQgYSBmZXcgcHJv
YyBmaWxlcykuCklmIHlvdSBydW4gdGhhdCBvbiBhIGtlcm5lbCB3aXRoIGFsbCBkZWJ1Z2dpbmcg
ZW5hYmxlZCwgaXQncyBwcmV0dHkgZ29vZAphdCBjYXRjaGluZyBpc3N1ZXMuCgpGb3IgYWRkZWQg
bmFzdGluZXNzIGxvdHMgb2YgaW50ZXJydXB0cyB0byBjaGVjayBlcnJvciBwYXRocy9zeXNjYWxs
CnJlc3RhcnRpbmcsIGFuZCBhdCB0aGUgZW5kIG9mIHRoZSB0ZXN0Y2FzZSwgc29tZSBzYW5pdHkg
Y2hlY2sgdGhhdCBhbGwgdGhlCmJvIHN0aWxsIGNvbnRhaW4gd2hhdCB5b3UgdGhpbmsgdGhleSBz
aG91bGQgY29udGFpbi4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
