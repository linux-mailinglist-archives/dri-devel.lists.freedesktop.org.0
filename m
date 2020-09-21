Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1119273C86
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219C6E824;
	Tue, 22 Sep 2020 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897F689A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:18:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b79so416050wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ACUgjSRhezgf6ut/YNpIRBfmecqG58PBv3yXYOEimo=;
 b=rOyh0tsGdC5eXyfXNGw8vKDDW1D7tCG6J839j2K+XF9e1oYJY4lY3mbOWagHTBY7B9
 SPxh0PM4E3mLuc+cEt+JK/TRETWvWQVADSQ78Uz3xEqW1dgfSjUfRUwVQYseAITKxeFm
 3FCxo94NNT8JGS8poXdR977OcNMrasJFq6ee3EisL6YDzJVdtbOKU9Cq+hv4Pvvs9aZB
 vplCp9xJe0XnMdjtFFD5c33cwRoitl3oLZ58VRtGZE7PyeVTtWqRUzWfbub06eLv0Hf2
 BPMtlsx2l3DWldlqpic/uodyriud1ogIebmoBgVGe7ZUP0YLU8Da+ip6MQKuPJT4DcK1
 ziTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ACUgjSRhezgf6ut/YNpIRBfmecqG58PBv3yXYOEimo=;
 b=r3W6NHICneJoa4fv/iG7cfXsoawPTv0izGehEIj/097XEylqSruB3MtzN4xL3Y2618
 ZpxNY+auq7Qs+czd7ya24hurrIg2bB+Jc0yzs0r9wVkwVYUJV+w4iAD27cmiUyrnpXHQ
 aSqo8Z8HmLfoEVqe/LxP8/lsh5Me6zAsXEEhcRNU/ta5iN/ypW+QU5NOVPB/7DazWUrg
 dgeuJDdBzUmFTzAHcigU16OHfX0nQ+C+LaFrPr3M7+T16dx9C4IDjvJUWD1R8YMFGciB
 A8M+afVGZP6JpYqJe5wB7YZnkCZmGzh6jB8nJZU1ynxuLD+v1YNx/NOEIFqLr4rfItPp
 Oeeg==
X-Gm-Message-State: AOAM531DQX2KkKpCMtpOx+qINeP8H4mlpqYf7k6MeBGP8/7G9JiJ1AJS
 5sMm0wsLOhf/fAYnI7d89Kw=
X-Google-Smtp-Source: ABdhPJzABOL3ze5hfsEgGMTL3C0J67cqKBFDasWXFalipx7AIUjHU7f201Up1gS1hCfK8KEYj/oYIw==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr591087wmh.103.1600712311303; 
 Mon, 21 Sep 2020 11:18:31 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id h16sm23523249wre.87.2020.09.21.11.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:18:30 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 3/3] drm: rockchip: hdmi: add higher pixel clock frequencies
Date: Mon, 21 Sep 2020 20:18:03 +0200
Message-Id: <20200921181803.1160-4-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921181803.1160-1-vicencb@gmail.com>
References: <20200921181803.1160-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:38 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support video resolutions beyond FHD more bandwidth is needed.
The new entry values have been taken from u-boot:
https://gitlab.denx.de/u-boot/u-boot/-/blob/ba2a0cbb053951ed6d36161989d38da724696b4d/drivers/video/rockchip/rk_hdmi.c#L63

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 87a9198f7494..db4a946f92aa 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -148,6 +148,10 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 			{ 0x214c, 0x0003},
 			{ 0x4064, 0x0003}
 		},
+	}, {
+		272000000, {
+			{ 0x0040, 0x0003},
+		},
 	}, {
 		~0UL, {
 			{ 0x00a0, 0x000a },
@@ -173,6 +177,8 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 		146250000, { 0x0038, 0x0038, 0x0038 },
 	}, {
 		148500000, { 0x0000, 0x0038, 0x0038 },
+	}, {
+		272000000, { 0x0000,                },
 	}, {
 		~0UL,      { 0x0000, 0x0000, 0x0000},
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
