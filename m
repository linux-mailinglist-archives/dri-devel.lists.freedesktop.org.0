Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9959996D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 12:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8C510E53D;
	Fri, 19 Aug 2022 10:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971DE10E77E;
 Fri, 19 Aug 2022 10:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr7xbyqzzgDVGkmzRfNkchp5CQvPBNMx0EOXt+AyiS1Qp092S3RRJCMWzpCp10y2VkDUkqIHd24aC10zdlOLvpd1bfW9TWcdATiS7wkQP3L6ViYO52h4ohIBnNVHlBheRtyXjKsTHGbLA8tOZJtGbqd01JZAjEQy/odCs8Ji6X7ZkQybOSSnOoeheegnJEPjTTL7GXgsLUFqaxDWUC2AW+QDE8LWHopZLexNMOb+cdd3jPCJDPan3MlM080UBOSe+mGNLmAuT+nWZ4dCSrMVTYRzqH47PVCwwdOIPk5OFzFxveWvvbu39n18uXICo5FgAyXWKOOuqYkFTNwsqyQD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bljK2icGTaTEDY3GBrjDw0PbwB3FC8/syTleF2Nb5jU=;
 b=aFb8Gil+9tKaK5EKISZkCxW3aXb6iVF6TNpl3PDSe5UYd6R9T1le8vJdm1w1aiJgGAQ9ZQ4UgTtILSU5MIE2qR1+0xCGXw4GvIRVEaKPVdQa4iEi+Vmdr21Ki9pdoqGxchHw9v4eMWyXN9h7T7Mat35iXJ1J9cSnTGu5qadoQZyBwhJOa+3EhLEaY3mJ0YQGjk7EHAZTDb/PxjqCLLnjmDqJA5r8pVzk09+VUOG48epdtCKKX96Mmi+41LybGbL486ZyQMvjYnhXrq9XHGFP84xBgroAtDUX+JkqFIghwMWbtFJRgLwxQ9/D8H5Hb3DeuA1jbPMZW0Haoi1r0bSF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bljK2icGTaTEDY3GBrjDw0PbwB3FC8/syTleF2Nb5jU=;
 b=ib00q1DrR9QhpY7yfAXoEPfwhIfenr0xiOWZ3+VEWcnPbXWCLNrX+vvlNucssQlhARqhSQfN7/u9rHisr0/SrM7v3pukGU2ROMdxgFj/6zRn/xBluexU3IJBtOgQYPAMfni4dvrpGOvnrVJxRCTSbDpymYsrtGSgfhpIIsldmnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4869.namprd12.prod.outlook.com (2603:10b6:a03:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 10:07:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 19 Aug 2022
 10:07:26 +0000
Content-Type: multipart/alternative;
 boundary="------------BwWEM0gKYUioBCws7pfhRl28"
Message-ID: <ae63a061-3fe0-ae46-51f3-46d80fda3987@amd.com>
Date: Fri, 19 Aug 2022 12:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/radeon: add a force flush to delay work when radeon
Content-Language: en-US
To: =?UTF-8?B?5p2O55yf6IO9?= <lizhenneng@kylinos.cn>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220811072540.964309-1-lizhenneng@kylinos.cn>
 <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
 <db2a43da-256d-402e-882b-c05436d4e83b@kylinos.cn>
 <c3c1310b-5e84-e4e9-0df9-3f45c976a508@amd.com>
 <2f38b94b-0965-80f2-5bae-840765ffc4da@kylinos.cn>
 <cc30a694-c784-f42c-bab6-b45c70202c56@amd.com>
 <103b4a67-385c-68f5-f40f-39bbc1d9f723@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <103b4a67-385c-68f5-f40f-39bbc1d9f723@kylinos.cn>
X-ClientProxiedBy: AS9PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0316e20-ea2e-48cb-6c24-08da81ca9dd7
X-MS-TrafficTypeDiagnostic: BY5PR12MB4869:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bW38UlmEJDpjX1jTG0IZwzIrZlHdriOlK6GVTahlIQgyHEmUTzlduCF8rDTwEQpxO8R45HbOjnyiJjLQxS0IhW79eofBqk2wczRnFw7Uwc42sPSCoGutjiuelTSnDQZ4w+0Egq+srevgWUZmCfTEa3Srk+tPKKRbIrh+yZQMHG8fz/fjfq/01Pd0jhSbGanIlFZo0LGO/q1Cs32Rk9IsDEzrJE6AOZRovlmlBUOmD3JVI2Q191HwDUKFzEbHAE6OayoavSl1PYfMvNXlACMSchgUpzSskOqD56HDXBKySJp0q1pY08bqIPPLber0ugpcDbBX7TL1Mk3vQx6Qeyg49lHYpLLIjfVxerHIHK8mAtsFKZtHXLnuWHtDYJLO2Or5fpqKsJbMHY1yklTRPnXnUc0/9w+YPhP1SJfj5ZPT85Iu1COo4OH8g4hHe+pkmbq+wLjhWWgLMHUnowgVEwCq/Atstsizlv0ZFnIiU7Fg3eT7lT1YujGfir7hNpAWDiMET8QMP2gPjnQwtnSv7H44HB8Kpq4Y0gQIvRiC+p13WwH+jGqEpHfU50tjsQfOAQBiJtRsTrl31bCrsqvKeQAwkdvkWhoKNsm/gGLYqRVsxAlvUb1rmsFNTV63Ma4GCxtg4KIfBtGsT3K0J58KT19SsGVwdQA/j4DGt1jswRYaR1nZr7J28eoX1DXDKROK4mvQsHUoVwi0Gl9o9oelP+X2v5MsEpALIvE65y0V7IJ0Km8OLcitXaV6j2ixM6+sOOs7SQaohg2s1SRBoLkTZZ3rumeB4ST5YBmiq+13nczmZNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(8676002)(4326008)(66476007)(110136005)(316002)(6636002)(54906003)(66556008)(66946007)(8936002)(5660300002)(30864003)(2906002)(38100700002)(86362001)(31696002)(36756003)(478600001)(41300700001)(6506007)(33964004)(6666004)(6486002)(66574015)(186003)(83380400001)(6512007)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09Pa0U5dEE4M3h0SWVsWWlTSHpmR3V4YkswdzNlKyt4dHN1S3UyNWpMTCs4?=
 =?utf-8?B?bUxKZyt3Y0Jqdjd5TVhzS0oxcGlPWUtMS0NQK0hsMWV1MDNTRzZzaGpub2FB?=
 =?utf-8?B?eWVzOWIzRlpPeUVtUnhtRnJ2MkIrK3ppV0ZaVW5ObE1DT1N3WXdrQzU4Rld5?=
 =?utf-8?B?UXZ5WXVzMkZKVXptVlptaUFERnJSWSsyTkJvbHZqMElxZDlyU2wrZkVOZmQr?=
 =?utf-8?B?bENNN3FHbENDMTNObHlJTitucFdVbitBcmxYeDJOLzdXZlZubXVYVnBuZ2ll?=
 =?utf-8?B?S1kwUU1lQWI2NEpqLzlPVDlSZXNEOTU5VXNVM21HU05YRjhTZ08xM3JLR1dL?=
 =?utf-8?B?cS92bzNqUUswNW1RY0pLY0F2NTZBK1JQL2k2azgvN0VEVDRWK2I2cGs1UUF0?=
 =?utf-8?B?L0Jrb01RTUU3ck1XUUk3ZnpNTHN3N3dUazRNQ2NRNTJGdEttSWUxN2t0a1Nj?=
 =?utf-8?B?c0g0REpWK0taUVNIcEU4WFlmRW1FaGVrZGhERjByZ3hyNkovdXdOSlcra05i?=
 =?utf-8?B?SWhueXBHaTVrdEYwNkdvUWlaSDJ6ZC9FMUhCUnNiYkJnSk5zTWthWU9mZEhh?=
 =?utf-8?B?VWJ3aDgrelpRb2w1SWpBN2w1QW54R2YvN1pKcFRkMU4zWnpOR0pUSVFiaEZm?=
 =?utf-8?B?b2RIM0hIcmhLZ2FwRXE2OGVzR3krSEs4UG9NamVDUHdJanR6aWZnaEdzaWda?=
 =?utf-8?B?UFd0SXNMSjM2NFhSRzRPL3ZjNFk4VEk5aklQK3JwS0RmaUp6emlPNW9OMEkv?=
 =?utf-8?B?L094VStKQSsyRWZwQnJaZnNNSGZDWGFpYS84ZWdNNkk4R1FlNmJtL3M4UHgz?=
 =?utf-8?B?OU81TVdqODBid1BSR0g2bWQwZDdtRVRzclptc2JJNW1tOTFPejROQjZiSTdZ?=
 =?utf-8?B?Ny96NW9VaDgwR09tTUNBUUZaUDEwRFlrYTFTdWk0d29RWitHR3ZyTVFQMktQ?=
 =?utf-8?B?MGVLNHJ1enUyZmIyeUVGRTdQZXE4TnhCRGpUSXZJemErTk9qNUNTdzA2R2RS?=
 =?utf-8?B?T0xDVHRRVjBVZU05MXY4N0RSemxxWFlSOFFCYmdqUXJETHFTSjN1TkMweE5K?=
 =?utf-8?B?UGl5cm9GeVlweE80ODJSUSs4MzdkamFrenJIR2V6bkRneFIveXpHNkJPZ21P?=
 =?utf-8?B?ZjA5eUZOTlZnbEFUZnY1VmdrZG9oTm1PS0RRZWRYcEN3S0hoaGN4MEU3aGcy?=
 =?utf-8?B?ZUI0Q3lFRmhzWEZQNmE3V3czdVdoOTlQUHE1eHM3UnA5ekQ5N0lld2ZlMUVp?=
 =?utf-8?B?dnBlZVBBWTQvOVNBcTFNdk5MQjlFM3VrZHBVQUY5aFpMMDJTUVNNdC84L3Nk?=
 =?utf-8?B?MlRML1dFaEhPc3RVTGF1YWd4aVRZTnRXZTlxS2hKSFFNdExDZWNaQ1QyZEdr?=
 =?utf-8?B?U1VLV3ZMWTdXL3NTSUNpdDVyT011TmpTNWhLbGhJcGdzU0ZHWStnNW1xZ05G?=
 =?utf-8?B?bVVmNEI3czRGdnhRSW16dHI4d0ZkRjdCazBKc3VwN1lBK3JPU3BwOE8xN3Zr?=
 =?utf-8?B?dndGUjhhU012a0l6UlVBZUhGYjBHZ2YwQmFFc1hlTEpMblluTVhGZU12dzVS?=
 =?utf-8?B?NU5VZWZyakxsS2ZWNm1aUlowVU9GNURrcHVBY0dqVzE4V0Y5VTRGUDUyWE9l?=
 =?utf-8?B?NVlReS8xUzE3MzFjTERBQy93Ly9GME43RTRDM01JOThXUDVpMVRIL3hCbi9h?=
 =?utf-8?B?S1EwU1ZWbEdhQjRGeWVuVU5EUGNFaGJVeWxLUHowZ2lmbk45RnEvTGhmUzhu?=
 =?utf-8?B?MmMzZmdibXR0cGRpTGRMTlBqK1lxN2xmRG9oVFMyQjhhak9TL3JuUXdaemtE?=
 =?utf-8?B?SVA2NWZUZEFabHlXL0NSTTdIU1VPMmp2NC8xMU5ISXFkUy9VeXppRlJFd3FZ?=
 =?utf-8?B?NkFYT3drRDhxZTcyTHpkK1pETHpaa0xqd1plTjUrY2xBZGZBaUZDVVFzdUdL?=
 =?utf-8?B?ZXErS1g5VkROWDJKTDRyYWdJbUxLUnUvZjYwR1Z1TGFhck42a2x4TlJPcUxM?=
 =?utf-8?B?ekRYbXMyZ0szcDA5dEQ2S3FmUHg2MG9LTFVjMndsamp5WFJCWEJ4RzRkbmRW?=
 =?utf-8?B?S1M4LytGZEY2Rk5xT1JHWGpjb1JwY3Yrd2I5a1VZYzZpU3dwdzVFeEZTZVp0?=
 =?utf-8?B?OGpURXBERmdibnZ4eGRZSGhUMTM1bjdCeVhxWTJvcnZaVG5rMWFuMkhNVjZ5?=
 =?utf-8?Q?hAuCvmo6/7NpUxbkgQsd52Mu6Cgym0GxVeiKMpo3rj5v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0316e20-ea2e-48cb-6c24-08da81ca9dd7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 10:07:25.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uC7Pdb+/w4hTnlH3k2iPPEklbL9nm2SEGPWxq0fWQUGeE8gl9YM00WmQ+lCA7mq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4869
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
Cc: David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------BwWEM0gKYUioBCws7pfhRl28
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 19.08.22 um 11:34 schrieb 李真能:
>
> 在 2022/8/17 19:40, Christian König 写道:
>
>> Am 17.08.22 um 09:31 schrieb 李真能:
>>>
>>> 在 2022/8/15 21:12, Christian König 写道:
>>>> Am 15.08.22 um 09:34 schrieb 李真能:
>>>>>
>>>>> 在 2022/8/12 18:55, Christian König 写道:
>>>>>> Am 11.08.22 um 09:25 schrieb Zhenneng Li:
>>>>>>> Although radeon card fence and wait for gpu to finish processing 
>>>>>>> current batch rings,
>>>>>>> there is still a corner case that radeon lockup work queue may 
>>>>>>> not be fully flushed,
>>>>>>> and meanwhile the radeon_suspend_kms() function has called 
>>>>>>> pci_set_power_state() to
>>>>>>> put device in D3hot state.
>>>>>>
>>>>>> If I'm not completely mistaken the reset worker uses the 
>>>>>> suspend/resume functionality as well to get the hardware into a 
>>>>>> working state again.
>>>>>>
>>>>>> So if I'm not completely mistaken this here would lead to a 
>>>>>> deadlock, please double check that.
>>>>>
>>>>> We have tested many times, there are no deadlock.
>>>>
>>>> Testing doesn't tells you anything, you need to audit the call paths.
>>>>
>>>>> In which situation, there would lead to a deadlock?
>>>>
>>>> GPU resets.
>>>
>>> Although flush_delayed_work(&rdev->fence_drv[i].lockup_work) will 
>>> wait for a lockup_work to finish executing the last queueing,  but 
>>> this kernel func haven't get any lock, and lockup_work will run in 
>>> another kernel thread, so I think flush_delayed_work could not lead 
>>> to a deadlock.
>>>
>>> Therefor if radeon_gpu_reset is called in another thread when 
>>> radeon_suspend_kms is blocked on flush_delayed_work, there could not 
>>> lead to a deadlock.
>>
>> Ok sounds like you didn't go what I wanted to say.
>>
>> The key problem is that radeon_gpu_reset() calls radeon_suspend() 
>> which in turn calls rdev->asic->suspend().
>>
>> And this function in turn could end up in radeon_suspend_kms() again, 
>> but I'm not 100% sure about that.
>>
>> Just double check the order of function called here (e.g. if 
>> radeon_suspend_kms() call radeon_suspend() or the other way around).  
>> Apart from that your patch looks correct to me as well.
>>
> radeon_gpu_reset will call radeon_suspend, but radeon_suspend will not 
> call radeon_suspend_kms, the more detail of call flow, we can see the 
> attachement file: radeon-suspend-reset.png.
>
> Sorry  I may have mistaken your meaning.
>

Ok in this case my memory of the call flow wasn't correct any more.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the patch.

Alex should then pick it up for upstreaming.

Thanks,
Christian.

>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>>>>>>>> Configuration and Message requests are the only TLPs accepted 
>>>>>>>> by a Function in
>>>>>>>> the D3hot state. All other received Requests must be handled as 
>>>>>>>> Unsupported Requests,
>>>>>>>> and all received Completions may optionally be handled as 
>>>>>>>> Unexpected Completions.
>>>>>>> This issue will happen in following logs:
>>>>>>> Unable to handle kernel paging request at virtual address 
>>>>>>> 00008800e0008010
>>>>>>> CPU 0 kworker/0:3(131): Oops 0
>>>>>>> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 
>>>>>>> Tainted: G        W
>>>>>>> pc is at si_gpu_check_soft_reset+0x3c/0x240
>>>>>>> ra is at si_dma_is_lockup+0x34/0xd0
>>>>>>> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
>>>>>>> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
>>>>>>> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
>>>>>>> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
>>>>>>> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
>>>>>>> s6 = fff00007ef07bd98
>>>>>>> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
>>>>>>> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
>>>>>>> t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = 
>>>>>>> ff6769c5d964b800
>>>>>>> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
>>>>>>> gp = ffffffff81d89690  sp = 00000000aa814126
>>>>>>> Disabling lock debugging due to kernel taint
>>>>>>> Trace:
>>>>>>> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
>>>>>>> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
>>>>>>> [<ffffffff80977010>] process_one_work+0x280/0x550
>>>>>>> [<ffffffff80977350>] worker_thread+0x70/0x7c0
>>>>>>> [<ffffffff80977410>] worker_thread+0x130/0x7c0
>>>>>>> [<ffffffff80982040>] kthread+0x200/0x210
>>>>>>> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
>>>>>>> [<ffffffff80981f8c>] kthread+0x14c/0x210
>>>>>>> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
>>>>>>> [<ffffffff80981e40>] kthread+0x0/0x210
>>>>>>>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020 8c3001e8 40230101
>>>>>>>   <88210000> 4821ed21
>>>>>>> So force lockup work queue flush to fix this problem.
>>>>>>>
>>>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>>>>>>> b/drivers/gpu/drm/radeon/radeon_device.c
>>>>>>> index 15692cb241fc..e608ca26780a 100644
>>>>>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>>>>>> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device 
>>>>>>> *dev, bool suspend,
>>>>>>>           if (r) {
>>>>>>>               /* delay GPU reset to resume */
>>>>>>> radeon_fence_driver_force_completion(rdev, i);
>>>>>>> +        } else {
>>>>>>> +            /* finish executing delayed work */
>>>>>>> + flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>>>>>>>           }
>>>>>>>       }
>>>>>>
>>>>
>>

--------------BwWEM0gKYUioBCws7pfhRl28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 19.08.22 um 11:34 schrieb 李真能:<br>
    <blockquote type="cite" cite="mid:103b4a67-385c-68f5-f40f-39bbc1d9f723@kylinos.cn">
      
      <p>在 2022/8/17 19:40, Christian König 写道:<br>
      </p>
      <blockquote type="cite" cite="mid:cc30a694-c784-f42c-bab6-b45c70202c56@amd.com">Am
        17.08.22 um 09:31 schrieb 李真能: <br>
        <blockquote type="cite"> <br>
          在 2022/8/15 21:12, Christian König 写道: <br>
          <blockquote type="cite">Am 15.08.22 um 09:34 schrieb 李真能: <br>
            <blockquote type="cite"> <br>
              在 2022/8/12 18:55, Christian König 写道: <br>
              <blockquote type="cite">Am 11.08.22 um 09:25 schrieb
                Zhenneng Li: <br>
                <blockquote type="cite">Although radeon card fence and
                  wait for gpu to finish processing current batch rings,
                  <br>
                  there is still a corner case that radeon lockup work
                  queue may not be fully flushed, <br>
                  and meanwhile the radeon_suspend_kms() function has
                  called pci_set_power_state() to <br>
                  put device in D3hot state. <br>
                </blockquote>
                <br>
                If I'm not completely mistaken the reset worker uses the
                suspend/resume functionality as well to get the hardware
                into a working state again. <br>
                <br>
                So if I'm not completely mistaken this here would lead
                to a deadlock, please double check that. <br>
              </blockquote>
              <br>
              We have tested many times, there are no deadlock. <br>
            </blockquote>
            <br>
            Testing doesn't tells you anything, you need to audit the
            call paths. <br>
            <br>
            <blockquote type="cite">In which situation, there would lead
              to a deadlock? <br>
            </blockquote>
            <br>
            GPU resets. <br>
          </blockquote>
          <br>
          Although
          flush_delayed_work(&amp;rdev-&gt;fence_drv[i].lockup_work)
          will wait for a lockup_work to finish executing the last
          queueing,&nbsp; but this kernel func haven't get any lock, and
          lockup_work will run in another kernel thread, so I think
          flush_delayed_work could not lead to a deadlock. <br>
          <br>
          Therefor if radeon_gpu_reset is called in another thread when
          radeon_suspend_kms is blocked on flush_delayed_work, there
          could not lead to a deadlock. <br>
        </blockquote>
        <br>
        Ok sounds like you didn't go what I wanted to say. <br>
        <br>
        The key problem is that radeon_gpu_reset() calls
        radeon_suspend() which in turn calls
        rdev-&gt;asic-&gt;suspend(). <br>
        <br>
        And this function in turn could end up in radeon_suspend_kms()
        again, but I'm not 100% sure about that. <br>
        <br>
        Just double check the order of function called here (e.g. if
        radeon_suspend_kms() call radeon_suspend() or the other way
        around).&nbsp; Apart from that your patch looks correct to me as
        well. <br>
        <br>
      </blockquote>
      <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px;
        margin-right:0px; -qt-block-indent:0; text-indent:0px;">radeon_gpu_reset
        will call radeon_suspend, but radeon_suspend will not call
        radeon_suspend_kms, the more detail of call flow, we can see the
        attachement file: radeon-suspend-reset.png.</p>
      <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px;
        margin-right:0px; -qt-block-indent:0; text-indent:0px;">Sorry&nbsp; I
        may have mistaken your meaning.<br>
      </p>
    </blockquote>
    <br>
    Ok in this case my memory of the call flow wasn't correct any more.<br>
    <br>
    Feel free to add an Acked-by: Christian König
    <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> to the patch.<br>
    <br>
    Alex should then pick it up for upstreaming.<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:103b4a67-385c-68f5-f40f-39bbc1d9f723@kylinos.cn">
      <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px;
        margin-right:0px; -qt-block-indent:0; text-indent:0px;"> </p>
      <p>
        <style type="text/css">p, li { white-space: pre-wra</style><br>
      </p>
      <blockquote type="cite" cite="mid:cc30a694-c784-f42c-bab6-b45c70202c56@amd.com">Regards,
        <br>
        Christian. <br>
        <br>
        <blockquote type="cite"> <br>
          <blockquote type="cite"> <br>
            Regards, <br>
            Christian. <br>
            <br>
            <blockquote type="cite"> <br>
              <blockquote type="cite"> <br>
                Regards, <br>
                Christian. <br>
                <br>
                <blockquote type="cite">Per PCI spec rev 4.0 on
                  5.3.1.4.1 D3hot State. <br>
                  <blockquote type="cite">Configuration and Message
                    requests are the only TLPs accepted by a Function in
                    <br>
                    the D3hot state. All other received Requests must be
                    handled as Unsupported Requests, <br>
                    and all received Completions may optionally be
                    handled as Unexpected Completions. <br>
                  </blockquote>
                  This issue will happen in following logs: <br>
                  Unable to handle kernel paging request at virtual
                  address 00008800e0008010 <br>
                  CPU 0 kworker/0:3(131): Oops 0 <br>
                  pc = [&lt;ffffffff811bea5c&gt;]&nbsp; ra =
                  [&lt;ffffffff81240844&gt;]&nbsp; ps = 0000 Tainted:
                  G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W <br>
                  pc is at si_gpu_check_soft_reset+0x3c/0x240 <br>
                  ra is at si_dma_is_lockup+0x34/0xd0 <br>
                  v0 = 0000000000000000&nbsp; t0 = fff08800e0008010&nbsp; t1 =
                  0000000000010000 <br>
                  t2 = 0000000000008010&nbsp; t3 = fff00007e3c00000&nbsp; t4 =
                  fff00007e3c00258 <br>
                  t5 = 000000000000ffff&nbsp; t6 = 0000000000000001&nbsp; t7 =
                  fff00007ef078000 <br>
                  s0 = fff00007e3c016e8&nbsp; s1 = fff00007e3c00000&nbsp; s2 =
                  fff00007e3c00018 <br>
                  s3 = fff00007e3c00000&nbsp; s4 = fff00007fff59d80&nbsp; s5 =
                  0000000000000000 <br>
                  s6 = fff00007ef07bd98 <br>
                  a0 = fff00007e3c00000&nbsp; a1 = fff00007e3c016e8&nbsp; a2 =
                  0000000000000008 <br>
                  a3 = 0000000000000001&nbsp; a4 = 8f5c28f5c28f5c29&nbsp; a5 =
                  ffffffff810f4338 <br>
                  t8 = 0000000000000275&nbsp; t9 = ffffffff809b66f8&nbsp; t10 =
                  ff6769c5d964b800 <br>
                  t11= 000000000000b886&nbsp; pv = ffffffff811bea20&nbsp; at =
                  0000000000000000 <br>
                  gp = ffffffff81d89690&nbsp; sp = 00000000aa814126 <br>
                  Disabling lock debugging due to kernel taint <br>
                  Trace: <br>
                  [&lt;ffffffff81240844&gt;] si_dma_is_lockup+0x34/0xd0
                  <br>
                  [&lt;ffffffff81119610&gt;]
                  radeon_fence_check_lockup+0xd0/0x290 <br>
                  [&lt;ffffffff80977010&gt;]
                  process_one_work+0x280/0x550 <br>
                  [&lt;ffffffff80977350&gt;] worker_thread+0x70/0x7c0 <br>
                  [&lt;ffffffff80977410&gt;] worker_thread+0x130/0x7c0 <br>
                  [&lt;ffffffff80982040&gt;] kthread+0x200/0x210 <br>
                  [&lt;ffffffff809772e0&gt;] worker_thread+0x0/0x7c0 <br>
                  [&lt;ffffffff80981f8c&gt;] kthread+0x14c/0x210 <br>
                  [&lt;ffffffff80911658&gt;]
                  ret_from_kernel_thread+0x18/0x20 <br>
                  [&lt;ffffffff80981e40&gt;] kthread+0x0/0x210 <br>
                  &nbsp; Code: ad3e0008&nbsp; 43f0074a&nbsp; ad7e0018&nbsp; ad9e0020&nbsp;
                  8c3001e8 40230101 <br>
                  &nbsp; &lt;88210000&gt; 4821ed21 <br>
                  So force lockup work queue flush to fix this problem.
                  <br>
                  <br>
                  Signed-off-by: Zhenneng Li <a class="moz-txt-link-rfc2396E" href="mailto:lizhenneng@kylinos.cn" moz-do-not-send="true">&lt;lizhenneng@kylinos.cn&gt;</a>
                  <br>
                  --- <br>
                  &nbsp; drivers/gpu/drm/radeon/radeon_device.c | 3 +++ <br>
                  &nbsp; 1 file changed, 3 insertions(+) <br>
                  <br>
                  diff --git a/drivers/gpu/drm/radeon/radeon_device.c
                  b/drivers/gpu/drm/radeon/radeon_device.c <br>
                  index 15692cb241fc..e608ca26780a 100644 <br>
                  --- a/drivers/gpu/drm/radeon/radeon_device.c <br>
                  +++ b/drivers/gpu/drm/radeon/radeon_device.c <br>
                  @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct
                  drm_device *dev, bool suspend, <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) { <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* delay GPU reset to resume */ <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  radeon_fence_driver_force_completion(rdev, i); <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { <br>
                  +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* finish executing delayed work */ <br>
                  +
                  flush_delayed_work(&amp;rdev-&gt;fence_drv[i].lockup_work);
                  <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
                </blockquote>
                <br>
              </blockquote>
            </blockquote>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------BwWEM0gKYUioBCws7pfhRl28--
