Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0B37779D
	for <lists+dri-devel@lfdr.de>; Sun,  9 May 2021 18:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D55B89E5F;
	Sun,  9 May 2021 16:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AD889E39;
 Sun,  9 May 2021 16:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxXvZyljDzqzxNMPk4ic2FVkBbLyQZVOz6Tdyag+/AjAmMxc6qWqQ79SY2ms8M2wVz97ODOOtSwDk+OfuTVwVQ8047f1sIb7pp1cmFmFat2NNDUsLse3Sv1wir09QZROLLQ8q1Gbnz6+z7OWV8nk4t6wA1XqCy2FG6oMicO+VEM6Z+K1UzL7iLdr0wDkSxfl5PPriBN1dFFQrwvj0GIwziYlJSpOcGtBmqZoYRtWOr5+nFUIJqqRVi4fYoqU2ld/H6/k6BvAmOQOijxNoJaxGqiyjt2T6K1+yqyn5P6Wm0iYVHghvZz7tMJPY8XAPaGSqFLuAkF1qQXR3N8lTF8x1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C1Hdj7JhqlgDgsZNuuXn/H4HJ07szJZzawKF2QlDZA=;
 b=l3N1JfOIfV4LclS23XQG0x5Gvrcq8mkZgVX1IhR7zV5IOqY/qFnR4uXf7tHYK0NGzmCfNG9tm3oxgXXHk8gf4flmgaE38nKPecZMNKicj9R+TqaFGQnHX+wQCPO+MBbqvoyS723XflpDt9zwy/BF3fcX/k6ESWoyLv2vboupPoS/8X9T5rdwp2i7oZZiJiJOvOeOzORIqvGUHdqe28MM17NJekckvupXdPdi/u0bkRpFc5zFP88xrW+uSgsDxOQABQJdEJxtbG6hEEMn/R5SIsObCKm3JRH1AhNVCMue/Si6ctPL+NxYHEMhVLlmhWPLos50wzNl8gWj/Gc6oG0gxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C1Hdj7JhqlgDgsZNuuXn/H4HJ07szJZzawKF2QlDZA=;
 b=OpiJltmyadl5IxxTco/epyA1pZjQSYtwQTErixN7sR7pn2EpaYAn3HvLbFOBbKvoeljv44f4os/nTtthpQlnTcxv00sR1WIhh2vc2p50fmbcFPr0uRrXPz7EFzXmxQaqeCW5gm1L+QFlMUrMDMQpos6MWOSZdavkCwY4SlJYFRA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Sun, 9 May
 2021 16:30:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Sun, 9 May 2021
 16:30:53 +0000
Subject: Re: [PATCH] drm/amd/amdgpu: Fix errors in function documentation
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210509144923.6316-1-dwaipayanray1@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2c5387b7-2fa1-9b5a-c671-806429b463aa@amd.com>
Date: Sun, 9 May 2021 18:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210509144923.6316-1-dwaipayanray1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4336:c10:ac61:8ccf]
X-ClientProxiedBy: AM0PR06CA0115.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4336:c10:ac61:8ccf]
 (2a02:908:1252:fb60:4336:c10:ac61:8ccf) by
 AM0PR06CA0115.eurprd06.prod.outlook.com (2603:10a6:208:ab::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sun, 9 May 2021 16:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a789327-5942-4599-2622-08d91307d0ad
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42390DBE7199E2F2B84C1C2683559@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1EF02NRJ34nPv4HgyKTYy5JxB9lHm+e5H/+tO7/b5fHQrs0ASM+cVtO9XzeigX3Fi7y5opI4N8dc9gUTvw0BO6QyS2cT+xTSectCeSL80yaJzqqgZJOXHS1orwYYRsLIa/+AqEfpoWtzKxj47npAklu5s9o+Qtl4PAS+TNPEbWAGKxenyq5yA3B+cQ91fGRKWPVREQUNRHfib8HPk0yP2SxaydI7ur3uFHPSnIGkX2jxMM/GYf7YJTeLZUIVbkmTXCpwVn5YEpoRZ1ZmmNbyL87UupOeBwXlejITi2KVX+robzhhtxsRj+Fo4YtuYIEg3VOMw36zmJ2PFG9f6YVSrAFv9mU4gsh7DnFW8VIctg+mu2qCeD5zFQmvXofu0wP58enh/TfNfeaCEuirtHahBuKd6ruRIg8okwt6lpRf5XGFu0ppVHgKCHj3c9hpUj6q3uJIw2f8ROU15hJVR8weqP41sE5MfjzxdpKgharfSsdS6b4ynZCV9fmVdtZ3nrAM8BgFHEBaOMkfAHMnch/ScGlxqQ84pmDTU6fOk++JXbgLR8mW0MkNtN+RYOamE2C59PhAJFAMH2ywOnqmTpuIKdvPisjc/98HW2QP6671Z0jCLBjAFrfBEJFsg0V+stBV8Iw0V0QmywfEtmaFWUZE2SgEkVNVAPkrk2QLA5sUWLX2XNvHRTscbFo8PkXU9Fs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(31696002)(31686004)(83380400001)(66574015)(52116002)(2616005)(86362001)(16526019)(66556008)(5660300002)(8936002)(186003)(478600001)(8676002)(36756003)(2906002)(38100700002)(316002)(66946007)(4326008)(66476007)(6666004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tmo3N1FBZmJmenhnV1dzWWdFNzFJcTJFd2drMXFQSWVyNzdoWERDVTlOWXhr?=
 =?utf-8?B?VWRZNWl5eXpwL0FvL0pRTVNralU3aEhBcmVPbUNSWkx2ZExTSnZKM0ptYWdT?=
 =?utf-8?B?aTBnRUEzVGtpN0FaUTRSeUJoWXgyclBGbzIyYUQ0MWZsWHQ1ZnU5OXd3VzQ2?=
 =?utf-8?B?R2t3V0lQOFMxVGcrM0tha3R4WmtZNHp3bHBDeWFUUm1TVzQrOU5Gblg2UndX?=
 =?utf-8?B?cEJJS2Y0K051ZGdSdmNFUnBjN0sybmhRN0FnZ0UxSndUbElsT244TStNQ2Vt?=
 =?utf-8?B?eFJxRnlKa3VTaUw2K2J6QXNPakVxb2htZWlBNFFiOU1WQjVuTVc5U1NvZmNw?=
 =?utf-8?B?dzlPbkdqZ1NyMVN2MXZOTUY2NjUyWlZMRzNSazFyaFU3bFFDcEVVYVJuTmpp?=
 =?utf-8?B?NU51Z2Z4TEdra0N2aEtqdEJaQUo0QTAyK1hMSmJONHBBeHBhdmUxRmVwZVFt?=
 =?utf-8?B?UEtITDBrci9FREVJYnVzQ0VjOEdZdm0wMkFyeDB6THZVQnJoSnVQb2Y2Z2R3?=
 =?utf-8?B?UVNTcFE3K1NRQW5sajR6K3RJdUQ5dFd6VDRZOU1NRUY2dGNkR0lhNzY5dU4r?=
 =?utf-8?B?bmJyU245L3BWSS81NUI2cEEzQWhiR29QV2J2WHVNaVI3OEdORTFDcjgyYURY?=
 =?utf-8?B?S0hod2xEaEtjMlJoOGpJSU1BTGlOU2gxM0lac2Uwb2NKRXhuNE5rOUw5M0sv?=
 =?utf-8?B?cW9aU005LzNmSjhJcVFmYllnWFRrTUxSVFdVdGhyNy9VcG1qcDJ5Q2ZaQVVR?=
 =?utf-8?B?VUowUmUwSTYwRjBXdGhIZWpFNUhmRlJ3U1pIOVpBSDNkUDcvMEFscnBKYXRn?=
 =?utf-8?B?Vi80RENWQjB1WjRJbmFwQjVMcStUa1dmRWowMW1KOXkxd0dLWWx5RGVVOHk0?=
 =?utf-8?B?TnlhTE1IS3dhdW0wdWM1aWdOa1o5WlZKN3M2SGRVdjJPeWJiK29WNWtnSlJL?=
 =?utf-8?B?UkNrNWZaY05kNEJVdWRoVXowVWo2MkVFUlhzWnRkTWxCZXNSMktxNnprRDBK?=
 =?utf-8?B?L1NvckhzUEFwL3h1dEtnaHNjYW4rQS82cFRWV0Z4cVFwN1ppZ0RsTWdPRkNB?=
 =?utf-8?B?Z0c1c2tOOGkzWGlxaVhZWjM2ZElkQit3QWk1VWNCSTZ5RjNlT1ZMRDFtY2F3?=
 =?utf-8?B?djdYbW04YnlwUmI2ZUpSVzJBZThZQ3BXNEx4ajRrNlZ0dllCY0hucWVzWC9w?=
 =?utf-8?B?UGZSYUp4NVlGYVNFWkV5QlZGUmliZXVmRXBmV21URVdSZUFacml2YVhJNlRW?=
 =?utf-8?B?VXdOWjBwak5qN1Q2WHZ5LzJVYXdORllLYkJ4dm1LUHdydDVnNUtJQ0tqdSsr?=
 =?utf-8?B?UDRHOGFTQ2pLQ2djMW94d282bWNIdVdYZ0s3bHo4R0h3WTFEeDBvc29Pa3pC?=
 =?utf-8?B?NHh0TUMvUkJlRjdCMUJSMUNCYVk0ZXVWcUtmZnMwWG0rRjZKUUYyNlJSdE5Q?=
 =?utf-8?B?RHBRMFU4UkNuQThRRll3Nk5BckJYZFc4V3I5a29rWTB6Y3h3eEVyWE5OUG9N?=
 =?utf-8?B?b253YUtuZ1k0c0Q5SFBwcTU5V1ZiRFNHNWYvem5QYk81RVlaZUMzeVY5aWt2?=
 =?utf-8?B?OGpsSjcvbFpTenJjMTN1RlJRc0h0czRDMEJkOGVyZCs0N2ZxcnZ3eEYwWUo0?=
 =?utf-8?B?WHRhR3Vtbk9Fbi9XaTduOGtSTWVvc0pWUTc2OXFIVkVzTCtDSW1SR0Nlakg0?=
 =?utf-8?B?d1VBakw4QkZoNkRhRGtPdHlNWjdaU3BkVUt2S0MwWkIxT0plV292Sk9mVHhM?=
 =?utf-8?B?YVU0d2w1MnNIdTVTK3FGYUw5QUtEaE81ZUZ3M2xWc3lHMWVKNUZreHZzOWRI?=
 =?utf-8?B?VVhKRm5BUTZEVExDcmhUSVoxaFJHWmlLSEx1c0grMEpud1ZNQ0lCZjEveWlo?=
 =?utf-8?Q?Hl+XecVvsTH4r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a789327-5942-4599-2622-08d91307d0ad
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2021 16:30:53.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: br+sjdWB/tIwxFXukqMJ3ZH1zKYNuuKdZStJAEhBsZB/FdXFlT3q+katkMfl1dO/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: lukas.bulwahn@gmail.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.21 um 16:49 schrieb Dwaipayan Ray:
> Fix a couple of syntax errors and removed one excess
> parameter in the function documentations which lead
> to kernel docs build warning.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 -
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index ae9fb2025259..312f24004413 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -320,11 +320,14 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(struct file *f,
>    * "disable" requires only the block.
>    * "enable" requires the block and error type.
>    * "inject" requires the block, error type, address, and value.
> + *
>    * The block is one of: umc, sdma, gfx, etc.
>    *	see ras_block_string[] for details
> + *
>    * The error type is one of: ue, ce, where,
>    *	ue is multi-uncorrectable
>    *	ce is single-correctable
> + *
>    * The sub-block is a the sub-block index, pass 0 if there is no sub-block.
>    * The address and value are hexadecimal numbers, leading 0x is optional.
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 16252d48e5a4..7e1a67295106 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2796,7 +2796,6 @@ long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
>    *
>    * @adev: amdgpu_device pointer
>    * @vm: requested vm
> - * @vm_context: Indicates if it GFX or Compute context
>    * @pasid: Process address space identifier
>    *
>    * Init @vm fields.

