Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76878C9AE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1DF10E442;
	Tue, 29 Aug 2023 16:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1299010E442;
 Tue, 29 Aug 2023 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326828; x=1724862828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DjXWZF70qZOYiW6kZA0JTSI3cCxB4jIDCWMsN04nLsk=;
 b=HBcKg1DzD2QFlsW7LyZTrQ7Ydyuk5QPHEQGNdQdEKjtQRX67Ij1Vnz37
 CGogda3xRlRJ3uODdlqSSQLDyTvw/+6XTMMESioni1zu5Lhi/qKdOo9dD
 lRsSx7FjPDYX+NCNX4dTjmJAfKthPeb87MZHjUJS3kPXe6uewUDoOWsnE
 w0/Esh9h/cYTfoO1dfgFI4g9iky14AG2Pj1LmDPf7kLbKU5YU8qkiQkjM
 sMoOSY/pUbP9UpzxyL4fiEYwBSYMyZNIjXtPaNAxbAChY2XlBmCybQ6Uu
 VjOpQAD+p47VeLydLxnu5Ptc7fm5p4zm2vWDjJIleYk15w6YCMfa5dmYs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360417096"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="360417096"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862307967"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="862307967"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 09:30:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 09:30:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1DdjM2DusuIeHb7/4I4kvxBThKelAOKKQrv8OSolydlI3gVC8UTBxPyaf6Jlju+hcI2g3PB1nKfBt9F6aHRIS+OHsazC1mBDjFmguR6XH55zgV4//JlwhyYY9PyMF4tlth6Vpx2Z9Ct0uYXtWBeadqpSBGDA6Om8QHu6Gq40WKpn6wE1BNV6mv7aUBkR7zX3AX+I+Gn/CgbgJCW9CdxqL8LgUnCd/8Un8Fas6Ygv6NePL5fgZc+Y8hs1P6fjBvFWtSxs/MUNFE0AHty3CIP8BX5iKzdJx74rAxj+Ay3Ij0sEBulH/rTKeT8izU8anJfenjQFI/sNMfZoQOoYureSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKgCLUiU3SXpmTITAZkkbGu41e4LF1Rn2NAH8sbVHwA=;
 b=NgT4gCvoVyVIpqHyF+nJ8rnfDxNJw+X4GXC1iTXLjYKxfeHQ1ymCNF3ZLBQL2TbBHsDLiHHAmiP9xM6aDlPyL40ahO42Fj7DKfWiHyzteLXemnJ8t2np+NlzoYn2M33OUJb6gPRWpaIXWez5EaqqeBg1bVXfaUYHYZutsiUM9IU4Na1cJOklPOQNVYyg1BWLV2pdX2WqBuUdJVw6m0/o2Gc5Q7dP5d8aICFoBvTYVRKjWw/8TmIzriA4X+HmKF7Pp1NRuMt322eUnjYgnN86s1vNv9+iEm2CykZNwR1MnE0CjtLXXYR5fZ2WGI+pydUl2fCObZCl/npzfSHSJ58Kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:30:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 16:30:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/doc/rfc: Mark Dev_coredump as completed.
Date: Tue, 29 Aug 2023 12:30:02 -0400
Message-ID: <20230829163005.54067-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829163005.54067-1-rodrigo.vivi@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 92824f4c-b8f6-429b-30ad-08dba8ad387d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yEw9oMt05HTZKc0UizkiqKiEgDpUbES5bJZMmFfUBOydUn0lzo+iATEfy8/PKYHrmHgz+CGuGB/qMOkCtNz6sBmnNmLlj09PKSmwWBWQOh75qwJN2qI+0YZBfbvQbDajPEUeshMIBYPzP7DZvAACa2tYhdo4zPXe/V/aS9kubhZMqCgzuVgIpgeGmWsB7UOAhkEPKpF8goy2ZMPMsWCGKpUUDymCGvPNCG12Q4EuiMJkWF8GecbvcUOscV9q9dxHQauNvk7nhFi7NDwCivnomunG7YE00N0K69F2d/dKqiRA5XRA+xtGCXnJNMsvQo1/ZYcM2Z7JqfwkVuOSsoctTkEQQTELaGAlfh2fM+WmiGT8BQUELzd8FS2RgdjwX+tQWJpfGFeboLk+blCyOElFFZtMM50H7aep1hGgWHOe/g35rmL94+BhAU1A8hL/md4/vQ03HT2mgSDlINzBzjjtkKfAby6V1iEY4jOMhJ4hu5eWeSn5YIhwGcjsE8mun/jIpORLhsfBBQBRTyw08DkAWk0Afy2u0M0qggi89qTn3hE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66476007)(66556008)(6486002)(966005)(6916009)(316002)(38100700002)(41300700001)(82960400001)(6512007)(26005)(36756003)(8676002)(44832011)(5660300002)(1076003)(83380400001)(2906002)(107886003)(2616005)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azdqOGVpTEI2UnMwZjhRZ2FieXg3MFNKbEpZUW9vdVFNNW1WUWExQWRMdEpi?=
 =?utf-8?B?bnd4OExHcHN5YmEvWjZzVlRWWE1OQWxyN2kzVVVtQTVEQnRBa0xMZFd2Mmkv?=
 =?utf-8?B?ekc2dTAwRUVPcXZObGlyZVNVYnVEelZQZHdmZ3FYbFkrbWZOZlhuNStDbHN4?=
 =?utf-8?B?MG1sT0hhdmFGVTY3aFZuL05nVEYwVDc2YnpEYXhwUWhDYW9vem5rSHV2dG85?=
 =?utf-8?B?eWdWV0VZVTIybUhMa0FWeVJDV3FvWnNWb0l5NXJwYzV1RHNkSTM3YVpuMDFq?=
 =?utf-8?B?Z0JNT3A3V3RCRVBucWNnajVUY0lielRqRzJMaGtGVmpVbzB5TGdjc3hSM1Uz?=
 =?utf-8?B?bVk5bkdod012c1VZQUxnV2Z3bm9Nb0hsbUJrVUgzcE1uRVdyeVJWVnozdGpF?=
 =?utf-8?B?Y0hJcG5GRzZPQlkvUDljdE9VV25BbDRkS1VnSnNadG9Qb2NPalh6YkVXVis0?=
 =?utf-8?B?SUlKSGhQRFc5WEhuR3RreFlaRG9DTFdVWCtkbit3d3hzczN4L3VQZTZJamZT?=
 =?utf-8?B?TDhyL0V6NitTdXhERDVjSVRsQS9WOGZQc053dG5iWG9TRk9IV1poWVpHWnZI?=
 =?utf-8?B?MWJMb0NkM2JrYkJJUWF5K21nRHNnMzBjbGdnWDd4N0tnTWw0L3VRc08vaEt2?=
 =?utf-8?B?dmZsRDRRbDFobm94OUJob0NmcjBuS3hEdkhOTVZKOTJHWWJyV1dRcjlXbFY1?=
 =?utf-8?B?cEFaSDBIeXl4VFY0MlB6UmtBeVgzNHpkSFF4Slg0em5CYXN0VE81U3RoUEhD?=
 =?utf-8?B?aVVLYXZDdjFGZEJWSmE2NExya3BtQ3dUd0dZUElOUm5jTEk3NEMydjZoWHc2?=
 =?utf-8?B?eDZKblp4V29WKzMrNlVOdWwvOUg5dHR4MFcySEdjd0huWHAvNllUR2o1Ulo3?=
 =?utf-8?B?bU43ZWRrT0U2aTYya0tVTWVwNndWSmdoSE9UR1FqUS9SR21idzJLMit0RFlO?=
 =?utf-8?B?M3dibnFJZVBvQ0ZOR1NGZ2dQaWc5cFJqY2VweWVBbGpNakNISVJlMDRpUkFn?=
 =?utf-8?B?Q2Y4UnFjSVVPM1Eya1pKTnFUMThzUXo2ejFUVkwrdTRaemZrdFRtNk8xUVJs?=
 =?utf-8?B?c1piTGtiTWxmcHZUS1ZvcVVyTklORTNxa1o1TFM4Vy9GelBJaWg1WTNTb1pH?=
 =?utf-8?B?V0RnWktjZE5WeW5wc1I4SEJINW1nYmJzRUJIYm9ONFlBVk1HQnpDaXVENU5F?=
 =?utf-8?B?M3pKMks0b1RxbDNjNFhSNVB5bGJyK2xjQStOU3VoNnN3Rk1NWC90N05oZzdZ?=
 =?utf-8?B?ZC9ib0tFclZDb3JxQjlyckV1M3BHbVh0STJkYlVzL1JnNGlrUERodVBDL1ow?=
 =?utf-8?B?WXhpZDAxdlNqaGZJMXNJQk9WVEFmN1MwWEphcWdWeU0xSkFvTWh1NVBqaUtp?=
 =?utf-8?B?SCt1SWhuNXFGalc4azk0QUdMUFpTQnZ0blZxTXZyVTRoVkxVa3R5OW1PR3RH?=
 =?utf-8?B?U05yZGwvVElNb3Z0ODJDNDFmMWVMNjlRV05WU1F4dGJuU2kvcEFxU0x1S0FY?=
 =?utf-8?B?R082aDByZlFFQi94UDNWREExa0tPbUNWS3I4Q2gyN3ZDUmVpZ3crQTFwM2Mx?=
 =?utf-8?B?d3VqamtseWpkV3NRRmNaNE5OUlhRSjNaUHN0WFg5Sm1wUVB3V3doN01lc2JU?=
 =?utf-8?B?VGppQ2F4eEYxY0ZyK3VYRlZ3QmRnMGRxYnJ0S3l6MmJCUktLbk5vTDJXMFU1?=
 =?utf-8?B?VGYxNFNBc1ZwOGtUa2xIb2oyRWpLbmZObGIrYWE0OFcyNE5JUytMOTl5MkhK?=
 =?utf-8?B?Wkhwb1dNbmhZM2xJN0lzODZvZjR5OUtNK1J0TjVscWZQbGU1UHJkL0NSM09B?=
 =?utf-8?B?VTA3RW4wYnM3dUxBWlFybEQ5QTFCeU1nM1VCejZTc0pMaW12K0g4bVhPY1Fw?=
 =?utf-8?B?SXZEWm5wMmpNQW10VzFyUDlNVjc2Si91dWV1clZrSGpOR3l3V1gxN3oxcStZ?=
 =?utf-8?B?eW1UblBXL245K2ZxUGVDQkh5azdHUGhQTUZOSE85TS9qZEczWU1lL3FGOENK?=
 =?utf-8?B?d0pydDhyVXcvMmFtMUFJc2tSemlqL3lWa0NReHZZWVR0Ry9vZ1l6TEo2YTh4?=
 =?utf-8?B?T3EyeXZBTDhhYjFBQlNCWlBRNStRaGpkMkFqbUlPUDZ6NTNuc2hzelVmNzRZ?=
 =?utf-8?Q?d6C+Lv7nXFrdHkuTfSfxuB44h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92824f4c-b8f6-429b-30ad-08dba8ad387d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:30:13.5855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XACjg6VJdaCSNKYhdLB8Mjw/p3lKvEhfru7Fww/C4O+HBxEGLi7h5dt6BUmfnTa0mUrUsMrJzy5cy7cmi+DonA==
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

Xe is already using devcoredump infrastructure as the primary
error state and all the changes needed for user space error
replay and other useful logs are getting added into xe_devcoredump.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_devcoredump.c
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 3d2181bf3dad..bf60c5c82d0e 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -67,8 +67,8 @@ platforms.
 
 When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
 
-Xe – Pre-Merge Goals
-====================
+Xe – Pre-Merge Goals - Work-in-Progress
+=======================================
 
 Drm_scheduler
 -------------
@@ -206,6 +206,14 @@ This item ties into the GPUVA, VM_BIND, and even long-running compute support.
 As a key measurable result, we need to have a community consensus documented in
 this document and the Xe driver prepared for the changes, if necessary.
 
+Xe – uAPI high level overview
+=============================
+
+...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
+
+Xe – Pre-Merge Goals - Completed
+================================
+
 Dev_coredump
 ------------
 
@@ -222,8 +230,3 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
 infrastructure with overall possible improvements, like multiple file support
 for better organization of the dumps, snapshot support, dmesg extra print,
 and whatever may make sense and help the overall infrastructure.
-
-Xe – uAPI high level overview
-=============================
-
-...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-- 
2.41.0

