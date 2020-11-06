Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F812A9DFA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215AE6E0DE;
	Fri,  6 Nov 2020 19:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5C6E0DE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:26:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y12so2466754wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oQqOi+A4tLPYWRL1oJ0iRRtcnq5xRUgXBaCx3oxm6Mc=;
 b=xfZsl5/dkWztOXLjW8Z1+VZJ10XJyXN1acAI6i1GV1PP4DtP+z0n39q2Gce/Jy6Sb3
 P6A5m+SX7xW7DxPo6yFSIy6BhqyDaf3qtGPqZxLo9Fo81KP2ZgSXFm93fox3FA3Duv6D
 BdeldgklgzhHhjdgDlhjorxFLqRo31JDhEr9hBkw1rKgTCH0Z3Z4n6gSGxvwGupzGMEb
 8/pa8dLZP0bxFrs6u6r2AXcNGnVtmCeSbQ5B5hQZMB7+Q9ItIkhyaalzVKc8rFr+2mJ8
 uxNDxpVx4uLgmjyzDg90XRByqSn2c/+0MRT8RkG+7AnsYILl7tfkGL4FpL99jCL0UByH
 qpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oQqOi+A4tLPYWRL1oJ0iRRtcnq5xRUgXBaCx3oxm6Mc=;
 b=jLEbiuhGTC44nOyd9RKXNsnKxQF3erzLk5DSZ6UO9wD/ORPpfruZvBY1Xfy83az9Qi
 OLBWusXUy86fBXRr2W+z6+4eV8mkcCvNdif8KF7MHQmUuI7NA5yRuJVzcYLe0JYJKM/o
 33yUIOMFvgGFilAhzWtyL4E+wRcoFH2EAHX8PrmUM8fPITLOQRHaezGtzWZT/HhbdFv5
 N5wGFOHfEfeurdsTF5U+M4gR2IwQ/XYJu9z3kKSWppkmUsOGRlI0/nIp0DDpX70+XYor
 Q/Z0z6ledtJWl226DGXZHs8QdtQzvBCvxwvOcIKW2xOsPkZKJ+Cl2+keXNMW6fokeOt1
 2CBw==
X-Gm-Message-State: AOAM530yDr3WE7iw5FI9E6psC7gxc7FCcBMMkHvvOViBcVl4dcRdjWrR
 HFnEg/tOL7H+fhsx+gNy1wjBeQ==
X-Google-Smtp-Source: ABdhPJwe9QX4YmziR+H+zBejdrT0V/r/zN9gfGoV6udLJS1x0zOF7QsEqCXySIOmnZgHt7Yg4+jtrw==
X-Received: by 2002:adf:e551:: with SMTP id z17mr4420567wrm.374.1604690758694; 
 Fri, 06 Nov 2020 11:25:58 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id g23sm3725133wmh.21.2020.11.06.11.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:25:58 -0800 (PST)
Date: Fri, 6 Nov 2020 19:25:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201106192556.GO2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <bf216efdf7eea393d6ce5244f7b7a8970c23c235.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf216efdf7eea393d6ce5244f7b7a8970c23c235.camel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBOb3YgMjAyMCwgTHl1ZGUgUGF1bCB3cm90ZToKCj4gT24gVGh1LCAyMDIwLTEx
LTA1IGF0IDE0OjQ1ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBUaGUgc3RhY2sgaXMgdG9v
IGZ1bGwuCj4gPiAKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJu
aW5nKHMpOgo+ID4gCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBf
bXN0X2hlbHBlci5jOiBJbiBmdW5jdGlvbgo+ID4g4oCYc2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVf
ZGVjb2Rl4oCZOgo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21z
dF9oZWxwZXIuYzoxNjE6MTogd2FybmluZzogdGhlIGZyYW1lCj4gPiBzaXplIG9mIDExNzYgYnl0
ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXItdGhhbj1dCj4gPiAK
PiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+Cj4gPiBDYzogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgo+ID4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+IMKgLi4uL2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jwqDCoMKgIHwgMjkgKysrKysrKysrKysrLS0tLS0t
LQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJt
X2RwX21zdF9oZWxwZXIuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJt
X2RwX21zdF9oZWxwZXIuYwo+ID4gaW5kZXggMWQ2OTZlYzAwMWNmZi4uMGE1Mzk0NTZmNjg2NCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0
X2hlbHBlci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2Rw
X21zdF9oZWxwZXIuYwo+ID4gQEAgLTEyMCw0NCArMTIwLDUxIEBAIHNpZGViYW5kX21zZ19yZXFf
ZXF1YWwoY29uc3Qgc3RydWN0Cj4gPiBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICppbiwK
PiA+IMKgc3RhdGljIGJvb2wKPiA+IMKgc2lkZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVjb2RlKHN0
cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3JlcV9ib2R5ICppbikKPiA+IMKgewo+ID4gLcKgwqDC
oMKgwqDCoMKgc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+
ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfcmVxX2JvZHkgKm91
dDsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IGRybV9lcnJfcHJp
bnRlcihQUkVGSVhfU1RSKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2RwX3NpZGVi
YW5kX21zZ190eCB0eG1zZzsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaSwgcmV0Owo+ID4gK8Kg
wqDCoMKgwqDCoMKgYm9vbCByZXN1bHQgPSB0cnVlOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
b3V0ID0ga3phbGxvYyhzaXplb2YoKm91dCksIEdGUF9LRVJORUwpOwo+ID4gCj4gCj4gWW91J3Jl
IG1pc3NpbmcgYSBOVUxMIGNoZWNrIGhlcmUKCllvdSdyZSByaWdodC4gIFNjaG9vbC1ib3kgZXJy
b3IhICBXaWxsIGZpeC4KCj4gPiDCoMKgwqDCoMKgwqDCoMKgZHJtX2RwX2VuY29kZV9zaWRlYmFu
ZF9yZXEoaW4sICZ0eG1zZyk7CgpXb3csIHdoYXQgYXJlIGFsbCB0aGVzZT8KCldoYXQgbWFpbGVy
IGFyZSB5b3UgdXNpbmc/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmlj
YWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
