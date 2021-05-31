Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0939691D
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182246E077;
	Mon, 31 May 2021 20:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4ED6E077
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 20:47:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so213675wmd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvdU+MzRE1GsrVSHT5IzTceKGFKS8AKre8L+QNPYHb8=;
 b=zAdaznLM8+I8iYeQVBuGZ8AX5m7AUPxnKcGjxroA+/JvMovBXFki0iGOP8MsnVEcNG
 2zbCEK0D4FRJLcLNuiqmLAXj5QXqmAWhEcCxjE2ehCQrJx6nqh3G1a/7BI+ORvVoIhZW
 MK+3VIYVBWb8GDkTJwtKda7W1uhd6bj0OwplW3gnDsvPkVNpQU0yiQGEq9KPFrai1Irl
 vkxwHqKXAmVoBFffqSBsxmCj+L09TN/MITo4WKJL0Mg6TgSz6jC8DpVU1etLLcSxBI0E
 zkSctYI3YEZ2xjkeAeFAdvx6TpRcwKEwjjIuKbD/iz7S7/6ULnN+03wlMvY7pHVnyh4X
 HVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZvdU+MzRE1GsrVSHT5IzTceKGFKS8AKre8L+QNPYHb8=;
 b=TRnVUAqvDaxy/IuFSlWnhoJ3rZSQ9DYHHyaIC7fnJpwqVPnzkTqHp5hEy6GVZQFy9C
 CfYLSqz5EsdREC2IXgau6XdSyBoQWBCzUJBDHR9P4WqPUZG5cwkgR5U2IBx1QR2/HjA+
 fPdgIaCyENcmcSuaKE8tOELO2Fa72c6AigWJ1LvRT33nsuxjHkTBy5V87Uww20lt716n
 19FMPKsdu695j/xQw39546q8JRg7MFxTDZ8lPbDn1IjKGXfST0OQr2/Q5e4E6UxlbD/t
 3ievv6Nta2130qlV5T7a3xQfNf8lxumIKICWit4wLyUB9o/v2souEmgzWubSfB78Tfx5
 3tkQ==
X-Gm-Message-State: AOAM532ZLLBs9hiGjrvrwFKHjd9wF+JfNRBnHv5rx3sL0+nqunLzo2cn
 B3Zpz/q5zFfxKRtz5qmxIUD2tQ==
X-Google-Smtp-Source: ABdhPJyhrmI4are9/P4uVX4Ay/kS4QEF4A6YXPz928Vbv+KHD9vsVucB9/DIEK7JNVLY1hH85lq0iw==
X-Received: by 2002:a1c:9a84:: with SMTP id
 c126mr22691630wme.160.1622494033224; 
 Mon, 31 May 2021 13:47:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 m7sm874240wrv.35.2021.05.31.13.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 13:47:12 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] GPD Win Max display fixes
Date: Mon, 31 May 2021 22:46:40 +0200
Message-Id: <20210531204642.4907-1-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series is for making the GPD Win Max display usable with
Linux.

The GPD Win Max is a small laptop, and its eDP panel does not send an
EDID over DPCD; the EDID is instead available in the intel opregion, in
mailbox #5 [1]

The first patch is based on Jani's patch series [2] adding support for
the opregion, with changes. I've changed authorship, but I'd be glad to
revert it

The second patch is just to fix the orientation of the panel.

Changes since v1:
 - rebased on drm-tip
 - squashed patch 1 & 2
 - picked up Reviewed-by from Hans de Goede (thanks for the review)


[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
[2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/

Anisse Astier (2):
  drm/i915/opregion: add support for mailbox #5 EDID
  drm: Add orientation quirk for GPD Win Max

 .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
 drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
 4 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.31.1

