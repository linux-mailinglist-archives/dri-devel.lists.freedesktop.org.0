Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BF88A801
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 17:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1920C10E4BD;
	Mon, 25 Mar 2024 16:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DQvlA7z1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE59D10E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:00:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33eee0258abso2010132f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711382447; x=1711987247;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
 b=DQvlA7z1kiq4D3KCQknmGBRBPiVISrxzWLYllQE8hr5KIV/CQb8+0YO/4zUAkLSlrf
 wwtM2SY3DYrkURpGVScvpGTPJYmT8gUeD+a2nmRskl0hJW4UJnFPs6YFxOOqyzRjOq72
 XhcY3ba9QkjtnuyvQGjsjHpCMx4Gj55XZLKOp3TbSooZbF8o04hGlYKmV1nZRTDs1geH
 5kr+NA1nAgjRs+s4SsIZZMUX6vQRL26qvhLUDazQBnbbkMeDTiBnEj3bWvxp7wNx1tBI
 bmj0gGYwK/d5UZhMkv76P4rFHeqVI1Qy8YeM44Z+1uPVHwbHchZYOvn0/ZcY2fbTnYD8
 qRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711382447; x=1711987247;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XguyOTPW8SaIMkmqZ21Rgli3joUrKCpC0w2AVoDmBo8=;
 b=chkp21B4k03CCZUtA3IZ8sJbLQSrMnihLP2txmY/pvpJwIZeLUdUaUEcDhaHQ9agSA
 Duizz1TXz++9uc7kYqFKeckTldvpjVkvXTJ5NcwdFSRVq5B7sQ54DuhapJPAvUdKPfOm
 BtcggtOjpqHPLMPzQ5RkOPZXLtPkh612i6DaJYzrdzW3XpGAXBH61rmJxh8bTlK32THP
 nco2/nbnW1IhvTIzbfw6UsLr7WQOKWJ1QhLk3K8cPR9IWQubUWabsxnxMSnIVZ+601bU
 LnmZ7GO+wrTthn9gAej7BrgnvSqq9hUMc38cxO060DYD9xXq9avam1XBm23W7xxW60Fs
 kL2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWaOoJ1xOVA829dfUrSR5v4ilB/7rrTDRTXdoKxyv8plxUwSK/FoWyEtKl26RPgCg4d6lNgJu+mWGH+qHCMiwHcFxrmpvHzl8iE77dI9fT
X-Gm-Message-State: AOJu0YzreKZDovzuvP6c0EI26u6KOKT03wvE/HuEKejiw7sLWPFjrv4B
 6cRardMa53A1CBJkSl1qTTSDrRK86lnf97MlGL1pQZ/l5EvkHKzL5VFhnyiG+DU=
X-Google-Smtp-Source: AGHT+IHAQQRHljpHUkf1aqxlBTu/wdvUc6/R03vZ10abjHEyq0wyR/SvNz2BJXeAO3tvcYuIXdvPCA==
X-Received: by 2002:a5d:51d1:0:b0:33e:34b7:895f with SMTP id
 n17-20020a5d51d1000000b0033e34b7895fmr5048233wrv.24.1711382447213; 
 Mon, 25 Mar 2024 09:00:47 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 r17-20020adff711000000b0033b6e26f0f9sm9839361wrp.42.2024.03.25.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:00:46 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH net-next v4 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Date: Mon, 25 Mar 2024 17:00:34 +0100
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKfAWYC/42OzWrDMBCEXyXo3G31ZyHn1PcoIexKSq0Sy0Yyj
 kPwu1fxsYTi4+zMfDsPVkKOobDj4cFymGOJQ6pCvx2Y6zB9B4i+aia51FxKBdibBtxYbrD4EQh
 LdKA9WWkbbklbVpv1GoAyJtc9uz8jplg+av7cY0zXmMJ55s/gmMMlLtv7L5bCBCksEztVp4tlG
 vJ92zWLzf93wixAQHvhZBx5VIJ/Et6vkXJ4d0O/IWe5AyOBAxfOOESHROYFRu3AqIppfKs1tt5
 qfLVG78DoilFWGYFGobb0B7Ou6y/0kPBSwQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711382445; l=2133;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=wqQe2DJZDzzMYImWv6Ki1IImWaVqSXITlgGJEpik5FA=;
 b=P1yzfio0eDcxAyUAY/a+nfJisXG0eTNG56agA256QD3aW0IbWjpNBGzvns98Nsg9Qqsm9+Nq5
 4QVR/fm2KNpAOWGfAES1MKvawg2+uGBn3Y7SBGyJB+8SciyAJxTQ5R3
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
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  36 ++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   4 +
 4 files changed, 539 insertions(+), 50 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>

