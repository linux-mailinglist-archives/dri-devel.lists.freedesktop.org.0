Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCABC4548C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6C10E30D;
	Mon, 10 Nov 2025 07:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="RxnV9ire";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021085.outbound.protection.outlook.com
 [40.107.130.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6110E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwtW3pJ0y1NlLWuPfk5HdIfT2g9yGugScIOlxrLMTLf3X+fVY8xK5RzLiADvN2stH8vzQ4FPKiBZee+4vwpcJltAlLGZuEqpoI6qcc9gf/dX3in2ZjRJ/4gErX3aoiyu7uJn7nEcZIUJHr3mE2LBouvzlJxFC0gNgAmtLsijd0RQME7l9v7SQR9ftGzpiwyvCU9EXw5P91XorTszmQP0878iRJyu7peA15+r2NbvUVVj86S2bHK3Az8t+0mrzesBGhUm6Ryjx5Ne+BxU/6TyE3RnNEBM9M9WGgIxZYL4LRrW/hNIU+XPuxJzjJAeD3P0P7B1tFTlmlCPCrk+5qJ0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3A96plC3jpqKDZ3J5oQI0P3rWZ+1DwIzjkEvrmzFrE=;
 b=eOMxMLhec78ZADQswMU0PTYLimikD3JWBsjpHIeTCmC1XPEaUFiYl09C7Cg90GwX5fSIhKoiZCl1vD97VwUwd28ZQZXHLbc1SVqqxkFVS7HKBQ7tMs0JB2sN5KecjCrnFd0mSBE8Owk/Nse6GZzYa4OEyGWpr8OZc7UIi7ulDCbB7G/uFqVQ9ybcAnggcCiz1y69g9Dh24IBUi/61sq0T14AUvLfbfvGvjovKtLqf5IXlydMxWtebPbwQh0PtzDppwvoJoVcIqUWT5fEClaHJLCWGYzSY5C4mjrov+dDsCmvPDUtm/6pM2ooc6J+fdQNpmFRipnTp4MTMtncy69OmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3A96plC3jpqKDZ3J5oQI0P3rWZ+1DwIzjkEvrmzFrE=;
 b=RxnV9ireiSZd2EgCf+oMzSjCJTfxzGJ4Cu1yvw6pP0y5mj+xrPurcGqHhKXhGKy38vfy2pRqDY40TQqTW/SHO1iUbox0gK8Qu6yFm5eZZGnTI7SoUoI44/4404L+9sUy7EGtYAMoMyXKCjaqXKQbe237Th6oc/B+9OCkL45Sa5g1+Bus5C6sa6fW5mUl0/ONGGjuXLR+X1aOOGrIB3wynXkRVJUZXHbMT4vkxw1Kh+cVpx+P229cNymvVmYW/pzvagU+l5VgK7a2rgwnxvuEZUmLQNLtjCwgSqgrGm9OnaOZM53UeX5JLd7H2dXRF0bXLl2rGvvsMDKRjEm7Uo2ikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AM9PR04MB8400.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 07:59:50 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 07:59:50 +0000
Message-ID: <b4e76c88-0981-4b71-bcbc-25332c6e3bf3@gocontroll.com>
Date: Mon, 10 Nov 2025 08:59:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 supporty
To: Frank Li <Frank.li@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
 <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aQ4RqNiGsngOWrV5@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::21) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AM9PR04MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7106a08a-59bc-48df-f51e-08de202f1ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MExDcW85dVo3NkVhR3FLTUVXMHIzS3dwU1BaTWtzSnhNb25EU0ZRMlA4U242?=
 =?utf-8?B?STlPVy9qUGlsVysxM1NseWd5MXFVKzBFSHVRUzk0Vk9qY21zcGQzcXFZR05p?=
 =?utf-8?B?dUptd3FkNkd4NHVGeE5jbXZKQTlDMmtFTWRHdzl6dXJGeEhWSDZRSkQ4dzR3?=
 =?utf-8?B?dmE0U3J3bnRpRDFrbVY2WVNWNGdhaW1EdXhlTjVSM0RPMHl4VkZTVmxCS1A5?=
 =?utf-8?B?cWFPUEJUenkxT215OFhxRHFiRytjWllVcjgxamV5cklrNHp5N1NHK0RWSUc2?=
 =?utf-8?B?eWNhZWtLRFhRbzArbS9DbHYrRUd2VUZwcCsrUUFya2lVdWtQWEpVelk0KzFE?=
 =?utf-8?B?a21pZitMK2hmSXJ3Umc4LzJyb0x1S3FUbUZ4SURBK1Z5ZG5VQmRRZEhraDVR?=
 =?utf-8?B?VHdjZ3lENERQbmJ2NVE2a3pmTUY4cE5GWXhnTEM3d0xGdFN1NTZUU1Z3eVdE?=
 =?utf-8?B?aXYyYlV6Q0U1ZVZSbnJXVElmdWtFN3JJTDExNDUzZ2NMSDFIYnF5TkZaUisr?=
 =?utf-8?B?bnZkcnpHcEVLM0t0aXJIaFdxeGZlNG1udWc5UVpRZkVudFBUcW4vT09Ocndk?=
 =?utf-8?B?QTN6MUNqeGtVYkhuTStVbjh6alZUTnJLQTZNZmI4M24xTjBWSi83aldjc2NN?=
 =?utf-8?B?TG9hcjVIVldhdFNEak0zNTlQT1VZWFVDSG1MdUVPM0RKNERnM1pFZTNOWkxo?=
 =?utf-8?B?dlhXK0NCNWJ1VDVNWCtCM0VBNGJpMmVWMGo0SytzQkxqcXZFNnJBblRodm4v?=
 =?utf-8?B?SEdSVk5ZREkraDJsbjhIU3ZCS1lGazNrNUxNdEIrcHlab1hpYzF0aW9uU085?=
 =?utf-8?B?SEwrVkZqMUVVSmpjREo3aXlDRC9HdzJ1c1gxQ2FuWHRCdkVxYmQ5U0k1MVBX?=
 =?utf-8?B?TFRvRTBMQkQwZzNneWNZdWJEdkJKNnRkd1pDS2VOQndCazN3cVRZVkN4UmFi?=
 =?utf-8?B?Tm5HSXRKRXZxTU5PN3d6dElqMHE5Z0R1VHE1cUlkU1JXd3l5b2pxbzJ4UWcv?=
 =?utf-8?B?OWFWYTBSWVNNUWlvalNMLysvUVEvUVRldVgyNlFTSTU2ZXFXQ0lOVG40b2RJ?=
 =?utf-8?B?V0MzcCs2aFZMK2pOTXhXZys0WjJVam9PcmFxekhjcUNrRjEvSzk4Tk9Tb0pT?=
 =?utf-8?B?cUJDVWc4NFY2UEVlVE05U29kTGQzTEpFWmYrdlJMSTNpU3JyRGVPTnkwZHBY?=
 =?utf-8?B?ajAvcStkVDVOR2lpRkkya2pxY0RvMXVBV29tbFVQOG5VUzR3bjgwY1dJaUxP?=
 =?utf-8?B?ZmJWWjk5RkhPaEFJNVVXK0hJaXNnRnp3azl1VWQ1TXZkVmJrWDJPbXRvbldM?=
 =?utf-8?B?OWgxYklGNVk2WHdjT25ieEpYa1lCZ2NUNjdUenRrcHZBUk16UlBNTldLem03?=
 =?utf-8?B?d2NoYy9mblk5aCtCWDhKMEVxNjhXNk44dCtNenN1eFZVeFVxOUtUV1N2V0I0?=
 =?utf-8?B?bEpFb1Q2M0xZYjh4TUxBY3IzNWZtSVQwUC9INVdWcUdoMEtLMXMyZzg4bHJC?=
 =?utf-8?B?WC95OTJWMXd1dGJDTkZ4NVQvcDZTVnpnRk4wbUd3bHFwY3RJZzFCMnJxSmNR?=
 =?utf-8?B?aisva1VjYk1GaVNScFBTOFdGY0lldVZVZmNBVzN2TjMvajJWRXNBN0ZIZTBO?=
 =?utf-8?B?b3UybHpzRlpId3ZYSVBhOUpwSEJCcFVoR1FCZXVOalZySWx6VTRhREpxc3pI?=
 =?utf-8?B?aGtIZk05RnlLeG1LUjR5bzFrOEI0N1NqTENQVjYvNm1Dekl4VmVMVXhjZ1lE?=
 =?utf-8?B?a3JNZ2hmY2Vjb2FkZnYrdFZwUzlXa1RyNGxUcXI4QXYrSzFvelR3L2JlZjNB?=
 =?utf-8?B?eWR4bmNwZ1BOREVPcXpNNjVnbWtKV3JRMjhCVTNQdzBhNkVsRk5JamgvNFc5?=
 =?utf-8?B?Z0Q4TjdQR0xaV3lxN1Z6Mmp5QS9Rb3IzTWRHanJaR014SEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1FVUnlkTVd1UHF5RnZ4SEVmU3Y1UWRoZVpndERRTDIvTmRLTFZWdG5KWVdv?=
 =?utf-8?B?dkc3RG9sVlB3SnA2L3Z1NlZBZHJRSExVaUdNSWl1dmU4RkVZdGJRZzFzNkJl?=
 =?utf-8?B?R2tZZURBKzc0dHFrcm0xaHdJMU9qRWFsLzJ4YVpBT3Q5YW9kVXh0akJ3R3Bn?=
 =?utf-8?B?Q2hGcHdZekwwL2lZOEtQTktGb056NlQ2Q2hsV0U5VHJYZEw5UWJrZUtjSXZz?=
 =?utf-8?B?VjZhREJRRThNalBkakV1RjZCTGtPS0NJVWFiZFJWQmU4QTJVTElvOTE1eVgy?=
 =?utf-8?B?S2VYUWZNdHhMVk9ZR1hKbWdZU3J0b3hFVHlTSFlHTkZlTlZ5aklSVmdvTnBK?=
 =?utf-8?B?dmM2RjJyQjlSU3I2ZThEVDQ4UjM1OXIxeGxSMkdrMDFtQ3c0cWFTcGZKejJZ?=
 =?utf-8?B?UFdvZEZ6MkhPbTlmWmprQWdGSDlNY092R0NxZVpxWUlhOGVQL0x6SE5vQlM0?=
 =?utf-8?B?eHUzdjBHSFhob3F6ZDlqQkRpbWpOazVTbDlHMWRlQ1VzNEhvYlQvTkRyM0s2?=
 =?utf-8?B?cGdBclM2V3dsaUZCdldpMWVqMGhpbGFWTXg4V09tbWNDR2dTNUtaNjNjc3lq?=
 =?utf-8?B?VHJZZWo0UmdEZHNXR3NWMFlVMmV1WUQzZThhK3hzVUdiZmU4YldLZjVaZ0Fu?=
 =?utf-8?B?TVJwV2JDb1d3a0Y1M1FFYS9XU1p2T3NCbHE1UTdXY2Njbkx3cnBsd0JaK0Rq?=
 =?utf-8?B?Y2w5UmIwSWFsL3d2cytFc0tJUVZjMm1QK3lUY0kyUm9MZGhNcnYyeTZFNkk4?=
 =?utf-8?B?SkNYNThHT3oyTyt3Y0NHVEFqdXhXVjUrWWkza0R4SWhWdG85K1ZYeXd1cU9u?=
 =?utf-8?B?TkJaa1pRbEtKU0pzVUVzZlJPZ1ovampsNWxrVmFvUDloWXZuZHRnbTd4ZDFI?=
 =?utf-8?B?UmF3MXl3bEZYc0J2cjA4NHN0S2JjR0pqeUp6cXRXR0tiWUNZczZZWnZrV09B?=
 =?utf-8?B?M290YzRSZzVtdXZPYUdtRE0vdnZLNGVjQnFrM3NxS1I5STBjYnlxQUJWSXdN?=
 =?utf-8?B?NENyRS9nNzRTUExvRWNEcEorbllqY09BQUhFSkE2M1ZVcytFRG9JUWlkOC9L?=
 =?utf-8?B?ZjZQS1VNNXJsZnhHYmZYdXdKNUtIb0xvVHpaSnQzd3hydGl3VzdvakVqMUtF?=
 =?utf-8?B?QUxNZGxwWTNRdTdjMDZpTmExSzdtOEZHc0NqYm1iVUlVa0hWNGV2emZta2tN?=
 =?utf-8?B?Uzc4bzhMNjFya2ZuNmdtaHZoMkhoa21ycVdXWXJZYnFoMVVCOUVDd3BBNncv?=
 =?utf-8?B?dHRscThYYjFaUWpDMDdBckFJUnBTSkU5RVU0L1g4Y04rR214TkM5SDdKZFVo?=
 =?utf-8?B?Y0xuZUlCNGRaaWsyNGhNczd4Ni91Mi90aGhqT1diYmc2NDlDUlBrN0k5Rll4?=
 =?utf-8?B?NW5DSDYxbFJNdWlEa2s1cjZnMC9Lc1BjQ0lPdWhxNXFzRkZxNm5UcUtXM2NM?=
 =?utf-8?B?aEVUQ241Y0ZqWVJQUGN1TG41TkxWNHNYTHpRaWxxcVNpblVtQTNlMlA4THVY?=
 =?utf-8?B?VWdyempKWkZsTEtPMHFST1lmL0xKNjI5Ty9XemhWYk5DRVVaSVhTSVJMZ21t?=
 =?utf-8?B?NDhIRUJRbWgzWHhEUFIvTWVnS1UvMHozTXQ2S0J3aEtOKy9qSUxwMngvRTEw?=
 =?utf-8?B?K0dMVUhKZTBoV0FOaXVLY1ZTamZOMGNxcGQ5VktwNFJDQjBiN05SSTBYdnRP?=
 =?utf-8?B?VDZNOW5IVmtIeFFkQi9pbDZkKzdlbkJtb0htWGU5ZjBRR2UxUUlsOExEUUs0?=
 =?utf-8?B?REtpWHNvWU1EVmZhN29DdjJQTm1hUXVMZmdhRDZ3TktuUW9uT1R1d2k0a0JV?=
 =?utf-8?B?aWtnY25rRXdiRytMelNKZE5pODVjc1NNeGVLaGtocE1PV0FYZE5JdkljUzNU?=
 =?utf-8?B?bjJaV00yWmdQN0w2QzB1M1ZWN0tRenNaSEF1M3hrUm9QTTA5NllxQWlER0VV?=
 =?utf-8?B?VElucWhGQXF2NEtnSDY5TENjbWNRc0Vtc3VZMDljNjloTG44SXZMNWhKeTgr?=
 =?utf-8?B?ZSsxVXVLV0RDb25Xb1B2UkRzckVja2RoYWdQODBwS3hoY1lwMHNFRWJtRk14?=
 =?utf-8?B?Mmo1OFRHTUlmYjV4ZEp0a1Fxa1A3RjUrWmdSdnFhU1EySG1ickFPU2xlRXRu?=
 =?utf-8?B?Q0czMTY1TFZuZlBMSGVBcnNRUnpGNG1DdFd2YmRBTkdEZ2poU2NJS0FoNzVP?=
 =?utf-8?B?VldBdFh1ZEYyclJqNStDQTdueWpEN3BRZU1vck93Um04UHZsejR3YWRsRngr?=
 =?utf-8?B?Q2hwaXgyVUNhSWhDNWswdmU2TmxBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7106a08a-59bc-48df-f51e-08de202f1ff6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 07:59:50.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZXMqRjall9FDsZJ2+Oukk7uXLZDd3dadGI3SbwKhtxiDuq2eB3bz7U3QD3yOSanvgRLAgZoqetsUK0HWbcFUIm0CZmcti3wiN+KGdwohTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8400
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

On 11/7/25 16:35, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>
>> ---
>>
>> In the current implementation the control registers for channel 1,
>> control all channels. So only one led subnode with led-sources is
>> supported right now. If at some point the driver functionality is
>> expanded the bindings can be easily extended with it.
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>>   MAINTAINERS                                        |   5 +
>>   2 files changed, 112 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 000000000000..e83723224b07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,107 @@
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
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
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
>> +      Value of the ISET field in the ISET register. This controls the current
>> +      scale of the outputs, a higher number means more current.
>> +
>> +  led@0:
>> +    type: object
>> +    description: Properties for a string of connected LEDs.
>> +    $ref: common.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        const: 0
> 
> If reg is const 0, why need use led@0?
> 

I made it this way so that at a later point the driver can be expanded 
with 4 led subnodes when that functionality gets supported. If I were to 
lock it to just led: right now I feel that may cause incompatibility 
later on.

If there is a better way to do this, I'm open to suggestions.

Kind regards,
Maud

> 
>> +
>> +      led-sources:
>> +        allOf:
>> +          - minItems: 1
>> +            maxItems: 4
>> +            items:
>> +              minimum: 0
>> +              maximum: 3
>> +            default: [0, 1, 2, 3]
>> +
>> +      default-brightness:
>> +        minimum: 0
>> +        maximum: 100
>> +        default: 50
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        backlight@6f {
>> +            compatible = "maxim,max25014";
>> +            reg = <0x6f>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
>> +            interrupt-parent = <&gpio1>;
>> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>> +            power-supply = <&reg_backlight>;
>> +            pwms = <&pwm1>;
>> +            maxim,iset = <7>;
>> +
>> +            led@0 {
>> +                reg = <0>;
>> +                led-sources = <0 1 2 3>;
>> +                default-brightness = <50>;
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 58c7e3f678d8..606ce086f758 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>>   F:	drivers/media/i2c/max2175*
>>   F:	include/uapi/linux/max2175.h
>>
>> +MAX25014 BACKLIGHT DRIVER
>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> +
>>   MAX31335 RTC DRIVER
>>   M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>>   L:	linux-rtc@vger.kernel.org
>>
>> --
>> 2.51.2
>>
>>

