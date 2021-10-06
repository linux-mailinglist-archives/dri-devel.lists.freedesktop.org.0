Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E489424192
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FB06ED7E;
	Wed,  6 Oct 2021 15:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0886ED64
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633514001; x=1665050001;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:in-reply-to:references: message-id;
 bh=RzK8Z4XWzA9gepJluNel//xwbbmFJP3zMlyC59rtTf0=;
 b=CrrSJ/BOF8lV+/j6m1nqoz4vtxc9Pg7AIvb8vTsOw9iMmDNulU4aP1nT
 URIfLQ9AW2xP92bNdriaTRQlmQxhzm5JniscBPr4ZMas1IfHu02SscaF4
 no+zVst23lwg5oV0vXbSrJk0+QN+scNxJrzJitMR53GYWoH1VtMMvsVbq
 JnCI/SIU0cwf6b14HA8E4ckKCbW+f3DRVIukBkX6IWd2BxHOUtQwR1xVJ
 fwyiQAf6JMD6bRHPiS3LZTPHNMt6to637CpIKyj2H6VK46V8h7nRcKbY5
 98XtrPlbrMWDtaKmu2aZJutarouyNy3ZcICMWpLWuWRpZVRXeRrrI+eIn Q==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19892311"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Oct 2021 11:53:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Oct 2021 11:53:19 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Oct 2021 11:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633513999; x=1665049999;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:in-reply-to:references: message-id;
 bh=RzK8Z4XWzA9gepJluNel//xwbbmFJP3zMlyC59rtTf0=;
 b=AIH1q92NA4D6F9ETEs4tOfwF6kQtpl1cXHbh1HL1wcscin6IOsV+G0jD
 5eO7o0VoBWI3lkd5ubWgAS5C2uBDfFBC243qTgf4mu3HIFylo54ZBAD+g
 zhngBap6U8Hyv/ws+rGazt16aJKGvfjzAWhyD8off5zqTxIFNXerNX/9R
 zhuKe9Z/ZvzafsZKink+0zBh+hjEdbegdtiEn3b8/M18VH/LhDw8YCIbz
 NQp1jjQQnCnGzZI3t1vMP9CAJjU4UB+foydbcN4GQUyKY439NlXXUAm7W
 c0IA75la7xsF4Wcw1qdORzKZ9O0L9anrDtoIzhk5BYzgfkRyBNg4rv8/f g==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19892310"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Oct 2021 11:53:19 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id 8C980280065;
 Wed,  6 Oct 2021 11:53:19 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Wed, 6 Oct 2021 11:53:19
 +0200
Subject: AW: (EXT) [PATCH] dt-bindings: display: bridge: sn65dsi83: Make
 enable GPIO optional
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 =?us-ascii?Q?dri-devel=40lists=2Efreedesktop=2Eorg?=
 <dri-devel@lists.freedesktop.org>
Cc: =?us-ascii?Q?devicetree=40vger=2Ekernel=2Eorg?=
 <devicetree@vger.kernel.org>, 
 "Rob Herring" <robh@kernel.org>, Marek Vasut <marex@denx.de>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Date: Wed, 6 Oct 2021 09:53:19 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211006091624.6293-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211006074713.1094396-3-alexander.stein@ew.tq-group.com>
 <20211006091624.6293-1-laurent.pinchart+renesas@ideasonboard.com>
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.Nro65tfmTzKn1JUMsvfb+w.gFG0/Ze61wE@vtuxmail01.tq-net.de>
X-Mailman-Approved-At: Wed, 06 Oct 2021 15:43:56 +0000
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

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
> means not available to the kernel. Make the GPIO optional.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 07b20383cbca..a5779bf17849 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -93,7 +93,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - enable-gpios
>    - ports
> =20
>  allOf:
>=20
> base-commit: 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander
