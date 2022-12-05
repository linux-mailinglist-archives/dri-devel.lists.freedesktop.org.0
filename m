Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD8D642BF3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 16:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B46710E0DB;
	Mon,  5 Dec 2022 15:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2115.outbound.protection.outlook.com [40.107.249.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D06310E0DB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 15:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5GBh0LbJWUNJsctjK3vr0AlWkNeMhoUCzn2/z9HZer6TwtTyp0hDrBqlChVrrezaFa1UHkZxnjqGr66RZ4tIDu0rXk12LX2WFLFVJvob9YzRrl/X86/O5SCGoBv0rwxgOzMjWefPoLHZLny7zI/vNlxSxIHFN+0q5nmylBg4sjYH3gQ2ytYmgcG/m9RPK2Gsszm1hN9NxP8LFi1YGiMIuzyJ7bwQpMql22Lzj8EUZ/vufIKim2G6/K1mwA50KVN/V0Yl4gbgsVwe1rqamxqTmX6eqeDX+fQTZdcHMZlzJm5FqE8bOfPkX/nEU1lNf+yl+T6izZNhk2CS4A/zCbSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIKuKAWabnpFpC+Z5loHumrHiUFRfXCoc6cW0CFw+eg=;
 b=oGOT7HyEU1DNLaXkzGuZ8iCIAQrZu1QPnxKxS0FFSQBwaEfsI9z3D9DMlP0Dg5bPZWoPtu8nfx2rheMi3VFUYCpkUE1/wLFLjnpLWkzFmCqst840YkD0C0ra1MUbQhIR12G/ln5GOeiMwbmaD9ZUnr3PZxbPPJzx5/yf671L/g+1GadavyM2HrFx9xGxPPgUpEB2jpy7VLvmSkVHD3gRwbUi72+z2Xs8PkJ9k8FgNBwG8i6xyBhEdSpknGEGAxMB11IOk/PjgWUmIZXMsyyRXIRLnTFbXFLFNaNDC9qBSrxeGbawzUKg2I4mwAmYG/Ak2H8PFEHlajnZs88Qa38VzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIKuKAWabnpFpC+Z5loHumrHiUFRfXCoc6cW0CFw+eg=;
 b=Pz36wPQJC6vz2FNrBuZjMpENIh5BQCzELkQagLaI07LDs8ybBGMy6IlElXAyhvmh86jNdxVRb++rXwZonDUR3dsP5DYhdRl4LscMKx99+Dc4pP3SMEuc6RpXAiKXZbmYEKZFlAUmSZ9lB2ntPSsJsAbY4t6nzy/HVM6dObsRpMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB9PR10MB5501.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 15:37:24 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 15:37:24 +0000
Message-ID: <e32280e4-0c8e-f823-051b-8d0802d6fdb5@kontron.de>
Date: Mon, 5 Dec 2022 16:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
 <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
 <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
 <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
 <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
 <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0017.eurprd03.prod.outlook.com
 (2603:10a6:205:2::30) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB9PR10MB5501:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc92d43-779f-4f25-9dec-08dad6d69b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCIY33iATC42D+A3PbdqnEdCvuuJAVfIzWLxe1n51My30sL6mXHo0DCdOYL4/WA21/68j2p36FsMLXI3eNMebzoXNTuYQLB1MLDk9LZaPMaHy8jwf5ZFY9In5ugWJA77ehwJTkNmbKCnFK4cFBg6+caOb18IVqIrchHnRAJUGwdVFS2VCTwZQXeBs11s4M4hKwoF9aL1xCWxLnPrtnssQykOB7P9mB3GLukcj6kZbLNSvj2yVcEyLhinBCNDZP0o1H/n0qHE2AzeLLLvu0JVlCXWXevo7LJFU+zHle3tuOfONl9NEQatDoQTeU4OJRiBilbDjpgYk0aEKFDjqYuHA+CoC9k16kpG5zrJbl2C77OtkVD4XjBEowG/Ltzv/bXYWC5wHaOMIVz+8FaqskuBKZdagZVgFDjemiJD1e/dXfV1IOe5PK+EpescAf5NQh4g+7xzxmB8OyUHt6oOquziFIsIN8payamWP2L8/U8zpH4VSvZTo/F9sZLwCYD1edZd/NaTCDe4lL3qSdGd01gO4V5RFCNsd2Knk5Nx5L80R/FVdzQNUdPDafr6hzQ6/chZ/q2nW3+u/1wvK/VdzrwXpyIZjlt2eqbXQclAeD0gXtIQg0gl4SEeQ0JCzoxEgItiW7PbkGva/NCE8hNd0cV65EkWzANlcXB4uMPq6CHqwu1ooedkoXH4cfWm49UNhYFLkCbW4Jzo3mZAfZGuX14VurRBDg0YkIL4jVGkJg6r1Mk2epS0m96MrAnJkcBL0aKn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(31686004)(86362001)(31696002)(53546011)(6506007)(478600001)(966005)(6486002)(45080400002)(36756003)(6512007)(186003)(2616005)(83380400001)(38100700002)(7416002)(6666004)(4326008)(41300700001)(5660300002)(66946007)(8936002)(8676002)(30864003)(44832011)(66476007)(54906003)(6916009)(66556008)(2906002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpmbEhCbEtvK0tGNzMrd1JwdFFCZG9DM3ZwcUU0TEtEQkdaN1l2Rlk1NTc4?=
 =?utf-8?B?eDBPdWFJN1JOc2JhZWpiM2Y1R3NZYjFDVXFsK1lrcTU4bElTSHFPaThHaHZN?=
 =?utf-8?B?eEpDbzNvRFlsMGEzR2ZNZk82dS9vSUZYdUJLVjB6M2FHZW1ZYXB5OEcwei9J?=
 =?utf-8?B?cFR6SEV2YXBGaHY0TGRPTGFtY1lyYnFXN3JNazQvdmJlS3k4bVVnOWR0dHhV?=
 =?utf-8?B?enJtdDhMcXlWQWJ0bnZFMzZxQjc4SjNoODZOTmd4cHY4TDdwWWZpa1hBenhC?=
 =?utf-8?B?SDZIcjNLWW1MWVF0ZGI3RzRVZUJyck9wTHA5VE00bEU4bjY2T2xXVklDRDNY?=
 =?utf-8?B?ZW5yVUVuOU9lQlIvK2hNRGI3MUlBWW5PRDJUUXhKcGhVbS92YTcyUEVrS3p1?=
 =?utf-8?B?YTc2WFJHcGtJOGxRaVZyZjEwUXBQNllBdHdNd3E0blRjMG9jZW9laE45dE9i?=
 =?utf-8?B?YXBJWHFqN0hwQjdQeVgvc0dlUlJUZWpMTXRMSzJaNjNFdjZ2NG5ZOVprWUlB?=
 =?utf-8?B?OC84NGk3Q0RkMkpaVWJseUIvZms0eXcwMXRTeGl3dTVkaHpnOXVVVlFJRC9w?=
 =?utf-8?B?aWE1Y0NoZ0JkUVA1WWpidGNIR0V6SGx6dm5IZi8rT1JoOGtERkQrTFl5RG12?=
 =?utf-8?B?ZEQwQVd4VGUrS2dzNjNGUEJyb0xDdmg1eTVyTGNPUUhRdVducmsxeVkveXZX?=
 =?utf-8?B?ZjByeWtZUlhKNERNdzg4NFhiLy9wbGlwYk5WK1ZyV1pGSTBNTXRLZ1N0NmJa?=
 =?utf-8?B?K09ISzZ5a2dwclgvY1BncEJQeEhFVUE3U1MxcTBRME53b1RqVFJ6K2NPWmY1?=
 =?utf-8?B?elllYW1rM1BvaTlMMXNFNEo2N295ZkRpcmV1MndpdlE4UU5ydEt3a2x1MXRj?=
 =?utf-8?B?a04rR0I4QjdNVitJc0I4eTZSV1RBcVdDTzkrd3NHNDVlVm43RVVnc0Y0ZjNC?=
 =?utf-8?B?cmwzYzY4RGdaU3JlN3BTeUR0cFpmQjQ4Skw1ak5RdlA4dm52ZHBKSGpCUC80?=
 =?utf-8?B?VFBrVktTVDlmUXI2NHllWEp1VmcyTWFTZGtQa2pVUGRUdGtmNUVRaVhraXZj?=
 =?utf-8?B?SlFMQkQ1cHFiR2VLV0hIKzY0V3RKTEl6R0lRdi9LZFNGbkFiWlM0S1ljaWFu?=
 =?utf-8?B?eCtjWjZpRjN3V1JrTkZGNEthWE1XeHFaWjRuVGJ3cWdVY0pFRHAwN21Vait1?=
 =?utf-8?B?NHROaSs1VFV3MmlGT3krdlgvdksvVjkxYlhsN0N4YVdvVUZsVDBqamVOcGoz?=
 =?utf-8?B?R3ZlTkl3VmVYbHRhd01majE1QTgzbWtBS0NJWm0zQjJFMkxKQmtBdysxUkNv?=
 =?utf-8?B?aUFHaWJSL2JETlI0d0xWQW9adWZGMWJrSDV4TG81MHhjT3A5Nk5XYTRUUVJC?=
 =?utf-8?B?bTBkTHlPKyt6cUxmWTJvYm9ZMmFGbm1HL2lJVHN6TlZCaEhJckxRalRhaTVS?=
 =?utf-8?B?UXJWeURweXEvRFNRQzdhMDhmSVJDYmdUak1Tb2VUWnVMRmpDMWpneFR3Q1pk?=
 =?utf-8?B?aXhjQjNLcHcvdE00SzE3K1FOT2FvZ1BFMktpMzUwbGNHK21rNTBBSVhCYjNj?=
 =?utf-8?B?OHJMdE9QMTRVUzlnZXBXRWhsS1JJa3RxQkhGc0dwTHY4aUxPdnRJTUgwcTds?=
 =?utf-8?B?bDdlaHF0N2pWSy9XU3NzRGVwNEV0NGsrMGpHWlVPYkhzTjRkZ2RnZ0NYTmFT?=
 =?utf-8?B?Vlhic09vaEpKdWZOdXljdExRV1ZGSnlZd2U4bGhuQjJ0dVNFVFQzdTZqOGMv?=
 =?utf-8?B?SVZmczlVQmNqLzhQOFFqM0xoZWxqdjkvMnE4UW5RS2NsZEhnaXVtdVFsVzIy?=
 =?utf-8?B?M3hDOXJ1b08xY2N6Z21iZVAvRnZXMTFEdmFIbGJJYXFXMWVCdnBWUVZyMjRF?=
 =?utf-8?B?cFlHNWtxV0ZGMWFZS2NidE9MUmlRU1o2UWZjdnQwYXFIMWNWUEFFMDk0SW1J?=
 =?utf-8?B?QkZPOXRjcjZFWGZyTURxaUJlT05uVS9QZnZOSjZEZ2pORTlJbWdCWkpsNW5t?=
 =?utf-8?B?ZnB1QkN1dVprUm8zSzVUZHREMmk2WDN5YUFER2FNUHptL1dvcXFiaXpJcGRz?=
 =?utf-8?B?QjdpMzRSeGREODk2bUhITUJueFpRRElqaGVaSittOVhPaEZ0ZnVhbkxUc0x4?=
 =?utf-8?B?QlFwTE5aNi96d1kzdW1Ock93SExBT2dVRkxtRGRYdnJMWjM5RE04NHFxc3VM?=
 =?utf-8?Q?R9J1Mz6JTX5dAbWmy6yVuvNPtESAcMbE3MDpabKSZs5M?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc92d43-779f-4f25-9dec-08dad6d69b35
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:24.3080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E73os1eRPoSbXh0I8/F+4kiR5xxEZ+vmrGVlY0vkhmx4beh52PUjXgvYyvBzToZe3f2AP3bR9fL9NIGrAshqJasZJ5bmkSwwV+bTRCqL4FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5501
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 05.12.22 16:20, Dave Stevenson wrote:
> Hi Frieder
> 
> On Mon, 5 Dec 2022 at 07:30, Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> On 02.12.22 15:55, Dave Stevenson wrote:
>>> Hi Marek
>>>
>>> On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 12/2/22 11:52, Marek Szyprowski wrote:
>>>>> Hi,
>>>>>
>>>>> Sorry for delay, I was on a sick leave last 2 weeks.
>>>>>
>>>>> On 28.11.2022 15:43, Jagan Teki wrote:
>>>>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>> On 11/23/22 21:09, Jagan Teki wrote:
>>>>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>>>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>>>>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>>>>>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>>>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>>>>>>>>> configured downstream bridges.
>>>>>>>>>>>>
>>>>>>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>>>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>>>>>>>>> and enable in order to initialize or set up the host.
>>>>>>>>>>>>
>>>>>>>>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>>>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>>>>>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>>>>>>>>> Szyprowski).
>>>>>>>>>>>>
>>>>>>>>>>>> v8, v7, v6, v5:
>>>>>>>>>>>> * none
>>>>>>>>>>>>
>>>>>>>>>>>> v4:
>>>>>>>>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>>>>>>>>
>>>>>>>>>>>> v3:
>>>>>>>>>>>> * none
>>>>>>>>>>>>
>>>>>>>>>>>> v2:
>>>>>>>>>>>> * check initialized state in samsung_dsim_init
>>>>>>>>>>>>
>>>>>>>>>>>> v1:
>>>>>>>>>>>> * keep DSI init in host transfer
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>           disable_irq(dsi->irq);
>>>>>>>>>>>>       }
>>>>>>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>>>>>>>>> flag)
>>>>>>>>>>>>       {
>>>>>>>>>>>>           const struct samsung_dsim_driver_data *driver_data =
>>>>>>>>>>>> dsi->driver_data;
>>>>>>>>>>>>       +    if (dsi->state & flag)
>>>>>>>>>>>> +        return 0;
>>>>>>>>>>>> +
>>>>>>>>>>>>           samsung_dsim_reset(dsi);
>>>>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>> +
>>>>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>>             if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
>>>>>>>>>>>>           samsung_dsim_init_link(dsi);
>>>>>>>>>>>>       +    dsi->state |= flag;
>>>>>>>>>>>> +
>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>       }
>>>>>>>>>>>>       @@ -1269,6 +1276,10 @@ static void
>>>>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>>>>>>           }
>>>>>>>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>>>>> +    if (ret)
>>>>>>>>>>>> +        return;
>>>>>>>>>>>>       }
>>>>>>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>>>>>>               return -EINVAL;
>>>>>>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>>>>>>>> -        ret = samsung_dsim_init(dsi);
>>>>>>>>>>>> -        if (ret)
>>>>>>>>>>>> -            return ret;
>>>>>>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>>>>>>>> -    }
>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>>>>>>>> This triggers full controller reset and reprogramming upon first
>>>>>>>>>>> command transfer, is such heavy handed reload really necessary ?
>>>>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>>>>>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>>>>>>>>> initialization conditionally, in prepare() callback in case of IMX and
>>>>>>>>>> on the first transfer in case of Exynos?
>>>>>>>>> That's odd , it does actually break panel support for me, without this
>>>>>>>>> double reset the panel works again. But I have to wonder, why would such
>>>>>>>>> a full reset be necessary at all , even on the exynos ?
>>>>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
>>>>>>>> whether a reset is required before calling it might fix the issue.  I
>>>>>>>> agree with double initialization is odd but it seems it is required on
>>>>>>>> some panels in Exynos, I think tweaking them and adjusting the panel
>>>>>>>> code might resolve this discrepancy.
>>>>>>> Can someone provide further details on the exynos problem ?
>>>>>> If I'm correct this sequence is required in order to work the existing
>>>>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
>>>>>> possibly fix the sequence further.
>>>>>>
>>>>>> Marek Szyprowski, please add if you have anything.
>>>>>
>>>>>
>>>>> Well, frankly speaking the double initialization is not a correct
>>>>> sequence, but this is the only one that actually works on Exynos based
>>>>> boards with DSI panels after moving the initialization to bridge's
>>>>> .prepare() callback.
>>>>
>>>> Somehow, I suspect this is related to the LP11 mode handling, which
>>>> differs for different panels, right ? I think the RPi people worked on
>>>> fixing that.
>>>>
>>>> +CC Dave
>>>
>>> Yes. I've just sent out a v3 of that patch set.
>>>
>>> Hopefully setting the pre_enable_prev_first flag on your peripheral's
>>> drm_bridge, or prepare_prev_first if a drm_panel, will result in a
>>> more sensible initialisation order for your panel.
>>>
>>> Note that host_transfer should ensure that the host is initialised, as
>>> it is valid to call it with the host in any state. If it has to
>>> initialise, then it should deinitialise once the transfer has
>>> completed.
>>>
>>> Dave
>>>
>>>>> I've already explained this and shared the results
>>>>> of my investigation in my replies to the previous versions of this
>>>>> patchset. The original Exynos DSI driver does the initialization on the
>>>>> first DSI command. This however doesn't work for Jagan with I2C
>>>>> controlled panels/bridges, so he moved the initialization to the
>>>>> .prepare() callback, what broke the Exynos case (in-short - all tested
>>>>> panels works fine only if the DSI host initialization is done AFTER
>>>>> turning the panel's power on). For more information, see this thread:
>>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fe96197f9-948a-997e-5453-9f9d179b5f5a%40samsung.com%2F&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Cee7b57ee420e45a73b1d08dad6d45306%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638058504671330145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TQIIKNa4OVGP1dZo3tM%2FOMO3dlXrjLr04U%2FJFhd2rAs%3D&amp;reserved=0
>>>>>
>>>>> Now, the more I think of it, the more I'm convinced that we simply
>>>>> should add a hack based on the HW type: do the initialization in
>>>>> .prepare() for non-Exynos case and before the first transfer for the
>>>>> Exynos case, as there is no way to detect the panel/next bridge type
>>>>> (I2C or DSI controlled).
>>>>
>>>> Let's see what Dave has to say about this, maybe there is some further help.
>>
>> Could we agree on adding the HW type based hack Marek S. proposed as a
>> quick fix?
>>
>> This patchset was tested on Exynos so it's likely to not break any
>> existing setups. And for i.MX8, this is a new driver so there's not
>> really a requirement to have all setups working/supported from the
>> beginning.
>>
>> Also having one or two hacks (marked with FIXME) in the code doesn't
>> hurt. As we can see there are drafts to fix them in conjunction with
>> changes in the DRM framework.
>>
>> This has been pending for months and in my opinion if there's a chance
>> to get this into v6.2-rc1 we should take it.
> 
> My patchset was sent in March with no one seeming to care enough to review it.

I wasn't referring to your patchset but rather to the Samsung DSIM
bridge transformation patchset.

My point was simply to not try getting everything done in one big step
because this will fail. The patchset this refers to needs testing on two
separate platforms which is painful enough (thanks to Marek for covering
the Exynos side!). I think we should focus on getting the DSIM bridge
transformation merged and accept a few small hacks that will be taken
care of in the next step.

> 
> If the situation is that your devices fall into the same camp as those
> for vc4 (the host needs to be initialised before the peripheral), at
> least verifying that would be useful before rushing into a hack.
> 
> Your other comment references using a TI SN65DSI84. I know for certain
> that falls into the category of needing the DSI bus initialised before
> it is brought out of reset.

I'm actually working on this right now and when I received your message
I was about to start typing a reply to your patchset.

The SN65DSI84 works with the i.MX8MM DSIM even using the default order
of host init after peripheral init in our setup, but this configuration
doesn't seem to be stable and occasionally the bridge doesn't come up
properly.

We are still in the process of verifying if the reversed order fixes
this reliably. But regardless of the results, without the reversal the
initialization sequence is way out of spec and we need to fix this in
any case.

See here for my testing branch including some follow-up patches that
improve the initialization flow for my setup:
https://git.kontron-electronics.de/sw/misc/linux/-/commits/v6.1-dsim-mx8mm.

Thanks
Frieder
