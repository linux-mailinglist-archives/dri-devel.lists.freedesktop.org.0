Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB87EAB5C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 09:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451610E1C3;
	Tue, 14 Nov 2023 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C210E1BE;
 Tue, 14 Nov 2023 08:10:42 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc4f777ab9so40130845ad.0; 
 Tue, 14 Nov 2023 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699949442; x=1700554242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vj7/+lAfEA53l7pM4HwUPg5m3vq3PgfEVzUjZweRlmU=;
 b=XJhTjx0y5uFoJxcWXdOnzQJzbTmrqRmXHWAX7wNf7LlpOOPZLCf5CQ+s/6zjURhiAg
 lv75UQ+jxj5d7i/c+KrA5tSf/+W/3C+EIF4wSOGJQ8jqToDyWlae1057JQxJEArcV7fz
 j71f3CjDDBesA9GnOBHKB26hz+dVeO4x2pUNbQ61BVy8QP+X4enfC8SZpezHxyL3TeSQ
 U/eRjb6mxSQvureJqhg/mOhCMxSPv3ETB8ovoId2rzYD+nBVDYIttTfoymLrXR9V/EKM
 seDNkpM5idINZY3Z1RZoR0wTIFlVHvZSoWkgikKbdd97iX/WtXknRRf6subm1NTjjB4J
 fZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699949442; x=1700554242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vj7/+lAfEA53l7pM4HwUPg5m3vq3PgfEVzUjZweRlmU=;
 b=YIP/32VkwfOCaBZfNxGxyJvrlXLKz1RT87QbO/7Z5lf99l8aoyt30Tqcxb1piEjIcR
 s1qtUChnXNCit9SPYM7hYrkSPJjuUykTInHvOp1JCxhdpr5lAUacNBeDVJzJBsFqjJyV
 qysXnU3wHc7x2wmfBfpKtqvC+fcXQEbwZZvLVZifW5/DJFLSxejwXNDby9InJfKlOP9j
 PiHNn5z9B9AF5HdfNlEJBUWuitXuIncerQvR0RYCrAgrOwU97inZAOF7j6zlOTsKr6uZ
 WWGnS+uT8YHGhF85Z5qz4DHPvjTTbNXkA6RPPqpvt/V5fx3jqr4gYOfdxxEQXfZZa5z5
 Mjxg==
X-Gm-Message-State: AOJu0YwkogE607dJSy/n+2amDYDhtdi4uHdEfTGcHzi0dIiJn2cXMxyf
 9AF9NC7aMglvLyHXbNl4aMA=
X-Google-Smtp-Source: AGHT+IE1LHgIzWEzbIN8OsZ/PBWIZK7lyjQ7s1tYn97NyIKie23c8u0JPZtAPKhTnd5ojodPUXefjw==
X-Received: by 2002:a17:903:1246:b0:1ce:1674:fd22 with SMTP id
 u6-20020a170903124600b001ce1674fd22mr1603885plh.9.1699949441853; 
 Tue, 14 Nov 2023 00:10:41 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 l4-20020a170902eb0400b001c61901ed2esm5146209plb.219.2023.11.14.00.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 00:10:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 2826F10206E62; Tue, 14 Nov 2023 15:10:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Separate @failing_port list in
 drm_dp_mst_atomic_check_mgr() comment
Date: Tue, 14 Nov 2023 15:10:33 +0700
Message-ID: <20231114081033.27343-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981; i=bagasdotme@gmail.com;
 h=from:subject; bh=/nItUBT7uVPqUMNGT89+pfAJgmn+o44QIuhAdJuptpY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDKnBWoEvH96Jtv90asnZ7JLbDrcv6wplaCvEdU71/dHDm
 7B287ywjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExk/jeG/4WH39u09z1o6q94
 uKr0qfnyf1Z6Ro4+kbLHk+ynvDm8oZeRoWl6jsC0ecW7X3z8c5f5xVpF4wXRV5beKV5xM2b9dpa
 j7RwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stephen Rothwell reported htmldocs warnings when merging drm-intel
tree:

Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5484: ERROR: Unexpected indentation.
Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_mst_topology.c:5488: WARNING: Block quote ends without a blank line; unexpected unindent.

Separate @failing_port return value list by surrounding it with a
blank line to fix above warnings.

Fixes: 1cd0a5ea427931 ("drm/dp_mst: Factor out a helper to check the atomic state of a topology manager")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20231114141715.6f435118@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0854fe428f173a..b9a98587fbef7f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5479,6 +5479,7 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  *   - 0 if the new state is valid
  *   - %-ENOSPC, if the new state is invalid, because of BW limitation
  *         @failing_port is set to:
+ *
  *         - The non-root port where a BW limit check failed
  *           with all the ports downstream of @failing_port passing
  *           the BW limit check.
@@ -5487,6 +5488,7 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  *         - %NULL if the BW limit check failed at the root port
  *           with all the ports downstream of the root port passing
  *           the BW limit check.
+ *
  *   - %-EINVAL, if the new state is invalid, because the root port has
  *     too many payloads.
  */

base-commit: 59be90248b422f2924872de0be2867652214096a
-- 
An old man doll... just what I always wanted! - Clara

