Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0586C82B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715CE10E40E;
	Thu, 29 Feb 2024 11:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="O/vKsnCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2119.outbound.protection.outlook.com [40.107.13.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B08710E3EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn5XCttWtk0Gzz3s6GWmAG1s6Hp75XvHKvUjJSBHzOf10eEuKRu2DBGCJBVwlozilsCWb7twFQ1kXADnWLTlNY5IQFIo/pwoCQ7TLegRfsHL/aY/yiPcJL2au1inVjsMWyyfaWjEUk+ThlruthxXICD80XkiPh7LhSdohb7AJdw8joyvdUpETDBu1EK41MlogDXWa9lLvPozbkQ0ScuiYvq3xeJdIubXQwlpsi69WI8rFyD2xMimu7nZ8JZCZw/2UpK6K/zVxdTzqWttBzTKBP7GP+vXCWzq/3XWS7fTsdPnBZpsCZfuqPtXWf/2bO5uZyRHc9ftSHvfiAgB8V5i9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtwnVzaSlwoGsh0s0V7vYe8McgGX54etJtjUzkXer4g=;
 b=lHKKLQbXUYlcUSBg13/ZbPoUORgR3cyV70nMmllBtdQlx8pPbJBHQW7qBRUza3Rj7yKssMD2rA0PFdfpFjf+M0ELoVPLmvCrLi4KOzuDnB5/KlzzbugSRmLP9VLrdkbJjd6ch1/SQHUclthIT+0vQFLQPM5uhpUgPCOsfEjQDUnfYhvEd7tgPj5N0gfMHk4kno980PXeHnuLxFFDShMYn6wefNPYTbHyuNjypxGueZgjYjRdaFo04niuCsUrWbb20xpnKdy+uwZ8aEt1m/FvOuyQr35A9/MKceHCAtV3hXkWX3IT29IAfk7QWLhHjBRKhfolzsR1fX/tWDq60xQpsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtwnVzaSlwoGsh0s0V7vYe8McgGX54etJtjUzkXer4g=;
 b=O/vKsnCYdCCXcbM4h03eWfiiKBHLae2y/o5P4DZqOWReozWhzZ1JbvNLmiQUyysy6yOt0OzPY4u+QVI7rqC3QIcPGn9voeD7+nptENo+Vlg/rUPCgeSztt/tYT6bzc6Mh3eYOg8fMh5R/zSs6e+5rIU8dgKJdLs+sGiwLwJxayo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB4PR10MB6096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Thu, 29 Feb
 2024 11:38:51 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d045:edb:e12b:93ec]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d045:edb:e12b:93ec%6]) with mapi id 15.20.7316.037; Thu, 29 Feb 2024
 11:38:51 +0000
Message-ID: <27b3b4fa-95b8-4411-8612-f2d4002eb7fb@kontron.de>
Date: Thu, 29 Feb 2024 12:38:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
Content-Language: en-US, de-DE
To: Jagan Teki <jagan@amarulasolutions.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Marek Vasut <marex@denx.de>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230328170752.1102347-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB4PR10MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2870e7-97bc-461e-6bdb-08dc391b002c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqb/JJagsiN+BmJcSqya9Rh0FxrLUkUx8tl1zfEBST0HE9of3bXo7ysGybKGW5mTw5Vuv2185p8zianhVp8v3ZYZ22yjzypiio0xJfgs3q/BOEn7B+3Mag+LdFc+sRoavRqPq9qCZnwVQqKEn7+lTxfN7HpRZyG7lzqzdYxAjw4IDkFIhJPnyejrH1Id8b/8MkX1I8aY/XEPEOIRiQPwoL8/De3pForNadVxB2qlYkXIPN0Hz/t8yefHzOPt9RCW0Kcxt+jXl4lFn1TgYSsKKAh0PSTNudAICGIF8Sk/qqg3dvrxWpl+WCFCFHoCtvAhFO24+Jn0t09KwNZAVnusJ//AuDyvo5YCsQsJzPez4GRvA4ImiCZlZZ0wiaEBDbyYfWPHMUXe7QZ6grBsDne/gZz4N3j2ss8AUz93zSnsm+8N0Y87p8S5oI+rKnsQZT64cQAkZ1n8SGuPN10GEcdqPB9jfu/dVl2RIXr+SzxKpKEeQA7H6uQuIGh/Ge6zwZU5LSiTrTbQKvE0shezCUtQgtKUXaQMuPKoJmVOShWuZUl6l0z8ZvGRX4BLon1zo3yDncx1qe0aAjfM4jRJXYUe9hqsoXm3WOSClAfM2Xb0aOScNhuvd/GnqygqpDPFju467T89ev+RuJQ53NbD7UGKrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5sOUNuMUtRMjAyL0VzOEpuUi93c29COEJXaUJzZFk1K2RmM2kxRVhaQ3N1?=
 =?utf-8?B?NzdkOGpJaWlRT1NhcmRScXpoNSthRjdXVUVkK0UyL0xMQ051SFVBN1VBcTJS?=
 =?utf-8?B?cFoyY3Z3UGRjY1poZFN0L2k0djRhdmdIb3BKSFdnZmhiTkwvR3habDZ0TGdG?=
 =?utf-8?B?dnQ5ZHp0THlNNkVLclB5eDAzcEpOR0lQa09BVVdkUkFVVWxCNEZGS0xVT2xL?=
 =?utf-8?B?ZytsRWNrZkU5Tkh6RjErUmtoMWFOd29CUVhjSE9hUGNJTm9ZVWZNTFJPbmJu?=
 =?utf-8?B?L0JqTTE5KzRlSGw1Um56S3JGV2xKZThrSzRFbzJZNU9ueDdHYkhCb2xiSUVx?=
 =?utf-8?B?K2NwV3Z0d25QZytUR0paQzl3NHNKNUYrUWpZM24vQkpVb2xuL212NlBoNEZt?=
 =?utf-8?B?anF0MDd3OWxRQng3b1JOYUFaRWdNL3h6NHpHeUNGTk52Um5sOEc0MWtkQnNn?=
 =?utf-8?B?ZUYwbEVITUpyTE9IZ0JyN3dZeEl3YnEySFZ3cG5vQ3pJbEZsNngyWUZxNW1r?=
 =?utf-8?B?TkdhWVBvb083TzdYMVhVSFpsY0dkays1MlRTeCtjaERkQUl1V0JrL1JtSCtj?=
 =?utf-8?B?OEhpYk5vdllMUWZNMjhRd3lOeVFOWWFGSmJPVXc3V0RpaDdPMkNQOWN3eTIw?=
 =?utf-8?B?cDNXQXpqVXQ3ZnU3UUJZMHgyZXorNFdSU0RPSVlOTHR4TzZvbXc2VkExNmRT?=
 =?utf-8?B?SjAyRjJTcmtvMng4NHYyZ0NzaHFZb2lLc1ZtTjlUUk1KSUd1ODlZMXQveHow?=
 =?utf-8?B?RDNQY3hsMENOVFh3cUJ1UVlkQ2RTSi8zMlJSVXRGVzVuRDFVUTdnNXV0aGZp?=
 =?utf-8?B?WDJ6cktKOWVldlp1ZzB0NG8rYktNbHZoNWNld1NTVnNyTlFSRGtBeGgvSGUz?=
 =?utf-8?B?QmJhV2VQLzBCQXh1SjlGeXZsY0IwOEdaRm53OWU3OVltTGp3c3JHVmtUUTdD?=
 =?utf-8?B?TlVMMDNxdEpJNHNHZzAyT1d1c2Y1REdOczFnYWJyZGVGMWVwWnBJZ2FjMzdz?=
 =?utf-8?B?M1RydCtnTUZQTEo0UzBsbHY1b0JONzBXYU41NmtyZzJjaWNlb2R0Y0dnWVNK?=
 =?utf-8?B?Y2U0R1N1UU1QMUJUWlJsSFBYM0tTanEwVUFlNE1PSFNIZDdXbUNhSFBhUzZU?=
 =?utf-8?B?VHEyZEZrVHpzZHB5eFhtTVhYQTBmNlA3ZU5kTURZVzRYN0NYR0tNbEdGbjZI?=
 =?utf-8?B?YjdSZkgyR1dXcHBxbFdlcEM4UHExZkNXeFZqaWg4VVpWVWcvd3ZGaGVXQmIv?=
 =?utf-8?B?cDNZVXZTaG9MU0kvcUtaemowRm1hbzN3dDN5Vmp1LzlZQUtUcndYNjVPcVYy?=
 =?utf-8?B?SzVJN2Z0Z0tkVmtLZjFxZ0JjMFNLQTlaSjl3VlNoVjk0M3JoMko0WnQwaXJr?=
 =?utf-8?B?MjVYREpYdWhvcXRWazdCeEF4dEhOZlBYSjY2M2IxSW5ud05teisvTmduVUhW?=
 =?utf-8?B?MSt1UG9QdXd1TVhGZXE2THlXRWRtT0VRdkpGRkY0aWdFK3NYVnp5MCs5TjdB?=
 =?utf-8?B?ZlNyQUdad2N6SUpUSXRXRE04OHFPVVBpd1JKRnpVamVxUWZramZtZCs2UnJQ?=
 =?utf-8?B?dXNrVkJrR1VOWnF2d1VpYWl0QlNNTTFpS2U3Wlk1K2twRHZ6UkFsUE5BYjRx?=
 =?utf-8?B?QVllOXlKcEgvNkp3c0FhS0wyNE8zNXdLTnVVd2FtT1JEeVVHK25vcllHNEx3?=
 =?utf-8?B?ZDh3VVh1czVHWWRnTHZ3M3BNUEEwaTAyUVdWNzFwWEkvcmhCRDdqSWNqOExy?=
 =?utf-8?B?RGxONFR5VG9oYjhNbktIc2dIcmk5SnRFbTlXdW9UTTIvWUszZVpWNTd6dWVv?=
 =?utf-8?B?RlM4OHo3NzdWNVJ0ais5dWVuUS9mMElsREx3YnpDME9VMDRONERjZU15eGpa?=
 =?utf-8?B?eUJmRkszNjdQWUgzQ2VienpOWEhYL3dNMit5SUtGcVRZSmd6M0dXWk1NU2U5?=
 =?utf-8?B?bVlTWHd5K24wdzR6aEliQ3FLZVJuTW5GaEZwS1AzRnB1T2JPVHd1eEZUZHpP?=
 =?utf-8?B?NlNLWFVTSE1HcGRxVEpvNURIVm9rb2hwMXRiZ2NrWE9qQWFUeDRqMXZuZ3RB?=
 =?utf-8?B?cUZjb2xoM09aUWdlWEpFc1F6ZjdRdmd2YzBlUkJLTGUxZy9EWnpGNU5wWVJJ?=
 =?utf-8?B?c09pNzYvSnUvbVFMVTFpWXd0SjV4d1lJSW1jU3prYVowaGI1M1pSU3c1V1l2?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2870e7-97bc-461e-6bdb-08dc391b002c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:38:51.0976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEsD57C9dmRgCmcPm6p5aVb4tw4FNDF85nQQUePoI8mBI/UiYhadYmlCvzoY7VXuzHslzv9GubSaJS3pnyYv8Ugh26OkbU0dQrzt6MYG0d4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6096
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

Hi,

On 28.03.23 19:07, Jagan Teki wrote:
> For a given bridge pipeline if any bridge sets pre_enable_prev_first
> flag then the pre_enable for the previous bridge will be called before
> pre_enable of this bridge and opposite is done for post_disable.
> 
> These are the potential bridge flags to alter bridge init order in order
> to satisfy the MIPI DSI host and downstream panel or bridge to function.
> However the existing pre_enable_prev_first logic with associated bridge
> ordering has broken for both pre_enable and post_disable calls.
> 
> [pre_enable]
> 
> The altered bridge ordering has failed if two consecutive bridges on a
> given pipeline enables the pre_enable_prev_first flag.
> 
> Example:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
> 
> In this example, Bridge 4 and Bridge 5 have pre_enable_prev_first.
> 
> The logic looks for a bridge which enabled pre_enable_prev_first flag
> on each iteration and assigned the previou bridge to limit pointer
> if the bridge doesn't enable pre_enable_prev_first flags.
> 
> If control found Bridge 2 is pre_enable_prev_first then the iteration
> looks for Bridge 3 and found it is not pre_enable_prev_first and assigns
> it's previous Bridge 4 to limit pointer and calls pre_enable of Bridge 3
> and Bridge 2 and assign iter pointer with limit which is Bridge 4.
> 
> Here is the actual problem, for the next iteration control look for
> Bridge 5 instead of Bridge 4 has iter pointer in previous iteration
> moved to Bridge 4 so this iteration skips the Bridge 4. The iteration
> found Bridge 6 doesn't pre_enable_prev_first flags so the limit assigned
> to Encoder. From next iteration Encoder skips as it is the last bridge
> for reverse order pipeline.
> 
> So, the resulting pre_enable bridge order would be,
> - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5.
> 
> This patch fixes this by assigning limit to next pointer instead of
> previous bridge since the iteration always looks for bridge that does
> NOT request prev so assigning next makes sure the last bridge on a
> given iteration what exactly the limit bridge is.
> 
> So, the resulting pre_enable bridge order with fix would be,
> - Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 6, Bridge 5, Bridge 4,
>   Encoder.
> 
> [post_disable]
> 
> The altered bridge ordering has failed if two consecutive bridges on a
> given pipeline enables the pre_enable_prev_first flag.
> 
> Example:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
> 
> In this example Bridge 5 and Bridge 4 have pre_enable_prev_first.
> 
> The logic looks for a bridge which enabled pre_enable_prev_first flags
> on each iteration and assigned the previou bridge to next and next to
> limit pointer if the bridge does enable pre_enable_prev_first flag.
> 
> If control starts from Bridge 6 then it found next Bridge 5 is
> pre_enable_prev_first and immediately the next assigned to previous
> Bridge 6 and limit assignments to next Bridge 6 and call post_enable
> of Bridge 6 even though the next consecutive Bridge 5 is enabled with
> pre_enable_prev_first. This clearly misses the logic to find the state
> of next conducive bridge as everytime the next and limit assigns
> previous bridge if given bridge enabled pre_enable_prev_first.
> 
> So, the resulting post_disable bridge order would be,
> - Encoder, Bridge 6, Bridge 5, Bridge 4, Bridge 3, Bridge 2, Bridge 1,
>   Panel.
> 
> This patch fixes this by assigning next with previou bridge only if the
> bridge doesn't enable pre_enable_prev_first flag and the next further
> assign it to limit. This way we can find the bridge that NOT requested
> prev to disable last.
> 
> So, the resulting pre_enable bridge order with fix would be,
> - Encoder, Bridge 4, Bridge 5, Bridge 6, Bridge 2, Bridge 3, Bridge 1,
>   Panel.
> 
> Validated the bridge init ordering by incorporating dummy bridges in
> the sun6i-mipi-dsi pipeline
> 
> Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to
> alter bridge init order")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

This patch is now almost 1 year old and it has been tested and reviewed
and there have been multiple pings.

Is there anything missing? Why is it not applied yet?

Andrzej, Neil, Robert: As DRM bridge maintainers, can you take care of this?

Thanks
Frieder
