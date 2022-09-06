Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C885AEED4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBB910E6D1;
	Tue,  6 Sep 2022 15:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F6E10E6D1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:30:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so9835835wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NW5MbJ9oB/CKkA2uVQGgD3qEK3k/FiXePuny+oDqcy4=;
 b=od9qULTexRVgJTef8J4V+LaNVdUZgsqXUCA7ADevHkDIFUNi/UoNZnBNjyp6BsZb9R
 JDNEe2dNcV72YeBEEi3YHSs0ygvkEdhlqHMyiJxfyZbQtRLVBgknwl6VDbyTBJMewa1q
 YpuCtQpKPI79clSoysJJPrF1aC/rofgxM4AVo/DsHoSGIAAX+zjFGSKam+atpJdSQFOT
 hSA7vu6IUhhql/4Mdvn6n6r3IPvcVZ9RsLkgnGhPcxj3q4n19uY22IhwesEmqSeTu8wB
 a0c9VyEDre/6DXydgGrvQ21J9nzcSUAXF1tzkv1pkXEAhM40XPnLRbuhdsUwUzzEqpLc
 bWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NW5MbJ9oB/CKkA2uVQGgD3qEK3k/FiXePuny+oDqcy4=;
 b=6W7FL/eDdb27ZNQsqN77KbwaRgmmriACerTVD40NfRHSvScgaBtCqSBZb/oFYDD85A
 2gnVF9psOSvxONH9LQzLVdhm32JzFLIH6swvvtofwOL1UleQG8kZeahrpgLwUuPngiHb
 KFEQgJmamxZxY6K8oCQnAXYsZqCjMJbQw3qtZzfHDxHbM/WmSZUDoLVG3GkrizUApjVr
 6uBj6/hWFf/h9fH/DjAOSMSfc7AEvXI5anz9d+kCxlZK8bD1hFftHT383hxB7zmtU3ZP
 nFw4AkJn/oWX5lAne5LHBZB6Ifs8ttVbK6Ez5BIAkODuCXtHbxgM6bkbazkS4Q9/+NQ3
 RFOg==
X-Gm-Message-State: ACgBeo2UtHNN3BuScjIY4XE3B+hFfy6G/GzEzxALOo1JJlWQ8P1BtE/1
 laqNYjpt1tJnTMfv1RGQqew=
X-Google-Smtp-Source: AA6agR7Xp8vqGGwqNGcb09DGgwhi3xKkb+Aoi7Ihjymn/0Fa1D/5dd1OIycy1XIwV/wusOVvCHIBtw==
X-Received: by 2002:a05:600c:4a09:b0:3a6:9a22:3979 with SMTP id
 c9-20020a05600c4a0900b003a69a223979mr14303510wmp.57.1662478236817; 
 Tue, 06 Sep 2022 08:30:36 -0700 (PDT)
Received: from Clement-Blade14.outsight.local
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:30:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 0/5] Allwinner H6 GPU devfreq
Date: Tue,  6 Sep 2022 17:30:29 +0200
Message-Id: <20220906153034.153321-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is a refresh of previous patches sent to enable GPU Devfreq on H6
Beelink GS1 but that wasn't stable at that time[0].

With the recent fix on GPU PLL from Roman Stratiienko I have retested
and everything seems stable and works as expected[1].

Regards,
Clement

0: https://lore.kernel.org/lkml/CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com/
1: https://lore.kernel.org/linux-arm-kernel/2562485.k3LOHGUjKi@kista/T/

Changes since v3:
 - Try to be more explicit for panfrost OPP patch
 - Fix typo

Changes since v2:
 - Fixes device-tree warnings
 - Add panfrost fix to enable regulator
 - Remove always-on regulator from device-tree
 - Update cooling map from vendor kernel


Clément Péron (5):
  arm64: defconfig: Enable devfreq cooling device
  arm64: dts: allwinner: h6: Add cooling map for GPU
  arm64: dts: allwinner: h6: Add GPU OPP table
  drm/panfrost: devfreq: set opp to the recommended one to configure
    regulator
  arm64: dts: allwinner: beelink-gs1: Enable GPU OPP

 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  1 +
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 51 ++++++++++-
 arch/arm64/configs/defconfig                  |  1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   | 11 +++
 5 files changed, 149 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi

-- 
2.34.1

