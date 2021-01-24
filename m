Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F33022F5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F406E030;
	Mon, 25 Jan 2021 08:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A577389D7B
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 15:08:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j18so8404729wmi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7mf2JB6YFkZrTT9eOh8fpRwRlqBA16q//wOPgh3f9w=;
 b=LNH33GfYNRs4v32KhZGrq2haAa6pCHeZg293Ea8BzUSeu2hwzylO0rlVHWGCqMZ/j3
 EPUluEZFI/6Q4dDGV1e0U8E/QhIAPMAdnK6Z/Daj3EVB2ehlkPtaNr5FRPCO2daceX0p
 lkqMZwQpYcM49zfxfMHsSXEzNi0F7FXuAnefhkBt3ZEs0JaT9jRTX9TN40TV+/r+z704
 14wYxuNXoiRSuUkhRNufVbulq7pnCmclSKmNZq5Hi06oilzz4fZq1z/FpdOHbQcCVMG1
 OwplXYHCQA+OgtjC0r47gZmpYpcAD14rUFMhRBJpE2W4ICz+D9ljxCUtBm7Y/ujvX45y
 eL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+7mf2JB6YFkZrTT9eOh8fpRwRlqBA16q//wOPgh3f9w=;
 b=hf1g3GxKDmGl28YZvn0bgV6V29SaziScG7lqc269TxtLG2otcK2oJVeI6goq+QV13u
 RwrM9C0WGlWiTxK4vUsMk8chEw8vDluPog/mt34XlRW4GA9Nin48WhpD7V7eeHyQiS+y
 jtqX8JwDhm6F0bL39isZD9C/AAWXEHDZCjxl5HPAxZV7k6hjDe2rlru5dDBFs3KnJ+pB
 1fTy2bBGGX/X9BdC4OBmcf73DLMfCG4NXhB2iB0T8A4N2NkzU5OObO8NnTdR+wjYmLnx
 4CBcg3xLcDFYy0Ic8ItXyxpInuEKWRJNCOGfEFfccK7wIwiewHXYry9vM0ki9SrCv0St
 KMRA==
X-Gm-Message-State: AOAM5327vifaqUXtROLJpyIk376XQj1Ftzrw9bmPkxUYhGg6NBy4uRsX
 g8+FmhJAOlUNSj/psqpKxVQ=
X-Google-Smtp-Source: ABdhPJyAmReBbU3ln/hSsIhpgah/YIgPZ86g83LwMM0taGgJ5gMNjLPV5MPbFmcE8OLbiKpTQw1LeA==
X-Received: by 2002:a05:600c:4417:: with SMTP id
 u23mr2999987wmn.100.1611500925353; 
 Sun, 24 Jan 2021 07:08:45 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700e58e9e649f9020b2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:e58e:9e64:9f90:20b2])
 by smtp.gmail.com with ESMTPSA id m18sm244608wrx.17.2021.01.24.07.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 07:08:44 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Sun, 24 Jan 2021 16:08:32 +0100
Message-Id: <20210124150835.1522899-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this patch set adds the support of the Lontium lt8912 MIPI to HDMI
bridge in the kernel.

It's only support the video part, not the audio part yet
since I don't have the datasheet of this component.
I get the current i2c configuration from Digi and
Boundary drivers.
Developed using the DB_DSIHD board from BoundaryDevices.

Thanks,
Adrien Grassein

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912
  drm/bridge: Introduce LT8912 DSI to HDMI bridge

 .../display/bridge/lontium,lt8912.yaml        |  92 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912.c       | 749 ++++++++++++++++++
 5 files changed, 862 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
