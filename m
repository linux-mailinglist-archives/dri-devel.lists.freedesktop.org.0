Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97A5F855F
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 15:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51010E242;
	Sat,  8 Oct 2022 13:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 93431 seconds by postgrey-1.36 at gabe;
 Sat, 08 Oct 2022 13:12:39 UTC
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0924910E242
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 13:12:39 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Ml5FM0G60z9sBk;
 Sat,  8 Oct 2022 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1665234759; bh=UPOia2gKXevh7S7Rz8ugfNl6OojhvizVLjwPYJRn+14=;
 h=From:To:Cc:Subject:Date:From;
 b=Q0p6qq697jv1U9IWnDG6eIwt7pqzAHXjk4JWYtjSlQdYhKUeJ+HLAZH0tGiArK4IT
 BqwMzdebphjb7SozdLPVhadjBeIMnGKsfHIMF5QQI8Tu1NqeQMBmhxyYMBQEyjFbDa
 9M6XhCOotJAyao1UBaZsKNYFQaMgwGnW29O2xjbY=
X-Riseup-User-ID: A3154A88590887777476615470DF5FB010718936FD254B9E07E0996EC81B7ECC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Ml5FH6YqDz5vNH;
 Sat,  8 Oct 2022 13:12:35 +0000 (UTC)
From: Nia Espera <a5b6@riseup.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] Samsung s6e3fc2x01 panel driver for OnePlus 6T
Date: Sat,  8 Oct 2022 15:11:59 +0200
Message-Id: <20221008131201.540185-1-a5b6@riseup.net>
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Nia Espera <a5b6@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds proper support for the panel used in OnePlus 6T
smartphones (s6e3fc2x01). Previously, the panel relied on the driver
used by the sofef00 panel which failed to properly initialise it after
a reset.

Nia Espera (2):
  drivers: gpu: drm: add driver for samsung s6e3fc2x01 cmd mode panel
  drivers: gpu: drm: remove support for sofef00 driver on s6e3fc2x01
    panel

 MAINTAINERS                                   |   5 +
 drivers/gpu/drm/panel/Kconfig                 |  18 +-
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-s6e3fc2x01.c  | 388 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  18 -
 5 files changed, 409 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c

-- 
2.38.0

