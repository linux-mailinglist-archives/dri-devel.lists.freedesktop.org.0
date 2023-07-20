Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CF75A69F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 08:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA8C10E563;
	Thu, 20 Jul 2023 06:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2138.outbound.protection.outlook.com [40.107.7.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FC710E562
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWQT98Xr54BEekDULCWr17u/Y9TkBZrBEahVflelXhw8RuGuAd39esUx4IKFJbocNASUUMvtEmiyefZ3Jgo1qAN6B0Ef8VUnFHQWMJ1oArRGFddt6aAYSy5GxnBFIxoUEdswt9Z72HwtpAlbnp3II8J1f4FjPA2IntX02APb1LnRX7QtPukAReI1gwUBq7V933PUizvorRep0rd7AIR0Cw21pESFHzeYGqJD6v6/cD/3S7M8RaRxC+HJpPhhnuvvZZi/5lZMA6rLdU31EoiLUkUPXVcQN33j9C858ZfXzcsdQRzSKVmXqhDN4DU6InG/jZjUwaDJi0V6ZILjBMLKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/fEki8MG3+Yc6y2oz+T5b6jLwVYV9yiWx1PWUE2hcM=;
 b=YXgZ/tBccHAucndF+pwxKmcRGhjThdnIp/w5ZUGlwxzI3er/D7L19oCqdge74isIqUpuqZ+0b0KFP+kMXtr9dyD+mjWKkNCONnuGFpZM3ctCLFd3shV/AVad89bti6YJv94/DQbbMZFcEvy2x8bby3XLMteiE1RVjPdfJPXavix8ytm76enP0FaOSJFTzpwHbNLyVlrqNgMxZSBgXGkL9HE5IRKhQV53sVCpnimj7vJgGzU/18LIaOcI2xQd5r7SgmD2VQ/PfOkAyq/oNvoWOg0szZlLkqWilxkCwSOROAH0tGAhaB6c/fc1WAnGu3HhEVLpwiI/s58X1osy3v/0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/fEki8MG3+Yc6y2oz+T5b6jLwVYV9yiWx1PWUE2hcM=;
 b=Dth88ewfUAyobPNB7nekboPDL6WbAu6tH8Nlv7PzE5PAkO0Xk4LvvFDGrhk5yng2kAAeKRUTKo6eSXX3sgbJXJx8w3NmS2zM0L8M3As8XjbkFujeGGCXDymLA7dQvF+SGsDjLkL2ffI1izhsaIGMacySYC/ZwZC79Frb+kWLNeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB5PR10MB7722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 06:37:50 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 06:37:50 +0000
Message-ID: <714bfdb1-bc1a-b76b-e54f-a8e3761bec29@kontron.de>
Date: Thu, 20 Jul 2023 08:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Content-Language: en-US, de-DE
To: Tim Harvey <tharvey@gateworks.com>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
 <CAJ+vNU2d969V1kTHpH+tPK1fm=Z2DUdKSOjwyzRO=9j43HhKgg@mail.gmail.com>
 <5dc55bcf-abec-78cd-74b8-54fa67fd1fb2@kontron.de>
 <a7e6611a-a147-607c-9df4-9fcc4e2cf397@kontron.de>
 <CAJ+vNU00AsaGQ4nqCJ+XqUtYsbr8ow49BV78QZx6CgF0xn6s+g@mail.gmail.com>
 <2a57622c-402b-5df6-73b3-9ba9aad9843d@kontron.de>
 <CAJ+vNU2p1qPqWxZ83N_goSt17rAH4GU9mh18zJm2iCGoRra=vg@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAJ+vNU2p1qPqWxZ83N_goSt17rAH4GU9mh18zJm2iCGoRra=vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0409.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB5PR10MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee4de7c-6394-4b51-e9b8-08db88ebd674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zocor5COVFHgqUvtUSOYgQhsCq+bdFTO/Ab92icMaf3x+aIYId+XIlnuoCJXrhcq1XejevjBMID39Gx2DJQULcE35uMDy1z6Lv7rpcY7dQPiEfAwqEFvqD7Q32VymNDVf8XRNA8TML0UHkKR1p5Cg1EFOZdF/wGneaF+wsfg4nPUAMywiA1iXRExmnISwPJrMaa2MrCq8aEkNr47r6uI0CNLH3mySwzRbQ+X6La+hy3suPNvbtS9E1GQMyfncigI1KoE1et3SxZLRwX9Me+S1RnFWTo/ABpZMV5luO/UcaGiTmZaLUKvXosPg4noN5TPabHZ9Laxt37Mb/6XjSYGjFVL72iZ5TKeebZClVSJ81figtXdNYc2mnUgN6fQJbqs+FgufQLEyH7VPm8UEdC0pQwueoco4Gg01Ehj8qlk5tVFpIe7gyRP4c4a7AgUmPhvPlkP73i/QXtTqQl1Q6gCC5GEOIHa0cVn1vPtbn44N5zUDvaKG8xJyVvqR+76rgfn1ankpeCqvlnSJBWrIwiOpBuRJ94Pc7rA27ttg7ah6TI9CBmFf9LnEYHwNehPJoRwsjkBHVVM2jPA2+4ad8PY0D2GtZX3clmGiw0Fn1zij41vqp2hPGbKIRKmz3SaHGpuXhw0xbJ36z4jYpglaHBaQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(2906002)(30864003)(54906003)(478600001)(41300700001)(44832011)(7416002)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(4326008)(31696002)(6916009)(316002)(31686004)(2616005)(86362001)(36756003)(26005)(53546011)(186003)(6506007)(45080400002)(6486002)(83380400001)(966005)(6512007)(38100700002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFRcjd4MEhEUVpRNzdkVHZMODk0UWhOdHRmallERGt0QXovTnhUamVpL2l5?=
 =?utf-8?B?UzNZSWh2WnJ2VEF4OFZnVXVXV2YvL3YyblJjRThkU2psVmE4bHhIZDdIVGVB?=
 =?utf-8?B?N2pkS0NWckJhR2orTzhCbHB0RVdCdTF2V3hUOVhCZzlScXV4ZFhpTmswaXRs?=
 =?utf-8?B?TGNBMFRncS92QlE2Z01haTFyeXNOZHprVThBUkVwZzdId3oxdWxWYU5BRHB4?=
 =?utf-8?B?K2xONUZtQ29PbnJ5eXFGbkpQWVBCNENWSDBqSHlCZVV4NnJ3RjZQNHovUnJq?=
 =?utf-8?B?aWpHcG8wbUZkQUx1YXBHZUV2a09Ob2ZFZ0JmcGVORVRwRkNmelcvclVkK3Rx?=
 =?utf-8?B?L3ZCeGFzY2JjdjdKck9rLzVNb29oYjFWeHF0eVhkYW4vWFlQWnZNejAvcGZ6?=
 =?utf-8?B?dkduNlE0c1kyWVZHQjYrRlgweDMvczFWMVpqY3gyUGlRYkViTzY5Y0VoUmxT?=
 =?utf-8?B?UURlcy9VMEZqRG13bW5JQlVDL3U5aWJGbzdBd0ppTFRDMTcyeVpmcW1WM0x5?=
 =?utf-8?B?K3Q4VXNmTnR4cFN1U3JKbjJiOU9TQmdUeXZ1ZW51ZWNWeWtobElmUngxMUdW?=
 =?utf-8?B?MzdVUmhSTVYrdlQzTlJJc21sMFM1ZjdURVdqSWptaGtXYVlCVkwrdHpCRmd0?=
 =?utf-8?B?c08rUVlnclVMd1cyRGo2enNUbURpWmlhUmhFMWRvNmkvQTVPQkRyY2pnMEw0?=
 =?utf-8?B?VEJnVjR3OVdOWHpHWVBZOGduTHArTStWMDBYc056N0lZWW9OV2VpZUhYSmNQ?=
 =?utf-8?B?THF3a0NabW9CU0haMWw0V2Q0QlNtbkpyTElTVkFHZWZOSkx2SEFacDFaMmk4?=
 =?utf-8?B?WU5zM0lhU2p0bVFvQjlmdHByMjJsKy9TaFNJM1hZd1h2cFNwQ2VHN2RBU2Iw?=
 =?utf-8?B?dmV4OFB5VW9aYUJ1WEtCMDRNaEdBYXZObC9UUmp0Wk9VY3BnZzVwOUpRQm1s?=
 =?utf-8?B?K2hFWEJOZTRBbzIvdmYyNXBkN082MFlpb2o1RjdMbm16bTY1WUYyQ0JTcWFp?=
 =?utf-8?B?L3RUS3R2WWtTYU1DOWxOSEd3YlV0d0N0bDg5VVQ3WUhIQWt1RndwWjZCOTlF?=
 =?utf-8?B?RitoL05ZS3BsWE1wQ3hXQXQ4eDVWZk01bnFQSmU4T3JJaHBwbjJCdTV6TU40?=
 =?utf-8?B?NVM5QkxhSGhqZHdHT3J2MThReDB3V1dmckZ6VXVhZzB2S2h5NnUyelo1OWZi?=
 =?utf-8?B?R3BoWXZndXBTN3F4dUszWkQ2bUhrb2xRNzY4S0hsQjVWSk4xZW9WU1BnOFRH?=
 =?utf-8?B?ekRBaW9GRWZ6eG9CeUhHN3pRK2lnM1JvcUQ2ckx6TjE5bWFpMW9ibjFRTzl2?=
 =?utf-8?B?SGhuViswVDRYVnZxVVlQSUVmOGdSYnBzc1Z3Q05YZGxEWTJIRko0RWpCb3Zz?=
 =?utf-8?B?TkVCaEZQbngxdGpYeFZYZGdJVm54VXhsWFU1S3orMVlSRG5KVWlLOHA0N2RV?=
 =?utf-8?B?Qml1Slc1ZndSanRoLzlnekExb01pU2ZsMC9GeTF3Slc0Sm1YTjJLQTVzZHJD?=
 =?utf-8?B?a25JUVlQa1lzNUFYK0Uzak9MY1pJQnkyS1BuSlNwTDYzdFFOTXNDRVh3UTB4?=
 =?utf-8?B?cW11cGM0VVRNQ0F1VHUyck9VdHBDaVR6ZUJ3VWhxMUxDaHFnR0pDZy9iWGtk?=
 =?utf-8?B?cnFFaHVCVDFucTlXS01FbzBINWNBa1AyeHFTcFVUZ2tVaXMvd0p3aFk0dHhm?=
 =?utf-8?B?QTJrTmJva3RZOU1BZEI5T2l4YzJYYmR4U2NEZURoT01nZW1KUmVQbVBvYTl5?=
 =?utf-8?B?NXN2cTVleDNmTEU0VTlteDdzVHFuSzdWVWM5ZlNFcUpUdHMwRy9FUEtBQ2RE?=
 =?utf-8?B?NXdHVkFXMGdOckVHVTlSL3lVMG5YSWduSnZtRk9pbmNDalZvcE1hUTB6Sith?=
 =?utf-8?B?LzJPWEloSGVsRGpqQjFJQ0tuRVlGWU5TRzZJZm9BbHA3aFI2K0kvK0orZnUx?=
 =?utf-8?B?SHRQNnVqdnkrVTFXNjFOSERmRVhINENJbnhOR0x6NzRaNHNWTzhFYUdmc1dU?=
 =?utf-8?B?bUlNREZhNHUyRDhyTVFldU1kalg0K01ySVA5VGhyRWxYUm94UCszd2IvbVA0?=
 =?utf-8?B?cjlHeHVMSmRQcVZqZ1orUjhsWkt3cWp2TVo0RzlXRVl1dkNyczJmNDF5SjIz?=
 =?utf-8?B?dHhoeDA3UFBlbzZxcFhEbXJFQmxsc3J5Nlc0R1VGL2lKdUtSNTJJcGQwNTVl?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee4de7c-6394-4b51-e9b8-08db88ebd674
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 06:37:50.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVG5kygT0E0RyKVBVnNBgSv53Lik+9yMeZv7l2fbGn0lfYyUe6mJMdvhObY3f8zz78oIBklu+WBag1pZxsZlZVU8jIScy9a9c4dQPDi/CCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7722
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
 Frieder Schrempf <frieder@fris.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.07.23 18:34, Tim Harvey wrote:
> On Wed, Jul 19, 2023 at 12:05 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Tim,
>>
>> On 19.07.23 01:03, Tim Harvey wrote:
>>> On Thu, Jul 13, 2023 at 3:01 AM Frieder Schrempf
>>> <frieder.schrempf@kontron.de> wrote:
>>>>
>>>> Hi Tim,
>>>>
>>>> On 13.07.23 09:18, Frieder Schrempf wrote:
>>>>> Hi Tim,
>>>>>
>>>>> On 13.07.23 00:34, Tim Harvey wrote:
>>>>>> On Wed, May 3, 2023 at 9:33 AM Frieder Schrempf <frieder@fris.de> wrote:
>>>>>>>
>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>>
>>>>>>> According to the documentation [1] the proper enable flow is:
>>>>>>>
>>>>>>> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
>>>>>>> 2. Disable stop state to bring data lanes into HS mode
>>>>>>>
>>>>>>> Currently we do this all at once within enable(), which doesn't
>>>>>>> allow to meet the requirements of some downstream bridges.
>>>>>>>
>>>>>>> To fix this we now enable the DSI in pre_enable() and force it
>>>>>>> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
>>>>>>> register until enable() is called where we reset the bit.
>>>>>>>
>>>>>>> We currently do this only for i.MX8M as Exynos uses a different
>>>>>>> init flow where samsung_dsim_init() is called from
>>>>>>> samsung_dsim_host_transfer().
>>>>>>>
>>>>>>> [1] https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>>>>>>
>>>>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>> ---
>>>>>>> Changes for v2:
>>>>>>> * Drop RFC
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>>>>>>>  1 file changed, 23 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> index e0a402a85787..9775779721d9 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
>>>>>>>         reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>>>>         reg &= ~DSIM_STOP_STATE_CNT_MASK;
>>>>>>>         reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
>>>>>>> +
>>>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
>>>>>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>>>>>> +
>>>>>>>         samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>>>>
>>>>>>>         reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
>>>>>>> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>                 ret = samsung_dsim_init(dsi);
>>>>>>>                 if (ret)
>>>>>>>                         return;
>>>>>>> +
>>>>>>> +               samsung_dsim_set_display_mode(dsi);
>>>>>>> +               samsung_dsim_set_display_enable(dsi, true);
>>>>>>>         }
>>>>>>>  }
>>>>>>>
>>>>>>> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>>                                        struct drm_bridge_state *old_bridge_state)
>>>>>>>  {
>>>>>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>>>>>> +       u32 reg;
>>>>>>>
>>>>>>> -       samsung_dsim_set_display_mode(dsi);
>>>>>>> -       samsung_dsim_set_display_enable(dsi, true);
>>>>>>> +       if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>>>> +               samsung_dsim_set_display_mode(dsi);
>>>>>>> +               samsung_dsim_set_display_enable(dsi, true);
>>>>>>> +       } else {
>>>>>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>>>> +               reg &= ~DSIM_FORCE_STOP_STATE;
>>>>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>>>> +       }
>>>>>>>
>>>>>>>         dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
>>>>>>>  }
>>>>>>> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct drm_bridge *bridge,
>>>>>>>                                         struct drm_bridge_state *old_bridge_state)
>>>>>>>  {
>>>>>>>         struct samsung_dsim *dsi = bridge_to_dsi(bridge);
>>>>>>> +       u32 reg;
>>>>>>>
>>>>>>>         if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>                 return;
>>>>>>>
>>>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>>>> +               reg = samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>>>>>>> +               reg |= DSIM_FORCE_STOP_STATE;
>>>>>>> +               samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>>>>>>> +       }
>>>>>>> +
>>>>>>>         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>>>>>>>  }
>>>>>>>
>>>>>>> --
>>>>>>> 2.40.0
>>>>>>>
>>>>>>
>>>>>> Hi Frieder,
>>>>>>
>>>>>> I found this patch to break mipi-dsi display on my board which has:
>>>>>>  - FocalTech FT5406 10pt touch controller (with no interrupt)
>>>>>>  - Powertip PH800480T013-IDF02 compatible panel
>>>>>>  - Toshiba TC358762 compatible DSI to DBI bridge
>>>>>>  - ATTINY based regulator used for backlight controller and panel enable
>>>>>>
>>>>>> I enable this via a dt overlay in a pending patch
>>>>>> imx8mm-venice-gw72xx-0x-rpidsi.dtso [1] which works on 6.4 but not
>>>>>> 6.5-rc1 which has this patch.
>>>>>>
>>>>>> The issue appears as:
>>>>>> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
>>>>>> 64 01 05 00 00 00
>>>>>> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
>>>>>>
>>>>>> Instead of
>>>>>> [    1.011729] samsung-dsim 32e10000.dsi: supply vddcore not found,
>>>>>> using dummy regulator
>>>>>> [    1.019829] samsung-dsim 32e10000.dsi: supply vddio not found,
>>>>>> using dummy regulator
>>>>>> [    5.649928] samsung-dsim 32e10000.dsi:
>>>>>> [drm:samsung_dsim_host_attach] Attached tc358762 device
>>>>>>
>>>>>> I'm curious what board/panel were you needing this for and do you have
>>>>>> any ideas why it broke my setup?
>>>>>>
>>>>>> I'm also curious what board/panel Alexander tested this with and if
>>>>>> Adam or Jagan (or others) have tested this with their hardware?
>>>>>
>>>>> Sorry for breaking your setup. My test- and use-case is the same as
>>>>> Alexander's. I have the SN65DSI84 downstream bridge and without this
>>>>> patch it fails to come up in some cases.
>>>>>
>>>>> The failure is probably related to your downstream bridge being
>>>>> controlled by the DSI itself using command mode. The SN65DSI84 is
>>>>> instead controlled via I2C.
>>>>>
>>>>> Actually we should have tested this with a bridge that uses command mode
>>>>> before merging, now that I think of it. But I wasn't really aware of
>>>>> this until now.
>>>>>
>>>>> I'll have a closer look at the issue and then will get back to you. In
>>>>> the meantime if anyone can help analyze the problem or has proposals how
>>>>> to fix it, please let us know.
>>>>
>>>> With my patch samsung_dsim_init() now initializes the DSIM to stop
>>>> state. When being called from samsung_dsim_atomic_pre_enable() this
>>>> works as the stop state is cleared later in samsung_dsim_atomic_enable().
>>>>
>>>> When being called from samsung_dsim_host_transfer() to handle transfers
>>>> before samsung_dsim_atomic_pre_enable() was called, the stop state is
>>>> never cleared and transfers will fail.
>>>>
>>>> This is the case in your setup as tc358762_init() is called in
>>>> tc358762_pre_enable().
>>>>
>>>> I think that requiring to initialize the DSI host during transfer could
>>>> be avoided in this case by moving tc358762_init() from
>>>> tc358762_pre_enable() to tc358762_enable().
>>>>
>>>> But at the same time according to the docs at [1] this seems to be a
>>>> valid case that we need to support in the DSIM driver:
>>>>
>>>>   Whilst it is valid to call host_transfer prior to pre_enable or
>>>>   after post_disable, the exact state of the lanes is undefined at
>>>>   this point. The DSI host should initialise the interface, transmit
>>>>   the data, and then disable the interface again.
>>>>
>>>> Therefore I would propose to try a fix like in the attachement. If you
>>>> could test this, that would be great.
>>>>
>>>> Thanks
>>>> Frieder
>>>>
>>>> [1]
>>>> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>>>
>>> Hi Frieder,
>>>
>>> The patch does not resolve the issue. I still get the 'xfer timed out'
>>> from samsung-dsim but noticing today that this issue doesn't exist in
>>> linux-next I've found that its resolved by Marek's patch:
>>> commit 8a4b2fc9c91a ("drm/bridge: tc358762: Split register programming
>>> from pre-enable to enable")
>>
>> Thanks for testing. I didn't notice there already is a patch from Marek
>> for the tc358762 driver. This is exactly the change that I was
>> considering above as a fix on the downstream bridge side.
>>
>>>
>>> I'm not clear on how that patch is staged in linux-next. If we can get
>>> that pulled into 6.5 then it will resolve the breakage.
>>
>> Still the documentation says that the DSI host must be able to handle
>> this and there might be other drivers that are not yet fixed like this
>> or can't be changed to make DSI transfers only after the host's
>> pre_enable() was called.
>>
>> Therefore I would prefer to fix the DSIM driver and apply this fix to
>> 6.5-rc instead of backporting the tc358762 patch. I gave it another shot
>> and maybe you could do one more test with the attached patch and without
>> the fix in tc358762.
>>
> 
> Frieder,
> 
> This patch doesn't resolve the issue either. Let me know if there is
> some quick debugging you want to add somewhere. I don't have a lot of
> time to troubleshoot this week as I'm trying to wrap up some work
> before a 2-week vacation but it's quick for me to apply patches and do
> a quick boot test.

Ok, thanks for testing anyway. I think I need to go back to the drawing
board with this as I'm obviously missing something. I won't bother you
more before I did some more research myself.
