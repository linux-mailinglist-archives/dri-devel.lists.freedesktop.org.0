Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067134C018
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45B889A98;
	Sun, 28 Mar 2021 23:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406D989A98
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:47 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id c4so10941049qkg.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1EIk4YVKhOnAZImQsN2ZKDY/BZ5VFtnbICpb2ytuZw=;
 b=dYzr6KWh4SK2C8ze1rrsjBDcu+hcBxWGkb1HkW+qd+/dV31vd3A3Ee2Vxu4ZavXqnU
 o8NDQ+MysLv2Em5XbQ1laoO0P8vfDo77vfaElmp1/5MVQKkCU4xkYBZR1Y8MPoqMfo6V
 0ko2b1t/YU/AM1SxeZ+mvKZbA/x6XJ6/kteEuByX/qo+qxxZ6LTZgy9ICZUMbPMGWoNd
 UclUSFoR61rQ9kcGDjvMWAIuCwmuY+iSBQs/83RVR6BF2KMyUhMQ4juCkRyTGV1Haspm
 asUV/RoPmdZFZFpoRySHsNo2MW5LLW2WQLM3f1CKrl3Ao9QZR9avs1tE9a+FJ+MwI3Vx
 lRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1EIk4YVKhOnAZImQsN2ZKDY/BZ5VFtnbICpb2ytuZw=;
 b=JOHyqmPlm1TZMGtL01ykP/TqwKge3EoLabF/k4mOzAOAFPO2FS/eH57OKhcWspBbFP
 oAnVeYalxSSi/sJGmCrvnQbmpH3Qb1++vG104Mafl3FMJAP0lwFaqIN79Buu5Giaufhn
 5lFpyiiUz9/sNN0n7M56t6QcuLv0KCfem6lc87i/CzypIKSOoUrYUWfMrOnKwOU6YRWv
 tBoHaogFhkdaTvhXhB8iwnJ2BlniEqe9//jBhiTu9cCEkqMd0t5JNTfv+cay/ikvFkgP
 WlwBg0K2Urt767IXV4mDxqfFnSHjwwi75QPGwNEVZoGLpM0cK07B0MHp3vF/mYoWqKOM
 l3Qw==
X-Gm-Message-State: AOAM532R455rJw8shaUi3b0/LQqgYbTzGsZ4wUO9dL4/qoVZj10K7I6p
 4DuEDXukvf2XJOQIC8QJWkU=
X-Google-Smtp-Source: ABdhPJw/RMK7vmZ45zLUGVxo30c6mvRq7joodocZ04PQOyJJPRklWL/yJc/aDwzeJa2I3aVqupZvhQ==
X-Received: by 2002:a05:620a:2116:: with SMTP id
 l22mr22838891qkl.377.1616975866552; 
 Sun, 28 Mar 2021 16:57:46 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 22/30] at_hdmac_regs.h: Couple of typo fixes
Date: Mon, 29 Mar 2021 05:23:18 +0530
Message-Id: <a588f9e9c32c5af24570ea04c4cd460fb3958147.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/availlable/available/
s/signle/single/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/at_hdmac_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
index 4d1ebc040031..46ecc40edaa8 100644
--- a/drivers/dma/at_hdmac_regs.h
+++ b/drivers/dma/at_hdmac_regs.h
@@ -338,7 +338,7 @@ static inline u8 convert_buswidth(enum dma_slave_buswidth addr_width)
  * @ch_regs: memory mapped register base
  * @clk: dma controller clock
  * @save_imr: interrupt mask register that is saved on suspend/resume cycle
- * @all_chan_mask: all channels availlable in a mask
+ * @all_chan_mask: all channels available in a mask
  * @dma_desc_pool: base of DMA descriptor region (DMA address)
  * @chan: channels table to store at_dma_chan structures
  */
@@ -462,7 +462,7 @@ static inline int atc_chan_is_cyclic(struct at_dma_chan *atchan)

 /**
  * set_desc_eol - set end-of-link to descriptor so it will end transfer
- * @desc: descriptor, signle or at the end of a chain, to end chain on
+ * @desc: descriptor, single or at the end of a chain, to end chain on
  */
 static void set_desc_eol(struct at_desc *desc)
 {
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
