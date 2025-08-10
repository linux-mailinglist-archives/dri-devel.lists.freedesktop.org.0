Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88DB1FCCA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA36410E036;
	Sun, 10 Aug 2025 22:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A4r5NCpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A910E036
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754865956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zejlDygpGrwzEF/Tl2mTtzsn7pmvzE6JdbSkjCZTc90=;
 b=A4r5NCpNjnWcOhf+Q3yw7XW4o6xxHxJ26XMfmXWAD8OarF44I9xCAine4xkuef8WMI2G5z
 5NW08BvTXrrqce15x35qdXFEoPoShgdQqXu2UgfqxhWG6mYOZMgIqAkNmXN1W94hWzJxy7
 /25ciug/9duuP88IGTSGhGKnmAzaEWQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-KULjmFkbMpObeckLTcbarA-1; Sun, 10 Aug 2025 18:45:55 -0400
X-MC-Unique: KULjmFkbMpObeckLTcbarA-1
X-Mimecast-MFC-AGG-ID: KULjmFkbMpObeckLTcbarA_1754865954
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b06908ccacso92350781cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754865954; x=1755470754;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zejlDygpGrwzEF/Tl2mTtzsn7pmvzE6JdbSkjCZTc90=;
 b=J9SDgT4Z5XtZv/dHRi1mXalejeUw0H3as4tEXDKpfucmTIqcAVZ3xRBh/uB5oXRYtb
 RjGrMFEQUzs4Uos/x5EO2u4LdPD73Wu10G3oJnLOsvKKZGg6in6ri6S6eDmZTQg+9AD6
 x8qrUKPC/dQvITmvqH6NAB7knif4V3ETHfm6O5ygzuQV+tqfthDzvp2oaFhn/vtP4g3d
 ByxyAv5mh8sevuSVPh2+Mf2bpvVr0lVzb21JkyW+TTrV7zvr6+3hAWg1akPIsBXE2eA4
 W48ZdGk5FWyRIwzAhhpK8XLATCFnZz8hiOrCi4GXG+i8xmAcmp786RWk/3juT5wQai4O
 ZppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwOjJFjztxlotw1qVT1AFerJqYchd3vkGRDtvTOoFwnAKI2QBgYI2m/c0m6peL/llrep/psiDYX8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+R5gEsrvPKWpIXYax2X5ADMsXi0pfsajGLUS8FMPP6iFmZAzI
 w1cL8u22SntscGle0viDPT0xwt2lrDl2SlxwKCBLz2pOdmLMuxqHUDi40jVN0vwfL8PZoKGab4v
 VQ3eHBAxi2LX1ExcjQHMrp+kJsttoiW1ZRzL269BGM+X+oMPYBZmklRsYUiv2UI5qscemxg==
X-Gm-Gg: ASbGncuPW+kbWLLN8ODeMDq1Gn29qpq5RZzIEEBs2446b6ik0VuIW2pYS4zQq3yTlmO
 pzV1vKCLHomiqCcc/hYt2ESxx5XQUuqjNOZT4y/ugajaI+2l0zxRYGDmNyyQi9eMoS9OZkJrUhU
 w/4JFqLBVSVpyY6X1dtrsP3tMgJGnR5fg0v2lGmSW4bYkuB0+mvkqZPSQGiVFxqfAdnPQcglNsm
 ssc8sUtyRRv1OL6U2yWfMQakszKvD0fYAeaTtyTdk5BUNarsdRZiOkUeIXIirgFNqlssFG2+C14
 wJ950Lk0vppOGLo2wHo4MwXourrJqiyOm2oweh9iyVgr7EkLpHgOAsAflaSBTXHW0wNGSDk0h39
 s0YSVIQ==
X-Received: by 2002:ac8:5992:0:b0:4b0:743a:b4f0 with SMTP id
 d75a77b69052e-4b0aedf6b1amr162625151cf.41.1754865954324; 
 Sun, 10 Aug 2025 15:45:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMMVuRi+pB2hB00rh/4lBT2A6xNejEN6UKRgkLWeOvqElbSCAZq0WUzWxXHj0FePs3qQpk7g==
X-Received: by 2002:ac8:5992:0:b0:4b0:743a:b4f0 with SMTP id
 d75a77b69052e-4b0aedf6b1amr162624811cf.41.1754865953842; 
 Sun, 10 Aug 2025 15:45:53 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:45:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/9] phy: convert from clk round_rate() to determine_rate()
Date: Sun, 10 Aug 2025 18:45:28 -0400
Message-Id: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAghmWgC/x3MQQ5AMBBA0avIrE1SDRquIhYNU52QkilCxN01l
 m/x/wORhClCmz0gdHLkNSToPIPB2zAR8pgMWulKmULh5m8clhllPcKIYnfC0lpDrqiVowZSuAk
 5vv5p17/vByfwFxlkAAAA
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=5842;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=aLGfKmyNU+bomSynOaLohW6Y59bxgPyE9ULfin1cZyo=;
 b=O9IhL3QDOUiwO05Lg7AXKinAxwzs6mf8jMpnbEWniYrx2Csle3lF/NzYZAfa6oTvLYjtyMKTB
 35n8Z5Wp2HwCqzPx1ryQAePsX3611g3M7mBqcbq1xRSaFHhbzl6z6wG
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l43ccluIDDlN1FHZ4s_SEhwlgo-5_rmx3asREgf5St0_1754865954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 68 insertions(+), 54 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

