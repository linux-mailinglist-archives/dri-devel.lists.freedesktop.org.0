Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673A2A25D0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE856E41B;
	Mon,  2 Nov 2020 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91176E101
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 01:14:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 184so15280935lfd.6
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 17:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mno6GH0dNld71X5m0YCHAC9Hb37IcAE5U+Ta7p4K68=;
 b=Z5AtIMt8nf7ET9vk5e2ATDfF69nqpcIn5Cz/PkjktGh8TcUwd9+G+miJeM39bA8s4e
 AWlwrsYuGzJx2OR9VBgyW2JVF676YPN1KRzW76fLG7GL/rHYJpPVz6Mpy5Zr6cld+Hlu
 WRcsAPP7BJ4Bbycpyjp6gmV8yYlBWInWnHkdJAce4CXBolTK+ohjojplgTXqKpYK9L2f
 IqMsjRWTlcC6z9x8TTNMIq39IVNl2Z9TJHwTzQGDndWJKMIab7DK7hZKepxgY3pfbcYA
 EqbIFtt8pVwFz9e4y3nIhqRdDsQwWqoygfEvH5nbw4HvMeqyxwd0kKp9TkuNZwpg5/6X
 evUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mno6GH0dNld71X5m0YCHAC9Hb37IcAE5U+Ta7p4K68=;
 b=cKWE3e62V9jqI8+L61plmlB6F7PBLpubwyyyr2W4AHXrL9cgSi0fgsGDT3iAiXJKFT
 MdMJxjYwy1W+B3h1CpD7MLGdx277gm8oVI02V9EsTrZFqxWygeimDcAHfhFYNspbyEUP
 mMn4kJaQkUvXuE4Ysvc5t0PiSFgFb6iBBiIcmSwJc+kcfkjDjDRfJ8VL54YoFgVzdtTo
 XJ5x09d/+YcoYusAT0abTLbH+UnFtcVOYWTbHJwEEziFhgkk9zOc9D9PPYDcKywHPTO1
 7A6rohPuPeXWf/9ky6Q5806eioVGz2uZyvnW/d47ThpzfZEvW+5Yq4fZL2a7u+CmWTiu
 v6lw==
X-Gm-Message-State: AOAM530UESvt02HvEHLxLXpSbCvBHeFt+twLCIR134vuY0YCbgt1xHUS
 ywRdmkDqZQ2ltdO8E9vcI4+sDA==
X-Google-Smtp-Source: ABdhPJwW2mT43fXLAstEQ7drTCZzffmbmU8MvWFdc803HNRdCPevfodmjCz1rQXoPqUohdM7pz4R4w==
X-Received: by 2002:a19:2c5:: with SMTP id 188mr4485378lfc.342.1604279684940; 
 Sun, 01 Nov 2020 17:14:44 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
 by smtp.gmail.com with ESMTPSA id 127sm2101004ljf.118.2020.11.01.17.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 17:14:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] Add LT9611UXC DSI to HDMI bridge support
Date: Mon,  2 Nov 2020 04:14:33 +0300
Message-Id: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:08:52 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v3:
 - Support for firmware upgrades
 - Simplified modes table to include only used fields (w, h, refresh)
 - Added more entries to display modes table, as more modes are
   supported by the firmware
 - Wait for EDID to be available from the hardware before reading it
 - Do not store EDID in the interim buffer, lowering the size of
   per-device struct

Changes since v2:
 - Squashed connector support into main patch
 - Added comment on modes table
 - Dropped display timings support, covered by EDID
 - Dropped sleep mode support
 - Dropped hpd_status reading from ISR handler
 - Added "sentinel" comments to empty table entries

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
