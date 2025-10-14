Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE1BD7392
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 06:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DE710E1B6;
	Tue, 14 Oct 2025 04:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dt7YhnQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53AA10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lop7Y5eZOmF5JKjlQGYUJ/ce0PYXwGqPv2awncgWexzHxjfaBE4t3/MDW5/StV8omBwxWQOQc9jYFOO5md/z3xvtQAPUvYowwUMgXOdHgXDR8FiiC5QNlVuClRTNrZpduPo7I00bxR2ny/lQOShAYtVy7EsXv/R6MOrVzIx7izs8gZxa7jjY8tBemHpnnEDVMZRzAMUU2PhWmOPkxVGAUfRIctjtMe60Ry6u0efwM2SsX7DQIAngu0ezQP44PUxKyO436O4E6mwtXkWyL4nq8nUTRRkCyJPJAsz9lGn0px5/N+2K9gHWvk43YweHTJB2+HiRCGhb/NHBUP0zIrOEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPTtPvxANn/jgqeXI45GUvyo3xqZzbayXhkieKKSHew=;
 b=qFqD0twJzZEee8pz4muAAdS94xiFXvKi52eFOcViql+CcqZ6pSMJVdPybXb4CJYY5dviQDk7feJDkLlTLe+OBtJQ1VRpacp8gucH5wiSRreoIUNtNurE2YFsCKv2Uo8rtB/eyAkg+OftzZtqSnVi+IvHznBN3Zwx2pTuOGebFAy7rnv3StNB4rFL7uWyVS1eiez7Wov6Kcc4MQZprUFCWzzsVrTCWBhWjwATPeZZKY5cdoYzlIFvBKep1W+r1pptneq8OmbC6RRKkJ86TJO1rDKRrvldIgB9gPcT+yJxeHvv6FK7g9NqV99HmSXtqSsopFj40LThZKIViDDRSrZKAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPTtPvxANn/jgqeXI45GUvyo3xqZzbayXhkieKKSHew=;
 b=dt7YhnQZM+Ng6gYrXWINK9txkqHAWBfZSTOgqvmxF6QydQAv6nza9hmd4omP3hgWMaexE4ZTdhu6cBsgHj54IMiVcdUETlpY+6qs0hnyX4TY9WrU8wfWtB1y+xeLosHjZurYreKJmstf82r0ur9UjeO0LmlEhNxJYxAwF0OOWpXOciqcNxqEpXJte+Qn0Rq/UD3QrSyDz9BdAWlwQa3yfacJzNVM2P1im/4DpLKfpNOkKy6wfsIKxbGSLVLwPHvUCX5IoUA0vAw9P3SpFXpDFuWchpVlq/wTOP2VcRF5BQalkVRRRig8UZHdMddZ4yFNADeDV0ZccVvuJyMQp/+GHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 14 Oct
 2025 04:12:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 04:12:12 +0000
Message-ID: <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
Date: Tue, 14 Oct 2025 12:12:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
To: Fabio Estevam <festevam@gmail.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20251013205155.1187947-1-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d86468-8db4-4354-e5dc-08de0ad7d9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1FlSWxEYUI5STBtcVptaVo1RjQ5YzJOVHBCbUxScGc4QjVadnpydkptUUJr?=
 =?utf-8?B?bHE5UW5PM2xQY0pLWklCZE9Hc3JXamdKTVNDQTZtN2VBd29OaTgzWnRlRHJX?=
 =?utf-8?B?UnFCdVhsdVh4amJ6N2FPQkpDZTVsajFGMDVXMkJEOEJxcTM1TnpiY3VVUjRs?=
 =?utf-8?B?MTgzRWFYS3l2QWpva1VqazV6Ty9CWHpqSjBYZHRYNExHR2lRaVhpMHNUNVpa?=
 =?utf-8?B?YmUrK3hUcGNNWkM2RzFjdzdMU2hvQ0wrUFMrT3lQUitOblVuQldXYllSUGh5?=
 =?utf-8?B?QTg3VXZZQW0wMmk3b0ZvSlh6QTR2VlhOQkRNS3RhZkdjdHRWQ01lY0NBL3ZG?=
 =?utf-8?B?dkhNeE5HdFRvZWhMbGdnYVN5TGdqbEhPQmwreUp4QkhzRnZWQmFoWEcvUGIy?=
 =?utf-8?B?cEp5Uk8wNVVQbDZOV3pFNVpTZmVIRXo1ZklvSlNxZzMxU3BzTWhxTXdGaFc5?=
 =?utf-8?B?RlZSV0pOeTZOR0Z2bnY2c1o1MEJYWkZiRncxTzV0Tjg4Q0V4WkhNVEhoRjl6?=
 =?utf-8?B?dkJGbUNjc2YraXBoMTJiaVR1cmE1d2pkcE1xeXZkTkIxelZZei9UV3FoaXJ5?=
 =?utf-8?B?bFYzcVBRMk9obG92dkVVVFEveDdzK2ZWNU9FNmxYcWNyN3BMdFIxUHFFanFl?=
 =?utf-8?B?QlByVFhvazBCNjFRUXBnM1RDL0lGZEhSSjRrZDVoWkIyd3dDWXgwdDVCelN4?=
 =?utf-8?B?ejQvVHphK1JPS0UxUVhHWUh2ZUdlcXBRZkhhdzYzczlTRFc2WUQ4VndPL3Zt?=
 =?utf-8?B?bjF3WWNDQXdkL2R4TFpEOTE1cndDamVHUVlhYVJ6M2hveVFJU0w2dWhJY1V2?=
 =?utf-8?B?OURudXRTdFNBOERnbG9oMHFmeHJTeGJuQVNsaTRVMmFKZ3NGYXZCY0g1R3JL?=
 =?utf-8?B?YmhVTklpQ0dUeFU1YTYvdmFTRmlLZWJBREFQUFduVjRFS2FDa0RueHZYeitC?=
 =?utf-8?B?L2tWUFZFUlR5Y0pwV2xmU09JeGhMQU9ydGsxU3hxR2lZWUxqQWVtWlJRMmt0?=
 =?utf-8?B?Y2hUL0ZHLzM0TFhEWlFLNXNreFYrSUs5aU5uT2JlemFCY0J2dEI3YzdFVVFY?=
 =?utf-8?B?TTNFYWlieXExRFNJVVdoRVU1RmtEZGM5MXVxeW0rOEEySGFzNVhtTnMzWE1n?=
 =?utf-8?B?N2dmUnJ3d0tFSGhkOVF3NllHaERTb1ovU0swUUsxNHhRYk0wc0cvY2pTQWhW?=
 =?utf-8?B?TXlNYXZnc1RGZGNqYTNmbXFZNW5sOWVFMnYxbm96dG0wcWt3Qk51bGlsWURj?=
 =?utf-8?B?RXdnYkMxNTBtR29LY09jSDVHams2Y0ZDSTc0UEtvRDF4RnpaRUI2QXFLUzJo?=
 =?utf-8?B?bktJRlNDb2U0VUV4dmVIZGExdEs4TzlGcFpTRExtSXhDKzB3K0dKUmY5bk9H?=
 =?utf-8?B?RVJzTWFvY1o3Q0ZsS3JOQTJGSmlkMGdIMDF2c003TVliMUJmczRSRW5GaUR5?=
 =?utf-8?B?cWpaZ1ZsUnNqSWw1em5BMkdNR1JNVk1uNnVuWG1sb1crWWt5VHY3djhvbVNI?=
 =?utf-8?B?TXg1VE1QSmR5U0MzeWQ5NThTNjBjelQzVjIxWEw4NzZPVFdpWUg0V2lNKzdn?=
 =?utf-8?B?REdVZFp4bTNBTEVqam44dlFFWkhqZDhGTkF3WnZqNVhLa2JBWE5jc1Fmbzg5?=
 =?utf-8?B?V20yZHpaRUcwTFhrODNXVzJ1VkpuSThwUVNUcEp0cWM1c050WVoxNStZUHU1?=
 =?utf-8?B?YlJFK3p1UXRUaWtEWUk2MGpGTS9DTEhaZUc3bElwZGkrZnE1bG9DYjFZei9Q?=
 =?utf-8?B?MTR0N1RibHBvKzdPU1o1dzFrUFR1S2VjckhMTTBWc3RoREpZalJZSkdLWDBX?=
 =?utf-8?B?d0tiUHlJM1RkNGtvaWFFMnJKRWVMMFJzc25LM2xGanN5c1lJMjh1Q0YreXVF?=
 =?utf-8?B?bWtvaDI4cDg2L09hTER3YU5ibVVVeG1ueTFsT1RQVjNIUzNTMjVXUDhWMHZw?=
 =?utf-8?Q?+FbjTgOJa9RYBlnTwjTOwZOL8P9uMgQ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdXRzVlOFcwSjh3QkNGTEZjMGdvOUdDYlFPYWhwanhxQWZDTmIyNlNYUEts?=
 =?utf-8?B?QkVSTnV0L1grYkdENzhlc21Ccm5aZkxZNHJ1NmU3bzQ5YUovUG5tRDBNU2h1?=
 =?utf-8?B?M1pUbkUyME03Z0c3SmNtZzdxVW1leGRCcDN3S2tRMVVBcWNEZmo1c3FEUGtv?=
 =?utf-8?B?Ymo1alRhbTI5YlU1aXcrdTEySysrV2ZFdFdEcDZTV3NBYUxFUERNTHpmTGd0?=
 =?utf-8?B?aG4yMERRbk82RDZkbjF5VUgyZjdYVTVDeTd6L1VmOWdJOXpXM0tnMXI0aTdo?=
 =?utf-8?B?WmNmNkpXUUs5WlZIeGVlMXdOcXVqMSt3V2Q5OFUwQnl1bWU5YkM3T1Urc3p3?=
 =?utf-8?B?TFFZRGlxZlR1WDEvYWt0QmdoL0F1LzFGWFJzYTVxYVlyWWtCYllpZ1BNMFF4?=
 =?utf-8?B?bTQybW1vUytjTU5YQ096V2podE04YzBxN1NrY1pzNmxjZ0s1N1d3YW4xMjdq?=
 =?utf-8?B?a252Lys2M3ZGZzBzMER3Ykh5S2d3SWQ3UFVrdTZYMXNsdE53Mms2K05KcVZY?=
 =?utf-8?B?eFZtMjlPanNsMXpaZmk5SWpFVEhoQ2syN2pScGlvUE95Y1hRdGtoZERkVnJn?=
 =?utf-8?B?ZWlhV3J0MGZXVlFCdEJvc1RQdTYyWHliK3E3R2dWTHltQXJSaXljRVVQTE9v?=
 =?utf-8?B?eU1oSmozZms2UEpQbExTWmoyTG9tblZSSVNkbFhSRWhDYURidEd0N2ZKN3Fj?=
 =?utf-8?B?QU1LdmJmbVRQRzVtcWhtOXoxVHFpeFUzV21xTlZTUjRYTE8vUDdaTGtUYnhB?=
 =?utf-8?B?ek9pUDlXdFYrWjFiVTJ5MGJKQzZhWCtSamRmdkZ4ZDRKVGJ4UFUyYUFYK21Z?=
 =?utf-8?B?aWY3UnY5aC85eGQrWm9NbGI0NDJvajA5dzUwRktNc2dURWI1Y2ovdGVBaFRt?=
 =?utf-8?B?NTVDWUNMdGVVQ1ZsdWV2aXdzd3gvQjViUG10SmpOUi9PL0dtaFRFMVZLVE1S?=
 =?utf-8?B?OGJiaDlLOFVQdm9MM1FUZm8xNXlsaTdjK3Z1K3dIK096cjJsSlpSZDhhaVZY?=
 =?utf-8?B?MUN2dHJqRGpOSWdvUE9pMWliKzd1bmI4V0lQNVNLRGtlNmdNcDJSV2tCamJ2?=
 =?utf-8?B?K1ZhYWFCUzRLaDBzYnpjQmpaSzlnWG13MTdwajlHRXRIR2RwYUpOZUE5N2VY?=
 =?utf-8?B?WkN2MXRSZnd0cTZhQlVpdkNoM091MVRjdWFZZnFzMmtwNXBrYmVsRDlBZmJU?=
 =?utf-8?B?c0g5bmxGYXNTWlVDNklTNTNUUWVGWks2WWpvQXJMMjJ1WDhVWER3N2RFQzFl?=
 =?utf-8?B?OUQ4TWF3UC9WZ2h6d2hwcEZkRDVYTVFtbk9ZaTJEU2FXQWJIUkhkeFlCWjd1?=
 =?utf-8?B?c2J3SDh1dU9haWVtaUIvK0VRMVY2ZjZTZnlIN1JOMmhNVmg3cDhXdnlDNEpP?=
 =?utf-8?B?b2E4b0c2N3lQWE5EcGVxTzJZb2xvL0Z6WGVpcy96ZEpWcysrN1dQak1XUEhk?=
 =?utf-8?B?OHJwTE1BRXJINDZWaXY3K0pDY1VPZVFYMk5jMmFWRmR0VXNITkt5ODhYbmVr?=
 =?utf-8?B?WkR0eEcwdHJPS3R5YXp4ZUpPWFRRYTA0UDJteW5XRGxiUTdINXBpdE9wNjla?=
 =?utf-8?B?cWdWL1NMYzFIKy8wTGdOVm5mN3RXNE84RTFKU1pqNlpKMkVGR2hwYXVSSldZ?=
 =?utf-8?B?dCtjN055cjh2a0ZRQmNvQXlhc2VrbCtnbmVqM2RhTVozaU9CNEhTOHlNK0xY?=
 =?utf-8?B?L1Vab0hZc0tTdHRZUDJQeXdYMzF1T25KVFIzLzJhdTB3cVlQaTNtVEl5a0E5?=
 =?utf-8?B?QjBWUWx0UUVTMFY5bXJaa1R5YTQySXo0VWEvYjhzWnRqTG9UMGErT2NiN3o1?=
 =?utf-8?B?Yk00QzNydzV6UFZEQzlPbHJaZ2dLMDlWeldMck9WemNqWElWU2lsRnlJblhY?=
 =?utf-8?B?RHpNeUVwRmZMaEF3SnFOWlZQVDN2VkNzV0RUU1FCZzFLbE1GajZJTnJkdm1V?=
 =?utf-8?B?WGNacHpXZDBYSTFUc2VTR2drYitqaGtUK2diR2tJWU5wM3ErNnVRWCtiRTZv?=
 =?utf-8?B?ckU2eFEyWWtQb01mU1JOaGxGU1laOHkzTVprb0VUTm80cXZHUzVzRU92bm91?=
 =?utf-8?B?azJ4TEp4ajVCYXJhaXJkZEd3WWNBQ0lVWFN0azJjQzNKMnNxN1l6NUhpa3lt?=
 =?utf-8?Q?7lr0mVVQ9pd/hzqkLxI5OkU+m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d86468-8db4-4354-e5dc-08de0ad7d9d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:12:12.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhXndO8k7Ihs7qt4nBa20Aq5B2Sfd/BhK1sjNMgCVh7DFr5+ZWAqhRRCwC1+DV7dEfPpdbgWgc3fccGHq6A/9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621
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

On 10/13/2025, Fabio Estevam wrote:
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> Hi Liu Ying,

Hi,

> 
> Could you please help apply patches 1 and 2 to drm-misc?

As Marek and Stefan are the two maintainers of "MXSFB DRM DRIVER" according
to MAINTAINERS, they are the first two supposed to conduct apply if needed.
But I can help apply if they don't respond and all my comments are addressed.

> 
> I got several Reviewed-by/Acked-by tags on this series, but the patches were
> not applied during several kernel cycles.
> 
> Thanks
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec651..ce31b873fb95 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -19,7 +19,6 @@ properties:
>        - enum:
>            - fsl,imx23-lcdif
>            - fsl,imx28-lcdif
> -          - fsl,imx6sx-lcdif
>            - fsl,imx8mp-lcdif
>            - fsl,imx93-lcdif
>        - items:
> @@ -32,6 +31,10 @@ properties:
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif

Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 LCDIF
because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(at
0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

>  
>    reg:
>      maxItems: 1
> @@ -199,7 +202,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      display-controller@2220000 {
> -        compatible = "fsl,imx6sx-lcdif";
> +        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
>          reg = <0x02220000 0x4000>;
>          interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>          clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,


-- 
Regards,
Liu Ying
