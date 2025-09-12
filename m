Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B4B5429E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D5010EBA7;
	Fri, 12 Sep 2025 06:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="ONz/9qgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021079.outbound.protection.outlook.com [52.101.65.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA72910E171
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8v2pKW2W0jE5FyVzRVoE8VRMK5S8buiHsTbAV2drKNyCCU3cKB432VYUi1TEWy3bTo1h/oPvebl1EpMKZDS8DxNeMwdHgDnIJaEbD/1PjaQZTtmyo8k5SW0HFWRPHOTBhiJqTT5CxGRVgjU8rvXlRJ05VTwvPfMAUDpCjzgSrnNZ4D7i2TnMc/5Pcd2WJTiHWbZajlQtkcmQBY9sTg+0j8l9kQ61+OxbDlHhMNj3fdJNguRPyBzOx5/7RSHRmidirJoRehUaM+ZlcxD95d4G52ri+m/lTgdAEGHgiw5UZpkhaK+i/ZopZKsM9yXGV5fueE0uERhRCAf6z7PMvmDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHoISVlm0y+BTh19FSqQcONOiluYUMMRpWfjIldVELI=;
 b=eVnOZLvKLtU/FZjC+STiL6Pl04q3T4tefvXy80qlWrw2bAMxL5bMdkvEgLt1YsfOmRFIdzV1euoUSkXzJ8qPLllNqwD53bOmAnaO+0MsCX0Dj+CTz68H0/oGxNFu3N5Ov3+6F6FPYL9406z+FP1wmPfFLkyjTe0LiCl3uJ/pzxrrDsuD9QwSy7c7oIwsXI0sUCYQKqs+iPY57p1lahv/RMpuce8eaUyxIsfQHCEK2UzPoQIiOc/i95JK/KxSBIkdC78rbVdlUGP4Gar8lD2MK/7LigAa3MX6bZ2FvlcBOTlyIk5VImeegXHW/7NiTzuPDaTo5wW3iR57nLschaJDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHoISVlm0y+BTh19FSqQcONOiluYUMMRpWfjIldVELI=;
 b=ONz/9qgcj0GbLTcpAOYuPdFr58I5X4fHkwPmjN1GquG2gRPCOR5W/yVSyidcvkP4PW7lFKvPopEsfwSE3yHHm/j/6qxaYYRLD92568NDGpPFufmmdVdsSeW4PHPWPcGTch5WA06SuZESnourY/TvSLg/i1+aoOPjoTS+f6MoWnsNdWErwYjKlWW6IC693UQEWMyZUjTpg93Q6HrpufFfLSC0SuIR7Gh9zExrZnTlHD0TPzy1Rddo6rHCA23+pOmN38VZy8ESAFcLAXJkhvvaOL1QSYnZ9XSaqUh1DB54z+WpwHhfXNBz2YidQT8g0qlOTfRT2D7ljadivdf2IerqVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AS8PR04MB8008.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Fri, 12 Sep
 2025 06:17:11 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 06:17:11 +0000
Message-ID: <3960b845-3838-4690-b01d-21e61ccfa8fd@gocontroll.com>
Date: Fri, 12 Sep 2025 08:17:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: backlight: Add max25014 bindingsy
To: Frank Li <Frank.li@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
 <aMLrrcBZ2Kc4o84t@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aMLrrcBZ2Kc4o84t@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::20) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|AS8PR04MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: f303a714-b3a4-4e7f-7b88-08ddf1c40222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3l6bFJWbU84cW1wQnFZejV3Z2ozRjgrMDU5RkUxaXg5dDJuNVgweU44VW9V?=
 =?utf-8?B?dTkrNmpSZzhmU014anRsblNnWHFyNjVKcGtNTlhMeEZZZFU1Wm9Jb2ovVnds?=
 =?utf-8?B?c0JHWkVZVU1wUkxsbDQ5VDB0YTlBd0REUHNpTUpHWEhjSHczVzBTZE0xaG9E?=
 =?utf-8?B?Si9vZTVCMlRVYTJ6WG5DZUdsaDV6bnhWQlBuU2RISEttay9DNm1OeWJTNGhi?=
 =?utf-8?B?R2d2bjJyRjhXL2xqWlRBcUNlckVhWWpKOGwwZ1lFRzJzK3A0NXdTMnZvRkJx?=
 =?utf-8?B?cWlhSkRNZ3FXNDVOZGJjUnZkU0l5VDFZcDhnbzBaRjIyNDNReVJoS21rZFhV?=
 =?utf-8?B?cEl2emt5SncwaEVnQWpWdUpKODMzc09Fc1ZsZ1FUa2dXVG9Xdy9ZOGVqWVlV?=
 =?utf-8?B?cmtWaGtnY0d5YnM2UFJQOU5wYkJKaFY5WWU4bmMzQnlNNVNydXBFYzRjUW83?=
 =?utf-8?B?bXQ1bTNYZkFPSnNhUkJoQ2FUQmJFVlR5bWFhWm5QSnVSY1lhUllQNzdMbHZu?=
 =?utf-8?B?MkN5dVdpdmpaTTRpcVVmKzZocDczS2c3MSsvR2Z5TnpCbkNFU0Fxd2VFOXpn?=
 =?utf-8?B?a2NVWHRjaFY0QktsWjV5dThONWRMcUdHM2NBOFVFL29CM05CZmJSSzB2MUdh?=
 =?utf-8?B?aldQcGlhNUcvTUI2RGk0OTkreVY5Y1crMEQ0S3hYK1gxSmxqdWlVZS9MTWh3?=
 =?utf-8?B?MzRkbWE3N0lJcWRRdGh4N0tVcEk0RDkwbmo1U3lhbDhFR2QrcHVYNVFoRDJT?=
 =?utf-8?B?RnNoSzBGMUsyb2V5eWJ3MzB5bEd4WTBpZjNkWW80MWFEZit4azE0T1NtWVAz?=
 =?utf-8?B?SWdTRlZqNFR5ZGNCc1dNNzdOQ0lwWHBWdEN5UmdLRmYwdUp3K082dktmYk1H?=
 =?utf-8?B?blVPeEJCeWRJd0ZsNGNLZFEvTGVhMXFyMG82YkZrbUp1Y3BFSHdGRG81VjVB?=
 =?utf-8?B?ZVdsZThsVWl3eUZ5ZFREQ0Zld01mYU8xWFVqOUNwNlZGT2FJelBzVGtHTFoz?=
 =?utf-8?B?bVRtbDB1Y1h1dVgzNUgvbEhvZUxESWtHMzIrZGRXbE9HeGppd0dYU1cwai9Y?=
 =?utf-8?B?OFJnbEJLSkZwaTRPb0dYMkUzcU5relZCc1hVRU40TUhKZTgwb01WTHk5ZFkv?=
 =?utf-8?B?OEFnWHFGWCtiSi9xRndBK2UwazVjMGRSUUVacW5MYTEwQ0d1c0NmRFZMRlR0?=
 =?utf-8?B?TGpXTkhVZWFFSjR1cU9oaVd1eVRtTElONm5kU1RKZ1M3RmwxS2xZLy9kbVJl?=
 =?utf-8?B?MnRvZlRjV0lOa2V0VGQyQTQ0ZzBGR2pqWEtqQXZSZkZLbFhIVWlybXJVNFJp?=
 =?utf-8?B?ODJmOHZHU3NKRnJXeVhwOUZLT01JMnVlUDZ0cDlPaFl2WlNUVEU5VlUrVjd0?=
 =?utf-8?B?Qml6TXJUbTRFR2FmOEYrNmlkY2dLaFhaaXhTaC9pMHZWVUN0QjlMZXB3YkFF?=
 =?utf-8?B?UWNzYlVJMHpoT1lJcnpsb05lR0RtaVJRSU5ZekVVUSsvY3RhN1lobk54TVkr?=
 =?utf-8?B?dG5ZSUl1c1ZWUUtFbE1xNG4rMVVRQkxSZG9HNnlmZlB2NXdIWHhPSXlvVEto?=
 =?utf-8?B?SDhhd0VDS1NRSEVLS2RNVEpKRFNJd1NhZXRDbnlyYjNIclo3TnVRQXU1NDFy?=
 =?utf-8?B?bDk5dVl3NUdVY0JydVNJa2NDa1ZSSTBwN0FoeTdUOWpTQmIzdFdycUc4a0dD?=
 =?utf-8?B?TW50UzVpOW1GenNpY3pMTkdsNXFzVFZKby9tMkJXS3ZwdWgwRE5sQXMxcnpz?=
 =?utf-8?B?TzA5aStqMUxEdTFLOFRuM01DQzc2TFpRVy9MOEtVa1RndFZBa25DcVQ1RnVD?=
 =?utf-8?Q?CunnHAe9IpUfOYWuwPfsFR3DqaOkX0xCJ4NLk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFdrOVkwNkFZcGpibGxBMVg4K0pUVHlHaUFKclIyRE84WFNSSWZXOThDenZM?=
 =?utf-8?B?clBNbFJVYlFrNkNtWDE5WFJFeUhwZk1IaldUNWRKZGp4VXNJU1g4Wko2WDNP?=
 =?utf-8?B?dWJtU0tyV0s5SGZYbW1OeVNJeVNGWHR3T2owZXBZKy9tUUJBMVNYWlNlMXZH?=
 =?utf-8?B?aEpPNU1IK3BaR1pxblg1Vnc2aWE3NkdZWlFQa1JnbFpvRURqUERsbkNKQ1RP?=
 =?utf-8?B?WEQ5V2ZsOThrZGp4QjlobkFMVi9oUzNEUmw4OE9lUlQxODRqWDRHZ0JqUTJD?=
 =?utf-8?B?a3graXlCMGJNaCtCR2Z5dTViSFE0RURLbU1yZkVweTB5N1J6YlRrOHkxRStu?=
 =?utf-8?B?blErRk81S0ZZSEV5dDlrTW1HTDNrOC9BS1l6ME5vVW9ob1I3TXFwZUVaSXh2?=
 =?utf-8?B?WTBGdDV1QkkvUjJ0cGsxTkx2UTFPMm1aeG9CTTc0U2l4RzV5eFA4NWY3amxJ?=
 =?utf-8?B?c0IvVGYybnpzVGFIenV5NXkzbkhmY0FqRS9jd0V5bjdHU3lVV1ErcDNQcGlL?=
 =?utf-8?B?WGNIaWwwN2FaZW8zeEw0STdxUHgwd1FWZ1hram9OcE5TTDZGbDlrMW9rdkdi?=
 =?utf-8?B?UlVjTnhCbDNPM3RmSWdIZFp3bzE5S1JsRjllWmFoaVJzNFFyN2xBQTRsSnJD?=
 =?utf-8?B?K3dQYjhIRHFWTzZoUnFJM0hjMHEwRStyVDV1VjIzbThyUjhBU2tkYXJBbnoy?=
 =?utf-8?B?L0U1M3dTWnNqc2pYUG1ud2NqSXpXQ3pYWWZ3UFhSZ2tMb3htMC9nOCsxVkZB?=
 =?utf-8?B?eXhIMUx6eE9mVDN3aFhHODl0K3NobnhVRGk0V1FGdGZaYk5oaGN6d2VKcUpN?=
 =?utf-8?B?N3JVTWUxMkJqOVBWalNmVlFoUExLYm54d3orckFJN2hXbDNWVmZDbG10MVZs?=
 =?utf-8?B?Myt6NkNDbjlXUkZtM2dobmpndER3S2RJRkIvWHY5M0E3M1ViZW1DL0h4azRH?=
 =?utf-8?B?SG9vbVpveWFraGNjMVY1c3E5amNUOFRoL1JLbXBXZkZ0NDBCcTFSdFVDOVlj?=
 =?utf-8?B?d2FzcmFEZVF3RHhuN2JWZ1FPeExEcVFIaDQyeVFLYmdaUTk4QkFGMjROTnNX?=
 =?utf-8?B?UUhHZldOSlNZUHh5djlodzFqN1dLbmVvcXBmcHl4V2psUngrRlM3OHNValFV?=
 =?utf-8?B?dWxIdTh4QkhGRkQyRlp6VGRTa2w3VXN0dEsyK21JSERsVFRrUkF0enhuSjVY?=
 =?utf-8?B?aEFYMTU2ZFJ2WEs3d3FwTUI4NU1kZjFxZXpuUCtYZ1loaW5mc3ZuNTdKdXcr?=
 =?utf-8?B?NVd5S1BLUmYzdUkwSnRmaEQ5MmYxMXpmQUVOa1RIczNSNnczalFySVRWU01r?=
 =?utf-8?B?NWJTWGhiczFscXh6MUMzVC9NUUNhaGFLbGZQVzlHZ3krR1JIdVZMc0hzbXJP?=
 =?utf-8?B?K0Q0M0xkejRPQzY4dm1rZVRvbVpiOUNzd3hKd2laejNodXZGMDBQcXhENWxl?=
 =?utf-8?B?UmlxNXM0S2N0UWM3UVFuUlR0RCsrTUxCeFdTVXpVVU9WQXNnbmRZdzZZWWxw?=
 =?utf-8?B?Mk1FOUo0VlF5OXJPWXA4VTd6Z3Faa1dYNG5DVFVnY1lKdnJJZnJWTTA2elk3?=
 =?utf-8?B?bjBSMzFKNXFjNGx4SWswWm0xcHEwNi8wekZXRXFabkdYRjAyMTIvREFuenZ5?=
 =?utf-8?B?MlVubGhMWVcvSzJhcFNsckFIaURZSTZuYUE1bEdPZ3NTOW5zcW51Y0FWa2Fq?=
 =?utf-8?B?UXc0SlNuWmRVNDZWeDgwQkpzYi9tTWhjZHo4Um9aMm5zODRhdFJLYjYxK1NM?=
 =?utf-8?B?eXQzMkRFZUFvTVJBMlFPeXJwa1ZBbGtKNzJWM2tOcXVLV0czb2tkbFhIaFUz?=
 =?utf-8?B?Z1d5T05JNmJic2JqWU4xdkF5azA1WnRjT1FZaHJ1N2FZWXVMaytwMlI1alF4?=
 =?utf-8?B?RzdpQlpibnN0Q1ZJNHY2UFJxb01KNndZc205bXp3cUVXRUNsQ0pUckZZbmhK?=
 =?utf-8?B?cEp2RExqTk9xaEt4VG9tYzN4eEt1MmtTMnptTkJ3ckJTRXh3VFdOZGpEMEJo?=
 =?utf-8?B?cFE5NmFmb0RkWnJRc0pnc0lEMjN6VDFGSElBamFsVnNIV0F2MVBsVEdqRm53?=
 =?utf-8?B?SmF0QzliWDhiT2MrK2VMMlF0Qy95T3Jnak9EcjdsZHRSaGx3UHpvL1FUbGp0?=
 =?utf-8?B?VGxFakNzY2hSMzdkK2txK1Mra3F6eVNRSVpKdU5jM01OUGxkRERqZUptamhB?=
 =?utf-8?B?V2RyaWFDZXVERWRDZHkyWG9uODF6TVd6aEFQQmtzb0hURWkzNWd0S0k1eGNh?=
 =?utf-8?B?N2tZbjlzQmFjMUN5cXpHM25nNUxRPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f303a714-b3a4-4e7f-7b88-08ddf1c40222
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 06:17:11.0372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytZER8S0guSueur5QRj99YkGRp0U/y6UepklbEXWE42m6myZP+QBDQiIN8c+OHN1Zm1lezpUcvB1onj3PvfGHbxcYmRTJJ5A7vSCeWhchKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8008
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

Hi Frank,
Thanks for the review.

On 9/11/25 17:33, Frank Li wrote:
> On Thu, Sep 11, 2025 at 09:53:18AM +0200, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 81 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  5 ++
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e113a2ad16aa74f982b9c2ea80578aed2d9424fe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +allOf:
>> +  - $ref: common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-supply:
>> +    description: Regulator which controls the boost converter input rail.
>> +
>> +  pwms:
>> +    maxItems: 1
>> +
>> +  maxim,iset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 15
>> +    default: 11
>> +    description:
>> +      Value of the ISET register field. This controls the current scale of the
>> +      outputs, a higher number means more current.
> 
> Use standard unit. Do not use register value directly.

It is unfortunately not just a value in Amps, it depends on the hardware 
design. There is a kind of "default" table with a 49.9K resistor, but 
depending on that resistor the current is different.

>> +
>> +  maxim,strings:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      A 4-bit bitfield that describes which led strings to turn on.
>> +    minItems: 4
>> +    maxItems: 4
>> +    items:
>> +      maximum: 1
> 
> led should have standard interface.
> 
> check  Documentation/devicetree/bindings/leds/common.yaml

Thanks I will investigate, that may indeed be a better abstraction.

Kind regards,
Maud

