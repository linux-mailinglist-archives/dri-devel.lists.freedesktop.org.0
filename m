Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AC1A10B53
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D6510E3C1;
	Tue, 14 Jan 2025 15:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="jHNWZD92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2116.outbound.protection.outlook.com [40.107.21.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FE810E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQS0O7brTPEa2SagahRxVxP1Wi9gCTsbi+AE+ryuNMhDxERmJpcwNVrVjhQEIG7HzDavXjP1jtxqGyhWeh5YjHOEw9Vm65sbIaseekCC7gQRmrkwVrrvQYdlBnkqCWdGALcHSFHfUETxhDPYP26Hh46Qj2jZHpSrq7LKqRUylobQWvZjm7sCxXAeILbbB0wq1j373RYdSG5kVNFi5ylwGd/GYh1wV4ffihmFbnyBKTPCjxyhyB1dSxcLjUrnVBojhCT7yEBITW3Aq3iVF6ZIiEM+TGxNcjDRkKKj1FM34rboZJy8svPLuvmnHm57bw0bj9eQSDpdV0hdy34CvGv8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3H+tkcbNM0ZDMamSXp74NSmBBBh1hQycW9CNWbQ89s=;
 b=IORS7fY9ot1DZXVOSatkkJH+WzJAW03HZCY5QaSLjv9wQqXkPRXtuSQ/T2iLjITj3p4/+jaqcAYo0mFMYhKvonavLi4CUrprJfTDgThhUnlkhezdU+xLyVJ60Rv09qCn2gtMJQvvvFRIoewx4ApOZcQOpIDrKxyXkbl757v7UvhP0V5dagdtsR7qXsMaHV9r5QO9iMBdr25oZ8Dv1A+ZXO2bn11gPDPLov/hSWdEoVxmzG2PXHazQdJ18MYXYuG8mGuUczKgoCf1/pPDiLg6AfIAxga7fpC1Bjvqcz2+Arz35Vjo8ttBiJxRnbAV3fceJqZ2cww3LrbLQTRL1/2Gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3H+tkcbNM0ZDMamSXp74NSmBBBh1hQycW9CNWbQ89s=;
 b=jHNWZD92BvSLNBilepU6//8O77c6dmLFGYjABTRb+Ts2AXa5Y474yHtLnNBp8iIKnut6BOn+GLaj68gmqwd5w4MRemOtQBopMJu4B1xRdfNuVzWZVCP+OPt9rBz4bd9QHBUJlR+KiIAVEFqki2VD6FAWZDKJNgJt31SUNlP0Wso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14)
 by DB8PR10MB3580.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Tue, 14 Jan
 2025 15:44:35 +0000
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95c1:ff1e:275d:26aa]) by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95c1:ff1e:275d:26aa%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:44:35 +0000
Message-ID: <1354c828-5ab9-4f3d-b1ef-b300a7beb54e@kontron.de>
Date: Tue, 14 Jan 2025 16:44:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: adv7533: Reset DSI receiver logic
To: Stefan Ekenberg <stefan.ekenberg@axis.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@axis.com, Biju Das <biju.das.jz@bp.renesas.com>
References: <20241212-adv7533-dsi-reset-v3-1-c6b9a5c524cf@axis.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241212-adv7533-dsi-reset-v3-1-c6b9a5c524cf@axis.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4f2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB5671:EE_|DB8PR10MB3580:EE_
X-MS-Office365-Filtering-Correlation-Id: 8092b367-6e32-48eb-3902-08dd34b258e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzFTc05hRUNtbXhFQTVZSlpxTWFmOUpmYWJ6SURVNHJvSnFlVHRUK2FjQ3Zp?=
 =?utf-8?B?dDJOdkMxRlhIbnZTQlp5MVhWNGV6aVBtdm13SUNKKyt0Ty9OK29hRDNFOS9Q?=
 =?utf-8?B?YWtMajBObmFiMndXMUVpb2NBeXVYU05PZS9vR3pSaHZvZ1JZL2FRY29SbkpL?=
 =?utf-8?B?M2ppTU05UlpVTEFlTUFZQzlvbFBUVGtpNG5nRmp2ZHBYZVA0ajBCUmZsT1ps?=
 =?utf-8?B?eElNZ1Zja0d1cFN4Q2c0MzNGcm9iMjFZTTdoOGxuSHM3VGkrTlBrdlQxUFNT?=
 =?utf-8?B?U0FRc2c2TnhMb2lsL1owR1BEZ1JRWUdvT0hIbzU1Z0NIdXdSVzBuSjRiTGRO?=
 =?utf-8?B?aXNPQlErdEtMYnpyV2dwWm42YldsSmtFelJUcERzOFhPRndGS2swS3duQ29W?=
 =?utf-8?B?ZnE5aWVTSjEwWE4vRlQ2OEcrQVllNXlKbHl3SXZSbkVraDV6OFNFb2V4cVAy?=
 =?utf-8?B?aVdWVi9YNVl4WklYa01qNUZaYlNKODhmYjBmaGhsYWE5ajE5ajVWM3ZzUlcv?=
 =?utf-8?B?dHAxVlRJQW5DenBUTHE3SFVUbmVZeFYrUXJhSWwxME5Bd2FOejBOZWxkV2xj?=
 =?utf-8?B?RUU0cEhXZzVzMTF6YWEySHU1enNKaDRkWjZMRmxvaUYvQmRGQm5OKzNSdWhF?=
 =?utf-8?B?MlZZQm1ST2FjcXJtczFJcVBEUHhKYkV5bHdJQzd5MERhaHBMN3VkSEx6aWl0?=
 =?utf-8?B?VnlVOXhoaHFQL1FyK21NelRMQmI2QXJGZzF0MGc3SU9qSTBWbmI5Q0NOaGlP?=
 =?utf-8?B?MU9yZ1hEMXEvM2E4M1I1NFl4cHN3RHRjcWZQWVN1ZG5xQU80NGo0dDZOeE1v?=
 =?utf-8?B?MjR3Wkh2aGM1Z000ME15Y1JRM3BxVUtGejRnallET094dVBPZG9KTzdIZHZj?=
 =?utf-8?B?RGdpVlJTWEpkK2dob1RvWmNMbnhRRjlpbERlb3lZaUllWFN2NmpYQnpSY0pX?=
 =?utf-8?B?bXEzbWV6ZTF5NUEveXRBTFFVY1RJQXI0WWt5TlNUNmsxbEtEMlNUUTBUTG91?=
 =?utf-8?B?V1praEJTTHJWYUxjLzlBMW1DUXErQVNZWEMzWkdraGpSTzZSMzRvbDdUYnA2?=
 =?utf-8?B?Z0c0Y0FQdW4ySmFmcndhOVE3MWcwU1QyUVZ0RlNYeDgxSkgwc25zRk5QdHFo?=
 =?utf-8?B?Z29sczBIcll1dXpXZjJld3N3d0RBSjU0RUNSeUtyaDdxWllIV2Ntdm1mcFBi?=
 =?utf-8?B?d05WQURCb25PaTRFMUoreVdXYzkzQjZ0SEFTYXJyNFkzcTFwRWNwcXFJaHF1?=
 =?utf-8?B?blBBc0tmTlpVN1ArZUtEUU82dmp6K3NZL0JBT2h6L0dEMUFLbWttWXNTeDRJ?=
 =?utf-8?B?REVHWVJ3eXVFSVNuUk42enUzMVMzempmTEduWUo1UkFmSmlHcHBoVnZ2ZDBH?=
 =?utf-8?B?MlloY3RFc21Dc3F5VzZTRWY5enhyc2owWU1rMmVOM21PVWJqRkRHd3JNMVVJ?=
 =?utf-8?B?VDhwQ1RUbGZMUjRXempFMTZLVWdhOWRwcVZCVlVsTjZ0eGsxUlVIbGhIRTZY?=
 =?utf-8?B?c1ZuRHYyeE1NNmoybWx6VzJvWTA4OU5SdGwzZTR6Nlo3V04vSnpQdXV3UHd5?=
 =?utf-8?B?M3hmZ094aXBYMFladk1pSS9idU4xZDBGK0JFRDV2QThEY2tkQnpsTVNnRHZN?=
 =?utf-8?B?TzJFVHc5QjRsNFJMZ3lYbHNHcFNnOXlKOEs2NWdtV3hMWDJNKzR2cDF2WGg2?=
 =?utf-8?B?MFlWclJoaWhDL1NGeG5qQzF0M2ZLQkhRVVk4aTF5eGxYNWFBYW45enkrYkc4?=
 =?utf-8?B?dDNLMklWWFZqcVdMV1RHQjdFSVR4OW8vcFZnbEJRbzZScXJ1eU9RMTlOWHBE?=
 =?utf-8?B?YWtQMHFjbnduQjBQS2MzRnlxVTBPSVRhazJicXZYOWwrVjJFL0U0cis4cGgr?=
 =?utf-8?B?VE5JZlUyUFVwNjlmVGtrSlRwSjdzZE5HQjNHRTY5dVNhRkJiNWNvYWJBdmUx?=
 =?utf-8?Q?Xq/nCZR5dEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clJiV1BEUjQ0V0F0d3FGOUtNQmFmWGlraENRYnRaUWJDQkV4djhqYVdWbnVE?=
 =?utf-8?B?UU16UEVMVjFQMWYwOEtyNzY2dTBsQnRNcWJidW1MT2lnb1YyeWdBRlhWTWZO?=
 =?utf-8?B?TjRFVldrcmtTa3FZMVR2aDl1azRCTXhBMHArcUwxUjJ4WHVSUEdyTDZ6Tnp1?=
 =?utf-8?B?K2M1eWtld1NyaWZaaStvb1VzelFqTjNROVdoWldQVXlCcUExUkZyVzRQSWhU?=
 =?utf-8?B?Q3ZWRWtSa2prenZBa013TUZMVkdGZTZ3bHA1SHJPamdIQTBsaFNGdTJoM05n?=
 =?utf-8?B?bnNFbUxlbkh0ajFGYXZYczluUHhCUXZZZFJ1aGQ2cmlMKytuM0NiSVVyQjhv?=
 =?utf-8?B?WktyV0IwMmF0dEZsSEJwMGx4eDdqaTRrRzlNZVF6VjRuZUU4R2VVSjRUWS9Z?=
 =?utf-8?B?VHg2VWVLZ2wvOEpscElzaGZiRFkxeEpPVDcxbzJGTG1hbXVsMzdFbkV0SUpu?=
 =?utf-8?B?a2ptekM2aUlPQUxhSnlQMmlOR2hIL3ZpbEIvYXNiVE1aVHpzSXU4MVdaUEFO?=
 =?utf-8?B?VUVZOHJESnNNbnBxaDJ5N29uR2kzVGRaYi9mKzVLZ1hvN3VCbE9LamlpcVF6?=
 =?utf-8?B?bjJIK2RCTzdGY0lSM3ZaWGNNSy9jeE81aGtMbE1RbUk0Zm9VL1F1L2dnUUVw?=
 =?utf-8?B?OG5YdWkycE0rcWY0NWZOdnJLdkRaTnluZ2RiVHBOZzBEQlIzVGR0Y3ZBaUtH?=
 =?utf-8?B?YkZIc3ppalBSY010VmwrWG1QVDhoK2pmTHU2VlR6RlpSbWdESXpoc05ML0R3?=
 =?utf-8?B?ZWU1Y1Yvbk9nYXp4b0YrUVJzaUFFSmwrNlBQNDZxcmJqS1NrTVp3N056QlJr?=
 =?utf-8?B?R0t4WHJ5cUV2ZkcycjFnMHp4NkpkUmcwWitiMnVJSjRNcEhremw0ei9iNS9Z?=
 =?utf-8?B?R0YvZTB6SWpRMFhzaTgzSUJxQlo1NzJYcGU4RXYwbnlUQWlzN0FZVVZNVWRo?=
 =?utf-8?B?aW84YWZXbUVzQnBldm84a3ZtdVd6dGVRVGVhbDZ5Tk0yK2d4eDNDU2tyQzdI?=
 =?utf-8?B?SkFzcXVTTEgxNU1aclZHOTlHalNDMUVaMkoxdktIVC9sTG1UYW50cmxadUxD?=
 =?utf-8?B?MThlTjJyOFZNeVk5V0ZTZnp1cmVuaEViNjJacTNEbmlHR09wRHVtOHpVMlI5?=
 =?utf-8?B?M2xKQ0grdE1INkxhczBCeFhMSlJvOGZjUzBCVlVxTmlGN1B0K2NDa2ZQaXhI?=
 =?utf-8?B?eUJtS0dXc1BhYyt3bGxkdVg2N2t3N3NRWjNYeVprUFRjWE50L3NvSVVTS01h?=
 =?utf-8?B?VTdGOTQrNFo0clZ2Q2toTXhLWFVZTzFheStVSGsrdkE4YkdnMHgzc1BjNHl5?=
 =?utf-8?B?ZE5LZDFGV1dIc0MvdHZHcWY1Rzk3VituN1VqMFVLVHBRa25xWWFGN2I3d2kr?=
 =?utf-8?B?R1ZZc1owWjdKdWtiaUJaMUUwTDJmakVrMUxYeUpUTStGT1RDMytUQm1uT3kz?=
 =?utf-8?B?NDliRHdZS2dadDJvMXRjUHV5QjFBYzUwK0NqV2J3Vy9LV3hYeTlZYTFJbXEz?=
 =?utf-8?B?N0h1RXlmVW5hMldFajI2NWllcjExUGx5VGNJRHgzTWluVlNpTE9IUVZlQTRN?=
 =?utf-8?B?RDc3dkc0NW5qaFNOdDdLbUxCaWFScThZeFVscG1VTXM2b3JqVkl2VWROczFy?=
 =?utf-8?B?TFhyamhYczhtWHRCT2FCTHJNMEdoUExpT0UyK3VqQVJJTnI0dElTUDBRdXRr?=
 =?utf-8?B?cHZQUlZyeVRlalQ2YmwrYTZnNlBOaXNTTUlwQjA4ZzFQVzd4MGNLZDc3K3dD?=
 =?utf-8?B?aFZKRjBUTi9kMHpCT3ord3I5Sk84TENtTG9LRzdueVc5VitLUGozM25mc05u?=
 =?utf-8?B?UHVNc0hkanQyMnpqZ0FHTTc4QnZGY0RtNExoLzFpSWZ0THl4SHM1RWVMeW9B?=
 =?utf-8?B?UlZRRHowTHVSVXRXNXJCbWkyWjJ4ZHNKbmhUVjEvemdwOUFtOW9TTCtLYm9R?=
 =?utf-8?B?VHA0L2ZCaHlLMUlFblJkbXJmZmNQWjZwbDB3OXNNZnF1S3dOdVA3SUVZcEtv?=
 =?utf-8?B?SkFCdC9xaFNkeWhZNU9IYlhSRUpaZ3VvNmV2Qm1vNW85cC9xRnN0RHZxcGJK?=
 =?utf-8?B?V0FqSHBNYU1CMWc1Mm1rSVZJakhaVHE3YW91VnRpcVBEOEF5TXlQcUYxbVVz?=
 =?utf-8?B?WGk2cGFXL3A4RW5Cd0pmTEtiRkdKNUh3ZTlmQXBSUVIySHpBNlZkanFjRlpN?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8092b367-6e32-48eb-3902-08dd34b258e5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:44:35.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqPYnasciJs9joBEOw0HWS0uCgdneWD75kQcso7Ol0UeTibZvnq0euFjiAdTe0SUAplJeuHBBXm02eIR1o9xkTJFIsnbqyT6D+HdJ8Tewms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3580
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

On 12.12.24 3:38 PM, Stefan Ekenberg wrote:
> Reset DSI receiver logic during power on. The need for this change was
> discovered when investigating issue with ADV7535. The symptom of the
> problem was that ADV7535 continuously outputs a black image. This
> happened for about 10% of the times that ADV7535 was powered on. The
> rest of the times the image was as expected.
> 
> The solution in this patch (placement of reset and sleep time of 200ms)
> is implemented as outlined by the Analog Devices support team.
> 
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Fixes: 8501fe4b14a35 ("drm: bridge: adv7511: Add support for ADV7535")
> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>

I can't reproduce the issue with my setup, but I tested this and it
doesn't break anything for me either.

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> Changes in v3:
> - Add Fixes tag
> - Link to v2: https://lore.kernel.org/r/20241119-adv7533-dsi-reset-v2-1-e12cce42e25a@axis.com
> 
> Changes in v2:
> - Add Tested-by tag
> - Link to v1: https://lore.kernel.org/r/20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5ebf164313c86cbf3447d2d7914ab9..93085c2b872ed98f4ee394236dc66c568c0e5ccf 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -67,6 +67,15 @@ void adv7533_dsi_power_on(struct adv7511 *adv)
>  {
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  
> +	/*
> +	 * Reset DSI receiver block logic to avoid ADV7535 startup problem.
> +	 * Without this reset it sometimes continuously fails to receive
> +	 * incoming DSI packets and outputs black image.
> +	 */
> +	regmap_write(adv->regmap_cec, 0x26, 0x18);
> +	msleep(200);
> +	regmap_write(adv->regmap_cec, 0x26, 0x38);
> +
>  	if (adv->use_timing_gen)
>  		adv7511_dsi_config_timing_gen(adv);
>  
> 
> ---
> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> change-id: 20241108-adv7533-dsi-reset-488c6fbb5e42
> 
> Best regards,

