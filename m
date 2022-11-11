Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43C6262F6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF7D88284;
	Fri, 11 Nov 2022 20:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A8B88284
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:31:43 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n186so5924214oih.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v7JwfC7BEwyt54CAoazqwqKahwlz5HCeFfo9y8OXV5k=;
 b=k3oySDP5db+EE32UB1u/TB7IpnJn27W/D9qVljMLqGFJrIH8lPrAxiNL2jsOZRs0y4
 YsfNzg/AlYfvnfZnFjnbxEMzx4iFHx3b9WVME1gCmXZeAzNgSltGxgKu8ouPOv6VUrh8
 59JcCc4t6GlVa3nN44Oc3JHHDdyu0kspaigCHISBlamDABUl5XyPe887RomfP23SJ7Zs
 NOR9PyVDSy5M0AsMt+48LJROH2r2PUTePj8rEy84S8WZPm3kKAWI9aDnWboeFUeB30ru
 VL3GxRZrQy5Do2ge0zpWSYT5SU2rx3ORojUwK4n58WWq92b8jWwi7lVHh7pHykpAZcKA
 SYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v7JwfC7BEwyt54CAoazqwqKahwlz5HCeFfo9y8OXV5k=;
 b=sih5n1roHcXq5DgWnOiKu6FhIMv0fVL65i6styqqa6bM42hESvfFoYCH8/TDil/r5c
 fcnrAjsLRxSbBH0dfjK+JdtSv55Ztb76WBk8bvCb2NkcTL00vt0axtXZjACtFgegXlNw
 U+lX8ouHsBdqZcqilnoS0t0D6v+55fJNpGxDSMh/KVW2n+iUR5Vcv+7Dp1OzXytwVT+T
 9QaC0LefasCwgHMfieMSZk0aXYuyGcllF2L7nifTlSWo4scwy0pGx1UFT/5nk3JQkA+R
 6FxVYkNyJDZF68Yg3E+CPMzJgTLJeNW5/dQS3CwwYSIQkyJLdDrIiUwCFCotFI21n3Hg
 6w8w==
X-Gm-Message-State: ANoB5pkOiSWwQCcMFLgHEsT0ogWBbHYMlYa6Nv2zg1R0b68GwT8qgMmM
 Qz58SrFekBaFCj0Szl7Vt4hgw7Xu3vQ=
X-Google-Smtp-Source: AA0mqf5Vq1+0doXCD67im0+BQVjVWFV6lIbFaFqNY/dqYYYZJ/Yip6++mjRgm4RxCsPSnF4EPVcOiA==
X-Received: by 2002:a05:6808:22a5:b0:354:8922:4a1a with SMTP id
 bo37-20020a05680822a500b0035489224a1amr1583008oib.181.1668198702340; 
 Fri, 11 Nov 2022 12:31:42 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a056870558a00b00132f141ef2dsm1734054oao.56.2022.11.11.12.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 12:31:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 0/3] drm/panel: Add NewVision NV3051D Panels
Date: Fri, 11 Nov 2022 14:31:27 -0600
Message-Id: <20221111203130.9615-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the Anbernic RG353P and
RG353V. The underlying LCD panel itself is unknown (the NV3051D is
the controller), so the device name is used for the panel with a
fallback to the driver IC.

Changes from V4:
 - Removed "prepared" as its tracked by the framework.
 - Use mipi_dsi_dcs_write_seq instead of custom implementation.
 - Changed devm_gpiod_get_optional to assert GPIO as high at probe so
   it is held in reset on suggestion from maintainer.
 - Removed requirement for vdd-supply in documentation.
 - Added description in documentation for reset gpio to note it should
   be active low.

Changes from V3:
 - Changed driver remove function from int to void to match change
   made to mipi_dsi_driver struct.

Changes from V2:
 - Ensured dt_binding_check and dtbs_check successfully passed.
 - Corrected some minor formatting issues in documentation.
 - Added another mode per userspace request for 100hz. I was unable
   to find a supported 50hz mode that would also work, so for now
   only 60hz, 100hz, and 120hz are supported.

Changes from V1:
 - Changed compatible string to the driver IC.
 - Updated documentation to use new compatible string with board
   name.
 - Refactored somewhat to make it easier to support other LCD panels
   with this kernel module.
 - Added support for 60hz mode. Adjusted pixel clock to ensure proper
   60hz and 120hz (previously was running at 124hz).
 - Added vendor prefix for NewVision. Anbernic vendor prefix added in
   https://lore.kernel.org/linux-devicetree/20220906210324.28986-2-macroalpha82@gmail.com

Chris Morgan (3):
  dt-bindings: vendor-prefixes: add NewVision vendor prefix
  dt-bindings: display: panel: Add NewVision NV3051D  bindings
  drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

 .../display/panel/newvision,nv3051d.yaml      |  63 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 504 ++++++++++++++++++
 5 files changed, 579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

-- 
2.25.1

