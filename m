Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AD49325E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 02:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2AF10E35A;
	Wed, 19 Jan 2022 01:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9066810E1EF;
 Wed, 19 Jan 2022 01:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642556251; x=1674092251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RnxPRpUSlMIHVDxCv2sxFzQAbFXF48GTz6wlZdi3Q5U=;
 b=QLm1lpujH3luAexRCEnIIseKRZ5iYnwOfzuJ0drmkh3R30kosg/VErx4
 iO3lQRQTTLTQIJLOkB33RMtU/ANpRwT2g7SCE+FqkGpBwzo9EL+NfWy+z
 coyYaEk0Q+T9hsLljGwmQw9dbS3nNUFkSxirvg3pKyseW4mLJIMJOdXUb
 leJvOZ+Wmbod0f5AI5BA5XEz+eueHmWzY4AO1GZU6NfmW9P6dIet/3XnP
 1MN25vR8jyPIlVbCwwrmkI3xo+zqvWsyy3VlAK3+ih+JIOiz9P98TIYGq
 7iZ/374Y7THqInBRRCDUzE0BktHXNQ/YxHGv8rghJT/wontGgX2SO1yfw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="269344344"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="269344344"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 17:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="532042893"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 17:37:27 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 17:37:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 17:37:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 17:37:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 17:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmAoP3IuYlcZMUVco1KAAGPgbCBXtDYD7c4zkctYz0pzTxmbqw07UCR2IgIb59JQtkLYruBEmDGXerSTEkPB5Q2bHVbqAsxJwu4vl5x2XKGBCfcKD2YW2ORiChR0ZWwTE2FyEI5b70/TtFeeBvwMAEIioqVtTjar0xNY/dwgg1IsMJ+JdMK11RwANbJVmOnJkNViiT2IDnloGsKUpA69uqn/UsdiqUBrdvfz0Q+2hXnLFsRkSl0UvcKiOxLCcOc9t4ZRhSbDmG3ah7baQ8sc7GDq/OdCnqVtxQjnH4ddLBo68pbjFNLDTCdOgyY5uMYRvyKoUmlUmglETla3w3I6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zffKYypsAVddtFO8xueX4prhQ0iEVOpqeDkqwmv/B+c=;
 b=R257WLbsSxk7WfQhNNFpUk0zC1KcO58L73wKPiHZD9LZnyxUKhe5kKw/jb3HGc2/QP17hhmPHVV1P1foY29rGF9QNA7RbuijNqRKoLmJsJ5/BrTza7YRdv9uP6w8yscV/2l5PDya/Gq+7BJh09M8MqqQnt4DikAv/uyXyHkbojC7jnpGrPzDFkhxCYlx/LIkPywHaMHdoptPckzYI8Uc29qg/6siXWRRJi0XeOZo5SfuMBkJomPwdSJObyhLRaUGR8D1TAQ3thgVKxS82Auu9SlP0ppYkT4ZzqmcLxJ+I6+6H9MEqTlyo5ktQ2fxcMuPY77fpX/Y4PzWGs/SC2Ifew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 01:37:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 01:37:04 +0000
Message-ID: <50355add-0758-c4cc-df74-a6bb329ceb15@intel.com>
Date: Tue, 18 Jan 2022 17:37:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220118214357.33740-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR19CA0072.namprd19.prod.outlook.com
 (2603:10b6:300:94::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a94fc9-d801-47de-fc49-08d9daec3243
X-MS-TrafficTypeDiagnostic: CO1PR11MB5153:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO1PR11MB5153D63ED5B2FB593FEBDABABD599@CO1PR11MB5153.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NguJ57sPOqRvwnC4+Ie9bp/VVhqpX9DwDMZNZ209t1fKe1PD5Itb1lIrZ5FM4MgnlGzM61o+HZb5p67hmb6tliqI2EVmp67sK3WERUwLwfiVdj9Qq6Uo/8Lc7Bc/u97oRbwTKqXh2cbTqv48AmaEDa/sBiAXNqUveTiOSQ7CoFLwJou+qpEK++YIaAEoCFhHw7o7Np6XFxbCMFv1RAK/s8jT/0zggohH5yGcdmMNbvCzrIzVe2OwXYIb9r1mFQC5H47iQt54P0bOntqjHPd+z44XC8ri16OQtTnkqmjLiAJ6LBFvQ40PQKvWGGgq5b6lzPFkg+Orq6gwQXGeNsYCou2FwjkvJP/QanHH+0O+qfhsaZVzhtS2gF/9h1r0Y8/e5yEOp9EeteXBr0GqphnCMhjbi28PoasTxSy/Db/+ReaQD4PGeEzUK9uCcrZCU2pqAeOoX5M3ilmIi3UIX1B+fpbfa9W8omRbw7Cx9FK2gAR9H9mWI2b2nWUe9PfL9A8ks+W+12jy0E0J63QaVj1I5NYe31E7CDm4wmiBVfw3bzJIEyfc9nxmVdL9h5QXe82msUn6L0n3PBvQAbh1xk0BvU/xV4tmO3GPQV9ddyeelxzxtpTMILZt98jSBFxfZ/S5QnbGAptZgK0Jb9hBUqJ5kof9xfXmfNypBFQYelZalVy0L2LHxuwG/qKpRTANzx44sSw5ezzv19L7eT4lF2Imi5lluu9l56iYiHTJNf4Eak9JmoGDKFBodEHCxr8EqMRU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(86362001)(26005)(6486002)(83380400001)(6506007)(53546011)(186003)(66946007)(66556008)(66476007)(5660300002)(31696002)(6666004)(316002)(31686004)(38100700002)(82960400001)(8676002)(8936002)(4326008)(2906002)(2616005)(6512007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJLRVFWRVhOQmxDeFo1d1BTa2YvN3RJUWZQbkEzWTJQYTV4b2UvdkVad2NK?=
 =?utf-8?B?TXNDMDFFd1RGUnIvRzZkTlhneUNRN01HRlFEbVN3QVJwR000UE1JY0h0TTBn?=
 =?utf-8?B?NEVwOVhqUEIvYjdiZGdhUHZHTnNMMHlaT3FERTgyMmEyTlBaNDR1cnFNaXR1?=
 =?utf-8?B?aXp5VnlrdEViQWNXcGNlWlB1MisyL2djWE45ZFNkOTVBbGVjTXdWVE9vOHZr?=
 =?utf-8?B?N1k4QUMwT2RJMENLMUtQcUJwQVB3MmVDS2dvSnB5empBR2E1Vnp4RW1mYjNE?=
 =?utf-8?B?T3NzOERhRnpwaEpleC9pQXlQQVBtOHpZR3luRmJNQVd2WVorZ0ZmeUZWTk5W?=
 =?utf-8?B?bUEzS0U5ZUdXTm5KOUJqcUpSTE8yak9pd2xWTXYyT0xNOWdLV1pZU2ZaYWV5?=
 =?utf-8?B?S3hqMEhYMGpsZUg3RDJqVWM0WktIeFhlWUlsSVdVRjVpenhuY2ZnMzdoNXMx?=
 =?utf-8?B?UVZvdXZ4U3J4MkhGS2tENjNzU3JST1pQUzRPMWw1bHJMYTBkcWdmWmFqYTli?=
 =?utf-8?B?R2RLeks3Z3JJRFdxdlR1WmYxRjFMMWdONHFEN2twYTA1bHNwTDZ5UW5odkJp?=
 =?utf-8?B?blNVT1NobkZFZmRHSFBkSWJBM1VERmpwR08xZjdXRzYvVDZrSFNpc1VCWDZy?=
 =?utf-8?B?Um85TW95WDIrcmcrSUNGeW81RVVwVHFlZ0cvSGpNTTlTUkhSVlZ6elRmdnJn?=
 =?utf-8?B?WjdOUFk1dlZWd1FzZTZBQnFUQzFuN0lOMWNOaEI4WWpzRXl2RXBodlByWUJm?=
 =?utf-8?B?alZ3K3l3cmFZUlZVMjFKSm1HM29aWkxiYjJqNGxJaFRpajdQbFJNVUc0R25i?=
 =?utf-8?B?eVYxdXdhdmpjU29iaG5ibWNUSzErWGsrL3JQc2hpaDIzc25aVDl2cm1BdC85?=
 =?utf-8?B?TGRMOW1TRmc0c05kOEJnTGNSek9aUFh6aWVzbnNoMzNBaXEwOC8zZlljdXFX?=
 =?utf-8?B?M0Y0OVpubjlWWUxUMTVBMVBKRjdmMk1CejFWVjhvSWZ1cjZPQlh2d0tMTjc3?=
 =?utf-8?B?SEFDZ0lhVytZSXdpVHBnOFhjZjFtNHdNckExNUlFeVZBS3JBK28raFY4cFda?=
 =?utf-8?B?dFlzYnFIcGFlTTZrbUtEUFVMYWRTTi9MQWZLOWhocFQ3cGhHSjhxKzdLeFYy?=
 =?utf-8?B?Qjd4TEd6bmVBSXF3a2dkTmxtN3BsMFh5aFlrZHJJRnpMNG9tamZVSGI0dld1?=
 =?utf-8?B?NkxqNHZsL2lsekpRZGxIdjVOTXpaUDczbmZmVHVJdDNiYWpxd2hObC9SNERM?=
 =?utf-8?B?cWs3STIxQVg2M3dmMnVSTXZIRzdqMG4ydG9TK1JZSTZOR2NacnhEdDlkbG1j?=
 =?utf-8?B?VzEvV2x2WHJGWjdLOGRpTUw1eVZhWitOL2pzako4NWhnSURmNjV5VnB4MFZq?=
 =?utf-8?B?QUVXY3JlT0hnMzg2WG45RGZtVVJSTGRFU0hCQS9WbEVPSVliaDU2TTE2Skpu?=
 =?utf-8?B?aXhHeHFleS8wOUtOOEk0M0s3ODM5Q3VSZmREWVJjeEVUME4yZ3h5eWd2Wmps?=
 =?utf-8?B?TTUxVHNPa1R1UUxNb3RKVGpkcE9zUHY4Y2V4L29paHpYcWNDcXZyYVZUMklr?=
 =?utf-8?B?SDZLYUlQZ1hJVTczelJUbXpBU2UvZzJQdHZuWlV6VmlidlBKcExSQ0NVUWFD?=
 =?utf-8?B?WVpRZ092cWRWbWJxdHRCUEt2N0xtZGVNUnAybTZ6OWI2K1E0cDBpRy9qcXhs?=
 =?utf-8?B?SC9sYVRMZkNIbHhWcTJ5TXJ2RnE4c0d0ZGZCZHBLUXNsVGliU2dzdyswZi9i?=
 =?utf-8?B?bmNLT080N05QR3Uvdlk0M2IrZDN1Wmpod3krdmtCSFpZMTZsYk9rM2RIeWRF?=
 =?utf-8?B?WHN4alZwMkVDdnhYWFNqTWRhTk5SUTlseExtSjlHakZJUzVTRkRRLzlXVXVP?=
 =?utf-8?B?TVByZTRHM0dPakhkSEtpeVYwWTlWUEl2VGRPZnJtelpVTlFiZHZBTXUxNkZq?=
 =?utf-8?B?NlU5RnBYR1g0SzVpQUgxQXRQZ2dsSkpUZC9uZ3lYaGpMeHFQcEd1TnlWWXlz?=
 =?utf-8?B?TWVzaUtnbys4UG9LZVpGWUdmejhCQXNPSUo4WmFJVDQ2OTM5d0JYYmVHbndQ?=
 =?utf-8?B?bmtMMmEvVjVCc3hVSHlNMFVIck5ocUpVS003eGIwZ09lQjA4eUljYXNSUkpn?=
 =?utf-8?B?eUVyWjY3RkdWeWJJem5tNDNPY0dCd0kybTdjRjRJLzdaK0R6bTBROGJ6bnM2?=
 =?utf-8?B?RG5jdFc1MkFqU0k3TFU0WVBKNzJtVWFwRnhRQUtHTzZQQXFNcW1QVnNCSTNE?=
 =?utf-8?Q?MicDVSiVVKvAQWRWN65aewHiF9mllf6qaE9yHZb/jU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a94fc9-d801-47de-fc49-08d9daec3243
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 01:37:04.1964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgqEUnuwsZRWHwJkhZ4G42q/FjsF3+EZTPoZxqQzLUzxVls0ylVvqanUQquOxJ/to5CQ8KPBKyotFzyMExOatZgdef31q+XPIKB5GK08Bmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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
Cc: thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/2022 13:43, Matthew Brost wrote:
> The G2H handler needs to be flushed during a GT reset but a G2H
> indicating engine reset failure can trigger a GT reset. Add a worker to
> trigger the GT when a engine reset failure is received to break this
s/a/an/

> circular dependency.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 ++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 +++++++++++++++----
>   2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 9d26a86fe557a..60ea8deef5392 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -119,6 +119,11 @@ struct intel_guc {
>   		 * function as it might be in an atomic context (no sleeping)
>   		 */
>   		struct work_struct destroyed_worker;
> +		/**
> +		 * @reset_worker: worker to trigger a GT reset after an engine
> +		 * reset fails
> +		 */
> +		struct work_struct reset_worker;
>   	} submission_state;
>   
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 23a40f10d376d..cdd8d691251ff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1746,6 +1746,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   }
>   
>   static void destroyed_worker_func(struct work_struct *w);
> +static void reset_worker_func(struct work_struct *w);
>   
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
> @@ -1776,6 +1777,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>   	INIT_WORK(&guc->submission_state.destroyed_worker,
>   		  destroyed_worker_func);
> +	INIT_WORK(&guc->submission_state.reset_worker,
> +		  reset_worker_func);
>   
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> @@ -4052,6 +4055,17 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
>   	return gt->engine_class[engine_class][instance];
>   }
>   
> +static void reset_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.reset_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	intel_gt_handle_error(gt, ALL_ENGINES,
> +			      I915_ERROR_CAPTURE,
> +			      "GuC failed to reset a engine\n");
s/a/an/

> +}
> +
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
> @@ -4083,10 +4097,11 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
>   		guc_class, instance, engine->name, reason);
>   
> -	intel_gt_handle_error(gt, engine->mask,
> -			      I915_ERROR_CAPTURE,
> -			      "GuC failed to reset %s (reason=0x%08x)\n",
> -			      engine->name, reason);
The engine name and reason code are lost from the error capture? I guess 
we still get it in the drm_err above, though. So probably not an issue. 
We shouldn't be getting these from end users and any internal CI run is 
only likely to give us the dmesg, not the error capture anyway! However, 
still seems like it is work saving engine->mask in the submission_state 
structure (ORing in, in case there are multiple resets). Clearing it 
should be safe because once a GT reset has happened, we aren't getting 
any more G2Hs. And we can't have multiple message handlers running 
concurrently, right? So no need to protect the OR either.

John.


> +	/*
> +	 * A GT reset flushes this worker queue (G2H handler) so we must use
> +	 * another worker to trigger a GT reset.
> +	 */
> +	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
>   
>   	return 0;
>   }

