Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA3AEBE4C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 19:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7159B10E09C;
	Fri, 27 Jun 2025 17:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VUd4nD2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DCA10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bMGM9gpupaCaCFFxNBfpZJ7GSg8ozCX0BawGB70O+6Q=; b=VUd4nD2Ac+pM7GqdDPUyFAuTMS
 jy7O0XYiGRwFFnAxV6FQFSbdHIGMcc9MrW6cjCthy8oVGxhT/RDM4OxvCmu84FST92QxZpT0nNzZy
 vUM80Awva/b6305TXrPAoQIaM0QMSZs+iYz//FNHTuP3Sgn6vVWVJChICN7zh8Z+fX3MN3bUQL255
 5kbpey3iOALNA8ivQtrZFv+WimZIX3LDIJTcKaBdRq1NhVWdCmN5MZm9XSqT0MfOpVQYxSH5Y0i+I
 iCnpJQkQrUIb3GpaIwa+BECtvNU6pdVq3+JCZS42Yj10Bbglx/+tAxCIVi9CNz2BKppvlD02zR9LQ
 G7QadNmw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uVChc-009UVF-5S; Fri, 27 Jun 2025 19:17:28 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v3 3/3] drm/doc: Fix grammar for "Task information"
Date: Fri, 27 Jun 2025 14:17:15 -0300
Message-ID: <20250627171715.438304-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627171715.438304-1-andrealmeid@igalia.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
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

Remove the repetitive wording at the end of "Task information" section.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v3: new patch
---
 Documentation/gpu/drm-uapi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 10dea6a1f097..3ed027bac028 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -460,8 +460,8 @@ event string.
 
 The reliability of this information is driver and hardware specific, and should
 be taken with a caution regarding it's precision. To have a big picture of what
-really happened, the devcoredump file provides should have much more detailed
-information about the device state and about the event.
+really happened, the devcoredump file provides much more detailed information
+about the device state and about the event.
 
 Consumer prerequisites
 ----------------------
-- 
2.49.0

