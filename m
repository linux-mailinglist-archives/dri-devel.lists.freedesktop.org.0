Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D04871CF3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C50112A31;
	Tue,  5 Mar 2024 11:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ocIm3V/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212FE112A31
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:08:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-412ebda8772so4367115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709636906; x=1710241706;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2zzbGg5DxMcKg+Wn+y5TMC+EDQP0gtLCqVdY8y5cvlU=;
 b=ocIm3V/8v9POYJulDOs2A/ehAEg+axzZfgeIuxxuBohaaMo5qu1y73ImcDSGbIZo8k
 IOaw/JJBcm+1KD/hEAKucR4d9jkRnbN9Qo2DnhLV4UanMabciZNvKStSZv2rf34h7Boc
 kp1cHfKnk6bULtIWBNEvUmh6RziipoWpSh5RCADvXYHMTd45V9Jikjf/bRkCYVLlocdS
 0Bsixv7JhqNotTNz7zCBIpvkyf+tKBCCwuZa0/eYUDji0MKii+J5SiOiedxy1oogFKA1
 2UyX67UxiqsPsm87WQGANa+J+IOvWfwAoB9zUNSajsTM2L2dAmeQGPnshiwpb2mJoK+L
 721Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709636906; x=1710241706;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zzbGg5DxMcKg+Wn+y5TMC+EDQP0gtLCqVdY8y5cvlU=;
 b=pR/RWcbO+FbxtZWuYUkeme4leJ898F0mvflh59oHlOURKLa4eJnfhXcB1UL1bZvzyu
 wBYoMgBXLMMnz3pPZYUKM5ZMgNz5NjZx9ba+p29kRHfm1ONYSu1EpxI9ZkOrfkfDW8nE
 bIInBDoW6U4flbJrwkaQQU/wSJXpvbabGnOIQ7FH7yGmopwvt3hJnvcYVO78viBhteaz
 /X0NslvkuYnthxg+f5GLJRsU9qofovLcM3ym6lRabRV5opcqHKBVtqizAIJhTUgrzTjx
 gEJjsrw6ifqEHpOhm9HHnBoiJAcpEgW26T+iuDC+eKf5fCF9aCEW25/5ULgC9OzvfDgX
 c9DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3q8y7gup9V2iuMVonUZBd1pJuDPpqiteC7s7Xjfdjh0K9BKMkiT9Uq/cUxxuy+wQJNs2XERszWIBnn0MNVBIX7NQDR7D7DuD4hkj+nty9
X-Gm-Message-State: AOJu0YzLyYVmhJtgOL/reWKLQcIw7VET2IFHM8y3ijzxdk/STESMLFlZ
 76YEtLClwiR1ebx06HaqlS0cWZDC8ZoagepUH4zoa/C8ugO+oC06/lo3pCFEnEU=
X-Google-Smtp-Source: AGHT+IGRxGk+xJyDqCA5anCR8v5jNbheWp9RZkTgBpd6K3gXbnnzru7ijy8eprwWtmMtcK5CTTtdeg==
X-Received: by 2002:adf:a4d3:0:b0:33d:76a9:89ae with SMTP id
 h19-20020adfa4d3000000b0033d76a989aemr7487876wrb.12.1709636906280; 
 Tue, 05 Mar 2024 03:08:26 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d59c7000000b0033e475940fasm2190993wry.66.2024.03.05.03.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:08:25 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v3 0/3] DONOTMERGE: Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Tue, 05 Mar 2024 12:08:17 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACH95mUC/42OwQrCMBBEf0VydjVJa6me/A+RsruNdsWmJZGoS
 P/d1KMH8TjDzJt5qeiCuKh2i5cKLkmUwWdRLBeKO/RnB9Jmray2pba2AOyrDfAY7/BoRyCMwlC
 2VNt6o2sqa5Wb2XVAAT13c/cyope4zvmmR/FX8a5Jeg6OwZ3k8Zk/HLPuJN6G8Py8SWZ2fw8nA
 wa2J00VU4uF0XvC51UouBUPvZqRyf6BsaBBG64YkZGo+sJM0/QG4HMIbCkBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709636903; l=2299;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=AEoPkt3FD7wIqhqIzLlHWU/Ex7SJaJ7jvu1zQhoBqVo=;
 b=HxivJ2c/NUSganuMDahxATBJ2FV7Y9CCIoAVp5MvVm3vlPH9Vacrjv2erzJ6+5qN+/Lw2SdzG
 zuw41mWGj/2BFnwMRhepdFtJTS+jWgmue6nNtWlca6t9YrxWyNFQEIB
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

This patch adds XDP support to TI AM65 CPSW Ethernet driver.

The following features are implemented: NETDEV_XDP_ACT_BASIC,
NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.

Zero-copy and non-linear XDP buffer supports are NOT implemented.

Besides, the page pool memory model is used to get better performance.
However, additional testing with iperf3 revealed that the performance
is worse while using page pool (that's why a DONOTMERGE tag is added
to this v3). As mentioned in the discussion about v2, with none XDP
traffic:
- Before = without page pool -> 500 MBits/sec
- After = with page pool -> 442 MBits/sec
-> So, ~ 10% worse with page pool here.
Note that the page pool 'dma_dir' parameter is set as DMA_BIDIRECTIONAL
because eth0, for instance, could get an XDP program attached while eth1
would not.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v3:
- Fix a potential issue with TX buffer type, which is now set for each buffer.
- Add benchmark numbers (with VS without page pool) in the commit description.
- Link to v2: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com

Changes in v2:
- Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
- In am65_cpsw_alloc_skb(), release reference on the page pool page
in case of error returned by build_skb().
- [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
- [nit] Arrange local variables in reverse xmas tree order.
- Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com

---
Julien Panis (3):
      net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
      net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
      net: ethernet: ti: am65-cpsw: Add minimal XDP support

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 533 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  36 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 536 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

