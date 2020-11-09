Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BCE2AC45A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C549989312;
	Mon,  9 Nov 2020 19:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D98B89312
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:00:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n11so10010027ota.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 11:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5YUEvnB3to37KnbuxcK5tx/hJGsx2a/LFMlp0aY5TLQ=;
 b=ecg2siNDVdg5DCfHqxDypOSqMdgM9qNUNXRDd/hfhyV7tWQNfDM19EVau0OxPoZ+Ej
 xb/F8uxhS6uVlHfxrdm7dMeZVbPiTAybVLJpOq2CgcdnSAbCXH9yU4ZvShDjC6xcXZva
 couINEJTFD/lLQcmITFa/dYuJ/k9KVsOakqtkFxkrek7QRa7zP9is2qI4RmGSchBDOQ7
 5no1HSL+aDnlfhN5OdEJ/gEDKliqJzMC4ppJf79m4rX75vDRDrqP0H/dCW9d0EhiiQvt
 Y7ohCvosV38acE0PMl9Ln0zr5TvnRB6I1ZE7bDNCHyvVIPtA4tb0RP/3nKzN0BI5lJo5
 7DyA==
X-Gm-Message-State: AOAM532QyKdBpyGj8F+7G8hlE5zYEpX7d/OAXR8G8bWKNHaWbRBlHW9Y
 D/kqzBKqp82817KVcnJkow==
X-Google-Smtp-Source: ABdhPJyMX9zDE7/Gr58n7kd8OGZN4yCUG4rGtgbFXHnSLCafRqgq9w/7W4V89fBfDlqFoI1WEyH4Pw==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr12134497otr.151.1604948433035; 
 Mon, 09 Nov 2020 11:00:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o9sm2602082oos.29.2020.11.09.11.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:00:32 -0800 (PST)
Received: (nullmailer pid 1590838 invoked by uid 1000);
 Mon, 09 Nov 2020 19:00:30 -0000
Date: Mon, 9 Nov 2020 13:00:30 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 03/30] dt-bindings: pwm: tegra: Document OPP and
 voltage regulator properties
Message-ID: <20201109190030.GA1590784@bogus>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104234427.26477-4-digetx@gmail.com>
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Nov 2020 02:44:00 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and voltage regulator properties of the
> PWM controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
