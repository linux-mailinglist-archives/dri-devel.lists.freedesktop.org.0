Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5788C67FF88
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 15:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655E110E06C;
	Sun, 29 Jan 2023 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459C110E062
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 14:31:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id kt14so25284187ejc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8MIKp1sLjt2KlpkgBmQpn1698eVN4BwncnTW01kcrf4=;
 b=PtKJDOJ9uQXcFJ9z0ojEz1wUdi1og2nCFbIvZx7BnyohI7+nulSalxMeNCwRRwsOuh
 nYMAwS6TeZMSVFyzxB1uVp2+jHYRvpL16uQmQyc6EH+12yVCVQ7bEDyAAl4mhGyNeDK8
 ZAvcgtgX6pvI6UflJdS0crp/jyLYDaDk5Ikvl/tESeTXf6oQxnbZaYQP6U0CHK6WpQa3
 CPrkC7kMdzXDL7MJkftyajulWlxyxu5+RAOhd5bXKHDVH0S5JNcThf6UX0KPSOn+KBSq
 MxoleBC5Xo9t18skRMV64yO92kpKGbsNqWYPVDRhM/5/9xkfsJ7GDYR63rHOEjeByozT
 AC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8MIKp1sLjt2KlpkgBmQpn1698eVN4BwncnTW01kcrf4=;
 b=NHlRRsQQf+9oVSViCLx8sRn7u614dFKGbjkAr+7f3iyw4uULLZerFHFCshTcIZMsuW
 E7iEd+zVkkcZw1Yn/iqhrL7qpJe0pQ6CrvPtBOfEfZfqKGwzlPr9MZHf/NqffQYC8snO
 4axPjk5grMzPegMuTI3RTOP0Bl6YkfzcCZm/sGh3XaY5bblKrxVG4ZaZENvVEO4jYY/a
 tGMPwQ18GC7xkQyxOCN9XzlU1ZrBg98vPWZRao/8ft/C34UYnPhT3BOQj7zjmfSYyRMD
 RCl7/U2xq1zKJey6OpXXLMqHtYcKl4J306SMONypifzMonAsJBzvbyYhPFAI8UPXnnI9
 5n6g==
X-Gm-Message-State: AO0yUKUKytwQvaqUYsIGZGjSvtuDFT9runtMmosabDgG5+b7yuayn0x/
 /fzzHkKJnYmXCAg7JDlnrSo=
X-Google-Smtp-Source: AK7set9El9Qw9ZNnDW9cHlXT8z0VcwKEt6G4063gTHLbzByjD78crgBS/dqIqQO9eKwbqicdnEtoIg==
X-Received: by 2002:a17:906:6c87:b0:87b:59d9:5a03 with SMTP id
 s7-20020a1709066c8700b0087b59d95a03mr9010329ejr.36.1675002714570; 
 Sun, 29 Jan 2023 06:31:54 -0800 (PST)
Received: from localhost.localdomain (83.6.123.74.ipv4.supernova.orange.pl.
 [83.6.123.74]) by smtp.gmail.com with ESMTPSA id
 jr23-20020a170906515700b0086f4b8f9e42sm5410128ejc.65.2023.01.29.06.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 06:31:54 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/3] Add internal display support to Odroid Go Super
Date: Sun, 29 Jan 2023 15:31:38 +0100
Message-Id: <20230129143141.173413-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series introduces internal display to Odroid Go Super, which
shares panel with Odroid Go Ultra and several clone devices.

Maya Matuszczyk (3):
  dt-bindings: display: panel: sitronix,st7701: Add Elida KD50T048A
    Panel
  drm: panel: Add Elida KD50T048A to Sitronix ST7701 driver
  arm64: dts: rockchip: Add display support to Odroid Go Super

 .../display/panel/sitronix,st7701.yaml        |   1 +
 .../boot/dts/rockchip/rk3326-odroid-go3.dts   |   4 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 125 ++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)

-- 
2.39.1

