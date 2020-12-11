Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758612D6F20
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 05:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBE6EC3E;
	Fri, 11 Dec 2020 04:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773FC6E880;
 Fri, 11 Dec 2020 04:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdCO8lNRWarul67K0GWljv96U14AzHWq04va4/qILeJ4YOUwZX661n6ZZ9/c3K0rwIuWPPRWeIt80UUz8ZGSB9H5SOec1njJGOmiMdOZ3u+r9kX/qIi9c1gvbJv3a+TaaiV2j7cL2+0mug30iBtJtZp3B5AplOqR3arm+skZVWX5cf9Wr+d+SowLdxVhT4lLUy984gUvEfldkA8jU7RYTgDECaKsUWZdiPrSsGUEUmF4aqfIIdZkpsi+VR6f22ey7Awzy4ubuXrGRBGkwydSp+jpkSJgr6mfPN9/FBscu+Dn7zVggBeoTopl+rJ0RR17ImQBAExTobVintNmEiAy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS7GMPZCOpnoii73Zx3BX4R75IBCji6AQFTj9ngHab0=;
 b=Z8YYFoG8yAUxtQnPOqZQlgivzhxGUdZnOKk5PlV4Hk5i/ZaG9yEik4KejFvf3NFmhY9+GEP+QXoU0MBPuJpqGgpKuX/yzzLX5aTp5zQ+jQ7f15K2OgvaNuLVvTxmyq4vlL69KaFd+VDPBI7DBb9SRwqbOUec5coWBGpq49Vz3WioAacCsMx5AHovXrbzIf1xWw525S73ZaKZNgnV7QRHooeYT7V4nWrqbk8l2foN/G6lKoKjYDB2X33N7vIZfcarfrYRjoOENPwuXFFZ71r9xw4Sr5rJbhPUVgbOT2UL1/SJTZKCw+p7J8I+Xm5uYykQ0YCesyNlOJpp5bgRTBXF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS7GMPZCOpnoii73Zx3BX4R75IBCji6AQFTj9ngHab0=;
 b=bdozhSXPDb96sCofriUUFuHO7ky2tu0qtOJVxvEpBG0adsvPVWZ9DFFDXFYOgvgwae588oP7b+JbYpUilCfjPoeGJ2I+IXA9njurIVMwEWT0kN5TAWSNHo53sfW2YMEMCe/z5hQEBbR11PU36IkqI+S9qlqPHFRo33fpRP3MRmk=
Authentication-Results: free.fr; dkim=none (message not signed)
 header.d=none;free.fr; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3126.namprd12.prod.outlook.com (2603:10b6:a03:df::28)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 04:26:19 +0000
Received: from BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::45a1:6d50:60d6:9d68]) by BYAPR12MB3126.namprd12.prod.outlook.com
 ([fe80::45a1:6d50:60d6:9d68%7]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 04:26:19 +0000
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
To: Simon Ser <contact@emersion.fr>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
From: Shashank Sharma <shashank.sharma@amd.com>
Message-ID: <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
Date: Fri, 11 Dec 2020 09:56:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
Content-Language: en-US
X-Originating-IP: [106.51.105.40]
X-ClientProxiedBy: MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::19) To BYAPR12MB3126.namprd12.prod.outlook.com
 (2603:10b6:a03:df::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.113] (106.51.105.40) by
 MA1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 04:26:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5f0403b-edfe-4c18-54bc-08d89d8ce86d
X-MS-TrafficTypeDiagnostic: BY5PR12MB4291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4291FE1FBDC4AD3917D6902AF2CA0@BY5PR12MB4291.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lz/ChwcxEzTe+d72XaS8lCCRJ5NrCdegzeGuxjFSGG4tcyT3wJuu4ZfY8JyMKtCTU6+Rvy/E8TkQT/KuZc2AnpnCm4x5G7K9grh2Gfu8z8i38NxtWIyRaIKVsobnTozDrp7Ww4u2VY7vvfiroeBS7KlyZD9qf5iPXqDo7Mdk0FPQ1iegyuo53ddmqgXUjwdUEjfX54gP+LVagax5IDN1dWHwSY1nXztLJ/ACUY6A5e7jgYgUrRQvr0oRXTHNpugWVVFlxP+DdyzCfq/+oTA6gu0qg4J2Vz8/qmVCACyTaiGiesGuUyoy18lum2NOySkfjP/XRnWijQo1PH2efKTUuo6K9KeATlmfbLtiB0nfkoGG3kwfO462vO9zjlwPAo2NrEfo/c6vEx0Xv9+AeIiEhVPPtIwpqpVLW9WSJpTWVGtuxOlzoHZ7xXepMoTP2G/P9uUN6pmwfJ53yh6ebzLzSRX521JaFyaMkdlVBRjpHuU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(86362001)(16526019)(6666004)(110136005)(1006002)(2616005)(83380400001)(508600001)(34490700003)(2906002)(66476007)(4326008)(6636002)(36756003)(6486002)(54906003)(186003)(44832011)(16576012)(5660300002)(31686004)(53546011)(31696002)(55236004)(66946007)(8936002)(66556008)(26005)(8676002)(52116002)(956004)(33964004)(367364002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnU3M3ViYmNnaURvckZZMkN1MDNidm5OTWRhOHdEcHhFb05nNVJzR3RJZWpT?=
 =?utf-8?B?eHVwMkwrUGtSVTlQdGI5OGpWMlZsSUg2d3hRTHhmSXVjSjBweS9EV1p6QW9u?=
 =?utf-8?B?dFdmUm0xVUVUazN0NGJKamxMZDJDWkM5MTBkaHI5NjVOd0FFT3NzeFo4U1Iy?=
 =?utf-8?B?WnFUU1h6U1BDVFdveXl2bEZWbDJ2Nm9NblYvbXRkQVVhb1V2UEdXZkwySDln?=
 =?utf-8?B?c1VWVGhieEx4R1d2MUlpRHJoeHA3YkRleTBSZUswak45ZWlqNTh2a28vbHl5?=
 =?utf-8?B?NkhqaDhzTFhMTmVjTGNwL29FdUtBMmJLd2ZtYzZHenAwYUluekpCdnUySzZL?=
 =?utf-8?B?SDlhTk9uU1BOSlJZdnJrdys2VDNyM0tMNnA3eEZ6ZU1Tb01CV01qdnpGNG11?=
 =?utf-8?B?Kyt5U3FZNFhXSUpKcEJJcm1JYjBEaXdIMXRGakMrenFLZ2M0bUhyV3dQTDVG?=
 =?utf-8?B?SzFVVmpyV1QwOFJHSmpZbVJlb0lTbzd3K3NjZnVnaWNQZkF2UzVlNGQ1YmR2?=
 =?utf-8?B?UnlQYUlheUxad2RJMjRxZWpaN1kzc0tUbjZuMkxVM2tpelpQOGRjWEZ4cnh5?=
 =?utf-8?B?Y1FmRFBzd1BrVzMrcVQrZXZ6MS9YSXB2R1Z3QURUV2FuQU1JTThWMk1nU1BQ?=
 =?utf-8?B?TEdiVDVBbGpTQjR4Ti9GejJDM2QyeVF2MTZzaUdnam5ydTM1VVVyV1luSWFC?=
 =?utf-8?B?Qmt6R0s0dEg2ZkJDODF4Qy85OWttQnZ6ZW9Ya3ZuSnRRWUVqdG90K2FEUTMr?=
 =?utf-8?B?QmlFdWoxSm10WEhlU0dKWHVobXp5RU5DNElleExFYWc1bG5nR0NSY0Zna2JV?=
 =?utf-8?B?UUpIUkZYei90eit5TGYyTFJBZmJRWXhVNTczU0xXZFFnYXFUVjVBdy8zY2tR?=
 =?utf-8?B?aFptK2tvQ3BmdmZ6bFB6a3BUT1B2WGwvVlNXYjFYekg3aDIxV00zSEllYW0r?=
 =?utf-8?B?akpNdnc3UThDby9BZ29wR1hMU0Y2azVWRlhzcnc3OVVDYVMxd1oxbkljWUEw?=
 =?utf-8?B?Mk4wQ2tMSC9Db0JpblRGazdrMDhKczhtWjhPRFJMWm51V0hOM0JtbkdaSHlz?=
 =?utf-8?B?MWtEZzM2cnppb2l5V1JNOE4xVyszTmY4cEwwaHBGZ0huRWliMnNsL21mQlZs?=
 =?utf-8?B?Vm5ETElETjlLRUFGM282QmNWVkZyR0NlRFBib3M5cW1qcG9SYTlJR2NoOHdE?=
 =?utf-8?B?YWV5bnlLZHRONGtrUjg0NWg3OXFTUXpvazhVVExJWGdSWWN6TEN5QlIxaXlm?=
 =?utf-8?B?WUJBcFJuTWxhMC9PNlpxTXF4U1RvYURKRnU4TnY3Ly9tdXpJSmM2ZmxWNmYx?=
 =?utf-8?Q?0e9MHxf5+nMfkqgC8IUxA/G9EO3sxYKGlB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 04:26:19.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f0403b-edfe-4c18-54bc-08d89d8ce86d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTtZVGZybv/X05e/l6RsPlow1axev5xjhJAgAOKaEWl1TRa0rnXB+Qp1VDEoO5GKE5WgfdUyjD307xyPuNKEfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, amd-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============0419053045=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0419053045==
Content-Type: multipart/alternative;
 boundary="------------41433AE91C3FAF67983361AE"
Content-Language: en-US

--------------41433AE91C3FAF67983361AE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello Simon,

Hope you are doing well,

I was helping out Aurabindo and the team with the design, so I have taken the liberty of adding some comments on behalf of the team, Inline.

On 11/12/20 3:31 am, Simon Ser wrote:
> Hi,
>
> (CC dri-devel, Pekka and Martin who might be interested in this as well.)
>
> On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:
>
>> This patchset enables freesync video mode usecase where the userspace
>> can request a freesync compatible video mode such that switching to this
>> mode does not trigger blanking.
>>
>> This feature is guarded by a module parameter which is disabled by
>> default. Enabling this paramters adds additional modes to the driver
>> modelist, and also enables the optimization to skip modeset when using
>> one of these modes.
> Thanks for working on this, it's an interesting feature! However I'd like to
> take some time to think about the user-space API for this.
>
> As I understand it, some new synthetic modes are added, and user-space can
> perform a test-only atomic *without* ALLOW_MODESET to figure out whether it can
> switch to a mode without blanking the screen.

The implementation is in those lines, but a bit different. The idea is to:

- check if the monitor supports VRR,

- If it does, add some new modes which are in the VRR tolerance range, as new video modes in the list (with driver flag).

- when you get modeset on any of these modes, skip the full modeset, and just adjust the front_porch timing

so they are not test-only as such, for any user-space these modes will be as real as any other probed modes of the list.

>
> However the exact modes amdgpu adds are just some guesses. I think it would be
> great if user-space could control the min/max refresh rate values directly.
> Not only this would remove the need for the kernel to hard-code "well-known
> video refresh rates", but this would also enable more use-cases. For instance
> some users might want to mitigate flickering on their screen by reducing the
> VRR range. Some users might want to lower their screen refresh rate for power
> savings.
>
> What do you think? Would you be fine with adding min/max VRR range properties?
>
> If you're scared about the user-space code requirement, I can provide that.

This sounds like a reasonable approach, and there is no reason why we can't do this if we have the proper userspace support as you mentioned.

But what we thought would be a sensitive approach towards this feature would be:

- *Phase 1: *Add this feature experimentally as kernel-only change, to:

   test out its functionality on all all supported platforms first, without going for the UAPI complexity.

   gain attention from UAPI stakeholders and get them involved for the UAPI design (so far so good :)).

- *Phase 2:* Have a design discussions with user-space stakeholders, examine the use-cases possible, and then create a reasonable UAPI, and make the other solution a fallback method.

So I guess we can fork out a parallel discussion for the UAPI thread too. How does this sound to you ?


- Shashank

>
> Thanks,
>
> Simon Ser

--------------41433AE91C3FAF67983361AE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello Simon, <br>
    </p>
    <p>Hope you are doing well,</p>
    <p>I was helping out Aurabindo and the team with the design, so I
      have taken the liberty of adding some comments on behalf of the
      team, Inline. <br>
    </p>
    <div class="moz-cite-prefix">On 11/12/20 3:31 am, Simon Ser wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr">
      <pre class="moz-quote-pre" wrap="">Hi,

(CC dri-devel, Pekka and Martin who might be interested in this as well.)

On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default. Enabling this paramters adds additional modes to the driver
modelist, and also enables the optimization to skip modeset when using
one of these modes.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for working on this, it's an interesting feature! However I'd like to
take some time to think about the user-space API for this.

As I understand it, some new synthetic modes are added, and user-space can
perform a test-only atomic *without* ALLOW_MODESET to figure out whether it can
switch to a mode without blanking the screen.</pre>
    </blockquote>
    <p>The implementation is in those lines, but a bit different. The
      idea is to: <br>
    </p>
    <p>- check if the monitor supports VRR,<br>
    </p>
    <p>- If it does, add some new modes which are in the VRR tolerance
      range, as new video modes in the list (with driver flag). <br>
    </p>
    <p>- when you get modeset on any of these modes, skip the full
      modeset, and just adjust the front_porch timing <br>
    </p>
    <p>so they are not test-only as such, for any user-space these modes
      will be as real as any other probed modes of the list. <br>
    </p>
    <blockquote type="cite" cite="mid:MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr">
      <pre class="moz-quote-pre" wrap="">

However the exact modes amdgpu adds are just some guesses. I think it would be
great if user-space could control the min/max refresh rate values directly.
Not only this would remove the need for the kernel to hard-code &quot;well-known
video refresh rates&quot;, but this would also enable more use-cases. For instance
some users might want to mitigate flickering on their screen by reducing the
VRR range. Some users might want to lower their screen refresh rate for power
savings.

What do you think? Would you be fine with adding min/max VRR range properties?

If you're scared about the user-space code requirement, I can provide that.</pre>
    </blockquote>
    <p>This sounds like a reasonable approach, and there is no reason
      why we can't do this if we have the proper userspace support as
      you mentioned.</p>
    <p>But what we thought would be a sensitive approach towards this
      feature would be:</p>
    <p>- <b>Phase 1: </b>Add this feature experimentally as
      kernel-only change, to:</p>
    <p>&nbsp;&nbsp; test out its functionality on all all supported platforms
      first, without going for the UAPI complexity. <br>
    </p>
    <p>&nbsp;&nbsp; gain attention from UAPI stakeholders and get them involved
      for the UAPI design (so far so good :)).<br>
    </p>
    <p>- <b>Phase 2:</b> Have a design discussions with user-space
      stakeholders, examine the use-cases possible, and then create a
      reasonable UAPI, and make the other solution a fallback method.</p>
    <p>So I guess we can fork out a parallel discussion for the UAPI
      thread too. How does this sound to you ? <br>
    </p>
    <p><br>
    </p>
    <p>- Shashank<br>
    </p>
    <blockquote type="cite" cite="mid:MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr">
      <pre class="moz-quote-pre" wrap="">

Thanks,

Simon Ser
</pre>
    </blockquote>
  </body>
</html>

--------------41433AE91C3FAF67983361AE--

--===============0419053045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0419053045==--
