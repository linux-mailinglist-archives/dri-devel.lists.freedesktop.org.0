Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E913AAEC22
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D26910E1A2;
	Wed,  7 May 2025 19:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOPKcsS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E37810E1A2;
 Wed,  7 May 2025 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746645858; x=1778181858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LYpVFFaj3mLPavWLASDJ5uaOvIlGi9HFSUn2fHKHzd0=;
 b=NOPKcsS5nsQtM5XyRPH+sMuh88wq/SRANg3vtdlZxT1IvSsrwWHrXijk
 erIC0MsmeZ2BS+MfDGJ74YldEtDA66HME/tMzdvlSCXIiLdds0FpLxsba
 l+s//F0pffJJx8c+oSpentE834XuU+z1mbWwlIXjoP2hRy6A2z7+JH535
 N1Lr28BraW3wwZcD0YcU8bPVNdGXXuQnvEXcmVJCmkc3EpUQW8FM3j1jz
 N5Q8pFs5jBelXHjle2ZqwPfup8RQ3tug7i36VeDLo3cHFXyQDlo86gToA
 wDi3TP16rjL6dpCiXt7Q5mvPXUw3nETQc6DGbwlNfc+tUKpXkgHaWkl+I A==;
X-CSE-ConnectionGUID: yvNoErvQScq2k91fgLezkQ==
X-CSE-MsgGUID: TESmOHmzQWGaA4/0gLfcoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59029871"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59029871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:24:17 -0700
X-CSE-ConnectionGUID: 5l/WRv8hQAyUbOCNckrDhQ==
X-CSE-MsgGUID: v725nYWIRHWD4bjio6d/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141167896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:24:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:24:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:24:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPgkUd1JGh3xF6F+MiYr3tvIDFMtHsekrEKL1/jkaER1lgYTzTDA1XNtVg6kIVfUZJPqscZecAbvLrO1SkmKa7Q81s5KavgK0DuybSizlv5VwEOQJsZ3VANd6Sazt7b70c/8WGV78Z94IiA1O9EcMkNoIwbZns1hdB6OOUx811Cynxi16ECQOWHqOBmyAyCAQ4ViQ2DI19vn5o2XS9oRdQaoJHXZBdKw5tv+bR8DwoT26jOE67dfZ3vxe9BZd3zhAmFagxmTPhDbhjW5MuBHudHoi4zGQBcIJ8UuZerU6GYYmmfdEuTPDdbGouaZMfsaMx6Zidb2bYjLzn8IEAjQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYU2irqXnuOGwl/CSLHiMOoi6s5+4yXi3fQu8DH+bb4=;
 b=TjHrf4etFU+X9EOT3zgGBYZhGWRBaRDSbQgd+sQ9MwzTfssb3Y2cajaW1L3asjqUsW2kOsdaaxJiQOsMpDbdr8JgDMe9KH0gfCIattr4NgJwXsOPtvRefeoqnMNga44AeTOVdWSQunIl72iVtL/xJJ+z94pXiPLsP3q9xwTYeJKci+bNCwaGgzG/PYBM1gjO+SBCTbyPX2kHzfm9O7OxDeIxaGoWJit/eWQ5+ILz7yDudYohatBan5LCCYW5v+nHKZrel9VsG7u8N1VlQtzPyOfAsvIhVipxIMpesxw7RAXkh3/aBsQuauP8DaBgGl6spVagO+Rmo09Bm2o5wcOH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 19:24:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:24:10 +0000
Date: Wed, 7 May 2025 15:24:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <matthew.brost@intel.com>, <jianxun.zhang@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>, <ivan.briano@intel.com>, 
 <matthew.auld@intel.com>, <dafna.hirschfield@intel.com>
Subject: Re: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <aBuzU7zfg41-F_ya@intel.com>
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
 <20250507155727.130444-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507155727.130444-4-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd41a30-4550-4a52-aa34-08dd8d9cbe61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kp2YjGOU0VFsziQC9HYkpHPGIZyhMH0yh5hQ7fOXPncnm4bXf1JOAC/cPyVg?=
 =?us-ascii?Q?KoCA6BU2odmXeibJ8ZPCjmvbIY62lab78P4SZn8bh3Z3UmIknoA4ciBMgDBq?=
 =?us-ascii?Q?skNsOvn4zVLp+6NoZdbfkOC6otJi6lomWtvPoyc3EF3isQajPNmDH5f+aLQK?=
 =?us-ascii?Q?bW4XjjT+rbbbpoxWOcVyFK8EjOrZTVjhHz0lb+s9NewfciNHZ9W/6aQBtcog?=
 =?us-ascii?Q?Tyeamt7OQWS1Do/DDNZOgf7DxmAws0frbIeZmSGbfhjj7Z78DXd0mniHu2V9?=
 =?us-ascii?Q?VPAUHhNKKiFwCcNCob9Uf4o8vOUnctycnh+aw/+snBk/W34QuQiVTyCyLTJ0?=
 =?us-ascii?Q?Jw5gwvCsuhMtNuDNt+dtyknCjeH4sbVRm5VBm4mEJdwATwm3jimR8j1jgLL2?=
 =?us-ascii?Q?s+sZ0dF2766b9vv4g5/lvXR45z/xgDO/z/0mGIqMAUg1nRsBxbbJybhGoqq0?=
 =?us-ascii?Q?B905NCWsEXewYqqAUe0A6YVDZe7ZJhUooOd/bZ61quTdeLNGT5GPnie7j5xz?=
 =?us-ascii?Q?PsthUPBK0x5TZGkfCXetWHI29mZCBIlL/AopFfxnxL86ajveKX3t2ultMna5?=
 =?us-ascii?Q?r+Q3ZrGnxQseNLdftQP4welM/f+clIsR9gwV3MQYY4KXaCoSfs44xJTbj1ui?=
 =?us-ascii?Q?mp4/QxFVTFVA/p2rKYhOkgE/vXJ/4AhBFy7551hbN6q/Pz+AKGXaBNTKBN2s?=
 =?us-ascii?Q?uESCH/W15/MNtb+G+Bh5X7yzWbIUAUWkj4GOXwttJ3WdVMEm0ZmUNqnOIGlI?=
 =?us-ascii?Q?/nBjvgfK2/s6f6A3p8U91bSDHVmcDpOsBdOCCaSC7qVhi4PKtV7v8gB8M8X3?=
 =?us-ascii?Q?TyFiZdoLen8WGbr1mMOL5RRNcBw+5qeaysz7Ce7Iyxhrj3cS7f7UzgvSvrqw?=
 =?us-ascii?Q?d8EpdAMxO5LtbCiixw9fFUUNELF5VR5TF55rgqs/Q5xnSHRf8p7rDrWHnuDh?=
 =?us-ascii?Q?hKRO5cHsoPwNR7zMElcy1KJmlhmXz18lDH1HygzFTPm5ebpjhpB0C2plO60n?=
 =?us-ascii?Q?RNmXbqBogwMgSNBhgdw5Av90bao8i7FNkL7R7H3eB2v8C8UAhJ49XTj+CIZG?=
 =?us-ascii?Q?qB4XlVF8PC/6ILDFocWojMuUhLLJMZYOgZ7SAWEAeozpPXtPfOBVx5z13p+0?=
 =?us-ascii?Q?uOBD1xlTmsokCL2eDjxw8SAJ1JT9YH0OS3ABK3Y2mtFdHmA5zrz5N+Lb/OQF?=
 =?us-ascii?Q?Og4qssco5Ko5GmEfHS7ma36cvWqy84lI9tuOzmyKPxf7DpcrCjo2+nRIPI5d?=
 =?us-ascii?Q?rGjYSAffRgLNs/IWvkCsZeAtAwKGjGWfuQEz50n7NcHuOPYZNpBwQZR5Yc/h?=
 =?us-ascii?Q?1dO9PxQgey6zRJP8qB/TsJUmtCM6dc92Isne7y3A/yMPsxQ1CnH2ZrA1POJ2?=
 =?us-ascii?Q?lRjHtDAU8JkT3DhkiCHOpX7XiAVZg7NyvxbBIXbXtVpdJNWWdNyUM4gGhCZO?=
 =?us-ascii?Q?3cfa7fDfqDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q9/MkCdWWpzmDIl9AWEYYocGmpOvB9/bJ1tc24wvhfMDa7DMsgTaTFutupm7?=
 =?us-ascii?Q?wJXh2mfy6rmsz33US5mntHoTqa7euTmMvNNKFCDqF0lhJ6EDSdsrMMLwO3SW?=
 =?us-ascii?Q?FK4vSvkiyOGnckbOjDpwuF/DIdD9UmD4QpKn6Xtk1jL28M8oAfsFZklBsbHi?=
 =?us-ascii?Q?rrE+/av9y52NY4H63c+qo3w2IssbVBIlZG5kKdhzHobV5sMecCo2+aj1aj8C?=
 =?us-ascii?Q?iegxDVW5lH/qvkn9oS2iVgW1jVW2sLpYEIHjaRTSSd5Dp6pplWEhSMhrRYMz?=
 =?us-ascii?Q?xX6ZG0p4awSUA18BgJd+G7avM+534bYzfO80HOsow4F1SsUOrDDOJpIObqQf?=
 =?us-ascii?Q?kHzq+vKUWGuT6fnN0zhH4bC6yXTRMjLbdKYY81HebCkiedmEPmodM8oQsPG5?=
 =?us-ascii?Q?Op9YxBdaHgjmVcXUZcmouGobJF3VdpIsFf+hhF0r58QH5CLtp0+aGU2D4JVX?=
 =?us-ascii?Q?eDs7QmnPsnMfBXO7qU426ApAPgDs0WawhSsq3wus1pJI5c6JvpjZpOXGSLb3?=
 =?us-ascii?Q?MJUKrM6A5jDXVr307y56y+38sbFmCx0CMUIkSXta+n9HOqIM9V2KfVODvBjn?=
 =?us-ascii?Q?ipWYh4TxPoObd3y1Q+Q6TEcTUIO2cyd8A3NYt5XbecNKnNd9WKwgE5Hhm3G4?=
 =?us-ascii?Q?Ykh4bzmGJFIqcvyH9TapwqaEQ9SCg1WCHROd4V+4e05NBMoCe95BBZgtI7gR?=
 =?us-ascii?Q?eY9ubxKTYzXDd3YSTURua1NQDsUu+PTzxuUSepEGP8h9wr2eR1Twg8HO+xvd?=
 =?us-ascii?Q?zSnO0Gbcs3IR2H8nUpZca8c08GoEipdEk+QKsS5M99/2/oaRkRa7+8477dL1?=
 =?us-ascii?Q?Nxt5o97IKYVOj3lj14UDDPeqxiA/JBY8d2VdoeDrcPL40swieXSw0iOKXXNN?=
 =?us-ascii?Q?qeKM/Gkt+yHDNzvxnmjdxniuy8eIBd1Oq6EfJhQKAjXCVcSEiskcEsQIyRpB?=
 =?us-ascii?Q?Dsx1TzZstOsJQLLK+oinI89M5ikze79LeOXw1TBHgbwm7YnABqXEbRmPgUlE?=
 =?us-ascii?Q?ETr9HwsGWM9cZHw0FAtdMbKotCAFicc3KaTzGsCBQOulzUeuGVl7+gHZ8tQ6?=
 =?us-ascii?Q?GNI1cgnHbqa2TsBK2T05zkLDC7pyVWgB0g3obAHztcpJ4Z97XtonDViPAxEu?=
 =?us-ascii?Q?gV6jqddIp9JVywh2+flkkKrqi+zzbUps+k8z7zgv/Ubtqm9LiwzmrGEnk/1f?=
 =?us-ascii?Q?FfULRer0gGPYUm7UGcYG4pUzVLslf1f7Tze16DlORpi5gh2r5L/hkHgiyNr2?=
 =?us-ascii?Q?8AKVKM4AnquwgCi+c9N+fQAdm7V3gTeNBUDfu/zOUdrUfLAWsLpu6hRH+Ll3?=
 =?us-ascii?Q?12anujK9dleNB7zKedwSEowIh9FvkVN87VLoapDd6opZ5g+F9NwbAoEWlBBb?=
 =?us-ascii?Q?A+mv9spN1/Jnl/o90mOVKuQKqcjXe6pnxKhbAaCJdskPOIv5qP+970s1Nar5?=
 =?us-ascii?Q?21FK7gzXGyk+m01vnnzS0iUGlas+YYKFhoE9GGAMKLPXils1yjOU+4Nsvva3?=
 =?us-ascii?Q?19huJ7vkOi4ghhv591aGi6jJbmFud+K2N0GbZp/iZ3NmQUBrU84X8gn++BXW?=
 =?us-ascii?Q?dixh5NDKwB9hkEWTC1Nyft6JZXb/adOtN7i+MhheEn9e0ejGGyM22BxDedWH?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd41a30-4550-4a52-aa34-08dd8d9cbe61
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:24:10.7839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8B0xad0XHbsWXUH9ixuAu7xcpo2mnAaubldgisiKAjzcMX1yViB8qAU2vF6vnP+vlEGjVl1zEuRdrEv1TnS8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 07, 2025 at 03:57:24PM +0000, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> 
> v3:
> - Remove address type external definitions (Jianxun)
> - Add fault type to xe_drm_fault struct (Jianxun)
> 
> v4:
> - Remove engine class and instance (Ivan)
> 
> v5:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>   Ivan)
> 
> v6:
> - Fix inconsistent use of whitespace in defines
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

We are already in the v25 of this series and we still don't have the userspace
PR/MR to reference here and no ack from the user space?

Sometimes faster series iterations are counterintuitively slowing things down.

> ---
>  include/uapi/drm/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..556fc360a076 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_VM_GET_PROPERTY		0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1193,6 +1196,89 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +#define FAULT_ACCESS_TYPE_READ		0
> +#define FAULT_ACCESS_TYPE_WRITE		1
> +#define FAULT_ACCESS_TYPE_ATOMIC	2
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +#define FAULT_TYPE_NOT_PRESENT		0
> +#define FAULT_TYPE_WRITE_ACCESS		1
> +#define FAULT_TYPE_ATOMIC_ACCESS	2
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +#define FAULT_LEVEL_PTE		0
> +#define FAULT_LEVEL_PDE		1
> +#define FAULT_LEVEL_PDP		2
> +#define FAULT_LEVEL_PML4	3
> +#define FAULT_LEVEL_PML5	4
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.  This
> + * determines both the VM to get the property of, as well as the property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for the
> + * requested property.  The user is expected here to allocate memory for the
> + * property structure and to provide a pointer to the allocated memory using the
> + * data member.  For some properties, this may be zero, in which case, the
> + * value of the property will be saved to the value member and size will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
> + * providing an invalid size for the given property or if the property data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> -- 
> 2.43.0
> 
