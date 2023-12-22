Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B181CDB2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A910E142;
	Fri, 22 Dec 2023 17:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BA210E142
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33697caf9a6so422935f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266941; x=1703871741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hHFkedPmax7f2jMznqg0TqRbSWkPKtd98J+qp1ddTP0=;
 b=Dv8M5ulg1GwNW2K9v5wWFniXFMjsItFBZJYPAXnUIUEnZFE4Q9UEBzt3dfbKAd08aQ
 mCLP6ixduxXlN8xhBwIccBFZboyfo44gm5vlHFK9yXQ2r+eWTTINDdzD4PPWtUJvm4NM
 fBY6D0mqyd+GotYkyHIb0jsgigBdjzWqC8T9O2ey4ocyshf9R+VBc3c9MMavdy1h0n/Q
 0vuqcFqevCMebSkbrUxmPMZqKkfDGywZmFHicRVY6M3xHR3ittrAvDY7daNCfHJuP49Z
 w1hjPVHRdTd/jQC8ATqOD/OpDIMRR5J664enzz8j+FphyyyNOvB1hnpEPq3mqazL80dd
 v8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266941; x=1703871741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHFkedPmax7f2jMznqg0TqRbSWkPKtd98J+qp1ddTP0=;
 b=S302fWCt0BvZdYUYo/KbsqIG80aw/xmAfCIUgiBOWbLBwwmL9W6EwI0GGD2zOH3ezg
 G/suZCMZoKkWXT5r0HUvgfwnKIgRiJdJdtcsbJZInPn9aPCIF2GGXt3+jtb1wiNMuoCq
 gf5HkV275UEPx5iorMg1/bDYqzQCYc4YZB2QpDRfhhBgbg0eqNulVMnXZXc6FzqB4ejA
 LelHmStzJegy4WWMuKh8ughAkqnshjAJ+hE9hkq82LDoH26vgwHRIORncjKHAHW+/egf
 HMrs0WDLlV1IzORHlWCjTFJQn0IpJp2yvljxIXj3Ym00N21JxWBrqUpY4uzehpSZFC/Z
 OxyQ==
X-Gm-Message-State: AOJu0YxE13nHHaiOOlqwT2wNGGPKuc/lwySxFYy/DU2Fr4xUE8ntBuM6
 npsl6oNWLouXVbRC1i3GzA==
X-Google-Smtp-Source: AGHT+IHwJ7vKkIduWkKIJWTuwfloN+HwqKIaLADdUtYCaF29vwkh72hGBlvXCgEZafcU5IlivtWLFw==
X-Received: by 2002:a5d:6102:0:b0:336:5bc1:f53 with SMTP id
 v2-20020a5d6102000000b003365bc10f53mr1693282wrt.10.1703266941511; 
 Fri, 22 Dec 2023 09:42:21 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:21 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 00/29]  Add HDMI support for RK3128
Date: Fri, 22 Dec 2023 18:41:51 +0100
Message-ID: <20231222174220.55249-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is version 4 of my series that aims to add support for the display
controller (VOP) and the HDMI controller block of RK3128 (which is very
similar to the one found in RK3036). The original intention of this series
was to add support for this slightly different integration but is by now,
driven by maintainer's feedback, exploded to be a rework of inno-hdmi
driver in large parts. It is, however, a change for the better.

The VOP part is very simple -  everything we need for HDMI support is
already there. I only needed to split the output selection registers from
RK3036. The VOP has an IOMMU attached, but it has a serious silicon bug:
Registers can only be written, but not be read. As it's not possible to use
it with the IOMMU driver in it's current state I'm not adding it here and
we have to live with CMA for now - which works fine also. I got response
from the vendor, that there is no possibility to read the registers and an
workaround must be implemented in software in order to use it.

The inno-hdmi driver currently gets a lot of attention [0-2] and I'm
hooking in now also. As requested I incorporated some of Maxime's series
[0] (and tested them).
I have intentionally not removed any code dealing with output format
conversion in this series. In contrast to the input format, which is always
RGB on this platform and certainly can be dropped, that can be implemented
later. And secondly I need the conversion for RGB full range to RGB limited
range for this series.

I did also some smaller driver cleanups from my side and implemented a
custom connector state which now holds the data that belongs there and it
is not longer in the device structure and, of course, addressed the
feedback from v1 [3] and v2 [4].
There hasn't been any feedback to v3[5] so far, but I fixed an issue with
the new custom connector reset hook: If there is a connector state already
it needs to be destroyed in there as well.

Please see individual patches for detailed changelog.

Note: Patches are based and tested on next-20231213.

[0] https://lore.kernel.org/all/20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org
[1] https://lore.kernel.org/all/20231204123315.28456-1-keith.zhao@starfivetech.com
[2] https://lore.kernel.org/all/2601b669-c570-f39d-8cf9-bff56c939912@gmail.com
[3] https://lore.kernel.org/all/20231213195125.212923-1-knaerzche@gmail.com/
[4] https://lore.kernel.org/all/20231216162639.125215-1-knaerzche@gmail.com/
[5] https://lore.kernel.org/all/20231219170100.188800-1-knaerzche@gmail.com/

Alex Bee (17):
  dt-bindings: display: rockchip,inno-hdmi: Document RK3128 compatible
  drm/rockchip: vop: Add output selection registers for RK312x
  drm/rockchip: inno_hdmi: Fix video timing
  drm/rockchip: inno_hdmi: Remove YUV-based csc coefficents
  drm/rockchip: inno_hdmi: Drop irq struct member
  drm/rockchip: inno_hdmi: Remove useless include
  drm/rockchip: inno_hdmi: Subclass connector state
  drm/rockchip: inno_hdmi: Correctly setup HDMI quantization range
  drm/rockchip: inno_hdmi: Don't power up the phy after resetting
  drm/rockchip: inno_hdmi: Split power mode setting
  drm/rockchip: inno_hdmi: Add variant support
  drm/rockchip: inno_hdmi: Add RK3128 support
  drm/rockchip: inno_hdmi: Add basic mode validation
  drm/rockchip: inno_hdmi: Drop custom fill_modes hook
  ARM: dts: rockchip: Add display subsystem for RK3128
  ARM: dts: rockchip: Add HDMI node for RK3128
  ARM: dts: rockchip: Enable HDMI output for XPI-3128

Maxime Ripard (12):
  drm/rockchip: inno_hdmi: Remove useless mode_fixup
  drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
  drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
  drm/rockchip: inno_hdmi: Get rid of mode_set
  drm/rockchip: inno_hdmi: no need to store vic
  drm/rockchip: inno_hdmi: Remove unneeded has audio flag
  drm/rockchip: inno_hdmi: Remove useless input format
  drm/rockchip: inno_hdmi: Remove tmds rate from structure
  drm/rockchip: inno_hdmi: Drop HDMI Vendor Infoframe support
  drm/rockchip: inno_hdmi: Move infoframe disable to separate function
  drm/rockchip: inno_hdmi: Switch to infoframe type
  drm/rockchip: inno_hdmi: Remove unused drm device pointer

 .../display/rockchip/rockchip,inno-hdmi.yaml  |  40 +-
 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts |  29 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi        |  60 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 549 +++++++++++-------
 drivers/gpu/drm/rockchip/inno_hdmi.h          |   5 -
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  13 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h   |   3 +
 7 files changed, 484 insertions(+), 215 deletions(-)


base-commit: 48e8992e33abf054bcc0bb2e77b2d43bb899212e
-- 
2.43.0

