Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA15AEB52
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C011D10E692;
	Tue,  6 Sep 2022 14:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5410E697
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662472967; x=1694008967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vMIJX1UBynw7Ha4VY5WZDYe3peWRfDrobTP0piIBxFs=;
 b=lY6uCVnrnEvzLi5KkF5Ea1qPTsyq451KEGR/57fOgSTe1ZfDJryRaDss
 1cv7CP5d2dMu9l8wkmLgI2JICc2LfW0z+mDeroDa0y7QpTJ68tD2vnsbE
 ylIpxvtdkLHKx6eCjjZMQfX0dVw3fj1yGJ1JepygbCpQPrAb3zJhWr0St
 Gp1F1emkzu1MpubwPidDWLeOo+j/BzVgNHNRPMJTJcX4/Ev80urk1w++/
 rOQymIhWAvKFPyuLlSg6788GRio3IX7i3VioviGITz2sTP2woptoNKvXt
 n4ruiCsBmAVv4CKaQ6GSKLbdhP+h03lDfFTie9Bs35slJMCgzw3svGSLq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276338230"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="276338230"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 07:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="565102655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 06 Sep 2022 07:02:45 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 07:02:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 07:02:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 07:02:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 07:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSd4oQsxmjdRa6sNOElEfiLkhom8CqqAxqYf/x8QDreZ4pXAdS7e5KaLe65Yi5KGR/AmxF3gb6HwUDN751aNZka2UqiAvcTpF/fHNIPEdhwA5q0bdLtRjztI1k63wzPHCfzQwLLpzmGIeefDeOSa/7qOkuGk/1Fy6hgQ0gNmsrLpDUWHC9+62dPiXdBENStUquBjDYGH1tMdF6YO8RHogvAJf9Y/HXKzLiWSF08d8+PghHIVs9QYcnBRDMV/3HkeL7hrZ2Unq2MFqdCjOVywlwSIj97Ivup3QaCYfh7xEIfVs1GxoU2WC+txvpcHDfGbqzL251FWafkgk8+7d01YYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYOAh+HRzPR1RguwnzYFDJF0KN1PjzPw3ElTv5xcPDk=;
 b=dezpkBcb6BRQBVluagoOSc44IJj0U4etV47OEA8lrmEpG4EQnxFEYATadz6fpjCLqLhiMWTGeBsvzRisj2UD91Fir/p5oKZ957udBFfMgSJQ0IkI+jXBi1+wCzv+j/Ln8jO7IgquKpckYe6ZZa1lRG6kVmJ74CKAdbCnGDoyGtEBrdh/6Z2e+dRDJrdWJDBXzVAsTsXLkBe/RLvtIOlR8Fkhzxf5d2uQWpZjt312X4VEipbqIjR6qtubM9eto75YGMGbWFz0YjFTE/+OMEqzKEW7oUdmg+PVpwi6rSBOK/0b7sBAtfxujitetlrsdiAUnl83mc7febrWh8Mfs655HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BN7PR11MB2804.namprd11.prod.outlook.com (2603:10b6:406:ac::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Tue, 6 Sep 2022 14:02:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 14:02:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] drm: Use mutex for minors
Date: Tue, 6 Sep 2022 16:01:16 +0200
Message-ID: <20220906140117.409852-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906140117.409852-1-michal.winiarski@intel.com>
References: <20220906140117.409852-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdce2cd5-bebb-4d0d-1022-08da90105f38
X-MS-TrafficTypeDiagnostic: BN7PR11MB2804:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WDQEilDopzCmOnlKCgjno7wKw1V1M4SlsbRqZvl3N5EHuagJ1WaMPXt6R9D5hFNBT/hlOFzdQox7NpBBxrgsiFecWuu4OznHhixltU0PPTzfT6hKG/Z0PbM0esXQVi5WbJS4MAaTs+WVGRzigkJ658t2qKw9eF3La1YXYrmz8CtCgsbW4jDxIJ5POTGc3nAOnEPTFetHh8m+kQMmFyaQUE7qz80U/1OqRx7l+v8Wz3sbOrAjWHbIINOh9gBS7AJaVp4OW5fz+4QaD2LF5bKDiE7Cjmu6sKeux2R3YLmUcizNaPjOXlJntX6wJv1K0DugXj6Oq3apEnqsnlCcVftPR1hY2e5Pe3zyiwnSdjreX7iwJjcBW2iRwG6y0IaDlgJVZqCnCLYmTOY0+tEcViJuMpkCIVBhKTcHa+vCQCHtpk9YAhvPAF0X7rOoBIvu0Woaq/KibchKGKdfOWcyzFU/XnpIFJTxN2gJm1gRGvLbm/WckXIcuCiftAugZALRAwSY1KHSEcVsBnYDQWM0V+/TWNBVsaJofMrnWmOkTsQDbKbTEgt3D0eukJ09LdMVzGxxPk3TmWQsm8PdBEi8DTsAtLBsrTdk50jy9wO5czhtCOrsm+15ZMnOWTVHVw9A1zljbKBEY9eBJRJP5xokRqU9hurX4pWy1NDkUutymrrvCIsYjta6Le4p//uBBBu5f2oCr3JBiqhHtvN6CdwDYN4oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(376002)(346002)(366004)(136003)(8676002)(6486002)(66476007)(83380400001)(66946007)(66556008)(4326008)(478600001)(6506007)(6666004)(26005)(2906002)(6512007)(5660300002)(8936002)(186003)(1076003)(86362001)(7416002)(2616005)(41300700001)(36756003)(316002)(82960400001)(38100700002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3V4TDBjd3dEeWtOenFlQlNleG1aNmMxazJXcmpUV1hVczdGai9MTmlWc1RC?=
 =?utf-8?B?VC9Rdk0ySm95SlppdWhmVjJwSkJ0cG9zNWZ0RUVkS3p2TlBWL21pYWhXc3lR?=
 =?utf-8?B?WlZ5TEJEbStCSGJnSS9qRnozc1ZkUE9LNDB4RXd2SFh4eWo0MkdIVW9NNmVK?=
 =?utf-8?B?ZXZXWkx4QzM5VE5LVm5BeER0Z0R3aFNRRjZhQlhmMFQrWW1nVHUrcWwrYjZB?=
 =?utf-8?B?VFlpKy9Fc3M0TklhWUNqMmFUaXl5WlJMSkNzWlhvSUpHamJxb0RRU1AzelFP?=
 =?utf-8?B?NGJNWm9xTXdrMmM4L1VaRTB4NVFaeXhrdXd0OXZMY3AwR0dBOUIvMisvTzIx?=
 =?utf-8?B?R015bzRsYWxscm52N25DQThlcCtFSFNSdEdtbnRMM0RXb0xiZks4UmtLQXpy?=
 =?utf-8?B?cU5kYVpTdTl0U1pJQ0d2ZHdEUjd5bzU1OVlZU0Q0dWhGY3AvSUlGQjRNb244?=
 =?utf-8?B?OVVndGVEVWxhSFkwVUtmNDRYS0NoeXA3cU9NWjNEakdaUDdMMS9tUnhyZ3cv?=
 =?utf-8?B?Y1FOOC9qeFpQdjhKOUJGSE5OT0VGUjJyejlvZll1OHFaZE9oR1dkSGMrYlhZ?=
 =?utf-8?B?MXAvSGJFQ1NpS0RmVkZnbit2MnRpV2Q3M243R2QvNndyMnBsUkZsekd3WjRa?=
 =?utf-8?B?am1CWnNOUXpHM3R4V1I0ekJMTFlvVVFoYVljYjdvUjJWSGY0SWg0djFSVHBh?=
 =?utf-8?B?bk9FKzRzVXJyeUpUNGxKWjBuajM4QVdzMDFJVkRSYU1wMTdRT2hvZEtISThV?=
 =?utf-8?B?d2p1Zi9sYmp1NzI5a093amZBYU5VN2VzU1BJWFNSOHpRWHVZOGxUbVYydmNG?=
 =?utf-8?B?TGcrcVdmaktpWmxLYURVckdxYitxRmhNL1Z0TG5WL2RoWHpvdzFJNHQrODhL?=
 =?utf-8?B?RDhYQ3BKZk5sV3lTMWUyZEhnVTRFS050NWFZT2h2ZWNPRGlseWNpU2hnQmI3?=
 =?utf-8?B?OGR2SW5qOGFMZ3cwdGFEV3RzaVZVWDN5YS9IVndmV2laY2NoU0lDQkx3SnZ1?=
 =?utf-8?B?aDlmbldWcG5VSklTbVN2UmtlY1ZMYkgwSWNZaUtxUERFbFB0SCtIdnpVU010?=
 =?utf-8?B?RkFhSGJYSndtNWkweXZaQSt3WWlCY2JtU0V3aGJNTUwyNEhFdjhJeWlUWG1M?=
 =?utf-8?B?TXZYblFnWWJLZFRwQlNyRi9OdDVPeGFKbFozc3JZMFkzMjFwbFQ4U0l3RXJR?=
 =?utf-8?B?b3Z5dHNTOTlkelpVaXpLcHZHZkpSUVpha243L0NMcnhpZEtEekcvenhvZGtm?=
 =?utf-8?B?dTZJclp5a2xIbnJUWWEvUkFZVDFNMmNRZ2I5NFhCbWdaMTdRK0dsT3hYQnh5?=
 =?utf-8?B?TG1MOTZRdC9CT2JuWWd6WkNlVDhldTBHaXdVRVpkdjB1NFlCMCtVVkhQdUk0?=
 =?utf-8?B?UmI2aUFISFQ0WGpoN0JsNUFxSFcrTmFoT0FTREFXSUpwcm9pOGxRRjNhVVlX?=
 =?utf-8?B?a1paNnRacmFUa1pkVEhhRWlSaE9WY1RWS0lZOGk3bFRBVnR6TEFXaXhUSE1I?=
 =?utf-8?B?ZWdMVmI1YlE5MTRTN0pWU1RmeFMyTVJtM3ArT21zeVFqRzVLZHNrc2N4bDJB?=
 =?utf-8?B?YUdBRTgrNHlGaWpsQVhIQktvRitaellBZmQ3RHJoWmlWUml2YUVFZUF0MHhC?=
 =?utf-8?B?OExzcjc4MWhtazhXV3NocUttYitxQWI0UWRzYU5Xb0pwSUw4eWNoRkpwNzlt?=
 =?utf-8?B?QStNdEdCZGVNNzV0UEJnZlJ5N1Evb2Z3TDV3bEpJN2dCM0VCdUY4SHVNNysv?=
 =?utf-8?B?SzZMenIrWDFwUHFSeThtdEZwTURXeWZEOEdZMW9TQjFHeWdpZjR4YUhSZWlE?=
 =?utf-8?B?Q055TzdpMDYzcXdXVEVIZHpMT1lmZ1l1QjNlVExDc3IwWHEvazZZWCs4aWd4?=
 =?utf-8?B?L2gyc011R3ZFdjB6eXgxZnNSanJsT3NCRDloSHhsbVpXZGpXTUl6WGZab0Mz?=
 =?utf-8?B?clhQbjJMNGZuMncxcWpJSWFUK0N6WlU4NmdnTXJEYVQ5bFNEV3pVNEtPY1gv?=
 =?utf-8?B?cTdheW5qemVqd05ua0FRT0NJUm1mNmJMeU5ZclVrZi9xT1hhcnIySTFVWkw5?=
 =?utf-8?B?SWZIdS9qdnA4VHlVTFltQTBxY3NuYnR6MHl2SmgzMTNsSzhXMEtzWlNzdjNn?=
 =?utf-8?B?bzUxWGxXRDdwMUZzNjM0c2ZObGZRSVhCVCtra1ZPTitXL3VwZS9Wemo3WUVD?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdce2cd5-bebb-4d0d-1022-08da90105f38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:02:01.8982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uptTkggN357Kt71bfS2a6HsX++2u8iD0GFBP0I4hzx4wCKB9DQzheRVHNjWim4uaqwMMSm9yCrh3ixAzgwq8+AtkhCbJ7gcHN8JKwfRDxM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2804
X-OriginatorOrg: intel.com
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Operating on drm minor is not done in IRQ context, which means that we
could safely downgrade to regular non-irq spinlock.
But we can also go further and drop the idr_preload tricks by just using
a mutex.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_drv.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 0bdcca0db611..f66904527256 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -53,7 +53,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
+static DEFINE_MUTEX(drm_minor_lock);
 static struct idr drm_minors_idr;
 
 static bool skip_legacy_minors;
@@ -103,21 +103,19 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 }
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int r = -ENOSPC;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -133,18 +131,16 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	 * and 128-191 are render nodes.
 	 * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
 	 */
-	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	if (!skip_legacy_minors)
 		r = idr_alloc(&drm_minors_idr,
 			      NULL,
 			      64 * type,
 			      64 * (type + 1),
-			      GFP_NOWAIT);
+			      GFP_KERNEL);
 	if (r == -ENOSPC)
-		r = idr_alloc(&drm_minors_idr, NULL, 192, 1 << MINORBITS, GFP_NOWAIT);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-	idr_preload_end();
+		r = idr_alloc(&drm_minors_idr, NULL, 192, 1 << MINORBITS, GFP_KERNEL);
+	mutex_unlock(&drm_minor_lock);
 
 	if (r < 0)
 		return r;
@@ -166,7 +162,6 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -186,9 +181,9 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -201,16 +196,15 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -229,13 +223,12 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	minor = idr_find(&drm_minors_idr, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
-- 
2.37.3

