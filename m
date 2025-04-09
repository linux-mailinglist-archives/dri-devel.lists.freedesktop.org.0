Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1BAA82C90
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 18:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EF310E246;
	Wed,  9 Apr 2025 16:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Mmiq4Hv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 16:36:41 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F4210E02F;
 Wed,  9 Apr 2025 16:36:41 +0000 (UTC)
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net
 [88.217.226.44]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id C73C52FC0050;
 Wed,  9 Apr 2025 18:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1744216234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cNCf3IuAjyApDX/6a4t81bLCKE7aJ1LuEin2d7+4gNE=;
 b=Mmiq4Hv3lSTucmEFxCstErkmcb31wuADE8bC0TYAdXtNwb7uW1iN5ehQgQliIWBtf35qxR
 iwKuS3rlwb3eWoXX8UXLQNkwFzkfJhSDXZ++/7woGdfQ76tMNafMlU8KVtXyKVOKq3rICp
 G14RB+RbCG/epTWizptPWZaw5zzDhGE=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
Date: Wed,  9 Apr 2025 18:26:59 +0200
Message-ID: <20250409163029.130651-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a quirk we currently manually apply via our installer, but we don't
have this exact device + panel configuration in our archive anymore so I
could only test the qurik moking in other ids.

Werner Sembach (1):
  drm/amd/display: Add quirk to force backlight type on some TUXEDO
    devices

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

-- 
2.43.0

