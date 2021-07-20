Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B73D040F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 23:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD76E563;
	Tue, 20 Jul 2021 21:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8567E6E560;
 Tue, 20 Jul 2021 21:47:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="272447855"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="272447855"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 14:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="661667327"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2021 14:47:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 14:47:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 14:46:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 14:46:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tepy8ywbarCs5CMbqGV3ljBC9g8YKxebwM3hkoQQsXodn32m8AsL8jahUAiESghneBg8kal03J1jniFIdxImsDLqMKUpO/1BOv0H1PXn8VaBzVrVpcJbW2TteGh2L/YUNVOZV0ZRUUnAsgyOqiMgTJ2K65F/cUBlg4/B/Y39uEisleHDRf9qfdvJOMadho7Ujd0PvABQbypHUS7f3vst7J+C5KmQdlHN0OmqqZRzldvZAnLHb2F7KEr59Y3+7i0U+2mxVfmy7ivxaG6038/agZm/EIOH9+pna8laoNeRP/3/wXa8jU1BK2LHRKCwJrkFWQH7Sr7o8wu47JuIeDSodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjW2hSWuvEYN2QbrWGOnO4/3A1kI8fy/0tbVR3iVxEo=;
 b=X/ezSmbSNv9VYaDjkG4Llu4ekGGQw/B/iB6pDBhlsZmde1kgF0C/naRwNy+9fOoQR1CN9lR9ofguk1uI76VbhDrZseIx5LhNZkfGDhWhSY1byZosmMDKOuyZrZU8KetMncb0g4V11ayNyquZBBpwm9YvrDe7Wm4mwCm+GJXhpKJ4UIXoqKnqKwO8xO85Mhrm8Wh7CKz/HlN+nnqlFOjzsibe+Nxvd0gARBYUzsjqAkCpmt+QFaAHIBD/sfnfnMmp8Mh/6ItUqCRjsUja72KmTWLk+u2xdWB/DpqdPN51fPm2VhgIAs/m0A6XVvIeMTPb6xWchugRjdzu4dQyaIj5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjW2hSWuvEYN2QbrWGOnO4/3A1kI8fy/0tbVR3iVxEo=;
 b=P7rzfNgU1x5NwgjBkvU5VX/KjiRibEetPt8U0g00RXyt/t5Va9GJQAsDmqirFPSkE+m+UepJ2Jlfh10N3EDZCqXb5NOyXooNOIv9MZ7AOuoi9p3IRUbVcy2yI6bIE+epPP+wZxyMg6IyMJMYlx9rfkGaWmh4OOvHCEdiJXW4I00=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 21:46:56 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 21:46:56 +0000
Subject: Re: [PATCH 47/51] drm/i915/selftest: Increase some timeouts in
 live_requests
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-48-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <92494014-1aa0-5109-903a-9a78faa0d092@intel.com>
Date: Tue, 20 Jul 2021 14:46:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-48-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:a03:39e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 21:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7e18ad2-c462-47cb-8c5c-08d94bc7e4fc
X-MS-TrafficTypeDiagnostic: PH0PR11MB5675:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5675CA5BDE556795E7CA4A36BDE29@PH0PR11MB5675.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQb/n44Kzt4fdyZINj7r6P+dlW4TrrF3EyQAF+hgXeiqzdsBqqHMOD8uYwKKSdn/uf4jkMywMCcEP1gixh3902Vu9gFAvYR8gm1uwZMW1H5PNxvZ71Zbt5zPFO1sJlJVebz5gfhIildHRmVc2yK2NWHs0aLBGS6+53ry1iPVKwLBJCXjPQ3zhPGG4E1CH9HHiekH+gQR6niD1TS9EEu5UMJFx8szoPCcsXYd8TKwr0j0atnM27vGakLb4f5BVq6hsjDmOK8AAtK1fXCR51pgB19mhv1LhrZxJ+9hpteIpNQdkHy3Y7UJmzsatIDst0YHMfOJbl4vqKKlrO/9vSzfdlbVLAPBHCHrWL5ouHCTvpySf5uS7V/qkOENEOqVjx1UkoRVkJx9JFDnHeSCtKYI+XoimhjY5AxQy7V2BkSvC+RZmHkMn8enyQhPPaRZ2JNzjkyNNnPipqM8KbVtkBpguy7ER8ULRoIhRPTTOr4kwRcVmeCxHHHQK/Pg86LlFRR2TTE6WCzcrGUy8YS2ZTELJWVsurQ35jrs+gheJ+MeQYYInVXnvq8GlYj2QnMmwI0BR7d4vOVGUyeXeduycF8DW7CFZEHmMgqhydT19ZRpDnwCjgN+7gNGvwnxQah6ml7wLOSjBp8f1CDReH9+JShpl1wxMN/ie9L1n2muAcBMZ1L/CRpcElml+BkgEdLGMHyym6bd2v7o8/V9p+PGwH0eNEUC0V0NdSu7AZ+b1q2XXnKH7QZflj3qj0+kreuF/3Q/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(4326008)(16576012)(38100700002)(86362001)(107886003)(26005)(316002)(186003)(53546011)(31686004)(83380400001)(5660300002)(6486002)(66946007)(31696002)(66556008)(66476007)(478600001)(36756003)(2616005)(450100002)(2906002)(8936002)(956004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejR3bGY5bXd4dDhrQ2NQYlZCVGx3dEdRM3E3d2REZ1JqR0VyTkdPTnZjeDFt?=
 =?utf-8?B?ZEY2djFGNXppcFpxYjFpRlNlbFVaNGRJanpGTjRNUk9WS3Rhb3hoTTZaZTUz?=
 =?utf-8?B?OHRxWVo3TGloejZKSGpobk8yS0Q5TGIzNDRLaGsxVGozZStBTlNxbXVIUGZ2?=
 =?utf-8?B?eUFxSjA0cERMQlBReTUwczBHYlFXaXZFcXZTTnFSYjFacXY5NU9lWHJraDVU?=
 =?utf-8?B?WDFwMnRWTG5QM2hyWmFBUFBZcWFCelNibHk3SGJndHlwcHJNUVVDSnBaQUo5?=
 =?utf-8?B?a3JjUTV1OFZTSjBhdWptM0JYTU1ERDBkVlNwY0dON29sdTJtUVlEeE9TSmt6?=
 =?utf-8?B?Y25iTzZ3MjcxZGsxVi84WDNzVkRyTjlKaGFjQ0J4cHZGVEJvS0pnVnFpNlBE?=
 =?utf-8?B?WitPbEx5U3k5N1hZc2JTMXFQaDg0dWxqYzFidFV0L0pXdW40cDJZM1daV3Na?=
 =?utf-8?B?c2JpRWVNeUFtRUQzenF5Nmk0TjVqSnBhKzFKRyt6YkQ0cFVlK2lTYWpuemta?=
 =?utf-8?B?TDRRQ0xoTUpnNWowOEplVVR6VnJqWW5TdnV1aFNDWm14S2hRNlpkeWhRZ2NZ?=
 =?utf-8?B?QXhFY0pTanplZ29ialY4VGl1ZmZOVmd2OENaUnVFUVBmUDhsTTJJU21kMWFJ?=
 =?utf-8?B?aFVLbXVMVkFZcDc4NGVkYytQamNlVUVqRjdBMU52SE9BSnVDWmo4MXlYLzB2?=
 =?utf-8?B?Q3FPSHFQTzFyUWtGOEFCOEk3Z01Xak1YZ3ViOFZKQys2Rm8ydTZadHRwRkxn?=
 =?utf-8?B?R1hmZm9iUE5abEI2Z1BIa09FaC9wZTJUSWhJZ3F2VjRXWUozZ2dpcXFRdUph?=
 =?utf-8?B?UW8vbTVTRCtZT2VhaTFuS2hGbjJSVlNQVGQyTzdOZ3dET3VQcTg5M293M3g0?=
 =?utf-8?B?bUVrMkhxOE0zdG5BYkxRRGxCcmZ6ZUpBSUExTiszczh0ZkJRV1lZL09adjd3?=
 =?utf-8?B?Z1AxcmdQYW5KTjIrdmFZN1BuYzd3cGRnbDZLM1BFRjlJd0dNTnNOZUVNc0Z4?=
 =?utf-8?B?SFdVd2NOTDRKWjdTcHI5eFlHU1h6N2FBOE9lUHU0RjdVdHdVN2hZYXpEazIv?=
 =?utf-8?B?bkttQWVkalVoTlZ6d1RhRTlIVzlxLzBvU1RweW9HaWd2dGs5bnZZVnVZb3U1?=
 =?utf-8?B?REs4dHNVU0ZYOEpnT2N0bEZXSklUVUJGd3AwWkV4L3o0a21XcWJGN2MrR1BN?=
 =?utf-8?B?Q1QvdWp0Y3N0ZEFiMW92aDdvYldxZzZhRzZkWlp4bHVPOWI5VUlmUmhXVU51?=
 =?utf-8?B?RzlBTW1qMGFnQUxZa0lyc0I4aHRRWktJMU5rK2wyalN6bm5URUQ1RmJsZ0lt?=
 =?utf-8?B?TGxXMDVSajR3OXdGMVh6Nnk0SDBhRC9iK3g2Q3d3QXR5OXJKUDhiUkxqSVAw?=
 =?utf-8?B?K29uL3JBemNITCtOOXNmb24ycDdwbHR5U3FaN3EyTWE3Qk5xRVYzQ09sWU5W?=
 =?utf-8?B?ZkMyRys1aFRWRUdNc2QvT29vOE9TVE5mOHM3Vm8wSVhIaW5mTk53dTUwOExi?=
 =?utf-8?B?RWJQRDh1SHlxa2lWTmJZMnZuM3J6OHZSUWJMeExneFdkSW5lbzJXK3A2Wll5?=
 =?utf-8?B?VGtUTzcrRHJ4VUdJRjlwVks2Z0Uya1BSVitlR3Y0dTNCUzhENThEcmFYdTlJ?=
 =?utf-8?B?aVhKRWRIN3FMVm5WNEowQjdDVFBEamltS1d4emFXbWxPaHRCVjJicFk0bXJr?=
 =?utf-8?B?R2tlMTBCcFhyWmV2OFNsZUlZVFdjU29zMmFKN1hrTzNMNzM3TnQvdWJFNEd6?=
 =?utf-8?Q?uSqCMAxBigDNRfJ5vKFJ3JpFOfhCxy5kC1ecSZL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e18ad2-c462-47cb-8c5c-08d94bc7e4fc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 21:46:56.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diXTdL/51+TpbGYVDUxtq4Xogci6ou/Jg7JfAThk2wRwf+wOHb40Npi+s/hSf6b+l2/Z8DafSOI553VkHFoWQvP1dlQa/q3BTEtSAnnO9X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
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

On 7/16/2021 13:17, Matthew Brost wrote:
> Requests may take slightly longer with GuC submission, let's increase
> the timeouts in live_requests.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index bd5c96a77ba3..d67710d10615 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1313,7 +1313,7 @@ static int __live_parallel_engine1(void *arg)
>   		i915_request_add(rq);
>   
>   		err = 0;
> -		if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +		if (i915_request_wait(rq, 0, HZ) < 0)
>   			err = -ETIME;
>   		i915_request_put(rq);
>   		if (err)
> @@ -1419,7 +1419,7 @@ static int __live_parallel_spin(void *arg)
>   	}
>   	igt_spinner_end(&spin);
>   
> -	if (err == 0 && i915_request_wait(rq, 0, HZ / 5) < 0)
> +	if (err == 0 && i915_request_wait(rq, 0, HZ) < 0)
>   		err = -EIO;
>   	i915_request_put(rq);
>   

