Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9388FB54
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD17112395;
	Thu, 28 Mar 2024 09:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2pqnEfuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B65E112395
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:26:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4154614b47eso1369075e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711618009; x=1712222809;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=037yUICN8Zj6LjDic8LC2UDwvIudLoxg0PS899BrnwU=;
 b=2pqnEfuSOi4EQkVgshTZhEPOCexlbmzLOak87I2x3KJtgnCvVIci7Vv9nBogCSqdNA
 WVSf6b9o89GJZBDXc96d65BMPUp3/bAFH7+BuhSibv6GSiQHIQZiRQBBcCPp7JJ0wQCy
 9xgp0xxTgtCpn2bdD/AOLi2UpXtUeTpyKDKnCnwJ84DHMOPj2BHsaD/3jIMbye4ai2wh
 Va8IuzQukDtL32MIAG4LfAsZ2E3p83vjayLlZ1C02v2RONYsmkVNwiCqfjUWqan4nFQc
 frdhTwwi163zaBsHNZZI7M0a1t/HmgXFUMjeMxUATKzmLDkqlyw/00HCA8b91wZAwXxO
 OLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711618009; x=1712222809;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=037yUICN8Zj6LjDic8LC2UDwvIudLoxg0PS899BrnwU=;
 b=k8ystX0E7XwnQejTzieOT+K6nHYEuOkN2TpxiitIJaEOfsZxjTobtGD0qZ1DkgPYEF
 QX6pfPjj2nlhEWueC23yV+iKG0WWNP/jjbUVTTPJG0Zh8+nLbtgCDqlzrJis3wx80DXT
 x7H/0wdUlUo7lMF7bVv/cTN0vi4zh/2IJ8AHkdL7PeNB5fAO2BqQ5W/3KOXIoRwpKPIx
 bfExUqeIWblB5XOdSEDJLFu4Ri8lks/xI9a0bzE3+7i8tZELAm8P2e/512OMwKyiK49n
 N/92aCtuQBJzzX/DayOKLEBiffhrZoy5ioawpejMXyghu4DN3oi4qu4aitYR3ZwWiphe
 aBDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC8kdVWGHoOtOPomUBhccWfEoQeyteRQpKKWcNSC1DO0cijds3SQbllzVDOpgznvxXF3N7e7CMFSFGsvJffR2eeibC+BHD6ergW3AP+hGX
X-Gm-Message-State: AOJu0YxDb4MjTFDokh0NUW0z+EivNnALo3adlmxj3TIXEaarD60qLuK+
 vPNYLBiJLTCwcegjasUa0U21wB56Kp0Pq1KP6aParBpnHXICqe7r3aMrDMcJUVQMXGu1RnsvZ03
 7
X-Google-Smtp-Source: AGHT+IHLaIIbZsEZxQrLnlbH1qW6VXrNaf2xZGc7tS9bHD/eGEFPYn/1xJdx7j9BXHFyl+/lKz2TvQ==
X-Received: by 2002:a05:600c:4ec9:b0:413:4299:ec9f with SMTP id
 g9-20020a05600c4ec900b004134299ec9fmr1547318wmq.5.1711618009022; 
 Thu, 28 Mar 2024 02:26:49 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 bd17-20020a05600c1f1100b0041493615585sm1673414wmb.39.2024.03.28.02.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:26:48 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v5 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Thu, 28 Mar 2024 10:26:39 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM83BWYC/42OzWrDMBCEX8XonG31Z6Hk1PcoJaykTa0Sy0Yyr
 kPwu1fxrSUUH2dn5tu5s0I5UmGn5s4yzbHEIVXRHhrmO0yfBDFUzSSXmkupAHvTgh/LNyxhBIc
 letDBWWlbbp22rDbrlcBlTL57dL9GTLG81vy5x5iuMdF55o/gmOkSl+39O0s0QaJlYh/V6WKZh
 nzbds1i8/+dMAsQcLxwZ7wLqAR/c3i7RpfpxQ/9hpzlDowEDlx44xE9OmeeYNQOjKqYNhy1xmO
 wGp+t0TswumKUVUagUait+405NDvqknRLbSDPtf2zYl3XHyFW71IAAgAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711618007; l=2325;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=mxI3dtUqp9zmMAmwAry/PSUUjVo2cudQ7Rm8VoOQs1o=;
 b=pjxRZGc0ZNpjhrrYX6GeGUAvpeXEIOE/nsO2hVShrS5g59uZ1sRp2gLtRwpsGynFeMC9ZhpZa
 6vct8jvI5BHCfrrVXO25rVE271WkqGcmgRGQbW51w0gjb7g5yqOrSao
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

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v5:
- In k3_cppi_desc_pool_destroy(), free memory allocated for desc_infos.
- Link to v4: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com

Changes in v4:
- Add skb_mark_for_recycle() in am65_cpsw_nuss_rx_packets() function.
- Specify napi page pool parameter in am65_cpsw_create_xdp_rxqs() function.
- Add benchmark numbers (with VS without page pool) in the commit description.
- Add xdp_do_flush() in am65_cpsw_run_xdp() function for XDP_REDIRECT case.
- Link to v3: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com

Changes in v3:
- Fix a potential issue with TX buffer type, which is now set for each buffer.
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

 drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 536 +++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  37 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 540 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

