Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E728138AD89
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1516F430;
	Thu, 20 May 2021 12:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9F6F430;
 Thu, 20 May 2021 12:04:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6XGLIo5pJBFUSTDNpOdk4HQVPvvYUGd/xTpWcxiS+Bz/NSk+vbE+O8VYXxYp07Xh4x9Su6Wu+Zq+1NjSqQqHQhDmFZVgFjxpZIf4ku2DanOQDhFZY8xL1jYJYA8zj9upCNBgLVcIv5UMbbgqT1xlSAahv6WvVw1Ft3fdzwIazRRndAXddF11q6p0hZqvQjiTPe11fuOBafeXoduM24+llBCxlD1ia1IPCS9lLeRC68Jx1XQM57GxNtDjbHRHZMDDcIVNtxadiX7ZVM+aWhhEWgBfm4ulLPM11DpN6lNAX6E6SeqJENCEqb5BcoEKXXdlRQ1lMBpT0zD1xIyzvRkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ0hdAD9ollx2IAVY1H6U/CruL1poev5VezwzpQ7Id4=;
 b=RfHvT527PiXZjETX0YyUA8pNR2rHEPxGK7BdIHLQRbX7mV8uhqqCimfXiPC1kX/BZlQPXLHChgryXG4XwHYO9OL8Ghi5BP0tMRQEBOxNO8tDNkQ4m4A85D8FsVdH8SuQjiE9bq0NM55T47U8ukFNjSj/x0qaYIUHgsSDqkDwqXF6blSs85KLwD06Kuhy7mDfNkGmInjVzF1AXCzFfn5JqzK58n1VLhc4OTpNPt5L+FOxHJvp19rgAsiIT4i9f2qn94ZXdelZc/jrdmbatkS7p7vvzpxXiJccgtxj+7rt5qTJL8iJNQ7nOTdRc11uvlvpU0pQmIc5/wKaKP2iS+1Hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ0hdAD9ollx2IAVY1H6U/CruL1poev5VezwzpQ7Id4=;
 b=cg7Vlqx6pcvi6nZ0ad5qH0NIj2UXV0Jyp1ml8x99PeflN4LGLqyBPlZBjqIUIGp30T4LmPC5YTfgN3nmzor2lZaXXjoqfxezQ6Fimfc88Woq2ulydTUF/dMjrWHfXLdClIjT3Y+rBR2Cbmlclahz1XKGNIWy9qcwI0zqHMatvOQ=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 12:04:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 12:04:51 +0000
Subject: Re: [PATCH 10/38] drm/amd/amdgpu/amdgpu_ids: Correct some function
 name disparity
To: Lee Jones <lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-11-lee.jones@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6869f83f-7876-973b-2db3-8c83cc23daf2@amd.com>
Date: Thu, 20 May 2021 14:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520120248.3464013-11-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 12:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b542d1e6-d874-4904-f845-08d91b8778e0
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4930D85F354F419AD2F923E9832A9@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlWc0j3T8mT465lthGw9GOcCeaE/kDbbWhKf5p4hWeiQVCRojTvJZ25rblwp93KTBBSg8b7q8Ar2a05NDDshWpWq0cM3TPc7TZmg36m6b2qr0W29gdAJbWuVqTOFXMqy6t3p+yDg6GE5sN+Q0LkhDfjmUOhRwR5DpUZD4af/mEtirzVtXPcB4ILt6QMvzrFs1/GgeuUNdw4tvGCyv098j69LPN1gVnVdhOfzhcxKOSywIuLmHiTN3BROUtn3PHEjmzVR6fuiIh4pE0YIJni4V8AO5QESD6d8USQQQwdIJobbGDbX5ra8wQpUtPlKFV4J+RQXAflE9jDZig/8hDmuOnZ0gRtt848QQUJuf3EEeyJ+91v9MaZv+UlsYYt3xQy5vFAp6/rWZV+7PMCNi5oglU+N5JNP0ag80+i7/CNg8lbrSNyU0pIFqt60kaqO/6TP7atdQX03PEY784qmd6G2sib73rd3ew8tkIPQ9Tgl7xoniQD25RSTtm1nlnEcFpDiMn2HaPKO2IWdCJPta0vdiLMK23nmPklJKO4NPdPX0yXjh7amLfLCmL57LfArmtXXyhOs7H2rDFHEbmA7Ut6NbWqFFIE2WaoWybHs/6CHKM+edGgf8EYwGyWKIvBmUjMu0mvhxHpisajtGj7vRXvpUfrVc6FncpcCmxziGPoy0NzA8qXUo6ORet08riJRCpmg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(86362001)(478600001)(5660300002)(6486002)(2906002)(31686004)(6666004)(186003)(52116002)(16526019)(36756003)(4326008)(54906003)(8676002)(83380400001)(2616005)(66476007)(6916009)(66574015)(316002)(66556008)(8936002)(66946007)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3grK1RuVUVOMnFLNzMzS212VzQxNHFHa3I0TC9GTDNObTQ2YkQvVk9XY2p3?=
 =?utf-8?B?QmFNQjNFcWNBZ05vaUVGTmVCVGJXTElkc3Z5S1lFWjhhMDY0ek9wQzR1dGJR?=
 =?utf-8?B?cEtMbi91UnhjSjFNaDZLdTF2NTdUaG9HUVR1MWJuOE02cE1XbHBVNUcvZDNU?=
 =?utf-8?B?d04zODVwT2I5ckdRS2tUYWNIMVcwcVZ0dnpsNUJGSjRjSVBhVVZhdmxUc2xa?=
 =?utf-8?B?NW5oSzB2bU1SQlU4WVZPaStJR0p1MjR6dFNrYldWMS96cGVTVDV1dzgzcEZa?=
 =?utf-8?B?SlhJdnpoNUUxUjlsdndFQXRvOXBCM3ZkOEIzMWtkaWRoK0VwNlVRMWJZSVlk?=
 =?utf-8?B?cVhoRXNlNFhta3ltTUh2NHo4TmVyUTJWcVBtaEJMRlhKaGdhOHJ2OVRHcUJY?=
 =?utf-8?B?RnJMMS96VDJvOGJxNXQ5SXpNaHJDWGJrTXNuTFd4dWt0Vlo2WUh6VzJBYWJC?=
 =?utf-8?B?MzJNWloycXMvdGxJZ0pldy9Sd0YyMGhiMmdqSWtJb0Vsd1BodWVqNmRQdUVW?=
 =?utf-8?B?ejFYUS91OHZiYWpXSVFxTmpnQnFJNHBoK2dPTlVNdCtVRDZ0VlJad1dHWXdx?=
 =?utf-8?B?NGpHcmlmSFpIRGlmQ0pXSVNlUlIrMDJwMUllZlVSNHRKRENlbzA4ejA2aisz?=
 =?utf-8?B?dlFIaWU4YzNqTW90QWJQa041dkppRFkyMHZROHJsZkRHYUdwRE1zMVB3aXg5?=
 =?utf-8?B?aHFQWnJIY01QaUdienFKQnBMNVNTMy9ENmpBSW9obE5LLzBReTFXRUMyRTR1?=
 =?utf-8?B?aFZ6L1JkcVYwVTBPazVvNHZ2c2I0NzNHQmI4a2FnSjM5K3pGejREY0s0T3VU?=
 =?utf-8?B?Y1h3Wk9OcnR2STh1VHNpcndxRjE4Q1h0LyswNXpqMnd0dXAvOHRJcDNUODc3?=
 =?utf-8?B?MlRaL3Z4RU9LVTY3dUM0amtCTDBBK04wMzVXei9hNFZ0R2RqdWNZdy9UQUs2?=
 =?utf-8?B?dWhZWjI1U0wyYWt1OWJxM2lIYUo5Ylg2WDdDbWY4alh0MUdJNktxSFE0Z2tk?=
 =?utf-8?B?aDRSMDMveU5nbSswTzd6QllLQUxnbXhaekV0LzVPN2xYYTdlVEk5d05iZ2l3?=
 =?utf-8?B?MHdnWlJ0SXBHQ2ZCa1Nhakh5NnF4VE1qM0NEOUVNT1lsNHVnV1U2UStvZnk3?=
 =?utf-8?B?T0lqb1lITkNFSXR0b2JyQ0ZpMytncEt6d3d1M01WK2NIc2FPZkJ1MGNhc2RM?=
 =?utf-8?B?MDAxQXdyZ05EcmgxdjI0ckNVWDcyUU5zRkpDSTJtSitFL0dsZHFPelhyVmFm?=
 =?utf-8?B?S2dJZEZZQU9JOWc5MWlEZ3N5TmsvTnU4ZWpobXBVU0RQNnZWMDFsS3JFTEpC?=
 =?utf-8?B?aURvNHdYVVBFeHdrYzhrT3dGVSt5b3FaVnJOeUkyWW84cm1SL2M1OTB5MGpC?=
 =?utf-8?B?YVZycDgwaFFMNldTRmVTaDZ1NHl5NlFHaFZrMU10RlQ3cTd0V2d4dTJJZ1lm?=
 =?utf-8?B?N0xVY1huek15Ui9tTlZOZ2Jac3V3OEgvVGZvKzFDT1Q2b2JYWGdTVlRsQVQx?=
 =?utf-8?B?aUlmSTlCS05OV0xhWVdVMW9zT3hZRVRnaGpybVArNjlxR05IQ1BPWVlDQnkw?=
 =?utf-8?B?bXJKTWxlY09FV2RJMVVuNG9yL25oM2c5M1VFcER0bGNKVU5YZmpOdFlvZTZJ?=
 =?utf-8?B?RFNOT3Z6czdIN1BLelR6ODRTRHFKc1RQUHY2WHFHR0EvQk1uYXUzS1lXejFa?=
 =?utf-8?B?THZqK2kzdHYrMjBNNWhzM2NPWVVsWkQxcXc5aVVXd1IxUFpwNFlkd1JMSFJs?=
 =?utf-8?B?Z1crQmFRVTZ3YXAwQlVhVE9lK1Y1ZEtSRjlkUWlKZ2JYcDlKVE9iVFdDRUds?=
 =?utf-8?B?TVI5Y1JLVDJyVHdDZnBGM1o0dU5sRTBPM3ZqVWxuQ0RadWxiQmttQzV1ejJD?=
 =?utf-8?Q?AbXpSLUrg6rRq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b542d1e6-d874-4904-f845-08d91b8778e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:04:51.3279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9r34zOGojKTsR3Gb39oVWD2dsJ89aqa5uIbo1aKh4XjYJnDWOQhpWHhUntHggzHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.21 um 14:02 schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:200: warning: expecting prototype for amdgpu_vm_grab_idle(). Prototype was for amdgpu_vmid_grab_idle() instead
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:272: warning: expecting prototype for amdgpu_vm_grab_reserved(). Prototype was for amdgpu_vmid_grab_reserved() instead
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:337: warning: expecting prototype for amdgpu_vm_grab_used(). Prototype was for amdgpu_vmid_grab_used() instead
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:410: warning: expecting prototype for amdgpu_vm_grab_id(). Prototype was for amdgpu_vmid_grab() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index b4971e90b98cf..c7f3aae23c625 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -183,7 +183,7 @@ bool amdgpu_vmid_had_gpu_reset(struct amdgpu_device *adev,
>   }
>   
>   /**
> - * amdgpu_vm_grab_idle - grab idle VMID
> + * amdgpu_vmid_grab_idle - grab idle VMID
>    *
>    * @vm: vm to allocate id for
>    * @ring: ring we want to submit job to
> @@ -256,7 +256,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
>   }
>   
>   /**
> - * amdgpu_vm_grab_reserved - try to assign reserved VMID
> + * amdgpu_vmid_grab_reserved - try to assign reserved VMID
>    *
>    * @vm: vm to allocate id for
>    * @ring: ring we want to submit job to
> @@ -325,7 +325,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
>   }
>   
>   /**
> - * amdgpu_vm_grab_used - try to reuse a VMID
> + * amdgpu_vmid_grab_used - try to reuse a VMID
>    *
>    * @vm: vm to allocate id for
>    * @ring: ring we want to submit job to
> @@ -397,7 +397,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
>   }
>   
>   /**
> - * amdgpu_vm_grab_id - allocate the next free VMID
> + * amdgpu_vmid_grab - allocate the next free VMID
>    *
>    * @vm: vm to allocate id for
>    * @ring: ring we want to submit job to

