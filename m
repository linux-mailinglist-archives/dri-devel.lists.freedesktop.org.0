Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B41A79146
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060D510E7D5;
	Wed,  2 Apr 2025 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VaSyqisK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69310E7D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:36:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso33668855e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743604597; x=1744209397; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8OZPFd+3nBV9zg3pKEpB8c5hVsmEiajWVSSxIoQN/J4=;
 b=VaSyqisK84MbBj7odjf/jM0CjlzLXRQyLDeOc9pLe53qMLpxCFMvkWeAqdKvjczphK
 c2pRm8TfiALZIe8EgMM4rEhjhZpQYYg5WoUflEhM9TvZt3nsuWngsJ9DKTSu0KTcvhnl
 wR2Al3GBQyqbazGxbYBrrHrCuFcK/fOdBYKyLqHh715oSSMdtn7X3dncIjoc1HD8pIuk
 bQogaUUQV4DCjbtf9BlLrJ2VGgUcomZMYC4NR89Qb9U6amJ1+P6BZg3ffOSilDE41++p
 c+tK0rcqv1kAONX/xrP8fFM7/jVSU2NIt5VRQSBV5iIqZMB+6PMPJhHmRfl4Yb8FMSG9
 t77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604597; x=1744209397;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OZPFd+3nBV9zg3pKEpB8c5hVsmEiajWVSSxIoQN/J4=;
 b=ejS6A/2k9RIr46ujvTBbq0t+3tcSAzWXm0zUwXoja6CuHENS1zRu6h6v5ffE1m6gzI
 jPWqQVWKLDQVzzbhwbJpw9JT303m/L8+l9tcMi1+r0ZQUCKzu9YN21dv+lrcc9Nby8ff
 MdViKLOyhde5tQWKGyIwMglvTqZM7hewW2kzN07nBXT0itr5rTsAwpW5sdNQZnK25Ii5
 UV8dIu9oYsdhCJ+IX6rryPNSScJ3UbsrlAy99OylATYS9hP9X83GBwVdRkciYNL4Se+l
 ZHF8SGZtu0IHI4PwJZiyL5TULQfeRnCEnlh/a55iVEYLl5Hs9DClIrBv6KGSs4MRIuZC
 o2DA==
X-Gm-Message-State: AOJu0YyIKCmy3T/CtIXvX/AymUK4jjIGlKfNCm6pif1Mn0+ZyF7JiqOu
 v+qRZX0IdlsmyQMPSdIwybGWGeCRX02Rct7tWqF+Zm5hdRI1rNfJqMP1vEBsPD8=
X-Gm-Gg: ASbGncuUCXxlITQ7Qghx4dZCx8EBKfwhTM/d9dzDaSrsCtwpxv1tFee7c486+B4x+QA
 0UFSD5v9SL5ZFfss2ZTHqzJ9+QC15izXKnhyesvjuYvvCHr/Swco2nLy1MJxhAiRgWaLi8M+OZF
 7ZPSgo7IDXMNt5ZAIB1b16gBSh/EDT041AHts8TO88qN1Xdr3ApeMR2/W2BuMYp9xnoLqu9ETeu
 tlNuX7s0Y1G4bB7+oLtKYNpKZNS6FIusRJP0apY9oVK8DwTXlY0nDm4Ol/nBS4xcBba7/uip6Ft
 j0Rf7bbCzmIbVf72meYpbbXytmd6ndm+2rw+PPN74IwOYA0z86h6yHrgxXPoGRkorD0=
X-Google-Smtp-Source: AGHT+IGHnEjaAF6TdBWULUciMcarFp5DBhDkePCJjZ4FPYyba+CH4VGbrtlke+W2qDrPN8q0hph4gg==
X-Received: by 2002:a05:600c:3d98:b0:43c:fa0e:4713 with SMTP id
 5b1f17b1804b1-43ea7c4e76amr77872505e9.2.1743604597214; 
 Wed, 02 Apr 2025 07:36:37 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43eb60d1472sm22654985e9.22.2025.04.02.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:36:36 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v5 0/3] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Wed, 02 Apr 2025 15:36:31 +0100
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9L7WcC/5XNy07DMBCF4VepvGbQ+IYbVrwH6sL2TFpLIQ52l
 YKqvDtONxR1E5b/WXznKiqXxFW87q6i8JxqymML+7QT8eTHI0Oi1kKhsqgVwiVNkEPwhSJ8xvw
 BZ2kq5IEJJj/yAMGZnklJekEUjZkK9+nrdvF+aH1K9ZzL9+1xluv6D3yWIAFtiCZQpL3yb0Maf
 cnPuRzFqs/qXrQbRAUI3IXoYkcaY3wQ9b3oNoi6icaS7ZUzTnf7B9H8igbVBtGsogxe97qBhH/
 EZVl+APQtObPHAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=wdbY/f0SsTEDRKIlr0J0r8jqNsTifwjpoiAj3tZNr3A=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Utwut02pE2oqTD8qrOzYffFgIVHdVfd9YFeN
 +epfIlBW/qJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LcAAKCRBjTcTwaHBG
 +MjEEACKpIi8hW0hmQ61YYN9wbYDtip2XyYLeaZ4hRkEGeekUnSgiQz4yrznSISsLhWJ0vge/sY
 MHKaQ9i7msQFoHQDmD1yQKrYQA20gboJhP7qcs+hJWri7Ae2x1XgQDHCKIowbBBZITII/5RvyfE
 +EpPpqbnHKzbhoLMV2M2xinnjLYrYOxutwafQe5hm1ynnekZIz+PTq6Jks+b6fS+iBdoA7Hlwj/
 jWvrxdgqAxvW4osixzolkY8D/Inpof8iwJif/Jib+LZRm+SWqiRpqkz3I9DBdpRgvH24hQAspE0
 hMFKjwlEzsqm+TpcTPHnSXdtAC0Vn5BhTOC7ru4dLUJwn+sIHIDNHa8ntNXEhT+CkXKU/aKu98W
 GHxqJCzoWKprht3arBmRz9YTej1yA4yPTxdcwLEpMy0SmmjO8ULV2VtP0XZl808MaFNsp3S0SqX
 dv4oIfgu7CHazXHO9qDjBf9pxveRuQ1VoAGyE/Y5dxzJcOrOWdTwpFqRzJ2PkV/To1gh5f3BsFg
 JN7Lpef5X37vVE9Gt4ReKAl3pMgJ9WDDUqbaZUt3sDQMYEi1dZ5BPflqt+9GwWo9k1cJOwytRt2
 XFzAreywfPAqYXpmrglHYOIsR0ibGMJqY92tKoWvf0YpgAC/1zv+tRhtTZr0QSq2ETd7uxijLka
 NqXc2AcO8AFhEcA==
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
Changes in v5:
- Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
- Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org

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
Christopher Obbard (3):
      arm64: dts: qcom: x1e80100: add epd hpd pinctrl
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
      arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                          | 5 +++++
 3 files changed, 16 insertions(+)
---
base-commit: b6ae34803e82511009e2b78dc4fd154330ecdc2d
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

