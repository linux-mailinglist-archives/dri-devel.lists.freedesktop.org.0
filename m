Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F8A73775
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 17:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418110E926;
	Thu, 27 Mar 2025 16:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="COUpdhXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4910E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 16:57:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so918505f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743094631; x=1743699431; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eceyotKP6SWKc39dnp272H+Imp9sLNyAbSh4/382Pig=;
 b=COUpdhXNajL6GGAFZkKSIhW+DLROV2b+E8t28b9w/wBUwbNl4T8LljxUEOmSYfKrIz
 lsgcKroThF5nFkDO3YhDw806X5Ojly+NGFZtIPzcTZV4i607iCnxNSO7IsMpslhI7pEJ
 uZdHhAwIRO0JINEUrnV2OM5hxet1UeUKYCuu8Vtqu9fHOxukWnwaIttoaJgJ+oz4dDED
 iZVzoZ1VUKju5MPn7u6b2i6TnsOKlbIbb7sCDrkaZXE7ORGQnskJaSs4ld5miD0KfPzh
 UuSHAfkPXlUtDUpd4ngVx7gDgrAYMP335kVzHtaKXtjyWESKm7aNCxnbw6UcrcHMOxgz
 PPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743094631; x=1743699431;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eceyotKP6SWKc39dnp272H+Imp9sLNyAbSh4/382Pig=;
 b=b6R1dKoCO2ElXJaiV3xHb8mntaDPHkAIVB1PKmvbFtNmrYywkyZa8+vO9LOpeyu1t4
 orJW+i/HIzQRNwXINeRcW9I10ntt2wpAilZ0lUKKxn0sZ3wRaqneREuBVqUa1LDB+0cx
 oFUYDlI3s/3tawdiwe4N59df5mr1I5eqVHS+t5973WXuPQhyitKlBI09lh2x1P2Uw4cr
 h9FURVJR7k3qLC/BifbUZh1/aWKUW22W9+a76BUWKqJ6wy0TJzz55ZcE0wA4zTDFXPOA
 5959qbEq+WSq4y6E1VUDo7s2YFcnISZHviQwb1fo5GcSaH03tXv39EN1aJrPKVn1XHrF
 Qnuw==
X-Gm-Message-State: AOJu0YwbgCpOH/vJqqtVUDkvaexNgdq2mS9E29RINf2CDohQSixliZc0
 Dud4tl5rDNOGGE3Zw6ebS6OfDNNl1OI5y4lmUb8IJAgskfMLxBQuzOkUbYfAXe8=
X-Gm-Gg: ASbGncujRwvNV6b0Lk4nQJie97BEdxJ4EQsCyslhZUhsn/XzpeRm3d3iQwGIeUlUZEs
 KZm4ABwhHtQKPRThsug2S/C6uHroU2m05Jr2Hz2asf/zXuU+KBQt1Mpx/L8I6BEJFYEAjszSWFX
 YE9lafw5P4PtyrneCSTVByO2IIUdHPoO1vIS5oLNV1oj9XDZrnEPEjlAxMuU/t33I6FUmz86P0+
 oVAEGNrVYoaPzpGsyehYfbp1D8VtcIp31PWERiOASltM3r58ZB7Xg4BdzlesrN4kt5S4Exr0dlp
 8qMeJi1u2e8MMPBxqYJmXxxxdSDSMCa0P2S/C7Sg1oj61m/BiI+pmi4/SN5LILtd1uA=
X-Google-Smtp-Source: AGHT+IGwo2+FL5Art0sA1XG2N0GmPu+lJHsTC9zLittsqBZNMEBc6/x0iUg6giIaGmY7yu/lvIMCzQ==
X-Received: by 2002:a5d:598d:0:b0:394:ef93:9afc with SMTP id
 ffacd0b85a97d-39ad1741b23mr3978291f8f.18.1743094630932; 
 Thu, 27 Mar 2025 09:57:10 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b7a41b4sm40430f8f.85.2025.03.27.09.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:57:10 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v3 0/2] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Thu, 27 Mar 2025 16:56:52 +0000
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSD5WcC/5XNsQ6CMBSF4Vchnb2mLSDi5HsYh/b2Ak2QYkuqh
 vDuFibddPzP8J2ZBfKWAjtlM/MUbbBuSJHvMoadGloCa1IzyWXJc8nhYUdwWitvEO7objCJIoD
 rycCoBupBV0VDRgpz4JwlZvTU2Od2cbmm7myYnH9tj1Gs6x94FCCAlxoLbdAcpTr3dlDe7Z1v2
 apH+SmWP4gSOFCtscLa5BzxS1yW5Q0wk/ZEIwEAAA==
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
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=r71amOuyfbTTG0ciVqmyZyygDjkrvOhR+gQqM0AucCs=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5YNhzz/2dxW57X8uzlPTVc+/7CMjWfzMM8rfN
 P74oMVnmuaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WDYQAKCRBjTcTwaHBG
 +HTXEACC2cEKrGHocWdTLXewOtiNrR8tX5WSsU3WY6bUChx12yyEz7ErWw2MH12bAc5Yhb18xXz
 OUQfrmK0sy3xBLlDvuKYDu6i7fYyfl5sO8rs4AC8qVhXLkTmBvNt3MrQsVfLwBAd5IuFaGxDipd
 cgyt3E8vnIarzeDTlIkFUrvrtLoXj1NWDbjR7GDC5js+3wcMLB2lYPkhGHgF65ige3ckHiKtFOy
 fBvGeFJ/bJ4SbsgYPA4TAJdBAie0fcrbVekBVzPcfp/BUi3n/p3ZbCN2Kl+hKA+1USe3neFYTv7
 BnfwUQ/luXWI+64OU6lErH3KMZE1p2o6vwYy8aD1mrK0LZMtzjJcpe2aWFxe2hsyw6kQaptoVGq
 CDdL9Bvu/CKr9ns0Vml0gnmsT4nP0nZDAAH9hqxPSP3cKf7/E9Z/tRMgearfKPZevFlGNUgHjJb
 brNFkusFsuzfshcywWYa1A2DJqjTWFkV9hLZbzPOXsf5V7B6U5QYeFF5ywNaKFjQ9ctNB7VYuJX
 behsJdZFrdRiuN8x4CNnJqBhWEwqYoVjOhc3o1OF0iA/eXKKcZXJj/g+eJk3lVGgf9zIRXWmTyu
 dzscG94Y6WqRasH7CLqxyyu0jARd00PR+7zki5rQUdWV7fwUMEMn9+pRs47AfNScsjI121/g+XI
 X5fWZ5aeLA09O1w==
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

With this patch series, the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as 0 (to be clear this is not a regression). This will be fixed in a
follow-up patch series as it does not block the device tree patches.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
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
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to eDP panel
      arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel

 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts      |  8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 11 +++++++++++
 2 files changed, 19 insertions(+)
---
base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

