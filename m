Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CBA40A4D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 17:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E46910E0AA;
	Sat, 22 Feb 2025 16:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="HguWFOoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933A810E170
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 16:50:09 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 36E962E08EC1;
 Sat, 22 Feb 2025 18:43:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1740242606;
 bh=R34snHbWvdFAPt2gGr+NDVYXXncXippn9g9TO+/e1Ok=; h=From:To:Subject;
 b=HguWFOoXcVlboMy1+IpohjqhqnYAOIkUA02wy4BZ0LcQHkHUs1g5t5OoWdNSRRlQR
 64/qa5rmQlwS/hkNTfBySw0zznghp+yIXZdDEHdYehf2lvezRcc8jaSWL79bHqXuni
 Gq+3HmjzQys4+74dWxvei56E/GHQE+F2V4GbjLSI=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd)
 smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 0/5] drm: panel-orientation-quirks: Add 2024 OneXPlayer line &
 ZOTAC Zone orientation quirks
Date: Sat, 22 Feb 2025 17:43:16 +0100
Message-ID: <20250222164321.181340-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174024260593.17001.10533932745276244185@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of OneXPlayer handhelds have come out with portrait panels.
Specifically, those are the X1 AMD and Intel variants, X1 Mini, and F1 Pro.
For X1 specifically, they also have spurious battery reporting within their
digitizer. The Zotac Gaming Zone also has a portrait OLED panel, so add
that as well.

Antheas Kapenekakis (5):
  drm: panel-orientation-quirks: Add OneXPlayer X1 AMD and Intel quirk
  drm: panel-orientation-quirks: Add OneXPlayer X1 Mini (AMD) quirk
  drm: panel-orientation-quirks: Add OneXPlayer F1Pro quirk
  HID: Add quirk to ignore the touchscreen battery on OneXPlayer X1
  drm: panel-orientation-quirks: Add Zotac Gaming Zone quirk

 .../gpu/drm/drm_panel_orientation_quirks.c    | 42 +++++++++++++++++++
 drivers/hid/hid-ids.h                         |  1 +
 drivers/hid/hid-input.c                       |  2 +
 3 files changed, 45 insertions(+)

-- 
2.48.1

