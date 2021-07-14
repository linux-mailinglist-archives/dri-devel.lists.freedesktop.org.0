Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6103C88CB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9AA6E42C;
	Wed, 14 Jul 2021 16:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8B6E42C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:37:44 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id e2so2222138ilu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wvSV9DfDpsl5FoylhFtZyQDYFQqbILb6lth89U0RgXo=;
 b=e4do9dhwNp1dYfxqNIOZbk4C/gm7LXZEFLT3hqcB96ak0qA33+Pgqn8ghTXZUmPs96
 m2CxIaWmBLD42iEE2Xv2ylNVQFuJSZ0bYBiY1nJRDzxWzLyekElK3Ds6fRgobZxOK5bw
 rQpFSEMHDmpJZ4H5gXmvqQs3zdlBHBsFbEuKUypyWcN/eWkXlnkAvuV3dYt4aQELVc+V
 BogyOwDczXF8mbm6OaTTTkWWes68dSeUD88Ce46EFel8DkXPyNZf/1kdSvYfl4ZwSMnP
 DJETbiofx4pblVUHL/bBHwTzsMukHq9jBhS7om2fFfm/SkoAiSx+4l9yeI4iPXWp8H1j
 AxWA==
X-Gm-Message-State: AOAM530NN6ErgpEHwBlDsQeTn43YiS49ptMfeeHr3iYbBEIvxmLDEEra
 1HYuFT8WRaPhqkFDspsm+w==
X-Google-Smtp-Source: ABdhPJybfnKLyt3zWGR1Mz5MrmFhJLmJDYIPJ/v58lFR0tKBQH/gG7+vZ28acd295aiviIieUK1I9w==
X-Received: by 2002:a05:6e02:1091:: with SMTP id
 r17mr7232171ilj.160.1626280664250; 
 Wed, 14 Jul 2021 09:37:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p6sm1543333ilg.4.2021.07.14.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:37:43 -0700 (PDT)
Received: (nullmailer pid 2720225 invoked by uid 1000);
 Wed, 14 Jul 2021 16:37:41 -0000
Date: Wed, 14 Jul 2021 10:37:41 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: fsl: add SKOV imx6q and imx6dl
 based boards
Message-ID: <20210714163741.GB2719790@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-4-o.rempel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 06:53:48 +0200, Oleksij Rempel wrote:
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

