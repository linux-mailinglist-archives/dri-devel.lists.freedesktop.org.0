Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C142AC465
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512F89306;
	Mon,  9 Nov 2020 19:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46189306
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:01:31 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f16so9982367otl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 11:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sxvGIdy8L6aF+X1tfnngpFsA6hnyaeT/BHnffJ6GLdk=;
 b=pY4mLVG5jtJ6XiwzV18+Zbc15sjdS23Zok8zIPiblUMEurZLYySc7oY4xFppW0E7n6
 5/2leFyC7p8IUWrDtoOTXuF/oRyhlgx9C5BGHEjgERmxNmLjUCtSbRqWrG6iBDnBYhgh
 MeTK4QOaGdO6x22uKiQrFomsrgXVXqRYoQqLBiIRNFnke5zl+7+eCNtv6rksQK3Rbz3x
 foR94eK2XwTr4FyYd9YKoUe4TCKNEtze75DpD7Ug8m6jnE4ATQTB+vRnBW+jBCz/xDsF
 i5LK8aK9i3INN1RyCIDDtW9ogsgmd9HHNEMiMdyazfwbBlOLNNNDyFlO6dW+akeigw8n
 7CNg==
X-Gm-Message-State: AOAM533GDEedwpFb736TWAQhUYmCos75iRM2NSj9hfwl7kQgWJmeOr/P
 CNNp4GiCOVOfoZJNAkmxCw==
X-Google-Smtp-Source: ABdhPJzOhkMgIOJrja36004ip5oRoceuSmOgBqEWKhX4GWjGFsinIHUsPIQPsWh2l7hn0/HugmXZQw==
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr10887306otc.368.1604948490950; 
 Mon, 09 Nov 2020 11:01:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h6sm2563055oia.51.2020.11.09.11.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:01:30 -0800 (PST)
Received: (nullmailer pid 1592258 invoked by uid 1000);
 Mon, 09 Nov 2020 19:01:29 -0000
Date: Mon, 9 Nov 2020 13:01:29 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 04/30] media: dt: bindings: tegra-vde: Document OPP
 and voltage regulator properties
Message-ID: <20201109190129.GA1592208@bogus>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104234427.26477-5-digetx@gmail.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Nov 2020 02:44:01 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and voltage regulator properties of the
> video decoder engine.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/media/nvidia,tegra-vde.txt   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
