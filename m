Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D686855E60
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023110E0D0;
	Thu, 15 Feb 2024 09:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="LNKI3kcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2112.outbound.protection.outlook.com [40.107.20.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86C610E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T80WeXO4uN6+KswvXJGo1z+0Ej6cCRuBwTo+Sw56Y/wTlclaAoywQzuURdC9m+3DWieNswKX+BdEyjgXn5uoOybGtd652TBR1QDJQK6bI87li3nDNmsDhdnfL45lTyvTwYkDrg+Zu7hNnpCXer7n+fJD3Htnp4tLveCMynQ37RuBzX2aqQTcXFYbO1G+cLEBEtWdQg4OFFKO69CrTN5Ak2gPIk7gaa5JH5iolg5sBF31vIWB7ynsB3rJrE/CVy9bxub7D+r6iHoWzY8WDp1Z/eEMsmdRfUYRb8RNU34bsO2L8PBjS/ZgOlGwz3cwT+5WcH8AYGhUZPQd9nOoAmq/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek7jdNq2FcvPAL1ie6iI2jeUqX2TQsjrPh1JH+pNv0w=;
 b=YNznfkpChLld4viKDmobA5mpT8YHGFixnb0KZvipWu7NsZ0RHx5xE3rfKHVhTDP6GpOVajHbnLSl4E/CVP1KsvD9CDiCspEAiuXuWnk+L5VneJO/3KGFsiKty7VjmUJrU26oUxxKR+TyK2MEHm5ONsZfDCRCWAE24I4tXhfVx9UkzIxWykiq8JwCJaDm2/26lZuy+0ggrJ/HrI4kk6Iq6NDSSuyAGuCesJXWveM1Ptm8UxsN64jP/sqXxcFNAoYiIKd9xNLrzNi19d4VKePrEktKGswfrguEffEx/w6bu5iTZFPhaRHBBHvrQD2n76xtESg+3Oh9NkJPK6KYcJoP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek7jdNq2FcvPAL1ie6iI2jeUqX2TQsjrPh1JH+pNv0w=;
 b=LNKI3kcfVC7UaVQ5xLzWjo9maytCTOZLclsGbL1aXNZuJaACpVsboSgKxbSAMli3et2GSAdDmC1FWR+P/t5vu6czQkRBNbfuXySaX1k7FQvlefV+Tb6koU7JjoRbxup67XgxZyfqVRway4shkT8fkyQeM8E8g6L8CH1xbGv1XNdKNZUOgxpPnNi6fzWQpedIXzidZCcVil0uT1uOG2GmvEJRpnptcFZXF+a2XEGYU6hc5rwhfqAVXZhH/uCg4/UvcyIFx4STMLuTlsrxvmaC9YXeaTJNr2YCs2msMeHNVxnre3qXPCmnqd0J9PYXd202KY8JaXOgriDRNZnzXphl7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7546.eurprd04.prod.outlook.com (2603:10a6:10:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 09:40:07 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::550d:ad96:e3cb:9a6e%5]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 09:40:07 +0000
Message-ID: <6498807b-2e93-44a6-b985-808e7fa261ad@theobroma-systems.com>
Date: Thu, 15 Feb 2024 10:40:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/panel: add one more Leadtek panel, the
 ltk101b4029w
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240215090515.3513817-1-heiko@sntech.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240215090515.3513817-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: d73d2ac3-c496-4ede-98e6-08dc2e0a1810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uZgvg/CMJ9+0BeBNZz8zSooYNzsED1I5JZr6MhgHqy2GmFv5HlzA5dGxzqa89myMdnB7kwpulOzZy1K0I22Dm9fdK/VoSDedub4V57zb6GCRYZFC4tuB2g8Rmf8WuP8aUEIPZ0DCsshgp29uqIqAcd4nfetINaXsva0nlMe97LAdy96z5Vp4Ih7ArgVHBiP0xK3LguDBqA4Wpuz61DHBKGRxEF4uVP5aubRL/ETawD64ZXFeH8REB397RSCSX4k4lNthFuWaP9juK24r7QJblMrsfFMURdz7QrA6TNqFRG7F8CLiR8uP+8wsEnKQUIuIUDMJw8JGcvnHMp1g5BmHk08YFbAJ68QduD5Dg0hAIqNwaaYIChQP//tEHapJ+Zn+afCjOSZreKM1Be7vDZPBevPsIsvjKzyHGWdMZfshxcA++p+mitD/2D/PmfFnveJzpSEwkPsmDKwU0AOqV5TTQmyyBkKNhtznEy4wSBMSc2aKMeDNcSpv68L8WMymJ6jHH4aycz022AoQpl3OCexuGVN5TkOe9Wv1p38kfilIDznuVds8OJDGEGDfNeXo/2F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39850400004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(6666004)(316002)(4744005)(7416002)(5660300002)(2906002)(44832011)(66946007)(66476007)(8676002)(66556008)(6486002)(86362001)(31696002)(6512007)(4326008)(8936002)(41300700001)(2616005)(478600001)(36756003)(6506007)(53546011)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5WNDBvMGtMQVVJVXV1cW5hYXVaM2RJSnhoSFNpWU5vRHlBVmZzYmltOFgv?=
 =?utf-8?B?dDhsN0orU0tBRVB1bWI1UmNZbnpxZC9sZ3ZzSmNkNjdydXRDUVpJYU9IKzdF?=
 =?utf-8?B?V3pvcDdHMXRLbFdlWG5ZT2d1SjU5VnAySWQ2eU9XTHFOQkNYbmtUSFZIbmJU?=
 =?utf-8?B?UEpCajlaU1dSTDNWSzkzbkhOb1ZOSlN1T3RsSnBndUUrY1V0dTFFQzZIYXV6?=
 =?utf-8?B?OWVmdTdxUXAreW5qN2Y0clRibndvaDRvd0k5cGlXeXl3Sy9OQTAwQno0TTFY?=
 =?utf-8?B?cVRQdDFFc0tlZVdIRUQ3dWVwNGw1ZFlnNnQ1VkNUTkZFL3Z1ckF4QUVsMDlZ?=
 =?utf-8?B?YjN2MlFzakVENVpqRnVxSFhGQ1g1RDU2Vi8yQjZuc2NrcXJxSjdNS3dHb1BE?=
 =?utf-8?B?bzB6bjFuZi9tVTNwVldMcGc3R3llVXdRTGxmbjk1ZWJrLzJDNm94czlxTERy?=
 =?utf-8?B?TWdEenM3YnF4akxHMkRwRGNKMVI3ajZCTVNjYVVkUCtrbmt6TjJOaHFzaGxY?=
 =?utf-8?B?Sk9rMVNtRDVGS04weVVGS3JnS0lHVlNaUW8zV0xpRDhLYnRZTmlndlNBaGR0?=
 =?utf-8?B?NEJPMkdMZnZrRUFHMEFUb1Joakx6dktsbE5XS0g5QzZCVktTU29CMDAvNDdO?=
 =?utf-8?B?UTl1OFF4ZnNTMVRyOEgydkNCSXA4aWwrUm9uWFpTTEJOc29FTWNMVUdhbTh3?=
 =?utf-8?B?eGRzUUZxOURheHhQNzEzbG5PMUhWRWNocWd5bm1CZ1NwYTNDUjBGRWI1bFha?=
 =?utf-8?B?UDkrMnZGQjFiSmlZZEl2Nk03QWRvUElhV1RkbnZlWnNHeE5yVmxNNFdIaFRO?=
 =?utf-8?B?a3ZWbi90RXV4WlZtT3pNOWdvSVpWWGVTSWNQTGhkRTRQZVBiTE9pMzNXZnVO?=
 =?utf-8?B?TXNYVDdFZkFNdEx5NmFIYjdlVDFxZC9zRUNDUHRFQ3pZb2tYemowMERHd0F2?=
 =?utf-8?B?dVlXenBaMmRzTTVTemJCNHhLbUFybEtETFY3bTNQVnpyZk5jc3FEc05maHRq?=
 =?utf-8?B?ZHc0bGhYODM5NWpXZmJVMXl6VC8yYU9IMjZ3dm9rUkRndVFaWHc0b2FQZGxR?=
 =?utf-8?B?YmFMeTZHc3BHUlNrbVlZU3RBUXo3VHliZEJqOVY1KzVjVmszU1dDZ1lZZVJT?=
 =?utf-8?B?ME04RThzT1QwZXBCZjU2anZWSGhGSmxONHAydTREb0liT0I5cUVPTW1GRmxp?=
 =?utf-8?B?Q2ZlYUVtSUVVVDdiZEdNMXRvaStmOEdEUVhtMnUyUGpJcXkvdlVrbGtVVGRI?=
 =?utf-8?B?cEJSSEU4Nmtya0dnYURQLy9zU1ZqdkJUcC96OENWZmpBOG1kejMwNGVCc3RX?=
 =?utf-8?B?Z3FmOXUxYzZDc3l0YmdlK3RGUXlJdDdaejBVUnhoY1p0QXhFeDQ4dHJneHFM?=
 =?utf-8?B?K3JZS21rMzVNUnhvOXJweDQ5MEVIS2x6eFNENGNWc1NOeUtITmpsSXJoMjYr?=
 =?utf-8?B?SjlxZUluUTlGU2JNekxRZ3Izb25LSEgzZmNsRm9HYk04TDQxczRLenpRaEF2?=
 =?utf-8?B?dERGRXVpaGp5Wmhxck4wVmRKSnR0K3lnaVhzU2kzb25pMnlSWWJnTDFUL2lX?=
 =?utf-8?B?VEJsUlBxTUVPajIvclFxSFBra0F6V3c5RkVUdXZTNDFsOGJiM0x6OVhsT1V5?=
 =?utf-8?B?K1lZYytVc2UvT1o0TFNvYkJWQ3Z0RmtTMzl5MklzT1YzdDRCTThFbVJ4N1V3?=
 =?utf-8?B?M2R1a09mb2lkNTlJZDlSVzJwbnR5TitNZkducG1sRHdCYzhEYTR0VkVkZ0g0?=
 =?utf-8?B?TStMbGZta2VWL3lBcFoycGJJNW5iYlBQa0J2VER1QUpjOVFUTjVWR0tPaktO?=
 =?utf-8?B?SXh6R3lXd0ZhSDhId0NQQVp6cnFuaU0rcHZ4emU0TmROdEtIa1RVSUlwSVJ4?=
 =?utf-8?B?WVA2NDRVSUdOalBaMCs3d1gzVWxIWFZiRjVwYS9hS2MyWW8zY2RaM3ZsMmZR?=
 =?utf-8?B?SGgyc2tka3NnaUllck5zbHZLdzNRcERhRzk5MUNGeEc0Zkl2UWZjai91eUsx?=
 =?utf-8?B?NTlQbldiWnlJRjRrY0Y2bUpxY2kzbTd3UnIycVIrMzl4WWQvWW1lZ3gvbDRq?=
 =?utf-8?B?RnMrUFNnK09yZlpiWHROYXd6QnVyWjdWR1VpQUkrems1a2VPOE1LOE5rVDBX?=
 =?utf-8?B?bXVRb1VyaFlvMHdKbXcxcm1lQUZwNnJIK0hMcUJ0MFE3STQ4c2o2ODZWMERv?=
 =?utf-8?B?V01uMXJPek5aaGRwWVR3T0xUUEpyUnd5UXBKY1ZJN0U4TWEwd3VRaHJOSmVM?=
 =?utf-8?B?VHo4eEQzVlVqbjZ5SGYzUE1OTzNBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73d2ac3-c496-4ede-98e6-08dc2e0a1810
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 09:40:07.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRHGR7KcT9su2/NU7i1cvMxT3qX1S1TlT7S+NqAnV/97GrNtk8b9Oki9sW5aZM4DBewysV8dGk0cGiFQqz8FaxQ1hj6lwhOQoN3vM0gpYwqo/28d53EltfTjrn3Jr1xD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7546
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On 2/15/24 10:05, Heiko Stuebner wrote:
> Similar in setup to the ltk500hd1829, group it with this driver.
>  > Heiko Stuebner (3):
>    drm/panel: ltk500hd1829: make room for more similar panels
>    dt-bindings: display: ltk500hd1829: add variant compatible for
>      ltk101b4029w
>    drm/panel: ltk500hd1829: add panel type for ltk101b4029w
> 

For the whole series:

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks,
Quentin
