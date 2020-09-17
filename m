Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115326DE6D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92786EC19;
	Thu, 17 Sep 2020 14:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE416EC19
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:39:40 +0000 (UTC)
IronPort-SDR: 0BZYmTEYTncYSAeY+VQnZA+k9PpBed+iAnXPyl9RrZD+z0Y8aohkEthbglv6SPWWRAQH0AX/og
 +XrGO7SzRkAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="244544824"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="244544824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:39:39 -0700
IronPort-SDR: hQe8/udD6ghyMfIJQ/+H8FCtNycviQ8qMgklm7SQVUsiNuiZn9NhVuecooTv1y2hMai0ApxBOJ
 JZZ+KNZuAevg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; d="scan'208";a="339450633"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2020 07:39:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 07:39:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 07:39:38 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Thu, 17 Sep 2020 07:39:38 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: RE: [PATCH] drm/vgem: validate vgem_device before exit operations
Thread-Topic: [PATCH] drm/vgem: validate vgem_device before exit operations
Thread-Index: AQHWjP67fRivhUchxEur7Py5NAbIE6ls5oJA
Date: Thu, 17 Sep 2020 14:39:38 +0000
Message-ID: <be357808ee34469dbbe06738c4928546@intel.com>
References: <20200917142145.ipcxb2zo4up357t2@smtp.gmail.com>
In-Reply-To: <20200917142145.ipcxb2zo4up357t2@smtp.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Melissa Wen
>Sent: Thursday, September 17, 2020 10:22 AM
>To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>
>Cc: dri-devel@lists.freedesktop.org
>Subject: [PATCH] drm/vgem: validate vgem_device before exit operations
>
>This patch adds a check for the vgem_device before handling it.
>
>Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
>---
> drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/vgem/vgem_drv.c
>b/drivers/gpu/drm/vgem/vgem_drv.c
>index cb884c890065..119ca887cb8a 100644
>--- a/drivers/gpu/drm/vgem/vgem_drv.c
>+++ b/drivers/gpu/drm/vgem/vgem_drv.c
>@@ -472,7 +472,14 @@ static int __init vgem_init(void)
>
> static void __exit vgem_exit(void)
> {
>-	struct platform_device *pdev = vgem_device->platform;
>+	struct platform_device *pdev;
>+
>+	if (!vgem_device) {
>+		DRM_INFO("vgem_device is NULL\n");
>+		return;
>+	}

This only gets called on module_exit.

If module_init fails, (which is where this is allocated), will the exit ever
be called?

M


>+
>+	pdev = vgem_device->platform;
>
> 	drm_dev_unregister(&vgem_device->drm);
> 	devres_release_group(&pdev->dev, NULL);
>--
>2.28.0
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
