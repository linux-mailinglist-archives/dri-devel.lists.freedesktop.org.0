Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF69A70883
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7CE10E1F1;
	Tue, 25 Mar 2025 17:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="LoorCBfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6023F10E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIIni7yTFHoHsOiONj1JuDbN4QhZmOu7Ho+4OAfzGUbwWtOXGD+wiib0wGoMNXOftk+Th4AmlH3BxR1A6Zwmn6LG52ojO1tVJy5zM6DPy9rK/NHqwDu2NqXhQhbRXo9Jq2uuQ3ITLRl+0cbgzhGn9HT6JAVYzVAoAikGQBgLh7beCfWG6l/YkssbZ9XTBSe51CjjDfTUXz+5N6v475d9Wl5nPaGTQs1VPHAL087jWEipLARhZL2+d9O7j9fD59z3ITYJLzsfF+usJLAhhpeEWZDcvdgAa52bCZ9yBAM4/ASd2YN3gK2rhHKDvDTJkpOjKTusR0vbpg/s4z5zB91Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mKVUcwI3IbYyq+cWzJOQbDL5LW/b5DW+gSYfZ+dT8o=;
 b=e7UhVS8lB821Xy03vridfjHTT6iCoVcEPFSOBGmIcThL2PQOlVBc+J1lDQ3Wqc8T40di1A5EPEVUniJYVPIKMeagZ5D48TyDielt09atg6lUcwhqwWhmqmgvv85xTshaxWiV6rvjhsub2nAyJRmeCCSL8iy7Uihh8GaIIp/coSjFQBJn7rjDmah1c+zsSnoX7xl5cNhmTfZfgY56T/YxnctdWdG5nLDZWOi7vW5FA2/UZ56ucQW+iKaLiIQIGQWBN+6UrKfA+A+f3W3vXnwEafJRMxFjnL8V7+L+OvW0o3Dd3P0jZappdiOCAoFVAfTI06P1HQTMFAwcjiZShGsmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mKVUcwI3IbYyq+cWzJOQbDL5LW/b5DW+gSYfZ+dT8o=;
 b=LoorCBfw+seU7JN9bh8WhCgJs0xKS6B6QdG/c3XjurE86FxXLvrG6T9tztqNEM+x6v5mII6IKIGE++CIS2HYn94sUewLEkrWtfIhisOqsag3vAxge5ltFY9paQmXvnE+v8lTeWqPHyW/AnMe9qw47S4KyUzAG9AN+AwMrHaXSMm+mlDADBN6ZaUUmSJsjkc4SKgctQT/yCUXDlbF07ZiKQ9NtwPgGA82XLiqCl8bxytzNqkrsjXIAcU6aP+FgSLPEksOlUpK9g+WgZZl76aOkvORVC0bLKMN8/CafJq2nJAeJczGKqVl22LD31y0qW+4oFOEIyVQzm0+qcwGo1Bk6A==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB6414.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:51:48 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 17:51:48 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "robh@kernel.org" <robh@kernel.org>, "dmitry.baryshkov@oss.qualcomm.com"
 <dmitry.baryshkov@oss.qualcomm.com>, "Zini, Alessandro"
 <alessandro.zini@siemens.com>
CC: "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "andrej.picej@norik.com" <andrej.picej@norik.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "marex@denx.de" <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Thread-Topic: [PATCH 2/2] drm/bridge: ti-sn65dsi83: add h/vsync-disable support
Thread-Index: AQHbjnfGR46m6PRz5kqDQuR5SHx5tLNnMNkAgAbmVYCAFikLAA==
Date: Tue, 25 Mar 2025 17:51:48 +0000
Message-ID: <75516ce64afc57cde365a234926fe96d07355533.camel@siemens.com>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
 <20250306091133.46888-3-alessandro.zini@siemens.com>
 <tzrdtqpim2srjl3dihjdyejrwunirq7mbwngyqi3avdtympkjx@2kqsg562fcke>
 <b0f19f77d2db121f7dbc8a3b6091bf114427e839.camel@siemens.com>
In-Reply-To: <b0f19f77d2db121f7dbc8a3b6091bf114427e839.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB6414:EE_
x-ms-office365-filtering-correlation-id: 8a5bc1ef-9e13-4275-c354-08dd6bc5b76a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cWtQQjJxME1RMTc5d015b1VhV0NMZytvWk0wOXJ6STVvcUJSSGcveVVDdG55?=
 =?utf-8?B?V1VQZFR4bkh0UlJabFhOUkl1WUVWUHJKTHBCMTNSVStDeUdqVUUwVFUvV0dE?=
 =?utf-8?B?L3dFRWxQWmxNMzM2bzhFalU0a2p6VTVGOHZFVkgrbk90NnFvbTZYcjE1ZnVq?=
 =?utf-8?B?NVdmMkJ3cHlKUGg1WXRyb3BOYzFHSmFEdE1wUTMxS1p0T2FHTjVSbU1uZnp3?=
 =?utf-8?B?SFZ2cjBtYTJEcGRqdE9PS3poZEs4SFhhdkVQeEhLSGphWS9SRDdMaEFZdGtp?=
 =?utf-8?B?N01LZlZmS0hGWmx3eG90RVdCRHB3ZW1zMi9FcXZEMzV6eXFxR21tYnRmUkZC?=
 =?utf-8?B?cTNYd0tpQWRHWmZwZ1N0MmJ0MmszNEJFdGd3dmFiR0srbVk5bmt2cyszZkYv?=
 =?utf-8?B?bFlETlRybUJLcWt6MGJNRG1QOStQd1Y2TVBOdXpxTHZFRlZxN3VXRFhkNXlM?=
 =?utf-8?B?TmFoNm4xVUd1ZzFTUFZOZGJvSGNMbnZBY2FPSlk1ZGhVODI3K05ZbzBqUzM2?=
 =?utf-8?B?cmdOcjFFcUVYS2IvSjAwbEd2bFlBY3h4WGxsTGZxNkh4bEFSdkt0clVqaDdQ?=
 =?utf-8?B?dTFYT2syTjBSTktpbXgrcE1tYjllV1hqeWg5VUNRdkk3S29KMFJrNFV1RThD?=
 =?utf-8?B?VVpDLzVmUTZNYU9zTmJhZm1iQW5CVEQ1STRtdXpXcEpBZzh5MFp5V0ViaXpZ?=
 =?utf-8?B?MnFrOUNSaEdRK2Z1N0MxelpvTE1YZWx2d1ZZdThJTUhvRkl6Z2dIUmMzRDF0?=
 =?utf-8?B?NmxMZGZIY0hMNHViZ3I1VHhuc2NYa2Z3T2V2V1BqbEpSQVIyRXRCVWU1YUtM?=
 =?utf-8?B?NStjZXVYNkVMYUNSR3g4RTFoT3dtaTlMVDUxRElhM210aGRFZWNlcGgwN1lB?=
 =?utf-8?B?aWI1UytpUW1TZUNFcDZmVHBibEVSL0pqT2l1VHd5T21ocmV1SThnUjI1T25X?=
 =?utf-8?B?ODd0Tk1NaEMra2h6VXBVa3F2ckVlUE8vZ3RWTTY1MUhUNjBNTyswRDZOVWdN?=
 =?utf-8?B?eEI0K1BZeXREUE1qajk1VU9TR2ZIV0tXMTdaZjRQWS8wQnhMa2dLb1VaTDBl?=
 =?utf-8?B?Ky92eFMxMzMwNktPc1BYNXM2TjJJdUZvZ29jd1V6aXlUdHEyMHVXNVhMbml5?=
 =?utf-8?B?M01uUjVWU21JSURLN0MrK0pIUm5XbHNIMkhmZDE1RHNvUzlUYVpVc3JKaWVV?=
 =?utf-8?B?b2dhNTJPSGJzcWFaa0NxT0c5cVdDY1VCWWRMQVM4bFgxZEV1OEsxWjFmOUJI?=
 =?utf-8?B?dlZ4V29tZEVLeDRBa3hzYXRSakRmOEI1Z1pIWkVmSk1NaHdGNVphdm05VGpr?=
 =?utf-8?B?OElZN0FEemlPU0V0SWovQzk4eWhYaXl2Vzl1RHBHeDZKSENrcW1ybkpNTVcx?=
 =?utf-8?B?NldLRjRBeThDMktQUTgzV3B4WVJlK21RanppT0cwMEhOaE00Sjl1VW44eVEz?=
 =?utf-8?B?bThCcEVYRU44QTZQZThQWitqa2dFT0hZOEovd1d2ZGNKSWMyZm1KbXV4d1J2?=
 =?utf-8?B?U0xGb3IrOW5FKytGQnJkU2htOVlZRElPSEpnVHdjbVFRWUNLTHJOK0c2Mk5S?=
 =?utf-8?B?MnpVYlE2dk1iZEpiN3VjMVRJbDZZb2h1U05EdkJlT3NBUlJlOVVwQzRocSth?=
 =?utf-8?B?Z0VMVkxxazNwY3dPa1pxZHF4ZnJOVGVUSGFMdlFUTlJrS051WlJBRElCM3VU?=
 =?utf-8?B?Rm13VHIzVmtYUHBpMHFpb0VOSVI5cTQycWxGYlFPdXRJOHJhUGZwbFdYdXRD?=
 =?utf-8?B?LyszdjlDR1duZHdpWU5PeG1YZGxyRHVnME9CbCsrWEJWNkI1OXkyVlMwMWYx?=
 =?utf-8?B?UGZxY1I3RjAwQURTV1dYdzJMOGpnSXZZVDI0SWQwV21IUVdRZ29CbVQxdUhw?=
 =?utf-8?B?RnJCanlnUGhnOWFYaUZHZmczQmZlR3hpSXI0R0VyY1VxY0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGhESjdSMFc3U3MrWUtsY003aldRN1duN2g3UEt4aGNSOTB5YmZhT3ZyV2VS?=
 =?utf-8?B?S3FESTh5ZkJDVjIxY1Y2TmluYjBHNXhVUXZTbDNiZHVvU29vazJ4aVNuNlAy?=
 =?utf-8?B?bVZEMjJzQlNHWGNFS1h4MVpKVkFKbGhxb0dDRnM4eUcrR1h1aVlseW9vdmdl?=
 =?utf-8?B?REljVXlvWjdWei9hZGpqM05wbmNkY09aTWhxdFlSSTZpVzF3YTViejhBM04z?=
 =?utf-8?B?eHYzMGxwRmFpNkFlYWQ4NXBtR09LNzc2eVpHOFlOY1lnc1BhQ3Y2TTlwMHJj?=
 =?utf-8?B?T2ZtZ2RtZ2JHTmpEbjdMQnV4REN6VEdaM3RNV2RBWEdCbVprOWlFQ0dhNHdK?=
 =?utf-8?B?ZnJ4SXIvaWs1MWNCTWJWclEwQzFHMWJoNC9CQWZKTGliZDQrWktOOFZyb1FM?=
 =?utf-8?B?QVlidXNOZy92L2E2OTlYOFpKRE5HbW44T2dxSGp3SHZ2RW1Yd0JHNTRiZW90?=
 =?utf-8?B?TW9OUWI0V2JXdGI4YjlNMDFFSXFiMGdtTDhVZUg0Tm1reUQyQ1VDV1R3SGN5?=
 =?utf-8?B?V29lWGpEMlltc2poSE1EZG55VFV4Wi9JbWY4dUpGL1E1clRQQllnMkNteFA4?=
 =?utf-8?B?cUFPODFSR2phQnRFcEQwbWw3L3pyUnRhTS8xSi80eDFaOGU0V2N0R3ZZYVk2?=
 =?utf-8?B?YWtGRmhHeEpnZWY0UHVFWE5ibWZMZzB2OUdMd3hLcjBZVzJ5MmV1bWF6T04y?=
 =?utf-8?B?MnMrZWxQTXh6SGcrdEpQRkgrZ0s1MXk5cmd5S3FzUGNyS0dldGNNZG01RlJs?=
 =?utf-8?B?Q3FjR1V1K0Q2WVZHZFdDd0RlRTN3WkJHaVo4K0dpY3l1MUVhL2pmMk8wZkw5?=
 =?utf-8?B?YWFON1FndEZ1U08va1dGRkNBQktQU2VjZ05hb1JhVk92eW5MNktneFkxVHRu?=
 =?utf-8?B?SlBLS1ZtUkllNEZlbVdidDVLakRselErc2pBZ0dlUzdibldEU0N0dkZhTElG?=
 =?utf-8?B?K0E2NUdCUUg0N214Z29LTzh0Q1g4dzhQa0h1YVNkNzRXTjZXZ01STnY1Rmlo?=
 =?utf-8?B?Z1dJTC9WTkRJNjQvR1JUaDd6MXJmbzJyeXZCZnlCTkFPZUsyUVg4T01QTnZ4?=
 =?utf-8?B?M3VaNVNFVGlyU21jNi9PaXpkNG83VXZ3RVAzaGdOZGpseHlmenZOTlEzY2Ny?=
 =?utf-8?B?eDFTZWlzRTg4VTU3NFJBalFUUXlQdWVOR0tSZFJ5WnNPaHpwYXdhcDh2dDBn?=
 =?utf-8?B?Q0VHTlRQZDM5R25HaGxxVWIzYldRcGc3Q3R4OTVXaGM3bnVoODBaSEdCcVNC?=
 =?utf-8?B?WGVqSHpKNk5Yek85eFY2MlFNL1ZhcWJhMHI5NXUraWZ0ekk1RDR5Nk1yNjJC?=
 =?utf-8?B?cDdOV1MwNVNrTXpxSjhuMDNDampxZHo5QnRrS0srK2Q4RVd2MDcwcFhacDN2?=
 =?utf-8?B?cnNNaFlISGhHNGlrT0xIcWZWMUkxZ1JIU0ZyMDNPbW5qTk5EK21wY3VuNW5s?=
 =?utf-8?B?V1FqcmIzb2o4dXdRclk3V0FaVVlQdDI5QTMxaG5Vbm1YUUQ4bTFkMjJoSVpx?=
 =?utf-8?B?NGI2c21xQWJaMVpDMGhGNzk1N2FvOGduczFuVmNxT2luWExhM0VOQVZxWmtP?=
 =?utf-8?B?N2R1RHhLeFYvMWROK292aDI1V2FWMUo2L0FnemgvdVN3aDA5REZWUk5yZEdl?=
 =?utf-8?B?Y1dEOFYwZlhLOXRFdzhIeWl4RmZ1dU5xVDRQbmxLQk42SlRkRDdRYnVnM2Nk?=
 =?utf-8?B?M0dkWDlTYmM5Q2JNRHpCeUtTWHVFZmU4bXljcnMyM05QeGZySVVOVXJzVzho?=
 =?utf-8?B?bkhBRjREQ2Exb1ltZ1R6TVcrcUNnVHFtMUhJb25VcVNkT1RWV3dSUDlSWTc0?=
 =?utf-8?B?UWFVQlNIelJGMGVSVE0xeENmNmpQOFNhZThzc1RaUStnMURCTFlvYXA0VVRD?=
 =?utf-8?B?TmFHbGhCdEM3SGhveUUyNHBHTDlxRSthRzJYVXR6N0x0NFZ0c3RYb0JDRGpX?=
 =?utf-8?B?U0VPSWFZSXJVbnUrRit0NmRHcW1LK0VpcERFdUZmKzNIY1hIWjZvdGRCbGNF?=
 =?utf-8?B?ZUoyZ1FaY2wvcFNtdzNaSmxRNFNWS3JEV3RSb2drVXlUbzg0VzdROXUvaUls?=
 =?utf-8?B?TDI5MnNPQ2NqZVBrcXU0aVlCejZjTGw1em9DVmR3YjMvRTVJWDVQaS9jRTZW?=
 =?utf-8?B?aXl6eUt3c0pDRkR4aE5FYXAyM3V5SnNZUG5LQ3VPOEtpV0NRaDQ1MUtxQTU1?=
 =?utf-8?Q?u8ycqSHlabtfj+MC1Z7LxCM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68ED5D061D64C148B8D5066424CB357E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5bc1ef-9e13-4275-c354-08dd6bc5b76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 17:51:48.6295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDHCVaKRzIrpa9P3uZo3lKdXOqnA6xNmYBgfRdlPfU/WxVyZXzMkpq8ZVIN5ko+4r3IBkgawHsIAX8xrEW9L9Px3ilAfdVFCLu1m72VZfGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6414
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

SGkgUm9iLCBEbWl0cnksDQoNCk9uIFR1ZSwgMjAyNS0wMy0xMSBhdCAxNToyNyArMDAwMCwgWmlu
aSwgQWxlc3NhbmRybyB3cm90ZToNCj4gPiA+IFRoZSBoL3ZzeW5jLWRpc2FibGUgcHJvcGVydGll
cyBhcmUgdXNlZCB0byBjb250cm9sIHdoZXRoZXIgdG8gdXNlIG9yDQo+ID4gPiBub3QgaC92c3lu
YyBzaWduYWxzLCBieSBjb25maWd1cmluZyB0aGVpciBwdWxzZSB3aWR0aCB0byB6ZXJvLg0KPiA+
ID4gDQo+ID4gPiBUaGlzIGlzIHJlcXVpcmVkIG9uIHNvbWUgcGFuZWxzIHdoaWNoIGFyZSBkcml2
ZW4gaW4gREUtb25seSBtb2RlIGJ1dCBkbw0KPiA+ID4gbm90IGlnbm9yZSBzeW5jIHBhY2tldHMs
IGFuZCBpbnN0ZWFkIHJlcXVpcmUgdGhlbSB0byBiZSBsb3ctdm9sdGFnZSBsZXZlbA0KPiA+ID4g
b3IgZ3JvdW5kLg0KPiA+IA0KPiA+IElmIHRoaXMgaXMgcmVxdWlyZWQgYnkgJ3NvbWUgcGFuZWxz
JywgdGhlbiBpdCBzaG91bGQgYmUgYSBwcm9wZXJ0eSBvZg0KPiA+IHRoZSBwYW5lbCwgbm90IGJ5
IHRoZSBicmlkZ2UgaXRzZWxmLg0KPiANCj4gSSBnb3QgdGhlIHNhbWUsIHJpZ2h0ZnVsIG9iamVj
dGlvbiBhbHNvIGZyb20gUm9iLiBJJ2xsIGFuc3dlciBoZXJlIHRvDQo+IHRoZSBib3RoIG9mIHlv
dSB3aXRoIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoZSBzdWJtaXNzaW9uIG9mIHRoaXMgcGF0Y2gu
DQo+IEFjdHVhbGx5LCBJIHdhaXRlZCBmb3IgYSB3aGlsZSBiZWZvcmUgc2VuZGluZyB0aGlzIHBh
dGNoLCBiZWNhdXNlIEkNCj4gb3JpZ2luYWxseSBoYWQgdGhlIHNhbWUgb3Bpbmlvbi4gSSBkbyBz
dGlsbCBoYXZlIHNvbWUgZGlmZmljdWx0aWVzDQo+IGRyYXdpbmcgdGhlIGxpbmUgYmV0d2VlbiAi
dGhpcyBpcyBhIHBhbmVsIHByb3BlcnR5IiBhbmQgInRoaXMgaXMgYQ0KPiBjb25maWd1cmFibGUg
ZmVhdHVyZSBvZiB0aGUgYnJpZGdlIi4NCj4gDQo+IEhvd2V2ZXIsIEkgaGF2ZSBhbHNvIHByZXBh
cmVkIGEgc2Vjb25kIHBhdGNoIHdoaWNoIGFkZHMgc3VwcG9ydCBmb3INCj4gY29uZmlndXJpbmcg
dGhlIExWRFMgbmVhci1lbmQgdGVybWluYXRpb24uIEFmdGVyd2FyZCwgSSBmb3VuZCB0aGF0IHRo
aXMNCj4gZmVhdHVyZSBoYXMgYWxyZWFkeSBtYWRlIGl0cyB3YXkgaW4gcmVjZW50bHksIHNvIEkg
ZHJvcHBlZCB0aGUgcGF0Y2guDQo+IEFyZ3VhYmx5IHN0aWxsLCB0aGF0IGZlYXR1cmUgY291bGQg
YmUgc2VlbiBpbiB0aGUgc2FtZSB3YXkgYXMgdGhlIG9uZQ0KPiBhZGRlZCBmcm9tIHRoaXMgcGF0
Y2gsIHNpbmNlIGEgcGFuZWwgbWlnaHQgcmVxdWlyZSAxMDAgT2htLCB3aGlsZQ0KPiBhbm90aGVy
IDIwMCBPaG0uIExpa2V3aXNlLCBhIHBhbmVsIG1pZ2h0IHJlcXVpcmUgaC92c3luYyBzaWduYWxz
LCB3aGlsZQ0KPiBhbm90aGVyIG1pZ2h0IHJlcXVpcmUgdGhlbSB0byBiZSB6ZXJvL2Fic2VudC4N
Cj4gDQo+IFRoZSBUSSBFMkUgZGlzY3Vzc2lvbiBJIGhhdmUgYXR0YWNoZWQgdG8gdGhlIGNvdmVy
IGxldHRlciBvZiB0aGlzIHBhdGNoDQo+IHNlcmllcyBldmVudHVhbGx5IG1hZGUgbWUgY2hhbmdl
IG15IG1pbmQuIEZyb20gbXkgcG9pbnQgb2YgdmlldywgdGhlDQo+IGRpc2N1c3Npb24gaW1wbGll
cyB0aGF0IGF2b2lkaW5nIHRoZSBnZW5lcmF0aW9uIG9mIGgvdnN5bmMgc2lnbmFscyBpcw0KPiBp
bmRlZWQgYSAoY29uZmlndXJhYmxlKSBmZWF0dXJlIG9mIHRoZSBicmlkZ2UsIGV2ZW4gdGhvdWdo
IG5vdA0KPiBleHBsaWNpdGx5IGRvY3VtZW50ZWQgaW4gaXRzIGRhdGFzaGVldC4NCj4gDQo+IEdp
dmVuIHRoZSB0d28gcmVhc29ucyBhYm92ZSwgSSB0aGluayB0aGlzIHBhdGNoIHdvdWxkIGJldHRl
ciBmaXQgaW4gdGhlDQo+IGJyaWRnZSByYXRoZXIgdGhhbiBpbiB0aGUgcGFuZWwgKHdoaWNoLCBm
b3IgY29udGV4dCwgaXMgZHJpdmVuIGFzIGENCj4gc2ltcGxlLXBhbmVsKS4NCj4gDQo+ID4gQ2Fu
IHRoZSBwYW5lbCByZXR1cm4gdGhlIG1vZGUgd2l0aCBoc3luY19lbmQgPSBoc3luY19zdGFydCBh
bmQNCj4gPiB2c3luY19lbmMgPSB2c3luY19zdGFydD8NCj4gDQo+IEkgZGlkIHRyeSB0byBzZXQg
PGgvdnN5bmMtbGVuPiB0byB6ZXJvLCB3aGljaCByZXN1bHRlZCBpbiB2c3luY19lbmQgPQ0KPiB2
c3luY19zdGFydCBhbmQgaHN5bmNfZW5kID0gaHN5bmNfc3RhcnQsIHdoaWxlIGFsc28gYWRqdXN0
aW5nIHRoZSBvdGhlcg0KPiBibGFua2luZyBwcm9wZXJ0aWVzLiBJIGFtIG5vdCBzdXJlIGlmIHRo
aXMgaXMgd2hhdCB5b3UgbWVhbnQuDQo+IEhvd2V2ZXIsIHRoaXMgcmVzdWx0ZWQgaW4gYW4gaXNz
dWUgYWxvbmcgdGhlIHBpcGVsaW5lLCBhbmQgdWx0aW1hdGVseQ0KPiBjYXVzZWQgZHJtX2F0b21p
Y19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcygpIHRvIHRpbWVvdXQuDQoNCnRoZSBwcm9ibGVtIGhl
cmUgaXMgdGhhdCBhY3R1YWxseSB3ZSBjYW5ub3QgbW9kZWwgdGhpcyBwaXBlbGluZSB3aXRoDQp0
aGUgY3VycmVudCBMaW51eCBzdGF0ZSBvZiBhZmZhaXJzOiB0aGUgYnJpZGdlIHJlcXVpcmVzIGhz
eW5jL3ZzeW5jIHNpZ25hbHMNCmFuZCB0aGUgcGFuZWwgb25seSB3b3JrcyBpZiB0aGV5IGFyZSBh
bHdheXMgIjAiLiBXaXRoIHRoZSBvbmx5DQpzb2x1dGlvbiB3ZSd2ZSBmb3VuZCB0byBzZXQgdGhl
aXIgbGVuZ3RoIHRvICIwIiBpbiB0aGUgYnJpZGdlIGl0c2VsZi4NCg0KU28gaXQncyBhIHF1aXJr
LCBub3QgYSBwcm9wZXIgY29uZmlndXJhdGlvbi4gQSBwcm9wZXIgY29uZmlndXJhdGlvbiB3b3Vs
ZA0KbGVhZCB0byB2c3luYy9oc3luYyBtaXNzaW5nIGluIHRoZSB3aG9sZSBwaXBlbGluZSBhbmQg
dGhlIGJyaWRnZSBjYW5ub3QNCnN5bmMuDQoNCkFzIEkgdW5kZXJzdGFuZCwgY3VycmVudGx5IERS
TSBzdWJzeXN0ZW0gb25seSBzdXBwb3J0cyBkaWZmZXJlbnQgcG9sYXJpdGllcw0Kb2YgdGhlIHZz
eW5jL2hzeW5jIHNpZ25hbHMgYWxvbmcgdGhlIHBpcGVsaW5lLCBidXQgbm90IHRoZSBlbnRpcmVs
eQ0KZGlmZmVyZW50IGNvbmZpZ3VyYXRpb24gKGkuZS4gcHJlc2VudC9taXNzaW5nIHN5bmMgcHVs
c2VzIGZvciBkaWZmZXJlbnQNCnBhcnRzIGluIHRoZSBwaXBlbGluZSkuDQoNCkFzIEkgdW5kZXN0
YW5kLCB0aGUgYnJpZGdlcyBkbyBub3QgbG9vayBpbnRvIHRoZSBwYW5lbCBwcm9wZXJ0aWVzIGRp
cmVjdGx5LA0KYnV0IHJhdGhlciB0aGVyZSBpcyBhIGNvbW1vbiAibW9kZSIgbmVnb3RpYXRlZCwg
YnV0IHdoYXQgdG8gZG8gaWYgd2UgaGF2ZQ0KZGlmZmVyZW50IHJlcXVpcmVtZW50cyBhbG9uZyB0
aGUgcGlwZWxpbmU/DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cu
c2llbWVucy5jb20NCg==
