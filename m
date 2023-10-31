Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5447DC8BF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 09:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C09C10E41B;
	Tue, 31 Oct 2023 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88F10E41B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:57:23 +0000 (UTC)
X-UUID: 7e9e14be77cb11eea33bb35ae8d461a2-20231031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=1gdAgSCAwr5rInWoMfTeSip/19R+uaacMabkFJ4BQq0=; 
 b=fsME5IlxmFSJHeRdCnY1hqRCYh2a8qrVxtrxE1uXefrjzcFTkqSd3xF5lqmJXk5gUTlhBwxcHaMb/tqTFPJuWdV1SPM9x26xtf9n7wKpG5UiX1wnneqNZDZHgFxUN0y8Uoo46b4rEKasyj6efwyHF5sNg55D0rI2I0Q62AB0swQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:59712f96-09dc-4dc3-8df9-bd8ebf37ee93, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:06dad694-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e9e14be77cb11eea33bb35ae8d461a2-20231031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1240581793; Tue, 31 Oct 2023 16:57:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Oct 2023 16:57:16 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Oct 2023 16:57:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAG3jPOOWTYoBgUNNIZaUimT2PrdAOoiGa/ibi1o3vCWYWiTD0JN6YeUOK2kTlmpN2TCljVwAScD7y+5b45yy6BA4d3ur5ByH4yyeOznZWW61MiVjJLGXwHjsh1YS04D/k9z/UpTLp/ZxHavB2lIlAhrmoDQMAkPx/g8rnSIFdx8FcAqz353/qJ4hJu16QNDrFdvbHRk1NpcbsbI2WhBp4BT6AhWNlnUiL//AfyYBjsS2+vqKTgYV+vngl0TwBPf8M+5w0+9qUZGEc43OHcTnzP6ZQYUSL2upEWwrgoKOqNt1qdEnV70TwOPmya0ilvCQCoahlEUDsujBTOGhQCwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gdAgSCAwr5rInWoMfTeSip/19R+uaacMabkFJ4BQq0=;
 b=e5BM6C6gaNxciAoiAXKhWjcqwZ6GdA8FIxLisGXivN9mM1Nmp6W0OU3tp32+iEOX7yc2I39CAgENvwlSmIFbRRAmTNPkMVIo0K7P2dOWRPyGjAuLjOeHj4Le3sgKkcv7xezTg+02htOaddlAw8gzH58ocfaogK0hNS1k2fLrH1fnQw2/LviZzSILOobiU4Alqp3caW3WGRmydsJWJL9CULUl9AF04HEAc0Dn8ASfRFUwMJmU1WFZkkPVqBbfdA+UOQLTadqK28aRtNj2eKf46hxR9hb7YVlDySGymrRIl+WZ81UT6l3Q59pE+PlJpG08Jr+uhia5bsnQssmXfZ4ZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gdAgSCAwr5rInWoMfTeSip/19R+uaacMabkFJ4BQq0=;
 b=RUPRSM0WpwozT27Hbng1dD6+Tu10h92fP2mpsxxd9ErWRFYdg9k615C5Q2fzst2expZFMB2DWX9uFTrMXfj/b4pJHmzmF/9Sekj0YUWSIOclmeR/7xvOH5C6pxlItSWa6r8YvU/6M4SQmULdjAXFP5CmS8dW4SSwJasq47PSQOE=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI2PR03MB5941.apcprd03.prod.outlook.com (2603:1096:4:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Tue, 31 Oct
 2023 08:57:14 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::9e24:980f:fc1d:d4ba%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 08:57:14 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Topic: [PATCH v8 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Index: AQHaCxf9Uo9mK2d1NEuS6fN2fs5uo7Bit98AgADNyoCAABShgA==
Date: Tue, 31 Oct 2023 08:57:14 +0000
Message-ID: <6b4e8d910f13ebc331a3daffbff4e7326872b753.camel@mediatek.com>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-17-moudy.ho@mediatek.com>
 <169869400953.1994265.3434527810955780048.robh@kernel.org>
 <e321fd1aad5f695278297d79531370356d82657f.camel@mediatek.com>
In-Reply-To: <e321fd1aad5f695278297d79531370356d82657f.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI2PR03MB5941:EE_
x-ms-office365-filtering-correlation-id: b09e730c-0a69-4b56-3a8c-08dbd9ef6072
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VvztSNM/hzi/QB7WwXmgLmYmBBmfh3iWBsaMws5r5Trn7zz2WayyG+WZPiJU87hAjSeHaixfzAtVBGQ8a4upFZPOIv4AcZ/yqw7I25dl0GAZomrNKlE1wqXXmY4kokhcLNKr9Dldy/lecqql43dvIY/77sSjj2HIjQPdOKj0HPc9XYz45iYRAXavz4NYzFZnCPcEn37ueqVvQuiqLzx+n8ZfoLqJEkhNvra1Dj2izKqZHUfUB38pjwD4TqXzW7ZFmPgOycObyRGVJbdnDAadnvAXVILqMof+JDEhsqB6WLjCOUlJ0wk1TYwHv7qlmZCshe+MO7JB1wDcaAVJ44qyxM9TeWbcF6XYSAjKPsWkus3/vWGKqmvHVUb0qVD4gPjjeaeuwU8m73T4W/yO63BAaGrNgcvfErzzTc4kBNSJF9sERz2J/QWejNzDMoCeu/6VCJKIF6xzdROtnabsdSWwjw0qPNVvWDW7lbk4/WFgC/rWPr/Vw/1ZEpCgThM7/AiYY2VQ0F7uOPPCmRLkuy8t0pbPeTStWNjS9UkWKZrXg1F/fmZy34NZwkWzsWSpceBZzQGfv8dooxAtUJrWFePr8LLQeddgudcrV/Eyb32dLIbEtd4/tg/UTk3Pucd1mRHOLV9LDRiRs3BM6WxGMx9RiWFTTUJk6zG83OZnH9V9TPJBCumRTKqRpty7vJ3uW+BkY++Pb6+AMpOSQ/TBRY4BkC6mTFDOAvOL0eegi3JTGQQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(4326008)(6512007)(2616005)(64756008)(6916009)(66446008)(86362001)(316002)(2906002)(66556008)(8936002)(66946007)(8676002)(54906003)(5660300002)(76116006)(66476007)(7416002)(85182001)(6506007)(71200400001)(36756003)(41300700001)(38100700002)(4001150100001)(478600001)(6486002)(26005)(122000001)(38070700009)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjN3TVQ4SU90dlkzcHA5eTd6THg2cVB4eFRDd1c3dEZiUUlRUVpja1dUOHFY?=
 =?utf-8?B?MUxKNjU1TG1SNUdiZnh5RnZZMHdmeW4wWUFuWVJpQWEvbW5vdnZCOG8xMHgz?=
 =?utf-8?B?UWlaYnNxdTVTKzNEcHdtTHVKcW1nTDdPUjVPRUF2dlFPSUhpWHNtRjg3dUhD?=
 =?utf-8?B?RXBvUTM3VDgwM3NCeUNoN29aS1ZtR08xcHlqL2tjSEhQSUdHS1NtS24yTzlm?=
 =?utf-8?B?aEJDakt5Szg0YnFJa1NoL0lmWUFRNEpwZVhaOXFIeklGZjBDUGpvakl4R2VM?=
 =?utf-8?B?VTVSVkdndHhoY1BySkVtQzZ2L2FIaytvb3NRcGMvQUhUeWk5V1kyWm5YZE1D?=
 =?utf-8?B?YnloN21GakRPM3l4Q08vQ3JIdWVMMmxkZ1gzTTlYT3UyTkdDcUF1MWFEMnBJ?=
 =?utf-8?B?bXNJTFE4MHZRcW83SDJxZVdHTE9DSXJ5bnI4Y0g0VnUzQmx6a0owR2dVdWQz?=
 =?utf-8?B?L3BCeTk4Z3ZsSXhuMDRib0ZZbzU2dWY3VEhMbG5yNU1uZlFCL2V0WGIrQ01l?=
 =?utf-8?B?T3VzaENrTjVaL0ZYelJCUGN4Rnh1SWF2c1ZIUFZnNDVWZkxyNENuR253SlJT?=
 =?utf-8?B?Tmluc0dGbEQybjNWMWI2M2plWloweG5Sam9tTndYWWk1aE9UdzArN1N4QTU0?=
 =?utf-8?B?ejRuOGxVcS9lVk1XWkJjOFl1aDNHN1BWVGV6QmJ1TUM2endna2xiZ3lnNjFv?=
 =?utf-8?B?bUFSMHY1RDR3ak5jdUoyU1gwTjQ3aitmYVZHT1RUNStaZzlLWmRQcXdVY1RD?=
 =?utf-8?B?cHhCOHd5UkRCZ0dMU3BEMm1EVkJYRWNTbUxXSGlmZDRZaThVbnNCL0NxaDhq?=
 =?utf-8?B?em9zdG02S0ZpOVc0eVgzYjJkdFhQRE1GWDhmSWdlMHlUcUdJcE5WWmRrb2gv?=
 =?utf-8?B?R3dYMU9LdkR1ZHpVVVhxS2RVTDlscWhCK3d3OEcwV3g1SkM5S1ptTFNrK1BE?=
 =?utf-8?B?ZU9HRytrcXFjZVI3MHFFNFAwbmdLWFIxSngvVXRSODBKeGFQTEtZV1lKc1NM?=
 =?utf-8?B?V3hrcitrNnM2amdGR2NIZGJKM1A1bFowcXVzN2hWeFRlSWxQWFVkc3lKb0dZ?=
 =?utf-8?B?THk4SDlLNUVjc05aZFgvcE9UZGRsajlURXJabHFYSEwzdW9qMTlkQkRmT3dp?=
 =?utf-8?B?MDZ6V1RSQ3Z5dFZxY3h0REZoaHpZMG44TnlHcjdkenZaV1NPWnU0eUFkTUlh?=
 =?utf-8?B?VDY4UW9HQlR2dGdRUzdSMnUzalBOK0cxN1ZwRGk5UFB0bTllcUREL1A0b3Bz?=
 =?utf-8?B?VnVCNGtQazh1UDZjQkN4TVIwRHhXOXNmUUV3d2RGK2IzOE1qOTFYeDY0Z0VT?=
 =?utf-8?B?Q1MvcXlyaDNwaW9WdCsrb29yQ0R3YzBldmFGRlZlcDFkN3I5bThrR3cyYlJV?=
 =?utf-8?B?VUJreG1xRTEzS3pmZFVlOWVlNVFxdEVWZEVZd0tsTUQ4MlhsbnZZWklBdS8x?=
 =?utf-8?B?d21PTWp6SGpxdmhPTGJKZFdFU0VLNGErajVkSXpsNjVGQVJyc0haeXpjZENt?=
 =?utf-8?B?VWRJdUQ4bVdUZTJMTk1WVzRMUVRIeHJpd1RQellmRjQwRU96OHo4VU1WMEJC?=
 =?utf-8?B?YVpMVG11R2haenFDT1pRMkxKczlyYnEwQTNaa1g0MXZqc01CZmtUcXdxNUU4?=
 =?utf-8?B?Zm91NXZpd2puN3puOU5LbnR4WmZsVGZWaHBIbzhaSUoyTFVRSlMxSmR3end6?=
 =?utf-8?B?bzQ4Rm5pN3crMThrZ21wNjRxRlhnVyt1OXZLMDdmZm42NXA3bWgrVEJWbjZ5?=
 =?utf-8?B?SjZxRDEwejRKUzdVRnZuZDdaRXFWOE1hbjlHMm5DWXQ2VzdOY0U5QTJaa0Zq?=
 =?utf-8?B?N3ljVkxIUGZJNi9mWWhUTWM5dHo3RjIyMG91TTNyQ09VcHpGbUN3eXd0ckVv?=
 =?utf-8?B?YmI5OWdlMm5IN0UrckZvbmo1V1pBOTRvTW41SmlDZlFCZ21KYTFEU0ZBZmpF?=
 =?utf-8?B?akNwbnB6NmphMlF1c2tLZk82SUxuT29OWmt4Y2VZUHVlblF6OVpZVE1rMzhr?=
 =?utf-8?B?Mjk5eElXUWxKdkJuMS9ST3NjaDRsQkhKT3p1Wk53U0hvd01HYTRCc2x3Yks5?=
 =?utf-8?B?eTdWRUZMaDhzaTQ5RE5mbGRyOGRmOURURnhsRVNISHhrVjZzRWFCL0F4M2R3?=
 =?utf-8?B?RXZONm1xYzNMU2drYUFLSnIwQ0dVeUVQdTdDdzU5TWo3bUtLckd4VXdaRHdq?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1A2BF25B6601C47B1F1D8F951F0C9C1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09e730c-0a69-4b56-3a8c-08dbd9ef6072
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 08:57:14.1522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B/iTbykmJwM5sIxidlzI/tHh7VWsmGEZAlLP9Hq5jsNRzkH3DozBaacn4q2Cfvh5k+B+LO/ZdKXDJSjQU4Zsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5941
X-MTK: N
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE1OjQzICswODAwLCBtb3VkeSBobyB3cm90ZToNCj4gT24g
TW9uLCAyMDIzLTEwLTMwIGF0IDE0OjI2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiAg
CSANCj4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cw0KPiA+IHVudGlsDQo+ID4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gPiAgDQo+ID4gT24gTW9uLCAzMCBPY3QgMjAyMyAxODowMDoy
MiArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gPiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyBm
b3IgdGhlIFBBRERJTkcgYmxvY2sgaW4gTWVkaWFUZWsgTVQ4MTk1DQo+ID4gDQo+ID4gdGhhdA0K
PiA+ID4gaXMgY29udHJvbGxlZCBieSBNRFAzLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGluZy55YW1sICAgICAgICAg
ICB8DQo+ID4gPiA0DQo+ID4gDQo+ID4gKysrLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+IA0KPiA+IEFja2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+IA0KPiANCj4gSGkgUm9iZSwNCj4gDQo+
IEkgYXBvbG9naXplIGZvciBub3Qgbm90aWNpbmcgdGhlIGNoYW5nZXMgaW4gdGhlIGRlcGVuZGVu
dCBwYXRjaCBhbmQNCj4gZmFpbGluZyB0byB1cGRhdGUgb25lIGNvbXBhdGlibGUgbmFtZS4gSSB3
aWxsIHJlbW92ZSB0aGUgQUNLIHRhZ2UgYW5kDQo+IHdvdWxkIGFwcHJlY2lhdGUgeW91ciBoZWxw
IGluIHJldmlld2luZyBpdCBhZ2FpbiBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPiANCj4gU2luY2Vy
ZWx5LA0KPiBNb3VkeQ0KDQpIaSBSb2IsDQoNCkkgYW0gd3JpdGluZyB0byBhcG9sb2dpemUgZm9y
IG1pc3Rha2VubHkgYWRkcmVzc2luZyB5b3UgYnkgdGhlIHdyb25nDQpuYW1lIGluIHByZXZpb3Vz
IGVtYWlsLiBJIGtpbmRseSBhc2sgZm9yIHlvdXIgdW5kZXJzdGFuZGluZyByZWdhcmRpbmcNCnRo
ZSB0eXBvLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0K
