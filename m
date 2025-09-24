Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB6B9901B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C7810E6BB;
	Wed, 24 Sep 2025 08:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qi3tyWCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376FB10E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:58:28 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b522e2866bcso1093081a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758704308; x=1759309108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BpxautfUhVRnZ8T33dUfTx1Y/3dEnu/6VVcMUyhFYd0=;
 b=Qi3tyWCkIdLVAKRKjHJvitpRWd+VGoGi4CozOzU5kyRz0OO3sFTiSP2GXn8Gvr/WbB
 GDU+bCnmrqgFnGCA9ieRmxjHvpsWs+4sbObtFPDAAW0wa/9+8dRmvvGk6rZp0czAw3YC
 mc14re5Xg8wSEi8vhqKvjwAXdCO9XMiQWq1j+aYKIIU73L+OFAR23M979vbqeotIndI6
 LDrjuz+Q1J/fvqvkESmX7F6/bADrXn1gPGouSS+HgRJ2iiqMiUeH5haFP6QFiaptyAVn
 ECyuSisx7qcC6BJIhRA84mq6ehZH0x4/HPz18U2Ioph57G4izsWSxAz8WIYPKDa+L+Dh
 GlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758704308; x=1759309108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BpxautfUhVRnZ8T33dUfTx1Y/3dEnu/6VVcMUyhFYd0=;
 b=VFCYZMOmYQEt46NnMXylxekAdgo1GA9OPz+ePXB/sZHufsZtmmNHNu/vuHqMn+2yFt
 mpqNEd/59M99+6wzDoAm6nScFY1HoloR8T4RSgiv1KTTMUqisXZKoc+YcggVpCZyDaZE
 h0n3E9r1HQhx5bQ93AfHFQlT9dIIYEoG/ABWnnzYxvke9S2Sirh9s+FWjXqeItQR/Qje
 Y25fJuluFGkjO3+arIYTmdhujgu/2Dh4iYSn0HQ1XrrEAz6jUwPLMvbdVzBXYkdE2QDZ
 +xAsij4wYLEenH9jVKvo8FBlM+I8ub/cVmiG4whcEUbMGvIR6sdUCPDzDc3RBheqzeIg
 ve5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP1UQCx/sZS994bi3FNqKroHumW0gWJmdlT30pqDERAdb5AwaVoCigZ2kN/HiNcOUVpp31V64O4Fg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU+20C3oHkg2I5zI7vadaTgkuhFLE0X68Bbg8adD3KKtU4lPZ4
 fU2mdqhGlGKErFop4CkYB6caECYXb9EGo81dttlX1p+gLwtl+XAvwZP3
X-Gm-Gg: ASbGncvfFXDlB62uZyHqmuKSUbJp0ystSm5lW+LUUEB9+F/zZ732r5PU10wRt5zqrGB
 5uN1UMq4dlHXSHzic7sJvmsiGYbukJgoJtw08kJq3rn/LK3j9MSr9B+i7Fa5HZfEyqoOsScw7mT
 sUhF56IiB9ua/eR4Zffl6X1UJlTBcPVtbpJgH17DQzYo++QP4naGPbnFK/IRqKq9QvWYgNMQh7v
 7qHA8SnK4xUM3pf95YaYeHxZbD/sYMkOBbbR3SDFsI5WyYBSiVY9tP8+6CZvg9bdiJloS8T7KyH
 3DCIY2+o6uZVp1yWxoUNYCV6SKoCQ2KGlC1ddrpfHpzYUq2xkEDMpTIDVrjjI/1+Pnirv2HrJcE
 7kxIPrW6bh8vGMgVtJwVjFIRxbSHyBrlOZQ==
X-Google-Smtp-Source: AGHT+IFIK5UmnbSxQTMbrW0b+kgVYDY9yAoSYqzhZLZMRlOtkVRe1ldf7XOAaAJVdmK+PgEzwcT/1Q==
X-Received: by 2002:a17:902:dac5:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-27cc2d925a5mr36209745ad.4.1758704307558; 
 Wed, 24 Sep 2025 01:58:27 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980368fe3sm180399505ad.151.2025.09.24.01.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 01:58:27 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Date: Wed, 24 Sep 2025 16:57:43 +0800
Message-ID: <20250924085804.34183-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
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

After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
use msm_dp_audio_prepare instead. While userspace is still calling
hw_params to do audio initialization, and we get the following errors:

[ 784.904566] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[ 784.912185] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[ 784.918927] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[ 784.929947] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0

msm_dp_audio_prepare is not called because hdmi-codec driver only checks
and runs hw_params. This commit will add hw_params callback function
same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
work with userspace alsa.

Tested with Radxa Dragon Q6A.

Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c1446..6ca1c7ad0632 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
 
 static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
 	.audio_startup = drm_connector_hdmi_audio_startup,
+	.hw_params = drm_connector_hdmi_audio_prepare,
 	.prepare = drm_connector_hdmi_audio_prepare,
 	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
 	.mute_stream = drm_connector_hdmi_audio_mute_stream,
-- 
2.43.0

