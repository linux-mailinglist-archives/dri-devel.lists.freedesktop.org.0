Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A178C9B5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECC110E443;
	Tue, 29 Aug 2023 16:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0790510E433;
 Tue, 29 Aug 2023 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326883; x=1724862883;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7IJAw38fUR460SdSWl7eKhO467hAZMMIVQkhcqsAOGw=;
 b=hHGX3N07NrqKKRoV9/Gd68Ka4KCx7Ou0kLETp9wnQAZVIJrON15Ja3lW
 pV1co1t0jFnKC5b4kPsBt0SP9JagZkvvdXir4gYMRCWMF6nNUxhriQ/lH
 yi978rP79/Fu2IJbzaM0uYpsxMi6bl+crpuTw6O9rOWiReKZx2iHF0N+n
 lWVwzJFoDE7BMNMjnrz0JXUbVB6NP4M1m/SqLhhyJKFzd/tsj8+oDs8Lw
 siAENJCaOmsoJ9WQ2liKL2aqDc/pQvyoaHdbirVLZPFdyK7IOcuMgpVEl
 A3mij7e1Y6ypvqEGm+mQp8ach9ttmIm2XNrsVZiKaLQT5nAlGbeq+ZlKX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406412777"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="406412777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732269824"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="732269824"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 09:30:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 09:30:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiApb34RL0P3JdonjwZGijlOpomOkvjHrx9JhyOwjYcqYgO4pl32xZ68AJWzrLmQXn3wTXNkbziu93b4hWtCjMH77gaPGohjqefN5di0DH/bIT9WBC1gL7MCBbzBNBHjNhesSeiQJxDH4bX7x/CeSBSQj4ktokEtyX/cq53OIwpznnl94eaN9YmLXauxz2I2moHDcqysm3VTpjgMM3fCQ4XDY7pNdzryIJbsYZ1hQtku3IeofoMmmMDKcJvvYLN9S1cYp4Sfx0CVVfX+EB+78JOhGj58bNTjb/Fd+f6PtzA7p+hf/rVdnlqGnafMt/+QcydMW5i88lNsYGny7fU9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7Mm1zmohH8izbBQ8+PetmZMRSRyhKjqzAdU5ujVwn8=;
 b=Kr2+pL793aJDd37RNiMdcI6YVrknkzq5ANkaABQuLlC8UCfwavOlTrmVmgtLgfW4vkxE6X77EY1sBaggijzbYQcJ43VWknAkRuszWdaMoYzYR/VXRVAtwwX2kj2+ZCs0w1ltZ0GyFEdxBJmnckl18FLur6o/b4OuNs7+0TGMi2E+xF4XPlcbnuRjZOGJM9WfT6IZo++KW9picUUgacgWWWS869hd8MQM+g+PhUDZb492RzruYN+rUXsz4OtqMs6WPvuZAhk+hCC7nFlSAWut2BI7vpP65yWi2cvU1utW00OLrtlal9Xpbw4o5rcGhPWhL1XR2Kx7CU0zz6/2SrqeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:30:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 16:30:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/doc/rfc: No STAGING out of drivers/staging.
Date: Tue, 29 Aug 2023 12:30:01 -0400
Message-ID: <20230829163005.54067-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bf5921-166d-4c25-b2fb-08dba8ad3571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKCU7kj17l8B1wvS3CSnZVjysx/NoC6TZ/ekcgOwpNVgUW2/jXpHIxkvAJkY3OwL9/DjuFMzfqlCNoCjewtZRhaibZdcYZNSpelB8+ySnbU2xXRtrxFANJMXvdg1AH9YE2uyzjRNCDp4/jZ4204p46N/8POEXsjZmbbBcaQx+nA+sljmRCjhwxmpL2hwIfG8lMgAn5ZoVSd0+2z9gM1OOVVtEKn2SisnO9sNp46LqUjDsrtl3grXFpcha7NSYmIsiKEGQAr9mTYb25v86XGIXQL/FauRA4YCGwEwA6bKJ6crkjOksaCPA+RRCIsbaojbc3z5XfEIHjrDAknNAkFpW74frZn03UWEuhhgpC7zTLVHy0B2G5lJteFAobJlhDzj/nyO9GpE2EtEnWEAFrzoLjJti3BJOaChOXuWSdVfLx+C53UUP11F3PFp1bQ+hq0bt88ei3JLq+PytnL3ML3EvhG6diUg+5VHlqYR1KFD9rLn35HK1uO45MDcG+l0/BntK8cDal25z+raT4D7sJoCDf4FLvBOsmODz6nnwxOE9Wc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66476007)(66556008)(6486002)(966005)(6916009)(316002)(38100700002)(41300700001)(82960400001)(6512007)(26005)(36756003)(8676002)(44832011)(5660300002)(1076003)(83380400001)(2906002)(107886003)(2616005)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lSNTRYS0hiSnFuZXpjeDF2Y1AwZkdQZVJOdHV1OWJ1VjF3dTFoUmg5UDFk?=
 =?utf-8?B?Ryt5eWgxTEVTbXF5a3UwcGhIamNsZ0ZNekQ4eXI2dXdBMzViQ1VpcHJCYzk5?=
 =?utf-8?B?MDlzcE13UzFjdmhHK3ZvdWNvVCtWZVFRclZXMms0MVJ0T1N4ZGdwU1kzd1VP?=
 =?utf-8?B?VUlzeTFYUEFTWUdxbUxGUHh5R1l6ZUt0YUZnZzNMTW5BellUc0ZGTWg5dk9G?=
 =?utf-8?B?Q1hTUW9sVU00NGpWeUJNWldiRDhuc05uVWMvNnM1TmNXUWhFV2k5Z2VWUUY5?=
 =?utf-8?B?Zy9uTWhCRWJneFFXdGhETHJjOVRic29yUmtYRVUwQm5wSWtFZDQrdTIxOFQx?=
 =?utf-8?B?VUJmSncwQXJpd0dlZFJMMHJ6VjdWYi9ZTmtqOTFWOVhXY0xNSHEvSmcrc0ZH?=
 =?utf-8?B?a2RYMVhJTWxydUdNNmEwY21FdFJwY0lNSHlRRHBCanNGbEx5bER3K05VZHFw?=
 =?utf-8?B?V3hhMHZadUFTZUM0VDZaWWphUXVva0tYcWNDcGt0Z1RqV1ZTbXc1eTVHemR0?=
 =?utf-8?B?OEd2NjFxdGloMW5qSFNkV01hSS9VbFRZT2htQWpVS3Rub29taUFHc2ZzTTMw?=
 =?utf-8?B?ZW9hRlkzSnQvTUs5NDdhdjdKTDROQXkvam5FNTk0Q081RjdhMXEyQkxQRUpT?=
 =?utf-8?B?ZVBOeUQ3c0J0TmR3L0NrcGt1RFlyL2FGS0hJRlNZWFl3cmFwVVFhZ2ZBbElp?=
 =?utf-8?B?Ri80ZjR3OVlYZHl1QmEwc1BsQzJmK2dBTFZEK0R0bHMzTkwvdzhPUkI4cVdr?=
 =?utf-8?B?OXJxRDNoV0NLZkw4NE12RmpPZ0M5ZmVuYnJVQ2lFN3o5Vzlnc1JLeE9rM1Bh?=
 =?utf-8?B?VlduM0l5WTRvTkJQLzJKNytSUnFLcVB5VGpEMTlGaStNd1NyWDNPcmEyZWF3?=
 =?utf-8?B?YU5wVlBzZVYzWmloQkFvc2pqc04rd3lsVW1HQ0VQN3VLR2krWTQrR1hRMjZY?=
 =?utf-8?B?VVhzRVVhSU1GVDJMbUl2eHluNW04TXhwb3p6QWNkTEt2RVNiN3E3MWgvWTlN?=
 =?utf-8?B?ekhrZGRyRVdoWkNWSkd5b0d1MGNzYXhJd0hBMjVNeXYxeGJRRW52aWpUR3B6?=
 =?utf-8?B?WENkSUNNSCtiamNzTlhXYXBleUZNZjNlSU1FNVFNb3ZPMUVSM0V4c09paWgx?=
 =?utf-8?B?SkNVTjFFM21lVGZ3T2V5eTR3ZTF5ZHRsS3R0LzUzZGFobkVRRFZNUzlSMGdn?=
 =?utf-8?B?Wmdab24rQjJkQUhDOEZOMUFTdUZoc045U1pmaDlzQ3ZqN2tnK1E5ejR2WGNF?=
 =?utf-8?B?UkRabmNha3A2ZFJMa1ptSTRCRElNN0duN2JEem9XSkhHd2N0OHJUVXVnQUlu?=
 =?utf-8?B?cE16aW1FWHJSbGdxb3hua3QyeFBwOUNlVUZwM2lGeDBsK2hvV2tpd0JmUGFE?=
 =?utf-8?B?SXBnM0s2OHZadEZWd0JqdVJIeHFnNnhiZGtwNlR6ZHJ2QUZzdVNDRG1tM0h6?=
 =?utf-8?B?OTVlNGRUY1cwSCtOYVNJQTlJL093SFA3ZDI1cWdCRHg0djBSOVRMS3Y3eG5u?=
 =?utf-8?B?UStBRlRFbXBISFE4aTRlZ1NiNlh2UkRnUFNNSzI5Z1VOdFNKYmlKMHlrQk96?=
 =?utf-8?B?VWgydWRSeXR3THJURG92ZHpCVHRQVDUvTFF5aC9temkvZUFseGlaOUZVQWJr?=
 =?utf-8?B?SHNTSVhJZTAzN0RSVU5Bd1dLYk1ySTZUNUcvcjhaeWlWMGlkN2c1ZHR3SHY3?=
 =?utf-8?B?UG9Md1VZNFE1d2dIcXI1WnIxVXRuUGtnakRCRlBHb0RyTHRYK2l2ZFkxdmQ4?=
 =?utf-8?B?QXc0M2lIL3lSeFlYUHhPWmVyVEdKOW4wZFZVRm0xQ25KUXdKaWtsbFJGMlc2?=
 =?utf-8?B?d0lQc2xPSjRncklhRFNCWkZhQ0VCcllma3crNCtRaEFUQUI3NHEyVWFQMnV4?=
 =?utf-8?B?MG5id1VMYUNhd0dVendlWHRQdWRJcnptN3NwY0c1L0JBK01BTlZZTkZMY296?=
 =?utf-8?B?MDdITWJ2MFlGUW9IL3o3VUNVU2Q0MjVVa3ZhdElvYkt3cGRNM1cvaVRhdWpO?=
 =?utf-8?B?RWc5N3RSTWhuTkFUK05pUENuYkcyOWNhY2M5TmtuVnlLNG50MzlCb3g5dVBX?=
 =?utf-8?B?Lzc4OWtlZU1YSDNmNWtGcjZ5Zkp5cDhheDhYeld5TlZCZ2RkYU1Kc3hGT3pw?=
 =?utf-8?Q?XI0mf0iY5zDmJMhPNMnCNdLi5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bf5921-166d-4c25-b2fb-08dba8ad3571
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:30:09.4087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BQh28mYQ9YD+qlEBaGrOpvZZWmTTJJijplngtO4v4BCkaYhPzM1NMchqzwRjDP7N10P0IMLGqWB9iivQuKl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also the uapi should be reviewed and scrutinized before xe
is accepted upstream and we shouldn't cause regression.

Link: https://lore.kernel.org/all/20230630100059.122881-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 2516fe141db6..3d2181bf3dad 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -67,12 +67,6 @@ platforms.
 
 When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
 
-Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
-the uAPI are expected while the driver is behind these protections. STAGING will
-be removed when the driver uAPI gets to a mature state where we can guarantee the
-‘no regression’ rule. Then force_probe will be lifted only for future platforms
-that will be productized with Xe driver, but not with i915.
-
 Xe – Pre-Merge Goals
 ====================
 
-- 
2.41.0

