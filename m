Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D569B2AC440
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 19:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46F8937C;
	Mon,  9 Nov 2020 18:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974D8937C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 18:57:29 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a15so8265941otf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 10:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yp+Myu+RbCp/hhggXGpFgymnJTdUJhcL8XQ+E+Agqsg=;
 b=flJiyLU8/g7YYEdq0xfjgvtaNu/cDXm7Z3kkh8a7fMjgJoFfqkUVcSMHKf2D6fTiP4
 fOfG3M17Y1Lp+33oA1rdWicMJealJ1zPY3Kk7afDM6azXwWtLGmbsKyeZSW1If9fgry6
 EbsD+UB/wBfrtACveQccjJVW9Sx1hVetQtqhU1sYjLoKBWCM2KKFQwrTa8PKooioKNKL
 pBWRSmidUGWLalKIo5Vb50332ABSZkAhfuhR2dnC4iESLhJyf5elcCt1GvBGThpknjpz
 uFYV3ddsa8GT9DDHmVNPBFHnNas8BjKGIWmsHveBv1bK4xlEBRJtIva5ZM6M/mwf0X/d
 IKxQ==
X-Gm-Message-State: AOAM531A/1gLIxLoJkztzM5+QjbvBFyXsx1vmNqZcV2x+jM3oMPe9jG0
 Was4hQiijIh/PhKDN2KbHA==
X-Google-Smtp-Source: ABdhPJwTrJM8+DV6yoj0yZkvksdAC3aJsLLLrx1WHxgB39fkbPYVnHOpW6Iq5AkW4A4fHBNfxiLHQg==
X-Received: by 2002:a05:6830:2093:: with SMTP id
 y19mr10923388otq.219.1604948248350; 
 Mon, 09 Nov 2020 10:57:28 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o29sm2726530ote.7.2020.11.09.10.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:57:27 -0800 (PST)
Received: (nullmailer pid 1586563 invoked by uid 1000);
 Mon, 09 Nov 2020 18:57:25 -0000
Date: Mon, 9 Nov 2020 12:57:25 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 01/30] dt-bindings: host1x: Document OPP and voltage
 regulator properties
Message-ID: <20201109185725.GA1586511@bogus>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104234427.26477-2-digetx@gmail.com>
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
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Nov 2020 02:43:58 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and voltage regulator properties of the
> Host1x bus and devices sitting on the bus.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
