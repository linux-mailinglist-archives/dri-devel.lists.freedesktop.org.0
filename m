Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73058FB078
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 12:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B43610E44B;
	Tue,  4 Jun 2024 10:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ZcUM7Cah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26F510E44B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 10:52:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454AqFMx005296;
 Tue, 4 Jun 2024 05:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717498335;
 bh=fdbp4Ke8IMl5fhviwUSq+Cwwqel7fwsn4xw3/GtV4g0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZcUM7Cahlrhn5uVPltGVWDcw/bB5IprFGWl+EY9fMtLAWekvUOG31ii3qdgn01/Cg
 ApFb+1k+2r/UsA4JN1RivyiyxlmkEJmA045CwvpM7HC0GAKKqWKekCM7ZpnwMcUK97
 8UUYKnEun20nJKZywQkz+TMQkzdocg+U6BMaP8f0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454AqFWZ032544
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Jun 2024 05:52:15 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:52:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:52:15 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454AqEr5074325;
 Tue, 4 Jun 2024 05:52:15 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
 <broonie@kernel.org>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
 <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v12 09/13] Documentation: core-api: Add math.h macros and
 functions
Date: Tue, 4 Jun 2024 16:22:14 +0530
Message-ID: <20240604105214.2255251-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Add documentation for rounding, scaling, absolute value and 32-bit division
related macros and functions exported by math.h header file.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
V12: Add Reviewed-by
V11: Fix title for math function header
V10: Patch introduced
V1->V9 (No change)
---
 Documentation/core-api/kernel-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index ae92a2571388..7de494e76fa6 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -185,6 +185,12 @@ Division Functions
 .. kernel-doc:: lib/math/gcd.c
    :export:
 
+Rounding, absolute value, division and 32-bit scaling functions
+---------------------------------------------------------------
+
+.. kernel-doc:: include/linux/math.h
+   :internal:
+
 UUID/GUID
 ---------
 
-- 
2.39.1

