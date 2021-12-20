Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1834047A7EB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 11:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B9D10F739;
	Mon, 20 Dec 2021 10:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14E910F72E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 10:49:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q16so19156255wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 02:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNi4qiic0TYEzuXe3GMyw+hHwUv5aSbcIBy8T7yuN2I=;
 b=mWGJ0/BtFhEpiuWuq8qucQwyR7Lh0LI943aKEKwy7IFYuOSsxn0YcT2+5ilb6biX2D
 hwi91QZpD5ApdPzt+V8xc2ZU5VhjaV3Jns4drOsen+fTF4Paquai3TdZNYdNb1oA6ii0
 OH/mEGZBjY7t2R7PLqPVrg5E90VEY6/GYNc3VgPp/YWKBRYs6AfZneCABnJzD3DWqwC+
 2h031q6Rb0GLhiP0Xv3OHOG6PxMhmqt0H81l91mdJdPW9j0wDGI+6r6ZD/sDPlAlxukn
 XR1i34z0m0+FpdSrnSP/6iK9LisgOM/FeYyDv/e9JCOVYKHyCy+ztPby9PSNeTxwxU1u
 msSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TNi4qiic0TYEzuXe3GMyw+hHwUv5aSbcIBy8T7yuN2I=;
 b=vUljEG4Ke8tMwBgoxV8ZKC391xtKkKrHnaeBl8rPviIm5Xl7fovpA5dCAvsdkNi55n
 MGSCxfKuiYtH7JRcVUkGSj2nGodoAwN/0VtPpuY+cCPjUg0kkPz7Wklo55bmLVhL2uAB
 lpolaF6p/ZjPT6kJXkwM/2CEnb7m6zQrESiQpF4ac/kS1OppPC1WMFdAq6P2cJ6P2b+b
 sVJp95UtNDue4tWshWRLXdWwlNZfiMQ260tzujTYxQUKJlFWWt+jGj1U8CIwDvS+ATzt
 omJAlafi9DLC8mGsyvRjskh6ZwLOknBocjKqWyED7Hr0E8cEkN264t2xY5vU7eQXToG4
 DKXA==
X-Gm-Message-State: AOAM531mgzJsRpwTUSHESnUekFTR6bLGTOX+25sNv7MeoVGgCRSxf098
 /UzJBIzgE+b6o8wy9gZMn/iio0WkzPrSOA==
X-Google-Smtp-Source: ABdhPJx3FoxjltX3ZPqn0uII9LtxXbQ85gtyXIy0sPHbu3r4xcA9ae09kglW6+U8NyJB4owZljGF/w==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr12435876wrp.212.1639997340338; 
 Mon, 20 Dec 2021 02:49:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id bg34sm19534503wmb.47.2021.12.20.02.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 02:48:59 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Date: Mon, 20 Dec 2021 11:48:53 +0100
Message-Id: <20211220104855.428290-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

this is an alternative proposal to fix panel support on Venice 2 and
Nyan. Dmitry had proposed a different solution that involved reverting
the I2C/DDC registration order and would complicate things by breaking
the encapsulation of the driver by introducing a global (though locally
scoped) variable[0].

This set of patches avoids that by using the recently introduced DP AUX
bus infrastructure. The result is that the changes are actually less
intrusive and not a step back. Instead they nicely remove the circular
dependency that previously existed and caused these issues in the first
place.

To be fair, this is not perfect either because it requires a device tree
change and hence isn't technically backwards-compatible. However, given
that the original device tree was badly broken in the first place, I
think we can make an exception, especially since it is not generally a
problem to update device trees on the affected devices.

Secondly, this relies on infrastructure that was introduced in v5.15 and
therefore will be difficult to backport beyond that. However, since this
functionality has been broken since v5.13 and all of the kernel versions
between that and v5.15 are EOL anyway, there isn't much that we can do
to fix the interim versions anyway.

Adding Doug and Laurent since they originally designed the AUX bus
patches in case they see anything in here that would be objectionable.

Thierry

[0]: https://lore.kernel.org/dri-devel/20211130230957.30213-1-digetx@gmail.com/

Thierry Reding (2):
  drm/tegra: dpaux: Populate AUX bus
  ARM: tegra: Move panels to AUX bus

 arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
 arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
 drivers/gpu/drm/tegra/Kconfig             |  1 +
 drivers/gpu/drm/tegra/dpaux.c             |  7 +++++++
 5 files changed, 33 insertions(+), 19 deletions(-)

-- 
2.34.1

