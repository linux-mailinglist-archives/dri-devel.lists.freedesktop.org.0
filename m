Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027926BAAD9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBFF10E97D;
	Wed, 15 Mar 2023 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2089.outbound.protection.outlook.com [40.107.105.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CF610E97D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXbepaKEPf9UzixiWOuCsqCajhOJuPYK8LwwS6roCCqiSsaU1DaD6PZeQyOFiGl1uvwTHhPsHYRxZfgTtCWGcEBO48Vk341Kn/BbYoE9C2cdnx29x2Br4ej6gHZbamTS/2ORjbRx1jDtLFFp+wnoVMqtnw0mCneVuXWLbXge4imgiuXPhpCQt9pnrkG7r2e4Costt+LiLfQS5HhXQ4vluC+w1mYbfViD9InbmYnM33Xe5vLcNvBL2tGkZX/YYhIEf/0u/OXwLCXlU0GXGdA53jbb1/3yz7HPmDzkCWHG4HYf/c//TygklHuQo7PlO21F9VnCOaPCuhY+8M43KoIQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvMrP2buwYpfbwJhpzbLuWYlKwnrnBWTb6aaEKNnirs=;
 b=EZN1fM+dfH/lTayaukKDqHYtWXXsUOz9iYXy8vNaeYUbutkWecdjeNI+7Ekb6FmQMKVd/tGehmfdxGpMiitHuk9a02S+neB23kAuMk7cZ9uzhwo4d5Uq9loXqfGakclzqoCtR3MuJpm0n7U7OTr0LEOGY40yKLUyXamUKsXt7ztsk/+2nOvPNwcuPIV+TYfjtNEjuzEsn1rSR3iUm84MNwJ0QtxN6eE+gLcBmd29fDbXmjCQrqui/1o100JmNNcEUtORCnFCTKLerZm7kFUPdHN9IqsW1qFdVxsCrmQbVzBTtJ8Qc+lDQCI2xEbmEpvHI+ilE3iT0XxZFyIyPx9pSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvMrP2buwYpfbwJhpzbLuWYlKwnrnBWTb6aaEKNnirs=;
 b=tHauzAU8rf/8rmsu4be09wXDphIcHdwKRoC00TsHQEuwng7HujC38czb5bJuC+lwsZRziT8VgwZZkKogLvUS9zCp83DBBaLkYs5y2BQ833MYfg9A88+/jFYY4TLZ84U+fTCH9SRCTHiRBEugyUqP0B2OwHwzusGZBRU2XZo690M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB4PR08MB7934.eurprd08.prod.outlook.com (2603:10a6:10:37a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 08:35:07 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 08:35:07 +0000
Message-ID: <46483806-a382-3ac6-62ab-fe2506444ee3@wolfvision.net>
Date: Wed, 15 Mar 2023 09:35:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] drm/rockchip: vop2: initialize possible_crtcs
 properly
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
 <20230124054706.3921383-2-michael.riesch@wolfvision.net>
 <20230314160821.GA13416@dev-arch.thelio-3990X>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20230314160821.GA13416@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:800:90::24) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB4PR08MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b5bf5a-5732-44f4-2c2e-08db25302e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/Ec/rbyltRP143Lq4CrD2LbJBZo70AkkqrOCFSW2A3yKnBmLcvLxERLWLWO++GfEmGqAxXJlh7hH599wAEs9YmKgAZ41weZwDBJ+lpShz+MbWbvjxwWJ3wOlWkiCBQd02CiHJOnR7PjmMRPQGxZGO166dKLsmkxgz1iZjHAo6VXEyVeZM1A9G6jyoC1zhItwZx1MVsi0tcqxXv/ftUCSa1598zZ4F1eAIIycrvtTZNLrxm/4To71u7irRR/+DaeU0geuqga9VPW4uYhJLSmacPJ9qjxs/V5GwGNpoycJv5Rm3iDPwp5W/lSLBzB85xwBeRBzGt5ckaYuboQo/oWB2YBGRtcQSwZFiyaZEkqYCpMwHCBqrCaosRm7YnstcZ+iH+qPQPpWGwsOrMFnMG6vdeLL2raNQqdZa2di67IyTpJRmNX10/joi4BA5YJdA7CdlpWv5tzADo3sbyS+l3cASKH4A6XQkMMeHQ/RCLx2jSThSPCNvid3qWQOpGOCWMpVWbTzI1yJxjAA5K8VpCCz2BOXOuiFSfi4AyLBUWvjRTId1lO0UnvcTpB3U6wnm1e6dbY8RhWYatlVf4Pz1NEc/xbUllK9PT7/4d7H3P5tKvAbwbL16Qx6RRI7/Psr8P2hWuoGROeHwyB21k9b7g32lF04ztSWMRhz269nVaPUlh62uZQRhhO+zjBREPVipTFNvBFfFn/h2wGojrNFI5dr/WrBMC9TtSNqiBiRN2xu9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(39840400004)(396003)(366004)(376002)(451199018)(31686004)(2616005)(4326008)(5660300002)(53546011)(8936002)(6506007)(6916009)(6512007)(41300700001)(186003)(7416002)(26005)(36756003)(31696002)(86362001)(83380400001)(2906002)(44832011)(66556008)(8676002)(66946007)(36916002)(54906003)(6666004)(316002)(478600001)(38100700002)(6486002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXVNbSsyK2R4U2w2ZUdObE5JR2dUQkh1R2FjQzJsTDY2S2RDOC82SDQ3VVN0?=
 =?utf-8?B?N1dLTEN1YXJzZnpoTEI4K2VlMm1aSUMzMllyaGorRGJsZWp0ZVZ4bm5QYk96?=
 =?utf-8?B?WGNhOVhNN0xuN1BoTjR5cW1Ma3o2N1p6Qk1TRTZYK3NVVS9JMlFTU1Y4VWE1?=
 =?utf-8?B?bW0vbjJ0U1RCaE91MlAxQlNNby81VXl6R3paUFdjSTNBVXEzRHpXOUhTTW9z?=
 =?utf-8?B?b24rYjk0WWNsZVF3KzE3Wk9DdlVDak9JUllwNDVBbzVGcGFZVzYvS1Z4Y0RP?=
 =?utf-8?B?eXpvYlVmeHpldXdiYVdEelVuek5CcWRNU0xHdGpRZTJ3SDRTd0p0NU9UeXp4?=
 =?utf-8?B?aGhKcGEySW1LN0VZS28vZjhYLzhyTXpLbm9tR0x2d3VPeHdHM1pYVDBEZUlv?=
 =?utf-8?B?RzRQSUM5RjZoNFFPam94U0tQcXdydlBSOGZEdlo4eVBRUXVLZlJ6RDRsYzIv?=
 =?utf-8?B?RFBLWk1NVG41QWxlVStzTlBvUzdQZ1MrOHdrcU80cXVMWERwemcwbHZYeEhl?=
 =?utf-8?B?Nk1vTGpUYkU3bm41TGQyeHIwU2JHc0VIc2pUVjBaWkpuQURxT2dnbHByTE81?=
 =?utf-8?B?OTZZMUEyMFVkZUVlcit2REorY3RlbUxGcUV2VHFKWU92OUlhdWZCN0RoeUpq?=
 =?utf-8?B?T3dCTllLYTY4bWVHUi9rK3YybFplWGRCczZzQXY4bWRuR3MyVHdkRU5SOVFv?=
 =?utf-8?B?WnRFNXpqNkJtbWt5dnF5L0ZRanBaWjFjUW4vVTRRTTN0dW44SzVKM3V0UU9n?=
 =?utf-8?B?ZDNYT3pnYjNkcngvZTZTQ2tjbEVLV3AvQVQzNmV5czhMVjUxWHhESG5MN1JU?=
 =?utf-8?B?ajlMdHJRYmk0emVRdnNqclpzYkF1cE9KTHVsRk44S291eHhYcmZyeU9GMnA0?=
 =?utf-8?B?VS8xVE1rczZvOWF6M3J3R0FpeDdyS1JBTXlHejZ0QnFwYnNaZDZoRjBPNFFJ?=
 =?utf-8?B?YTZrUHZ0UU1qem4xUFdqRTVxOWVsZ2VFQXpBYWpMeGcxYWNDNDBvWW9jbXVr?=
 =?utf-8?B?dXF0Sk56NS9KZHRLS3RBc1A3dWlvOTRkVFBiU3NBczJCQWdDSDZYTUo3Q1hF?=
 =?utf-8?B?QVZuVDh3a3hZbmlqcmkrK0xwSnV6amZVK1p3YnlabFpXakM1cG1rbDM0cDU2?=
 =?utf-8?B?QkRseXRTYUprNlU5Y21JSWowK0k1ZWRXVlJtdlNnbHJRMzNkMXErK0hzTGFC?=
 =?utf-8?B?NGVlUE82enhLNkd4ZlQ0bmN6V0lSU0l5a241K0xYWUlMYzl0WTE2VE5kU3cx?=
 =?utf-8?B?ZmE4UVQrWUZwOWZBYWZ6WDEvQ1ZIRjFWWmlONndNL2ZTNlpRN0N1cXlIQ0pU?=
 =?utf-8?B?NzZxOUNpa2orV1k1RjAzUTVhdnlpbmV5T1A3YmgyRzZ6MVFnRGdlajJEUVF2?=
 =?utf-8?B?cWVTWitkRFJOaVl1WnM0SXpQSFVwdnp0ODR6c01CcXUxcVA3M0lSN2ZsUzdu?=
 =?utf-8?B?VFBQTUk5Y2Y0VjI4d0FNeUFUaGNlcmxKR0UyMmV5RmpOUWlib0JyU00yQVR3?=
 =?utf-8?B?UmNCb1czQmZHMktqdmxWNFFLc29VTUppUEV1OXp2SmFESlBzNytlMHd5Lzh1?=
 =?utf-8?B?V1krWjFXckFSK3NDTkUrL3RETjZicWpWMWFYbk5ucjJuRDdtMGgwSVY1UkJw?=
 =?utf-8?B?ajJBZUh4MjJrZkJQWmpaQWY5LzdpSlNLSHUvaEh4ZEVIVE9nUVR1MWE3NXl1?=
 =?utf-8?B?ZCtySE5Wa0FxM3F1a3UwdnhoRUxvcElPd0dka29OOUF4Z2xNRHJVWFJUZEty?=
 =?utf-8?B?d25GQmhwVXBvTjBHMTZpUGJCNnNkbnFWNVorSS9PNFRZVE9WM3RXd3JlUjQ3?=
 =?utf-8?B?QllZS2MwamhzNmIvVFBYMjAybWtTZEJmOWQwUUN5amlnNEVaVEx3b2UzM2xi?=
 =?utf-8?B?Z1VycktVWklMZUZycDROYndMcjF4LzFWN2RTNGxlaFRpMmFuVk9udnZkaWg3?=
 =?utf-8?B?VVZsNEhYR1puWk93WmZWZXJ4dWNObFBKczJVckRnOHZnTFFPQ2JGUFNSQldo?=
 =?utf-8?B?WXVHMks1OU9Fdm1QOFRjTnQrWUxROTlUTGJza0VDb3h4ZzNmbE80VXgrWVRj?=
 =?utf-8?B?bGhlQXBwaHcyc1o0d1BIai8xelFQd2dWUFByTTZ3Nm5LQ2pBcUR1VWRzajNG?=
 =?utf-8?B?aStLOXNHMy8vS0crWEtERFYvMmdCUzd3WFRyekVtUEZxWVNsUHBzRXZkZVFJ?=
 =?utf-8?Q?CdB7ymibqTmtIslh8uVJ2X0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b5bf5a-5732-44f4-2c2e-08db25302e8a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 08:35:07.3929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIe/15Bof6u2d68SwJ0uFNlqhbTJl0jIDbepWvGlF/6YV4rGh0upeBoCkigyhZ0kHF8m23opXQttBNJLhPPmb5JtF7hvmOQvzlwqhIYjhJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7934
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
Cc: devicetree@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <sha@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On 3/14/23 17:08, Nathan Chancellor wrote:
> Hi Michael,
> 
> On Tue, Jan 24, 2023 at 06:47:01AM +0100, Michael Riesch wrote:
>> The variable possible_crtcs is only initialized for primary and
>> overlay planes. Since the VOP2 driver only supports these plane
>> types at the moment, the current code is safe. However, in order
>> to provide a future-proof solution, fix the initialization of
>> the variable.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>> v3:
>>  - no changes
>> v2:
>>  - new patch
>>
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 8cecf81a5ae0..374ef821b453 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -2322,10 +2322,11 @@ static int vop2_create_crtc(struct vop2 *vop2)
>>  				/* change the unused primary window to overlay window */
>>  				win->type = DRM_PLANE_TYPE_OVERLAY;
>>  			}
>> -		}
>> -
>> -		if (win->type == DRM_PLANE_TYPE_OVERLAY)
>> +		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
>>  			possible_crtcs = (1 << nvps) - 1;
>> +		} else {
>> +			possible_crtcs = 0;
>> +		}
>>  
>>  		ret = vop2_plane_init(vop2, win, possible_crtcs);
>>  		if (ret) {
>> -- 
>> 2.30.2
>>
> 
> This patch is now in -next as commit 368419a2d429 ("drm/rockchip: vop2:
> initialize possible_crtcs properly") and it actually appears to
> introduce a path where possible_crtcs could be used uninitialized.
> 
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2316:8: error: variable 'possible_crtcs' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>                           if (vp) {
>                               ^~
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2330:36: note: uninitialized use occurs here
>                   ret = vop2_plane_init(vop2, win, possible_crtcs);
>                                                    ^~~~~~~~~~~~~~
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2316:4: note: remove the 'if' if its condition is always true
>                           if (vp) {
>                           ^~~~~~~~
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2298:21: note: initialize the variable 'possible_crtcs' to silence this warning
>                   u32 possible_crtcs;
>                                     ^
>                                      = 0
>   1 error generated.
> 
> Prior to this change, if that else path was hit, clang recognized based on
> the assignment that the next if statement would always be true. Now, if
> the else path is taken, the possible_crtcs assignment will be missed. Is
> that intentional?

As it turns out, the approach in my patch does not cover all paths. I'll
submit a follow-up patch that initializes possible_crtcs = 0 and drops
the else path. This should solve the issue for good.

Regards, Michael
