Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E062AC46F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E0E8932D;
	Mon,  9 Nov 2020 19:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E458931D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:01:44 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id t16so11331450oie.11
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 11:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eFMBLTL2PEBWwAPN9U+kNbGLp9Yb/Evdl1oIvaz71lM=;
 b=I8/jsgmEu2veIaT5jtapZyvekUNQepacf+TAn9+VOm58Y5Ocyj3xu4S9Wi9BTvdkET
 0ZGQdQFO6Bi8FmHiPZSvVe3Ikmq1V739DU60ZTHOqH0zk3GMawscWunwVMmEvxgMidc3
 i1Ka700G/aw3dXr2xDjM6lRdzy2pyIVD2mYLAWU4R8N7lkV9KSTGs0UqWV6EN9wU9UP2
 yUM/QxqJBxYrGZMWElgm2uiH5tgGI8c14ozT/45hbkATVJKFx7XKf9ffM1uxt7iaEm1O
 8SU4keRpvGBwhY17FCUtCpnRBVYiFXchvaX55zGTf8RepL0yEzL3Zz+uwIF2TKmARIIF
 r3LA==
X-Gm-Message-State: AOAM533SVdag4NcJCGJCuTSSFBjQUQvn/uF0VJGGxyG1IzUfoCEaPDKd
 12L4dTrWo7Irr+Q8V7sdoQ==
X-Google-Smtp-Source: ABdhPJyhd8w22tZX0i2ZdxI3coqSF5uqjsf5bOy6yJ+ZdMET91o4ROO4MnjEmThijz4ZdSCDJrN4rg==
X-Received: by 2002:a05:6808:a94:: with SMTP id
 q20mr384924oij.31.1604948503395; 
 Mon, 09 Nov 2020 11:01:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u16sm2548511ooj.8.2020.11.09.11.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:01:42 -0800 (PST)
Received: (nullmailer pid 1592610 invoked by uid 1000);
 Mon, 09 Nov 2020 19:01:41 -0000
Date: Mon, 9 Nov 2020 13:01:41 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 05/30] dt-binding: usb: ci-hdrc-usb2: Document OPP and
 voltage regulator properties
Message-ID: <20201109190141.GA1592558@bogus>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104234427.26477-6-digetx@gmail.com>
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
 devel@driverdev.osuosl.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-samsung-soc@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Nov 2020 02:44:02 +0300, Dmitry Osipenko wrote:
> Document new OPP table and NVIDIA Tegra-specific voltage regulator
> properties.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
