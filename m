Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED52B7EAE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 14:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAB16E33F;
	Wed, 18 Nov 2020 13:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4EF6E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:55:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so2813845wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EOtSSeuOY9/kfAxGh8gbplfY1RBV3U9K8nR4s4raEd0=;
 b=Ae/vBe3EfmqC/FMwuAFEnvJHhBW5/Nv6iJTKL+D1z2GQSPCnOGY4JWL/SgbJFy0Wqw
 7dS78uzPZE2ceuCuH7kH9HHgoAbCUvRZFHZRf7sIXRDU+ENN7+Aivnw1V7SlgkfUTmFb
 +3PojYAiA+eYg+1YiV/wppO1BO2MQwCX+OstLebCM8jc9z5CgNb6vOQs7ur91zXL7ziq
 MFsJdIgcey2dAHig5kAGCFIIGCgKXaqYgyOvsxBZCpo/V0ONrrW3VQ0FIpb2YKJcefWC
 KjosxfFuga27Wrwfr4D2/xjEIHLwlipJ7BXn0aMiJEcczDVDl9bNfuqk+2QxAbr/qdnZ
 SAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EOtSSeuOY9/kfAxGh8gbplfY1RBV3U9K8nR4s4raEd0=;
 b=j6oL9W7X2vGY2ehP1r6J1WbhQ4UgUm67rXdiX+eDYw2nPA35F8W/OL6PQo0BlwWKYa
 FOnV/lpVTR6XzSBoZxLY10YMC46h3SHtwKAabhVq8euJrReAqqLr+EGZuAAuUSl8ACQS
 RO3ckPGSv/P5OKRLq+NEIWDmznnbjX/HOW9/P0O9bS/V2ZxEghZ946yYHLpiuq4AWqnM
 V6uKMi9fWOy/LkewWIe/qDL+Ly2cqgAVZKk48ZHCvIKkoSp+IUdvG6xFvyTpt2WNDN/1
 u2g+lsdtFskU2cM4VLjaMd7AFinyU3wgWdq8WV5C++soBSYx+sQRbeG6jVUM6nYSBmUu
 2WwQ==
X-Gm-Message-State: AOAM532YjMtHQI9kD10ECLfxq3dBjJXzfDdDm5XklXZQjvqinJw3Pya7
 UiNfpXj+5C09IeSdWf3h5hiF3eT4ASO1v8nm
X-Google-Smtp-Source: ABdhPJxjNhfbB51gdYoYsjFrofkZy+/pHb/HBijfCMmZzKYOQNukaKmsKTQSN0bFYJEF2v+74w50Nw==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr162567wmg.116.1605707727689; 
 Wed, 18 Nov 2020 05:55:27 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id y16sm31976731wrt.25.2020.11.18.05.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 05:55:27 -0800 (PST)
Date: Wed, 18 Nov 2020 13:55:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/selftests/test-drm_dp_mst_helper: fix memory
 leak allocated to 'out'
Message-ID: <20201118135525.GT1869941@dell>
References: <20201118134901.461841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118134901.461841-1-colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBOb3YgMjAyMCwgQ29saW4gS2luZyB3cm90ZToKCj4gRnJvbTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBDdXJyZW50bHkgd2hlbiB0eG1z
ZyBmYWlscyB0byBhbGxvY2F0ZSB0aGVuIHRoZXJlIGlzIGEgbGVhayBvbiAnb3V0Jy4gRml4Cj4g
dGhpcyBieSBzZXR0aW5nIHJlc3VsdCB0byBmYWxzZSBhbmQgZXhpdGluZyB2aWEgdGhlIGNsZWFu
IHVwIGV4aXQgcGF0aC4KPiBOb3RlIHNpbmNlIHR4bXNnIGlzIE5VTEwgYXQgdGhpcyBwb2ludCwg
dGhlIGtmcmVlIG9mIHR4bXNnIGlzIGEgbm8tb3AuCj4gCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAo
IlJlc291cmNlIGxlYWsiKQo+IEZpeGVzOiAwOTIzNGI4OGVmNTUgKCJkcm0vc2VsZnRlc3RzL3Rl
c3QtZHJtX2RwX21zdF9oZWxwZXI6IE1vdmUgJ3NpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29k
ZScgb250byB0aGUgaGVhcCIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGlu
LmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90
ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKVGhpcyBpcyBmaXhlZCBpbiBteSBsb2NhbCBi
cmFuY2guCgpMb29rcyBsaWtlIHRoZSB3cm9uZyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3YXMgc2Vu
dC9hcHBsaWVkLgoKRWl0aGVyIHdheSwgdGhhbmtzIGZvciB0aGUgZml4IENvbGluLgoKUmV2aWV3
ZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fZHBfbXN0X2hlbHBlci5jCj4gaW5kZXggNmI0
NzU5ZWQ2YmZkLi5kYmFjMDczZWQzODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Nl
bGZ0ZXN0cy90ZXN0LWRybV9kcF9tc3RfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2VsZnRlc3RzL3Rlc3QtZHJtX2RwX21zdF9oZWxwZXIuYwo+IEBAIC0xMzEsOCArMTMxLDEwIEBA
IHNpZGViYW5kX21zZ19yZXFfZW5jb2RlX2RlY29kZShzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21z
Z19yZXFfYm9keSAqaW4pCj4gIAkJcmV0dXJuIGZhbHNlOwo+ICAKPiAgCXR4bXNnID0ga3phbGxv
YyhzaXplb2YoKnR4bXNnKSwgR0ZQX0tFUk5FTCk7Cj4gLQlpZiAoIXR4bXNnKQo+IC0JCXJldHVy
biBmYWxzZTsKPiArCWlmICghdHhtc2cpIHsKPiArCQlyZXN1bHQgPSBmYWxzZTsKPiArCQlnb3Rv
IG91dDsKPiArCX0KPiAgCj4gIAlkcm1fZHBfZW5jb2RlX3NpZGViYW5kX3JlcShpbiwgdHhtc2cp
Owo+ICAJcmV0ID0gZHJtX2RwX2RlY29kZV9zaWRlYmFuZF9yZXEodHhtc2csIG91dCk7CgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBT
ZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
