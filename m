Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B647BCD1B
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 09:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC2010E091;
	Sun,  8 Oct 2023 07:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6810E063
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 22:22:38 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5335725cf84so6006421a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Oct 2023 15:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696717357; x=1697322157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0yaMn2Inorx6J5jbXWZ4lv04z9p9knuEMsnSJqco5r8=;
 b=DypeLjpROmDZRHmEHi7Fk+5Y/TYmhexQTiAACzG2uRg47a8iLcdbLEwpzVfxJhZrB6
 yqA0x1Lru1xe+zYP/SCsJHOSHnOM8BQMZXE0dtPcO03urkqCbakJJ5o2cN/JdnANiBXd
 3l1q05y5dFh4BlcBKI+sTuOQTYxTClRjSjTt8FFQ1+hb6gAETGCuw3MOHXsFX2ndRHUG
 7NQUw14dg9X/7QbGPwcyMB0wrm9z5fPTClQXmL5PKyC0+AoAq/bzhWbzWdX7C+iwO4lf
 wLWxeCm0yXTCuO94B/hiYH0EwojCf6TuRDJ96DaY6N/x8YYtNxSc9yuE1/JToNntEPv7
 LR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696717357; x=1697322157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0yaMn2Inorx6J5jbXWZ4lv04z9p9knuEMsnSJqco5r8=;
 b=rCPu2n+9FAQLRGMYJ9R/TLh+Le+e5jecrTAeLWBmlm+kGzjjrzPEl9UcCPbI8v7tZt
 AEwRQeWr0WRW4BinLjlN+GNrCyPm3jzCmIMCk7fdyoOv1w4G30nsdKUQFDPTqoGMyXoN
 DtgExShINZ7ukNuEget3/grJIri29Ls4b0wPRCLjICwrXlGG9Tz4ddI/SFqBoKKf+PX6
 lIAJlVQ3xaDBtdiqh4huRmcK8yzoZVoCtG4H7Wof8VaURqM7tOZa3HNKMr32YU4IlaBm
 V9WI47+e+eyYcElhg2Mmj+PjWhiyE+3FzgqHUdgSZBA8QMumG5AKEUlkaE6aXYrk9RLc
 F+4w==
X-Gm-Message-State: AOJu0Yw3qyY2XBlq4petyu79V7zyDxQkex9+5VPeryMlsXdDIGbcybQB
 6efGpfD+ZBqbhjbYOZPadcU=
X-Google-Smtp-Source: AGHT+IHtu3HnanV7rXLGs6uxTJkkuhW6srImpswGLZ4J0MS5G0alet6JeZIVBHsE+E6Tka0OowL8fA==
X-Received: by 2002:a05:6402:3445:b0:52f:a5d4:1f5b with SMTP id
 l5-20020a056402344500b0052fa5d41f5bmr9517743edc.9.1696717356617; 
 Sat, 07 Oct 2023 15:22:36 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 p7-20020a056402074700b0052f3471ccf6sm4315631edy.6.2023.10.07.15.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 15:22:36 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/2] drm: panel-orientation-quirks: Add quirks for AYN loki
 zero/max
Date: Sun,  8 Oct 2023 00:22:04 +0200
Message-ID: <20231007222205.316032-2-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Oct 2023 07:57:55 +0000
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, boukehaarsma23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add orientation quirks for AYN loki devices:
- Ayn Loki Zero
- Ayn Loki Max

The quirks have been tested by the JELOS team and ChimeraOS
who have been patching their own kernel. This has been
confirmed working by users in the ChimeraOS discord
servers.

Since there are additional Ayn Loki devices I have
made separate matches for the devices.

Bouke Sybren Haarsma (2):
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Max

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.41.0

