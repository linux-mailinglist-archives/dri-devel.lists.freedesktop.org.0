Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F309376E596
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 12:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F0010E0A8;
	Thu,  3 Aug 2023 10:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FBF10E0A8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 10:25:19 +0000 (UTC)
Date: Thu, 03 Aug 2023 10:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1691058318; x=1691317518;
 bh=v+guSkCU7eByBrR0Khg5QuKEAXXo5T7bPOwMiZiw9IA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=V1NZq8trLN+gLqES1j1+8TcSb525XRgpriOlVrkGRY3DYOP27UAiLRO1YUlEIAZ6c
 NvgHrwI92A9C+yDLbiZO/Vaz5vl/fgDH+bxlpQyb7/MlmciQe9MZzhliraFsBQO7zD
 gvsXZfm+GWQyNH9AFTdaxQyiT1EJypuoBKrJQM88nzEjx4St0Ntl7INgoAoX1AYYYP
 Wxwbf7rlHBsJNqK/wHTv1L/aZ2ZqQ8d+QIFqeD8Gnr5sQfZMlfHvea3btlpqbuwYzY
 ebO0/jSMJAAL4WT9iDZQmNBVNB5leuVM3t63S9irfn9IBpIdjS3/eUlXNuMYfHw1lc
 b7JO/vLue1Ujw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/doc: fix underline for section "DRM Sync Objects"
Message-ID: <20230803102505.392577-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It doesn't line up.

Signed-off-by: Simon Ser <contact@emersion.fr>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/drm-mm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 513197359aba..c19b34b1c0ed 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -520,7 +520,7 @@ DRM Cache Handling and Fast WC memcpy()
 .. _drm_sync_objects:
=20
 DRM Sync Objects
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :doc: Overview
--=20
2.41.0


