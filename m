Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CCAF9AFE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ED110EA66;
	Fri,  4 Jul 2025 19:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nTvKW0hD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2F110EA64
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HHqYU6yfCCsgkKL7sQNU57940KHhUSPee74Ywt9zyMI=; b=nTvKW0hD93VwV//0y9nBRdjyx0
 ae4BEjTfb4KCRul7vNYzblwVOqm67VWlntPKYK2uUI5fiUQDOykXnT9QkEs1T1QUnaAGR5KY9vvz5
 PwsBOKy3HPhyZenxQ9ZECtV+2aRa/jlplvsKJxly9bsm9M308pjwgB1TBrXpeRhW4JUZtqeeV3L9l
 x6N3pkkRpwPMZ1rZjuQU0UD2lLlaeY9vMGBtJQonU3A3eo22Mhkj5tL4nq9Sw2OVYFHuW0D7HOSdV
 mjbxjZFO6MzLuWEIjjocUgrnxETqcKo4uHioG600/7l3tpjdN8GmAZwuGne0kT2odKRQGQSVXFDzr
 kfn0lS5Q==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uXlkw-00CY0F-0f; Fri, 04 Jul 2025 21:07:30 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v4 1/3] drm/doc: Fix title underline for "Task information"
Date: Fri,  4 Jul 2025 16:07:22 -0300
Message-ID: <20250704190724.1159416-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
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

Fix the following warning:

Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.

Task information
--------------- [docutils]

Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20250618150333.5ded99a0@canb.auug.org.au/
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: Drop new line at the end of file
v2: Add Reported-by tag
---
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 263e5a97c080..5bc1da4915af 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
 Task information
----------------
+----------------
 
 The information about which application (if any) was involved in the device
 wedging is useful for userspace if they want to notify the user about what
-- 
2.49.0

