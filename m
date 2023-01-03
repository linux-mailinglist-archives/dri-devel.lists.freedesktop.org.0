Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4365C3D6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 17:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9E10E4A6;
	Tue,  3 Jan 2023 16:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4E10E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 16:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh0ia5SahxIIFeejws9gSOmXsZ/okbARMZpP9jqbv+r1OPjctmF6fqoSxKGn5FQKKrmOgVUDs8izRo1HxOHHuno39EZQ866ARgPqkp5DoWGGGmZjC7HrYKY2q1ti3thzDKZBmHkAlT33fmee+nwyMBbCivB1ejX2HytsFkWP14bu9SM1I1QuZg420TzaDRPUDXXFAfczOA8Cxgq68ITeLBDpiyp4b4HJSLqoCHw+Ihu+L6PZSm04PXuDkKkLSS1DvoTGuV99nd70PHkKmwscZZtptV+YjDPnZhN8ZHoKjb3JfN0X703Jo8vzB9MfIQQro3BCXqBOfmn9WO6703ZgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqNPXgzOI9H+8H9e72KJB5RSpclqQXGoBhtovE2Dzmo=;
 b=cxKQCrfV3J8SQk5RsrSWdHBkJi9tbmOZBDeMGfM9b+ZoJX9U9Qv31k4RtRP3wBUXOqqLPBlGvj6t5W6dxy6W+GFb8r05rt+5836bXOPxd1AR4PYEIqyLIIr1IY321w/SKzrZDYwxc1os7apJiqYPG7E8sW86CPC+XxOIFWjY81t3+gZTlugdCkXQtv3neyUUQrkvv0Hhci1SiJbzQailSsBqUmUkaPqVv2xUen/kKjV5XGnHbZsUKJVLFwtcW3MORDKiAPtzk3lbT82Diueej8+Ts0R5cpv3t8vH8BQVXV04pr0qyxTjEoxk2ms4076uV6+Mm6vbeHyGgRrg7cBGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqNPXgzOI9H+8H9e72KJB5RSpclqQXGoBhtovE2Dzmo=;
 b=fvYTf8EnueBNRXQmKFR+ykG2c8bgZYG8t/eOM9JdEnostAG9E1yfLN2i7HWEpMRhBojGacSL1sJ7xH3ACJ6WcBE36JboKlCYIvdSrszuS27dHfx56+1rd7mfswwNxt0+22Bw57PYFzt08MKHiweCaAKXZ3o6YIdIEmk9FyIYEXDvW+YYDtgKS+YRdGPAN/gRyynIA/9fhQUpE5IYR7SkJTVmZc9tcwphZ4hlNwRxANF67YD7rNxI+tJiJ5aFXgRpWM4HmsIorVIl3DR+RPo07ndlF62iQKiOlUdfyipKTYFDybhWlNa4SXXkLvs4SslKQR1AOI2cxKdlB4hiHC6i7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DU0PR03MB9445.eurprd03.prod.outlook.com (2603:10a6:10:419::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 16:24:08 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 16:24:08 +0000
Message-ID: <307bfb9c-75e6-e0e1-4992-79f22671ca31@seco.com>
Date: Tue, 3 Jan 2023 11:24:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Robin Murphy <robin.murphy@arm.com>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
 <20230103161550.4tui3ihl65olvkd7@houat>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230103161550.4tui3ihl65olvkd7@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0060.namprd20.prod.outlook.com
 (2603:10b6:208:235::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DU0PR03MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: b13ced10-b018-4dca-05d7-08daeda6f07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7WDn5udqoR/mhkrsEWikoChmvsrz8mI+A/2/PZSUXaA2XgD89u0Vj6TuewrtUpphVSCjGtqKmd0ZFghrkCUL9GgDO0j7cgio89EfWpKkxI89fxLmV/hcag9retuFSrLaVjiEQx09nEAQ85lX9OWcToVaxBHw1En0/TBP3mdIcxFjrmxr6yvW+ZJ1QsCYPyDsCO2eLXikPKr+ymbLpjr0YCENGuPI9AX3zPSNmSxkuTE1s9zOvVxz5cKY+0FH1kuwVuei9KoFJu7t+PCEo6url7Ij8Oaw6r/fsA4DrKlJyZiAYRomZ2dJzNdjG82QWvD2ZZ4TGLOUORhLdEDZwno9dhySHa4sXqqBjbGeY63j9M2iiAQCFeHaOLsZsU2TtnoReObzXzGnO+iZvM7lVmBVTCrcMx6ZFtEkScx5uTPdnDUUjRvKYgqq3aAqpa2hwl2w9JGgD5Yf9kKgMqSERtuKRaMah6NtJqNKvLTbmuJ2D2fnh+GXrZ7uactRz4Pw9RJqVFUgFwqEBDTNY6FTzua6QK68dusUFfgxXwEDw7j8knARUi0kSZhlKiCacqfYMghjQmUZpywwS/DNE6GMIZbRuLizRjM+B4IjEbbcVPo6v/Q8blYPbh63fVXWUDjvs2FiT9HBsN0P9ZsJRTgcxnYy5+yWb9mKh5v6rrs1TBSfPyC4fLO+P24Eqd8XyQWn9a471G/CDcFO46pm9oj7O6uRWZL7OTKmnx+MBJ3THiSJq9XLSu7TFSlTtGcwjtajTkrF/6+ftV1ybDazvK+1CYVGRfoiCkLmCg1Qi6rrWbl/LdcDNGzTBZmtWbhU6ZPTewtA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39850400004)(376002)(136003)(366004)(451199015)(86362001)(36756003)(66946007)(66556008)(8676002)(4326008)(7416002)(66476007)(5660300002)(44832011)(83380400001)(478600001)(6486002)(8936002)(26005)(966005)(52116002)(186003)(6666004)(6506007)(110136005)(53546011)(54906003)(316002)(6512007)(2616005)(31696002)(41300700001)(2906002)(38100700002)(38350700002)(31686004)(22166006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFOc0RnV0FKM2V6THpLdDR1K3liVGlrdDB5TDFjNDB0aDdCUWoyZzFNQ1I2?=
 =?utf-8?B?cFFNQ0IvQlB4eXNQVnVxZUJuS1lwQ3A3UUg5d1ZCb1RlNjB3eGVrVWlUcHcz?=
 =?utf-8?B?SVpvbVlnS0IrRExVVlVEMFZDakpJMDY2c2h2TmhvOVA0OGhZaWF2SEJRN0JY?=
 =?utf-8?B?TDFsdDBEVEFzTTlBaVFXSEZ4RiszTTMwdVFnQXpzVXB6U2dEeGtXOUR4a3dx?=
 =?utf-8?B?ZlNtY0x5bzJ0UUFuWFlJSWxaSUwwbmd0bEFuUG5oUW5oM24zQjZCelRFTU9F?=
 =?utf-8?B?Tkg1LzFCT0ZzMXd4blBERW03S0ZJUnFyM2tFZnV5MjF6NUl4dWhSUlZhcG5O?=
 =?utf-8?B?OGxKamJUUlZ0OFBJak9EVERPc0IvT0hjUzRYVWpvV2tCWnhCTnY5emNFSUJK?=
 =?utf-8?B?cXFnNS9tRXlpOGtVc3BzNFlEQi9xQ2t6NFBwdlpHOWtKMEY2ZGp6bnJVMkRE?=
 =?utf-8?B?Qk1qc3kwT2JxbnlKTlRyai9URVJMOFJRRFFia3lOb2hFcUpaSEY1M2tTY2Rp?=
 =?utf-8?B?RjFsdnNic3dQbUZQMHNtalFSazh2VE44aGxvWWVwODdubjZVeEVKYjdsYkty?=
 =?utf-8?B?anplSlU4SjRSS3FIaFVMQ2FlQ3dGcGpPaG83QTI5ZWN6NEdXUmNqc0lSSVZy?=
 =?utf-8?B?YkJJeFFHaTM2M2ZFWGhhOTh4UGdXb2V0N1BtNy9BVXpsQUh4emVwcEhqR2Iy?=
 =?utf-8?B?VzFndVk1T3F6TnlWOXRvMWhJdDZEaGU2RGdnT3BxYlNiYUNxOU1OVmxLNGh2?=
 =?utf-8?B?ZzhjUTV0dTc2QytiNlEydUIrOUh5VTF5bWNydk41cXJPejJaQ3dRUjJKYkIr?=
 =?utf-8?B?TTd0WUlFSFd0Q2FQKzVzM2hETHBVTVRHRGtHMmFKdlVYMHlUaklJUWVGcjNQ?=
 =?utf-8?B?YWJzQzF0ZVBHT0J3YlVMcDk2Z29LeGdUQ1lneUVJMmhHazZTVm1leldQbW9v?=
 =?utf-8?B?MmlnY0JhanNsT240VW1TaVMwYXZIekNnTGxoNml0QXdRQXJOM0VEUVZWQjN1?=
 =?utf-8?B?OVJhUndpd205VkluSEFSVmk2eHNyZjRMY0dvS0RKc1VieVlabkczMFRDYkcv?=
 =?utf-8?B?eWVLTi9QQTF0aFZqcitKdUxMM3RjcW5wc0dDQndJVVZ5UDBRUGlCaDN4eVo2?=
 =?utf-8?B?VjNNVnAvdU1rdi8vYWFISTIwT0cwcEtSZkhzdWY2QmRIdVlOZThmakFIa2tF?=
 =?utf-8?B?aSt3Y2x6bHZLQ0hwR2RkV21yZGJCdkNhU1Y5ZjRjNFJPVzhvOHhOV0NnbUNj?=
 =?utf-8?B?Rk0zdCt4NDlWeE1yZWhBMk1leVFWQVR3NWM4TDZ4UXg0eWFEbk41eERwMEdn?=
 =?utf-8?B?UzlFK3F0VERlZGV6Q0V6cVg0b3FoNUpwMjZkWVhYVG5Pc2V6T3lSNlVWd1Jw?=
 =?utf-8?B?STFySjFDZjZIMnZKSjVhTUlMRVlQTXJVM3BsUnVxd1V6VkVzMzZldFNTTWE0?=
 =?utf-8?B?QnBrazBtRjBJekVQU1pGakZEMlpUaUV3YUFQNk9DTnV1K3RVa3JuSC9ObURK?=
 =?utf-8?B?NytQM2tOUU9jdW9BYXVBWjJ0NjdISEMrZDZDQk4xTk9paGJ3MStvMm5mM3VV?=
 =?utf-8?B?MjZkWENCOW05dHUwb29Cc25wb2xvSXhVL2dkUkVaWUV5bHJXOEpTcll0V3hr?=
 =?utf-8?B?Z2pSM0tsUHlsR0FOalk0dWRQYjM4NkNPd3pOU2M2M1VmTmJxeE5YN2lGRVoz?=
 =?utf-8?B?NHhRYmNOVXludE5GWlFJUGgzVEJsWWxsZS8xMHdySDVRMFNyVGJtb1EvR0pC?=
 =?utf-8?B?bHZzTFAvTnFZOUFuU1Axc0c4VzhSSStEQzh5aGxoVnRFbmlDdHU0ZHE3QkNm?=
 =?utf-8?B?dnNHc2txNlJqWVgzbWsxNFBkRnpaWmF6VmNOWGxMamxjV0lHbU5SemJJV1U4?=
 =?utf-8?B?bjF0TGxMcmNVZEVQMElsMWtvbDZjN1NHbjFDOEh4bmM0ejZ2bHB5K0s5eU9x?=
 =?utf-8?B?T2FLT3JmMzFZd1hHbFhla1BBUkNJSGtDMElORjZkYml0VS8vbnRQQnBidjlj?=
 =?utf-8?B?WXIwbEtHWVg4Ukh0NmVvT2xzT0gwZVZuKzNCQXpndzRBZW5ybFhYV0ZkdVBl?=
 =?utf-8?B?VHcvdXlLV2Y5bnpFOTZqZ1QxZ3JpZTgwRG1GUnJxRFdUZ01GYnFYNE91MHlY?=
 =?utf-8?B?QmRvRkhiUGVZY3c2Z0tSRVg5cUJ5bUtXK1M4aFlxMWI0S2lMdGRiWDJoREFW?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13ced10-b018-4dca-05d7-08daeda6f07c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 16:24:08.3391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UI6dYUaJ/JITac/W9niyhDv9NJtFTVE1Ml6dCW+/kBGHnZGef14Jr1EAmlenCs9VyPCSax1E6KukBUGmDaRhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9445
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/3/23 11:15, Maxime Ripard wrote:
> Hi Robin,
> 
> On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
>> Hi Sean,
>> 
>> On 22/12/2022 11:37 pm, Sean Anderson wrote:
>> > Convert users of component_match_add_release with component_release_of
>> > and component_compare_of to component_match_add_of.
>> > 
>> > Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> > Acked-by: Mark Brown <broonie@kernel.org>
>> > ---
>> > 
>> > Changes in v2:
>> > - Split off from helper addition
>> > 
>> >   drivers/iommu/mtk_iommu.c    | 3 +--
>> >   drivers/iommu/mtk_iommu_v1.c | 3 +--
>> >   sound/soc/codecs/wcd938x.c   | 6 ++----
>> >   3 files changed, 4 insertions(+), 8 deletions(-)
>> > 
>> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> > index 2ab2ecfe01f8..483b7a9e4410 100644
>> > --- a/drivers/iommu/mtk_iommu.c
>> > +++ b/drivers/iommu/mtk_iommu.c
>> > @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>> >   		}
>> >   		data->larb_imu[id].dev = &plarbdev->dev;
>> > -		component_match_add_release(dev, match, component_release_of,
>> > -					    component_compare_of, larbnode);
>> > +		component_match_add_of(dev, match, larbnode);
>> 
>> I've long since given up trying to make sense of how the DRM tree works, but
>> the conflicting change is definitely already in mainline:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b5765a1b44bea9dfcae69c53ffeb4c689d0922a7
> 
> As far as I can see, that patch doesn't affect DRM at all, and the
> commit you pointed to doesn't either, nor has it been merged through the
> DRM tree.
> 
> Can you expand a bit on how we're involved in this, what we should
> clarify or help with?

Patches 2 and 3 of this series depend on patch 1. Since patch 3 contains
the bulk of the changes, I based this series on the drm-next tree.
However, patch 2 has a conflict elswhere in the tree, which did not
appear until 6.2-rc1. At the time I sent out this series, drm-next did
not contain this commit, and I couldn't find it based on Robin's
description [1], so now we end up with a conflict. As this commit has
now been merged into drm-next, I can rebase and resend if there are no
other comments.

--Sean

[1] https://lore.kernel.org/linux-arm-kernel/56310773-a062-0e48-28f7-6d2c5d035fee@seco.com/
