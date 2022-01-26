Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B5049CEEE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E750310E2A2;
	Wed, 26 Jan 2022 15:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742910E2A2;
 Wed, 26 Jan 2022 15:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD4+wm76CzLkM5fA6ZGMwe1G9CUx7h/97rWzXks2CN12EEOFN1nKBmspSPkkR/OpX4dtb4zEhSNQnYMtm24Rk+AmYhVUdWB04fiyAIlanmxQINDzgkq1W4WdQXvYeE5+yJ5hmGWTsVKj4PvTtSSxSqsE1T64qmpSk3b1mwI3MWH++faaGiwqno2VUhAkxYySq+gLZSykK2lDFOZK5QO0rfO9wT9QOu2k0wWxlOqgUWV+iQtH2f6hVfWYq3qCVyjUSy2XEXg91gZhd2ii09vmKtPYJwYh08SGVCz/JA47/jTsiRv//MN3tZlmRs9bFZnpTinc7YxW5JMQED1iJC23Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm8HNZ6hBScTF+YwwCbnY75nmfc3LM74KsONsIlYdBI=;
 b=ey2z7e1Ra7/UiUJDGS81JW02jFp3c1++kgV6ZwAOUSC0k2RNbQnTlzWidrPr0vuM3VplCWSX0hIHvOagiR7wfUCe/RK84/+J0wshGey1LZVF2yRB2lzB0qauU1V+M6oEksCI3tcN0xT6nDO/EVzeSTu5BZU1zt9SjpnUKmG25H3ziZht7gIi/FKEGM4oT9c+HXspRrJaHlJBibgRsk/w2feKm4LiE95/lTKyodnxmIL2XukHIuN+kSXu+dkiqDdTfxx7lUWuMxUak7lX6KFuhB8V9AqTdNtWUbpng3PdihCVz5mzxY8sM204Oo9h5vnDsCTrYlIPi6zskTe365St4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pm8HNZ6hBScTF+YwwCbnY75nmfc3LM74KsONsIlYdBI=;
 b=jUV2crpYV61NxmN0qxtMxT6aCWfvxM1o5y8yn6vymDS7G72IR4jywir20Lg1vyvQfS2Om3Xiw9PTMHriat6nmv48cM9W1/awQ9PsIX580BDMpmG0eIDz98TNPtCPOa33aRMZ2waQkjLZyk0ZnZAnkRLFogPTZCYzjC31YLyCK0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1804.namprd12.prod.outlook.com (2603:10b6:3:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 15:52:03 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:52:03 +0000
Content-Type: multipart/alternative;
 boundary="------------0Plf1x10UarKgnkvkqcsOuY8"
Message-ID: <17b6f133-1b7b-7fcb-5fb2-17edcac50a72@amd.com>
Date: Wed, 26 Jan 2022 10:52:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Content-Language: en-US
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, JingWen Chen <jingwech@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
 <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
 <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
In-Reply-To: <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
X-ClientProxiedBy: BL0PR1501CA0032.namprd15.prod.outlook.com
 (2603:10b6:207:17::45) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50fd7008-f487-4f43-2694-08d9e0e3cbb6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1804:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1804C430DA853260776E44DDEA209@DM5PR12MB1804.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqfbI08+UDjw7f64PSefbRITj9SQzeboS5OXNURCBZQP14RD80MFlkLitVAtih5zJxRDMN3hXlfuwFuLzjeOPKU1L3g7o2v49Yt3RuTyzlPXAY76svQs3PU7Bqw8z1SyDnHyHmWaiusdzciHEe2TMcfU8XV/IeFOay9yPIvORALQK0k3rKJBZo7r6yIw19n/dKt5huakydkah9EPTUQzjYOlW/sZ21wO5iOGuG5P1sgJ6tmSGcr+AQhTgn+N5X7JTR8Tq2EKmaGnVbzX4tZw1IS7waHYnXdzB6XoZQ6f0DEdDHM8qX9/pM4M89b8/cXzDRhkW4AZ9V3cT6SFO+L9UZQzL+9M7gbAElUaocLoMlGU8XFzUYOVSwUcHwgegyWjcsFn2lTarCxIREVjEWiHspexMrQII8R61rdTQWpERdu2N6i3cOqXlJKuPaO70eqVMUz2ttx6sDfLhGU21BkaQuOzAz0NEN8LOvTfbSAynRHRTPsVoaUVN/KY/+oExSE5WFOcfM6KUVHu7C94ikqo5jmEAOZJMuamqObkbDn1qkRBks4kn8kUopl9vsTbQrHCd9jovzMmEQpHTUQyv17O+633un474lDyrbx+VpGP9ER+lr5TMset38Ukcj4Wt/Kdspl3n60brOJ+YhhAhFHz5ZT8v7ucd63seFVwDtqjqkaZATDEUisRFzpjCP3G9SrHTQAokuSejCOyn9c/1RZ4kidRe4mJMlRPe6Ex+nd4vxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6486002)(53546011)(6506007)(33964004)(31696002)(186003)(110136005)(5660300002)(86362001)(83380400001)(2616005)(8676002)(2906002)(36756003)(31686004)(66946007)(44832011)(4326008)(66574015)(6636002)(38100700002)(8936002)(508600001)(66476007)(6512007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVRU3d0V2J4NHRrTTlUV0MxTG4raTBhRXArbnRPQTVyanB5eHVYNGhjQk5w?=
 =?utf-8?B?QWdlN2xVZEFWTk9NQzA0SXdhaGV6WVgyMzNVMnVsRnQ4TnFVMUQxaXJnbHBT?=
 =?utf-8?B?S2RCNHBDSlcrWUVzemx0WVk3a21BcFZZc3NwdGxIU1Y0UEdzWGVnV2V0NDZQ?=
 =?utf-8?B?NXNYUHcyM3JXZE51R1cxK1lSRnczaU1nZmtCTG9SWUJYSEdSbkhOUzAyQ05r?=
 =?utf-8?B?dGRmcFkrL1JMc2V5OGY1REVWUnNtek5DaVBRS2dhZDdvQWFEL3FtdE5NUmxq?=
 =?utf-8?B?RVBWZkp4bmxra0xLbGFQQmVWY3EyNzUwZVJvKytmU2Fqd3pzbFN3QWxCbzRL?=
 =?utf-8?B?NUJ2aCtYU3M5VXV5NElWMk40NGZOSHE1RlRLUHRhanF2K2Y5eXA2UjlEcUtF?=
 =?utf-8?B?ZWpDRzJmK3YxR2ltYmJHZW9wZHZxYklheUJMMEJOdW5SZ0NEelJvT0pHMUhz?=
 =?utf-8?B?ZG9mY2o4RmlVbUFNeENjYy9hd1hhMkN4QXp5UjUwM3l2VlhXT0haaFV6YWxh?=
 =?utf-8?B?RXlCbSsyZEQ3dy9zTVhjd3YrWE1uSGhvWDdEUzdKNGdrdFJ4N1FBaG40emwx?=
 =?utf-8?B?bUtWRjlhaVZDTWJYVTlSaWFkRVNIdHpDVU94TGVDYjVlamJPUEY0bnYvRHJG?=
 =?utf-8?B?UzZnWUFaQ0dsSVQyRTNzSW1yd0FwK0E3aytLMVFTZjRWMUZ3NWoyL2FHalIy?=
 =?utf-8?B?RVF3cXA0b0FUczkyRjFQdHJSeDFVZnJGVWZnY2pTVi9FZlY5ZFBXY0pWY29j?=
 =?utf-8?B?elF6elBPMUxOQjdFSEYrRzVWRExEbEFqYnpVTTJicUxabE9qWWxwUGEzalpS?=
 =?utf-8?B?OWpZejBFdkVqQncyRS9xZmIraUQyWVErUjFBM2N5RDhBb3BwdW8vNmFqN01a?=
 =?utf-8?B?Vm9KKytYQXRyYTgwOGcyeVlkTm1vR1dJL1FZT1RpZ1lWbVBoK0taY3hnU2U2?=
 =?utf-8?B?YTdiR0llaUtORXE4WFZrY3ZXS1JaUHVnUVBNVDZSdktoc0JWV05VK1QwYWZH?=
 =?utf-8?B?TFBkQ256YXNHa2Q5SFp3YUErUkhySHB6bHdYSTdZWkRPSkVYWmpuNW5PWTh4?=
 =?utf-8?B?aUZYZTF0a0NzMW1mSFVLLyszZHlsblBvYjgveFRIVk5kSnlqOWhkdVE3OHBZ?=
 =?utf-8?B?WGdIalNWa2RrWmVsYlFZUys5U2FtNWVFejRGLzh5bVV4dE9WNjVqNG54NmNZ?=
 =?utf-8?B?UWVPZHg2T2hYREY0S3oxcm9TTTEyMGlmY3hIckxwdFFWVjgya3FFSzJTL2tG?=
 =?utf-8?B?T3ZqK0JTdWxmam1qN3o3U2srRzAyQ3ZvL0FTNkc0Mlg2WFNwdVRscjdaYmNl?=
 =?utf-8?B?NHVyL1JJNlFFSmJuOHJ0SCthcDIxczBLUTRhNzdzY2paSUVjaGc2YkFROGQx?=
 =?utf-8?B?NEhJMDA4UWJFa0kxbnVpemV4Y0NCZ3ByMmpwWC84L2xlb2orZDY4all5MVA1?=
 =?utf-8?B?Q0xXTVZxdWYyT0ZlcDNRQ2ViczVHbnpvbG9zWklVdWt2T3JtUTdHV0Mwd2U0?=
 =?utf-8?B?STlwemNZU3A5L3BqdkNoUXV1K05weStPMExybEVMcEFWd1RLWTAwQVpPYlYy?=
 =?utf-8?B?TEdzQ3U1cW0rUmpub2FPaUd0OUdBaVd0WmRVUW5KUlNjYkdWb3JhZmtpREZ2?=
 =?utf-8?B?dmg1R0ErOStTaTlXbVljcUlocmpxOWQ4enIxUWFNU1dIZGpZM21ITEtnclZj?=
 =?utf-8?B?NEQwbDVKNXlETEg2YjM1bTVEN1c1QXdPcC81cTUzam1CU2U0cklJcUtzd2xI?=
 =?utf-8?B?UmtraitYWFNJdkdiL0t3K3UxV0Zxb1RLSWw0K1ljbkltQlY1MFNFUjZDWW1i?=
 =?utf-8?B?bElRV2dYcjJuemhRcFRZNWZUMmJINStwU0I4d0Q2S3pnU2Y4SmdVVnY5SWxU?=
 =?utf-8?B?UkJ3SURyeXFkRFZsSmo5RWdGM21hL1lVRllDeXlzVmVlbWhJOWhFeitTS01j?=
 =?utf-8?B?dkcxbWg2bW1nNW1rYlg0YnNUUVNJZGNic2d4UHZDTmxCbHRjT0tiWmVORE1v?=
 =?utf-8?B?Y2NyK1ZSeUlnWmFMWVdSeFpWSm1jRXk5S09sMVAvYW4xU2krOWZsaVNPaFNL?=
 =?utf-8?B?MWVkTHdMcU1JMzYzOXpSNTRUV1R4SUpRNnh4eE04UHZhUEJyYXpkdzdBUXNq?=
 =?utf-8?B?YTIwUkJPRHRkMG0xaEpSazlvQWRMcnBKMTRSYjFZa3FkZW4zVFE0LzlvdG81?=
 =?utf-8?B?NHhRenRMYUVhRE5MYm90VTlJdXA0cmhveTJWLzF5S052RkxPTk9kZk1xN2Q4?=
 =?utf-8?Q?Hsm36+OEWvdAbnKq6snf14pdLhWkZfVdMJ/CRpTPJw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fd7008-f487-4f43-2694-08d9e0e3cbb6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 15:52:03.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqykoqtwVqxzz2ZCQASY491I8acAEVHefrlQe36q4XODChz7J8iZrvhQwXJ6o80uw532BW0Qu/KRYmTLIAlGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1804
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------0Plf1x10UarKgnkvkqcsOuY8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

JingWen - could you maybe give those patches a try on SRIOV XGMI system 
? If you see issues maybe you could let me connect and debug. My SRIOV 
XGMI system which Shayun kindly arranged for me is not loading the 
driver with my drm-misc-next branch even without my patches.

Andrey

On 2022-01-17 14:21, Andrey Grodzovsky wrote:
>
>
> On 2022-01-17 2:17 p.m., Christian König wrote:
>> Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:
>>>
>>> Ping on the question
>>>
>>
>> Oh, my! That was already more than a week ago and is completely 
>> swapped out of my head again.
>>
>>> Andrey
>>>
>>> On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
>>>>>> Also, what about having the reset_active or in_reset flag in the 
>>>>>> reset_domain itself?
>>>>>
>>>>> Of hand that sounds like a good idea.
>>>>
>>>>
>>>> What then about the adev->reset_sem semaphore ? Should we also move 
>>>> this to reset_domain ?  Both of the moves have functional
>>>> implications only for XGMI case because there will be contention 
>>>> over accessing those single instance variables from multiple devices
>>>> while now each device has it's own copy.
>>
>> Since this is a rw semaphore that should be unproblematic I think. It 
>> could just be that the cache line of the lock then plays ping/pong 
>> between the CPU cores.
>>
>>>>
>>>> What benefit the centralization into reset_domain gives - is it for 
>>>> example to prevent one device in a hive trying to access through 
>>>> MMIO another one's
>>>> VRAM (shared FB memory) while the other one goes through reset ?
>>
>> I think that this is the killer argument for a centralized lock, yes.
>
>
> np, i will add a patch with centralizing both flag into reset domain 
> and resend.
>
> Andrey
>
>
>>
>> Christian.
>>
>>>>
>>>> Andrey 
>>
--------------0Plf1x10UarKgnkvkqcsOuY8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>JingWen - could you maybe give those patches a try on SRIOV XGMI
      system ? If you see issues maybe you could let me connect and
      debug. My SRIOV XGMI system which Shayun kindly arranged for me is
      not loading the driver with my drm-misc-next branch even without
      my patches.<br>
    </p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-17 14:21, Andrey Grodzovsky
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2022-01-17 2:17 p.m., Christian
        König wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com">
        
        Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:<br>
        <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
          <p>Ping on the question</p>
        </blockquote>
        <br>
        Oh, my! That was already more than a week ago and is completely
        swapped out of my head again.<br>
        <br>
        <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
          <p>Andrey<br>
          </p>
          <div class="moz-cite-prefix">On 2022-01-05 1:11 p.m., Andrey
            Grodzovsky wrote:<br>
          </div>
          <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com">
            <blockquote type="cite" style="color: #007cff;">
              <blockquote type="cite" style="color: #007cff;">Also, what
                about having the reset_active or in_reset flag in the
                reset_domain itself? <br>
              </blockquote>
              <br>
              Of hand that sounds like a good idea. <br>
            </blockquote>
            <br>
            <br>
            What then about the adev-&gt;reset_sem semaphore ? Should we
            also move this to reset_domain ?&nbsp; Both of the moves have
            functional <br>
            implications only for XGMI case because there will be
            contention over accessing those single instance variables
            from multiple devices <br>
            while now each device has it's own copy. <br>
          </blockquote>
        </blockquote>
        <br>
        Since this is a rw semaphore that should be unproblematic I
        think. It could just be that the cache line of the lock then
        plays ping/pong between the CPU cores.<br>
        <br>
        <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
          <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
            What benefit the centralization into reset_domain gives - is
            it for example to prevent one device in a hive trying to
            access through MMIO another one's <br>
            VRAM (shared FB memory) while the other one goes through
            reset ? <br>
          </blockquote>
        </blockquote>
        <br>
        I think that this is the killer argument for a centralized lock,
        yes.<br>
      </blockquote>
      <p><br>
      </p>
      <p>np, i will add a patch with centralizing both flag into reset
        domain and resend.</p>
      <p>Andrey</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com"> <br>
        Christian.<br>
        <br>
        <blockquote type="cite" cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
          <blockquote type="cite" cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
            Andrey </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0Plf1x10UarKgnkvkqcsOuY8--
