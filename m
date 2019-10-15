Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF33D7AA5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4596E372;
	Tue, 15 Oct 2019 15:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BC86E372
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 15:57:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f20so18513123edv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=lpfuu1bso3RdWbgnsUhKkdmgpcxNkNOJYFs9HQ8avjk=;
 b=D7ETLnugQ+370S2oen9ewalVcgZRW+QUdhwudq0ENqFrRepWv5ymYpMe9PxeoSnwFM
 YsK5wdgiG7cXUpJhmg1Z+DFbo1gjT7UzyIijk/N1lKgtK7AaHvTw155z+69j0CUD7tPt
 4KNLhS2IWcNsbkEbAuTKnmAmdDfzPQxGnHKSNGrpeRgYqgqICmBSt+NlGIkOspvumYhf
 Oj48nOau5SOBGbFsItZMr/FZiWSP1TtDD5uR1LqOGGxMvqnHFgE3pTCluxT+/bYdZjU3
 xQg3iZzHqUTLs16CFmIAwVrjgZv+gKrljfynLfwpcR7iiMpsZq1eaOBTOHv/6llI/KLm
 OpFw==
X-Gm-Message-State: APjAAAVdKou0W9Y4MLVcgBPzY6WYaOkM4asUgtuTMLS4mV0NrNodciYP
 ahOk6+onAznMTJA27El2OAf9xQ==
X-Google-Smtp-Source: APXvYqwELlD66oQ5nMQcItrnfTUzUMveg2rBsdMF/y5OTCMKXnBsQ+LiuE1nhlHtTu5oWSz4XxqpiQ==
X-Received: by 2002:aa7:df95:: with SMTP id b21mr33549374edy.16.1571155043093; 
 Tue, 15 Oct 2019 08:57:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id fx25sm2801999ejb.19.2019.10.15.08.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 08:57:22 -0700 (PDT)
Date: Tue, 15 Oct 2019 17:57:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191015155720.GQ11828@phenom.ffwll.local>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
 <20191015143236.GA5363@smile.fi.intel.com>
 <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253aec49-e51c-b35b-4e7d-53a8a948655d@tronnes.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=lpfuu1bso3RdWbgnsUhKkdmgpcxNkNOJYFs9HQ8avjk=;
 b=ND20d96nLOBfZez2+9YBJrGkpL/gnCZmFfTTrryl5Iza8C3snQvtoJv3EBEHHq0TGf
 Q7pD+WUlY1H6mZpIYGAixWEvSB1+Didpgw/BBnm6RFXEW0B4Bw2j9aCnLOwnNF0nXiKB
 01NDGWTMAGrtRJ0sAUbpw6HqrewDlddnTl7sU=
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
Cc: sam@ravnborg.org, Andy Shevchenko <andriy.shevchenko@intel.com>,
 dri-devel@lists.freedesktop.org, david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDU6NDE6NTNQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IERlbiAxNS4xMC4yMDE5IDE2LjMyLCBza3JldiBBbmR5IFNoZXZjaGVua286Cj4g
PiBPbiBGcmksIEp1bCAxOSwgMjAxOSBhdCAwNTo1OToxMFBNICswMjAwLCBOb3JhbGYgVHLDuG5u
ZXMgd3JvdGU6Cj4gPj4gc3BpLWJjbTI4MzUgY2FuIGhhbmRsZSA+NjRrQiBidWZmZXJzIG5vdyBz
byB0aGVyZSBpcyBubyBuZWVkIHRvIGNoZWNrCj4gPj4gLT5tYXhfZG1hX2xlbi4gVGhlIHRpbnlk
cm1fc3BpX21heF90cmFuc2Zlcl9zaXplKCkgbWF4X2xlbiBhcmd1bWVudCBpcwo+ID4+IG5vdCB1
c2VkIGJ5IGFueSBjYWxsZXJzLCBzbyBub3QgbmVlZGVkLgo+ID4+Cj4gPj4gVGhlbiB3ZSBoYXZl
IHRoZSBzcGlfbWF4IG1vZHVsZSBwYXJhbWV0ZXIuIEl0IHdhcyBhZGRlZCBiZWNhdXNlCj4gPj4g
c3RhZ2luZy9mYnRmdCBoYXMgc3VwcG9ydCBmb3IgaXQgYW5kIHRoZXJlIHdhcyBhIHJlcG9ydCB0
aGF0IHNvbWVvbmUgdXNlZAo+ID4+IGl0IHRvIHNldCBhIHNtYWxsIGJ1ZmZlciBzaXplIHRvIGF2
b2lkIHBvcHBpbmcgb24gYSBVU0Igc291bmRjYXJkIG9uIGEKPiA+PiBSYXNwYmVycnkgUGkuIElu
IGhpbmRzaWdodCBpdCBzaG91bGRuJ3QgaGF2ZSBiZWVuIGFkZGVkLCBJIHNob3VsZCBoYXZlCj4g
Pj4gd2FpdGVkIGZvciBpdCB0byBiZWNvbWUgYSBwcm9ibGVtIGZpcnN0LiBJIGRvbid0IGtub3cg
aXQgYW55b25lIGlzCj4gPj4gYWN0dWFsbHkgdXNpbmcgaXQsIGJ1dCBzaW5jZSB0aW55ZHJtX3Nw
aV90cmFuc2ZlcigpIGlzIGJlaW5nIG1vdmVkIHRvCj4gPj4gbWlwaS1kYmksIEknbSB0YWtpbmcg
dGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSBpdC4gSSdsbCBhZGQgaXQgYmFjayB0bwo+ID4+IG1p
cGktZGJpIGlmIHNvbWVvbmUgY29tcGxhaW5zLgo+ID4+Cj4gPj4gV2l0aCB0aGF0IG91dCBvZiB0
aGUgd2F5LCBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSBjYW4gYmUgdXNlZCBpbnN0ZWFkLgo+ID4+
Cj4gPj4gVGhlIGNob3NlbiAxNmtCIGJ1ZmZlciBzaXplIGZvciBUeXBlIEMgT3B0aW9uIDEgKDkt
Yml0KSBpbnRlcmZhY2UgaXMKPiA+PiBzb21ld2hhdCBhcmJpdHJhcnksIGJ1dCBhIGJpZ2dlciBi
dWZmZXIgd2lsbCBoYXZlIGEgbWluaXNjdWxlIGltcGFjdCBvbgo+ID4+IHRyYW5zZmVyIHNwZWVk
LCBzbyBpdCdzIHByb2JhYmx5IGZpbmUuCj4gPiAKPiA+IFRoaXMgYnJlYWtzIHRoZSBTUEkgUFhB
Mnh4IGNhc2UgSSdtIHVzaW5nLiBUaGUgd29ybGQgaXMgbm90IGEgUGk6ZS4KPiA+IAo+ID4gWyAg
Mzg4LjQ0NTc1Ml0gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJh
bnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKPiA+IFsgIDM4OC42MzQ0Mzdd
IG1pMDI4M3F0IHNwaS1QUlAwMDAxOjAxOiBETUEgZGlzYWJsZWQgZm9yIHRyYW5zZmVyIGxlbmd0
aCAxNTM2MDAgZ3JlYXRlciB0aGFuIDY1NTM2Cj4gPiBbICAzODguODIyOTMzXSBtaTAyODNxdCBz
cGktUFJQMDAwMTowMTogRE1BIGRpc2FibGVkIGZvciB0cmFuc2ZlciBsZW5ndGggMTUzNjAwIGdy
ZWF0ZXIgdGhhbiA2NTUzNgo+ID4gCj4gPiBUaGUgY3J1Y2lhbCB0aGluZyBpcyB0byBjaGVjayB0
aGUgdHJhbnNmZXIgc2l6ZSBhZ2FpbnN0IG1heGltdW0gRE1BIGxlbmd0aAo+ID4gb2YgdGhlIG1h
c3Rlci4KPiA+IAo+IAo+IElzbid0IHRoaXMgYSBzcGkgY29udHJvbGxlciBkcml2ZXIgcHJvYmxl
bT8KPiBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSB0ZWxscyB0aGUgY2xpZW50IHdoYXQgdGhlIG1h
eGltdW0gdHJhbnNmZXIKPiBsZW5ndGggaXMuIFRoZSBjb250cm9sbGVyIGRyaXZlciBjYW4gdXNl
IGN0bHItPm1heF90cmFuc2Zlcl9zaXplIGlmIGl0Cj4gaGFzIHJlc3RyaWN0aW9ucy4KPiBBRkFJ
VUkgbWF4X2RtYV9sZW4gaXMgdXNlZCB3aGVuIHNwbGl0dGluZyB1cCB0aGUgYnVmZmVyIGZvciB0
aGUgc2cgdGFibGUKPiBpbiBzcGlfbWFwX2J1ZigpLgoKU29tZXRoaW5nIGxpa2UgdGhpcywgYXMg
YSB0ZXN0IHBhdGNoLgoKQ2hlZXJzLCBEYW5pZWwKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9z
cGktcHhhMnh4LmMgYi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKaW5kZXggYmI2YTE0ZDFhYjBm
Li5mNzcyMDE5MTUwMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1weGEyeHguYworKysg
Yi9kcml2ZXJzL3NwaS9zcGktcHhhMnh4LmMKQEAgLTE3MDcsNiArMTcwNyw3IEBAIHN0YXRpYyBp
bnQgcHhhMnh4X3NwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQl9IGVs
c2UgewogCQkJY29udHJvbGxlci0+Y2FuX2RtYSA9IHB4YTJ4eF9zcGlfY2FuX2RtYTsKIAkJCWNv
bnRyb2xsZXItPm1heF9kbWFfbGVuID0gTUFYX0RNQV9MRU47CisJCQljb250cm9sbGVyLT5tYXhf
dHJhbnNmZXJfc2l6ZSA9IE1BWF9ETUFfTEVOOwogCQl9CiAJfQogCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
