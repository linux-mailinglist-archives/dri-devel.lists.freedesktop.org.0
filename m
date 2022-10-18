Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DF6025C3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BD510EEAD;
	Tue, 18 Oct 2022 07:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303DE10EEAD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:32:07 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 757C6580155;
 Tue, 18 Oct 2022 03:32:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 Oct 2022 03:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666078324; x=
 1666085524; bh=x8Kpf7Ca60+0626HPD6lKqagYPSPMGNpcqJHOsdVPg4=; b=c
 qk9JAMkhFYmJG+cxMVtlFC29ZG0OibbkpFqL8SZr4bKMbcs67y+kWVzwFJaxtngM
 lT72P28/DfFs69Srr9tJ02RUQS4XuaAP3kFB6kDCYWEI9bGIQ2Aw11EXoFVM31YJ
 swbwgfAI4nnwImpycgFBT0/Tf7iJ/5pwU5dzxFKF3sUOCiJ6EdqmkqH8HeS3+et/
 0/d9pOI8v1he405a00A5/dUCF4HP0rQFLrI8bj7daewvXohydhZzpixy1IW/H+ev
 ZffparVVjMse56F5unfod4bqNCdbGFIsc2GxM+T1m8Zkyrd3G6ADqPfYBq1kPe5G
 GtVRTXe2DnITFTQxeHH5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666078324; x=
 1666085524; bh=x8Kpf7Ca60+0626HPD6lKqagYPSPMGNpcqJHOsdVPg4=; b=d
 +yWVvqdRVhyutCeiw5LO0/K/MTbO/8W+XVxp/G+SDseiiq7JlVhJiyCUMSZMLLxR
 hCkvWqW7tLBSZvUbTUvk+xBJyUKz68bgAdSmgHSiFEWOufQuiTnvzunCdaxcYann
 5s6xSI9vUWeSO+1LC+uU63Ke35foc6dzOtMWDwGrBLK6lHId140UOz/e35uOeaxD
 EUDJfVJ7GECZQLMWdJ8cicQZjK0IsjHedu9QHuq8rna2B6LvqoYXTnxLNHxhUA4R
 jCTdceXycqdWFVkmr7j0zkRBNRTA3yDKwEenjrjEL0wSzf2PqX7ZVMlK6H5GrTDB
 zea7VndIybeSO2R/YEJ/A==
X-ME-Sender: <xms:c1ZOYx8gN6HMeSVgdKA6HlwKsdr3HeLers72Hu5Ejs1f2P1AVNvQVA>
 <xme:c1ZOY1uj3vGcWeketnDs2VH4131C7teDKwip9Wls_VOZjiDwUkQTjF6sSeMOEA-Hg
 9LzevIJsk49Q1y2PuM>
X-ME-Received: <xmr:c1ZOY_Cn03uydnBNw5bXHh65QI8_MN3Dw7GtZHfANNaBlxSEmq4vEGTBQPkv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeltddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c1ZOY1eNIxhB8puT_IYpNRUAXnuZBvz_0ObXFVLgNBPgzMZLK1J1iQ>
 <xmx:c1ZOY2MclzKYD2xBuaI0Wme__36uzx_8Ai2htL-zwps_1JpMm0-IIQ>
 <xmx:c1ZOY3mkAtRL6Wlks6k9uHB0KajRoIb2LdzNRngldBZO6Ri6Qkfbfg>
 <xmx:dFZOY-btamRaYp76W5Tjs6VR7RhBXTY4GoudmTotwJpoHZxGg1uDFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 03:32:02 -0400 (EDT)
Date: Tue, 18 Oct 2022 09:32:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
Message-ID: <20221018073201.hcptjdalvn47n25t@houat>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
 <20220815-rpi-fix-4k-60-v3-1-fc56729d11fe@cerno.tech>
 <890f6ab1-f6aa-76c8-01e8-f7233143d7ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <890f6ab1-f6aa-76c8-01e8-f7233143d7ec@gmail.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Emma Anholt <emma@anholt.net>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Florian

On Fri, Oct 14, 2022 at 12:43:38PM -0700, Florian Fainelli wrote:
> On 10/13/22 02:13, Maxime Ripard wrote:
> > A significant number of RaspberryPi drivers using the firmware don't
> > have a phandle to it, so end up scanning the device tree to find a node
> > with the firmware compatible.
> >=20
> > That code is duplicated everywhere, so let's introduce a helper instead.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/firmware/raspberrypi.c             | 7 +++++++
> >   include/soc/bcm2835/raspberrypi-firmware.h | 7 +++++++
> >   2 files changed, 14 insertions(+)
> >=20
> > diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberr=
ypi.c
> > index 4b8978b254f9..b916e1e171f8 100644
> > --- a/drivers/firmware/raspberrypi.c
> > +++ b/drivers/firmware/raspberrypi.c
> > @@ -311,6 +311,13 @@ static int rpi_firmware_remove(struct platform_dev=
ice *pdev)
> >   	return 0;
> >   }
> > +static const struct of_device_id rpi_firmware_of_match[];
>=20
> This shadows the same variable that is used later for matching the firmwa=
re
> driver and probe it as a platform_driver, what am I missing here?

I'm not shadowing the variable, but it's a forward-declaration.

Maxime
