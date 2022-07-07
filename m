Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD256A1DC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 14:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1EC10EDF4;
	Thu,  7 Jul 2022 12:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2138.outbound.protection.outlook.com [40.107.20.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D64114AD43
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 09:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP3oE21wDMD0xMXg5lurmc72W1lEqL+zYskmC+B9HR50bGfRqY0V02lb75Zy7TxcW850tF5KcKcHo6F4Uo6sAqAD3xNkZzHrL1N+MaCRSuHNh7AP/APo0MdtEez/nwLtVsjjrMUicNmCRCrINoihFzVImEn1b0xCKjB6Ip2aikwb9RP3fbaMwwz+ZFU9qj+Rm7ZxvyRMxS2thUzhMaWWLiBjxHmcQKAp1H0jyzXkMkava4ou1/mvcAJu7EG018Q6DsmHW7URDWy9hG75McLBLxbty0xuKrJrBaKi9j2BvGwkfeZS4RscJ2fi1sKx3hIIV7LeE4A/eQgnoAgE2fxv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpZ/CgB6zJXXfNKq/QhQ0YXL/VA0zUTZ7uYfbEPrIx0=;
 b=nk0ctyj3McEifDkT+M42KT/AJRhJF7JJAX/v5STstK0L01d4n6jEv2cbYzruCGtAm0TKs+2FBB3iJoQ1X3fZTl83wtRoam3kR/JQRSjiOhI7xffkCE1nDfPg/o5TZ/6JiiLmTfDxvuhTH5NEczL1gOCk/qBmE9aMITkeOxxiZjmVFL74xxfqKlOs8pXjm2sLLVNEGLqCxVqIqNyFGixptzYmFHNEcEMbz/+BEpTJjG0W9bWLIb1t40qmHoexQrvVDgQuMNngd5cFTdYAKdWlZdih/SoJhvqTC/j1pLTIbttsAWMGREFSZQP9udQmm5RlyRglw648/EbRCHhPriz+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpZ/CgB6zJXXfNKq/QhQ0YXL/VA0zUTZ7uYfbEPrIx0=;
 b=V5QY4yFuD0zWYIk4ivDgFw1Ub26EuHvIY5ou4ZFZzPjsn6bsmtB1uVlM4wyRRr88QOUx0G68hrfRhs78ICYqIMl1zO7YjJB2nV6vaQ2tnsy3L/bnHSYo705v5XBZxXb5aVcpFP5p7J3ubCOjvdMSZi9iFl77f3ScaMGNst6B6aQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM0PR10MB3588.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 09:46:26 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:221:b57a:e8c8]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2827:221:b57a:e8c8%5]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 09:46:26 +0000
Message-ID: <b7d9c7d5-283c-a922-f773-17d722ff03dc@prevas.dk>
Date: Thu, 7 Jul 2022 11:46:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: connecting a sn65dsi86 to displayport connector
Content-Language: en-US
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Douglas Anderson <dianders@chromium.org>
References: <0f803b7c-d004-1302-6ef8-205e5b177918@prevas.dk>
 <165703382008.2228597.17239168312569308180@Monstersaurus>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <165703382008.2228597.17239168312569308180@Monstersaurus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::21) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d39f5353-66f0-4e57-072a-08da5ffd8f5c
X-MS-TrafficTypeDiagnostic: AM0PR10MB3588:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PXy2ALfE7spNUJG4QopsTGvWf1z+mFMqPJ74/zy5Tp6NeLbNl0kPDwBySPHIuQXA2KKdYi0iCouEnr6b15KJJdFKDCzOz3g/LPqu+r74hrRuVlX3shdkP4xaWvUj1NHH90Q+xPyigvdEExZvBaX1kce3PsSvom8otBSTWRt7GmrrdP5C+hGeDLKqYwh2LrYxOoj+DaEzNxo6rfMs5xtaq0oV0dLJjoat7nuJKHERPNZW3eAL/RtBUrtFDFKUoi71x0ARLDSeVrQNtmanrOO7FkWKBtpPN5+0Nso6U/Wq3oD51eSQ0MNgPMacWMGt9nLkE6kCcbjP70ciPgdsfHiM7VwSrLtBTkL0y1qDYP6HWZPkminBVubw6aN5jrOfyEMDg8GK6YRV3dosYGUfhT/s97YJr9DqtOrBELiuund2B47ivBQ2a87rQLhCuOPWd0n6CW/8+vcdKJk+HUKzdtPP9ZNrHH9Uw0mf4ygdhqhBHenlJ18gaZ/y+QgK2cEGGoh83hkawTZjZqcADP2CNJY7X3lteX+F9KkYnLUEeU0uGxLaWbGrwj7L6igvh+xGM6YsedRyfCJuwykp8GXHyGT7aEVAU9qj6NsmmwRh3BYHhy8k0CLdzFzzKTKd4Scq4lisWAhM58oh6zLOyhFwkyn98gT9ffQTAPgcu4gqApbHXyR4IEfziaTjjqxOtB1nkPtD1dwRtGhFpzCjfF3yqEoUoMrLNXR9ZWbiJ+/m9NcnKQG3+IgXdjmMqdFJBMue6KPK/I/KSFP3+2LXz8h4eKjXQsYWCLCQ1idWA4u+YPxdceocKfiCynyIQEnvBlPVEQKyEcnAEg/QuxjcCCgYiYotrV+MMuIh9cUteMmP6lrn2sEUHNgTqYInWo4JuywffSpw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(376002)(366004)(136003)(39850400004)(36756003)(6486002)(6506007)(26005)(2616005)(6512007)(478600001)(186003)(83380400001)(38350700002)(38100700002)(44832011)(2906002)(52116002)(31686004)(8676002)(54906003)(8976002)(86362001)(8936002)(5660300002)(41300700001)(316002)(110136005)(4326008)(66946007)(31696002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS8zUW5pS1NZdHd6dUVhbWcvdVBHQ1IvYWZJaTU5MHRoZGFTT01PdlA1WmE5?=
 =?utf-8?B?TEc1RmhWTGV5ZlB0SHIwcHRkbU5mc0p4R2N6T2RXcGs4Wmc3NXdLeXNLOHdz?=
 =?utf-8?B?Sjl6YStBYmh1a3NBUWhUeWVKRDVSU2pPVjlEek5UcW81VnQ1dzdKRGFuS25S?=
 =?utf-8?B?NWVrdGFBcXlFait4MGlxdnBHUlBqVTN0OUY4OGRKZyt1YlR4aDFZQXZ2TjZk?=
 =?utf-8?B?Mm9VdEd4ZTJGWUdBTmRIdU1JSmlnUkJUVWpEc2NaY0tFQUVMUkRoYXhsWjJG?=
 =?utf-8?B?RGpMSm14VlNkUUlndzZ6OVpick05UGdPaUFjY01YdHFpeDhVQ04zc0kweXRh?=
 =?utf-8?B?Q3lFOTI3RU1aVDF3VDhoUXlYaEpQclJPLzB4NjV0U0c5S0pkY3cyQWFsV1Bp?=
 =?utf-8?B?MzBZSWtLaTh2UnI4ejgycXZKcFFhYml5WmVkQjhySStxNHF6cWNHTEl4U09X?=
 =?utf-8?B?VEx6WG1mNkdmekJpTFZ1VGh0YU91TldDck5Qei9QNk9YRmZnOHNJSCtsWHlT?=
 =?utf-8?B?Q05PVWVsMXlZaEN0MllMVjZiVUptVlliQVkwVUNXODZaZktMWmxzZWdsb2pJ?=
 =?utf-8?B?dWttSUdaL2U1YjFDRXF1RnpLSWJBaTRaOVMvdGQyNkJBdFpmNlVwY1BHcDVT?=
 =?utf-8?B?eGw0U2RkcFovSlAraS9VWFJRQlJWYjUralBoSnZQb2o4VHlmY3pGYmJQUDls?=
 =?utf-8?B?bWlFa1NPZ1o1UVNUdW1iVHJmVHh6WGh5aUk2TU45Yyt6U2hYdWRkWlVhVmZQ?=
 =?utf-8?B?SjhzaEhpc2VGZGxWSWpuUFByNHMvV0syWnROc0VFT0N0TGU3VWVTWmdjdVVa?=
 =?utf-8?B?OE5HZm9hWGU4Q2lFQW94ZXhub0hJK0prbU1KUXFkT0pQNmdiWGRTOWkxS0J4?=
 =?utf-8?B?OVVVTVVtNXFNZ0U4VFhoMzBsSWhSaVNudHRaSjgwMkRhWHg2RlRiSjcvMGxy?=
 =?utf-8?B?NzVQc1YxQ1RveU9iNkhQNjRnb0picFgrRHhabXVjTWZwWS91N0wzVVppampD?=
 =?utf-8?B?bUVCOVg2TFZXU1FUMjN0dGwxemFVUzRyLzIyY0g5UVNxeGxyNlY0NGZPaTd2?=
 =?utf-8?B?aFZBZ0hNcWNXZXUzcmR6amZqU3c4LzlrSDl5YVpicWVITUJVMThQU0I0M1N5?=
 =?utf-8?B?RE11MkFTRmVVaTFpQTRwMHBPZXl0SGRLcC8rT1ZkL1dmMmFjL1ZVbVNwZm5s?=
 =?utf-8?B?a2paTWllTzdGSWhIYXlNQlQrcWZycmtydXRpMGxzZXRYMS8yNEROM0tkV1NW?=
 =?utf-8?B?L1Jrbnc3Q3NyTFZuYUE0UG92a2tnOGdHbnUrZXQ1Mzh2MERRU0VPalRwVkNO?=
 =?utf-8?B?aUs1c01PdklHaGpVOUFIVGRFZTY2dS9aQVEzanpvR2V4aW9FdXVvcDJiemFl?=
 =?utf-8?B?MzFXTnNyL2tsNm5pODBuY3ZvV1ZzNklHWk5leEVrbFdBQ1JIUzdVRW5CMkIx?=
 =?utf-8?B?ZnZWeHVEODlpN2dLdjZGRFBXUzlNc0w0bHU0U1NwMGpadWtOSXBmL2JIK3VQ?=
 =?utf-8?B?a1VVNFU2UUNWNHg4ZlpOZDY5UjdBeU5BRENNZE1nSFpHcmNNNGdhWlN1S0dB?=
 =?utf-8?B?VUlZOXFKTzFFT0tIWGk2V3NmSlJGN0gxMnBwaDFpSmMrVm9zUDVxMjcyNVJG?=
 =?utf-8?B?aDV2S2d5NjQ3SVFYelV4Y2wvTEpzQnBzRjR2bVZxUFVRbE9ldWJoZTBiR2lI?=
 =?utf-8?B?cTJPTWFseUEvWmhjSnpHL09pdmdQUGVLemNMc0t4S0pURGZNUFIrbzhoL1Ru?=
 =?utf-8?B?Kzd0MDk0enlwZmplbnJjTmJNTGhkM0VJQ3E3Mm83WXJIMCszSDRwSDE3THhp?=
 =?utf-8?B?M2dSMFA1UURydWs1QjVyaFA0c29VV083aWg5ZjBMTjJuM2xKTDA5R0Nxdk9h?=
 =?utf-8?B?TEJUOXgrVUlHRjdJUW5PZVhrams3dHJQazlPTFBFaHpSdG12dy9GclBwV1V3?=
 =?utf-8?B?eWdVWElIdmNhZWZmQWtMUjBtV0IvZGVWNEZYaVFkeFRYMHk1TmpDRnhaV0Q2?=
 =?utf-8?B?RHpzTWdiR21ETy9obURZdUpCOW5Ha3h0ejlVK05EWGlzTTYvMkJMRmFFMkNQ?=
 =?utf-8?B?NHVxbTZVVUJJZGVSRm1jQklKRHFBTzdDL0tySElDRTlyUENKNWhsMVBEUEFP?=
 =?utf-8?B?NThHKzZldm44NFcxQUx6SmxrMjVZT0ZCcjh2Zld5RDlvN2lBVU1BLzQwRE91?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d39f5353-66f0-4e57-072a-08da5ffd8f5c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 09:46:26.3977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFKSW331/7M+VG0+I0ZgIwISXyU0WNN1NEa4rkO8jGCKCHqRjAgJ8O7/5/b7fn7WXT6j594HL4g4IQ/IOeTxUC+DvfqeQZg41T/+lBWZ+mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3588
X-Mailman-Approved-At: Thu, 07 Jul 2022 12:21:36 +0000
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 17.10, Kieran Bingham wrote:
> Hi Rasmus,
> 
> Quoting Rasmus Villemoes (2022-07-05 10:08:37)
>> Hi
>>
>> I have an imx8mp board with a sn65dsi86 and a (full-size) DisplayPort
>> connector, which I'm trying to get up and running.
>>
[...]
>> Any hints would be highly appreciated.
> 
> If it helps, this is an area I've been working to support one of our
> boards. I have a branch at:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
>  kbingham/drm-misc/next/sn65dsi86/hpd
> 
> But it's still a work in progress, and now needs rebasing to account for
> Sam's latest updates.
> 
> I intend to resume this in a few weeks, but hopefully that branch may
> have some helpful pointers to get things progressing for you too.

Hi Kieran

Thanks for the pointer, I'll take a look. But just to be clear: Is the
board you're referring to above the same as the one where the DT changes
went in with commit 5a6bca1ff7 ? Or does that Falcon board work with the
current state of mainline, and the patches in the above branch are to
support some other board/use case?

Thanks,
Rasmus
