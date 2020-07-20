Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB747226C36
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 18:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF0D89BFF;
	Mon, 20 Jul 2020 16:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AD789BFF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 16:49:30 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id e18so13881455ilr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 09:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XgKAKo+S7gA8PeWe+CXW+WfGrv348894snfv+irZlfo=;
 b=o4E1TlKXdiktMe1bbsDWMfaNw07AfIqyr3QQ908AoNAwIHkWOrM4RDERD0c6hUja/u
 x5oeNwxuyJ4uj+cBpRbao5+4lj9wyNxiFB5tNBsCMhouT7oeMwhQDaHWjBUuavDUa4kG
 8/WOeYoYFEWc9FSQjM9KkEqRCUmPZbJvzGbiOt9hurOENWkXHY3/C9yQEj8Jdw6Lsnvm
 N5W+v1QtqHdTsQtcJ+a792R639PtEB6iLiEdSFUXpNKeGgjPIOhj0T4LPPXkm3O8BhA7
 ri0Jj2Rnm0hT0+ScG+G5r7QayaW9ZG6BYq3Rl89hsmJRyPD6khGonGI5d2qtp/qNHE20
 XXTg==
X-Gm-Message-State: AOAM530VL6adYRu2ULwmikSPrvoR+PXlHy+0ZG2Hdi6SEMAyXZW0a7D+
 WvYWtgS7CRPYdYj95usEMA==
X-Google-Smtp-Source: ABdhPJyTRCVRoTuZGnQpzCTUrFO9tb3c0NKREz91tnGjrAlsvG4TZNieeaTudRx6yJwvSiggn1u7Iw==
X-Received: by 2002:a05:6e02:1043:: with SMTP id
 p3mr22878021ilj.245.1595263770294; 
 Mon, 20 Jul 2020 09:49:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a13sm9049380ilk.19.2020.07.20.09.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:49:29 -0700 (PDT)
Received: (nullmailer pid 2651900 invoked by uid 1000);
 Mon, 20 Jul 2020 16:49:27 -0000
Date: Mon, 20 Jul 2020 10:49:27 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: display: imx: add bindings for DCSS
Message-ID: <20200720164927.GA2650420@bogus>
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
 <20200717144132.2206-5-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717144132.2206-5-laurentiu.palcu@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jul 2020 17:41:29 +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Add bindings for iMX8MQ Display Controller Subsystem.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
