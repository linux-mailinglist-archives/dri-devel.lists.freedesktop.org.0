Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4155A2AA6A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EFA10E84F;
	Thu,  6 Feb 2025 13:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M+sGTsu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1639810E84F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:51:14 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30616d71bb0so9748621fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738849872; x=1739454672; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
 b=M+sGTsu5moK6NrD3Q3iHppqgtsC05jKb0AnFyoIrlC48ClXn92vYNz9KBpcjF1mNlP
 N6+4T+//FjoAkHPTBGWt7rG+ewUxB9vp426ti0+L9L+zqWv5M53OQC82gk5wR6Xr2YYK
 TuAOMHREnj3CXNlbMRpGSHbAmSD5Yb1utp00x9yhjtI6OhEa3KNmRN5jQZjJfz25OPob
 4dEjQjf+8VeL2xgIyvY3HOSByEvfTz5+kUuOX/7z25aNrgUcrHatXfyYn+qfXWqflav3
 Ck34u8Ugs+FCBfBd2JitJIFZbXb0wtNCDAa3KVbIOiEvBRExl0gI7JGVACw6IexeW0pi
 3vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738849872; x=1739454672;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hlvRT/m0xJ3xAgqG1g5fsw9qNYmlNi8FJnlxC1TPJrQ=;
 b=lShEUepBr2QeZNlDzA7QVft4dpgU6L996Q7dS3113M+hAGwB1ltkmeJCtHLhRY+hju
 hy/NWt5KU0quXG3p5jLa9a+PxuXQASi/7XPDlhz0VLDE/EmdqMOLlhmfN9oOlZDHGOuF
 NHhqWEdd9jb2HZ/7JlzcWi7zPMY8IVEIzAu2UK5diabIPKlLIjtmaQ0ooSvZz97npDet
 8hHktw41j/Bv7Ma6isqWQJH9pIPJDDGy0zn5aJ42anmekAXnA39GCxS5RWz9h1kAlxGk
 ACHlYIBeYTwuHOIbaG9s0FGWaQycoACY7MNTdYU0MlzgCnf55sBBS1IcqdNM9VFM6MxR
 z5Fg==
X-Gm-Message-State: AOJu0Yx3FsAP+O6T6UfcuAaY1hM9i5acc9Zd5UJ0uG4C/GmIwFG+P63m
 PAJkdOVqt9IOVSzyUa/oynsz5nION5S8vd3ALhjRP9BS2nlxpbyBOxEJe3YaRec=
X-Gm-Gg: ASbGnctiLVCoVbr+ASthOZvrLRO730MUd/Bb0MHTQXl9zu4RQlP9bs9tppsx3QXV4rH
 k1UkNARw1USL7YXxh3l7rQg3x4udBjryog7t24KcYOqHw3wux+gCVSeCvgi4rgBRKQawrygaPhR
 ciMqvqov+5f3Tx3OZLhuhl94B74HORj23hs8oenfHjm0GMZhh0KtF+s9uP4Q22CR34oCCPGyEKv
 AjnxKcCg9Do5oFDbMGsN8Cr8vXgdNntHCAzMV4l0vfDnm5/LWH073KB35qqm+lw/quDZjjTPpBM
 bdgcbbQC/3loCMWh8NC4/zg=
X-Google-Smtp-Source: AGHT+IFSoxJ0P0T7H5ffUZDnHS6utLPPhqQ0Xj+ZAE/hrtS9g7mDuzJ3rLQXiReVNulKoeE9NZoXiw==
X-Received: by 2002:a2e:a988:0:b0:307:4fda:c544 with SMTP id
 38308e7fff4ca-307cf312227mr26755631fa.17.1738849872268; 
 Thu, 06 Feb 2025 05:51:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 05:51:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Thu, 06 Feb 2025 15:51:05 +0200
Message-Id: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEm+pGcC/x3MQQqAIBBA0avErBtQocCuEi20GXMWWShFEN49a
 fkW/79QOAsXmLoXMt9S5EgNuu9gjS5tjELNYJQZlFEj0omRdkF3kRyoB7KBPHtvA7TmzBzk+X/
 zUusHO3u32V8AAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jEfFPYjhhWYVQQFXyKASWQyErTdoY8Ap+ZCTd9eVCBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5N8UxuLafoSi1beUZMoklAK0KI+apFqYcXK
 zIpR+AMEJeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1R90CACi7Ti+Y/t8thf8VuDZcV6zf2WGND598IR0eR6rFaQ0KTGdYwEqLjnjAGefiGxMz85EkOC
 IMghfm08/ysXE3DHac6U5HNPlQy0dpcn+fvRmjyVel7Lmt65gInbi0Wxz8vVdzmBYO6LqCZuWqU
 tDJhwMhmsDoCGFLXH7kBEZHRy4aoYFBw77aIAuSNRjuIm/nOBA1fEWNu25c56E+5n+z+HJRVl9F
 rGJaHzmMRSOS7rdOV7XzPAeVjojxZdKuu/MOu6P16S18LcjidgWRO+oHSANTm6C3uSK8iSKsiP6
 uJO2TE3WnRU3AyrTmgBAGLDE3BQZYGBtSSq2/hyvu6trgqcl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/display: bridge-connector: add DisplayPort bridges
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/display/drm_bridge_connector.c |  66 ++++++++++---
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  14 ++-
 8 files changed, 96 insertions(+), 185 deletions(-)
---
base-commit: 93c7dd1b39444ebd5a6a98e56a363d7a4e646775
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

