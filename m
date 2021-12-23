Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5D47E02A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F5310E27E;
	Thu, 23 Dec 2021 08:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC1A10E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 08:10:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v11so9844644wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 00:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0f/DuxP5XdKHv9iiqx47pPE+4gNN7bTaKcBE9rvwOvY=;
 b=VRqkex8PM5rV4X6zVGqkNTV3airNy9nvhjYuWJodMWJiLoPgimfqO8p+tBBa6rdSl9
 7qZnPVaQ3KAs/HjO7Vkpy0/s2MGnS9k4U4cYLhP62fedLLEDKyKWc+uErtcWPXnpyXfS
 YSkuDM5W7OLMzF10ywvq18auTJY9OE/iLJAMSPEZwMS6iPXa7tctsVG1nNkNZize2wcn
 8xhbKeBKucObn/e9cmlEav9AN77oW9T05z/uEsVAwq3uT7hOrtiloJSVki90/rP0Q946
 XHczpL3uLPj4yb5w22eWA0kivGZkEaM1Ql5+zRMMe6pJYa/f6zc3tBUBeGgHecj2G/6a
 CWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0f/DuxP5XdKHv9iiqx47pPE+4gNN7bTaKcBE9rvwOvY=;
 b=fR0cZ0FicTVRXnBVBFRDSvvgSHdb3RB4J4Uud3KFny92EDM8Vgz/YlD7Fp7MhDtnEb
 Te2euDqYKKI9/Qt2vypD+hxEz8noeFFEq0z+Iw1Jjus36f4+LKfx3m/U8iKtEVYqqV1b
 KEBShxX2LFxZG6ypQimvQZWjmsnAqACdEk26RuJJCApuUgS1Imu8S+82ePfacocu8VKJ
 KWhuo5QWYGDC6ArEnx4HyXjOt02HIooQFka7Us++FsS+8IBow9+t8R/tBPm73yfJTWOY
 QsFuqYtmuZ2f4wisy3IRgZHg+eEWhKZCy+vshLabzpjiatP54IB8A348K6YrYE49cwzX
 yIow==
X-Gm-Message-State: AOAM530qMHof2jp9v6588ImsOGvH9lxFlBM2YbJIHJpjd2otXV/0Ylvt
 4ObhzeWXpBqX2PrbV00bYQU=
X-Google-Smtp-Source: ABdhPJzQDJZwwSw+UjgbS+4mICsUCNoeS5eclflOZxZe1hKfAzuG1E1Gwy4zFKXJcr9uELWydG7zvg==
X-Received: by 2002:adf:f985:: with SMTP id f5mr904698wrr.14.1640247043603;
 Thu, 23 Dec 2021 00:10:43 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id r62sm3841313wmr.35.2021.12.23.00.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 00:10:42 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH 0/1] drm/vkms: zpos
Date: Thu, 23 Dec 2021 09:10:29 +0100
Message-Id: <20211223081030.16629-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This patch adds support for the zpos plane prop in the VKMS driver.

It should be applied after the "drm/vkms: add support for multiple
overlay planes" series [1] because this new patch takes advantage of
the "num_overlay_planes" module parameter to set the maximum and
minimum overlay plane zpos.

Thanks in advance,
José Expósito

[1] https://lore.kernel.org/dri-devel/20211213181131.17223-1-jose.exposito89@gmail.com/T/

José Expósito (1):
  drm/vkms: add zpos plane property

 drivers/gpu/drm/vkms/vkms_crtc.c  |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c   |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c | 25 +++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.25.1

