Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06048DD00
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 18:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6710E11C;
	Thu, 13 Jan 2022 17:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778A910E11C;
 Thu, 13 Jan 2022 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642095406; x=1673631406;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mlRGgojLoz+N1a5YbCp79G7jzRkCst8OPwHeDPIavIQ=;
 b=jmZpkwoMnx2j2blSltUdKdATKsb6aLgGvo1sArcbUqXDiuin6wUdxkkk
 LR7Xw11dgQivRU4fvv4E9AEYm03X44QoagpqLBjB9NjkeDi9BI94v/T5w
 JsbLEoyWtpiChJhWL+boh4hM36xCHo2SM/dJr+Z1pi9qA7BKtCLK0G1rx
 aphKoAmU+iJFW15cI/Zrb+KoKj/LeYxjRZB8RDQbrTsyXiOYlNkjxMO+x
 lXx/7CXbnl/gszHjgZ9aeyUCx4chnolmHWEiAGISzklDqx8Q79NbB+b7G
 Vyd4+bGdbFc+dSx3jxzjsnqBsuKWGWOYe7y1XcwdLun0WGfTX/nwcu+IA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244273831"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244273831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="577009823"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jan 2022 09:33:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 09:33:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 09:33:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 13 Jan 2022 09:33:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 13 Jan 2022 09:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2JRlb8ehtqcABCM8AGDmO4TU4Th7GEnaeseDigAdH67IoQap4V2bZMmT8Vf7UGeIpKtE6WzJoATPzSHlRxTrUafFm1hiSg7uEKFI7pWNPr+/GHhRqfjh/ZhBEHSLJe4U3FJIhqFlV/L+xZalSUo/OuW5Kv/xFJaZThZzp9nq8Fy/LN02rmQ+EOYoUNWJmDr02K+3zu0HRzLogj1DZLuoPuNV+EWVxqn0YfnfYhSkXHU0SonDJvoCdk29i4clW1C5t6I2j+g0gEEqeurJ6mdPExMSgxcx6/lUgPvtY5qx5mcQ+uPtiKessNhFkVdDI1H0EmwDHpcV78rTSJ5HehP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHUc1wXAxjti69whkEJzDpEJ2OepyK/AmgVFE9A5HvY=;
 b=aE9JrDZIDrOihsQzXtU1qaKkz9o58SvGBFSgNyEryoZLUljxSUShUExqrlbXX7UFa+i4j6Mp1YmQbqG6JCLpw8LozWNJ2ZtkOAKqmjCWSgeU1oruqgiYl6nEFgW1v5CqrB4McII/uwu71Rch7lKDtzSW6i0DK0GiOJz6FGIroljvMISlGNW0bhaLyoR9sgTSercMvqWqtQsNGGPKSBGhuo51KLKohpMvMhuHahPyrrRM7kyDqDOv5iytlsuxWnpB81CnK4MNLanRg5B8NpbF/UgsETXGm3TD+HnTBqw/RC9M1iIARDl2nf2Y+UuFMDSdDTNVL+LsrloeYRKyQ4xreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 17:33:16 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:33:16 +0000
Message-ID: <5b396396-46c2-30b4-09a6-1d23d474c978@intel.com>
Date: Thu, 13 Jan 2022 09:33:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/i915/selftests: Add a cancel request selftest
 that triggers a reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220111231109.23244-1-matthew.brost@intel.com>
 <20220111231109.23244-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220111231109.23244-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4c5deaf-3b08-44d1-211f-08d9d6bac808
X-MS-TrafficTypeDiagnostic: DM6PR11MB4546:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB454662F95869C43CBDE43C69BD539@DM6PR11MB4546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RyXIuRiFtH2jd7MHL6rDbISph7MGcsYDqNwa62fOKxEpvFf8jfR+rhYEXCzW+1JpMLuDf07hQ1pGtmCEI0WH2YwXM1R4oZJbv7MoAhrcYjOVPWnTT4aC2FwIdbvJCxbq1nAKkbkyF9OBCzfLlheLT6bWOkJqdv5Y1WKwDLEVSOQ19zNbibxHwNz9IEmjxO5Q/8O6p30FkH1e6efUBETQ6axHhzAQApbU7Td4toyHai4mmfKYiYQ7El0uZ27Hbre25Hi8mmYL6WznsYau5UFIKiookkC42C3L6KMr8KeG0Pz1qUiRWoc/9FJOgREtZ2jGXHE+EkP5yFGXJNeWDss0QapA4ejigl4v6wKRVflV+vI27IcGoalKBMwlGEOm+16DZdUzNLDrmuJ5LB3SDwycAVh/7P5IPfwJb1JttELOqPUbmDx7Nfzquyijm1Kbw6SdVE4OGHreGIe9LH5FMJrgm0TV/46VUgOPKJI0pp8EvZUNp2oA5iJVExUvH6l2JlqGgurLy67NhvYCc7UY7tbDHxKWtQvzEaNltMBuQ1iTNhz2XQntcU3uTzaVchSXQL/wKiZL25/e6h6fCQRC1Q5cDGUz9N/y6ltkq4+fwXTTUdOEP54tpNfg4D/ncE9Ts8slx3dxL8k7E/EMREOmdmw8Fd15zMAPx5uo853ToJB1JZNS96CDBiGgLkY7M31Idzs4QEJMXYzcUbHaLUe+bJDZu7Qa5okRxrjZTIdGYgL7ibNISXpoPyJwtqvlgcDocUyn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(5660300002)(316002)(38100700002)(82960400001)(2616005)(86362001)(186003)(31686004)(2906002)(6486002)(6512007)(26005)(66556008)(66476007)(66946007)(508600001)(4326008)(6506007)(8676002)(107886003)(31696002)(450100002)(83380400001)(36756003)(6666004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHd0U2lqMENFQWxsQWNxSi9VMWxtWFVoTGlnYzhRY21Fa2JnUEVPR1laUG00?=
 =?utf-8?B?N0x1SXJHQ2Vrd3ZnWGF4SXVTMlNScjdIZVNvYWVRcUdyVnlhRkhsZEZlbXls?=
 =?utf-8?B?UHgwTzlwRDRrRmV5YXZ4TnBxUmloWENnOEtmd0NCd1V0Q3dqZXhsd1UwVC9S?=
 =?utf-8?B?WG1oSThoQm9SQzhkSytzdkRIQ1BuV0FsRklneHB4cFllb1R4MmRDdS9NQWlZ?=
 =?utf-8?B?R01VSTM3YXcwRXpMTm5ycnZvMlUrVUlLWXFsOTBtVHNYSmIwUU5IMlo5em1Z?=
 =?utf-8?B?c2ptSVZBbFV3VU5sVURmRUY4ZXo3Znd1bHluUVpWRWtXMmJoRCtKRXRZdzk0?=
 =?utf-8?B?QlJXLzIvS3pTNE9CUjNWemhvWVBETSt4amVSK2RvZGQ1WmpYYjhqd25WMzVu?=
 =?utf-8?B?K2w0L05iTm1IeTNTVUhWdGxKVGJKc3ZUK1kvZzNWRWNxQVRRVkxJTXhvRnR2?=
 =?utf-8?B?cmpZWkpWUjhnVHBqY3VlOU5xcVF5MTdYYjFzR3BEQmJzSUtYTi9oSmVnSXF1?=
 =?utf-8?B?N0xhWVhTRDF4eWVIT1BRQlRRc1pTQkhvQUFudjVKNmgrUGQ3VEs5VW4wMFk1?=
 =?utf-8?B?T0RWdC9uaXdMM2Q1V0l1MFFUNnJycGpEa0RWVHg3cjkyMFBLWVluZi9hZHU1?=
 =?utf-8?B?WGd2V00wMThrRXNmR0puTVZrcTFLWDYxeHNzcGFNQnU3bjVXSUJRcmJyVElX?=
 =?utf-8?B?TjV0Wmh0RjZmdXlZTHlETE9kNmN0Wm10V3B4UWFCNWsxWXcvQW9pUEtWNUJH?=
 =?utf-8?B?aVRZdGhtdDcrRVRqcUU1YXpxUCt2SWliN3RJUUhLUXdPZkZPaThlenJmUnNp?=
 =?utf-8?B?NmpUV00wWGdzOFQ0YjFlcFNacSs3TUlscm5uTjdtNlBqWEE4c2lCUHZVb2dw?=
 =?utf-8?B?YjBNWnEyQ2tHU1FISEI5RzlZRDJVVHVDTStmWUZMN2NpOUVRdFhkQ2M1SCtm?=
 =?utf-8?B?MnRqM3RJQ1lsLzN1aXU5bm9pRnRHTEVmY0h0VTdqMk5hQlBxYitpVnphS3Zk?=
 =?utf-8?B?bVBzWVNYcTFYSXEzZkcwQWx1TlczOGZ4Tk5rYWs1WE12VkMvUm9mSnE3Mk5l?=
 =?utf-8?B?OXFFKzBIelAyZnZqaVR1UE5FVHV1TWtweFFMdS8vTWVGa015a09LRlRVakZ6?=
 =?utf-8?B?OHE4VzJvVWVYL2ZVTjA5WkRzUzFPc3N2WjdvV3BadUQ0OFh2VU55L0E3RUJi?=
 =?utf-8?B?NXh6VTZkQVlwb2VIZE1xSWhjdWFQYlgzbm1ZMzlDRUcxY25IcDYzTHZVWEE5?=
 =?utf-8?B?RGQ3MUhGdy9sSVBqYXJVMFdTKzdoSmJQcmJDYVJhbEk1emZBaitCOWIvTVRT?=
 =?utf-8?B?bzh3TkJKY3NCNmZ5RzJYc2dtZlAzbXhlakJ0UlFqM3NJMWJxT3NKWm5FZ3di?=
 =?utf-8?B?ZWZCbEZxMWQzKytPVmU5NHA2dy9xbDRXMmhUQ0o1eVB6cjBYVXZ0VjRiWkVB?=
 =?utf-8?B?bG15Y3p2ZzlqYnlWUHZnNlZRNGFyOWtwcEJ5Wi9BdzZCc2xFbSsrVnJ0U29q?=
 =?utf-8?B?b05EWVU3c3RVWEdNeEQxMzU1a1VUSnZEbGZrbytvV3RTc0o5bGZBOG5taGtF?=
 =?utf-8?B?VzZ6TzVUSVFIY0xPT3V2NjhyVGhDZFNLenVaRzRYZ2ZHbXRXbE9LcWhhNUNL?=
 =?utf-8?B?bTI0UjhPY1JUeTlaVXBNWktrS0dKeXU1bWZKemZQN1VwR0orRXNrZERZQ281?=
 =?utf-8?B?SkJQM1FuZUFwOXB3UjF4MHNveEt4cjRGbmFpelY4OUswNlNySDNNaytyRG12?=
 =?utf-8?B?c2M0V0FnNVZyQ2o3UTAzNlJ4ZTIxbW5wQ1h2a3VpemxEVVNGNzhUdGdMRk14?=
 =?utf-8?B?aCtEaW1kOXR0dDBna3JVZW5CbkdQTTQ3MW40eTZXNTNCcUVZTXpheXNxTEEx?=
 =?utf-8?B?Rks1RTBxdU02Ri9nbkh5dEQ1U1hyRmhkOEpVZnUwVC9Ta1JZODdLUUV4aDVv?=
 =?utf-8?B?bUtaNEptWUVnMTFSMzZKR1ZtMlJnZllnODBsdGlQY2duTk92MVBsQ0V0WHNt?=
 =?utf-8?B?Wk5ON3Q5N0MxbFcxakhVN1NLTExTeVZ1Q0MrdUhLRlV2RFoyK1pVZzJDRnox?=
 =?utf-8?B?c043U090M0lsV0RWcmhZMDFzRnJINmNHbklEZnArUzVHVG9FMi9vNkREelAx?=
 =?utf-8?B?ZURkTUVrMDNMRnBsK2hWaks0VEEyV3JBQkJBKzc2aG51SkU0eUp5cVVxVms2?=
 =?utf-8?B?aWNReExiYWo0OUNCSk9LS3BHRUNxN2pDMk9wNVpRclJoUTZUaWZNc0E2OHY2?=
 =?utf-8?Q?KO6llVpGNF2GOKz7KBtgmy6pauCYp+J3dxULyGt3Tg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c5deaf-3b08-44d1-211f-08d9d6bac808
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 17:33:16.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Bpfo92QJQRcyyNH0wIDG8etrjHq/v5HPHsqVw9VwNRFXHe9JBB1/IMZu2Yqg8TesmPUsD5c+ZPLSSsJxGqQ5Q6O6UCBnTFms9rw2Hz0DoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/2022 15:11, Matthew Brost wrote:
> Add a cancel request selftest that results in an engine reset to cancel
> the request as it is non-preemptable. Also insert a NOP request after
> the cancelled request and confirm that it completes successfully.
>
> v2:
>   (Tvrtko)
>    - Skip test if preemption timeout compiled out
>    - Skip test if engine reset isn't supported
>    - Update debug prints to be more descriptive
> v3:
>    - Add comment explaining test
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
>   1 file changed, 117 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 7f66f6d299b26..f78de99d5ae1e 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -782,6 +782,115 @@ static int __cancel_completed(struct intel_engine_cs *engine)
>   	return err;
>   }
>   
> +/*
> + * Test to prove a non-preemptable request can be cancelled and a subsequent
> + * request on the same context can successfully complete after cancallation.
cancellation

> + *
> + * Testing methodology is to create non-preemptable request and submit it,
a non-preemptible

> + * wait for spinner to start, create a NOP request and submit it, cancel the
> + * spinner, wait for spinner to complete and verify it failed with an error,
> + * finally wait for NOP request to complete verify it succeeded without an
> + * error. Preemption timeout also reduced / restored so test runs in a timely
> + * maner.
> + */
> +static int __cancel_reset(struct drm_i915_private *i915,
> +			  struct intel_engine_cs *engine)
> +{
> +	struct intel_context *ce;
> +	struct igt_spinner spin;
> +	struct i915_request *rq, *nop;
> +	unsigned long preempt_timeout_ms;
> +	int err = 0;
> +
> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT ||
Does this matter? The test is overriding the default anyway.

> +	    !intel_has_reset_engine(engine->gt))
> +		return 0;
> +
> +	preempt_timeout_ms = engine->props.preempt_timeout_ms;
> +	engine->props.preempt_timeout_ms = 100;
> +
> +	if (igt_spinner_init(&spin, engine->gt))
> +		goto out_restore;
> +
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		err = PTR_ERR(ce);
> +		goto out_spin;
> +	}
> +
> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
> +	if (IS_ERR(rq)) {
> +		err = PTR_ERR(rq);
> +		goto out_ce;
> +	}
> +
> +	pr_debug("%s: Cancelling active non-preemptable request\n",
> +		 engine->name);
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +	if (!igt_wait_for_spinner(&spin, rq)) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("Failed to start spinner on %s\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_rq;
> +	}
> +
> +	nop = intel_context_create_request(ce);
> +	if (IS_ERR(nop))
> +		goto out_nop;
Should be out_rq?

John.


> +	i915_request_get(nop);
> +	i915_request_add(nop);
> +
> +	i915_request_cancel(rq, -EINTR);
> +
> +	if (i915_request_wait(rq, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to cancel hung request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (rq->fence.error != -EINTR) {
> +		pr_err("%s: fence not cancelled (%u)\n",
> +		       engine->name, rq->fence.error);
> +		err = -EINVAL;
> +		goto out_nop;
> +	}
> +
> +	if (i915_request_wait(nop, 0, HZ) < 0) {
> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
> +
> +		pr_err("%s: Failed to complete nop request\n", engine->name);
> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
> +		err = -ETIME;
> +		goto out_nop;
> +	}
> +
> +	if (nop->fence.error != 0) {
> +		pr_err("%s: Nop request errored (%u)\n",
> +		       engine->name, nop->fence.error);
> +		err = -EINVAL;
> +	}
> +
> +out_nop:
> +	i915_request_put(nop);
> +out_rq:
> +	i915_request_put(rq);
> +out_ce:
> +	intel_context_put(ce);
> +out_spin:
> +	igt_spinner_fini(&spin);
> +out_restore:
> +	engine->props.preempt_timeout_ms = preempt_timeout_ms;
> +	if (err)
> +		pr_err("%s: %s error %d\n", __func__, engine->name, err);
> +	return err;
> +}
> +
>   static int live_cancel_request(void *arg)
>   {
>   	struct drm_i915_private *i915 = arg;
> @@ -814,6 +923,14 @@ static int live_cancel_request(void *arg)
>   			return err;
>   		if (err2)
>   			return err2;
> +
> +		/* Expects reset so call outside of igt_live_test_* */
> +		err = __cancel_reset(i915, engine);
> +		if (err)
> +			return err;
> +
> +		if (igt_flush_test(i915))
> +			return -EIO;
>   	}
>   
>   	return 0;

