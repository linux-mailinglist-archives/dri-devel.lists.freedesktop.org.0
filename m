Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31310184D4C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 18:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250056EC39;
	Fri, 13 Mar 2020 17:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1FE6EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 17:10:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s5so13111829wrg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdb2mFLTWBsI5o+oIoQjLHbItACHhPQ4U5Gl27b7t0I=;
 b=b5LtUyvYcaPt/25D/uGbyW9tRGXLz+JpY7ph7XJRep6cngkbEueabaU0ji2XUDe2/G
 0mKzNlsmQqRjQIvVMSRyJsMBvTHSl8u9zyFT+DOn0wevpEHeMFYRxPaUary9tofClv3N
 JeOs3WJJ4QtyQauHqPUBCq8dn24hUjyiB80emGPKNDeOxZkUfFwgZOupI+Fuad7mNaSu
 VKuJxGcy0efp5/3uUFwoVayPuXRMelq1wCXlsYeydp4OpY/xthBxd8tPn3Fgp1+5u0fg
 vxQsBCgQlTu3SdD1HX1lxe0vorI0WdVIqV3DcdnaqZKSagAYV7Sx7N97w9IfoBed8QVI
 5V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdb2mFLTWBsI5o+oIoQjLHbItACHhPQ4U5Gl27b7t0I=;
 b=uBr4fm5rl3K0lg8WqPTUf8VQ6xaUfb5ACSigWse4y5ZEO/L1QUSBJJGLmwnVDM/0UQ
 c5Q/9OnytRryjax1/eBozvq/25ubaJ33xrsxEN3tAn418utmc2FA9WuAoIfVKh6HLVLB
 /UedzIBM5zz4qMbsoDTc6BNDG7+tbFMFx3hQKQmZAdiNF4LtiwZdYE0C9zbAfeoguezS
 fJqokkDnNi5/MVs6np5SukRwIoRAQxIuEp7nGr+KKG2YF/QEMwGfUHSyGrj2GFmZrgJn
 94HEkfjV4j+BTUvhO2U5klmK0qm536Cex/XcOlQYm+ufUW3L9OEbNAigCW5sH5d/jwZf
 4CfQ==
X-Gm-Message-State: ANhLgQ2kaF35cH2ZEByhumvREhfKz9beWLL0XIGwP4XBF1MziAmewZ1L
 1ZJr+xdaewA1ZgF9M9S4qpc=
X-Google-Smtp-Source: ADFU+vtZiUmrNqKbLc2BlE0O/gbSVFFhhgSKhyOz5oFO5bE/9gj9Yc5QFwFpou47EO+a+BdAW3xZzw==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr18471467wrn.319.1584119444211; 
 Fri, 13 Mar 2020 10:10:44 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
 by smtp.gmail.com with ESMTPSA id a73sm1621805wme.47.2020.03.13.10.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 10:10:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 18:10:42 +0100
Message-Id: <20200313171042.2924890-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-rc1

for you to fetch changes up to e32c8c2a5fbe1514e4ae9063a49e76ecf486ffb8:

  drm/tegra: hdmi: Silence deferred-probe error (2020-03-13 18:03:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.7-rc1

This contains some minor cleanups, nothing too exciting.

----------------------------------------------------------------
Dmitry Osipenko (4):
      drm/tegra: dc: Use devm_platform_ioremap_resource
      drm/tegra: dc: Release PM and RGB output when client's registration fails
      drm/tegra: dc: Silence RGB output deferred-probe error
      drm/tegra: hdmi: Silence deferred-probe error

 drivers/gpu/drm/tegra/dc.c   | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 14 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
