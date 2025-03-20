Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157BA6A419
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6A310E5D9;
	Thu, 20 Mar 2025 10:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="KSla4Feh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2125.outbound.protection.outlook.com [40.107.249.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1B10E5D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erz+AnspGBw3l3BGtLlS9FFrr7jRihX3dYoAeV2glP/SOMxC52BLrOGV5vnkR9DP4RvUJZegv7EWBpu0rtzGyLkrfl37D/kIQ4c6PDPXynPN0JBCaN9eSXnr27E1RvA/EJG9qP0h62Z2dBtt3DzH2zPBTfVzciw2WM5fL+p98ycIMDjlXOsRG67NIRs7HIZt0tLR1gvEnA+WJnmwLFlglXMuVTH/9S1LdiTEinmTrBS8iu5T4aWuUYyYZMBlvPu6BIb43oATw1FFx3/hw9fF7NL5KZcVPLIjekZdGypCO4TdQD46m2E7gFbiJ1p1QYYFwHlymW9qApFWR+s4pl1Ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7SLW5AkIpu1VPPloBcbnyX+dLn9Ug872A7JRVU+zcQ=;
 b=fp0pmNZDGj5Om/flMuHH7YU8kFPn5UnuOlUUxUqfAMpan6XdSF6xZSzgw5c/L82IOO/zR49E2aWQD22JGF1ujScFtI7IhIDSrdPOszwe7WXbLsPeZE8zJBn/XV5Yhy0eWZWOyXwH/pwdrgrYPox/p2sgdYWT9cZS4HTIbNYNZrA8Y+4s3Q7dn70GyNoR31YbXMDh0TgoXTU/oFdxZnSUiXylwwe0ND0nZdNDkljsMXGb4mI4JlhMGu51kWFMgr6YyFf79WERV4TTIr6CrDGkGAa6MLMjJkowTsgwMWy1eDFO8m7ctXWV9gIeKOEJFdeVp6W4/sQcJM36oz3ootf7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7SLW5AkIpu1VPPloBcbnyX+dLn9Ug872A7JRVU+zcQ=;
 b=KSla4Feh0dZGVcw675KcVMCLHnEXcrHUiQtgvXZAZ4vjNcQDNu4iMU1p6fxx3jUYUegXGmhiKmwBcAAoBO3NG5lN59erw/UkdL+z28MuKOpYXZfMjCP30MJ4nb/njUmm/0kyukR9KeLa3hdfsLLC1F4d8Wn2gNWvF4Tr9TE8UaMCG0CrdPfotNCKzHKl+47j9m2MCHDaYmNJPaQfhBM+GcT+TpmLQ+dpTQ1qZwSdqm2wVAsv+eA2W2Qx07Pd3pCQGE/Svs2jdgYpi+clcLdstiE74VaE4uZ69oJ1GAoi11ucovU0ccCkoaZ5qf5xT4ehbioXJhrDNxHKIYaG/PRRvQ==
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:dc::8) by
 AS8P195MB2140.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Thu, 20 Mar 2025 10:50:09 +0000
Received: from GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258]) by GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
 ([fe80::c6fe:e602:7166:f258%5]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 10:50:09 +0000
From: Dominik Haller <D.Haller@phytec.de>
To: Harikrishna Shenoy <h-shenoy@ti.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "j-choudhary@ti.com" <j-choudhary@ti.com>, "sui.jingfeng@linux.dev"
 <sui.jingfeng@linux.dev>, "viro@zeniv.linux.org.uk"
 <viro@zeniv.linux.org.uk>, "r-ravikumar@ti.com" <r-ravikumar@ti.com>,
 "sjakhade@cadence.com" <sjakhade@cadence.com>, "yamonkar@cadence.com"
 <yamonkar@cadence.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2]  dt-bindings: drm/bridge: Add no-hpd property
Thread-Topic: [PATCH v3 1/2]  dt-bindings: drm/bridge: Add no-hpd property
Thread-Index: AQHbeG3pk31l2idMdUSqTzwZy1RM27N8GtUA
Date: Thu, 20 Mar 2025 10:50:09 +0000
Message-ID: <5fec6e3d37a795b07874fb3fa136a01ab37ce113.camel@phytec.de>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
In-Reply-To: <20250205115025.3133487-2-h-shenoy@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P195MB2328:EE_|AS8P195MB2140:EE_
x-ms-office365-filtering-correlation-id: fb9f7615-fb3d-480a-badf-08dd679cfba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dlZIdjZibzB2a3lhZ2pzNEgxYmtJbVorUG4vR2g3ZldEdjNMampuM29WcEFL?=
 =?utf-8?B?U1VUaTUzZ1dUZ25xTDNXNDRQQmdKY0pkdTFIbU9jZDRac3dpRVJ0UXd3VkJt?=
 =?utf-8?B?RTcwOWgwZXRpdk5mRkNlcytDc1BqQlZqbG5IdzBlRHBQaUNzdmVXQnN5MjZW?=
 =?utf-8?B?cmpwSHA0aHdNSkRheExPcVQ4KzNwUXZlbW9XU2Y2WnpzK1MrMGJvR09sa3B2?=
 =?utf-8?B?THZmNGZOaTNIMFVGRUY4eW5meGRSZmVScXUyUWk2MDBxeFhwQW5FYmFZYVBM?=
 =?utf-8?B?NndxWlZLZ1VtWm1uTzVrWjhpZmlGME9ieVMzeThybTFBbWhLT1VhTjVXeFdK?=
 =?utf-8?B?ZWVwNU5nQU5JdFpvTlNRR2dOMmQrbzRhZlBaYW9xTVBTVGxBMExuSVBRV0sy?=
 =?utf-8?B?Z2RpRVBsNjBlYW1ON2MzaEQxWERBdGtDL21nT1c3Ym0xaFB5eU1NUEhueEE0?=
 =?utf-8?B?aCtDK2lqWFVLa29mQlRaVmIzL00xbXZ3K3pRNnZrV2dZS3BzcmEyR0tSZmFm?=
 =?utf-8?B?MkhhZU9GbXdzb1ZONFR1TWlJS3lxUm5qNWxjK2xZaTVsTUNwYUZPVHNpSW5s?=
 =?utf-8?B?dlFBTzJTb2hvVmlnZ3BzSWRaMVdObXZUUllPWjg4OGVVUGFYUkNZc0xkVU1h?=
 =?utf-8?B?MEhHQUEvdFFZUUlNMVNyYmpCOXRGOFhiZnRCWDBKcVREZkZuM1YxeEczYTRz?=
 =?utf-8?B?UVpZQ2pJc1NnOWQzYXVhR1BJSFRubTdTclhaeEtMTnBicnlQa1dlK2s1SGNF?=
 =?utf-8?B?QUhYWDNYQURQT0w4M1BOOVB3YlZuT1VlWXBlaE40TURZUVpMdk1XbU41cVhr?=
 =?utf-8?B?aU5LOUhqOWJ5Zy9DYUhPN1NHOXpLQU54bHRKemM0U3RyKzlPSCtTMUpQSWVq?=
 =?utf-8?B?dFlvN2lIMG9RSG9WZm1tRm56Q3dvZmJxVHFpZWJSNmpHdU0ybjlBbmdjcTZr?=
 =?utf-8?B?eHQrVGpPUGtyWVZGODdSY0JIZGFqLzFNVlRIT0tBTGkrZ2I2Mm1CaTBHWlVh?=
 =?utf-8?B?OEFYV0s2aWNYT0xFRUR2L2F1WjhLZHpOaHNkK0JFNThCVHRUWGRsdWZsOTFG?=
 =?utf-8?B?SXV2TW9qOFM3dXlCWUZhczBxN1BiM2JYSGh2VVAvV3JDTm1qdDh6QURyRFlE?=
 =?utf-8?B?Q3JhR09TbC9XQ0hSRVJ5NzY5UGE5QVp6TWJscVE2VzNNNmRscm55OGVORHov?=
 =?utf-8?B?Ujk1aVl6cG1KZGxzTVoxdm1ERXBoT2ttejJFQm40WS9EK2xyNENWN0c5Tldy?=
 =?utf-8?B?dWhZTHBuSTBmcFhMQkVnQzhxSG9wd1hSUk5WckRSWFluOVFldWJ2UUUyQ1Fp?=
 =?utf-8?B?a2d5YzBFYkdQc200ZEZ4Sk9OcERCem40U0NDT0dZOUx0S3FoS255RUxCczc5?=
 =?utf-8?B?L21YUDZaS3M5bmZPNTBPMXFWZHdhb3FpemhyQmhzTWhPV2JMTW1jVjlhZUYw?=
 =?utf-8?B?cDFPMndicTVDUG9VUGhldGV6eUM5YUp4dkhqaWMrVDI1d2Ztc2FiTUsrRUEx?=
 =?utf-8?B?WnBsQVpZMVAyWFdXUkJIZjJIMjQ0RGkzVmZoek5IczdBVHNaMXU1NVQxdm52?=
 =?utf-8?B?d0VPTE1ldHZnSHQ2eUdaVlAzMmdXUXFuRkk1N2k4UXU0U0tDUFBVT0lMM3Bn?=
 =?utf-8?B?YS9wVi8yYTJXckVNS2I1NlpOOCtyVWp0dnl2QjlSdi9QbElEcmpzUVgxM1VU?=
 =?utf-8?B?cXVsZEdnL2JkYXhmNVRPSm5UZFc0N1dNK2dDOWQxTXBOdjI0YjlPa3IzNUti?=
 =?utf-8?B?QjEzWmpKU1VkazRQZ1gzUGdKS0dHNTBpcGppMXBhVGY1Yyt4SGRUcTJXNFR1?=
 =?utf-8?B?ekViU2swUENRdCtIZE1JY0JEWVBLblY0Um9CM2ExQS8wWGF3NmtXaUYwSHho?=
 =?utf-8?B?UG5QVVpVMG83NU15cjZ3cG1zUmFsVDhDSjIwdzZFR0RnRGcrMUVxbTFEUEhG?=
 =?utf-8?B?cHZFRExveW1xRE0wUWloOS9lMEVaZU14NlF3NFdtb1grWTBBRXVxWVhldVIy?=
 =?utf-8?B?a3RjTTNYYUVBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2P195MB2328.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MklmU3lGZEVmWXY4UjVCa0xGWDl2bWl0QlVoNVk2M05QUFNPd2ZDb3h3Q0I3?=
 =?utf-8?B?S2UyVkVkREtnb2RnTnhvTkd0L3NLVVNsUHRqYkJpS1gxWlBLTmRFRy9ieHVl?=
 =?utf-8?B?N3diaDZYcGMwcjY1eFZ0eVhCcTd3aWIrVzF6Y1ZwbC9tYlpqU0ZLeExuV0ZW?=
 =?utf-8?B?bjkrOHpNaTJsZWZWdXZybjcyZ0thWUdjTDh1VWQvOUFYSTF2cjk1UElXNnph?=
 =?utf-8?B?VGx3eVlWU3hRTFArOGU4Ky8wZkF4Tnpsa093aTdaYjRZWGd2WG5OclpMcURP?=
 =?utf-8?B?b2NUczBtTGFiZWZ4My80R3ZScnB0V3hDbjdaTTFyTTlSUmhoZzFaN2krTmNa?=
 =?utf-8?B?d2VLRFVnZ1dLTEk4SU1NOFVDUlR1cUJORTZXRzF1eWFuTE5WV0RDdzU2dXJq?=
 =?utf-8?B?NWgwU240alZjeDF0aTkvbStvc1MwUU9qUzEwSk5LdzlPU1pOckNVaThnRkhm?=
 =?utf-8?B?T3VyQzlwK09OR2F1ZG8vcVF5YXVIUTJyN05ZRzFRbVc0bWxLNy9iRlBIRmtQ?=
 =?utf-8?B?blZucXUvZmxCTUlUU1VmM3NtMVROd29ZZkpmMy9RSG9mSm1OT3JmVm9RU0FE?=
 =?utf-8?B?WU5xQ0NOZU4xM1g4UkF3aUdtWWUxcjMzUGs4YUZNT09HWThVUDMzcXhGR0Vl?=
 =?utf-8?B?WGhDTWpNZWx2M29zeG5TWVdsM3YwbkxnRit1WWp1czFEaHlBUWxTYzZqd1dW?=
 =?utf-8?B?bWVrWkR3WFJERnUwRUxwRURVRVZIb0RxeTg1aFE5Z1ZHQmIvS2FRVW01bHpL?=
 =?utf-8?B?MnVZbHZ3NkNZbVc5RVNOdVpMUkc5SS90QTZLTDloYUtRN0h3azhDSFY2TjMy?=
 =?utf-8?B?Y0VmMmZtS3JpYUswWThDSE1Ibmw4SHFSb0JCdWlOK0RVNUZzNzRqcmpIbStK?=
 =?utf-8?B?aUZRV1RReUkxM1lYQTFpeURua0NKdHZGVndieDJ5Q3FQMVhhc3Y1dFFNcW5u?=
 =?utf-8?B?bHZmR3JBMlJwZGFBN2d1TW9ZaEsyNW0zN2RsTXBDcUU0N2V4OTRvZVlGendn?=
 =?utf-8?B?WmFWSTBZbzdSZ211VlFKRngvNHNscEZUSmJkVG53aUx3UkI5eVg0VXhqOWRG?=
 =?utf-8?B?UHBWVk9JTXg3VnE1cWRZeUM4SFU4blNqWmdZNStkbldSMDR4U0hvelZPQzAx?=
 =?utf-8?B?QjNzb01aYWV6YzJiK0FLSmIvR1NKYUNHWlcyRlQrZWN0c1BNVWttOGUzUjFl?=
 =?utf-8?B?WUxiQ2lTZ3piTVY2SzZjdnpFWDVYbm1RYnFvckVqNktMTm9weGVndFVSOERn?=
 =?utf-8?B?NnBLM2RwMzVyQ1VsYWt6QVlENUpaTHNZSHhLZllYOUp5SVpBQzMxMU1sWHhk?=
 =?utf-8?B?SnExRmNGUXRheDlkUG8vMlIzREl1b2IrblRIMVYzczBKYUFObjRac2V1SGdI?=
 =?utf-8?B?OUdWN0dhVEcrZW96bUZEd1kzNTBCa3BoQ1Rmb3ZtaTR6R3lwc3pJZDhaUVZK?=
 =?utf-8?B?ajk4UWxFNWtQTk1zNXprUVlwcEFOTTdLOTQyVW14c2k5RVFpQmFwcUVLNXpO?=
 =?utf-8?B?djhOY3psM1ZLQzZ5WUZFQVpWdlFnM0FCSnJFRUxJRUJqNWNpenRMUmtXYjJP?=
 =?utf-8?B?RkZUWFluUElFZEs5bEpzTmRSaU9ybGpuQ1J3TXJFYWJ0M005dlJFSXIzSVI3?=
 =?utf-8?B?elA3TTVONHljZ201YmZiSXRpZTlGalE2UnZXQXFFRDhENndqWXNYQTAzei94?=
 =?utf-8?B?c2x5Nks1VkUzY2ZZUmRzZHdHMVpVWW5SOExUbk1XNVpGeGhJeWJxK0VRUkJJ?=
 =?utf-8?B?UEluTnRCNktKUWgrZjZCb09GNUo3Q3RiTFBlMWNTSXlXVklkTjMxV0JRU2E3?=
 =?utf-8?B?azFKUC9GMVZzS3lKSmhDeFhQd3I5ZEF0bUdic0xnMmRRUEZnVTQ4SDZ5MXJw?=
 =?utf-8?B?U0lmTTE1RFpPTitERnUvY0xDKzN2K3NoWFFGTzlWN05qV0NaQU1mMXBMZ252?=
 =?utf-8?B?NmI4aXNSbnRNUStGa21VclNvNWJnUWVhdUpiYnhpZmdGV1hrR2R4alFCK01m?=
 =?utf-8?B?amN0RHo1SmxuNTN3MW5Nemd2NVdoVzFya2NWTm1Tb0t2L1pjbXJvcjRqYW9X?=
 =?utf-8?B?SVN3Y3NOVWdCT3lGcGdsV3UxSTNGUnd1UFRkUFRaWWZSYjdvWnlWTDYzdCtu?=
 =?utf-8?Q?Q97I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F6AD23F6443F342B89F2DDC9DF36334@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P195MB2328.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f7615-fb3d-480a-badf-08dd679cfba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 10:50:09.0378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuCMafW6dUh3/5syAYDvhYrAVPK7G3KRn8+/62oVf5I18vmBwuxfY51VARKlEZMmqPV8yIleDUUOOzf5fdefMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2140
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

SGksCgoKT24gV2VkLCAyMDI1LTAyLTA1IGF0IDE3OjIwICswNTMwLCBIYXJpa3Jpc2huYSBTaGVu
b3kgd3JvdGU6Cj4gRnJvbTogUmFodWwgVCBSIDxyLXJhdmlrdW1hckB0aS5jb20+Cj4gCj4gVGhl
IG1oZHAgYnJpZGdlIGNhbiB3b3JrIHdpdGhvdXQgaXRzIEhQRCBwaW4gaG9va2VkIHVwIHRvIHRo
ZQo+IGNvbm5lY3RvciwKPiBidXQgdGhlIGN1cnJlbnQgYnJpZGdlIGRyaXZlciB0aHJvd3MgYW4g
ZXJyb3Igd2hlbiBocGQgbGluZSBpcyBub3QKPiBjb25uZWN0ZWQgdG8gdGhlIGNvbm5lY3Rvci4g
Rm9yIHN1Y2ggY2FzZXMsIHdlIG5lZWQgYW4gaW5kaWNhdGlvbiBmb3IKPiBuby1ocGQsIHVzaW5n
IHdoaWNoIHdlIGNhbiBieXBhc3MgdGhlIGhwZCBkZXRlY3Rpb24gYW5kIGluc3RlYWQgdXNlCj4g
dGhlCj4gYXV4aWxpYXJ5IGNoYW5uZWxzIGNvbm5lY3RlZCB0byB0aGUgRFAgY29ubmVjdG9yIHRv
IGNvbmZpcm0gdGhlCj4gY29ubmVjdGlvbi4KPiBTbyBhZGQgbm8taHBkIHByb3BlcnR5IHRvIHRo
ZSBiaW5kaW5ncywgdG8gZGlzYWJsZSBocGQgd2hlbiBub3QKPiBjb25uZWN0ZWQgb3IgdW51c2Fi
bGUgZHVlIHRvIERQMC1IUEQgbm90IGNvbm5lY3RlZCB0byBjb3JyZWN0IEhQRCAKPiBwaW4gb24g
U09DIGxpa2UgaW4gY2FzZSBvZiBKNzIxUzIuCm91dCBvZiBjdXJpb3NpdHkuIFRoaXMgc2VyaWVz
IGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyB0byBkbyB3aXRoIHRoZQpvdGhlciBEUCBIUEQgcGluIChB
QTI0IE1DQVNQMV9BQ0xLWC5EUDBfSFBEIGluIGNhc2Ugb2YgSjcyMVMyKSBzdGlsbApiZWluZyBt
YW5kYXRvcnkgdG8gbXV4Pwo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFQgUiA8ci1yYXZpa3VtYXJA
dGkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpheWVzaCBDaG91ZGhhcnkgPGotY2hvdWRoYXJ5QHRp
LmNvbT4KPiAtLS0KPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2Nk
bnMsbWhkcDg1NDYueWFtbMKgwqAgfCA2Cj4gKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdAo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1NDYueWFtbAo+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1NDYueWFt
bAo+IGluZGV4IGMyYjM2OTQ1NmU0ZS4uM2E2YzZkODM3NTkzIDEwMDY0NAo+IC0tLQo+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1
NDYueWFtbAo+ICsrKwo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2NkbnMsbWhkcDg1NDYueWFtbAo+IEBAIC01Nyw2ICs1NywxMiBAQCBwcm9wZXJ0
aWVzOgo+IMKgwqAgaW50ZXJydXB0czoKPiDCoMKgwqDCoCBtYXhJdGVtczogMQo+IMKgCj4gK8Kg
IGNkbnMsbm8taHBkOgo+ICvCoMKgwqAgdHlwZTogYm9vbGVhbgo+ICvCoMKgwqAgZGVzY3JpcHRp
b246Cj4gK8KgwqDCoMKgwqAgU2V0IGlmIHRoZSBIUEQgbGluZSBvbiB0aGUgYnJpZGdlIGlzbid0
IGhvb2tlZCB1cCB0byBhbnl0aGluZwo+IG9yIGlzCj4gK8KgwqDCoMKgwqAgb3RoZXJ3aXNlIHVu
dXNhYmxlLgo+ICsKPiDCoMKgIHBvcnRzOgo+IMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL2dyYXBo
LnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMKPiDCoAoK
