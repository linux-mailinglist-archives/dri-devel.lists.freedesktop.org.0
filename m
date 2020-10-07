Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6C728624A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046536E90F;
	Wed,  7 Oct 2020 15:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393106E23B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 08:35:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C5nhf5gR0z1sQD8;
 Wed,  7 Oct 2020 10:35:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C5nhf4MY8z1qrgF;
 Wed,  7 Oct 2020 10:35:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id YViC8uo_oPbd; Wed,  7 Oct 2020 10:35:13 +0200 (CEST)
X-Auth-Info: fB9tZzc3EIT7DFAqbGTUq4PwqJQwXM27W4tpl9oJPUo=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Oct 2020 10:35:13 +0200 (CEST)
Subject: Re: [PATCH v2 2/7] dt-bindings: display: mxsfb: Add and fix
 compatible strings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-3-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <37a5b6ba-f328-bd16-6e39-3e1aa5a8e163@denx.de>
Date: Wed, 7 Oct 2020 10:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007012438.27970-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/7/20 3:24 AM, Laurent Pinchart wrote:

[...]

>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx23-lcdif
> -      - fsl,imx28-lcdif
> -      - fsl,imx6sx-lcdif
> -      - fsl,imx8mq-lcdif
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-lcdif
> +          - fsl,imx28-lcdif
> +          - fsl,imx6sx-lcdif
> +      - items:
> +        - enum:
> +            - fsl,imx6sl-lcdif
> +            - fsl,imx6sll-lcdif
> +            - fsl,imx6ul-lcdif
> +            - fsl,imx7d-lcdif
> +            - fsl,imx8mq-lcdif
> +        - const: fsl,imx6sx-lcdif

You can also add fsl,imx8mm-lcdif into the list if you want, i.MX8MM has
LCDIF V4 too.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
