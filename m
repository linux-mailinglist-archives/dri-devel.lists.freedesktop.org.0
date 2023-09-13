Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9D7A420C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37410E1EB;
	Mon, 18 Sep 2023 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773D210E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 02:17:51 +0000 (UTC)
X-UUID: ba3b05b051db11eea33bb35ae8d461a2-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Xd88ZYDGRsI5QfKXTREglkGLNFtiY1SUVwj5C+Le7XU=; 
 b=Q0xwGtbELGGdiHqT3c6COT6/z5uOSDcqKASe/VVFvsKqEbL01QR+toEX9RC9mM6pFXdFF52khr5jV7hSurVWpvTN11OtNCpoiH6z3XKCDUZ2aOMDc7OTK8uISiq767/mR8nXlO8sGa1ZF/rkx1FNG8TeugQNwUX+O+DkD4jOaXg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:e0d7a19e-64f2-4aaa-97ed-73db95ab532e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:deb2c4be-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ba3b05b051db11eea33bb35ae8d461a2-20230913
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1180534418; Wed, 13 Sep 2023 10:17:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 10:17:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 10:17:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBTU7GaIWrVqYf8B4dEyZOv+pKVpxRHw/lyzjey1Kymz98CHIbFjcNtIJ9dDaBnoxZHjLVmhu/DdNhP0PI66H8GOoJ3p62bMVgGAfTG76JGkUkaz/KF3SPayliWT5J1wZnm/z4i/NHClWNviQgH8YF2R3YttGFzxiTsDp6Vdts1Z39jeRG1EnQSxeSC/CtRM/xQ1RtcHYrUaJ4FlM0aDeJTRB8OU3VAOVkXmQ6uq24oeFmpNMXTXK/7zy5ZJlHerT9/GIOzTa0xedzITHGhis03DUcA/i7fBG4BMCmLcp4LDXlEjYrCHy2SIRmijMHKCZRspEo0aiADXTQAm0OWk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xd88ZYDGRsI5QfKXTREglkGLNFtiY1SUVwj5C+Le7XU=;
 b=dJmceygxb1LYJBb/6dhzg26kmuoeo5RFRPCAuXXEWZSHpqbVfi7btm9mX2WZ/E3b3iocdLH3+b5/jNYuA7Ju+KZrfDr5eaO7jvfq+IvZlFZk5bUpRaM1yX5VHtwS+Pyy7I+GGbGnGDW6N5cquv+qDIRDzG3OsT07pP1p4qQzVrz4KQabAvaGeZPomZIzcpEr81bd3zZP1PYaCohrP1FkAQMCU8QQFI6KSCukq/vabSchWd7a1yNrcm6Owb5lSFPNvXx3en2qzx33UvbKXQx0/U5HcgtUnja45mZ6FDN//xbdl5hqcYnUd7VA6CALyXQCxnR6nUWc9izNJdDeaXPSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd88ZYDGRsI5QfKXTREglkGLNFtiY1SUVwj5C+Le7XU=;
 b=GzOTMP/rMP5sJm9M0Cy4p40dWV7rW39hiX2Je3oEIFa4mfEFJgorxolz106dloDKigfRkiJf5KaLuHpi693hrdfEdFBuTZqXuKpy8E0u3Dhf0p7Z4j+8oO4lh1RKVObSJRowThFHVigjtBxny4rJTXw27eIwvw0RTYgJMeK7dUs=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TYZPR03MB8295.apcprd03.prod.outlook.com (2603:1096:405:1c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 02:08:35 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 02:08:35 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Thread-Topic: [PATCH v5 11/14] media: platform: mtk-mdp3: add mt8195 platform
 configuration
Thread-Index: AQHZ5U74P4hGXgUu0kiMvABp/2aNC7AW2cWAgAEqAwA=
Date: Wed, 13 Sep 2023 02:08:35 +0000
Message-ID: <c8f12e96e49f471f287db82cee51b3104e2bc0de.camel@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-12-moudy.ho@mediatek.com>
 <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
In-Reply-To: <6b7a229d-54c9-2450-4b37-9acc659cbd12@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TYZPR03MB8295:EE_
x-ms-office365-filtering-correlation-id: 5ee68f5b-7a05-4320-8167-08dbb3fe562c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vDy7VwtL9PsA0BrgTKXYklyuPfoCOrPO3IIp0JCEKxA+N+7c9RqkvmAS8OjPZgTDL8NzLJZlpMKPeB2RjY9Rh7tmdfAicyppQ/y3M9RJOBW5svOZQgCLc1wK0Ex+A4BQk/8HhrihiHQaKEm8sMbw0cVSOV+qJp7Iwjo8iNdMfp5LhknzT+11NqBg90n3C276UuaH+Las73FNWr2Vf8VDCUnWl/QfKRZhcXn0tldK2broAOXkAX/um7VBPjZDhHGCqyg4R3HGXP5mPm1xNcu1/51hUPYibR375b1UFZPqHX326J1BLufcrZGR3lZMUfaT+Lzh2HsCuRiGRFjd2PXW9Q7MJDXY38b2sFf/e0zyhwVRRqKL3Xoq9Dg7Eiu8vbhzslF9HM49WKwGBWAQ+MRPTqTet6/ezhHpZNS6d6PVMlpYYG6XJYEGdCnNRKo6SjdhktxdrRImieNKs+7upFTbggadJiDj2v1EcS4NsBMDcXwBYLSdOQt4GeDaISHW7k+hH6M9aWbd/1gjsvMfgKq0sHPlv6hjmEtPaPvgzFnwOXIZ1hk5v5um7FX7BLxttrwMjNObl23PRfrnIyrd+6jrKrD4IuKFAc3c+9+cvuM5HbLXs7Wr7q5j0RENg9uPMnxcIrGRFecq1Ta8DMRpKgzHtdwSrKf6u9b4nMQ1CdXy3Xeg8AJK+crtvpivRhTrQ4O5x/sB7wfzBPmbec5sL4M7Vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(186009)(1800799009)(451199024)(921005)(2906002)(122000001)(38100700002)(6512007)(86362001)(36756003)(53546011)(85182001)(2616005)(6486002)(478600001)(71200400001)(6506007)(38070700005)(26005)(83380400001)(41300700001)(4326008)(8936002)(8676002)(5660300002)(316002)(110136005)(66556008)(66446008)(54906003)(64756008)(7416002)(66946007)(66476007)(76116006)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUwzQTJDQ084c0N4SGZnUUdoSHBseVlOc2ZtTzlDZ0xRYnJtaVNFTDJCYW9t?=
 =?utf-8?B?ZWxTb3VFc29JaDlKdkpsRSttVHl6S3ZjWncyWEVyWU5wZzFhVnRsTDZScm1x?=
 =?utf-8?B?eUFOTlV4NUYzWkY0NFlNRjBGaVJxTTUwNDkwNWF4VE9hczRIYWJFRGRXSVFv?=
 =?utf-8?B?WlQyS0xubmFibnNWUzJHb1BUdzVXUmJTWVZPSW5YeDlidTRtY1BWTGI3a1Zi?=
 =?utf-8?B?ZDhKUi9LZkVmZ1VWMmtjYTFlRW9LT0Fjd0tjWXlqN3lFNm4ydVZ0b0lYTUpN?=
 =?utf-8?B?V1phL084TDFGc1Z4aXdEbDFTb0xhbVZBbEptR3FyVWRJbTFlMFpCZG8xc1Mz?=
 =?utf-8?B?elpQWFpsOEFzb1FHV08yNnBrb2ljRGw1WjRKcVhxU0JxSkJMUlJCWTZnVnBz?=
 =?utf-8?B?RzA0OGx2aE5EcUhrSng4aVVVUGxrRFpIanZxUWNDYksrbFdzbTR6ZW5yT1cy?=
 =?utf-8?B?THRlekkxdjVCRFp6ODNIQUljZVM0WEVrbC9ZQ3psMm5nRDR0MlkzejFQY0Nm?=
 =?utf-8?B?VjQrSGZycGE3TG4vTU4xL3hLK3JUS0JQdXJKM09TNWxyYWt5ZWZLRm05TG1m?=
 =?utf-8?B?d2N5ZGdnblRCWkx1SjVteG83aTJRa1o0STNoZ052SGN5Q21uUklwYStmNkJF?=
 =?utf-8?B?M2NiWkpFdS9hQ2NidEFYNy9razQrN3Z4V2I1dEwxOFBNQnlJMjZDWWIwV3oy?=
 =?utf-8?B?cVhJbENVRmROWTJqREIxTHhiYlMrdE1JbXZyRkEyWCtvSlZ2cnF6VmF1dFor?=
 =?utf-8?B?U3VuWWFXRmI3cUZvdFJHOXNRbStxbUdnWklwSzFSV0J1b1l4ZzJxRVYwUGdD?=
 =?utf-8?B?OU5QUGYvWUwzZkd1WDhsWnNNeE1zL2IzczFXY1BIcjMrckxYanBMcnlXWnhp?=
 =?utf-8?B?VWRjcG05S0FxOVVDRk5xWUx1UjRTci9nRG5qZEh5UmxtdVhZYzFzR1RWVFQ1?=
 =?utf-8?B?WkFaTlVHLzRuZTZvZWg4Y0hldFY4RGl5bVN1amJpSVBnbVhlbnFSZEJhb0g0?=
 =?utf-8?B?WmFGTDdtUFJYWnQvNG9YcENWYko1NGpyRWNacVRxZlpGbURpL0FrYTFQRGNT?=
 =?utf-8?B?WlU0S0JUdHdLc25NVitVRXh6aEdncFlWN1ZjRkdsTnhYUUo0V0dJb0JmOENq?=
 =?utf-8?B?NmkvNW13emp5WVV3R3BvM2Q0Y2F3MktXN0dhWlVIQlR3VDNGTVBFNzU5MUli?=
 =?utf-8?B?MlVxUEZENzlhY0JBOEJxNnNMd0VSRFIveUxkK1Y0YjhIWTBNeFBWeERqRzJX?=
 =?utf-8?B?SFVrMVB6WXVtM094dmRDdGRNN1NpVjI4dlFiRDlNRHo1L0sxV2RGWldMQnJV?=
 =?utf-8?B?SUxqb2Y5cVNuK0ZCZEhCaHJWNjdzME9tR3pCZTJibzZwbVZMSUI0L0t6M1pU?=
 =?utf-8?B?SDkzL3ppbnRLdmYvY01oazBSbU93YVlmaGpmUHRMUllQWjF2K3hocldBY0JS?=
 =?utf-8?B?SFJuMUZaN2o2citIYmRuYm5FNjhYbDJsZ2lLNXVBWksxY3ROclRsL1NxUkZD?=
 =?utf-8?B?RmIvQmZVTnovbCsvWEJKSnFNM20yU0xIUWFsSUVDTGVyK3o0M2FkcTdSN3FI?=
 =?utf-8?B?QnEzMjUzajZkRUZpTi82Q2loYzNlVnZ5U1ZVQnRTRWZ5NEZrUGVyV0ZpWmZU?=
 =?utf-8?B?S0JFNVpMeHVqdS9pL1EyRkNtSmZ4VExGeXR0NldjckQvUlI1ZEhBTGdqUm1u?=
 =?utf-8?B?aldNRUdHM0l3Qy81K0dDYUZpMHpiNDdycDRCUkkwNTBuYWw4a25Id3lGUEsx?=
 =?utf-8?B?R0pHUnRMS1pCanZETnNlaUFIaUJYVGVWYXl2eXZEeVN2MEtUbGVTajMvWEZa?=
 =?utf-8?B?YkdMWHprMWxzdUFXS3JvYUViZnJMS05PMWxKNVIyQ0liWUFZR1lZWldtQ2py?=
 =?utf-8?B?WDcvMDEvdlpFWnRwZksvZnpycERZOXJCVGtPMDRkNjJ4dHcvektuaE16b2h0?=
 =?utf-8?B?RTdyYmkvRU5hT2RQWSsxM1BTZ1VrZGVLMURIOCsyblZkclRUZk9DWTMzRmNm?=
 =?utf-8?B?WmgrSDYvU1VjWlBNc2srZ3BKZ3k1cTNBTWppZE1FZytuWHZBVGRUTEhkb0tl?=
 =?utf-8?B?TWRjK3BrK21ndEVLb2F4UkRvNDNOK1RCMURSM0syZ3pjTkxrNnJEcHRpNHpG?=
 =?utf-8?B?RjhtdDNMU2kvdWF3ZTF5TWMxZ0FZNkNFOXFlbkxvOHg2SWVGV3B1dmNpcE5n?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E40C3584C08F7E44BE090A2DBDAEF560@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee68f5b-7a05-4320-8167-08dbb3fe562c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 02:08:35.1693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OlcUaDsQVLVqRdZNIwEa3aDdCRIN0JOp9rvW0vYloBGNvMGcjqkrwp+qfeVqay0AClILCj/JM5qv9uChK0Epiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8295
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDEwOjIxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEyLzA5LzIwMjMgMDk6NTgsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IEFkZCBNVDgxOTUgTURQMyBiYXNpYyBjb25maWd1cmF0aW9uIGluIGZpbGUgIm1kcF9j
ZmdfZGF0YS5jIg0KPiA+IGFuZCBjb3JyZXNwb25kaW5nIGRyaXZlciBkYXRhLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+IA0KPiAu
Li4NCj4gDQo+ID4gIHt9DQo+ID4gIH07DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMNCj4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jDQo+ID4gaW5kZXggMDZiN2Qy
YjBiODE0Li44YjY5YmQ4YjkxYzYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMNCj4gPiBAQCAtMjEsNiAr
MjEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZHBfb2ZfaWRzW10gPSB7
DQo+ID4gIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLW1kcDMtcmRtYSIsDQo+ID4g
ICAgLmRhdGEgPSAmbXQ4MTgzX21kcF9kcml2ZXJfZGF0YSwNCj4gPiAgfSwNCj4gPiAreyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtbWRwMy1yZG1hIiwNCj4gDQo+IFlvdSBrZWVwIGFk
ZGluZyB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZXMuIFlvdXIgd2F5IG9mIG9yZ2FuaXppbmcNCj4g
cGF0Y2hlcw0KPiBkb2VzIG5vdCBoYXZlIGFueSBzZW5zZS4gRFRTIHNob3VsZCBub3QgYmUgbWl4
ZWQgd2l0aCBtZWRpYSBzdWJzeXN0ZW0NCj4gLQ0KPiB0aGV5ICpDQU5OT1QqIGdvIHZpYSBvbmUg
c3Vic3lzdGVtLiBJbiB0aGUgc2FtZSB0aW1lIGJpbmRpbmdzIGFyZQ0KPiBhbHdheXMNCj4gZ29p
bmcgdmlhIHN1YnN5c3RlbSwgc28gd2h5IGFyZSB0aGV5IG1pc3NpbmcgaGVyZT8NCj4gDQo+IFRo
aXMgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UgYW5kIHN1Y2ggbWVzcyBhdCB2NSBpcyBjb25mdXNp
bmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KSGkgS3J6eXN6dG9m
LA0KDQoNCkFwb2xvZ2l6ZSBmb3IgdGhlIGNvbmZ1c2lvbiBjYXVzZWQgYnkgdGhlIGltcHJvcGVy
IHNlcGFyYXRpb24gb2YNCnBhdGNoZXMuDQpUaGlzIG9jY3VycmVkIGJlY2F1c2UgSSBtaXN1bmRl
cnN0b29kIHRoZSBuZXcgd2FybmluZyBtZXNzYWdlDQoiRFRfU1BMSVRfQklORElOR19QQVRDSDog
RFQgYmluZGluZyBkb2NzIGFuZCBpbmNsdWRlcyBzaG91bGRlIGJlIGENCnNlcGFyYXRlIHBhdGNo
IiB0aGF0IEkgcmVjZWl2ZWQgYWZ0ZXIgcnVubmluZyAnY2hlY2twYXRjaC5wbCcuDQpJIHdpbGwg
cmVjdGlmeSB0aGlzIG1pc2hhbmRsaW5nIGFzIHNvb24gYXMgcG9zc2libGUuDQoNClNpbmNlcmVs
eSwNCk1vdWR5DQo=
