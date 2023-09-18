Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAF7A45DE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6510E225;
	Mon, 18 Sep 2023 09:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D719110E225
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:27:26 +0000 (UTC)
X-UUID: 922ae4d6560511ee8051498923ad61e6-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=sE+jDQt1J6M80qVDObAdyjOyZADlN/VNS31EwPvDhwc=; 
 b=TAYH655sIA7efIZ9x3fKa4DUUzyNS/y3bTJSg+eJKMxvALXzo6jHFeLYP1gbmGbEHtQtfDVy3rD5GAoPGWk8EluPIurgZzJyf/V8wuRm8llvHJAOenPoq/3EIbAubXNafs+3f1zvmRrop5SY+c9Adh6vuaZQCNCWb0rzretPQfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:533a8bc8-50f7-4e09-a379-c19238bcd68d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:881ef7be-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 922ae4d6560511ee8051498923ad61e6-20230918
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1167498125; Mon, 18 Sep 2023 17:27:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 17:27:21 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 17:27:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUIFEzA+sMvkyU5ke94RT9TvKnZTZ6dMzXSrnSNY7hRajlIfBf97yuxMWZ9wihZmByvHpk1XxfChatNKRo87iRdddFaQqoyp+1OordgETho0f72qVGWrjj60giuCRHXUuALs7Uf87jCEILmVIxsfXV4yDpltwwJFhQRDeqKeOlVJR5DOuxusPD6aHV8SiQnjtziAG0UK63/e/1HhYxK4wWVDE59X6qxBioCsBRlkQWVPu6Ikjrur4xZW2oehfXAmo7QIktCDVDXd6Rw1EnObIhEiTL17sxzCDI0ptHchKVsAM2GxsR60DmKl+b7n4qqPOXFAprAMclwG1JN1NEvnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IT+iAmk+2aqBwUC850EJ3xhkn8p9ojvXyAKRUG+Cvk=;
 b=SSOVDOy0BtD71A5kn0CcWqxhtSuea4l+9BnGJdSISu1RnaC0Lqo8ItvMhqfYZdebsCWKvPKFwed6UbNBtBIq/vfAhy+ync6VQ0EAN5FuR0TdDO2VB3CAzZuHN0pB/rDJWhmj8eR5eie4fSVQWq1Rz2P/igyxWFPVVXgpSUB2D0+3WzCHMlWlIcWJ4zoYQ91dBg1lyX7ihIuJ0kSWusnMUarbW8mkvwpb5JbqbHhTcAbaE2AweFH7+QXejISLXw81hyfoYN42pdbDleH/HbKrn7nEkCCqpigWV+FxoNuihWh8lZsuZbE6HEQEPmD/6pHH2wq3QfQVKH47oPtT6rc2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IT+iAmk+2aqBwUC850EJ3xhkn8p9ojvXyAKRUG+Cvk=;
 b=uynGUQu4g4h5CE5XEsI1C2t2mu0RBJFIzb5sGmWTS8MIPd2nZHEk7ZJgx+zM3qb5/4zasnVvuSNwZ+UpqWrWc+AN0kn0nRJdHyZXiy+k6fJr7EefNDYd6K601QI6M/Y1c9WZfwNSw6QuOiDgCU0TpoLqgdF8fU4UCS58ExNl5Yk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7915.apcprd03.prod.outlook.com (2603:1096:101:187::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 09:27:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.022; Mon, 18 Sep 2023
 09:27:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Thread-Topic: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Thread-Index: AQHZ6gwiYoEmHBjFLEC9YeMNqxBairAgS3iAgAADhACAAAGOAA==
Date: Mon, 18 Sep 2023 09:27:18 +0000
Message-ID: <38acab5ba98948ad496daacff9b3e374ee0e547c.camel@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-5-shawn.sung@mediatek.com>
 <ffcf35cb8ca1ff0fe0a0f0176e3199b9c944b3b9.camel@mediatek.com>
 <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
In-Reply-To: <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7915:EE_
x-ms-office365-filtering-correlation-id: 9b4703a0-fc1c-4fb7-21b5-08dbb8297452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7khfIox21FU2kQFcVX4GC8MmAWATI7zTyibSl5sjYV1vMvU+bb5PmZIf/vjt80WDxFbQYomqPja8pMo5NELF31LAWcheU+RZuAw71qs5By5jCydb2o+fXlas+n+KqhAamDp/vOq5A4RxSiyTH7HSXRr+2jaQCrAEHo4EtN75eBqDM4a5CtfXvQuSViEiyEm9QmrfWT4T9utSjYKmcPVKhOb1HsdOOX8xCDw4ERoD/+nPQSGFVqUuInE0e2lGNFOe62a586jmD9bHBlGNgvB6zhmyQS6CN36gRHnezfD8TIRvFaYw0eCANew8NwEeQ1WQO98+KaDYg7/1cafE18uaQ1RZFm+A50DIyDIL4mnBdzGQ2q/GnZsEu60/l0LjewWVLKi7YUsAb0z/YiI6Z0uQZovPMckj0fqJc1lCAAESae9ssr0DLOuOPasLaTObzhEeufqtt6Tyn+YH8pxQur0ZuyDTQikaIoW0bxGP2yDv6mIm0bcBIxw0jSFnqbtb/cyR6lCVVMtnmlvrv+YiAizvzZQk5w/VVjKS1XRdB6gOBYCpye3rU75RWQcJhkB0QP1hLHYpIMdPevL3uRUoFAQXYBcksWzib1qjxrfGxbLaxrt1AEo6qbSnoFAgCWPld35OFB4wp/Jc7BoCoKlNpw6Ylet6RAQ5cvv5zekEmbcbjXA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(1800799009)(451199024)(186009)(7416002)(2906002)(8676002)(4326008)(8936002)(5660300002)(41300700001)(66446008)(54906003)(64756008)(66556008)(66476007)(76116006)(316002)(110136005)(66946007)(478600001)(122000001)(36756003)(6486002)(6506007)(6512007)(85182001)(26005)(2616005)(71200400001)(38070700005)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVh1ckx1N3dYYWZWeXF1VnVKNkVOZVZHa0RZdGNzTWRRaGdHUEcrbUFCdU84?=
 =?utf-8?B?YWczTXQ3Mi9tL0krQUs0ZE5ERXZrOUpUN1R3NGw0bTlyNXp4NjNYQ0ZZK0ty?=
 =?utf-8?B?ZEs4SlhNNWFIcWVKRFh1MDdPb2xTdks1V0JRTUtQYTV4WFRKSkszbTRxQmFs?=
 =?utf-8?B?eUZWRmRiNks5NDZxZ2RyN2ZNLzNVdkdvdEdKQ2dHYUZCQm5IODVQUXQrbnU2?=
 =?utf-8?B?YW5EQlZ6YnUwZzdKMlRzKzl0U3FKOThyVTQvcWFhQUh0a1c3dFdLVElMU2JF?=
 =?utf-8?B?M2dIOFdiN1Y0R0hZb09MRDh4K3RJeG95c0U3K3EraEwwd3h6anh4VXlzaERt?=
 =?utf-8?B?T1JGV21UZFVDMTZQRkxVejBVbmNkZUQ0ZVZWVkxmNUlBcGtPWWgrSDMra25I?=
 =?utf-8?B?Mi9JbzBId3luR3JaU0tBd0UvUnZwa015VnRsL2JtdXU5WFUxTG1XamFGejRv?=
 =?utf-8?B?ZzBTeTJyaWZzL2d0cER4OVdpTVVneVBhYWFCTVN4VEpTN1dHNkVwRGNlNUZI?=
 =?utf-8?B?RGJmbVFiOCtOZFpZRmVBYWU1UWRJNGJ1ODlzdVB5RnNKVXFPYW9jdkNabjdG?=
 =?utf-8?B?UjRFSk1vNkVFSm5pUWZ1RGlLUXlJcVVuYlBkblhiRGNkeGNBdk5jeStCYlcx?=
 =?utf-8?B?aGptL2dlWGFCZG1CR0xWK2ZoMjBydEpIWnNmbk1ReGtGaFl5Z29WeTlxQ3Rn?=
 =?utf-8?B?NmQvYnJvOGhEcy93WGlpVFdDclhST1dhMnFIYm5ZdXpJSW0wY2ZhSUZlOHJa?=
 =?utf-8?B?UXl5QTRKQXRTT2hRS1BRWGFBVWh3dGkyMjFlSUhibGpCNy9XTVFXMFJJQW5t?=
 =?utf-8?B?amRSM2Q4b2JjVm9pb0lNeWV5U0hKY2JuOXFqdTVBaGw5a0VVV3NqdHNLa2h4?=
 =?utf-8?B?T1V1cWVGV3hKU0lDbmVmdTUxdTQ0cFVKejhidWRFV0NMaEYyakJjZEZRWXJP?=
 =?utf-8?B?QkU4Z0k2WGwzRzB5YWk3K3hkY3M4MG94RzRwK1VwclBxREN0MWlVdTNCdjlJ?=
 =?utf-8?B?VEp1T0N4aEQzOFNMZEhBUUNkRVVUSVVMcGFYRnZQdjF6OG1yKzF2TVh6bUxa?=
 =?utf-8?B?bitwejVUZ0QxcWtJT2NZazMyY21MODNZQ2lldExkTURSaVZ5OCtIOHBzcVV6?=
 =?utf-8?B?RStVTTJ2WnAwL29GVmZpMUNhWk5kN1VNU2txZDdVbTBrcHJ3bjQ1RlVKWnE1?=
 =?utf-8?B?Wm51ZDRUakZId2V6NWNDV1ZrKy9EcnBhV0daRFdVNDR2K3lTdlhMbmRhcmd5?=
 =?utf-8?B?TS9HeGxDbzYvbFZvU040RVZiTlUzZ1FhRyt2cDZhZlEyU01OQUxWcDdzRktH?=
 =?utf-8?B?c0ljY0ZNOGFFOC8vbGp5dzNEbXlvNmVTdTJYNW1SZlR3SE5XVkVtZ1FEZ29m?=
 =?utf-8?B?QzVVYzRFTXBneE1oUVZKMVoxUjM2QTNCZmJ5M0hqYVNHVWRNUExkeWlWMnky?=
 =?utf-8?B?RDdUTkZlVjRRak9LRno4MThobzhNdk1mT1dBdVk4dHcwVDV4ZlpRb045YW1s?=
 =?utf-8?B?cFlPQTcyVndyanFkZ2hZYzhuaFRxNzI1TFpzSkp5NGo0ODZpQlJBQktTckI1?=
 =?utf-8?B?TXhLdGtXT1EzNlJNTXJsQWdjRTV5RDg5UER0NVpTdW1LRmxOL0lmRUJNRTJX?=
 =?utf-8?B?ZWgxMmFuOHYyZmRJK3hrZzN0T3NPQ21yNTBPOXlhY0UzQnBZaGhoTWRlYXky?=
 =?utf-8?B?UVI4RU82MWpWVlpIRVRLbWxGdXJ4TmdOU28xZWU4TjVUZG95TjFzRnFLQm55?=
 =?utf-8?B?dFRvTlM0d1JxY3VXaDFSTUladHhqR1ZHMXluWkNXSCtzT1Jwd21DR3BxZWNi?=
 =?utf-8?B?cjRqYWtYMytyZm5mS0VEYzcrdy9VMEJQTFV2MWhWbC96N0ZKQjVQbkU0d29i?=
 =?utf-8?B?MkpYNkF2L3hpN2dRY3N0WFNxSllzbzRHQjJmaE5wTXZ4Q0RHQUo0UEo2OUpn?=
 =?utf-8?B?Wmd0TkQzeDFOcHcyTE1YRnppMGVyRVE4ZFFZZVI4eHd6VDY0c2dmNW5oUVNj?=
 =?utf-8?B?VVlsVDMvT2RoUEMyblV2NmJiWUJWLzJscnNLb1hXek9yRnRUUXB0aUxSV0tG?=
 =?utf-8?B?cDFoVFhUSnVhY25Fdm5kMkRDenlQUE52T1hRSFFMSzFETjZWNnRDczlwZ1ZN?=
 =?utf-8?B?NGY3cy9hWFl6ZUlwZERVS09yaHJNYURQaVI3cCtnYzBDelVhWmJoeGovUXd1?=
 =?utf-8?B?SXc9PQ==?=
Content-ID: <C325300900D8A745901EEA78AB3D17C5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4703a0-fc1c-4fb7-21b5-08dbb8297452
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 09:27:18.7409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23BKP+aKp748Y7GQma80FXbLTnF9DexpD/OdDMrqORDBBadwpD6w2mkdNaqaKNvish6zBIT74+EPXqU+81dixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7915
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_924690081.275249042"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_004_924690081.275249042
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTE4JiMzMjthdCYjMzI7MTE6MjEmIzMyOysw
MjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtJbCYjMzI7MTgvMDkvMjMmIzMyOzExOjA5LCYjMzI7Q0smIzMyO0h1JiMzMjsoJiMz
Mjk5MzsmIzIwNDI2OyYjMjA4MDk7KSYjMzI7aGEmIzMyO3Njcml0dG86DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtPbiYjMzI7TW9uLCYjMzI7MjAyMy0wOS0xOCYjMzI7YXQmIzMyOzE2OjQyJiMzMjsrMDgw
MCwmIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO09WTCYjMzI7Y29tcGF0aWJsZSYjMzI7bmFtZSYjMzI7Zm9y
JiMzMjtNVDgxOTUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Jldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtidXQmIzMyO2l0JiMzOTtzJiMzMjt3
ZWlyZCYjMzI7dG8mIzMyO3B1dCYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2ludG8mIzMyO0lHVCYj
MzI7c2VyaWVzLiYjMzI7V2l0aG91dCYjMzI7dGhpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7cGF0Y2gs
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjttdDgxOTUmIzMyO2RybSYjMzI7ZHJpdmVyJiMzMjtkb2VzJiMz
Mjtub3QmIzMyO3dvcmsmIzMyO25vdCYjMzI7b25seSYjMzI7SUdULg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoZSYjMzI7ZHJpdmVyJiMzMjtkb2VzJiMzMjt3b3Jr
JiMzMjtiZWNhdXNlJiMzMjt0aGUmIzMyO2RldmljZXRyZWUmIzMyO25vZGUmIzMyO2RlY2xhcmVz
JiMzMjt0d28NCiZndDsmIzMyO2NvbXBhdGlibGVzLA0KJmd0OyYjMzI7JnF1b3Q7bWVkaWF0ZWss
bXQ4MTk1LWRpc3Atb3ZsJnF1b3Q7LCYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTgzLWRpc3Atb3Zs
JnF1b3Q7JiMzMjt3aGVyZSYjMzI7dGhlDQomZ3Q7JiMzMjtzZWNvbmQNCiZndDsmIzMyO2NvbXBh
dGlibGUmIzMyO2lzJiMzMjttYXRjaGVkJiMzMjtpbiYjMzI7bXRrX2RybV9kcnYsJiMzMjthbmQm
IzMyO3RoZSYjMzI7Zmlyc3QmIzMyO2lzJiMzMjttYXRjaGVkJiMzMjtpbg0KJmd0OyYjMzI7bXRr
X2Rpc3Bfb3ZsDQomZ3Q7JiMzMjthcyYjMzI7Ym90aCYjMzI7YXJlJiMzMjtwbGF0Zm9ybV9kcml2
ZXIuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO2NvbW1pdCYjMzI7aXMmIzMyO25vdCYj
MzI7bmVjZXNzYXJ5LCYjMzI7ZXZlbi4uLiYjMzI7Oi0pDQoNCg0KQWdyZWUuJiMzMjtUaGlzJiMz
MjtwYXRjaCYjMzI7aXMmIzMyO25vdCYjMzI7bmVjZXNzYXJ5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7QW5nZWxvDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDSw0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcm
IzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jJiMzMjt8JiMzMjsyJiMzMjsrKw0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMz
MjsyJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtpbmRleCYjMzI7OTM1NTJkNzZiNmU3Li43NzU5YTA2ZTVjMGUmIzMyOzEwMDY0NA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO0BAJiMzMjstNzE1LDYmIzMyOys3MTUsOCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7
Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjttdGtfZGRwX2NvbXBfZHRfaWRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lkJiMzMjsq
KU1US19ESVNQX09WTCYjMzI7fSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
Mjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTkyLWRpc3At
b3ZsJnF1b3Q7LA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopTVRLX0RJU1BfT1ZMJiMzMjt9LA0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7K3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDtt
ZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsrJiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilNVEtfRElTUF9PVkwmIzMy
O30sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGli
bGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kaXNwLW92bC0ybCZxdW90OywNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0m
IzMyOyh2b2lkJiMzMjsqKU1US19ESVNQX09WTF8yTCYjMzI7fSwNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVk
aWF0ZWssbXQ4MTkyLWRpc3Atb3ZsLTJsJnF1b3Q7LA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioq
KiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0K
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRp
bmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBw
bGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhl
IGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3Ry
aWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChp
bmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5v
dCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0
YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250
ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJl
PjwhLS19LS0+

--__=_Part_Boundary_004_924690081.275249042
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDExOjIxICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTgvMDkvMjMgMTE6MDksIENLIEh1ICjog6Hkv4rlhYkpIGhhIHNj
cml0dG86DQo+ID4gT24gTW9uLCAyMDIzLTA5LTE4IGF0IDE2OjQyICswODAwLCBIc2lhbyBDaGll
biBTdW5nIHdyb3RlOg0KPiA+ID4gQWRkIE9WTCBjb21wYXRpYmxlIG5hbWUgZm9yIE1UODE5NS4N
Cj4gPiANCj4gPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gPiAN
Cj4gPiBidXQgaXQncyB3ZWlyZCB0byBwdXQgdGhpcyBwYXRjaCBpbnRvIElHVCBzZXJpZXMuIFdp
dGhvdXQgdGhpcw0KPiA+IHBhdGNoLA0KPiA+IG10ODE5NSBkcm0gZHJpdmVyIGRvZXMgbm90IHdv
cmsgbm90IG9ubHkgSUdULg0KPiA+IA0KPiANCj4gVGhlIGRyaXZlciBkb2VzIHdvcmsgYmVjYXVz
ZSB0aGUgZGV2aWNldHJlZSBub2RlIGRlY2xhcmVzIHR3bw0KPiBjb21wYXRpYmxlcywNCj4gIm1l
ZGlhdGVrLG10ODE5NS1kaXNwLW92bCIsICJtZWRpYXRlayxtdDgxODMtZGlzcC1vdmwiIHdoZXJl
IHRoZQ0KPiBzZWNvbmQNCj4gY29tcGF0aWJsZSBpcyBtYXRjaGVkIGluIG10a19kcm1fZHJ2LCBh
bmQgdGhlIGZpcnN0IGlzIG1hdGNoZWQgaW4NCj4gbXRrX2Rpc3Bfb3ZsDQo+IGFzIGJvdGggYXJl
IHBsYXRmb3JtX2RyaXZlci4NCj4gDQo+IFRoaXMgY29tbWl0IGlzIG5vdCBuZWNlc3NhcnksIGV2
ZW4uLi4gOi0pDQoNCg0KQWdyZWUuIFRoaXMgcGF0Y2ggaXMgbm90IG5lY2Vzc2FyeS4NCg0KUmVn
YXJkcywNCkNLDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCj4gPiBSZWdhcmRzLA0K
PiA+IENLDQo+ID4gDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1
bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMiArKw0KPiA+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiA+ID4gaW5kZXggOTM1NTJkNzZiNmU3Li43NzU5YTA2
ZTVjMGUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMNCj4gPiA+IEBAIC03MTUsNiArNzE1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQNCj4gPiA+IG10a19kZHBfY29tcF9kdF9pZHNbXSA9IHsNCj4gPiA+ICAgCSAgLmRhdGEg
PSAodm9pZCAqKU1US19ESVNQX09WTCB9LA0KPiA+ID4gICAJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxOTItZGlzcC1vdmwiLA0KPiA+ID4gICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RJ
U1BfT1ZMIH0sDQo+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3At
b3ZsIiwNCj4gPiA+ICsJICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfT1ZMIH0sDQo+ID4gPiAg
IAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLW92bC0ybCIsDQo+ID4gPiAg
IAkgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9PVkxfMkwgfSwNCj4gPiA+ICAgCXsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWRpc3Atb3ZsLTJsIiwNCj4gDQo+IA0KPiANCg==

--__=_Part_Boundary_004_924690081.275249042--

