Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835C2793CC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 23:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110A96ED63;
	Fri, 25 Sep 2020 21:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDEC6ED63
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:55:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a15so3668011ljk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i6oMAURkfpsM1dUr55Vm2bufPN+8aF78G8f5BFLLR3A=;
 b=Dely0EKLau8IdL+nmqudTWOrZEDuMKsHtwbTN+Mq3/wE2V4qnSFfzqyZvmURYLANuU
 xSyUT8rfi4ZPe8YK4Uezz2oqLqzwXqT99D11x9RIVnyhCc45WjfyfpG8wCZWbW2WjG2N
 NQDXGnB9v4619n4KwHtsNwoR7N/5m1Nc6613PIJ1aVUB54m0ocrhLQTfT0QZWSqsc+mT
 jIzHDLhrM2t6QtHrm3c7DO0VzEe7ZUDozMx4uvuWJuNu6SyJlDHLlfvFoPRHasS1XqNC
 B6B0pjWRx0+rFmDjglE7D3vWINQxwAoMq5GKvtfrJcIj9R08QnRdK3qFDNKLKC02xNEA
 mWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=i6oMAURkfpsM1dUr55Vm2bufPN+8aF78G8f5BFLLR3A=;
 b=rknIn9oOzi0l0bovOW+yzVrkK2w8Q51e0TPmG9iPS+c//ENQem7AzJRiRPOqPqzDKy
 cHVywl1GdbkiNRazb65ctw2OTTLHf/70BI2OPyl2Odr2rj8m7R61GOFRHpnOQeOxvvu2
 UCwMtltG8ZQ7kt8tXvi5KdjLl1vMSpaPAVNIpuvsvtX1qtE2Gjk6n1x1z1h+NYZKyq8l
 T914kZ4t/abiX+ATUhirfuRgnfbAdKqJ4FXG2ikDVkADg5+OOkb4PI7Dhd9VxC9Mnzdl
 VEV5zvQ1fvV+TRUreIBzxBBfl++cWt7fbXh+y/JL0+aJ82Jx7Gai2T0JVmrQgYo9gy5U
 1glA==
X-Gm-Message-State: AOAM532uhvfC++DpcmKduZun4HgrC6TW0h6laxBjhu4hHy2MOSXhDoPS
 KWIUp+AiBrHD/8UTNByHfXTlipYNprfamg==
X-Google-Smtp-Source: ABdhPJxIf8FGzG2G3JmzwlnNX51K9ts8L4rukeGTKUh4OsuMTdytpe0dTkcn46fNV0lf5jOQyhdNww==
X-Received: by 2002:a2e:8153:: with SMTP id t19mr2079197ljg.334.1601070930792; 
 Fri, 25 Sep 2020 14:55:30 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:3926:b59a:e618:9f9c])
 by smtp.gmail.com with ESMTPSA id
 j8sm261277lfr.80.2020.09.25.14.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:55:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko@sntech.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 0/2] drm/rockchip: fix build + warning
Date: Fri, 25 Sep 2020 23:55:22 +0200
Message-Id: <20200925215524.2899527-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a newly introduced build breakge in drm-misc-next
Patch 1/2 should be applied to drm-misc-next

Also fix a warning in the same driver - the warning is present in v5.8
Patch 2/2 is a drm-misc-fixes candidate

	Sam

Sam Ravnborg (2):
      drm/rockchip: fix build due to undefined drm_gem_cma_vm_ops
      drm/rockchip: fix warning from cdn_dp_resume

 drivers/gpu/drm/rockchip/cdn-dp-core.c      | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
