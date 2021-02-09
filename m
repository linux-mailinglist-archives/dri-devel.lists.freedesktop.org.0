Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC6C31513F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 15:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08046EB43;
	Tue,  9 Feb 2021 14:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5026EB43
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 14:10:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id w4so3277344wmi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 06:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=66wEbN8iHcZJ/HoLB6LP4QcoOHJkUuN4h7Kjvc86lwU=;
 b=oPI/eaTvwS5chRyBK3gJsBx6c6mgOfSAntmygoD9nxzSBE3mlb9K9JptuewJ03XoaI
 R4GFJyKx5XtELi7cymXKcX37h39g/UfDPuVjmRsCgt3I3DjuA2LSpWM15+PzKO0sYx7U
 gUiuI9oQnCySZRouH7aPTmIs3I3Nw/38nRaZjtQQQMHNS2zXXiNrXTSf8DmDAxQi3/FL
 eKqZKFuuHgoVQDav8FSDkTuG5Ra1xaBQgHPKSqhrZXNSvsBxomtdx849xh3H/lrcwoGF
 7/z376M15CpJuR3BEZOeSE4Wt1YHaGAUXWSdqXvkaPF6cIOv6JQ5yPRDEgRPXRJg/VbZ
 wjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=66wEbN8iHcZJ/HoLB6LP4QcoOHJkUuN4h7Kjvc86lwU=;
 b=j4AN1kIv2l+XBN0YvgEFCIW5qWey3PdGUF+fD1KBNusypLo7osvBjsrQhP3ebH8FFj
 GZWk6oXWQPJYZCWmPvq7QvQ0MKU/s5NJy2GipIbLuq8fXx/jVuN57b4LxPS6zNLL1PjM
 q6735JmAVKncZfGpbSR03FrwdWx0c9xwN52prfyvsp65KImJcg0nfX9kvHFnBllN8ohu
 mxv9AdMdJwscJ3bKNUaMBb/+eJ7YQxGMlXF6G31qr0maAFotTYfYf4l5oZaG9vMS/FjM
 vksWyjxl6MbzLExcv4EgCyniZdiZuAfloIfwW68cKt7ePw3q5yodRX3FXf80u5K/knot
 dU/Q==
X-Gm-Message-State: AOAM530Rl8NCGzx5z/7PHDZHObPNFBqki2E4uaOEts+5fKM8GH7u+h8g
 nb9Ozm2l6W6Da6KJTkUZ6RwJ7A==
X-Google-Smtp-Source: ABdhPJyhhkRdoRVwDdW6C0v/U0e/iolqQlDWcmuneFQbPco27syodtEqTtkwiFJbChCj+r2q5CB1/w==
X-Received: by 2002:a7b:c3ca:: with SMTP id t10mr3565771wmj.138.1612879821640; 
 Tue, 09 Feb 2021 06:10:21 -0800 (PST)
Received: from dell ([91.110.221.187])
 by smtp.gmail.com with ESMTPSA id h12sm3543004wru.18.2021.02.09.06.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:10:20 -0800 (PST)
Date: Tue, 9 Feb 2021 14:10:19 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: ktd253: Bring up in a known state
Message-ID: <20210209141019.GC4766@dell>
References: <20210126213200.14366-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126213200.14366-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNiBKYW4gMjAyMSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIEtURDI1MyBi
YWNrbGlnaHQgbWlnaHQgYWxyZWFkeSBiZSBvbiB3aGVuIHRoZSBkcml2ZXIKPiBpcyBwcm9iZWQ6
IHRoZW4gd2UgZG9uJ3QgcmVhbGx5IGtub3cgd2hhdCB0aGUgY3VycmVudAo+IHJhdGlvIGlzIGFu
ZCBhbGwgbGlnaHQgaW50ZW5zaXR5IHNldHRpbmdzIHdpbGwgYmUgb2ZmCj4gcmVsYXRpdmUgdG8g
d2hhdCBpdCB3YXMgYXQgYm9vdC4KPiAKPiBUbyBmaXggdGhpcywgYnJpbmcgdXAgdGhlIGJhY2ts
aWdodCBPRkYgdGhlbiBtb3ZlIGl0IHRvCj4gdGhlIGRlZmF1bHQgYmFja2xpZ2h0IGZyb20gdGhl
cmUgc28gd2Uga25vdyB0aGUgc3RhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9rdGQyNTMtYmFja2xpZ2h0LmMgfCAxMiArKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCkdydWRnaW5nbHkgYXBwbGllZCwg
dGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQg
LSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
