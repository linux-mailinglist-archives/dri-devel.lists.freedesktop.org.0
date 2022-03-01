Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09B4C8F19
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B5C10E3A2;
	Tue,  1 Mar 2022 15:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5176410E3A2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 15:31:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e10so3547441wro.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 07:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0v1/XoAfo8OiusawK2xptMevQgjSP/uOA1ylFEwvrk=;
 b=q6Gl7JqGRLJ0IZnenEDJZ/SUKFSNwODzYLrxYwlmeP0SmOiTSYPCOALs3UAeL5KFBo
 tqm+ucw3tVQoLNOZCvGiGAX9YCFeDMuAmrEdX2Ptln3sl1Vufdf3Cx3hqWAkv5Y2KKgE
 jbA53JJouHY3E/H3giRlhRK/cNIfxfwPPXLlY2Js8L+Pxi+ubQVMQhlK535HkuZMhsOL
 vLCJcGGldWV6BsziBqqUWvnc/r8yLuHOaQa0PWeuqOwYgOMcdmw/KwUmyYGYEUyQBX2v
 MYPoRpWMY+BkI1ET6F1pkuZu0BjvNT3JsIgaqgQQFMccUqG056bATPVPXZaW1UZU3VRC
 dJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0v1/XoAfo8OiusawK2xptMevQgjSP/uOA1ylFEwvrk=;
 b=rpEeOLIlJr58O0eiFNDAT8e0vLCLDg0zVvY36zLhhdFyIUCjEzYS6ZS2OWrKR1li8c
 ABMNk6Px29iY4SOQ012sxaIOlcY4ATdPXxvD+CZywalxNlRCyAeZZlsfew4K9/UJE1d8
 PYSiTzlapaOnd1OtEVRDHxiyShxBVzJ7eXJFMI8Yi9gX5x7HYe6Zz31xyTKbOfFRfE4R
 mLl6qdQz4ySIVF7Hd0Sj+ibaUV0P5Okh94NXvDh/aqN2I6V3WWs2SZW/22HfSJB2zbNT
 //Jyi2TPHbuBOm594SiQjPCelt7ffhAPMGChD4/OtwlExNRELJq7I2PIF5vjVwFUTwzT
 caeA==
X-Gm-Message-State: AOAM533R8JBdkmHlkS+kKWXuvzEdASZxRxkUmmFngEhmZtdCdypfP1pK
 SNLvCCPe2DzSCnQMwtdJu/s=
X-Google-Smtp-Source: ABdhPJwrbutttcQ3i7t0ZjlgCyEYXrdYj31hgKGBJUFAXym1YFapciH6fS5sP/jnS+a185+S7Qs4+A==
X-Received: by 2002:a05:6000:1b8a:b0:1e4:b3a3:4c1f with SMTP id
 r10-20020a0560001b8a00b001e4b3a34c1fmr20285634wru.202.1646148696732; 
 Tue, 01 Mar 2022 07:31:36 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm5797377wmq.0.2022.03.01.07.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:31:36 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 0/3] Ingenic DRM bridge_atomic_enable proposal
Date: Tue,  1 Mar 2022 16:31:19 +0100
Message-Id: <20220301153122.20660-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, this is a set of patches to allow the upstreaming of the
NV3052C panel found in the Anbernic RG350M mips gaming handheld.

It was never upstreamed so far due to a longstanding graphical
bug, which I propose to solve by introducing ingenic_drm_bridge_atomic_enable
in the drm driver so the CRTC can be enabled after the panel itself slept
out, and not before as it used to.

After the drm change, 2 of the existing panels have to be modified accordingly 
to introduce missing .enable and .disable in their code.

Christophe Branchereau (3):
  drm/ingenic : add ingenic_drm_bridge_atomic_enable
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/panel : innolux-ej030na and abt-y030xx067a : add .enable and
    .disable

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  19 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  23 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 504 ++++++++++++++++++
 6 files changed, 575 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

-- 
2.34.1

