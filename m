Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE31FAAB3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 10:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879AE6E200;
	Tue, 16 Jun 2020 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739266E200
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 08:05:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x6so19677351wrm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nSbbk12sklznSzURmDgyRvyV4JyDaN7OpY0qUFnGrF0=;
 b=T6FxFVn1hxbyVOJ1IyLfuqYj92YRLnRIsyx3/oowDA+x3BzDhwFFmEeKEnPEP9MPEA
 Q4cmnsQT8k+IMgfrS+3spLNWSL06RqN5ebkLysnP6qXhcUQk9AGZtEgX1tRfPkNPU28/
 4jJVm8GVo0U9VldN1mn1ClAGq/x7SH0XL66fJeIzZRX/G6Q1xsok0Y2PUuquOkR1aBlj
 tApAtsDp/nIGk0fmm6PqW/vfj/Q4Rw28Yj9ozigY3qyY7ZyVtXEVHsL7xsk+ercb4Sqv
 UZEfOeVoDSU05JYPGHHufWHF007CvNHJQzCssmMv5YBp5l3UD2RZwRoXhJzjSl2+bRq7
 xLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nSbbk12sklznSzURmDgyRvyV4JyDaN7OpY0qUFnGrF0=;
 b=ZlniVB+MNecrc1pU++1y1fr8KLQeZxOa1Q5BRDvu4TIZObQamfTphDW20SMIoHNhi2
 5hBx8RJb/wIwWcEYZE5q5cUEzNFFyVMbfNOYEw2n2+9RpB8jiYau7brsVcXTTugwDCuL
 ueBSmt09hKOsSsOHVxaZ7uLXFkxLYG30Op5mQYX99Ij0kvOAtgG+B/zxrqSVqtONj/Zg
 I46Exg4vdBJBAtUftI1ksquYJXfdFWI2WGHbCj18Du/6SGQhZnnQvAMo9/0XnKTp1SWz
 Gk4ZGs51gd8whHlQViLvyPPrCvPtzyr8W2HHlHJcnQlyNjTMtP/34OQQO/FJLavuQbMh
 Hfbw==
X-Gm-Message-State: AOAM532yZeb8ZLgeLPkZSVs1L0bNGUGcznFobpanMWqiZw05F9wpE4jS
 wop+P8f3vv/kkxQPWJFlCMQoSuVaHkU=
X-Google-Smtp-Source: ABdhPJxU65V0UN6yumv2HUuV4IN5upvbVb+ibQ9xncnrMwZn2lX2xkgru9+/gYpAYeYXxU41grhpcA==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr1682760wrn.130.1592294731087; 
 Tue, 16 Jun 2020 01:05:31 -0700 (PDT)
Received: from dell ([109.180.115.156])
 by smtp.gmail.com with ESMTPSA id f2sm2679917wmj.39.2020.06.16.01.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 01:05:30 -0700 (PDT)
Date: Tue, 16 Jun 2020 09:05:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drivers/video/backlight: Use kobj_to_dev() instead
Message-ID: <20200616080529.GK2608702@dell>
References: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNSBKdW4gMjAyMCwgV2FuZyBRaW5nIHdyb3RlOgoKPiBVc2Uga29ial90b19kZXYo
KSBpbnN0ZWFkIG9mIGNvbnRhaW5lcl9vZigpCj4gCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBRaW5n
IDx3YW5ncWluZ0B2aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NTMzX2JsLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ICBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTAwNzU1IGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L2xtMzUzM19ibC5jCgpJJ3ZlIGZpeGVkIHRoZSBicm9rZW4gc3ViamVjdCBsaW5lLgoK
Rm9yIGZ1dHVyZSBzdWJtaXNzaW9ucywgcGxlYXNlIHVzZSBgZ2l0IGxvZyAtLW9uZWxpbmUgLS0g
PFNVQlNVU1RFTT5gCnRvIHZpZXcgdGhlIGV4cGVjdGVkIGZvcm1hdHRpbmcgZm9yIGFueSBnaXZl
biA8U1VCU1lTVEVNPi4KCkFwcGxpZWQsIHRoYW5rcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2xtMzUzM19ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NTMzX2JsLmMKPiBpbmRleCBlZTA5ZDFiLi4wYzc4MzBmCj4gLS0tIGEvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbG0zNTMzX2JsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM1
MzNfYmwuYwo+IEBAIC0yMzUsNyArMjM1LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmxt
MzUzM19ibF9hdHRyaWJ1dGVzW10gPSB7Cj4gIHN0YXRpYyB1bW9kZV90IGxtMzUzM19ibF9hdHRy
X2lzX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtvYmosCj4gIAkJCQkJICAgICBzdHJ1Y3QgYXR0
cmlidXRlICphdHRyLCBpbnQgbikKPiAgewo+IC0Jc3RydWN0IGRldmljZSAqZGV2ID0gY29udGFp
bmVyX29mKGtvYmosIHN0cnVjdCBkZXZpY2UsIGtvYmopOwo+ICsJc3RydWN0IGRldmljZSAqZGV2
ID0ga29ial90b19kZXYoa29iaik7Cj4gIAlzdHJ1Y3QgbG0zNTMzX2JsICpibCA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOwo+ICAJdW1vZGVfdCBtb2RlID0gYXR0ci0+bW9kZTsKPiAgCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
