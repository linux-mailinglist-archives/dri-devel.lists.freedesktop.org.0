Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4E34F8B2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAAE6E183;
	Wed, 31 Mar 2021 06:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30071.outbound.protection.outlook.com [40.107.3.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EFE6E183
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCxps4ufb2uslf29tuttXFFIrVUabduBneI+J+RbZzkosIFMDEsl/CGznDH6C7b4VKgf5cKuYw7EEZbcVmKVLv91jslkeOldaoELGaV7zw5prj6LC65XY1QY/dTavBWP3flZJs/PIC4NAPDv0NU+nSiYEQuieAasa5Wl7uhZnoQ5nHI/HDD3bYBb7Ddw3pYOxn3/0+viHp704yAEzTQrscbKJHn1z3zJgrA8izsMZRFfD86Gns+MAKCsyT941teyozynwqD4qEx2NaUJOQ3b5duqX0iQxRl4O8NT66Akr4VGVoUjfO5IERYlgQmvlNcATPGNV0Z+DlwBldFRMA3sVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeFv5jlkJhoQzc8EJ5r3HmC0mJCTtGjtaDNiqO932k0=;
 b=K7f6olO9cbnGMq9Sjg64MshxYtI7rejLeN6MGAa1ve4fMWPcSYzdIR55paIRuSby9urJFEs9iuxfMFSE2cdS1zriF3/KQlV+hbEd+MFpNUo9Qmqu+jBjhB/pMtHZeS1VNOlnvfksN8jPLPxcPrNyyq1bAyeEix0jwd9R3qLuk8ZenY2lqTUL4pRmghRZ3gBW1awC3nHby4edNPplpoNFxbnP6DH90obZde+MsqHB2WVUiNoPJF5krPHnjvp08rMrZrvkUK+hbrPFWG5R+SMorQ1OiYARLX6T5QV3HG2jm36vt14iSIx1bMCR8emtNkqBys8SZBXhQB2AccIV6skhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeFv5jlkJhoQzc8EJ5r3HmC0mJCTtGjtaDNiqO932k0=;
 b=er7hN2samhtWaVl+yUcierOXULulf2eTQBldOYYeb/hvj3R/p2ZMHkx5/ymSWFjmHu+rlzp5FYVnwf/ZeAtetxuAZ70e6WFjnxTFkV55rWI/YtiNJzXLYOxlFgqFsByKORjFTfSEJLXX41ZPMyMBKutk0PE9QiRPFwoH55dpHh0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 06:25:34 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:25:34 +0000
Message-ID: <e84968df961d2bb9237f00944035bb7c7862b448.camel@nxp.com>
Subject: Re: [PATCH v6 12/14] drm/bridge: imx: Add LDB support for i.MX8qxp
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Wed, 31 Mar 2021 14:23:59 +0800
In-Reply-To: <CAG3jFyv-_WzReTAhq-2EkSWev2YdZo6KiHwzXdaQLmNAHXnCrQ@mail.gmail.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-13-git-send-email-victor.liu@nxp.com>
 <CAG3jFyv-_WzReTAhq-2EkSWev2YdZo6KiHwzXdaQLmNAHXnCrQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR0401CA0003.apcprd04.prod.outlook.com
 (2603:1096:202:2::13) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR0401CA0003.apcprd04.prod.outlook.com (2603:1096:202:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 06:25:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a5504d3-5e64-481b-34b6-08d8f40dca4d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71820FF10FA37428CA112272987C9@VI1PR04MB7182.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0UtWa9PfM0Ncu39kOmEEaWkFNjQoumSeXeUkSVDDO/Olm3GYgoY0DxilJ1rnPzZVCXTV5zmsuiMWTN86PPftqZNMXi368Gg+BbwHqCgitHGVlIRiauqesNU6Qt1vF9Gjuir/K5bczRIZT5vkhB08b/dRz5EMApwaQnFx/zh9TAl9wANg+nvrLuqGzfTm92po209QliN0xcPcnYlWd041hQfITq8bW0O0v57WjvBGGy0du7ezZXu8cv4NzS9ud8UIj1zeDnOj+lt/aJSBeGTk8ri3NRxjp4TaOoivcqsgZWO2XVeQLsifUASKeelqyc6LdaqUv1FLT8yqZxqt9cHE5464vFIJJc6W67MnkYgTD2hNt8iZG8SyoYb08Qtqia2APH9sqAsfz5WWqy6yeDzKc1iRPuri+06fQy/meGGL7x3eRRHLoNpWLI6wzLbmJXRkPXlrBdQLELBfxNETX+w1JrbTWLRks+EFLdf55SyekN0Lq8Kx/Dx5Qh0Oh16cygl+rSBkXokgyrRk9TLAH6fKdCEZcr/TSdWudOIIFJ6eofA6M6qjJKCa7KZF5R1/jAEpCq89Ghiyzr0UdE4T5pnczp0nPNEH2j5dS9c8TEPTTuPXhGT/nwxznG8dIKeP/90iqaGy/18HQ809VYUFQtD13Ctax6Czo3T33Pk/pLkHec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(8676002)(54906003)(4744005)(6486002)(83380400001)(36756003)(4326008)(5660300002)(6496006)(498600001)(2616005)(2906002)(86362001)(956004)(186003)(6666004)(66476007)(66946007)(7416002)(16526019)(66556008)(38100700001)(26005)(52116002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1NQZG1KZ3hsOWFJUzdJQndZSDEyT3M4elY5ZjlCTVVyR1lBK2ZpRnpZOTdl?=
 =?utf-8?B?M3VlYkJCejF2MHMxbXJ6c3BTbXNWbXRWV0pQM2lUc0NaWGpXSkVQUFFnSHhQ?=
 =?utf-8?B?TWw2WTJ5RkV5NFVKSGxoOUZ1NE94OUtWVEdwM2FvOWUweFlFakk4NjhvMzJN?=
 =?utf-8?B?dVFBa1N2N3NmQ01xdE1EWERPNmR0ZVh2U3VaTkZHVXR1b1J2a3RIY25rM2Zi?=
 =?utf-8?B?YldaNlluNTQ1Zm4vUW9oVS9idDRGUGdHZFZqalNBU2hLT251QUxmd0NWSkdE?=
 =?utf-8?B?S2FWVWNRTzJVcVdWcHBvL1VjK2xoTy9vb2p1NkxrZ0ZSd21hVGVKVDJoNUFC?=
 =?utf-8?B?L2pJS1BFMkU4eG5xMGIxRmJUbWxhTG01c2VBYTNPR1RiMW90dTJwd0QwN0Ix?=
 =?utf-8?B?cEhJb05DTm1EUzlkRW1Mbzg5bW1qTXNIRGxQTXVkU0wra3haUzdNQ0hVY25P?=
 =?utf-8?B?N0RwUUJkRGl4ZGlsU2RudDVBQTBpWGlpL0VhcTdXUUlqeE8za3JBRG9aRmQ1?=
 =?utf-8?B?bEhHdjFTYjVQL0x5OUF4UExKa2RId1pNSUZ4ZmZRdkMrT2NQWGx6RWQ1NzRX?=
 =?utf-8?B?OXlRVGpnNFJqR1Uyck9yVmdjakxQQW5TWkZnR3RMNkwwNVNlZ2M0aW9pQkZz?=
 =?utf-8?B?b3J1bnhvYkRlRTZJeVJpMmRzWjY3bGdyNmlYMllpaWtlUzljaGNmbVE0ZnB1?=
 =?utf-8?B?NkhrRWl2Ry80MUtReGZSeVlwaXVCSW9YNmVWK01NQVpDSCtsc2xRUG9ldXBm?=
 =?utf-8?B?UFY3c01sQ1ZLMTZ4bjBhWWJyVGh2WVJxZDBHQStyU1d3UG5RT2FibWJjVGh2?=
 =?utf-8?B?SGJsOUpzOCsrUS9lMTkxck1xRmxCNFo0UkFYZkthR1VwRTVkWGE2dTJscGkz?=
 =?utf-8?B?b09HaHErSkxoRDFuTzFmaFloV0NLcElzUk8xeFFXc0RDdmZ6NVpOODBaUmQv?=
 =?utf-8?B?WW9zUjBTaStOR2VDUUQvcFRtekNqUko5WEVvYzRyUXB2UUl6TXZDOVdMNVE0?=
 =?utf-8?B?a2ZneHROUjA1ZE4yUGtQYStLMWQ4UUExbEIwc3c0Uk9FZ0twUWRHc1pqbGUz?=
 =?utf-8?B?UDNKczJMcU5SRlRKMGNpTkQwckJSRDVYV1U1STdrTU1pSml4NllubmIyWFBi?=
 =?utf-8?B?eVpWZmxJbHRUc0RMSzFuSko4ZUlBb0FReC8xRHNnQmdJR3p0UlVHUmszcmVx?=
 =?utf-8?B?NlZRRmlscEllYURvRVErVGJjd1I3VHZncERQUGduYXg2eDduRjBDR01SS2pv?=
 =?utf-8?B?T1lCUzNWVk5LNHgxTUNNU05ZQ0p2Q01QUEw0K2dLbzl5b1ZTN1hjQU9JbkJP?=
 =?utf-8?B?WXBickV3ZklCOVMvZyszeXllZlRwWWJCUnB5ZXFDckR5SUdEZWRCTzJaNHlh?=
 =?utf-8?B?UEE1MzBRQWNXNUt3QnJ5WHpLWnU3S2N1UkhsU0g0ajYxcmpTdDhsZnliODQr?=
 =?utf-8?B?cVJwanJmd3l4MlRCNjlWdnVpNS9wM0QxQ1hET25hTDdhWjlXRWxFYTVyTm92?=
 =?utf-8?B?SjU1eVNBZkd1Mjhta0RZSmRnNU5PUjdiVWxWeGRPVTNZWWdzRWU5bkxFTnlx?=
 =?utf-8?B?SmRUQ2JlZFYrbjAwZEpSVTJ4dEhDQnp4KzI2RFR4TWQvakJxVE1OTjdBZDBm?=
 =?utf-8?B?cEpKVU9JZERHMFcxb2t5amxoU2pMbWZZZ2pVb29Dbm83YTlaZCtObkFBUVEv?=
 =?utf-8?B?VC94WmhKdVFmUGNWU0Y3M2xmUUh3V1NXd3BLWmdrQ2JxdkhTNFBmTit1a2tC?=
 =?utf-8?Q?MRnUfxgdgk6GSK8AX165D0mrGqhe1h337VkDSRf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5504d3-5e64-481b-34b6-08d8f40dca4d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:25:34.2212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i96x2O4YWWm00tXtmKrULgMxLwlouaMe2SrhiMEnPDV1yC5jdq1aH1TOIW4yN2S25Sb1OYVaGqdm8KKxdlf8kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, s.hauer@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Tue, 2021-03-30 at 11:59 +0200, Robert Foss wrote:
> Hey Liu,
> 
> checkpatch --strict lists some nits and a warning. I think the kconfig
> warning can be ignored. With the rest fixed, feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks for your review.

Will fix those nits and that warning in the next version.

Liu Ying


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
