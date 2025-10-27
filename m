Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7601C0C5CE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C798710E404;
	Mon, 27 Oct 2025 08:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TYx4aSvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A02D10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:43:57 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-290ab379d48so40144625ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761554636; x=1762159436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XdBHtrgp03ghVnsbwdnfe2LK03D2az8OLXtLHgvnDs=;
 b=TYx4aSvo99Ds9k3Dh9WJyt5ZQYfknOHNlAbdvA8ciSjQC47NrA4d1AhBcK4WYZ9Eey
 LFns8W51/l0q7thiOLbytufmTzA+vhaCqXATUL0FbWgazsOzYIpT65aAd+R7TAiMvzc4
 iTii0Jxq2MS98NylqErq44vzxgQJgBQinZx3H2YjEiYAw2xToiC+p5Ia8G8Vjcx+9M+J
 HORZ03hcs5PYnodWW+jrdqsjAMG21vUTcnCkiZ8x5kn3/xCbFRpVOs2sicmEpxdYS9Nk
 rjaXONejgj2wRlqNZIQWL1B9oRQeCkhfAuGij4sWAixtJAyeMTzXVNmkTBxcjIL93Zns
 ZAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761554636; x=1762159436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XdBHtrgp03ghVnsbwdnfe2LK03D2az8OLXtLHgvnDs=;
 b=JYzuPgRmO5CiKr64YITOl3UhpHln5nfCH4mq6iYYUzaBEMFWbYZWQo2cEmWJDcnBbz
 rv24iaW6DcUKxUJ3zKYjpf23G7FG7TvZmtzqGbcnwxXr6bpBMB4B/cBCLT/vuKwsLOSF
 pYVGx494qj5rcCY5SUd1gsXd6wfnpPfXniQhNYu/jQksldP2xEyKf5IAnAQh7RwJydoY
 k3/c0tQC2znuvYrFDQ8LgBmhZpwoq39zHylQs72sv6ceuCW/tHJ2VQjiI14eVyIqzwcO
 XSK7tH6IqWilMtdhDwEYVooQO2hpLy3kUgNS39q8+1ucPQY6eWHJPnVhRJ4hZifsVG9l
 bipA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0h4Dy1Z5Gg1WFz7KVPYYF5uvaKT2o8H3JXtklNxZwyDSodanRfZuuWj8PYxxHyZ04znEIkjRQmJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6vMC5vRBy/HtllzfhAph2ngawAcVJNH+STrLXjSERpGCLtAVS
 yDjyskloADR1RLs2cX6/TswlOa3h5iwm4KyFxbjKJeOmDHR0aiggXF77QgUwqZJd2dPv7g==
X-Gm-Gg: ASbGnctCNvsn5Deml0xEQAa6O7+jUhqk5vhYRh6FFSmA+CBxpgvyJbeuQL9Xc+bc7BU
 HaDwTpEACIDI4IYk6lFs8NfBi7XTdXJlhHFXBTv6cbsl+m/paJrCjs6uQwoTw85IJBvG0yL4Go1
 gZiaN0qwG3kf+gCDqwamO9gFDyNhkQshYFUKhAaMc8h7tyU5WueHHRP9Pfo1J20aQSaIV0PC0CV
 XwQK2jglsr/bEahEJ1Bf+F5YNl1NCL3Loz1p6e57a2Sh1M62QKmoO9HrYm7fpvchWyBXchdkMmc
 iTcqZU8eexPOuPGjQqlOdKydw4kesrUXPVwAKyIskTgvArd0lDNdi/JMuiGdwXVnDTbraVXJZu+
 MoWkysLqakjqdEnJHcHcxnWRt3Bpbh6x8HwKIuNHnFxmkHCbfrBo9/J5J/KyTddZeLbpCnHu9Ok
 GXQNgyP6Eu8MhD8DNNiCQZGe7P/MR0DaqE
X-Google-Smtp-Source: AGHT+IHJsL6+kpoPk8x1PWb0mqg3iHOZS6wR/zv/DBqOZ8GMqq9D0VqdZrEygNgekK2sc9hwLF1zkA==
X-Received: by 2002:a17:902:c952:b0:290:a3ba:1a8b with SMTP id
 d9443c01a7336-29465525229mr183633555ad.24.1761554636181; 
 Mon, 27 Oct 2025 01:43:56 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29498e4349fsm73037945ad.107.2025.10.27.01.43.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 01:43:55 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Helge Deller <deller@gmx.de>, Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] video: valkyriefb: Fix reference count leak in valkyriefb_init
Date: Mon, 27 Oct 2025 16:43:37 +0800
Message-Id: <20251027084340.79419-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The of_find_node_by_name() function returns a device tree node with its
reference count incremented. The caller is responsible for calling
of_node_put() to release this reference when done.

Found via static analysis.

Fixes: cc5d0189b9ba ("[PATCH] powerpc: Remove device_node addrs/n_addr")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/video/fbdev/valkyriefb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index 91d070ef6989..6ff059ee1694 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -329,11 +329,13 @@ static int __init valkyriefb_init(void)
 
 		if (of_address_to_resource(dp, 0, &r)) {
 			printk(KERN_ERR "can't find address for valkyrie\n");
+			of_node_put(dp);
 			return 0;
 		}
 
 		frame_buffer_phys = r.start;
 		cmap_regs_phys = r.start + 0x304000;
+		of_node_put(dp);
 	}
 #endif /* ppc (!CONFIG_MAC) */
 
-- 
2.39.5 (Apple Git-154)

