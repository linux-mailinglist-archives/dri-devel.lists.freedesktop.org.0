Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D715CD0D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AD86E3FE;
	Thu, 13 Feb 2020 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF046E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:16:00 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id z141so3269397ywd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVVgQD/DZExcvbA2SaXqxFO+H+/XiTAWo8usPtEnh08=;
 b=LTNp7xuCybc8VHyGOFWu3PyiNhfqyCBDi+ab455RGfNnK6Zggl6ypolBMNtJ6zEgiV
 AecZ38yl/iTPP0pRDcRF7Rig7XLGuhmLrSsJB571rcB6EbXp1HJmMzY32XHF/6XGou+5
 tdjLAeHPSMZsnp3mqwUlgNKJPmDPACT0MJraT2zm1Fr0zlLRQ/eWVDUFEYEVoVPhQxhl
 +SeZLnWDhodXd19r0YJHa3wHlJ1MZvgUCjxS7v0gpQjxyO7Mk7P+jY8kuwJg2AZhHHxu
 7yKLIzRUMrpYmRN1+IId2d+e1lgdetNBgWRUBjEPFICr1LF7sfLduj2KYCr7cYv4bmjh
 6/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eVVgQD/DZExcvbA2SaXqxFO+H+/XiTAWo8usPtEnh08=;
 b=DGvq6dBeR/GNKp8svPbOSKkqHGrvcdqVz66w5nZ57V9NLc9eGCXxhtMBB9EG6fpUKI
 EYn/RZxpmraucCLsc4P3TiRihbiu3Vo4F9iFFK3zImr9wUyy9b311+KXOwIMNghOdT6C
 Ry9CcJemCaBFyT6NGJBjxfuE4dklRRmpIo0j2CufBGm55sjQyHxzhIvjA1msF7N0sBie
 +88j7bGKxpsgua0j8vvu2Y1sP21YBdXFfLVcf6HH+CQmeWcjZO4OWYB+5P+FexQY7xNG
 LrbGFS4Fh4Kh+ZznXhyHXNnlPeqLhy1/AhlWe8vGbZIdQFltCiaXISnOgRZqAnx9iPaQ
 LFTA==
X-Gm-Message-State: APjAAAVOR8FualnfGeIcX9vaBlOCniRP8IKupJpQbU2v571CmKl84GLA
 hWWgM+dCuY/OkaKcSydBNAFCzPdD/78=
X-Google-Smtp-Source: APXvYqz3AwS0ykHbrPXCPf9mlHtqLs0xT27jv4uRsjiKy/Yd1QE4MHBinMnfnSDCn/vKzfMPe7VaVA==
X-Received: by 2002:a0d:e815:: with SMTP id r21mr16400172ywe.473.1581628559386; 
 Thu, 13 Feb 2020 13:15:59 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id 144sm1696328ywy.20.2020.02.13.13.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:15:58 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/mst: Add support for simultaneous down replies
Date: Thu, 13 Feb 2020 16:15:17 -0500
Message-Id: <20200213211523.156998-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
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
Cc: Sean Paul <seanpaul@chromium.org>, Wayne.Lin@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hey all,
Earlier this week on my 5.5 kernel (I can't seem to get a 5.6 kernel to
behave on any of my devices), I ran into the multi-reply problem that
Wayne fixed in January. Without realizing there was already a fix
upstream, I went about solving it in different way. It wasn't until
rebasing the patches on 5.6 for the list that I realized there was
already a solution.

At any rate, I think this way of handling things might be a bit more
performant. I'm not super happy with the cleanliness of the code, I
think this series should make things easier to read, but I don't think I
achieved that. So suggestions are welcome on how to break this apart.

Thanks,

Sean

Sean Paul (3):
  drm/mst: Separate sideband packet header parsing from message building
  drm/mst: Support simultaneous down replies
  drm/dp_mst: Remove single tx msg restriction.

 drivers/gpu/drm/drm_dp_mst_topology.c | 196 ++++++++++++++------------
 include/drm/drm_dp_mst_helper.h       |  65 ++++-----
 2 files changed, 137 insertions(+), 124 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
