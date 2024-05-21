Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656408CAD54
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912B310EB66;
	Tue, 21 May 2024 11:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="iB/pLLJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn2048.outbound.protection.outlook.com [40.92.73.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55A710EB63;
 Tue, 21 May 2024 11:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSuwL7RipsQSDDQxMCibu5lcjqdKeTZ1Xe82AL9Zh6pcCHEzO9Ehn1dd2uM7Gp4puMc6ayCHEG4ZPPszcAx4QggaNmS72OBsLd4VqpoHg327s4X3GS/t+2jhv3cmXZN2v+9AwFELKcWjmFTqQNJluNx+nhdAAYGTx0Ox8o/AN51w3Y9nNieWo2Jd31bWj4xn4+tOlkb32ftICanbqqmee6mVaWAF3pTvUJH5Bd21AOr+EtquANhhvj+IxS8tWRFHbF3XMZM0tSXSijXJ4UvTVPUapeQW9YqtziNF5k5LMD+0nT37EXXlILCwP0n+jonMc1L6NvDhOO6Lu3hmuUQYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X5W9CAOVt4dYzOG/QOEZMq5DYZBneWzq3qIHfWciig=;
 b=P7YcB95JNXT+PyZTfp4d9wdq7qBFVxrfvEQA7M1yMoEi94bgbMXbe5eLrb/qBU+qePMeiOma6iK1XNGVxQgpirceHft0Jl3TWob6jD0606X+lzOLOgc1515AJaDSP9sICm/Ij0qhsEbXDH9VoB5mcwF/zYOFlgBc2A6bwlVEHLv45kANZtADgQodu1iItQOUhuDsUaRwYPoXzojSk9kgj1VL5eSCaH3SEwJ8HUzbDS+pIglWmmIdE5Y0osQPdWkBqcrd6TGMYuTbpJflH+vD2qfHpl11MP8y8qOJXBK9AZKeUjxuAvAHy+14GO5v2Bswn3AS7kKn1G7kRRUu1WXiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X5W9CAOVt4dYzOG/QOEZMq5DYZBneWzq3qIHfWciig=;
 b=iB/pLLJp8e5Q8O2MSQc/NSMll2EiMQEzApjSR7bqLUiYtnuYIebVECv14+pDLi4iSGspyGvJYiNJpvnseh+TzV3x2vZBvMQtvHk/etXzREPKsyVhPr9TOegLM2SZhwqLwyuds7heV7DDKIQthSAfhRyZyJ0roIVdwp6x/tzo70Aa7CVeoIl+s/w5Kw7utQ6TS+18KQnIvvzntgXJlq8dud4mwF3lWk+J3QtP/MSINUc2ZDA2ryoMUykq0omkMfqoddJUrru18cfTEMI8EyvjLq90lI24+eSjWs8XNR1voCYolVlIIkFnqnpi6WgWMjiFcV8GD5TOQJNxWe4gsra08Q==
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ae::7)
 by GV1PR10MB7980.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 11:27:31 +0000
Received: from DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1]) by DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::64e4:38c6:256:36f1%3]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 11:27:31 +0000
Content-Type: multipart/alternative;
 boundary="------------M0WOimC9FEyeJOj55xNmETf0"
Message-ID: <DUZPR10MB8267C756D00F1AFAEA87D1708EEA2@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Date: Tue, 21 May 2024 13:27:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] Kernel problem with multiseat on one card - Wil be more
 than one window manager on one card
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
 <AM7PR10MB39235076485E2E3905F422508E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <e046050c7e9be5d4f816d33dd1a9dd50e2de3308.camel@nvidia.com>
 <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: nl
In-Reply-To: <DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM>
X-TMN: [u+HU9o+ul3od1aLEZvCZY3gCcPTdRWxH]
X-ClientProxiedBy: AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::22) To DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4ae::7)
X-Microsoft-Original-Message-ID: <e86e2115-3215-41e6-afb1-95400b0a18eb@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DUZPR10MB8267:EE_|GV1PR10MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dabd38-7f0a-4a18-a0b7-08dc798900c3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199019|3412199016|440099019|3430499023; 
X-Microsoft-Antispam-Message-Info: OGVbKa3lPZ4COHNkDkgAt6zJCmDbxcJXcotJn1WaBcx+dxOdCTwQiPqyHGjpdY5R8ji1ClV+H0iU9hdCijnIduerq3NguX6mVN/lUWNhmDokzunUl07OZyG8jAiUFWAVH0gilf7ymnaOzIMmSrX/WjpsUNhPehnitXvnXDf6FKu96FZUMA1I7PyOUBAGcLfLy59A9baddNSQA+JS/QacVyB2aOMtbsm7PB+1np+JCrniqNxdzIpK6uDRaLS6FVPANU2yPE9C8jKw/rJk7n7dzqAuTjfzN3UWzXCxdYLc0d19KinVD7kK9uqRku7K26v8pU476pgt2wO8ak/l9TOLoJFhPtii2oljvX/A4yCWF2SzBiBz+JsKWgFB/VxVb/neRr74VaU0fLstJSYydHx2k3a3QSwdVSR/F9kMJIYrsNBeI5Pm5k26ho5ZIgKO+IYIwRhpX1Th1Wa6GrUw98nFEoGqpFV5XXW5g3w50Id9laCUulebgWs7R/EWIbHVKYm8pj56nLz4xZfRac3YTvR3nm7gLG4vYVsx/qACbW8Fi1V6BOmd3eZM7Xz225N3KivE
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZEdDJ6NHI3MU8xNlVQeWw0SU53VHhQelhqQkdPWnJsd2hENlVnZ3lwNG5x?=
 =?utf-8?B?RDNTRnlFTDFUeFQ2N0dhKzl0SXllTHlyRWY3TUIzUHgra2dSazNGUmM1aDBQ?=
 =?utf-8?B?cVp3amhJVi8yOXFrdTBMZXlTT3B4WUdicktNbStob2tLV3FZK09PemF3ZUlV?=
 =?utf-8?B?YWdiMVgzYXpCUE9xMkxtcXhOMDduRXFxR3Bnd2p3elpncmVtODNoTE9JckxJ?=
 =?utf-8?B?ZHlvT0RCL3JmTlVqNTBSdXNZS0hPOXM3RFBEOGxXRTJudFpVWWhGaG5ER1Fn?=
 =?utf-8?B?d2lRWjFvbjdSaUViUGZDYjV6Q3YzYjFTQmh2SFY5QjVzZGo2UW13SndOWU15?=
 =?utf-8?B?NjA2QklBVk9ueTNFMjZoajBYNUQyQlJnb0dDd2FRcnhicjJXVjd6dE5HcTg3?=
 =?utf-8?B?Tnpzajkwb0xLKytZbjBWNEV3Nld0OHRDVk1LNlhzZjk4SmF0VVNjYmI3U1RJ?=
 =?utf-8?B?b21ma2l5TkVKUVZ0TkNJejlMejQ1RXNmL3dpcmJITUpQbE9YUUtSNzY0MEZ6?=
 =?utf-8?B?RlRlZFVFQWthSEk0c3BJSzVaSjVXR2Z0VDNOZXdCd21LU044SEkwdlN4Nzlv?=
 =?utf-8?B?ZFFsN25pdFdxK3p6dmpuTmUwS0pzU3ZrUXdqVE9OUklLTHMzSWhNaW43UnVQ?=
 =?utf-8?B?N0g4MCtITHorMzJsL1RGQTRSUitCY3dURmRML3poM3FreUc5N3FhdW9lQmRt?=
 =?utf-8?B?OFp2amZxV0o4MkJkaDN6ZFhHaWtPNGZSdThSZkZIOTZpSS8xV0ZiMjcySG5u?=
 =?utf-8?B?aVVycHVxN1VudnByN09jdHN4ZlJPS3l4UDVuMjgrZGFraHJUbk1HS1MveUdj?=
 =?utf-8?B?MWVXOGVHSFdmbENaZzg1RWJaenJmVU1TZ3VZNmorYm9TR2xBMzkzTy9jcUNi?=
 =?utf-8?B?NGN2UFhPRTJZUTNwTUZ4WTNmWE5TUmNPWkEybjZKd0xNc3RBNWZ4ZjJGUzZQ?=
 =?utf-8?B?Y3VmQ1VVbnBvZzNYcFJiQXV6MzlHQWFyK3JhTGkxbFMzZVJWQ1huNU85c2lU?=
 =?utf-8?B?ZlFsTkZPaUs2UzZrUEk4ZVlqdElDTjlISGxGYk5tbEtrT2c0M1BiV0c3NElV?=
 =?utf-8?B?SUFZOWw2Mjl4YzN2dXBoUXNNeHFucndzWSs4K2kxZExuVzgrSTRSb3MxdFhW?=
 =?utf-8?B?cVpsZllSTUZjVmtwRllmZGlGd04zYnFtUW5MY29pcHB4Zm8ySkdFYXY5Qm1G?=
 =?utf-8?B?L0phNk9saTdhU3JwRmF6YnZpQllVNWlFM0FZdTdrYndGeXRkSFRkZ1VYUWUw?=
 =?utf-8?B?ZXhoWThZbVZ5dnNJaFhyaHdQdkxrNk9nN01jY2tiUlVxc1Nwbmw2NE01cjVJ?=
 =?utf-8?B?MVRxZTNJeVR5R1lKVHE5aU5tUnMzT0ZGVVE2dUJodHZrZXdpaHdBS0kzaW81?=
 =?utf-8?B?WG9xRmR1NnVFTlM5VWxESGFUZTBNNzQxQ3NJaFRQMERjWGRlMXZ2RTV5dVZh?=
 =?utf-8?B?R1JDVEN6aFBZbi9mR1poMjhocG1pcE9jc0x4R08yN3VsaUN1WU5xalQxTm5O?=
 =?utf-8?B?Uk81eDZpR0RQU3p1NFpMWEtEeklEOTBxN2FMak9xeWRzSmVvQTc0VG5TbFBl?=
 =?utf-8?B?TkV4K0t0b214RzlzYXlaSzRqWTBVcTZzaFk4VFN6SmNGL1lIYk9HSnJqRXFM?=
 =?utf-8?B?V1dSN2F1cjk5OEJYaEN5RlFCWU9mRjhBejRzV0RScHlScU9aWmxtZXRuWUpT?=
 =?utf-8?Q?S/W5pu5wCnbylq4fUxu3?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dabd38-7f0a-4a18-a0b7-08dc798900c3
X-MS-Exchange-CrossTenant-AuthSource: DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 11:27:31.5952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7980
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

--------------M0WOimC9FEyeJOj55xNmETf0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

In the meantime I have contacted everyone who could have something to do 
with it:
Kernel groups
System D
Nvidia

And gues: Everyone says it's not their fault.

But we don't give up. Linux is such a beautiful and solid system. Why 
would it work with Windows and not Linux?

Our analysis has now discovered that the problem does indeed come from 
the kernel. The kernel does not allow several users to access a graphics 
card at the same time.Indeed, to use it, several users need access to 
the graphics card at the same time.
Can this simultaneous access be allowed by the kernel after all?
Or can the kernel be adjusted so that this would be possible?



Op 15/12/2023 om 10:59 schreef Gert Vanhaerents:
>
> Op 4/12/2023 om 15:11 schreef Timur Tabi:
>> On Mon, 2023-12-04 at 09:51 +0100, Gert Vanhaerents wrote:
>>> OK  i will report it to nvidia. But with the nouveau drivers it's 
>>> also not
>>> working. Are you sure it's not a kernel problem?
>>> Because according to systemd it would be a kernel problem. 
>>> (personaly i am
>>> also thinking it's a driver problem)
>> Unfortunately, it's not easy for Nouveau to debug problems with GSP-RM.
>> However, if the problem exists in the proprietary driver, then Nvidia 
>> could
>> fix it.  That would then lead to a new version of OpenRM that Nouveau 
>> could
>> use.
>
> I have contacted Nvidia and now i can see the outputs such like this:
>
> ─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>           │ [MASTER] drm:card0
>           │ 
> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1
>           │ │ [MASTER] drm:card0-DVI-D-1
>           │ 
> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1
>           │ │ [MASTER] drm:card0-HDMI-A-1
>           │ 
> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>           │   [MASTER] drm:card0-VGA-1
>
> But the problem is now the same of with the Nouveau driver. When you 
> do this:
>
> loginctl attach seat1 
> /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>
> For the seat1 (the VGA d-sub output for seat1 and the other HDMI 
> output for seat0) and of course the mouse and keyboard.
>
> When you do this, all the graphics outputs are on the second seat 
> (seat1) and not anymore on the first seat. So i need to move only the 
> VGA output to seat1 and not all the outputs.
>
>
> The problem is that linux can not start 2 or more window managers on 
> one card (even if you don't need a multiseat, but use only one mouse 
> and keyboard).
>
> So how can i fix that i can use more than one window manager on one 
> physical graphics card? (without Xephyr or something because they are 
> to outdated and works not good).
>
> I have tried with: Linux Mint, Ubuntu and Debian all the same problem.
>
>
>

--------------M0WOimC9FEyeJOj55xNmETf0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">In the meantime I have contacted everyone who
          could have something to do with it:</span></span><span class="jCAhz"><span class="ryNqvb">
          <br>
        </span></span><span class="jCAhz ChMk0b"><span class="ryNqvb">Kernel
          groups</span></span><span class="jCAhz"><span class="ryNqvb">
        </span></span><span class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          System D</span></span><span class="jCAhz"><span class="ryNqvb">
          <br>
        </span></span><span class="jCAhz ChMk0b"><span class="ryNqvb">Nvidia</span></span></span><br>
    <br>
    And gues:&nbsp; <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Everyone says it's not their fault.<br>
          <br>
        </span></span></span><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">But we don't give up.
          Linux is such a beautiful and solid system.</span></span> <span class="jCAhz ChMk0b"><span class="ryNqvb">Why would it work with
          Windows and not Linux?</span></span></span><br>
    <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb"><br>
        </span></span></span><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Our analysis has now
          discovered that the problem does indeed come from the kernel.</span></span>
      <span class="jCAhz ChMk0b"><span class="ryNqvb">The kernel does
          not allow several users to access a graphics card at the same
          time.</span></span><span class="jCAhz"><span class="ryNqvb">
        </span></span><span class="jCAhz ChMk0b"><span class="ryNqvb">Indeed,
          to use it, several users need access to the graphics card at
          the same time.</span></span><span class="jCAhz"><span class="ryNqvb">
          <br>
        </span></span></span><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span class="ryNqvb">Can this simultaneous
          access be allowed by the kernel after all?</span></span> <span class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          Or can the kernel be adjusted so that this would be possible?<br>
          <br>
          <br>
        </span></span></span><br>
    <div class="moz-cite-prefix">Op 15/12/2023 om 10:59 schreef Gert
      Vanhaerents:<br>
    </div>
    <blockquote type="cite" cite="mid:DUZPR10MB8267520A4F44DA38339969A78E93A@DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM">
      <br>
      Op 4/12/2023 om 15:11 schreef Timur Tabi:
      <br>
      <blockquote type="cite">On Mon, 2023-12-04 at 09:51 +0100, Gert
        Vanhaerents wrote:
        <br>
        <blockquote type="cite">OK&nbsp; i will report it to nvidia. But with
          the nouveau drivers it's also not
          <br>
          working. Are you sure it's not a kernel problem?
          <br>
          Because according to systemd it would be a kernel problem.&nbsp;
          (personaly i am
          <br>
          also thinking it's a driver problem)
          <br>
        </blockquote>
        Unfortunately, it's not easy for Nouveau to debug problems with
        GSP-RM.
        <br>
        However, if the problem exists in the proprietary driver, then
        Nvidia could
        <br>
        fix it.&nbsp; That would then lead to a new version of OpenRM that
        Nouveau could
        <br>
        use.
        <br>
      </blockquote>
      <br>
      I have contacted Nvidia and now i can see the outputs such like
      this:
      <br>
      <br>
      ─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
      <br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ [MASTER] drm:card0
      <br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │
├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ │ [MASTER] drm:card0-DVI-D-1
      <br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │
├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │ │ [MASTER] drm:card0-HDMI-A-1
      <br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │
└─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; │&nbsp;&nbsp; [MASTER] drm:card0-VGA-1
      <br>
      <br>
      But the problem is now the same of with the Nouveau driver. When
      you do this:
      <br>
      <br>
      loginctl attach seat1
      /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
      <br>
      <br>
      For the seat1 (the VGA d-sub output for seat1 and the other HDMI
      output for seat0) and of course the mouse and keyboard.
      <br>
      <br>
      When you do this, all the graphics outputs are on the second seat
      (seat1) and not anymore on the first seat. So i need to move only
      the VGA output to seat1 and not all the outputs.
      <br>
      <br>
      <br>
      The problem is that linux can not start 2 or more window managers
      on one card (even if you don't need a multiseat, but use only one
      mouse and keyboard).
      <br>
      <br>
      So how can i fix that i can use more than one window manager on
      one physical graphics card? (without Xephyr or something because
      they are to outdated and works not good).
      <br>
      <br>
      I have tried with: Linux Mint, Ubuntu and Debian all the same
      problem.
      <br>
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------M0WOimC9FEyeJOj55xNmETf0--
