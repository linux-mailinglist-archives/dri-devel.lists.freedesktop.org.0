Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A522A942
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ED46E34A;
	Thu, 23 Jul 2020 07:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A805589CD9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:13:46 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id a21so3226041ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4+5ISOyb7tM5s6mEPwXPVcwm6EctmoSKPA8kmLF4uKI=;
 b=dTlq/KdGP1L+HQ163BMoFKaZzkW1o0bImAoZppaIGDaNTzP3zxFSz6uSq5wXoAFpwF
 EL0Q+NQ9IHYNsDuGOQU6kz02Iy+WrcfFlwWdP5BSCyaOzRrjDOxX73DFE+B7Z1ehZ2C/
 V2zKXSX2fgIBxImbV1zVW0Cqz76fHwI7Zwl5WhJyse0E8FlGQIzGt7peaXuI2GFqokEP
 yn9Qjppak9nXO26xpLmyFUyK7F5BxZ2/A9HMGqWoMIjRCMJn0JTVMdPz88rLb79Hjh/+
 jesWVlweehg+eyT0M73fJOId8f8npsd4estpoZgPSIugIGFreFAuOVlw/kcYtjw6j4Av
 nYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4+5ISOyb7tM5s6mEPwXPVcwm6EctmoSKPA8kmLF4uKI=;
 b=jdBk65IpJWsD+YELJO0ZjsGAlTcRorwJw8fY5K3ZySEC+KUaxlY0E/Sj94od64/8QC
 sQdz4lw1pg1dV/GlyziOx/aFsi5mkum2NhvhMBnqtNGgmDZ157XkJPVn7EjRiZhsokt/
 HFWLPdPAC5ZdnfFa6areihfg52EkfKPgeMxvJZnnQzBliTAK6NA/xRiFNq2UVNKNrtDP
 33vYphS348FpJrocBuc74aW9SeO5OOufLk4DvCYgJ6zHPBorxpn7yZXifgnyqoQB1XkV
 2v8X/5jJrfqWRS2Z90jHt5Q3DlApLl8WxnXp2JHLJv4Hx6CGlktgt3rgwBL+TlU5xVY1
 1n4A==
X-Gm-Message-State: AOAM532gDgSmYdig8y8piC5Wic6KrCcRZ/hYURqfzFUPQejawjM6oRTO
 VygwdndM9udtUIN5us0IyQ==
X-Google-Smtp-Source: ABdhPJxH3ykklNW90CXxFH3WCY8jAJvtLfyYFceNbp5BHs4YaXxdf5D02pAOLtVlNj7b+JXICAZrbA==
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr767276ejb.552.1595441625318; 
 Wed, 22 Jul 2020 11:13:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:13:44 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 0/5] drm: rockchip: various ports for older VOPs
Date: Wed, 22 Jul 2020 20:13:27 +0200
Message-Id: <20200722181332.26995-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this series mainly ports existining functionality to older SoCs - most
importantly enables alpha blending for RK3036, RK3066, RK3126 and
RK3188.
Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one (1) overlay window.

Regards,
Alex

Changes in v2:
- drop not yet upstreamed dsp_data_swap from RK3188 regs
- rephrase most commit messages

Alex Bee (5):
  drm: rockchip: add scaling for RK3036 win1
  drm: rockchip: add missing registers for RK3188
  drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
  drm: rockchip: set alpha_en to 0 if it is not used
  drm: rockchip: use overlay windows as such

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 42 ++++++++++++++++++---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 3 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
