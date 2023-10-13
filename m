Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9167C7C89
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 06:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6210F10E598;
	Fri, 13 Oct 2023 04:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299910E598
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 04:21:24 +0000 (UTC)
X-UUID: f6013ec8697f11ee8051498923ad61e6-20231013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Zbk31YS58QeNG1YE+92jrcL7E8TukC67sMxf8bC6Lzg=; 
 b=cg02Q7X+F3IDh8IL4qMJPfZdh0v3snuP8eBWpMS+HeESrWdHGqEfq1Ag+hRdvK947vtdXXdnz+aH0IZ5uGnx1OJlgQ/4apggu5JPF+CdU5kKNoSSCsogkGo4lnCjUJ/HfubJ/2QGfd/vwLlQH2qMmDiqExt2k226fkTgvs6aVQs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:df4e203f-c72e-420f-80f8-458f3e560df9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:31c7fb14-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f6013ec8697f11ee8051498923ad61e6-20231013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 963484784; Fri, 13 Oct 2023 12:21:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Oct 2023 12:21:19 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Oct 2023 12:21:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krHe/+vcw+FKgFQ5iPIKHcQ0V9wElV99ofen18Qn0HLmckIb4HLVPTQyRODN+WQx4y3aZ/s4rXnIVjIMos3Byus11v2d08xEOyrTCX+hEhzF1/9EPtIWiZmTM7zrUZAJS2cT6IAPvbZdCV2wCnVO5fN5nSmwACUzY5W2fVhcHmXkGPI4xc91u4TRSPVQqzgVYbComKR/3AItIsSCfRSx1q+kbZ/hNW/6WaQYWbfIxJJPKstUmbsesh1fpLbElNaUndoNY3W+O3g7c6LHE9nXBpILbV/i83jyHbDwQpFEzt1zuucDXAen9k+LvxYkSGR1WqGK5LMJxMBvpU1wPzNIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLmBLIGhd3bNJ+mgiEwR6tjrXunbTvy7XmqgKRCBKL4=;
 b=ekOEXMTlA3B+jlmAQfkE7QJuFNTkvqIK2zMMVDXI3xmABePhj/x1E+TZwQO5zpn7I2KkTfsVukjxvLIuD4V3/xvgAb57bSWEReNTBRzP19jVhHE6u/DRkAtKTD/16JbecdafNsoZzDfQJJLc9xEQQdTYzcs0+EHmH6UOYUfm5EtqjHSnzmtIRCS/OUrjIfgyZ09AXf7tRRqgBA0naffGH4CwoJXeOLmcnz9phRfKYJe5RZwbc2ijnQ5Nd7RPM3IX6m16NpEvJr2LXnP3tJziJyDyvQw9fad6AzzDCeA8Lrs4qzde1v8jurMPTUA93q8b69qTUicK5+HSKqqD09M/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLmBLIGhd3bNJ+mgiEwR6tjrXunbTvy7XmqgKRCBKL4=;
 b=TVOK1ejTmhSkbEuKFbRyqmCbhTmzYy8BeSDgkCU3786dSAakrb3pAtx5xd6QqPuFyFEFDI0K/5ZKOmmVCMLKJnpckOkMDP9NFnlfIa7qJNvmss80hBk1niTRs0TlDX4kPuc3fF1Y6/LPeAryXHuGaU+FsvU/GkXh72vE4vIMuAc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8193.apcprd03.prod.outlook.com (2603:1096:820:10b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Fri, 13 Oct
 2023 04:21:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 04:21:17 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v11 11/16] drm/mediatek: gamma: Add support for MT8195
Thread-Topic: [PATCH v11 11/16] drm/mediatek: gamma: Add support for MT8195
Thread-Index: AQHZ/PK4r4+//jRcI0uDqnZbuGnXGrBHH4WA
Date: Fri, 13 Oct 2023 04:21:17 +0000
Message-ID: <935e7b2269c8a2fa0af365e5b2e0e51650dcf2d4.camel@mediatek.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012095736.100784-12-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8193:EE_
x-ms-office365-filtering-correlation-id: f955f075-a092-41a3-3753-08dbcba3d8a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LC5KSabh4mz4E2KtAX5oOqyAmqe4Aov/0e4kLR5ipX/yuam7OVeEDJ0JrBPy0CXVmOYUPYz71rUqbSvW9Tn99Cts/J+vAt3jrT1j9jfnH7L+qbHNsgwpD2nKaXwtYLtFnfA/tFrZJ16SVx5pTRKCulcaR303v95SjlQL7TCSaB+lEm62KThussv+qzL8DlQ6W8UfOfhNb9qub0S/kRCGvSupLefqBNjuZDGDP2UXwtj2b6r7/m3BK6NoDIjKFhZwVl8yGWJoaAGDaDPHdghGCSOo6yGcr20ML312SfKdezBBCoq3LqoW0Uz7GBA+y8swcaWIVvKgP2eIq1g7whyZ5+Wf4jgmUCDmj3KuTVq72eL/PhI85MsJNWHZGT59MEYp+2eg6DWcFEbi9zSUILr3HX0DQjKwkV9PfRfkkmy02Ttw/wt3FzwGZN22UE7cVrp/voISbIYpOtYyatL0H/+JRxRUNWwLyg5VIfQE6xkDVH3/WCBO++BPVFrASDIh6irRu9b71JpiyuxHekALeCqz+75n8z666I2i9JA7MDAm3ODqYsApJ7NiTpPrcKxIhHI6W6toDtIFZgdYU2BCFT99rz7DTFKy3HjV8wL/OnJ3EJD/QzHKtH0B3jJID59+ceMwlUSakF0d0cVWx0KbJFPSeGE/mRAq9tT2ptrSCS8onuo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(478600001)(8676002)(2616005)(83380400001)(6506007)(7416002)(2906002)(66446008)(54906003)(64756008)(4326008)(66476007)(110136005)(5660300002)(76116006)(66556008)(66946007)(8936002)(4001150100001)(41300700001)(316002)(38100700002)(85182001)(36756003)(122000001)(86362001)(26005)(38070700005)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2drSlBQV2pVMXlpTUtVeS9tSzlRVDhJL0tFaTBqWFlPWHVrNmFKcEFEbkJH?=
 =?utf-8?B?ZFdPK3Y1Nlp0K1pxN0gyVkhJeWRmS3RXVVV0NWoyclQvcHJTYTBpQ1EwV0VJ?=
 =?utf-8?B?aDdKNjNjbjl5V2ZOVzN6VXUyaHpJZ2hOK3Vmd1BvQnZWRmFaY21xSWhjTklQ?=
 =?utf-8?B?YUtIOCtLbjlKblJpRmtrZkZNQW01YmdnTVpnMlNSOXloZWtwMVlqc2RScjRj?=
 =?utf-8?B?b09qUVkrTWsrM3hEUG9vUVVqSExkZ3VJTjZmWkJlUDNLczFTckVPdytNVkVQ?=
 =?utf-8?B?M0lVb2tGU3FVbjhTY3gwNm1Zd1IrRk5SSnJOdU5YQjdIVmUreGVsSzBUcXJk?=
 =?utf-8?B?aTU4QWdKd2VtMU9ya1JNVHk1dmdDV2dKQlZaV1pXNktRNEs4SXpkdmpJTk41?=
 =?utf-8?B?S015Sm56citoSmxNWnFlTXFvdzEvRGxkY04wSjZUWGtON1FvSVE2eVJwR2Ji?=
 =?utf-8?B?eG1sck5mMkNlRDNCYnZhbGpFUnJlZjJCS3pUdUkrcXZWQ0dQS3k4K1g1djJa?=
 =?utf-8?B?UEVzaVI5SWJ6UTJ2ZGtva0pNd085MWtpeStmcE1wd09JQ3JnS0FMNTNiaExn?=
 =?utf-8?B?UUVES094a0V6QVZNWExEdzZ3bDFEa002ZGlhb1d3akFzRnZxcVhwWFQyQndq?=
 =?utf-8?B?eEpZdkJmM2wydkZuVGhMaGJ3cElPbmhSRlVsOU1aNkM0VDBVOHJ6Y0UxNU1l?=
 =?utf-8?B?bEJDQ1RvMi82WnRNTU5QK2ZDVW1WYWZ5UkVRUi8xaXU1MkdvRGJPQkdsNTU1?=
 =?utf-8?B?UFlhaFcvMlJENkpTenIySk1Fb1FTOHU3eUxEK2tjRldYMXEzekZzTnFRQnho?=
 =?utf-8?B?eFBkVE1TRXBhZ2VTK3BFc0dDSDRvc2JNbEhSTjZRb05LcklubEJ0Z1JiNVVY?=
 =?utf-8?B?K0l0ajNTN1RESklxSWtRN1JtZHVFWVZ3SnBDY2NDM1VYSjBaMG9LYnFZSDMv?=
 =?utf-8?B?Y1N5dUkrTlZDN0lCVE0rQkhDeU51QldWQ2ZZcUx0Mk1tVElZVFZucUpCeU4z?=
 =?utf-8?B?U3QranJ4SmM4Y1kzTVV4bTdXVEFUTUthZWlZa3RUeVdSakFaNWlZSVpuOFZZ?=
 =?utf-8?B?SzU3UUVzcXdabDFNbXJIVVk2MEdVMzZ1K0UvSS9WSm5GVGFBUmtFOXFPdzRr?=
 =?utf-8?B?SHgybWxJay9HMi9vb051bkwzeFFjWG01K3lsVUxyMUtPdkdhTEFhY3BtejlE?=
 =?utf-8?B?WUV2RXYyTUovUmFDQmZqY25IeFRldURMaGZ0cXZXSXdOdE4wd0VuZS9NU0I3?=
 =?utf-8?B?djdkU3h4Nm1GeDladTYxUU9zaXdjTVFheGtDbk9XVW5WNVVMRllubHVhNTZw?=
 =?utf-8?B?clMyWnp2ZlNpOEpTTENBWHRTL2hKRUpKbUlucUxRVVh3M0NiZzkzaEVvSE1Q?=
 =?utf-8?B?R3BUdmFYMDFJQ25rcGNjMWVtZlBrOUxnN3VodU1VVE1kRmtQRWFDVlJmRDRm?=
 =?utf-8?B?eVNoWGhHd0dvbDdsMzZqOGlQUDNpSlhTZ3ZBOCtOSkRNTFZvc0EvRFQ1blJM?=
 =?utf-8?B?aldMem5KRy9NRmorc0xRNWFPTUJtbmdYRDNoOUJnMW0xejZjRllXblRMZWsr?=
 =?utf-8?B?V3NkS0NTb0dWMnoxWkVQS3BJUy9acUNZQmVBTis3U3hIWERtOUtiSG0vMDBU?=
 =?utf-8?B?YTViZWh6Q1QwbWtaUVlNOFJ3Z2xYK0U1ZlBWb1lhMnd1b1BrMzc2OVBFOWJY?=
 =?utf-8?B?SGx1aXpiQ2FUMVUrSzI3VEI0THBheEpVQjZwWkFlZ1NOS2VjYnBKWXdKWGRG?=
 =?utf-8?B?VDNCQjRVa0lFMXBvZVpLTEU2Tll3Q0VnZG1jSlkwOVNHQUI4KzBXRnUrb3lk?=
 =?utf-8?B?YTFBcTBaVlVaY3lCT0x5UE1xUjU2TnVkb1V5NnZjTG4rL3NDTnFKSExRaC9J?=
 =?utf-8?B?RHhPaW9aSUtSRW9DTS9wMnVuUXc2TmFUakM2K1hOMEo5bi9SSDFNNzRva1g2?=
 =?utf-8?B?QWxFS0pMK2ZETmJKbHhWUEtYeWM5Sm1WQ3YrVC92ZTRQU2xzS0VQRWhLRk14?=
 =?utf-8?B?ak1wMm1sQWQ2dTk5cmY4Uk9iUzFKMlQycTFIY1hJcUpydUVZK0ZJSnBLR1B0?=
 =?utf-8?B?UmdqeTlJVWUxWEtHZWxUT3JWckFWaXBlTGNEanQ2TkdYdytiYnhNZjVjN3Nv?=
 =?utf-8?Q?w11y51JJsMvc8pBR437/GtO1t?=
Content-ID: <4F4B639A45CA684888ED5740366BE4B9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f955f075-a092-41a3-3753-08dbcba3d8a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 04:21:17.7519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTMi6qkRUmBk0iJgZ4/57tMJXmXB1j2sIMFa7tf3+vpWJ0jH+QjbgR/WOyFlq1/yMhkeqt+NCCER4gsIWSwNVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8193
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1557892047.693550112"
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1557892047.693550112
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7VGh1LCYjMzI7MjAyMy0xMC0xMiYjMzI7
YXQmIzMyOzExOjU3JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Tm93JiMzMjt0aGF0JiMzMjt0aGlzJiMzMjtkcml2
ZXImIzMyO3N1cHBvcnRzJiMzMjsxMi1iaXQmIzMyO0xVVHMsJiMzMjt3ZSYjMzI7Y2FuJiMzMjth
ZGQmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7dGhlDQomZ3Q7JiMzMjtESVNQX0dBTU1BJiMzMjtm
b3VuZCYjMzI7b24mIzMyO3RoZSYjMzI7TVQ4MTk1JiMzMjtTb0M6JiMzMjthZGQmIzMyO2l0cyYj
MzI7ZHJpdmVyJiMzMjtkYXRhJiMzMjthbmQNCiZndDsmIzMyO2NvbXBhdGlibGUuDQoNClJldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMz
MjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMmIzMyO3wmIzMyOzkmIzMyOysrKysr
KysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7OSYjMzI7aW5z
ZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KJmd0OyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzYz
MDVjZDk1ZTZkNC4uYmNjMzNhZWNhODg1JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KJmd0OyYjMzI7KysrJiMz
MjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQomZ3Q7JiMzMjtA
QCYjMzI7LTI3OSwxMSYjMzI7KzI3OSwyMCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMy
O3N0cnVjdCYjMzI7bXRrX2Rpc3BfZ2FtbWFfZGF0YQ0KJmd0OyYjMzI7bXQ4MTgzX2dhbW1hX2Ry
aXZlcl9kYXRhJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5sdXRfc2l6ZSYjMzI7PSYjMzI7
NTEyLA0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytzdGF0aWMm
IzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19kaXNwX2dhbW1hX2RhdGEmIzMyO210ODE5NV9n
YW1tYV9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Ky5sdXRfYmFua19zaXplJiMz
Mjs9JiMzMjsyNTYsDQomZ3Q7JiMzMjsrLmx1dF9iaXRzJiMzMjs9JiMzMjsxMiwNCiZndDsmIzMy
OysubHV0X2RpZmYmIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsrLmx1dF9zaXplJiMzMjs9JiMz
MjsxMDI0LA0KJmd0OyYjMzI7K307DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYj
MzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkJiMzMjttdGtfZGlzcF9nYW1tYV9k
cml2ZXJfZHRfbWF0Y2hbXSYjMzI7PQ0KJmd0OyYjMzI7ew0KJmd0OyYjMzI7JiMzMjt7JiMzMjsu
Y29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTczLWRpc3AtZ2FtbWEmcXVv
dDssDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxNzNf
Z2FtbWFfZHJpdmVyX2RhdGF9LA0KJmd0OyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7
PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTgzLWRpc3AtZ2FtbWEmcXVvdDssDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxODNfZ2FtbWFfZHJpdmVyX2Rh
dGF9LA0KJmd0OyYjMzI7K3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRl
ayxtdDgxOTUtZGlzcC1nYW1tYSZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7LmRhdGEmIzMy
Oz0mIzMyOyZhbXA7bXQ4MTk1X2dhbW1hX2RyaXZlcl9kYXRhfSwNCiZndDsmIzMyOyYjMzI7e30s
DQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyO01PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
JiMzMjttdGtfZGlzcF9nYW1tYV9kcml2ZXJfZHRfbWF0Y2gpOw0KDQo8L3ByZT48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
IGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkg
KGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBv
ZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lz
dGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBh
bnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1557892047.693550112
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDIzLTEwLTEyIGF0IDExOjU3ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gTm93IHRoYXQgdGhpcyBkcml2ZXIgc3VwcG9y
dHMgMTItYml0IExVVHMsIHdlIGNhbiBhZGQgc3VwcG9ydCBmb3IgdGhlDQo+IERJU1BfR0FNTUEg
Zm91bmQgb24gdGhlIE1UODE5NSBTb0M6IGFkZCBpdHMgZHJpdmVyIGRhdGEgYW5kDQo+IGNvbXBh
dGlibGUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYyB8IDkgKysrKysrKysrDQo+ICAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfZ2FtbWEuYw0KPiBpbmRleCA2MzA1Y2Q5NWU2ZDQuLmJjYzMzYWVjYTg4NSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4gQEAgLTI3
OSwxMSArMjc5LDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfZ2FtbWFfZGF0YQ0K
PiBtdDgxODNfZ2FtbWFfZHJpdmVyX2RhdGEgPSB7DQo+ICAJLmx1dF9zaXplID0gNTEyLA0KPiAg
fTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9nYW1tYV9kYXRhIG10ODE5
NV9nYW1tYV9kcml2ZXJfZGF0YSA9IHsNCj4gKwkubHV0X2Jhbmtfc2l6ZSA9IDI1NiwNCj4gKwku
bHV0X2JpdHMgPSAxMiwNCj4gKwkubHV0X2RpZmYgPSB0cnVlLA0KPiArCS5sdXRfc2l6ZSA9IDEw
MjQsDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtf
ZGlzcF9nYW1tYV9kcml2ZXJfZHRfbWF0Y2hbXSA9DQo+IHsNCj4gIAl7IC5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE3My1kaXNwLWdhbW1hIiwNCj4gIAkgIC5kYXRhID0gJm10ODE3M19nYW1t
YV9kcml2ZXJfZGF0YX0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZGlz
cC1nYW1tYSIsDQo+ICAJICAuZGF0YSA9ICZtdDgxODNfZ2FtbWFfZHJpdmVyX2RhdGF9LA0KPiAr
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtZ2FtbWEiLA0KPiArCSAgLmRh
dGEgPSAmbXQ4MTk1X2dhbW1hX2RyaXZlcl9kYXRhfSwNCj4gIAl7fSwNCj4gIH07DQo+ICBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfZGlzcF9nYW1tYV9kcml2ZXJfZHRfbWF0Y2gpOw0K

--__=_Part_Boundary_003_1557892047.693550112--

