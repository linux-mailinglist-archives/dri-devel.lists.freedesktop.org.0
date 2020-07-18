Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75C225897
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC7089FFD;
	Mon, 20 Jul 2020 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD9A6E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 20:03:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so14264477wrs.11
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CDz0040ocUHxpFUIIP4fawvgLepMYbIMzDH3U+AwhDE=;
 b=Rcf8cdLP2PLdCB7DxKkuMt6EV43l9QwZu9aYwkGNp5s/GN3zpxXluUytmA9Rdu5M8U
 99lHO8D6M1RPJOsPbGOfw7m6Ep+/BoBFpwwLTN0X7pwmv739vngR4oqT3jVvmmhVMQI1
 AVm3Sc6Sjg0+5PYNYI2B25tyLtGnwzcgFKvumrFNqXEezJcmKAgRWkJo+a5XsOtOItLD
 AQMIwczK42lKqChvbtm6pjA+fT7dZs+wfo0CB83XoapwO/y66/QwsM8Yl7zRZAEahTX8
 Bqza7z8bRgof0sv6QtvtxtViukOaviSYpfRialEf5yVK2o7tFYzR7d/FnjEV1SYSYQCG
 B8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CDz0040ocUHxpFUIIP4fawvgLepMYbIMzDH3U+AwhDE=;
 b=HS+7qzslClvL/jQMFKYEC5VrhNKMo2xpXDhs1NsfCct2q0/TWcHikxF49gII0wNweL
 C9M+ZueQBIzggMpExzFPUnQgkB4R08QgdX61uHJoDJTcsLArQKIce4MCBtDevKAfFvmT
 tLANMy2jVlS5PeqE7ZIqEKoCZjjZ7n+R6jaj/8wgtzb2DTu5rL+Nrosg+8ZOgt2+Y5sZ
 Rm7kvgid/6DYBjcvS/SzJA9jRJjouRFZskMBtFoJsq4dqbti3N17YkyEaU+ED+wi8NwZ
 I7HTsbgfVGhr9hBkyNeOyfJS0BeJnoosTvn/nN9TxobmCHr1Z3gNy9R0dG9XUBtGizzG
 Gzuw==
X-Gm-Message-State: AOAM533qTNYBJwU6pcqLEj25f6yj8f08x4vGpQ57vfzI/3pYQm5Xq50v
 Ibq2GZfSy2CmYdOCmfHjEQ==
X-Google-Smtp-Source: ABdhPJx5Fp0CxCd6qslOfU0OK/JewpJD0l6KtPf8y69FELkCFoJGm9+D7k5ACzyusZZ9JM/JA4VQQw==
X-Received: by 2002:adf:d842:: with SMTP id k2mr16092208wrl.239.1595102616515; 
 Sat, 18 Jul 2020 13:03:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 l15sm21073826wro.33.2020.07.18.13.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 13:03:35 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH 0/5] drm: rockchip: various ports for older VOPs
Date: Sat, 18 Jul 2020 22:03:18 +0200
Message-Id: <20200718200323.3559-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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

This series mainly ports existining functionality to older SoCs - most
importantly enables alpha blending for RK3036, RK3066, RK3126 and
RK3188.
Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one overlay window.

Alex Bee (5):
  drm: rockchip: add scaling for RK3036 win1
  drm: rockchip: add missing registers for RK3188
  drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
  drm: rockchip: set alpha_en to 0 if it is not used
  drm: rockchip: use overlay windows as such

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 43 ++++++++++++++++++---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 3 files changed, 39 insertions(+), 6 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
