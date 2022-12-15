Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC0C64D81A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0F10E501;
	Thu, 15 Dec 2022 08:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2098.outbound.protection.outlook.com [40.107.103.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0036E10E501
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRrtEaJ2koV/spRz0VOwxKXc9pFX8+AX6dYjHiu4Zuddq17F8Dogpu/yz36ztTECnSzyA9HqB8XTuFRzLA584Mqo9FBrapYiXtmzwylIskCGe4ZqXu+gRFItNHrb1IQmn4EvtKXe6Eu188o3NqJnpjXTCwkCtt7RkZNHBRGdo2Ss7dk38b5SWH7H0r5AagcgL3ViV34Y0Pmt8G/WNogN5g6Cwl6hyg7br8mkVg+Rnyii/+fxYn+fD2TZGp4ukC4/0aFww7XkP5jDF9rBuMBMaIgd7HUK6OKYm8BNRz9UxR36gjoIUhZn1n45ewB7uxi0ny5dyXlX5QGxeajK2YMaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEdPVCLd+G0rZ1oi85FqUcPhW0XPZu8Ldu31+hexhv8=;
 b=Z6yDE2GQuSbezvOOkFmtSesysRoWU4Be+zfS8dsykI91pYctv8gkC3y53goI6zCDjKgIkbIzpWhxiFKqJLofvEyvWx7oXjZXNvSuztrCKuqzyi4KEPtnbNSd1WNtyJjx6wG6GJbUaTK6pljra8Rr54P7grbV5wdMGlVLSqOEfnREsyTiy9bOL6V6nJGePSxs5Wj2hdVIjxQqIm+REAN9K2ybqWqf5ziTHCAC1dPufVKjuG4VSizqCHcrnsNpTfsFXq5No03kNrIjQSbon13Vtqs6eAOm0Ezn2NQxoGGHot81Iorj7Vw8FmXlRUiTtS5M/G5Y6VTzV05Wx6mVBQLkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEdPVCLd+G0rZ1oi85FqUcPhW0XPZu8Ldu31+hexhv8=;
 b=GSEMPQEK/f2jgMXp7czBlhHcY5ErgaRf4iVMjrDfbnG5YQQk25K83IHSeS4EUByiarJNY5WgdqJilofGobvJTwCSgd0FbYJgLwBZBmgoh2QPVmPZlpCSsXPFjd7ijTPEBvMDONFPgoGSa6faHVrJ7M2zW9tpkapGSPKi6MEs3n0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA4PR10MB5779.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:268::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 08:57:16 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 08:57:16 +0000
Message-ID: <ebaf869c-feb9-f546-9dd0-0795b64c0329@kontron.de>
Date: Thu, 15 Dec 2022 09:57:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-12-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221214125907.376148-12-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA4PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 6377c602-2b1d-4953-7e7a-08dade7a5d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+W6R6lN9vKDNkHlXJ2PhFFzLmh4KIMTHLNRViyUd0hcio7JVeBr3sZ72S9l90Dm+XGlki8/qJ9tqIWKiYWLShr+jkYxn2sw89U6rd/gA/XO+AffCn7mNGbhqozqcfVn6/8vtUDblYIMG0Rk/p+CR34FjPnKHm8gA0pseZUQ9HhRvhfhMxnJN7zUaOxkIaaGX0Hpj93/RtrqZthXsst/I37nehXt4hAy+SYpY8yo8KlG4wVnq5MhP20gbWd1suUJvX33SRBxfFhlpR3AxWf6svBE2yQ2rIo4rmPKnDcXmr0T6Ra1cE8DF1VxlBX5V2c0jK80A9MhSJzBKYC6MLZhU1WOId0d0v8nbaaXJ3Tqon1SxTLOTtUK00zYeQ1WpQzzETj06Is4rgJog5reMpeROgHTfR86iFTEHSYh/BrYAlcausFTr6KTBWhh3Of2n8Q4s9d+S2JGF+7+xLSa9tu5JFIKBJkZBy7LX8GD8mkaRsHRnVrsnVWDgat/XbJYPzY5DYA9sIcy4PAS6Dc6HhbP9j7VkUrlbU9kgN+Qm+TkL+NXTkBQfV+ndYLVGDAAKeku754ibEuny71z2yvsgnfODLBG5nip1Xa3gC/RQzg6krk9aZDdUAcCWlkjq1pJZQeemV3gjD9kn5V0jS89gC1oG72E5ZnXUL+X8Defv/CNAHRLqS6jZrHB8n880cNplx6C/GRUNbb5ikZDjSmmLTXEFGhyKiS6+xfTym/rFpCds8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(6512007)(2616005)(186003)(38100700002)(53546011)(6506007)(36756003)(83380400001)(6486002)(8936002)(478600001)(31686004)(41300700001)(316002)(110136005)(54906003)(2906002)(66946007)(921005)(66556008)(8676002)(86362001)(66476007)(4326008)(7416002)(5660300002)(31696002)(4744005)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditsbkEvdGNJRVZGS29ORmFEZFAvREoxUllibVJUYXloL2ZOeFRMbkM2VXdV?=
 =?utf-8?B?anFTdXduYzFsd0hITm93V2xTMlZXNVdSNzh5K0lPaFZtRzl4Vk0wUHVoOTF3?=
 =?utf-8?B?S24rTkd1d01SUlZpZGhYNU5HcVl4Uzc5TWhHR0VNc0lUNXpicy9zNkI5dzRD?=
 =?utf-8?B?MXg5ZEhYaEIwREp2WngxOGpVSVRWUGZXWVA4Z1J0Sk02NUJlUWFwdE1lelho?=
 =?utf-8?B?cXNEV2xzcmUrOG8zRFUxdDcwSkc2Y3l2ZU92UGRiVWpIMXBLazgxSlljWGdr?=
 =?utf-8?B?WFZwZEZKUUpkK3VGZjk4Y3NPWDVuUjZVWmEzeitwWnpIUCs5TTM3Y1pNSzVJ?=
 =?utf-8?B?QkdPODE0Z3NITGEvMDEyK3I1SWgwY0lFTFpkVGt3bko1L2lHcU9GVmtrQ3do?=
 =?utf-8?B?dlBVS2JWSnp2VTI3T2tXaWJ0bU8yWGY5azQ5Slp4UFdGc2cybEEwaWFwaFh2?=
 =?utf-8?B?T2lZM01MZEVvam4xRno1NFRhV0s4a0VEbkRWeTU2ZWJGcVRCd25KRVJVNUZa?=
 =?utf-8?B?K1JzV2dYWlYzTnRBRGJFTVRQVitDQUN1YkNOSkRhOWc3bHY5SGlydEJHdEZL?=
 =?utf-8?B?VW1Dd2FFeFlEZzVCNmM4bmI1Tmo4NWFvS21yaWd6WU01TXg2VkdHNHNVR2U0?=
 =?utf-8?B?ajBackxuUnh4Qk1mYU45bjRkY1dIMGJuRitra0Y4M2Jwc0hiZXgyTWRyTlJ4?=
 =?utf-8?B?NlpWVUxVZnoxOHJEd2FpR25veFUvMEs3WjhJM1o2MEVaeXE0V0hwMkNkMGNi?=
 =?utf-8?B?dk82VXhHdFRLV2NKODBmSktRU3NFZEpidWt3WW91OWlWZ1lwZWMvaHBOS3NL?=
 =?utf-8?B?bkFEN2twN2xiV0w4K2xZNmFoOE5Wc1Jwc3lOcUxoWktJWWQ2d09qc1ZpaDg4?=
 =?utf-8?B?M0Z5RjFZSDlvQmZXZ090U0gxZHhITjRZbDRjV1lmLzhwVDJhUkYxbVZlT01B?=
 =?utf-8?B?LzhlVjJmNlM4UlFPaUtYVXkwS3dVUWhDNHZTc3BOeGV3R1ViQkNyQXFuR3ht?=
 =?utf-8?B?QUM2RnEybjFTcWlmVzE1OHFnUzZQT3F5a0YxSU5Xa3JNSnRyRWJpNTZsazlp?=
 =?utf-8?B?Z0RITTJMQmtnT3UyUDd3ZXBONVFkd3B3ekxTZ3gxVXAzNkVtMW1GR1Brazh0?=
 =?utf-8?B?OW9FNEpKc2dOdnlrN1lIREx0eHZsM0JUQlhkdGdnQlhIazhaWG5xTUR3alVN?=
 =?utf-8?B?cjdFTmlqVnFtdy9DMURPYWNUUG9KUFcyaHRKTlhsVFhWSGpDUUx2WVEwTEJi?=
 =?utf-8?B?TGFJY2l2SGpiNzlXMXRPelIxWW50TndJeHVIM0pvRkRjc2NoUUt2YlZZR21a?=
 =?utf-8?B?dWNwOGRZTkJDSWdxM1hxSHM4UzBERG9uZndSak1BUUc3Z0NTTjdHRERSanQ3?=
 =?utf-8?B?WDdTNDVMOFU5UEhQaXRTek0wdlNkSUluMFRwRU9XMzNFd1JwOVdacFhZcDJn?=
 =?utf-8?B?c1YrVm5JTWQ4SEFkY3NCVWhNNERFT1JkR3h5UUJNVElxOFJ6THQ2bUwwdWFR?=
 =?utf-8?B?OVFaSkhINVBoR0Q1cE94SzZGWEl1blpyVy9KbDR2dmhIZW4wQ3M0NHpEU3U3?=
 =?utf-8?B?VEIxNGFwamtmQTRGVE9ZbmRiT3ZJZExQb0grYkNRZGx2SjNmL25XZ2Njb3Vx?=
 =?utf-8?B?MXVmTmQxQ211Q3FUbDdXWWJBaFUreFhnaU5yOEZ6TFY4Y0krWkFSeURnQ3Vu?=
 =?utf-8?B?WnZnNzkrU21CYTRuMHR0MzJKaVgwYVJGRE9mcHlGdU1xaXRGTjZ5Mmc4aDdJ?=
 =?utf-8?B?bGhLWjdBNHpjVkVwOXpXRFNzZyt2b1Y3NDdGSjdIQmtjQXpMR1NNd0hCSVhi?=
 =?utf-8?B?TTFNNzZudkphbzlnMmZsU1lZS2RiSjBYL29QOFZWN0EySG81eXBUSU5DNXB1?=
 =?utf-8?B?Q1pNV0d0U284aUlYc0NDVjI3WEVXbWdzYzJRS2NNUUZuc2R5cUlFVFV4bGFC?=
 =?utf-8?B?Y3JIcm80MmZHTlpEUHg5cmxUR0R1TzhDSUM4SDJZd2NPY1hRNXNSWGs3a1Bi?=
 =?utf-8?B?dzhqNk83RXp5cnRTdTdxTzMwb1hzYVlQdHkvN1ZzWGREVE9tSmpEUTlVMDVr?=
 =?utf-8?B?Ly94dUhNaVBDRGVTcTNOMEJScmRUbWViZDhpWFVQNEdpRDFkV25OZXcxUXBq?=
 =?utf-8?B?VnRzUHhZa1gxMGJHVnc3dHpQL2l6dUpNQXl3S01lcVhGQUdtV3EyL1g3cVpH?=
 =?utf-8?Q?voaHdt/tyDDgowce6uiNewJEVNXWK11fwNYFR3I8aj4K?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6377c602-2b1d-4953-7e7a-08dade7a5d60
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:57:16.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFpV4rf82J/+Xc/26nc6JQXoOuRXyNG5ZF8D89fABOgH0GfdkZg1K3IkMWuDBbx3DtcbM0yJuypbuLPhoRsds1zHvO3Hn+0yiCk1sTR+Kao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5779
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.22 13:59, Jagan Teki wrote:
> Finding the right input bus format throughout the pipeline is hard
> so add atomic_get_input_bus_fmts callback and initialize with the
> proper input format from list of supported output formats.
> 
> This format can be used in pipeline for negotiating bus format between
> the DSI-end of this bridge and the other component closer to pipeline
> components.
> 
> List of Pixel formats are taken from,
> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
