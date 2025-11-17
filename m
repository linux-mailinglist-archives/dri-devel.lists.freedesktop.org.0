Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299AC6495E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAFE10E109;
	Mon, 17 Nov 2025 14:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="Jba11VMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazolkn19010022.outbound.protection.outlook.com
 [52.103.32.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502410E109
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJlRhSWaL4CXqSQ5y7CKBX5gO9mcX7HdfOziGo42kErPY51k8q99DpwpT7CIcuelqlzziwUUMDK2gl5rggruumFcVbnVJ4g+xKf3K84HelF2WL75qrYkLJ0RI6mECc4BzRkPdUZB8KvpPpvUGUwZPj8/6MDTsqqdBDKebj58IWxWRRznVdOoKTGcF5E5OyfW/mRYYgEJs8s8FaM8ftpitaJJC4mkhnysXHreXP0o+YqoGBz76fYaAUmF1yA2zWSrmbu++88hc2bmKJ3+Saf1LsP7n3KAwvLrrhv5JX1V83dE0yVgL1/X/XNgmD1cfSwicokJ6Vfh34ySgJAVCePulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpydVwvsCjn6qQq2Gfn2vZf/0ZUf1HjA/OrOHQkE+Ck=;
 b=T7zswuJc9ZSYH3L79neOdWqVLFK7fg4jPLpBeSWvJyOMSvRUSRMR+nhF+njsSQBrZg55oq4Z+eQeu5BRcFFlR0St+dejcdcPkkCoQUQ7442pgNRKG4+AI7wBzWonmN2fdrehdCWliwn/YAE5M30pgxlNIcz2gDdlLVTP2k0+0us2W+DuaE+gJBBawUpyfNMBilbEUvzbGNxYelgsy9f/CK3tt7gFYSRUWC1WeIXzZIebZM0VE1Dww0+ui6uiyTHbPkOJZSQBfspZ6q+hDRCJDx/V1qt6D4PSHjM5A9Qtw+GYoQ8nxCL+dOMT9MoH/hGZ5j8qIUv7TqWcnCcnDiTaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpydVwvsCjn6qQq2Gfn2vZf/0ZUf1HjA/OrOHQkE+Ck=;
 b=Jba11VMnAqCKLkt00r0WA/uDPmlu8bOVCT25DNvyxMXR5Dfz8P6UiCyPgT3d6JkglpUjDiL6Zew3nF0Xd+NticAL0gXNJY5kJewcvzenkCoKxub9F9x4Fl1CIqpVlqsp3nxUn0SoGsIYF1LHa87mcFmkEiO79yj8lgB8J0lv9ykrdaO0gTJb1mRXje43k0KUSvmW08JXIF7HxYONBYFItYX5J0TB4fDWBq37XmPanixNZR09OVRlLcvNBD+5hFGF4ZAy3O0W04lCGaOiuRHCJtZcBuBUXtnI7NEKUKlWQir9JFX/ozRaRjq/CdpR/el8YF+M7lGuGshTHkrY3CkcHw==
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4e::16)
 by AS4P189MB2158.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:575::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 14:13:17 +0000
Received: from PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68]) by PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 ([fe80::89e2:ab64:8c13:9c68%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 14:13:17 +0000
Message-ID: <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Date: Mon, 17 Nov 2025 15:13:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0050.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::28) To PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4e::16)
X-Microsoft-Original-Message-ID: <ceaac834-e23c-455b-9e81-fc5f7bd6cd0c@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P189MB1020:EE_|AS4P189MB2158:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf9fb53-8d4a-4bb1-5e76-08de25e37411
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799012|10092599007|23021999003|51005399006|461199028|8060799015|19110799012|5072599009|6090799003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzQ5b1VqVk94Ym5xTm5iWGk2eTBWR2V2Q29RaVBOOCt0dTI0dFI3eStEWXlj?=
 =?utf-8?B?eFhIZGdJRVNyLzFvcUR3Q1ZPR0FNY2c1UWNvQ2xHTCt4NW5qSGt2Yy9URndm?=
 =?utf-8?B?THhsREFSOFFWOUpnN3dabkltcjlMLzJsdDE3bWxtNEU5Tmh4ZEtzR0QzeG91?=
 =?utf-8?B?WlNERjc2eXlhbVJWUWx3Uk8rV2ZuSStMemVTTTJGQ1dOTE9NLzJJUzRSaDF0?=
 =?utf-8?B?TDJLekx3WFhFZXFPQVNvSE5EcVBLZGRZU2lLNEhXUGtodlY0NHVUN0hZOWtP?=
 =?utf-8?B?NzJNanlDZEFJaDd6Y1ZyTEdIMkpqVHNvbWl2MU1KcEt0THdIeDE3SjF6cEth?=
 =?utf-8?B?VHovU2JwNW1tL1JQQ3ZCV0FSVzJ0cGliVFhkazZCcHYrZnVRUERwQWVqaGlY?=
 =?utf-8?B?YnF1cS9PQ0tGbWpkSnFzampROTdnRUh0REdoSlF0UDZHb0VvQ1dMdW9vZ3c2?=
 =?utf-8?B?REpBNDNndlc4aEFzVjFTMGdKR1c3Q0FoSEhQQk52d3pxWFBXL3NTVi93TEtP?=
 =?utf-8?B?cnM3ZzlFcmZnV2lodWdKaXo5VklsN0NMT3dSL25NNzdlQmViNFRzYWJQdzdh?=
 =?utf-8?B?bmdpUCs5dFhRSVNCTmwrNGdTSVMwY0t1S0ZsYVVKblBqYXhiWlduV293RWtK?=
 =?utf-8?B?cUFzRHNSNjJ0WVk1a0tvZkh3Nmo3ZzZ0a2lrRUVNS1VNRS9oZlRxWTJDSnFq?=
 =?utf-8?B?Y3NUT25icy9pcGphZlpYekczSk4xZlFsYnkxSjdpODhScE5kbmJIemhiTkRR?=
 =?utf-8?B?Y0lLMkI3U0tUSFBQTE1oOE1YUlhNTHkzWjdEV01hd0tPN2U5S3QxazJJUWlw?=
 =?utf-8?B?QUhrVU1vVjU0V0hJYXVuWmoxZTBtZm5SN2psNXBQaEVocWQ2RmtaOWlMVVIz?=
 =?utf-8?B?OEhNQS9Va1VMVFN1RHcxZFhWWkNhMHo0b0JSWGJ0Y0hBMS9OZEQ2SUdZdGFR?=
 =?utf-8?B?QmFPT1NPaVhOYjliNEE0eEEzalBkQnB3RnQrN1FmMUltdk83akxaWUdkSk01?=
 =?utf-8?B?bU1UT3dCa3R6RmREdDYxWjRyYWQ5MC8vTEYycHNqYk11N3UyU1BYa21ZNEFx?=
 =?utf-8?B?WXpJV2lhM1VadkVkUlhkTUVxbDJHcUFTeXY1Q3dRajc2VFVnQVo1aGxrcTNh?=
 =?utf-8?B?QXAvWUliVllmU216dFNRN0xZUW9JYUxpZllIVXlYNEJ1blJmenF4amVYWVBV?=
 =?utf-8?B?eDVtdFF1RExRK1RVMDhGMmxueWYwR0t1dEN6ZlJnWFY4b0ljeUI1RjNEdkc3?=
 =?utf-8?B?dXB5RWdYL3lEbWlBaWgxWVdrdGN5K3FzclVxR2JtN2pMQTdaRDhmMGJWUmdK?=
 =?utf-8?B?VmNmQWQzTWVKWjkzK05BN29Bb21MWDloNURuTFFCcFdySy9Pb0ZQUHdBY1U3?=
 =?utf-8?B?WUhZb2RiM0l5OGtZQ20xR2tuWVZnTGtURzVBb0hFWDFmcm5CYThRSTRiZWxE?=
 =?utf-8?B?RjZOZWFuUHM1RmFtb1VPRWQ1d2dWeklWWmlZcWhPR3gvNTFtaWxldE1KT3g1?=
 =?utf-8?B?U0dVQWxhTDBST2RNUExodGxrZXJaSEMwSURZYUQ2REczdWdtNlcwTEkvMXRH?=
 =?utf-8?B?NWp5MzBSME96QXJhdlU4ZFdwREdXekZmM08wUE9HY1RET1FhaXA0eFBBWVgr?=
 =?utf-8?Q?lCAZ1efDDTym7IQwIf20Fht7GoWIkVtj0sc2/RHbTlso=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tCSE5HR2U3V3NzQjhRZlc3M1ArVTg3VDNNa0VMMENJZG5LbE94SjJQa2FR?=
 =?utf-8?B?UmJLZTZLcU9Oa3Znc2ZhTG5pa2Rxck15SFBRRXlFTkxBOFdHNUhaVkNLQXNM?=
 =?utf-8?B?ci9sUjZUYWtPdzBQeFJBVmVtT2pZNzJYd1V4dHpkakFrZ2NVZlFPYjlIMXIr?=
 =?utf-8?B?d3VlWkZxVmhLT3dUUFRjTUFySmp0UEk0ZnRlcTRSN0dNL0ROT3o1Qy80V3NK?=
 =?utf-8?B?Wm9wRzJDOEF3SFc2RWE2SExlZFNXRXFSd0REb05mRTM0dEtlOWxOVU15d2xT?=
 =?utf-8?B?NjhrWG1PUEdxd0Y0blhGRmRXd3pDQUFwaWZvR0lnSGdpZGVxdmEwWGR2bDEr?=
 =?utf-8?B?NWRqa3VJZWhnNmxGZ3lFZ015VUJMVDNwdEhZRjNXdGptNDMzdFQrTU1WSUp5?=
 =?utf-8?B?ZFh6UmxoRlVvbk5La2Y5djJ2YktRYWVQMjhIU0JrYmZteGxOUXVQU0JNUVNJ?=
 =?utf-8?B?SENtdzNNQ1pBU0I0b0ZmWEZLS3BLMlY3WGs5QzZIVzZWd0VXb2g4TnIvdUNF?=
 =?utf-8?B?ekdvYXpCMlRmMmNSeFdaQnAreVpPMjNGOEhJZGhiNFNMcUlxMVVEZnNxdzFY?=
 =?utf-8?B?NnRTMzZaN0lhWE0vaXBxdVYvaHlSek00YVFjVnVuWSt0eGowWGUzbDE5SDlJ?=
 =?utf-8?B?Sk5JejdtSDQ3Y0NaRHBtcTdReExKRnV0aG1rNjZGNU9KYmJ2aXBVeS9FYW5k?=
 =?utf-8?B?OTk0a2ZwNGtXUGJFZndtNTNuSlZNOXcxYXU3ZnlBYWF4UVZucXVobGp2NHRY?=
 =?utf-8?B?WXdNWlFlc2VZaGl5SUxNdWVBM0RjWElkNmMyZEJWbjBVdlFzNHlmTy9Yb2Jw?=
 =?utf-8?B?eXp0akVYMU1BbHJoYUJJbXppVjQvc1ZTbUM1NEdhelBCTHVoeTBmaFl3WEM0?=
 =?utf-8?B?dnJyK1JvRU9xS1JBUkxUdEtPaTdxTkJFclRuNnpFajNVbFR2WU9RUDdBcUcv?=
 =?utf-8?B?TytFQU9PTVdOK040QkR3b0ozbG1aa1hzLzhUVzNYbFpEVGhoZUlaWjZDYVJ5?=
 =?utf-8?B?dmNvOXJOeThsRVFHcElQTnlIdTdWd2pqNFJHS0dIU3V5S1pFUnFNK1U3bXBT?=
 =?utf-8?B?WUpUWTVUUUMxUWxSTDNrbmtrc0w4UW81anhOQzdaQmdDMktKZ1BKNmJLZVk5?=
 =?utf-8?B?MnZIUWoxcDNDMWVYckJaQW9uWjhTWjhXVFdqNHZTZlEzdGRPcFBPb0FuVUNO?=
 =?utf-8?B?NmdyNjVXaFZEV3VtdzZUNXBUSEsxVUlaU2hBZFNXZWhrbkRhSmN0TlJ4dlZx?=
 =?utf-8?B?MHBtQVMweExVNm80V3U5Y1d1MmlsSU9McWFUOWxqYmtrL3JDQ29GeVpsWXgw?=
 =?utf-8?B?czFVWWlCWXhadUthbjVYeTNNR0JRSUJuaWdNMzh0Zm1wdlZkL3pNQ0RvMHBT?=
 =?utf-8?B?dTNCemhmSE9LRmtpRStPdkVKRVRjVk1FQUxBZ3cwdkIybEh4eU0zQkxpcmQ3?=
 =?utf-8?B?dVRHMy9iYjZrRFJyUlRqbGE1a3BaVUl4WHdQNHJzMlJ5TllMWmFuRWlQcmhn?=
 =?utf-8?B?b09hUG8wTEthRzNKWXdWVmcrMXF5M2x5NUV2ZDB3NXpnM0l1aUk2MEpmNTVN?=
 =?utf-8?B?dWYwWkdsbXJoeVRUMngzTndjY2dxcThwV3Q5ZlVIcnFvU1l6TEZ3ek5WUGo3?=
 =?utf-8?B?Y1pZTHZpM2xkL1JsNnpCTDNiV0tvY1ZHWGZVLzd6dUx2ZGcwRys2SzNLOThk?=
 =?utf-8?B?NjNoQVYwTEFNSDFsaCt1Y2hvOStMVzFRaFlMKzJtSnhmU0NiZHRrQkFxWTU1?=
 =?utf-8?Q?PYMncsVKC8th1woLjk0qHaIGCUZFD8r0b9/DM6X?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf9fb53-8d4a-4bb1-5e76-08de25e37411
X-MS-Exchange-CrossTenant-AuthSource: PR3P189MB1020.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:13:17.1038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2158
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

Hi Konrad,

On 11/17/25 13:59, Konrad Dybcio wrote:
> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maud_spierings@hotmail.com>
>>
>> Add nvmem cells for getting charge control thresholds if they have
>> been set previously.
>>
>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>> ---
> 
> Have you verified that e.g.
> 
> connecting the charger
> setting the charge threshold
> rebooting to windows
> rebooting to windows once more for good measure
> rebooting to linux
> 
> still has the settings persist?

Hmm I have tried several things but I can't seem to get the values to 
stick. I the spmi-sdam driver is compiled in, I am not quite sure if I 
might be missing something.

Kind regards,
Maud

