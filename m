Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05E29E601
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F186E893;
	Thu, 29 Oct 2020 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82866E47A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 01:11:56 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id o129so964083pfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/vYYV4pGoOTF3hMwE2gN8D0uweBjVLcgDkmz3bxrLc=;
 b=fgXKF0zM65tAhB9vfAzvt1kqnqx/6ppMtb+Z/+3y4bq+jGFJQV9v0cm+af6TjYNjXR
 OGq+trBivjMWysPDumAWZa4FD0U3r3cnG4VrvI05GQgJg6NAEJ0K9dbrRrF4w6AWJfch
 nb9/7AtAeaT4PBQJrK8hkf65x4o4D4KR1Do/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/vYYV4pGoOTF3hMwE2gN8D0uweBjVLcgDkmz3bxrLc=;
 b=AmNBDUPC9tyeFekA0e/bM2IA6gb/zOayy+HDoJtIv408/i4s9tdN120KvalHmQTA6x
 X6A4XHB1HTG810Oerx0GVyx+PG1gx3qnCTIDeIz4TYzRiAUFLOJw8zp1MzMCEAVwk2Vn
 ZRacxR/k2Ge5avlO7pgZ8Cp669OuIm3r74VHmgBffp1OdcIyxslNJTON1NBdA/ViY3Ll
 saWxS9pnQeTSu5xduFkKHfUpnT1mo1FE3GJMrb2MIXrestGEdUarK1f113bYwO90/pK1
 IsCv+NqtpWAGVV8Xz/T4cTjAM1VQ3Aq5SgRtIzpvfo8v4F3954SrSYUHV0WariWB7kHI
 zl9Q==
X-Gm-Message-State: AOAM530LZrNaghyKUp8nBjvVqeHaB7NvdvgIKNmqacoAwiPt2shXGrsy
 uE+auELy8EU/MROTPAgNLCgD5A==
X-Google-Smtp-Source: ABdhPJwmBz/QFu0/rYf71BR9hlr1nzZuuJniIcvv+FkgSAPG2JQqgpTxF3NIK8nxhcfyFb7DWUe/gw==
X-Received: by 2002:a17:90a:a394:: with SMTP id
 x20mr1568689pjp.213.1603933916318; 
 Wed, 28 Oct 2020 18:11:56 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e6sm781769pfn.190.2020.10.28.18.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 18:11:55 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Date: Wed, 28 Oct 2020 18:11:50 -0700
Message-Id: <20201029011154.1515687-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series cleans up the DDC code a little bit so that
it is more efficient time wise and supports grabbing the EDID
of the eDP panel over the aux channel. I timed this on a board
I have on my desk and it takes about 20ms to grab the EDID out
of the panel and make sure it is valid.

The first two patches seem less controversial so I stuck them at
the beginning. The third patch does the EDID reading and caches
it so we don't have to keep grabbing it over and over again. And
finally the last patch updates the reply field so that short
reads and nacks over the channel are reflected properly instead of
treating them as some sort of error that can't be discerned.

I was thinking about making a patch to update the drm bridge connector
code to fallback to using the DDC of the bridge if it's available. Does
that code already exist? It would be nice to not even have to implement
the bridge func get_edid() function in the future if the DDC is
implemented and we're using the new bridge connector code.

Stephen Boyd (4):
  drm/bridge: ti-sn65dsi86: Combine register accesses in
    ti_sn_aux_transfer()
  drm/bridge: ti-sn65dsi86: Make polling a busy loop
  drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
  drm/bridge: ti-sn65dsi86: Update reply on aux failures

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 101 ++++++++++++++++++--------
 1 file changed, 69 insertions(+), 32 deletions(-)

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Sean Paul <seanpaul@chromium.org>

base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
