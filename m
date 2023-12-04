Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B188030A4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332210E32B;
	Mon,  4 Dec 2023 10:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03olkn2066.outbound.protection.outlook.com [40.92.59.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA5010E30A;
 Mon,  4 Dec 2023 10:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NowpoAlYgnkTATSrf2wfUwTFf57G1vV2PktTdE+wSG01MUzzhXALJIPHKubUsK4y+fwOGoDXkJQpO8eovujzrMtGvn/rTsvaFaEYg1GD6rMBgfi3SK2u4FysC6p5atb9fUfQw5u6DDhg/jfZrdmCx6agLVJQdnvAwXm26YjLXsccODhRDJ6ns3KDaOqO8TNcykf1ppJiw+D1Ew0r1yC7luZsdyM9HKMnx3a3p8OeLf5+43UI17d9E4bNJ7DpEYFsFSAgwRKTQgLoH6Smr6xWTxMlE+1R7BWeudjnnaWrziOKvEmn7VIpRUYtecTcVrRKs0bKZqPOQKKdn4v0jfigGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CkJu6WS5a/5qmN6jvqA2dal626d/g5UUOl67NBlNh4=;
 b=fNybH6+VSOV5pL7+VP5d5yWxh4m1eUFrFmzqyAj/J3ESWxND5eQ8RHIZj4VzDotqmLiUrL31yyEOmCZX0QmqluqJRvrtc5L79/lrJO2k7EuYdZDnPFotpNR7h6dqxrS69d9r8pOsJ/zCQRxdQ++034ftnn84jFyim65wXmuv9LNwUV1/DEoWKHtCZxEgMBeDGL98I5OZVToF7DrAn4j4YjuSLOhjq7QXIH1OjfGDxOB8Bt9lO3z/nLR6IZvn41LzCV6XiFazEusZGGajWJmN+GmwdMfo+G7ZziCoYRt4Q7pMmSnXobsIWJ3zXdL4RKeFKUe2yAdBooIRmXoV9rkl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CkJu6WS5a/5qmN6jvqA2dal626d/g5UUOl67NBlNh4=;
 b=WKlph4s8ivpRwAeH7svcdjkJM5HOQ9Y9X0PjPsY2GIZeLycsBii03PvLsHt3xY+MW61gJUbBPFtNeO8zOX8E1jbSwYjyGekOpt9TLxt+FS21oGnvU07+SvaD8HwBvXVQ54GXYtiJTpuvsDNSF6izGzbbNHMS9CX2kujhbT/lweld7FV00ru3KmjjyrEvVv9SryqF3F2BsPsYcysaBee1oOXZqMaQVECB/HQiwcqvx2gUvQaxWiUYiHW+t412yvHb1/smnvAZJLP0m9HoQyNBB5jAsLPpg+0DM+JbTxa8vM9V7SCebOLjVGNZIry6bXKOf1QZl+tp1nD8ZYy0XzAZEA==
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:172::24)
 by DB8PR10MB3864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:165::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:10:45 +0000
Received: from AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28]) by AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1fc4:7df9:3d95:eb28%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 10:10:45 +0000
Message-ID: <AM7PR10MB39234D1B9700492A3D10DB1C8E86A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
Date: Mon, 4 Dec 2023 10:10:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel problem with multiseat on one card
Content-Language: nl
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
From: Gert Vanhaerents <gert.vanhaerents@hotmail.com>
In-Reply-To: <ZWsuiq7zrYS-pDli@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [Z2TbAV7/bHaGYf/Tp7LZhTba60ILfNuM]
X-ClientProxiedBy: AM0PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:208:55::36) To AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:172::24)
X-Microsoft-Original-Message-ID: <fc2ec5e4-633c-4bda-a52d-a4cd8c5d09d8@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR10MB3923:EE_|DB8PR10MB3864:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fd4a6b-d511-4aa9-74d1-08dbf4b14765
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BG8nVXG1uC7aYAcXO8oAOOPRR8ZN6jCbHEr11Pa9JevrtrkCNS6FWKnou/UK8QI1n1KfO3tNxtdGWvnFBIHJaR33sp0oUcQ8DAnsQU3Nqx0mzTuym68mobR16QcyjuRpQqyhK0MFvMk2Itcxxfidiw1JQFgSz4aR5S2wPSLJWo2YfIRikOBZfZLq+W+Y9kvqUMcMaxlQXbxVxrjQV6wWQ45B6BhWXdZciWwFQHCslIHYCk7hl4WDWqWDCcexH1VMgDSSM7hHu2S5Wd66E1SX8O5z/Tku3arlx6XIFDjp4NC2o6BCaeuL77d1tDE8+Y8qwRuLvnWMI8CkSGT5WomOGYE0KqJ2nCdk13++VLjkfzI35yUNJhakT4pGzLBBYN4W0ehqowwwxVjyP+CEYm2Rh8+wzImusVirOwsxieGbb6kQ/0BcHbDNcxZIzMBMuR0wnKhY5J/Nq05ZTIeWMb9YGCgzJSeix5uzSctlMx5a8tffK+xjifLR9GxEoT7zGAqp7hzY/SIdfZSXTxHThyUox2Hmn13YIHIG1+TW9OxClayJ7kgHVMJeMGM6N8fcfH3SydcxIuMLsfxqAX2wl205G2io/iQzvRrzb1OZNe3UJ2Q=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHFjcEk3OHNWNDhQNkh2VmpaZEw4cDI3V1pVNDJ3aW9maWpKaTNTWllscXgv?=
 =?utf-8?B?dzlzemhNM2FHTzF5dllIOXZ4Tmp6ZlJ4djQ3L0EzdjNJL1hWNVBuazNxUHlM?=
 =?utf-8?B?U3BMUWJqZGxBK1pCSUlJcDl5RWVMb1QvVUdRSTVQQ1pjcUpqQUZrQW9WZW92?=
 =?utf-8?B?Z0xpWGJQVmwvQkIva3RjL1NoN0hnSWo4aXZPaCtQQTZiMDNFNXhmUEtRd3F2?=
 =?utf-8?B?bzRiRzFSUzNDVFN6dmhFdEtNZ1JvdzN5L2RuOGJXRGRMQlhkS21MR1pSMFBh?=
 =?utf-8?B?Tm1PRk45L3hqOGtTUjNEM0pEQ0QwYUVBLzNnVEh1dXVlWG05QTYrNVlhNFhM?=
 =?utf-8?B?ME1xYUpHR0hwL0crTHJFYm5aSGI0RzJhMmRRbjluVTREOVB1bUE1WFY1UU5C?=
 =?utf-8?B?czFKZElBM3V0R0U0dGdkK1pwOFEvOXZhNUdqU05MOUFZWUJSYzIyem0rTTdF?=
 =?utf-8?B?L0MwNEJiUWovWWo2YWRTUDBBLytNZ3B3UFNtVzBQUGEzNUZjdXE2QnVEV25n?=
 =?utf-8?B?Mlo1eU83S01mTldWa0k3YWFia0wvazNoZXU4VTJwNnJxbXVxVVZYVVdKUzdJ?=
 =?utf-8?B?cVZPS2h1SnJseTRLMDdIUTJBOVJZQWlnRzZaRXZJc3NNWEcvd3I5Q3kwMCt0?=
 =?utf-8?B?aWtybnp4ajcrUFV4QUZ4ZnJzQnJQZWpWQks1dkh6ZGtOTWt4UmIvSExOWTZ0?=
 =?utf-8?B?Y3lBdjduR01nQ3QrcHNydlhmUk1SUi80NnZHZzF0T1NBeHJXNjhXUGpQYkUy?=
 =?utf-8?B?YllmSFNCejNLYUJTL1JkNnM5WCtqclhHQzJMbjRiazVMd2xvMVl2Sm5zS2hz?=
 =?utf-8?B?UFc0MExLU2s1b0RTOWY3c09vdXNLeFlnOWtheTRxbjZjUGNaem9RMGgxWEx6?=
 =?utf-8?B?Rk1JbUdZeWVySUR2QVZqRm5JQ0JKNTRYSXIxSk5Ea0FjQk9mZStsRS9idkZX?=
 =?utf-8?B?d1RLZ3RQQmI5YW1JNjJ1M2VldjBsQzV1OUxEcXhTWjQyMlRHcTdxQm9vR1Ew?=
 =?utf-8?B?QkVwVVB1enppb1ZEK29XTEliL0FGanVUb0txODQzQkxXVkJ2dm5CTEloRmlC?=
 =?utf-8?B?NVhSYnZDdkJURzZTUE5NcG9PQjIyUzh4QjZJK05odzFCNEdpOUM3UGRJenEr?=
 =?utf-8?B?SXRWSXdoR0FqRGp2WWVXOEpTcnJvbUdOcEpTZWZzMWZtZHh5bWsrWWRuelFV?=
 =?utf-8?B?bFZacE9lWURWKzQ5Y3F5MHhwZldRbXR3WmVsc3BIV0ZYd0oyV2ZjOXlLOUxZ?=
 =?utf-8?B?cmFwcis5ZE9WRXFINW1GNG9IR0V4bXVKbk1lbWJRODB6K3lCKzN3ZU5PWGNH?=
 =?utf-8?B?SlpUdDUyZEtqOStuM24zWG50QzZGWGF3a0tTbnRBU3J5NGgvSjVDdHhlMEhJ?=
 =?utf-8?B?cnlWalNzeFlXNVZJZDZOTlAzbHd5UEtPSk1MZ21BZXBHY3E0NnlmM2xrVm95?=
 =?utf-8?B?Qm5UUmJBaXR1YjZIa0dnU0llSXdIQlZyTzk0dnltSlA5c1ZSQ3laek1rbHlr?=
 =?utf-8?B?UHNiakZGOFk3WTNjQjBCNGFRb29nMW0rZnpOVXZ2eWFTMjgwMlFkemZWU2xJ?=
 =?utf-8?B?aktCWWNlald1QmN4TkdMZUVwZy82eWplQ29ESHhpSlVKTUZKb004LzZQcjNZ?=
 =?utf-8?Q?TxG1Hq0m4hJ3CkkWlql6dQBWXov0WvAU0Xy9Q5myDkYM=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fd4a6b-d511-4aa9-74d1-08dbf4b14765
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:10:45.0317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3864
X-Mailman-Approved-At: Mon, 04 Dec 2023 10:39:22 +0000
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
Cc: Danilo Krummrich <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Op 2/12/2023 om 14:18 schreef Bagas Sanjaya:
> On Thu, Nov 30, 2023 at 11:48:24AM +0100, Gert Vanhaerents wrote:
>> Hi Kernel list,
>> I'm the IT person of a school, earlier we used multiseatcomputers for the
>> school, i have maded with a XGL implementation and it works fine but not so
>> fantastic. The school wants that i build new computers but the XGL project
>> is too outdated so i can't use it anymore.
>>
>> How can i make a multiseatcomputer with more then one user on one card with
>> systemd? I have asked already to the makers of systemd but they said it's a
>> kernel problem.
>>
>> With Systemd loginctl and the nouveau drivers you have this:
>>
>> ─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>>            │ [MASTER] drm:card0
>>            │
>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1
>>            │ │ [MASTER] drm:card0-DVI-D-1
>>            │
>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1
>>            │ │ [MASTER] drm:card0-HDMI-A-1
>>            │
>> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>>            │   [MASTER] drm:card0-VGA-1
>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
>>            │ drm:renderD128
>> ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/graphics/fb0
>>            │ graphics:fb0 "nouveaudrmfb"
>>
>> So it will be:
>>
>> loginctl attach seat1 /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-VGA-1
>>
>> For the seat1 (the VGA d-sub output for seat1 and the other HDMI output for
>> seat0) and of course the mouse and keyboard.
>>
>> When you do this, all the graphics outputs are on the second seat (seat1)
>> and not anymore on the first seat. So i need to move only the VGA output to
>> seat1 and not all the outputs.
> Do you expect that GUI output is on both seats?

I want the result that i have one seat (seat0) on the VGA/D-sub output 
of the graphic card

a second seat (seat1) on the HDMI output of the graphic card

and a third seat (seat2) on the DVI output of the graphic card

In theory it should work with the following:
loginctl attach seat1 
/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-HDMI-A-1

loginctl attach seat2 
/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0/card0-DVI-D-1

But when i do this all the outputs will be used on seat2 (because they 
do all the outputs automaticly to the latest attached seat)


>>
>> When i install the proprietary Nvidia drivers, i have the following:
>>
>> [MASTER] pci:0000:08:00.0
>>            │ ├─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
>>            │ │ [MASTER] drm:card0
>>            │
>> └─/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/renderD128
>>            │   drm:renderD128
>>
>> ─/sys/devices/platform/efi-framebuffer.0/graphics/fb0
>>            │ graphics:fb0 "EFI VGA"
>>
>> So no VGA, DVI or HDMI items.
> Then report to the GitHub tracker [1].
>
> Thanks.
>
> [1]: https://github.com/NVIDIA/open-gpu-kernel-modules/issues
>
