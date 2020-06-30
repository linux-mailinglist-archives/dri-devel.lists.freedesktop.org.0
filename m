Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BF20F133
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 11:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328D289DC2;
	Tue, 30 Jun 2020 09:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EE189DC2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 09:09:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o2so18842143wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v1q4QGXjMWZSBDrrcU4H5+qS7hC0O+sT9hyxnsYCcqE=;
 b=W4Z47FuaGv4onoJ956YWoCbld2K8uLJoAdXFtJUqNigpqzWR5e31o4wolvqY33vTyr
 dlLTVPKJo0VQP26UYJHw/Zwu2XMKywG5HTnXih9WQjpyzBff0POBSrbOTGsSr+zK+mzR
 uB72DqCvjrPkVp/j8yRs/8+hpbhc7bzH/JMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v1q4QGXjMWZSBDrrcU4H5+qS7hC0O+sT9hyxnsYCcqE=;
 b=Nw3XiXUkbyTsxWkn8Wy/EuwSxGnSd/11GJ6NDMnaw8fLtv9o9F75B+Be0uRiOcdpGa
 X1Cou9G18TDMDhRk4S5ZjEmlwhd51f9BZrNJ5yRbYHSuLUUlVVLmYALbAl4FrRv6l9JL
 xQPZ0Xnb2E1kyK1zMTBvY6qnnxMW0ZfMYdGWB9c2gcOA6qmQwaPtNfmQfhuMBc8Q23zr
 3X8UOZy6WcCooQn2Oc7No1JOaG8eRF6dxPslleeWuqzsEc9wVyIBM7FnRH3uEQbP9Cnh
 QNJE2dUgbxrMslbMAsFO1dsI2PkVFtXHleQGxXPRTqcvzHAMrRGc1N0/xp76egCwjRkD
 Vyng==
X-Gm-Message-State: AOAM532oFjxlvl9/S45gZ36iwm78SY+t28PKtZeQvUXKnkMqmDB2WYph
 yHZAf/To3+6GsCS4GR24/fZJWA==
X-Google-Smtp-Source: ABdhPJz01ctYAQj52pCdpr7xZk/xPr+GlIMvpe/7+P5dm7xJPg++jrM25CX+IV6hRjPxU/B7ZotATw==
X-Received: by 2002:a1c:7f87:: with SMTP id a129mr21439003wmd.10.1593508152984; 
 Tue, 30 Jun 2020 02:09:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm3298455wro.90.2020.06.30.02.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 02:09:12 -0700 (PDT)
Date: Tue, 30 Jun 2020 11:09:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200630090910.GS3278063@phenom.ffwll.local>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo>
 <20200626133837.GE3278063@phenom.ffwll.local>
 <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMDQ6NTk6NDVQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI2LjA2LjIwMjAgMTY6MzgsIERhbmllbCBWZXR0ZXIg0L/QuNGI0LXRgjoKPiA+
IE9uIEZyaSwgSnVuIDI2LCAyMDIwIGF0IDAxOjQwOjQwUE0gKzAyMDAsIFRoaWVycnkgUmVkaW5n
IHdyb3RlOgo+ID4+IE9uIEZyaSwgSnVuIDI2LCAyMDIwIGF0IDAxOjA2OjU4UE0gKzAyMDAsIEth
cm9sIEhlcmJzdCB3cm90ZToKPiA+Pj4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMzowMyBQTSBN
aWtrbyBQZXJ0dHVuZW4gPGN5bmRpc0BrYXBzaS5maT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gIyBI
b3N0MXgvVGVncmFEUk0gVUFQSSBwcm9wb3NhbAo+ID4+Pj4KPiA+Pj4+IFRoaXMgaXMgYSBwcm9w
b3NhbCBmb3IgYSBzdGFibGUgVUFQSSBmb3IgSG9zdDF4IGFuZCBUZWdyYURSTSwgdG8gcmVwbGFj
ZQo+ID4+Pj4gdGhlIGN1cnJlbnQgVGVncmFEUk0gVUFQSSB0aGF0IGlzIGJlaGluZCBgU1RBR0lO
R2AgYW5kIHF1aXRlIG9ic29sZXRlIGluCj4gPj4+PiBtYW55IHdheXMuCj4gPj4+Pgo+ID4+Pj4g
SSBoYXZlbid0IHdyaXR0ZW4gYW55IGltcGxlbWVudGF0aW9uIHlldCAtLSBJJ2xsIGRvIHRoYXQg
b25jZSB0aGVyZSBpcwo+ID4+Pj4gc29tZSBhZ3JlZW1lbnQgb24gdGhlIGhpZ2gtbGV2ZWwgZGVz
aWduLgo+ID4+Pj4KPiA+Pj4+IEN1cnJlbnQgb3BlbiBpdGVtczoKPiA+Pj4+Cj4gPj4+PiAqIFRo
ZSBzeW5jcG9pbnQgVUFQSSBhbGxvd3MgdXNlcnNwYWNlIHRvIGNyZWF0ZSBzeW5jX2ZpbGUgRkRz
IHdpdGgKPiA+Pj4+IGFyYml0cmFyeSBzeW5jcG9pbnQgZmVuY2VzLiBkbWFfZmVuY2UgY29kZSBj
dXJyZW50bHkgc2VlbXMgdG8gYXNzdW1lIGFsbAo+ID4+Pj4gZmVuY2VzIHdpbGwgYmUgc2lnbmFs
ZWQsIHdoaWNoIHdvdWxkIG5vdCBuZWNlc3NhcmlseSBiZSB0aGUgY2FzZSB3aXRoCj4gPj4+PiB0
aGlzIGludGVyZmFjZS4KPiA+Pj4+ICogUHJldmlvdXNseSBwcmVzZW50IEdFTSBJT0NUTHMgKEdF
TV9DUkVBVEUsIEdFTV9NTUFQKSBhcmUgbm90IHByZXNlbnQuCj4gPj4+PiBOb3Qgc3VyZSBpZiB0
aGV5IGFyZSBzdGlsbCBuZWVkZWQuCj4gPj4+Pgo+ID4+Pgo+ID4+PiBIaSwgYXMgdGhpcyB3YXNu
J3QgYWRkcmVzc2VkIGhlcmUgKGFuZCBzb3JyeSBpZiBJIG1pc3NlZCBpdCk6IGlzIHRoZXJlCj4g
Pj4+IGFuIG9wZW4gc291cmNlIHVzZXJzcGFjZSBtYWtpbmcgdXNlIG9mIHRoaXMgVUFQST8gQmVj
YXVzZSB0aGlzIGlzCj4gPj4+IHNvbWV0aGluZyB3aGljaCBuZWVkcyB0byBiZSBzZWVuIGJlZm9y
ZSBpdCBjYW4gYmUgaW5jbHVkZWQgYXQgYWxsLgo+ID4+Cj4gPj4gVGhlcmUncyBhIHNldCBvZiBj
b21taXRzIHRoYXQgaW1wbGVtZW50IGFuIGVhcmxpZXIgZHJhZnQgaGVyZToKPiA+Pgo+ID4+ICAg
ICBodHRwczovL2dpdGh1Yi5jb20vdGhpZXJyeXJlZGluZy9saW51eC90cmVlL2Zvci01LjYvZHJt
LXRlZ3JhLWRlc3RhZ2UtYWJpCj4gPj4KPiA+PiBhbmQgY29ycmVzcG9uZGluZyBjaGFuZ2VzIHRv
IGxpYmRybSB0byBtYWtlIHVzZSBvZiB0aGF0IGFuZCBpbXBsZW1lbnQKPiA+PiB0ZXN0cyB1c2lu
ZyB0aGUgdmFyaW91cyBnZW5lcmF0aW9ucyBvZiBWSUMgaGVyZToKPiA+Pgo+ID4+ICAgICBodHRw
czovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL350YWdyL2RybS9sb2cvCj4gPj4KPiA+PiBCZWZvcmUg
YWN0dWFsbHkganVtcGluZyB0byBhbiBpbXBsZW1lbnRhdGlvbiB3ZSB3YW50ZWQgdG8gZ28gb3Zl
ciB0aGUKPiA+PiBkZXNpZ24gYSBiaXQgbW9yZSB0byBhdm9pZCB3YXN0aW5nIGEgbG90IG9mIHdv
cmssIGxpa2Ugd2UndmUgZG9uZSBpbgo+ID4+IHRoZSBwYXN0LiBUdXJucyBvdXQgaXQgaXNuJ3Qg
ZWFzeSB0byBnZXQgZXZlcnlvbmUgdG8gYWdyZWUgb24gYSBnb29kCj4gPj4gQUJJLiBXaG8gd291
bGQndmUgdGhvdWdodD8gPSkKPiA+Pgo+ID4+IEkgZXhwZWN0IHRoYXQgb25jZSB0aGUgZGlzY3Vz
c2lvbiBhcm91bmQgdGhlIEFCSSBzZXR0bGVzIE1pa2tvIHdpbGwKPiA+PiBzdGFydCBvbiBpbXBs
ZW1lbnRpbmcgdGhpcyBBQkkgaW4gdGhlIGtlcm5lbCBhbmQgd2UnbGwgdXBkYXRlIHRoZQo+ID4+
IGxpYmRybSBwYXRjaGVzIHRvIG1ha2UgdXNlIG9mIHRoZSBuZXcgQUJJIGFzIHdlbGwuCj4gPiAK
PiA+IERvIHdlIGhhdmUgbW9yZSB0aGFuIGxpYmRybSBhbmQgdGVzdHMgZm9yIHRoaXMsIGxpa2Ug
c29tZXRoaW5nIHNvbWV3aGF0Cj4gPiBmdW5jdGlvbmFsPyBTaW5jZSB0ZWdyYWRybSBsYW5kZWQg
eWVhcnMgYWdvIHdlJ3ZlIHJlZmluZWQgdGhlIGNyaXRlcmlhIGEKPiA+IGJpdCBpbiB0aGlzIHJl
Z2FyZCwgbGF0ZXN0IHZlcnNpb24gaXMgZXhwbGljaXQgaW4gdGhhdCBpdCBuZWVkcyB0byBiZQo+
ID4gc29tZXRoaW5nIHRoYXQncyBmdW5jdGlvbmFsIChmb3IgZW5kLXVzZXJzIGluIHNvbWUgZm9y
bSksIG5vdCBqdXN0Cj4gPiBpbmZyYXN0cnVjdHVyZSBhbmQgdGVzdHMuCj4gCj4gV2UgaGF2ZSBP
cGVudGVncmEgWzFdIGFuZCBWRFBBVSBbMl0gdXNlcnNwYWNlIGRyaXZlcnMgZm9yIG9sZGVyIFRl
Z3JhCj4gU29DcyB0aGF0IGhhdmUgYmVlbiB1c2luZyB0aGUgc3RhZ2luZyBVQVBJIGZvciB5ZWFy
cyBub3cuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIveGY4Ni12aWRl
by1vcGVudGVncmEKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2dyYXRlLWRyaXZlci9saWJ2ZHBh
dS10ZWdyYQo+IAo+IFRoZSBVQVBJIGFuZCB0aGUga2VybmVsIGRyaXZlciB1cGRhdGVzIGFyZSB2
ZXJ5IG5lZWRlZCBmb3IgdGhlc2UgZHJpdmVycwo+IGJlY2F1c2Ugb2YgdGhlIG1pc3NpbmcgVUFQ
SSBzeW5jaHJvbml6YXRpb24gZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlCj4gcHJvYmxlbXMgb2Yg
dGhlIGtlcm5lbCBkcml2ZXIuCj4gCj4gU28gd2UgYWxyZWFkeSBoYXZlIHNvbWUgcmVhbC13b3Js
ZCB1c2Vyc3BhY2UgZm9yIHRoZSB0ZXN0aW5nIQoKQXdlc29tZSEgTWF5YmUgZm9yIGZ1dHVyZSBy
b3VuZHMgaW5jbHVkZSB0aGUgbGlua3MgZm9yIHRoZSB2ZHBhdSBkcml2ZXIuIEkKZGlkbid0IGtu
b3cgYWJvdXQgdGhhdCBvbmUgYXQgYWxsLiAtb3BlbnRlZ3JhIGlzIHByb2JhYmx5IG5vdCBzbyBy
ZWxldmFudAphbnltb3JlIChhbmQgSSBmbGF0IG91dCBmb3Jnb3QgaXQgZXhpc3RzKSAuLi4gSW5j
bHVkaW5nIHRoZSB1c2Vyc3BhY2Ugc2lkZQpsaW5rcyBpcyBnb29kIHNvIHRoYXQgZm9yZ2V0ZnVs
IHBlb3BsZSBsaWtlIG1lIGRvbid0IG5hZyA6LSkKLURhbmllbAoKCj4gSXQncyBub3QgdGhlIGZp
cnN0IGFuZCBub3QgdGhlIHNlY29uZCB0aW1lIHdlJ3JlIGRpc2N1c3NpbmcgdGhlIFRlZ3JhCj4g
RFJNIFVBUEkgY2hhbmdlcywgYnV0IHRoaXMgdGltZSBpdCBmZWVscyBsaWtlIHRoZXJlIGlzIGEg
Z29vZCBjaGFuY2UKPiB0aGF0IGl0IHdpbGwgZmluYWxseSBtYXRlcmlhbGl6ZSBhbmQgSSdtIHZl
cnkgaGFwcHkgYWJvdXQgaXQgOikKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
