Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF443E0784
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9961886A4;
	Wed,  4 Aug 2021 18:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73870886A4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:24:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2b590df2-f551-11eb-9082-0050568c148b;
 Wed, 04 Aug 2021 18:24:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5CD83194B00;
 Wed,  4 Aug 2021 20:24:31 +0200 (CEST)
Date: Wed, 4 Aug 2021 20:24:03 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Cc: thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net
Subject: Re: [PATCH v4 1/3] dt-bindings: Add QiShenglong vendor prefix
Message-ID: <YQrbQyEUeLC2UtdJ@ravnborg.org>
References: <20210804002353.76385-1-akawolf0@gmail.com>
 <20210804002353.76385-2-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804002353.76385-2-akawolf0@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 03:23:51AM +0300, Artjom Vejsel wrote:
> Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
> QiShenglong is a Chinese manufacturer of handheld gaming consoles, most of
> which run (very old) versions of Linux.
> QiShenglong is known as Hamy.
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>

This is already applied - see 

	f98f273f3a98 ("dt-bindings: Add QiShenglong vendor prefix")

in drm-misc-next.

	Sam

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b868cefc7c55..1d45a2d7a7bb 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -926,6 +926,8 @@ patternProperties:
>      description: Chengdu Kaixuan Information Technology Co., Ltd.
>    "^qiaodian,.*":
>      description: QiaoDian XianShi Corporation
> +  "^qishenglong,.*":
> +    description: Shenzhen QiShenglong Industrialist Co., Ltd.
>    "^qnap,.*":
>      description: QNAP Systems, Inc.
>    "^radxa,.*":
> -- 
> 2.32.0
