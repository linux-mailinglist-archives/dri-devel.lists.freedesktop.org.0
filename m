Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A387A70A2C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E67310E5E0;
	Tue, 25 Mar 2025 19:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pRkL8d4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7AD10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:21:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43948021a45so52641475e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 12:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742930502; x=1743535302; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i04oqWV50VZLFwP1WBYwkjJ9UvrcYxbthnWBqIqEM+M=;
 b=pRkL8d4KCs8OUlJCVB1sFjQ9AcdB76Fd0qJAYW5Jg+SlnGjvurmNx8FIhzUehMf0wO
 D0noyMZJkrHlIIZ5WVypZ0W+sahQ4sxiCGrwzG+DiKIzSnwlnnaiDTQLRjAxJsW+glcp
 9HtAo1Q41tgbZaPTkmcgwxuGi+yPIWPLbASckRlSNOh7XDk2jgw1ICzUyvKjzuv1V6nj
 anijqnJTspGzGoDDzoj7wGZfsoGapyZcSRSGDaRrsb1JF0haL9Cgs/+wJDzmxsnB4JU+
 srWStlqm7LtOeVCGbi7hQFpNKldEd/MZxSE4xS30tIglTmnVzeXhcq/YbwX426bm3gAh
 PjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742930502; x=1743535302;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i04oqWV50VZLFwP1WBYwkjJ9UvrcYxbthnWBqIqEM+M=;
 b=f8UwyxBcZwQOu600hxhK7/+w21AIu/CgemVoMAOFe24u/SVHv2skxgJP9OaEyJcyCX
 Qu0HHnIWK0aECHPIyVApv8N9lSfr8CWKpzs8TiTFN7CnrhgI8olvoJ0uzzXRAuMxT9nb
 58Ku82nxL+yVclVq1Ekf2HqSQpn/wbsVRIWmZVbkK18f9CmPCkVwMcQKAk+FQou5PgbC
 rVdu1cZALwzVbhwRb/L8tftK6LYu46+lhiBlpLQtvC7iYbL5V9qGgjGugGjqY88oDLpl
 Qf2aDI+GIT9G5dntbf/t0RypyJyQwxeLoaf8V2GCxI+DoTK8nj/qWbCdQcD8iQzxQdpF
 JlsQ==
X-Gm-Message-State: AOJu0YzBrD3xMa4gXoKO2mUrpubIranmOYl8Bwn2Psj5Ztq7F+PnOYrv
 +Kg0VpS9/5deAVKK3okzb5Cld1IpLPcfKrqT5iXLH/UKBC7GCgFAWcsbfGhWUkA=
X-Gm-Gg: ASbGncvoY7QinTGQIKoHbDg1gohbZtlOgtKoMcJMwnyR+aypbKi9SaJ61NkwFf5M/3L
 zunb3SqounIxV8vxWCLeDsyJwAVeD2euYeUs78suuF2DF8IiS2+FkkFrbR1mAWUUQOEgO26SJac
 MdbTLXD8HazlVIlg6cfQD2fsaIQgNgs2t1Qbiy6M7iZYA0BPgBGfbOMAl/Ry9piBMV8T+VYgq0f
 b5GTdlNRkmG7ODnZR9rkPVrP17MCVFQyi4pRyeTNC1SO7iM4UmJn3JkcncFRCkqdfTNiuBhxWyo
 2mWOKHEEl4/C5OL7qho2edmI17DAXvPqvDnO0cGiETmVjGh5b6K83VfX
X-Google-Smtp-Source: AGHT+IEZF7k07Jx1ad5ysjRNAg5B+AJzjdfZigdy2MLueMpoQ8j3EXhwNoIeB55rhCmkG2CbsETXjg==
X-Received: by 2002:a5d:6482:0:b0:390:fe4b:70b9 with SMTP id
 ffacd0b85a97d-3997f908ce3mr19247979f8f.21.1742930502174; 
 Tue, 25 Mar 2025 12:21:42 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f9a3f81sm14773053f8f.35.2025.03.25.12.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:21:41 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v2 0/4] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Tue, 25 Mar 2025 19:21:25 +0000
Message-Id: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADUC42cC/5WNQQ6CMBAAv2J6dk1bQY0n/2E4tN0FNsEutgQ1h
 L9b+YHHmcPMojIlpqyuu0UlmjmzxAJ2v1Ohd7EjYCysrLa1PloNLx5BvHcJAzyDPGAyVQYZCGF
 0kQbw56oltAZPWquSGRO1/N4W96Zwz3mS9NmOs/nZP+KzAQO69qHyGPBi3W3g6JIcJHWqWdf1C
 33XxtvRAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2859;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=md+Nvy/friY/gG6k6yqPyGwrpTI8eWyHK4kFwy43AdQ=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn4wJA5S31TTOVHN/v6jFBnPQPIFmt24PojTU3r
 GzCNEMBFGeJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+MCQAAKCRBjTcTwaHBG
 +LgID/9Ca9OBPpTaa3Uaky7aiCgjrixN5V4DB83M/leY7itaG4Gy8fLKMFlQsjm6WcSlffEonsj
 cqANrY1LTbyV5uIcPrTAfgRPN8vx9yhb4KRHMwI+LjNzG0UaNFmIhWnggtPwx3RqLn9XOVHZvHP
 ZGOllCayiqwTnNi/GnD0JqTi2Ow4afPdys9Ym++9V5FqKdsaex1dC+tnpiuvfRlXZDyYj7+tQ16
 YGRV8EgSRCIwWJMxTjOSDDYX68urtiuzsEydMEHgRZt4iHaqq8t9iKW9k3e8gBduXyHXy+sMy8v
 q2UpEPIpLSJ0Hp7RidGbuVbH00DNE1sPiFh19u+hOQomqQhN6yUn710EOP3Z7Cr5F4Rzt+9V2F5
 sqAvu+/Ri8/WUJGka0qsaDlD+BNIGFpUQyH/Sq6s2atdA6zBhpfcGcohZG7AnBk+vwPHEs0+pLK
 JkVoBtDT0aPe5TDI1ZNrhYYfKhStxamyq22vVPZMO3hfqGUiP3dc5d2JIF2fhmEJXQgGo89LeIQ
 wc8t0Rx9WWuQpskQtixI+lb1G+2Dxmdx0bNUT5WDlfN/e9Yw0xmExLwYqX+mcuXS28ZyjowSXrZ
 RI1ClvJAA4bIx7hPzYOQLfnZZ6qpirB7nUMjy2wyzZic4mWLe243LO/G781tzhPNXUX2HQ0cA5d
 vW6LO6FITQk6scQ==
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

The first patch documents the panel in the existing driver.

The second patch adds the missing HPD gpio to the T14s devicetree. I
think that this patch could be split into two; one patch for the pinctrl
addition and one patch for adding the hpd-gpio property to the T14s
panel. But that can come in V3.

The third patch adds the eDP panel to the T14s OLED devicetree.

The fourth (and final) patch works around a problem when reading the
eDP panel's maximum backlight value. Without this patch, the maximum
brightness is detected as 0, thus meaning the backlight is never enabled.
I expect this patch to need a few rounds of rework/testing on other
devices!

The raw EDID of the panel is:

00 ff ff ff ff ff ff 00 4c 83 9f 41 00 00 00 00
00 21 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ca fe 40 64 b0 08 18 70 20 08
88 00 2e bd 10 00 00 1b ca fe 40 64 b0 08 38 77
08 20 88 00 2e bd 10 00 00 1b 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 41 54 4e 41 34 30 59 4b 32 30 2d 30 20 01 cf
02 03 0f 00 e3 05 80 00 e6 06 05 01 74 60 07 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b7

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v2:
- Use the existing atna33xc20 driver rather than panel-edp.
- Add eDP panel into OLED devicetree.
- Add patch to read the correct maximum brightness from the eDP panel.
- Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org

---
Christopher Obbard (4):
      dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to LCD panel
      arm64: dts: qcom: x1e78100-t14s-oled: add eDP panel
      drm/dp: fallback to maximum when PWM bit count is zero

 .../bindings/display/panel/samsung,atna33xc20.yaml |  2 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    | 10 +++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 11 +++++
 drivers/gpu/drm/display/drm_dp_helper.c            | 51 ++++++++++++++--------
 4 files changed, 57 insertions(+), 17 deletions(-)
---
base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

