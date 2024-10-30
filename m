Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ADF9B5E5D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 10:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4B10E765;
	Wed, 30 Oct 2024 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="SKvlRAGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2090.outbound.protection.outlook.com [40.107.20.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8625C10E765
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:01:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJhpQE5ITtJm8EkQcAz6tPVvyg9HcPYafcvoNWVb6HoT+DSRdtTpLHZtcjlr+8wZsCZjjDN/F5OQ82vHvXX3ZaEzRGxK4aCMG8YNWuUdvnNNxLjZ1y9gmWo4Y+OOBuXyJvGsSuqUEHTHBHJnu2rMgK+6R87ZTnFkHpmFbdwdIKpQSm1SMoAXwPIvNum1Uc9ujysBoOXNrHztb9mTtxW5RerSLO/Pk07l+zeJwX3/iTvDxFy9qR7RMFALd2/5XHS6FsvEY7F67nPd89Cib7NNIhYphAaQH4QGyB8shCbBxZDmGPtEecz5CaXTLwdjFaUF9uln9vdxmwQnyf+W4TZTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwcCvq+S43YBIJqgdnluBIAC9E3eUJMtuYC0vOKJwbY=;
 b=jF9F8ly+i0pLNXYkjERM8aSkC1mTT1rP3GdGo5EAgxaz4j+yhAjwoiUMwfi66iuObf7qwAiPHMjh5Gx9xIKD0BZarNdpoxXgIkMUyOac/bHztDp5J4K54gKsKGHnRwkAOcO6eZY0yiKrH0Nc9skl0seoL0tMfFl6Ab5RUGeMgZol8hwBMzWGiTEkXDw+aNZgfGpCWbEg/fBvRyts3NGqAYDAImpzzXpgDmWszTzMHrsbscnRGdX/2AY58uYQ2bTRrEx74irxGi/sXID5KAITD8LsUL5KQXzttAiQx4EytcNkPvEg61cxcVNXpEigju8VUIFRRKm98/qsT/usCp2JSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwcCvq+S43YBIJqgdnluBIAC9E3eUJMtuYC0vOKJwbY=;
 b=SKvlRAGJGZce/6qJgA1ygRCtZbrXMpgDGy9EXOj0Mk7pT6SpC52aLoRklSIr5ChTxuKF6N21Ofw4fud2tclZxFBjh2X+/dQFg/03PxAZZqwFAHMu9ntfQ/sVfCO0a0tS8ifVQR2KkDpfNXZTsP/msKQqJXuaEo0kaz75J61aXH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB7475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 30 Oct
 2024 09:01:27 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8114.007; Wed, 30 Oct 2024
 09:01:26 +0000
Message-ID: <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
Date: Wed, 30 Oct 2024 10:01:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: imx8mp: HDMI display blank/black problems
To: mailinglist1@johanneskirchmair.de, aford173@gmail.com
Cc: johannes.kirchmair@skidata.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com,
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, marex@denx.de, mripard@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, rfoss@kernel.org,
 robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 tzimmermann@suse.de, ulf.hansson@linaro.org, victor.liu@nxp.com,
 vkoul@kernel.org, will@kernel.org, Saravana Kannan <saravanak@google.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d9c429-2e83-4871-7da8-08dcf8c16f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVdVTDlhVXR4UnpNS3hYOXJDODJNUExsRnFqcXlOdk1VOERWRWNqaWQyVW1F?=
 =?utf-8?B?eCtjV2RHNm5UakdkSnRaUGJBcnlzVGdCTnlyb0RjTkp1SHRHQkIrMFNlL1lx?=
 =?utf-8?B?SzUxblQ1d0hHSXdYaHRwMkMwMUNXUkViV29mTFJQWlV3Zm02U0VQWTZDeUsv?=
 =?utf-8?B?Tm9BS2s0M2xXMUxaQWRtZXcwd3ZGOGVrQm1BTFdRbEhjQ1pEY3M5WTdyUWgx?=
 =?utf-8?B?ZVBjVG1xRXBkZjRGenVITlg0UllhV0o0TEFNcUowZDRSSmhmN2FIZVJtdW16?=
 =?utf-8?B?YzA1TUprVU8wL2tIRjZSMDlCYmhJZnc1MkdFOFR6QlQwWWxTWjVJQ1RlVWlW?=
 =?utf-8?B?UEZ3RE9UdmtLMXlOUU9vcVBKSjFvRU1jNVA1ZXJEcVJ2dzdHRW9MMGEvTUtP?=
 =?utf-8?B?dXc4ZXpXaUtQUmovckVhMjAwd0toR3FFUnFla3dpMFdCNzV6QnNMb3JTUVEx?=
 =?utf-8?B?aGlnWlYxdXdoV2ZHQ1Rka2M5NW5HYi8wSXM1ekg1a0Q0Ri9lNklnYXFmaTFN?=
 =?utf-8?B?RlQyV3l5RVNyOWw1VHhUWUFKRGRnOXIzd0R5SURhY2lMTFB5OHo4RFMzYXZS?=
 =?utf-8?B?MFBiRU1SSU1WZU5xSFRsa3dTcGJCRGNzRG12OTI0MUJzRkdZMmNuTlZtekli?=
 =?utf-8?B?UUR1SnF3YTJLeG5TN3YwNFlid0tBdHpncXNtZWc2aWlmK3hrZ2I4SnBHV1oz?=
 =?utf-8?B?aDlmZ1hGUytqdi80LzdqeTFqUDJNVy81QUM0cGQzMnlsdllpRHAvYmFFVzVy?=
 =?utf-8?B?Mnp0L2ZBWmFjSDB0Q1hpVEdobHY2TmVpcDN6cERIblJCK0tLU1NlbDdadlB5?=
 =?utf-8?B?V2FhZ3JzTlZEQzlhMDY3SXFnYzFrQ2U5dG5FcmlOMDVEZWtBblVUZXR5Rkhn?=
 =?utf-8?B?dUJHNFVvQUs4Y2NEcWNBVFZicVVmaXI3djZRUU8vSlRTSFU3enJDRTI5VXJ3?=
 =?utf-8?B?Umc4S3BpVE9PcW9vQ0hkMEVEV2o1MllYZHkrR2FWM0d4L2NtL0xzKzdjM05o?=
 =?utf-8?B?UG1xcCtnemtBRW84K0xza0ZZQ3lKM0RZRDU2MHZtZVk1UkdoSW1OT1Z1SFQ1?=
 =?utf-8?B?VG04RW5DeVRFbTd2WktjV3ZtcmJFTEM1Y0MwNzRmVDRTNzZ0L2ZjSnQxT0VB?=
 =?utf-8?B?b1pRMEpCUjB4WlpKTCtDeEZTWW9NbHdQTUh1M2NjdkZoRytCMEFjSjR4TGps?=
 =?utf-8?B?QmVPOHdkc3AxLzNYOEl0djZWeVhNM1JqMDBOUUxHS29lWUdBczQ3ZlRTbTFX?=
 =?utf-8?B?SkphV1h0VU5LQklLTFAvWjQxaGx3MlA4ckw2OHRzOFdmWmdWaEM0ek5wMlBE?=
 =?utf-8?B?TmxHM3ZZWUtTOVMveCtCZEZnWmdDSzU2MGlKZVZhaWs5TG03cHFHczdLakUv?=
 =?utf-8?B?NkNLYWhYU1puaTJIQ25QcTMwLzVhWEJNZXR5aEZtVXZWR3VxVk8zNHgyOWJB?=
 =?utf-8?B?VkJ2MWFubVU4RFVUeXZaejNvdEJkTmZyVDRLdGp4ZEpqNGdQNkRWaWl0d0Zn?=
 =?utf-8?B?WStjcDV4V2RlRG5LN0lhZFJGUFA5bjZBYXUvU3dBN213WU05R1dQUnByMS8r?=
 =?utf-8?B?ellCRUJoZ1M5RHNsL1R3RGZVakxuaVJ6T29vbklrYXF0bUVBbnVldVArMk8x?=
 =?utf-8?B?U3grQm1PTGIzZVhpaGpINVl4dlVHaGVzNE4vUE1peUlpUUZUTW8xZDN4RDFR?=
 =?utf-8?Q?zzbVtcfuuATlsohRxhck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFZRDYxYmpNdm95bmJtZHFkNmR2Q216c01wem41bDA3OTVBWHBUQ2FaTXMy?=
 =?utf-8?B?VDlRMEdJTHZHYnh1ZWFYV0M2dU93Y2cycmVGQzd3VnJIQndpZWhmcXZuU0hR?=
 =?utf-8?B?Nmt0QmdPVXdjWjY0aUMvcEcvYU5PaGR2dCtCUWd6eDg3UlYwYXlzZ3h5VkFl?=
 =?utf-8?B?cWg4eGY5ODJPRDRqdHpqKzBJbUQrVzdONmtYY3MzZ1p4UXFMZFFRaHkwY2kz?=
 =?utf-8?B?RjlGc0dsZTlHdFBmMjNuYVpyRkh0dVBxR3BNb3Zha25yR215dUN1cDkzYUtn?=
 =?utf-8?B?bC96MDVHZnBrbktRbWY1WXFMK1VITmFRS3J4Q2xSSi93WFpGeVZTenVSQ1Vt?=
 =?utf-8?B?emJoQWZ0cERpdXhPaU5WQzVRNHJuNkVnR3VwaVViOU13WC82ODJMaHc4bkZS?=
 =?utf-8?B?clBHWmlpNy91bElKNkxzeTNibEpqMkJNWndQU0NhelRmdmVJQzkrcUFqdFdW?=
 =?utf-8?B?OEp3dTVodHVLR3FaYzV2bFIyRktjRmE0clhQclV6NlpjYytyMFNYNi8wRDYr?=
 =?utf-8?B?VUV2bmYyODVUWW5oeHVmUWNpWUppc3hESStoUG85NmhKYUw5ME9Iei9CSUR4?=
 =?utf-8?B?RXdHZjlPdHBiaTFJOGp0eUJoN2wwTU14bTBTOWYxYm84UXlrYmxBakRJR3Zz?=
 =?utf-8?B?OVJ5d3FxRlZrTmUzWEJUeXlQRHh4ZTM1bCtsa2V4ZnloR0l6MEdwL1pWTnYz?=
 =?utf-8?B?UWNIeXArdXdQelBuSEM5NmFoaW10bVExWWpoZ2QzSmtCTU50THhPaGx4b1Az?=
 =?utf-8?B?KzB3MGlEK2lIaEFTS1ovTjhCNU5XWDRtNUdXNC92d3ZmYlNITVNWMmVBNmRi?=
 =?utf-8?B?eEJiWkFRUHA2Vml3bWE1VkNGUFpOZlpRa0hlNW5MSEVNclo1b2hTNGorUGIw?=
 =?utf-8?B?L0Ivbm9oYUNYNUFqMVJSZVhzVS90RThYd2s0elRVcWhGRk82OGU3QUdZQVAv?=
 =?utf-8?B?KzFoTzlFa05aVkpiUG40Nm8xTERWelR2MzMrN25BcGY2N1NQLzJ1ZmI2VUYw?=
 =?utf-8?B?ZXNiUEIxbWoweUp2V1MybFIxSHYrSHdDaFVaYlBDUjNvQmptMXRIVkdzRmV3?=
 =?utf-8?B?V3NnQmVwR0VCMUVmOEpXSk0wb1pNSHRQbkN2K05iMmtqZ0R3MG1mbGZFbXBk?=
 =?utf-8?B?QnZtRW90WThCZ2NqMmE2MTMvLzVPZUZCb1pSSkxYbHJvQjBoVmZ2dUwrUndL?=
 =?utf-8?B?d2FJRUtLWDBtREVDK05Bdzh5SUUzdnV5L21JRWxvSGJlR3Rud2htdmVKOWhT?=
 =?utf-8?B?TTNZOWFCdURJOE9Fa3ZacVYvYWQvVFlMb0JVMlJHb3NTTG92bVhGN3JNcHVC?=
 =?utf-8?B?a2wxUDF1Q1czQW52SGlaZkJJMjhwRSt1UEFWTHpIUVlVb3lhbmZNWDFFUHpP?=
 =?utf-8?B?WFJUODZyTkpKbmxKakZrYXhuYUU4U3dFL0JtOFhNWWtJREw5R2FJNkg0LzF4?=
 =?utf-8?B?YXg0N1N4MTRLZmc2dFY2U2RXdmV2UjlJWlVZY29IeVp5RFNVWjNrQVQvWnNP?=
 =?utf-8?B?RjVid2pMNHpkYzFDSUw5OTJwcG9Eb3p0Yi9nbTU3WURSdFZWbzR4WjVmbW1u?=
 =?utf-8?B?T2N6UTFURXI2cEM2SHZjMzJ4dklFNXBKTHkvbGkvYmNMdWxrb2puYkEzemNR?=
 =?utf-8?B?M2k5SFp2MlQvblVYNXdFTEFEalA4eGtSK2ViUDZQNHJCQi9uWDRuUVJhT2s3?=
 =?utf-8?B?bkxuS1U1ZFJMSmI0S0VmN09yN2pSUmU3d2FrRkNGcUZFTzJtOWhlYTg3NlRD?=
 =?utf-8?B?TFlVSXBoU1Z0bUgvam4wcTdHS3dUMTB4OVJsWWhjeVROZTR4L211Tmp3T3hT?=
 =?utf-8?B?bXdZR0JPT25rS2hLTlRwV2I3LzIxY0JobHBwcVVHOFNlVGREdGMyTFV4M0dT?=
 =?utf-8?B?VGhmRGZXRzZ5MVIxUEp6eUtreGNvWElqbnQxUlQzRWsvaWozWnZTSzZCbWNL?=
 =?utf-8?B?Mzl3RTA0UlNXWVNqamk5R1dPNDFCU2szRzBwNnpKMlk5aElXeEFBTEtjeHZu?=
 =?utf-8?B?U1FoNmVpRW9PWVppSkFMendFaVJxaEt5Ri9UVVdORUZIVUNKK2JScGs3WWdh?=
 =?utf-8?B?U1c3bGd5TkdDTkxiQytPZWZyTTM2N2pBMGVreDlJejJzemdvZlJmOGM3a2dV?=
 =?utf-8?B?TUdQdTlWNm9mTWpHbnJ6MDN1ZGxYUWxhNkNhWHZsN00yZ3g4MS9ZSzN0c0gr?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d9c429-2e83-4871-7da8-08dcf8c16f9b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:01:26.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpvenMy/dLQOI8ijDo59915Y5BcScOKFvb9t+DXsBqaC9PHqg7uFL6acbTzuU4ziSOpXc5HOe8w9Qv6cEcAynOQq8Nzymi8SvF3IJyL0MWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7475
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

Hi Johannes,

On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
> [Sie erhalten nicht häufig E-Mails von mailinglist1@johanneskirchmair.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hey,
> We had some problems with the hdmi on the imx8mp and wanted to leave, what we found out about it, somewhere for others to find it.
> 
> The problem was that our hdmi display sometimes stayed blank after hot plugging and sometimes at startup. On older kernel versions 6.6 we did not have the problem with the not mainlined hdmi patches.
> We tracked the commit down that introduced the problem for us. It was the following “driver core: Enable fw_devlink=rpm by default”  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.com/
> So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don’t really understand what the problem with RPM is.
> 
> So, this information is just for reference. Maybe someone has an idea what is going on here. And how to fix the problem in a more proper way.

Thanks for investigating and sharing your results!

I'm seeing the same symptoms and previously found out that this is
related to LCDIF underrun errors. See [1] for more information.

Adam has also started this thread: [2].

Anyway, knowing that this is related to fw_devlink=rpm is really
helpful. I just tried with fw_devlink=on and wasn't able to see any
issues anymore. So this confirms your findings.

I hope that some of the driver framework and runtime PM experts can help
to find out what is actually wrong and how the correct fix might look like.

I'm also CC-ing Saravana who authored the change from fw_devlink=on to
fw_devlink=rpm to see if they have anything to add.

Thanks
Frieder

[1]
https://patchwork.kernel.org/project/linux-phy/cover/20240904233100.114611-1-aford173@gmail.com/#26014057
[2]
https://lore.kernel.org/imx/8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontron.de/T/
