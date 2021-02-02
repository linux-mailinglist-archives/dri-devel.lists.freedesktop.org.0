Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4D30B9DD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAD66E8E4;
	Tue,  2 Feb 2021 08:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3C6E8DF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:28:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m1so1478819wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bFiTMfrDGaWBCg0p94Ve9DO2sWATZ48G3jOzHUgim7g=;
 b=FBJWMelLQhMEkkiGfS95RqrQWLdNPopNfuEOE3bVIxGKfpwQzmatH39kKmkCK+R/mE
 ZvUxBJXkz7bdlKErQVVoxi1XU4wYu8x5Y5C3HVICYvbeLJE7qDi5AzKix0j6Dyl0fPlA
 RaqGwGzrSDDdtAKpu5J7b8iyrYt+1P7FTQ2MsyQ8xulPyL7sWSBxaI4PlOxlnrtv2XDT
 whS+HWuU5CMrHrjCxXKmxWxTfvVBHyexLGTDyIITFCvjri9PwPCPhlntXiDOoxBlbZ9l
 6cXKT9y1z1e8VoX6qC/Vdf0Z+2Yrh9jJFyi6dEdzDff+dIdrCFcj16HaYFLwju7GauDu
 ktzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bFiTMfrDGaWBCg0p94Ve9DO2sWATZ48G3jOzHUgim7g=;
 b=haFthq5w2UdYYN4jb5iQKjypB3m5L3kxvFxnmjyZMieK1SRt9xRPiAZvAJ99DHk3fp
 s+lj7wzWyf0iSw2GOvaz6WZk5w15BSwneNlwLWC3TGpJZ85z+mWmqiae6RemSuw78tFo
 F13t93zeuAIsOr18CMgToVJNb88Yat1x5WjLf5xATxAasJXN9uZgMeM8Obs+qb7cH9cc
 hJ7r9l+IqaPCZl3xVdGci1JdhVuYi9uyHa8I4LsZiHTTLUKqK1B/NivTxraFmY4OLjZa
 tNZWq37MppeZtCHI/vz0nYkzaipmwBTDUgcrkxr+EkTTTjm2IRt2vfstzgXRpzWk22CG
 Bq3g==
X-Gm-Message-State: AOAM533QCm/4PwUHFFF5gHMVpzDnv+KM+iXLpuwI5E2tARwJ8gGTeNQp
 iFOpdtYqv6MGujUYQqiOaSbDkQ==
X-Google-Smtp-Source: ABdhPJxlkgBIS/VbsDJv1LdNt0bSAI4XsoXwQotmWBDepPddTczE/Ide+Q97wd0zG6r/nHPHYmU+3A==
X-Received: by 2002:a1c:9692:: with SMTP id y140mr2471242wmd.128.1612254514666; 
 Tue, 02 Feb 2021 00:28:34 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id l1sm29630262wrp.40.2021.02.02.00.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 00:28:34 -0800 (PST)
Date: Tue, 2 Feb 2021 08:28:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Wenjia Zhao <driverfuzzing@gmail.com>
Subject: Re: [PATCH] backlight: pcf50633: pdata may be a null pointer, null
 pointer dereference cause crash
Message-ID: <20210202082832.GA4774@dell>
References: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
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

T24gTW9uLCAwMSBGZWIgMjAyMSwgV2VuamlhIFpoYW8gd3JvdGU6CgpQbGVhc2UgcHJvdmlkZSBh
IHN1aXRhYmxlIGNvbW1pdCBtZXNzYWdlcy4KCkRlc2NyaWJlIHRoZSBwcm9ibGVtLgpEZXNjcmli
ZSB0aGUgaXNzdWUgd2FzIGZvdW5kLgpEZXNjcmliZSB0aGUgc29sdXRpb24uICAKCj4gU2lnbmVk
LW9mZi1ieTogV2VuamlhIFpoYW8gPGRyaXZlcmZ1enppbmdAZ21haWwuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wY2Y1MDYzMy1iYWNrbGlnaHQuYyB8IDMgKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcGNmNTA2MzMtYmFja2xpZ2h0LmMgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wY2Y1MDYzMy1iYWNrbGlnaHQuYwo+IGluZGV4IDU0MGRkMzM4
Li40MzI2N2FmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3BjZjUwNjMz
LWJhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcGNmNTA2MzMtYmFj
a2xpZ2h0LmMKPiBAQCAtMTI3LDcgKzEyNyw4IEBAIHN0YXRpYyBpbnQgcGNmNTA2MzNfYmxfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCj4gIAlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBwY2ZfYmwpOwo+ICAKPiAtCXBjZjUwNjMzX3JlZ193cml0ZShwY2ZfYmwtPnBj
ZiwgUENGNTA2MzNfUkVHX0xFRERJTSwgcGRhdGEtPnJhbXBfdGltZSk7Cj4gKyAgaWYgKHBkYXRh
KQo+ICsgICAgcGNmNTA2MzNfcmVnX3dyaXRlKHBjZl9ibC0+cGNmLCBQQ0Y1MDYzM19SRUdfTEVE
RElNLCBwZGF0YS0+cmFtcF90aW1lKTsKCkEgdGFiIHNob3VsZCBiZSA4IGNoYXJzIGluIExpbnV4
LgoKPiAgCS8qCj4gIAkgKiBTaG91bGQgYmUgZGlmZmVyZW50IGZyb20gYmxfcHJvcHMuYnJpZ2h0
bmVzcywgc28gd2UgZG8gbm90IGV4aXQKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
