Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7853D4B0968
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4C10E7AE;
	Thu, 10 Feb 2022 09:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE72D10E7A9;
 Thu, 10 Feb 2022 09:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0aqoRE7R8jm5NNJtSvID4/S4nafs+4rKG9ysy7mn/OE2wRFHSAIBjDyUGNE2v8zO2jdmz7By5wGonW8MPTDMx3r/LDc6+D4g1aeqcabyCzM7liUn4vxfhKST5XkML0SIalC2xtXCxQ1DvgVvJUAOxGFLxtjBrGOqCqy54nyTnoEKtFAl4KKbo5rJ7+unCmbm69QxuzaYdFQfwfLQUVDB/oCEpBoq09o9srlpqxEnbehjHHnlFiAqHAMNBg9K33z/1IMmbjBpmqCWDBpy/EMyjDMrStSFPRRNc16EoNxEpwgyKQgjXUBWjF3s3jUo/q1mhNjaxN6kzc0yz3zzJO+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFs08hKh2rHU2KHRULQT5WbM2fzzaMglTHEzvcC1gCg=;
 b=N/+sSaSqVydGNs8bYVk2I3SpJDeXXMnYR3PKr8ZzHrSxd97vlJycQyETdXX0HK8YvKcV+Dj+1YuOBAzwelxybBEnlkz4zaza4gZ0yZQ4FBDm0eQA1AUew4MRB8pDcpp7HRFZhAUoEsPOx8QZol7FQGZ3HIUFz80Lz/6BLCRm42M1CoaKQFvGVI3L+uq6HIMC/OEPuWWVN1aPZdGjMQolhNds4X9+M6WQ/c/96fa020OUzmhu0G28W4m1p90H3r9e7PQl8BC5XNbXimggsF374LE6AqPsR1OiJYs64bk1kPKU26DbqRdcBl1GprJocgLQYhNqKzTZB3VtPY8AtL99pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFs08hKh2rHU2KHRULQT5WbM2fzzaMglTHEzvcC1gCg=;
 b=tc3kcl2si1qMWrMxrR3yek9wspO/zLnYbGnVzVX61g73fOI/24tOhRq1A6L5h3aLXRbJ4gqljNk2V5hTg8/MSKQYsgmOiDKGB8zMkgU172Pjoxi7EjbaFVSBcQDRJj2Moko6ooEV5mGxcXObs7yVu/62J3SViYJK6KPZRMTJBWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3171.namprd12.prod.outlook.com (2603:10b6:408:99::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 09:25:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 09:25:13 +0000
Message-ID: <6b4e20d5-205b-760d-5313-00ed76e01c49@amd.com>
Date: Thu, 10 Feb 2022 10:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix compile error.
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
 <8b125a02-3fff-b3c3-0827-c31748446ce0@amd.com>
In-Reply-To: <8b125a02-3fff-b3c3-0827-c31748446ce0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7950848-08b3-4311-6c45-08d9ec773daa
X-MS-TrafficTypeDiagnostic: BN8PR12MB3171:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3171F84B2EB5E70AC7C96F13832F9@BN8PR12MB3171.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynQbDkmcjNx4mPdeBUNT4kfzdILSOqaflELCJyFSbQfJS545EasOYJ3uHsyVPZ/RfjOKMNWNO8rFMpfrWERqCu2ngMAvcSgljFp9y3xX8nqipoaN41O5dPUy+Jxb7A67815r3KmTRRabGiG7YkICGzgokPVFP9tbRetMrCjcOkdsbQVB8sggRFq9HeqsSK5cBCrDkcfoNO4U2tbaRL7r8H4z20K62m9TBAurE9dTB9BFeHzi2rdmGGXt+3HUoq8SvtBh3S2ztKkZ44c2pj5jodIwcPYTo6Z5+nbOzGmgVMk3rMd/9KfRWTM+Nq27JXobix1qL/P5ZRIdo6ANR2hF7QrOWsJpbx1A+NvLCPymEKNn0Kc5hRDhZot2p9sl+HVCs9ys4m3hVupAAIsn2aichA4bK+rBHns3Oq5c38zJpvUEKCIDIlROapG/0GsIztJ0kX9JlgcCC5UXycVKn0Y9zaDDWcuNnWcry9JfoLS+xU+1zm3pZwqDR9u32HC4gdkHHrmaqYf5oINlQF4PPOb3P+gbHINF/GRtQkoI+hUTENRoaWdylaf7dBaoB4dlenqq/vkoX3tunS30fwaba6aAQIPy5qFF1kSqHq2CvQVtVVBeJWJjp9XX0c520sPLQ4AkBlmDE8QHS99fdedkK/+RQ17mD3nI1d5T1x4y2MywGIv/wwjjqcREZPLQ9gDx5GT+lGWi2Dt/3xOTEK3VU1ibCDuyRgUtTVPuekP1xM3MTCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(6512007)(2906002)(38100700002)(6666004)(31696002)(36756003)(8676002)(66556008)(66476007)(4326008)(86362001)(316002)(31686004)(66946007)(508600001)(186003)(6486002)(26005)(2616005)(5660300002)(83380400001)(6506007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9TaDF1bjRRbzhkUk5IV0VZazFjWnhOU2dadlQveTM0L0xvMTlYVmZHb1dK?=
 =?utf-8?B?WTJGTG9MdmJFRDdMb0x3bkRpS3E3Vi9HdVUrWG13Z2hGN0IzYTY4VUpHbEI3?=
 =?utf-8?B?Y043cENJTS9IbkhUczgwVWRnS1dsOEdGNTRnd1NsWFFBTndaYjBGWkNKOFdW?=
 =?utf-8?B?TDBWSVhJV2xwYjZ0VnJ0S2JyaTFTaTFVaVBJRndBSHVJSjFCaVpGZ2hBaVRY?=
 =?utf-8?B?Um90aWZFcUFrTEFZR3ZVQlNPaHZjUVFvQzdOT0RGZmtXa0VSZFNkcWVxMlZU?=
 =?utf-8?B?dit3WnR6MnFhZkV6WnR0QWhHUU9DdW5xSnpocUpubHE2WVAyaTBNY2praGNo?=
 =?utf-8?B?bjl1ZFROTUdQYjkzeEVTSkVUL3BrQ2NLb1NicTFyTGRqalpMbmVlUHp4MXRR?=
 =?utf-8?B?eVJhdDBQZndOWXV5N1hQSW1kTXliVmc5VGJRSnNLZ2VvUVp3NUNDVlp4b1pz?=
 =?utf-8?B?Zk5kcXp4ZGMwYXJkOUttNjduQnYyOVlMNlNrdmwyd3dENjBwanJrQmg1R0lU?=
 =?utf-8?B?N3N2L1c3OXhLT0RLWmsrNGxFRGhxQjRzUFgydE00eE1EdzVyaE05MzYzbU1s?=
 =?utf-8?B?d0liR3VoOW40SEFsdXNQRDh4a3lCbjFuRHVVUlVLZnhnV05JanhGTG9nY0lO?=
 =?utf-8?B?Q3MwMVlvWHZsUXdkQWdQNGhrZThFZUg0R1VxVmphc1hjRWtGMUpsRVQ1R1Rw?=
 =?utf-8?B?azM2U1dJQXBmU1lIcUt2S3FYRDRRZkRkV3ZzRzU3Zk0welY2Rm5nK2tId3Iz?=
 =?utf-8?B?Snd6ZFgySVEwODN5aEhEcm9Bc3k2aTFWUTFMTjZvQmZET2t5NU1zVnM3elY1?=
 =?utf-8?B?dVl0bWwwS2hSeStOc3EvNWZYcDIwU2dpRXp0cDVPb0diOXhNWkhPYkU0Y2lr?=
 =?utf-8?B?OEN6ZnR6SXFtQzcwbGF1cm5VV0RNeDJSWGt3cEJVdHplWU0xUjN5M0dwNzgv?=
 =?utf-8?B?OTBndXczR3hrVko3UjRWQXF2NFd4UzBBYWxRUlp5bkUwejc3V0hqajNYcXN4?=
 =?utf-8?B?amRqMmZKU0x5eTJhUVVKSnZ6R21vd3NZNkhBL0IrcVd5Y1huTUhId0YzUVBJ?=
 =?utf-8?B?clpuVWNIbStBVzNBUDNqZUd0ZGJNTGh3N3BISnlDMTFGS095WVFRQSt5NkdZ?=
 =?utf-8?B?NktGMUNZVTJKeWxWcEtqZTk4eTVkQWd5UHlvSVBZMTFaZmhsT3VEWEhQQW9o?=
 =?utf-8?B?UE1pWXRKUXBwVkJmQmFZZG5xQTlZWHpkQ3FLQUhSVWhUb095VnFwMTUvaUJl?=
 =?utf-8?B?dmdEYVkrN3Z0Yjh2d3hpNEI2THNGYWpZUTJEUFg5MCsrL2VNZTBvQkpQUjRD?=
 =?utf-8?B?cVJFWVVsa0xVeFFUMU5DM2FLWGwxNEdPM3NySnlwM1RJOVY0d2RJaTRuWm91?=
 =?utf-8?B?RkRaYm1VbkRCbkQxMEJDbStLRENlTlM1Q3NsSTV6NGVnNDFQREJvYlZWcStP?=
 =?utf-8?B?dk96ODZxRkFYMnlxYzFpOTEzVDB0c3ovZFRsWTVzM2R0cFZ5RUcwTlRQZklZ?=
 =?utf-8?B?S0J3NEJSRUIwVGo1bFVJT2Fra3I4MElMaGFuZEw5eE5YRWxRVTdYNGdWMnM4?=
 =?utf-8?B?WlI1dWt6ZjVzM1FOUnpQbW5CMlBaOXlxam83MitVL24zUHZKVTlUeDVpRGk2?=
 =?utf-8?B?MmY2TUNSdWJIbTB1Qi9xVm15aW1jTzllRmljZWI4WUFKTmpJSEU5ZVJrelg5?=
 =?utf-8?B?WHdXbnRSd0J1Z00wNUJtbWlMWmdFbDlmWDNwK1VqYXhNUUg0cjdjL0F3MXNG?=
 =?utf-8?B?SjVXRnlCSlllWHFGK2VwTFBPakhhcnRTQTEzeGJBNG5RWStDNlBIa3l0UTJO?=
 =?utf-8?B?KzIydUpCWExBQzNSRTY4elpIeTQ0N0hpcWtJcEY3Zngwc1FPd2ROVUhka0pP?=
 =?utf-8?B?NklZS20vcG1EY3RZQmlqMEZiK1ZiSythdVo5RHQ5Qjlib2gyVzh4Y1VWQ2Ux?=
 =?utf-8?B?bmttUXFvekFNU3Z6YVNYdjJ3N2pUbGtuNUZYbzBoMlVWbHk3L084dzJPY3Bw?=
 =?utf-8?B?M2Q3akZLVjRscmU3MXBRdE1yQU1YMzVDdUdKcmkxdWErNnJnTHg5ekRDckF0?=
 =?utf-8?B?dWVCQnMwVmpnb1RCSEs2REE2SlFRdkp0eVhLcWVhMzVtV05FODF2cnptZk96?=
 =?utf-8?Q?YfHY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7950848-08b3-4311-6c45-08d9ec773daa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:25:13.3696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKUL1HWpVmVjdH105mwgRf1hSXlTcjcJWf2Mpua3VzIgNxrysHcgYxw/55jHqJ0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3171
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
Cc: kernel test robot <lkp@intel.com>, horace.chen@amd.com, lijo.lazar@amd.com,
 jingwech@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.02.22 um 08:06 schrieb Christian König:
> Am 10.02.22 um 04:17 schrieb Andrey Grodzovsky:
>> Seems I forgot to add this to the relevant commit
>> when submitting.
>
> Rebase/merge issue? Looks like it.
>
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

BTW: I've gone ahead and pushed this to drm-misc-next because I just 
broke basically every build :)

Christian.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index 92de3b7965a1..1949dbe28a86 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -118,8 +118,7 @@ static inline bool 
>> amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *doma
>>       return queue_work(domain->wq, work);
>>   }
>>   -void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain,
>> -                     struct amdgpu_hive_info *hive);
>> +void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain);
>>     void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain 
>> *reset_domain);
>

