Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5243514FD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 15:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9F6E05A;
	Thu,  1 Apr 2021 13:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873A36E05A;
 Thu,  1 Apr 2021 13:09:48 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id bx7so1868199edb.12;
 Thu, 01 Apr 2021 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=xO3dsxvfU/Plyunxb3D77pfF4fNlDgU8wQSxluJppcw=;
 b=Y72TPEyaa2Dq8XsQe6wwqyQwsKeGSuH1bHQskv5exkjmQvxEsxknYlNi6g0ELnbe4T
 8mc7TP7rOJD+i/de5dN9BqrxlOsrdAffXSUdFx1K/6dy/n+0rTMYqn9HeGpJc/29nZMi
 RSmcrnPUKV5El44SbvKDQo8Aa6KHvSb2Ud5T2uoIxtsJr+Daw20dff7HXzROGvn+apmg
 ytrvq+gn8S3IDagWFqRbPybI+PPrSrYtQLZvyZDgy4ub4UnFsyNRypRmH5PmSOlmkams
 Xo/RP3XNyv4jffx5rMZYFQubihVg3QpKVzlZFT1/XA+msTjBYFef1TlZyMxgoG6Nh/qD
 eAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xO3dsxvfU/Plyunxb3D77pfF4fNlDgU8wQSxluJppcw=;
 b=tgQXN2wk2EUQPNdPR9lPJMTuP1/zWhkatQoad9LU6qwBzVLLb2bVD4xR4/pw49rCG1
 TSlmQqqjnNUo3BVBqH837NP4dAd5euXZl49CVv9GR8hI9ZZK6XV/pPbTBGmMlhDfc4pH
 3ydh/wyJBvl2FMWm0cXG9jcRS1zwiZg9W97nXzlBOL8Vju+IqO7oc9gizmxmjRGNm4eh
 jvOGvNkb1qfXgASobZ5im0XPKpXcbu0O2IXwmRK3C+z09zSSIMOEBGRxRbVjtml92vSq
 Qb5pmTTAbhHqGZu6XWrDphbr2G75iZM+Fst4+sfTqXFQkMQIMH500yiLVq7CE58Q/sUM
 oKIw==
X-Gm-Message-State: AOAM532Gvv2dKMqpf2rPqzcmrO7dzbGgzFiOn81NjD0IwVqH5CFLMojP
 c8VBK+rS/fHL+Wq2D1xm9diwo8y0Rkc=
X-Google-Smtp-Source: ABdhPJx5+6b9rgn2O44UXE28FFTYJcvj5X02ZlHRmJXtFYyLpVdJEmES4u25TJdg8YIxLy1sPK+QDA==
X-Received: by 2002:a05:6402:57:: with SMTP id
 f23mr9512601edu.323.1617282587175; 
 Thu, 01 Apr 2021 06:09:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3c32:c312:443f:a091?
 ([2a02:908:1252:fb60:3c32:c312:443f:a091])
 by smtp.gmail.com with ESMTPSA id h13sm3570492edz.71.2021.04.01.06.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 06:09:46 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: add __user annotation in radeon_ttm_vram_read
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20201024004706.24518-1-linux@rasmusvillemoes.dk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d09f16d8-528e-2815-8f26-ab85c27b1fea@gmail.com>
Date: Thu, 1 Apr 2021 15:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20201024004706.24518-1-linux@rasmusvillemoes.dk>
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMTAuMjAgdW0gMDI6NDcgc2NocmllYiBSYXNtdXMgVmlsbGVtb2VzOgo+IEtlZXAgc3Bh
cnNlIGhhcHB5IGJ5IHByZXNlcnZpbmcgdGhlIF9fdXNlciBhbm5vdGF0aW9uIHdoZW4gY2FzdGlu
Zy4KPgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+
CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKR29pbmcgb3ZlciBvbGQgcGF0Y2hlcyBhbmQgc3R1bWJsZWQgb3ZlciB0aGF0IG9uY2UuCgpB
bGV4IGRpZCB5b3UgbWlzc2VkIHRvIHBpY2sgaXQgdXA/CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
IC0tLQo+Cj4ga2VybmVsIHRlc3Qgcm9ib3QgaGFzIGFscmVhZHkgc3RhcnRlZCBzcGFtbWluZyBt
ZSBkdWUgdG8gOWM1NzQzZGZmLiBJZgo+IEkgZG9uJ3QgZml4IHRob3NlIHdhcm5pbmdzIEknbGwg
a2VlcCBnZXR0aW5nIHRob3NlIGVtYWlscyBmb3IKPiBtb250aHMsIHNvIGxldCBtZSBkbyB0aGUg
ZWFzeSBvbmVzLgo+Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwg
MiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IDM2MTUwYjdmMzFhOTBhYTFl
ZWNlLi5lY2ZlODhiMGEzNWQ4ZjMxNzcxMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jCj4gQEAgLTEwMDUsNyArMTAwNSw3IEBAIHN0YXRpYyBzc2l6ZV90IHJhZGVvbl90dG1f
dnJhbV9yZWFkKHN0cnVjdCBmaWxlICpmLCBjaGFyIF9fdXNlciAqYnVmLAo+ICAgCQl2YWx1ZSA9
IFJSRUczMihSQURFT05fTU1fREFUQSk7Cj4gICAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJk
ZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKPiAgIAo+IC0JCXIgPSBwdXRfdXNlcih2YWx1ZSwg
KHVpbnQzMl90ICopYnVmKTsKPiArCQlyID0gcHV0X3VzZXIodmFsdWUsICh1aW50MzJfdCBfX3Vz
ZXIgKilidWYpOwo+ICAgCQlpZiAocikKPiAgIAkJCXJldHVybiByOwo+ICAgCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
