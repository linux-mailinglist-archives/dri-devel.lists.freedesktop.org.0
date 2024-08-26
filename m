Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705495E67F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 03:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74EB10E02B;
	Mon, 26 Aug 2024 01:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hikaa9oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2081.outbound.protection.outlook.com [40.107.117.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5161910E02B;
 Mon, 26 Aug 2024 01:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfkBa8cXgt+1Nj4/SVSAaKRZjachQbSr4+fl1nyLg1JxSGy5f6V0306PhWSbZN91iifaw7mGAU7HF1flIBfUFrDMwl+sTbPyahHP/weoCJBWbbh6QuTwzf5nBDB2g8Uu1TBcIM0L0HXsl4aSonGHbKmQX0+sh8nsY7kwWTZwJAOqD3eBinpO/0nGsVlHcj9tdRmBJKZBDfrOu1y0LGPdMopBHFFESWXmQ6GFAg/bLdLGsAGLsHuZbKhR36G5119+2a17GRG6r/7fZAy6WydBn2psCZTcQoxLHsU+5k7RcGWOIkNpYL0K+GEweGVEQ8QJ5a2EW2N6ypFGyLPYABuCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STRTxOeOkps6BPHGeBAD8BPl8A3H9Yc6ULFluvsa8ME=;
 b=u2+w/AVPPBrUz0nuTIsFwiWD/49b/T4Jb4ADOMriHAmKEX2EcSe5IY58uDwfHWCT+H92cq6cgGj4oTYC4fDw2WmQaPS4IS0TyB21JRaKVf0jNTtrFL/gsJh0yZYssXvCANt8J19lu5HE31sfpSeQkMnvIr2CL5zHN8ZnXOIu81sa+vZCxHNjMvVKV82eY9LIVaj0qPWjRII/nniQz8QQmw82YsHf7mHPqCD/bJs46t/Bz0V9qWNqzY3c743KvjhxTsfybVAxXYLHPGt+okLtH3quVyiRXf38bFaAyD9Mx3PzHeB8xA2p7xFO2mWerLGa/+X/WtOVfosrePrhqvi9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STRTxOeOkps6BPHGeBAD8BPl8A3H9Yc6ULFluvsa8ME=;
 b=hikaa9oiL5hlYSDyZhbrvxw4kt8rDRfKB7Rp1DuiwDHUv2AioXhCYCI3rdUmbOG52zGvbKfGhBCvjtPhkSIcQ7bl2frwvhJqjE8Z9jOsatFDBzcWM24owiZPK+QDPud3YEejL6d28SDKzm1lOYhwsx47yUDBTuJoUOMTOhioEGienz9ybDCVGBxL3UdzNiszEkB3JZKL93HNx+3aYnaT3q2kmMFS5NZ7lq+DVQKwrY5dRfLorK95vgHnBXkjFhTof6goD9m0wecn8G96+hIImAQ3G0FbMFjA9LYi1GQm0jwxtAWwKOdWjGBKJeu8qslxI6b2yW1mAvEf5O75tPfbYA==
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB7106.apcprd06.prod.outlook.com (2603:1096:990:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 01:56:04 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 01:56:03 +0000
From: =?utf-8?B?5LqO5L286Imv?= <yujiaoliang@vivo.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, opensource.kernel
 <opensource.kernel@vivo.com>
Subject: Re: [PATCH v3] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Thread-Topic: [PATCH v3] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Thread-Index: AQHa83O3UXKgntie/0akK+cWHk+2erI1gnEAgANM3AA=
Date: Mon, 26 Aug 2024 01:56:03 +0000
Message-ID: <e303095c-95c3-45db-ac8b-ff46edb6c806@vivo.com>
References: <20240821024145.3775302-1-yujiaoliang@vivo.com>
 <Zskb-gt8gmridvM9@ashyti-mobl2.lan>
In-Reply-To: <Zskb-gt8gmridvM9@ashyti-mobl2.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4461:EE_|JH0PR06MB7106:EE_
x-ms-office365-filtering-correlation-id: c5bf0e90-f199-4d8d-b47d-08dcc5723e01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dUFma2dkWEpJWlp6WTdFS3NpaDRLRkVuWHpMOHpPMm1CQWsxOFo2Ujc3Z3By?=
 =?utf-8?B?NGJUN3FGaUxjVXFYWkMrL3R4UGVnZW44L2RKMlU0cWVZZGhUYVg1b3ZuaHE2?=
 =?utf-8?B?SzVFQksyY1BpbGpWNjYxK0VTTU9zVUJSeDEzVXQ5QnJFVmN1MmNybERENmE5?=
 =?utf-8?B?NTBHb3JzaVYrY0MzSk5BNnJsTHV6YUJGVXhpUmxzTi9hMlduOXBQVDM3Nzhm?=
 =?utf-8?B?R3lHVFVFSDBIMUhna3VVQ1dVaHdMaDluNmdVUitvaGJiZEw5NHFpcGNiZmxl?=
 =?utf-8?B?MUd1bi9uRDdWTWs5VlQvM2liemU3RVR4Z1BFN0Vkc2ZNOGhqZnFST2lxRktu?=
 =?utf-8?B?UEpSeG1TR0FuS05wWGtBT2NEaG8vckJ3REdKMmlqRnQzbzdaMFM4ZG9tNUIz?=
 =?utf-8?B?M2pYVEFMc3RUcTJmUUpidThEYmp2c045M00zb2ZkcEp3ZjU0TkVRaXVoTStY?=
 =?utf-8?B?Wjkxb1ZnMm1hY1JmTGpOdmxSeHBtckUxVkthblJPSk1iS3FHTmFFWGxzS0s4?=
 =?utf-8?B?V1AydFo1Y0dCZEpLaFhDa1pEUWR1Z1NVckk5SDRIZHEzSlpWbVIzZXFLK3NI?=
 =?utf-8?B?YTV5NnJ3akpPeEZtOFdINHZaUXljSDU0M25LbUQ3UldLbkRiby9pUEhzRTZW?=
 =?utf-8?B?a3R5N3pGZGN2bGxyTFBnekpweFhGZzNva2R0bE1BalUyRXNobmpDYlpVQlFH?=
 =?utf-8?B?OXBxUnBmeFlJOGt1TTNnazkxU2V4Slg4WnZvRER2c3ZaR1M3WUpHSkNkY1lS?=
 =?utf-8?B?UW5WZnR0WXdIc1B1OUZJaUZ1K0xLVmU5eG81N2tYWjhHVjVQQWUrSFdVRk13?=
 =?utf-8?B?bWh5akp3ZDFzUXZPbWlyaUdaNW1Ya3NldlBrZm5BS29ZZWxnaUJjNHFJTXg5?=
 =?utf-8?B?bFRPZ3VkQWdWdXVVc1U2UzhtOVVzUGZaMDJ5MW0yVnluM1kvZFRBTExrOE44?=
 =?utf-8?B?SVI1WG9na2dCVncxbmpOSDhaQmIydXQ4VVN5aE02RlRDSGhvamp4YjBsdjV4?=
 =?utf-8?B?ckpZNVFBbFozV2t3VTdQNkdncXIzR2Y5ZHJKVEE0NDFDZlA1Nm4vL0tWQm5H?=
 =?utf-8?B?bWs4Ui84SGFEV0V3Z2RnaExOZVd4MkU1Z2FXNEx4K3ZWSHhRckwyckRUem9t?=
 =?utf-8?B?OHhOUjdESUd3VjVvQVovcVRDK0VML1puckZKQnEyMWlDaUtwRHBLK3cvM1pT?=
 =?utf-8?B?ajNWenQrSHdCMi9VNThGQ0lGRi9JTlZySzhzZ2RZSUJOb0N3bmk0dDgrSHQz?=
 =?utf-8?B?ME1CUlJuY3hPUURmaFFrV2NsMjhYQjBua2hZQ0ZqRUZ6em5MNDZOSGFNNVJD?=
 =?utf-8?B?aWtreDRUN3BSbStpNzJWZUlHVlhUbU5lL1RqemxPSkFQSmJNL2lDVURGYmpI?=
 =?utf-8?B?cUlwckRRWUYvOU9DV1Z6WFZMUk1sc0tEaWsxOS9WVTZoblBreWdVb2xzRHZI?=
 =?utf-8?B?ak1STU1aMXlIVWEyOGhKSGErRWJmS2VpMkVnSWIwVWJFZVNRU2J3aDhXSlZ1?=
 =?utf-8?B?cko1TVYrY2VzR1BsOTBUS0RPL0lsckthNzFqTUNUQW15N1J0ZldtaDV5V0xN?=
 =?utf-8?B?WStSQnp0dk1EMWl1czRQaTQyRm1uZ280eG9XRTBaTVF5NE4xZmQzbEo2TzZU?=
 =?utf-8?B?cWRHYXJIQnBPRENaWkhOQVRORlp3RjVwZE5TTUdWSGNKZ1p6L1NMNVRPVXll?=
 =?utf-8?B?eUF5akpUZ2liYzQ0aHVKQUplaDNlS0xiMXM2YVVjZ0x4ZFdTVnM3WVpyTlhS?=
 =?utf-8?B?bWJxWHZGR0QxQy94bEhlb2FFdEUvamUyRkdJbDRYelJLSXFjdmZzSDFjNUdP?=
 =?utf-8?B?WHhTMFdycVBieldjYUlrbDZZU0c4dlFXbnpFQk92K1JCNjA3SUs3WUt0QXBp?=
 =?utf-8?B?S1d1TUdPTzFoRWxOOXpYSVdBOHJvSlhDZTJZU2lXclA5emc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjZhRVFWSUFDVVRVT2t2dUFuUUVQMllNSDlpOTFuU3lmTEE5RDhDdVdVSHdv?=
 =?utf-8?B?N3BDaGN4aWZvekV1bDhlYzB0dy9SN1FEN3ZzN3VkNng2Y2c0Z3RlRzA3Vmdz?=
 =?utf-8?B?bkFRTUJFbU5sTzRDWkd1Y1lFZ09UNy9xRlliUE5zYTAzOTFQeWxxRlFIbkpV?=
 =?utf-8?B?aDVIWithSWk1NWNNYkMwaHBtUHhkRjN5UXVDWFdnL1BTU2M4bHVxZElZT1Ra?=
 =?utf-8?B?WFNBMXZMNVErR0h1b25jUW01dHJhS3NCeVRBaHhTS0h0K21PRTNNcE5pUFQ5?=
 =?utf-8?B?YURXOWQxWi9JdEhqbUNTM0NGTkdLTCtNcVAvdndVOC90RDZMRy80TDRzU2dy?=
 =?utf-8?B?ZzkzYTF1M2t4ajVlWitKTlBBcWljdTg2a21EejcveklnT3YzTlFiN0k1YzAy?=
 =?utf-8?B?Q0kwdWF3b3MwaCswVnpZUi9vdHJoNGJyVXBqWHNNZ3EzTGxldWMyRTVTTllo?=
 =?utf-8?B?dGZjdGRXbG5KY25uQ2Nad1V4bWcrTW1DTmkrYUJpdDlvRWF4bzJTRHFPN25X?=
 =?utf-8?B?aDV1Tm5GVGJlVktRUVR3TjdTSHM5ZUpqR1l0bmRaaXlYMkQ1Y3BMTGVmK0Jp?=
 =?utf-8?B?dWNXQ1dIQXpSQnc4M3I4ZENhRldYaWlXQ3ZqVyszWGpoRTNSeGFIS2NxN3F2?=
 =?utf-8?B?dDVWU29VL0ZDOHdJSlVJK2NTd2tXeDRPZW53Q2pLNTRuakRLMmNXWlIwenVL?=
 =?utf-8?B?QWE0TVorcTJBVW56K3hOTjRjdUtmdVVSOGN3VHEvZmROT2xBTFRWR2U5eEZT?=
 =?utf-8?B?bEVVWld1bENJWWtRTlV4TFJ0d2pZOWpTZXpmUm9xZnpRSVlMRHhSd2JCNk9k?=
 =?utf-8?B?bzZDeXh2cTh2WTJyemJHcmdRemFFN2F4RTcvZ2M5eU55bnNiVVJhaXZGc1JI?=
 =?utf-8?B?OHVBa2NacmVpUVQyS0tPQ283V2JFUC9xVmhSb0lhTDMwb25uYUZCSWhpR2lP?=
 =?utf-8?B?bDdHVDJQNllteG9zTnNxWFQ4aVd1dEZ3dXQxTG9Md1BHWHZUcVM3aVRqK1li?=
 =?utf-8?B?ZHlyK0hTWmlEVVc4NlAzdUtNSnQwck1QN0xieFB3MmZZcHhya0JTZ0F4YjZZ?=
 =?utf-8?B?MW5pcmVBVU4wQ3paUnBiZXc0YS9yUnIzRmkvVzdmZ0N0YU9jbGo3aENpblc5?=
 =?utf-8?B?ak1qVDFMVVB6YjIzYzBaZ0NzRVM1cEh3Zm9tSklPODdhRnk4WEtQaThtZnc5?=
 =?utf-8?B?c0x2Qk1ZcVFyYWpQdjFpaTdNK01uMGpLUlpKVTZsWWIyY3dIclliejN5cWh2?=
 =?utf-8?B?VU5Wam50MzZNTSs5bUpVZU9mS2lZd2c1dHF0UTgxRHdhYk90VHhmUEFJejdL?=
 =?utf-8?B?MmJuUEkvQ1RuWlNSSkdaY0hRWU9qWS9YYTF0NzFEbWNKVlFwUVphUTFPeHVG?=
 =?utf-8?B?WFUwb2xlY0pGTkV0b1hMdytpSGJxYlFnRFhiMzVObHU4YkFLTEdTZ1FvMkNT?=
 =?utf-8?B?WmRtWHJMcy85T2g0TGdady90Q2dKSWdqZ2MvYk1XN1FuSkhBdkxrS3QrWnox?=
 =?utf-8?B?dzR6RnVmSm1DK2U0ajZTaC9GSXVoREhyVmVEcGhDUHNGdWlQdEFIdWNKMk9D?=
 =?utf-8?B?TzcxUllHZDhVaUlNM2pGQ050Nnl1VnNMUUMycEJMYWNVcENibngzZElWUlVW?=
 =?utf-8?B?d0IxY3J1S1hCTkFrQkhxRjZzQnFkbUtpRGhTRXdTSEo2T29rWi8wOEJTQ3d1?=
 =?utf-8?B?V1E4S1ZwWHFZalNaOHM4Uk9WQk1tVmQ0UnBTVDJQdFF4VUsvaUdIVjU2bjcx?=
 =?utf-8?B?VDB3NWcyTTRaeEJxMlFHMUJMZkpjZU5OTFh0VlIyMmRGMEVTWHVCdElVa0V0?=
 =?utf-8?B?YWNuMXd4SXl2OGRxQjVDL3FTeW9qS09uRFJTbVJsZVIzUXFQd3IrcWtOVTd4?=
 =?utf-8?B?bkRqVHAyU040UWNzNVV0Y01vVjMwcTVpY1Mva1JuR2xQb0IreXVXZ3VETmtw?=
 =?utf-8?B?RzhNRUVCNGdLcUQvaHlvdXFDMzFmSGJaV2ZLVFR3VHlsNVphTnBpbVVFenJB?=
 =?utf-8?B?Zk0yeUFCVmNrMGFGZlJWWWM3V2trMzJHSGlPVG5hMHV6dUhpNndBdGgzSHY1?=
 =?utf-8?B?NnlQdzV3VDNLM3RBa1A5R2lybWVzZ0hBSmVCQ2tESnFNUlNlQjVXampWdUE1?=
 =?utf-8?Q?0pgM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <637097793C94A3418A1061EE10BE373D@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bf0e90-f199-4d8d-b47d-08dcc5723e01
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 01:56:03.6625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omlyFF51sIrZJR6VhgDCivOLxRvzYWKc2+2duEGFqgszpmdeSuPyhZqZhfoSgt9DrusIKQPQg++JEbdfu7OBGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7106
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

5ZyoIDIwMjQvOC8yNCA3OjMyLCBBbmRpIFNoeXRpIOWGmemBkzoNCj4gW1NvbWUgcGVvcGxlIHdo
byByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYW5kaS5z
aHl0aUBsaW51eC5pbnRlbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBIaSBZdSwN
Cj4NCj4gT24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMTA6NDE6MjdBTSArMDgwMCwgWXUgSmlhb2xp
YW5nIHdyb3RlOg0KPj4gTGV0IHRoZSBrZW1lbWR1cF9hcnJheSgpIHRha2UgY2FyZSBhYm91dCBt
dWx0aXBsaWNhdGlvbiBhbmQgcG9zc2libGUNCj4+IG92ZXJmbG93cy4NCj4+DQo+PiB2MjoNCj4+
IC0gQ2hhbmdlIHN1YmplY3QNCj4+IC0gTGVhdmUgb25lIGJsYW5rIGxpbmUgYmV0d2VlbiB0aGUg
Y29tbWl0IGxvZyBhbmQgdGhlIHRhZyBzZWN0aW9uDQo+PiAtIEZpeCBjb2RlIGFsaWdubWVudCBp
c3N1ZQ0KPj4NCj4+IHYzOg0KPj4gLSBGaXggY29kZSBhbGlnbm1lbnQNCj4+IC0gQXBwbHkgdGhl
IHBhdGNoIG9uIGEgY2xlYW4gZHJtLXRpcA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFl1IEppYW9s
aWFuZyA8eXVqaWFvbGlhbmdAdml2by5jb20+DQo+PiBSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEg
PGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBBbmRpIFNoeXRpIDxhbmRp
LnNoeXRpQGxpbnV4LmludGVsLmNvbT4NCj4gbWVyZ2VkIHRvIGRybS1pbnRlbC1ndC1uZXh0Lg0K
Pg0KPiBUaGFua3MsDQo+IEFuZGkNCg0KSGkgQW5kaSwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmll
dy4NCg0KQmVzdCBSZWdhcmRzLA0KDQpZdQ0KDQo=
