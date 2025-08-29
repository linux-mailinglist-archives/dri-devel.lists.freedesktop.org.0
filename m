Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA209B3BE1C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 16:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C8A10EBE0;
	Fri, 29 Aug 2025 14:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="mXNmLGIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazolkn19013078.outbound.protection.outlook.com
 [52.103.51.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932810EBE0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 14:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soQGqQRodMhwYOmiIswKFHlrgBwmSMHpd2/ViuHq2/A+16/UzViIkOBZpSjkdxsbiE4Swndnm25iIJeNyc/wy2yFtPfHajK7eWwWfTWwXQ13oWG6Z71vzhHCwB7XRLfa+tl+sihZN942SSQqu3gbp58LLnSEXGruGndIlAzMXtlwvKI5q3FmLblqMcIAuIwMxp2LNsWRB4J6KU+vjdP3aoltGWRlH5GPvdzakevFb9k8I4EaYHYHSHCy3wNxTXLNI6+mskNIunyDSi3zSwAzL0eznmAvCRh+pFePwnDgwAqA0qkwOYM6LLFEB2/7ECT/EtxKUGTsoYn7M9iV2DmRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk2K9BGV4wEy1ynTE3uey2bIJHHAK0ATPary+mS4NXc=;
 b=SA2MKsun06UdWs5ywmREXWV0zegiyRWavwq5pnX4l4bgtWzLNJUlOWYDf5pWJzbRiLRTizryRi5VPUSl8Ha34Acv7nPnVcIyEHAV9nr9cZw1QJU2i2MUwZ+MF37Gs7j2OdrggJ1exA4iW2FuFUkwXFKIe2M1VD3KAMAOZbw9WQPmREpM5rZ3qTlqtUYrGAQiAVfQwAqh/OijFz6q9ln4v8H6saRFfFuDgczUvjKWwKSO/gk931j+B6CH2MySKHhktESwVi87ELq6LR0Rr6bYrNo9xlNJL2sdlN12mhUfiwZiprne6qhfMUs6VhXg66Gp1w2VD1IiPOPIElx/pOmyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk2K9BGV4wEy1ynTE3uey2bIJHHAK0ATPary+mS4NXc=;
 b=mXNmLGIQTzPuZGgJibmMSaezC4B0ExlSBvuCDkneerYP7rHPHR7+TfAgDrPRHfClTz2M+OqeNdSieJCIwaN3SxLr1EnJDE6HA2oSK/S9D9vg70l7KJSm5aC0ePbe46f++fQMydzEP7A1O5C8MfHuSE0blY3h1UVEhr1dnLvXe1eqj3JiH37qSjqMq6vDO5ZUaeWepwrZIl6V2kto7lkyGnv8/yYk57aN4hmQtRYYkaFyTG/B0v/ys+vgwvRSmPUCgpydEtELl7KAJLME0LaZtZO55/3Mktp6hsGrYKCI18MD5rdx5LhYQnOBs/2JIGTbE+aKa0gazvnSs5ysEmgVnA==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM7P189MB0709.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:114::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 14:41:46 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::5756:694d:1641:3b13%4]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 14:41:45 +0000
Message-ID: <AM7P189MB1009B9BCECE97040CFD3DBA0E33AA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 29 Aug 2025 16:41:45 +0200
User-Agent: Mozilla Thunderbird
To: andyshrk@163.com
Cc: Laurent.pinchart@ideasonboard.com, andy.yan@rock-chips.com,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org, naoki@radxa.com,
 neil.armstrong@linaro.org, robh@kernel.org, sebastian.reichel@collabora.com,
 stephen@radxa.com, yubing.zhang@rock-chips.com
References: <20250822063959.692098-1-andyshrk@163.com>
Subject: Re: [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:208:1::39) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <8c734920-f247-4fa7-8f36-9664fa6cde07@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM7P189MB0709:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6505f0-9eb4-44aa-ff6a-08dde70a2d74
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|5072599009|461199028|6090799003|23021999003|15080799012|3412199025|40105399003|440099028|51005399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdDQy9ucFpQRUdrTGhqZVdtQitGdS9lRFpIa2Y0Ym5GYklmclJwa3BJL1cz?=
 =?utf-8?B?ZnpnOEdOSTVVTlB6V1JYa0VVRzh1eFZCZUdWOGFpMUdCTTM5TDRIcEhnclY2?=
 =?utf-8?B?Wkx0MXhYbk9ML1M0NGZHd1VIbDZsSmEyVUVuRzBxUkI5bUJuTHhieHFFUm9t?=
 =?utf-8?B?a0IzcnRWOWxveC9ZSExycXFrUFd6ZkpGUXJYcjhDQStWOWpXWjQwM0tqaHR0?=
 =?utf-8?B?aE9qa2ZscnIrd0ZkWi93YTVXYi92MFAzVWtkUjlvbGxFQlRPL0sxN2RRZ1N1?=
 =?utf-8?B?QndidlhJZm9JcGxzMjMrczdCR2F6dnVUSnJxZHo5Ykhjc0xFYmh4OTJ2ZWJ4?=
 =?utf-8?B?WDVaT2R4RVZKcGp1OVlTNU9KLzVQRFovQUZXYm5Rc0hIZWE5Mmh5TTJxbWh3?=
 =?utf-8?B?N1htUjFTWk9EemtFaWRQanJVSGdmWXpDSUtGN1NiRE1Oakp5VSsveWw0R2lk?=
 =?utf-8?B?bDJDOHZkd25BWi9uYUNvZlpmVlkwQXVLZUhWZ2J2RDZMdGdpQ21XbDN5bncr?=
 =?utf-8?B?NUhkVHZubWw4K0puUFliZzd4WGszMHZLeDhHWGxPUnZUQlZRM045T0JZZ3BX?=
 =?utf-8?B?UFltOGtCTk5YeWMyKzhySGl0QWhQMEx5dXZ3enBpTlR2VnlHZk8yU1JXT1Zi?=
 =?utf-8?B?RS9NblRmaUdVVTd5ZEhGODBScDdZOEhyRmZXZWZjMldpMTE2bVZObmJiL0dK?=
 =?utf-8?B?MHpEVUZoOHlkb2k4TllWdFFuSkw2VVd0dFhqY0dqS1krMHBDeThMQm5SZjlV?=
 =?utf-8?B?WUVSVlFFaW4zVXMrN0E5cFh0Y1AvcXVLMitKNE5wajhmRnNSbFFxTG9qaklZ?=
 =?utf-8?B?QzNOQWdyVkNPc25NT0EwcHgzSDI3Nm51NGlHY29ibWg4NU1yUkd4UmhDVE1j?=
 =?utf-8?B?d2lCK2RDeHh4U1c0Ym9iQUl1UkpUZHdseHpYK04vV083ampDYzM5N0pDdEd3?=
 =?utf-8?B?REtsTHNBRjc1OThHQkk3bTJVUUhoeU5MWHRJK2E3VVdpTDE4R2MyMjdrd05m?=
 =?utf-8?B?bHRDR1FDVGYyV0loVWdWaWk0Y1BLS2VNVy9iZWV5MHYzdXRGN2pyc1U1KzlP?=
 =?utf-8?B?TkY3WFlPYjBWNXlIZ3p4YXBpWXkwOXBuSitkL1pZenkrVE1IdENzaFNEdzhk?=
 =?utf-8?B?M2trQ2tsaURUWEt2b3NSSVZUeEkrOThIK0pEQU0vcGI2bU1WNU0xWWhjS0dL?=
 =?utf-8?B?YzRmYjRQWG1OdDY2Q1NmM3pxMlFFK0MvNXp4eldMOFQ1ZzNWUmx5VUVFMFl5?=
 =?utf-8?B?SWFGcmcyTXFQclBOQzlDM05VQ2hKUmd6NWlJeW8wcmRUY0FJRXhaL1AwL3hn?=
 =?utf-8?B?MFNXR1EyOWJDSTFsK2h2YU9jL1VsRlN4SGd0dUhYR0dwRklEc2lua25RZ2lP?=
 =?utf-8?B?OTRLN3FSUEZRM2h4ZGtzTldqME1oeTRDMWpPRUFVTEZwVTVrbFBkVURaZXBU?=
 =?utf-8?B?RytXazUvejFnUlBBY1Z6UE5nTmt5Zmk4YkZHWWFHeEV1Z2hxZEF5SlhlWFFQ?=
 =?utf-8?B?cUJUckwvQkR1SXJodzBsR1JoS0ZDd3VMNzVlcFhoMXhoNGtmSDJBbmZTdU1X?=
 =?utf-8?Q?DV9dTqy+GPyCXRDDYVJT2MOA3jmL5RhGPd3ZRk7cvm3gR9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjV3a1FrRndzUEdHL09mQVdrT2tzNjNHQm1Ld2hWVWE3YmxLWGhVakljWmpE?=
 =?utf-8?B?S1U2UVJiQWRGTUgycjJ4ZlhFVndtUVR2aEhuYWdrMmtpdkVmOTZZNVlWSHdy?=
 =?utf-8?B?UEZYNnAvWWpaMGQxSElCeHJnSnVWNS9xT0hIdTdPY0VLTWVTbFlML1EwTXZO?=
 =?utf-8?B?QnVacUpzMy90Mnl6SExidjQ0YVQvZkZ1aFFheWR6c3FyZzB3RmxMU3JFSlE5?=
 =?utf-8?B?M0tKZkZkcUc3UzFtbHYxYmVwcWRIUXFBTGk0cXFmVWRuV3pCanROdXB0cjRZ?=
 =?utf-8?B?dVpIR3R4U3JVeXltOTBLc0tBQ0ZWa3FwMWRpVHRVMGZaaEt6UU9DUHN3MWlL?=
 =?utf-8?B?dVdUZ3ZMUzZOZ2JhWVdUaTJub00vSDNPTHJST0JMd004YkY4WFQrNDBiYlFX?=
 =?utf-8?B?TnNTMXFkYm91aVdjWVArZDh3K3FWRTUwN3dEK1NlRlhyMFFhdU1JNkljR1lm?=
 =?utf-8?B?RXlocVExYkxXSUJ2dnhmQlovVlU1bEtSN1dlNS82YWh2ZlpEK2pialpHaFVv?=
 =?utf-8?B?bUlMcEZCRmRwN2xMRFhXVUg0ZmNWSWpzTjUva0pLeU9rSjlWc250NjdxeWRw?=
 =?utf-8?B?SnBJc0k2MHhPekFzMlNReUVmcjRGeWk1ME5GUkEydjdVbUFaVlNhMjZHenhy?=
 =?utf-8?B?VEJsQm92dWtjVkxXUUZpMmpvbzJScWVDYWVLVGdzNkpDdTc0MXpoY1BIT3Rr?=
 =?utf-8?B?bnFSYzl4NnhTMHhNa3RiUTVRYytYQ2duN0huLzZ1aFl5ZVo1ZjNpYU1qOWhq?=
 =?utf-8?B?OCtGY0pWWXRkbm1SRllzYUZ6SGcwWVlGRDY2TjRIK2JRT2o4QlVvakNQc3cr?=
 =?utf-8?B?eGNsTFRJbERJeTVZLzVaRjRwdk1tbUMyNXJYUXV5VTBTMjZSNXVSK1BFd3d3?=
 =?utf-8?B?N2d5b0hpcXBjZDhraDB4R1dIYWdlVTUxenc3Mnc0bG5LdlV4azlVZ0VjWU5B?=
 =?utf-8?B?V0VaTkwyb1JTODdkVVJoTXZVSFl5VnFsbW5HWlNvQ3ZuMzhtWjZUSUc1ekRW?=
 =?utf-8?B?dTB4R0xINGlISzAyZ0VNNGNoSGhad1NpcVFCOUN0SXVUaUhQZmpwWE81czhC?=
 =?utf-8?B?d05pRjlSTStUT1ZBbFB6TFIwUnFnOVNJNjdUdlhySWxGMVZ0Z0xoVURCLzkx?=
 =?utf-8?B?bjQwVTB1UXVxM1BhYnBmaHU2bFJJOXd6SXZGQ0djRnpoUUZvalZHUlZQMzdF?=
 =?utf-8?B?QnZPTmNwSXd6QlZDNndVV0pqS3JsMVdpWUdKSEk1V3hZbkdrUktBN2ZScFJi?=
 =?utf-8?B?VW94WHJ3OENIMjB0Tng4WnYza3JDbDlSUUxMekZWc2FSNGJrRmdkRVFmU21U?=
 =?utf-8?B?QnJIYktGVFdCa1FlT2pXdjRWdkJlTVhPWTFqaEk0OWlSb2w2Z0k2ZDM0cmNC?=
 =?utf-8?B?Wlo3d3V0bmdTSEFQQ2ExUE1BL016QktHb0NiY0Q2TVVjaWJVUlBoRC9GbHdx?=
 =?utf-8?B?Z2RJOUpSWWZ4aGpZZGU1aE5TQkxSWktwMTBDWVhXV1RzcDB6c1VCL2FjSm5Q?=
 =?utf-8?B?L2pKZ1g2RlFuQTR1enorNGV0a3I1UjJHUVBLODBKbURLakp4K1V1WS9KYzFj?=
 =?utf-8?B?cXBiVWF3Wjc1SXdtZWN6QSt4UlhvNkNMOXlZNVE2cEdxQ25EUUpDaDlaVHhM?=
 =?utf-8?B?VHF1RGxUQ1duYjhycEQvVitNSGVBQUMvODc3N21LOGtjbGs5Wm5FNERjc2Y1?=
 =?utf-8?B?NWVwWVFoNlc5TXAxcDRuS3VRVWFEMGR0K0lSWkIycGxaSWV2ZmdTUzJzWjZp?=
 =?utf-8?Q?F0TMnMcCuRkFXk7pg284VQCLdZN9NJb6pzEX1x0?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2ef4d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6505f0-9eb4-44aa-ff6a-08dde70a2d74
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:41:45.9471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0709
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

Hello Andy,

> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> * DisplayPort 1.4a
> * Main Link: 1/2/4 lanes
> * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> * AUX channel 1Mbps
> * Single Stream Transport(SST)
> * Multistream Transport (MST)
> * Type-C support (alternate mode)
> * HDCP 2.2, HDCP 1.3
> * Supports up to 8/10 bits per color component
> * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> * Pixel clock up to 594MHz
> * I2S, SPDIF audio interface
> 
> The current version of this patch series only supports basic display outputs.
> I conducted tests with DP0 in 1080p and 4K@60 YCbCr4:2:0 modes; the ALT/Type-C
> mode was tested on Rock 5B

Is there an example of this? I want to implement it for the usb-c port 
on the orangepi 5 plus, but I can't quite figure out where I would have 
to link the DP output endpoint to?

The usb-c endpoints are all done. Is it to another endpoint in the 
usbdp_phy? The only endpoints there seem to be outputs. Or is it 
supposed to be left unconnected for the ALT/type-C mode?

I've tried reading through all the relevant dt-bindings but can't find it.

Kind regards,
Maud
