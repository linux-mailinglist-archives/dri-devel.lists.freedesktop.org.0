Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4A2AC115
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C4989A88;
	Mon,  9 Nov 2020 16:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80589A88
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:40:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so1544526wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 08:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vFzYMDoCTE/7BuMCxuGj//okAPwk1hzD+o6O8Pb/N54=;
 b=dd0LRhluqfhRIc5sOEgklGW7/QhdZrNm2GO5aSXtWNRBkuaWyLPKaVOW1cQduxqCOp
 mNMNnwHgXBnaesTROkdep44nv2PxqszfcCb+7JEjKWeXGPDsq/ZB0ZfJRRRdFeo+evIF
 aCGcLuZJm2bPqF70hviQm2EN0UAx0obDEFmy87NX8lWciOSQ8poliSMf1zxeyVbu2BXt
 XlZ/QBDF0O0njojWJjgWSMGzCOJI+MtVU/bcGrZ0e8Ykd+9oQs7/JuU187Dw9ku6Xk+I
 OKv3MpxHmXhjWLvGJ3gNqrtZ/KgzW3rGpF13J3zRN165/lQDETRVChL92a5TllgM3Hf4
 QRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vFzYMDoCTE/7BuMCxuGj//okAPwk1hzD+o6O8Pb/N54=;
 b=Xhafh8P4j8BGxx/sI24T+Ev6ZO8Nsj8OAoWNOvDLfo8LXaT1VKNIufz8LLLao5qLYR
 fRzpF+odJgscDdsr1Jm4bZA/uhUYbwFcH4IzVerNQ/KMAjuULIEeLakTrcXh74MXod9+
 YsWv03wNjFObUSynlSOqA58ZWRUoAQvJQqDIgsg7zdHLxO3TaNmv9wZ+8zijce/iBv9J
 irvSviHixY6uI9OXzMpJTTYHgF0Ipm1GOapxRdf11NVbiKw1+lYzUFQzwPbiwhzCrE58
 zV1xjfaRnD2RhuHE7GSZ9zFkl9ByIKtmcIhwWRkliro4fjAR1yEGeaKAcX/9bqpmSv4Q
 nq2w==
X-Gm-Message-State: AOAM530dg87ANoVzsUk5MvU1IgJJjIDL61SLx4rpFvfs6eeZyBqjTUvY
 E9VB7FbQlvjrISitMj4Y4GSyKA==
X-Google-Smtp-Source: ABdhPJzi2iHSBIfHhM1EAq/pMbkMQftrIzRJgLBNavLLlp93wooaq4GPyuJieZUH4V9f0WvGGG8wdA==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr18164369wrt.23.1604940008605; 
 Mon, 09 Nov 2020 08:40:08 -0800 (PST)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id n14sm14137815wrt.8.2020.11.09.08.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:40:08 -0800 (PST)
Date: Mon, 9 Nov 2020 16:40:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 14/19] gpu: drm: selftests: test-drm_dp_mst_helper: Place
 'struct drm_dp_sideband_msg_req_body' onto the heap
Message-ID: <20201109164004.GZ2063125@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-15-lee.jones@linaro.org>
 <20201109151937.GF6112@intel.com> <20201109161258.GX2063125@dell>
 <20201109162015.GH6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109162015.GH6112@intel.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgoKPiBPbiBNb24sIE5v
diAwOSwgMjAyMCBhdCAwNDoxMjo1OFBNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBN
b24sIDA5IE5vdiAyMDIwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiAKPiA+ID4gT24gVGh1
LCBOb3YgMDUsIDIwMjAgYXQgMDI6NDU6MTJQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4g
PiA+IFRoZSBzdGFjayBpcyB0b28gZnVsbC4KPiA+ID4gPiAKPiA+ID4gPiBGaXhlcyB0aGUgZm9s
bG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiA+ID4gPiAKPiA+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6IEluIGZ1bmN0
aW9uIOKAmHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZeKAmToKPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmM6MTYxOjE6IHdhcm5p
bmc6IHRoZSBmcmFtZSBzaXplIG9mIDExNzYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTAyNCBieXRl
cyBbLVdmcmFtZS1sYXJnZXItdGhhbj1dCj4gPiA+ID4gCj4gPiA+ID4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgo+ID4gPiA+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiA+
IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4gPiA+ID4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vZHJt
L3NlbGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMgICAgfCAyOSArKysrKysrKysrKyst
LS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Nl
bGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRl
c3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+ID4gPiA+IGluZGV4IDFkNjk2ZWMwMDFjZmYu
LjBhNTM5NDU2ZjY4NjQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+ID4gPiA+IEBAIC0xMjAsNDQg
KzEyMCw1MSBAQCBzaWRlYmFuZF9tc2dfcmVxX2VxdWFsKGNvbnN0IHN0cnVjdCBkcm1fZHBfc2lk
ZWJhbmRfbXNnX3JlcV9ib2R5ICppbiwKPiA+ID4gPiAgc3RhdGljIGJvb2wKPiA+ID4gPiAgc2lk
ZWJhbmRfbXNnX3JlcV9lbmNvZGVfZGVjb2RlKHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3Jl
cV9ib2R5ICppbikKPiA+ID4gPiAgewo+ID4gPiA+IC0Jc3RydWN0IGRybV9kcF9zaWRlYmFuZF9t
c2dfcmVxX2JvZHkgb3V0ID0gezB9Owo+ID4gPiA+ICsJc3RydWN0IGRybV9kcF9zaWRlYmFuZF9t
c2dfcmVxX2JvZHkgKm91dDsKPiA+ID4gCj4gPiA+IEhvdyBiaWcgaXMgaXQ/IEFuZCB3aHkgaXMg
aXQgdGhhdCBiaWc/Cj4gPiAKPiA+IEl0J3MgYSBzdHJ1Y3Qgb2YgYSB1bmlvbiBvZiBzdHJ1Y3Rz
Lgo+ID4gCj4gPiBBbmQgaXQncyBhbGwgYWxsb2NhdGVkIG9uIHRoZSBzdGFjay4gIEJhZCBuZXdz
IQo+IAo+IFRoYXQgZG9lc24ndCBhbnN3ZXIgbXkgcXVlc3Rpb25zLgoKSXQgYW5zd2VycyB0aGUg
c2Vjb25kIHF1ZXN0aW9uLgoKVGhlIGFuc3dlciB0byB0aGUgZmlyc3QgcXVlc3Rpb24geW91IGNh
biBgZ3JlcGAgZm9yIHlvdXJzZWxmLiA7KQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
