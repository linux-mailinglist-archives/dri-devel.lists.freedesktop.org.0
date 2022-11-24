Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3B6376A6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6D10E6DF;
	Thu, 24 Nov 2022 10:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABCE10E6DE;
 Thu, 24 Nov 2022 10:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz/u/ZEs4UnVlYJvIVNvetMLS6nXbtnhf58+S63YfYoaPqIoLCJ6Wm/l/SVv31irkdhHTOTCpUpaR5moAWfKUahHXzgzOmE8ar1YyQm9WMWCw60b30cas1WE7h7Y3Irge2BrmNM17eRjbLJWsJKl1FBizUuNJtAx5MygQwuQOa62v7z/VC1x6tlWuVsTBivrTjmkoDUaO/pOsaxBY4TLnAcljFrXshAQW2rPzzc2K5vZg7sgDa1QuPMU1YowMs9sfKEoD6IIkhHPJt8Ahhpn9usLvlBZ/pmkc5AZKs7XUp2NgDTZREPOuNAl3/fqk7b3sToeKt+8lB2OAhfspDcGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB8lWDRuV37w5MRkM/JeMa5hjM1U1S/nHD0nSIcR0vY=;
 b=aw7pCiOS1IfpRc8U7OUeYsUgxb0fgDEKJMtwVUahFGymu/leunkjU9QQ79omOd1gK326BPGpcvpmEDywVasMikjSRL3tYuQTT7DHph07+eBr9VA9Mg9cxv7DOjMhCaqSesbHSrqQ9Pl/jJBIh0YpqP1oU0saukPGXK2hPgXD6cDvWu75qPfqhTAYSG6TxajniNcVXPpfyGL7hwBXeTq4W041oFvqqU3K/NloCVXajFxHyXkWb9eHyCQoCHYipn8KM0Bes1bj0NV+qQ0WP8P90DXRFxlzXmzClhXEbvUypZpgnSi91U95zdLDmCCGZbpLrB0leVGgB4a4Sc13YUf2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB8lWDRuV37w5MRkM/JeMa5hjM1U1S/nHD0nSIcR0vY=;
 b=4imnii+sk8eaSsWPTv/DiERj2nHdz7EbVINNo27ZiDufjZ/sSjze1EflWd28jxEwgh08SMAecsdI3wpzaKWWPTu34A+adv+lIyG3PeQC5lMXTqQ7vwh+EbnSsiCREfx4GSR8n/f3LCeho2IGVqNEU+/iu+3MQkuELFBRMVPwc4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 10:41:34 +0000
Received: from SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f]) by SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f%3]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 10:41:34 +0000
Message-ID: <4ac1b046-b3bc-6090-f03a-eb6352f52a5a@amd.com>
Date: Thu, 24 Nov 2022 16:11:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: en-US
To: "Quan, Evan" <Evan.Quan@amd.com>, =?UTF-8?B?5p2O55yf6IO9?=
 <lizhenneng@kylinos.cn>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel.daenzer@mailbox.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
 <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
 <800a1207-8ff6-4cfa-60f3-6ff456874890@mailbox.org>
 <4adc40d1-e775-c480-bb35-23fe9c63e05e@kylinos.cn>
 <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::6) To SN6PR12MB4621.namprd12.prod.outlook.com
 (2603:10b6:805:e4::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 760fca32-723a-4632-bc67-08dace0874b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/fqJR+vahEi2F0mJzYyyPnMdE9qenXJfmmhN60P0Et5NGy4LhxXHCjgb3YCZQupyhe+o/nd3FncOa2QSJTLU2oG+n+PoPt5MtvGEV5AoVsVfM/w6nLu1GDBEK4WLABClMktMPIJ0IlYnK7oC758fPM6GvnZXVBfOnFy3+feqvjsBoLuW52X9OF2eLRwJYsBuBvvvsLg9aQtEGlepKeIHou+ghGvAvkMejqvmySQrY45oYP4aB8vXdrbPflIQCtabwL/9zvOsS0IqDCvmzBZD0Gv+DIiHVJGaY05+xKhoINt46Jkm6eMdnWLWbEyqMbg+A5dmo7gosImy+wB5SRmK4457TI+pYGEvAUpTmgWNsApNxgNMIWIy+F9S4BITF8/Y5CHV6RY5GduhHoviD5ToLpHMAs4kIQiJAHLVivZQvB10oPwiVHmXQpqy0dqcZinDbhzb9MbUc3sVGARNfTqAMaZC0aQjPL9DONNKhYX5VJgoDL12RsD/Wd3sBio7VJKnei+UC8NgvAB13dZ9tGIf4FsZwYUNRb0zLhr3sgSLVLFL++PRXoR60r3gLxG1o3+iVqjt4Fm5TAxT1bTt4RPSw2mLRGP5iNMCyYtWFonwwNqqM10PO2LTu/7JsCJPyxoNwd3BtqYWk1q1UKDGwulr0koW8cdZRXHe6LpWBrBCYjqh6Ae80IyEezDXffMvUsmMDznKyaRBNhDanfmVS+tLjbGz1PTwtlrQOKJso6AzLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(83380400001)(2616005)(6512007)(26005)(66574015)(186003)(38100700002)(5660300002)(2906002)(8936002)(478600001)(6666004)(6486002)(41300700001)(6506007)(53546011)(66946007)(66556008)(66476007)(8676002)(4326008)(54906003)(6636002)(110136005)(316002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QStzRFZNckNjdmF3dFNJbU55TUwzWitYN05zVjc0OVZsOXlObzVDNEJIOTFE?=
 =?utf-8?B?bUlsY0lDL1lwQXNpdXVmU0FGK3dHdEl3L2xlMnpPQlI1cW9RdUVwbVI4SVZV?=
 =?utf-8?B?aC9CeVZZbzh3WDJOckViQ1l1ZGlNK05xY21jZ0JOenZNRVFtMU53WUZGZlAx?=
 =?utf-8?B?Zk1rbWp4a1lqb0dJR1gwM1VtaVl1RWVydUhLd21xZ1Z5eTFZamdLdWdNczhM?=
 =?utf-8?B?SlRMWmUyZnR3M2xhZkNSekFDZlJOajNFZWdpQjN5cWNPTktXZlh0MU9JTEY2?=
 =?utf-8?B?cFBQQjBHSmRya2pab2xyQWJHMEVJd2c0MVBqajdVM3RlT0szM0w2bWFNdzRR?=
 =?utf-8?B?K0IrZmI2eE4wYi93dkY0cUtiVFNKVlA4RDh6Nlo2UWtmMU5xUERTNWdkM2p1?=
 =?utf-8?B?VkdHV0VaOWtYR3ErV1NHeG9GZTFQb3ptYlZkMXN3WEJ2MlQyTFh4emFSZTVz?=
 =?utf-8?B?UFdsa0NXdXYxR1p3NFhlTHN3LzZ3M0FsaVpwRFBJRkllU25MZTEvTTF2UnFu?=
 =?utf-8?B?T0YxOWNoRmxCWW1XRElZM3VVdmY4S2NMYlRkQmNxZi9XeHpYamRtSk5obE5a?=
 =?utf-8?B?NkVNVGoyUHlSR1BUS0pLRGNKeE92TkpNZm1NVHJhSG1ra0E0VlN0bENpYXMr?=
 =?utf-8?B?cFhkaHpocEFHSUsrMTBtZTZwUXpTNitTVTU2ejY3UmYvTmNjcFJCVG91MFk2?=
 =?utf-8?B?Vjd0MWw1R3Mvb2xGc1liNkZhdUV2TkNRR3dlUFhHUzZoUmM5RytLVS9oMWF3?=
 =?utf-8?B?TTFGaWVTcEM5dElTM0tjRHk4VFl2eDFRRzh3c1BvWC9CK2ttWkV4djZaZUdO?=
 =?utf-8?B?YXZoUUJDU2x2UktZK0dBS2EzRlBaamwrcXFRMnZTdmZpVzFxczc5WW9nYWpY?=
 =?utf-8?B?RzFmbUlNVVJ1MEVRbVVyb2NHSCtMSGFJd2l3RlQyTFZUK0xEcnpPZTlQV3dn?=
 =?utf-8?B?QjFTN3BuRENzZzdyM2tHd08yd3VGWG1VM0VEY1dhL3h5WU96cUdOOVZBV2dH?=
 =?utf-8?B?K0JBZlg2QzZWdndiV0ZyKytZMzJCUXNlMXByQjB0YkFxcnJIU3pHTzg2bHVj?=
 =?utf-8?B?dTRMZ0U0RmQ4eU1XenY2bldmR3E4b3Q4NU5BR0dhRy92cEU5VUFrOUZXcWRQ?=
 =?utf-8?B?a21LcTc0OUtXSTc4a21WNkJSdVFuSjZhcFhPck9JTjFPWGJBc1V3MDNSai9Z?=
 =?utf-8?B?N1o5NTlMWVVrSjFFT0xtcGF2RnlHOXNQeDQ2Z2ZOb1NnNkd4bmVFM0tFYjhK?=
 =?utf-8?B?c2lFbVg2bVI4bk9iRGVZSndIMEI1RytTenVvNzFUbm5WNG15bHFtTHIxWlpD?=
 =?utf-8?B?Z2E2VVJmeXNjZ0Q4TFFXSXhIdExhMklzUDY1MmpUNnVSdzM3VFJMcUNvT0FU?=
 =?utf-8?B?YjdpRnZGdnh0K1dNTXZkL2VQRjF4Tmt0QTAyTHNMZlNzcUpENW9VSkZrYTVz?=
 =?utf-8?B?SWRhVEVMQ09QanhubjMrYkVwSUNQTjNjWU5TQ2I4MktTaHpYZWx6TmRvVTlL?=
 =?utf-8?B?VExBdnpRV3pUWDJYdUNCRGd6N0lOWnpYcDF4SEVVK2kvbzgraUdXR1d5V2lW?=
 =?utf-8?B?VjQ1K0VwQ3lXYUtXTW1RcGRXUzhCbm1HNUk0Wjg2MVF6STR5L2RMY3JnMk9p?=
 =?utf-8?B?eUQ3MzU5WGpzQW9xbklFbithbVVJTHcwOW1zbFA4aWI3YlVZZXdyLzh5SlVK?=
 =?utf-8?B?U2RmQ1ZLUWZHK0EyZ2M1MHZZZnNiYWlsU0V6Ui83V3lZUmgxM0ZnR1BpTkRu?=
 =?utf-8?B?LzFEb1FFSS8vSXByU29xSXpsa0lZRmhhNHZ4RGYzTFNyOWVaQjU5em56K0xs?=
 =?utf-8?B?eTZ0WjlJUGdudUtYdE0wSVUyZ0NUYTc4OG5NMmZCUCtGdWY3QXJnRk9GcGE4?=
 =?utf-8?B?ckRTWmNvMGd4RlFWbzhzcnlGRUsxY21mSUpib2UvangrSkdKWVphSzdkUGRY?=
 =?utf-8?B?VHJlcVZQUjJWZ3h2SGNTVjhxcHhvQkEyQjUyN0QwOEJQT20rM0p2eWtSNkNZ?=
 =?utf-8?B?TVR1WkYwSmlaMkY0OXBwdEVtUGUwRUxvMWlEeW01eXlORGNDV2doejZxQzkw?=
 =?utf-8?B?c0ZZNys2QS9EWXN1TXMrZExlNmY1eDJLckRrUURJVFE1Ti9xbkpMdFpsTURH?=
 =?utf-8?Q?As3/z7nKVHmsxkzmBWg+yZMi9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760fca32-723a-4632-bc67-08dace0874b1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 10:41:34.3274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5GceJUq+ZmhruzIa01H707b+/ZR25o8JhGhcWfcCR5jdc8eKE1TLgfUXnjXEfOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/24/2022 3:34 PM, Quan, Evan wrote:
> [AMD Official Use Only - General]
> 
> Could the attached patch help?
> 
> Evan
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of ???
>> Sent: Friday, November 18, 2022 5:25 PM
>> To: Michel Dänzer <michel.daenzer@mailbox.org>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/amdgpu: add mb for si
>>
>>
>> 在 2022/11/18 17:18, Michel Dänzer 写道:
>>> On 11/18/22 09:01, Christian König wrote:
>>>> Am 18.11.22 um 08:48 schrieb Zhenneng Li:
>>>>> During reboot test on arm64 platform, it may failure on boot, so add
>>>>> this mb in smc.
>>>>>
>>>>> The error message are as follows:
>>>>> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init
>>>>> [amdgpu]] *ERROR*
>>>>>                   late_init of IP block <si_dpm> failed -22 [
>>>>> 7.006919][ 7] [  T295] amdgpu 0000:04:00.0:

The issue is happening in late_init() which eventually does

	ret = si_thermal_enable_alert(adev, false);

Just before this, si_thermal_start_thermal_controller is called in 
hw_init and that enables thermal alert.

Maybe the issue is with enable/disable of thermal alerts in quick 
succession. Adding a delay inside si_thermal_start_thermal_controller 
might help.

Thanks,
Lijo

>>>>> amdgpu_device_ip_late_init failed [    7.014224][ 7] [  T295] amdgpu
>>>>> 0000:04:00.0: Fatal error during GPU init
>>>> Memory barries are not supposed to be sprinkled around like this, you
>> need to give a detailed explanation why this is necessary.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>>>>>     1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> index 8f994ffa9cd1..c7656f22278d 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct
>>>>> amdgpu_device *adev)
>>>>>         u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>>>>>         u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>>>>>     +    mb();
>>>>> +
>>>>>         if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>>>>>             return true;
>>> In particular, it makes no sense in this specific place, since it cannot directly
>> affect the values of rst & clk.
>>
>> I thinks so too.
>>
>> But when I do reboot test using nine desktop machines,  there maybe report
>> this error on one or two machines after Hundreds of times or Thousands of
>> times reboot test, at the beginning, I use msleep() instead of mb(), these
>> two methods are all works, but I don't know what is the root case.
>>
>> I use this method on other verdor's oland card, this error message are
>> reported again.
>>
>> What could be the root reason?
>>
>> test environmen:
>>
>> graphics card: OLAND 0x1002:0x6611 0x1642:0x1869 0x87
>>
>> driver: amdgpu
>>
>> os: ubuntu 2004
>>
>> platform: arm64
>>
>> kernel: 5.4.18
>>
>>>
