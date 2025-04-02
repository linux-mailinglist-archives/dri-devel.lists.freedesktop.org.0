Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90CA786EB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 05:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E359C10E1AD;
	Wed,  2 Apr 2025 03:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="j+S9XFdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010005.outbound.protection.outlook.com [52.103.43.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E3E10E1AD;
 Wed,  2 Apr 2025 03:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPSuCfW7d9D9xiX0H97M1K8BRNu695NOibL4z9jA9NF75bmS5UBFHrnZv5y0tt1efA8e9n8lPdyarpPKhrqhG7TMRsIvwJIhnLI0pcbOVirt3yuMP6tzqgUbMHxG0CwZWfU6Z/s7HFMC9q5R/QKfaxLy3FEA3+T1cwZaeVLaIRSXuT7mhRXlJbE5p2kOSyn4Ew8dP7I/q8yIaapvmjo9In5jjkDrRI5h4m2q23xgRg7+kU+sZrRthfoSFl7P2IbmqKni1qq0LAXIp7Z8xf8bv5m4ARxJ1GVzx1aliBw/2+KbSQOhvilo3qZWqaRAOoWM7J6YF1N+sf12DOaoR8BUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5DSlYPgsldNmy5f+hFaCohiDZ6kdyNW9G2dba6YO0g=;
 b=s7P3VJ3+4kKtoWXuKRFW+VXvDvZ2qlBvGyhuXNFKvQvfG6ngVPtGR4sf2ls52HV7Q6mWNtUWNCA/NMCPb1XNkk5eA8LpvNApYRkJhD55E0fH+QCtGQgwi6FVU4ZJhr6tfv+iQO37FdcpsDopdgXVMvnBBIgnvkAFhcwOyW3fPVFoifNL15I4k1IxAoSSKMV6B4CQF44hDeNozMpGPJGQoKlQXDJhw6VdE+03UxMOupkL1B01xQxci2fHkrE6sHAq15PTAxZWujYyxmaBPxv/X5mIefkWrK+IitznYzKcoPNXNs6+IRO0BHp2XJLMifgxKZTqodx4gNfxYW5DfWoyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5DSlYPgsldNmy5f+hFaCohiDZ6kdyNW9G2dba6YO0g=;
 b=j+S9XFdIdHsTxrFh+N70FUefQC6ToP26YL6ByhOUAgwgtnMMZJBJ3BeJMqc1eKHp46t9G1bUI5oeF3H95lKE+Xw+SpqNrZ6q/d/gL05lNBn06/Npvtxv0h89rMV0JNmqiZKQdXuLYWYs2Wb+Rjoj+Qn2l3MnATSe9az474esaWeznaWTRva735iBYvCFLmm6ZLPGYYyRE8kLqjkqfuqau4n9zdR6RakKnRG71GdKFtS5RcJfk3Qb8smiyAg4xoL2cKNpAR6t9tv1kl7wsiRXJf4+TUIoKF4iZ1zKknZq0f4KsLC7k0NEUfuLXMZ3jG/CeXYe3fmBX8/T2vcID2tYNg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS9PR01MB14000.jpnprd01.prod.outlook.com (2603:1096:604:35f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 03:47:16 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Wed, 2 Apr 2025
 03:47:16 +0000
From: Qu Shengyu <wiagn233@outlook.com>
To: Harry Wentland <harry.wentland@amd.com>
CC: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel.daenzer@mailbox.org>, Alex Hung
 <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "mwen@igalia.com"
 <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "aleixpol@kde.org" <aleixpol@kde.org>, "xaver.hugl@gmail.com"
 <xaver.hugl@gmail.com>, "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "uma.shankar@intel.com"
 <uma.shankar@intel.com>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>, 
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
Thread-Topic: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
Thread-Index: AQHboVZEHMrXB6A5AUm+M+mIXGw7QrOLpIoAgAGrQoCAABTGAIAABoAAgAABuoCAAAPWAIAAAUsAgAAA34CAAASXgIAAA+eAgAAKgwCAARAWAIAAK6QAgAAbmwCAABp6AIAAQtSAgACGvGs=
Date: Wed, 2 Apr 2025 03:47:16 +0000
Message-ID: <TYCPR01MB8437977717EECB07F679C08E98AF2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
 <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <fd0440ba-1a34-4cad-9e89-701dec7673b4@mailbox.org>
 <TYCPR01MB84373F182FECD129EEB3FF3898AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <202160dc-4b1b-4a3e-8cbe-3b0406fa38df@amd.com>
In-Reply-To: <202160dc-4b1b-4a3e-8cbe-3b0406fa38df@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB8437:EE_|OS9PR01MB14000:EE_
x-ms-office365-filtering-correlation-id: eba5552d-6c94-430e-ac8f-08dd71990f90
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|461199028|6072599003|8060799006|7092599003|8062599003|19110799003|1602099012|440099028|10035399004|4302099013|3412199025|102099032|1710799026;
x-microsoft-antispam-message-info: =?utf-8?B?N2NnOHczdDJJUTMxZUFsM3hpTDMwekYzcXA4Q1lpTzI2RjkyY2JVcVV1ZUdh?=
 =?utf-8?B?UmNLTTYrYnB2MlprQTI3aUZUQ09NN1VPR3dTdkJmRm5JUGxCREY3WkpMQTd6?=
 =?utf-8?B?U21RVzFSTkFWVmtUeTZzVldDc2lBazg1a2xqakppU0prVnJBYllCTkNCckNw?=
 =?utf-8?B?K2JSMUxIUEVUcVgrYUJvODQvRFk5aHFWTDIwNVdLZlVtSFZzZlpHUUtmd3pM?=
 =?utf-8?B?V2VqMm9OdGxVZlI3MjJCWVp0bFV1a0dqVkNEU3RVU2crUmQ4M25hTk1aaHpz?=
 =?utf-8?B?VERKdTlNWUtQU2VRbExVUXl3QWVablg2VC9TQzc1WGh4Wlp5R0xJRjROV1NT?=
 =?utf-8?B?ZTVTWnBTKzFTbEZiOG85Mk0ycVNYb2xuZmVpSjkzdU42Nlh3N2FHUkd4alhV?=
 =?utf-8?B?a1RMMGtEM1FQTGJWNGJIK210dnFsZVh5MDBCZERwZ0wzWERXcHZhQXFGVVpm?=
 =?utf-8?B?MmFGWmlFVGkzdzc0R3daU2ZPZCtEeFVvd2VRNFlac3dieWxPWG0vZDBHbWgy?=
 =?utf-8?B?cGdFOFpiOVUvUjFNMlBjT09mUmdJZDgrOEZBbyt2OTdESTdlUDdKaEw0T2ZC?=
 =?utf-8?B?Smw0c0JJUmxRV3QzcFlXZ1pjazlZYVdWUFVGM2FmbHZEL3h5OXM1b09KK05K?=
 =?utf-8?B?cGIrK1ViYmpmdlQ5L01jT2swUUh0MG1HMFUvYzBIcTNEdENoZ3hLY2ZBVFZS?=
 =?utf-8?B?OEtlTUZCYis3dWZQR2prZTZYVkJ0dm5RNURhdnl4YlFtdWhadVl4TEtJWjRt?=
 =?utf-8?B?dmRyNG5kU1hTRGlyRFlKWVNXdjUycUp3TUJDSWxzRU5VN0VMemF2MlRSMEtI?=
 =?utf-8?B?UUlaTkRpd0ozSW16QnZsTk5EUGFQWW1xaVlzSEgrTk1ZaGhHUXRpSnlwWTB2?=
 =?utf-8?B?Z1hhcVA0NENxTDI1a1l6TkV6Q3UvTHZoZ0dUMHBTTzlOaHluRVNFMUo4K2Nt?=
 =?utf-8?B?RDVqREc3d2k1Smg5WjMvenl1RHFJeHdacXhtVEtRZjdZTi9LSkdjcUU1K1Qz?=
 =?utf-8?B?MXNIOHZtc2NJUEs2VXhUM3VXWDY3UjErdytmdkxvV2xRZ3RsaDJaMXdXTG5x?=
 =?utf-8?B?T2N0akZTU1B1Qlhnb1prNWNvTTQwVm85VE1DU0xzNHBqK05MdGFiYkp1SkNK?=
 =?utf-8?B?UE9VbGFlY0s4dTBoT2IrTDZMejBQZXdHRGExbDJjZldSREhicGd0dnFqdU0r?=
 =?utf-8?B?VlFjYlN0bE1rV3Y0M3pKb2g5VmlFYXhtcnpTMzNsaFpRdjVOYVVmaGhLdzJJ?=
 =?utf-8?B?cDRsdE1TdmhNMmR2dURMVUR6NUlXWkJ2NDVuTlVCbXRacjE4V28xczJhSEYy?=
 =?utf-8?B?TjRUaXRETGlGN0hPclAvWmdtbmd6OTRYcXMxa0dRblU1citKU25ocUlGZVU2?=
 =?utf-8?B?c1ZQM3IyTGVla2ZiaGh6b3VESVNmbFpVclZBeUtXNUNOQ0VGNUFPU3FVeHZ4?=
 =?utf-8?B?NzdzYVpwZHl6OEFBSGFXOVVkL0ZLNWd1NER1Nkd5MXBXSEhhdGFGc2I1a0Vz?=
 =?utf-8?B?bW1UZUt6RUlhUzljNkQ4TXFBbzVrUEtkMkI2dWVIMzBFd2Y2R3VCYVdWL2x2?=
 =?utf-8?B?VUFadGs1bFNvQnM3dHFPNVY3Qk5XTnVYTE9iN3d1YTZIUE9JalBWVDB5L09n?=
 =?utf-8?B?Sm9SV0h5ZFVpU2VzVFZiWDNGSzhNU3hWTDg5TExsT1ZXNW4welRzWGJvdUFQ?=
 =?utf-8?B?NjFBRUdneFo5Sm9kZGc4MTkyQVVaTWxOR0UvaFBGRlVaTStYbTdld0hRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3F0VlRMd1A2WUh0K2dhM3ZwQ1lXOGxiamlORU9HdkdoS3dqLzJiNi9HOGtT?=
 =?utf-8?B?OFNnZnlQWXdXWldBZEJjVG9FR2dKZC9XL0xudC81RWw2YWlFMU84bnZrRUtR?=
 =?utf-8?B?WEJBbXpKRmF4cUIrNHozR0grOUFXRHhtWGh6enRHT3UwZUxWSUNVQlVkWlE4?=
 =?utf-8?B?R1pEa2Z4Q0RwdmJYK2FYei9EMWgvUmM5WU5vV1JxNXpOWWs5eSt4dDJLS0JX?=
 =?utf-8?B?djVwRWVmbmZBSmRhdlRnMG41QUhTdmVSRU1DWUZTUHRjVnhpTC92T2gyOTZn?=
 =?utf-8?B?ay9nQ0ZJaHdTZWJhRTB4ZUM3SXFZRmZFKzhOV3dVUnpqclF0LytiRy9lSS9n?=
 =?utf-8?B?NXkvN1drazR0WEVxcllhallWdHRvSm41Z2ZQaFBxWWNLNnBZVVFoR2VHbTRX?=
 =?utf-8?B?bEljSlpsOXZzUXVqUXVIVU9zR2UvTVozZVBaeGF2MlBTci9hV050dDVQbXBp?=
 =?utf-8?B?YzYyL1pDMjJueEpTWHFIdXZ4M1RTRTVsQmhaS1FQdHlLKzN2VDZCM2lGTkpT?=
 =?utf-8?B?d1E4KzJqQVBjMDdrQzNvVnI2NUR2OUt5N2k1SWlyWkM4VWJkcWdLMG8xdUxY?=
 =?utf-8?B?WFJicHZsYTJhZ0NnclJJeXZjcGpKU2VMZXIvTmRzckNSMVNRSkJPMGM5dWVG?=
 =?utf-8?B?Q05Ub0RmRjFVRjZZT0lMckZ4NmxFajltaGd3bEozTkEzMXZOa2FiWFJZT3Vo?=
 =?utf-8?B?Y1Q0bzJrVkRBWGNIK1hUSGViTzRkOXpCcW5vaTJpbjMzODNJNjFhOTEzNVpK?=
 =?utf-8?B?aWFMOUJxRTAzeTRQU0R4dlUxK0JtVVgreHQ5cDNhRHRDbGh5YXc1YXVyN1RN?=
 =?utf-8?B?VUVhbVBZYVZzeGxOUkQ2bk8xTDBlWE9ZU0hnVG1HYlNrZXNkNE1rSE1vRm1j?=
 =?utf-8?B?cGJOaEM5YWJtNzE4TUYwcTZ5TjJkMjQ4K1BYN093YWdJZmM3RG5maElWYnNT?=
 =?utf-8?B?V2ZnZXErbDNCYzRMTWYrUDQzWFFFWktSZ1F3eTdVajJzTzliSXBwU3EwS1dJ?=
 =?utf-8?B?Q3hXTExGMXpGQTRxY2pveTRuQm9qYTJmMlpiZExoeDMyb2pKdU5rY3JCVDFF?=
 =?utf-8?B?My8rVC9JUmxtQ0gxSndKbHB4UW9BbzFxc2t5akZhUFpjREIyNEp1MWt4YWpu?=
 =?utf-8?B?VWYvYzBDcWNQaEVra3RaU2tBNlorcGQxQTlqMUc2MVFKejdrT0FVTHhZSXI0?=
 =?utf-8?B?cnlQZHdNWTVLeXljNTRaUHp4b3NlUmwxMmptY1RFeWhGNVJhN2U0R2Foa01q?=
 =?utf-8?B?SDB4dys4Z3B4Zlk2S3VxZEdLSWFlU2l2UzI1SGtuOTJUN3ZtZHdwT2VBeWlB?=
 =?utf-8?B?eWlOUktFWkJqMVBaVjNTelV0ODVYQWhtR1JvU1kvNk1icjhYUGxzbnFidm9H?=
 =?utf-8?B?ZVpNMnBDcWZWRVpNRGZFVHpXYU1CYU9tVGNXMCs2aUJxditGdGNOR0hnZ0VY?=
 =?utf-8?B?VndmdzZnMVhBdVFCQTFPV0wyTmNDZ0lrbUg3bEtBakpHaU16M0lDcmhHVXdQ?=
 =?utf-8?B?Wmo5K21oTG9zUVJWaXhzQ2kyd1hZOEtoajdjSnZMZHhmdk82cXRNOER0SUpl?=
 =?utf-8?B?RFRmZS9FZ1RxNGVVcmNEL3h5MnJsZEZWMFNuWWpDM0xXWk9uY1lLb3hNbHBM?=
 =?utf-8?Q?ZsdkPpSNIUenZs3nO0MN/SOTQUQdOuAUbYr0lbtMjFU0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eba5552d-6c94-430e-ac8f-08dd71990f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 03:47:16.1402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14000
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

SGksDQoNClRoYW5rcyBmb3IgcmVwbHkuIEl0IHNvbHZlcyBteSBxdWVzdGlvbi4gU2VlbXMgaXTi
gJlzIG5vdCBjbGVhcmx5IGRlc2NyaWJlZCBpbiB0aGUgZG9jdW1lbnQuIE1heWJlIHlvdSBjYW4g
YWRkIG1vcmUgaW5mb3JtYXRpb24gdG8gZG9jdW1lbnRhdGlvbiBpbiBuZXh0IHZlcnNpb24gb2Yg
cGF0Y2g/DQoNCg0KPiDlnKggMjAyNeW5tDTmnIgy5pel77yMMDM6NDXvvIxIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4g5YaZ6YGT77yaDQo+IO+7vw0KPiANCj4gT24gMjAy
NS0wNC0wMSAxMTo0NSwgU2hlbmd5dSBRdSB3cm90ZToNCj4+IA0KPj4gDQo+PiDlnKggMjAyNS80
LzEgMjI6MTEsIE1pY2hlbCBEw6RuemVyIOWGmemBkzoNCj4+PiBPbiAyMDI1LTA0LTAxIDE0OjMy
LCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4+PiDlnKggMjAyNS80LzEgMTc6NTYsIE1pY2hlbCBEw6Ru
emVyIOWGmemBkzoNCj4+Pj4+IE9uIDIwMjUtMDMtMzEgMTk6NDIsIEFsZXggSHVuZyB3cm90ZToN
Cj4+Pj4+PiBPbiAzLzMxLzI1IDExOjA0LCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4+Pj4+PiBPciB3
ZSBjYW4gYWRkIHNvbWUga2luZCBvZiAibGlua2VkIHdpdGgiIGluZm8gdG8gcGxhbmUncyBDT0xP
Ul9QSVBFTElORSBwcm9wZXJ0eSwgdG8gbGV0IHVzZXJzcGFjZSBrbm93IHRoYXQgY3Vyc29yIHBs
YW5lIGFuZCBiYWNrZ3JvdW5kIHBsYW5lIHNoYXJlIHRoZSBzYW1lIGNvbG9yb3AgY29uZmlnLiBT
byB0aGF0IHVzZXJzcGFjZSBjb3VsZCBkbyBleHRyYSBjb252ZXJzaW9uIG9uIGN1cnNvciBpbWFn
ZSBkYXRhIHRvIGF2b2lkIGRpc3BsYXkgd3JvbmcgY3Vyc29yIGNvbG9yLg0KPj4+Pj4+IFRoYXQn
cyBvdmVyLWNvbXBsaWNhdGUgYW5kIG1ha2VzIGxpdHRsZSBzZW5zZSBmb3IgYm90aCBkZXZpY2Ug
ZHJpdmVycyBhbmQgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucy4NCj4+Pj4+PiBJZiBhbnkgcGxhbmVz
IHNoYXJlIHNhbWUgY29sb3JvcCBjb25maWcsIGEgZGV2aWNlIGRyaXZlciBleHBvc2VzIHRoZSBz
YW1lIGNvbG9yIHBpcGVsaW5lIHdpdGggdGhlIHNhbWUgY29sb3JvcHMuDQo+Pj4+Pj4gSWYgYSBw
bGFuZSBkb2VzIG5vdCBzdXBwb3J0IGNvbG9yIHBpcGVsaW5lIG9yIGEgZHJpdmVyIGRvZXNuJ3Qg
d2FudCB0byBzdXBwb3J0IGl0LCB0aGVyZSBpcyBubyBjb2xvciBwaXBlbGluZSBhbmQgbm8gY29s
b3Igb2JqZWN0cy4NCj4+Pj4+IEkgc3VzcGVjdCB1c2luZyB0aGUgY3Vyc29yIHBsYW5lIGlzIGdl
bmVyYWxseSBoaWdoZXIgcHJpb3JpdHkgZm9yIFdheWxhbmQgY29tcG9zaXRvcnMgdGhhbiB1c2lu
ZyBvdmVybGF5IHBsYW5lcywgYmVjYXVzZSB0aGUgZm9ybWVyIGlzIGNyaXRpY2FsIGZvciBhIHJl
c3BvbnNpdmUgdXNlciBleHBlcmllbmNlLg0KPj4+Pj4gVGhpcyByZXF1aXJlcyB0aGF0IHRoZSBh
bWRncHUgREMgZHJpdmVyIGJhY2tzIHRoZSBjdXJzb3IgcGxhbmUgd2l0aCBhIGRlZGljYXRlZCBI
VyBwbGFuZSB0aG91Z2ggKGFzIGl0J3MgYWxyZWFkeSBkb2luZyBpbiBzb21lIGNhc2VzKSwgdG8g
ZWl0aGVyIGZ1bGx5IHN1cHBvcnQgY29sb3IgcGlwZWxpbmVzIGZvciB0aGUgY3Vyc29yIHBsYW5l
LCBvciBhdCBsZWFzdCBwcm92aWRlIHByb3BlciAibm8gY29sb3IgcGlwZWxpbmUiIGJlaGF2aW91
ciBmb3IgaXQuIExldHRpbmcgdGhlIGVmZmVjdGl2ZSBiZWhhdmlvdXIgYmUgZGV0ZXJtaW5lZCBi
eSB0aGUgb3RoZXIgcGxhbmVzIHdoaWNoIGhhcHBlbiB0byBiZSBiZWhpbmQgdGhlIGN1cnNvciBw
bGFuZSBpc24ndCB1c2FibGUgZm9yIFdheWxhbmQgY29tcG9zaXRvcnMuDQo+Pj4+IEN1cnJlbnQg
YmVoYXZpb3IgaXMganVzdCBkaXNhYmxlIGNvbG9yb3AgZm9yIGJvdGggYmFja2dyb3VuZCBwbGFu
ZSBhbmQgY3Vyc29yIHBsYW5lLg0KPj4+IEFyZSB5b3Ugc2F5aW5nIHRoZSBjb2xvciBwaXBlbGlu
ZSBpcyBpbXBsaWNpdGx5IGRpc2FibGVkIGZvciBhbnkgS01TIHBsYW5lcyB3aGljaCBoYXBwZW4g
dG8gYmUgb3ZlcmxhcHBlZCBieSB0aGUgY3Vyc29yIHBsYW5lPw0KPj4gQWNjb3JkaW5nIHRvIHRo
aXMgbWFpbCwgSSB0aGluayBzbyh1bmxlc3MgSSBtaXN0b29rIGFib3V0IHRoZSBtZWFuaW5nIGFn
YWluKToNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngv
MjAyNS1BcHJpbC8xMjIyNTcuaHRtbA0KPiANCj4gTm8sIHRoYXQncyBub3Qgd2hhdCB0aGlzIGlz
IHNheWluZy4NCj4gDQo+IFdoYXQgdGhpcyBzYXlzIGlzIHRoYXQgd2hlbiBhIGNvbXBvc2l0b3Ig
dHJpZXMgdG8gZW5hYmxlDQo+IGFuIGNvbG9yIHBpcGVsaW5lIG9uIGEgcGxhbmUgb24gQU1EIEhX
IGFuZCBhIGN1cnNvciBvbg0KPiB0b3Agb2YgdGhhdCBwbGFuZSB0aGUgZHJpdmVyIHdpbGwgcmVq
ZWN0IHRoYXQgY29tbWl0Lg0KPiANCj4gQSBjb21wb3NpdG9yIGNhbiB0aGVuIGVpdGhlciBub3Qg
c2V0IGEgY29sb3IgcGlwZWxpbmUsDQo+IG9yIG5vdCBzZXQgdGhlIGN1cnNvciBwbGFuZS4NCj4g
DQo+IFRoZXJlJ3Mgbm8gImltcGxpY2l0IGRpc2FibGluZyIgZ29pbmcgb24uIEV2ZXJ5dGhpbmcg
aXMNCj4gZXhwbGljaXQuDQo+IA0KPiBJJ20gaGF2aW5nIGEgaGFyZCB0aW1lIHRyeWluZyB0byB1
bmRlcnN0YW5kIHdoZXJlIHlvdXINCj4gcXVlc3Rpb25zIGFyZSBjb21pbmcgZnJvbS4gQXJlIHlv
dSBpbXBsZW1lbnRpbmcgYSBjb21wb3NpdG9yPw0KPiBBcmUgeW91IHRyeWluZyB0byBidWlsZCBh
IHBvd2VyLWVmZmljaWVudCBzeXN0ZW0gdXNpbmcgQU1EDQo+IEhXPyBTb21ldGhpbmcgZWxzZT8g
SWYgeW91IGNvdWxkIGV4cGFuZCBvbiB0aGF0IGl0IG1pZ2h0IGhlbHANCj4gdXMgYW5zd2VyIHRo
ZW0gYmV0dGVyLg0KVGhlIHF1ZXN0aW9uIGJhc2ljYWxseSBjb21lcyBmcm9tIEkgaG9wZSB0aGF0
IGFsbCBwbGFuZXMoaW5jbHVkaW5nIGN1cnNvcuKAmXMgcGFyZW50IHBsYW5lKWNvdWxkIHVzZSBo
dyBjb2xvcm9wIHRvIHJlZHVjZSBwb3dlciBjb25zdW1wdGlvbi4gQnV0IGN1cnJlbnQgY29kZSBp
bXBsZW1lbnRhdGlvbiB3b27igJl0IHN1cHBvcnQgYXBwbHlpbmcgY29sb3JvcCB0byBjdXJzb3Li
gJlzIHBhcmVudCBwbGFuZS4NCg0KVGhhdCDigJxsaW5rZWQgd2l0aOKAnSBJIG1lbnRpb25lZCBp
biBwcmV2aW91cyBlbWFpbCBpcyBhIHRyeSB0byBjb21lIHVwIHdpdGggYSBzb2x1dGlvbiBmb3Ig
dGhpcyBpc3N1ZS4NCg0KQmVzdCByZWdhcmRzLA0KU2hlbmd5dSANCg0KPiANCj4gSGFycnkNCj4g
DQo+Pj4gVGhhdCBzb3VuZHMgbGlrZSBhIG5vIGdvLg0KPj4+PiBJJ20gbm90IHN1cmUgaG93IG11
Y2ggcGxhbmVzIGRvZXMgdGhlIGhhcmR3YXJlIHN1cHBvcnQsIGJ1dCBpZiB0aGVyZSBhcmUgdG9v
IGxlc3MgcGxhbmVzIHRvIHVzZSwgbWF5YmUgd2Ugc3RpbGwgbmVlZCB0byBtYWtlIHVzZSBvZiB0
aGUgY3Vyc29yIGJhY2tncm91bmQgcGxhbmUgaW4gdGhlIGNvbXBvc2l0b3IuDQo+Pj4gSWYgdGhl
IEhXIGhhcyB0b28gZmV3IHBsYW5lcyB0byBhbGxvdyBib3RoIHRoZSBjdXJzb3IgJiBvdmVybGF5
IHBsYW5lcyB0byB3b3JrIGNvcnJlY3RseSAocmVnYXJkbGVzcyBvZiB0aGVpciBkaW1lbnNpb25z
KSwgdGhlIGRyaXZlciBzaG91bGQgbm90IGFsbG93IGVuYWJsaW5nIGJvdGgga2luZHMgb2YgcGxh
bmVzIGF0IHRoZSBzYW1lIHRpbWUuDQo=
