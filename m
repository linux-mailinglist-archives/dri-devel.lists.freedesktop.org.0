Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CAAA4AD05
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 18:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8791710E190;
	Sat,  1 Mar 2025 17:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UnrMWTv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F8D10E09A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 17:11:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso3527411e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 09:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740849061; x=1741453861; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gTSOh+6vc0fDAR7E7U91UFAeOUujh+ZpJVLlLuHs1jA=;
 b=UnrMWTv/sjXiBOwltR9iLH3V9n1ns0jIhsOtB3AiAJ2nJ2U0Zyo7xoPlmTWhgQjHZQ
 mS/0jGSeaTFZwV/PJ01MvqIWtE/uNHoQsUXcOQiNS5uslZbGN8S87sgiq6Pg1qe/NVf6
 KCJznC+W7OIu3eGYrSJsXU+e8jby0CoUysFkG7AIjwOtl+4IKGyjzgOkGa954pkX4ObH
 vL9cXqMVSZg48bfi3Zywjkiw4fbRsUAfiOZObsbABgnGFNCojJ94qS7as6qvhw8SdA9u
 +U+qS1VCKMSSidj9uwuXAHu+bu5J3GP13Q5AWcxZ04rV+hP/GIKXI6v1OAAAotC6ry5I
 Q7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740849061; x=1741453861;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTSOh+6vc0fDAR7E7U91UFAeOUujh+ZpJVLlLuHs1jA=;
 b=qprkNMsY2Tkuig8PaIjVwaoCNkb8y77juhK5YkgRPZUwGQ2rVt11NOVtGqCVluCyNT
 uWY9G/ab4aPHUl3U9L5pv4EFyOp4u3f95HVSgbqUx7I5R8zZ2t27aWTpW6mCHIryJB4T
 FC4JATZPjNIsRY/WO3SKbhwvWudqxkq9fnoWnQXg8EApOc/3jOFv/mpk+x9X1P0qb3R+
 9IOE2taPRNwhSlCnvSPXxsEu3aYEqbmP/Hg2b4+X9Xlq2Wg98m8DLGVLcB7/QdL2eX1r
 Rz9uIY30VR0LGsMn+/d8166JDD87if+2Cy7ZA9YCEN18YfJQ4z6h/ux8APRprFXPgKEG
 Ptjg==
X-Gm-Message-State: AOJu0YwJFudMEOaLSMik/XdeFECBxLTe75DfaSgdb80lPSQgmUwPeL8E
 fjf/C9fsBhoALJYseU2Z9cipVwQjnSWSVy2plsKMLUc50wk8UqF9xGXh2cFOmxf5lWrJkv8GhsN
 /eYk=
X-Gm-Gg: ASbGncu3iSbf9QUUkPGmhyEBA8b70/IZoefJpyhaMdpyhv+x5vXnykmkIitpaH9Phc5
 PVDjs6VDG3EGAQkMwP/VaGTF/+2FSGD6vbB8AS8FvljHdvnvZSRkpOsXHne1f77GCuBZjh+bXxW
 T/V6IfpxqLNN1F+TMFODHv82T+VQ+1Q+2Kgf8JQ9SmduH+I3lhgtUhfhlGWDNQblVCC5IY7K7io
 lPqG7Fimh1ZUyRzuSjsgSrfDs5VvGfDDRWXv0YNwM0w7ZA8ValkDs35jH1/jd3MYer9oqdzxwFA
 oW8ba8FAo9ynWB4CPz0DVw78PEjmfAPxZ3/NGVl0p4wNcic2KFTa
X-Google-Smtp-Source: AGHT+IGjfTP3M1nC+JbXSe2IaduGP60EMXDnTNEYi01oiNBZO4gw8RM8QJ/UJEMcz87+6uNQsTJatw==
X-Received: by 2002:a05:6512:3f19:b0:545:c08:e17b with SMTP id
 2adb3069b0e04-5494c328c3dmr2817722e87.23.1740849060798; 
 Sat, 01 Mar 2025 09:11:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494e52a47asm585313e87.152.2025.03.01.09.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 09:10:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Sat, 01 Mar 2025 19:10:54 +0200
Message-Id: <20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ4/w2cC/3XMQQ6CMBCF4auQrq2ZlkLAlfcwLlqmhUmUklaJh
 nB3CyuUuHwv+f6JRRvIRnbKJhbsSJF8n4Y6ZKzpdN9aTpg2kyALkFByHHiHd+L6ieS5KLB2aKw
 xtWPJDME6eq29yzXtjuLDh/eaH8Xy/iuNggOvtBZKVw2gwvONeh380YeWLalRbnn9y2XiokRTW
 uOkdG7H8w0XO54nrmQN4CBXRsEXn+f5AzSqXcopAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=S5OuChTXe8RHWTOOd2rYoBZZVbvzR+cAiAR/WVy1ROk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwz+hDFEtA8PzYi0XDQQscdSYGMSloFEiiE+wO
 wBuAM+tGneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8M/oQAKCRCLPIo+Aiko
 1RKbB/9yAM+aFQr7rcGvek4nWGz6fp6p7m+5TGAd3H10HnDGv9SrKPgyABE60xmFii+QLYK4YSz
 Y/CSGbOpBjMRJCSSmFnNa0Wm1hKX8luykI0PUe2DIbScy0lN4sV8fFWglwrYwqp1xyaD0yVR3F/
 foFeKAR8IFx9NmHQ6eK0AnFtzp0Wik6lp3vOAM0QoWdvp+F7k6I27b9MZCg3jTfe9sDj4eLfhuX
 JSkKgtxP5AkELE2kZ34NaMYvtgRE87EiifLrhbK6yTHml3V7NP916I6KAMrKVDUn87vylJiDPaP
 jIP3/ELrIcEaI3CpxIebsfg1aLyxcRXEW71TE7mBCPPoHL1+
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
Changes in v4:
- Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
  HDMI driver.
- Drop outdated comment regarding subconnector from the commit message.
- Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org

Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c |  59 +++++++----
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  23 ++++-
 10 files changed, 91 insertions(+), 195 deletions(-)
---
base-commit: 5299e75907dcd85c906bd58fb6226e72c36742fe
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

