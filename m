Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D16722AFE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490AC10E2DF;
	Mon,  5 Jun 2023 15:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA4910E2DF;
 Mon,  5 Jun 2023 15:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI1tgvP/y/AXRDNU2oSUcghapj5jKNwcLzEqmOhevxP5i/PyYbLUjSWuVuSF7CJomtvrQoq9dkK879CWHvX5PzsFF9vsRidGHINbTlRCV4/8hPEcgSbTKKpbjKvDqpgVCnXugSmyxOf/ChWUOQq+X+gOr7T6JLcuGLd4TzhY0vdvdDd6CHc//7FJ3el9S6/0LbwJ7OiohK4F+Ss9egN5Sfk7+Zvhx2JPjTZaloCCsCIDcR3wgz1cn6jMcNj9pKNfzMKpwOsmdYtAfbe0pcgg3ASe3IuJTc4p7l34By2U613p2jtTw4519ThnQuRqhmz7N7uQ4W3wy+SZPZ+IA+UpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtFdtSvljMD+AfdaCr4VleMMkIvGlKNN8+gNfeFatlE=;
 b=RCVNDtTpLWIpKOomaU/8MI1tvzMnly3cdxF6V1AVDuXZy8DHtSEsELcp55z615LqaaEsuvxrVCNv3UcBDayqGbKBRRhqaWIig3yR45fJWcZtlnddV0zanncNlmgWAk1jDfkQt1iitBCh/DW9+3lU+eRuADXfebmX3Q8mlNNM+EFUjh5I8U3fUnxIMKethl+sRVCNNFL7z722zNb8JrPR+UB2cdXCwwwz+GiaphhZs5F3on7zqLgnBYA/Wv0YL/u6oApJOCXG7lV8TtuJF8dhyV3fsYuhDR0v+NXV3eYtEM2+LiM8IUu2MSRcAuvNtoLxY0bUTDkhXhfYMzuA21Z0BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtFdtSvljMD+AfdaCr4VleMMkIvGlKNN8+gNfeFatlE=;
 b=nF61GjJNco8uuirZ9JE50O+8FlNnMkQxVyZFXH4sEzJ3KBb2/2pgiIkla/FUOxG5OWvUUbGYTlS/qrFfFftwo9FSONTxyoCYFT+EmhES0QEbnrO1iDOw8H3SwjdrZtPMyOhAwTyUSLM83p2vi29BhHvt3sNc5iav6y6stEPOuXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 15:27:54 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%7]) with mapi id 15.20.6433.024; Mon, 5 Jun 2023
 15:27:53 +0000
Message-ID: <5a925a7f-d810-275b-c735-29872bf523a3@amd.com>
Date: Mon, 5 Jun 2023 11:27:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
To: Felix Richter <judge@felixrichter.tech>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Alex Deucher <alexdeucher@gmail.com>
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
 <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
 <CADnq5_M-5SD6HDRVtFHPNF3q9XKz75PECdUxR-OaVpPe2Zw=EQ@mail.gmail.com>
 <8d23a70e-b132-9b25-917a-1f45918533cc@leemhuis.info>
 <0cac032a-0f65-5134-cde5-f535fc58c5ab@felixrichter.tech>
 <e7eed5ce-e7a0-e03e-f8c7-3582d9771a33@leemhuis.info>
 <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <e24373f9-4405-d7f7-dd54-d0bde111242c@felixrichter.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::14) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: faca4cd9-6e6b-4f2a-58b7-08db65d96e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCWuvsxcjAcOg+T0EvJUYX4XUHLQ3lun9eNNCYsmPoGXXWanl3PjkA4cM0+7ci6kVgU87uMnbHv1LA4OSSXs3uffSgad9MTo0vZHsWQFslHObXJpvdwoVeIz+DPswrIqvzikhkDPJ37lU3TQTMohK5ePOVvAG5ogffg8UK5M8O+y/b6AVhcHhbno/eDTSMEmnCFZUTk7kb8C7Fn3Z53D6WRsFoF5/XYNmtveJJTF4OlEAsb68GcTQY2CU8xeyhyFGbNO+dpVCczbAqh14+ze0xHNlOGW4aKRrr6zBfj1B41H3YSDkA3b6wQxiyG+Vyneu5BemvQcL3RI1vyc9QnllZCIH2Gy4ycrUDKxxhz7h6MMWTyThNylKfw1D7bdje6sIoaGJ1xjLYn+dNOb2l0ix/zy6LgO5Vjhn4cTm62/K6L2P7dshkWRvd+IqNds1xDgMJGJM51HrGgfTeyRDR7MpJgks3IIjrChhstQJvgBQ15N6/1bgvYwzx96NDJ4CLHYsTxYiyagtHhUlMk5D2DBU22i01pDW8wtymhWUtDOu3/oMB9ITs+nbVMLF1mxTq9F50SBceGwQVi7HQnR6XFrQBHSc/5IbWbD/3rJErV17Elh7TuNccmqPt5hwqJWpt6f0qWaSLAh12GgsMmDG5CVjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(110136005)(66899021)(45080400002)(478600001)(8676002)(5660300002)(8936002)(44832011)(36756003)(2906002)(31696002)(86362001)(4326008)(66476007)(66556008)(316002)(66946007)(6506007)(38100700002)(41300700001)(2616005)(53546011)(6512007)(26005)(186003)(66574015)(966005)(83380400001)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHJaNjVYVmV0MW1kVjl0d0hlL212N3FqMlArL3N6QzJLWUJYMktvT0J5dlVH?=
 =?utf-8?B?OGhHZ1J3YTNDRlljMk1mcW1SVUVmZFdIZTM2NU01R3ZHR1NsZTlGTEN3cTRD?=
 =?utf-8?B?RSt3d055eXA1cy9ybzNHaEF0MzA0VHl2RmpXWnV2UVJ3ZTE5djkweDQ5cGRr?=
 =?utf-8?B?dXhBbmVWWHdvSVdKdm0zQzJNU1F3M2NNSzN2NU11UnROelVsb3hCbnN6NWtx?=
 =?utf-8?B?SURhY3MvVnNpZUZDT3gxQ0VqcVhheUVSQ1p3eGFxWGphdFZRSFY5WjlLOHJT?=
 =?utf-8?B?dGVXK0ZTaWRINVZ6T0xCMEpGY0lQNzdWdFN2UFlwc3F1TUZZcXRUQW9tZ0Jh?=
 =?utf-8?B?L25Odk05a05aa3dNQnNOWld5Q3ZxMm9GUEJqVGQvcnBmK3hPOEZKWTh5dVY1?=
 =?utf-8?B?QThhRUlmam5haWVwU292d1l4dzhjTzhwN3BraTA2UGN5b0dQbWx5cVJRTE5L?=
 =?utf-8?B?THJMN1VBdE05NUxHbEdKd2VZNTc5QzNycy9hcnhtNG1PL1ZpbWNzRExqUHpY?=
 =?utf-8?B?cnBudWJOeHVpMmxsMHQySHRteW96eFU0NjZYMTFKdVJ5TnJXa2FrOFZXVC9k?=
 =?utf-8?B?cWNvTlQvbHZDcmdVdlhSOWxaOHRicitNdU9vTElnL3p1MlZxdnVBbVBvSHFl?=
 =?utf-8?B?YWg4MlZjVnd5d0pRUkY3SUI1ditodFNkNmhSZDQwQVBweGF1L0RrS2NkOThh?=
 =?utf-8?B?UjE1Rm02SlZ1WnBYMXRxTmNsa3lmYlRxUWk1bWo2TGhLdytCS0tuUnFaMFpl?=
 =?utf-8?B?V0hDcHI1dmdrdnpyOVVObHc5OWEvTjErcGJXelc1NjEzbURYZDJCa01FTEhM?=
 =?utf-8?B?aUF3VUxXamQ3VG5iQTBMYklET0ZSN1JPK3ZOK1cwQm1HdytQczFxM0FBaWov?=
 =?utf-8?B?SXEreFBOQVFWZ1lqSFpVQW5OTXRRZTE0ek1COHVBRWNSdkJlbXJaZUkycG5O?=
 =?utf-8?B?UCtLUmt1SXZWTklGTjZCaW5wbXIzM1dJeGwxclRIQ1Jrc2JVdDdTWDZQSlZ4?=
 =?utf-8?B?OW5RMk9RYUp4cGhqaHFuR1pjT0NtVFFnVWhMMU4vWE41MVBkNUQxWlMwR3dR?=
 =?utf-8?B?MFd4T1UvQ2dwWHZYOXNwSHoveG9LcFdJNlNnZnhBUnU0cUFvVUc1MkZWSUJl?=
 =?utf-8?B?NHlMbTRlVEN0b2Vtd0MvQlJyUnFua0Jodm1BZjVXRVZGTXkySm1MRERnRFl1?=
 =?utf-8?B?ZzR6MmpkRldVN0VUblBrNkx5RTVaOWhmU05EeG5Jc2RjZ09PeUNmWVRiWTFs?=
 =?utf-8?B?K3dMVWtsVUZwMWo1dEdzWTNyQlRuNzBjdW1NUUl3NEtKQ09jZ0FYdWluZHZ1?=
 =?utf-8?B?RUJkUzNRSVhHdWwvMXpyNE5xUzVrbHZYZlB3NURQVHo4M0ZleWhiWWxCd2Rj?=
 =?utf-8?B?RDVRZGpuWmtiSkhZY05DbzY5ODBJVCtnSXdUaXJ5L2Y4cXdwWWN4eFNFRW9o?=
 =?utf-8?B?WnJveis4NGo0VTFXUXUrOXFpVDR4T1lqVkpIYTlaZjR2SnlUUkc3alZkalEr?=
 =?utf-8?B?M1RieU5BcEdTMmFXSTd2dnREVFcrZWptZXVpUjV5S3ZlSmhncUkwOU1LeHF4?=
 =?utf-8?B?VHFBSlhIcGVucm83RU1QbmNUTnhXTCsvamFaWlJEVldudUV0c3BlRnpLd1VG?=
 =?utf-8?B?OUtkVHFkaVhWcG9PYXZQSzBHY1AyWHVyUDlaRDNscUxGTzdzNktvRmk0NWxj?=
 =?utf-8?B?VU9RYzlCaDZXNDc5NGVxTnhSek1CL1ZRcDZLWWFJd3FlT0pjaUl2eFR2Q2J4?=
 =?utf-8?B?ZzRmM3Z6MnRjRC80OVpxZXo4SzZETjJVdTN5bWFydzBUT211RTZwMGUyNjF4?=
 =?utf-8?B?cE5pM00xNmxKc0hQU3RCMVJmaUFWN2E1ekl0eUUxek9kUW1TdWVUSm9LbGZE?=
 =?utf-8?B?NmY1RHRINkZ3N0xmSWdHM1M4bzVVUm41WUZybzZXRklNMGNmUVIva3BxS25G?=
 =?utf-8?B?SzFJSW96UEJmWUtiUENuWFE3OXRoZkpNR1FLeVc1cEpmd3hhamV2SlJlTjZS?=
 =?utf-8?B?WWhTVFFFaE8zUUtUNUlpTUxRT1ZhZTN5bk91Qmw4T3ArRkx1VDh5eVd1elgw?=
 =?utf-8?B?TUduNDhuQUs5N3dUZWcra0puMnVUektFR0xnTWo0bnhvRGZxMzBEcUJSMk90?=
 =?utf-8?Q?BpBSxnnc8EjP/414edH18YYvg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faca4cd9-6e6b-4f2a-58b7-08db65d96e4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:27:53.7643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hP1nvifsMsY+aZPQ54sp6YvtDrPhyQ+zSmxAwFivIuv6oVIpJNPMCB3io+G6T7iKojYXxlgJRfJ17auj+AbT4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/3/23 10:52, Felix Richter wrote:
> Hi Guys,
> 
> sorry for the silence from my side. I had a lot of things to take care 
> of after returning from vacation. Also I had to wait on the zfs modules 
> to be updated to support kernel 6.3 for further testing.
> 
> The bad news is that I am still experiencing issues. I have been able to 
> get a reproducible trigger for the buggy behavior. The moment I take a 
> screenshot or any other program like `wdisplays` accesses the screen 
> buffer the screen starts flickering. The only way to reset it is to 
> reboot the machine or log out of the desktop.
> 
> With this I did a bisection to figure out which commit is responsible 
> for this. I attached the logs to the mail. The short version is that I 
> identified commit 81d0bcf9900932633d270d5bc4a54ff599c6ebdb as the 
> culprit. Seems that there are side effects of having more flexible 
> buffer placement for the case of the internal GPU. To verify that this 
> actually is the cause of the issue I built the current archlinux kernel 
> with an extra patch to revert the commit: 
> https://github.com/ju6ge/linux/tree/v6.3.5-ju6ge. The result is that be 
> bug is fixed!
> 
> Now if this is the desired long term fix I do not know …

Can you provide a dmidecode of your RAM (i.e. # dmidecode --type=memory)?

The current trend seems to suggest that if you have 64 or more gigs of
RAM, you will probably still experience issues with S/G mode enabled
even with my fix applied.

> 
> Kind regards,
> Felix Richter
> 
> On 02.05.23 16:12, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 02.05.23 15:48, Felix Richter wrote:
>>> On 5/2/23 15:34, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 02.05.23 15:13, Alex Deucher wrote:
>>>>> On Tue, May 2, 2023 at 7:45 AM Linux regression tracking (Thorsten
>>>>> Leemhuis)<regressions@leemhuis.info>  wrote:
>>>>>
>>>>>> On 30.04.23 13:44, Felix Richter wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> I am running into an issue with the integrated GPU of the Ryzen 9
>>>>>>> 7950X. It seems to be a regression from kernel version 6.1 to 6.2.
>>>>>>> The bug materializes in from of my monitor blinking, meaning it
>>>>>>> turns full white shortly. This happens very often so that the
>>>>>>> system becomes unpleasant to use.
>>>>>>>
>>>>>>> I am running the Archlinux Kernel:
>>>>>>> The Issue happens on the bleeding edge kernel: 6.2.13
>>>>>>> Switching back to the LTS kernel resolves the issue: 6.1.26
>>>>>>>
>>>>>>> I have two monitors attached to the system. One 42 inch 4k Display
>>>>>>> and a 24 inch 1080p Display and am running sway as my desktop.
>>>>>>>
>>>>>>> Let me know if there is more information I could provide to help
>>>>>>> narrow down the issue.
>>>>>> Thanks for the report. To be sure the issue doesn't fall through the
>>>>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel 
>>>>>> regression
>>>>>> tracking bot:
>>>>>>
>>>>>> #regzbot ^introduced v6.1..v6.2
>>>>>> #regzbot title drm: amdgpu: system becomes unpleasant to use after
>>>>>> monitor starts blinking and turns full white
>>>>>> #regzbot ignore-activity
>>>>>>
>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>> discussed somewhere else? It was fixed already? You want to clarify
>>>>>> when
>>>>>> the regression started to happen? Or point out I got the title or
>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>> while also telling regzbot about it, as explained by the page 
>>>>>> listed in
>>>>>> the footer of this mail.
>>>>>>
>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags
>>>>>> pointing
>>>>>> to the report (the parent of this mail). See page linked in footer 
>>>>>> for
>>>>>> details.
>>>>> This sounds exactly like the issue that was fixed in this patch which
>>>>> is already on it's way to Linus:
>>>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f80850354849d95f2670e8cd9
>>>> FWIW, you in the flood of emails likely missed that this is the same
>>>> thread where you yesterday replied "If the module parameter didn't help
>>>> then perhaps you are seeing some other issue.  Can you bisect?". That's
>>>> why I decided to add this to the tracking. Or am I missing something
>>>> obvious here?
>>>>
>>>> /me looks around again and can't see anything, but that doesn't have to
>>>> mean anything...
>>>>
>>>> Felix, btw, this guide might help you with the bisection, even if it's
>>>> just for kernel compilation:
>>>>
>>>> https://docs.kernel.org/next/admin-guide/quickly-build-trimmed-linux.html
>>>>
>>>> And to indirectly reply to your mail from yesterday[1]. You might want
>>>> to ignore the arch linux kernel git repo and just do a bisection 
>>>> between
>>>> 6.1 and the latest 6.2.y kernel using upstream repos; and if I were you
>>>> I'd also try 6.3 or even mainline before that, in case the issue was
>>>> fixed already.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/04749ee4-0728-92fe-bcb0-a7320279eaac@felixrichter.tech/
>>>>
>>> Thanks for the pointers, I'll do a bisection on my desktop from 6.1 to
>>> the newest commit.
>> FWIW, I wonder what you actually mean with "newest commit" here: a
>> bisection between 6.1 and mainline HEAD might be a waste of time, *if*
>> this is something that only happens in 6.2.y (say due to a broken or
>> incomplete backport)
>>
>>> That was the part I was mostly unsure about … where
>>> to start from.
>>>
>>> I was planning to use PKGBUILD scripts from arch to achieve the same
>>> configuration as I would when installing
>>> the package and just rewrite the script to use a local copy of the
>>> source code instead of the repository.
>>> That way I can just use the bisect command, rebuild the package and test
>>> again.
>> In my experience trying to deal with Linux distro's package managers
>> creates more trouble than it's worth.
>>
>>> But I probably won't be able to finish it this week, since I am on
>>> vacation starting tomorrow and will not have access to the computer in
>>> question. I will be back next week, by that time the patch Alex is
>>> talking about might
>>> already be in mainline. So if that fixes it, I will notice and let you
>>> know. If not I will do the bisection to figure out what the actual issue
>>> is.
>> Enjoy your vacation!
>>
>> Ciao, Thorsten
-- 
Hamza

