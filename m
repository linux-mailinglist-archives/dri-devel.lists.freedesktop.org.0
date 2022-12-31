Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C465A4E9
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADB410E02F;
	Sat, 31 Dec 2022 14:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C531C10E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 14:27:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so11958714wmk.4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hd5g8d3ixy4rfchNDpoUI/MxiC/emRj5/xYKLqgTVlY=;
 b=BNYa/FLPffd46n9JpUJdEOWUyrXAOrmOFXidPVoecV7IrhrJw6fKrbagZj4IDAUyss
 fQj9j7y8jAaRLATolaTYHrpKXBq2PfzgcIVsYp6YkwmY9DWeklXsCCgqvtQx8Y90nogB
 gYJ5SOIa7hkwq8KlOUKWyrS2fDEeVGyMX1FDO8JsQ++Kq5geP+qyw/BsakmdeiAoyegN
 pJNDKcRmgA54GnNM3shvAao0mytXCs1Df5QiOhHbV6TuCr0qmBa7jCBDoXQFoOZMTn1K
 UgQ7Q9VVuxROsPmKAraL5qddDFa6LpCZNbGyma7nA3TnWVAynw29hWIJJlIxq2UaJEwq
 WiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hd5g8d3ixy4rfchNDpoUI/MxiC/emRj5/xYKLqgTVlY=;
 b=xmPxmr3EA/e+tvridnSxoeQZXLh/9AJ/KQlbQw63JcgfHDLK5Ew93ORulFVMZqcvQu
 2hXfqIQcx4RaD5fFpD9norwjkNX2CTMWFVDg6/ytOtHOHCMcvJIRsZY1YEK9LBRIRqzS
 lqZWEfMPUcTJU4curmB5lGKQ3EkDtNsrWdIpuwnwOwUFJ7FgQXZ6a/blOYPSZkny8mxF
 QSf3CbvmBjUNxokuIFdq+CmUpYI2eCdUyju+eQm8vL8KRmLwKnIxk9gQ44pCRlSooMYL
 vNgfu3lRioCrzMHDXJjDWzmgXcDCZckGr1zTIK3op/fXIQWqc2Qnpmp4mVp2PRUhRsb2
 KpSQ==
X-Gm-Message-State: AFqh2krLfJKNREmIfwTv6tB89k2KFBiCf/1Uh88wYXZmtQTdgkjJ5xzC
 Pq/qZwUof5HCN0oI+y+EqCwLLw==
X-Google-Smtp-Source: AMrXdXtseuqYPXQxTs5caeLPdGtmfYeH6wwfdU+JM+levjI0aFf9RqIZxQfn28A28kJ17SQ9pJto+w==
X-Received: by 2002:a05:600c:1f12:b0:3cf:a851:d2f2 with SMTP id
 bd18-20020a05600c1f1200b003cfa851d2f2mr25029036wmb.21.1672496850337; 
 Sat, 31 Dec 2022 06:27:30 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003d1e34bcbb2sm35729697wmb.13.2022.12.31.06.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 06:27:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steev Klimaszewski <steev@kali.org>
Subject: [PATCH 2/2] drm/panel-edp: add IVO M133NW4J panel entry
Date: Sat, 31 Dec 2022 16:27:21 +0200
Message-Id: <20221231142721.338643-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221231142721.338643-1-abel.vesa@linaro.org>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an eDP panel entry for IVO M133NW4J.

Due to lack of documentation, use the delay_200_500_p2e100 timings like
some other IVO entries for now.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Assuming the information from here is correct:
https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md

This fixes the following WARN_ON on my X13s:

[    2.194973] CPU: 5 PID: 186 Comm: kworker/u16:6 Not tainted 6.2.0-rc1-00075-g5136d9aa278f-dirty #26
[    2.195409] Hardware name: LENOVO 21BX000WRI/21BX000WRI, BIOS N3HET44W (1.16 ) 05/27/2022
[    2.195820] Workqueue: events_unbound deferred_probe_work_func
[    2.196234] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.196639] pc : panel_edp_probe+0x3d4/0x520 [panel_edp]
[    2.197036] lr : panel_edp_probe+0x37c/0x520 [panel_edp]
[    2.197435] sp : ffff80000970b3b0
[    2.197833] x29: ffff80000970b3b0 x28: ffff0e0a80b7f760 x27: 0000000000000001
[    2.198231] x26: ffff0e11fe0e1b50 x25: ffffa8f9f585e0c8 x24: 0000000000000000
[    2.198630] x23: ffff0e0a81a39c80 x22: ffffa8f9f58c7638 x21: 0000000000000000
[    2.199032] x20: ffff0e0a8d1b0000 x19: ffff0e0a820fea80 x18: 0000000000000000
[    2.199576] x17: 0000000000000000 x16: ffffa8fa5e097080 x15: 0000000000000000
[    2.199969] x14: 0000000000000003 x13: 0000000000000059 x12: 0000000000000066
[    2.200360] x11: 0000000000000001 x10: 00000000000009e0 x9 : 0000000000000001
[    2.200748] x8 : ffff80000970b340 x7 : 0000000000000000 x6 : 0000000000000000
[    2.201132] x5 : 0000000000000049 x4 : 0000000000000056 x3 : 000000000000004f
[    2.201512] x2 : 0000000000000000 x1 : ffffa8f9f58c7a00 x0 : 000000000000854a
[    2.201888] Call trace:
[    2.202261]  panel_edp_probe+0x3d4/0x520 [panel_edp]
[    2.202636]  panel_edp_dp_aux_ep_probe+0x38/0x50 [panel_edp]
[    2.203009]  dp_aux_ep_probe+0x34/0xf4 [drm_dp_aux_bus]
[    2.203379]  really_probe+0xc0/0x3dc
[    2.203739]  __driver_probe_device+0x7c/0x190
[    2.204096]  driver_probe_device+0x3c/0x110
[    2.204448]  __device_attach_driver+0xbc/0x160
[    2.204795]  bus_for_each_drv+0x7c/0xd4
[    2.205136]  __device_attach+0x9c/0x1c0
[    2.205439]  device_initial_probe+0x14/0x20
[    2.205717]  bus_probe_device+0x9c/0xa4
[    2.205995]  device_add+0x3c4/0x8cc
[    2.206270]  device_register+0x20/0x30
[    2.206543]  of_dp_aux_populate_bus+0xe0/0x1bc [drm_dp_aux_bus]
[    2.206817]  msm_dp_modeset_init+0x1d8/0x274 [msm]
[    2.207096]  _dpu_kms_drm_obj_init+0x128/0x670 [msm]
[    2.207370]  dpu_kms_hw_init+0x540/0x640 [msm]
[    2.207645]  msm_drm_bind+0x18c/0x61c [msm]
[    2.207917]  try_to_bring_up_aggregate_device+0x1dc/0x2d0
[    2.208186]  __component_add+0xa4/0x190
[    2.208454]  component_add+0x14/0x20
[    2.208720]  dp_display_probe+0x29c/0x454 [msm]
[    2.208989]  platform_probe+0x68/0xc0
[    2.209252]  really_probe+0xc0/0x3dc
[    2.209511]  __driver_probe_device+0x7c/0x190
[    2.209767]  driver_probe_device+0x3c/0x110
[    2.210022]  __device_attach_driver+0xbc/0x160
[    2.210275]  bus_for_each_drv+0x7c/0xd4
[    2.210528]  __device_attach+0x9c/0x1c0
[    2.210781]  device_initial_probe+0x14/0x20
[    2.211032]  bus_probe_device+0x9c/0xa4
[    2.211280]  deferred_probe_work_func+0x9c/0xf0
[    2.211525]  process_one_work+0x1c4/0x320
[    2.211768]  worker_thread+0x6c/0x430
[    2.212012]  kthread+0x108/0x10c
[    2.212251]  ret_from_fork+0x10/0x20
[    2.212488] ---[ end trace 0000000000000000 ]---
[    2.212755] panel-simple-dp-aux aux-aea0000.displayport-controller: Unknown panel IVO 0x854a, using conservative timings

 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index ef70928c3ccb..bef5cdf6a582 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1891,6 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
-- 
2.34.1

