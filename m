Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40A5AF3F4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590FB10E11D;
	Tue,  6 Sep 2022 18:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1310E11D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 18:52:12 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11eab59db71so30358694fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tWpKH+dFpia0oudOayWqVdlxFvhIRlTebrzm3G3i1Mc=;
 b=a0PODBzj/9iCiS4MIvXo6bz9qzroY3GgZE5RTI+HV5IwH1ECxNQqI1qWlInIrEFk63
 r8gEJmloNFT/wqA6C2Vl1PZ+AkBuI+aIAQFGdONgieDsE+hpbdRQ2DPql5PkMkqzDxvt
 wfVnDPWr+Nqv8VGmoVx1qIKOeMLO375lP/zQxPdY9d5Z7K+qRibM6mR5CbS8CVlP+Ptr
 2iF/TeyjWLtLQgQEoPyTvtftbZ0YgbvOl2iIO+12EL8plwGbpFhUWF50YjLlV04xgWfz
 Zf/Z6MsF0nD6sHIJuyl1mcDqfNifFKyRkkS9IbQqXzyfp8YB0WjHPUcVU5Ft4qIpYbG2
 rUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tWpKH+dFpia0oudOayWqVdlxFvhIRlTebrzm3G3i1Mc=;
 b=DIEG72wiO9yg1cz+FOSzDCPZisuj4yeXslQ48/+1b+r0BEGsPfNxNvxM5BFhHnYEiK
 En1Ji31lsZNmVuWYUqraWjQ4VLkMK9rvLXv6E63ZiR8cWh87SXbhLJ6YVUv2pbvamCGd
 c0obm5e/zSmdkOtg0xU1N5FRmRlR5dI21X4IxuecD1eemWyj/VsYy9Q+0I4HPzRkcTYw
 roh3VlflyfcsVbuRnrBX+gUhBdh72lycvwtr3DRRGFxsdMckKMJUqrWrzZsAc8K7riui
 mohUER0JXRx3Jtt86TexxYHRHaqL71/VmVRE8wo33bL4gITpdLp64jQRL9URzWVlVztE
 JI9g==
X-Gm-Message-State: ACgBeo1Xi9P5q6H5yk/aLyHPA9Zvp/CRXTbZNduLfm2UkZaB5f36V/YD
 Es2i45nInme1yR8Mlw5MOflcr76CxVA=
X-Google-Smtp-Source: AA6agR7A5usOtNzmkwttlgJHZZk3U0A6XJklVhh1CCXN/3Fmb+ztyzN8iESfjXm7b+K8pSPGlb8VtQ==
X-Received: by 2002:a05:6870:340a:b0:127:74a9:c8d2 with SMTP id
 g10-20020a056870340a00b0012774a9c8d2mr5027469oah.235.1662490331985; 
 Tue, 06 Sep 2022 11:52:11 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 f205-20020aca38d6000000b003449ff2299esm5666177oia.4.2022.09.06.11.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:52:11 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panel: Add NewVision NV3051D Panels
Date: Tue,  6 Sep 2022 13:52:06 -0500
Message-Id: <20220906185208.13395-1-macroalpha82@gmail.com>
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
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the Anbernic RG353P and
RG353V. The underlying LCD panel itself is unknown (the NV3051D is
the controller), so the device name is used for the panel.

Chris Morgan (2):
  dt-bindings: display: panel: Add NewVision NV3051D panel  bindings
  drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

 .../display/panel/newvision,nv3051d.yaml      |  48 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 478 ++++++++++++++++++
 4 files changed, 536 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

-- 
2.25.1

