Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D92A9167
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68FF6EA6C;
	Fri,  6 Nov 2020 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6F56EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:02:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 2so2499580ljj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Al4h4rmGhqwiEGe133XHwebc8D8nOD3olrp8Vml5Ma4=;
 b=ns839VcoCfQlmSawliO3BW+/1vwbWsC0SuMDgd2rWP8iV711Mqqtf4m0MCEmnLvl6U
 3vb8CBUhCZHuLBbT/vy/0iMtjPX+V3C6uUIb2OPOXdjLYjIP6UI/e87eGPrrzJ+xbk0U
 lPuFmuT1kZYJ9xA2IDMRS58fh3QHtxbqkhAxXI9q2n4iD1UkN9wCV6XZxUKCW+jG4fl1
 bhur1vx8ueIhfdY8E1LoNLWhfnSqc8Cz4pG2mSMrLt8qiqsSVAo166ZZkzVsvdwhvofK
 JB2HZrGV3JeU2U3FG6Z6xcUm8hK1QDD32JbxQ1HpcmJHxS8qabOilxvrGXG1/u5lCDmu
 kXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Al4h4rmGhqwiEGe133XHwebc8D8nOD3olrp8Vml5Ma4=;
 b=AmqAu4CiJgoLpPCkic6Dq7Lpwenewp7grvw2rGXHBaB49ViSlcR0LdmTRoiluDAO7a
 DRZ3BtP1GqcSbLaSKPJIXgvtqn7KqXaTFv1BOtMXH+E9i1EU+Flq2BQEO1bm41llU9Wm
 7yly+W3lPdNDO8hWz4Z8g0rcyHTt81e+Dx1M6+iQIa8lG7XKw2h+QFPqUUKz3acPQmP/
 ZGVso3FcCG6vVU1Jcr75klZeFpQtZLlsqzSxb9vu9TgiJiVJgx4Av9GL08zngWj9fRdg
 lqGT7QKl97xGDDy/FdRyqfW3KA7ovA9+y0RJtgNMIqmm8+1xvaU3Zid4nxUdV/j1VEPz
 sXlw==
X-Gm-Message-State: AOAM532rp9DC97zA55Uea13dT0IIW7PoScXh0VzPo8Ueup+Ht1iFy/um
 Fac2t5ppTfY1N7o6VP9C10s=
X-Google-Smtp-Source: ABdhPJyGo1QPlqd8Bg9dlBjbnD5b7q3iSRiSvONPHwwdeYcMEjv8aISie0TROJMehCbGPKS7ntWyVA==
X-Received: by 2002:a2e:5007:: with SMTP id e7mr1293766ljb.196.1604599324582; 
 Thu, 05 Nov 2020 10:02:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id q28sm251319lfn.7.2020.11.05.10.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:02:03 -0800 (PST)
Subject: Re: [PATCH v1 21/30] usb: host: ehci-tegra: Support OPP and SoC core
 voltage scaling
To: Alan Stern <stern@rowland.harvard.edu>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-22-digetx@gmail.com>
 <20201105160743.GA1613614@rowland.harvard.edu>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a6030abc-3727-01ca-91b6-faf02d8083fd@gmail.com>
Date: Thu, 5 Nov 2020 21:02:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105160743.GA1613614@rowland.harvard.edu>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTEuMjAyMCAxOTowNywgQWxhbiBTdGVybiDQv9C40YjQtdGCOgo+PiArCWVyciA9IGRldm1f
dGVncmFfZWhjaV9pbml0X29wcF90YWJsZSgmcGRldi0+ZGV2KTsKPj4gKwlpZiAoZXJyKQo+PiAr
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBlcnIsCj4+ICsJCQkJICAgICAiRmFp
bGVkIHRvIGluaXRpYWxpemUgT1BQXG4iKTsKPiBXaHkgbG9nIGEgc2Vjb25kIGVycm9yIG1lc3Nh
Z2U/ICBKdXN0IHJldHVybiBlcnIuCgpJbmRlZWQsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
