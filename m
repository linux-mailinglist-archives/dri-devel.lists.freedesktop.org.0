Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3B5672A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D9411B631;
	Tue,  5 Jul 2022 15:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A8111B649;
 Tue,  5 Jul 2022 15:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d621jpX91fkXfuoUCcpZ5esEzMVKtWLJ1gUnLos3P8Ue2Tm24WaTTdElB2jULZdLVXWtCd5x5KWiJvby5GfvrKITjWKGEPzcTCefqH6wqcqffJOkYFyGD/RhNimfegTO+Pj1A0YqHqXihmVTZrc4Hsxuwwg1oonhjSffrAFUFLv79nADlue7dFcWaPozO7J5d+kYb55GnJhcX4Z/ib6oNRasmpz2duyccHEYja+FxgQCXSYBI3Lf9o+FYwm5Wvuf5/bJLI+zHWbuD5M8ehgQwZNtRPu6OCgp+B8iGS+udGgKchyidQhY7S0i1R0RLZo5N60uTdCqscnBjHbEoDShKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igXtDH57wIN4SiW8cUgWIu9Solswkm7Vj3w/IATqHtA=;
 b=Xv8PrKzWdI7qJ0fwIAXNVTeKAxtAkQSoudZ6RGKvq8mRqfX7mz4YI2Z4XGyRqp9zI522oaX1CYdHSc5vLcnuLXYkJz9jwLUnW0O9iOfcrbTDMucvdRTFUeWY9A+qTc7PaUlyfxXuM1dLre0G9qSRqbjG2vGBluzzTSLEKa4gQ2OHBm/6dpxCDam8Xbu8votDeM8ZiumMu3KhOz4vM2zgP61f9UlhcIFdp3zY7OfBxZgYXgZOMzKuBzvJg2cV9YtetfvjDGC/5t/mYG8DFRPkFG7fCg62/Yn4Go8rOYt2X07rrgqewuaAEDqijs5VBOYV7Qxh6Im77Xn2WVNt9KvKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igXtDH57wIN4SiW8cUgWIu9Solswkm7Vj3w/IATqHtA=;
 b=Pr74YbVyKLR4qIq4CKrM259OUFY4SoxR8xujWckfbsk2ZEsdKGuiGpAFJaSqIvAhHnSWr89CluuuzqF1VyQIO0XrWwNgrqMiD6ANOozxI/z+fyJESW9dBxXRqaKQ8K2ze/DLya+XkeQfFkmDusn4XCFqK8npgfhC6p9qxFrY7YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:29:53 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:29:53 +0000
Message-ID: <5397c5d8-20d8-a366-1143-d1cec9da41f9@amd.com>
Date: Tue, 5 Jul 2022 21:02:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND V2 1/3] drm/amdgpu: fix checkpatch warnings
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
 <0bbf075f-ebd7-321f-4692-5bb5da0d638d@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <0bbf075f-ebd7-321f-4692-5bb5da0d638d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::17) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a64f19-d3c3-404b-dcce-08da5e9b34fb
X-MS-TrafficTypeDiagnostic: DS7PR12MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z66VkM90zNG5YUpjlJyHQyURU8rHzIMCLaIk2ajio3UBgvScZXvGk5JoNQZNCFFORJvZ1uaZ4WgJYY/AXnBdmazOKt5/msJE5lajJNFMiAS0dPgU8gZBzivq+NlrcaUEnyC1MBRvIpTGYwB25Cnk7SZ1Q+C3d5XMgKH23X+4UxYvThKvx8qNK+EnXLGspewS98gxAW1jo+nqDvghjgtBz1mmZsvN5gc8lfF8VlOf/zRJsVUpMjHI7Sjh2YOc8AohccWQaaiHWvHJlhIjebwwEbFG3o5y+3FvFnXn6ynh9skHGJDNagHTOrvhQm/B/V+3jeS5cwlG0o3NqL8rG9URCgI+5YpFHLMxH5hacPK/hcr/6FAzAuvD3NP3yoyH9QSe7L0jUbPEYcjxpkNLSR5Au1nxSxcgI1Ai0z6BLf0WkqDuFx5MVm/r1zYDGEMKrTtlKWdMISAzXzTfXNrZDe4xN4aPnf/En0PCTdWciWz0sWQXUUBOuK+4rkZSVj+2TB1e3R4GI/DFreFnzO/OXFd0zqJcV/9LXVXvVoNE1KulRQUWi1sUFYano+svrwWEigouT/rtMU4upxyH/1UWdDNoFsDGFh2lccBHC9+4q216WAMZd5qqQkCZaePWyNt/eWImkPDMBnsRQxH7SrUEnm+/tjukjE4xk19anHvfMn4gGLZpSZnS7C/XKUeRLn5u9ZNWE7J/U5pmxs+ooxZIaco3omhDJ1mYg3owX3BLX4vUIB3gWnBFIFdpBtf+9NLhUbUaNxx80kRxrCW5Eh9ysntjfNKU03rA9XEQMcmPzbL+0+1xo15NcCsUg1GMnz7rOyxQSqKgpBAsf5aZ8BHaKGtIYIq3wC0hiz9SKmHN3z6MoZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(8936002)(6506007)(186003)(53546011)(26005)(83380400001)(5660300002)(6512007)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmY4OWxLWmtmbDMwaVRmUm9sbW5Rald3Q24rR0N3eUZJd25lM2dVWldla0Rv?=
 =?utf-8?B?anM4bjZPc0I4WWh1c3NmRW1qdzFmeUVUa1VPbTRqSUJQUzhVQmgxd1NSbWZH?=
 =?utf-8?B?bVFIMkRtSVNoc2U4RWl5U3A2dk53Y2tXSGcvaXMySU9CenJOTG82QVNLUTND?=
 =?utf-8?B?QlRsQWdsczZwQ3dTQ2R1bFJlQmxmeDRnamMwRU9lTmtlUU1BN1ZwRUdMUG5E?=
 =?utf-8?B?ektqNlZvZEhHczhuWUxmMHhQVVEvSjU2RW13VVBWOEJ5NGtlV3B5ZytUNFVR?=
 =?utf-8?B?bGZ3dkFXMGxNYldKMjdSc3plV2pCbmVZbmNackJ5dHg3Z0pVbmpQbVI4RDly?=
 =?utf-8?B?Z3lKd0o1WFMwUEg2b09GRjN6RVdYQTVvVTIxakE3Wk1SdHFxWUZTaWNZUFpv?=
 =?utf-8?B?Rkw1VVd0TkIzM08xNkcrdkJPZkNCSlpjZDJiRHVtb3B5TnBTVnpEc3pvMDNF?=
 =?utf-8?B?SnBmdlU2ajdVZ3ZRaWU3WW9RdWk2OWIzM1VjYkZnMmxOWEtTcjV6UHVqSE1L?=
 =?utf-8?B?YWxDdE5EUmZ6dllQVDJmRHRvVmpnY01PbzJIeGI4cDU1MFh4VVVSMkR0cFE1?=
 =?utf-8?B?emVSTHNvWkdGQWZxbjhFbW9WYUk4OEJqbkdQQ0hGNkFhUEJkSWJpWmh6OEJQ?=
 =?utf-8?B?YUQ4RE5HL01FdFRzU0VzQkRpemhhM3Y3OFdKZEhOZzdyLzdGUG8rMWVmYkV3?=
 =?utf-8?B?bkV1ak9uU3pZYUd2R0xtYms1S1VVUGR1V0xlY0JhWXg0R1pPMEZwN0RKdjZR?=
 =?utf-8?B?a0xXL2cvUGxlbGdBY3JocjE0Y1lvcjFGektDUnpjODZTWU9DMEp2blFJV0Ez?=
 =?utf-8?B?ZGVWT2xXdlN4bE5SNVBDWmFmeHBsOVRrNlR6ZXRMaUJneXZqNkJUbkxNMlhT?=
 =?utf-8?B?ZTN0cVdqcGdsTm9ZcGlWTHhJWkxqbTVIVmNTUll0ME5YUEJMcjJ3V2xheEU2?=
 =?utf-8?B?aFkxOGZIK3NMRDJVRGl5bDQ2aUJIVmlpSFQxMzlVYXhoM2trMzlsdjBuUUcr?=
 =?utf-8?B?NjdWNHpDa0FIYkphejFvc21Cb2V2a1VPakhXV01XOVd6N255eTBpejRpa3Bi?=
 =?utf-8?B?RnNMUTFOTVB2TXd1dFBDTnpXM3NZYmY3WjZqQi9obXgwazZVYlNCZkx5NUd2?=
 =?utf-8?B?MTdtMk5YYi85b2w3REE0L0tzZ08rMCtzWFVSaXNYZkdab013VTFBMEhqNURW?=
 =?utf-8?B?YVVjZXROcEJQY3NCWGgvR0M2Z2hYMUI2YlpvbDlPVnFuODhvU0REa0Jpa1B3?=
 =?utf-8?B?S2RPUXF3RVQyS2MzRU03UEVoSk5jbUFTT290Sm1Ub25aM1h0ajVMWjNobEhZ?=
 =?utf-8?B?c2dGd2ZGNUM0dDU5T0M5NTdEVlZMSHUzSGZudXBFbitHQmh1MVRNUHRma2lh?=
 =?utf-8?B?OTUveVBDc2ROblphcHdGemU5OVJUYkdvNVhrWWRvd1VPdXcyRG9talhpVW9z?=
 =?utf-8?B?dDY1Q2xVN25KSm5kS2VOck9lSEhsLzJLVmNLVm5ldk1yQkhBRmhJREFSNlpO?=
 =?utf-8?B?QjJXV1NkNmFubWtHMWp5akx4bGlmKzVNeFRKQWRmMFBCU3N3eXZUWTcyTGNa?=
 =?utf-8?B?N25hdWc0NW9UY25DMkQxMVcvNTdLNHRGUFN4b2JwNHFKc0FiTXZPQlFpNkdG?=
 =?utf-8?B?Qm1ITHBuNTNVY0xGR3dPS3lNQ0NHMVB6bkhjSDdqM2RyMk14S1JHcmlNeVh3?=
 =?utf-8?B?ckhSYkVZalVrQW1nWFdSaGVIanhzdWZ3dXVRam9EcGhQZzVKbjUzNGQvcjla?=
 =?utf-8?B?SGprZWg2dWZxbW1aQ1dUT0J2UUVCd1ltU2Q0aU1teG1CZGFmck5GeFJ5anBQ?=
 =?utf-8?B?SUgvM3l3ZDh3UjRKQis4L3B0cGdOMmhodzR5WEx6V0JVNytDbExmRE5UQTRT?=
 =?utf-8?B?SnpSTUF0NFM2Q2VYUHVWcjNnbElnSXRFR2xFWlV3dVBXanE3MlIzendaTWh1?=
 =?utf-8?B?SHNQZ1g3NmlJWW8yZHZucWlEREhRaFhXejZEQ3drTjJnUXpIWkNBR1QybzIx?=
 =?utf-8?B?ZDJPaVBQOW1UbEF4dm0xTWRRNytycU1nc0NHb2lCYUNqakp6dzFOQWtiT3hz?=
 =?utf-8?B?VlRxZkhKUHNQQlVlVFlPei9qVHRhayt1M3huL3FaSEE5aEN5OWhBek5NbG5E?=
 =?utf-8?Q?dNJ0BsvHgKYLA2yZJoKq3/uJM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a64f19-d3c3-404b-dcce-08da5e9b34fb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:29:53.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpDTQKyxSk+Y4EYone8+xCwEZYqOQnuksq+RhW/9vN4oYkzCL4dzeLIyv5Urlr/qLWn6LvczeQfGe5+VQXovKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/22 4:51 PM, Christian König wrote:
> 
> 
> Am 04.07.22 um 15:54 schrieb Vijendar Mukunda:
>> From: vijendar <vijendar.mukunda@amd.com>
>>
>> Fixed below checkpatch warnings and errors
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:131: CHECK: Comparison to NULL
>> could be written "apd"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:150: CHECK: Comparison to NULL
>> could be written "apd"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:196: CHECK: Prefer kernel type
>> 'u64' over 'uint64_t'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:224: CHECK: Please don't use
>> multiple blank lines
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:226: CHECK: Comparison to NULL
>> could be written "!adev->acp.acp_genpd"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:233: CHECK: Please don't use
>> multiple blank lines
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:239: CHECK: Alignment should
>> match open parenthesis
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:241: CHECK: Comparison to NULL
>> could be written "!adev->acp.acp_cell"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:247: CHECK: Comparison to NULL
>> could be written "!adev->acp.acp_res"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:253: CHECK: Comparison to NULL
>> could be written "!i2s_pdata"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:350: CHECK: Alignment should
>> match open parenthesis
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:550: ERROR: that open brace {
>> should be on the previous line
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>>
>> changes since v1:
>>      Modified commit label as drm/amdgpu
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 27 +++++++++----------------
>>   1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> index cc9c9f8b23b2..ba1605ff521f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> @@ -128,7 +128,7 @@ static int acp_poweroff(struct generic_pm_domain
>> *genpd)
>>       struct amdgpu_device *adev;
>>         apd = container_of(genpd, struct acp_pm_domain, gpd);
>> -    if (apd != NULL) {
>> +    if (apd) {
> 
> Well that's still not correct. The variable apd is compute by an upcast
> of the genpd parameter.
> 
> Since that upcast never returns a NULL value (gpd is not the first
> member of the structure) this whole check is completely nonsense.
> 
> I strongly suggest to just remove most of those NULL checks.

Will remove Null checks and post the new patch.

-
Vijendar
> 
> Only the ones directly after memory allocation really make sense.
> 
> Regards,
> Christian.
> 
>>           adev = apd->adev;
>>       /* call smu to POWER GATE ACP block
>>        * smu will
>> @@ -147,7 +147,7 @@ static int acp_poweron(struct generic_pm_domain
>> *genpd)
>>       struct amdgpu_device *adev;
>>         apd = container_of(genpd, struct acp_pm_domain, gpd);
>> -    if (apd != NULL) {
>> +    if (apd) {
>>           adev = apd->adev;
>>       /* call smu to UNGATE ACP block
>>        * smu will
>> @@ -193,7 +193,7 @@ static int acp_genpd_remove_device(struct device
>> *dev, void *data)
>>   static int acp_hw_init(void *handle)
>>   {
>>       int r;
>> -    uint64_t acp_base;
>> +    u64 acp_base;
>>       u32 val = 0;
>>       u32 count = 0;
>>       struct i2s_platform_data *i2s_pdata = NULL;
>> @@ -220,37 +220,32 @@ static int acp_hw_init(void *handle)
>>           return -EINVAL;
>>         acp_base = adev->rmmio_base;
>> -
>> -
>>       adev->acp.acp_genpd = kzalloc(sizeof(struct acp_pm_domain),
>> GFP_KERNEL);
>> -    if (adev->acp.acp_genpd == NULL)
>> +    if (!adev->acp.acp_genpd)
>>           return -ENOMEM;
>>         adev->acp.acp_genpd->gpd.name = "ACP_AUDIO";
>>       adev->acp.acp_genpd->gpd.power_off = acp_poweroff;
>>       adev->acp.acp_genpd->gpd.power_on = acp_poweron;
>> -
>> -
>>       adev->acp.acp_genpd->adev = adev;
>>         pm_genpd_init(&adev->acp.acp_genpd->gpd, NULL, false);
>>   -    adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
>> -                            GFP_KERNEL);
>> +    adev->acp.acp_cell = kcalloc(ACP_DEVS, sizeof(struct mfd_cell),
>> GFP_KERNEL);
>>   -    if (adev->acp.acp_cell == NULL) {
>> +    if (!adev->acp.acp_cell) {
>>           r = -ENOMEM;
>>           goto failure;
>>       }
>>         adev->acp.acp_res = kcalloc(5, sizeof(struct resource),
>> GFP_KERNEL);
>> -    if (adev->acp.acp_res == NULL) {
>> +    if (!adev->acp.acp_res) {
>>           r = -ENOMEM;
>>           goto failure;
>>       }
>>         i2s_pdata = kcalloc(3, sizeof(struct i2s_platform_data),
>> GFP_KERNEL);
>> -    if (i2s_pdata == NULL) {
>> +    if (!i2s_pdata) {
>>           r = -ENOMEM;
>>           goto failure;
>>       }
>> @@ -346,8 +341,7 @@ static int acp_hw_init(void *handle)
>>       adev->acp.acp_cell[3].platform_data = &i2s_pdata[2];
>>       adev->acp.acp_cell[3].pdata_size = sizeof(struct
>> i2s_platform_data);
>>   -    r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
>> -                                ACP_DEVS);
>> +    r = mfd_add_hotplug_devices(adev->acp.parent, adev->acp.acp_cell,
>> ACP_DEVS);
>>       if (r)
>>           goto failure;
>>   @@ -546,8 +540,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
>>       .set_powergating_state = acp_set_powergating_state,
>>   };
>>   -const struct amdgpu_ip_block_version acp_ip_block =
>> -{
>> +const struct amdgpu_ip_block_version acp_ip_block = {
>>       .type = AMD_IP_BLOCK_TYPE_ACP,
>>       .major = 2,
>>       .minor = 2,
> 

