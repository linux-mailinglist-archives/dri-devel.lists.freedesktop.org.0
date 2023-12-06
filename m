Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32D806BA9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FBD10E682;
	Wed,  6 Dec 2023 10:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1AC10E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:14:58 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ca04b1cc37so7547911fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701857696; x=1702462496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F0q7XUDhzaMOZKwK/U9NUPrOCd+WjD1tbsbFwSHG0q8=;
 b=uSNMwVFdcStioeCr0T0OwzaKqCc37imzZClYOWofpKm1zkWUiAY0qtGv1tZn8kA69s
 FcGKvGa/2Rhn14kmjIKzHksfQiEBitNTUlar5iO6r5u+wEgSqbhF5AiAf4XA3JTLUxkg
 UZWatyt5uDde6pw61EY0I0x/nU3gQHDVKsRGRY9rQ6h9Tp2fN19TfjXXN/wM2DeWCt2p
 q2xEkcP5UpvhdUqj9GZ5NFUSKm6R9vGxf6NHRpwAvOn9RgHBag4AD4/1STmxXIioDH3E
 WpYkh4HSRjCDwb2eQ2dqK73wbwDnd5JdkoZErBTUXMKFfEsEfCIOmBEX0PwViJeQFZw+
 7LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701857696; x=1702462496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0q7XUDhzaMOZKwK/U9NUPrOCd+WjD1tbsbFwSHG0q8=;
 b=h9NwVuE2uqC8GakN5dj1mIy2VFYgj97RSc2PSE9kLns0ckUnHdOo5XRDi4prkSHfrE
 0etHXiS2h8rnPo2KxER5+Cyx0Ng+gtlZuO3rc8KmaB4wTJ+wFZsTdMmcZq8SXD0TY1po
 LjPKQTfvBaj7OCmv1gJ2IVSVgSHWa9c6C9/hmGK5ziDKTgKLMYKWkzRLAQSEjcVwuAkE
 SqJ6pewFYZIdKi90RUg0wvIDv415xh7ycgsr3+YXikuYvr0TyTsb9roGNPEd9QknLbK/
 Lg99NbBh1p3xTGQ1I1iLT6vnv+ueKRBRR6l1EIUTaQmWNnVWZTq5llnECaDLpbcAfhGu
 zFsA==
X-Gm-Message-State: AOJu0YxIJail0MxgYTxf6xZ83U0PCJdDDCics9TxrFFC7nxyHrY7dlDp
 NOPzoaui2puwR86kjW/dvdNIrw==
X-Google-Smtp-Source: AGHT+IFfEsB482WXWBkGa7lRzgwjsje7EsqALaPTbxoFRxxsL9ZnfVH2CwoU2HQS3fRCcJBk72H9ww==
X-Received: by 2002:a05:651c:14c:b0:2c9:e81e:81ac with SMTP id
 c12-20020a05651c014c00b002c9e81e81acmr552024ljd.11.1701857696297; 
 Wed, 06 Dec 2023 02:14:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 02:14:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v3 0/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Wed,  6 Dec 2023 13:14:53 +0300
Message-Id: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Changes since v2:
- Make the function accept drm_connector instead of
  drm_writeback_connector (Maxime)

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 25 +++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.39.2

