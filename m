Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3F751E10
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B63710E008;
	Thu, 13 Jul 2023 10:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2107.outbound.protection.outlook.com [40.107.15.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CDE10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfFW2yWjrfcvWHvGVoh7HhARgddtBBQ+xmDvKjmx8tu9dn9t26kt+gBHc9Evvyp4jck7G4HReG0su76EhePhn3HHI13x35LbumR4g8IFXQ2OOPT1QGRcX8TPYn2Axtk5NaPO+JR7cZfN+P1108bB3BkB2kLn8tEuixOTdeTO/9U9wupmYaL0psXi5ChFMK8DohvO0LPlhfQcHmJfnUQRKlz34alQZIyS+FIblK4YQcw5gylJbQFbprqBdtnrozP/RfRmLYzCsMJioMVbVPsA0zuAoKJxXAvphXPCpfqRqTyeDUFmvz4rapuhYYRA0dPih37n/R1Xio+x6i9DAT1oNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gQNij1Sy5mTM5AL6AtSVeP59fnPTxZRhfGHV1rUIJE=;
 b=Sq7hCwieeeTZIE2NnjEhksxB4zN2wuO2BbZeR9JRnvS9/U8KIRGT9VpXDEzpSWRnOdvqznX1W768L1NyVAtN0QZu6am4twk/AHI7z3RMirBN03ZYzWxQgkp1mlrV+V05lbRyw1JovfOcoc89em3LvdmyiXAPMqmZ2KcQ5TZlWO0oZDD9afpsMPvR8J12VQtRiIe/E/BIsUOwh8e0YZyTej2s5b0e1MT+G0U48TNEaZjCpB3YlZ1YXvcu/xack6HdWyiRcu4XNLPLwp/wCTayX9x2Hdmri6PiMaqg4jybTj3LRdsfxUFsHMjDNZLSyg8kVVVWLmGnwnB4Ngl4PjgZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gQNij1Sy5mTM5AL6AtSVeP59fnPTxZRhfGHV1rUIJE=;
 b=YXzGuqos5iMt89J/du57LIVfJHhdtah8UzWzwYGvO6l+742aV6MHeFtlCWtnbbLH/WhfrJTaT2DOjU8TB+F8+C8WFAttdEyoPR+BfLWpyfOG+KFAygNavthCQf/ERQ69jJDvZ2HKQmzumB3Cevlll0MpEEgygtnA4jx+t6IJ95w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB7522.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Thu, 13 Jul
 2023 10:01:44 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1b98:7428:fb6b:3b65%7]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 10:01:44 +0000
Content-Type: multipart/mixed; boundary="------------ZmkQ6mz0M1TULVxmkV6e5Nbh"
Message-ID: <a7e6611a-a147-607c-9df4-9fcc4e2cf397@kontron.de>
Date: Thu, 13 Jul 2023 12:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Tim Harvey <tharvey@gateworks.com>, Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Adam Ford <aford173@gmail.com>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
 <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
 <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
In-Reply-To: <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
X-ClientProxiedBy: BE1P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e30393b-3b12-477a-34af-08db838829b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1thxvPbUFjiUX1SNkYb/u10cdjS9q9QsYCPVDLHUAW78qfiQgB8zdnB7FIKQoYuYm7KGSI+gqFhYwOC1q8nDPqC8vKEc9Xph8lvJOFhBFDEv+YYiNT3D9EM19sTSXdpDf2Uz35rSZwnmEVxzjjEMfj9zzNSe3qxxDWil+mIfTAa+q4bxijERhZe3Af18uiQXCHTwnW0sJ1R8dbu0dUNBG3p5F3YswLOvb0EU1IkGgv9D4hX7zjL6rw76clrkvd+W9y6znWORR3YdZF/6lR+8Y5c+0wWV0pZg+ghUjZwL5jZBMAc9eCi4fv8kXkHLnHcUq0aDod4bZtJdLy7KzA+1XkjYC4MyaRA9Q5XWy0Xry+Afhjqxz69iBOkNreaVc12lOdO07tmp32dSSuI/PlQnkinH8GZGOhBVjNr2u0k7pb4jNDRp8WgWbFXEdga2k/aXcZEOJrV/37ZLxvZKZyMl6gHK2QiVz/+TYKo7YYP+Ly9AROS+aoI3iFTki8QX61kL9xjAmgMyPzx6OdwJXX07+LQ36Bp95G7HlmkRL7dnrO2vQYF7UhwR/EDodnZnZXC9ipb+Ut1v8C5725t/Hs5RBOLI2LikRsNZ/aESXrU9hbVrdmEDmVtSqPMTDizSG/XrvIB3/b8fXD8Uz7Rnk7Ob4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(31696002)(38100700002)(86362001)(31686004)(186003)(36756003)(54906003)(33964004)(110136005)(6486002)(6666004)(966005)(6506007)(26005)(5660300002)(2616005)(53546011)(6512007)(66946007)(66556008)(45080400002)(316002)(44832011)(66476007)(8676002)(7416002)(478600001)(83380400001)(235185007)(8936002)(2906002)(4326008)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0c4Z0FWODZEYjlvWE5JYm1rektTbkxrZjhyd1VYSHl0NUY0WmtKQ0FFenBP?=
 =?utf-8?B?RkNGSnNiVEtwZ08rYTVaaUg4Y0VRS1RCQmZNQTJtOHgyYi85ek9VaVRqMXl3?=
 =?utf-8?B?RFBLbkUweFJ4MFFoNEV3QWlsMEpBK2xXWGNuS0RrdWlrditncUd4UDZCZDMx?=
 =?utf-8?B?bXhiVkdPTFo4T0Y1ajdDSVpUVStBQkNqUkxsaXc1SFk1RTNYbE5mN3JmUXM5?=
 =?utf-8?B?QlNNYjBBU29ldnRIamJ1c3drd1JGL1B1cEJ1d3ZzRmFtMDdBeXpRMncxVlBp?=
 =?utf-8?B?WjltWURjdFlBR1pkdGhkYndQNzFSQlBqZ3Q3cGlvdXhPSmtWRXpyRU82SDBx?=
 =?utf-8?B?bmNqREdJZDhhVVcwTnkxZGVXZHFWeW1tUFVpZk84cjQxalhkR2J6YlZKZW5Q?=
 =?utf-8?B?NFV1RFMyV3puQ2hGWGJNd3VXVmw0WlRjbmpQUTZEVUl0R2ZPU1dFVmQ5WGZj?=
 =?utf-8?B?RDZSS0NvaHhZMDYyTFlaNmJ5UEFUTjlialZjQWpYc0RlendLR01Fb2FyaUpj?=
 =?utf-8?B?STNjZlEvZXRPRFRKWUFEOVhKU1lSVjFPaHdLd3psZFBDUGxSL0czdG1Ybzh0?=
 =?utf-8?B?WmVRb0szYmZUK0ZQZ3FJZXl4UUZHK3hVSDBVdEZNWXZaQUR3cFU0clZxZVBk?=
 =?utf-8?B?eDVPUkJvbXNEeG85eDZpWFVJaHVBK2E4anRNb3JJdmphQlhvVXZTS3VGT21m?=
 =?utf-8?B?QnlCWHRGekhPd0M5ZUVYTmRXNkM2dGNkdjJzTm5aQzgybkN2RGpJWVNkclo0?=
 =?utf-8?B?WlNDQ25TVWNtaDNLdzdYRGxtNllLNUkxMkZpT2VpZ3I2RDhPNjJQaGkxOXVO?=
 =?utf-8?B?QU5ScTdXalVYbEJLK0NQb2NDaXc1eEtaMnNIb2V4SXNuTmtxOFh5Y1ZWWFcr?=
 =?utf-8?B?a3ZvUVRDMDl0KzZ2Nk1FMzNvR28yckFLeWI4ZUxRdE9QRmFJRnJ2Sko5WXVL?=
 =?utf-8?B?RFdxVlRMV203dkNqVVhGZnpZYWhyTUlNUlVuTm5JaWthK3NGUS8vc3VxNEZu?=
 =?utf-8?B?eFV1NzdVQ3QzQnVlalp5OHh6S0dCRStMVC9ROXUzUUhvK1BsU0JVSDF2L29S?=
 =?utf-8?B?N0dQQ2V3S0xHUzBaOWhUM3JLcGFYOWJuQVNGVDc2VFRGdGQzSm9qUXp3SStz?=
 =?utf-8?B?Q3N0cno5OEp0aktUU2w4cHN1WkJOY1FMbjNYUnAvRG5nSkJUZnFsM1FqdVNi?=
 =?utf-8?B?RDhCNnk1WVphZGQ3VS9jM1NVSGlpYkVyNEMyd2xoMVRzNkJmdHpqZWtoV1l4?=
 =?utf-8?B?YURWYTJSV0RJdmIrb21zcFlBenVIYmcvQnVLQjhKcFh1WmVIOFowdmViei9y?=
 =?utf-8?B?L3Y0WjFwY1JNU3BRazFGR0VUQXZrRWVxMWRTNGV5ejVhMkdRcXVKT1ZuRm40?=
 =?utf-8?B?VXFaM2laS21BTWtvSWJDVUpFNjR0bDRqbFpOVEI3Zm9MUGpPZ0R2ajdvV0JK?=
 =?utf-8?B?QjMyZnM1Nll6Q2l2UjJwQzFBdm9RNmY3eU1tc0cyZFZ0SmJxT1h3amJ6MmJR?=
 =?utf-8?B?ZnJ3VTh1MTlNbHF1TTFuTzFTbHhESXFua09mR3FoTVY4YWI4RFJkcjU2VFAz?=
 =?utf-8?B?akN2dGlQdEdYT1J4R1VJTlhsMWtnUTZPWXpJMmtxK0JZRUthM09qMTc1T0dh?=
 =?utf-8?B?RkozMGEzV1p1b3BTSytpQlFHdk5uQzMzYkZTWWNOV0Joc095Z1V2OUlkK1Ar?=
 =?utf-8?B?SEM4bnpKMXVndlJBTElobHZkWlVKRzhzRjM3aUk3UkQzZGdSbFE5YThjMkM2?=
 =?utf-8?B?SlJ5V21jMStqYUJuSjBHbjArcGRIb0dVdzg2UVVQMEFvZjFZV09XcFRWNFkx?=
 =?utf-8?B?dVhodHlBTGh5NVl0YUlXV1R1TmMrQmY0SXgzYTdtQzh6blMxWTZDRlVCeUF1?=
 =?utf-8?B?MjFaMjlmbEkrSTBleCtuc0ZVRlRhYUJ3RDNoV2xyb0RVSFFTNndXTmcvbktD?=
 =?utf-8?B?N0ZmUFZzaWZmcEtJMXhXT1J3ampRbG9LbDYzTE9YYUtiYTNUNUR2MmtBSVZT?=
 =?utf-8?B?bHpvUmUwM250WWk2RjJ0dytlL1RBQ0dEUW8yc3k2dUVyNEd1SlUzdUFTZVVu?=
 =?utf-8?B?Nm85UEc1UGRHNEVrTzVFbi83TllxTCszWjhTMHE1YlcxQkdXcjZQWVpBZjM3?=
 =?utf-8?B?M3pKYURPeWRLTkg4KzQ4ak1uL3NTS29lZlA5eHZBWVpjMWRrZ3l1MXluZits?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e30393b-3b12-477a-34af-08db838829b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:01:44.3195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFRB60DIGbwT3jxkG+PtJp22LkmbK5YItGTUfQB1dhCg1W1VKEqiWCpMLu/gxRlHtOBRlsHqOkDv+N2GBNrIPSIxZJsGNHuxwlqZ56FbJf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7522
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------ZmkQ6mz0M1TULVxmkV6e5Nbh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tim,

On 13.07.23 09:18, Frieder Schrempf wrote:
> Hi Tim,
> 
> On 13.07.23 00:34, Tim Harvey wrote:
>> On Wed, May 3, 2023 at 9:33 AM Frieder Schrempf <frieder@fris.de> wrote:
>>>
>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>
>>> According to the documentation [1] the proper enable flow is:
>>>
>>> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
>>> 2. Disable stop state to bring data lanes into HS mode
>>>
>>> Currently we do this all at once within enable(), which doesn't
>>> allow to meet the requirements of some downstream bridges.
>>>
>>> To fix this we now enable the DSI in pre_enable() and force it
>>> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
>>> register until enable() is called where we reset the bit.
>>>
>>> We currently do this only for i.MX8M as Exynos uses a different
>>> init flow where samsung_dsim_init() is called from
>>> samsung_dsim_host_transfer().
>>>
>>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>>
>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>> ---
>>> Changes for v2:
>>> * Drop RFC
>>> ---
>>>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index e0a402a85787..9775779721d9 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>>>         reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>         reg &= ~DSIM_STOP_STATE_CNT_MASK;
>>>         reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
>>> +
>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>> +
>>>         samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>
>>>         reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
>>> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>                 ret = samsung_dsim_init(dsi);
>>>                 if (ret)
>>>                         return;
>>> +
>>> +               samsung_dsim_set_display_mode(dsi);
>>> +               samsung_dsim_set_display_enable(dsi, true);
>>>         }
>>>  }
>>>
>>> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>                                        struct drm_bridge_state *old_bridge_state)
>>>  {
>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>> +       u32 reg;
>>>
>>> -       samsung_dsim_set_display_mode(dsi);
>>> -       samsung_dsim_set_display_enable(dsi, true);
>>> +       if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>> +               samsung_dsim_set_display_mode(dsi);
>>> +               samsung_dsim_set_display_enable(dsi, true);
>>> +       } else {
>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>> +               reg &= ~DSIM_FORCE_STOP_STATE;
>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>> +       }
>>>
>>>         dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>>>  }
>>> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>>>                                         struct drm_bridge_state *old_bridge_state)
>>>  {
>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>> +       u32 reg;
>>>
>>>         if (!(dsi->state & DSIM_STATE_ENABLED))
>>>                 return;
>>>
>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>> +       }
>>> +
>>>         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>>>  }
>>>
>>> --
>>> 2.40.0
>>>
>>
>> Hi Frieder,
>>
>> I found this patch to break mipi-dsi display on my board which has:
>>  - FocalTech FT5406 10pt touch controller (with no interrupt)
>>  - Powertip PH800480T013-IDF02 compatible panel
>>  - Toshiba TC358762 compatible DSI to DBI bridge
>>  - ATTINY based regulator used for backlight controller and panel enable
>>
>> I enable this via a dt overlay in a pending patch
>> imx8mm-venice-gw72xx-0x-rpidsi.dtso [1] which works on 6.4 but not
>> 6.5-rc1 which has this patch.
>>
>> The issue appears as:
>> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
>> 64 01 05 00 00 00
>> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
>>
>> Instead of
>> [    1.011729] samsung-dsim 32e10000.dsi: supply vddcore not found,
>> using dummy regulator
>> [    1.019829] samsung-dsim 32e10000.dsi: supply vddio not found,
>> using dummy regulator
>> [    5.649928] samsung-dsim 32e10000.dsi:
>> [drm:samsung_dsim_host_attach] Attached tc358762 device
>>
>> I'm curious what board/panel were you needing this for and do you have
>> any ideas why it broke my setup?
>>
>> I'm also curious what board/panel Alexander tested this with and if
>> Adam or Jagan (or others) have tested this with their hardware?
> 
> Sorry for breaking your setup. My test- and use-case is the same as
> Alexander's. I have the SN65DSI84 downstream bridge and without this
> patch it fails to come up in some cases.
> 
> The failure is probably related to your downstream bridge being
> controlled by the DSI itself using command mode. The SN65DSI84 is
> instead controlled via I2C.
> 
> Actually we should have tested this with a bridge that uses command mode
> before merging, now that I think of it. But I wasn't really aware of
> this until now.
> 
> I'll have a closer look at the issue and then will get back to you. In
> the meantime if anyone can help analyze the problem or has proposals how
> to fix it, please let us know.

With my patch samsung_dsim_init() now initializes the DSIM to stop
state. When being called from samsung_dsim_atomic_pre_enable() this
works as the stop state is cleared later in samsung_dsim_atomic_enable().

When being called from samsung_dsim_host_transfer() to handle transfers
before samsung_dsim_atomic_pre_enable() was called, the stop state is
never cleared and transfers will fail.

This is the case in your setup as tc358762_init() is called in
tc358762_pre_enable().

I think that requiring to initialize the DSI host during transfer could
be avoided in this case by moving tc358762_init() from
tc358762_pre_enable() to tc358762_enable().

But at the same time according to the docs at [1] this seems to be a
valid case that we need to support in the DSIM driver:

  Whilst it is valid to call host_transfer prior to pre_enable or
  after post_disable, the exact state of the lanes is undefined at
  this point. The DSI host should initialise the interface, transmit
  the data, and then disable the interface again.

Therefore I would propose to try a fix like in the attachement. If you
could test this, that would be great.

Thanks
Frieder

[1]
https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
--------------ZmkQ6mz0M1TULVxmkV6e5Nbh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-bridge-samsung-dsim-Fix-init-during-host-transfe.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-bridge-samsung-dsim-Fix-init-during-host-transfe.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3NzBlNDc2MzI1NWJhNWJmMDg2YWU3YjAxNDMzMDY1MWUwMDdiY2I3IE1vbiBTZXAgMTcg
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
c2Ftc3VuZy1kc2ltLmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zYW1zdW5nLWRzaW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2lt
LmMKaW5kZXggMDQzYjgxMDllNjRhLi40ZDM3MWVhYTRmYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2Ftc3VuZy1kc2ltLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zYW1zdW5nLWRzaW0uYwpAQCAtODMzLDcgKzgzMyw3IEBAIHN0YXRpYyB2b2lkIHNhbXN1bmdf
ZHNpbV9lbmFibGVfbGFuZShzdHJ1Y3Qgc2Ftc3VuZ19kc2ltICpkc2ksIHUzMiBsYW5lKQogCXNh
bXN1bmdfZHNpbV93cml0ZShkc2ksIERTSU1fQ09ORklHX1JFRywgcmVnKTsKIH0KIAotc3RhdGlj
IGludCBzYW1zdW5nX2RzaW1faW5pdF9saW5rKHN0cnVjdCBzYW1zdW5nX2RzaW0gKmRzaSkKK3N0
YXRpYyBpbnQgc2Ftc3VuZ19kc2ltX2luaXRfbGluayhzdHJ1Y3Qgc2Ftc3VuZ19kc2ltICpkc2ks
IGJvb2wgZm9yY2Vfc3RvcF9zdGF0ZSkKIHsKIAljb25zdCBzdHJ1Y3Qgc2Ftc3VuZ19kc2ltX2Ry
aXZlcl9kYXRhICpkcml2ZXJfZGF0YSA9IGRzaS0+ZHJpdmVyX2RhdGE7CiAJaW50IHRpbWVvdXQ7
CkBAIC05MzksNyArOTM5LDcgQEAgc3RhdGljIGludCBzYW1zdW5nX2RzaW1faW5pdF9saW5rKHN0
cnVjdCBzYW1zdW5nX2RzaW0gKmRzaSkKIAlyZWcgJj0gfkRTSU1fU1RPUF9TVEFURV9DTlRfTUFT
SzsKIAlyZWcgfD0gRFNJTV9TVE9QX1NUQVRFX0NOVChkcml2ZXJfZGF0YS0+cmVnX3ZhbHVlc1tT
VE9QX1NUQVRFX0NOVF0pOwogCi0JaWYgKCFzYW1zdW5nX2RzaW1faHdfaXNfZXh5bm9zKGRzaS0+
cGxhdF9kYXRhLT5od190eXBlKSkKKwlpZiAoIXNhbXN1bmdfZHNpbV9od19pc19leHlub3MoZHNp
LT5wbGF0X2RhdGEtPmh3X3R5cGUpICYmIGZvcmNlX3N0b3Bfc3RhdGUpCiAJCXJlZyB8PSBEU0lN
X0ZPUkNFX1NUT1BfU1RBVEU7CiAKIAlzYW1zdW5nX2RzaW1fd3JpdGUoZHNpLCBEU0lNX0VTQ01P
REVfUkVHLCByZWcpOwpAQCAtMTM4Niw3ICsxMzg2LDcgQEAgc3RhdGljIHZvaWQgc2Ftc3VuZ19k
c2ltX2Rpc2FibGVfaXJxKHN0cnVjdCBzYW1zdW5nX2RzaW0gKmRzaSkKIAlkaXNhYmxlX2lycShk
c2ktPmlycSk7CiB9CiAKLXN0YXRpYyBpbnQgc2Ftc3VuZ19kc2ltX2luaXQoc3RydWN0IHNhbXN1
bmdfZHNpbSAqZHNpKQorc3RhdGljIGludCBzYW1zdW5nX2RzaW1faW5pdChzdHJ1Y3Qgc2Ftc3Vu
Z19kc2ltICpkc2ksIGJvb2wgZm9yY2Vfc3RvcF9zdGF0ZSkKIHsKIAljb25zdCBzdHJ1Y3Qgc2Ft
c3VuZ19kc2ltX2RyaXZlcl9kYXRhICpkcml2ZXJfZGF0YSA9IGRzaS0+ZHJpdmVyX2RhdGE7CiAK
QEAgLTE0MDMsNyArMTQwMyw3IEBAIHN0YXRpYyBpbnQgc2Ftc3VuZ19kc2ltX2luaXQoc3RydWN0
IHNhbXN1bmdfZHNpbSAqZHNpKQogCWlmIChkcml2ZXJfZGF0YS0+d2FpdF9mb3JfcmVzZXQpCiAJ
CXNhbXN1bmdfZHNpbV93YWl0X2Zvcl9yZXNldChkc2kpOwogCXNhbXN1bmdfZHNpbV9zZXRfcGh5
X2N0cmwoZHNpKTsKLQlzYW1zdW5nX2RzaW1faW5pdF9saW5rKGRzaSk7CisJc2Ftc3VuZ19kc2lt
X2luaXRfbGluayhkc2ksIGZvcmNlX3N0b3Bfc3RhdGUpOwogCiAJZHNpLT5zdGF0ZSB8PSBEU0lN
X1NUQVRFX0lOSVRJQUxJWkVEOwogCkBAIC0xNDMyLDcgKzE0MzIsNyBAQCBzdGF0aWMgdm9pZCBz
YW1zdW5nX2RzaW1fYXRvbWljX3ByZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwK
IAkgKiB0aGUgaG9zdCBpbml0aWFsaXphdGlvbiBkdXJpbmcgRFNJIHRyYW5zZmVyLgogCSAqLwog
CWlmICghc2Ftc3VuZ19kc2ltX2h3X2lzX2V4eW5vcyhkc2ktPnBsYXRfZGF0YS0+aHdfdHlwZSkp
IHsKLQkJcmV0ID0gc2Ftc3VuZ19kc2ltX2luaXQoZHNpKTsKKwkJcmV0ID0gc2Ftc3VuZ19kc2lt
X2luaXQoZHNpLCB0cnVlKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybjsKIApAQCAtMTc3MSw3ICsx
NzcxLDcgQEAgc3RhdGljIHNzaXplX3Qgc2Ftc3VuZ19kc2ltX2hvc3RfdHJhbnNmZXIoc3RydWN0
IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJaWYgKCEoZHNpLT5zdGF0ZSAmIERTSU1fU1RBVEVfRU5B
QkxFRCkpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JcmV0ID0gc2Ftc3VuZ19kc2ltX2luaXQoZHNp
KTsKKwlyZXQgPSBzYW1zdW5nX2RzaW1faW5pdChkc2ksIGZhbHNlKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCi0tIAoyLjQxLjAKCg==

--------------ZmkQ6mz0M1TULVxmkV6e5Nbh--
