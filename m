Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C912867340
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228C010F0BB;
	Mon, 26 Feb 2024 11:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aFI8rx3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8088010F0BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:36:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1CFBBCE173B;
 Mon, 26 Feb 2024 11:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C1DC433C7;
 Mon, 26 Feb 2024 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708947374;
 bh=18lCdpTkYwlowtruSqPGH0iiHUJ/Amg4mhHu2w7B3A8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aFI8rx3zBJIaHvZ4AW1De/D9IKcYB6eS6pKmH23gq50DsOiODbJBEyYSB8NDQ3E16
 JKeJVog1ofOsmtoGMCMaCDNVF+KwiL88IpxZgGKktTLeoI3eMJmYnmepGeftLsCU05
 eLMkBPSPWBdGaF0rr4oEy482jBQTtvKio4ERB66eKWEfRrr3wc2Cnh7Y39aQwIZX5z
 BjZ2/JB/ARrxCpUPUnrc8+1bUA4vaeMtk9didClp+Yx4W66qTZMkUD+YR0P1DnNTGQ
 cP11Ql/8zkamc9jzpWCaYsNmhnAUgPZ2/ZQLqrQoDpBHIcQmwXnko3UoBKPcEXJUVp
 fdVAo6xoTOjEA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
Subject: [dim PATCH] dim: drm-misc: Membership requests now go through Gitlab
Date: Mon, 26 Feb 2024 12:36:09 +0100
Message-ID: <20240226113610.46343-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
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

Now that drm-misc has switched to Gitlab, we don't need to make
newcomers create a legacy SSH account. Gitlab supports access requests,
so let's just use them.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 commit-access.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/commit-access.rst b/commit-access.rst
index 539a7906e52a..3b6c1a19aae2 100644
--- a/commit-access.rst
+++ b/commit-access.rst
@@ -31,9 +31,10 @@ below criteria:
 - Agrees to use their commit rights in accordance with the documented merge
   criteria, tools, processes, and :ref:`code-of-conduct`.
 
-Apply for an account (and any other account change requests) through
+You can apply for developpers right by requesting access to the `drm/misc`
+subgroup on GitLab
 
-https://www.freedesktop.org/wiki/AccountRequests/
+https://gitlab.freedesktop.org/drm/misc
 
 and please ping the maintainers if your request is stuck.
 
-- 
2.43.2

