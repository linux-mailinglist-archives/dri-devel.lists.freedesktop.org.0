Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C732AC476
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08E189359;
	Mon,  9 Nov 2020 19:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02FE89333
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:01:55 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id l36so10018816ota.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 11:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XU7y3c5jKQwTRFURlMcdIsjUqbBQIJvi2dRnhrHPP2E=;
 b=mYGpPv8DBN/oRzyBDJn/LGvYdj0YQd/m8ZWnK1uQwrUBOtkqeVCJfq2DLQJXzvbIqm
 zP5Mj4nMqhVP41uJPNUtMg4GSipT4u6KnGWP3QN4GlSbNi5Y3PUKgDcusi8BpefH4kWB
 I7GUpYaf0ozzk/YoaeSEJ6iHZMsQWriOallQZK1DXBB8YEUMAvP8EpBIsYUK7Bo8D6s5
 jd9MIk/HwZwyduOhhRvG2+LFJi36opiIyH37xpT2SvAjbHa+E27JoJ89FXTDRGhJSjjk
 s7jhuXhbC/KpTDvvum3b6sPJowAld2TS8Wllg5TvSgKvVZT3TwSw+DGbKs2usIfLOQ08
 sRfQ==
X-Gm-Message-State: AOAM532aPB1IfWRM67AxKBeO0/ko44X0YZG66f3ZP1Xq7sbl+Z8qOCQr
 DFqgcGcxvFbZhwgiujC/qA==
X-Google-Smtp-Source: ABdhPJw681tHcSTTGqGgpXlkNWmd92BhhZoG61LbluCCQbsQRzYEPiujcl6g2HrH1OOy41T/D++2Fw==
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr11473992otq.208.1604948515112; 
 Mon, 09 Nov 2020 11:01:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w18sm2383935oti.61.2020.11.09.11.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:01:54 -0800 (PST)
Received: (nullmailer pid 1592966 invoked by uid 1000);
 Mon, 09 Nov 2020 19:01:51 -0000
Date: Mon, 9 Nov 2020 13:01:51 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 06/30] dt-bindings: usb: tegra-ehci: Document OPP and
 voltage regulator properties
Message-ID: <20201109190151.GA1592922@bogus>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104234427.26477-7-digetx@gmail.com>
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
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Nov 2020 02:44:03 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and voltage regulator properties of the
> Tegra EHCI controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
