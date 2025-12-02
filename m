Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB933C9A89A
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714F510E5B8;
	Tue,  2 Dec 2025 07:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="bTf/YBoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021119.outbound.protection.outlook.com
 [52.101.65.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DCA10E5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 07:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhZRiiYb3bRQxVmPZaMZHW+5az0/s2cC8keHyNbFM+h5jIwjiA3yNKcyCVVXQoUm755IsBAFoftruUH2CqskitQHBCuyxFESIn2YOGePQ8ppNl+q4nTvmIJH8dpUunx+PeJyDexVaMb3ZTm5kP1MBbC6FMx1JTsAm82zBNjZjxRA7M8QAz3YLlv+crR4CA5YJVzWukyDyf2Achg26u/fGv0J7xnmAIJoBBj/o8YLhJW5byAmE7AD4P0aCMqfHcSq3OtsyW8GV/hRiNpqSBOvO12Ih6NxyN6565qaeXPwNHSDIAn0a66ImsGELyXhi6ujB3ONjsKzGZLSktR5KI+EgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjJshxMX8QnC0rwwYNRo6DOOgmUXFmw5qQ2P/RFn5cI=;
 b=JWuh3a+9CsDfcB10y2Lgkjgp5HcPw15yThHrpHQkKJdCx2DhuydcPNaxSL/fcdV57depi3DrX4JwOu+Oih6NsX9OznIHCX3WsWGTJxv4JNFYAGOQCRqhaOfHdJLdaIIqRCz7WeAnCMlvnQmozifWPYxDr9SQ3gKru8MnDkwOmr9PDSb5s4R8vxDtv3i6G/E2l1GDRjIIOnuXinpdik7vEhZWDcglAqE/Q20H3nijP7nZ1qUOhWVQJFi/SJ/N53GxsnTZfnsnuCULF8d3xyMLsUY2YiccZ9vXHfJiHPxF6w1e827RNEvvVLH6D0khVmlCWzJX63sm7lkhiqvazffQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjJshxMX8QnC0rwwYNRo6DOOgmUXFmw5qQ2P/RFn5cI=;
 b=bTf/YBoEuBhcYu/6Rc1KwYpz0WmKmSFYcnj+intXIyhivI+Z+gyMmGjXIBVTs4aD3ZCy9gQyYbyf5eReSrhwVOA1H+B773k2viZ6hgmFPNNT+SwJCcBIzBsuCb75iFIoJS3oZwDHFLuB3/FJx9QOU7vGglZb5yZdnaEgGbAgXuSj3ncod2/sgjIDcYBCWNzTooGjtP3nyFfL99YUS1TkljpSZxi84hKDgkzK5XDzyUHeohwyNMgOuh74W94t0voa6ktMjwdgvwx4xXAtLHiK3WeRcEH0gZxw1AQRBX59jBRzuR9Y7hIwfSU5bVSaSL7qGgawvYs0ff0l460a/xDcRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:46:26 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 07:46:25 +0000
Message-ID: <b9fe6df7-fdc6-4a32-919b-8f3b44eace7d@gocontroll.com>
Date: Tue, 2 Dec 2025 08:46:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
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
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
 <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aS3H1qzSMKHamqpP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::18) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 7293b1e9-6ee0-4ce9-f34d-08de3176e551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mzg0Yi9ZNWhCTnYxWDBQQXg1cnVUcWgvNE1qck5oMjExVE9OU3hGalZ3aits?=
 =?utf-8?B?MmhYbGtuM0huZldIRDZRNHpqZUJuMDRXcHZ6dFJ1bnd5SGh5K21kaWpxSVh1?=
 =?utf-8?B?azBzbmdndDlXZWU2TzRPY1hLNkRCeEt4ZkxaV0RNSmRYQkE5RGEyOVdGR1lq?=
 =?utf-8?B?aXp3Y00rUUlCakR3WU0vQTFzM1pxZTMyOUQ5c0FlZW1hSlp5Qjk3aHdiMzRj?=
 =?utf-8?B?cmQ0UVQyTEJGMFB5VDlGSkFVZnJMTGxrUWpZdzk0NisxcWlwcllYNzJqK3Fk?=
 =?utf-8?B?aFVIWFl2emgycWlHQnlQVTZnUGhpMDc1Tk9wbE12ajRKUVZVSk8wZUNBNk0y?=
 =?utf-8?B?UktKNk9ZQVd3QjBNNnFBUjRkY2R3SjNodDhFdGxoRFIzc3VoK2dNdldtSU1T?=
 =?utf-8?B?elFwUmlQdkVFTWo5TlRmbmcyeGlLWjVmNFZ3U016R1VyQ3ZSQ2lRaTNwU0xZ?=
 =?utf-8?B?d1ByUHhISEV6clFQL3Y1bnNxbTY5cCtXUmZGWkt2SkV4cll2a0dRV2pweDVI?=
 =?utf-8?B?TzdoMDJVa3pQNDdpTi9Sb25NakpBcUk0L0xYb3pxR0lWWjRqNEZRWmJ1cldr?=
 =?utf-8?B?K1d6MnVUdHFvVzJvTnlyeXM2ZitTSFFmdGdyZEZYSWRKN2hKS0xaUUJmbHpI?=
 =?utf-8?B?clRKMmNZc3RBWlVTenE3KytkMUNsWjRTRzhuTlZxbk5RY1JOcEQvUjVvbmQ2?=
 =?utf-8?B?RXZML3dzeWJMZHNWSU5yckRxb3NtNk5vcFRvaVNTZUIxZUoyWXJEcDdLZHZq?=
 =?utf-8?B?NlZFNnd2SkVxSlAwOFVJSWlpUHUzbGpiL3kySWhCdFdZZWlHZFFwY1A4SkZn?=
 =?utf-8?B?em1SN0ZNUW9DY3d0MG5CZkNaV3UvZ2syV3RWQ2I5LzB5WWI4NG1JenhCUW91?=
 =?utf-8?B?bnVKdERIYURzM29mTDdBZ2lYNHRUTHVhUGFUNFBnZmJ0ajdNeTNIaHdXc2dZ?=
 =?utf-8?B?UjMydFlucmVwN1FDM0hGZXB1NHdnb2dlYU03aVNSa0UrVjlDYjdoWkRMU2Y1?=
 =?utf-8?B?MW0zSUhudnB5bTFaa1hMS0gxbmFEMnZEV3U1STZYNU50a0crSG93aHgyeUo3?=
 =?utf-8?B?Vi9FbzBsM3J3QnpZaW1GZTc3QXRuemRZb2o0dWdkM0s0azJFVDdTUHhkUXMv?=
 =?utf-8?B?dWJlcUNPVlFLK2hhQTUwdmRlSDJDN0x2eVpBcFBOZkcwakR0QzRwMXJOZE1N?=
 =?utf-8?B?TXptZGQ0RFFxMmhHRm1VU1c5RzZuTzQvL3FlLzBWd0V3MURWQWIvUDFaNTMx?=
 =?utf-8?B?TjcrODdlY0JLV2VsVnkrRGdHRWdOS3ZJQ1Q1RUhwK0gzOEMzNHBzd0tPL3FR?=
 =?utf-8?B?TFhaT2FaV25LeTFzak1SMmpDbW5PTUhobCt3TmJYcVN1citLYzU1cXpDU2hz?=
 =?utf-8?B?ZGxiOU85V2VuTUZsb2hLa0lhK0ZJYzI1OVVTYUxGMFp2SXBEZW9ISnB6aGxN?=
 =?utf-8?B?SmVRRXpPQi9aZk9tOVYvR0JJendoRXQ5SUh0bkpsT0hIby9SY0l5V0FHb1JW?=
 =?utf-8?B?MVN6ODZET1daVVJMMjBEdWhWdW5SbGgvR3BqdE1SeUtWZWF3S2lYamZkY2xl?=
 =?utf-8?B?STlYcGFyT29FYytmeFVRQnRSelJVNFVVN0FSeElTVmh0YmpDS3RheXZUcXUz?=
 =?utf-8?B?ZDcvS2JNQTN0MzNzNVNoM0NSYmJ3T2dPaEYxc1V3RUtYMUVVVnQzeXp2emdn?=
 =?utf-8?B?V2FxcXAwSi9BbllFMHMxaE5TZzdYZk9UcElLNzMvaWZKRTJQVnhBcWJFRjVu?=
 =?utf-8?B?WDhIY0ZWRS9NOTdPb21acmFYSHBpaURWZFJ4ZlZQK2YzUi9lRldwQXJXN2xT?=
 =?utf-8?B?YWtlZHhlN3VCMU4vcU9aV0xOVE5WcStKaXBneHYrR0toZ1dxWUQ2QmhRK2kx?=
 =?utf-8?B?WXJYWTBqNmM1UVFtZUthbEhyRGR6eXk1cTYyeXo1RyszU3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGo1VUwxMFJtVWluYlpFTUpMNHZ0SGgyOHV1SmQ2cUx5eG9XR0YzcHUrVURV?=
 =?utf-8?B?SFVDaEFRdkpMT2xjZHZ3L09YWUdKbktYNWxWMm10VVptMy9zQURuRll5T0Ju?=
 =?utf-8?B?bjdrWkFreVAzWUQvdjJDeS82TVZ3UzNWeCsrdmlGVGFOazdpNjNlc05wc3hn?=
 =?utf-8?B?SWNKeXgzaCsvQkhBWFpNcVhIUEx1Y3JjbUVOeDRDWG9hYmxvN3FScjI5Y29t?=
 =?utf-8?B?NFR6RUtXTzFwclFaN1hWMFZQczMrVUh6MFlSUFVNRE9INi8vRmo5MDN3cTRD?=
 =?utf-8?B?bnF5aGltSTBuVTd3ZzZhS0k2enl2cVp4V1ZoaldYMitxSTQrUHZKY3RRaUZ3?=
 =?utf-8?B?bENScUdQdElwRHFSZURGK2Zyb1hKRXpOWllYWFJWQkNJWmU4OUpmcWJBK1U4?=
 =?utf-8?B?aDVPYmJPaUNTbnQreENxejNDVmdFWGxhVUtJRDBlMlBESitYbGVtdlZXaDdu?=
 =?utf-8?B?R1ZySXFkVlcrOURNMXY5TE5KdG52YWxwSlFCZHJram9mdFY1T1Q0Nm1GYXo1?=
 =?utf-8?B?SmpNSDNRQytrRWVvV0VuM0V4WXVMK3B1TmFCemh1cStZTjl2QU1Ya0F6WVRP?=
 =?utf-8?B?K1Z5ZG50VUtWYjVCMTlxUEZpK2hlWmlSa2ZESE9SY2lHclBTZlV1STJ3aEhh?=
 =?utf-8?B?aU9nam02UXJQNDRKQ09HOHBSVDJIWVg3ZG82eE1YRHp4WjVUb0ZLcHI5MHk1?=
 =?utf-8?B?ZCt5OFA1U0xYbjJBS2hLQTB1TTk5ZXVsaG44cCs4bEwvQUxZRGphNzVpd1JE?=
 =?utf-8?B?WjR5M0tRcXdRbHU3cjhockFxMk5odjlzWUxmUE5wa3p3RktDRS8vM0w4THRs?=
 =?utf-8?B?ZTk3ajl6dW9zNmVzRkMwQnBLa2ZUQ05weCtQVG54VUpIa0dvMWxKdFVsYjlw?=
 =?utf-8?B?NnllUHErWlJqMmp3OHdnekpCQlltdXI2akV4VWszM1BzWiswL2xZR2pIRlZY?=
 =?utf-8?B?Zk5XdWkyTWZId2RwUUp5Q0xkMForaXU3b3FpVXN0ekQ0cHc4UU93QU1VSkJ3?=
 =?utf-8?B?b0lkUE9KUTJzNUdXdmFBRi9oZmhscWdBTTBZUVoyWGJoTVhnU3p2UnQ0UGxC?=
 =?utf-8?B?eDNmNDc1U3ZMZ0hzcGJvaVI5ZFREYnI5QW1BNEhVcHFWeTVOL0VWL001cWto?=
 =?utf-8?B?dVg0RFhFRDIxQ1hlOW44bHoxTVRyY0luZWRtRWcrMnFuSFJiRlU3dVVHK1ha?=
 =?utf-8?B?Z25pSXROYi9hNlZ2NHluaE1DUFo5TFBKQ1RTbDJZTnp1QUtoRE85UUZrdlFL?=
 =?utf-8?B?Tm9YQzRtZWlmK1FNaVF5Sks5V2FiSXdIQkJsWk5CWHpwMmxnbGVwZXdlOHBy?=
 =?utf-8?B?Y2pFUHB6aWJuNWZEMGdPVUY5ajlQZ0doMXQ0Q0RMTkYvdm1jQ1cyMlBkOW9X?=
 =?utf-8?B?RVRocUZJaEJQN3JMRDV1dkJQdmo2T0J3Tys2ODNHeVdTQjUxM2lIZGRiSmMv?=
 =?utf-8?B?WDJxb1VSQ3VqWUxwMFJoNFBZTXMvOUhyYjhHS1RQOXJ5QTM0dWFuKzFQZ2Yv?=
 =?utf-8?B?WW1vYmw2YTA1N3lpdC9idWl4MnRQZUwwQjgwYjNiMjBzR0dhVzc0TFJGMG9k?=
 =?utf-8?B?UVdBaXRRcHFyTExLYlhGZnVqQmdlaUhwVERCTDFLNktLN1dUYkZzdmZUSEdZ?=
 =?utf-8?B?S29INzB4RHZLcXVvTTFydzhVZHNHdEcyR1k4UHQ5cnBZUWtLNzl6Z25RRmhC?=
 =?utf-8?B?ZXRCVU8rV21Db0l4ZGx3SnlDU3VoTll6QTRsTXZaamF6ckdHTklaMGZxUi90?=
 =?utf-8?B?Nnh6MlZTMWFqeWlMU1FxOGFqL0ZyTlR5MTlIb2ZaL2xzcTJraGdsR0Q1a1pP?=
 =?utf-8?B?c291OUw3bFA1Z0dxc2pTMzJQL2NWWDIxN0dsQm9MU0NrRHozR3NjZkw3YmlP?=
 =?utf-8?B?STNRSnl6aElDaXNEOTRqcVRXTHpFV05xN2xCL21UMTBpcGM1eFZ5VzNRLzRY?=
 =?utf-8?B?K0Q2MUVUMEJXRnVCNHFsYk5SN0tsTVc4TXZYcEhVZ09GWHVsaVJxM01jcFBL?=
 =?utf-8?B?WHVQUHdITXJYVjZQblMydnNsMHhGVGxpcmg0WXJLcXhnbHRodnE3WWRwTjd6?=
 =?utf-8?B?a2QzSnNJU3AxTnlsNTdmYzgwRFFVMmhjVVlMVXpYRnpOZWJFTmJuQ1JUT3ZX?=
 =?utf-8?B?SENxcjZNd0p0aExDclNmYmRLZW5TL0phV2xPRkFkRmhKRzMzVDd2K25qOFVy?=
 =?utf-8?B?VllzdDlCZkhNMUFrUkdNZnh4aGRMYThHWGg4UEttTWhjSEhSNjkzT1hoRGNm?=
 =?utf-8?B?MUp1NEhiMko5dmtjYVZPclR5ckJRPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7293b1e9-6ee0-4ce9-f34d-08de3176e551
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:46:25.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFdcyCbqiap6pLnu9/Wric8elDm6tW5prscOdLfWfvNLW9Kx6tvU1lBZS3HHHwVyNlSlVpcuHQjbyZhblV0k/K5PcLyfFdx0m8h4K1F4Bl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343
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

On 12/1/25 17:52, Frank Li wrote:
> On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
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
> 
> define whole binding, allow 0-3. binding is not related with driver's
> implement.
> 
> it'd better put unders leds.
>

so like:

backlight: backlight@6f {
	compatible = "maxim,max25014";
	reg = <0x6f>;
	enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_backlight>;
	maxim,iset = <7>;

	leds {
		#address-cells = <1>;
		#size-cells = <0>;

		led@0 {
			reg = <0>;
			led-sources = <0 1 2>;
			default-brightness = <50>;
		};

		optional led@#....
	};
};

right?

Kind regards,
Maud

> 
>> +    type: object
>> +    description: Properties for a string of connected LEDs.
>> +    $ref: common.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        const: 0
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
> 
> unevaluatedProperties: false because ref to common.yaml
> 
> Frank
> 


