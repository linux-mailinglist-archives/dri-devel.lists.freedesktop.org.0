Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FE41F1F6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1D96EE5B;
	Fri,  1 Oct 2021 16:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9F6EE5B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:16:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E74DC611C8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633104998;
 bh=y6gzPCzFEYqWjJJZ50x5Nvv9YaW/g8C/t7SEwVGfOeo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A3vJUua3qv0olCxPYV+rKXGZY0J1+aD7s4GLptNBqNg7xfMSKygmAJJH3HM813Len
 A/x1Kogqu1zhd3cY0ZSRNE6zOs8T3HVkTlsiM4lxlzsiLnV7IKSruS1RYyv1S7xnlw
 yFOpHPKsvSEabe9nWI2YBEyC0nK86nTXCDDGMsJO3CWbsl2QMBJmKuRSC1S6gD0Fm5
 voWSnpmbNVFIx2JBDQzounpMqZ/YvBRKFvpsyjIMJUKmWOfjyMIOVyNF28pI0r1HF0
 nclBwPdiaZYeC2kasU+jTdv/DFX6xO7/0vPNi97c9SNyH7T9A5n55S/vd0ODFlqa+W
 57hjOajLtEPPQ==
Received: by mail-ed1-f52.google.com with SMTP id dn26so36567907edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 09:16:38 -0700 (PDT)
X-Gm-Message-State: AOAM531OqjWjGpYXbto8SA1Y1weS7dQmgs+qfeMuBgYNNoGgSzM4+8ls
 QDvlIUjWgc1PyAOIfdr2SQXrL0yNiPZuE3oSdA==
X-Google-Smtp-Source: ABdhPJyAcVVeRZ5bgKNb/3DzdkplX2GlSIaFLY0Nq7ZaQMn1jHN3Guv20jQFVddPTQdYdEjMDfZCWZ8HPwg2W8djkZM=
X-Received: by 2002:a05:6402:40c5:: with SMTP id
 z5mr12424387edb.272.1633104997391; 
 Fri, 01 Oct 2021 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211001094443.2770169-1-msp@baylibre.com>
 <20211001094443.2770169-7-msp@baylibre.com>
In-Reply-To: <20211001094443.2770169-7-msp@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 2 Oct 2021 00:16:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
Message-ID: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/mediatek: Add mt8195 DisplayPort driver
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Markus:

Markus Schneider-Pargmann <msp@baylibre.com> =E6=96=BC 2021=E5=B9=B410=E6=
=9C=881=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:44=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
>
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
>
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
>
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>
> Notes:
>     Changes v2 -> v3:
>     - Solve TODOs and add defines for undescribed registers
>     - Remove TODOs that were irrelevant
>
>     Changes v1 -> v2:
>     - Fix checkpatch --strict suggestions
>     - General cleanups of the code.
>     - Remove all remaining non-atomic functions.
>     - Remove unused includes and sort them.
>     - Remove unused select GENERIC_PHY
>     - Rename phy registers DP_PHY -> MTK_DP_PHY
>     - Replace usage of delays with usleep_range.
>     - Split the phy register accesses into a separate phy driver.
>     - Use a lock to guard access to mtk_dp->edid as it can be allocated/u=
sed/freed
>       in different threads
>     - use struct dp_sdp for sdp packets.
>
>     Changes RFC -> v1:
>     - Removed unused register definitions.
>     - Replaced workqueue with threaded irq.
>     - Removed connector code.
>     - Move to atomic_* drm functions.
>     - General cleanups of the code.
>     - Remove unused select GENERIC_PHY.
>
>  drivers/gpu/drm/mediatek/Kconfig       |    7 +
>  drivers/gpu/drm/mediatek/Makefile      |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c      | 2825 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  535 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>  drivers/phy/mediatek/Kconfig           |    8 +
>  drivers/phy/mediatek/Makefile          |    1 +
>  drivers/phy/mediatek/phy-mtk-dp.c      |  218 ++

Separate the phy driver to another patch because phy driver would go
into different maintainer's tree.

Regards,
Chun-Kuang.

>  include/linux/soc/mediatek/mtk-mmsys.h |    2 +
>  10 files changed, 3600 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>
