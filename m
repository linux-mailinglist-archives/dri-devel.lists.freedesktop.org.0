Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35731144D7E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB4E6FADE;
	Wed, 22 Jan 2020 08:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66DA6EDED
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 23:41:33 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z193so4750930iof.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zm1wsMsip18Uq3we45CeeUiLmXWcsvTs9fWxXZcq9Gs=;
 b=oqRTuQB9fbHn80YjyVxHKWegylJGGq2mlu5KGTXOtXieaJAC+N0MpZA95mOJQQRK7x
 eYyswEO2cTaZN5oQVXOrQg/eKY6ZKXlP6c470wruzVUlS5BNgy0SCFvN8G+Pn5Ae4wk0
 sOaN8xT9DVAtn/gqjBfEEO1Y1U7TgzAJ5ATUhtDp+wN8wc6hmcy16IUPOJDBKA0C6VQw
 qRDrbQ3xQGqt8/hBtJxGxPC7OgdBSCAlO/RFrsS/c4o/TYWN7oDSITUA8nCfVF5YuIa6
 qYfXXQOqSfIKgCL5owmAsbwLvC/vLTgjidTxEWIQOjagx4n2sKmF3pJ8iazcg16Ejmg4
 medg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zm1wsMsip18Uq3we45CeeUiLmXWcsvTs9fWxXZcq9Gs=;
 b=HqxHH/FEQPJXsRRn5zIAGljXLJBa9yS2tUvOrZHqNSiJO3pHZAMci8ZBrvdnbDSK5w
 NCOUU1/3X11e9Scw/4Z7TtW5fC8iRcqcgzzAzf367luogBCHbiBgSSG+mrHPD7yz5q8V
 qBYTEIhOtecE6z5TpE2XQtL4CS9rimrweJWoLrvg2Sg23MSZlTme3R2vRPnBMXu9YLLw
 begVSdDtflxcRUVTp1Z/YsEvbgnNf4kIO0pRKpzlFOcHHxqyuGCtxcD2Crx85UfrRvNJ
 TTDHw98zw/S/fQzrUUMYR2JiqhSakFtEm7Z+7COxJU28Dhsq9T+nqh4UhZNztmd2cinE
 vBjw==
X-Gm-Message-State: APjAAAVula9Ok6XxdnoF7LqXQndaoBmoNMo0JNAbX3aFqZjDLBrb5O0S
 phXCcPdPXdAymde4mjF1RT5DBCIWgbLbLAi1iU4=
X-Google-Smtp-Source: APXvYqyeTzMq49vnb9fLjPE3VJu6gH3vnQ+4wN5vSX/y4iE1xbVpjr2I75eGSAovrTjl59h0zkm+wRjoIolyw4oNkm8=
X-Received: by 2002:a05:6638:a2c:: with SMTP id
 12mr5240952jao.60.1579650092934; 
 Tue, 21 Jan 2020 15:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
 <20200121200011.32296-3-kdasu.kdev@gmail.com>
In-Reply-To: <20200121200011.32296-3-kdasu.kdev@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Tue, 21 Jan 2020 18:41:21 -0500
Message-ID: <CAC=U0a2_FvocPthU6LLYxVRcxfqC+prQVqsK9n8xD0+mU_6Ddw@mail.gmail.com>
Subject: Fwd: [PATCH V2 3/3] mtd: rawnand: brcmnand: Add support for flash-edu
 for dma transfers
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, 
 Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Legacy mips soc platforms that have controller v5.0 and 6.0 use
flash-edu block for dma transfers. This change adds support for
nand dma transfers using the EDU block.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 296 ++++++++++++++++++++++-
 1 file changed, 290 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1a66b1cd51c0..61347607f1da 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -102,6 +102,45 @@ struct brcm_nand_dma_desc {
 #define NAND_CTRL_RDY                  (INTFC_CTLR_READY | INTFC_FLASH_READY)
 #define NAND_POLL_STATUS_TIMEOUT_MS    100

+#define EDU_CMD_WRITE          0x00
+#define EDU_CMD_READ           0x01
+#define EDU_STATUS_ACTIVE      BIT(0)
+#define EDU_ERR_STATUS_ERRACK  BIT(0)
+#define EDU_DONE_MASK          GENMASK(1, 0)
+
+#define EDU_CONFIG_MODE_NAND   BIT(0)
+#define EDU_CONFIG_SWAP_BYTE   BIT(1)
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define EDU_CONFIG_SWAP_CFG     EDU_CONFIG_SWAP_BYTE
+#else
+#define EDU_CONFIG_SWAP_CFG     0
+#endif
+
+/* edu registers */
+enum edu_reg {
+       EDU_CONFIG = 0,
+       EDU_DRAM_ADDR,
+       EDU_EXT_ADDR,
+       EDU_LENGTH,
+       EDU_CMD,
+       EDU_STOP,
+       EDU_STATUS,
+       EDU_DONE,
+       EDU_ERR_STATUS,
+};
+
+static const u16  edu_regs[] = {
+       [EDU_CONFIG] = 0x00,
+       [EDU_DRAM_ADDR] = 0x04,
+       [EDU_EXT_ADDR] = 0x08,
+       [EDU_LENGTH] = 0x0c,
+       [EDU_CMD] = 0x10,
+       [EDU_STOP] = 0x14,
+       [EDU_STATUS] = 0x18,
+       [EDU_DONE] = 0x1c,
+       [EDU_ERR_STATUS] = 0x20,
+};
+
 /* flash_dma registers */
 enum flash_dma_reg {
        FLASH_DMA_REVISION = 0,
@@ -167,6 +206,8 @@ enum {
        BRCMNAND_HAS_WP                         = BIT(3),
 };

+struct brcmnand_host;
+
 struct brcmnand_controller {
        struct device           *dev;
        struct nand_controller  controller;
@@ -185,17 +226,32 @@ struct brcmnand_controller {

        int                     cmd_pending;
        bool                    dma_pending;
+       bool                    edu_pending;
        struct completion       done;
        struct completion       dma_done;
+       struct completion       edu_done;

        /* List of NAND hosts (one for each chip-select) */
        struct list_head host_list;

+       /* EDU info, per-transaction */
+       const u16               *edu_offsets;
+       void __iomem            *edu_base;
+       unsigned int            edu_irq;
+       int                     edu_count;
+       u64                     edu_dram_addr;
+       u32                     edu_ext_addr;
+       u32                     edu_cmd;
+       u32                     edu_config;
+
        /* flash_dma reg */
        const u16               *flash_dma_offsets;
        struct brcm_nand_dma_desc *dma_desc;
        dma_addr_t              dma_pa;

+       int (*dma_trans)(struct brcmnand_host *host, u64 addr, u32 *buf,
+                        u32 len, u8 dma_cmd);
+
        /* in-memory cache of the FLASH_CACHE, used only for some commands */
        u8                      flash_cache[FC_BYTES];

@@ -216,6 +272,7 @@ struct brcmnand_controller {
        u32                     nand_cs_nand_xor;
        u32                     corr_stat_threshold;
        u32                     flash_dma_mode;
+       u32                     flash_edu_mode;
        bool                    pio_poll_mode;
 };

@@ -657,6 +714,22 @@ static inline void brcmnand_write_fc(struct
brcmnand_controller *ctrl,
        __raw_writel(val, ctrl->nand_fc + word * 4);
 }

+static inline void edu_writel(struct brcmnand_controller *ctrl,
+                             enum edu_reg reg, u32 val)
+{
+       u16 offs = ctrl->edu_offsets[reg];
+
+       brcmnand_writel(val, ctrl->edu_base + offs);
+}
+
+static inline u32 edu_readl(struct brcmnand_controller *ctrl,
+                           enum edu_reg reg)
+{
+       u16 offs = ctrl->edu_offsets[reg];
+
+       return brcmnand_readl(ctrl->edu_base + offs);
+}
+
 static void brcmnand_clear_ecc_addr(struct brcmnand_controller *ctrl)
 {

@@ -926,6 +999,16 @@ static inline bool has_flash_dma(struct
brcmnand_controller *ctrl)
        return ctrl->flash_dma_base;
 }

+static inline bool has_edu(struct brcmnand_controller *ctrl)
+{
+       return ctrl->edu_base;
+}
+
+static inline bool use_dma(struct brcmnand_controller *ctrl)
+{
+       return has_flash_dma(ctrl) || has_edu(ctrl);
+}
+
 static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
 {
        if (ctrl->pio_poll_mode)
@@ -1299,6 +1382,52 @@ static int write_oob_to_regs(struct
brcmnand_controller *ctrl, int i,
        return tbytes;
 }

+static void brcmnand_edu_init(struct brcmnand_controller *ctrl)
+{
+       /* initialize edu */
+       edu_writel(ctrl, EDU_ERR_STATUS, 0);
+       edu_readl(ctrl, EDU_ERR_STATUS);
+       edu_writel(ctrl, EDU_DONE, 0);
+       edu_writel(ctrl, EDU_DONE, 0);
+       edu_writel(ctrl, EDU_DONE, 0);
+       edu_writel(ctrl, EDU_DONE, 0);
+       edu_readl(ctrl, EDU_DONE);
+}
+
+/* edu irq */
+static irqreturn_t brcmnand_edu_irq(int irq, void *data)
+{
+       struct brcmnand_controller *ctrl = data;
+
+       if (ctrl->edu_count) {
+               ctrl->edu_count--;
+               while (!(edu_readl(ctrl, EDU_DONE) & EDU_DONE_MASK))
+                       udelay(1);
+               edu_writel(ctrl, EDU_DONE, 0);
+               edu_readl(ctrl, EDU_DONE);
+       }
+
+       if (ctrl->edu_count) {
+               ctrl->edu_dram_addr += FC_BYTES;
+               ctrl->edu_ext_addr += FC_BYTES;
+
+               edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
+               edu_readl(ctrl, EDU_DRAM_ADDR);
+               edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
+               edu_readl(ctrl, EDU_EXT_ADDR);
+
+               mb(); /* flush previous writes */
+               edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
+               edu_readl(ctrl, EDU_CMD);
+
+               return IRQ_HANDLED;
+       }
+
+       complete(&ctrl->edu_done);
+
+       return IRQ_HANDLED;
+}
+
 static irqreturn_t brcmnand_ctlrdy_irq(int irq, void *data)
 {
        struct brcmnand_controller *ctrl = data;
@@ -1307,6 +1436,16 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq,
void *data)
        if (ctrl->dma_pending)
                return IRQ_HANDLED;

+       /* check if you need to piggy back on the ctrlrdy irq */
+       if (ctrl->edu_pending) {
+               if (irq == ctrl->irq && ((int)ctrl->edu_irq >= 0))
+       /* Discard interrupts while using dedicated edu irq */
+                       return IRQ_HANDLED;
+
+       /* no registered edu irq, call handler */
+               return brcmnand_edu_irq(irq, data);
+       }
+
        complete(&ctrl->done);
        return IRQ_HANDLED;
 }
@@ -1644,6 +1783,83 @@ static void brcmnand_write_buf(struct nand_chip
*chip, const uint8_t *buf,
        }
 }

+/**
+ *  Kick EDU engine
+ */
+static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
+                             u32 len, u8 cmd)
+{
+       struct brcmnand_controller *ctrl = host->ctrl;
+       unsigned long timeo = msecs_to_jiffies(200);
+       int ret = 0;
+       int dir = (cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+       u8 edu_cmd = (cmd == CMD_PAGE_READ ? EDU_CMD_READ : EDU_CMD_WRITE);
+       unsigned int trans = len >> FC_SHIFT;
+       dma_addr_t pa;
+
+       pa = dma_map_single(ctrl->dev, buf, len, dir);
+       if (dma_mapping_error(ctrl->dev, pa)) {
+               dev_err(ctrl->dev, "unable to map buffer for EDU DMA\n");
+               return -ENOMEM;
+       }
+
+       ctrl->edu_pending = true;
+       mb(); /* flush previous writes */
+
+       ctrl->edu_dram_addr = pa;
+       ctrl->edu_ext_addr = addr;
+       ctrl->edu_cmd = edu_cmd;
+       ctrl->edu_count = trans;
+
+       edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
+       edu_readl(ctrl,  EDU_DRAM_ADDR);
+       edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
+       edu_readl(ctrl, EDU_EXT_ADDR);
+       edu_writel(ctrl, EDU_LENGTH, FC_BYTES);
+       edu_readl(ctrl, EDU_LENGTH);
+
+       /* Start edu engine */
+       mb(); /* flush previous writes */
+       edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
+       edu_readl(ctrl, EDU_CMD);
+
+       if (wait_for_completion_timeout(&ctrl->edu_done, timeo) <= 0) {
+               dev_err(ctrl->dev,
+                       "timeout waiting for EDU; status %#x, error
status %#x\n",
+                       edu_readl(ctrl, EDU_STATUS),
+                       edu_readl(ctrl, EDU_ERR_STATUS));
+       }
+
+       dma_unmap_single(ctrl->dev, pa, len, dir);
+
+       /* for program page check NAND status */
+       if (((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
+             INTFC_FLASH_STATUS) & NAND_STATUS_FAIL) &&
+           edu_cmd == EDU_CMD_WRITE) {
+               dev_info(ctrl->dev, "program failed at %llx\n",
+                        (unsigned long long)addr);
+               ret = -EIO;
+       }
+
+       /* Make sure the EDU status is clean */
+       if (edu_readl(ctrl, EDU_STATUS) & EDU_STATUS_ACTIVE)
+               dev_warn(ctrl->dev, "EDU still active: %#x\n",
+                        edu_readl(ctrl, EDU_STATUS));
+
+       if (unlikely(edu_readl(ctrl, EDU_ERR_STATUS) & EDU_ERR_STATUS_ERRACK)) {
+               dev_warn(ctrl->dev, "EDU RBUS error at addr %llx\n",
+                        (unsigned long long)addr);
+               ret = -EIO;
+       }
+
+       ctrl->edu_pending = false;
+       brcmnand_edu_init(ctrl);
+       edu_writel(ctrl, EDU_STOP, 0); /* force stop */
+       edu_readl(ctrl, EDU_STOP);
+
+       return ret;
+}
+
 /**
  * Construct a FLASH_DMA descriptor as part of a linked list. You must know the
  * following ahead of time:
@@ -1850,9 +2066,11 @@ static int brcmnand_read(struct mtd_info *mtd,
struct nand_chip *chip,
 try_dmaread:
        brcmnand_clear_ecc_addr(ctrl);

-       if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
-               err = brcmnand_dma_trans(host, addr, buf, trans * FC_BYTES,
-                                            CMD_PAGE_READ);
+       if (ctrl->dma_trans && !oob && flash_dma_buf_ok(buf)) {
+               err = ctrl->dma_trans(host, addr, buf,
+                                     trans * FC_BYTES,
+                                     CMD_PAGE_READ);
+
                if (err) {
                        if (mtd_is_bitflip_or_eccerr(err))
                                err_addr = addr;
@@ -1988,10 +2206,12 @@ static int brcmnand_write(struct mtd_info
*mtd, struct nand_chip *chip,
        for (i = 0; i < ctrl->max_oob; i += 4)
                oob_reg_write(ctrl, i, 0xffffffff);

-       if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
-               if (brcmnand_dma_trans(host, addr, (u32 *)buf,
-                                       mtd->writesize, CMD_PROGRAM_PAGE))
+       if (use_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
+               if (ctrl->dma_trans(host, addr, (u32 *)buf, mtd->writesize,
+                                   CMD_PROGRAM_PAGE))
+
                        ret = -EIO;
+
                goto out;
        }

@@ -2494,6 +2714,8 @@ static int brcmnand_suspend(struct device *dev)

        if (has_flash_dma(ctrl))
                ctrl->flash_dma_mode = flash_dma_readl(ctrl, FLASH_DMA_MODE);
+       else if (has_edu(ctrl))
+               ctrl->edu_config = edu_readl(ctrl, EDU_CONFIG);

        return 0;
 }
@@ -2508,6 +2730,14 @@ static int brcmnand_resume(struct device *dev)
                flash_dma_writel(ctrl, FLASH_DMA_ERROR_STATUS, 0);
        }

+       if (has_edu(ctrl))
+               ctrl->edu_config = edu_readl(ctrl, EDU_CONFIG);
+       else {
+               edu_writel(ctrl, EDU_CONFIG, ctrl->edu_config);
+               edu_readl(ctrl, EDU_CONFIG);
+               brcmnand_edu_init(ctrl);
+       }
+
        brcmnand_write_reg(ctrl, BRCMNAND_CS_SELECT, ctrl->nand_cs_nand_select);
        brcmnand_write_reg(ctrl, BRCMNAND_CS_XOR, ctrl->nand_cs_nand_xor);
        brcmnand_write_reg(ctrl, BRCMNAND_CORR_THRESHOLD,
@@ -2553,6 +2783,52 @@ MODULE_DEVICE_TABLE(of, brcmnand_of_match);
 /***********************************************************************
  * Platform driver setup (per controller)
  ***********************************************************************/
+static int brcmnand_edu_setup(struct platform_device *pdev)
+{
+       struct device *dev = &pdev->dev;
+       struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
+       struct resource *res;
+       int ret;
+
+       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-edu");
+       if (res) {
+               ctrl->edu_base = devm_ioremap_resource(dev, res);
+               if (IS_ERR(ctrl->edu_base))
+                       return PTR_ERR(ctrl->edu_base);
+
+               ctrl->edu_offsets = edu_regs;
+
+               edu_writel(ctrl, EDU_CONFIG, EDU_CONFIG_MODE_NAND |
+                          EDU_CONFIG_SWAP_CFG);
+               edu_readl(ctrl, EDU_CONFIG);
+
+               /* initialize edu */
+               brcmnand_edu_init(ctrl);
+
+               ctrl->edu_irq = platform_get_irq_optional(pdev, 1);
+               if ((int)ctrl->edu_irq < 0) {
+                       dev_warn(dev,
+                                "FLASH EDU enabled, using ctlrdy irq\n");
+               } else {
+                       ret = devm_request_irq(dev, ctrl->edu_irq,
+                                              brcmnand_edu_irq, 0,
+                                              "brcmnand-edu", ctrl);
+                       if (ret < 0) {
+                               dev_err(ctrl->dev, "can't allocate IRQ
%d: error %d\n",
+                                       ctrl->edu_irq, ret);
+                               return ret;
+                       }
+
+                       dev_info(dev, "FLASH EDU enabled using irq %u\n",
+                                ctrl->edu_irq);
+               }
+
+               /* set the appropriate edu transfer function to call */
+               ctrl->dma_trans = brcmnand_edu_trans;
+       }
+
+       return 0;
+}

 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
@@ -2578,6 +2854,7 @@ int brcmnand_probe(struct platform_device *pdev,
struct brcmnand_soc *soc)

        init_completion(&ctrl->done);
        init_completion(&ctrl->dma_done);
+       init_completion(&ctrl->edu_done);
        nand_controller_init(&ctrl->controller);
        ctrl->controller.ops = &brcmnand_controller_ops;
        INIT_LIST_HEAD(&ctrl->host_list);
@@ -2623,6 +2900,7 @@ int brcmnand_probe(struct platform_device *pdev,
struct brcmnand_soc *soc)
                                ctrl->reg_offsets[BRCMNAND_FC_BASE];
        }

+       ctrl->dma_trans = NULL;
        /* FLASH_DMA */
        res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "flash-dma");
        if (res) {
@@ -2665,6 +2943,12 @@ int brcmnand_probe(struct platform_device
*pdev, struct brcmnand_soc *soc)
                }

                dev_info(dev, "enabling FLASH_DMA\n");
+               /* set the appropriate flash dma transfer function to call */
+               ctrl->dma_trans = brcmnand_dma_trans;
+       } else  {
+               ret = brcmnand_edu_setup(pdev);
+               if (ret < 0)
+                       goto err;
        }

        /* Disable automatic device ID config, direct addressing */
--
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
