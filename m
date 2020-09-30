Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C560E27DF32
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 06:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B048924B;
	Wed, 30 Sep 2020 04:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5D38924B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:10:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c18so137136wrm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5DVhLmFbpFk4hJocWp76AGcoX/p4KGiPK0AkbQCO2rg=;
 b=pNx/VA0ndstQ+7Jq8wJ7SvKG0kYwrtWqIx2/6vMx1vmwoZtEpTLylAk9fxC9ItV1La
 acU4wkx9eZa9oec0kh/FUuor7LOB8w6zY+5a+qJbHiNIAq26u31W9m7wrYDuBdTOYNCR
 DhcW3HzYpo964PGhpsnWPKSPk30ZdiEBkEQhpMNKi3QXSDHc8cpPdeXw0zTAby693uQe
 W4fBTRmBWgqgx4xlJZW4hSM5HI02i9FzByMkDHfk5w+05Wj690MuW9Oxu2SnqOoZV3DP
 shYn3F2Kl8exyVZLjnNVLVi0qqG0tFz7Ek06CaRz7aOR0EU7VhX/Ny/BqqU0NpNAzGRd
 Snaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5DVhLmFbpFk4hJocWp76AGcoX/p4KGiPK0AkbQCO2rg=;
 b=GzUEalcgTEi9WcKXlvZQEs2HMTttRF5J7+GDbeEnW9lSbuwoeORS2+YooCOsi9DWOR
 rc1PSS8a2Vza8MLX2egBuFGRtoBcdkGVu7ZNL5dko/DwZhGg8u5Fb7v8DxO8DDIVsZJt
 +nTAVhNVHkWu5vSV/4A2zQ4i5qmr5mo+HUuHSE9JFX9QWWMdT6+m53KYuXU9LyBBJo3B
 yaBwSDMHHdTO7uPwd/r0/6eCq+N1kcVNXh9lU4nJ6walR0lwtj1taCU1rvfeerQsTfy3
 7CP5mkJn5h3nzwE47aGby97TIPiIQ1pbQSwKzSUrd3zsNC8WGfeqdED9JdqeOP3aTjcU
 M1sA==
X-Gm-Message-State: AOAM530LtNj/RQAmvYu2mTF4nG1uUEb5ug9x9RP4ke07fzBntzwUGRTv
 ZH593njI8Dhcs4BR4T22CzirybRJ5Qw=
X-Google-Smtp-Source: ABdhPJxIRwgXNCA/4KXnmJg7bmHeNbitUOg/EHQlFVSmL9eUrUXE6LM5nF7hZ+I09hHVrKASHhah0A==
X-Received: by 2002:a5d:4a4b:: with SMTP id v11mr691130wrs.36.1601439010839;
 Tue, 29 Sep 2020 21:10:10 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v2sm519388wme.19.2020.09.29.21.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 21:10:10 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] vmwgfx-fixes-5.9
Date: Wed, 30 Sep 2020 06:10:00 +0200
Message-Id: <20200930041000.2423-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-graphics-maintainer@vmware.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel

One important fix for recent breakage.

The following changes since commit a1b8638ba1320e6684aa98233c15255eb803fac7:

  Linux 5.9-rc7 (2020-09-27 14:38:10 -0700)

are available in the Git repository at:

  git://people.freedesktop.org/~sroland/linux vmwgfx-fixes-5.9

for you to fetch changes up to f54c4442893b8dfbd3aff8e903c54dfff1aef990:

  drm/vmwgfx: Fix error handling in get_node (2020-09-30 05:44:28 +0200)

----------------------------------------------------------------
Zack Rusin (1):
      drm/vmwgfx: Fix error handling in get_node

 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
