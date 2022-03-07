Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EF4D0339
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFB710E02F;
	Mon,  7 Mar 2022 15:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3C10E02F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 15:46:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y22so1472937eds.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 07:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O2robocWX/4eX3h0HkkMwskjpGu6tvHElNahbn7kKFw=;
 b=G9xK+pOQDnRlW9TPM9PfZSJ+HE03a8E0WnxkTNwtnH+cVBA4mObITDp5hePOIoBiHz
 HYtUXJ7pLhIiprdZUmnfyFeDFg9XE1B4vwemp1DbGxIsiBy1dCmVIJt29Cx3DY9+a8mJ
 /cJnrDju5fawzi4IbBHnHrL7LhiBTpm3TLeZ8cxuEsDy4SpKPrM6lC6mh2iKEaYuZLeB
 2kmyKFWpFtmrNBhF6IVYcmWMBZ4vHoJtkLu1OfpI9HVuaxkGBZxWIRAps2tQiL0GiFGf
 5xfhwIRGIPstbdmIMj8GVeaHkZSknqdypmELx3xdjPyZmE0TeEYanW4fWbFbpBuOjc/h
 Z8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O2robocWX/4eX3h0HkkMwskjpGu6tvHElNahbn7kKFw=;
 b=P3H3UMmUR+bM5r7qqhw6LCirQHsEBIFO1Rh/cQcMoJlyivlRqCenrloNPqf6RUt94x
 R7EATBPK2L4dQF/kMcehB1kA16OZRxkUmaGytuLXxhY2xF6l3oj5LkJDIzycPK4jAHRD
 G7mMWjpQcrsedM13oayhhIYSkpxvHpEWVdL2cpPzZTRwCCMsDNUsRZECv+N+jBHe032e
 H0zFYw/dHONe4PUSyBWSn/DPTrkTZx0XbDHeK1iI0QWEZ6LYfbp8QYbQD7IDDSiRQaPU
 HiMs5WWnlh1j35IJHdsgc3zwWkl/T+D/+/BIJzgiX5vPWET6W3xPCe6zvg8eu511Gjnf
 62Qg==
X-Gm-Message-State: AOAM533M002FC1j7LfyqhhwH6bb/0dTzWwQioEBi+CJ7P3GKCoisFQl8
 KXHfyceJ/wmzRuBL7c8p4W+viw==
X-Google-Smtp-Source: ABdhPJzIFSku8aVjJrO50LvyMLTMndzAvl2LadpIo5JOvunKayfQxPpk+9wCWH705xaBAJv5DVyZ6w==
X-Received: by 2002:aa7:c4cf:0:b0:416:e28:45b9 with SMTP id
 p15-20020aa7c4cf000000b004160e2845b9mr11805955edr.319.1646667974548; 
 Mon, 07 Mar 2022 07:46:14 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0041615cd434csm4210747edz.60.2022.03.07.07.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:46:13 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, robert.foss@linaro.org, xji@analogixsemi.com,
 hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v1 0/2] Revert vendor property from anx7625 bindings
Date: Mon,  7 Mar 2022 16:45:56 +0100
Message-Id: <20220307154558.2505734-1-robert.foss@linaro.org>
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

In order to not introduce this issue into the ABI, let's revert the changes
to the anx7625 dt-binding related to this.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Robert Foss (2):
  Revert "dt-bindings:drm/bridge:anx7625:add vendor define"
  Revert "arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
    endpoint"

 .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  2 -
 2 files changed, 2 insertions(+), 65 deletions(-)

-- 
2.32.0

