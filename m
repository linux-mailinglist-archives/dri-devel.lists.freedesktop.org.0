Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A399A5C52
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 09:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57310E142;
	Mon, 21 Oct 2024 07:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="eKamUIes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2132.outbound.protection.outlook.com [40.107.105.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E8A10E142
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:15:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPUffj3VCtsGE7UpIUTTBi42o7B7iPZgfu+LWaOhRfU+htKZh2ikxoo53/iD1PSb24ZwT6Ip6kq2s+un+WdM1ctOGUv7uUpN1g9ThAHPdzfG4OADNYKzVeWiovxLPPEKKAXE+9mGYUhTJS3tRHMmVKPLfLtJ46vhtTQWFYqyqaV7wi22DFimV2Grc8/MKNqRtGdK0jZ/Gi5PCUDsWy9BCsDl46D7WFWisNdLPauJgFQgqcl6DR5S48neudUsgoIIV3hSnkSFFsn5RNdtFGOAKxQps51vJxn2E1+vAkSQ/UC2pgCzaTkHp0pILv0EAG9OeyVtZrMzPOUWdj/+VRL5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctd0f6L4K1XhFc7JeBoR6LmMSQMEs5ngVfPaLiXd+BI=;
 b=V68Bbilpx1W6+rWwh7lFhvIa2d9prd1QWrwCitYl+BRmzHgj1cU75XLhbrrew+wJoPNUlfCIwDr3b/qcuQN1yqYuHt4BTiPN02cAD48xdbBf4hf1M48xTZAbWFMcd3jRYIGHMn58qzHpC9ETYLFlowNIiM+z4CSZIcCpJGVyzsYEHzd6UqA7t8d6uuayL1f6YqYjeyF+yjy1s/uHxKlOzxVfiz6qU9A0G+vqHg9S5+W1nj7gRlXG7oRY3TcQahY3Ji0itMETMJuQeCwZUGCfyCz990G5IIL1PTtDmXbn2YyGjAKju2uFGFUz2TLhHzsawpdQJQbdyVqzhL8/rPV4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctd0f6L4K1XhFc7JeBoR6LmMSQMEs5ngVfPaLiXd+BI=;
 b=eKamUIesA6Wm0e+2OtZ9h9OY9EvzMwH39USqhh9i2IayNgQ1yf/KLDTky6V4JdmE7etr53y6xH28S2+Qg6hHyqqP/sPuEFJhxlLWW4Mu6Ws4/fcGXAzJQh3WMaIPWM0UTKnwiuYWqeICGKVsdMjPA/GXyW+8Fg5R1JX+0pBkLJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB3501.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.15; Mon, 21 Oct
 2024 07:15:39 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8093.013; Mon, 21 Oct 2024
 07:15:39 +0000
Message-ID: <48e42fa7-f36e-4d38-b60b-51c9a6748de6@kontron.de>
Date: Mon, 21 Oct 2024 09:15:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: imx8mp-msc-sm2s-ep1: Add HDMI connector
To: Marek Vasut <marex@denx.de>, Liu Ying <victor.liu@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 stefan@agner.ch, dmitry.baryshkov@linaro.org
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-4-victor.liu@nxp.com>
 <69cc9c59-99c0-479d-8143-63698cc56111@denx.de>
 <4d1c434e-e7bd-4e53-b110-1f26eb06c59c@nxp.com>
 <06bb1733-1742-4847-8436-8f9d8d4b7c46@denx.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <06bb1733-1742-4847-8436-8f9d8d4b7c46@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB3501:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f299f1-036b-4dfc-cd07-08dcf1a02aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUJSWEpkKzlxZlE2bVNFNnVuTGFtVnZCU2I2ZHkxTEJwVzdxT0VaMWNIak1v?=
 =?utf-8?B?c2NSNEpRVWlxKzJreEJyaXd2S1pIUHlCeHVBaGZUK3J4dFVxdEVqaWNoMEFR?=
 =?utf-8?B?Q3ZUb3ZUQkxLeGtOOXVZeWNnaVJoUm9GRG92T3VUenRDc2IxcTJ1Z2M3V3BG?=
 =?utf-8?B?cTUzOHBlN09PbE1KWnlueXFuTWtZVHIwdmszT2JFSFFHTU14QVBaUlV1TjRt?=
 =?utf-8?B?YXg0eFBVZWxENE04dGpwSE5IYXhveFd6cEhTa3hydkZWWnVnU2pPQWFjS3k2?=
 =?utf-8?B?TUZ2MzZPeWFXKzE2MWEweUdJMDlxc1A0R1hwSlZyUlFlRlVlK2hKZVdzSHA5?=
 =?utf-8?B?WHRYYVhYcEdBangzN0lNeENFdXB1eVcrbUY1ZktWSzFHaSs0bnYyV2c4bCtH?=
 =?utf-8?B?TGpEb3o0emUxZVlVVzJYYjROZjAzdUlKZDFZOTE1MVJOMHdNR0dycFMycEZo?=
 =?utf-8?B?M3AzZ005akNoQXFldmFoY0xKbjVRblk2NGRoRW5pM3l2ZHYrMW9SdFhwV1ZQ?=
 =?utf-8?B?YnpLRkxzVURkK1MrMS9vRnloS2lwT2xmMW1PY250K1FMK3pjRDJnU0ZGRC8r?=
 =?utf-8?B?YjFUSVJlRzNFYmo5UEZvLzNPYmZIczlxZVFzUkJwNFhTTkY4YUpMNnowb2VL?=
 =?utf-8?B?Y0x3YWM5eFJmRjVQNy9yMkxva00ySkJhcDRGa2FPem9lSGdZSG93RjhTMXB2?=
 =?utf-8?B?VVkzZjE5T2FZZkxSU1MvNnNLMWRTZkY0VTBFNzZ0OFZyS1hRUUQ0cEd4QThG?=
 =?utf-8?B?aUZaNmtJV2x6c1h1ZytSdjk2cURCWmRjZFFiV1hwV2ZZaU5XRUJLUTFuWTU1?=
 =?utf-8?B?c0pkR1hPWUtabmw2OW1hWVlXYmtSMlFuTUhBQllWbHNBcG8zMGVQTmdSMFd2?=
 =?utf-8?B?N1YrMnFtYXJoQnZnaXFycURSRmN3STM5UTlpcERVUFl2cUFvZGZIc2hNMFNh?=
 =?utf-8?B?ZU5XZkFtdzhLWEdBYzRSUDVaM0k0elV3RkdUYWhBazAza1RpZG1DbVlTQkhF?=
 =?utf-8?B?MnZhWUZKc3lNOFNaUGluY2N4RExyenRPN25oRVNqTUwxbHhrLzlnNVQxTHJ2?=
 =?utf-8?B?U09HT1lBbVFwcFl5K3ZTSjZtZnVUR01VSklUNHRnYXNXc0ZtTDdZbUZBbUQ3?=
 =?utf-8?B?NU9HekFEQmdMa0Z1Tmw3TUtwOEpUMkJLK0ErWVZMSWtmbTJadlh0eC9uVWVr?=
 =?utf-8?B?bDFPMEpobzRYV3orSHR1NVlTVDZaL3Buck52U3lsR1FGNDYxQmFiblVWN0NX?=
 =?utf-8?B?YXhuZUhrN3Z0cFA0aGlxVmVib2luRXR5azk4cGNKdjlMMHZZTDhmTm9PS05J?=
 =?utf-8?B?bU5pM01lUXRud0FvY3FMaVRGRmhJWmFmRHpLUUkrYldUMlNuUmRtY3BaRW1Q?=
 =?utf-8?B?ZTZsWVdqZ1pyT2hRdUdKbGxlUkRlRlUyczlSclhKa2JUNmVTaWNEMCtPVDRo?=
 =?utf-8?B?YmxPSEFKTTgvb2lBaG5sR0ZRQmFxSEhiVHJWR3g4SnVGL084VkNUTmFzN00x?=
 =?utf-8?B?WFNmU3hpSmtMYUxKQUd6dlVobmJjd0VUMHpxRCtLbzkzSEdudnlQMk1aUEdw?=
 =?utf-8?B?aVNneTgrQllRRUxweTViTHErczFGcXFSU0ZBVXZsQVkxaGs5OVFuM1cvcUF1?=
 =?utf-8?B?ZHlUQzg2NHBYb2tVVXBrSVlsM0NBS2VFdXhjSjlVT01WNjhHMi9uYS9YR01F?=
 =?utf-8?B?RmhFN05uTER5UHpjWlFwZ1VLcnMxcC9WSEd4RW9TN3FvR3JFZEhHVVMvaDZX?=
 =?utf-8?Q?rIKnBZ77P9kC19oqOW6nkE57u2FO/ZF7/itBVJ8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpheEY4WWRkZjRkUXdkMzBjdEdwbkI1anpVVGRFVGRnMXNBMkJIak42YVVo?=
 =?utf-8?B?bHcyNkxOdnlYNm9zeXpuc1I5d3JXZ0RMRXNMYThocnFZb3FjdUlqNDJ2R0Va?=
 =?utf-8?B?eU1zY2VwYzRZS3MzLzBKQ1I0d25OZ3VJNUhlSnVaZkVaZzNETlRtcGdnc3ZS?=
 =?utf-8?B?T3d5Q2xtc3NmK3RJUmIxeVRadnRxZWRET3pZcnNETUgzMXZEMG55TGl3amFN?=
 =?utf-8?B?c2NhczFqNmpzMHFTdC9tUi85aEI4ZzkyWlB5QjFCZ0tnMS9nMmc0OWRvd09Y?=
 =?utf-8?B?TVlYd21IOWUweG9iR29ka01sOVppM21OekVuUmxXZTZvT0pxMkJkV3h1NkJF?=
 =?utf-8?B?ZnN1ZEQ1Y3ViMmw3NEdGY3RjS1BpWXJzM0xSNm5YcVJsRHlsUlJRRGQ2enpL?=
 =?utf-8?B?bDVicTk4aEZialRzQUUrdkF3U2FBODBjTDY1ajJuUXBYclFneWxCTDhJdDZo?=
 =?utf-8?B?Q2Fwb1Q2dkNXaHZ6QzVqNk0wWXlXOWcwamJ4dlM1QUU0U2dNUy90RXpjdDIz?=
 =?utf-8?B?S3l0ZUkrMEhkblhrZFdUSTRHL04rV2N6UGpuT0Z5ZjVEWHVtZW5RWVp2MzI3?=
 =?utf-8?B?TUhyRGs0emQrNVBuRkVEVFNYK2tmWmhETHFWQU9ZdjlIU2Fia0J2VFJoN3NK?=
 =?utf-8?B?WlRscWtGdkNuQm9yV3N0ekQ4MkJQS2pKWjVWY1hVZkhManh6M0MvR3crcnFu?=
 =?utf-8?B?eVBTTWlkSnAwVUVSaUxuSjUzTkZVOXpwK0crRFVESStKYlp4a3ZZdlY3MmJG?=
 =?utf-8?B?RmFVcFJGM2NvWERhMW5YZXcxbDAvYllIeXR1Q0s1a2NFdXErU29QM0hHWE1N?=
 =?utf-8?B?VGpiMUxuOUNhSUlEeS93WU83bmhFTXZ2NEMxSS9ma0xETzhWQzBZbkdBbmFC?=
 =?utf-8?B?bVNSMUNCNEd2QkpmYnc4eXdMRTUzYXBxbjRDMFdhNkFtL2pGM1BqZTB3TjVV?=
 =?utf-8?B?SllIQ20vQ1lLNVFGcnhIaUpleHVxOG1JeHZUclU1OEpzMnRXWDRESnpzdzBl?=
 =?utf-8?B?bFBjZjhualJXd0xzMStCN0d4NjlxUmZsOFJQM1BOK3prYStJSW0vRXZGTEdv?=
 =?utf-8?B?aTgxUEZHclVRQ3c5M1ZMczZpZDlCVkJMM3FmTXl6ayttTkxtY0hReTl6MUFp?=
 =?utf-8?B?YnZ1Y1NLcGVPa2JTTXVLeWFzS3d6QUU1cy85bHltNVJrYnVydWFmc2Zaa09p?=
 =?utf-8?B?am50MjRsV3liVWl1TnBBdTIvL1JGaVlxZWN0dGtydUJTcG9LYWlzQ01RZ2Jn?=
 =?utf-8?B?N3hvMVhEWHlEbEZVaUVRenMzWEhQbmY5LzZJb09yajhjWWVuWjU4TUNwRU1h?=
 =?utf-8?B?RXlVUWVPdmJUV3dqeExQbDNQeVJMdkE3a2RXaWR3d0M5QTJacEpPdU1Mb2xD?=
 =?utf-8?B?d0I5Sy9aUWx0RG5Ma25sN3hZaGhqc1pGbWJuTFhHaFRuTnpHQnByVkJYK0tn?=
 =?utf-8?B?blVTSkNJeU41dExFNC9RTlcrdVpuMkxyR1pEcWt2RjliaXFGRXhaMVN4ZzhP?=
 =?utf-8?B?WC81bjFyS1gvTkVsSHAwdUZHOE5hZzZTVE1mRUd0NS85ZkRRQ1hXc2w0cGxi?=
 =?utf-8?B?WFN0ZEp6aW1tR0t5MFhQd1pOSzhEaDhZOGVESDkwdUFTN0I4VWFqSnhIWkdI?=
 =?utf-8?B?TFBNeHZRd0VRQng1VFdJQytQdGh6S21QNGZJYjZqUCtNdkprODU3czkxS1dC?=
 =?utf-8?B?MnU4dGZ4bjExb2RhNVlQcm1zcDRNdGJyanErbVQ4M2pUNUFWV1BMV3ZKeEFi?=
 =?utf-8?B?WlhZOHVaQTdYYVhRU2JMYUpqVjF6K3BmVU1FeTFMelI3QnVPWGUrYjQycDFq?=
 =?utf-8?B?Nkpnank3UElqWGZGUFhjN0lHOWlmK0w0UFg3WnlkL3lqRkxITTA3L2xsek84?=
 =?utf-8?B?VFV1d1RXM0FTcDBlTkxlWUk0RHpBQml3dzJoekptbjROSE5VSVdtUDUwaVhH?=
 =?utf-8?B?VC8vS3pEVnd2VnYxazI0RTZUd2ZFenZDYkJWd3UwalVXUGtmUi9hWlhHblFu?=
 =?utf-8?B?R2l4WVdQdmRlZ0VWS0hBUWR5R0hKREdPUlJEaUU1c1ZjaVRxblFvWFluVjY4?=
 =?utf-8?B?SU9YaXRUTm4xZE5IaGZtQXpVelU3Q0hhL2tRQTBtSkFxeEltekUzaDZtcEkr?=
 =?utf-8?B?aTVCZzhod1ZFOUl4ZFJqRFUySHVndlZxWC9YZkRBaVN0Y0Jta042SnhtNVA0?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f299f1-036b-4dfc-cd07-08dcf1a02aba
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 07:15:39.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiqdcfRANHJRtcurj254bc/gVm9P1foZ0AIeUKkouPDb8ZrEXvOgV9QJ8mp82ygDSI5/Q+KYxri7KeXHdivvVdjCGLTD5HqeQzISaE60z4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3501
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

On 18.10.24 11:35 AM, Marek Vasut wrote:
> On 10/18/24 11:00 AM, Liu Ying wrote:
>> On 10/18/2024, Marek Vasut wrote:
>>> On 10/18/24 8:48 AM, Liu Ying wrote:
>>>> Add a HDMI connector to connect with i.MX8MP HDMI TX output.
>>>> This is a preparation for making the i.MX8MP LCDIF driver use
>>>> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>> flag.  With that flag, the DW HDMI bridge core driver would
>>>> try to attach the next bridge which is the HDMI connector.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>    .../dts/freescale/imx8mp-msc-sm2s-ep1.dts     | 19 ++++++++++++++
>>>> +++++
>>>>    1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>>> b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>>> index 83194ea7cb81..b776646a258a 100644
>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
>>>> @@ -15,6 +15,17 @@ / {
>>>>                 "avnet,sm2s-imx8mp-14N0600E", "avnet,sm2s-imx8mp",
>>>>                 "fsl,imx8mp";
>>>>    +    hdmi-connector {
>>>> +        compatible = "hdmi-connector";
>>>> +        type = "a";
>>> Shouldn't this also have a 'label' property ?
>>
>> 'label' property is not required by hdmi-connector.yaml and there
>> are in-tree hdmi-connector nodes that haven't got it.
>> I tried to find schematics for the board online, but failed.
>> I don't have the board to see the label printed in silk layer, either.
>>
>> If anyone can provide a valid label name, I may add it.
> For the Kontron board, Frieder might be able to look it up for you ?

The Kontron PCB doesn't have a silkscreen label for the connector. The
schematic has the label "X801" for the part and the signals on the
connector are prefixed with "HDMI_CON".
