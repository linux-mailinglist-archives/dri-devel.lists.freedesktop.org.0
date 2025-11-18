Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF513C67C1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A839E10E417;
	Tue, 18 Nov 2025 06:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFAf7Fn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AAB10E414;
 Tue, 18 Nov 2025 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763448119; x=1794984119;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sTZ0S5Mg4WgW7t+ZwOcvI/I/6zAdpaDGYtIRA2mANeo=;
 b=nFAf7Fn1sNqRwEsiZ9U020Sw8EHWJIxfqf7RddBylKkcxpK1Hfav2tza
 FO/HIW78t/hXwkN5kwCxQFSi/pK3NSc98aXrl41uNfcKzFdWQi8Y1BJph
 QQN8OOYkQKFIkNZAS7YHKsL8ibsU84i5AEAR1OQ4DqppiZpu/oigpX17G
 JE62BeS5Wdr6G9F+W60v1Sk01BXTnyw8QdaRXQ7+M0didzCBqyylUNFWH
 6+eGBOWAfnlRr6D3URrT0vH+8r74+4Y729nNeBiJBLRo38G9CAvY5RBSs
 dnnoqc79fhwmpG/XG65L8W1VmQVgiAR5XzYEDyn1ghnINB80iONCIZI9v Q==;
X-CSE-ConnectionGUID: pC2Jezt1Saa5cGMmVvg4Ww==
X-CSE-MsgGUID: YXZHOa5AQhSP5osctf+qXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82851668"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="82851668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:41:58 -0800
X-CSE-ConnectionGUID: xED/2OywTPqjVv5ebyvhww==
X-CSE-MsgGUID: HfDdvjs+R6ije2998n1B6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="189964546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:41:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:41:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:41:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:41:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDa4HvZXxYoNN6DdbDqi/uxdXfhI201otevth33bH2KSeDTxcbFifw5auDGu8SaT82dWtC5d70M651WMmNdmljE6T+EACnhvGW11MQfJ4+GpgwskYwncLODyF6nEZ3X+OsHJJf01tMt/FkBJpRi8G+x8NxaVwQK2zXAxl+UQgB70Ngef08RQNI+qTgOYhUP58cXiCl6JlE+Boj/WnOioCgS4d+oTbIlOfhkSVQSNk642MbmXgfZ+s9cjxyJmaPCFoTmBBCRXL6FC3rgM8zYsVOBlAbY9uqooydIclxmSc2iFpUGoKdiikTPifBBxkR9LQDoOHEFfIskOl2Fq/blEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0QUQVD0f057O9NGPzfcnYEPAGg+cEpDf0j6ZG04w2Y=;
 b=sVcit4fWR/d+F0+2nO+Tpi1bmm+bnqeer338P81nAglITK28HcN5uBLlKzDd4Y9Y8+d3y1KvkS1r1rust3I5XTHdmng/ey6HO1m6yAMn8TBQs84ZomkiGh0YQ1nLTZWC1T80+CKyuz6GpP0iOJEYhv55JLhy5qAAmmRQcvqoDVCGLeSoJ15D9OYIFFxjZh8Zg4zIAV9PCXOct7kKM6MhQfVr/C6GcWilGL1OqUVXeuwq9P+oi7/eDz6nrnb/UrS9/cdOttp9bqpp/5ZutI9mnwGQOhuQ5NHzi/P5yEl9kXLNtWVOsBo1PG0weIb23ri6Cdm2xuZ83td7Tm8xdNpeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 06:41:55 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 06:41:54 +0000
Date: Mon, 17 Nov 2025 22:41:52 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 5/7] drm/xe: Do not deregister queues in TDR
Message-ID: <aRwVMM_RKyx1CKEI@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-6-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a226a8-625b-4ec4-653a-08de266d904b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K2zMHqnVQkfcQQSs/70tC+ZumRSlipcVXb6w7HGnaCBnfeG6dzp1mR8xWJYv?=
 =?us-ascii?Q?fcjy8LTwgsXykhKaALq+adosrinhOz6gLJIfzCEhuewtsE2wwx4L9XA5NMKK?=
 =?us-ascii?Q?aUJzcZUa8H857LqQrM2vKXE4dWk22bseOp0aOWBer8UeT7EEfaPfYPXUPV2s?=
 =?us-ascii?Q?M4dIbepqEJzdlWCmLHZT+v1vZRDuoSuDBUyXZfUp1GojHFvWWJ9AjMuWtUaz?=
 =?us-ascii?Q?DGmgTRTOhS6BAi80SM6SKZihY/xPpHlv0LZkMaC6MUagyGMTRFlSG9/K6pYn?=
 =?us-ascii?Q?HpiRWppYtaleG7oRN8dPETssTD1m+qbQA66pJ9K0Ayr5VYiLHQVeFxAFne6u?=
 =?us-ascii?Q?nDm7Akz31uhHGNQOLn5a9cGDZQNW7xtM9B3p4joAJsABZaFQMm0jdE0/bXnC?=
 =?us-ascii?Q?ZVold6kuE8gNfIhGlQErRSftA25DcbkIdjGrb/ncjfir3xaiEgMHQaMjxrTc?=
 =?us-ascii?Q?TxHVhIntK2ICwyEKFO2WZKkvrPVx7JbeC9y//JsvMjC9Ftk+LVXUvOqC7kVT?=
 =?us-ascii?Q?Zr/wHyeZ1GwxuTj8F2fUbaOkAy7os1b9TviGOZFG127fxpw71acrfI8rh+Mm?=
 =?us-ascii?Q?mPr1BqRvdteBTHamvVnBqDyo2JgMMFlP5AX7PjA/aqtKquwV1cgM+56TkzC+?=
 =?us-ascii?Q?Bv8oplcRKYamMhw+rvzGFTO4a3ATmpwWrKcnnXSLG5yabNwgzOfKdfy6JdS6?=
 =?us-ascii?Q?9tRIs8KMhYOgEEaN4KkfnJC7psA2HMsPMgzvOzfeB1h+57zE1tELVUV6H93d?=
 =?us-ascii?Q?7IyfpSd20U4b4E/6wTmWpzycIbi7oU+hFARpiILi4GJQIsUGchVTesZt1dkZ?=
 =?us-ascii?Q?7bXmdC/Tw1/QJarekM/HvJX7f9/NEE068Ul4EB1eWqIf/rHVfSdVgsn5u9+2?=
 =?us-ascii?Q?HGFsuzdIdRYlz1YkQ13cwL8sbnvwHyAb3pUG9mimm1YXhbjkJwoZBQzXMKo+?=
 =?us-ascii?Q?lvOwGSstgaYBV1TyI02qYs+ENeF1zDlajqhbUkCRWWJK3yxeWIC0u07Fv9mE?=
 =?us-ascii?Q?diEWjoxN3+HhhkfOwxR/Cxk2IPgQyoTx3rBluHX/QAJT776eRUKpbV8x0osc?=
 =?us-ascii?Q?gzlsRSIubDGzBSWByVk7S1762bNjVI7OutbIythIxso+5fWnLE7lXe9xO+lT?=
 =?us-ascii?Q?P4tAsh2f92N0HxCjTJ6MbLoxJCXDYMH6K3NIHn1vCjy+wiN8VyARGxPXaX7I?=
 =?us-ascii?Q?sV+yaCjdbOUB4Zw8nt1uCN4SL5scSP9CT1QPg/toqluE8xID6rUbJwvZ8eKZ?=
 =?us-ascii?Q?1EGEM8zk/5O5Kk4zbhi075LplHvlEp6X475QH/uYJoWsfJZP4XmgkAaq25bp?=
 =?us-ascii?Q?HbffTIRZOYIq5Mmx4y7cqpY0iGBiKNn2axf4zhadsGoU8dzttNdmcxpJdkte?=
 =?us-ascii?Q?WKaVlzcY/qBvZVpw5jPhz4vW7khMGkYhOaDH+JMm4LHuQGmbAllx+lNIuBIO?=
 =?us-ascii?Q?w3k3utl8K9y8yBFCc2YWkcfl/QCggh1G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kaF1vvi3z0tVnP325tWiC0kYA5gBw5T+X/vEy/EH5z/so7YVxvgTGcpqW1E0?=
 =?us-ascii?Q?lg8+0y1gyerRZfVo5XoexW/MBHbIXI24OlH1k3ALGgpYBDTLKa8r+NfoTGjB?=
 =?us-ascii?Q?8lcWdLZXnJRcVpx+tDwItfoCpHCCulLKyPqF3XnJg65A9rz6Qvii4snB1/Ks?=
 =?us-ascii?Q?vdnH2cF0P9vslQooxm/gs37ymX+ND4sFJ6cfaRxfcHxzGV+mDVzqWaJNlWWM?=
 =?us-ascii?Q?7zLjb0nEZfZzpKA2MLw7PB0syQLgtBOuJ2mgXMAPKXw6F9yuXLQwtQJ4n9DS?=
 =?us-ascii?Q?zu+uRnCOoIIheRKddF6X7ZnM7zCh27L2pZCR4Sp5CtQ1QHDPFccbLflFHK9l?=
 =?us-ascii?Q?5fU1ol4ikLjbzvT3GmHNJquNs+Su54S++15EwlwZsK0IchY+ZFZRJQBvo1V7?=
 =?us-ascii?Q?3y1HPq0vBaZf+svN7gByxddzLaPZOajoSEKYLd/rHobHMTJsmNVaGzvC3hFH?=
 =?us-ascii?Q?GJivlqJjtev0y/2w8refew6EBAV9K4qJrrwSZfyHN95If0Bm5SzDtELGvT1J?=
 =?us-ascii?Q?ojkNB1jPwl+ekMORyVV+QHKjrS7Ep7/jPv+RV05t6zBfAcjRzETqehe+Xr54?=
 =?us-ascii?Q?4ccbFI8odFDFnCb3DJQc45FocV4CdKM+SU8xeWJJDXWvMdBn2/jz61QKGzvh?=
 =?us-ascii?Q?f3aH9xhqoFWizD3BUBiPVpmPEaunQCH4iFb5QJ3fDWglw96BFUv5srHLUOk7?=
 =?us-ascii?Q?gIAOd/gGSW6yrlsPRx6hbNXRn1CKRus3zvY/BEuEL7fbdB9iAxApfIe6c1Qv?=
 =?us-ascii?Q?HObxd6eX7nUBzyaj563ULmOeSiyJBSKHqwS6pCdanNhxwGPamWfmgpd5AXui?=
 =?us-ascii?Q?LGWhit4sMKbFa2RIaQw9zN6598FOggfzfKYoT9xe2MydGjTWFo6BxhMXguMN?=
 =?us-ascii?Q?EsQ2OJKZoIUpcxup7XP6h+ylOAGihlTE7KkU1fADW3ZAiMgo7gP2siFM5WnF?=
 =?us-ascii?Q?jke6fLkXN+75DpJzbPrWcLZRQD3E920e0SqAtdmHjMUqsQZkJVCu7wjKgJ0g?=
 =?us-ascii?Q?5M56WfPDvAVDQTseoqCzzK3vpWzyDokczFNVs+QmhFa81d52A0ESbY1FNfx3?=
 =?us-ascii?Q?eeOc91m+RkDySV4Zj535lzsptGxL+owUenwv5g5sRyqE1hPRIcHAvGkvHaNE?=
 =?us-ascii?Q?vnmQ2bgTj22/KDJ7mmjleb2m3QHsr9E0XM5KZVpq+uNeNhFqZOPCmKrVBhbO?=
 =?us-ascii?Q?W3aJw74omCFR6Q9DTU/OHWOCLLcXsKDvBUv/Z4+bHboWsMKPIrsgxZLN/uGY?=
 =?us-ascii?Q?al9bXR9itGlYTMPV9A0F6dheOywZn/vXX5wAWNC61pWsqxLIo2Kf8g9Soffa?=
 =?us-ascii?Q?lsAdC17CsCcz+h0DfEcdyUYJuWFFeH6RdmbtFpc5DPpqlx5XtjZNbN4tnUt2?=
 =?us-ascii?Q?jA3AYVxKEX2FhVb8OPcw5RIyXu5zltHCBnDVbxvPOTtKXBvuVHA83gwaRFj5?=
 =?us-ascii?Q?qprqdgghsPR78gGFjQa6YDgh8J4ZniiPcVFy1uYq+AtkeHFldbhpW0pUScni?=
 =?us-ascii?Q?c+FQzTo0bj27OjoenmnvsDl0J0uUu+gH2ljCDkj9Pr65eaHWfKVWqD06pX6K?=
 =?us-ascii?Q?v+3ZLyF1IV4IiTRHX5MV5bLoUofFa3qrgTjWZ+Y9TbgPQfFuCA32g+KTeh3F?=
 =?us-ascii?Q?EDqlkHrLj8h+hflaUMo9JqQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a226a8-625b-4ec4-653a-08de266d904b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:41:54.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMcz/MB4hf+DxTZbTlwsmZZOCUFFIIPiubImy8njRP6Eri5NbU6wzR7Utp3UgA35KMVI8fwWsxkGnA3Z9qBK4ogS4l/UCtvBtXqPm4SExMw8ipKpLIw48ktZ8HPaQT/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

On Thu, Oct 16, 2025 at 01:48:24PM -0700, Matthew Brost wrote:
>Deregistering queues in the TDR introduces unnecessary complexity,
>requiring reference counting tricks to function correctly. All that's
>needed in the TDR is to kick the queue off the hardware, which is
>achieved by disabling scheduling. Queue deregistration should be handled
>in a single, well-defined point in the cleanup path, tied to the queue's
>reference count.
>

Overall looks good to me.
But it would help if the commit text describes why this extra reference
taking was there before for lr jobs and why it is not needed now.

Niranjana

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 57 +++---------------------------
> 1 file changed, 5 insertions(+), 52 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 680696efc434..ab0f1a2d4871 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>-#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
>-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
>+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>
> static bool exec_queue_registered(struct xe_exec_queue *q)
> {
>@@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> }
>
>-static bool exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
>-}
>-
>-static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>-}
>-
>-static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
>-{
>-	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>-}
>-
> static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> {
> 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>@@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> }
>
>-static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>-{
>-	u32 action[] = {
>-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
>-		q->guc->id,
>-	};
>-
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>-
>-	set_exec_queue_destroyed(q);
>-	trace_xe_exec_queue_deregister(q);
>-
>-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>-		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>-}
>-
> static enum drm_gpu_sched_stat
> guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
>@@ -1326,8 +1291,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 			xe_devcoredump(q, job,
> 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> 				       q->guc->id, ret, xe_guc_read_stopped(guc));
>-			set_exec_queue_extra_ref(q);
>-			xe_exec_queue_get(q);	/* GT reset owns this */
> 			set_exec_queue_banned(q);
> 			xe_gt_reset_async(q->gt);
> 			xe_sched_tdr_queue_imm(sched);
>@@ -1380,13 +1343,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		}
> 	}
>
>-	/* Finish cleaning up exec queue via deregister */
> 	set_exec_queue_banned(q);
>-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>-		set_exec_queue_extra_ref(q);
>-		xe_exec_queue_get(q);
>-		__deregister_exec_queue(guc, q);
>-	}
>
> 	/* Mark all outstanding jobs as bad, thus completing them */
> 	xe_sched_job_set_error(job, err);
>@@ -1928,7 +1885,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Clean up lost G2H + reset engine state */
> 	if (exec_queue_registered(q)) {
>-		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>+		if (xe_exec_queue_is_lr(q))
> 			xe_exec_queue_put(q);
> 		else if (exec_queue_destroyed(q))
> 			__guc_exec_queue_destroy(guc, q);
>@@ -2062,11 +2019,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>
> 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> 		clear_exec_queue_destroyed(q);
>-		if (exec_queue_extra_ref(q))
>-			xe_exec_queue_put(q);
>-		else
>-			q->guc->needs_cleanup = true;
>-		clear_exec_queue_extra_ref(q);
>+		q->guc->needs_cleanup = true;
> 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2483,7 +2436,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	clear_exec_queue_registered(q);
>
>-	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>+	if (xe_exec_queue_is_lr(q))
> 		xe_exec_queue_put(q);
> 	else
> 		__guc_exec_queue_destroy(guc, q);
>-- 
>2.34.1
>
