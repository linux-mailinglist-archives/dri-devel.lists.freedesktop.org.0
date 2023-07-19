Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11C758E55
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536EE10E400;
	Wed, 19 Jul 2023 07:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2101.outbound.protection.outlook.com [40.107.15.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90E310E3F5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sjr9BnH8JSCkF8WPAPv5NEdZ2KAw8E3EcYlL694gQiZ/rSD0VEkNq4wq+rQUWZ4WqFeP18r/AV1/dt4qBFQ8ppu0Looki8WZbm13Hgwz8eZ9MMXI9o3rv+S8Bm+IoXetDlxgFFk3tZ3J0/sB806br/yf/xaw293G9xr4KogTOGRDsyys6rZiaWoI6MIRn/FrciLtSdM2N3+DfoINUFQfpDsjzaRnJYW0viOGfbtVL0gYMWuVwbiyhRyOVZU88tjhJPBykgJ5YLTKHxAh5FtSu5LEnTdFjHI78iOfM9zgzznNMC+KpvG1XdfuB230jOU/X6qn2F94/pJER50p5tymWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60bAOovYqz9okvS2znDa6EQJzhWfazvsJs4mc07ObpU=;
 b=JUPlSZSKN14M1/reirOl55FYgdtWqTAWQ7pkBMl9k3uebSDx6n6Nk0L1dnPRLkkFJmCB+8pPSvVZB+AXzsW0rI4468zVpAW7BIGe7fhednY7B169o1RtigosVcB4m5Bke4FuFGYeUzcYzjUa1nfjLbXfAxrEtCrfi4A5nzlY/zTgdaCf5V6aruDnzhK9i2WIhnCvrA6FRBkGrjaSTd3xo9yA3wLajepQRaTW+yR2Ut7eU5ME9lpHwgydedLxbkr39OKPgBfYRP786FZ+CqAv4m6H3SkzFy/L3V0yrduTsBOaU1UTW4u0wafhOx2DjBg1qVDZ4GAMeUZ8kzvf3V3IGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60bAOovYqz9okvS2znDa6EQJzhWfazvsJs4mc07ObpU=;
 b=YtU1x3fMh3PkLTbuZRhf+LGnbfuLgXQbsbzXzBKUcZvyoKu5U5ZegL9mUS6sGWP83MjEHuEKlXwvS6IFy7hWsfkFRSAU9TkWfjwoi1tJ2k8MVsdgiPGs6Ws0vU8lpmx/Unx08Uy4i5LRvEofq7t8p+XhMSZltsAEStaPZKnwgsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GVXPR10MB8057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:115::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 07:05:57 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 07:05:57 +0000
Content-Type: multipart/mixed; boundary="------------54UFMZPBl967hchf9akXemI5"
Message-ID: <2a57622c-402b-5df6-73b3-9ba9aad9843d@kontron.de>
Date: Wed, 19 Jul 2023 09:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Content-Language: en-US, de-DE
To: Tim Harvey <tharvey@gateworks.com>, Marek Vasut <marex@denx.de>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
 <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
 <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
 <a7e6611a-a147-607c-9df4-9fcc4e2cf397@kontron.de>
 <CAJ+vNU00AsaGQ4nqCJ+XqUtYsbr8ow49BV78QZx6CgF0xn6s+g@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAJ+vNU00AsaGQ4nqCJ+XqUtYsbr8ow49BV78QZx6CgF0xn6s+g@mail.gmail.com>
X-ClientProxiedBy: AM8P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::21) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GVXPR10MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: e4be990d-2d5a-49c1-5493-08db8826997c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iB1SvgaxaOILpqdp8q8MYwxV5kwIszzcyErbb28q9mCaUFpNIBRoAj2pS4f5xXKU3uP+rTelEVE6cXkQkzuNU9WFfCAdW1AI5woPYlClv/M8hgkqwl2A/wuTDcSGdmNUb07sWnYWCE/kKGd21Wp8x444Kuqb2iQv8VnPoWWGC8Yo7fcISgwfOsTn84HGTUnkYVAuhwZSIgeZ+VTL1rchdnsRdUFADSxrlA8W/yYHxRL4sk+379Kynux4N4Bo/dRdLoctJ/qoaiwZoszA8DdTlrPB4uozIvH0sO2+FNmC213DhEYq5PUFD3wc0hQ/l0dyXrxHZK9A0QK2BvGnQUB5YMOhw3aNx7okjiOmfG7IXSmT1AKaZQCf8vfRUvvna7Am0fyjJg1G+bxqP5c5OzJxDgU2nlSxMyJgBGJSHXyzjyQJRAJP2g4W1+P1OGAj3ptL6PH7tScl590EWpKyMU1kjULFfj3tFSaf7/HixrlyBykYbPTzEqBF7vG1jcbF7YKSPFazk95uhTLuP3V7bSna3ZfObzOtBb7Uq67dui74MROzHqJygIFWsRYkBdAJwR7S/h/TuAf46PTIFWHUFIQRgSONkJhEBp4nRxaagEIo2JhAx7maCuLy9ehFeXq90wb5kdLNwJD5AWchUsv2QCmFWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(31686004)(33964004)(6486002)(45080400002)(6666004)(54906003)(478600001)(110136005)(6506007)(83380400001)(2616005)(36756003)(86362001)(31696002)(2906002)(26005)(44832011)(53546011)(186003)(966005)(6512007)(38100700002)(8936002)(66556008)(66476007)(316002)(66946007)(4326008)(41300700001)(235185007)(8676002)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUsrM3RJYmFxem90c3VCNDZTbVZaa1QyZ0pSR09Yc1RqNG9GZU1WSUtoL0Zn?=
 =?utf-8?B?bUhDZGU1U0JZVGhsQkFBRmZNemxZNWFzQjdDNWpDTFRIajU1TStTQXRjSUpi?=
 =?utf-8?B?UDN3MVhTNHZlZVJjYndhakRoclZsYW1TTTRYWVJUTkpIaDl4U2lGMEhVUHNR?=
 =?utf-8?B?bzNGclRXL2ZjNVJEa0tqMDJNNlJkYzRCbjUwNDRveHl0dlFqSThySldNc0Vo?=
 =?utf-8?B?TlBkb1lFT0RRNjdvVi8rLzZ4K095eW5kMXNuOEwybXdsSGhCaUVxMUVVOEtH?=
 =?utf-8?B?MUo3N216dVNUdnVyVmZnamh4MHEvM29VOVh2VndiM0VseUlIeFZoRGl6Mlh2?=
 =?utf-8?B?M0ZmOVlHQUVDV015UkxzejZUV0dLa0pVL0hyd004Ky9FSDdKd2xQaExpRE9F?=
 =?utf-8?B?eEtIZHFvaW5yZFJMTUFmYmZUUjQ3VnFEWWVTUHZKRzF3d2FkSDFHOGxkM3JH?=
 =?utf-8?B?eTdkL2FTYVEwVnowZEFHZ3VjbVlwYTlPV2MvcDl1UE9mL29YdTd1L2lMdW52?=
 =?utf-8?B?bW9vbHV5Z243MGhQKzdsZW16bDJUS3AvbitYbEQvT2pPSWExOXZKZkdEVEJ5?=
 =?utf-8?B?QVRIcnlnS0ZpZ0xvSVZCNk9hOGp2c3hucS9jSUJ2L2ppQmQ4ZnJWRmwvLzM2?=
 =?utf-8?B?WFc5RWtPSFd2NmVuQTlHVXJ3U2VkWWV1VnJTU2J2TTBJU3RmR3loc1pVUzRv?=
 =?utf-8?B?eHJDWWZXczdtYVpXTzRENElXeU1PdHBJVGVsYlZuVEJOWnBrWWpYdkYwSk1s?=
 =?utf-8?B?SHgzY3VrRFZDY00reW9ncXJkRlNKUS8vNVMybHRCMzZBeGhncWxNV3dLbG9v?=
 =?utf-8?B?a3NnNm1BOHFCSFpER0V2UDR3MWpGVUdZaXYzREo5US9pcEE3VjBvMm5LZlBK?=
 =?utf-8?B?NFNpNVZFQSt6bXEyeHFUakRRdUlsZXY1TFc2cDNKN2UwRkJyRkxWZkhseFRS?=
 =?utf-8?B?V3llUlZhQ1prY0t3bnNGcHFDa0l6TUJlWHhhQ21oT1doUDg5SUxiOXlsb3Jv?=
 =?utf-8?B?NTZVazJzQVlkUEo4S1BlUVdOQ3QzL1FnMUZTakNUekR6UmZ0L2k4Z3JRNmJK?=
 =?utf-8?B?b092RGhQL3phQ0Z1dWtDcERmUDdHUWZWOEQ5UjlsVGZsbHlTcnUxYnZmYU8w?=
 =?utf-8?B?Mk5Wc3ZJeFR6UFhNNk5BY2tKdWVGcmZGS01rL2xpZ0tueVVIUG54YmkyL0xH?=
 =?utf-8?B?bVJlSVRSaVF0MGp1dkVZam5UQ3p3RzhyTVlOOUdlS05KZUtJS2k3by9sQmdN?=
 =?utf-8?B?bXRldVhqUWliZVYwanRjSmVsRzhSejRxc3BYOUFKVDFCVEpUZzA2NnhiVkVh?=
 =?utf-8?B?Y1lndlg4Y05ueE8vb3R4NEU2dmoyTnNtMVRkVWc0THlkTGxmbU91YVU3Szh3?=
 =?utf-8?B?YVJKOEJ0Ui9Wc2QwOHByVFJPVnpBUkNZSDZKbjVCRGVGeVg3NElTUEdhZ3Ex?=
 =?utf-8?B?dFBuZWhhbm1ackFYampmNktob1N1L3dzR21wdlo2ZmNsa3lwcUNCOGF2MmNu?=
 =?utf-8?B?RWhrcGxWcHREb2xtTVMxNkswUEdXaWIycER2eFpqckp1OGx5dDJxdVZMVjZN?=
 =?utf-8?B?dUZ1RHdyaFBLSXdrODkxOXlUdm81UHpGVlBBbWFmaWV0RDgzZUZHbzlBY3hl?=
 =?utf-8?B?YW1aV01RdzRVSGpPV3IwL1pCQ2ppQTF6ejVxZ2p0b3BMY0g5RnVsNkJTLzkw?=
 =?utf-8?B?cXZvaFhLK095Lzd5aW5haFkwMmJSTGVBR3RWemlic1M1c21rYnRBY3hXQVk1?=
 =?utf-8?B?Rm8zRDB6aWtuMis2eXNyOE5NNU4yNENjMVNNVDB5aWIwU004bGZVa2ZRdk9M?=
 =?utf-8?B?M09hcjB2enFPV01YOVAwMnVlY0pQWjNNQmxqdTcycDMwZEk2Y2tZVzdVZU9i?=
 =?utf-8?B?TU82RUd2cVc0WmtFNU4wUUR5UXJSOTZyUklKenVXTlUwVGZYRHZGNWhoamU4?=
 =?utf-8?B?UWtjNkJXY1FGZVVvWkFMRURWQlFaRndpTHZDeEhzY2IyMVdtclUvRFBhSEVu?=
 =?utf-8?B?bTJYS09QWFB2YWlRRk9SejdRVnFKc3p3VFluaVVpWHowTFdqems2TnNCbUda?=
 =?utf-8?B?VGpQbmpzM3ZkRHJWakxXb1A3THJXMnprSjdHMGNnYUJFSFkxY2VCS1pwUzZx?=
 =?utf-8?B?RGM4YUxqczRiMWMvQUpiL2ZOZGtuQS9ycWF5UFZTWkNKcGc4Y2JHOFJtVTB3?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e4be990d-2d5a-49c1-5493-08db8826997c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:05:56.9782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBvq6vRPhRaAoRYkGeB35C5IKPhiw3do4BtrOgrpw9TY/NsDDDFydbMpcijqRAr9YJY6LhOexIy35E7fgA6Jq5c6fvf7Tpvg8clA2B6gdHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8057
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------54UFMZPBl967hchf9akXemI5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tim,

On 19.07.23 01:03, Tim Harvey wrote:
> On Thu, Jul 13, 2023 at 3:01 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Tim,
>>
>> On 13.07.23 09:18, Frieder Schrempf wrote:
>>> Hi Tim,
>>>
>>> On 13.07.23 00:34, Tim Harvey wrote:
>>>> On Wed, May 3, 2023 at 9:33 AM Frieder Schrempf <frieder@fris.de> wrote:
>>>>>
>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>
>>>>> According to the documentation [1] the proper enable flow is:
>>>>>
>>>>> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
>>>>> 2. Disable stop state to bring data lanes into HS mode
>>>>>
>>>>> Currently we do this all at once within enable(), which doesn't
>>>>> allow to meet the requirements of some downstream bridges.
>>>>>
>>>>> To fix this we now enable the DSI in pre_enable() and force it
>>>>> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
>>>>> register until enable() is called where we reset the bit.
>>>>>
>>>>> We currently do this only for i.MX8M as Exynos uses a different
>>>>> init flow where samsung_dsim_init() is called from
>>>>> samsung_dsim_host_transfer().
>>>>>
>>>>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>>>>
>>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>> ---
>>>>> Changes for v2:
>>>>> * Drop RFC
>>>>> ---
>>>>>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>>>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index e0a402a85787..9775779721d9 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>>>>>         reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>>         reg &= ~DSIM_STOP_STATE_CNT_MASK;
>>>>>         reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
>>>>> +
>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
>>>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>>>> +
>>>>>         samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>>
>>>>>         reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
>>>>> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>                 ret = samsung_dsim_init(dsi);
>>>>>                 if (ret)
>>>>>                         return;
>>>>> +
>>>>> +               samsung_dsim_set_display_mode(dsi);
>>>>> +               samsung_dsim_set_display_enable(dsi, true);
>>>>>         }
>>>>>  }
>>>>>
>>>>> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>                                        struct drm_bridge_state *old_bridge_state)
>>>>>  {
>>>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>>>> +       u32 reg;
>>>>>
>>>>> -       samsung_dsim_set_display_mode(dsi);
>>>>> -       samsung_dsim_set_display_enable(dsi, true);
>>>>> +       if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>> +               samsung_dsim_set_display_mode(dsi);
>>>>> +               samsung_dsim_set_display_enable(dsi, true);
>>>>> +       } else {
>>>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>> +               reg &= ~DSIM_FORCE_STOP_STATE;
>>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>> +       }
>>>>>
>>>>>         dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>>>>>  }
>>>>> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>>>>>                                         struct drm_bridge_state *old_bridge_state)
>>>>>  {
>>>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>>>> +       u32 reg;
>>>>>
>>>>>         if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>                 return;
>>>>>
>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>> +       }
>>>>> +
>>>>>         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>>>>>  }
>>>>>
>>>>> --
>>>>> 2.40.0
>>>>>
>>>>
>>>> Hi Frieder,
>>>>
>>>> I found this patch to break mipi-dsi display on my board which has:
>>>>  - FocalTech FT5406 10pt touch controller (with no interrupt)
>>>>  - Powertip PH800480T013-IDF02 compatible panel
>>>>  - Toshiba TC358762 compatible DSI to DBI bridge
>>>>  - ATTINY based regulator used for backlight controller and panel enable
>>>>
>>>> I enable this via a dt overlay in a pending patch
>>>> imx8mm-venice-gw72xx-0x-rpidsi.dtso [1] which works on 6.4 but not
>>>> 6.5-rc1 which has this patch.
>>>>
>>>> The issue appears as:
>>>> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
>>>> 64 01 05 00 00 00
>>>> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
>>>>
>>>> Instead of
>>>> [    1.011729] samsung-dsim 32e10000.dsi: supply vddcore not found,
>>>> using dummy regulator
>>>> [    1.019829] samsung-dsim 32e10000.dsi: supply vddio not found,
>>>> using dummy regulator
>>>> [    5.649928] samsung-dsim 32e10000.dsi:
>>>> [drm:samsung_dsim_host_attach] Attached tc358762 device
>>>>
>>>> I'm curious what board/panel were you needing this for and do you have
>>>> any ideas why it broke my setup?
>>>>
>>>> I'm also curious what board/panel Alexander tested this with and if
>>>> Adam or Jagan (or others) have tested this with their hardware?
>>>
>>> Sorry for breaking your setup. My test- and use-case is the same as
>>> Alexander's. I have the SN65DSI84 downstream bridge and without this
>>> patch it fails to come up in some cases.
>>>
>>> The failure is probably related to your downstream bridge being
>>> controlled by the DSI itself using command mode. The SN65DSI84 is
>>> instead controlled via I2C.
>>>
>>> Actually we should have tested this with a bridge that uses command mode
>>> before merging, now that I think of it. But I wasn't really aware of
>>> this until now.
>>>
>>> I'll have a closer look at the issue and then will get back to you. In
>>> the meantime if anyone can help analyze the problem or has proposals how
>>> to fix it, please let us know.
>>
>> With my patch samsung_dsim_init() now initializes the DSIM to stop
>> state. When being called from samsung_dsim_atomic_pre_enable() this
>> works as the stop state is cleared later in samsung_dsim_atomic_enable().
>>
>> When being called from samsung_dsim_host_transfer() to handle transfers
>> before samsung_dsim_atomic_pre_enable() was called, the stop state is
>> never cleared and transfers will fail.
>>
>> This is the case in your setup as tc358762_init() is called in
>> tc358762_pre_enable().
>>
>> I think that requiring to initialize the DSI host during transfer could
>> be avoided in this case by moving tc358762_init() from
>> tc358762_pre_enable() to tc358762_enable().
>>
>> But at the same time according to the docs at [1] this seems to be a
>> valid case that we need to support in the DSIM driver:
>>
>>   Whilst it is valid to call host_transfer prior to pre_enable or
>>   after post_disable, the exact state of the lanes is undefined at
>>   this point. The DSI host should initialise the interface, transmit
>>   the data, and then disable the interface again.
>>
>> Therefore I would propose to try a fix like in the attachement. If you
>> could test this, that would be great.
>>
>> Thanks
>> Frieder
>>
>> [1]
>> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> 
> Hi Frieder,
> 
> The patch does not resolve the issue. I still get the 'xfer timed out'
> from samsung-dsim but noticing today that this issue doesn't exist in
> linux-next I've found that its resolved by Marek's patch:
> commit 8a4b2fc9c91a ("drm/bridge: tc358762: Split register programming
> from pre-enable to enable")

Thanks for testing. I didn't notice there already is a patch from Marek
for the tc358762 driver. This is exactly the change that I was
considering above as a fix on the downstream bridge side.

> 
> I'm not clear on how that patch is staged in linux-next. If we can get
> that pulled into 6.5 then it will resolve the breakage.

Still the documentation says that the DSI host must be able to handle
this and there might be other drivers that are not yet fixed like this
or can't be changed to make DSI transfers only after the host's
pre_enable() was called.

Therefore I would prefer to fix the DSIM driver and apply this fix to
6.5-rc instead of backporting the tc358762 patch. I gave it another shot
and maybe you could do one more test with the attached patch and without
the fix in tc358762.

Thanks
Frieder
--------------54UFMZPBl967hchf9akXemI5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-bridge-samsung-dsim-Fix-init-during-host-transfe.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-bridge-samsung-dsim-Fix-init-during-host-transfe.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyMDM5ODQ3MzJkNmFmNDVkOWE4YmQ3MWQwZTEyMzQ5NjU5NjBlZDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtv
bnRyb24uZGU+CkRhdGU6IFRodSwgMTMgSnVsIDIwMjMgMTE6NDc6NDcgKzAyMDAKU3ViamVjdDog
W1BBVENIXSBkcm06IGJyaWRnZTogc2Ftc3VuZy1kc2ltOiBGaXggaW5pdCBkdXJpbmcgaG9zdCB0
cmFuc2ZlcgoKSW4gY2FzZSB0aGUgZG93bnN0cmVhbSBicmlkZ2Ugb3IgcGFuZWwgdXNlcyBEU0kg
dHJhbnNmZXJzIGJlZm9yZSB0aGUKRFNJIGhvc3Qgd2FzIGFjdHVhbGx5IGluaXRpYWxpemVkIHRo
cm91Z2ggc2Ftc3VuZ19kc2ltX2F0b21pY19lbmFibGUoKQp3aGljaCBjbGVhcnMgdGhlIHN0b3Ag
c3RhdGUgKExQMTEpIG1vZGUsIGFsbCB0cmFuc2ZlcnMgd2lsbCBmYWlsLgoKVGhpcyBoYXBwZW5z
IHdpdGggZG93bnN0cmVhbSBicmlkZ2VzIHRoYXQgYXJlIGNvbnRyb2xsZWQgYnkgRFNJCmNvbW1h
bmRzIHN1Y2ggYXMgdGhlIHRjMzU4NzYyLgoKVG8gZml4IHRoaXMgZG8gbm90IGVuYWJsZSBzdG9w
IHN0YXRlIHdoZW4gdGhlIERTSSBob3N0IHdhcyBpbml0aWFsaXplZAp0aHJvdWdoIHNhbXN1bmdf
ZHNpbV9ob3N0X3RyYW5zZmVyKCkgd2hpY2ggcmVzdG9yZXMgdGhlIHByZXZpb3VzCmJlaGF2aW9y
LgoKRml4ZXM6IDBjMTRkMzEzMDY1NCAoImRybTogYnJpZGdlOiBzYW1zdW5nLWRzaW06IEZpeCBp
Lk1YOE0gZW5hYmxlIGZsb3cgdG8gbWVldCBzcGVjIikKUmVwb3J0ZWQtYnk6IFRpbSBIYXJ2ZXkg
PHRoYXJ2ZXlAZ2F0ZXdvcmtzLmNvbT4KU2lnbmVkLW9mZi1ieTogRnJpZWRlciBTY2hyZW1wZiA8
ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2Ftc3VuZy1kc2ltLmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1
bmctZHNpbS5jCmluZGV4IDA0M2I4MTA5ZTY0YS4uMTcxNGZhNzI1ZTI0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NhbXN1bmctZHNpbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMKQEAgLTgzMyw3ICs4MzMsNyBAQCBzdGF0aWMgdm9pZCBz
YW1zdW5nX2RzaW1fZW5hYmxlX2xhbmUoc3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpLCB1MzIgbGFu
ZSkKIAlzYW1zdW5nX2RzaW1fd3JpdGUoZHNpLCBEU0lNX0NPTkZJR19SRUcsIHJlZyk7CiB9CiAK
LXN0YXRpYyBpbnQgc2Ftc3VuZ19kc2ltX2luaXRfbGluayhzdHJ1Y3Qgc2Ftc3VuZ19kc2ltICpk
c2kpCitzdGF0aWMgaW50IHNhbXN1bmdfZHNpbV9pbml0X2xpbmsoc3RydWN0IHNhbXN1bmdfZHNp
bSAqZHNpLCBib29sIGZvcmNlX3N0b3Bfc3RhdGUpCiB7CiAJY29uc3Qgc3RydWN0IHNhbXN1bmdf
ZHNpbV9kcml2ZXJfZGF0YSAqZHJpdmVyX2RhdGEgPSBkc2ktPmRyaXZlcl9kYXRhOwogCWludCB0
aW1lb3V0OwpAQCAtOTM5LDggKzkzOSwxMiBAQCBzdGF0aWMgaW50IHNhbXN1bmdfZHNpbV9pbml0
X2xpbmsoc3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpKQogCXJlZyAmPSB+RFNJTV9TVE9QX1NUQVRF
X0NOVF9NQVNLOwogCXJlZyB8PSBEU0lNX1NUT1BfU1RBVEVfQ05UKGRyaXZlcl9kYXRhLT5yZWdf
dmFsdWVzW1NUT1BfU1RBVEVfQ05UXSk7CiAKLQlpZiAoIXNhbXN1bmdfZHNpbV9od19pc19leHlu
b3MoZHNpLT5wbGF0X2RhdGEtPmh3X3R5cGUpKQotCQlyZWcgfD0gRFNJTV9GT1JDRV9TVE9QX1NU
QVRFOworCWlmICghc2Ftc3VuZ19kc2ltX2h3X2lzX2V4eW5vcyhkc2ktPnBsYXRfZGF0YS0+aHdf
dHlwZSkpIHsKKwkJaWYgKGZvcmNlX3N0b3Bfc3RhdGUpCisJCQlyZWcgfD0gRFNJTV9GT1JDRV9T
VE9QX1NUQVRFOworCQllbHNlCisJCQlyZWcgJj0gfkRTSU1fRk9SQ0VfU1RPUF9TVEFURTsKKwl9
CiAKIAlzYW1zdW5nX2RzaW1fd3JpdGUoZHNpLCBEU0lNX0VTQ01PREVfUkVHLCByZWcpOwogCkBA
IC0xMzg2LDcgKzEzOTAsNyBAQCBzdGF0aWMgdm9pZCBzYW1zdW5nX2RzaW1fZGlzYWJsZV9pcnEo
c3RydWN0IHNhbXN1bmdfZHNpbSAqZHNpKQogCWRpc2FibGVfaXJxKGRzaS0+aXJxKTsKIH0KIAot
c3RhdGljIGludCBzYW1zdW5nX2RzaW1faW5pdChzdHJ1Y3Qgc2Ftc3VuZ19kc2ltICpkc2kpCitz
dGF0aWMgaW50IHNhbXN1bmdfZHNpbV9pbml0KHN0cnVjdCBzYW1zdW5nX2RzaW0gKmRzaSwgYm9v
bCBmb3JjZV9zdG9wX3N0YXRlKQogewogCWNvbnN0IHN0cnVjdCBzYW1zdW5nX2RzaW1fZHJpdmVy
X2RhdGEgKmRyaXZlcl9kYXRhID0gZHNpLT5kcml2ZXJfZGF0YTsKIApAQCAtMTQwMyw3ICsxNDA3
LDcgQEAgc3RhdGljIGludCBzYW1zdW5nX2RzaW1faW5pdChzdHJ1Y3Qgc2Ftc3VuZ19kc2ltICpk
c2kpCiAJaWYgKGRyaXZlcl9kYXRhLT53YWl0X2Zvcl9yZXNldCkKIAkJc2Ftc3VuZ19kc2ltX3dh
aXRfZm9yX3Jlc2V0KGRzaSk7CiAJc2Ftc3VuZ19kc2ltX3NldF9waHlfY3RybChkc2kpOwotCXNh
bXN1bmdfZHNpbV9pbml0X2xpbmsoZHNpKTsKKwlzYW1zdW5nX2RzaW1faW5pdF9saW5rKGRzaSwg
Zm9yY2Vfc3RvcF9zdGF0ZSk7CiAKIAlkc2ktPnN0YXRlIHw9IERTSU1fU1RBVEVfSU5JVElBTEla
RUQ7CiAKQEAgLTE0MzIsNyArMTQzNiw3IEBAIHN0YXRpYyB2b2lkIHNhbXN1bmdfZHNpbV9hdG9t
aWNfcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCSAqIHRoZSBob3N0IGlu
aXRpYWxpemF0aW9uIGR1cmluZyBEU0kgdHJhbnNmZXIuCiAJICovCiAJaWYgKCFzYW1zdW5nX2Rz
aW1faHdfaXNfZXh5bm9zKGRzaS0+cGxhdF9kYXRhLT5od190eXBlKSkgewotCQlyZXQgPSBzYW1z
dW5nX2RzaW1faW5pdChkc2kpOworCQlyZXQgPSBzYW1zdW5nX2RzaW1faW5pdChkc2ksIHRydWUp
OwogCQlpZiAocmV0KQogCQkJcmV0dXJuOwogCkBAIC0xNzcxLDcgKzE3NzUsNyBAQCBzdGF0aWMg
c3NpemVfdCBzYW1zdW5nX2RzaW1faG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAq
aG9zdCwKIAlpZiAoIShkc2ktPnN0YXRlICYgRFNJTV9TVEFURV9FTkFCTEVEKSkKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKLQlyZXQgPSBzYW1zdW5nX2RzaW1faW5pdChkc2kpOworCXJldCA9IHNhbXN1
bmdfZHNpbV9pbml0KGRzaSwgZmFsc2UpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLS0g
CjIuNDEuMAoK

--------------54UFMZPBl967hchf9akXemI5--
