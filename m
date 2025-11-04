Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1717C2F625
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64E910E51C;
	Tue,  4 Nov 2025 05:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Hcx621kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A6010E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 05:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWpdXCZQqpzvCGptBF8RNyO1Q9IYBYDWHebKqUNZkMkjwiNUO0/4fDsY4myCpeRxSQw3SMST9g28UQpMIsPaqoM6xR/KT6OBPGZ4VJdWZs+G9ORywh39WnnuYdP2/Ywf9F2+438jcy4Ddk4UWkoRaEWRnP4vEVD5u78GLawkBZUH+L1aD4PEMfRh8sBK1uJVRuuVbu5Aosq7LRJM050kfsIWXKpI/8lqbml9MvQ+O2yaGXlYCn0gBR0T1j7n/3phNxUjLjVFhMaqhBmKTdl6UhdkEwdKpz01rGvitBPr5npO8ej3ipmQb7hVxli0cWs/c9AISgnRJwfS/FsFmASf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzE4RKLKWSsGNJSLz8tXoFIlKeY2KC7joNrdP9tlAnQ=;
 b=we7rdx8LKyqG5PH0985e4E/S0Q6yg+MIZxINsSRevLWAH0MoKgRF8DtyQ519AQYLADgkgg6ZOw1ScBrb8u8UhlOVbmhnWyZt9JvpX+tAUw+r8+2Zio/eCepCyT2fWWcSGXO8oSciUW5LvzGQfB6ENsSCzwHT/0DQoDOgIKoa86AQz2bnnV+QMaSQyxnatFYCcXusooUOcr3N68z7IlP2WqKTtNpNCMVXXIQWydKl8XMjI2iyRvgW7J1CSqFoaG2EAlUbkSVKl5oTJWqlxQgD/j9c7YZMLEjCyfldI0+YQ+UluupQVcGqeVqZ+LWfBSwAtakb/j6wDIqnw4yP+m4YHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzE4RKLKWSsGNJSLz8tXoFIlKeY2KC7joNrdP9tlAnQ=;
 b=Hcx621kfF8e7NN9HfChiCjwNt3FWSejiKU6Y8UBOBXEJxQV97XPbEstvv0aGBNJuRQTHdkRIvf0LM0q/bzk4b87iMktrP+RwE4anz+5LPw9bqZFyIX13/7oJGDPtx1l54eHuIIp5hJpYhPgwAsmoBUso7cb11++V3+vtrna4+7lKwMdAHlGBnGogwDCFy+sUVTfWpd/rbS2cdsHksSaanDgWfB4hIM8wyzrzySCsPe5H0CRWzZcxkH2Nn/sOrw5pJAx9W1luX76wfdIvU37QcpnpHF6fWRrXuCGgKdRs+eq+cuCfFGiGKhAVe2n6byF8H2dAYWG4xtklbrcjQaGc4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8663.eurprd04.prod.outlook.com (2603:10a6:10:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 05:36:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 05:36:53 +0000
Message-ID: <673c5737-6a8b-4008-962f-5d63ef5684b4@nxp.com>
Date: Tue, 4 Nov 2025 13:37:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
 <0c4bb240-6f5d-46c2-8a0d-7446ad3a9d31@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <0c4bb240-6f5d-46c2-8a0d-7446ad3a9d31@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f51bca7-49db-4e6c-5753-08de1b6428d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1A1T3lvZ01oeDU4Q3AveGZJSk5Ca1F2KzBMR2tDcFpPclJGTlh4bUVIQ05H?=
 =?utf-8?B?UURBaVYraGtraFBzd0pRd0tMMWVlWFY2WVpsZ1ZCM3BtNmdtOWp3MzNDeEtU?=
 =?utf-8?B?K2RidlIrd0ZGVDFZUjYwaDBVQXJZZ04ydzkrYXNUWEhRVFNJSHJaVCtxNmZK?=
 =?utf-8?B?VWJZRERRSSsyQ1FLVDgxUW5KS1Y0amc1US9tOGpaQTkxdlhqL0xXMkRmYjIw?=
 =?utf-8?B?a1JjRm9RUHduSGUrNER4dEg2UGhZUThRWlFXL3M2TE1WTDRwS0NrS0VIcTRt?=
 =?utf-8?B?R3pJVkxDVkl6UG9MSE5MajJObTUxSUVubjl6SzBxYllyY0JHQUo1VFBLK29a?=
 =?utf-8?B?WEpqdEh0ZFEvY082NURQdkpCNDlPODY0TjhzSkR5WWlVR2FCQkhwa2htUVU1?=
 =?utf-8?B?c1JJdHN5Wm5zc1RqV1NJQ0xoODlwbkhUdXFCVHpKeHhoY3lNV3VZelRRSUFX?=
 =?utf-8?B?eGprTmFjM2FZUVJhQVVqU0t1QlFnQUpoRzJESzhlSFpGSFRLaFFEVkdHU0t6?=
 =?utf-8?B?QmxNcU9GdnovbVVOQ3RFaVFvMHp0SjhvUi9tNGl0RmQrRjZOT0YxNzVTck9s?=
 =?utf-8?B?NkNaRFMzZWJlUmpJTnhIUTZITEZvUWsrR3dqejZpNngzbUFRNTF1TndFV3Ns?=
 =?utf-8?B?SnhDS2k0cmpuRUpEWCs4VHFnTkh4aFprclBnKzdWM1M1ZFhHeDd2VnRXSzlt?=
 =?utf-8?B?SzIwQ0trejlENUgwVC9hTDBGOUtJMytLM3NYZGtGd09kOVoxQlJtRG5IZTBt?=
 =?utf-8?B?T3NhYWoydFpIZTFldTE1VUJHNGxTTVhDMGQwNXh4WjY2MGN5TUg2bEhQa1Fh?=
 =?utf-8?B?ZlQ3TzV5WGxPR0l5NXcxWktpOUJ1dlNpU0VRcGRiTFowaHZLMFU5bWFtL0Fl?=
 =?utf-8?B?U1c5R0RjeHJuRHJScjliR0FaN01yWU9aV09KRlFYR2pHWG1hTzhQc2dCQjEy?=
 =?utf-8?B?eW9SZHB5eTRqWUVBM1JnOExSb0VsUzgrNFNzbTdJTlR5bHJHbVFMN2JSWldY?=
 =?utf-8?B?M3I1VUVNWndHTEwzZ3hQWGFpOU4zMkN4dUJYTVgxRURTZFdsY05MQXRmK2Fm?=
 =?utf-8?B?N21zSjZnZVFhZnpFUzRqMGZEMXI0R3UyZlFVakNoY3Y3b3lYTzV6V2lVME55?=
 =?utf-8?B?YUYzUTBwc21sc1RhNExTWkN5V3R6K0p0OUExSHFna2FDaHlTSjcwaEdydU5X?=
 =?utf-8?B?RmJjYTdsemw4RkcwM2kwcVNObm9FQkJucHBCOVNDSW1ibTdLbkNCVTMyTG5o?=
 =?utf-8?B?TElPd0Qxbi9UWkVCRE5KY21lRVdhYjQrUjRWZkxwaFFrZXZpN0tsNDhHMjJu?=
 =?utf-8?B?ZkNGMTFaV1JpK2R0VXdpYU9jQysxaVRWRk54NHBGWkh0Z2NiNk1PY0VBZzRD?=
 =?utf-8?B?SW55clVRMlFUT3RJTnhjNVBBcmhmZFlLNTRUTVRQc0I4Y1daSDkyMWxIZWdS?=
 =?utf-8?B?ZW1SZGprUFB6NEhiaFEvMDI2UW1JUUZDTno4anpBVjFsSm4rR2JMQS9QUjFu?=
 =?utf-8?B?L25OUVROUXNoc2ZYT2Nkek03cXhOQ3JRWkw1bEpVMXNMTWhCSCtUbUlyMFBQ?=
 =?utf-8?B?U1JYaGlCR1JwYlJMZFhNRHUxZmlrTXhVdXI4amJrRkplRStFWTVySXZDTjRI?=
 =?utf-8?B?Nkh2azBtWktHQXJEWU1nN2M3aGRHeW0vR2ZSOFBCNWVOZnIvS0FyY21aV1Ex?=
 =?utf-8?B?MzhvUy96N0svT0M5RW1mTWNYTjF3bGgyT1pyZ053RXJlUjEyeG81Zk45N0Vr?=
 =?utf-8?B?N280bU8rZE5Hc3BxU0pMU3pOODdTNU4zWGdlc05SNXlBQXVNbTRGdnArNlEz?=
 =?utf-8?B?Z3NJT0psNmJSQUw0RUNFcGZKZlJMT24rK2dOVXIyRVZoL3lBWUpxQTNQZUtP?=
 =?utf-8?B?WFkxOUhHWTZlWUluMFhkMEtjZkZxNG1KNXhlZm1MUmF6MVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFyUFEzbVV4VlBTNHgxK09wbHBiNWt1ZjlYd2pzUFFyZnY1bm4ybVBWcmgy?=
 =?utf-8?B?SGxpc0FUVTBjRFJmekVXZUZ4bCtKRlBvaEZGUEFNL1YwSE1xTHYrZFV0U3R3?=
 =?utf-8?B?N2w5VDNNRjQ3UDJiSlFEdzZRUFB0VFBLNU5Cbkp0Z0xEZW9WZE5oSmozM0hz?=
 =?utf-8?B?SmhyQXIzbmFXZXJTUGVMQjMxdW9uNEhZajNnbjlHRUxIMEdaZEo3OUtUSW5R?=
 =?utf-8?B?aGpwcFF5bVRmSENudHdCWDR1cGZUTUc2Zk00NUZnbTBaOCt6TU1yS0tTemZO?=
 =?utf-8?B?d1lPT2pYa3BVWTF4SGxsTWFZMzB3VGZPV2JRSmN4alFKeFpJeUtGSkJRbkZz?=
 =?utf-8?B?L2I2dWFIYVdLcDJPNTRVRzRZa2o2b2JrSDNHMHpFYTFmWVdQaFZiSzgrZzBK?=
 =?utf-8?B?aHhLczQ0UUF6eGFTZHNaU2NuZEo0Sy9kUXBaanNMVGpBUTBpNldVUDU5eFlC?=
 =?utf-8?B?SDF0VWFHYkx1NGRNWnlWcjFSUWJxKzZsNjF0YVViSzV3MlFZV0dpcDZzcGM1?=
 =?utf-8?B?MzZpeU40WUJyU0ltTE4zdVpDRFZPVGwyZFV1NDlTUVpTdDJaYUQ0SmJuTFhu?=
 =?utf-8?B?RlI4L2hLMWl3aHgxQzZrNGpGU0h1bk9rdWNSZTU5SnFyMGNKbWQ4KzczWWlI?=
 =?utf-8?B?UFFxRFJEenJrN3dIcHZlcjdlUHBQMk1WMGZRcVlvZEkvNFBRVmNScDlPWWwz?=
 =?utf-8?B?VHRSNVNMZUU2NlQrR0diM0RocGFMYjJSWWhOZ1pyWjBvakxqemZmOGFBRk8r?=
 =?utf-8?B?OTJBK0hMUGN0YkFEa2dyV202VWNRb2R5UE84S1p4a0o4bHhEWVFFOE9rMEtS?=
 =?utf-8?B?NWltbEIwdjN6Q2JsK3JvSU4vTXRtbU9Scml2TDRBYzVVRXU3d1o0eVdReThU?=
 =?utf-8?B?UVNIUEROeU51bCtYM0ViSUx3NVczaVhRTHZna3pmbGZQekhZU0Q4SlQzN0sz?=
 =?utf-8?B?OVFRZlFEVC9ONWY5MWx0WS9IU3lNc3hFQ0tLM1ZpaWlLdDZ5NHNqTzFjdnpk?=
 =?utf-8?B?eTUxSTRjdEI5aUN2RWxHczU3amlGajQ0UEtEWTdycEpMRFVoTE1KcFNRWlN6?=
 =?utf-8?B?VFdhSHdwVkdBeXc5ZGMwM005TDRobXJyU2NhUzlCMk1obkJibmxQcEE2d3k1?=
 =?utf-8?B?SU01NkJGSzQ3N2F1TFNjNUs0TjJTSkM4TGVOc3hEOGlLZExoMG9uYnRrR2RO?=
 =?utf-8?B?WXF6MGQ3Y2llNjNZeTE0bm5GK25ZM3B5RkpIVW5jQlBnbmtkT1BxQWF6eFRa?=
 =?utf-8?B?U01KVGk5ZThJYk4yQnJHQWEvWFZMTjM2UmVxeGhmNHdiU0lCMTR4SzltTWJx?=
 =?utf-8?B?Ly9MOVh1cCsybVFRTUt6QU0wLzNwY09HK25PcUxGUnJ4c05iQ1QvL05BYVlT?=
 =?utf-8?B?MUV0aG1wb1ZlSmtabUpCWk53aVcybHRUWHVOTkY4cnhVUHN5MXZSVk5LSUtZ?=
 =?utf-8?B?QjlyRm1pWjJsdVNxVDZ2cmgyN1dYcVpXRnFwMjhWc2dRSzZibFBqV0dRL0I3?=
 =?utf-8?B?L3JlYS9CazVTbVR2alRBNXdFUUgzdFEvK2pXcXc1ckxZTXZGemlsdmo5czVv?=
 =?utf-8?B?eDY1UHdIN1FUYkhCYlQ0TnlEemRTL29JSS9xRFVVRzJDRGpVNzU1bDRnV3NK?=
 =?utf-8?B?NUdtYVQwV3h1ejJybkxlcWVNSnRjOENKWTNPWWFYd2RPMENFU0dxeHNDOUFP?=
 =?utf-8?B?NmhyZmpvZklYWnhpZ2swbWZNenpUVGJJRWRzc2FYTDhZb0Q3d3AwUDY4YW00?=
 =?utf-8?B?WXJQSFYzZHljYmlxR0FNcHpoWnA5ZEswZmFwQzFzNi92dWVNVjBKMXpCUDZx?=
 =?utf-8?B?T3MvZDJ6VklNM21jZVJZeFVYNVN5YW80aEMrZmpyK2Y4ek1IenZ4NlMvU3ZV?=
 =?utf-8?B?MlE0UlNLQ3lRVnBGYURQWjhyR3JhbjZ4Wk42RXVDRDR5bm81V2xmQ1hpN3dp?=
 =?utf-8?B?R296dXM4V29XVGwzYzhOaWI2SkFobStmTE5QZEJDc1lEWXQ1M3NpQlRMYjZz?=
 =?utf-8?B?S1grUS9teCtYWVhta0tieFZJeG9jeDBMVTlISHQyVmw1TGJITXRaRGxZTDRu?=
 =?utf-8?B?cFdyRHgrSy85ZGxLcGNPUWI1ZjFUVUZWZlFiZEppK1gra3FJbEFGMlliV2t6?=
 =?utf-8?Q?dp7KIWoA1KVvYeb2akwq11ZPY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f51bca7-49db-4e6c-5753-08de1b6428d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 05:36:53.1946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oidiTaBCbPM5pr7+57LYQNyFpBLTjMkxs1E6CG6yY8L0pr5RrsbdwiNS7u2b5L45O1pnkyVJPQJALBvxeeMNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8663
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

On 11/04/2025, Marek Vasut wrote:
> On 11/4/25 3:39 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>>>   };
>>>     struct fsl_ldb_devdata {
>>> -    u32 ldb_ctrl;
>>> -    u32 lvds_ctrl;
>>>       bool lvds_en_bit;
>>> -    bool single_ctrl_reg;
>>>   };
>>>     static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
>>
>> As I pointed out in v1 comment, this patch should remove struct
>> fsl_ldb_devdata.
> 
> The lvds_en_bit is still needed , and I plan to add MX95 support here,
> which would extend this again. Going back and forth makes little sense.

lvds_en_bit is indeed needed and it doesn't have to be in struct
fsl_ldb_devdata.  Given that it's not clear if i.MX95 LDB support would
be in fsl-ldb.c or not and it's trivial to add struct fsl_ldb_devdata
back if needed, I think this patch should remove struct fsl_ldb_devdata.

> 
> [...]
> 
>>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>>       fsl_ldb->dev = &pdev->dev;
>>>       fsl_ldb->bridge.of_node = dev->of_node;
>>>   +    /* No "reg-names" property likely means single-register LDB */
>>> +    idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>>
>> You don't need to match reg-names.  Instead, just call of_property_read_reg()
>> twice to get the first reg and the second reg by passing indexes 0 and 1 to it.
>> If the second reg is not found, then set fsl_ldb->single_ctrl_reg to true.
> 
> This wouldn't work if the two entries were ordered the other way around in,
> DT, i.e. first "ldb" second "lvds" and vice-versa. That's why properties
> with multiple values also have the -names property that goes with them.

Isn't the order checked by schema fsl,ldb.yaml?  Let the schema do it's job.
"ldb" is the first item and "lvds" is the second one.  If you swap the two
for the example in the schema, dt_binding_check would complain:

DTC [C] Documentation/devicetree/bindings/display/bridge/fsl,ldb.example.dtb
Documentation/devicetree/bindings/display/bridge/fsl,ldb.example.dtb: bridge@5c (fsl,imx8mp-ldb): reg-names:0: 'ldb' was expected
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
Documentation/devicetree/bindings/display/bridge/fsl,ldb.example.dtb: bridge@5c (fsl,imx8mp-ldb): reg-names:1: 'lvds' was expected
	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#

-- 
Regards,
Liu Ying
