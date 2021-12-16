Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61195476E1A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384910E1A5;
	Thu, 16 Dec 2021 09:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F53C89715;
 Thu, 16 Dec 2021 09:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0OFpwsv9+bykFeE/P2oUVhdYgtAGc04PvEyDiH07OytjZb0E8vCrnoc3cbqB0FTrYbfN2UAYa5qsWMJO2s/iFqdFjOebjW3kxmXVNtxP2x6AiuSuoGgkitxsph3OocmaDTvqPCiFoV17F8MC/jUu4jWXnctzrLRJk+n3nos809pJIKQAFJMotyt4OtzbMGAoDK52KXloDr+0DfNdYcW8o6JkVcUyE06TshO7zWxzAVJlINEnH4tHbwRdPBZOf+XAyGH9qw8av1jjyJcrt1UKIiUy/i8VHaWqlyK1bwHk6kLOnt7PHHVXtAm7uxEnjjAZhwzVaGQvVQS52xR8duT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDNjZR3W1huUTblTZrQ8fbbKNkUb96O4Ip4tuWhZOsU=;
 b=JIkTxRrM1hTexohZlYJhec/Yu3fmv9bTGQLJDskIWDglMluPj3XMbonTprHgh64VmzlV6Nh8M4xN836DaqQW81Mjz6tfGRM0/CkiYTzRRr336zmE2LoopAJFXYtq2QAdhARMRHvJWGrCiTHSyRsJJZ+xCFDa2/TNQ+GA/RyYn3eGbLY5shMLuE1P1FfWrUpELTrbBJFMQRkmseRnYfE9dqsnC4IZSh3TdLJoHaVX9rixgZ1xxttRxYQ21ub7cgYzIDY57uM6oTkUJ1nx3sD71MD9ZdxGcw2fNT5xRJRTJbYRzFX6UT75Uv4XqKdsn19UyV22pNSviEFM1BtV7bGDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDNjZR3W1huUTblTZrQ8fbbKNkUb96O4Ip4tuWhZOsU=;
 b=NDgP8Z7QK4Xaxrm3Twvp3Zj9Ot3vFodG5unKOVY0EME810cbmq2CDAEPDwHxFl+IN5gumJSaJRHzGHKe6w0HLYQynzvffOw/M8ax2dDQmOWk2OinRKz/yNNF4a311aAlX0ncnkUBAe4MIGwBV6yO0iKXAEQhUUPCqitA3qIeLfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4442.namprd12.prod.outlook.com
 (2603:10b6:303:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Thu, 16 Dec
 2021 09:48:44 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Thu, 16 Dec
 2021 09:48:43 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQQVRDSF0gZHJtL2Ft?=
 =?UTF-8?Q?dgpu=3a_fixup_bad_vram_size_on_gmc_v8?=
To: =?UTF-8?B?5ZGo5a6X5pWP?= <zhouzongmin@kylinos.cn>,
 Alex Deucher <alexdeucher@gmail.com>
References: <10btoflyx2v-10buydfdywo@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5777f77-edf7-ced1-2134-ee55b2c60a1b@amd.com>
Date: Thu, 16 Dec 2021 10:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <10btoflyx2v-10buydfdywo@nsmail6.0>
Content-Type: multipart/alternative;
 boundary="------------D447A65F17027EDD2983CE2C"
Content-Language: en-US
X-ClientProxiedBy: AM6PR0202CA0041.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f07002-bf16-404d-b509-08d9c0793f2b
X-MS-TrafficTypeDiagnostic: MW3PR12MB4442:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4442CCEF85D34C81786CE8FD83779@MW3PR12MB4442.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YJbPcF6jCuj63qhiP4NAhCGI06v0r8cWdPDxBChCVZnsDIB4LLvYb9b4OWEZn6AgRY2h5ydaMAP1NIClE2RU/liHbuBSU0y6wk9TBfv9mqtbPm6EYLXiX35+dgtL6XOoCLzhRaSyjSl8z8G1NMEbv49khtMsZS8G5YP0ln97dN8spL+Oh6ZySUC2GQCQNusQoBMGG1KlyFkKXcgkAXuLypG4YhVVJvynHEa6F+AJtVK7yj5L2pIV6Yi5aeeP5HvA2bSSjDm4MelEcxZ/LStZ6r3hJfm17dkoCk29lgPtM62E61KXgLoQnMlum9XsMu0Vn+JpdTkqYkl8oW2hi4KUEkVe+8SSdL7I+WCtCfZj5wJpIXrPV6/k06vTeB/fUDd2Q8jCi0OPplO+mO2aqqWx4qIk9aoppaqV2uU5xThzoQAm2IbpsHQhRNFYipcXUxVFwdn72qZjKtwbj5SowoDcNwccpQC70h/A9UAX9Sv+HOjse42Fuu+jz19HtIAq0E66BilDHYG7Yn5DJd5cy0NYL5JP9GfIuLhky+F9FGiXAfVESaLBlMkseizI0ipSmtrd9Ajp0IpnkXU9GfwhjDIq5Q1+hpxRUYAsHuow4t+3ciz9DAHoxNhxD+NU/n7L+t7eHxWJxthRdw3YauUMSs8/Ec+LAN5i0C5jK/Y43oOR+YYXY1Lm0GCetg0+zbKnxV8aKhnCgtHzhnkwBmfVSqSJFG5oDnI41tMhBX+KtrpCQXmFqC9wf6eMK8liyb74V3Xm+myfAhRrnVcgYWZ8rlD18e4oQj7tlPuGkhG9+o/taXjWhkSNSajxyfUxVCMbKFaLzTGx3vlp4RVBBKew44SMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(36756003)(45080400002)(33964004)(26005)(66574015)(66946007)(186003)(6666004)(966005)(8936002)(166002)(31686004)(4001150100001)(4326008)(38100700002)(66556008)(66476007)(86362001)(224303003)(6512007)(5660300002)(508600001)(54906003)(316002)(2906002)(83380400001)(31696002)(110136005)(6486002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21RWEhYTzhUTUVpOHZQdWtFdlkvU2R1Z2pqc2dreXFxZ1F3ZmZ0anZIbGRT?=
 =?utf-8?B?SG5IMklLaFlzdlZkQ1RxR2ZoYlk2eGRnTFdBMTFCc09ydkxqRmlxbjRIbXNY?=
 =?utf-8?B?b1R0NVBaMVBxc1BmWTlTS3ZLL3BMaHBlcG1jZUd3SlFUUDRmMGtzU05oamUy?=
 =?utf-8?B?Q1BGL2l0NWZDL1R5SEljaE9EQzV5Q3A1V0V6Vy9WT1Z6emFQSjlHSmd6c2li?=
 =?utf-8?B?eXRlK1VZVzhqRzZiWXFOSEhpT0hKdVZTOSs1ZTZJRjdrNjJFLzhYcXdCcDBo?=
 =?utf-8?B?WVdrL1ZaRTFZNW5IT1FxMnVTMGZDUDJLL0xTRHN5UWVaQklJbW56Z0FGT1d5?=
 =?utf-8?B?S0lpVkhPTnNlRDExcnRibVJHZ2NMd0RlK3JUYVJuQzdnWDh4OFZpcWFYdXcy?=
 =?utf-8?B?YjR0dXpRWWdtakRMUmNENUljUnJXZ2k3RGNEMGhyQ3dQNWQvLzlaSnVGQ0dq?=
 =?utf-8?B?WGs0Y3JVanBEb0tOTmwyZ1pYSTdXREs1cEtadzlSeThHQ1VELzNNa1ZBYzRj?=
 =?utf-8?B?RFQvMzRRRkpKRHZnOFFTbG9yRmoxeGliQmhOM0pzNnd6RmVFZUUwRmUxaDI0?=
 =?utf-8?B?dUNJQ0NXRVV4NUtjMy9sRGRtanN2dU0yZnMwa1VzSWdoUlpUV1RjTk9nZkVE?=
 =?utf-8?B?QUdtWC9HTW5iOU1BemhHRS9XVEkydllaL0FMT3lycGRwT2wyc3hJL1lUZ3M2?=
 =?utf-8?B?L1Q3ZmsrNWRRdEtydnZ3c0UzYjBTN3pTcDd4U28zK3o2bGd2eEFzdk9oZjI5?=
 =?utf-8?B?dlhSb0FpdzVGOXY1TU1KYW9YdmU5V2F1MU9teDJmalhwc0R5QXNiLzF6TFE5?=
 =?utf-8?B?Rm0xOVNvZHBUS2RIVUQ0TTh3VFBzaTFUQUwzVzZOaWRTa1dTL3hVWWRqUDY4?=
 =?utf-8?B?MDdKaWluUGlKNmh3d05mMXJkWWpyQUxPRG5xRHFLUkdFa2NTZ1MxNTZZbEE4?=
 =?utf-8?B?bndYYk9uRTRBc0JMUW84Y0cxOE9UMHkxTjB1RmNLeHJxUmlrVjJleWdHcVNi?=
 =?utf-8?B?Y0hkZHlNN1lTYlBSWWFsQUlSNkZXZnVMd0dVYTNMYkx0Zk1TRWd4aER4YXZj?=
 =?utf-8?B?WTRIK3VqcjNDTjcybDRGSkV3TkJod2duZGpQc0Fqb3cwbUJ1d1FWdXJrWjJC?=
 =?utf-8?B?U3Z5WGFhT3JZV0F6RlNodjl5ejhUQTI2UDdEU0YzV2JZbkF4ZWNncXhJNGJ1?=
 =?utf-8?B?WW8ydEh6eWlCT1R0VzdEQVBRUSs2WWlRSGNITWVIdEdYVkFxSVBLOVVBcWNr?=
 =?utf-8?B?RUV4WTBkNkx6NUxpTmNMQitXUUVycUlMTWZVc2ttZzRjOERSQldrV0NpWTNj?=
 =?utf-8?B?MERVbVVVK2thSndTbjVuM3d3MzYvY3RDV2RkTEhlNXoyVlRyN3YrQll0YkZY?=
 =?utf-8?B?TXJMRHZTZFJGeW10V2tacFJMbmgzZFNKeGtmSldGS1B4WkJkUFZ0YzJOYVh0?=
 =?utf-8?B?U1ZVaHVBTVk1VmpoODRGQlcxcGxqTHY2eXhvS2txYXFvazV3TzVLY0tzdmQ0?=
 =?utf-8?B?YTR1RVNBNVBDU292V3VHUmptRlREU0xKNnozaXlTZWthMDJTaW42OFVHeFJV?=
 =?utf-8?B?N0JIVXJiUUxIaEcyUVRMNFNETTJJSVI2dVYrcmlVZVdFQytBdDE2b2Y2bzJ6?=
 =?utf-8?B?MTlMdloxZXp1RStGMHpKMnkvQTlvSVUrN3RUZTNOVE1HSUtEK3p2OTczektU?=
 =?utf-8?B?eG9rYXlCOTBOV3RtbG0wQ0pCcU1qYnE0Z2NtQnpJUEZ1aWI5L1hhV1pESHQ0?=
 =?utf-8?B?Q1Y5OXFpdkthWmd2enNIYnJ0R0JCUitDUjduNUdKdTlLczNCVkE3S1FEZjBW?=
 =?utf-8?B?aGpQcFpkNEs1UHJLdjc3YS9rRWpVeWwrREwyMVpObFJNbXdTTWM3bEE4YUN2?=
 =?utf-8?B?VGpyOXJxbHByQWQzVHpZWGFKRG1ZYzg3UVBRVmR1L2ZhdzJQZGluWHFCQ0F2?=
 =?utf-8?B?S3hNQXdoY0Q1M28zSWxMbjREUElpMW1uVWFUNWRrcXFEbE8zUzdHSFlKWk1D?=
 =?utf-8?B?YXpGSm0wb2dRekNFdFExZjFCcS90V0FpMEtMUmJMRzVPK1pMKzV0ZTJGRnRJ?=
 =?utf-8?B?eEhHRXFZZ2xQNjkyL3g2SXMxQlY4WjQ2WUYrVU1CcmEyeWJtZTJ5eW95aFp2?=
 =?utf-8?Q?E88U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f07002-bf16-404d-b509-08d9c0793f2b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 09:48:43.7460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIvhfdo1OumzOh4xyRqfuyWwMnUnK1IB15fIyqIE6YQftBFtJMVohHsBPEYce4FH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------D447A65F17027EDD2983CE2C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Zongmin,

well what seems to happen here is that the ASIC is not correctly 
initialized.

Alex knows that better than me, but I think the issue on SI was just 
that the BIOS was somehow buggy didn't correctly initialized the register.

What you have here is most likely something completely different and you 
are just working around the symptoms.

Regards,
Christian.

Am 16.12.21 um 10:35 schrieb 周宗敏:
>
> Hi  Christian,
>
>
> I'm  testing for GPU passthrough feature, so I pass through this GPU 
> to  virtual machine to use. It  based on arm64 system.
>
>
> As far as i know, Alex had dealt with a similar problems on 
> dri/radeon/si.c .  Maybe they have a same reason to cause it?
>
> the history commit message is below:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ca223b029a261e82fb2f50c52eb85d510f4260e 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D0ca223b029a261e82fb2f50c52eb85d510f4260e&data=04%7C01%7Cchristian.koenig%40amd.com%7C4101c805880a478e13d308d9c0777e78%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637752441782176211%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=s%2B1S%2B9HwwZMV9jvitYCGufFpd2Dqjplo9lGOK4xJI3c%3D&reserved=0>
>
> image.png
>
>
> Thanks very much.
>
>
> ----
>
> *主　题：*Re: 回复: Re: [PATCH] drm/amdgpu: fixup bad vram size on gmc v8
> *日　期：*2021-12-16 16:15
> *发件人：*Christian König
> *收件人：*周宗敏Alex Deucher
>
>
> Hi Zongmin,
>
>    that strongly sounds like the ASIC is not correctly initialized 
> when    trying to read the register.
>
>    What board and environment are you using this GPU with? Is that a   
>  normal x86 system?
>
>    Regards,
>    Christian.
>
> Am 16.12.21 um 04:11 schrieb 周宗敏:
>
>> 1.
>>
>>     the problematic boards that I have tested is [AMD/ATI] Lexa      
>>          PRO [Radeon RX 550/550X] ;  and the vbios version :        
>>        113-RXF9310-C09-BT
>>
>> 2.
>>
>>     When an exception occurs I can see the following changes in      
>>          the values of vram size get from RREG32(mmCONFIG_MEMSIZE) ,
>>
>>     it seems to have garbage in the upper 16 bits
>>
>>     image.png
>>
>>
>> 3.
>>
>>     and then I can also see some dmesg like below:
>>
>>     when vram size register have garbage,we may see error      
>>      message like below:
>>
>>     amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000 -      
>>          0x000FF8F4FFFFFFFF (4286582784M used)
>>
>>     the correct message should like below:
>>
>>     amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 -      
>>      0x000000F4FFFFFFFF (4096M used)
>>
>>
>>     if you have any problems,please send me mail.
>>
>>     thanks very much.
>>
>>
>> ----
>>
>> *主　题：*Re: [PATCH] drm/amdgpu:          fixup bad vram size on gmc v8
>> *日　期：*2021-12-16 04:23
>> *发件人：*Alex Deucher
>> *收件人：*Zongmin Zhou
>>
>>
>> On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhouwrote:
>>          >
>>          > Some boards(like RX550) seem to have garbage in the upper
>>          > 16 bits of the vram size register.  Check for
>>          > this and clamp the size properly.  Fixes
>>          > boards reporting bogus amounts of vram.
>>          >
>>          > after add this patch,the maximum GPU VRAM size is 64GB,
>>          > otherwise only 64GB vram size will be used.
>>
>>          Can you provide some examples of problematic boards and     
>>      possibly a
>>          vbios image from the problematic board?  What values are you 
>>          seeing?
>>          It would be nice to see what the boards are reporting and   
>>        whether the
>>          lower 16 bits are actually correct or if it is some other   
>>        issue.  This
>>          register is undefined until the asic has been initialized.   
>>         The vbios
>>          programs it as part of it's asic init sequence (either via   
>>        vesa/gop or
>>          the OS driver).
>>
>>          Alex
>>
>>
>>          >
>>          > Signed-off-by: Zongmin Zhou
>>            > ---
>>            >  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13           
>>  ++++++++++---
>>            >  1 file changed, 10 insertions(+), 3 deletions(-)
>>            >
>>            > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>>  b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > index 492ebed2915b..63b890f1e8af 100644
>>            > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>            > @@ -515,10 +515,10 @@ static void   
>>  gmc_v8_0_mc_program(struct amdgpu_device *adev)
>>            >  static int gmc_v8_0_mc_init(struct amdgpu_device       
>>      *adev)
>>            >  {
>>            >         int r;
>>            > +       u32 tmp;
>>            >
>>            >         adev->gmc.vram_width =   
>>  amdgpu_atombios_get_vram_width(adev);
>>            >         if (!adev->gmc.vram_width) {
>>            > -               u32 tmp;
>>            >                 int chansize, numchan;
>>            >
>>            >                 /* Get VRAM informations */
>>            > @@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct 
>>            amdgpu_device *adev)
>>            >                 adev->gmc.vram_width = numchan *         
>>    chansize;
>>            >         }
>>            >         /* size in MB on si */
>>            > -       adev->gmc.mc_vram_size =     
>>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>>            > -       adev->gmc.real_vram_size =       
>>  RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
>>            > +       tmp = RREG32(mmCONFIG_MEMSIZE);
>>            > +       /* some boards may have garbage in the upper 16 
>>            bits */
>>            > +       if (tmp & 0xffff0000) {
>>            > +               DRM_INFO("Probable bad vram size:       
>>      0x%08x\n", tmp);
>>            > +               if (tmp & 0xffff)
>>            > +                       tmp &= 0xffff;
>>            > +       }
>>            > +       adev->gmc.mc_vram_size = tmp * 1024ULL *         
>>    1024ULL;
>>            > +       adev->gmc.real_vram_size =       
>>  adev->gmc.mc_vram_size;
>>            >
>>            >         if (!(adev->flags & AMD_IS_APU)) {
>>            >                 r = amdgpu_device_resize_fb_bar(adev);
>>            > --
>>            > 2.25.1
>>            >
>>            >
>>            > No virus found
>>            >                 Checked by Hillstone Network AntiVirus
>>
>


--------------D447A65F17027EDD2983CE2C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Zongmin,<br>
    <br>
    well what seems to happen here is that the ASIC is not correctly
    initialized.<br>
    <br>
    Alex knows that better than me, but I think the issue on SI was just
    that the BIOS was somehow buggy didn't correctly initialized the
    register.<br>
    <br>
    What you have here is most likely something completely different and
    you are just working around the symptoms.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 16.12.21 um 10:35 schrieb 周宗敏:<br>
    </div>
    <blockquote type="cite" cite="mid:10btoflyx2v-10buydfdywo@nsmail6.0">
      
      <p>Hi&nbsp;&nbsp;Christian,</p>
      <p><br>
      </p>
      <p>I'm&nbsp; testing for GPU passthrough feature, so I pass through
        this GPU to&nbsp; virtual machine to use. It&nbsp; based on arm64 system.</p>
      <br>
      <p>As far as i know, Alex had dealt with a similar problems on
        dri/radeon/si.c .&nbsp; Maybe they have a same reason to cause it?</p>
      <p>the history commit message is below:</p>
      <p><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D0ca223b029a261e82fb2f50c52eb85d510f4260e&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4101c805880a478e13d308d9c0777e78%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637752441782176211%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=s%2B1S%2B9HwwZMV9jvitYCGufFpd2Dqjplo9lGOK4xJI3c%3D&amp;reserved=0" originalsrc="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ca223b029a261e82fb2f50c52eb85d510f4260e" shash="Uw6H+SfHbLGDTfEYbmDncPmGhABuG7ZOWnZ/ODDtNFOSh0YS1SyvpSvq4OxipuBIdu2euBKZFiOuTmbzoiZmwb6wE0FoAvZfrgEkJotb/FnfiSBF5KMeQZKApezqezbfxgmCLNnFmdlxsWf6fScDCYiN3Ifk2S4p82jpXyUYJbY=" _src="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ca223b029a261e82fb2f50c52eb85d510f4260e" moz-do-not-send="true
 ">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ca223b029a261e82fb2f50c52eb85d510f4260e</a></p>
      <p><img src="/nsmail/js/ueditor/php/upload/image/20211216/1639647221165090.png" title="1639647221165090.png" alt="image.png" moz-do-not-send="true"></p>
      <p><br>
      </p>
      <p>Thanks very much.</p>
      <p>&nbsp; &nbsp;<br>
      </p>
      <p>----</p>
      <p>&nbsp; &nbsp;&nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: 回复: Re: [PATCH]
          drm/amdgpu: fixup bad vram size on gmc v8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>日　期：</strong><span id="date">2021-12-16 16:15</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>发件人：</strong><span id="from">Christian König</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>收件人：</strong><span id="to">周宗敏Alex Deucher</span> &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Hi Zongmin,<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;that strongly sounds like the ASIC is not correctly
        initialized when &nbsp; &nbsp;trying to read the register.<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;What board and environment are you using this GPU with? Is
        that a &nbsp; &nbsp;normal x86 system?<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;Regards,<br>
        &nbsp; &nbsp;Christian.<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;</p>
      <p>Am 16.12.21 um 04:11 schrieb 周宗敏:<br>
        &nbsp; &nbsp;</p>
      <blockquote type="cite" cite="mid:q0npc15ith-q0npc15iti@nsmail6.0">
        <ol class=" list-paddingleft-2" style="list-style-type:
          decimal;">
          <li>
            <p>the&nbsp;problematic boards that I have tested is&nbsp;[AMD/ATI]
              Lexa &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PRO [Radeon RX 550/550X] ;&nbsp; and the vbios
              version : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;113-RXF9310-C09-BT</p>
          </li>
          <li>
            <p>When an exception occurs I can see the following changes
              in &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the values of vram size get from
              RREG32(mmCONFIG_MEMSIZE) ,</p>
            <p>it seems&nbsp;to have garbage in the upper 16 bits&nbsp;</p>
            <p><img src="/nsmail/js/ueditor/php/upload/image/20211216/1639623655693645.png" title="1639623655693645.png" alt="image.png" moz-do-not-send="true"><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
            <p><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
          </li>
          <li>
            <p>and then I can also see some dmesg like below:</p>
            <p>when vram size register have garbage,we may see error &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;message like below:</p>
            <p>amdgpu 0000:09:00.0: VRAM: 4286582784M 0x000000F400000000
              - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x000FF8F4FFFFFFFF (4286582784M used)</p>
            <p>the correct message should like below:</p>
            <p>amdgpu 0000:09:00.0: VRAM: 4096M 0x000000F400000000 - &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;0x000000F4FFFFFFFF (4096M used)</p>
            <p><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
            <p>if you have any problems,please send me mail.</p>
            <p>thanks very much.</p>
            <p><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
          </li>
        </ol>
        <p>----&nbsp; &nbsp; &nbsp;&nbsp;</p>
        <p><strong>主　题：</strong><span id="subject">Re: [PATCH]
            drm/amdgpu: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup bad vram size on gmc v8</span> &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
          &nbsp; &nbsp; &nbsp; &nbsp;<strong>日　期：</strong><span id="date">2021-12-16 04:23</span>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
          &nbsp; &nbsp; &nbsp; &nbsp;<strong>发件人：</strong><span id="from">Alex Deucher</span>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<br>
          &nbsp; &nbsp; &nbsp; &nbsp;<strong>收件人：</strong><span id="to">Zongmin Zhou</span>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
        <p><br>
          &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
        <p>On Wed, Dec 15, 2021 at 10:31 AM Zongmin Zhou<zhouzongmin@kylinos.cn>wrote:<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Some boards(like RX550) seem to have garbage
            in the upper<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; 16 bits of the vram size register. &nbsp;Check for<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; this and clamp the size properly. &nbsp;Fixes<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; boards reporting bogus amounts of vram.<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; after add this patch,the maximum GPU VRAM size
            is 64GB,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; otherwise only 64GB vram size will be used.<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Can you provide some examples of problematic boards
            and &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;possibly a<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vbios image from the problematic board? &nbsp;What
            values are you &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;seeing?<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;It would be nice to see what the boards are
            reporting and &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;whether the<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lower 16 bits are actually correct or if it is some
            other &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;issue. &nbsp;This<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;register is undefined until the asic has been
            initialized. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;The vbios<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;programs it as part of it's asic init sequence
            (either via &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vesa/gop or<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the OS driver).<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Alex<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c |
              13 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;++++++++++---<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;1 file changed, 10 insertions(+), 3
              deletions(-)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; diff --git
              a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; index 492ebed2915b..63b890f1e8af 100644<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---
              a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; +++
              b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -515,10 +515,10 @@ static void &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp;gmc_v8_0_mc_program(struct amdgpu_device *adev)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;static int gmc_v8_0_mc_init(struct
              amdgpu_device &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*adev)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp;{<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; int r;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; u32 tmp;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; adev-&gt;gmc.vram_width = &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp;amdgpu_atombios_get_vram_width(adev);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; if (!adev-&gt;gmc.vram_width) {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 tmp;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int chansize, numchan;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Get VRAM informations
              */<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -562,8 +562,15 @@ static int
              gmc_v8_0_mc_init(struct &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_device *adev)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; adev-&gt;gmc.vram_width =
              numchan * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chansize;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; /* size in MB on si */<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; &nbsp; adev-&gt;gmc.mc_vram_size = &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp;RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; &nbsp; adev-&gt;gmc.real_vram_size = &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; tmp = RREG32(mmCONFIG_MEMSIZE);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; /* some boards may have garbage in
              the upper 16 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bits */<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; if (tmp &amp; 0xffff0000) {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DRM_INFO(&quot;Probable bad
              vram size: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x%08x\n&quot;, tmp);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (tmp &amp; 0xffff)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tmp &amp;= 0xffff;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; }<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; adev-&gt;gmc.mc_vram_size = tmp *
              1024ULL * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1024ULL;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp; adev-&gt;gmc.real_vram_size = &nbsp; &nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;adev-&gt;gmc.mc_vram_size;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; if (!(adev-&gt;flags &amp;
              AMD_IS_APU)) {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r =
              amdgpu_device_resize_fb_bar(adev);<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; --<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; 2.25.1<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; No virus found<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Checked by Hillstone
              Network AntiVirus<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</zhouzongmin@kylinos.cn></zhouzongmin@kylinos.cn></p>
      </blockquote>
      <p><br>
        &nbsp;</p>
    </blockquote>
    <br>
  </body>
</html>

--------------D447A65F17027EDD2983CE2C--
