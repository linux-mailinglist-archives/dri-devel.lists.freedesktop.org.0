Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69278A08F5C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1710E4F2;
	Fri, 10 Jan 2025 11:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+Gfo9hI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF0B10E4F2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:29:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-304d760f118so13556411fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508530; x=1737113330; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Olm0fGkKA8EgRKT9JLEzK6JuQbM/+wX4+5NIwdHgt0U=;
 b=S+Gfo9hIDzAVTruGU8YUG/363oM94Z8xXWpQBy3tN/IR22HFKfs5YUUkf+dlwJ5aAo
 OX+ZLsAwLT9c9++vyBiH6yRBxGOuwUIxYqwyWBCAC8MRh6LDTh5iLa571arNvv9kBAVg
 LUcK7QOh0xReCd2S8DUSAqwAhfWjiRrZQI/qRj/upcD3/iDDzenp3Vlqza9u771DuLhq
 Y/Z1XqFwNea4ftQGa+iaG1x9YwyTvG8C2cn0VkD1NFzFSLzLt/rPMqbIB1r4NRD9RPwA
 JxQKbeEVoy4KrrVLQgR2eyJcvTV8ba9T3TbR35xL5K6q1W66qNN8ZrGzTUrRuIMS2h08
 k67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508530; x=1737113330;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Olm0fGkKA8EgRKT9JLEzK6JuQbM/+wX4+5NIwdHgt0U=;
 b=p+JXczMPTAfBgGxh+S+AS3uqqg2elWyqVVyvqyKItKtwZlb+PWwVtaYjy1s50O0z1i
 lzsEAhzY8aRXp5zrRpCn7mLISKGeKSGwsZbguTdKIE8tPwYUCw88e4Z+JI+T9wgGOIxL
 L4jt5qO6jnmSarxzUKtFVR4Bu2ILhuz3ebLU63U/rpwfW9BrAsO2nda0+Zp2KFfSulfx
 Vcf+zxtMSOAvYLIfuuLNEf8y4z8tny5J9cXCWC+SAaPTkYEq8su9hxrYXNP9yWBhVxJv
 ROqjxZcQki5a5MyzM9rBcQX6/0miwmWrvx/mEHo8VEBHfmA+LD6nRaSg4/6FbUNNRq+7
 R1SA==
X-Gm-Message-State: AOJu0Yy11M6oejUxWjRYDbuBZkSbINVakeuaFoD3Yn6CV/fHiWZ1r8+6
 aVN8shkMiY6GJ27f10ZKgoLF604u4gsmKNQdUVNSNlSe88TLpg3jo3MIeurfdt8=
X-Gm-Gg: ASbGncvx6uSm51lUBarufdlcWxnR9eXwOBAyEhGLm1yh0wkWye733cYXy+IhgUhnqe9
 9Ih0onJYKFDIllbDaELz5su4sPPdyyn/JFcujqhXqaJHh2YKzqWxSn91DSN2IA4o4LUzEYYEMOV
 kSNnqc87ctoUffRApQLX7OAkVypSxrPcowX861wq+Z6K3l/hjZ1ylUE6DjKuJqDB+tD6+ELn2Jk
 rtV2el/DyFpW646UJr9w8cBi75eR0enfPldRu6BFQZGfrMYGmnok2fcSl74IuVs
X-Google-Smtp-Source: AGHT+IErOasjRMXHudN0cB9qvlQZWme6DxpwAWmz4xkg4SDdIOHVGX9R4of/A9RUmHAsu9ZL8qbS4Q==
X-Received: by 2002:a05:651c:221b:b0:302:4115:190 with SMTP id
 38308e7fff4ca-305f4531432mr29413291fa.6.1736508530158; 
 Fri, 10 Jan 2025 03:28:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:28:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC/RFT v2 0/8] drm/display: generic HDMI CEC helpers
Date: Fri, 10 Jan 2025 13:28:43 +0200
Message-Id: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGsEgWcC/3WOwQ6CMBBEf4Xs2dVSUJCTiYkfYLwZDlBW2cS22
 iLRGP7dinj0NpPJm5kXeHJMHoroBY569mxNMHIWgWorcybkJniQQqaxlAk2TmPbaEZljSHVWYe
 KFCbpWkhFeZrVGQT46ujEj7H4CPvddrHfHaD8Bo5u9zDUTWldeQptWnNXRJ96zV4tfgINPbqRb
 NmHted4tY9HdHq1/Peqj1FgnYskF2qVSRlvLmwqZ+fWnaEchuENUDlbXgABAAA=
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3370;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fd9r4hgPoNEPzT0cMeFB8vRKjj6uquq5g8fly6kHV70=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRtCJ6vwhECMJLKWTgFiyn5NFZmjSfAZxUZx
 5Iotr4jT02JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbQAKCRCLPIo+Aiko
 1YFdCACcwNQDPlz8zM1iJdqHpvd4mR7R5r+iEPU2eZs+xq5JTl4++Zke82GDBwb1rUHXubojAnl
 ZrhcbxbYCfVoPxoecov0LgCzrn+AXBRtvySSlVFCw3vpAQUBGEZ8kDFoCUdDtQ/t0mK76cEc7Gr
 TUvRgKIOTjk7t+pvo/bhgLrrSotkLEPW6A5iiBMCJ5FEdrzPx/1ZLzjc/uP0iGRP0WM45NkISAq
 SX8HfVrhaeRlPioUi52opvcEgsjzFRiGSFlRXIeb+DuSN/G8L4fDSTutIvPCAHV06t3ZREkNF6w
 rSPN0qweXyRjIdV4ryrClhB//yTTLFtbaDrjGW+5EXJNfxGt
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

Currently it is next to impossible to implement CEC handling for the
setup using drm_bridges and drm_bridge_connector: bridges don't have a
hold of the connector at the proper time to be able to route CEC events.

At the same time it not very easy and obvious to get the CEC physical
address handling correctly. Drivers handle it at various places, ending
up with the slight differences in behaviour.

Follow up the HDMI Connector and HDMI Audio series and implement generic
HDMI CEC set of helpers that link into the HDMI Connector and
drm_bridge_connector frameworks and provide a way to implement CEC
handling for HDMI bridges in an easy yet standard way.

Notes:
- the patchset was only compile-tested
- being an RFC some of the API functions and structures are left
  undocumented
- although the patchset provides drm_bridge / drm_bridge_connector API
  for working with CEC, there is no actual bridge that uses the API
  (yet)

- I'm pretty unhappy with the drm_bridge integration code, we end up
  duplicating wrappers for CEC functions instead of reusing the
  drm_connector wrapping functions. An easy way would be to map
  drm_bridge to the corresponding drm_connector, but that would
  either require a state or storing drm_connector inside a drm_bridge.
  Current code stores cec_adapter instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org

---
Dmitry Baryshkov (8):
      drm/connector: add CEC-related fields
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physicall address
      drm/vc4: hdmi: switch to generic CEC helpers
      drm/display: bridge-connector: hook in CEC notifier support
      drm/bridge: move private data to the end of the struct
      drm/display: hdmi-cec-helper: add bridge-related functions
      drm/display: bridge-connector: handle CEC adapters

 drivers/gpu/drm/bridge/lontium-lt9611.c         |   2 +-
 drivers/gpu/drm/display/Kconfig                 |   6 +
 drivers/gpu/drm/display/Makefile                |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c  | 106 +++++++++-
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c   | 246 ++++++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |   7 +-
 drivers/gpu/drm/drm_bridge.c                    |  16 ++
 drivers/gpu/drm/drm_connector.c                 |  13 ++
 drivers/gpu/drm/vc4/Kconfig                     |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 132 +++++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                  |   1 -
 include/drm/display/drm_hdmi_cec_helper.h       |  70 +++++++
 include/drm/drm_bridge.h                        |  78 ++++++--
 include/drm/drm_connector.h                     |  44 +++++
 14 files changed, 621 insertions(+), 103 deletions(-)
---
base-commit: 74509d54ebf1ecfbdf5f7edec32c490fefa01b8b
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

