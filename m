Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4EA36EDD1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D059E6F3A4;
	Thu, 29 Apr 2021 16:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE1B6F3A4;
 Thu, 29 Apr 2021 16:04:31 +0000 (UTC)
IronPort-SDR: fZ96D7m8y2nKHPQj8Js4qSJpcwrOlWY602azNdJussJRsrbXIcTOysAeY4LWRghniW4bsx4MiH
 z0ywx6hQ7ZbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="184172909"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="184172909"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:04:31 -0700
IronPort-SDR: dizEEl9iQu9ysh0DcjNyCUADa3rM4sZ8wJGuADJHVdTFxkEHmR1MX5c2HgRrEP34nXTr/6tmJX
 E9A3Fn46D0XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="388179130"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2021 09:04:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:04:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:04:30 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 29 Apr 2021 09:04:30 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Subject: RE: [PATCH v8 1/5] drm/ast: Remove reference to struct drm_device.pdev
Thread-Topic: [PATCH v8 1/5] drm/ast: Remove reference to struct
 drm_device.pdev
Thread-Index: AQHXPOWSWcdI0yuNvUae+75eHT7xrqrLqMFA
Date: Thu, 29 Apr 2021 16:04:30 +0000
Message-ID: <8f601e6a07dc4fa4aa46577cfcd9c317@intel.com>
References: <20210429105101.25667-1-tzimmermann@suse.de>
 <20210429105101.25667-2-tzimmermann@suse.de>
In-Reply-To: <20210429105101.25667-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.0.76
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
Cc: Dave Airlie <airlied@redhat.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 lkp <lkp@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Thomas Zimmermann
>Sent: Thursday, April 29, 2021 6:51 AM
>To: jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; airlied@linux.ie; daniel@ffwll.ch; chris@chris-
>wilson.co.uk
>Cc: lkp <lkp@intel.com>; intel-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; Thomas Zimmermann
><tzimmermann@suse.de>; Dave Airlie <airlied@redhat.com>
>Subject: [PATCH v8 1/5] drm/ast: Remove reference to struct
>drm_device.pdev
>
>Using struct drm_device.pdev is deprecated. Upcast with to_pci_dev()
>from struct drm_device.dev to get the PCI device structure.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

m

>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>Fixes: ba4e0339a6a3 ("drm/ast: Fixed CVE for DP501")
>Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>Cc: kernel test robot <lkp@intel.com>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: Dave Airlie <airlied@redhat.com>
>Cc: dri-devel@lists.freedesktop.org
>---
> drivers/gpu/drm/ast/ast_main.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/ast/ast_main.c
>b/drivers/gpu/drm/ast/ast_main.c
>index 189d783f6e2c..6b49a92dc75f 100644
>--- a/drivers/gpu/drm/ast/ast_main.c
>+++ b/drivers/gpu/drm/ast/ast_main.c
>@@ -411,7 +411,6 @@ struct ast_private *ast_device_create(const struct
>drm_driver *drv,
> 		return ast;
> 	dev = &ast->base;
>
>-	dev->pdev = pdev;
> 	pci_set_drvdata(pdev, dev);
>
> 	ast->regs = pcim_iomap(pdev, 1, 0);
>--
>2.31.1
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
