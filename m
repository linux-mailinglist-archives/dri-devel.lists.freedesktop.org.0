Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E04D13C0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA2310E4B0;
	Tue,  8 Mar 2022 09:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4219410E37D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:49:16 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q14so11976878wrc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02UDf1pdb0U70hOLizwodglM9/0MIkQTrFbx130jmiE=;
 b=TjZphH9hgyELIqRwTi2WvGdoGj1J9+ko37q3Dy+QljjxZrcmoDk6pGD+9BkVeoWGl1
 c9cQYim68QjDDKBJC75LgOBARQdj4uHxDI5dHKKBf7O/my4JRPQbITljSvXVICz+kIzQ
 uzMuCIEvQpgxiO7KMGkHAA9CI20uLtfq+mC2kUGMuJymhFoQsgvBfeH8Dh37Ijctf9/1
 j9s1H20UTvvd4CNKc+lJbQwbO0zPanfu1nuz0cHXv/0abJA/1RsruwvnID4aMwSvIGmN
 GPY9CCl/Vys09GOCr4GHKBC8J9A02W7kZrjPxLAvuU0LUvaGFMMvdelTSF37S0lPxzqf
 ddAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02UDf1pdb0U70hOLizwodglM9/0MIkQTrFbx130jmiE=;
 b=BS5SdAyMr4Sv2PHy/c9Avono6WHeePSPH2hZfiGjI6riEk4uI5ES2O4RohUQt+oG/i
 hUcm2vkF4Sd7gL20cKYAOQe5Fu6RBZkRmjiY3xm4EOjjwm798Hh1W0Rv1qAhm7yFWxeG
 PdcJj9k/AWTKd8RrZJBxA2gev0NbJVxBLkS+mN1I+VQKw2Bxi5HiQGnsUxYdyKwgjOI/
 anHUM0lII+L8dTfp0DFeUYw0pF7pce5kwP4AhUJU31jOf1yNuRe95s7Fua1mT48k8qin
 TY4gIQOnzdiTXowZ97ILv9frPob0EYdocby6nMqdzU6ex+lH3jqJhhTJlKZrSz0tWU1r
 F6Tg==
X-Gm-Message-State: AOAM530earJQ89/5tWJz4C17tJcggek1LH2GpDWwL2uzxf1SSl2Mqch8
 FCfYWomKhgu1wd4u0jhe41v7CA==
X-Google-Smtp-Source: ABdhPJwJl4t5Tn7r80HbhzAHKE1pKs8GUwcFZWPV2LvK0bS7AXZojL7riB/OQzKcrK/Px9dayrwCYg==
X-Received: by 2002:adf:fa46:0:b0:1f1:d99a:4b1 with SMTP id
 y6-20020adffa46000000b001f1d99a04b1mr11663745wrr.516.1646732954621; 
 Tue, 08 Mar 2022 01:49:14 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1684885wma.21.2022.03.08.01.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:14 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org,
 laurent.pinchart@ideasonboard.com, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, arnd@arndb.de
Subject: [PATCH v2 0/2] Revert vendor property from anx7625 bindings
Date: Tue,  8 Mar 2022 10:49:09 +0100
Message-Id: <20220308094911.2680291-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

An issue[1] related to how the V4L2_FWNODE_BUS_TYPE_PARALLEL flag is mis-used
was found in recent addition to the anx7625 driver.

As used currently CPI (camera parallel interface) and DPI
(display parallel interface) would share the
V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
documented to represent. As far as I can see it's only intended to
represent CPI.

Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
standards, I think they should be split. And possibly
V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
separate story. This would provide for the neatest and most legible
solution. If this solution is implemented, this range would be
incorrect. Additionally the snippet reverted in 2/2 of this series
would no longer be valid.

As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
due to not being caught in the review process.

In order to not introduce this issue into the ABI, let's revert the changes
to the anx7625 dt-binding related to this.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Robert Foss (2):
  dt-bindings: drm/bridge: anx7625: Revert DPI support
  Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
    endpoint"

 .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 --
 2 files changed, 1 insertion(+), 20 deletions(-)

-- 
2.32.0

