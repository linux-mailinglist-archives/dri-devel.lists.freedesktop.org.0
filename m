Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA7B9D5D5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF37510E833;
	Thu, 25 Sep 2025 04:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRnU+PTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDED10E833
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:05:53 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-32eb8144fecso76497a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758773153; x=1759377953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dG5OFuUhTzJArlzJLeHU0Z6lT0pnWQPiV+Gn+hR5Mck=;
 b=cRnU+PTlf0C5dv4N+gRxxaJMpX0p7g6+6ba699mLloH8IzZqp3vzEDEvkpb929L+IS
 sSM3Np230XUgh8KJP6ZWAaKIN4/cAzonQYyeXWGLbqAbvX85D1NeSfd542mEXJkZRFbA
 NuH5DIwmkP649VNLX8mZMRnkksgjQVD52mEDS0LfNKg5DdVCVoTYY+hi2yhk3+79uZpk
 XINn7dU7jk1gBXKekIkJr2/g3ibExthk7HGtyDQNyzxwvWALNpBnsteJbaL+rUfK4EOq
 nY+67uOzk+mjbrTzJbO1okbX2wlsBglHNYWRaM7yYz+UDRAJ8frQ6Zw3EFap/N1EwS/3
 5+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758773153; x=1759377953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dG5OFuUhTzJArlzJLeHU0Z6lT0pnWQPiV+Gn+hR5Mck=;
 b=i8dqM65gLnkuTSlhOLtzwo6oD7alzx/XdnUlEMjmqiHuNEmu5V+Fl1k4HV8VtPnmaM
 tcJxNVDkHIAlg/u2hoAuMY/7w4pCIhVDejItxjZ7Ko8vpozKhl98HEP8Lue89PHtM75t
 6T6u3FZcXVphsYwtPth4MIjulqUQsmlU7sXdvdO1A6i6+Qy64CVkNf7z7LM4vkcFY1YU
 n7Ido5/lBnLeEFW7pXGZzfvHtc4qiQU9fIj6bT7loEnja4f7bqYw4IylZ1t/P2wzISnG
 nBdJOaI6RyASDYnjXXJECTUv8EpJhcQqdb1yyr4KXdVY/HtS+SE8WBYzCR7l6cf1Mi93
 CvMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmb0KS0dmfPv9nMucqOzEjGFvThY+nhjkZzMh+wKpRxqaYBb0CNOsv9flarNYkV1fIFGXIvZwt0Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsQOL8iz7YHnVMFvEGZBHwvl+IsSs9yBNCjGLu7yr9jL6dNCuY
 4165ENQt9X+Z3zJQWL5PaJhF6DdZNVdo4lP7ZI4FVK/0EpyZZD6F5VGs
X-Gm-Gg: ASbGncuSi3EOvbGA3FQ76ZTIhJoT07P5RzqU//6TCS7fljVOS9eFnf72Ua2IEyL+TX8
 SAejo/vqJYPaktuQUHpS/2JGfxptyITbLgIsN5W35kYV/08AHJGz6sj7d9eXgwcN/jhDUZgpQQi
 GU28HNEsng4/OTrtEgJu5HpJxh9AhG+X+V4jweHM2D+LH2yDjO/s6mCSPNYKDhbhtJKCJr6u+yX
 AC6KS44Cs08aVQIbmG+bAPCzi8iXh4CLz9vdSAkg5a9r9mm7vTQGnJdSZivbAWR1RBFCSNGMx/Y
 9WUxR1hBQt5ocAJmjQ8Jrhqoj2m7E6vi236IXp7K864FL1dn3G/J3ufj6VqZ6WgrVfCXBbSl+HF
 v5zz55LfCo9hvXEz1VAkm7ac=
X-Google-Smtp-Source: AGHT+IF2EgcFaR+V5r2laKG+fB7NOWuBnZAvcXdgYuPLY/fKj/+eq4e4iwbDLJlE07LtaXblbPtUpQ==
X-Received: by 2002:a05:6a21:6d89:b0:2df:b68d:f7e with SMTP id
 adf61e73a8af0-2e7cd4044a9mr1241172637.5.1758773152620; 
 Wed, 24 Sep 2025 21:05:52 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55bdefesm796568a12.49.2025.09.24.21.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 21:05:52 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Date: Thu, 25 Sep 2025 12:05:09 +0800
Message-ID: <20250925040530.20731-1-liujianfeng1994@gmail.com>
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

q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback

msm_dp_audio_prepare is not called because hdmi-codec driver only checks
and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
hdmi-codec driver can work with userspace alsa.

Tested with Radxa Dragon Q6A.

Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
- Use more detailed trace log in commit message.
- Drop the empty line between Fixex and SoB.

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

