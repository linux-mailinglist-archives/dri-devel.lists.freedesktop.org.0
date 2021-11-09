Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BEC44AE99
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889E26E544;
	Tue,  9 Nov 2021 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF91E6E55C;
 Tue,  9 Nov 2021 13:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOXXR8aly6b5HKz3pXoSLjFEijA52Auu+SzY1yRwW8vXduMUpXJxicRrtXL24WZhnCH4ZJJ2AmsW6klHIf/Dr/wSJoiHMuyUIF8Lm5gN266t4TtmX57GgHFkAHDM1+GsOEGemBFYHrzbOIdi8+3v1Bby8dog94VVfMYI7QjfF68Dte7yj/ZlvfT9w22yuF/BV+AR9t/akK6eQiXz6j949ggUtjrYRsWuI4nwKEespUAKLp9W+BhNsHYmld01OIKJNFzLVmWxZUxxmO0fDaYrSYpMQVqCXwWIiRNcGvODo8rPVte6OKbOXu6nLT7TpcbwK6wL/NAy4YBRuwJNAWtH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+4VkPFuOXb59NFHSTDC6hy7DdZv8V/BXkgv1SsMF54=;
 b=mXYug075ZEUke5RaT1l3HekHIWGlTOyXxeQIo7wYMTUGTKWyC+UwVaRg523Hp0pKTGCFe4atjUSiESoeUVYe9aYSFrpeJO5LX/aPuvEMUdEFNLPtrzWXF3OFuWqH10Ksm2JDFHncLxfssuJ0u4Q7pDltaSyIUEkM188X6/c5MCP1vYGzf3uDqN8w6MR0NkJilMmqhtBBNEF2eUN4hwEjRXNXg9U1ZAd/e1//2j6isS/TUZuteTuKTFnMZPNCKDm0cxRSFDwHLqZR5Kw9Fz+p6sBijCWYqsMmgufHE3bVgRqn1m029X/ywwOsljSrcWCviP7BRuOiaQSWBBSYPAdY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+4VkPFuOXb59NFHSTDC6hy7DdZv8V/BXkgv1SsMF54=;
 b=P/AGRf8botM3kXCiSCpDtfd0hvUGoGglhuJoEcP9kPNxEqnNEBur0KMMMcvBSXckogQslHtUIr1/xFDFjt8dKOcgfI/iMYnwTT0+FYpHwZj5VovA/3I8l6BRT+lTWGKytV0TVrZmonOl4HcN2VuKwTIHl6c3aQ+8PE8OffqsAPc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4345.namprd12.prod.outlook.com
 (2603:10b6:303:59::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 13:18:33 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 13:18:33 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0hdIGRybS90dG06IFB1dCBC?=
 =?UTF-8?Q?O_in_its_memory_manager=27s_lru_list?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211109111954.41968-1-xinhui.pan@amd.com>
 <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
 <DM4PR12MB51653AB0F1A0B89A41782B1087929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <76d78ff7-efe4-4796-ec18-a668757f2e04@amd.com>
 <DM4PR12MB51657C53FAA6C096884118AD87929@DM4PR12MB5165.namprd12.prod.outlook.com>
 <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b2e8116-7bff-604c-5b9a-e37e29d66dd0@amd.com>
Date: Tue, 9 Nov 2021 14:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM4PR12MB51658A8C75586BCC2B0BDA6487929@DM4PR12MB5165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0048.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AS9PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:20b:463::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 13:18:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 083f262e-48d5-49fc-6a68-08d9a3836e0c
X-MS-TrafficTypeDiagnostic: MW3PR12MB4345:
X-Microsoft-Antispam-PRVS: <MW3PR12MB43457014C16CD6C84E55F3C083929@MW3PR12MB4345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1wnSli2yWtAP6D+u+eB96dwbDtfeyvCrw/PgsziETVr/TYxHgNaekRF57BLPR0UR0ze1JTkJVt02Cp27in6ddr/3M643BW3RP3h53zVwDLlJP1T6I81VIS4KndKb0ac18hDFHSUFxMlZLbC96dIJ5wFS26MPEkJS0x9ijt/t32nLdnyU0Snu+d7ciByaK4JoS0WJSMMGmbU4zXPBrb2/hS+dTiFqOh3CCb92eGEMS/d3BegbS2gM1h6n0ueB6b3ErmSz0h5UrYczhu/ps0UZIo+hJim5OnV2izXQ/P1tj3kpA846t6UVbCUuAbCjAaye/4NuPkwm9VbgBAHyB5lRQFS4g+64nh3kMgK/bEya3lwe1fBvz490jGoX1Ljm5878jZh6DMNe0lde3VjOYqcFKULeFgd0sCHyRJowvVZYchlQ2RzqQRk+xUiv17uBgfT9LFijQmqTVBN01ObVAXWVvGnN/J7N/8DppGiufd5ciTKH1uFLfrq93t6tUTTh2B85LFzqONrSVBmGSlUBhyX8ah3RsezfKEsm36Xxu+NEhIUvkTcVdXc7w40c3S18AkTPSiEJG8t04BwoJFeTyswqhN97Bold1kZAS8vN3rCFtphGMx1xQKuxXVesrFXuYW11/6hYhZ0ObtzKgF5w5rI6NNKbJ3hcwJY4FZAcFUKFFW5CbPeIT+t0rJFpALpbHF6WjRlUmmmaWkGDW9Y3o955NzAQXz/tHBe7hck5WUZ4PY5gFkb/b0LxFj5niatqtDy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(224303003)(66946007)(186003)(66476007)(110136005)(4326008)(26005)(316002)(16576012)(6486002)(31696002)(66556008)(450100002)(8936002)(31686004)(66574015)(6666004)(2616005)(956004)(83380400001)(5660300002)(86362001)(36756003)(38100700002)(508600001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1ZwSElrckFHcGFyZlpkblJ4WFkyTU5RRi9GamJLcm9scFMxZjF3MlN0RG4z?=
 =?utf-8?B?c2lVKzZGQ0JIb1ZZaVlVVERxai82YVZST2Fob0xpN1FVMkpkSEI0SjRkdE5Z?=
 =?utf-8?B?RmtNWEFjaUVERDhFYUVlVWVDL1RpNTlYL2RqWkRLR0N3NHlhYUtWaW1EMWR0?=
 =?utf-8?B?dkVydzVaV3B2d3loYmJGc1AvQkI5bFJzdjFFOHlGTzlKVmhJMGxza0xaN1J5?=
 =?utf-8?B?dmIyY3JVUlRXQUVnbDZlK3pVS0gyV0haUnowYmZrMEllaEgrUVlFM1NNMktt?=
 =?utf-8?B?TXFIZ2ZNYmtkQ3Q5aFB0b29BdVhGZGNnbC9ZNTFXWWkvanR1VUdOQkhkVG45?=
 =?utf-8?B?bHFuUXYrblpjTndIZ3NFdDZ1SDl1RDhPaDg5TmVoaU5FOTNuc0ZZR01OUjRz?=
 =?utf-8?B?QnlaS2lhN0I0T2dPdzh0Vk1JaVlvMDJjWHNRbkJvRW1OTERqT3FpajMyZHY1?=
 =?utf-8?B?c1JMcmp6UHRKTG5VVkRUMWNMRGNDRTUxWWUvd0YwOFdoMWwyRVlPUG56YU51?=
 =?utf-8?B?eWw4aWdpUWU4Ui96ZFJvNDVWNHVQa3cwNXlhQ1daSDlRcjBid2hZZit5bFdw?=
 =?utf-8?B?U0MxTXM5VFQ1bUZHOGkweUZhSGQwR2ZIMnNPSmNxVHpOL0VoTEUvQUJ6WVBB?=
 =?utf-8?B?UzRPNmVTNmkvYUlKbWZHS0Z6ZkkyemRqR0l5bFFZOGh4UnQ3V1lIV3p5REoz?=
 =?utf-8?B?VktNOTlDTU5jK0wvcE1BWXBBK3lWUVJKMXZzUW1qTzN2ZTVSQnEzamR6Y2Vj?=
 =?utf-8?B?cU9xMkJXVlhYUmMyR1c0dEo1ZEd5bjJ1WldCdFVXMHlxWHJDR05HK01COUtO?=
 =?utf-8?B?eVJodXh0eVpzWFBoWVRPWkdNZllvNi95ZnJOMU9oTXJjOWw5M2xmZ2FIK2Fr?=
 =?utf-8?B?Rm8ycUhQQXhPai8yUDE2QWsyVm5hSCtjTFBGelFwejN5dUYxbEJOSGNya1N1?=
 =?utf-8?B?SmlDeHNZWWt4TWNPK3U5RTdDYVBOTTJzWk5vRzY5enBpMTdZMlZnMXJuOVgx?=
 =?utf-8?B?anVmTnJQLy9IWnN5Q2J6Y1I1ZUFKTVVUbkRSMnY3SlU4ZXRPSDJUNngveUti?=
 =?utf-8?B?QVpUejVvWit2S0RrQXdhVjRRSHFhWTNIZG9EcmJhVnZSUTUvWm9hb3F0Rmgv?=
 =?utf-8?B?cW5HMjMzeHFMT3NsR0MxaEdEVGtMaWx1WDFTbnNxYVZzdWJ2U0pZTmtDMVU2?=
 =?utf-8?B?VTg2VE5TYkVtVFhMZlI1RU9ETTI5emZGZ0xaL3BaWnVVV2xobGx0TDd2aVYz?=
 =?utf-8?B?WG1rbjQxL3ZCTGpWckhMZUI5SzRsOVp0M245V1h6Q01xamk2TlVHTUF1R2d5?=
 =?utf-8?B?NlltQzNaNUNweGtNekd0QTZkYlcwejJ2MEhCdTlDeDk0WVFlNjlzYTE4RVFE?=
 =?utf-8?B?aXlKWDErRlROUGNNMmdaQnF1ZzRBZjdMRXBLenJFNDQ4bzJHTDJseDBuUndG?=
 =?utf-8?B?ckVqVWJ6cytTSXFSV0tpenVaYWVONFBzejE2WVcrc3ArQWt4M2VWdmpPdVJ2?=
 =?utf-8?B?d2RaTERHa1FvUzBpNzRkSkJwMzhzaER5N3M1UGpkZEd1R0F4ZGxwT0haYjhW?=
 =?utf-8?B?clFrelRuNlBTdzhWQmliOWZSS2t6bG5McDZWOHVXMXUyak1aWnA2c1RPc1N6?=
 =?utf-8?B?WEtPYURpa3hSakxVb244YmVRY1FYSURMSHhRbGtwNS80cHR6b2Q4dkFHNGN6?=
 =?utf-8?B?SnVXTjNoR0RtUDdYUWRqNlFPTldiY2JabVVsMVltNlZZVlpMRDlob0VsTFp1?=
 =?utf-8?B?V1Y3bzRwa1lTVVNQYWdwbm9jQlU2eG1Vb20rWUVaaklMUXBySFlSYy83Qkll?=
 =?utf-8?B?MUJvT1E2OFd1ek1QNXNRbTVjSU1zZGp5ODVITDU4blNYUms4ckpUbU9OVmRx?=
 =?utf-8?B?MDN0RXdNWFNDV2JpZC95TDRrWDQwZjJubVo1cFZ3UEVUek5jR2x2eFlMeDdp?=
 =?utf-8?B?aXdoWkt6S0tsMUJ6dWozM1l4QUIva3RwZnM5MXZtOWJnclJ0bHJOQnNDWGlO?=
 =?utf-8?B?R0FZam1uTHFiZDNKaHlmMkhrUTdPeFVhbkx5aXY3MU1zWHZwbksxbk8yRGp5?=
 =?utf-8?B?cWlZWUF0UFRiK2NCaEREZmFKMGc5YmtNVU5PT2xkVnJETWVjQkpmbWZvbnpw?=
 =?utf-8?Q?4Hr8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083f262e-48d5-49fc-6a68-08d9a3836e0c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 13:18:33.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snesAj1JGzEzCuyt9jWuvXQ6y07InZYv+6oWeRtzscSBFhlvhmdxFRt0Uxl7LZxg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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

Exactly that's the reason why we should have the double check in TTM 
I've mentioned in the other mail.

Christian.

Am 09.11.21 um 14:16 schrieb Pan, Xinhui:
> [AMD Official Use Only]
>
> Actually this patch does not totally fix the mismatch of lru list with mem_type as mem_type is changed in ->move() and lru list is changed after that.
>
> During this small period, another eviction could still happed and evict this mismatched BO from sMam(say, its lru list is on vram domain) to sMem.
> ________________________________________
> 发件人: Pan, Xinhui <Xinhui.Pan@amd.com>
> 发送时间: 2021年11月9日 21:05
> 收件人: Koenig, Christian; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: 回复: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> Yes, a stable tag is needed. vulkan guys say 5.14 hit this issue too.
>
> I think that amdgpu_bo_move() does support copy from sysMem to sysMem correctly.
> maybe something below is needed.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c83ef42ca702..aa63ae7ddf1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -485,7 +485,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>          }
>          if (old_mem->mem_type == TTM_PL_SYSTEM &&
>              (new_mem->mem_type == TTM_PL_TT ||
> -            new_mem->mem_type == AMDGPU_PL_PREEMPT)) {
> +            new_mem->mem_type == AMDGPU_PL_PREEMPT ||
> +            new_mem->mem_type == TTM_PL_SYSTEM)) {
>                  ttm_bo_move_null(bo, new_mem);
>                  goto out;
>          }
>
> otherwise, amdgpu_move_blit() is called to do the system memory copy which use a wrong address.
>   206         /* Map only what can't be accessed directly */
>   207         if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
>   208                 *addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
>   209                         mm_cur->start;
>   210                 return 0;
>   211         }
>
> line 208, *addr is zero. So when amdgpu_copy_buffer submit job with such addr, page fault happens.
>
>
> ________________________________________
> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
> 发送时间: 2021年11月9日 20:35
> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
> 抄送: dri-devel@lists.freedesktop.org
> 主题: Re: 回复: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>
> Mhm, I'm not sure what the rational behind that is.
>
> Not moving the BO would make things less efficient, but should never
> cause a crash.
>
> Maybe we should add a CC: stable tag and push it to -fixes instead?
>
> Christian.
>
> Am 09.11.21 um 13:28 schrieb Pan, Xinhui:
>> [AMD Official Use Only]
>>
>> I hit vulkan cts test hang with navi23.
>>
>> dmesg says gmc page fault with address 0x0, 0x1000, 0x2000....
>> And some debug log also says amdgu copy one BO from system Domain to system Domain which is really weird.
>> ________________________________________
>> 发件人: Koenig, Christian <Christian.Koenig@amd.com>
>> 发送时间: 2021年11月9日 20:20
>> 收件人: Pan, Xinhui; amd-gfx@lists.freedesktop.org
>> 抄送: dri-devel@lists.freedesktop.org
>> 主题: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
>>
>> Am 09.11.21 um 12:19 schrieb xinhui pan:
>>> After we move BO to a new memory region, we should put it to
>>> the new memory manager's lru list regardless we unlock the resv or not.
>>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> Interesting find, did you trigger that somehow or did you just stumbled
>> over it by reading the code?
>>
>> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I will
>> pick that up for drm-misc-next.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>     drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>>>     1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index f1367107925b..e307004f0b28 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>         ret = ttm_bo_evict(bo, ctx);
>>>         if (locked)
>>>                 ttm_bo_unreserve(bo);
>>> +     else
>>> +             ttm_bo_move_to_lru_tail_unlocked(bo);
>>>
>>>         ttm_bo_put(bo);
>>>         return ret;

