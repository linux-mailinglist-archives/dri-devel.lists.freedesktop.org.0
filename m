Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569422F4CDE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669736E9F0;
	Wed, 13 Jan 2021 14:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2A26E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD7uMPytkCDE0k39020n8kWeaHaiORon+uwF8q/d9o5FGMRasTRxdqngpJnEMsrkrOKBVCVk+hvxQLAyU3Rmi+o5DacLN/ERigUTYLlOARzTBJadjFmwirjLV8+tUeTE90QZGibPwSlZfKHsdUwHKFKIfGtV1wHGEJw5q/MPT9lL8TUolnJJEc4+Fb8PwrfSsI9W6nRV8Sm0kiOePsCXkxucJL9A97FFUbC8NtvPv4jJe1MhKD/jybdKfpZAQ6D5BBcBlhNUrwXnEj9GMdN4HxqV1gszmkjPPZ/RwA8XZlovZdvd9wNHYAM57MDU5m3uwC+CKQei5XHfavpdB1cTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA8/HPh9dWM0x1Y2yXDRynL0YNOZ1Gbk6uGiiHPJEes=;
 b=BjIaldQOIe0aiwvnUvCm1fR8GBA6UPzrpxoeIV+YnMN9X8peJ5FyhreEJaXfSmBQIL/e978brmB1iWctVneewSqFYFOK86/YUwmK3HBUZYMTKggVO9ajHciLP9xdZ0EL2N9itRQkCkO/Ynxpt36y8/ysTC8AjWHCJLpU+jqQCmECdyBG34JiTwHCa9Csi+PEhx7ciZECtdMEwkL8ok2kmL4iOtPNjI4JNu9+lUg2Uaq8kCC8CGKzOWv2ZYMEBh4Uph7Xt4LkDvjN1cSOdGQ1raEUlPFkcsVnEn0OJNNh8LwVMNgSGOa7rCmM2+rhhDPXlkxBvrsUXlbpOWs2/JJXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA8/HPh9dWM0x1Y2yXDRynL0YNOZ1Gbk6uGiiHPJEes=;
 b=zIMv2lZdWrPx5hOXredCCuqXpHFgi9/lwuqqOWlPv4s72AkEjKH41L/fmfSJADEeO/0QkiTkafWIu0tqAUxPNd65bQN0ZIbNN8DQT6QPhUfXYAPpy5K06dQy3BZ5VBtv9uDl2MZixGdAq69HQewhx4pMjwZZHRuHZt2WqLK7IWs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 14:13:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 14:13:44 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: Remove unused variable
To: Alex Deucher <alexdeucher@gmail.com>, Nirmoy Das <nirmoy.das@amd.com>
References: <20210112174633.77125-1-nirmoy.das@amd.com>
 <CADnq5_OmyiR8HaYDw4S9wH_JjFc_zzkaV33tqEOegNVRgZfU5w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f9a0e8f1-fd08-6730-2159-4c11dc89e4e3@amd.com>
Date: Wed, 13 Jan 2021 15:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADnq5_OmyiR8HaYDw4S9wH_JjFc_zzkaV33tqEOegNVRgZfU5w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 14:13:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45382d08-3ed4-46f2-2ee5-08d8b7cd6fe6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39330ECBD2382E079AAD653483A90@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fXh6v52fLd1NQixBeHpvcX3krY1bITEEmtHgqYgJHlt9bQW71gbxXgBvzOcZwnIj5NN6Mm0B/K1bKypaLHgZxtaRksPrjE5E4LEx1CppI1x2DHOIVz84duv2gYNBxepFjYWreTJVUKUdJkrLGa5jKOslxzjbUjfKWNA1Ri4MiFm5uVRcxaDTvAYsw7Maf7u9XVQQLtD0J7WS9bVNGRcX6KMn0ks5ARKCNm2XtH8/txlNKqiTz9Q/xYDgoKJPuAFlGAhYxBYaIbe6f/1K1mNyaPJQFErUpqf+JFlYxdA2MtxgEdgsqKVP7ys+ndAEXnlEdhxRz2qesfOkswA72eKjhRN38d61t+7B1HLMbyvljj5bcfWphgMVQbwLCcp5abJRHgqfb9tNkaFgeVnsTWrZly4ScBb08SEhctICfIHwY6dRtP8dC9H9h4sxX5CJm3SYUFPmh8iofUk4huQzhhMV+K9xamLHVh+SzNrUzKf35n87x0XKmRp7px9PeCfOs7OlQBJbgzOyYoki7GYIbTCrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(53546011)(6636002)(6666004)(4326008)(110136005)(6486002)(8936002)(5660300002)(2906002)(16526019)(66556008)(45080400002)(478600001)(186003)(8676002)(31686004)(86362001)(66476007)(52116002)(66946007)(83380400001)(966005)(31696002)(36756003)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QXBmMzcySEZNUzdBVGJKYlRqVXk1cytvMGs0R2FFRVVrMGJWLzZQTzR4WTRJ?=
 =?utf-8?B?S21ScHFBSnMra2xVMDVVb25pS0tmYlM4dXlvVG1OL2YvWXU5SHMvb2JXUmJB?=
 =?utf-8?B?WGJ2Y2k5YUUrVDczZlZ3WXIwajlNa1VYNUdocTlJTndONHAyRkc4RTdYeVhv?=
 =?utf-8?B?UnAzR2F1RVNBQmIrVU5UeVRnd3E4dWZORU9lYnFsT2pYUTR4V0xnMEw5Ky9P?=
 =?utf-8?B?MHdNVC8yMnNwbmVBZFkxa3N0UnBNSEswaGlqTGcvYVpKeS9QUzJGUm5nRHZP?=
 =?utf-8?B?L2szOWlKWFdYSHJsRm5Cbm1oU3pOcDNWY0xnL2tkMFYzalNjcTNWVCtLenhD?=
 =?utf-8?B?Y1ZOSGY4WTRoUitFRGR5UGR0QjQvMThoYkU2R0JpQjcwRnJrSisvbytENk5F?=
 =?utf-8?B?T3R4aDE2c1hPVWRkRCtWY011NWFEQWlUNDFHTHRqMmVSSUtqaytKUVdvTHQz?=
 =?utf-8?B?YnJzYXZPTXdTejQ1ZnFlSkNTMDNJd0k5cnNPQ0JsNjFjc2t2UTdVRzJyOXMr?=
 =?utf-8?B?emNGTW14MVpxQllkVTZmNmhnSk9sU3NvQkZoZTBwVW9QOEpwc2NhSVBkQUdr?=
 =?utf-8?B?TGlWN1YyWTNTeWJZR3NXVlpXT0NRSFllampBN0FNakhVcjQzY0NJaHBIY1NW?=
 =?utf-8?B?ZVNPanZDWUpYdksvTHdZZDNMTVg2QmZHand6R21MaFRJYXV5RmVSL3lLSFli?=
 =?utf-8?B?c2xKMTljWDBVNWh0dFdhQU1lTW9Jc20vcGtEdGRPUGM0bUN6b24yWFc5T2tD?=
 =?utf-8?B?V28ySE5TQStaTkVabU8wVXBTVm1iTHlNUit5SHF1aVMvc2VCQzRtQytPUHVh?=
 =?utf-8?B?VkV0U042ZElwUWdKUlJJU0pEeUMwSnVYNGV1am1vUWY2RE9wWU1SOHJNRjZo?=
 =?utf-8?B?enFKaEJNb3pEMWVxdjdsY1JjTnZTRW1TcHpWbTFhaDlDQlJncVhtR1ovYWxS?=
 =?utf-8?B?bjc3VXRDY0FkdFQ4bExtL3hCd1piK2J1K3pQby9rYVhLZkJ0ejhnNjRYb0ZC?=
 =?utf-8?B?K0JTMmhVOXpsMHdwdnkrWHp1YmFMYmZGNkRyV2hWbWQxV3pBamExYWtmcEpo?=
 =?utf-8?B?WHByeENEblhKZXNWM0taYXU4SDZnM2xrQ1ZRWFRIcFVBYUpLb3lIMnN5bS9w?=
 =?utf-8?B?ZU1sTE9zRnVncWFsbzFTbFpsUFBHZlNkdThWWi9mT2tSUlo3REhjUWRBVEt5?=
 =?utf-8?B?NjBGSnhrK2xVUzhBRkcyekZIZ1lGY09yTHlsN2gzZHVDaGQ1REc4bXRuZ21Q?=
 =?utf-8?B?Q09lbThyUE9xd0Q0dGZkU3RxWHJvYmxRdGVsRG4raThrb2FrRlFIL2N5SDVo?=
 =?utf-8?B?YitoTTBxUEVPa0NUc1JCRVZHTXcwVnVWc1JFQldweXluRnFhZElpODI4SFdt?=
 =?utf-8?B?TUZRTlNDZ2pSSFhCNFIyVWlnc1lPVDlwNEdrK0VnKythMzZQU05DL1NYZnB5?=
 =?utf-8?Q?SWuBZhON?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:13:44.5480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 45382d08-3ed4-46f2-2ee5-08d8b7cd6fe6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToSmqR5zm/6byvDpy64SLnGha45YCBb1XD5G999eI1trGF3nY4mOTIAtuqFShgzV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.21 um 22:38 schrieb Alex Deucher:
> On Tue, Jan 12, 2021 at 12:46 PM Nirmoy Das <nirmoy.das@amd.com> wrote:
>> Remove unused space_needed variable.
>>
>> Fixes: 453f617a30a ("drm/amdgpu: Resize BAR0 to the maximum available size, even if it doesn't cover VRAM")
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Have you already pushed this to drm-misc-next or should I take care of this?

Christian.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 348ac678a230..5888367b1000 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -1106,7 +1106,6 @@ void amdgpu_device_wb_free(struct amdgpu_device *adev, u32 wb)
>>    */
>>   int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>>   {
>> -       u64 space_needed = roundup_pow_of_two(adev->gmc.real_vram_size);
>>          int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
>>          struct pci_bus *root;
>>          struct resource *res;
>> --
>> 2.29.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C55c33bd6f6874a973bff08d8b742783e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637460843402778720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=yizQB3RyltggTngn047YcPSDW3rFOTHffuVtDY3k3mI%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
