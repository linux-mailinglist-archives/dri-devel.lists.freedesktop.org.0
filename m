Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDE3DFC1A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 09:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53666E9F2;
	Wed,  4 Aug 2021 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949A56E9F2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628062222;
 bh=P4wBvc85h3fXlWdQcXelaLmQpD4A4GD47g72UVNj57I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MY1RIEdV/YTZijOtU6ffuHajpvE/20+zoOy4oMIA9PMA3e8aXwTzaWPC7MBwPQv9v
 zxZzXV80UaXChtfhqATFIYAKu67BsJ6Bz3v1inyeOEs2eNHmfydh/xW8GT3DvjbbGy
 U9jSZDDOEcU1R6ZK2AfZFBmrKJZJ899NQx7CctXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.17] ([217.61.147.17]) by web-mail.gmx.net
 (3c-app-gmx-bap67.server.lan [172.19.172.67]) (via HTTP); Wed, 4 Aug 2021
 09:30:21 +0200
MIME-Version: 1.0
Message-ID: <trinity-a5eeacb8-1625-4111-b613-19ee1609b902-1628062221917@3c-app-gmx-bap67>
From: Frank Wunderlich <frank-w@public-files.de>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>, Yongqiang
 Niu <yongqiang.niu@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: Aw: [PATCH v8, 2/2] soc: mediatek: mmsys: Add mt8192 mmsys routing
 table
Content-Type: text/plain; charset=UTF-8
Date: Wed, 4 Aug 2021 09:30:21 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
References: <1627894773-23872-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627894773-23872-3-git-send-email-yongqiang.niu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:FTFMR063lUiqNFEXMYKR9Nt6kBJb+tvRQII2gEh1asf4eB17tIoXkk2zLgq9ZD1OfoZwa
 zwQa5mpCvFQBtgET6CZ/J7NtfPT9Bk8eILs7hs9zUEJ356V/YkowKCFFYgFuC5vh804RgGRtvI7S
 nN/4NVGY4SKwh3JwOyAbL5N6eyxGAapF+Qt7UbVMzOun+eMRCx/q2qjqlGp3A92+tmr3Oxt4iFpr
 WxfpR8duyZViNpCMnmrdQSeLBnDM9/A+UnMfbmH4lXNI18H4pcGPM373s5b5GEWpkg89+mJ5Ihsq
 mQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pe3B7hYMLN8=:xYFKFGHPzPUBrVYDFk7erl
 jCyPvToDYyqeGdTfuO5erRCplUODZQ2TuJJTXrNllkHHVX+Q/xgVq0GKWHQV3KLGEreWxpo7d
 XuU/FRHqPq7uKnltpXonljHTWVPtSv+lp2tPV0+wDrTSU5vYIsrnacPtTmNg2KfT2xbuSKBIJ
 g35lTXsvY70UqFgAtB5vAwdu6cvSdM1vEZFeBpbdJDDdPdVRnh77ajOPurEJTqVU+MO3PlP6e
 VkRPJx0RikfPKW7fd6qRXqGal/KDecSIIxzjFCltzjLYdiYF+XRYwOzKeSGR95hMMMggCdMz8
 iYtXCF1kkmI1b/gGBNPqktDysHJYfO6xC1mUr7zdhtpxS70PkdPdSKP/S/Q2PmzlrXpIPaPdv
 7F3/a30PnTmhxNZElXqCoFQJbFirK3s7LfuzbysOw5tuaTZpqF122rvWqEY6z/RdKlKIxsYKW
 wPieYJYeNVnxgFZkdRfMjwEANhdYzIJkXUaiFwOKT4OydA9m1lie++9HLB7/ew7Irdhr/+2rI
 7xhz9zJtLT2d4i/64rW2kLhXWhraE7ZVKhbJtN21MRQ2eGC/VjY1ItEqfKl14UyNEL/CA/1ps
 FlNKtiSJATQq/OkmLx0fiub23Mve1SBSNWj3XfP8ZsLlAIXg86oaBmnaaTyK3av+huAJ2RRtC
 uZCpWZVNQUG02nrYcaOWBMtHWW3s4s/QfEcDp6rD05SgwQxnB04FXWgv3u8pDFGevUh4Xiu71
 iiUOreyBgptkJa63QoxIL6RfHndWbwa8g8Cu+gMb6g4gxL2i7vV5zVXWV2oln6MXZt5fAtt5a
 Dbie10PssSR6fDvZdVRpeDDnnoQ4EbTxssHUiZY1tjOlujPB48=
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

Hi

can you please test if your device still work after applying this

https://patchwork.kernel.org/project/linux-mediatek/patch/20210729070549.5514-1-linux@fw-web.de/

and

duplicate value constants in your routes?

e.g. changing

+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,

to

+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_2L_MOUT_EN, MT8192_OVL0_MOUT_EN_DISP_RDMA0,
+		MT8192_OVL0_MOUT_EN_DISP_RDMA0

regards Frank
