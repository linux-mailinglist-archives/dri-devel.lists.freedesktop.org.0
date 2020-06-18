Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433A1FEDFC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 10:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128136E05A;
	Thu, 18 Jun 2020 08:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957356E05A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 08:43:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e1so5136464wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=brvq047GWmZAo17C69Xj/1QyaxG1QhV4W0ODi9tBfK0=;
 b=um1VtIz1ojnFmyHyfDbAw2jjevGBCC8F6ig4HMD39gp1CU8SuAqgkEg2NNJrCMIlYg
 bTAKUY8zbGgzauDwHSuE8FMLJXz9oHLaky+S7ULuR8DSp7FoHTWLzDQPK5n8NZIbN4HD
 U8JaZFLsXXpirT5E6C+ILXnjHBr9vo2TrmvSuEMBXLRQAxUWwhbk4oqfcLy1zYEFtmNm
 sCyz2jbHn0MVC4fgCQVF2/opm4xl0QIW4ZNfAaHTMk3abaiS0AMtJBqyMu6O8SCZonvR
 LBC2yHgo9CMo2FitN56vSOJN12whYQmlZkS5w29LFRQdvc4D5SoIAou4DHoUI8kRUArn
 FTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=brvq047GWmZAo17C69Xj/1QyaxG1QhV4W0ODi9tBfK0=;
 b=QKFFZhegMNQOttAA3/AjeMGyrLSdm+AlaYnejxPLLgob5nc/yPh1oAertQMMPZ+J9c
 VtNI73ubBihP3MGs+Nwx3YJ0L0EAcGzcK0EDaUr0mZVQWpdK97sLESCFzGx0MC6Y2glq
 X6ffuXZ7L7zyCjDbkK2gQnIbcPTQbVx3nPJ9p88ikiRTMinHXRcLy1dMY8uFQa/ciYS7
 Riv0TsS6d3yR4qbkIXN+2cTgjQdoSUhHRGqoxJw8GP3dV2jn015a+5iFDWhf0HdWeoli
 uohxTWLGvhlcofNWrUSE2shr6N5kYj8L0uBs1P6auAVqKyrgGVdPsTRkNn43Rwa8zGt5
 fDGg==
X-Gm-Message-State: AOAM530f284V4Kj2jREtGYJtxXNfvQji/FXeAw7oDUT6sGDJTep+51fI
 S3YcCv4mAOAydErOpaXhXD5ttA==
X-Google-Smtp-Source: ABdhPJzmV6kItaKJaH4rcxOjvDp5gt/F5ZQIJ2li/nrZlhjEurHChGdTsVGmEdRqHfl2f10IQgFFOQ==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr3499044wrt.416.1592469805280; 
 Thu, 18 Jun 2020 01:43:25 -0700 (PDT)
Received: from dell ([95.149.164.118])
 by smtp.gmail.com with ESMTPSA id e12sm2656213wro.52.2020.06.18.01.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 01:43:24 -0700 (PDT)
Date: Thu, 18 Jun 2020 09:43:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 4/6] video: backlight: tosa_lcd: convert to use
 i2c_new_client_device()
Message-ID: <20200618084323.GB954398@dell>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
 <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615075816.2848-5-wsa+renesas@sang-engineering.com>
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
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxNSBKdW4gMjAyMCwgV29sZnJhbSBTYW5nIHdyb3RlOgoKPiBNb3ZlIGF3YXkgZnJv
bSB0aGUgZGVwcmVjYXRlZCBBUEkgYW5kIHJldHVybiB0aGUgc2hpbnkgbmV3IEVSUlBUUiB3aGVy
ZQo+IHVzZWZ1bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2Fz
QHNhbmctZW5naW5lZXJpbmcuY29tPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRh
bmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IC0tLQo+IAo+IEknZCBsaWtlIHRvIHB1c2ggaXQg
dmlhIEkyQyBmb3IgNS44LXJjMi4KCkdvIGZvciBpdDoKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVj
aG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
