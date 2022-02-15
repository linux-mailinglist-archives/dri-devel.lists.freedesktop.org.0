Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA34B70EE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEED10E4DC;
	Tue, 15 Feb 2022 16:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C4810E4DC;
 Tue, 15 Feb 2022 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644943191; x=1676479191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K7K4twwNStsLP/u1g9uMpSvYPpmTRukoce/sOw2OmcQ=;
 b=HkXvH9z5y+N2fs4zJBaS5/7KYSSyNxEG8u1tgv6wo63QJJTIZ+0jfMvD
 i1YpCtY2QICeXIxc2753ycQcGt05ik9OPVKy2PrjqTID9glSwa7hrbxEA
 f0Um8ckQP1rpujG5mTw2lua4ID9/gwkkpJLRNLphi0ILvEkNYwdvnFe/H
 LhOPNkEozpPvNbKG8CyHN7kEQvENrYeZ6VLcVs6t6ri2V7g65EeRIZqYn
 hvtGlTmumk2qDpH96MnngTs4j58n8xiDs34yyH/plDCI2eBAc5j0J+9+l
 TSkAGUegzqhkg7lCtugVwOXVYs1rLOQ9qCEyGPe+t6ZAL132jxSL5754e g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="311130610"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="311130610"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 08:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="497288438"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 15 Feb 2022 08:39:50 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 08:39:50 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 08:39:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 15 Feb 2022 08:39:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 15 Feb 2022 08:39:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl2bv8d/uJsQx1YkNeo8mba0N8++EYmXhgun8yraJHAM1V5p3nnDv2qt9voUAy6Vc5TmCt+AfB/+L9ymzk3C4MyFJWZBC3GF8644t31BGp9kQpQAqxr5GRtF4N0pU/Eszpw3c5H/AgzG68bRyCrWJUbDeCixJ+p7reLzkaAbJgzbFfsIaVCzHrMem020ORg3/isvt3m9/5pgbxQXq2Nf5mUeCm7xmqhwDfcehJL1Er8Tx2ku62uQCZhkrc1LSf9Htt34Ki3X2Nrx0zEFGIXdHctmA6sidFsaMLTFq4jsik/qUSAppVPt4d7niHTwi5Oa5cpkKLPSZ63yvjQXvqYfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RME+eLRkSlK0+w0ha9h63oC1B/Y0eefpoDWF2n0R0M=;
 b=AYrRCXV+ddz6NNzW6AGDO04dvkQ5IP8zjV1SdINGKYKjG/xNVF6oD1G49Qb3Uc/wN2fKPzU4xWebI9AQb2g5rSnpUvEtUKhhiv4FjcjGTmUJBXSpTfBwUaegdqSWN0MQ6i/npIxROY/MFxi/HFlDzqs+nBrgTJ7qNU+dUmSQ0IRQIPOKgv8/J0VPcElphhpVke4VQHXfVyfNOSJLPxMud95pmg+m4mQIcLyv8rCFuLYEiRzAamWFFloznGXiwH4Wh41xJpIFD9yQXxDbj5saPo7nu5Cu+OaG66b+BQUMsPgLfAOfmktMcv6GsgFQY8W2Swn2G10M/3SprzxENm0WYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN2PR11MB4062.namprd11.prod.outlook.com (2603:10b6:208:150::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 16:39:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::ed44:f436:839e:c501%8]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 16:39:46 +0000
Message-ID: <02e89fe1-a97d-1587-ea78-1e3a4518c649@intel.com>
Date: Tue, 15 Feb 2022 08:39:44 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Initialize GuC submission locks
 and queues early
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
 <5de141fa-014f-e95f-7dc8-74d95a9c6b14@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <5de141fa-014f-e95f-7dc8-74d95a9c6b14@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e98166ca-830b-4dcb-95f8-08d9f0a1c6d8
X-MS-TrafficTypeDiagnostic: MN2PR11MB4062:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB4062A9DBBAA5B19F3B4438D6F4349@MN2PR11MB4062.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAGu+1H4kMlIr5RCfBK0fNw3VliJgHQJWwP+JLWKiYpQIL8s2KnXbOBnojwX7KBiVOg/2dHcvX33i2Tx/qjdJFkF34f5eJqhdGi4q9NRy+1jheyaFvIm3iHtVsfa+c0cG/DMp9QeeRltuZEsXlDzw18mpoH+lA3VbnJyR15Dyi9zNeH+29IqAlEf2E6hPHE3/YWqH2eIGI27DjiQEImNTJIFkOpJnTKjeDfvTtc+UEzlWIbt9wa6N0XzwQGCbhf/6VyQC42QpwxNRsXJK9FUXP5bTPpkFYjjjs3SYhvJNQTVjteeF8NESapY9z0zhdUtHPsdlDNimBPC9P0ahQ0UIjlP9yxaDmMRRoXW/I6P4bnq/+Xl4F8ET2gLFQl5nh/2OA45VoU+U0eLzMSTotqs2V1r2yNBuJvwvCf3vgM7RdJI/eh1ytxt6aI5EVI0PIMfkxtyi4xdLjNAvvQRwn8SBh/ylGP0XcZOxpRKwRjv75HOd5H2HuJj/JXy2ul+FmbTYhOSClIzL9ophDX7FK50i9dJZi3KpW2rz53OLHZ6ju37hIJiYhy5czXoT9o4VBDeBQi6TiPG73MbX9x9utrB1bFOWmPR8JBj9xCoitdyJVFNd+kXZEqfkVw37aa/XRYrC6xmjUc3DDUfJJncD1JIkMNoPybycy0/VlWzbz9J/BJOvQ1jZ4nCkViUuXZLERszK91Xyt9Llwxmo8pMBAVIEw9ZzQwhoV8UW/7pPF5GpNub1CFjW1RRs96LFvqxo+FW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(36756003)(5660300002)(8676002)(66476007)(66556008)(66946007)(4326008)(8936002)(2906002)(508600001)(966005)(6486002)(316002)(82960400001)(2616005)(38100700002)(86362001)(26005)(186003)(6512007)(53546011)(6506007)(31696002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3VXQWtWWDRVMCt1U1h4ZytnS1NQWW14UkNXeU85aTI4Lzd4TENUb1d4eXpB?=
 =?utf-8?B?L0hMWTgrV3J4SmNPVWRzeE9wMi8wenNQeDdnSk5hVTBHTElQQnNJbFdXTWFk?=
 =?utf-8?B?aG02dUxWSHhBczJyV3piSEZkdVN3WExsakJxQ0IyblNWS3R6eXp5MnVuWnNR?=
 =?utf-8?B?WTFEQmZBVGpZZ2g2cGF3Y0JGU21QZjdqVkc4NER2Rk5DeTQzcTIvWXBPVitB?=
 =?utf-8?B?WHZuMDdtWitXanpQSUlvSVJQOHZLN21ubTRpRVAwdzZyWDJvbzFwN0dHelNQ?=
 =?utf-8?B?UkU0ejRKRGNaQVExR3lRZ3Rla3YyYmNjeGx5Q3hxZi9wY1EwSFJ6VjU0Zkh5?=
 =?utf-8?B?TCtDUzRPRzh5VUpibENGWHRoa2FGakRVVFlLMW1wbTFzRVpYQ2N6bVczdWg4?=
 =?utf-8?B?R1h2RTVuMkkzWGF4aVVZKzVCNHFRZlBVdHVSMWVhbmRRT0JkdVBzc3ZrNkNa?=
 =?utf-8?B?ZjdINHFGQ0VvUHdsZG1oUFZDWEo5LzVDSnpSQzdIZnc5UFUzRVNzUlJrTlRy?=
 =?utf-8?B?Ylc2Q3pKWHJXM2ZvYkhDL1FaTEd3aE1NTTV0U2ZpN09UbnV3Z093aXFJVEVN?=
 =?utf-8?B?VnRLVTN5YXNzZUpFK3d4dmdSQzZURnNaRlF6MTdnUGRxYi9UMVZIdzhKb3Ja?=
 =?utf-8?B?WXp2L05RdUUyUWpBUEhjcFdwM0dPVFd6aFpsVzhmakIyRDIvTFY3MU95TDUz?=
 =?utf-8?B?T2VOTmQwck5Db1FUU3k2bDFPcmhyTEdIUkx6YXBlUS9UYys5cUNXdEtzaWRH?=
 =?utf-8?B?SnVoRXVDcnQ3Ky81TWZOcHAxSHBPc1J2M25CT2lvNk5XN0Fla1BaVDlGcnNm?=
 =?utf-8?B?WkdrNGMzTCtqV0J6blRnSkxpSjBDc0w4Vi9wanFxQnBZY0NqbTd1N0UvZStR?=
 =?utf-8?B?WWR3QnNsSkVtY3JhT0NVVXplelA0ZlJxK3BWTXY4NmV3ZHJNdjUyNEF1S2Zv?=
 =?utf-8?B?ZXF5RjdTcjY0NmtxK3RjNkt5U2x3MzlHOVF4V0wzVUZvSFZoZE1COHdGR0Rn?=
 =?utf-8?B?ZEVZZVBiUXlVMDV4TGtaT2xvZmxoV2ZzeDVpcGRpa3JwbTJXY1JwaFdud2V2?=
 =?utf-8?B?OWVsNjlOTzlXK0pjbFZBRTV3dWVta0pNL01VNUV3djJCVXVqM1B2TXIrdFF3?=
 =?utf-8?B?MGJCc2RlUnV0NFhpRHBYR0hPL2xWYzFkK2QrZTdUM1pMeE1uRktxblZOem56?=
 =?utf-8?B?cVdPS3VZMnlsYkhhL21neGViNVBJVXNVM0MrVVdsVER0M2J5QkhTZHJUZkFE?=
 =?utf-8?B?T0gxYUFTYVZ0eFUycXR0U0VRbjNqYXppTmh4Z1o5UVUvTW14dUlTcmhNM3VU?=
 =?utf-8?B?bUFOUFg1ZEo0YWZiRlBIOEd3ekJtbU1FdGM2QkxrT3FJS2Y2c1BhajI2bUxB?=
 =?utf-8?B?WWdRdHU3cnRJamJ1dlBjWkpHQTNHZVQrZi9wbWdPeUdmQUFzSWw1K0VQK2tL?=
 =?utf-8?B?S3M4dFZVNithMnpteWR6NlhPeUNoWElYeUpZYnZSbXcxMC8reEhHUUpsQTFx?=
 =?utf-8?B?Tmg5OU8reUgvazhYQ2xNWjJpTUYydXNTVFA2TjZoL3BkanRyNHYyZmdodzRP?=
 =?utf-8?B?WUwyVnVaaUF4eXFVQlFxcVUvRHRRUUl0WFA4V3dFMC9sQVc3UDlHS3dTZ0Zj?=
 =?utf-8?B?Z083NmxMMlNwYTNING12Y1RWSUFoMnNLNWFLZXE4NmN1cjduSlYwM0UxZ0hZ?=
 =?utf-8?B?NktSRTcySVVpQTY5Mms0cEtRcUx5VlZiVmNqTS91dnVFeHVaWUp1bDJQSnpE?=
 =?utf-8?B?NjVGUTZmMnF3dkpITzhYbW1WMmwvaEF2cXFNKzhiYVR3b2hDL0VNOUtIZzB1?=
 =?utf-8?B?alpiUk1NbkY5NGV0RU1Vdnhsd0NGTHBiM0RMR04vSjJSRTZGS0lTRjNUTFZy?=
 =?utf-8?B?MDNUVmJ0NDNseXBlTFd5TE1rU0Q0dHl0QUluUkRSb3hiUmtxNVIzdmltcTE4?=
 =?utf-8?B?eVk3UmdwY3ZTbXJ6djhJcnlWT0JHUVFDeFVGRHpZQ2VmTEVES0dUclhaTHVT?=
 =?utf-8?B?U3lDM0IweDdPbHRpTG4xT3Vmbm5qbHE0RGZzUDFMQnJIcjkraktmeTNQMHgy?=
 =?utf-8?B?RHErcXJQcmxwd0d3OEdwWjU1NnJPVm1TQ3ROZHJPcWdJOHcyQWNSZFpiaUVn?=
 =?utf-8?B?N1VCM2dyb1NjNlRKSE4vZWRpSXZyNldhZllnbEtoR2JjOEJUL3FzN2picXls?=
 =?utf-8?B?MWxLcklyaTltNnpyWCtrV1hIeVM3eExmV0FFOGM2c3Y3dzB1RHM3NVo5R0Jz?=
 =?utf-8?B?VCt0Y2JBeUhpRmtkSTFQNFNPeGtRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e98166ca-830b-4dcb-95f8-08d9f0a1c6d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:39:46.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkYjRApmpJFsh2JLdQlopQxjrADA/SN6fbPW6UExDIU9HssA1yi3pdWzkBtsPDD32jAq6mVwy4yay54ZpBhUH2zCBmEenJohdWa9JaCyYHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4062
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/15/2022 1:09 AM, Tvrtko Ursulin wrote:
>
> On 15/02/2022 01:11, Daniele Ceraolo Spurio wrote:
>> Move initialization of submission-related spinlock, lists and workers to
>> init_early. This fixes an issue where if the GuC init fails we might
>> still try to get the lock in the context cleanup code. Note that it is
>
> What's the worst case impact on non-debug builds aka is Fixes: required?

There is no lock contention in this scenario and nothing is done within 
the locked section (because submission is not initialized and all 
contexts are marked as invalid), so no problems from the fact that the 
lock doesn't work. Is that enough to avoid a fixes tag?

Daniele

>
> Regards,
>
> Tvrtko
>
>> safe to call the GuC context cleanup code even if the init failed
>> because all contexts are initialized with an invalid GuC ID, which will
>> cause the GuC side of the cleanup to be skipped, so it is easier to just
>> make sure the variables are initialized than to special case the cleanup
>> to handle the case when they're not.
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4932
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++---------
>>   1 file changed, 14 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b3a429a92c0da..2160da2c83cbf 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1818,24 +1818,11 @@ int intel_guc_submission_init(struct 
>> intel_guc *guc)
>>        */
>>       GEM_BUG_ON(!guc->lrc_desc_pool);
>>   -    xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>> -
>> -    spin_lock_init(&guc->submission_state.lock);
>> -    INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>> -    ida_init(&guc->submission_state.guc_ids);
>> - INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>> -    INIT_WORK(&guc->submission_state.destroyed_worker,
>> -          destroyed_worker_func);
>> -    INIT_WORK(&guc->submission_state.reset_fail_worker,
>> -          reset_fail_worker_func);
>> -
>>       guc->submission_state.guc_ids_bitmap =
>>           bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>>       if (!guc->submission_state.guc_ids_bitmap)
>>           return -ENOMEM;
>>   -    spin_lock_init(&guc->timestamp.lock);
>> -    INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>>       guc->timestamp.ping_delay = (POLL_TIME_CLKS / 
>> gt->clock_frequency + 1) * HZ;
>>       guc->timestamp.shift = gpm_timestamp_shift(gt);
>>   @@ -3831,6 +3818,20 @@ static bool __guc_submission_selected(struct 
>> intel_guc *guc)
>>     void intel_guc_submission_init_early(struct intel_guc *guc)
>>   {
>> +    xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>> +
>> +    spin_lock_init(&guc->submission_state.lock);
>> +    INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>> +    ida_init(&guc->submission_state.guc_ids);
>> + INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
>> +    INIT_WORK(&guc->submission_state.destroyed_worker,
>> +          destroyed_worker_func);
>> +    INIT_WORK(&guc->submission_state.reset_fail_worker,
>> +          reset_fail_worker_func);
>> +
>> +    spin_lock_init(&guc->timestamp.lock);
>> +    INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>> +
>>       guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>>       guc->submission_supported = __guc_submission_supported(guc);
>>       guc->submission_selected = __guc_submission_selected(guc);

