Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8EF611BD6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 22:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A5810E8D9;
	Fri, 28 Oct 2022 20:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E60E10E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 20:50:17 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso7671291fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FcP0tGCK9d7r2ZJkyYaZJhFzBpIGugbHphWbIKx20Xg=;
 b=ZoMWjfVQvaU9c5oUUdOo8SQUqm+QXHBAcJEfMVRu5kWBv4B2iAovEvZkanNtmKNIX2
 43ejNwF7lhM+gZ/zF9rcTNf3hv22Y3+iEWAH6crzWy5vN3pc+N8/IxLteAEj4wc5ryWe
 pr+WpFnJjIil/RHD5fMJ/whzAZkYDKhTvK2imRGdZs8V9OEkPJYLg5LCVyvwAtvcRMyz
 Esu7T7CROvkoDolv/kuS+MtnMETpJza4oKmF4m/yIH0k1ocFmIjQiUwEQqGYvkL044ax
 T+sBI6zxUToSFngKsirDQyagc/KOtKPosm5oTR/uEzXbrWfYORG4yuxe6VFD8n1tqatL
 ePMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FcP0tGCK9d7r2ZJkyYaZJhFzBpIGugbHphWbIKx20Xg=;
 b=UtrseNnG/9XDTSN5rX84jGinOoJ89bBvqxcNNeNSFP79LpGmtgCc21ud4usDqiBt9+
 d88yBhkliAg/EL3vVDpGz3DQK2Zvy85DuFr8/opdLfZA3aHXdSMs6V/TZ3D+pOHIY1QF
 fF3CLS8r7ROhdwpMRTfm3nbPi3GpCPsuXeFLUd2NTQ+OaLynLdcnxB3dQhCUvr9fazg6
 A1klpkA6N2v8o7u1UhsL5RQmqulxRCmUw3LUvJdDl79/QR0q81MNsehKL8t4iGDMavqW
 yWng3eDfLBvVYU5xOcXxly5Ldrosq0XBN6vK7AiQIBf1APG2OQGuQwEBy3bGlFLqKdCT
 IK+A==
X-Gm-Message-State: ACrzQf3Z27NAGHU85sgYRdjVV5Vllm7DqfqMJYMXJ0+NJ01uTypLTZjN
 Gfgd5ZQLMU3800jF96yeNzEnk5jWa6A=
X-Google-Smtp-Source: AMsMyM4ZC9mnckst7ftVv7KOT5VCbwZRWKQaH+RkMLpJeqYaCFtr1uVFaEXNVxF2AH4A7oA6UpyaJA==
X-Received: by 2002:a05:6870:c092:b0:132:a01f:7c31 with SMTP id
 c18-20020a056870c09200b00132a01f7c31mr649053oad.56.1666990214675; 
 Fri, 28 Oct 2022 13:50:14 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056830010200b0066756fdd916sm2090778otp.68.2022.10.28.13.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 13:50:14 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 0/3] drm/panel: Add NewVision NV3051D Panels
Date: Fri, 28 Oct 2022 15:50:06 -0500
Message-Id: <20221028205009.15105-1-macroalpha82@gmail.com>
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
  dt-bindings: display: panel: Add NewVision NV3051D bindings
  drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

 .../display/panel/newvision,nv3051d.yaml      |  63 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 523 ++++++++++++++++++
 5 files changed, 598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

-- 
2.25.1

