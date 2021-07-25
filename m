Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163233D4FD7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 22:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C48C6E24E;
	Sun, 25 Jul 2021 20:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64496E24E
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 20:20:38 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c97e1f6b-ed85-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 20:20:43 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 66657194B37;
 Sun, 25 Jul 2021 22:20:56 +0200 (CEST)
Date: Sun, 25 Jul 2021 22:20:35 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add QiShenglong vendor prefix
Message-ID: <YP3Hk9U78rNgtLCL@ravnborg.org>
References: <20210724103358.1632020-1-akawolf0@gmail.com>
 <20210724103358.1632020-2-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724103358.1632020-2-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artjom,
On Sat, Jul 24, 2021 at 01:33:56PM +0300, Artjom Vejsel wrote:
> Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
> QiShenglong is a Chinese manufacturer of handheld gaming consoles, most of
> which run (very old) versions of Linux.
> QiShenglong is known as Hamy.
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b868cefc7c55..52996cbf2cc4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -924,6 +924,8 @@ patternProperties:
>      description: Qi Hardware
>    "^qihua,.*":
>      description: Chengdu Kaixuan Information Technology Co., Ltd.
> +  "^qishenglong,.*":
> +    description: Shenzhen QiShenglong Industrialist Co., Ltd.
>    "^qiaodian,.*":
>      description: QiaoDian XianShi Corporation
The list shall be sorted, and qiaodian comes before qishenglong


>    "^qnap,.*":
> -- 
> 2.32.0
