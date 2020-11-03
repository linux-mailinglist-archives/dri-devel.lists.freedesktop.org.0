Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41172A4E26
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 19:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9B16E8E2;
	Tue,  3 Nov 2020 18:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420C36E8E2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 18:16:45 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b19so8960338pld.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=k0DG4sb8XOtJOwN6TLhr+5qsFzs3ayb+63KIAEg2F6g=;
 b=pZIDUWHuqmi0r+lNSw5OaFLd0XW/nVZVW2NTNpJSY9bPoYhh3CTe2BTZn3Exc/WI99
 pfcwlwj5DnNgYX+EZRc8qS3UMjZVYzwQv0YCi5Q3JacETXmQaFnh7Bgab54NUYuRKN4s
 IopkMD1pT+jRpbo+pVQmPJlQ9PyOnIgqNMCkAtmdDTWgQxX1wTtcZ6wiclbmB4464JKd
 0nQW2djN9+lh3fevKAZtAhNp7OY1psFGkbF/eknVX6krJWiOhlhC78dr2FysjP/n9TyT
 5bQ5r8r/78dra0KqKv46K4lgofN3lpwhCcYIRCSpA+fZMDG2s4yPGyBj+p2qZbW08eeC
 u98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=k0DG4sb8XOtJOwN6TLhr+5qsFzs3ayb+63KIAEg2F6g=;
 b=S7B0IAC/Cq49VCs2A+XJN8hJ0Czmys7ASELTOJ2O+JicR+qOVgqFPu3F0OsvEFAlSZ
 awqLf4rLgHDRWp8/EhuSLB7jgo0V8apQLcOAcCyTnngkc08x2MIR8ImotwsWRdT0dAcS
 qx8CwETTjLOo84e6fLTnTasyfGNgsZce0FY+SGlsgpxmfB/9zguvi0f6a/KSc8ZXZEFH
 tm/GkwiopfErULUbTC9PhIkONN1zTAJ/CnVRFkjRIL1jjzj36ydgHoWqhk3sZ9K4BCJt
 Al7Pt7Nj0Vlup7glcUo6Z1AyuuzLPbAvm+IGfpRlpzjf+UaBDynRbTZnHqY4S47WCf8P
 O5aQ==
X-Gm-Message-State: AOAM530qUoHRoG7e9GQpjO2iPWkooGgFjDx1eL0kj9uWTuJRjBN8dbVP
 ubunKiMUTSZeKQRYaTNasMU=
X-Google-Smtp-Source: ABdhPJy/3gdywHqjCB7waXp0Y7ytzLjBbiYVOp4zjKQvoTUg3oKoSphU2GPctv3qAoe+Et3YumYEAA==
X-Received: by 2002:a17:902:be10:b029:d5:ced2:cc20 with SMTP id
 r16-20020a170902be10b02900d5ced2cc20mr18834350pls.25.1604427404853; 
 Tue, 03 Nov 2020 10:16:44 -0800 (PST)
Received: from SLXP216MB0477.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:9::5])
 by smtp.gmail.com with ESMTPSA id c2sm9075705pfb.196.2020.11.03.10.16.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 10:16:43 -0800 (PST)
From: Jingoo Han <jingoohan1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dan Murphy <dmurphy@ti.com>, Pavel
 Machek <pavel@ucw.cz>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee.jones@linaro.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v3] MAINTAINERS: add Dan Murphy as TI LP8xxx drivers
 maintainer
Thread-Topic: [PATCH v3] MAINTAINERS: add Dan Murphy as TI LP8xxx drivers
 maintainer
Thread-Index: AWsxNDgwBJ/rfWbefi0QBZZ1bPG9z9cBsnfo
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 3 Nov 2020 18:16:35 +0000
Message-ID: <SLXP216MB047756F8B2B3BB88227BCD62AA110@SLXP216MB0477.KORP216.PROD.OUTLOOK.COM>
References: <20201103162832.14085-1-krzk@kernel.org>
In-Reply-To: <20201103162832.14085-1-krzk@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
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
Cc: Han Jingoo <jingoohan1@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/20, 11:28 AM, Krzysztof Kozlowski wrote:
> 
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and add Dan Murphy from TI to look after:
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
