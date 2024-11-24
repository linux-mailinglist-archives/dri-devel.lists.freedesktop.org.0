Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BF9D70DA
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B9810E502;
	Sun, 24 Nov 2024 13:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="piNTJuPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47C610E4FE;
 Sun, 24 Nov 2024 13:41:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A3F45C4A5F;
 Sun, 24 Nov 2024 13:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F902C4CED1;
 Sun, 24 Nov 2024 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455675;
 bh=hQ5NY1jaizmgk7a+NJFuengPPuLOsa5k6ked4uj/5pA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=piNTJuPpftAEQlx21ZBYy22p5Oj/p24yI9WbnmaA/1eAB4zgzSwWk29RG1Uz78rMf
 Ay9iAkmYlRQunRZBwp+nhqXx76yNXfLIzo7KLgGnTPwjPVI3B2VzuABnl9uZWRXbbk
 UOFUmhKZ1Oi4ZQVqAdfobh8iftroI/2sCZKESV0lqb2istaEXCJLLl8wQFb+Pak48k
 EZe04taAJdM4OuvEtWZLGaZbrFIykpJZkwsYo1BWV4AwTd/IaXHR6cruTmPNlz2AKM
 80Dw2rZaV23Niy3NmZZRt5wtVIsocu9ccOCDwk5ZOdDpTRuNrd2DphG7Ikw64W+qZv
 7W6RmhyLH588A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, Sasha Levin <sashal@kernel.org>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 06/87] drm/xe/pciids: Add PVC's PCI device ID
 macros
Date: Sun, 24 Nov 2024 08:37:44 -0500
Message-ID: <20241124134102.3344326-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

[ Upstream commit 5b40191152282e1f25d7b9826bcda41be927b39f ]

Add PVC PCI IDs to the xe_pciids.h header. They're not yet used in the
driver.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/intel/xe_pciids.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 67dad09e62bc8..59233eb008628 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -189,6 +189,22 @@
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
+/* PVC */
+#define XE_PVC_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
+	MACRO__(0x0BD5, ## __VA_ARGS__),	\
+	MACRO__(0x0BD6, ## __VA_ARGS__),	\
+	MACRO__(0x0BD7, ## __VA_ARGS__),	\
+	MACRO__(0x0BD8, ## __VA_ARGS__),	\
+	MACRO__(0x0BD9, ## __VA_ARGS__),	\
+	MACRO__(0x0BDA, ## __VA_ARGS__),	\
+	MACRO__(0x0BDB, ## __VA_ARGS__),	\
+	MACRO__(0x0BE0, ## __VA_ARGS__),	\
+	MACRO__(0x0BE1, ## __VA_ARGS__),	\
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.43.0

