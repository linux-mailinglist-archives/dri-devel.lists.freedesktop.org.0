Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55769A8D3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E86210EF3A;
	Fri, 17 Feb 2023 10:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D8810EF3A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676628318; x=1708164318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDRB4V/WoLVz8zYORx7TuyiPxgZ17+/h0wbi/slU0+g=;
 b=GOW3tJ+xg2BJ8Wxmo9My1h9mjPsSYR1Hpkq09oosnq1hmgPYSsK1GzDV
 wGSk2yxSIG6jHQDDIkWLhsLT3pwG6kay9GjvHdD6j7wEryEvH05EWnzgB
 NNXap3wC6Y1RhT7JsGr5O1MUToObKkLdDPfOBh3rAolJVC2nGiWpx46ZF
 /GXWblzOP89thG3/WDEWIzYxjBvM+f2ghY+Inc3g8klicX4TCA0lPIjuF
 2yXjmCREqXrnmQ30IexnEYd4YISEkxOU/0I7vbhcamdxhrjI8ipCNPKsM
 7wIpWtZYlmk9RZxFVGHr3JPqq4Z/LCrrJ1+e+geNrD1w0LjMRfW3evv+8 A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29152557"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 11:05:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 17 Feb 2023 11:05:16 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 11:05:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676628316; x=1708164316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDRB4V/WoLVz8zYORx7TuyiPxgZ17+/h0wbi/slU0+g=;
 b=fgu8Srcl2LUVFfApkduI2zcNIoQGJvEV2sdXR2Bg/LtREg4uMnpJJc+O
 gDxCcMtAi+6JKs1wtU9KJEba1x6TqVm1jT59DKHTSl2qfZjAsUDwiLhXt
 E4NM0Tl8WyQl+odIzSw81A3cHXraS4tSoefaNnOXLPyeoo6e9Ssv0nb8E
 IdiK26WLblCmdHlEPc/JNexpHDDnFVuPNRJIJmWkj1ZnQe39j/pK/BfJS
 8REwPLmZcB+0YZ4w0Isx6FDvgToeAkD5d11yYDFwx1ZwHd9FfVJpgtuto
 4iGsncfVNUG7ky/PxWyfShFHER13FE5uNJ1fjE65TXTp9AZAVSfZo7I46 A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29152556"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Feb 2023 11:05:16 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 120AA280056;
 Fri, 17 Feb 2023 11:05:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Date: Fri, 17 Feb 2023 11:05:15 +0100
Message-ID: <9068722.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <25ae1824-4f00-4337-4512-0d8190981fb6@prevas.dk>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
 <25ae1824-4f00-4337-4512-0d8190981fb6@prevas.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, matteo.lisi@engicam.com,
 sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, kyungmin.park@samsung.com,
 linux-imx@nxp.com, andrzej.hajda@intel.com, m.szyprowski@samsung.com,
 aford173@gmail.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 17. Februar 2023, 09:55:22 CET schrieb Rasmus Villemoes:
> On 14/02/2023 12.09, Fabio Estevam wrote:
> > Hi Rasmus,
> >=20
> > On Tue, Feb 14, 2023 at 7:55 AM Rasmus Villemoes
> >=20
> > <rasmus.villemoes@prevas.dk> wrote:
> >> Well, the data sheet for the dsi86 says up to 750MHz DSI HS clock, and
> >> if the value specified in samsung,burst-clock-frequency is twice the D=
SI
> >> HS clk, I suppose I should be good up to 1.5GHz? I have tried many
> >> different values, but I never seem to get anything through; I think I'm
> >> missing some piece.
> >>=20
> >> So now I've tried to use these patches on the imx8mp-evk with the
> >> mipi->hdmi accessory from NXP, just to see if I can ever get any
> >> graphics through the mipi interface. And there the story is the same:
> >> the adv7535 bridge gets probed, and can read out the edid from the
> >> monitor over hdmi. And while the mipi block and the bridge seem to
> >> attach to each other, I still don't get any output.
> >>=20
> >> Do any of you happen to have this working on the imx8mp-evk, and if so,
> >> can you share the .dts updates you've done and how exactly you test the
> >> graphics?
> >=20
> > I don't have access to an imx8mp-evk, but I tested the ADV7535 MIPI to
> > HDMI daughter card on an imx8mm-evk.
> >=20
> > Some extra ADV7535 patches were needed. Please check patches 0020-0023
> > and see if they help.
>=20
> Thanks, but they don't seem to make a difference.
>=20
> I've started trying to simply compare registers between the NXP 5.15
> kernel and the imx8mm-dsi-v12 branch with Marek's patch on top. Already
> in MEDIA_BLK_CTRL, 0x32ec0000, there's something interesting:
>=20
>  ## Media Mix Clock Enable Register
> -CLK_EN                 0004    0080e133
> +CLK_EN                 0004    00800133
>  ## MIPI PHY Control Register
> -MIPI_RESET_DIV         0008    40030000
> +MIPI_RESET_DIV         0008    00020000
>=20
> So with the NXP kernel, there are three bits set in CLK_EN which are not
> set with the "mainline", but those bits are marked reserved in the RM,
> so I have no idea if they are just some RO bits that get set due to some
> other munging. Then there's the MIPI_RESET_DIV register where bits 16
> and 30 do not get set. Of course, there are lots of other differences,
> but perhaps this gives somebody an idea.

Looking at drivers/soc/imx/imx8m-blk-ctrl.c the bits for MIPI_RESET_DIV are
16: MIPI_CSI1
17: MIPI_DSI
30: MIPI_CSI2
So i think that's okay here.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


