Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26B6394B8B
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48846E187;
	Sat, 29 May 2021 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77A6F5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id df21so4786539edb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rNFtWXNjGOhAnzhZIEB5pnyB38+rxkkPxxFke3J42dU=;
 b=Cp3x0F3HzKzYTPdjhti0qWsurFeZhEYI49cQWIWnZ3c7rexuYRJ4OYj/Y/mEjcYlxR
 yjaFAh2o8JR+p/Cca1aceicCfVU+q7IHag8HwBFzKW7y1WaOXpJu7g81ZwiuD+7awXml
 yZHAZq29gLBl8X2TtlZ7AauzoDl9DRTRkSfAQsHeJwcSyLuj0nOKG9gmEe0lI9pX3NjF
 bbvwaW1pSPJktRmFi1zeVAjTPxkBuU2dn+2furdeHDvaQSf9gXTUN3G2tfjjlVU5V2Zn
 V0b9JAitSJH6DuxUORNqqs4xBxI1HktvQfvKv/9+Coe4CyyTFliegMaaIw81qxY9uUA0
 sC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rNFtWXNjGOhAnzhZIEB5pnyB38+rxkkPxxFke3J42dU=;
 b=pe07RVt8dr3Toe7JaAEzUoELy/b12pEB+pQFf6dz2quqhcSfUdZDdwO22GUim/6nBb
 TMFGb5RhKRVPej6yEntJ1Px0lDaE7H2e7MlaY+khXUCcrnDLfYh7655tXh0i66mJ0Psi
 GyV+Lb0UJsEs5Tfy9gMT204PYvXRZYEyDWZe87miRqvlZy0MbgZtSbiCpldD/QQVqS9E
 vQEkf70zWysNcHP+fNEuh45M16tCT4i2m46nAadknScdwo33PY1iH/dOIRK4gROZqn0D
 wsDrrOj9VPjUV12x/1wCdsbSVkLApitolERRRajsL48mB5LjY8ToFiKHmcA2SNxpGQIj
 l8aQ==
X-Gm-Message-State: AOAM533QY+AhrpJSgFUe8ZLygf26YmC7bqKrzzs9RPRYjHDmdjwCnf29
 xKRKM6B1UuK8Ym90MbMgsg==
X-Google-Smtp-Source: ABdhPJxrk2zpxNArotZZCA4evEMOVPnLf5LCF7KZ8yY4PiSqXrjB0JYSxy1zVM4W6d0H6YcovlQiAg==
X-Received: by 2002:aa7:d61a:: with SMTP id c26mr9966117edr.351.1622207170190; 
 Fri, 28 May 2021 06:06:10 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:09 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/5] drm: rockchip: various ports for older VOPs
Date: Fri, 28 May 2021 15:05:49 +0200
Message-Id: <20210528130554.72191-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi list,

this is v3 of a series I posted almost 1 year ago. I considered now all
feedback I got at that time.
It mainly ports existining functionality to older SoCs - most importantly
enables alpha blending for RK3036, RK3066, RK3126 and RK3188

Note some of the patches are required to let VOP correctly process the
data that comes from the video decoder - I recently posted a series that
adds support for those older SoCs at [1].

[1] https://lore.kernel.org/linux-media/20210525152225.154302-1-knaerzche@gmail.com/

Regards,
Alex

Changes in v2:
 - drop not yet upstreamed dsp_data_swap from RK3188 regs
 - rephrase most commit messages

Changes in v3:
 - add patch for RK3066
 - drop patch that converts overlay windows from
   DRM_PLANE_TYPE_CURSOR to DRM_PLANE_TYPE_OVERLAY

Alex Bee (5):
  drm: rockchip: add scaling for RK3036 win1
  drm: rockchip: add missing registers for RK3188
  drm: rockchip: add missing registers for RK3066
  drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
  drm: rockchip: set alpha_en to 0 if it is not used

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 52 +++++++++++++++++----
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 3 files changed, 44 insertions(+), 10 deletions(-)


base-commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
-- 
2.27.0

