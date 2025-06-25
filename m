Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0FAE7D53
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026C210E0C5;
	Wed, 25 Jun 2025 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11022143.outbound.protection.outlook.com [40.107.75.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE410E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 09:36:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLm15d3NAKxEYeCB9B7ajh8Lq+CuimLC5xE72w1edRbX3n2Kpow1QO+ZQUU3C3DMj8rzfVPiX5TTB1yjY/99rbBU21PjfdIzZ7EUP8fxBan87EJWbWcwbOuZFy4wmipr4rsS6c6HhOUPxYq0adTXvaGXox2PZ6lGCW7o2cFMOXD6FSuU8sHUVW9jDHCKdjtdUxqvT3TE9DCucpu8BE3wWKrAcuDlBs2FQnlCCWM3Gb8ewb0j0QUh7JOHmRPkzJuuendFvPJZ+Xyz136yGQlgtBw1xZZljuu7xooT+ooM9AK19kSY5RH/kJ3hukrvQHw3ro0EMeNn9bja6HPLBtzqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKHINoz0dTYVGL3Z0AVDcICInEqbHBazU/BmNHaemQo=;
 b=vZv+6xpTVW4OKZ1Ty8LR/R10/Tf9JNsm+wQc/d+Mibm/nwKUmrlzodzxofcBg6hCsDxD9ST2simRMF2qjpYNe4/zRl/OyvthiZ1s/+B8wKLl2vGTIZTmzoyMkLcYi0Y4CEPkP6RSByC9MYuH2/qPchG+Lgefo36Z+YCgpdH6zRxr0ToM8Ju8H/M49t7LshQHageabIfjNLwBWLlg4sHXket1X16Imcg9/qseEsDT0gCT7Eyf5IJOFrn0h4verkapytB0CZjHIwkGZW2cy+IAlarLoyb0CcHMWrhTVqSmYllvp9fXEGOogpjdpUzWyRNYaggJjflE1U8L4AM08i3dLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by KL1PR0601MB5776.apcprd06.prod.outlook.com (2603:1096:820:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 09:36:50 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 09:36:49 +0000
Message-ID: <9c3ea5fb-a045-46bd-9753-26ffa67fe1bc@linumiz.com>
Date: Wed, 25 Jun 2025 15:06:43 +0530
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Paul Kocialkowski <paulk@sys-base.io>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
 <aFu3fAMa8KPwjPbX@shepard>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <aFu3fAMa8KPwjPbX@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::13) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|KL1PR0601MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcbf53e-6409-413b-3e5e-08ddb3cbcf0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnRZaUNBMm1hVnRwMVdmMkduaDRBSE5SYUVDN3VIWnAraUd3LzBTZThLMHdm?=
 =?utf-8?B?VlJHc21NN0VIdzZtMXNTTUNqaU9MNEREaUREbFRORWhsUVd4MXNLcHhkcHlm?=
 =?utf-8?B?T0xWL3hIS2hCZkI3ZmRVYXR5cTFsTzVFMGRoaWh2Wm5wdzMwb2MvREt3UDdm?=
 =?utf-8?B?R0kzcTZKNjFlLzBRMkpaZ2ZMMlFjR0doRkNXbTlRMlN5WU9oV3VjSm1MTTUy?=
 =?utf-8?B?UGpyMjNHSnlNN0pKMlRvZ3dYWFllSzBQR3JyUlI4R3JXaFlqdGJobHd5UzZp?=
 =?utf-8?B?UmhISU1OWHYvTUsxaVcxbUNMOHJqazdXckNzY0phTDIveXFaYlFUa0FHek1L?=
 =?utf-8?B?SWhXT0JtZ0tNTFhPN3dleDZOTnJZZTBVMCtPSXN0TzZ3bzJnSkcxeGhlQndR?=
 =?utf-8?B?Unc0dHNWYk13RTRaL1oxZXFBWnJXWEh6VkVYZlkzTFQ0TXZVcWgwWUxzb3NG?=
 =?utf-8?B?eVhGNWxZcWo2czhpYkZWdmpNU3U5MDZINFZXNjh5NEdkMnNsZTVmbHhKUHdN?=
 =?utf-8?B?anlxdjAzdXlUTlYvbTVuL1FtYTkxYTJ2ZjNSQVp0ZVFDcXNXb09NYUIvZEp3?=
 =?utf-8?B?eFpCandycHpwYW1UWEVqUk1MNUpWQm5rdmE3WncxWWcySkFYdFg2VUdJNU9y?=
 =?utf-8?B?TVEzOWtIeFJsSE5BTEpYYXhBOXQxUURNcjljMVZaeFlhQzUvN2U2bHFwSVU1?=
 =?utf-8?B?cXJnODY1MlUvc2RRMTdpZERRa0NGaVdNRW1kNEpqMklMZVVBMG1nUnpQbjEv?=
 =?utf-8?B?N1FtV0U3K2xOWS8rSmUyWFpUU29Ya2lkMHV2VWdSdHhJVzk1UFp2c252Yisz?=
 =?utf-8?B?TTZzTzVSRjd0MEdSYnRBUllqOFVzeEUvNy80V0hBTk5yNVk3czRIMzc4V0Y1?=
 =?utf-8?B?UnQrck5BMXZwYVhsMWJGQnpoMmF1dFlvdjcrTUpRVTk0ZGtUcVgwa2tUV1FQ?=
 =?utf-8?B?M2dHQ1dycG1mLzVuSkw5MGVNUVZ2aUpQbkEybms3eUQ5MzFMSHNzamlqUGJZ?=
 =?utf-8?B?a21VZVhSNnRXa2JyWEEzMUZDSXIyNk5UcENPeXVpSnJHZzhUYTZxRFhlUnla?=
 =?utf-8?B?K3dDV2xtbFJuRTYvNHAyUXVZRXVxb1pudnRKNWJsdStERVRCUW9maUU1YS9u?=
 =?utf-8?B?c3lBQlJUYXp6a2tpclNiUktqdDZuVDQ2bVA3cUlsUzVGdk16OU9VaVc1d1pW?=
 =?utf-8?B?V3c5TE1UNHN5ZnpKV0Mrb216Yi9Qb1RHRHdXM1hFVWpjdFpPK0t1QzF5Tjcr?=
 =?utf-8?B?MUF0WGtkRVZGbUdFM2UvaUFyNXFqSkRPaHQ2NS91OEpzYTY4QTduNXVSUmY0?=
 =?utf-8?B?c0x5QlBScEh4ZDZwYXlBbEtXS0plYWxGV0NZVmhmcWo2Z2Z1TFo0Qys3Y3lz?=
 =?utf-8?B?YzVQK3F5dGFKdzhNUTRobURNdk0rRytQbXJyZVRRK0RkcHRBbkIydE9WUmdU?=
 =?utf-8?B?UmpNV0ZObVdKbER4azBmUXZaSjcvNlZnaWZJNnIyREJFZ3BnT0s0UlZhTU4z?=
 =?utf-8?B?VEo1aVlPUlRvc1A4Vi9aQ0IxSVZMaGJQWEx3b2p1ZmxMaitYYlBENEhXTFlp?=
 =?utf-8?B?TzF4am5IalZYM21PN0NrelRUMk4xRVdFKzVYMHMxVXprRXVjOGRaMGlHbVk5?=
 =?utf-8?B?TFBzZUVaeFVoWS9lS245K1FmNDNzdERjdGlhUFRSTk94L2NSRTVGdnhMNHp0?=
 =?utf-8?B?WnV6eUR2RzlGdlNKcFhDSWhLMjRwRHlWa09NeVRES0I4Tm9tNTRTTHIvM1Az?=
 =?utf-8?B?ZkIzRHVWdFc3L2ZreDdYSXkyaEp2QU5DRTFpT3dodlFLbTdPRXFWb0tjZ2c2?=
 =?utf-8?B?eGVZY0ZHZ0FJcXJaVitDR1AyS1EyQy93UUNWdnBWWFprUElzaTlDRXdDcEti?=
 =?utf-8?B?UW01eGdWcnJnVjRRWUlYNmNkTWRESHJ3RTZINGFZNzdVZFVza2ViM0dlZk81?=
 =?utf-8?Q?iks0Xe8ap04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWQ1cjRRS0FkU1hPY1haREx1U2tnWEt6S2RaMGdyaUk3dW5CVnd1cHYyYmVX?=
 =?utf-8?B?NURxZU0vSnJnQ0FyRXR4dGxpZk4rRHhBdndvUWFySWZoMFc1MnBDTmNVdkpL?=
 =?utf-8?B?bGllMnpMS216dXl6MVRGLzhhTy9CRmo3b2Qyc0tqNGRUMk5pbjhwQmJ5TUR0?=
 =?utf-8?B?ajdqQnVnUDVqQTNiZHpya1ZTL0EvVDZkcmlFdWhUR0NBRm1pZVl6RThlNVBB?=
 =?utf-8?B?MXR5bE1GRVZXcTg0NTVrSDcxNThCclMvVUY0ZG1nVEpxT1hYQkF0TC9OOW5N?=
 =?utf-8?B?eXNQZDRNamduZjg4dkl3UXJjT2ZsemhKbXFIb3FXeGFMRXhzTWhmcllDVXB4?=
 =?utf-8?B?bWFQL3NnTE1lMUlNcGxpZloxYnVEZ2pEVnBsUno4RnJQUmY2OGJqUUpvb2kx?=
 =?utf-8?B?ZTJINXVQKzF2c2wwLzBoWDJ6akEwV2JlVlNjeG1ubDN5UlhNSWMvYUhYbE9P?=
 =?utf-8?B?MTY2WGhTOFdoQjdBc0RkYVdsaHcyZUVqNkFqNmwvS2M2cU41Ync1MHlnS0JF?=
 =?utf-8?B?dUNTKzVDZTFMMjVUbHFpajFBQy8rMmZnU1dvYXBYSmNXK05FZnljbnVVYS91?=
 =?utf-8?B?L0pCRVg1ai9CTGVvWVRYay9EZjFqNnZldnpQN085c1lQcU1VaDlvdExSL1pX?=
 =?utf-8?B?K21Ec2Job3Z5S1JEMXVBeEtidTZuMzhZNm9NOURMU09PT3kyZkhOUTBGZThy?=
 =?utf-8?B?MDZqYittUlZIR1F3dnBXMkRuZDBPRlM0Y2lLYkhPT3VBU2ExKzk0ZlRjSVhE?=
 =?utf-8?B?SHgraVdqNDU0UFp3c2NuR2FjSzhmODlxS2dOT3U5Y0FWQkxTeWNJTzNHb21i?=
 =?utf-8?B?OXVoNXFEcEthUTg0WWpzWG1kMzBIVUs2L2JmOXo5RkVzZUd6NnNCcHQvSm1k?=
 =?utf-8?B?Qzc4YlJUajU0cmEyck5XSlpJbTUxZGFHOE85WURaRmFUeTBTUXkxcis1bzNM?=
 =?utf-8?B?UU9OS2F1WGJjSG10OEdQcUpPY0dLSFIxc2l5alZmZ0dETEFpL0Z1QzJkSTln?=
 =?utf-8?B?T3MyMFJwcnVDTGQ5RUhEaGU3OXBmcnQ2QlBQVWpHOUQ3NjVJTFoxTHQxNnkx?=
 =?utf-8?B?c2hDNUxlRXdjTkhIM3FRYk84Wi85RG1VMC9HTXNJSGFUR3VyYURsZnVyWUYx?=
 =?utf-8?B?UHVxVHBiZGc4TER4S3dPaCsrT1h5UTBwTFgyTWdoTkRKalIxVXVMemJCV1Bi?=
 =?utf-8?B?Rll0YWluaWJHRzFBWVdzZ1FQT1d1S0JUb2Q4Zkx3NEJ0Vis4YnVPMUZJTjdk?=
 =?utf-8?B?OW5kWWlaYUhvd1ZwNStsSERBUUI5QUovaWZCb3FORHI4djBWKzdTR1MrMFZJ?=
 =?utf-8?B?R09NMzBnWlp3bk1aejRnLy9Kcng4M1N0MXVRL0swdVIreUJ3c0J6Zi9PK0gw?=
 =?utf-8?B?NXJCbmRBT2pEMCtrTnczY25zRmswTVB6USs2TExBbkgyeElxQWc1SE1OSng4?=
 =?utf-8?B?bWlZa1FUbWNxTzNmUkU1L095aFM5cXY2bUZ4VXJob2pMVFBGMU9Nbm5mM3Rv?=
 =?utf-8?B?bXZ0b2djK0l3WkpmQmtlRE5tYmoyK09wM1c4eU1aMm95YU5CcXg4Mk5rcEt6?=
 =?utf-8?B?YTltQ3kwbkN2empzQmFxYjBib3ZlTzBrZjN4MEo4NnRvQmZHdUZGT1lqVzFW?=
 =?utf-8?B?UFdjY0gxTXdHS1MrWUxIVGZnbEtvSXFNdXNUb2VFREdtdGVJaVdPNGV1YXk0?=
 =?utf-8?B?bUt3M3VhVkdLdHpPdHRnZlR1c00vZ0tJZzlrZ2EvZlRvS1B1ajRYSVFmVTRq?=
 =?utf-8?B?czhza1BjR2xjUTNGVzVyYWNxaEM0VzB0Uis2dzl2emxDWlFIM3ZaZHowQ3hB?=
 =?utf-8?B?V0FkTDZIN1pCWTBvSno1Yjk5Q3pYeVdXeTNqelJPU0tqbjlVbFVMeVRGUzR3?=
 =?utf-8?B?ZUo3a3FKdmp5b1ZYK0s3bHNKbE9yOGE0OGM2eDRMbVI0NWtEZ3krYnB0a3Vj?=
 =?utf-8?B?K1ozamhHQnhJWndqZ25MWU53Yzl1L1hPQ1h1MUo3UG9wL3pwOXRBUml0cHU5?=
 =?utf-8?B?UHZGdmJWbHA2MTM4aklnZHlaak1veUpKTzE0OU80R3dCOWFReXZ0M3g3Z3Vh?=
 =?utf-8?B?YmFFOVJQMnN4WUlaZVdOQXZObDlzdEM4QWtZemtVWnBPYkN4RDZFRVBvekk5?=
 =?utf-8?B?QjI2c1J3Q3NSZ1pZY25QZ2taMnhHQUdIWDcveVN6RTFCMlk0Q21wbHdkTmxn?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcbf53e-6409-413b-3e5e-08ddb3cbcf0a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 09:36:49.1684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnWhQiwWilaFuSIpSve9W77XZyGtlxf0o6rvvsW6Zb+megMg7I8ISlZHD/AKvufkUO+Hw5qkf6emyabWHduNPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5776
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


On 6/25/25 2:16 PM, Paul Kocialkowski wrote:
> Hi and thanks for your work!
> 
> On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
>> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
>> data 3 lines and lvds1 pins are missed, add them.
> Would it also make sense to submit device-tree pin definitions here?

this patch is already merged. 
git show --stat cef4f1b5ba99a964cd6dd248bb373520573c972f
commit cef4f1b5ba99a964cd6dd248bb373520573c972f
Author: Parthiban Nallathambi <parthiban@linumiz.com>
Date:   Fri Dec 27 16:37:57 2024 +0530

    pinctrl: sunxi: add missed lvds pins for a100/a133
    
    lvds, lcd, dsi all shares the same GPIO D bank and lvds0
    data 3 lines and lvds1 pins are missed, add them.
    
    Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
    Link: https://lore.kernel.org/20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

Do you mean the consumer/board devicetree changes?

Thanks,
Parthiban

> 
> Thanks!
> 
> Paul

