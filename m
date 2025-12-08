Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0724CAD5A1
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403D110E3B1;
	Mon,  8 Dec 2025 13:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="QAu+OhQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021110.outbound.protection.outlook.com
 [40.107.130.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D0A10E3B1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc9zhAy+Ew+snWd5EjDcC6DkOt9HCM9VcCQ8TvyRrr/YCGKTHbCHvK4n487IiowuJH91qA1qo4eOBJCO1uoxPSqJgVPZHoj+G7vf4YdjR1CykPwndtmvCTuhBygepZyBmhZ8O8uhJf+Hzp5xDAtOkOTntETZu9DXAjM4DAz8isvnpsX//LZIO+UgDj/oFviYTtRIMO1HoDEmYNU5/EQwJW4Ze19eMvOMbB6iqR04VQpXGNzCgKwzutW54giYbZ+Ty28hjrZ5/48rvw9hQt9mEpLWV63moZ5eWqoZbFHIRjUYXqsg2wSgWkqbT6YgPsbaMM2eN8VecoLniv7yimugMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8+0Tt1xpBaXsaXWTLjzjH46WdB0LaOcG3Z7kU3KARw=;
 b=HtA9lyzGJBJeT1/FZ+R2OzjfNuEPVsONVeMzXgiVC6DtAsSgX+URk+zaeni2KQWVpUTDdADqZz5IpxbTnJChqp33Vq+j1ztdCKJVI6wBG8hAxDxr+e7a2JhB/+Ky5awY1UEYOdZHvFTVjghbJbP7t9sK3gQZIqIydmVmd5tGHh7ll5Ih1B9hgrd6migD3Ag8eKiSYDX0IA7djC2v6mv2cCqdg9MH6bSNu1dCWk1QFYn36L/qWaM/vr1TUg8MzbFj/K8Rr0egxQ3k0250KODebny7Punsp1KR3YOUprC2GcjekW1/+wQ45EYP5Cyns8NB79GMxkxiy8Ksppi9fbWL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8+0Tt1xpBaXsaXWTLjzjH46WdB0LaOcG3Z7kU3KARw=;
 b=QAu+OhQ15/G6or1NHrlXd6/YNArS4fCbd7iYdFzldx6nAPEif2tBNiBTDkFKstuDAoWL0WHEq+BpIvAhZrPsqiFttG1Vux2pfy9FACOC45f7YRruxBTj9R6u5E4sJp4+agszdDy9fqrMFyOCeO2VYn5IeH/h8g8/qDNx6Dn5g+XioQAcoZkBF8f5vvBEQkN1wA9Wnszsoz6llIahQ/iY3Ky55XJpzLS4tPxq9hc/11MmOyqtOiuhequBmfJO+YPDE/xYdsZ/4QGicWqNq6ZuyPf2+jpLkP2RPLgOf69Qm19NUa1HWjyo3xVg3qDHBEK0uX0CHgNy1ekzkVbhfp7MLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:56:57 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:56:56 +0000
Message-ID: <e428c3a9-49e2-4af5-b597-2cdfef7028f5@gocontroll.com>
Date: Mon, 8 Dec 2025 14:56:50 +0100
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
 <b9fe6df7-fdc6-4a32-919b-8f3b44eace7d@gocontroll.com>
 <aS79eKc9Ac4np6Nf@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aS79eKc9Ac4np6Nf@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::10) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: 27678b8e-9ffe-485e-54dd-08de3661a64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|366016|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUswQU05ajlONW5pY3VGUzh6Um5kZC9jc0VJRFJZKzlMMGp0SVUvNEdDRDNT?=
 =?utf-8?B?VEUwT2Mzc2xCUnBOOSswWWtEZjdlUmVmVkF0NERXZFZJNno4VzZ4Q1hNazZC?=
 =?utf-8?B?RjdYU0lKb1lYbTh5bEVXN1kzRVQ5SGhKWUU4dXc0K2h6SFA1M1ZRL3pKK1Js?=
 =?utf-8?B?SmdjMzJXQlVzanNzRTF3ek9lNlY2NnB0WUU5aXZKTEhsbTYzYUlIQ1lzenpE?=
 =?utf-8?B?a1VML0hyM0NqUHh0SG9pazMzOHFPWWdUMWN0My9OaytpQ1pvSjgyL0hmS3F6?=
 =?utf-8?B?M3BMdUpFUUVEZzZQWXgzUkFLMmZoOUhNRXZZaUFGL1VlWmJFNVlhdlVocUt6?=
 =?utf-8?B?Y0c1RUlPcGlCOTQ1ejNxMkVLTWFYRDZqQkl5NHk0MFFjOHBWR1JPQndrYWtL?=
 =?utf-8?B?MTZnTm1VVWJNbnRaVFpkRkZhVDVSYjhuc0xiV1pieTVCb1VhNzY0S0FXcnZZ?=
 =?utf-8?B?Y0Q1VWhhV2RPTkNXVXBXYVRoREpnYTlIcFliN2l6amRkcTh2aW5sY09Yc1hP?=
 =?utf-8?B?clY3ZEdpTmhVdkcwWE5HYWJYUkpNLzdWU3hZS01WRjFjK3V5Qy9ZRUN6SFht?=
 =?utf-8?B?bllqT3NkRmx2Vkh0TVkrdllsUGovNEppNUIveVBnd0tNWFNJZEVZODNvU25R?=
 =?utf-8?B?M1B2bnV5cEV2d1N0NTBvcVoxQnNKWGlnMjc4dWgvSjV1OC9PcWZsNGYwRzFK?=
 =?utf-8?B?WVhTQzJPS2E0ekVtWHpMWXEyL1FidE9iREVYSWVZVDI0S09sWWxhSi9FdW9n?=
 =?utf-8?B?eHVoWFplWWhaWHpvT1I5b241ZThra0dKT3E5L3dJK1FCdzM3cXBsTkx3c1pa?=
 =?utf-8?B?cHdtWU9rLzBHeGtiN3VGYmp2TEhoZzJDS09YamJGZkpmYUtOUE8zOEMzekhV?=
 =?utf-8?B?S3UwUGRza3RjWWhWMHBROThnb0lCYnlSYWlXdzNlRVFlUFl5R29BVGtzaExD?=
 =?utf-8?B?MkplT3FUWUVQbnZUUXdnWHJ3YnpqRXFmSFVIYzRhMm1lajlST3RBVjhzdU13?=
 =?utf-8?B?Qkk3bkIzR1pBNGZlSENYOENETmljY20vZXBUNzcyZFUxeE9FMnJuaUZZbUVS?=
 =?utf-8?B?Tm4xREFhOFpNYzVSNHdIMXZmQ0swTzRjRVEzM2w3UHdLVEVOdmZhM3pLbk5R?=
 =?utf-8?B?Y016c2ZXWmpGenM1ZmV2Y3lreFA2emhWUEdGOThKZzRnR2RQWlJkaUE5cXhK?=
 =?utf-8?B?ald0TU9WLyttVFVjYXBHUCtVYjRhdkhJMW1WUWVrOGJTL0tjb3Z1SWhidkJl?=
 =?utf-8?B?Ky9jemxMUTZNK1QrejhaSlFWOVBBZ1hWV3FhS2Z0UDU0c28wamd2ZnhiWnRw?=
 =?utf-8?B?bFBNVDVJamdNZ1YwQVY3dUpaaTI2aW5UUXJ1cUZrU2VaNnNncDRWQkNQbGdP?=
 =?utf-8?B?ZHN6WHE1MHZPZnQ2M2NEVit0YXNrMWtXbldiVUZTeGdrOEk5T2JEVWM3WlR4?=
 =?utf-8?B?Q21nQ0xuc0d3YkROaUF5cGJiM1lhaGpWQVY3Wk9vVkh4NDJEdlhMWGZDTXdW?=
 =?utf-8?B?RjZpZm9xamptSnFpcnhxd1Q2REl0Z3djY2k0Mk40NlpYaVZKU0NjNTlNeDBZ?=
 =?utf-8?B?UG5XUUhwKzcvbTNoMDNhekxlRU1MbFVKTFFVUlp4Yk9mT3BrMEJ5QzVQN3ZH?=
 =?utf-8?B?aU1LQXBCL203ODRLdWd0L3ZwOFZPRXA3d05pbkZIYVRiZ3JHdUlOajUrY2l3?=
 =?utf-8?B?eGJvR3BPSHVZSFAvRkYvWGxQS3ZTWDRmaHVyWmkyNjRkUUx6elJRMHFlYU1i?=
 =?utf-8?B?NExzYWx6cmUwbm5GZ3dBV3pqZEsyanVRNzZuS1pMOGV2enBWUFN3QXpYc2tm?=
 =?utf-8?B?TU90QStZQ0ZzVTY1RGJ3WFh1aVZRRGtrSWZqK3JQcEtSNzN0akF0OU8rN081?=
 =?utf-8?B?OUZSOVBPRU0zTUgyS0lPYjJBQTFaVENraHRjeHRIMVlCL3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(366016)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUZ3YTlXd2ZNb0RaQ0l2T3c4Nnp5eXBZKzM5ckFXY09XZUlPZDF0bjNmeFN1?=
 =?utf-8?B?dVREZVNkdEhTQUt2cTdwRHVQZ3dyK0NhYmhmRWNwMTlrNi96aDFCTi9HVDhu?=
 =?utf-8?B?ZzJ0M3AvL3N0ZXNsSWMwenY1OFF3U0FHYjk3RmNQOUVxTGwvNUxqRmxqSGtU?=
 =?utf-8?B?Vi81aGJwZDNMM3lNZjN5Q2k0MmN4NUhheUVycE5LWDNwUnl3aFJJcTRiZjR1?=
 =?utf-8?B?U2RXSEE4YUNmMTFacmdzUmRaWWhCQUxKcXBuMzQrVWdsMENNN0dQN0NSMklF?=
 =?utf-8?B?eHBWTnhFekw0NUVvbFZvRGt1TjduU2NYbWdFTzdmMHZjTitVTkUvK1FYd3gv?=
 =?utf-8?B?MnF5MVJ4bmNwTUExd2RycTErbGFTekRGVUNEM3krY090RlpVZGhuWlJ6R2RB?=
 =?utf-8?B?RzlJb2xFMGdEVDhnRTdaRkdweUZ6aU8xZ3FnTlNwMjUzcElUeDdOaUk4dGh3?=
 =?utf-8?B?SXN3M25Rc0xPNVNFZUhQMklhOVdxakFZVDgycVdGd2s4V25EMytvSGliSWNt?=
 =?utf-8?B?YXNOOExqa3JVZGdXdVBMTnVORytFcDQ4WjZwRDBnbjRqaVVteHhVY0xOVjYv?=
 =?utf-8?B?WW5nZnUrV1JyNVVjU2F0RG05QjZqS1pGQzZuVE9lbHNUTUNlT2JaUE9ia2Jk?=
 =?utf-8?B?SmpCaDdHcjFXUk5YNFBhR2RHR2R0RXRyYW1hb1VSY04rTW04aEQ2YU1DVnpT?=
 =?utf-8?B?dzE3L3B4ZnR5RkJNejhZTzNoT1g1Si95RFdzL2szUktWUHpXUVJvSlVjdEpz?=
 =?utf-8?B?TVdBK0dwRlpxcHpvYW16QkhBbXFIU0VvYXJjY0FWc2Q3aTlLUnAwNVdUMWd1?=
 =?utf-8?B?V3pZTEFIaGJQZ2drTUtWWUQ4bFZDRm1VSzhZMWtsU1cySzNTd3pXekRvSTd0?=
 =?utf-8?B?b0tvTmYzQlQwWHNRR09yeUVCZ3RYNmNUMzdNSk1KVnR3eDJJMWo0RHl3bHh0?=
 =?utf-8?B?U0hoYW85ZzRweU80N2dpTjU2dHZ6dGc1Q25lbWt4Q1JXRGxybXB2enJKMVVz?=
 =?utf-8?B?aTdaUmFGR0JkRGdicmloQmFTNlk5c0NwS1J2ZDF5a0ExT3E4ekFGd1BnVXp4?=
 =?utf-8?B?YUo2VXdndHBlYUZtYncvdjdYTUY1TnpuNmMzWjRVcVJCZlgxT2g2Ny9JaEZU?=
 =?utf-8?B?dWF4elRRRUg5QWRWNnBTb2JsZWkxa2xOOHg5dmZxTEJRbVlid2x6OVR3UzlT?=
 =?utf-8?B?TjcwVzdsc1IxZzI3am03cmY3K0hZWFE2SlRhUElNVC94L0NIQzRBSWtVS2w0?=
 =?utf-8?B?S21XaDljQ3JhWmFjQkJzaGU4Z042Y3pjdDJ3dUc2SlJvOWFkbkR0Si9rSGY4?=
 =?utf-8?B?K2pyUHo0UGFXNmJEczUzc3RSS3I1UWptSngzN0Y3T215czJZNXEyekQrdk5G?=
 =?utf-8?B?V1dXZmNtdGxDaGdyMWg1YkxHZzUrY3NkVXFLa1B1dWZwN2VNMCtGSTUwZlFk?=
 =?utf-8?B?M1ZualovSVBFc2ZYVHc0N0xsRXk0QzE0b2tWVlBoTmNKMGxQYWNNdWdyZHFq?=
 =?utf-8?B?TXVVbHJDVjE2MmpmajdZZzJiQldvZVBLSG5EbXQrSzhGU2E4bTZFdmcvZEpp?=
 =?utf-8?B?Ti8xVklNVXdKSmhtTW9ON3ZmVUxVcitKNURJV05sYldKTkZwcjg1czNvckhS?=
 =?utf-8?B?ZFBkOE8vbmNXejdDMCtkQ3J1UmNzaDNtVDVNUHo5T25UZEpiMUVrbHdMbDZG?=
 =?utf-8?B?VjdrTGNxaGdKaE4xMXZFb2lnMStGK1lUc2FVSjUxTEhLQkRWaGVuY3FXTVR2?=
 =?utf-8?B?eHRjVW1zQXBaakxmNmducVFua1I2YUkyWk8wOW44WjVjckFySDJrL2E2NzVG?=
 =?utf-8?B?clozZkhrVlo5SjdaVkhnOHhqVldwTTZDd01ab0lQcDVKQnREeFh4ZEhqanVN?=
 =?utf-8?B?Tnh2bk5pNWJLY0oybmk2ejZRUWswRUljU2NqSnRvR2VVM3BYdTFsQndjQjNE?=
 =?utf-8?B?L2ZKS1lPV1NZNUhIMHlaZmF4YnlpTS9QUTVRNnlNaHp5dlJvVzE3dkNwQzBi?=
 =?utf-8?B?TnZSWm9Vem41UFNsM282V0d3N2diY0xscWRMSVlvSmJyMnlKcU1LSjExQzVH?=
 =?utf-8?B?blZ1aWgxRStwa2toVGYyUDZsNktmc0NZWUw5YS8vM2RicVdrb0pxS001VDZL?=
 =?utf-8?B?eEptRE1KNGEwRnJ5b1Y5L1ZFTjIvU1dReThvdXVIblFEU2dGU3o4cXFQVm9K?=
 =?utf-8?B?UWFMOHRHODVNZTl2VmZSd2UvV2swKzBBMC9tMUJXK2xUSk8vd2hmQjRkY0lO?=
 =?utf-8?B?UTFqZkRhaG9jWGZ1eE94RnV1d3pnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27678b8e-9ffe-485e-54dd-08de3661a64f
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:56:56.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMSYnTVZQT8/b7xOwV/DvYrcdR3NPbbQHiV/pEye79nWOJcoHirOQIZSa1+VSaErJKNd9lV3eak28ZXOFI/z4NkH3qMMd+U4r0025WWxuiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800
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

On 12/2/25 15:53, Frank Li wrote:
> On Tue, Dec 02, 2025 at 08:46:21AM +0100, Maud Spierings wrote:
>> On 12/1/25 17:52, Frank Li wrote:
>>> On Mon, Dec 01, 2025 at 12:53:20PM +0100, Maud Spierings via B4 Relay wrote:
>>>> From: Maud Spierings <maudspierings@gocontroll.com>
>>>>
>>>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>>>> with integrated boost controller.
>>>>
>>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>>>
>>>> ---
>>>>
>>>> In the current implementation the control registers for channel 1,
>>>> control all channels. So only one led subnode with led-sources is
>>>> supported right now. If at some point the driver functionality is
>>>> expanded the bindings can be easily extended with it.
>>>> ---
>>>>    .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>>>>    MAINTAINERS                                        |   5 +
>>>>    2 files changed, 112 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>> new file mode 100644
>>>> index 000000000000..e83723224b07
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>>>> @@ -0,0 +1,107 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Maxim max25014 backlight controller
>>>> +
>>>> +maintainers:
>>>> +  - Maud Spierings <maudspierings@gocontroll.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - maxim,max25014
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +  enable-gpios:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-supply:
>>>> +    description: Regulator which controls the boost converter input rail.
>>>> +
>>>> +  pwms:
>>>> +    maxItems: 1
>>>> +
>>>> +  maxim,iset:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    maximum: 15
>>>> +    default: 11
>>>> +    description:
>>>> +      Value of the ISET field in the ISET register. This controls the current
>>>> +      scale of the outputs, a higher number means more current.
>>>> +
>>>> +  led@0:
>>>
>>> define whole binding, allow 0-3. binding is not related with driver's
>>> implement.
>>>
>>> it'd better put unders leds.
>>>
>>
>> so like:
>>
>> backlight: backlight@6f {
>> 	compatible = "maxim,max25014";
>> 	reg = <0x6f>;
>> 	enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
>> 	pinctrl-names = "default";
>> 	pinctrl-0 = <&pinctrl_backlight>;
>> 	maxim,iset = <7>;
>>
>> 	leds {
>> 		#address-cells = <1>;
>> 		#size-cells = <0>;
>>
>> 		led@0 {
>> 			reg = <0>;
>> 			led-sources = <0 1 2>;
>> 			default-brightness = <50>;
>> 		};
>>
>> 		optional led@#....
>> 	};
>> };
>>
>> right?
> 
> yes.
> 

I am feeling a bit weird about these led sub nodes, because it is not 
programmed as a led driver, it is programmed as a backlight. I am trying 
to figure out how this would be used later when the led strings are 
individually controllable.

it isn't possible to link the seperate strings to different displays 
because it is only one backlight device, so I don't seen any reason why 
it would ever be used in another way than what it is now, were all 
strings are programmed by one register.

The only way I can make sense of it is if instead I program this device 
as a led driver and then use the led_bl driver as the actual backlight.

Thats a pretty big step in a different direction, but then the led 
subnodes at least can be properly used I feel.

Kind regards,
Maud

