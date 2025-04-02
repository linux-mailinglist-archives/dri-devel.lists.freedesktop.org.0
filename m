Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A471FA78BA4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3310E6F0;
	Wed,  2 Apr 2025 09:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S7Jgt/TP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2E310E3BC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:58:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4394a823036so60782605e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743587924; x=1744192724; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F64Bhf8JcqE2NyBcccVmI5z7F2vvtYs8PqVACVDcoJ4=;
 b=S7Jgt/TPQIh3T9hO7EYqWSnKkBs5XQRurQUEXaTtCziWTFm8BQTRzxGhDxV0BsutVk
 wqIacMVlAVmC3nNL00RFxjvYPdcT/ke1rc3Htt1/x7lJLuc8IOahxlH4xoskd32j5taI
 /mgf0ZI6s54kBoJEgfrutgMbr+4Y5dx0xDFPeaMIqPQt5h5368xJW3GAbQwx6lyqRUGX
 1hEDTI2F5hTLSSv4syck20aYQEuzv6haO333l2FnoXfuBO5KPGMdL1WjX9NfDDWR3DRm
 TwLhxPI9EpRrepSDNtcXwE2RCxPv5mjlNryj1x4cQKsX7Hz2KHsK0ZU6iFD57IV2Qfdx
 mkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743587924; x=1744192724;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F64Bhf8JcqE2NyBcccVmI5z7F2vvtYs8PqVACVDcoJ4=;
 b=FlSqafUq9vfmBiSceysC2iun1oA1NLgRA4mZrZfTy1oYuuri+8TNha6DbZIQ5wqsAu
 saslFNlbmKGRMsOCgppmn7pZzEZa9z0os96b0tJ/HnqAywRZgAUmBstJtLO2jrYCbDsO
 BBJC1jqY7S9PGV3Qdv1KwLnlSHvay8/6Av6I61yTAHDJjXHsNXeLFmK/9ZWDY3+rFmsv
 nEfKTwS2u6s9ML+ayERlg44ItAL9PfbYX5ajlwdx5oXw2e4iEftQmoQbx+nHBHPzSsRF
 P3SFyzHRD7+yHsG2A81qLNxDdoI8VJl+uCosuX7/M6fMZxUufzRbl+UrJuhA38xXcd1x
 IM1Q==
X-Gm-Message-State: AOJu0YwzM+W3LdA3WlsK+JYnhfYZgcLzHE8+fucS/t+zofdINZhcku9+
 qw6tei/dQSy+ve8A3byfS3QvDtBn200Movm4R5luyrhpixugDUvP2Krm1wwhja0=
X-Gm-Gg: ASbGncvPumPQRM6KzCFCGwODwVW9VZcZTJZVdWQ+gpJGSkFMis7//fqZTZGP02SfjZr
 P6x4vc4FZeasq8i9hcavJelaDceEUY+r1TkzZMDkbugt8oq2ex+/5LC7E5AyrIvWJ5bpp1maAzF
 F+j7pZlBJl89QMFZlSK5jpInyD/qA1YjImS4bnS9yB1tiqgT7PRlPaomkYR9vFR5QyD+4aj/27P
 mC2RdAzqly1FKopOrFQ7HqGCl2Dq/canmmGq1KCmeov5ES6Qw6l+uRvJw1lYF57qOIs0dDmEuZs
 4FT9O8rZtFOJbM7QC5R+b0mJFMPAQgBaLeaFQNDM6ByhHS9x39EX8HaC/0dtEAU2Jr4=
X-Google-Smtp-Source: AGHT+IFF+LY0kUxsYN1yucCu27iDkU8fohgx1eaXgcBCwuhTj6Le9wBHGbHQPhPbt6iIdhv/R5hh1w==
X-Received: by 2002:a05:6000:4014:b0:391:2a9a:478c with SMTP id
 ffacd0b85a97d-39c297543b5mr1431926f8f.23.1743587924276; 
 Wed, 02 Apr 2025 02:58:44 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b65b985sm16581662f8f.12.2025.04.02.02.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 02:58:43 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v4 0/2] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Wed, 02 Apr 2025 10:58:31 +0100
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcK7WcC/5XNu24CMRCF4VdBrpnIV8xS5T0iCntmFiwt68VGS
 yK07x5DRZQGyv8U37mJyiVxFbvVTRSeU015bGHXK4HHMB4YErUWWmonjZZwTRPkGEMhhDPmE1y
 UrZAHJpjCyANEb3smrWgjpWjMVLhP34+Lr33rY6qXXH4ej7O6r2/gswIF0kW0kZC2OnwOaQwlf
 +RyEHd91s+ie0HUIIG7iB47MhLxn2ieRf+CaJpoHblee+tNt/0jLsvyCz7jerZ1AQAA
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=IlA4UvDfErox3kVQzczkwY1GjiDHyTr52IErFszm38M=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7QpPRoqhp0uCFc1qfUTwfMlvTteUzDKNC76k/
 ZxU7VoUoRyJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+0KTwAKCRBjTcTwaHBG
 +OuZD/4q4OrxLfM5IQZJdlfHMtgt6pBL2NUTwms3NT0YVSZguUAkuGXPQq9EaAlqyIed58qWrJ/
 44+r7asNQ4rhp96wGMY3QuiMWVcDMkz3uIy1bkOYhxNY82kt1eDE6dtusJOuoM0BU/d16gV2qSt
 9gs8CCH7cUeL0auRWoSJiZ1vNcP1QnwGXl01x9po7YUaEUe1BWAxpQPP7DWh2J+DWfjPm+ySBIS
 zibb2tgf3U6ffJst8RbEjypQZ3Bs9/mymnqUBHustX6D9vBMPn6/q5+IwfzQTngDZEnIDyZDTpQ
 D7IYQBx4OpSQfO7NZA2/z2361xC3zXZqH1+ZE2On3Yfkw4Cwa+s2voOEfPgtoswePcQ+9U7UoYi
 o1xTepR9clFspYYwzj8TH5y9YP4im+K5oBO2K3q5k88lyDDPq6v3t2QC58i/Id23zUBgxCtejxY
 Tl/ulhlDvjXe6wNSsFTLLq9wKS+s92QqjB5EeTobkVrQpKvtbbb89p7/tdUSskMz25M5NdojAxL
 SIZge2SXxTogRI3mQ1AG9IZ1q1HTL00pWMof4rfQizh3NoYInBFHvUoHz0GdrnSX1V3Hw3IVJRg
 inSMaDlt7fhnVLLTplZILt+F6pPGvEt0QTa8q88Q1jao0/iAXbDcJp1fm/qnOpYZg7F003wZqwc
 XXcCA+pNCd0oFDw==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
panels. This patch series adds support for the OLED model which has a
Samsung ATNA40YK20 panel.

With this patch series the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as (to be clear this is not a regression). This is fixed in [0].

[0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v4:
- Rework HPD GPIO into eDP device rather than panel (Johan).
- Drop review tags for HPD GPIO patch.
- Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org

Changes in v3:
- Added review trailers from v2.
- Dropped dt-binding documentation patch (applied by Douglas Anderson into
  drm-misc-next).
- Dropped eDP maximum brightness patch (will be sent in separate
  series).
- Removed duplicate nodes in T14s OLED device tree.
- Reworked WIP comments from commit messages.
- Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org

Changes in v2:
- Use the existing atna33xc20 driver rather than panel-edp.
- Add eDP panel into OLED devicetree.
- Add patch to read the correct maximum brightness from the eDP panel.
- Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org

---
Christopher Obbard (2):
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
      arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 8 ++++++++
 2 files changed, 16 insertions(+)
---
base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

