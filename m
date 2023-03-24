Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084946C85EA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7729A10EC53;
	Fri, 24 Mar 2023 19:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2C88A27;
 Fri, 24 Mar 2023 19:25:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8KpV9QjvNArHMOXn2kkIXETCKTW5BBp5tU/n9xReDsTv7uHvDAVAMKlH0S6MX/gY0x8zonZb+s2VbH3rtrsyU8nxWpmcKM3dKPkl8g8rXMf17e3WcPgErWM5tN2hnSq0i6YScco7ujAan29B1xd0bom4S0SIQwlu8LY+yan6Ga6bPq3Efl5w3XvDlWG63ThHhXJlACOEMcd+a0JhK09b2KDt2BzX9UpR5el3t5QTzijFlATrvlxtqAETOkFX34QEx7IlcNUt3yVrhPElnrkeIriJXDgQGqJ3BIZ4UmYBtP3f75Bz6E4LIuGqR2nzsbZUf40v3BNSeshpUF4iUnX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EKIVd+h8HtdUFsJ38ceRwncuBb2rGnSdSnUtGLsIB0=;
 b=P8ONFWGwkKA/6dcgqj/9odh/Vv2eqiZC6NWosWUnBE5c3WANRAD81OF7fO7d8QAi4kYW1rkrL/MDUFjvL/jAHcQmrVHiFceAK2EzBaPvOrQXMjCuIG037sHFRKql8Ft9MRlL+e3HkW4Kd4kC8MDAM/k7saTwSMT+W6nN8CvylrdSYP+VpjEMFluZ+UEm0YmSJRWGl36RS/ze6KLbk2OI0q9c0qkZICZpQZhbKNtqH5m05LJUphuSASkL+ABnBOwNQZRfZRuTSaRF7OWUHRWg6ixF3J0gED2MlEwnUp1KemqdH3bQhPXGqTEiYNXaNyDX3vh2i9CAsUSg3N+9dA47LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EKIVd+h8HtdUFsJ38ceRwncuBb2rGnSdSnUtGLsIB0=;
 b=KYzHjjivOuD0P/UER/vjbz80D7E9DBMOT9JclGLAY2+VESLKYf3ILkuETrvn32PrG2V1LMW2vY1UlriWf0qa0GLHxmgAcwhkNFG1b5clo/DxlXo9YZ8ImDRkMY62sWLdFHmJRiALJM0RZShgZv/gQzkZybLPb9WGsc1p5Hn+js4=
Received: from DM5PR12MB1899.namprd12.prod.outlook.com (2603:10b6:3:113::21)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 19:25:48 +0000
Received: from DM5PR12MB1899.namprd12.prod.outlook.com
 ([fe80::a819:97aa:d313:274e]) by DM5PR12MB1899.namprd12.prod.outlook.com
 ([fe80::a819:97aa:d313:274e%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 19:25:48 +0000
From: "Clark, Felipe" <Felipe.Clark@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Thread-Topic: [PATCH] drm/display: Add missing OLED Vesa brightnesses
 definitions
Thread-Index: AQHZXNgmD7+dfhPMoECf47qbaCoQa68HFukAgAGcr9CAAYAfAA==
Date: Fri, 24 Mar 2023 19:25:48 +0000
Message-ID: <DM5PR12MB18994440B843F280891508F797849@DM5PR12MB1899.namprd12.prod.outlook.com>
References: <20230322160513.1438881-1-Rodrigo.Siqueira@amd.com>
 <7cf3ae87-9d7e-a846-89c6-d267ca76472a@amd.com>
 <DM5PR12MB189979B9FCBC8EC57F23B63997879@DM5PR12MB1899.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB189979B9FCBC8EC57F23B63997879@DM5PR12MB1899.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=88347bde-6d37-49e4-93b0-f49d3aba537d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-23T18:38:20Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB1899:EE_|SJ2PR12MB8720:EE_
x-ms-office365-filtering-correlation-id: 48170a29-212e-4e10-075c-08db2c9d92c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNp4iltxQX/CM+Q+ZPiQqx/uXetERnog+SaEacrJ68/5fH8JDhqcZriaE9YCQZe/WuPiNH9eSBaaiv9yAf92YR/jsMFN9RYNY8NxG7wStPIuD/A5wAJL3NE2sJQfhUHt0Je3i4IGijLAQID5mHfEi++dGM3xD0rqUGhyR3rjtsyhyo6hYu+U8aFVp0vOucMDEAB1NgHtkeaKxDmnmH0kqTlbEC+sp5UID+2Qw6UySVGLMFO57gwUSYoZKjg3JygkOanjvYLLZezG4z7V53AYG1N0mYgITq+ZOyTuGD9CjItY1mzNodLmuV5vqqTj/tOuEqJR+8U4LN9im0YtybbcrBMKAu6V3+KfZVsncN6SvCAJw/Xw8QeC390Bbe1chfmZzmvNl/UQKbQgrd4tbp4XJJWx6kCMSMqsxiNN/BEwZsxa2NWTsZpTCysNTU8W+zrbleHt5XAmLQy+rIJKRDimgsT06PwQ2y8+OghND08F4Z6M/4DaXyYVv1/+vkif5wYjnDJ7vrOP3LS9naVK82kdQ0+Gr1aIRvzTjEyKAXsj75BGfN8sRLoeW8koZZAA08PfazoFZujHT72Gwe3jdobexfH8kedjy9hsvrzzE52GTF/zNfR/0on81QnR4Aqj9SyRO+GXrQ5bPTD6djMw5CEJkewG0T6eTg5nOlw5ogbAYNu5Yd2ObgZ++qs8RgOtk23HyHA59my1SRMhNKOtSCkj3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1899.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(71200400001)(54906003)(122000001)(110136005)(66556008)(5660300002)(2906002)(316002)(7696005)(478600001)(38070700005)(86362001)(38100700002)(66476007)(186003)(83380400001)(26005)(52536014)(66946007)(8936002)(4326008)(76116006)(8676002)(41300700001)(33656002)(9686003)(66446008)(6506007)(53546011)(64756008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG9LaUJ6YUo0Q1RTM0MxdWFiVDFZdEUwQk9qN29MTi9jbC9IL1dPZUFIVWw3?=
 =?utf-8?B?c2FYVXpCV0YzRFlvQTR0YkxpZGZzdURZM2dSbktydjRNVTREZGlMVDlFK3hG?=
 =?utf-8?B?MTVWWDFoNHBhenlKMFN5SGZ4RkdJcytESjJSajRHME52UjBXWjVQakhHU0lr?=
 =?utf-8?B?L2JISkF0QlhjL2JzYkc5dkt6NCtYWnZxTmFmemJFQm02QkVuWHJ3Y3pKaDM3?=
 =?utf-8?B?TlRNckdsYzc1cU55VHZzNkE4ZW5acUEyVWkxUTV3c2JhejdtUFZJSkpCZ29r?=
 =?utf-8?B?QjFERlUwWWNJWHpVd3pNd09oTzVLeDhCdGhxRFdYaEtxVDBUNDJKZGd4ZDdO?=
 =?utf-8?B?Z0FvckVHNU95dENsTWpuajdCZ0pGVWxkTmgwRmhDYXJjQzNxN2toUklzaFBE?=
 =?utf-8?B?OVVvMStBTUtJUkNOZnBvS241YmszQnRLVkMrYkxrN2VmOUFma0haWjVYU0xq?=
 =?utf-8?B?a2FyL3NabXRMeWNnZ2JGbmRxb0V2V2ZSTmVqdko5Q2pra1d5SlhkRzNYaXla?=
 =?utf-8?B?RUJRMkQyemJjTWY0MldiempjaFk4OFVTUGFMcE9kNDh1TlpSaEFYNDcvR1py?=
 =?utf-8?B?dGF5SGlxNWFsMTRTK05YUXhnN1RYUC9DVlJhdTVGMERubTlTV3dNSytrdHd4?=
 =?utf-8?B?dkpib2RwaE8vTmdJYXcydTZXVFF6Nk1ucUE0K3JXOWZmVGJxL2ZrL0JVSjZo?=
 =?utf-8?B?Y3llR3Fuc3BTTzlJT1dBaEtmQ2hoNlBieUc3NmRoemVsMGFBTzlhUThPZVQ2?=
 =?utf-8?B?eDdkckNiTEgwcUxBZlBCdS9saVdVQ3VRRWl3djdCTkJld0hXWHpYWllXR2RB?=
 =?utf-8?B?TllpVmh6THZscHJ4YW5Ub0RwQW92SDZUWUVkK05lbGdMOUE1ZU55SjYwSzNR?=
 =?utf-8?B?ZDgrdm1yWUZHMng1SnNndUlKRUtvZlNNT1A1S3o1NU0wTDlURFNRR0NzdkF0?=
 =?utf-8?B?OFQvT2xpUDdqUzA0cExJcTZDZElQam9wNnF1dkplWm9QN0RLVkdEakVmU04w?=
 =?utf-8?B?cEVFRUFEN0RDZ09hMmppYkJpVVdXR01vZGtJNU00Q093MkNkeSsxTUtiYlV5?=
 =?utf-8?B?KzBPSmZyU2gvQ0dPZW8xRDRjc2ZjLzR0Skh0WEp3YXU2THg2V3Y4L3BoWHZI?=
 =?utf-8?B?TDQyalFuakwwWlZsRmhDQTJnR0c3SEUxNzAxRFlma2ZlNHQ0VWFKQ3lEVng0?=
 =?utf-8?B?enp5T2lsS2lmUmdQbStzTnZBcUgzSUdZWkJ1ODlhelFvUThyYWE0ajVGVG9v?=
 =?utf-8?B?RHpSNkU2Z2crcW1XeG9DRndwTEJEN1hreE9LKzIvU1lFemRFRFowZi9NMERh?=
 =?utf-8?B?Mk5DNy9XalpOa2I5NDcvcm1raVJ0MHBUZzZOaEZxcHhOWHNOY3cxeGtWNFJm?=
 =?utf-8?B?UHBzdEYyVWwwR01oQjBEWE1iZ1ZTeGtUdytLKzdkclJTQlEyY3lNVkhkQ2xB?=
 =?utf-8?B?WW95UkcwcWxpUDIvUmRFeWRNZGMxczFVR2UvUnVRWkgrdE9FQ3pEV2h2WHFH?=
 =?utf-8?B?Mkl2WjJHVUw3K1VVeldsUFhIdUNzQ09SSVR2MjJwelpjcnlWc1kvOGwvN0s0?=
 =?utf-8?B?dzVDTzgzMHZNQk5sMkpBT20vSVB2Wk9iTVpRV2szQkxaYXVDZURZQ2hRdno4?=
 =?utf-8?B?L0h6cFZ1VForYmJld3FKaUppbmNTL1hyTGNDR0huVENqRXZLZVIwUWRvQlNW?=
 =?utf-8?B?TzVoem1WZmNkbE8vUGtwV0tyb0dUL3Z0UVVPZEdPV2VLbGZwbi9DRWdjNHFV?=
 =?utf-8?B?Y21RUGIyRW5vUWNVOXh6aXFiaWtGdUozY0x4QS9LV1k4L29wZm1TYXhmbWwr?=
 =?utf-8?B?dFBGTzVyczNRK1N3K1A0QmJtcTBSZmlVRExuUXpqVlJEZ1FKcHpvRkU1Mkpy?=
 =?utf-8?B?ZUoycStOSUljUjN3THpCU29BV0ZZcEhuVWtneks2RTJxS0NZQng0T2JVNk1i?=
 =?utf-8?B?bTh3MFJWbG51WHVray9mbWNXTUhxV3l1VHBZdS9pMDhrdW0wT2xwaXJBUm5J?=
 =?utf-8?B?WXFIR084QzVSQm1vYTB6QTAyWkozeHVVdHlDSTF1WFZTeE9MN0lxY2UwbkMr?=
 =?utf-8?B?OElIc3ZUY0ZZL09LZTVlZEtPblRiL3hDMzI1WlFXMFN2aFlRSEtNRUFIT0N4?=
 =?utf-8?Q?LDv4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1899.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48170a29-212e-4e10-075c-08db2c9d92c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 19:25:48.6905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XESTBHaaf+pX8sMvhj26ygmfnIBJZYubrQoUVNM2yIhZgROT2coOm3OGExe5XyuFOuYuAfeAKYyXROoFRrrw/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Koo,
 Anthony" <Anthony.Koo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Nagulendran,
 Iswara" <Iswara.Nagulendran@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIFJvZHJpZ28gYW5kIEhhcnJ5
LA0KVGhlcmUgd2FzIGEgdHlwbyBpbiB0aGUgdGhpcmQgbGluZSBvZiB0aGUgcHNldWRvLXBhdGNo
IEkgd3JvdGUgaW4gdGhlIHByZXZpb3VzIGVtYWlsLiBIZXJlIGlzIHRoZSBmaXhlZCB2ZXJzaW9u
Og0KDQojZGVmaW5lIERQX0VEUF9HRU5FUkFMX0NBUF8yICAgIDB4NzAzDQogIyBkZWZpbmUgRFBf
RURQX09WRVJEUklWRV9FTkdJTkVfRU5BQkxFRCAgICAgICAoMSA8PCAwKQ0KKyMgZGVmaW5lIERQ
X0VEUF9QQU5FTF9MVU1JTkFOQ0VfQ09OVFJPTF9DQVBBQkxFICAgICAgICAoMTw8NCkNCg0KIyBk
ZWZpbmUgRFBfRURQX0RZTkFNSUNfQkFDS0xJR0hUX0VOQUJMRSAgICAgICAgKDEgPDwgNCkNCiAj
IGRlZmluZSBEUF9FRFBfUkVHSU9OQUxfQkFDS0xJR0hUX0VOQUJMRSAgICAgICgxIDw8IDUpDQog
IyBkZWZpbmUgRFBfRURQX1VQREFURV9SRUdJT05fQlJJR0hUTkVTUyAgICAgICAoMSA8PCA2KSAv
KiBlRFAgMS40ICovDQorIyBkZWZpbmUgRFBfRURQX1BBTkVMX0xVTUlOQU5DRV9DT05UUk9MX0VO
QUJMRSAoMTw8NykNCg0KICNkZWZpbmUgRFBfRURQX0RCQ19NSU5JTVVNX0JSSUdIVE5FU1NfU0VU
ICAgICAgMHg3MzINCiAjZGVmaW5lIERQX0VEUF9EQkNfTUFYSU1VTV9CUklHSFRORVNTX1NFVCAg
ICAgIDB4NzMzDQorI2RlZmluZSBEUF9FRFBfUEFORUxfVEFSR0VUX0xVTUlOQU5DRV9WQUxVRSAg
ICAweDczNA0KDQpUaGFuayB5b3UsDQpGZWxpcGUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IENsYXJrLCBGZWxpcGUNClNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMywgMjAyMyAz
OjI1IFBNDQpUbzogV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgU2lx
dWVpcmEsIFJvZHJpZ28gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47IGFpcmxpZWRAZ21haWwu
Y29tOyBkYW5pZWxAZmZ3bGwuY2gNCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
S29vLCBBbnRob255IDxBbnRob255Lktvb0BhbWQuY29tPjsgTmFndWxlbmRyYW4sIElzd2FyYSA8
SXN3YXJhLk5hZ3VsZW5kcmFuQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIXSBk
cm0vZGlzcGxheTogQWRkIG1pc3NpbmcgT0xFRCBWZXNhIGJyaWdodG5lc3NlcyBkZWZpbml0aW9u
cw0KDQpIZWxsbyBSb2RyaWdvIGFuZCBIYXJyeSwNCkkgd291bGQgbGlrZSB0byBwcm9wb3NlIHNv
bWUgY2hhbmdlcyB0byBrZWVwIHRoaXMgcGF0Y2ggY29uc2lzdGVudCB3aXRoIHRoZSBuYW1pbmcg
c2NoZW1lIGFuZCBnZW5lcmFsIG9yZ2FuaXphdGlvbiBvZiB0aGUgZHJtX2RwLmggZmlsZS4NCg0K
I2RlZmluZSBEUF9FRFBfT0xFRF9WRVNBX0JSSUdIVE5FU1NfT04gICAgICAweDgwDQpJdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gdXNlIHRoZSAoMTw8NykgcmVwcmVzZW50YXRpb24gZm9yIHRoaXMgYml0
IHRvIGZvbGxvdyB0aGUgcGF0dGVybiBlc3RhYmxpc2hlZCBieSB0aGUgb3RoZXIgZGVmaW5lcyBp
biB0aGUgZmlsZS4gQWxzbywgYSBtb3JlIGdlbmVyaWMgbmFtZSBmb3IgdGhpcyBtYWNybyB3b3Vs
ZCBiZSBEUF9FRFBfUEFORUxfTFVNSU5BTkNFX0NPTlRST0xfRU5BQkxFLg0KDQojIGRlZmluZSBE
UF9FRFBfT0xFRF9WRVNBX0NBUCAgICgxIDw8IDQpDQpBIG1vcmUgZ2VuZXJpYyBuYW1lIGZvciB0
aGlzIG1hY3JvIHdvdWxkIGJlIERQX0VEUF9QQU5FTF9MVU1JTkFOQ0VfQ09OVFJPTF9DQVBBQkxF
DQoNCg0KSW4gdGVybXMgb2YgdGhlIGZpbGUgc3RydWN0dXJlLCBEUF9FRFBfUEFORUxfTFVNSU5B
TkNFX0NPTlRST0xfRU5BQkxFIHNob3VsZCBhcHBlYXIgdW5kZXJuZWF0aCB0aGUgZGVmaW5pdGlv
biBvZiBEUF9FRFBfQkFDS0xJR0hUX01PREVfU0VUX1JFR0lTVEVSLiBTaW1pbGFybHksIERQX0VE
UF9QQU5FTF9MVU1JTkFOQ0VfQ09OVFJPTF9DQVBBQkxFIHNob3VsZCBhcHBlYXIgdW5kZXJuZWF0
aCB0aGUgZGVmaW5pdGlvbiBvZiBEUF9FRFBfR0VORVJBTF9DQVBfMg0KDQpGb3IgYSBjb21wbGV0
ZSBkZWZpbml0aW9uIG9mIHRoZSBtaWxsaW5pdCBiYXNlZCBicmlnaHRuZXNzIGNvbnRyb2wgc3Bl
Y2lmaWNhdGlvbiB0aGUgZm9sbG93aW5nIHNob3VsZCBhbHNvIGJlIGFkZGVkOg0KI2RlZmluZSBE
UF9FRFBfUEFORUxfVEFSR0VUX0xVTUlOQU5DRV9WQUxVRSAgICAgMHg3MzQNCg0KSGVyZSBpcyBh
IHN1Z2dlc3RlZCBwc2V1ZG8tcGF0Y2ggd2l0aCBhbGwgdGhlc2UgY2hhbmdlczoNCg0KI2RlZmlu
ZSBEUF9FRFBfR0VORVJBTF9DQVBfMiAgICAgICAgICAgICAgIDB4NzAzDQogIyBkZWZpbmUgRFBf
RURQX09WRVJEUklWRV9FTkdJTkVfRU5BQkxFRCAgICAgICAgICAgICAgICgxIDw8IDApDQorIyBk
ZWZpbmUgRFBfRURQX1BBTkVMX0xVTUlOQU5DRV9DT05UUk9MX0VOQUJMRSAoMTw8NykNCg0KIyBk
ZWZpbmUgRFBfRURQX0RZTkFNSUNfQkFDS0xJR0hUX0VOQUJMRSAgICAgICAgICAgICAgICgxIDw8
IDQpDQogIyBkZWZpbmUgRFBfRURQX1JFR0lPTkFMX0JBQ0tMSUdIVF9FTkFCTEUgICAgICAgICAg
ICAgICgxIDw8IDUpDQogIyBkZWZpbmUgRFBfRURQX1VQREFURV9SRUdJT05fQlJJR0hUTkVTUyAg
ICAgICAgICAgICAgICgxIDw8IDYpIC8qIGVEUCAxLjQgKi8NCisjIGRlZmluZSBEUF9FRFBfUEFO
RUxfTFVNSU5BTkNFX0NPTlRST0xfRU5BQkxFICgxPDw3KQ0KDQogI2RlZmluZSBEUF9FRFBfREJD
X01JTklNVU1fQlJJR0hUTkVTU19TRVQgICAweDczMg0KICNkZWZpbmUgRFBfRURQX0RCQ19NQVhJ
TVVNX0JSSUdIVE5FU1NfU0VUICAgMHg3MzMNCisjZGVmaW5lIERQX0VEUF9QQU5FTF9UQVJHRVRf
TFVNSU5BTkNFX1ZBTFVFIDB4NzM0DQoNCg0KVGhhbmsgeW91LA0KRmVsaXBlDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5k
QGFtZC5jb20+DQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIyLCAyMDIzIDI6MDEgUE0NClRvOiBT
aXF1ZWlyYSwgUm9kcmlnbyA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPjsgYWlybGllZEBnbWFp
bC5jb207IGRhbmllbEBmZndsbC5jaA0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBLb28sIEFudGhvbnkgPEFudGhvbnkuS29vQGFtZC5jb20+OyBOYWd1bGVuZHJhbiwgSXN3YXJh
IDxJc3dhcmEuTmFndWxlbmRyYW5AYW1kLmNvbT47IENsYXJrLCBGZWxpcGUgPEZlbGlwZS5DbGFy
a0BhbWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2Rpc3BsYXk6IEFkZCBt
aXNzaW5nIE9MRUQgVmVzYSBicmlnaHRuZXNzZXMgZGVmaW5pdGlvbnMNCg0KDQoNCk9uIDMvMjIv
MjMgMTI6MDUsIFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6DQo+IENjOiBBbnRob255IEtvbyA8YW50
aG9ueS5rb29AYW1kLmNvbT4NCj4gQ2M6IElzd2FyYSBOZWd1bGVuZHJhbiA8aXN3YXJhLm5hZ3Vs
ZW5kcmFuQGFtZC5jb20+DQo+IENjOiBGZWxpcGUgQ2xhcmsgPGZlbGlwZS5jbGFya0BhbWQuY29t
Pg0KPiBDYzogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpI
YXJyeQ0KDQo+IC0tLQ0KPiAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaCB8IDIgKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5o
IGluZGV4IDYzMjM3NmMyOTFkYi4uZDMwYTliMmY0NTBjIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRl
L2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2Rw
LmgNCj4gQEAgLTk3Nyw2ICs5NzcsOCBAQA0KPiAgIyBkZWZpbmUgRFBfRURQX0JBQ0tMSUdIVF9G
UkVRX0FVWF9TRVRfQ0FQICAgICAgICAgICAoMSA8PCA1KQ0KPiAgIyBkZWZpbmUgRFBfRURQX0RZ
TkFNSUNfQkFDS0xJR0hUX0NBUCAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8IDYpDQo+ICAj
IGRlZmluZSBEUF9FRFBfVkJMQU5LX0JBQ0tMSUdIVF9VUERBVEVfQ0FQICAgICAgICAgICgxIDw8
IDcpDQo+ICsjZGVmaW5lIERQX0VEUF9PTEVEX1ZFU0FfQlJJR0hUTkVTU19PTiAgICAgIDB4ODAN
Cj4gKyMgZGVmaW5lIERQX0VEUF9PTEVEX1ZFU0FfQ0FQICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoMSA8PCA0KQ0KPg0KPiAgI2RlZmluZSBEUF9FRFBfR0VORVJBTF9DQVBfMiAgICAg
ICAgICAgICAweDcwMw0KPiAgIyBkZWZpbmUgRFBfRURQX09WRVJEUklWRV9FTkdJTkVfRU5BQkxF
RCAgICAgICAgICAgICAoMSA8PCAwKQ0KDQo=
