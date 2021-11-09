Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9811344ADA2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837F6E554;
	Tue,  9 Nov 2021 12:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249436E88B;
 Tue,  9 Nov 2021 12:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoD7370OWlwDty162vR+VU3YAGOkx1lddekxcJk4S0P3vnGy0JoUkGgp5dGhvEYm5/w6a1oZMOhhCEg+mGGzBzkk9jpV//BaYPyFg78JDHtUOLrWZE7BAZCyKnN91hPL3DxS1eVnmojb0aaNipR8Fr9bAXtdLOeazY5LrV8IjJ9Dz0ezscez7kcgewSvklfipIcSk7odipe8XcSB3b0lMBsBSq4XQrQ1QEH7OeVwrrxIVM2pJ9geoZhU4Rz0OcotE4n7t/o9pKgNwPKKpa6AeTXQ0l0AQyyvpnluAOn5tUKG+jU59ZOQQh2YGK/cTLbYjzucaD0CHpLpjb2gtyoFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl9Zh2p52cLQd66+gMJrjg4SqfFWWUkZhKk1R/5QyYI=;
 b=agZ++3BoW+iMwOJRLMJFfjBrGnNeigFZyjroSXq1kTdyR8klIt0EWP4cefp8KFn+NuwHHJulAvqH8HATDQGd5U+TLA4XWdithXFGL+WTXVHn5H6qv0vAodsIHnE0zut60EKSEstb2C0y9FxhSslJcbXNEYsAF5dnAriDduqQ2oOlGpvPHgySL/0RgRHQOesx5Rq1+mRgLBEk3g93RFzw9gp3zbcgzFVWCn/gPXMVHYeziEVBk2OaEpeerroTp7K/Yrv8AekjaAphMUhfNEib4iE8FWXcREjslkV3BQ7GZ8dCwy4EdUZCssoEuwpPL65wSLTEwdPL1Sb2GnhQ/Pqx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl9Zh2p52cLQd66+gMJrjg4SqfFWWUkZhKk1R/5QyYI=;
 b=3uDBo/aqTmJGNyQT11CU9tQxZdFdvGR9EQhGLMtr8MTx5g+9LVEXQ7r2mGHPOQxRxyUyvREukoO2+DUmjomh+nF4+0nyD7/BGI6ixt+LjDKg7WD43hTKnpBLXx9cBrOEm74FCZp1uUWANgSHwahZ6VfSEYNPZPuLBoFQO/GvyvE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2477.namprd12.prod.outlook.com
 (2603:10b6:300:e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:35:10 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 12:35:10 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIXSBkcm0vdHRtOiBQdXQgQk8gaW4gaXRz?=
 =?UTF-8?Q?_memory_manager=27s_lru_list?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
Date: Tue, 9 Nov 2021 13:35:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0275.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AS9PR06CA0275.eurprd06.prod.outlook.com (2603:10a6:20b:45a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 12:35:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5249dac7-e328-47ec-98b3-08d9a37d5e43
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2477:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24779F09677A3FF34D03644083929@MWHPR1201MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hp8HVsW8QLT+35QISY1TTKSKghYWMayuitHWrrIh2+WHMGJzoECyeq/9+fyGG56hwvsUmINo8s8xVhbg0mahNq6sUtjmVNODZCzeORkLfrwvPsGd5JOapjZO3eQmfru+imstLPY59nlLjS8hPfmTJpVSZqFtJ4ttuBZvrJi3yjlQihTd0ZCpyT+a8D7S+HuoS4EgIgldJo4PZ3ZeV7MarhDwz3/wIm18Y4ENp6sYRvSR3sWl/PwF6izOBgjfFm0dXIDHSImSbucPFZjDpefvPk/PfZ4vck+YUuhg3yz3YKivtQT5CaPu2XD7n22fPK3FZKLf/zsoFeJ7+z/1hOcT1FN3COAWSBJ2QhMCu20YfxnOREU6e/01OCR7J26hMG4mYtsZUoJQXJ9+uG6TYDnXRpSazsk0gtl+azk9aBWOdLAuNseEMfvtMv8h4DFsyRmDy/LahKosDYVxtmEPIFyVGNTDutvT7VqdFOY0vB+hqYqzaf8DFWl+8OpTL0I9aJ90KWpExYr8eu47Jculd6jY+Mq+SovYzRCNaWvhlaZKw2rMo+91Cwm5EbneB/iR1qrKZvDg5BGbvQgxKwAs0qcQ+/+WXMLP3zG+lhC+JTpPwHCtoOUmfRrkWTx9Te19xYGnyoTSkKEfHjccd47Pd5k38kn8dfw+0xk77Vn+/EqF1gf2Bnr/ApmzQCXTFQiNAQwoDQlfahDQlPAiuBc0NbkhDo7rAL6NSMMIRPUlnVF66kULtjQ9yMNEP+b5QdAhH0l6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38100700002)(16576012)(66574015)(2616005)(6666004)(2906002)(316002)(8936002)(31696002)(956004)(224303003)(31686004)(86362001)(66556008)(36756003)(66476007)(26005)(6486002)(450100002)(186003)(4326008)(66946007)(110136005)(5660300002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnA2VWtLQTQ4UHNubk44RUtyeEZENlFQSnFaM2tPdHlRcC8zaHBPenY4bkY2?=
 =?utf-8?B?S21PQWJER1o4RHpWdG9PblJianQzU2RHd3JyRXBlODBTOVFnUStUNWRTOWRx?=
 =?utf-8?B?WVI5ZXQwd24xM01wQlhtWTdVS0pZMTNpYjNjN3FUR2F2Y3lwMDExWXJQemlB?=
 =?utf-8?B?YWVRVm5McFFSb29iUnd4R0RkRDJCTDlpY2hJVVJNb3FJcytVT1pxSEs1b093?=
 =?utf-8?B?SEZETk5ZWUN5eFRSeVErYWJ6SzhvNWlNQ1E3MHB3ZHZvNDdHTE1DRUMzSDdW?=
 =?utf-8?B?dDlrWWF6RTllRnNuT2F0eGlQdTY5cUJ0YWlNZGlCam5vVWF6WXc4Z2VldkxF?=
 =?utf-8?B?ZlVJL2pXL0UvZTNOOHNXMkEramZRUDd1K0dWOS83RWlzZXVwSXJMclREcDV1?=
 =?utf-8?B?NzB1bkxwTmx0TWhHU1o2SmlEdWMyNjd0RGpTTG5RRThqWlBpRHMrYjFZTmdp?=
 =?utf-8?B?TVkyd3NXUWxNdllNNXMyeDJtanpobCtPOUVEOERwS2g2WEM1aWZrM2V2aXY4?=
 =?utf-8?B?SHE2dU9sOU5zNlpRcEc2S1ZsaVZ3OEFZVjk4OFFtY1pxTnZxR2pBL1dXRnpZ?=
 =?utf-8?B?QTRWSzNZeUZPZGJ5c2FZdTdQdXhkeXkwd0lQY09PdFZ6aWZlWjJnTnhVRHMy?=
 =?utf-8?B?ZDNCSzl4WHdtMHVUMHRQZy8xaWM4a2VGS05ieXRHWUhIK0ZCcWcrcVZlTkpz?=
 =?utf-8?B?MkhLcnNUWXY3R256aDNqMDdOVC8zcjZFdGExSGdiNmczUWU4OEhGV2ZabW1s?=
 =?utf-8?B?aVYwSStlTGRGUW5JaXJHUXcwVi9JK2NsT3ZOVC9VZks5aGFNUXBmeG1IdWI5?=
 =?utf-8?B?R1Z6dWQ3ZUlyVjZ3ZkJCVWdESFZVTysxTVBMbWFKM1pEZ3FBMFZ6NEhsM3Bm?=
 =?utf-8?B?ckFScldKcGpRWUJRc05IaXpDSE1MdFhQUmdGdU90MVR1NmY1K2hLRm8vZFl6?=
 =?utf-8?B?NGVSRVViSCtvd2xQZ1ZNLy9GekJ0Q2VVaUErWW14UFZTTmVXR2FoTzFQeFUw?=
 =?utf-8?B?KzBTZDJjUlN1SDlVN0ZuN1JFV3R2N2szM0ZOdGFORXR5YmZsL2wzaFAxNjJ5?=
 =?utf-8?B?aFFTUHFvUXZkTlQ2dVdpNEt5aXZHZXZhOFlMT283NS94eDE0bEsyYzJvRjVk?=
 =?utf-8?B?a0dud2oyUVBYZFp0djZ6eDhGc2IxTU9JT0h6UVl0dE5qbjQ1RXQ5bVY3bCt3?=
 =?utf-8?B?UUNuVHFONUpnY3lWQlNqUzZHNUh2VDIvYll2SEFSMStRMitxS0QxSjZ0ZVpK?=
 =?utf-8?B?Kzl3QklzUmVrVGhXelI4ODgyT1JQT0FZaStRZUNWajBvdmtpSFJUbVNxSzZG?=
 =?utf-8?B?SjQzQThtYUNnQ051VEtSYU1mc2NkeGMxY1lTaHVDd1Mwd3FjbWNDRE14R3Zk?=
 =?utf-8?B?WXBnNnoyUFFrUDdROGRjM3A3UUVBN1N4d09VNjdqMDVhaFkxdkE2MDJHK3RJ?=
 =?utf-8?B?ZnBJcU5TYWljQ3llTTRid0twS1c2MTVPd3pQSkNmbGVzOW5mTytmd0lDNmg1?=
 =?utf-8?B?WU41OEw0TGl5dUJtV1NHdHV5c21wSFhjS3cvbVJadnpWWjVHMERHYThrWjd6?=
 =?utf-8?B?YmpGUWZYaDl4ZVFocTA5K0t2N002eGNHUm5jR2hkQXljV29yb3VSYU1nc0lE?=
 =?utf-8?B?RTYrc09ybE4va2lvQysvUThuNmdjM1R1bzVWTGhSV29jTVdVbnMzQUd6elNH?=
 =?utf-8?B?OERZcWYzaEI1QmsvUzdvaWJZUUo0bjFuNXVoUnpFYnV3WHB2WFgzcTVZLzVB?=
 =?utf-8?B?bzJxUWZpM2RWbTNrSnJ6cVd4UktLb2VFdGgrZjhMUkdvemd2N2Q4emliNTlt?=
 =?utf-8?B?MVpIbzBNaUlsN0U1MkVVcmhnSnU2REViVWNJd1k1ZDVjT2RURlFVZEhZT3RC?=
 =?utf-8?B?OEI0MmtET0tzc0RoUnFTYzVlcnZmaHphZEt6bmFyeFJYU1ZvVEE2dDBSR2M0?=
 =?utf-8?B?SGIrWkxzSEpqN0hlRFphejNSNnJCRGsxK0h0ZHNXME4ybkxHOGtDYkYzcjNo?=
 =?utf-8?B?bTNVTW1wQXZOamZLbWMwN0NKay9QUTVFSWE4a2x5VGE1NVRmZksrckpvU0RK?=
 =?utf-8?B?MldOdWpYN0VVRUpWeU9nZU0zRkxlSmZVaHJkeTlDbU5naG1YeDJUUndsUVFl?=
 =?utf-8?Q?u/S4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5249dac7-e328-47ec-98b3-08d9a37d5e43
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 12:35:09.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zWD0y7jDmBpCh/qMUz7LCF+QqQQFM+enOAGBNQJpAOWToSmR0yslv6vbvCHrPe9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2477
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mhm, I'm not sure what the rational behind that is.

Not moving the BO would make things less efficient, but should never 
cause a crash.

Maybe we should add a CC: stable tag and push it to -fixes instead?

Christian.

Am 09.11.21 um 13:28 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> I hit vulkan cts test hang with navi23.
>
> dmesg says gmc page fault with address 0x0, 0x1000, 0x2000....
> And some debug log also says amdgu copy one BO from system Domain to system Domain which is really weird.
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2021年11月9日 20:20
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> Am 09.11.21 um 12:19 schrieb xinhui pan:
>> After we move BO to a new memory region, we should put it to
>> the new memory manager's lru list regardless we unlock the resv or not.
>>
>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> Interesting find, did you trigger that somehow or did you just stumbled
> over it by reading the code?
>
> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I will
> pick that up for drm-misc-next.
>
> Thanks,
> Christian.
>
>> ---
>>    drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>    1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index f1367107925b..e307004f0b28 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>        ret = ttm_bo_evict(bo, ctx);
>>        if (locked)
>>                ttm_bo_unreserve(bo);
>> +     else
>> +             ttm_bo_move_to_lru_tail_unlocked(bo);
>>
>>        ttm_bo_put(bo);
>>        return ret;

