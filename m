Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A21A14B8A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A47010E740;
	Fri, 17 Jan 2025 08:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yDb1cjsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1DF10E740
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:56:42 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so16618181fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104201; x=1737709001; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y0ikR3MG5Dad5PLWtZu4J5E6aw45hxShewolJAGb8WY=;
 b=yDb1cjsX66uFCNykaumyk6E9dAha+9NdIw8r+KIj9FaHbgooX/a//uC8Lukr2bqSsb
 B5UuLX/paleuHKLZrwacoQjB/9sIGxNNr7HKRYMLoqddm5Ws48qoZRBVhbIn5V7D5EMy
 IM110Jm/8tCm5Z1eQLIHL+aa0PqXF64fj4ghPP83FknLCqIhuG81QXrM2qMAkWFjSHU3
 5idlMj/SbX2TX/vj+SQz0KOsqIGtyCwV1VU3lZUxG+QJMJLJjrptKPlTalFdCddxra8C
 SXuGQCdneyQ4YKDOzfuuUgPErur4yDywtlIxyuocOF+I/0d5hLf8L2Bw6oLdDfeGd+9C
 1Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104201; x=1737709001;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0ikR3MG5Dad5PLWtZu4J5E6aw45hxShewolJAGb8WY=;
 b=Qpdi9zakBdVlxIh42rgyP7DiBqyx//UOjC3BmGOIoZg+34OH64UAfNG5GdmWsBcgnx
 8qe1uNseCdxhcVTJwY1iC036oy+g0cOZNecKniLZICCt9AL4hPM+kAc7C1nC1AqXkSHj
 Q/RwY5KqhaEngUmDu8HzJUE+Cbe4rFw0KVkeckEbcA7/edMv7LYZm9Hn/3SgX5Xg6tNX
 U4o/ZpphZI99JvNi3IwYyrIo7q7/vB6SwztEp65XjyQlC905ssnZV2wXIhOHBkSu/eVx
 3hwWkc7snCUU7wOfJCKxkkmyIcsza7KCu3JcZbKHUBy/wkVbwvNHyWDF4c/XevxjbEdz
 Talw==
X-Gm-Message-State: AOJu0YyxfG+LRQfGd8kbms0HWQsLvN/Vh7Z3ruknFj8afRDsbtz9S04+
 uRZNfIhrS6X63jeqr0Zwm3nUb2TcTWT9DJ8F6UHg/W5bKWtbj8TfhCICFrmyjTo=
X-Gm-Gg: ASbGncuud3S9Ry4ueeVZOnW+w+AJC57rpwkYzdjlpYzIR58Fys/EcI3DrI4I6mrjinO
 krCWtAffI7vNGYsIpvsliMOH8jgLp/f+qWO2rrSVNgGWQNmEho+QnJUfChprgxvtVD5VHNgAhWG
 NUP5WDg0yk9oB8THFD0C/s8RFSSJcFqOv0Fcocn3b/KdE4VFY+4xVZo8Eg+GGMg+gZ506jyveYz
 EsUmvIE/vqgqViG3sjsCbcYT5vTY0XCBvkm+RKQgV+72kPwrISLehklnyeRXsMr
X-Google-Smtp-Source: AGHT+IHFY25drW5Lw2ZVshUT8i1rMR2KHN40GDh6zDnX9NGy7k5yQuInYG8L/p0IYq+WtTkiEafV6Q==
X-Received: by 2002:a2e:a265:0:b0:307:2ae8:14b with SMTP id
 38308e7fff4ca-3072cacabd5mr4867911fa.12.1737104200598; 
 Fri, 17 Jan 2025 00:56:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Date: Fri, 17 Jan 2025 10:56:35 +0200
Message-Id: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMbimcC/x3MQQqDQAxA0atI1gacUSy4LfQAbsWFJrGGUpUEW
 kG8u4PLt/j/ABdTcWiyA0x+6rouCSHPgOZheQsqJ0MsYhViGZDtiyb/1T7IGzEOROKOYzFRlOr
 BdSghxZvJpPs97qB9PaE/zwu8bAqObQAAAA==
X-Change-ID: 20241231-drm-rework-dpcd-access-b0fc2e47d613
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nP4VV30rpvduxunGABbo7dBWD4cMiSH8HcV1Q+o2kbk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtE7QvRxYCJ8RauLnkCML+SkHt7cVuLLC0Ji
 Orr8qLbQPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRAAKCRCLPIo+Aiko
 1dwnCACEdI8fIo784cI7usBp7nXSWiMDaIt9E8T5+m1FE4EeARrYjouNWNKnDV0m/yUFOHqfyM6
 Y0KoZRuABDGps8N6ZXbX5YtfwAau409DiIEv62yELDA2ENp776PZ1LNcXG2nTQ5Vuz6SIC/A8oH
 MrE8/0T54dqOVZgjYU6oFdoTyVQAvwK4xqk4bDRbI84rQ/tHznrq/Nkzij4KzQ+KOjM/RB5RT6l
 Wmrac3yaT2WHjuVhr4FCZ2ukZIHpIXINoz4HP9SrquYJO8h+i0UXDOLO2g7dL4b4r3Ktg2HTETE
 NT2EN92LHPs/CEd/qc/W+vxoGjaTmiboJ1aGo6fwxGw0jubz
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

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

As suggested by Jani implement new set of DPCD access helpers, which
ignore partial access, always return 0 or an error code. Reimplement
existing helpers using the new functions to ensure backwards
compatibility.

This series targets only the DRM helpers code. If the approach is found
to be acceptable, each of the drivers should be converted on its own.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (7):
      drm/display: dp: change drm_dp_dpcd_read_link_status() return
      drm/display: dp: implement new access helpers
      drm/display: dp: use new DCPD access helpers
      drm/display: dp-aux-dev: use new DCPD access helpers
      drm/display: dp-cec: use new DCPD access helpers
      drm/display: dp-mst-topology: use new DCPD access helpers
      drm/display: dp-tunnel: use new DCPD access helpers

 drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
 drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
 drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
 drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
 drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
 include/drm/display/drm_dp_helper.h           |  81 +++++-
 include/drm/display/drm_dp_mst_helper.h       |  10 +-
 9 files changed, 354 insertions(+), 345 deletions(-)
---
base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

