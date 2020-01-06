Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128D131497
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E56E484;
	Mon,  6 Jan 2020 15:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D446E484;
 Mon,  6 Jan 2020 15:17:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so15636457wmf.2;
 Mon, 06 Jan 2020 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gpvhQLZoHknjJ48p3/o2FGQ5HOsekKMFfojG0bDSsqg=;
 b=KB5fdqLSM2cxZ4hWFKG4I+fvO8r5AB9PHS98h9BBsn2xLvMouLGDrBteRn9sUKU50h
 G9fMGn6fIYvg3Wm8+FA3eKhnVFvJj6lHr20iqMVWGB6loLxYo3CM+kuXNXui28iiqeNX
 T3kT8cT0BLyftcJiL7QHrrj1PUUqYg60s9HwMlSdOmbykqR/eSe7ZIHNsQnObzjtl3Ug
 u4d++4DJPrFPehKamp36pLNtFkalxWAw7EjIQm29xzy2tpLGMGl9vDNoB96pi0oLAN/g
 0EC9TSrN8i4pohD3Qr7ofD14U2vVlfoA9XbK8wRcZC1EPRHP9uBvb3UQWmDZYVqLmPla
 erKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gpvhQLZoHknjJ48p3/o2FGQ5HOsekKMFfojG0bDSsqg=;
 b=WajFWHNXNuJXcwyDaF//F05VEyWfEOtZ1TEGM639meI3r9Y08+bTdSeaI3SAV+TqP8
 ddB7vQnCgCXFdmp/IBny8e3i7Q2ne4r04j0juzbWJ7hx2T3bbRnlc0fAXvFAgEQnUqoh
 sAhfKsYTZOcqEHLNdscAmhj/8/tbuUusmTeacIYM0YUac79M7HBKUTT8EPi2rjhcnx2v
 3zLb701gOL9S9TpHidCLrkFZaVr+kJbPvrz8md4d8Uiu/Qs8zphUgoQz4nTp4jpkZYp7
 7r4reEisl0BRCxN2ANogBT7pHTpTDYBh/eq8FY/D3wTeK8l5MuNzG24cfrAsmcStGg7n
 NbTw==
X-Gm-Message-State: APjAAAUyrKg3YLlJf2BV1HEhIhIWagaRWYThVNSuYzZhjDdOXKrJ+2nt
 pLfEQ0kfuypdxrO7L+uTNuxPLLC8Wgf3ig==
X-Google-Smtp-Source: APXvYqyPuCXy4xd36sgrJa286zCiAoAPjP2058i4I+qddvYosdeD5QkkY6BQZOszgfUbZSuabmd/mQ==
X-Received: by 2002:a1c:4884:: with SMTP id v126mr32826252wma.64.1578323820322; 
 Mon, 06 Jan 2020 07:17:00 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:16:58 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] update hwdw for gc400
Date: Mon,  6 Jan 2020 16:16:45 +0100
Message-Id: <20200106151655.311413-1-christian.gmeiner@gmail.com>
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

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 18 ++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  |  6 ++--
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 42 +++++++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/state_hi.xml.h | 29 +++++++++++-------
 4 files changed, 79 insertions(+), 16 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
