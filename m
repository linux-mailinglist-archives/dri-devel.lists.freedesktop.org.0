Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D84104BE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC446E0ED;
	Sat, 18 Sep 2021 07:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8116ED8D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:57:21 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z94so30883263ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BjqYg/kdIxuTkYi0sI4jFtVCecYard36mD+kDvRG+ak=;
 b=QuoPWUTBeExD9Yyv+njE9H5YTxnkC9RgV62XWwYjuzdyXelG8ZZG/NUFK9NSgOX5lV
 p/SpC5vdJccRvPjj/7u/jOClsUV/6IuKaGa/NqoBOc9SHD8UrKhPH/K2IZTpvyMb8SsU
 Bqo/jmnWrq9z+Nu2dZLP1FOT8VCpMtFbH60L1oule0IF7ZmilZxlYW5JzIa7/xdbPlZ3
 t35GdF5Aq4cymaXd2c5RZeUURgvRKWSh/x8fF9SqXUaoRiNCfRutu3z8kvznrmTEEtxJ
 RpSo4NScvmHhkNWJ6/R6YPaNyVh/8bs7VeB2nDd7NSQk0qzkq9gd9cVUOkdIHtCCX9ND
 /pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BjqYg/kdIxuTkYi0sI4jFtVCecYard36mD+kDvRG+ak=;
 b=37+dXasrINVEG87qio8NfzxdaCKvRV83Kmmu0EKLyu21VdObOnZFtKfOYQ6P8hHh8j
 49WkGtl+wAKv607EAsdg4E/0ezJRSwCUc2GZroqNbLG/2Jkv5fCrIW8gGOBRMQGjnEkR
 /F5FRu1AMjUsBA2yQ8c55waqNOKQM8+DwTYVS3INPCXQF/M69Qo4G70tucd/z7G/lJ4a
 R6E7rQq09+yTwSYs8EjgbUOnkfFL1Jk5tJBKJkIWuXoEfOnJonfPUz4Zv8OrJx6mlAFe
 TG3B919gpL10d9yz+zkUoP97XYYNdoqd6EVBYkrKOPcL3SEL8qm6IvyVcXWKfkpXVrOb
 V3Og==
X-Gm-Message-State: AOAM530mCZ89rLQ9lVa4pdaZCpOiZgg3OxtnajoGyXD1tDpb2MIxYJhM
 jnOAfGd/q799BmC3OjBH/ME=
X-Google-Smtp-Source: ABdhPJwze+2NJY8kzwJukoJQS8+nR/sEZR0dphNK5/pdY8xAR3arPpb7pLJoDBajz/QYBhRsnqp3IQ==
X-Received: by 2002:aa7:c7cb:: with SMTP id o11mr12647452eds.137.1631890639607; 
 Fri, 17 Sep 2021 07:57:19 -0700 (PDT)
Received: from cerbero.fritz.box (93-41-150-160.ip82.fastwebnet.it.
 [93.41.150.160])
 by smtp.gmail.com with ESMTPSA id s11sm2722223edy.64.2021.09.17.07.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:57:19 -0700 (PDT)
From: Mario <awxkrnl@gmail.com>
X-Google-Original-From: Mario <0_Awx_0@protonmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Mario <0_Awx_0@protonmail.com>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for GPD Win3
Date: Fri, 17 Sep 2021 16:57:19 +0200
Message-Id: <20210917145719.24466-1-0_Awx_0@protonmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..f6177c1d9872 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -185,6 +185,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
 		},
 		.driver_data = (void *)&gpd_win2,
+	}, {	/* GPD Win 3 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
+		},
+		.driver_data = (void *)&lcd720x1280_rightside_up,
 	}, {	/* I.T.Works TW891 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
-- 
2.33.0

