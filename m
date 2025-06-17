Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7EADC1FC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 08:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF5010E4E5;
	Tue, 17 Jun 2025 06:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="VDDokp3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazolkn19012049.outbound.protection.outlook.com
 [52.103.33.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E3010E4E5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 06:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY7qA4Yw63DG/RmJW2fioUdviijXdancU3hP+hXr5pn9WZ5yjtdic0+U/XgnwLZHWSjUtNjlt5UcRfX/8X32Yj1Qz/n0Zw1uctBdi6Fh6eukiQnZFdUNu4ilEN5m1awLbkPf2/akEO7sV4iPU/Wf+W4dUw+Zl1SJYQ19ryKF9NlZXwPqp7eYdUGVnnVTiurUBmvVVlZS6o7I7M9js9gD6WepHWka2iZo7L2iZpXyArvKSDG5OixXM8wihbzwALisdAoGOPKvwJsbaFfMQOrr9+0DeSuTQo5ewfAPLmzSDcshiIovjNZRth6fRpIJn1HPETM9CzqHj6/FhSPCCigUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51NAUk2+AP0SAD7L5SBRbUzggKa5mTa18JiVpiF7mX4=;
 b=EiTYpH0484ZjrQJPpCmQ7TT3bg/XI3ymkYGsIZcRb8kGLxwOo3w0Jn2NbxHFxnlF4MnQtbL/aYdsMSL33mJLaeQQFP09KqOelm1IFsu5o8kBM/wHF3p6EOICRfNlciCsf4b2Gnx6L4vDz/3XbgK55p1WD8qC6Gc42Bem0o9MoA0zvSnomPIsX1jhWctyM0ndhGJDEYh1Ayo5Mz14FCapdx08vLnJ+DF6jSLGBQZUeeQ8+7KtWFniZYSOJBBoZnBZFFjHqiTK3lmhO5hf10myqSBGJur9/+n2BJCsozNs+xj1R52/JDRYM6Mm3GkQlBJmpYdSOSOoF+FzxniVoK9BCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51NAUk2+AP0SAD7L5SBRbUzggKa5mTa18JiVpiF7mX4=;
 b=VDDokp3wMcwzhQHTOAxf9liMY7DPvG2T4jDYQPXGT0KKxpulyDDaRqx4Icc4tik9/9kQ5p9L1SuFY4gLWJcnJf+4c8iR0wRysVcpG3RCZPrJj7b1muFR3XvxrsFu9OS8HhKW1DxP8Yk2yaRkS6eWlNYgjooMBw6Zt+gZaBXZr91Bqz5fv2Cfedb5iqnLMFRt1+JBvTknCbvka45EsWZPgxqpIoFL9zN2Ycmwcc3L1mFAMXXvaW6RtfrI2HHNRhSdTgomWOq1tlUELWccZ7jt97ftK43odi0un8DAhNkvJIDG/HhYKT5IYVwx57LAWtuzdS8S2LcRKqkkcuHL/auCHg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GV2P189MB2163.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:00:31 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:00:31 +0000
Message-ID: <AM7P189MB10091A1D4F0C98898780079EE373A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 17 Jun 2025 08:00:29 +0200
User-Agent: Mozilla Thunderbird
From: Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 0/9] drm/verisilicon : support DC8200 and inno hdmi
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 keith zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, william.qiu@starfivetech.com,
 xingyu.wu@starfivetech.com,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 kernel@esmil.dk, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <AM7P189MB10092D0348FC9E0A70C911E2E3D12@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <CGME20250614185401eucas1p2ee3104b2054057c27a757b99f6b1a748@eucas1p2.samsung.com>
 <c7df0d84-93a6-4a9c-b911-515d0816d899@samsung.com>
Content-Language: en-US
In-Reply-To: <c7df0d84-93a6-4a9c-b911-515d0816d899@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0346.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::20) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <83f5cd09-30c1-4bf7-94b5-33fb2db2887a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GV2P189MB2163:EE_
X-MS-Office365-Filtering-Correlation-Id: f830b2d5-af90-4527-1127-08ddad6443e7
X-MS-Exchange-SLBlob-MailProps: 3QTjV0QDnj98t3+9UBvodFFIn4dQ7EeLOQXjIRDKy6FkCFRABma+OBZvl3KUkcCNvxFhRgVMEcD5s1SwU3WZNhWswVVpq9bW7KKLxnLrlqA+xhuieSkpu3oZL/OtFE/kE7+0SgnHygKVtLHOyZdLf4PrKUpvIzk5Xq9Ca3kdg5FOlRlBY0cKFeFQu5MXgNUqbTzQabkd8t2g7UpnZeDg+VZlnLUMX2676qhvdxGZVs8IP/WxkdO0goIhnBH/S/roxrVw/w4ULdFhFPWCszZ4qXFuGSUjJ36s4iStuJvo8iN0U0IODXF4AaBP5OfbusbLmbxn6RujjuRxSZtJs0y9EYPSaFYtuztYaVuV5QByH1OwAuG/5ZGvIb3ZzEPHh0NGSeSJppZVi1lJGk4PpeUeY6gKhv+dMj71kXkLqvnmMOV6uKrFLw87rSQ1kBJre78GXvfzg0boLFCOyVgN54dRoUFgQxpZAxW/XEYOPDOBjf+gdFP9geLviW68vDuGL+6EbregZVQ6rM1CfGz7ZZE34TD2I8fV9BPZPR9lo9takR6pMgfkUdmW7eU+6xuov5egKMjpr7B2Viiu7NTjN10hGOTt+UDznBVYfXoU6TCZDMTZyTlXqITT7y7s26bCeDe1mcvua0c2+CGW3LvNakV1NXyQXObiyK6kkRS4zy5+c32LeDr56MjH2lpwGv/wJRqX43KD3LyxflFFwOUghFQMPYUXnOFvhylyWvLho1AbNdL56y8j//P+iAFjde0NIsV851tzHwon69LAptLNsY09x2ttbQhwNoO4ZC4qlWJF/J6P628c0DF8ZCnHkzSsWdUOI/TYLIiWsCZ0ywsaZ03xjoL5l7vqCSNnsTkAmL7W/3y9w2Pz+SVAxA==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|15080799009|12121999007|6090799003|8060799009|19110799006|5072599009|4302099013|3412199025|440099028|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1hxUWtrN3JLRkFFNkRXenJLSS9UUU1TanA3Sng0VlROalpNNEJodFhkNEtY?=
 =?utf-8?B?R0FaajRieXZiT3owMUdwMk51ZGE3Z2VYZnRNUjhqby95ZG4xZVZMdVBXYXNa?=
 =?utf-8?B?N2JFUFpvSVZwMWNyTFRQQkc1RkVJTm53K1M3M2JUeHJNYUJhalh4bnNuRmRi?=
 =?utf-8?B?RHd3REs4UFBEOHdNd1RWV2RobGNUaHQyMHE4cGRadVMzNUlUTWRLRTc0TGE1?=
 =?utf-8?B?b202U0k2b2JFQnJYTHlvOEhiRGtFY2xiVW9rMEloalFFZmQ2d2tYTFV2cS9V?=
 =?utf-8?B?WHUyZkdMRUd1S0VEVS94UHBUWmlpYjdFeGl0VmNCNGhVYXpsdWNkdVZtVUVw?=
 =?utf-8?B?MTl3aWRzSThXRWVKOXJjWld3RG14eVAyaEpHd0hqb1pScDhRU2hTOEZQdWFS?=
 =?utf-8?B?RnJxK3k3OHhIWStqMmpVVUFucE81TVk2YVp0R0pqZlhXOUY1NjdCOFFGSEVn?=
 =?utf-8?B?MUxxWGpnTlgrWTVKMllQRGJLWjZmc2FoeFI1T2lYRm1ieDA0VUFjRytnVmVk?=
 =?utf-8?B?RTFFemp3aEhGSUhjeFdGZUl1ZXhJd25OV3U1Q0RkcmZJRjljdmRsUmN1bGdo?=
 =?utf-8?B?V25yOFR6NmpkK2V0bjN5dmVRd0xGbkpKRzE3QzhrSndyTFhtSWZBZXFyc1Z4?=
 =?utf-8?B?cDkrWlR6aXF1Vk1pTlA5bGtTV1M2bkxwam50bXRXeExzdEI1a2ZTdUNEZlZk?=
 =?utf-8?B?YmZxZHZyMXJIYjBTN0wzMHZBa0RJMWNBbzdXMnRSNTFrY25mSm43WVdkYUJE?=
 =?utf-8?B?c0RFWTVDRGdWWkpYMURid0t2cnVYK2ZpRzdUU1RMMi8wY2tGSHZpNDVHZ1hE?=
 =?utf-8?B?Q3V2czhPY05Vc05ZU2NLRFdNaGloQjNmNStWcXR6M3NnN3R5QVI0aUxVS0x5?=
 =?utf-8?B?dWtDYnovMGxkTUZyMUJGelV2MmNPQWN5NnplU205NXljR2ZCS2JFWk9wVHRE?=
 =?utf-8?B?dEcyaU1NNWlSYm5wRUYyRC9oUVA5d1NvWWpMdTZ0ckRwZWlQZFFNaWUzVHRz?=
 =?utf-8?B?RkpnK1hFUWpkL3VKRzZvNy8zNE1JRlFMakoyaytTWktuaVVmdGs0WURzdXA1?=
 =?utf-8?B?cTVoZkZycjlVUkRFNXhGMGVtTldxd1ZXQXlIRVdPOU4wcDZ6ZTFacmFaZDZm?=
 =?utf-8?B?VkhhS0NuUURwcW9WeC85YU5FdEtCdDc3NjFDTlJaM3JBUTdMeDdBOVBYS2p2?=
 =?utf-8?B?OFJ5NTgwMHR3cHVCWG1paWpZditnZXdRdWJKd3RsYVcvSG9VdTNRMEQ0MzZT?=
 =?utf-8?B?d3I3NDFoeWd6Y3ZGRW1ybU5aZVpZWHJCcGE5Rmc4WE8wNXZ2NVJkSTd6UWFW?=
 =?utf-8?B?anNrVG5NZ0RmamFVUHJ5UkxRcFpaL21MVWxTYmVzMDRZdWRyd1U0clJZMGd3?=
 =?utf-8?B?aUJMNGg4VlBicU5CV2tvNXA3bE5zZnpHbTFDNmFRb2hEWVRrUG9YaDk5TEZT?=
 =?utf-8?B?ODlGemJYejN0OUZGS09VZ2FWd2NGRXlvVjVsU2tJcnp5bndpTGgvZTE1U0N0?=
 =?utf-8?B?QTNCSEpUOHE4R3pQakttN0dpNFA5WTFHVGUxK3FZaHN4TG9vS3hYaHdJZnVU?=
 =?utf-8?B?OTEyS1Z1MlFIYXJpUW5BVkVuU042eWZiaWJ4YTM1dU9IUkVxcFQzUmtYWXp1?=
 =?utf-8?B?UXBnQVhkTnYwVnNmQnJiQVU4dkwrOWRoRGdOSFpKMHkrK0VLSjltQlhQRm14?=
 =?utf-8?B?Mk5XWkxKaTBuRkdsWnRzeVNUbGxLTERkMjBWejZMcVp1TzdkVXRuQXErdzdx?=
 =?utf-8?Q?4oN5yTQQLBKDNB20B4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzQ2bnlrcGFzNk9hTTZqVElPK1BsYjM4V3h2WTA2U0ZMTXg5YzRhbWFDUjJq?=
 =?utf-8?B?RjFNQXhQUmZiMWpsMFNXM29LdmR3azFiS1g3NHRUaDBlOEZHQ0pZdEo1bXA4?=
 =?utf-8?B?Nnkwc21TR0s1eGhRRXlQcDd2WXc5SW1oYkxCanRJRkY1VUcrYmNCcjZ4THhj?=
 =?utf-8?B?M05BZzJIUjlvbUhxUjJHenM3emQ3b1l0SmU4QTg1MHJtWFBNK3hlTFhxSnpo?=
 =?utf-8?B?NzJ1djd2K0YvWTBPTkN5cER1RFVLNFZJcEFkY2NsdE1YclY3OHN4dCtVNXA4?=
 =?utf-8?B?N2hFZloxSGRXNW5LNXB5MmlieGF3SEdXbHk4dGdGQ1c1dkxnTFc2eUFGUDQy?=
 =?utf-8?B?Ri9RUE84a0tZcllUemIxdXJHUE5ncG5CeW5neHh3UzFaUkNoT1JRRzEvd3pI?=
 =?utf-8?B?bFZvckNHM3ZBVFU1RkdaVGErRHdTVzZMQmJ1YjhIMzRXUmJkeERwcFlkUnRR?=
 =?utf-8?B?UWtscTk4N1Y1U3IvUEVFTHFWZzAxRUtNL0liQ0FQa2VBakZIKzBnSGZGRmdz?=
 =?utf-8?B?YjBlYjQ4NktzN1ZtYkpKdm0yM0k4TzZQVUFuNE5hTjZLOHRRVTg3bHE4YU5B?=
 =?utf-8?B?RmFPVmVTN3Yzcm0rNkxJNWNzd3ZPSDZ1SWhIWTlSYnI4ajc1ZnJDbmQzSmM4?=
 =?utf-8?B?NnBsTk9DQm1FR3ViSjFWNVZ1bGExaXB1dWwzazVSNzdZRjg5eXdqUnVBYlFB?=
 =?utf-8?B?eHR3RnFvY1lsOUV3N2FYU2ZrVTB0bjljd2hIZHEydTQxZE5pL2wrdXFEdkhw?=
 =?utf-8?B?b2R2YzV0QUNyVndDWUl1d3AzUjNHOXJVY0FhdWVsMVBqeTc3T3NROGFrYmQ3?=
 =?utf-8?B?TWNtcHRSSm9ocEZoR2ZuSmlzelV6QTNLMzgzNWcxSnJ4SjJNeGpMRGhxMzZs?=
 =?utf-8?B?MzhOL1d3RUFwQ053WGMxaTlHd0M5Y0trTDhnK1QxaHErVUdHS0h6R1VtQXJU?=
 =?utf-8?B?TDllVzN2Y0VVQmVYS0VyN3NXS2VSdDVIVkRsSWdLeVdDUXVnTGJrQXRpVkhW?=
 =?utf-8?B?ZnVxSnpxLytMODVXRVFma1RnajRCZ2tPdW1jRnpMbkdtNmNBTDhzWDhCSmFs?=
 =?utf-8?B?ZnBUenAwaXFtM3hERUlaQ3dJbmdZTVBkTExUMENsMzJLVENRWGI0SjZ2MXla?=
 =?utf-8?B?YlhCNVVFTm5PZFp5bHRJZXZUbGtSa2M4UGI2MzJXdGI1elJlZXQ2OHdUeVUr?=
 =?utf-8?B?ZTlINWJiWjJjV2JONzlxUm5ZWFhjUDlEMWRBMUU4VlNBWUlEY3ltaktuZVRH?=
 =?utf-8?B?SFpobnA2QkYycHhXRnNFZFBSZi9WNGFNTUNLREUwTlZSa3FRSi9QeUtsck9j?=
 =?utf-8?B?M21jZmdsaDRVckswZDgrM3lMNm1iRUlmQmdIaTFKemVVYkhuUmpOVjk2U1Z1?=
 =?utf-8?B?NS9Oa3FvSWJUVUJZNmgxd0t6eGF6SEtnUnRRUEJQMlYvakp5eFBDak9ENSt4?=
 =?utf-8?B?OXRCK1dhRVlCOG5DblVrdjdtRllETGJMUnA1QUYrTEkxcDg5UWJyVVM5eHRr?=
 =?utf-8?B?cjYwZ3NlU0RQUEpNcmxocWszSW04VjhxVDdsTzBGWkpQZFRVNnV2dkljVnJl?=
 =?utf-8?B?bzdUU0dmWDAwZUg3SzlWVyt3b2ViQnREd2xtN2VwNkJkeEJ6R3dDM3NkbE1s?=
 =?utf-8?B?U1BadCtLMTFvUVQrOVZhUGo2OUVHdHlXWjlza1ZRZnJqWDVWMlYwVUh4cHNV?=
 =?utf-8?B?cGdtREZNMWNZQmNDVkRwc1R4TURuRXRrUTZST3R5cXdra210SlE0RFVDT1JD?=
 =?utf-8?Q?nfnuwWns/02l2qfeTkS+cEeeZLKSNsRE/AZ8Hnq?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f830b2d5-af90-4527-1127-08ddad6443e7
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:00:31.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2163
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

On 6/14/25 20:53, Michal Wilczynski wrote:
> 
> 
> On 3/11/25 08:42, Maud Spierings wrote:
>> On 11/20/24 07:18, keith zhao wrote:
>>> Verisilicon/DC8200 display controller IP has 2 display pipes and each
>>> pipe support a primary plane and a cursor plane .
>>> In addition, there are 4 overlay planes as 2 display pipes common resources.
>>>
>>> The first display pipe is bound to the inno HDMI encoder.
>>> The second display pipe is bound to Internal custom encoder,
>>> which is used to find dsi bridge by dts node.
>>>
>>> This patchset should be applied on next branch.
>>>
>>> V1:
>>> Changes since v1:
>>> - Further standardize the yaml file.
>>> - Dts naming convention improved.
>>> - Fix the problem of compiling and loading ko files.
>>> - Use drm new api to automatically manage resources.
>>> - Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
>>> - Reduce the modifiers unused.
>>> - Optimize the hdmi driver code
>>>
>>> V2:
>>> Changes since v2:
>>> - fix the error about checking the yaml file.
>>> - match drm driver GEM DMA API.
>>> - Delete the custom crtc property .
>>> - hdmi use drmm_ new api to automatically manage resources.
>>> - update the modifiers comments.
>>> - enabling KASAN, fix the error during removing module
>>>
>>> V3:
>>> Changes since v3:
>>> - Delete the custom plane property.
>>> - Delete the custom fourcc modifiers.
>>> - Adjust the calculation mode of hdmi pixclock.
>>> - Add match data for dc8200 driver.
>>> - Adjust some magic values.
>>> - Add a simple encoder for dsi output.
>>>
>>> V4:
>>> Changes since v4:
>>> - Delete the display subsystem module as all crtcs and planes are a driver.
>>> - Delete the custom struct, directly use the drm struct data.
>>> - Tidy up the inno hdmi public interface.
>>> - Add a simple encoder for dsi output.
>>>
>>> V5:
>>> Changes since v5:
>>> - Refine the Innosilicon HDMI by quoting bridge abstracting.
>>> - Delete the encoder driver, which is created directly by internal functions.
>>> - Adapt to the changes in kernel upgrade APIs, such as drm_client_setup.
>>>
>>> keith zhao (9):
>>>     dt-bindings: display: bindings for starfive,JH7110 display pipeline
>>>     riscv: dts: Add display property
>>>     drm: bridge: inno-hdmi: add inno bridge driver.
>>>     drm/vs: Add Hardware Functions for VS DC8200
>>>     drm/vs: Add Base API for VS Mode Configuration
>>>     drm/vs: Add CRTC Functions
>>>     drm/vs: Add VS Plane API
>>>     drm/vs: Add Innosilicon HDMI Support
>>>     drm/vs: Add VS DRM Master Driver for JH7110 SoC
>>>
>>>    .../display/bridge/innosilicon,inno-hdmi.yaml |   45 +
>>>    .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
>>>    .../starfive/starfive,jh7110-dc8200.yaml      |  176 +++
>>>    .../starfive/starfive,jh7110-inno-hdmi.yaml   |   91 ++
>>>    .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
>>>    MAINTAINERS                                   |   11 +
>>>    .../boot/dts/starfive/jh7110-common.dtsi      |  125 ++
>>>    arch/riscv/boot/dts/starfive/jh7110.dtsi      |   41 +
>>>    drivers/gpu/drm/Kconfig                       |    2 +
>>>    drivers/gpu/drm/Makefile                      |    1 +
>>>    drivers/gpu/drm/bridge/Kconfig                |    2 +
>>>    drivers/gpu/drm/bridge/Makefile               |    1 +
>>>    drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>>>    drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>>>    .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  376 ++++++
>>>    .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   34 +
>>>    drivers/gpu/drm/rockchip/Kconfig              |    1 +
>>>    drivers/gpu/drm/rockchip/Makefile             |    2 +-
>>>    drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  690 +++++++++++
>>>    .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |    0
>>>    drivers/gpu/drm/rockchip/inno_hdmi.c          | 1025 ---------------
>>>    drivers/gpu/drm/verisilicon/Kconfig           |   32 +
>>>    drivers/gpu/drm/verisilicon/Makefile          |   10 +
>>>    .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  553 +++++++++
>>>    .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  194 +++
>>>    drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
>>>    drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
>>>    drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1104 +++++++++++++++++
>>>    drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  492 ++++++++
>>>    drivers/gpu/drm/verisilicon/vs_drv.c          |  777 ++++++++++++
>>>    drivers/gpu/drm/verisilicon/vs_drv.h          |   41 +
>>>    drivers/gpu/drm/verisilicon/vs_modeset.c      |   31 +
>>>    drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
>>>    drivers/gpu/drm/verisilicon/vs_plane.c        |  358 ++++++
>>>    drivers/gpu/drm/verisilicon/vs_plane.h        |   27 +
>>>    drivers/gpu/drm/verisilicon/vs_type.h         |   54 +
>>>    include/drm/bridge/inno_hdmi.h                |   56 +
>>>    37 files changed, 5630 insertions(+), 1051 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>>>    create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>>>    create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>>>    create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>>>    create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>>>    create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>>>    create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>>>    create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>>>    rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (100%)
>>>    delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>>>    create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>>>    create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>>>    create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>>>    create mode 100644 include/drm/bridge/inno_hdmi.h
>>>
>>
>> Is this patch series still being worked on? If not I would like to give it a try to fix it up and get it merged.
>>
>> Would like to get it working on my deepcomputing fml13v01 board, there is also a gpu driver for the thead th1520 being worked on by Michal Wilczynski that depends on this. Would be nice if that could get merged when it is ready.
> 
> Hi Maud,
> 
> Thanks for your interest in this patch series. I'm also keen to see it
> merged, as the GPU support on the TH1520 Soc depends on it. I just sent
> v4 of my series [1] with the last missing pieces to enable the GPU
> driver to probe correctly.
> 
> I'm not aware of any recent progress on this particular set from Keith.
> I would be happy to collaborate with you or take over the work of
> getting it ready for merging.

I've tried rebasing it ontop of a new -next, but it got quite 
complicated fast unfortunately. Especially the hdmi part, as there have 
been changes inbetween there. I have not managed yet to create a working 
rebase, though I feel like I also didn't try hard enough yet.

> I also have a StarFive Vision Five 2 board, and my plan was to get the
> driver working for the JH7110 first. The only thing different for the
> TH1520 SoC is the HDMI driver, which could be added later.
> 
> However, the main blocker is the lack of public documentation for the
> Verisilicon DC8200 controller. The official StarFive documentation
> portal [2] mentions two essential documents: "DC8200 Dual Display
> Controller DPU IP Exposed Accessible Registers" and "DC8200 Dual Display
> Controller IP Hardware Features."
> 
> Pinging the StarFive developers on this thread: would it be possible to
> make these documents available? Access to them is critical for us to
> successfully move this driver forward.

Those would indeed be very nice to have.

> [1] - https://lore.kernel.org/all/20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com/
> [2] - https://doc-en.rvspace.org/JH7110/TRM/JH7110_TRM/detail_info_display.html
> 

Kind regards,
Maud


