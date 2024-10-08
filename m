Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A44993F2D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DF10E476;
	Tue,  8 Oct 2024 07:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="nOhw9rxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D7E10E476
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at8yv1jWoyEDYCLqpfPx1A08MS8n2W+7j93SF5+BhDGrpxUHYH74mDa7VHE2PKJgwYk/cXFXw47LA5KuYc5Xh5dHfaixW8Ksx3YUs2qua2h1YK/uYSTAuqHmmn68TqlaZomdgfZ3bqcSE5JrPlxfsb95lw7CWgqabPcZ9p25v4CYpo/6VKEfr+sPtHO42mdOk9S9mSZzDvJeqU5MrgBZiihWq/fMegynvjPJ0/HSsrgbNWLZ94PHmqClIipeh54d2yrf2dqG1T+XAYRn09kwqebRQLWEAv8EnRUxjRjdpgz0MjbdoTga8AjEZ0GI1zlUjuYU6IbbxK4vRPUA16Qzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUruL5k9+OK7riKsS6YoZjbz87Ux8/uIwhX1x6uFdzI=;
 b=TyTFr8/fTMP045RYqAG0IRedeaqAI2FsUWZiVbqUIlAyCmGv0ua6rsRbXbBk6jppFMJxd7SgNdW9VKSC3It6dXvHQM6x6zOn/aJDdnyhWJPGQAtVMMxWYR21vUBwkobehB3/c4jglLyPsJBNEpOVmuLhM7MXFqvaTtiKSpLi09O+ZqpYV+tR0b0MID78GE9xaA69qjZdtbKoZfDx0eyS1nipZozqfKkbYWrVA8u96KeyhCuSDldyDXCQc518Me8MruccmbRmCGpfwPIwXIc2PLDfJvp4l9KTIgcUfl+R4boL+8bvKM5kDe1iw127TPogYx0RlVNP4TP+0+FWeKxXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUruL5k9+OK7riKsS6YoZjbz87Ux8/uIwhX1x6uFdzI=;
 b=nOhw9rxaLWoKxlS23evzpkvtbRwXyjLl2dkbf132HUnRH4juKbJeN6qYWtws/8iU1uLRIvR5SJVXxHcyQZqzaE6yhytAtdnbcTdMXycoZ3x4y0pIQvfVSExt7gQIgn1Q96KPIDFs4UQB4aKsNw6CiM2Cdrd0DHKEy9VwYF3o/ko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAWPR10MB7294.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 07:17:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 07:17:37 +0000
Message-ID: <97ee0863-b68a-4f58-a193-1342f7eff359@kontron.de>
Date: Tue, 8 Oct 2024 09:17:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: display: panel-lvds: Add compatible
 for Jenson BL-JT60050-01A
To: neil.armstrong@linaro.org, Frieder Schrempf <frieder@fris.de>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20240828074753.25401-1-frieder@fris.de>
 <20240828074753.25401-3-frieder@fris.de>
 <813cfef8-6464-4927-be2d-55fef1104416@linaro.org>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <813cfef8-6464-4927-be2d-55fef1104416@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAWPR10MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e550dc-318f-4e4e-4d21-08dce769493f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW5XVUFkOU5OUUNtRUhCMXRJd2p5dDZBSkJlMm1mWHM0V1ZSVUpnMjFRTTIz?=
 =?utf-8?B?VmVTSzY1SS8wVHFMWFMwSVIzTUV6OUNtZDNpcmJLSTltUVRLQmRvT01SUnc3?=
 =?utf-8?B?WWdTOWxUYW9JemxwWU01VWlhbE5IV2lvdTduMlpYU3pWNXRIYU9xWnRlTUVa?=
 =?utf-8?B?ZVVIaC93ZW4zUVdReUY5NkdkVmhncDhzaXpnVEZkRGZYMC9TVTFHelJCRzNi?=
 =?utf-8?B?V2UremxKZXJPQ2tlN0IxaFdudG5Sb2UxYyt1SjNJM0d2NWxoTllQR05mMG9C?=
 =?utf-8?B?U3NjaXRNQk9SQVVQZ2tpa3R1a1EzRDJ5OEdseU5JUWM3Z0kxZ05OMzBPajMv?=
 =?utf-8?B?TmdPb0tTNXpFZm9xVWFtY0Y2NWVKNkkzaVZDa0Jmc0tQY1lXQmRkeDRhQXlr?=
 =?utf-8?B?VzQ5WWl2Rm9TbXpJVmdRSWFCRGd1N3dYR0I3aUtsUy8xRkoxQVliNklXa3Vy?=
 =?utf-8?B?RisxNUdRNzdmclNnbktRU2dONU53ZXZUTUU2N3lGTVB3eVFoTHVLTUY1L2pJ?=
 =?utf-8?B?eTVZMDA5ZHJjN0JCb1lqWXVocXpXK01XVitSTkE2YllWV3pvVkQ1empLNldF?=
 =?utf-8?B?d0thOCs5eXZ4YmJJK3c3WTB3eXJuSjlNaGdHeG5vd01XL1VVZ0llaHNaNFhi?=
 =?utf-8?B?Q2ZRNEpjbUZvUk5wTlhQQ0IxMnl4azFvRnR0ZGYrWFV1QWZSWFpqM0V2NVF0?=
 =?utf-8?B?d1htUlRwYmtEY0g1UVdNMGxxd3IvLzlxZFVSNUxmRGduOGtqSFBsUVRmZmU1?=
 =?utf-8?B?NGF4R29ua1FhUG53QjVXcmxzRFRzdGlYb3R2ajFibFdjYzZsV0w0ZCs0SDdo?=
 =?utf-8?B?MVJ3L25LaFVuOS9nWW1nbUJiVC9yK09SVnl4OU82cGVzQnU2TlNzckttbVR3?=
 =?utf-8?B?YkdDMWxZczVFRGloQmxSQjdqVEpOQUpsKy9VTFRsd2JBVHU3ZURiSDE1enJS?=
 =?utf-8?B?NlpHN0htWGp0a3BlR0xrSHFidmZLTEF3VGk4WUVaUzZmdkNyOVNIZ3FQb2FO?=
 =?utf-8?B?a3R3eTFEMUI0WWlabW5PZUNwY2RSSjdXa3ZDaGJFVnVRSzkzMW5Gc0dGWjJN?=
 =?utf-8?B?NG9jckJ5NzRXNk11UGxwcEFGd09zc1BWcE4zeEpZSmk1TmhYWDlrSmdadUYv?=
 =?utf-8?B?M3prOUF6cExEUzZ1blFXY1RRRnZUVlo0Nm0zcS9CZVQ1K0s0NmhxSnpOVmdF?=
 =?utf-8?B?QmE0VDA5bDQxSkpNV0ZkWEUvcXM1SW03bUMvTlQweFlwMlJCRS9vOTVJN0xu?=
 =?utf-8?B?aGJZUVphbGlQMjRoRk5MTUVVV0dic09jemJwUnBseGdvUUhKUCtGcXZSLzhR?=
 =?utf-8?B?eW5oQ0cyQSswN0J2S3ZjZ0JIUjg1aTMySXhDenBxWU10d3A1VW1MNDZqYlVT?=
 =?utf-8?B?MjlDNmJMUHkxMVRsMUgrSFFUbjdvZ2krQ0xSL0JOTk1SQnN4REFQOWlYNlVh?=
 =?utf-8?B?ZkwxcEJYM0E5N2FkN2RzNVQwUlhvOXJjV05lVFJVK3NpdWJUNnUzWEpJbmxk?=
 =?utf-8?B?VEVNLzdNU2NNVzdHUTJqdU5HYzVQZWliVGd5ZEVBenEwSDEwZ3kyNHlGejFh?=
 =?utf-8?B?akkxdS9DMnVSWHNoSkJqMkRKY0FKSXVlK0NJSnVQcERGV0NMejNzUXhwbGdJ?=
 =?utf-8?B?WnVrb2hGSEFNbk96OXduSEEvbnNuRE1zZEZqb0FlbHozUkljcVdWRXVsMFQy?=
 =?utf-8?B?MnE3MFU5Wk8rVFhPVEpGZDFuaWJteGJvdVhWOVY2UXc2NzhSWlpDTUxNN2ho?=
 =?utf-8?Q?doHzI6BAulHDSpCFP3XYdKpulE57Kv/BeqaZ4YT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhXOHROdnlGTjN2T1ZPS2tSb1lhUmFNcCtrK3V0NURkQlZYeXFZZklBbzBQ?=
 =?utf-8?B?OW5wVC9KdHBVK0lSUXRhU2VHRGJZeS9reXdpVjl0MEwzVHlkbVlzNDN2T1JK?=
 =?utf-8?B?ZmRiaGR2ZGRIMTF1TW02eFpHM0hPMkM5Wkwwdk5EYVQ5QVI0TDJiL1ZmTHFh?=
 =?utf-8?B?R09Ga21zeDRzNWRQUmV2NitraTR3dmdJU1NZUFB2RldDUTFKeFdYRzJXL29r?=
 =?utf-8?B?YjVsSXk3Z1VQdGFRQTlkZHdmWCtDT3pnbGtPWHBUMzBucmpUNWluQmMzT001?=
 =?utf-8?B?MTAzUFpOaE9wQ3YwZjRxaS9CWDRTZDVkeUptMlcxM1ZPd0pxM2NJQUgzRGZN?=
 =?utf-8?B?cU9SQmVmRmdhOHVEYTVIcEQwL0F6TXNxUzhoSWp4M3QvcUFiMFU4QVQ3VkM5?=
 =?utf-8?B?N2dNWStqRSszK0s4QjJiYVRzK2xFbHZoRzVnMWRvU29BekFHK2dncGVlL3Z1?=
 =?utf-8?B?UURnVWVsay93aU9mRzdpVVJCd1EwbWd0QnZHWWNiRUpRLzlhN3dPeWJNdEZT?=
 =?utf-8?B?aEhZRTl2ZGptNDhBOFBjaXVBQy9VUEhaNVIwYmgrUncrOGJSOGtOMVhkeDJI?=
 =?utf-8?B?QnRNMWJjNFNMVXBqaWNMWlZCM2oxV2FNMlA2YUpCWGsxbWNKQmwvaVEzNDZC?=
 =?utf-8?B?U0lqczUyRzI4MjQ5c0x2dXVYTU85OHhXTEtPWXg2K0g4eGhJbEt5dGdqd2g1?=
 =?utf-8?B?cTlQc3g4eFNQbFhQem1FSUw2ZitodXI5a3FqUXFvRzM3QUJDdXpRc3d1R0ZJ?=
 =?utf-8?B?Y1FqRjVHVWMyL3VQdTZVelRlY051RVZnb21mYVpFd1VEaVM1VXdqbnN0Z3Bv?=
 =?utf-8?B?Q3dNMmhVbWdMTG1ZSnlRVGxQMWNBTzFGNGNCdFpmaXVqQkphVzczK0F2M2pn?=
 =?utf-8?B?UGNJWUk4UkZRMFVLVG5jalJkQ290VVYrK0lLdW5aaHNWa1ZTSkp2YXpqWTdL?=
 =?utf-8?B?Yk9xd1h3b3ZpbFJ0aktTYWQ5WUdLSmdBaE9KaVZKY0xDMGVPNlY2Zzl1OE1B?=
 =?utf-8?B?Q2hQOW94YW02elNOdllmQjhxejREMmIyZFFBMzUrN2E1NHNYajM5cDFmS3Qy?=
 =?utf-8?B?VmNhTFBpeGxUUi8xTm02ZHpQc05iUEpnWGpFdWZDRzM0TGJCbTlMRmFFZ1hq?=
 =?utf-8?B?dkM1NU5NT3VMTTcxeGNGYWJ0UVRkK3NJeCtCYmplNjVyNnpvZFRyemdtQVRu?=
 =?utf-8?B?Z09BcTJvR2srSTZMUkNTcEkzQ2FZM25XNktUM1ZUUnh5SjZRZCtVZForUmVi?=
 =?utf-8?B?dmVPTUN5WjRkckxWZ0t1WkdNWW1PSmVuM0Q1M2FHcFEweXpKNjZ6WlFIazFP?=
 =?utf-8?B?aXlaY1BpZ3BJeWFabEZNbnhWaDFYSGFkdVdmYXplREFQYnFaakhyZ3NxZkNn?=
 =?utf-8?B?emFVZzI4R0E1eXB5RlpnM3RDZmFkRy9qNTVFQms0dm5rWjcrNTdWRmhERzVt?=
 =?utf-8?B?V0JKekw4WjZFZkx5RnoyWW9nMXVYWm1URUJ5WnA3S2k2b292R1lsRVRYa2Mw?=
 =?utf-8?B?ekg1NFFHdGhCZkdwQ3BERnNmUGU5QjAwcUE3Rmloemh3b2tvMHNvU0I0QnFL?=
 =?utf-8?B?YmN4dXl4TmZlb2xtUkk1Z2trazIrVVQ2dFR3MnkwUEU3WTRCQkxMUWJ0SnRm?=
 =?utf-8?B?OG5hdDVYVW5uWU9hSkxtdGVwL0JQU0JaQ2diUE80RWlYSVl3QkVGR3IxNEN5?=
 =?utf-8?B?NUVwY1RUeEU4ZCtDZDllUkh5T0Y3MnNJMnNFY3ZDc3g4bmRaMGduVm01cHRD?=
 =?utf-8?B?Mkl5T3p4bEltVVFqajE2WFJjaGh1dW5Ba3M4aTU2Uks5bVltTGJMVU9nYnJi?=
 =?utf-8?B?MTlmNWlhb21hWi9KY0pqekZ0V3RrV2l3T1Y5U2hJSTZZNm5MbmJQUEphQklv?=
 =?utf-8?B?RmVhZmRSOGlYZndIejNTQ3ZxUzdRV1phc09LdWc0NWk5aGZMcms5THVKelll?=
 =?utf-8?B?TTlZcTdHejlKZmZab1RhQm5SUCsvU25UUlZlMEhtdlQ0KzVac1pzdzNxbmlq?=
 =?utf-8?B?QUNFNStHY0NWWHM2aW1EZzM1MEVzT2FPY2FHV0hibGJwTjV6RGNjb2txblFj?=
 =?utf-8?B?QlBaYUNUT2hkdlk3ZlRvV2VXTEx1TFVMQ1R1Ymp1bFYyb3NicjdOcjJuQ2xX?=
 =?utf-8?B?cVhCZm1TQVdjQVR0VHpjclZJWmJIRFl5RG9BTXg1VlFkWUplbmwxQVJpeEtT?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e550dc-318f-4e4e-4d21-08dce769493f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:17:36.9780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1RhZqbcBLx7ih+9YytWbkaLuuEInwZ0ViwwoNR2lMi2cBJSgC1LhupCDfM2Qfog5kyfkGo/TYVDa0A6DL23TuZJjL+N0in/MjLLYGwICJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7294
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

On 13.09.24 11:18 AM, Neil Armstrong wrote:
> Hi,
> 
> On 28/08/2024 09:46, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The Jenson BL-JT60050-01A is a 7" 1024x600 LVDS display.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Changes for v2:
>> * Add tag from Conor (thanks!)
>> ---
>>   Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-
>> lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-
>> lvds.yaml
>> index 155d8ffa8f6ef..5af2d69300751 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>> @@ -50,6 +50,8 @@ properties:
>>             - hannstar,hsd101pww2
>>             # Hydis Technologies 7" WXGA (800x1280) TFT LCD LVDS panel
>>             - hydis,hv070wx2-1e0
>> +          # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color
>> TFT LCD LVDS panel
>> +          - jenson,bl-jt60050-01a
>>             - tbs,a711-panel
>>           - const: panel-lvds
> 
> How do you want to deal with that, I can apply both patches 1 & 2 to
> drm-misc-next, is that ok ?

I'm not sure who you are asking, but to me that's fine.
