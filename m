Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A14F12E4B3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D8C89F08;
	Thu,  2 Jan 2020 10:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D7689F03;
 Thu,  2 Jan 2020 10:02:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 20so5139341wmj.4;
 Thu, 02 Jan 2020 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mm65JcAg1ZYpA82nx53uBDXsueD59zvLBeCy6xVJP4U=;
 b=ZdT1OzK7hQuktzkey9WnEYjOrin4SyuliWpOAh8jEtsCjx/hNutr1uZeMy1UXuyWlQ
 RwDATLzRrEsR2ctZbCIFmY3ooZsKRJL0RW92rnFL8rFUt0DiT8bonCZGPfNkNGv78n6X
 ChZetuJF8lJNgf2wu+h4JveqtRT0DirsTgDXTf+1d4yM5wIv2+I74jeHo+X1TZSSR9kb
 rqPFGfB7MUb28/njJcjaFDyUFpoRcbo46Dc5o3ZkTNy+fZ2cqOTTDM/m3QsPKQKrV7UA
 pQXX22i+r5ZqJCHrzK42557dgPYscLCfgMlMPr1leAfunSrGuXu73Xe8XawgVhh7Xr5u
 Oskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mm65JcAg1ZYpA82nx53uBDXsueD59zvLBeCy6xVJP4U=;
 b=H31QuBB8vIJlFD1+k7ik52pjmrVIocvR8+h/IrtMYzTB8ofJ76z7XHfABPqKIkAbW/
 NMeHlbtMyJu9sBCk5kRYKFg/QQcMD0kFgYorT0atqSdX8BpHF1h5vfnxt06LJb3mKziu
 5HAIA9LZf4ysIlxq9AHOlStH1qJ+3RbAdLvxo36Re/J1F7MkaVBP5fAqETqdW43h1HDW
 MXZaC5KPuC0sdQuEniMy3S0+lGgku9/LK8yFr4NYUQa+LFx4+/YdaAfJqKFwUZ5fEkir
 RqXuTyhFx0LEQS1dZMPi36x3icMQKYOXHn46tDKgOQ1gFRn9RDi1G9RtqUesu2qNFjZA
 B0RQ==
X-Gm-Message-State: APjAAAUkGDVrDoaXdQE6muPouqiH5Cw/ekQT+PE1Zy18RrbSajm+C5Iy
 Xa8u+aXCSioBKDwDT3d3EQc=
X-Google-Smtp-Source: APXvYqzzEosiPHarvSoykIKuTVfw921HCy0TuMLrmxCxTM856SYCk1wYvbSMbHGIMA6VIfHGSlyCvA==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr13007143wmb.76.1577959357407; 
 Thu, 02 Jan 2020 02:02:37 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:36 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] update hwdw for gc400
Date: Thu,  2 Jan 2020 11:02:14 +0100
Message-Id: <20200102100230.420009-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series extends the hwdb for an entry for the gc400 found
in the ST STM32 SoC. With this patches we report the same limits and
features for this GPU as the galcore kernel driver does.

Christian Gmeiner (6):
  drm/etnaviv: update hardware headers from rnndb
  drm/etnaviv: determine product, customer and eco id
  drm/etnaviv: show identity information in debugfs
  drm/etnaviv: update gc7000 chip identity entry
  drm/etnaviv: update hwdb selection logic
  drm/etnaviv: add hwdb entry for gc400 found in STM32

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 29 ++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  |  6 +--
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 53 +++++++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/state_hi.xml.h | 29 ++++++++------
 4 files changed, 102 insertions(+), 15 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
