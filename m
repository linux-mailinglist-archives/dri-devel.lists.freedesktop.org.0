Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5F61FBDA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D613710E4FF;
	Mon,  7 Nov 2022 17:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0A10E0C9;
 Mon,  7 Nov 2022 17:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667843345; x=1699379345;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BnQ3zbxKC/+MtIC9JrIMMe8ZGeXf9qGyio7tUT7b6oI=;
 b=U8xDuOW0+O5CtOdGlkT5UaMtADErY2sJjre3tEkjAc55lyr8mfyxLRnN
 ZeEvs8y6+Cnw/FAHskUFxNVZS8IrlzOl8FCipvOGsdr3tsJQkUGPuP2r3
 t6CypjPLoaqeuFfW/THWdM2ctgkXU4tbgh5B7rQ7wWiCfhm3i3aSvXiCo
 DXqIpTtMVWfJ97V4nL57rerhYeD4aCflupuZpUeCgKROVoKY372XKjuuq
 NYDaHg5YdRUh53YE+22vtlDqD7cwyas1dmMY4BMo7q3fJePwGKiXEYiEH
 792VKbjNQXZIAMI4TgY4RyR1CRhj34HDcaI3DHIWfojNiyEmaMF+GL850 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="310479792"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="310479792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965251606"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="965251606"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 07 Nov 2022 09:49:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 09:49:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 09:49:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 09:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWnBCD9/tS6QRStaQ2HC8igrA9GCnvy1M3YNT0xgnAyRj0Muo658US2JRcJz8XVR0JZp91gd1CBaA8056eMJCG9/UM14QB1qzkCz72pU6JFe9j73ofqjmrOltL2lKGpBt+pmdZyReJbBF6cimuSnMvfcKOtplf9q+UEm+77YSZJknVpzOxkkfJG1JfFMon9h/KZSy+rk5tQU5vpqXY8iUfr/MeTNxFh+ym8HG3ZV+a9VaOMjDQLNrXsNCQmorxoT3tzWSKsdKrU9Y8PZdC+SmwkQc7/sI9oXpEM8Dj5FQ8iWlVIM90C0ZBBl0KPojbMyX2JL3hFi54QExTAyw1tc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0LyEWGXEHJ8Ex3TP0h0K9vC9JHewaltbj1ndwjB5ig=;
 b=HmoP7RiD8FaVdWplZIzHsgSmDHTIjcnlUJDC6YbPcMKYgtZ8oCy0WCgGoG5L9qmf8bUwTAQgTRRzqlSOb6TZJ6gXFO3KNagJumYMwniXRCtoB0nSc6pD03IaYQdhrxrz4Qc0jDH4YtWS6e2hWKSm6Xj2CY0KMaJwavFFqJGzekhOgS5Vc8nVQDIrbzBnDb28fQZd7x+ZJyX/EePdlB+GUeDd9IZ3gh48BcEbhzBsVLiDZ7cxGPaCD68mJM2JR/lkDVvEYi7JjvNKKJxtFI0jMSj4tePG1B+cLn+EhM9D6BIQNp5nVlS+MShapIdeikMdHmhhwQgq8xzuiZYxWvyRHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.26; Mon, 7 Nov 2022 17:48:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::22c6:b7ab:a8ec:a6d8]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::22c6:b7ab:a8ec:a6d8%5]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 17:48:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm: Use XArray instead of IDR for minors
Date: Mon, 7 Nov 2022 18:48:11 +0100
Message-ID: <20221107174811.246135-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7f7f19-6671-4ca5-b53b-08dac0e84572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rnp+cFfvKhOZUTCnFsmpPaTkDbAP/MFaEY3NMLVq7rWDi8THkMd/Ako2daHXuBoL6Iu+HRkPJnwD5CCLPEPvOAMtmtB8WCsHPr2loSKi+TAxCRPQhQUApFGSvd5JTw/cOlJK/3PSX75rwx4R5CN5nl5ReNSZREVL09r6l2GOkwUdaud7HVW+ICrahYYtG6CdYDbI1uEV1FNE1ptwFdhF8w+oZqMl33NR/s/HvcpOwcXVd3z5/AqG+aqnv+HMq/ZjzEXRyH2JYF+Ozh1BVDyZ6dNtKGpSRzthnrxK++PfNIutZcGOdP/BP943oJpJiL4oRHWwhRq0S8le0uG25ecnSW79Qw6R4VH7tQn0aOwit3iw7KhIxWrjpiCO23+oQIDApFhgAciqsMtZa6PISY9B93cmbiSliAearv4HKDnqqXY8j2rMJoLIG12/tCNehxSR0v24YUhVGi17bq29keSeWpTLB7zmbDgIGZYdnTW5pRD4shGuk8mQTUp9IKvYtHaQIRhczMupW3D7oYsFW5lY2/9MBAgOP+sz498RYirJZuHTtdIeoPXLwuHNsELDWNtsApieD3pjY1wk7y4335D9Bj3qAnVOCqmoO1AcCpK1jxCNjsJWjwnQbv1KXF3XVbW1VfZVXQH6nMMcmcHeM7YaM+uN1GRzJtCrtd45C5PK0LhaHo+1w0+FCiRfCx0rEjPaf14Cpkb7h0+8agIwlt3GiGl8RKQB6Fh2ik4KQbR+1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(36756003)(82960400001)(86362001)(6506007)(66476007)(2906002)(2616005)(186003)(1076003)(26005)(6512007)(6666004)(83380400001)(66556008)(66946007)(8676002)(4326008)(54906003)(316002)(7416002)(478600001)(8936002)(966005)(6486002)(5660300002)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXY4VTkwWVRrTm9LSm50aThxc0pwMzZsb1Q2ZFZhN0kwU1FwVUpleVh1T3ND?=
 =?utf-8?B?WHREQ0JRWHZnUjBXSGhZK3ZJdlJnQVEwV0twV2oxZFYxZ3Fid1V5YjFCcGEz?=
 =?utf-8?B?M2hYQmNtelZ0SmhmWjRSc1pZZ1haK3BVZlhjNUhQZWNKNEJWUEY5S3RtVDBo?=
 =?utf-8?B?d0dJZFBheUZBalZaRkN0ZlRYaVBZa2tlblh6Zk5Ud21DZlVaS25kTGZ1ZWJx?=
 =?utf-8?B?c1QvdzhiYi9samFnam9VZVR0aWt5czIvcFArMDhTSTRTc0VEaU9HSWN6cmx2?=
 =?utf-8?B?U3JkRlBpc0ZHSmFHcEs4d3JQOGhMQ3B1VGREUy8wMEpURi9oYit0YldPWkpI?=
 =?utf-8?B?U0hNL0lhMFRseStDRnFoc1JXdm5WZFdZQURlNVVrVVdDeVJEVWJHY3NkWXpJ?=
 =?utf-8?B?SHpJUms5MGV6MTZ5Z2p3RHl0T3RRVGlIbFRuQmpPcWlIMCsyam93L3czK2tj?=
 =?utf-8?B?UlQvZzY1RE5qZFJPaENXb0tDNHJJQ0gzejhIc0JnWllscXdoK1VPdDF5U1ZW?=
 =?utf-8?B?U3lVeTIwQ1U5cEJwOWF0MlQxbkJoaWZXMlhTWHd3bVFOVCtuaGdCQ1pKb2sz?=
 =?utf-8?B?bjFESnlnUDFUTVFuSVJqMEM5QjErenNuU2FHQ1ZVQnhYYlNteHB1d1JRbm9H?=
 =?utf-8?B?R04xSmU2YWd1a0pYc2MxREhGVmhhSm54S1NxWG5ESUt3L1VGTEhlK1N6Szcv?=
 =?utf-8?B?U3JtV3hHTWhoOWV2T2lHdkY0Yi9mWDFYcUQxVzRsUkVzNis0ait2Q0Y0NnVa?=
 =?utf-8?B?MW83b2xibUdhUXVmdUF5L0tUYmFPSXNMQ0lPeDdTclN3d2JyS3k4eVFpcVlU?=
 =?utf-8?B?aEhoUUZiS1BJMDVua01DQW9ndUM3aDR4RUpGOTRqVFpKaDZWMjNUQkN1U1J4?=
 =?utf-8?B?MVlCOGNuNFR1Z21sT1pqOGtiYUx0eEJoajBUdEUzWUs2UCtuWkd2K0Z0c0hP?=
 =?utf-8?B?LzNFa3Jodmw0RnRMa0F0Z0k5d3hGa2w4UmwyMDQ1Z3NRamZwMDhTWWpwSENw?=
 =?utf-8?B?b2huRnhMM1I4L1RpcGlSRGNkcnJNcGJsQXBleG9JM3N5WE1SbjdLcHNZUFl2?=
 =?utf-8?B?aktWd0NubFRZdVRmNUJlbFNyREsyY1g1UUZ2bWhSUG9jY2t2MjBzQ0Y2UlRI?=
 =?utf-8?B?SHZtZm85YWIxbHdET05JbFJLQXJlcnRVZWIzTTAzdjFlNGpBOTAvUUo4aVcx?=
 =?utf-8?B?UVBFV3NPdjI4RWdnYVRRQ2Jxc0ttNUV2VXBsVG91R21OUExHdnRXOCtsaGFj?=
 =?utf-8?B?Z0hEVHQ0bTdvVTEzOW5abkl6aHZJamF1OTFEcEJkYTh0VldDNUs2empkMGlD?=
 =?utf-8?B?Y3lBRHVMdU82WWhlUkU3Tm40Q29QZTlBeldTajMrM2VJQnpTaWpZZVcycFBt?=
 =?utf-8?B?bXA0OE51bWttRFFuRlF2Nm9wV1ZxZ1R2Nk1COUl4UmtKUXNVNjRETkFFVnIw?=
 =?utf-8?B?NTczdGlKeDRSc3NhOUg2WEVFUXI1VTFUdm9Xa0VZeVhURm55Y0lJZ21qUkUv?=
 =?utf-8?B?VzdOejNSTVVDM0hDR1R1bVA4WllvWU9IcktpRXFKOVBRNHFvbDlQYjBNbEhW?=
 =?utf-8?B?RzRSbW5kTnRuckRWb1NNR2xKUWNJdVZ3SW5SRjNrOGgzQnNpdWpDQ3gyY2Fi?=
 =?utf-8?B?bS9YUnNuRzh4R3hDMTRwUzliK3hHb0d1c2ZGa2VoVGlJUDgvNXpTdHZBY0Q5?=
 =?utf-8?B?MTlNK25VWWdPbXZyeFJMRVpjMWNmTWI1TGZaaEFLdngxQzBnL2xGRlhLR3c4?=
 =?utf-8?B?WnFRdWxNbUhSeXR2M2kvMUxCR1lrRkVkeG85TzdkakUzenRCRW1TbEtiajRC?=
 =?utf-8?B?dzhpV2gzUmM0Z3d6MXB1b1lpd2FHcmVjSTFyMXJIR3hYVE1YWml6KytUTmc2?=
 =?utf-8?B?MmdFWlA4WUZjVHN2ZVpxa2NEMmpMckp2MTEzaHd2ZE1NZ1RzWnpDSFlkeDBj?=
 =?utf-8?B?aXl3Q0JBS1hyVnE3SnlDZnJmcFhsL0x3ZkNrSExqL0x0RG9qMzlFNG5FdjVh?=
 =?utf-8?B?UHZzeEtrK0Exc2RoMHpHYTYzcnJsVXZid1REdCtuK09Wb2xDQTdqQmdOL1lT?=
 =?utf-8?B?WWlJWWFBTytNSys1RmU1MXQvVVpuTmErOUgwODI2WHFpWGtzS1Q1cmI4Zkpz?=
 =?utf-8?B?SnZsSnRNYTQvVUJXNFBQNVIrQkNqb01ydzBQWloyc2g3UkRYWkx4WlpkdHF4?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7f7f19-6671-4ca5-b53b-08dac0e84572
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 17:48:25.7687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXAGAALCzC4dtuPaMpquC6EV1ffvez+Uk4Sn1HNixhIlIy8CnnzkrXj4OnHNIDmOoVB4fCAQmRVgv5l5RD11p3FEEQcSyxkG9PtjOc0H5T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Suggested-by: Matthew Wilcox <willy@infradead.org>
---
This was originally sent as v4/v5 in larger series:
https://lore.kernel.org/dri-devel/20220911211443.581481-2-michal.winiarski@intel.com/
v1 -> v2:
Fixed locking and corrected some misuse of XArray API (Matthew Wilcox)
v2 -> v3:
Store correct pointer, use xa_store rather than xa_cmpxchg (Oded Gabbay)

 drivers/gpu/drm/drm_drv.c | 51 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..bdcdfeac76bf 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
@@ -53,8 +54,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
-static struct idr drm_minors_idr;
+static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -98,21 +98,19 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_erase(&drm_minors_xa, minor->index);
 }
 
+#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -122,21 +120,10 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->type = type;
 	minor->dev = dev;
 
-	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	r = idr_alloc(&drm_minors_idr,
-		      NULL,
-		      64 * type,
-		      64 * (type + 1),
-		      GFP_NOWAIT);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-	idr_preload_end();
-
+	r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-	minor->index = r;
-
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
 		return r;
@@ -152,7 +139,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -172,9 +159,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
+	if (xa_is_err(entry)) {
+		ret = xa_err(entry);
+		goto err_debugfs;
+	}
+	WARN_ON(entry);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -187,16 +177,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -215,13 +202,12 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
+	xa_lock(&drm_minors_xa);
+	minor = xa_load(&drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_unlock(&drm_minors_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&drm_minors_idr);
+	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
 }
 
@@ -1046,7 +1032,6 @@ static int __init drm_core_init(void)
 	int ret;
 
 	drm_connector_ida_init();
-	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
-- 
2.38.1

