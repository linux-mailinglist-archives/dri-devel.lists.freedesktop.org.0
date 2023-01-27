Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F004667E254
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D1B10E44D;
	Fri, 27 Jan 2023 10:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2113.outbound.protection.outlook.com [40.107.20.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0D310E44E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjldpQGmY3NtNuZA+2AQ1cUymwTg6s79kYo3rGKSN+cnDfIiMoFvPMf9k9KPXtooH1Mdk6wdffUR+AX6ZU16efFXmjNUF1AqCLSpszdeeoBX/uG01psKA47VnL2sgDAGo5j71VAuLGs5MmRbRbVC9zoIDTMEOn6sM0gEDRI3oOx+IaWCnY9S98jO39P4vs1cIFruwaTg/dGk4p1v1uUdZP9hM+qWst1lK14gDBV9oCm6+aCGVc/QEQyxn+bh6QTQJVIK6dTBd28KbHhp1Az3g+L+D8nKfe27PJLi2fB8l2o9/5BG/P/QSuGWtCWzlaGD6gW5cRA1bg+0X8G/Ae5BZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKENEnB9YXhGywXSpj65r2+uzjJyoYeW8UZwdeI56uQ=;
 b=lIDyoTz/1eqNxSgr11nM7ubjA8Nao9WGHsUoiOZY0vVErMfVHHl6w1VXSIzfe87bWF9bKw5NZmXkr/3hZAIbOpxgVC1IiWy+g3MPgmcEirPTAVjbyZT4TNjTTTZiYU3+RYPckobs9iqJC0PoyGQ6aQcNjzJogj4xcawvMq5pkeX59k4mQxWA0Sun6L0rTglhrv2fH8CW4THLDC6vDKD193pzRRxpChUDyEy8jzmosZMgKHRB7XPa/K8MR5s/TS5UGVCBup9ImVHeq3k0R7SWdGVWXjMSgFAV+m2BrA7l4SINJ1EXt5ii597oE8oXzUEZPvPttqjQxHPvgdKvbCCJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKENEnB9YXhGywXSpj65r2+uzjJyoYeW8UZwdeI56uQ=;
 b=RJWypB5+YlH6PFJszOm8K/arBxe4n0TZnUfZ4b1sfghC5iRJ9uS3WlfBFwdCGbiml81uSdKpwncQu0c8+qT2Ca5g+zw3M1Ul2AyvPVkghp/v5cnGGq8oocOfhJNnqaH5LRFOAuGwg6dHh5fOrtfnaZ7xjN8AZ091Qc9WaMJVM4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DU0PR10MB5752.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:323::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 10:56:23 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72%7]) with mapi id 15.20.6043.021; Fri, 27 Jan 2023
 10:56:23 +0000
Message-ID: <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
Date: Fri, 27 Jan 2023 11:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::40) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|DU0PR10MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 74dda712-23b6-4185-0707-08db0055210b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpnrtIMtXORjyZnG7NuNogdgLo1XuK0tcnlEtvWp7dOi1x7o5nQLmqYsILNqdVwgAXw/eEqpdiMbtkNKxdfc9nxPrXmG23ygtDDjMKyfH9odhE/GAuVlHCZmmn8cX7fd03EEqoRfRpSg3cdiZbbxIRXj7z+IOQzHnbXq+OiGhJZKY+xqSsqmrvm28ugongRE/+MXZRNJaV1Z/+uC0WCBkjLV1xbKbU3d3MWgvawa7nVMdOopgNhsqFYVCcqzAkXFxlnYW1xyxaOoPKlUCsmtL+gbNZEHwb2kN9gopeMeMN2lrEBzTiSol9214OOCA8CYrc0C8WLxBvqc7RhSjKz69Bl5OjGZepwMmkTDvTcSXSaZrMIxxlymUO8w4DrDFavLHKOAz/T9I44o9R+BtEh7mzon9rNnzurNqpVajhw8Z4wgt35MDcmNp2u7UfglRoZ5w2MMoULx0mfJbyu9Yp7biVHfN/+S9lxojTrag2X+BkO7WOZLn2aWHsk+kC31QFdwz3dzWjnT+GK9qss1zixSY1299ZYLoolq8X7ZvmHvCeETFeUUFcPl2xTgkswVJRGfhaDIAoxueuYW2vg6ellizTMhHfAN1LYMuiSW3v+kMdVpiODc80AYd/yyca/HdX5/IFp2M34wwSZsY3EF2Yx1Fe40tF46npZuxMOxlHU8iAvSxJrc0D9w0SZPN1VGofxUc/SPbaw9owIwelObZZzUc4++1RLZ+C2PxLCCqDry8Gl6HT5ZUvC/frMDYz3UlSftKl+yg0YSYnttpD5/kCVmJZmJMq0Q9rr0AS4vO3Z6ulQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199018)(4326008)(66476007)(316002)(66556008)(86362001)(66946007)(36756003)(8676002)(53546011)(6512007)(6916009)(966005)(26005)(83380400001)(478600001)(186003)(2616005)(8936002)(6486002)(31686004)(2906002)(5660300002)(44832011)(52116002)(8976002)(7416002)(38100700002)(31696002)(38350700002)(6506007)(41300700001)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEM2YWUwOVEwZUtuRkVEWFRBWVZCVElsQ3BCT0RqTXdObTIya24wWVJoaytD?=
 =?utf-8?B?UStvQjJpaU4raGZ6UU41Y3gxWm4zT1R3UXVrZkRreFF1SkNSaUM0MTVUeXpy?=
 =?utf-8?B?L1hITGticGVUekdHdzFxaklxU2FTelYrN3hEZG5PN0JZcllCbkFvOERLdnRw?=
 =?utf-8?B?d1plcUQ5UWFvdTlRL2JCZjN2NWc5WGV6Vk5XamlTRWhtcDhMS1lBOWN2SlN0?=
 =?utf-8?B?MkRvNWxaZFYvK25WNlhiT1BxMXZPYTEwMGpsU2ZJeGFDODhUbURHMG12UDdp?=
 =?utf-8?B?enNNRm1FSFZCbUgraDE0Vys1OUNoSEtjeUcwUGpHWnBxaTV4Yjk5OFF5dHR5?=
 =?utf-8?B?dDU0bmRWVytDVjV4a0Z5S0drZUpyU1ZhblVrZERJQXNMNW9uTmhYV3IyU3Uv?=
 =?utf-8?B?bHpCam9pMUdSb1IyQ0dsMHJ2cTN1aGRrN3k4NUYzOXdXTnY1WVlqVGg0Q213?=
 =?utf-8?B?MTdwaUtqdUxET1pJbUhwL3g1eWtMYXlHam9GZ2JSeFd1cS94VjZqcitTRnBm?=
 =?utf-8?B?STNVYURtbHZ1bTZuZXQ1TUNsR01rRzNIRmRGc1ExMWJnVEp3K2NuMDJTbkZm?=
 =?utf-8?B?eUg4dVVOUTNHdURuWmQ0MCtzalorTXZUN2loSGs3R1hESHBZUFVOOTdnN3R0?=
 =?utf-8?B?WVlwOWZ4NEMydUFodHdrYVVOMHltYXBTajM0dW8vM3hNYk1GaUFzSVp5Q01D?=
 =?utf-8?B?eG5wMUg5UnNyUk5PWTVqYVRaWXppU25RQjFWYzE2MkNRS2l2VlFpN1lvbG1y?=
 =?utf-8?B?TXpLd3Zad2ZQZDdpNW90NnBWOWRKZjNjMFF2MmZOeDlldnJkVEgveEcveEIx?=
 =?utf-8?B?eDQxRk56djNFNS9IeUZmTy85WG5nOXFreXY5REVnMjZ6dGNLcDZCOUczTnd6?=
 =?utf-8?B?Y0wxTGdXaXZ1SXVRRm02QXo5Ly8vZTZ1VXVPQWI2eHhJT0hjajdUK2hJT0N4?=
 =?utf-8?B?WEY5QTRPRXhEUkJPRWE5bktsRzMrcFdnVVlueFRiMGdzT25aK3crL1VtT3FJ?=
 =?utf-8?B?NFYrM0lNZERMQ25PVkNsREtyOTlBaGIrSGRVaTJiL25iS1p4dFV2dHhLVndG?=
 =?utf-8?B?dzhuZWc3MVQyd2ovRmhPc2wrNHRweHdCWk5zeHU3RUE5YU9qU3ROdUNVVnpG?=
 =?utf-8?B?cnVmRVhZUUw0QlhDU0ErQks3MFpWL1F6d05ZalY0K3BQb1BQR1BydEZtNWdQ?=
 =?utf-8?B?N2RDeVoycEhSZHJlTUxrb1pGTEJ6U1pJZlo3VGQxdit5Y2Z0UHk5RUsweEVN?=
 =?utf-8?B?a1JJUElXQ2tGK1dXSUUvN3NBR2xoUWdrZVptbDV2d2hhY2NGL2tRMGNIMkVE?=
 =?utf-8?B?Q01FUTAxUEhLTXZ4SGExSGdvMm1zRFpGUEp3bC9CNWNoZEdqbEZWSHVTdkVu?=
 =?utf-8?B?UHdURkwvampIaFBpd3QyVEFrbUZreGxybnJRWjlPVFZZQklIanprN3RGdEdx?=
 =?utf-8?B?SXVvdzBNVGxBSkViOE1XVG1ZOEkwaXByWjAzcUJ5MmpJa0lzcnRJaFJFcVhY?=
 =?utf-8?B?OUl4ODNkNVRNLzk1MjI5OEdMWnR0c0VydWJCZ28zbGg5NlgzRXBHSTVCSEM0?=
 =?utf-8?B?NlJpQnJLK3dZeEtHMEU5eGZaZXFBeVI2c3BRZkt4L1I5b2xHR1JzcXdkemtu?=
 =?utf-8?B?a2I0UlIyemNZZnZrejhQT1BXem5xMENxM3B2clJaYjgyOWRhR1RZaEFsUnBX?=
 =?utf-8?B?Ymk4UzZkVVRnVFVNeVdWNUlPbUR3d25ZTk5kdmkvYmZZS1ZQRXBUci90cGpX?=
 =?utf-8?B?eW1vUU5FUm9XNWhjeWNPeSs2WWF6YkYwQkZGVC81S0lDczFIdlIwNjV0LzB3?=
 =?utf-8?B?bTRSMjltczBxbERqcjZ5UVQ3RlZEelZRSUlPeml1VGdNa21vSjRhR01WTzNK?=
 =?utf-8?B?SHJxOU9wT0FvSVZOSVpLZ1l6c3llYjhNcjRxRmFXcjFIZ0hmQ1VIMm9uUzBq?=
 =?utf-8?B?eDExa1dPVmlRVy8rWWdVMXgzNzJnckNQZ2pnRVRGeTVaZ0FIUXRXdVRrU05L?=
 =?utf-8?B?L00ya1Y1VmJiTms3SjhPOW5MS0x2VmNYOHBVVm1NdU05L3E1a25MU2Y0RTQ0?=
 =?utf-8?B?VU4vOVhId1ZrcVBLaHJmZ3g1SnlsNW1aeEd1eHBlSW9rNkZYa3p1YXR3V1lG?=
 =?utf-8?B?dEc1Y1lKbEJnL29vS1FSaTdEb2hRSTNEMC9pN3VSQzhIZkpFd3IwZjFtN1Qy?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dda712-23b6-4185-0707-08db0055210b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 10:56:23.0741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZfChKGxIInLVQOo6OHR1ky7qJS2UxyWpQWlLY2KqdHzeI8YZBNxNF2JVmPM8sx8NW+8sn3iLDUY5bVERRVRZF9GYhFzoboL3q5Z5ZbJBl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5752
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
Cc: marex@denx.de, linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/01/2023 11.39, Jagan Teki wrote:
> On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> Hi Jagan and others
>>
>> I'm trying to test this series on our imx8mp-based boards, which has the
>> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
>> full-size DP-connector). But I don't know how to add the proper nodes to
>> imx8mp.dtsi. My current, obviously incomplete, attempt is
> 
> Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12

Thanks, but that's exactly what I'm doing, and I don't see any
modification of imx8mp.dtsi in that branch. I'm basically looking for
help to do the equivalent of

  88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
  f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support

for imx8mp in order to test those patches on our boards (we have two
variants).

Rasmus

