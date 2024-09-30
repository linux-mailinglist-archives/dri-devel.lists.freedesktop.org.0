Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69498A04C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5794110E034;
	Mon, 30 Sep 2024 11:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jDEkddyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716810E034;
 Mon, 30 Sep 2024 11:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY4NvUvSqEhyYYodEarD14yJzcxVcWygPJ8U048sIrMyl20Kt3bGMicaTAHOKMLTOighR0JT2BSLnBsRfdM+/M4+p2S3d+gXIvGzoIgS3IJAFKlvHa56BC62v4tI9kLxRYZT+aUZwqxzSavXzxtvegkgewhom4rxqYRWrttc4RgBXYH149rV692gMrEWOOI6sUHXwhfRIhlG9lfoIusXwkfOY3RB9V+PINgwF6kP57pkXdIHhvBw4hUkwKd1/WzeCAO4h4iWYUHmdW4zRw+DLMDATKbpJ6V6igDqE0G0AV12uzEevHv/EhFS1oKJP1rFMX1WVqyURQ9fy59vKucOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofXuHOkIyyRkwpwyu+/fd4c9p3xLi4Nhn6lHp+ukhYs=;
 b=SzRCOaexuKKiRAwp1R4vXLVRtZ2mdoLob/ZF5Nq9educAgnSrc5edGfIocavjGRQ+pWC1qv4ZNvq+NVny4KP60UiVfXZ1EZRbu2Ca89gq4j25tLE2HOlGNsv/rJsSD/wP+F0GDjgijSoVg0hi8jyei3TXqqRxtOGysyiZDjQ0wne3N+AMIguHZ3zHACtfjv2rUrg/GDbphUDPW9KWQtkxveo1SvbXnNhhfLuTS6Rj1SEFOSJmvBRqyDgJfT/lZxVDqyj8CYkgzmz5dkDFnxJnLDoriOBqQ07sgf8d4Rlr0wcNQKVyDfcXvk9dGMYNkdemd4EKKlNeesa++SHyNS01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofXuHOkIyyRkwpwyu+/fd4c9p3xLi4Nhn6lHp+ukhYs=;
 b=jDEkddyqtCLDBvFgD89aLJCc8v9mn/VbMFOe2fp/Tjw3w64VqsVYBzWnmtc+XQ3piMAj1Wf8zcdmMIBYTQ38EzIc/coQZOaSHuR7Lmf53VdrTwczZWr/gIWHynLn2V5KQHvLSpBc0qd8niihjYPl8RmJjYaBZAlefLN8vRF6DW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 11:22:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 11:22:57 +0000
Message-ID: <ea6868b2-ea0e-42ad-8351-c02553691b74@amd.com>
Date: Mon, 30 Sep 2024 13:22:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/35] drivers/gpu/drm: Reorganize kerneldoc parameter
 names
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-30-Julia.Lawall@inria.fr>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240930112121.95324-30-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 5835edfe-217b-4818-c338-08dce1423c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVrVW9jMFVZYVpveXJpdjd5ck9idk83MnhGMlZMM3hqekgrQkdCUFBiVWV6?=
 =?utf-8?B?ZXVZaGc3RkVpNlFwcFVXOFVtVzZIcVh2SjJWdmJXS0lOS1hzb0MvVEFGWEFm?=
 =?utf-8?B?NTgwSU5zcldnUmZGb0JjOElNYktLRjZ0bGUwY3VQSFRBRWZwd2QxcExUT05M?=
 =?utf-8?B?Q1lKVEVIMStzbVlPSisvQ2tiMFJ1MTZlM1dSOHFTdlRibzQxbkN2MnRkaEtY?=
 =?utf-8?B?UW5RNml5dFIxN0hsK0FqSlpGRG5waklHQ28zV2o5Y1lOQ2FITGdoaEljTXZB?=
 =?utf-8?B?anBjbTl3OHdSQ1ZPS1NQenBVMi9teWliTnJqS1FWYlZZajRhNjJ4UHNDTXZN?=
 =?utf-8?B?aEJTOGcwSVQya1lGdFYwcW1NK05NdTFjVlBkdXR6UXhQWVBPSmh3dFlUeFZS?=
 =?utf-8?B?bDJzMlFzQmxzY01MM0c5WjZkeUw5dHhzbW5rTkJONjg4ZGM1cVEwSGU5RStS?=
 =?utf-8?B?MWY5Wlc4ejNROWV1YjNqNk82eGRRbVY1U1I4VHRiVWZMbXF5a1ZBUnpxVEpK?=
 =?utf-8?B?bXNjM1JodGJ6RFRuR0RkVisvSjRqMlZwSnltVktEUEUwSzZPYTFnNzdoYjBp?=
 =?utf-8?B?VTNweStKZHU1M0trVEM1TWZ5TklBM1pKci9aeUdzRkFPZ0ExYldRYnhXTUZB?=
 =?utf-8?B?VlpOMzVFNTlHVTVRMXdZMTJWb3BhRVl1UWNLQngrOXJXMC9yQm1VN3BXZE5t?=
 =?utf-8?B?cDVsTC8vanBOZkpqU3ZOTHZTZW9xV3djRy8xVGs4aTE2QTlNbWxWR2p4ekY1?=
 =?utf-8?B?V0tJTTBLdWV4dkJwazRONEZNNW1DbGNOMjhMTDNkd0NGeHpSeXFFN25jL21J?=
 =?utf-8?B?Y2lCb05QZE5XQXpoUFlPdTNWSmVkNFhTM2pWOG9kNFZPZWI2WnlmK05Nb3Rn?=
 =?utf-8?B?Um0renkwYmtLMzhIZFRRQXc2TFpOT3B0dWFFVGIzTTducWZQU0MrZjZXVFdo?=
 =?utf-8?B?T05Udms2Y3I2c0tmT0QvME9NOThGQll0b20rOWY4enY3cHpXNm4wR0RaV25l?=
 =?utf-8?B?bjROajdSb2J3N0lTUDNpcW5PVVh2S2Q2MTFUUFpCMHBab29rT1pieWxHd3d1?=
 =?utf-8?B?RHh6ODhOSWJYSUNML04yOXhtNTh2Q2F2S1B6SG4xY211dVNaODJIRytXMnVZ?=
 =?utf-8?B?NWhBd1RxRGhlSENzUmR2UjhpV0Q5T3RtMTFyMVUzcEMwd09KSEs3SlJqR3hu?=
 =?utf-8?B?Q3haSkZ3QkxHSk5pLzVIeEQ2c2FhSUtMalJ6ZFI5K3dOVTk3aHV4djYwNHlH?=
 =?utf-8?B?VzY5MnB0YW9uMjd4TXVWZE44RzNVSXdWMGtYWXlHTU4zTitrSW1QaWlKaUJ1?=
 =?utf-8?B?cCtIZmFGS1FpaTVGTFpSV3Z5SkdBazFVSkFKN1RYZzYxMml6dlhESVhUdUxl?=
 =?utf-8?B?N29Qc05EZlhDMWNITnE3QU1VYm10ZFJIWWlIRFlyVFVtbVpnWi9WNVFJei9n?=
 =?utf-8?B?Z3Y0ODFRemQvVG1RUDdWRVN2MU8yUjFwQkpwQzB2ZEVOVDVpb0RUL1RibXJG?=
 =?utf-8?B?MmtCTTF4dEc1eHFhR3IvZDVXY3pUR2dHdFJSdWx6RlVERk1hR09CNlY3eFBP?=
 =?utf-8?B?WFAvMDNxRGhVUTRwVXV3UHJKZjVxenEvY2hBbDRObTNTT3c2TVBSUlExYW8x?=
 =?utf-8?B?dDZjaUtZaHVJTHZaUnR1bS9CYmFycDJIcmdTYXNZTzRDVVVHSnhtdzdYZEcx?=
 =?utf-8?B?UjZPcXl1UnZjUG9seVJabHNWbk1MUldpaDNsQnlEZDhpQzZmdFRDM2k0YWNN?=
 =?utf-8?B?ZGpvVVNMdDhXdXY5MkNlTU9LOWd0TGxCZXFWTnUyb1R3Y0ZiY2w3bkxkbjcx?=
 =?utf-8?B?WEt3Z3F6YXZJM3JHK3NRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE10UWhPajJnQVcwZ2hMQjRUczNuWlYxQ1E5ZnVCQ1FOVVVvRE1Ta1IwWCsx?=
 =?utf-8?B?dUwyR3ZiMW1ha2VMSnZRUy9jeEtPTG94SVhoNllJeFFqeE1rMW44QXBVN0J4?=
 =?utf-8?B?V3RYWG4yOWZnNldxcjZMeHJmU2JYQTcrVDNBbW5DS3k1MEJEc2sxZ2FMRTNR?=
 =?utf-8?B?c3JLT3N3YUxERzhyZldsL1dGQTZiUjZWTFpVTXJrdzd6M0dCQ1FMZC82a08w?=
 =?utf-8?B?QkNlaVBocU40ejhQR2tyd3AxeSs3Y0pjQ1d1WUpEUzVPbEpLZWI0a3RJVzlU?=
 =?utf-8?B?eVlTVTlUTzRjNU1wTzJrSUN4NHNVMGxYcHBZVkpCQk5lT0xTU2VBTWljMnpB?=
 =?utf-8?B?aHJVdkdvTFJUOWZrdXVya0pNNTBaSHQyWjEyTXVWVTJMRFNWbkM5dzdtR2dS?=
 =?utf-8?B?d1cvUW5iZEJUdEQ4dXVXWWRwc3krR1lYVFRaenVUMDFaZUVLdHFzL2I1NC9u?=
 =?utf-8?B?ZkZVU0lxS21heDBuQVlUbDVZMlJpM3JhRjFDeFc0RXVFWkN0eFkrUURmLzl6?=
 =?utf-8?B?NWV6bWFUQ2txZExxSDZJeEJQelhpVFAveDBoSVZFZDN4Z0Zmb1RrZDYyZVR3?=
 =?utf-8?B?eGRFQ1BxdXVPc2pXd09KU1hlY0g0RG5VNW1JcjlsNlU5WkdLeVNqZ05kaW5L?=
 =?utf-8?B?SmI3QTR3NnVjOGUzYy9FU0ZPZE1rN3JWZzhSb2dMQWI0K3J1aDBQMk9qZFpN?=
 =?utf-8?B?Q0NualU4T3FEa05iT1h3dEx6V3BkcUZMUUdnaTMwQ3U2Ny81Uis5L1ZOODdU?=
 =?utf-8?B?NjY1YmJlelliMnFEeTlFSCsxeGdkOEhld3JmK0FhMFhJcHpEem9LRFRJOGJO?=
 =?utf-8?B?emk1K2Vwcm15TTkzcEgxd2V2bW0yT0dGOWJSemlDb2o5d3F4blpuOTI2STd5?=
 =?utf-8?B?QTB0MzcvaWw2ZnQxVnNsc0RwOUZodkZ4OURMaWJxNnlXUnBYTjdua3lTRlpF?=
 =?utf-8?B?VXp5eTM1ZlZ4NGdhZzBoMlloa3h6MDZwUnNxWDRvcmxCSFZBWjFuRkFiQ1Zp?=
 =?utf-8?B?V3FMMmFjL0wvd1NNVTJzb0RuaXBGTkk5WjNTRDh5ZzRQYXJOOWthb0RLSURJ?=
 =?utf-8?B?cjNhWGJEWlcwdFNKQUtXaEVwQTlicnNUb2grN0xNeTlKa1ltZHlZNUtZOVJ6?=
 =?utf-8?B?Q3hRY3pLc290TW5OeW55b3h5azhkaVNzVmp1aDBIa2RLVS9LcE5xRVUxRVJB?=
 =?utf-8?B?SXdndzZTc1lPNGk3anNaUWJLbWJxdmE4azZMOWQ0cUE3TThYUHZWamQyenBJ?=
 =?utf-8?B?RS8zaGJZSUdoVWEvUGZyYUgwQUIyM2NLMmpxMUlmdVg1SXpLemRIdHV5K0RI?=
 =?utf-8?B?NGliV29JV282OTkrM0JvbWdpQzA1Y2tESlNuM1RrNm1PdkVyU3FpMngxeXB5?=
 =?utf-8?B?dldiSGV1a3h2SDhzMWxMVE5NN24yNDFPRHVVNUczdHNCbCtleTdLU3dJSG9Z?=
 =?utf-8?B?NUxpdy9MTXkyd1RoV3FsY0FsbEdmZlhpY2tCcTlVVzVmOVRUV0R0T0FsOXZ4?=
 =?utf-8?B?UGVwMFR6QWJqZUM1alhiOW9YZmNaRzF5bm5IaUNKemtPNWhuTFdtb1dTaHk1?=
 =?utf-8?B?aHVTNXdpM0prNnhmVW44Smgwa0RDVGNCVDlaeGdFM1liVHJSK1pXbkIvRUhp?=
 =?utf-8?B?NjhiaTd0eUJqa2M3ZjNiWUdZb2FQR2t1SFB0RDFrUndlM1hMWmljbE05N3dM?=
 =?utf-8?B?MXpsRHNJNzFlTHhZZ3dBejJveXYvU1VUdnAyRnBBcjRyMFhaUnZkc3VaZFpl?=
 =?utf-8?B?cEEvek5WTGFHNHdXUmdkb0pDakMrQ1BiSVpWZGRWcEhBUmduN21zSHF6WFg3?=
 =?utf-8?B?MldkSG5DM3BPTmdBN2xOL2Y0THlNRVcwV2tTTUg4clFnb0xsMlZ2MVlPNFJM?=
 =?utf-8?B?bklKWnJpVjVmQXlEUnlpMGtVRUd4Nml0dEZmN1ZxRE1uOXdZWHk2eWNnb1R2?=
 =?utf-8?B?ZEdZZTU4dzNTZVBwNzljWWU4YUI1UmlBeTdxU0xWbTI0a2hOcVovNVB4WW1F?=
 =?utf-8?B?YVlqZGxYd3JLOHlZdEpoTEwxdHZ1UndaOTZCVTFHV0diVXVDa24wM3BsUXlC?=
 =?utf-8?B?c2pqeTF5K3VNUEpuaUM2bGJMRStuRmNGT0xVbmVqVERITU0zYllCOXNKY3h6?=
 =?utf-8?Q?D3W4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5835edfe-217b-4818-c338-08dce1423c4e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:22:57.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duy2J8xJLsUC7cC1N6s5nB4Si/h5VEVXDCscBrHU+zKCNFr8IledAHQlwb3VH65X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311
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

Am 30.09.24 um 13:21 schrieb Julia Lawall:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.

Please split that up by driver, apart from that looks good to me.

Christian.

>
> Problems identified using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |    2 +-
>   drivers/gpu/drm/radeon/radeon_ib.c     |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 6005280f5f38..ad4fdd4d4d82 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2773,11 +2773,11 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>    * amdgpu_vm_handle_fault - graceful handling of VM faults.
>    * @adev: amdgpu device pointer
>    * @pasid: PASID of the VM
> - * @ts: Timestamp of the fault
>    * @vmid: VMID, only used for GFX 9.4.3.
>    * @node_id: Node_id received in IH cookie. Only applicable for
>    *           GFX 9.4.3.
>    * @addr: Address of the fault
> + * @ts: Timestamp of the fault
>    * @write_fault: true is write fault, false is read fault
>    *
>    * Try to gracefully handle a VM fault. Return true if the fault was handled and
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
> index 1aa41cc3f991..8611a27dfb3d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -49,8 +49,8 @@ static void radeon_debugfs_sa_init(struct radeon_device *rdev);
>    *
>    * @rdev: radeon_device pointer
>    * @ring: ring index the IB is associated with
> - * @vm: requested vm
>    * @ib: IB object returned
> + * @vm: requested vm
>    * @size: requested IB size
>    *
>    * Request an IB (all asics).  IBs are allocated using the
>

