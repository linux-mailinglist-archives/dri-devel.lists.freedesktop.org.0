Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25016A066CC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677010E93F;
	Wed,  8 Jan 2025 21:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FAUc4oeB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04E510E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736370207; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H8Jb2K4zs+88UpB5qz00vGVfFUbzy45RkhhnXTZjrXOuRmlDxBFqMcjnPhw/64stUUnqoL0strMRAOhKcA6/kTWgJOQqqqQmm8ILu5388pYFzT5Li18gnwSdmWVU4P4a3cU0TfiysYl14g3By+ealgt8w3mCR6nZz5INHIwfEVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736370207;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=j02AXCvuCHibfUnBxBkuO49rQkRYm6/Ti75LjkepN2U=; 
 b=PcbLB+W4T40G4tIFW3FXIlXpBvRR/RkYlW1C1GuwO+IwkKdPPhDajgT6XmSFoYaZy0DWbxw2jhcsfb0fURAttL5D+kuOAtc4P3WJktFHCtYH8QceYRnnsU4eINShPa/pilD+o3dXDc+rs99Y5/SXWtmM3kSWRCb8oOn1BHRLqsg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370207; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=j02AXCvuCHibfUnBxBkuO49rQkRYm6/Ti75LjkepN2U=;
 b=FAUc4oeBHp8DPo7bLj2RB423IhAgkROH3gUL8hPeJvR4fSLvaBgvDONXDJr46SlQ
 92QDrzCGOwb7L3RSmkOSyOKtJsjeVKsiXQtBVI0bSkHSQFOmVM8dECxEn1fPIgtZ2rF
 /8aL+Pl2UqR8u1TsJR+gejmJwR8SUaG67pEEN+vo=
Received: by mx.zohomail.com with SMTPS id 1736370206747493.3339975056514;
 Wed, 8 Jan 2025 13:03:26 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] Documentation/gpu: Clarify format of driver-specific
 fidnfo keys
Date: Wed,  8 Jan 2025 21:02:38 +0000
Message-ID: <20250108210259.647030-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108210259.647030-1-adrian.larumbe@collabora.com>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change reflects de facto usage by amdgpu, as exemplified by commit
d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 Documentation/gpu/drm-usage-stats.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 2717cb2a597e..2b5393ed7692 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -21,7 +21,10 @@ File format specification
 
 - File shall contain one key value pair per one line of text.
 - Colon character (`:`) must be used to delimit keys and values.
-- All keys shall be prefixed with `drm-`.
+- All standardised keys shall be prefixed with `drm-`.
+- Driver-specific keys shall be prefixed with `driver_name-`, where
+  driver_name should ideally be the same as the `name` field in
+  `struct drm_driver`, although this is not mandatory.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
 - Keys are not allowed to contain whitespace characters.
-- 
2.47.1

