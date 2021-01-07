Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD072EC8E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9235989824;
	Thu,  7 Jan 2021 03:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937288981D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 03:10:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 823AE2229C;
 Thu,  7 Jan 2021 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609989023;
 bh=+qd4peApsQU6SUTyExxo2EJrZVjRPpbAM3e3LuXtF3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lxZwARMtCcOzSdmzSNzDI0HodQQjBd2JZvpJ3jGchCtWjXpXdxRTHo53XKrqSB6Il
 9P8u++irxbJ1MBPX7IHVOjyAaXZP0KPz+53Oc1J63gfi7WXXcqXVoJUZrREL/hSULe
 FpfVwfrxURU+TZVYkSQ9OyhabixGHEZ7oBMibko1KjFhURatmoJLwrzQselZNW0i+o
 puybmj6NVolDFDgAacmG5h/kx4WuXkm0ZQnr+0tYitdysLJLQR7PWOAuaGtgdIVrfx
 1MEcD/uKyMQ+PWbFpZ7a8JP15zvVzJ992V4jabdS0aHh8p4ZkslCVLV6je5t6auwb2
 YeEy/9of/qUAw==
Date: Thu, 7 Jan 2021 11:10:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 0/8] mainline Plymovent M2M and BAS board
Message-ID: <20210107031015.GR4142@dragon>
References: <20201207140939.31297-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207140939.31297-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, David Jander <david@protonic.nl>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 03:09:31PM +0100, Oleksij Rempel wrote:
> changes v7:
> - panel-simple.yaml: fix comments and part order
> - panel-simple.yaml: invent a product description for the Kyocera tcg070wvlq panel
> 
> changes v6:
> - do more panel-simple.yaml related cleanups
> 
> changes v5:
> - rebase against latest shawngup/for-next
> - add patch to fix checkpatch warning on PLYM2M dts
> 
> changes v4:
> - add PLYBAS board
> - PLYM2M: add touchscreen node
> - PLYM2M: add rename led nodes to led-x
> 
> changes v3:
> - use old style copyright text
> 
> changes v2:
> - fsl.yaml: reorder ply,plym2m
> - imx6dl-plym2m.dts: use hyphen instead of underscore in phy-clock
> 
> Oleksij Rempel (8):
>   dt-bindings: display: simple: fix alphabetical order for EDT
>     compatibles
>   dt-bindings: display: simple: add EDT compatibles already supported by
>     the driver
>   dt-bindings: display: simple: Add Kyocera tcg070wvlq panel
>   dt-bindings: vendor-prefixes: Add an entry for Plymovent
>   dt-bindings: arm: fsl: add Plymovent M2M board
>   ARM: dts: add Plymovent M2M board
>   dt-bindings: arm: fsl: add Plymovent BAS board
>   ARM: dts: add Plymovent BAS board

Applied all, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
