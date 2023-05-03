Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6316F5ADB
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75310E2FC;
	Wed,  3 May 2023 15:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2138.outbound.protection.outlook.com [40.107.22.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65410E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 15:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I93LjJG34ei8E00o1K/r+gfVZlV74se+PCorm8gcJe1TyGRhofJigfJfLsN+celQAzdiKvkSaoFkN/6vf64E4LQ5dk7bNGQxCBmrkiow7FeO0QYBJ9IVbfdcVLimjVsOG0/9LRnwT7jajxEfj3SgVwVXnVPJduCl2/QNsm0aqLCITyCOVJ+scViKmO3DfVCL42o4v2MUsD+MPQ/fhLtNlmPCcI/melo0dd0Las5Df4aWNZ0bCoCxJdC5DU7TyfhNPGnkCSVTduZVQEKQXGZeDp4Rb7/PqH2GINa45vROCGLkVPbB79vR9LQhd9XfwkvNeWL/ZnSv6kPeMv7vXLi7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5D2vOUjtzIhxdVaNKaTZICYdeOLFKsxvvqP12BW06e0=;
 b=IPYY721b9vSnGwZsHj3PMiB4l7rMUMUjx4kj9uMHAfliLbq7leOEgxIKAk/1CEiu9Ixe2L0XcG3J9th+LWMz/0t7GDioF3OJf7hXA/WmHQFMm066fTt2HLk1WPLwE+GLwN4AoCG4QrJGRVLxQRKuyFenr998FUg3pZy2BwBmg2fr3masHFYrtkML6T1HF3icq9mYSlh/UUBcnqCb6qzkW+DV0RXIAEHJaaM/8jp+sE+YWUcwKMuod2MCrAXnpDfpw9ObaKS+71qtXHPj10ZAp/dL16ZtpHVSffFPWl22gTiqPoZoinhQMPlEWXuVudSXdJc/NyxP7BWne70WgXus8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5D2vOUjtzIhxdVaNKaTZICYdeOLFKsxvvqP12BW06e0=;
 b=XjhKt8F0rkAUy1p6If5seA26xZyphLMsgVFK4ZgmMONkTk54/mUQN/mSawmd03QTkNZuxAN1c4BGWCVpc/rLbkN0wA9npqRbbakgwQmWUhfKy/+w0g+6RuiJbNeD0bQukhL1B758nLNU3FEVx2JyuRC/CyCnQdFC8roqeYOCUJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:21:12 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e6fd:d174:5710:fb3a%2]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:21:12 +0000
Message-ID: <de362e07-55e6-91f6-ad58-12d65afa398b@kontron.de>
Date: Wed, 3 May 2023 17:21:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 4/7] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
Content-Language: en-US, de-DE
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-5-aford173@gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230502010759.17282-5-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::17) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3487:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9df33f-8b7f-4185-a081-08db4bea07ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yTx0yqCeWisLCKw83KmSOLAPWr0h0MyGuJhDOQuouNIyILxKlY1Nc6UQQJfmB3+UKEAI4boy8dux5DvdmFhSC0Gebxw7THh5rpLY+kyRDAqL/R8AWQwWBF2RzvkxINkmtOPRcoiTf64bYIobCS2D4Xkyk9K9xETDb9KlbGVPUfeBlDwTY54PsMZKUP03RIBV0hUiwML2DpkPTVdwQMsH9rmUhaT3wVcenAhhavC6hbFYxuAVUV9NJ4j9JPSlc3k2j+BjmeNzeVCvuPrSifvXNWrGLRhWW5SXCo3pHVQ6Abo23nr755Sd/c1y4QuAZqBqeVUeg3CYX0RTXYSX2ZSPw8Jp2/fhKlzw7S4WrDNe94LP6ZeSyXn7H7/GQMq6350fxGwC7+PXJOSfPTJa+LNYe5YIaXCGZlYqky9dVlel/aK7DzsErXuJV5z3QNfhH510YHIwkvmYlV8gSwyKZ0cxPDGlJz0Kt8HgZekXxpXBy2baKwryC95zLP4D6RxC5Ys2Dkr1uUjjOCFNvjk15VGWye3ySpyfDAB2YkvRK6iZm0LbecIV7D7c1PFqv8A1tzlL9b+f4GIvtv1E/T+zeadtIG43kKPFJgUMW8Qbu6fC0q8lpO+JXW1EqeWv2yp7ZAAnqtGI3BwXjWrCEq59NTkhFC88u15zl8ingK7wXAwgI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199021)(38100700002)(4744005)(86362001)(316002)(2906002)(36756003)(7416002)(44832011)(31686004)(8936002)(83380400001)(8676002)(41300700001)(31696002)(5660300002)(2616005)(4326008)(6512007)(26005)(6506007)(66946007)(186003)(66476007)(53546011)(6666004)(478600001)(6486002)(66556008)(54906003)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09PdVJoMGZ2UnIwYytMRy8wTWNScGNrbWc1eVc3Z3liU2xDUTNTc2JWUkZk?=
 =?utf-8?B?MHpGQ0ZZUDdBVFpZWjRYM1QyZS95OTBnMmZtYVhDQkk5cTFIOFcxL2NOZlB2?=
 =?utf-8?B?S3RteDgxdExUcjVqRjgwdHo4d2JrTkZ5aXFnK25USXVWZkhDdUNZZlRnSTdE?=
 =?utf-8?B?RWg2M2FzOTZ6clloS3pzSEhBdUxRSUt5cDVVZ1hUaFJVUDhjSC9jTVFwRFcx?=
 =?utf-8?B?eitpYStVTGI4UE9BaGRURmJBYmpISWNKcFVZN2poOVRJQnZOSkRZTmhLNHBz?=
 =?utf-8?B?T09BSUM3SWhKWUZMNnM4UTAvTUFxZzM5WVI3YVUyRTBNd0trRThXblpOL2hQ?=
 =?utf-8?B?L2tKMUF0NUZGejJYamFyQ0hTc1ZGd3pRVGJ3ZU1kcElMSFdkQnFDL1hJN1Iv?=
 =?utf-8?B?aSs3S25NaEoydFpocTIvc3k2eUM2TTFaeUdHeEhncHF6bEkzZ3M0YzVlMDZJ?=
 =?utf-8?B?ZTJJU3ljL21tWHFKMkw0ZGFQSEpkb252a2hvZ3JUeDBpZTRjSllFYm5zd2dZ?=
 =?utf-8?B?VXIwMzROTW5XOWJkZUJubGJoRkFRU3ZOMFZXK3JnL3hrUzRHNTZTdW0yVG9o?=
 =?utf-8?B?RkZaZ2tobkJFSGFOa3dpbWVha0FZaTV0L2QzUy96SEszOE8zaUxJYmRWVk1r?=
 =?utf-8?B?bnBabCtidVRRSVJzNmNMeGF1cHB1NzRKY0EwVWtIbUprbkFpbmtiRzVYclBy?=
 =?utf-8?B?aEV0bDJhd1VsbWlBcW1rVGNnN2RRckhweFp0dnNRdm1UTVdwb2MxMWg4bUpN?=
 =?utf-8?B?M3BRUEtLT2tIN1pvUDFhazUrYUx4QWpqdlo0WHRkK3hQbXJ0dXBOU1c1Qktr?=
 =?utf-8?B?RGcyaWU1bnlrL3RVZkRZaGFjamZjNGZJeURwL0txK2FXMjRaclJEbkdvbE5s?=
 =?utf-8?B?MFN5c216b2JiOFhXQzczZnViNWpaUWVyWmZjL09TcGpSNk0wYm1pTEcyQVho?=
 =?utf-8?B?T056UmRRN2lLRXRMWEtwdm5YOHRRdUpVVkFFMEppdFQ3QzJySTMvSzFEbGxZ?=
 =?utf-8?B?SVVQUHZicEp1M2FKQ3lVRVRVTXNPVFBiQld5SXlnaHdrejZRTkxXaHJGbWVM?=
 =?utf-8?B?U3FaWUhIRElTUUFYcWZvdXd5ZVYvdWQ3Njd5bmVZd3QxVGxKVkNsQVB6MkJM?=
 =?utf-8?B?YzFZV05NR050RUZKazYzZEFGUzlvUEpvSTR5RVVCZTVmbzd1N1RnTGFwY1FB?=
 =?utf-8?B?cFczbjdhYVovd0NiV0l5S0VneHRiRjJkYmNYSDE2Z2RaMDB4SktROUR1Mk1y?=
 =?utf-8?B?ZGdTcVh6RUZ3bEZERlVESGhWbWtadERGMHZLZ3hPL2IyWjZLcWhsdFpQRmJk?=
 =?utf-8?B?a0pYSE1nWkpjMHY4SUJYSkZZQmhsR085bFM3ZHFHZ0R3OThRNTJSaEFjaGQ5?=
 =?utf-8?B?MXBYeGl6WGc0aWt0d1JRNXN1czBGcXdwWVdPZW5zYkJrbWFZVGlkQmY4QVkv?=
 =?utf-8?B?anFoZDFGTW5lNlNhenBySUdjYlc4bi82dDkrcTlFdVJjeVkydUtRZTNPL3kr?=
 =?utf-8?B?enhkVUdkdHZZNktjV1N2dEN4dlo5bnNkN0NhMzRkc0VoYU93b2FyZjc5VFpK?=
 =?utf-8?B?QWRrMXhXRHU0SC96NTZmZTdqVXhJcVVxNHJyZzMxMWlBT2ZFTmRnRkZwRTFz?=
 =?utf-8?B?S1JwcEJmNWFoeGN1dys2WTYvUzFheFhSQ1JvbWNFbUkxWmt0REFCRTFEZUln?=
 =?utf-8?B?Q0ZhUXpvTlVvMHhKRU5MMTR5UVlEblVGSDdLdGduSHdtREtzWTkxaVBlaGQ3?=
 =?utf-8?B?ZU1VM0hHZmNJRjMzcVIxWk96NTlpR3hYWE1hUnZFb0I5ZkJBOC9qalpkT3hj?=
 =?utf-8?B?ZStkNW9QdzVSSDl1blkwTEhNb2I0WUExQW93am8wTVovTFd3TXZLMG5Ca1FG?=
 =?utf-8?B?dzlTU2Z6ZkRlckpIanNEazhEaU1ic2V2ZEw3WVVzekhKbmREcXBVTXh5b3Za?=
 =?utf-8?B?QXptanNYNURJZkt5d1ZSLy92L2h0SFBrV01NT0xXM0JLOGl3aUR6NHA2aVE0?=
 =?utf-8?B?UGRZS2lwcXVEVE9hRHdKc0grNXdWUVZuT25La3BRUkFqT1lKT25yNUhXZ0k2?=
 =?utf-8?B?L3YwYVdpMXpUU0pHcmVoY2lvdzBHWG9IR2JrWlpLSWsvNjQ4cDIyWDE5RElK?=
 =?utf-8?B?RDJ3WllqemdvdCs1YVQrbG9KMWw4QUZ3Z2Jkekh4dFlzdEFjd2Q3M29QMXln?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9df33f-8b7f-4185-a081-08db4bea07ab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:21:12.7587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWRTIXkpdUgK5egZMQypN4XeF1ByW+f6jLssECL7wy+crLgTUA/WwpgpTRODwo3HZoPrlDNS25s4SHHQplDoiqMcOirofSLl+DyDK56qdJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3487
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.05.23 03:07, Adam Ford wrote:
> In order to support variable DPHY timings, it's necessary
> to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> can be used to determine the nominal values for a given resolution
> and refresh rate.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

This fixes the build error which existed in v2!

Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
