Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B6B86123C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05C610EC02;
	Fri, 23 Feb 2024 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CDt0Ku0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551910EBB1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:02:14 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d2531294faso11192941fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708686132; x=1709290932;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T4/Oils4dMi6DnXoCiXpKiFP66KSJjo2vzfJqhdN6wQ=;
 b=CDt0Ku0oR4HzSpjE3hsrlnD1huDV+bwk7rTbuvIGCiBYpo8lqTfNEVnje8ak6TXx/C
 SihF363N4X2E6DwHEa8FU781sw2lUK3U8FB5Z18M+8uUfoLaYDfF4x2XdxagESoTtYPX
 mN2O7B5sDePL0F9HSdlMn98S5FjcFWJ65aqEO2+piMikYCKEco/pHCMP3dumC3E1yMmY
 yMob9VDiHSyFMh+ylRERH+xXPZGQdKhcOkIhasrGEnUKJg4L+hvIGU8UHyhOXQa1oCF+
 bwRaGvTdKRWla8rgzLGpYLoB25XGz/bUQUbNVuua3l4ThuHIdYG16fGZuuffd2GSXy/D
 64hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708686132; x=1709290932;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4/Oils4dMi6DnXoCiXpKiFP66KSJjo2vzfJqhdN6wQ=;
 b=M0JQKyxooK61z5lTT15dVY1lA1KR9uslOXNjXJUoGokxANwLjcn3+QEt1zYvIJ68dL
 daR1EGZwl6ZzkfH5MsCmqRu/E84KEEaKiWvOdA9N8qAUogX8MVt1bh2gzN5TT98c9fx1
 1x/DvSwuxBAOOvFhyU3BaR/ZnPReSPL+oTNUeA8oKch+h9WVTv1C4QZWQxNZTEC44wTj
 4jnvDgKo3K7s1rYAOdUmCHn++XkZkyqQ+edY72AO1HQrCZcuKTvHhJrwYApo9D7JC4sX
 RRtvnZj6Bw4LUe0JBkrh33hUHCQ3si4f3wJl0mN0jyDsr0kZ/Qv9ilNvb7K7hiOOWp9f
 4YAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPSbYg0wdPNgIuidB5xBi5R1T3cGgHMrE4wDiRbUs9q+FXz8IaM8kWYG/iQVOMFzR6TeUkMBYhPqO7EqPeWkQSwi1Up9IKAeWX/hym83bE
X-Gm-Message-State: AOJu0YxndynAjf003Xp+CDhjlOHSARnyin3hZIlPZ/Rnb9DQ2DeFP1am
 XoblgDeLAL9YdTmu5pKpXDRs8Wn1N+n9E0/+o1ea+sA9FPwO1Bp+BAacGbgNoiA=
X-Google-Smtp-Source: AGHT+IGe6NrMVx3QNu4DVZNW1I++0CUx85oCa3jxIVqAXxqnQ14o/Qf+tFQI1wrRjTDItkH2MTyacw==
X-Received: by 2002:a2e:95c6:0:b0:2d2:5430:605a with SMTP id
 y6-20020a2e95c6000000b002d25430605amr1114617ljh.7.1708686132266; 
 Fri, 23 Feb 2024 03:02:12 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 e17-20020a056000195100b0033b60bad2fcsm2363745wry.113.2024.02.23.03.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 03:02:11 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 23 Feb 2024 12:01:37 +0100
Subject: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABB72GUC/x2NUQrCMBAFr1L228UYUwleRaRsktWu2BiyUAuld
 zf1cx4zvBWUq7DCtVuh8iwqn9zgdOggjpSfjJIagzXWGWvPSNOlx1j0i0sqGEglokvBW98bH5y
 HVraVMVTKcdzbV6Esemz+MJHkt2QeZrOLpfJDlv/97b5tP87IniyOAAAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708686130; l=20210;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=PVvzGTB+DdAhYFzi2A9SFrTtfoZLsYbD95ro9qa4eAw=;
 b=R668PkKPyqv/S344bX8/DdFYAiqKX9ex8ag8vg+0O3atU5fxK/DGdluiecOeyhezejlUqAQN2
 O5TAoUadAOXBNdElvx5/NinLyC7z6PlGbftfTQs+x1F046v8irvMyMy
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:07:09 +0000
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

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 366 +++++++++++++++++++++++++++++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |   9 +
 2 files changed, 351 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 9d2f4ac783e4..080910f45629 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -5,6 +5,7 @@
  *
  */
 
+#include <linux/bpf_trace.h>
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
@@ -138,6 +139,17 @@
 
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
@@ -369,6 +381,30 @@ static void am65_cpsw_init_host_port_emac(struct am65_cpsw_common *common);
 static void am65_cpsw_init_port_switch_ale(struct am65_cpsw_port *port);
 static void am65_cpsw_init_port_emac_ale(struct am65_cpsw_port *port);
 
+static void am65_cpsw_destroy_xdp_rxq(struct am65_cpsw_port *port)
+{
+	struct xdp_rxq_info *rxq = &port->xdp_rxq;
+
+	if (xdp_rxq_info_is_reg(rxq))
+		xdp_rxq_info_unreg(rxq);
+}
+
+static int am65_cpsw_create_xdp_rxq(struct am65_cpsw_port *port)
+{
+	struct xdp_rxq_info *rxq = &port->xdp_rxq;
+	int ret;
+
+	ret = xdp_rxq_info_reg(rxq, port->ndev, port->port_id - 1, 0);
+	if (ret)
+		return ret;
+
+	ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_ORDER0, NULL);
+	if (ret)
+		xdp_rxq_info_unreg(rxq);
+
+	return ret;
+}
+
 static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct am65_cpsw_rx_chn *rx_chn = data;
@@ -440,6 +476,27 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
 	dev_kfree_skb_any(skb);
 }
 
+static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
+{
+	struct page *page;
+	struct sk_buff *skb;
+
+	page = dev_alloc_pages(0);
+	if (unlikely(!page))
+		return NULL;
+
+	len += AM65_CPSW_HEADROOM;
+
+	skb = build_skb(page_address(page), len);
+	if (unlikely(!skb))
+		return NULL;
+
+	skb_reserve(skb, AM65_CPSW_HEADROOM + NET_IP_ALIGN);
+	skb->dev = ndev;
+
+	return skb;
+}
+
 static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 {
 	struct am65_cpsw_host *host_p = am65_common_get_host(common);
@@ -506,9 +563,7 @@ static int am65_cpsw_nuss_common_open(struct am65_cpsw_common *common)
 	am65_cpsw_qos_tx_p0_rate_init(common);
 
 	for (i = 0; i < common->rx_chns.descs_num; i++) {
-		skb = __netdev_alloc_skb_ip_align(NULL,
-						  AM65_CPSW_MAX_PACKET_SIZE,
-						  GFP_KERNEL);
+		skb = am65_cpsw_alloc_skb(NULL, AM65_CPSW_MAX_PACKET_SIZE);
 		if (!skb) {
 			ret = -ENOMEM;
 			dev_err(common->dev, "cannot allocate skb\n");
@@ -648,6 +703,8 @@ static int am65_cpsw_nuss_ndo_slave_stop(struct net_device *ndev)
 
 	phylink_disconnect_phy(port->slave.phylink);
 
+	am65_cpsw_destroy_xdp_rxq(port);
+
 	ret = am65_cpsw_nuss_common_stop(common);
 	if (ret)
 		return ret;
@@ -719,6 +776,10 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 
 	common->usage_count++;
 
+	ret = am65_cpsw_create_xdp_rxq(port);
+	if (ret)
+		goto error_cleanup;
+
 	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
 
 	if (common->is_emac_mode)
@@ -749,6 +810,138 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	return ret;
 }
 
+static int am65_cpsw_xdp_tx_frame(struct net_device *ndev,
+				  struct am65_cpsw_tx_chn *tx_chn,
+				  struct xdp_frame *xdpf)
+{
+	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+	struct netdev_queue *netif_txq;
+	struct cppi5_host_desc_t *host_desc;
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
+static int am65_cpsw_run_xdp(struct am65_cpsw_port *port, struct xdp_buff *xdp, int cpu, int *len)
+{
+	struct net_device *ndev = port->ndev;
+	struct am65_cpsw_tx_chn *tx_chn;
+	struct netdev_queue *netif_txq;
+	struct bpf_prog *prog;
+	struct xdp_frame *xdpf;
+	struct page *page;
+	u32 act;
+	int ret = AM65_CPSW_XDP_CONSUMED;
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
+		tx_chn = &am65_ndev_to_common(ndev)->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
+		netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+
+		xdpf = xdp_convert_buff_to_frame(xdp);
+		if (unlikely(!xdpf))
+			break;
+
+		__netif_tx_lock(netif_txq, cpu);
+		tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_XDP;
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
+	page = virt_to_page(xdp->data);
+	put_page(page);
+out:
+	return ret;
+}
+
 static void am65_cpsw_nuss_rx_ts(struct sk_buff *skb, u32 *psdata)
 {
 	struct skb_shared_hwtstamps *ssh;
@@ -795,7 +988,7 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
 }
 
 static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
-				     u32 flow_idx)
+				     u32 flow_idx, int cpu)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
@@ -804,11 +997,14 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 	struct cppi5_host_desc_t *desc_rx;
 	struct device *dev = common->dev;
 	struct sk_buff *skb, *new_skb;
+	struct xdp_buff	xdp;
 	dma_addr_t desc_dma, buf_dma;
 	struct am65_cpsw_port *port;
 	struct net_device *ndev;
+	struct page *page;
 	void **swdata;
 	u32 *psdata;
+	int headroom;
 	int ret = 0;
 
 	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_idx, &desc_dma);
@@ -851,7 +1047,23 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
 
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
-	new_skb = netdev_alloc_skb_ip_align(ndev, AM65_CPSW_MAX_PACKET_SIZE);
+	if (port->xdp_prog) {
+		xdp_init_buff(&xdp, AM65_CPSW_MAX_PACKET_SIZE, &port->xdp_rxq);
+
+		page = virt_to_page(skb->data);
+		xdp_prepare_buff(&xdp, page_address(page), skb_headroom(skb), pkt_len, false);
+
+		ret = am65_cpsw_run_xdp(port, &xdp, cpu, &pkt_len);
+		if (ret != AM65_CPSW_XDP_PASS)
+			return ret;
+
+		/* Compute additional headroom to be reserved */
+		headroom = (xdp.data - xdp.data_hard_start) - skb_headroom(skb);
+		skb_reserve(skb, headroom);
+	}
+
+	/* Pass skb to netstack if no XDP prog or returned XDP_PASS */
+	new_skb = am65_cpsw_alloc_skb(ndev, AM65_CPSW_MAX_PACKET_SIZE);
 	if (new_skb) {
 		ndev_priv = netdev_priv(ndev);
 		am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
@@ -901,6 +1113,7 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 {
 	struct am65_cpsw_common *common = am65_cpsw_napi_to_common(napi_rx);
 	int flow = AM65_CPSW_MAX_RX_FLOWS;
+	int cpu = smp_processor_id();
 	int cur_budget, ret;
 	int num_rx = 0;
 
@@ -909,7 +1122,7 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 		cur_budget = budget - num_rx;
 
 		while (cur_budget--) {
-			ret = am65_cpsw_nuss_rx_packets(common, flow);
+			ret = am65_cpsw_nuss_rx_packets(common, flow, cpu);
 			if (ret)
 				break;
 			num_rx++;
@@ -938,8 +1151,8 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 }
 
 static struct sk_buff *
-am65_cpsw_nuss_tx_compl_packet(struct am65_cpsw_tx_chn *tx_chn,
-			       dma_addr_t desc_dma)
+am65_cpsw_nuss_tx_compl_packet_skb(struct am65_cpsw_tx_chn *tx_chn,
+				   dma_addr_t desc_dma)
 {
 	struct am65_cpsw_ndev_priv *ndev_priv;
 	struct am65_cpsw_ndev_stats *stats;
@@ -968,6 +1181,39 @@ am65_cpsw_nuss_tx_compl_packet(struct am65_cpsw_tx_chn *tx_chn,
 	return skb;
 }
 
+static struct xdp_frame *
+am65_cpsw_nuss_tx_compl_packet_xdp(struct am65_cpsw_common *common,
+				   struct am65_cpsw_tx_chn *tx_chn,
+				   dma_addr_t desc_dma,
+				   struct net_device **ndev)
+{
+	struct am65_cpsw_port *port;
+	struct am65_cpsw_ndev_priv *ndev_priv;
+	struct am65_cpsw_ndev_stats *stats;
+	struct cppi5_host_desc_t *desc_tx;
+	struct xdp_frame *xdpf;
+	void **swdata;
+	u32 port_id = 0;
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
@@ -994,6 +1240,7 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 	unsigned int total_bytes = 0;
 	struct net_device *ndev;
 	struct sk_buff *skb;
+	struct xdp_frame *xdpf;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
 
@@ -1013,10 +1260,16 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
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
+			xdp_return_frame(xdpf);
+		}
 		num_tx++;
 
 		netif_txq = netdev_get_tx_queue(ndev, chn);
@@ -1040,6 +1293,7 @@ static int am65_cpsw_nuss_tx_compl_packets_2g(struct am65_cpsw_common *common,
 	unsigned int total_bytes = 0;
 	struct net_device *ndev;
 	struct sk_buff *skb;
+	struct xdp_frame *xdpf;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
 
@@ -1057,11 +1311,16 @@ static int am65_cpsw_nuss_tx_compl_packets_2g(struct am65_cpsw_common *common,
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
+			xdp_return_frame(xdpf);
+		}
 		num_tx++;
 	}
 
@@ -1166,6 +1425,8 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 	tx_chn = &common->tx_chns[q_idx];
 	netif_txq = netdev_get_tx_queue(ndev, q_idx);
 
+	tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_SKB;
+
 	/* Map the linear buffer */
 	buf_dma = dma_map_single(tx_chn->dma_dev, skb->data, pkt_len,
 				 DMA_TO_DEVICE);
@@ -1185,8 +1446,8 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 
 	cppi5_hdesc_init(first_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
 			 AM65_CPSW_NAV_PS_DATA_SIZE);
-	cppi5_desc_set_pktids(&first_desc->hdr, 0, 0x3FFF);
-	cppi5_hdesc_set_pkttype(first_desc, 0x7);
+	cppi5_desc_set_pktids(&first_desc->hdr, 0, AM65_CPSW_CPPI_TX_FLOW_ID);
+	cppi5_hdesc_set_pkttype(first_desc, AM65_CPSW_CPPI_TX_PKT_TYPE);
 	cppi5_desc_set_tags_ids(&first_desc->hdr, 0, port->port_id);
 
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
@@ -1488,6 +1749,58 @@ static void am65_cpsw_nuss_ndo_get_stats(struct net_device *dev,
 	stats->tx_dropped	= dev->stats.tx_dropped;
 }
 
+static int am65_cpsw_xdp_prog_setup(struct net_device *ndev, struct bpf_prog *prog)
+{
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+	struct bpf_prog *old_prog;
+	bool running = netif_running(ndev);
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
+	tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_XDP;
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
@@ -1502,6 +1815,8 @@ static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
 	.ndo_eth_ioctl		= am65_cpsw_nuss_ndo_slave_ioctl,
 	.ndo_setup_tc           = am65_cpsw_qos_ndo_setup_tc,
 	.ndo_set_tx_maxrate	= am65_cpsw_qos_ndo_tx_p0_set_maxrate,
+	.ndo_bpf		= am65_cpsw_ndo_bpf,
+	.ndo_xdp_xmit		= am65_cpsw_ndo_xdp_xmit,
 };
 
 static void am65_cpsw_disable_phy(struct phy *phy)
@@ -1816,6 +2131,8 @@ static int am65_cpsw_nuss_init_tx_chns(struct am65_cpsw_common *common)
 			goto err;
 		}
 
+		tx_chn->buf_type = AM65_CPSW_TX_BUF_TYPE_SKB;
+
 		tx_chn->irq = k3_udma_glue_tx_get_irq(tx_chn->tx_chn);
 		if (tx_chn->irq < 0) {
 			dev_err(dev, "Failed to get tx dma irq %d\n",
@@ -1873,11 +2190,7 @@ static void am65_cpsw_nuss_remove_rx_chns(void *data)
 
 	netif_napi_del(&common->napi_rx);
 
-	if (!IS_ERR_OR_NULL(rx_chn->desc_pool))
-		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
-
-	if (!IS_ERR_OR_NULL(rx_chn->rx_chn))
-		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
+	am65_cpsw_nuss_free_rx_chns(common);
 
 	common->rx_flow_id_base = -1;
 }
@@ -2252,6 +2565,9 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 				  NETIF_F_HW_TC;
 	port->ndev->features = port->ndev->hw_features |
 			       NETIF_F_HW_VLAN_CTAG_FILTER;
+	port->ndev->xdp_features = NETDEV_XDP_ACT_BASIC |
+				   NETDEV_XDP_ACT_REDIRECT |
+				   NETDEV_XDP_ACT_NDO_XMIT;
 	port->ndev->vlan_features |=  NETIF_F_SG;
 	port->ndev->netdev_ops = &am65_cpsw_nuss_netdev_ops;
 	port->ndev->ethtool_ops = &am65_cpsw_ethtool_ops_slave;
@@ -2315,6 +2631,8 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 	if (ret)
 		dev_err(dev, "failed to add percpu stat free action %d\n", ret);
 
+	port->xdp_prog = NULL;
+
 	if (!common->dma_ndev)
 		common->dma_ndev = port->ndev;
 
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 7da0492dc091..6fbb975427df 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/soc/ti/k3-ringacc.h>
 #include <net/devlink.h>
+#include <net/xdp.h>
 #include "am65-cpsw-qos.h"
 
 struct am65_cpts;
@@ -56,10 +57,17 @@ struct am65_cpsw_port {
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
+	AM65_CPSW_TX_BUF_TYPE_XDP,
+};
+
 struct am65_cpsw_host {
 	struct am65_cpsw_common		*common;
 	void __iomem			*port_base;
@@ -74,6 +82,7 @@ struct am65_cpsw_tx_chn {
 	struct am65_cpsw_common	*common;
 	struct k3_cppi_desc_pool *desc_pool;
 	struct k3_udma_glue_tx_channel *tx_chn;
+	enum am65_cpsw_tx_buf_type buf_type;
 	spinlock_t lock; /* protect TX rings in multi-port mode */
 	struct hrtimer tx_hrtimer;
 	unsigned long tx_pace_timeout;

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

