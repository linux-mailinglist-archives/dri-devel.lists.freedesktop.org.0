Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497286E3E8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EB110EE13;
	Fri,  1 Mar 2024 15:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nQSE3tE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA5910EE13
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 15:03:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-412b83cfac4so15715815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709305397; x=1709910197;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vtv9jeOtstMceNcK0Iix9uaOmyhaVmm1NDD4ZS9SNGE=;
 b=nQSE3tE6zszG7YjqPlTNpDnnPBNLXnrqFwA6Z7EXkkBXoPf3Clj093dwH1eERKrlsC
 DHjrB5jF7bLgSYBjNSAxiTXx0bTv1Edi+kjhTN/VvswqnCRjEMU46DBWnpEaoRobDLdV
 p1wNevvs/VZPZTEiyICVafds6dFN2akOATYbfQXskKHH7DXwHIfrtdspeo2FkI5wbXgy
 mz3/iNggR/ZUv/bs4lkMlb/XG+qWOyDDq1S0LarBGfpXhrZlaBmTQpmqHq1LtR2b73Sf
 449uXoSRLgObFoEA+f/ROGg51j517QrCw9rFZGa5SRQo+WSPctrFLjgKw2FFEw1q45Fw
 aeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709305397; x=1709910197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtv9jeOtstMceNcK0Iix9uaOmyhaVmm1NDD4ZS9SNGE=;
 b=D3yhVic32kiervRJ0oxsGESbN7wjmCphKBTCsndq/nbD8DjQFoiJsPAc/4aCj+XPe6
 C+EePnFnaCTCtMO9TDfwH0quPBNODlAqtk4YtVvUvTwXZRnBpw629GRbTx5M+sn42dZX
 EbVd22t8KyAPfn7XQiQky20uUyB9p8Wq3soxyUU3pBHT2eEe0lxivieaiabBMMLkqdR2
 7fApIKhrK9feTzLJt5qlVIM5Fn63KLb+PlwtnZlH3HrudkXfwyB9tTfOTMVvnwFJtjCO
 bNgfjyd2xalcI4GzEG3T69t7GlYAaFlmbGHlTzGIljK/INtncfxzYBk9lCBWnKKYUHcv
 RSxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgyWqpxXh/Th/+j9Zre3CGSN5LTLpd4BmbNF69xifB/EGgOH9i+k3LUEKNIR52i14ZlHf7qSaW0OtV0KmRvQqw2dYlegmYeRqzRIWKF3Rl
X-Gm-Message-State: AOJu0YxxTqtAlJBgGnsN8EAXIb8Eeh4WrIEolPicrBCxsQgX8cTKqSfr
 SWvxsXRvPYazPoA2jzsO6BMFv49/9hhzoprQjOCpowidHOjlf8eTakaqlJv+cDI=
X-Google-Smtp-Source: AGHT+IEFFaI5Asn9xk6n6pPiMh5jq3vHno9kHVbgU1oflVs2CJlxwhOV7Hf0snfDTb9ClcpEHblK5A==
X-Received: by 2002:a05:600c:3111:b0:40f:cf69:3e1a with SMTP id
 g17-20020a05600c311100b0040fcf693e1amr1575792wmo.39.1709305396577; 
 Fri, 01 Mar 2024 07:03:16 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b00412bca49a5bsm5666875wms.42.2024.03.01.07.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 07:03:16 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 01 Mar 2024 16:02:53 +0100
Subject: [PATCH v2 2/2] net: ethernet: ti: am65-cpsw: Add minimal XDP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v2-2-01c6caacabb6@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709305390; l=28138;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=QyhvOqRhyd7MA+29BpTOtPdCqqGowGaowDoO8pnOKI8=;
 b=jXywCW5GQD2E5UvAsyrEofV8F1U/2WYxZ6D2OIYMNAq9RHA9PJ75I9R8PfCQ29gHgdEg/3h7Q
 +EEuxoNq25pBj5NmEhwMgYc1qUbguBiXMgk0iCmn4iLnqzb0MKxJn1q
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
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

This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
Ethernet driver. The following features are implemented:
- NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
- NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
- NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)

The page pool memory model is used to get better performance.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 490 ++++++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  13 +
 2 files changed, 455 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 9d2f4ac783e4..d6ee3ac07e52 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -5,6 +5,7 @@
  *
  */
 
+#include <linux/bpf_trace.h>
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
@@ -30,6 +31,7 @@
 #include <linux/sys_soc.h>
 #include <linux/dma/ti-cppi5.h>
 #include <linux/dma/k3-udma-glue.h>
+#include <net/page_pool/helpers.h>
 #include <net/switchdev.h>
 
 #include "cpsw_ale.h"
@@ -138,6 +140,17 @@
 
 #define AM65_CPSW_DEFAULT_TX_CHNS	8
 
+/* CPPI streaming packet interface */
+#define AM65_CPSW_CPPI_TX_FLOW_ID  0x3FFF
+#define AM65_CPSW_CPPI_TX_PKT_TYPE 0x7
+
+/* XDP */
+#define AM65_CPSW_XDP_CONSUMED	1
+#define AM65_CPSW_XDP_PASS	0
+
+/* Include headroom compatible with both skb and xdpf */
+#define AM65_CPSW_HEADROOM max(NET_SKB_PAD, XDP_PACKET_HEADROOM)
+
 static void am65_cpsw_port_set_sl_mac(struct am65_cpsw_port *slave,
 				      const u8 *dev_addr)
 {
@@ -369,6 +382,65 @@ static void am65_cpsw_init_host_port_emac(struct am65_cpsw_common *common);
 static void am65_cpsw_init_port_switch_ale(struct am65_cpsw_port *port);
 static void am65_cpsw_init_port_emac_ale(struct am65_cpsw_port *port);
 
+static void am65_cpsw_destroy_xdp_rxqs(struct am65_cpsw_common *common)
+{
+	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct xdp_rxq_info *rxq;
+	int i;
+
+	for (i = 0; i < common->port_num; i++) {
+		rxq = &common->ports[i].xdp_rxq;
+
+		if (xdp_rxq_info_is_reg(rxq))
+			xdp_rxq_info_unreg(rxq);
+	}
+
+	if (rx_chn->page_pool) {
+		page_pool_destroy(rx_chn->page_pool);
+		rx_chn->page_pool = NULL;
+	}
+}
+
+static int am65_cpsw_create_xdp_rxqs(struct am65_cpsw_common *common)
+{
+	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct page_pool_params pp_params = {
+		.flags = PP_FLAG_DMA_MAP,
+		.order = 0,
+		.pool_size = AM65_CPSW_MAX_RX_DESC,
+		.nid = dev_to_node(common->dev),
+		.dev = common->dev,
+		.dma_dir = DMA_BIDIRECTIONAL,
+	};
+	struct xdp_rxq_info *rxq;
+	struct page_pool *pool;
+	int i, ret;
+
+	pool = page_pool_create(&pp_params);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	rx_chn->page_pool = pool;
+
+	for (i = 0; i < common->port_num; i++) {
+		rxq = &common->ports[i].xdp_rxq;
+
+		ret = xdp_rxq_info_reg(rxq, common->ports[i].ndev, i, 0);
+		if (ret)
+			goto err;
+
+		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	am65_cpsw_destroy_xdp_rxqs(common);
+	return ret;
+}
+
 static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct am65_cpsw_rx_chn *rx_chn = data;
@@ -440,9 +512,40 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
 	dev_kfree_skb_any(skb);
 }
 
+static struct sk_buff *am65_cpsw_alloc_skb(struct am65_cpsw_rx_chn *rx_chn,
+					   struct net_device *ndev,
+					   unsigned int len,
+					   int page_idx)
+{
+	struct sk_buff *skb;
+	struct page *page;
+
+	page = page_pool_dev_alloc_pages(rx_chn->page_pool);
+	if (unlikely(!page))
+		return NULL;
+
+	len += AM65_CPSW_HEADROOM;
+
+	skb = build_skb(page_address(page), len);
+	if (unlikely(!skb)) {
+		page_pool_put_full_page(rx_chn->page_pool, page, ndev);
+		rx_chn->pages[page_idx] = NULL;
+		return NULL;
+	}
+
+	skb_reserve(skb, AM65_CPSW_HEADROOM + NET_IP_ALIGN);
+	skb->dev = ndev;
+
+	rx_chn->pages[page_idx] = page;
+
+	return skb;
+}
+
 static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_host *host_p = am65_common_get_host(common);
+	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_tx_chn *tx_chn = common->tx_chns;
 	int port_idx, i, ret, tx;
 	struct sk_buff *skb;
 	u32 val, port_mask;
@@ -505,10 +608,14 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 
 	am65_cpsw_qos_tx_p0_rate_init(common);
 
-	for (i = 0; i < common->rx_chns.descs_num; i++) {
-		skb = __netdev_alloc_skb_ip_align(NULL,
-						  AM65_CPSW_MAX_PACKET_SIZE,
-						  GFP_KERNEL);
+	ret = am65_cpsw_create_xdp_rxqs(common);
+	if (ret) {
+		dev_err(common->dev, "Failed to create XDP rx queues\n");
+		return ret;
+	}
+
+	for (i = 0; i < rx_chn->descs_num; i++) {
+		skb = am65_cpsw_alloc_skb(rx_chn, NULL, AM65_CPSW_MAX_PACKET_SIZE, i);
 		if (!skb) {
 			ret = -ENOMEM;
 			dev_err(common->dev, "cannot allocate skb\n");
@@ -531,27 +638,27 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 		}
 	}
 
-	ret = k3_udma_glue_enable_rx_chn(common->rx_chns.rx_chn);
+	ret = k3_udma_glue_enable_rx_chn(rx_chn->rx_chn);
 	if (ret) {
 		dev_err(common->dev, "couldn't enable rx chn: %d\n", ret);
 		goto fail_rx;
 	}
 
 	for (tx = 0; tx < common->tx_ch_num; tx++) {
-		ret = k3_udma_glue_enable_tx_chn(common->tx_chns[tx].tx_chn);
+		ret = k3_udma_glue_enable_tx_chn(tx_chn[tx].tx_chn);
 		if (ret) {
 			dev_err(common->dev, "couldn't enable tx chn %d: %d\n",
 				tx, ret);
 			tx--;
 			goto fail_tx;
 		}
-		napi_enable(&common->tx_chns[tx].napi_tx);
+		napi_enable(&tx_chn[tx].napi_tx);
 	}
 
 	napi_enable(&common->napi_rx);
 	if (common->rx_irq_disabled) {
 		common->rx_irq_disabled = false;
-		enable_irq(common->rx_chns.irq);
+		enable_irq(rx_chn->irq);
 	}
 
 	dev_dbg(common->dev, "cpsw_nuss started\n");
@@ -559,22 +666,23 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 
 fail_tx:
 	while (tx >= 0) {
-		napi_disable(&common->tx_chns[tx].napi_tx);
-		k3_udma_glue_disable_tx_chn(common->tx_chns[tx].tx_chn);
+		napi_disable(&tx_chn[tx].napi_tx);
+		k3_udma_glue_disable_tx_chn(tx_chn[tx].tx_chn);
 		tx--;
 	}
 
-	k3_udma_glue_disable_rx_chn(common->rx_chns.rx_chn);
+	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
 
 fail_rx:
-	k3_udma_glue_reset_rx_chn(common->rx_chns.rx_chn, 0,
-				  &common->rx_chns,
+	k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, 0, rx_chn,
 				  am65_cpsw_nuss_rx_cleanup, 0);
 	return ret;
 }
 
 static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 {
+	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct am65_cpsw_tx_chn *tx_chn = common->tx_chns;
 	int i;
 
 	if (common->usage_count != 1)
@@ -590,26 +698,25 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 	reinit_completion(&common->tdown_complete);
 
 	for (i = 0; i < common->tx_ch_num; i++)
-		k3_udma_glue_tdown_tx_chn(common->tx_chns[i].tx_chn, false);
+		k3_udma_glue_tdown_tx_chn(tx_chn[i].tx_chn, false);
 
 	i = wait_for_completion_timeout(&common->tdown_complete,
 					msecs_to_jiffies(1000));
 	if (!i)
 		dev_err(common->dev, "tx timeout\n");
 	for (i = 0; i < common->tx_ch_num; i++) {
-		napi_disable(&common->tx_chns[i].napi_tx);
-		hrtimer_cancel(&common->tx_chns[i].tx_hrtimer);
+		napi_disable(&tx_chn[i].napi_tx);
+		hrtimer_cancel(&tx_chn[i].tx_hrtimer);
 	}
 
 	for (i = 0; i < common->tx_ch_num; i++) {
-		k3_udma_glue_reset_tx_chn(common->tx_chns[i].tx_chn,
-					  &common->tx_chns[i],
+		k3_udma_glue_reset_tx_chn(tx_chn[i].tx_chn, &tx_chn[i],
 					  am65_cpsw_nuss_tx_cleanup);
-		k3_udma_glue_disable_tx_chn(common->tx_chns[i].tx_chn);
+		k3_udma_glue_disable_tx_chn(tx_chn[i].tx_chn);
 	}
 
 	reinit_completion(&common->tdown_complete);
-	k3_udma_glue_tdown_rx_chn(common->rx_chns.rx_chn, true);
+	k3_udma_glue_tdown_rx_chn(rx_chn->rx_chn, true);
 
 	if (common->pdata.quirks & AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ) {
 		i = wait_for_completion_timeout(&common->tdown_complete, msecs_to_jiffies(1000));
@@ -621,17 +728,24 @@ static int am65_cpsw_nuss_common_stop(struct am65_cpsw_common *common)
 	hrtimer_cancel(&common->rx_hrtimer);
 
 	for (i = 0; i < AM65_CPSW_MAX_RX_FLOWS; i++)
-		k3_udma_glue_reset_rx_chn(common->rx_chns.rx_chn, i,
-					  &common->rx_chns,
+		k3_udma_glue_reset_rx_chn(rx_chn->rx_chn, i, rx_chn,
 					  am65_cpsw_nuss_rx_cleanup, !!i);
 
-	k3_udma_glue_disable_rx_chn(common->rx_chns.rx_chn);
+	k3_udma_glue_disable_rx_chn(rx_chn->rx_chn);
 
 	cpsw_ale_stop(common->ale);
 
 	writel(0, common->cpsw_base + AM65_CPSW_REG_CTL);
 	writel(0, common->cpsw_base + AM65_CPSW_REG_STAT_PORT_EN);
 
+	for (i = 0; i < rx_chn->descs_num; i++) {
+		if (rx_chn->pages[i]) {
+			page_pool_put_full_page(rx_chn->page_pool, rx_chn->pages[i], false);
+			rx_chn->pages[i] = NULL;
+		}
+	}
+	am65_cpsw_destroy_xdp_rxqs(common);
+
 	dev_dbg(common->dev, "cpsw_nuss stopped\n");
 	return 0;
 }
@@ -749,6 +863,141 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	return ret;
 }
 
+static int am65_cpsw_xdp_tx_frame(struct net_device *ndev,
+				  struct am65_cpsw_tx_chn *tx_chn,
+				  struct xdp_frame *xdpf)
+{
+	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+	struct cppi5_host_desc_t *host_desc;
+	struct netdev_queue *netif_txq;
+	dma_addr_t dma_desc, dma_buf;
+	u32 pkt_len = xdpf->len;
+	void **swdata;
+	int ret;
+
+	host_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+	if (unlikely(!host_desc)) {
+		ndev->stats.tx_dropped++;
+		return -ENOMEM;
+	}
+
+	dma_buf = dma_map_single(tx_chn->dma_dev, xdpf->data, pkt_len, DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(tx_chn->dma_dev, dma_buf))) {
+		ndev->stats.tx_dropped++;
+		ret = -ENOMEM;
+		goto pool_free;
+	}
+
+	cppi5_hdesc_init(host_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT, AM65_CPSW_NAV_PS_DATA_SIZE);
+	cppi5_hdesc_set_pkttype(host_desc, AM65_CPSW_CPPI_TX_PKT_TYPE);
+	cppi5_hdesc_set_pktlen(host_desc, pkt_len);
+	cppi5_desc_set_pktids(&host_desc->hdr, 0, AM65_CPSW_CPPI_TX_FLOW_ID);
+	cppi5_desc_set_tags_ids(&host_desc->hdr, 0, port->port_id);
+
+	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
+	cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf, pkt_len);
+
+	swdata = cppi5_hdesc_get_swdata(host_desc);
+	*(swdata) = xdpf;
+
+	/* Report BQL before sending the packet */
+	netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+	netdev_tx_sent_queue(netif_txq, pkt_len);
+
+	dma_desc = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, host_desc);
+	if (AM65_CPSW_IS_CPSW2G(common)) {
+		ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, host_desc, dma_desc);
+	} else {
+		spin_lock_bh(&tx_chn->lock);
+		ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, host_desc, dma_desc);
+		spin_unlock_bh(&tx_chn->lock);
+	}
+	if (ret) {
+		/* Inform BQL */
+		netdev_tx_completed_queue(netif_txq, 1, pkt_len);
+		ndev->stats.tx_errors++;
+		goto dma_unmap;
+	}
+
+	return 0;
+
+dma_unmap:
+	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &dma_buf);
+	dma_unmap_single(tx_chn->dma_dev, dma_buf, pkt_len, DMA_TO_DEVICE);
+pool_free:
+	k3_cppi_desc_pool_free(tx_chn->desc_pool, host_desc);
+	return ret;
+}
+
+static int am65_cpsw_run_xdp(struct am65_cpsw_common *common, struct am65_cpsw_port *port,
+			     struct xdp_buff *xdp, int page_idx, int cpu, int *len)
+{
+	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
+	struct net_device *ndev = port->ndev;
+	int ret = AM65_CPSW_XDP_CONSUMED;
+	struct am65_cpsw_tx_chn *tx_chn;
+	struct netdev_queue *netif_txq;
+	struct xdp_frame *xdpf;
+	struct bpf_prog *prog;
+	struct page *page;
+	u32 act;
+
+	prog = READ_ONCE(port->xdp_prog);
+	if (!prog)
+		return AM65_CPSW_XDP_PASS;
+
+	act = bpf_prog_run_xdp(prog, xdp);
+	/* XDP prog might have changed packet data and boundaries */
+	*len = xdp->data_end - xdp->data;
+
+	switch (act) {
+	case XDP_PASS:
+		ret = AM65_CPSW_XDP_PASS;
+		goto out;
+	case XDP_TX:
+		tx_chn = &common->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
+		netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+
+		xdpf = xdp_convert_buff_to_frame(xdp);
+		if (unlikely(!xdpf))
+			break;
+
+		__netif_tx_lock(netif_txq, cpu);
+		tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_XDP_TX;
+		ret = am65_cpsw_xdp_tx_frame(ndev, tx_chn, xdpf);
+		__netif_tx_unlock(netif_txq);
+		if (ret)
+			break;
+
+		ndev->stats.rx_bytes += *len;
+		ndev->stats.rx_packets++;
+		ret = AM65_CPSW_XDP_CONSUMED;
+		goto out;
+	case XDP_REDIRECT:
+		if (unlikely(xdp_do_redirect(ndev, xdp, prog)))
+			break;
+
+		ndev->stats.rx_bytes += *len;
+		ndev->stats.rx_packets++;
+		goto out;
+	default:
+		bpf_warn_invalid_xdp_action(ndev, prog, act);
+		fallthrough;
+	case XDP_ABORTED:
+		trace_xdp_exception(ndev, prog, act);
+		fallthrough;
+	case XDP_DROP:
+		ndev->stats.rx_dropped++;
+	}
+
+	page = virt_to_head_page(xdp->data);
+	page_pool_recycle_direct(rx_chn->page_pool, page);
+	rx_chn->pages[page_idx] = NULL;
+out:
+	return ret;
+}
+
 static void am65_cpsw_nuss_rx_ts(struct sk_buff *skb, u32 *psdata)
 {
 	struct skb_shared_hwtstamps *ssh;
@@ -795,7 +1044,7 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
 }
 
 static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
-				     u32 flow_idx)
+				     u32 flow_idx, int cpu)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
@@ -806,10 +1055,13 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	struct sk_buff *skb, *new_skb;
 	dma_addr_t desc_dma, buf_dma;
 	struct am65_cpsw_port *port;
+	int headroom, page_idx, ret;
 	struct net_device *ndev;
+	struct xdp_buff	xdp;
+	struct page *page;
+	void *pool_addr;
 	void **swdata;
 	u32 *psdata;
-	int ret = 0;
 
 	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_idx, &desc_dma);
 	if (ret) {
@@ -851,7 +1103,27 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
-	new_skb = netdev_alloc_skb_ip_align(ndev, AM65_CPSW_MAX_PACKET_SIZE);
+	/* Compute page index */
+	pool_addr = k3_cppi_desc_pool_cpuaddr(rx_chn->desc_pool);
+	page_idx = ((void *)desc_rx - pool_addr) >> rx_chn->dsize_log2;
+
+	if (port->xdp_prog) {
+		xdp_init_buff(&xdp, AM65_CPSW_MAX_PACKET_SIZE, &port->xdp_rxq);
+
+		page = virt_to_page(skb->data);
+		xdp_prepare_buff(&xdp, page_address(page), skb_headroom(skb), pkt_len, false);
+
+		ret = am65_cpsw_run_xdp(common, port, &xdp, page_idx, cpu, &pkt_len);
+		if (ret != AM65_CPSW_XDP_PASS)
+			return ret;
+
+		/* Compute additional headroom to be reserved */
+		headroom = (xdp.data - xdp.data_hard_start) - skb_headroom(skb);
+		skb_reserve(skb, headroom);
+	}
+
+	/* Pass skb to netstack if no XDP prog or returned XDP_PASS */
+	new_skb = am65_cpsw_alloc_skb(rx_chn, ndev, AM65_CPSW_MAX_PACKET_SIZE, page_idx);
 	if (new_skb) {
 		ndev_priv = netdev_priv(ndev);
 		am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
@@ -901,6 +1173,7 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 {
 	struct am65_cpsw_common *common = am65_cpsw_napi_to_common(napi_rx);
 	int flow = AM65_CPSW_MAX_RX_FLOWS;
+	int cpu = smp_processor_id();
 	int cur_budget, ret;
 	int num_rx = 0;
 
@@ -909,7 +1182,7 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 		cur_budget = budget - num_rx;
 
 		while (cur_budget--) {
-			ret = am65_cpsw_nuss_rx_packets(common, flow);
+			ret = am65_cpsw_nuss_rx_packets(common, flow, cpu);
 			if (ret)
 				break;
 			num_rx++;
@@ -938,8 +1211,8 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 }
 
 static struct sk_buff *
-am65_cpsw_nuss_tx_compl_packet(struct am65_cpsw_tx_chn *tx_chn,
-			       dma_addr_t desc_dma)
+am65_cpsw_nuss_tx_compl_packet_skb(struct am65_cpsw_tx_chn *tx_chn,
+				   dma_addr_t desc_dma)
 {
 	struct am65_cpsw_ndev_priv *ndev_priv;
 	struct am65_cpsw_ndev_stats *stats;
@@ -968,6 +1241,39 @@ am65_cpsw_nuss_tx_compl_packet(struct am65_cpsw_tx_chn *tx_chn,
 	return skb;
 }
 
+static struct xdp_frame *
+am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
+				   struct am65_cpsw_tx_chn *tx_chn,
+				   dma_addr_t desc_dma,
+				   struct net_device **ndev)
+{
+	struct am65_cpsw_ndev_priv *ndev_priv;
+	struct am65_cpsw_ndev_stats *stats;
+	struct cppi5_host_desc_t *desc_tx;
+	struct am65_cpsw_port *port;
+	struct xdp_frame *xdpf;
+	u32 port_id = 0;
+	void **swdata;
+
+	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
+	cppi5_desc_get_tags_ids(&desc_tx->hdr, NULL, &port_id);
+	swdata = cppi5_hdesc_get_swdata(desc_tx);
+	xdpf = *(swdata);
+	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
+
+	port = am65_common_get_port(common, port_id);
+	*ndev = port->ndev;
+
+	ndev_priv = netdev_priv(*ndev);
+	stats = this_cpu_ptr(ndev_priv->stats);
+	u64_stats_update_begin(&stats->syncp);
+	stats->tx_packets++;
+	stats->tx_bytes += xdpf->len;
+	u64_stats_update_end(&stats->syncp);
+
+	return xdpf;
+}
+
 static void am65_cpsw_nuss_tx_wake(struct am65_cpsw_tx_chn *tx_chn, struct net_device *ndev,
 				   struct netdev_queue *netif_txq)
 {
@@ -993,6 +1299,7 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 	struct netdev_queue *netif_txq;
 	unsigned int total_bytes = 0;
 	struct net_device *ndev;
+	struct xdp_frame *xdpf;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
@@ -1013,10 +1320,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 			break;
 		}
 
-		skb = am65_cpsw_nuss_tx_compl_packet(tx_chn, desc_dma);
-		total_bytes = skb->len;
-		ndev = skb->dev;
-		napi_consume_skb(skb, budget);
+		if (tx_chn->buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
+			skb = am65_cpsw_nuss_tx_compl_packet_skb(tx_chn, desc_dma);
+			ndev = skb->dev;
+			total_bytes = skb->len;
+			napi_consume_skb(skb, budget);
+		} else {
+			xdpf = am65_cpsw_nuss_tx_compl_packet_xdp(common, tx_chn, desc_dma, &ndev);
+			total_bytes = xdpf->len;
+			if (tx_chn->buf_type == AM65_CPSW_TX_BUF_TYPE_XDP_TX)
+				xdp_return_frame_rx_napi(xdpf);
+			else
+				xdp_return_frame(xdpf);
+		}
 		num_tx++;
 
 		netif_txq = netdev_get_tx_queue(ndev, chn);
@@ -1039,6 +1355,7 @@ static int am65_cpsw_nuss_tx_compl_packets_2g(struct am65_cpsw_common *common,
 	struct netdev_queue *netif_txq;
 	unsigned int total_bytes = 0;
 	struct net_device *ndev;
+	struct xdp_frame *xdpf;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
@@ -1057,11 +1374,19 @@ static int am65_cpsw_nuss_tx_compl_packets_2g(struct am65_cpsw_common *common,
 			break;
 		}
 
-		skb = am65_cpsw_nuss_tx_compl_packet(tx_chn, desc_dma);
-
-		ndev = skb->dev;
-		total_bytes += skb->len;
-		napi_consume_skb(skb, budget);
+		if (tx_chn->buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
+			skb = am65_cpsw_nuss_tx_compl_packet_skb(tx_chn, desc_dma);
+			ndev = skb->dev;
+			total_bytes += skb->len;
+			napi_consume_skb(skb, budget);
+		} else {
+			xdpf = am65_cpsw_nuss_tx_compl_packet_xdp(common, tx_chn, desc_dma, &ndev);
+			total_bytes += xdpf->len;
+			if (tx_chn->buf_type == AM65_CPSW_TX_BUF_TYPE_XDP_TX)
+				xdp_return_frame_rx_napi(xdpf);
+			else
+				xdp_return_frame(xdpf);
+		}
 		num_tx++;
 	}
 
@@ -1166,6 +1491,8 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 	tx_chn = &common->tx_chns[q_idx];
 	netif_txq = netdev_get_tx_queue(ndev, q_idx);
 
+	tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_SKB;
+
 	/* Map the linear buffer */
 	buf_dma = dma_map_single(tx_chn->dma_dev, skb->data, pkt_len,
 				 DMA_TO_DEVICE);
@@ -1185,8 +1512,8 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 
 	cppi5_hdesc_init(first_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
 			 AM65_CPSW_NAV_PS_DATA_SIZE);
-	cppi5_desc_set_pktids(&first_desc->hdr, 0, 0x3FFF);
-	cppi5_hdesc_set_pkttype(first_desc, 0x7);
+	cppi5_desc_set_pktids(&first_desc->hdr, 0, AM65_CPSW_CPPI_TX_FLOW_ID);
+	cppi5_hdesc_set_pkttype(first_desc, AM65_CPSW_CPPI_TX_PKT_TYPE);
 	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, port->port_id);
 
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
@@ -1488,6 +1815,58 @@ static void am65_cpsw_nuss_ndo_get_stats(struct net_device *dev,
 	stats->tx_dropped	= dev->stats.tx_dropped;
 }
 
+static int am65_cpsw_xdp_prog_setup(struct net_device *ndev, struct bpf_prog *prog)
+{
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+	bool running = netif_running(ndev);
+	struct bpf_prog *old_prog;
+
+	if (running)
+		am65_cpsw_nuss_ndo_slave_stop(ndev);
+
+	old_prog = xchg(&port->xdp_prog, prog);
+	if (old_prog)
+		bpf_prog_put(old_prog);
+
+	if (running)
+		return am65_cpsw_nuss_ndo_slave_open(ndev);
+
+	return 0;
+}
+
+static int am65_cpsw_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
+{
+	switch (bpf->command) {
+	case XDP_SETUP_PROG:
+		return am65_cpsw_xdp_prog_setup(ndev, bpf->prog);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int am65_cpsw_ndo_xdp_xmit(struct net_device *ndev, int n,
+				  struct xdp_frame **frames, u32 flags)
+{
+	struct am65_cpsw_tx_chn *tx_chn;
+	struct netdev_queue *netif_txq;
+	int cpu = smp_processor_id();
+	int i, nxmit = 0;
+
+	tx_chn = &am65_ndev_to_common(ndev)->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
+	netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+
+	__netif_tx_lock(netif_txq, cpu);
+	tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_XDP_NDO;
+	for (i = 0; i < n; i++) {
+		if (am65_cpsw_xdp_tx_frame(ndev, tx_chn, frames[i]))
+			break;
+		nxmit++;
+	}
+	__netif_tx_unlock(netif_txq);
+
+	return nxmit;
+}
+
 static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
 	.ndo_open		= am65_cpsw_nuss_ndo_slave_open,
 	.ndo_stop		= am65_cpsw_nuss_ndo_slave_stop,
@@ -1502,6 +1881,8 @@ static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
 	.ndo_eth_ioctl		= am65_cpsw_nuss_ndo_slave_ioctl,
 	.ndo_setup_tc           = am65_cpsw_qos_ndo_setup_tc,
 	.ndo_set_tx_maxrate	= am65_cpsw_qos_ndo_tx_p0_set_maxrate,
+	.ndo_bpf		= am65_cpsw_ndo_bpf,
+	.ndo_xdp_xmit		= am65_cpsw_ndo_xdp_xmit,
 };
 
 static void am65_cpsw_disable_phy(struct phy *phy)
@@ -1816,6 +2197,8 @@ static int am65_cpsw_nuss_init_tx_chns(struct am65_cpsw_common *common)
 			goto err;
 		}
 
+		tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_SKB;
+
 		tx_chn->irq = k3_udma_glue_tx_get_irq(tx_chn->tx_chn);
 		if (tx_chn->irq < 0) {
 			dev_err(dev, "Failed to get tx dma irq %d\n",
@@ -1862,8 +2245,8 @@ static void am65_cpsw_nuss_free_rx_chns(void *data)
 static void am65_cpsw_nuss_remove_rx_chns(void *data)
 {
 	struct am65_cpsw_common *common = data;
-	struct am65_cpsw_rx_chn *rx_chn;
 	struct device *dev = common->dev;
+	struct am65_cpsw_rx_chn *rx_chn;
 
 	rx_chn = &common->rx_chns;
 	devm_remove_action(dev, am65_cpsw_nuss_free_rx_chns, common);
@@ -1873,11 +2256,7 @@ static void am65_cpsw_nuss_remove_rx_chns(void *data)
 
 	netif_napi_del(&common->napi_rx);
 
-	if (!IS_ERR_OR_NULL(rx_chn->desc_pool))
-		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
-
-	if (!IS_ERR_OR_NULL(rx_chn->rx_chn))
-		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
+	am65_cpsw_nuss_free_rx_chns(common);
 
 	common->rx_flow_id_base = -1;
 }
@@ -1888,6 +2267,7 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 	struct k3_udma_glue_rx_channel_cfg rx_cfg = { 0 };
 	u32  max_desc_num = AM65_CPSW_MAX_RX_DESC;
 	struct device *dev = common->dev;
+	u32 hdesc_size_out;
 	u32 hdesc_size;
 	u32 fdqring_id;
 	int i, ret = 0;
@@ -1920,6 +2300,15 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		goto err;
 	}
 
+	hdesc_size_out = k3_cppi_desc_pool_desc_size(rx_chn->desc_pool);
+	rx_chn->dsize_log2 = __fls(hdesc_size_out);
+	WARN_ON(hdesc_size_out != (1 << rx_chn->dsize_log2));
+
+	rx_chn->page_pool = NULL;
+	rx_chn->pages = devm_kcalloc(dev, rx_chn->descs_num, sizeof(*rx_chn->pages), GFP_KERNEL);
+	if (!rx_chn->pages)
+		return -ENOMEM;
+
 	common->rx_flow_id_base =
 			k3_udma_glue_rx_get_flow_id_base(rx_chn->rx_chn);
 	dev_info(dev, "set new flow-id-base %u\n", common->rx_flow_id_base);
@@ -2252,6 +2641,9 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 				  NETIF_F_HW_TC;
 	port->ndev->features = port->ndev->hw_features |
 			       NETIF_F_HW_VLAN_CTAG_FILTER;
+	port->ndev->xdp_features = NETDEV_XDP_ACT_BASIC |
+				   NETDEV_XDP_ACT_REDIRECT |
+				   NETDEV_XDP_ACT_NDO_XMIT;
 	port->ndev->vlan_features |=  NETIF_F_SG;
 	port->ndev->netdev_ops = &am65_cpsw_nuss_netdev_ops;
 	port->ndev->ethtool_ops = &am65_cpsw_ethtool_ops_slave;
@@ -2315,6 +2707,8 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 	if (ret)
 		dev_err(dev, "failed to add percpu stat free action %d\n", ret);
 
+	port->xdp_prog = NULL;
+
 	if (!common->dma_ndev)
 		common->dma_ndev = port->ndev;
 
@@ -2940,9 +3334,9 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	struct device_node *node;
 	struct resource *res;
 	struct clk *clk;
+	int ale_entries;
 	u64 id_temp;
 	int ret, i;
-	int ale_entries;
 
 	common = devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP_KERNEL);
 	if (!common)
@@ -3154,10 +3548,10 @@ static int am65_cpsw_nuss_suspend(struct device *dev)
 static int am65_cpsw_nuss_resume(struct device *dev)
 {
 	struct am65_cpsw_common *common = dev_get_drvdata(dev);
+	struct am65_cpsw_host *host_p = am65_common_get_host(common);
 	struct am65_cpsw_port *port;
 	struct net_device *ndev;
 	int i, ret;
-	struct am65_cpsw_host *host_p = am65_common_get_host(common);
 
 	ret = am65_cpsw_nuss_init_tx_chns(common);
 	if (ret)
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 7da0492dc091..5ee5b469d85a 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/ti/k3-ringacc.h>
 #include <net/devlink.h>
+#include <net/xdp.h>
 #include "am65-cpsw-qos.h"
 
 struct am65_cpts;
@@ -56,10 +57,18 @@ struct am65_cpsw_port {
 	bool				rx_ts_enabled;
 	struct am65_cpsw_qos		qos;
 	struct devlink_port		devlink_port;
+	struct bpf_prog			*xdp_prog;
+	struct xdp_rxq_info		xdp_rxq;
 	/* Only for suspend resume context */
 	u32				vid_context;
 };
 
+enum am65_cpsw_tx_buf_type {
+	AM65_CPSW_TX_BUF_TYPE_SKB,
+	AM65_CPSW_TX_BUF_TYPE_XDP_TX,
+	AM65_CPSW_TX_BUF_TYPE_XDP_NDO,
+};
+
 struct am65_cpsw_host {
 	struct am65_cpsw_common		*common;
 	void __iomem			*port_base;
@@ -74,6 +83,7 @@ struct am65_cpsw_tx_chn {
 	struct am65_cpsw_common	*common;
 	struct k3_cppi_desc_pool *desc_pool;
 	struct k3_udma_glue_tx_channel *tx_chn;
+	enum am65_cpsw_tx_buf_type buf_type;
 	spinlock_t lock; /* protect TX rings in multi-port mode */
 	struct hrtimer tx_hrtimer;
 	unsigned long tx_pace_timeout;
@@ -89,7 +99,10 @@ struct am65_cpsw_rx_chn {
 	struct device *dma_dev;
 	struct k3_cppi_desc_pool *desc_pool;
 	struct k3_udma_glue_rx_channel *rx_chn;
+	struct page_pool *page_pool;
+	struct page **pages;
 	u32 descs_num;
+	unsigned char dsize_log2;
 	int irq;
 };
 

-- 
2.37.3

