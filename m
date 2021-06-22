Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B23B0660
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 15:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231F6E155;
	Tue, 22 Jun 2021 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC746E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:59:51 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id n20so23806299edv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvpjBACzoV42mn66zZsleALOXDYyAjKfVllzcHMcfwM=;
 b=Wp1TqiybqZXzu69uHeEPGREFTO4HIBfR+ESJKgc0unJBPRzOBSE7xOgXcg8pCqdhI0
 l8CHinSE9Y/aEqHbLuiB6OSStiCxRY0Hn+tzuJawj+ViDwS02PWNcI/dvUNECQlf4i1J
 HSvmL13FTBydydk0Gb5/zUkalgf6J0ziuYZCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvpjBACzoV42mn66zZsleALOXDYyAjKfVllzcHMcfwM=;
 b=bcs/P/4jwEHZFfFLz4WYYW3jz8Lscp2mD+74U7XlU092w+p9bnc/1o8FowdzkJzhP4
 2pG+jYVhg1CvyD4SLf90qOHv9VlY45f9pq+NkztZa/e7hz/jjSya46yCz/zUWGrLks5K
 BpoQ2o2Xx34ZBOD0pRp3Pc8oygGdhaRpwBaTKXr9peQp4gcMKwB9Pn6ueY8SRzYc0PSx
 Qms+mybfvzm5+U7U1/B5XasFmE97JTucOI0UccnDXlWrHbd9Bo4hSaVO/r0qwtMO7eUU
 /OMul3Zy0zXe8Vs6TUCIXUqWNW+rwYFm2ONlm6vWGP387hxJeLE2vU9mPVUgti4BLd12
 wy5g==
X-Gm-Message-State: AOAM531eUNtXpsK+SM6PVUNHoiMoLE50DrrBi87nYdVqKZloGDgAr+fC
 htwLLZl3XiBuhLalURCzbD50Zgjw25UoPNcYwP3tKg==
X-Google-Smtp-Source: ABdhPJw/q9PxAXyZv2WBeIUBgEA/9dXP9RWMWTh4uf9ndcmWUOV/Ki10fp+3NvT1lHWph76Diq/QxzKIiaoVikN66Oo=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr172031edr.204.1624370390201;
 Tue, 22 Jun 2021 06:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-8-jagan@amarulasolutions.com>
 <CAHCN7x+RKuOwBEFC5ySHJuFiC26ZdYuv620+5FiTfrh-3y2-Lg@mail.gmail.com>
In-Reply-To: <CAHCN7x+RKuOwBEFC5ySHJuFiC26ZdYuv620+5FiTfrh-3y2-Lg@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 22 Jun 2021 19:29:39 +0530
Message-ID: <CAMty3ZCR7A76UfN98ffawET20D+nN5=EMmzosXu1G2vaNtBdfw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/9] arm64: dts: imx8mm: Add eLCDIF node support
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Tomasz Figa <t.figa@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 8:39 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Jun 21, 2021 at 2:25 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Add eLCDIF controller node for i.MX8MM.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index fe5485ee9419..5f68182ed3a6 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -1030,6 +1030,25 @@ aips4: bus@32c00000 {
> >                         #size-cells = <1>;
> >                         ranges = <0x32c00000 0x32c00000 0x400000>;
> >
> > +                       lcdif: lcdif@32e00000 {
> > +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
>
> Based on a comment I read from Marek [1] from this patch series for
> the driver, I think fallback compatible should be fsl,imx28-lcdif.
>
> "The iMX8MM and iMX8MN do not support the overlay plane, so they are MXSFB V4"
>
> [1] - https://patchwork.kernel.org/project/dri-devel/patch/20210620224834.189411-1-marex@denx.de/

Yes, I saw that, look like some conversation is going on that thread.
will update accordingly in next version.

Jagan.
