Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHOBGbAIcmmOagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:23:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9686E65EE3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAC210E02A;
	Thu, 22 Jan 2026 11:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="rWGzNejw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19012050.outbound.protection.outlook.com [52.103.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CCF10E968;
 Thu, 22 Jan 2026 09:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYzSOs0tkVCN9LHj/FmfQR0QBjxIc91f19pFC5B3XomCutYsqWCS3O9ElnPnFgCK5zmxI4tQ/7p8EBJvExaOM5uzfLwpctq0ToFtUrSj94h/Dq6zmdhB1uRvrJzvifXYTqRFbmnNC04likMw/aN4U5NQoSuONaf/lTeICDHJVWew/kTChqql1+BRvieYPkJ8HKLjqVyd3y5z0D0hclZLQuDMZ7FIfEJEA1CA/DfJeVkgHxmKy6JVyAMM0CrT7VKGOptnpCqrFSkG9F990wXzNUUhMDiHeuvOmf0DukA7mNzYefpnJI3vX0WQSc1sR37EvEyya6+c1WE+CXNt/Uz0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ+4atDGWwJAelP6QXQVlKX6yj9a4BtVD2UMfOiLwb8=;
 b=rlVkwikSKJEQRkyU5oiLg/4P3PZ228OMnW/BEcfa8PmrDQ7OGoAHz2iVq0WgyRGwvs8Rt1s37e+pz9p6bTgfWiSm+DFc/bPRv3T1cY7zPoliV0ai9AOppcVAuvnggDRf7FCXr7M7As2Oaent2VKQg0B8CAZrz1GS6MsFFhVdBuAzV6YLWnz/YzvL8emShR67eT1hD2XmoFFQeIRauxgFMx7+TkQBaQ4LoIGg1aP7cMHNvi0cbYaHrZZ3ZFM9xv4p3P4KQrVw380ReARIYB3HSpnd0rsFXVtT9nGe6aStjCT8R7/CBe3TLnxIQmo/72E53a0QYvztieuBgIfWkSDxpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ+4atDGWwJAelP6QXQVlKX6yj9a4BtVD2UMfOiLwb8=;
 b=rWGzNejwFZFRPA0dCXnXEf1k8ibT6Wp/sDlOVwLECeHLkv3UHHdj7iBkS+vGr48dvjNINKyoAe05Go5akMTuEx1M6Cpg2yMMpsoR7fetF5/VbYHXufNEuhDUESmxn6beqFD67z7iT/2Wh0FPf5rwxKAnmpjtNLuQonNGiYIstMIyv8r3T4hgJEZHvUFUc25XtbeUMy5YqjLUlCoYlpVapetrtLQL9baY2jWV2SObd4OQXKfnJIho221caVghRrE0FSKbQafm0tQnX911cRGvDsgqpdgqoxG1YTzTLQJVCpC1ZPTqtB2GwjhMUACvD9Z0nq8IHgl3HAsElmMvJQIMkg==
Received: from SEZPR04MB6873.apcprd04.prod.outlook.com (2603:1096:101:ee::9)
 by SEZPR04MB7142.apcprd04.prod.outlook.com (2603:1096:101:186::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:34:42 +0000
Received: from SEZPR04MB6873.apcprd04.prod.outlook.com
 ([fe80::9243:8aaf:c6fc:3d62]) by SEZPR04MB6873.apcprd04.prod.outlook.com
 ([fe80::9243:8aaf:c6fc:3d62%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:34:40 +0000
Message-ID: <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
Date: Thu, 22 Jan 2026 17:34:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
From: Kancy Joe <kancy2333@outlook.com>
In-Reply-To: <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0053.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::8)
 To SEZPR04MB6873.apcprd04.prod.outlook.com
 (2603:1096:101:ee::9)
X-Microsoft-Original-Message-ID: <2715ba30-5f57-48ec-9fbc-26ae8abd352c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR04MB6873:EE_|SEZPR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: e429bd12-61d4-4074-d9b0-08de5999771b
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrPy8Gg0T1tV+ubdyTLMpos/ZnbWDSFaxU5YHnTJD8yMvDXnjWD59Gyj3X849R/jIdsZ7WRbKr1EUEz3/JogzkrQvWZajEbz470VbUCl2NzxMrBhMa5EwrKnJ5LnqHqjQFOfTi2H0t6mh0QY+YpfdQr+1l491Kusibdv311OosTMpx5MICqRRX4Y77CPIUhVRQgF6i4JoYCk/frfKVOObHp+7ysJZpybHnerlo4hCd9j/rBjyk+Jto/gczJAZI8q3HgibuQEan4VWPL4bP3vWII1baGjNkSiMUTZVL9tQaOyWpD+wRjZxyMYbcH8QOh2q285qpwyBkkKGluNbMkv4MhszPs0qpJ6IpyuouKJ7w5hn8PPkMqKX9fQpNg1yzn2AaYbJFAwR6GinJkKKlHJbpmFgzh8SFADL2JVSPLTDMgZ2dUjArVT8yZnvCDRlBByVsBse8HB++yNtb6IM7HMpi/WX3dYn/fhwwsl5ZP7FXgY+t6XuQwIeE7yImHlY+Xe8gSsuQDXfLvSh995CVy2sugr2C9qWVHpA4mxT/Fs7QpxP9/6vURkggRsdVny8PSstdP4YkbCBv4B6X7OaXimURdbxJZKYbn1qflGamjunfvpJ9NxpDEsjR+RH2l6e+WLq6o0SvJ39vSCQV9xXfcwQuaaTJfjSiMP90CU/wj07ErMfoDsTY4sy/veXZvwyo8+V2oHRdiMqwoWUerhKS5+peIuRBtahwdON7OFfI3GByZeKWDtC9VoS7jg6jF0d+DsraQ=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|51005399006|41001999006|23021999003|19110799012|5072599009|461199028|15080799012|6090799003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVU1blc0bTR3aTY0MmFpZHVGRUd2blFvNkRGMjRRcGhSQXpRV3ovalVTYmM1?=
 =?utf-8?B?eXhCaG1HQ2hZeDlKejBqbU5ZUHpoTXN3V1ZmWUpVd1JNN3FJYU9WUmo5MHZX?=
 =?utf-8?B?TnByN0ZscVg2NFhuVWlrclRvM3Ria0tZeEwxR3dsVjFycURVeTlaSG51cFpZ?=
 =?utf-8?B?Tm80RkkyUDQxNzNQOTBoNlRIdmx1Z1ltVTFMa3JRVDVJREEvVmdnYk5jeHda?=
 =?utf-8?B?ZUNUdmdTWlI3TnBCTDhVNzAxTzgrK2hVT3RpdEZKcWdBeE1TVEhBRi9Qd0Rt?=
 =?utf-8?B?YXJHUGVtS3kzN0JPZEZZTVNwTjJBdFc5ZG16L3RxR2szYnBjK1Jqdld1VzlT?=
 =?utf-8?B?MjM0YzRLK0dSU2RPalF0VnJTWWVaUkFiRGtBdWFyQ3FsT1BETFFJZzd3cUtJ?=
 =?utf-8?B?RWorUkp1b1EyeFJ6V1NuM0kyTU0zanoyVlVPLytlME5EcldTelhmbzJLNWYv?=
 =?utf-8?B?OHg5K3d6eFZZRGxxamN2RUs2dGVBU21KSnArWmdaMTRaem5SM3RoUFBHV1Rn?=
 =?utf-8?B?cERoMUhyWE5wNUdObE1OYVRaRGg4MTJYdGY2NmVHK0dWcWowclJoMGZuU3Jv?=
 =?utf-8?B?NVpuZUpnbzNvc2FYMXU2NkZCeC9KcnJHVjhNcXJDRThoWHFrSy9GejREd0FR?=
 =?utf-8?B?MWlqbE9mKzduMHAzNDR3dTZDS1dGTjhwT0dIR0FPcW00YzV4enVTamFucWRi?=
 =?utf-8?B?VkVoL1MxenhmcTdYb05DRGp5NmhZMXMyWEowQXJPb3p5OHhsVEFsNUprN1VX?=
 =?utf-8?B?Z29QWkF2WjdsUVVMR0FTK0tQbm8wRFlzQ29IUVlHYmluc0w2ei9VKytWZXQy?=
 =?utf-8?B?RTh3elB4WWZOZStYL1Brb0R0aGxqaStJT2d3ZTdyNjVGQzJjWkJ0VXlsc29C?=
 =?utf-8?B?UGJTb1BPb09Gd3ZhbjhCR216Uzk1MCtvbGRzTHRUOWxpVm5Sc0JCVW9WL0lz?=
 =?utf-8?B?eGdvblV2NWtqaVJRbEg1RVhnbFBVV1M0aTNraTFSTVZxdzluTlNjMlhZNlBR?=
 =?utf-8?B?cnFpMEVoeVlUTW5tKzRHeUhzVk9jaEZVOGtYL1BSQ05Zc1MvWkF5ZUc2bXd3?=
 =?utf-8?B?UFdzWFBBb1NwZEJwVE8rMXFtakV3OEZSV25WMzJZdGdxdEt0eVBuUThEU3NV?=
 =?utf-8?B?ckxRME5kMGNWNkNXRWRKWWNqQ05NMXV4WUppdGord2ZmZGI3a09KdENpY2tz?=
 =?utf-8?B?Zk81V1JpWXU3ZTNvdlUwZCtIcVQwQ2RxWDJWRHZXQm9hN1VSRHNtSWtQa2xQ?=
 =?utf-8?B?OThid0k5T3RIRUxKTWx5b25TSTlDMFVubGlQeHBBRW1vVHM3M1UxUE9xSGJl?=
 =?utf-8?B?c0o3RUwrUVFPNHV0RWN2R2orQkczSWgvU2hpeEoyck9wV2ZsSko2TjRkaEtq?=
 =?utf-8?B?V0xaYVdOalR4OUgvRnNNQ2ZFRmswU0RzcjBGdXJ0cDF5ZngwUVpBbGFTK0Ru?=
 =?utf-8?B?ZU9YNlIvUCs2dG8wMWMyZEgyZjNsRXRnNmVqV0Q4WHZlVGxmTURMb2tXMDVp?=
 =?utf-8?B?ZjV3L295S1NCdVp0SkFaSEI4a0F5ekRTd215bjA2TVdJbkFCc1kwM25ZRmdJ?=
 =?utf-8?B?L3hsOTAzT0pJdHZQU1IrR3p0OC84czV6TExUZVlIcVlhZGVkVlZwRE5rcEVl?=
 =?utf-8?Q?XKoIz/z7jvfEUxeAeUGqErtEcZGJTvvHUvWD+lxD6ZjY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdiZmhIMGlpc2RtdTdZcGp3VnRhditvcXZRODdrMEdsRTE3dHZjUWdac05i?=
 =?utf-8?B?QlBiVitFY2tKWjNaY0VHa3lUWGI5Z3lMZVZvWmoxSy8yNHFzUmZjVGNpNjg2?=
 =?utf-8?B?dWFiUUVOalcwZTFtR2ZzbHA1QSszTFd5dHVLSTNHWlZucXdJWU16QitJUG9M?=
 =?utf-8?B?eDUvQUtZdUpWQnpQbWNKNzZENlI4RUpXYVc3RlFJaktTQk13elpHMCtYd2FT?=
 =?utf-8?B?Z3FOU3l4OENDMW5iSmpXaC9yVnVSdTFURmhNaEpwajUyK1RoRnlHbTVHbHZW?=
 =?utf-8?B?ZXl6RzFIVk44VVovVGZ4NlpBSGRYRDZMMkdXcWhrcnpWZjAvZVNSTnRBN2Ru?=
 =?utf-8?B?bC8rdmpWbzNGWlJsMFZDc3J1ZEZqZGp1OWt2MDBJV2M2citLZmJ3Um94RVZU?=
 =?utf-8?B?eHhPcEhwTXMyYmdxYzBwR1gzL2hCSzVNUkRPMmRhVU1wOEFWa25jVU8vVlV5?=
 =?utf-8?B?dkZ2TEdWbG01TnVpN2lpbkdxQ1Z3Vnp6UUo2MGRsL1o1Q2dURTZZNnhEZHFk?=
 =?utf-8?B?czhhMEwzUFMwYmtOVW8rUGw1YnNwQ0E3YmExMzViY2xJMG5PS3RodWIrOXpS?=
 =?utf-8?B?RmxUTWVrbGx5cEhtQjc5RHNKQUQwOVFGZlJscHBLWWpZK1RleFlESlhmeDYv?=
 =?utf-8?B?MU1sYnFoRGVpKzYycXV0UDVmV2J0UzN4bFVPYnhkbUhMWVJ3NDFmOWFzMWlh?=
 =?utf-8?B?d29pc2pJU0E4RVU3L0RZMnhTNW44NGE5cnRsMFRRQVlDRGplV1FQdXhHYWsy?=
 =?utf-8?B?N1FETTFncVgrWS93VWJnUUY5VVJLMEpicXRYL29pNzFIaEx5QkExZTJMN24y?=
 =?utf-8?B?N1lkcHZCRHhTWUJ5Vld4QVBJcWt3Vk5KOGNZc0ZrVlp3N3BKMnFoVlVuak1a?=
 =?utf-8?B?a0lVc3o5M3JuaEtSMlR2MFV2d2tGWHcwaks2d0pETU9JYVNZQVZPQVZWT25H?=
 =?utf-8?B?UVQzK1FMTGZzNEt4ZCs3bFNzQWdPNWRiYTYwOGg3enBCQUpjaHF3eDdEODgz?=
 =?utf-8?B?c0xlakVSbUZwb2w2UjYwYkNLbHZBZzhPZlBUV3JXK2FaOFZSd0dFR2dNek0z?=
 =?utf-8?B?TmhibGhXb2t2aDFuMWVXZXExdTZoOHFoY1ZLb0g4U2ZaOWovRnBhNFl0QzJY?=
 =?utf-8?B?UGhVOGUwbUM2L29HYjRWbUtxM1NPSGgwVzFVQ04rTzhqRFpPOXBkUnRHTllR?=
 =?utf-8?B?TlNwcTlVVUtUV3VJcXo5ZU1qZm8wQm5Xa2VMRVFVUmJHZ2QvTEFpb1orN1Ns?=
 =?utf-8?B?T0dBUmVXcUxJeGN2WGxXRTVhYlF1WGN1ZVI2dXpWNFFzZUVJeVRKREFhOFNY?=
 =?utf-8?B?T3N4UDNJbTZ3bVUzNWNLK3htNGR4Q2V5NGNGRDB6V09sQmd0UHBReU42cWlU?=
 =?utf-8?B?NEdUd1FXMmloUHJqRmMyWTJDU2ZmQnc0MzJ2OFZPbGFkL241RGMxdTJteVRG?=
 =?utf-8?B?c2FtVTE0c3Y4ZlRiSnFTakVMbUp3b1FLeGRQREdPQ2RwMzdhcWxSSVZjaHZy?=
 =?utf-8?B?Zm0yK0IrcVk1Rll6MFkraG9lbDgrZTJVNkdEZ2lUNVp2ejU3VzVvT2t2MXJN?=
 =?utf-8?B?NDV1WUFpUkUzY0ZFa0ZYUytYZDNOZXRMN1pXNms2Q0VyVUZoa21oMVdnclVU?=
 =?utf-8?B?bEpXOE4wWStWa1p1KzVaOXZRZ2hyajJvNkk4QlJpdmY0SjBJZ0ZqRTFwVUxN?=
 =?utf-8?B?bVdYUis3eXNNZmlmUU4vMXBLazJQM1o0Uys2RmtpaVpoWWM3WEN1WDdhWllx?=
 =?utf-8?B?a09wamtoTWNoRjgwcGpjb1dBRjF2cEM4WHJVWWRBVkExbElxa3RYSHBrQnBG?=
 =?utf-8?B?U1FHb2pDbG5jWHd4ZkxxK2hGbkErNS9aOTZudlBmQ1IzYXBLUng2blhmRjVV?=
 =?utf-8?Q?8r+HK9BVhfNgG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e429bd12-61d4-4074-d9b0-08de5999771b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB6873.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:34:40.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7142
X-Mailman-Approved-At: Thu, 22 Jan 2026 11:23:24 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kancy2333@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,outlook.com:email,outlook.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,SEZPR04MB6873.apcprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 9686E65EE3
X-Rspamd-Action: no action


On 1/22/2026 5:25 PM, Neil Armstrong wrote:
> On 1/22/26 10:15, Konrad Dybcio wrote:
>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>>> From: KancyJoe <kancy2333@outlook.com>
>>>
>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>
>>> The design is similar to a phone wihout the modem, the game control
>>> is handled via a standalone controller connected to a PCIe USB
>>> controller.
>>>
>>> Display support will be added in a second time.
>>>
>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +    fan: pwm-fan {
>>
>> I'd call it fan {} but gray/grey
>>
>>> +        status = "okay";
>>
>> You can drop this line (nothing disables it)
>
> Oops will remove
>
>>
>>> +        compatible = "pwm-fan";
>>> +
>>> +        interrupt-parent = <&tlmm>;
>>> +        interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
>>
>> interrupts-extended looks neater
>
> Ack
>
>>
>>> +
>>> +        pinctrl-0 = <&fan_pwr_active>,
>>> +                <&pwm_fan_ctrl_default>,
>>> +                <&fan_int_active>;
>>> +        pinctrl-1 = <&fan_pwr_sleep>;
>>
>> fan-pwr looks like an EN pin of a GPIO-controlled regulator
>
> Probably, will model it as a regulator
>
>>
>>> +        pinctrl-names = "default",
>>> +                "sleep";
>>> +
>>> +        pwms = <&pm8550_pwm 3 50000>;
>>> +
>>> +        #cooling-cells = <2>;
>>> +        cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 
>>> 255>;
>>
>> Does this come from a preexisting map?
>
> Kancy ?

No it is not a preexisting map. I add it(and the thermal part) myself to 
get dynamic fan speed control work. Perhaps you can also use userspace 
fan control daemon instead of hardcode it here. In android the vendor 
control the fan speed in userspace too.

Following block is what the stock fw defined. I changed the granularity 
to make fan speed (or noise actually) sounds more "smooth".

```

cooling-levels = <0 64 128 255>;

```

>
>>
>>> +    };
>>> +
>>> +    gpio-keys {
>>> +        compatible = "gpio-keys";
>>> +
>>> +        pinctrl-0 = <&volume_up_n>;
>>> +        pinctrl-names = "default";
>>> +
>>> +        key-volume-up {
>>> +            label = "Volume Up";
>>> +            linux,code = <KEY_VOLUMEUP>;
>>> +            gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>>> +            debounce-interval = <15>;
>>> +            linux,can-disable;
>>> +            wakeup-source;
>>> +        };
>>> +    };
>>> +
>>> +    pmic-glink {
>>> +        compatible = "qcom,sm8650-pmic-glink",
>>> +                 "qcom,sm8550-pmic-glink",
>>> +                 "qcom,pmic-glink";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
>>> +
>>> +        connector@0 {
>>> +            compatible = "usb-c-connector";
>>> +            reg = <0>;
>>> +
>>> +            power-role = "dual";
>>> +            data-role = "dual";
>>> +            self-powered;
>>
>> Is this property interpreted at all by our setup?
>
> Kancy did add self-powered, but it does charging so it should be dropped.
>
>>
>> [...]
>>
>>> +    sound {
>>> +        compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>>> +        model = "SM8650-APS2";
>>> +        audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>>> +                "SpkrRight IN", "WSA_SPK2 OUT",
>>> +                "IN1_HPHL", "HPHL_OUT",
>>> +                "IN2_HPHR", "HPHR_OUT",
>>> +                "DMIC1", "MIC BIAS1",
>>> +                "DMIC2", "MIC BIAS2",
>>> +                "AMIC2", "MIC BIAS2",
>>> +                "TX SWR_INPUT1", "ADC2_OUTPUT",
>>> +                "TX SWR_INPUT7", "DMIC1_OUTPUT",
>>> +                "TX SWR_INPUT8", "DMIC2_OUTPUT";
>>> +
>>> +        wcd-playback-dai-link {
>>> +            link-name = "WCD Playback";
>>> +
>>> +            cpu {
>>> +                sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>>> +            };
>>> +
>>> +            codec {
>>> +                sound-dai = <&wcd939x 0>,
>>> +                        <&swr1 0>,
>>> +                        <&lpass_rxmacro 0>;
>>> +            };
>>
>> 'co'dec < 'cp'u
>>
>> [...]
>>
>>> +    wcd939x: audio-codec {
>>
>> 'a'udio-codec should be way higher
>
> ack
>
>>
>> [...]
>>
>>> +    thermal-zones {
>>> +        cpu2-top-thermal {
>>> +            trips {
>>> +                cpu2_active: cpu2-active {
>>> +                    temperature = <38000>;
>>> +                    hysteresis = <2000>;
>>> +                    type = "active";
>>
>> This is shaky.. let's perhaps reference each thermal zone that you want
>> to extend with a label.. Or maybe a pair of labels for 
>> trips/cooling-maps
>> per zone?
>
> Yep, will clean that by adding labels
>
>
>>
>> [...]
>>
>>> +&pcieport1 {
>>> +    pinctrl-0 = <&upd720201_active>;
>>
>> Is this a regulator?
>
> There's s 3 gpios, the 3 are required to have the controller to show up,
> it could be 3 regulators and a reset line, I don't know. The controller
> needs 1.05v and 3.3v plus a reset signal, but I don't know which one
> is which and if it's really regulators...
>
>>
>>> +    pinctrl-names = "default";
>>> +
>>> +    /* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
>>
>> DON'T SCREAM! :P
>>
>>> +    usb-controller@0 {
>>> +        compatible = "pci1912,0014";
>>> +        reg = <0x10000 0x0 0x0 0x0 0x0>;
>>> +
>>> +        pinctrl-0 = <&gamepad_pwr_en>;
>>> +        pinctrl-names = "default";
>>
>> Is there a hub connected to it? Or does it go directly to the
>> aforementioned (game) controller?
>
> Directly connected
>
>>
>> [...]
>>
>>> +&pm8550_pwm {
>>> +    status = "okay";
>>> +
>>> +    multi-led {
>>> +        color = <LED_COLOR_ID_RGB>;
>>> +        function = LED_FUNCTION_STATUS;
>>> +
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>
>> Would a label="xyz" be useful here?
>
> Probably yes
>
>>
>> [...]
>>
>>> +&tlmm {
>>> +    /* Reserved I/Os for NFC */
>>> +    gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;
>>
>> double space
>>
>> Are they all for NFC, are they all required?
>
> They are reserved, usually for NFC to be used by the secure enclave,
> but we don't have nfc but they are still reserved...
>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 07ae74851621..fcd5a1a45803 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>>>                   };
>>>               };
>>>   -            pcie@0 {
>>> +            pcieport1: pcie@0 {
>>
>> pcie1_port0, please
>
> Ack
>
>>
>> Konrad
>
> Thanks,
> Neil
