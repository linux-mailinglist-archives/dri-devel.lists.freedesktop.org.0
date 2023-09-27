Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB567AFB5B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 08:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEEF10E029;
	Wed, 27 Sep 2023 06:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6B10E029
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:50:08 +0000 (UTC)
X-UUID: 164cf1345d0211eea33bb35ae8d461a2-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=X9cmfquMJ+igiq1pKa0rpgZcjMvxAgK2HYMXFbfAwg0=; 
 b=Oq5ZeW5AgitHvRhuU3s9KfxNwX7RCjtxYflYgcDUEpCXXOTXNKDOz0UBB5YrxT4DX7cexUXS6weoc/1jx+QUXaHupOGVc5oiN578N4580emaMxXmImanNO4q1UYB6uA+TIUTtyz2bySnK37vS1IY72zME/LQQ1nYhCwb/KeDTPw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:c8aad5b2-1ec5-43fb-a31b-e444c3f31397, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:7fa62ff0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 164cf1345d0211eea33bb35ae8d461a2-20230927
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2015978602; Wed, 27 Sep 2023 14:50:04 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 14:50:02 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 14:50:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXP8vUCOeunolbSiB/C7Q8eTiJNdNSKJUENLdFKuXj6AItLj2PQAPx1wAKWU7XARGJ6fzZafPYPKEAKRqs9c4i9MGd2q0MfUL/kse2ibcxIrdj7FWHI0rqbfPomJwN3BFKzIDgWtyvP95YIQWqQlXfM4tM0J32J+LTUEXk46SxxukYiN7rq4osoojwF5yjmXr5EhkXh+JL1fEN54ZgcSn8hqJRDP3ozg3OSzJmJ7x+xIZH60VH9uTWoxKeUrvwkxDxbXxU1z4d7NyI9rqQU+7WJzcCoSPmn8axSchdknvhH40IcY6PFjGbgJI4FRhe1i3IfWZTOG8XF7h+iauBA9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9cmfquMJ+igiq1pKa0rpgZcjMvxAgK2HYMXFbfAwg0=;
 b=oM0y63srTxXMQ+9OB2vX4dQZ6Bz9XzngW5d7EhThsZnRqOkKMabg3RQBWsaHRCHudmVSMXGvHKkymwfug/vNqYHlCrLsGBJFaAHf83tBGBzvmLxWe4wF1PH6hmk/WW4+7xmiDj38mWclPdxyrIXBcMiHpWhp/Rjn3cNYToNyCPXlr0fyJt3GgyaO7zxQfoDgAO/eSu1qdXsOYJaclJusii0yfgtwXOJ8ZWX+a6GMncS6ifK9M3dLupA5zKe3X83wBNfEayILZcJy5AeNHXbreVhNCQxhLaDUKievaanOAK1Jb1swryn0f7fTNTktl0+DWZb7eSEQRx4TFw1iPZGs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9cmfquMJ+igiq1pKa0rpgZcjMvxAgK2HYMXFbfAwg0=;
 b=qtGNp7d3DnNbAE2xLQHAyenA4u05614wafyWFrSyh5e12z+gSu3iH+v56e5e0+9MqgfaQuLVEmr18ARzPcR65GoUGMYVYaonxXsUXreccGBYAaAqMQXQvSv17RwD69e3UCcl0YbtE8oesloXPMF2mbT9FMUrHH88ZHgSHySQXe4=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by JH0PR03MB8021.apcprd03.prod.outlook.com (2603:1096:990:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:50:00 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 06:50:00 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 00/16] introduce more MDP3 components in MT8195
Thread-Topic: [PATCH v6 00/16] introduce more MDP3 components in MT8195
Thread-Index: AQHZ7SViMKdAjIAmm0Groxf/Vs59i7AorsYAgAWUmYA=
Date: Wed, 27 Sep 2023 06:50:00 +0000
Message-ID: <51a34495c7ff1cef24ddd2742f617fb8710bad79.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <4f15a450-4344-ed5a-0504-9a2f0a9daa0d@linaro.org>
In-Reply-To: <4f15a450-4344-ed5a-0504-9a2f0a9daa0d@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|JH0PR03MB8021:EE_
x-ms-office365-filtering-correlation-id: 412f47b1-6665-4600-ad03-08dbbf25f856
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uvnjFrYmOX3PkCugr7oZJOt6CwvMlIaNA5uJkJwwjGivI06WCLZ6F4YbBqXX6W6jFFTuAkTkd5xLtXdrmaVWogg1z9UltxYfONl/3PjVUtYMfkQjXKrvLlV35948bEC6Vfbn6I3xRTECtlSlCD5aN7jeLJMOz13/EUGZCgySBditY9ADIKTlhSKJK3Tlf0uJ9SWZZ+xDU6+dWOB9r0aTzk6IyCGLd/c4t/knsc/ZxKvyqVHeqkhJJDGMlO9Uo8CjHYgQThnSTFmqlt01HQqorjwyaKVAYSJu78PSeVLEwOho6U3umqW/ldm//H0dHXfnPerqzIk6AF04QLjqZnY0g6RBjo5rNYau7Xq32pzP9xquMwfLF03rQC7QT6oM0A1HiUc2Ezy4OWA5IW4eiOlD+zERpt87+kTZ0rJBbalW2SRu8gynUTrCtB1rZlxFfY6rzmZAs5f7olMjSgq0WDCDGA3RvQ8KdCa9RsGA16speRz/2LxmU4X4QVc4WHgUr4wWcj8g6DfaWBZV+G69klY6R0GCUjx/xgjHII+zcxD/vXJbPIJvN8kFhQUwtMzcizRpK+f4nQpopybEJrypUB1z+ukrLP5Vuf2Bm9XB+HMqxreokebMFo98uIvuQA6dVlIf9CWvEDg5uwRqIU3uLoSTlrWHtGB547Zf9lpFwvWet8MVwIKrzGoAzfRmeHs6J0yO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(83380400001)(26005)(2616005)(478600001)(6486002)(6506007)(53546011)(6512007)(71200400001)(86362001)(36756003)(85182001)(38100700002)(38070700005)(921005)(122000001)(316002)(54906003)(966005)(66556008)(66476007)(76116006)(64756008)(66446008)(4326008)(8676002)(8936002)(110136005)(66946007)(7416002)(2906002)(5660300002)(41300700001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c01wcVRpd1dJcGhyZlQwcTdzMWFRaHF4ZXlnaG5aQXFvUWVrUWc3elE0UXBj?=
 =?utf-8?B?NWQ2YU1uODJLdmRBakZYeHU1dnZiWURPcHZQNSt1aWFucXVneG5WWUpCaVFH?=
 =?utf-8?B?ZW91UmFYUkNiV1pZa3hEV01ZdzVpU0phQ25RY21Ed2xRVlNlTGd3MU5WSDZP?=
 =?utf-8?B?eTc0S3loS2hMQ0NhbWtDWVFwTVdhNVhFVUpmaC9LOGFRSjQxbUxKQXN6a2RJ?=
 =?utf-8?B?czFoUjh3aVVRbnEzU1l0cG1NUkZHS29lcVB6dlhzZFN1LzNQa1JyNktjanVV?=
 =?utf-8?B?MTZNWkIxSitkdE1WQVlLRUtZUDhqZWd2R0FPcVQvcjIvMFRPN1N5Z1RyKzV6?=
 =?utf-8?B?VFRCVTFSSXAwNlRiMU9ET3dLRjUvS28rVHVwYVRrYWVaL29LUEFYZHNMTXEr?=
 =?utf-8?B?ZWgxY3c5YldQSFhEM2NuM3pmWGZCN05xZVk3S3l6VDZLa2NBOFc5WE13RUZr?=
 =?utf-8?B?bzMyM2lKNVE5UUkzMnFBQWtIbHB6WkRqcDU1Zno1YkQ0cklkZDBwUTdDdGFY?=
 =?utf-8?B?d0J0NHJuQnRsQ0NRTy9YU1BGc0luTkRiQk5VMms3VWpGc2NIK04vWlU0SE9h?=
 =?utf-8?B?MEg4L1J5SFhnZ2d2N29sODR1MU16Umpzekd4WXFsNDJvQkZTWlZqRFJHSFZk?=
 =?utf-8?B?dFl3UjVSUW8yUGFRK21YZ1pweW9UVkJVd2JqSlUxcVVxTzJxLzFqQmZ0NE5K?=
 =?utf-8?B?M3Bvck5VV0RnTWxJWEQwS2ZXSzBzS1Rud2JUbytrOXc5dXNSd1Z6dTBVY0Zt?=
 =?utf-8?B?N0hrZW1OUmY4b01XVS9mNmM5bzFmRjA3cjlIWDBRTmxtV1l1UE1hUEFmcVow?=
 =?utf-8?B?YUhmUnpvUHoybFNtNkYvci9RSjlFSjB1VFk5RjZIOTBsa1duUWZYUTQ2WnFz?=
 =?utf-8?B?QVgzcnM1dVpFRkVGMklFeUVBZ1h2azRYTUlFQ0IyOWFmSUlaMVFnT3ZlbVpJ?=
 =?utf-8?B?VWo4ZnJmd2lHR2tYaHlzanZlOTFjWCs0YktKeVFweWlSZEp6MGdvQkQyNmpx?=
 =?utf-8?B?THJYTGhjM1lzNWs3eW5VdFBOdGlwMjBsVHE3YkJNT2tFZ3BtN0d0OExwWEZO?=
 =?utf-8?B?cGRXTTJtUXo3WlZlWW9Nd1BMNjBEL0hSZmhIcFRsTllzR3pLN0VyRWlxdExi?=
 =?utf-8?B?VVZzNXpoV1BMRVQrUzlvZmFpQjJyNzI2N1pRYUo5N1VSM0I1Uy9sZVpPWkQ0?=
 =?utf-8?B?RFVMN0hudXVrdi9JNG1qQmRUaWNQTVRjQnpleDE1U29jcW9jL251RWdzSzBC?=
 =?utf-8?B?NHJwZDBlMmJnNHE3RWdQbzdvVy81U2tpK2IxbThZU3lEbzJOaXpERWVpM2t0?=
 =?utf-8?B?K2N4bkpZaDAyUStTZmpuOUNlcG16Rm1TdXZyTGZxWGszZ1R1OXRGbmZIckQ4?=
 =?utf-8?B?Z1V6M2NDem9HS3Rpa09veVV4YVZxcjhBTXA1RFllVVVXb2Jtc3k4MkRFQ1Ez?=
 =?utf-8?B?a094R0F6TDFPdTdQSmV6QXRkUU5rRmw5MzF2Y1NMNGF4c3c1ZHlCeWUvaTlC?=
 =?utf-8?B?S3E5dHRKUXN2Q0xUZytSRkhaYVFuNmxOejVkRWRhVitFMEwwcUhhZnFKWkt3?=
 =?utf-8?B?Umt1NlhvTXpiN0I0b2RQNU82aU80T3BsNVVBS0F3UVRHTTBBS2k4SVF0cE1Z?=
 =?utf-8?B?M0hWUU1aczl3RTBaQXhVTkM3OHBHTHp1OFRzN0RtcTE2a2hjdHQrZzRwWWpt?=
 =?utf-8?B?SlIwaUhqSUpBbTFTMUZoNzQwcXltdHNTYnluYTZMSlFYekcrYk9NaDFKd2VW?=
 =?utf-8?B?OTd1TVdhQTBLVWswWnpadFJTVHJDV0pGZFZTV2c1U20yUWd0R0dkOUM5cjlu?=
 =?utf-8?B?aThYbi82eEI4cWdka2FidnpVcFZLZlFpR3d0MEk2SUUxWDJvL0IwZ3k3TXFW?=
 =?utf-8?B?VlJSZEFvdndZbEhxaFNIdzkvME5YckhmSERjOTIrTU5acnhHbkk2aUk5aGVK?=
 =?utf-8?B?UlBZa1RjdDFwelE4UVF3MGFCNW1lcDgvQTBwelllUmJpaVNwRE15WG42NCsv?=
 =?utf-8?B?YVcvZlBNSSt0ZTFydU9OcFh6cloyYVdSYkpqRVZEbjFpVDlWUmFDejhVKyt6?=
 =?utf-8?B?aW5FMVR4ZVp4ckZueTU4NkMzcmEzZFlBTjEwYnBrKzB4Tm9YYm50MEhoQm9I?=
 =?utf-8?B?QVJ3bVRUc1gzclVWSGJJMzR2bmh3WWlHWWxaejRraUlhdjdWRVBpdlZVMHFK?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C6BF6278D9D084FA2D0902CC84EA926@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412f47b1-6665-4600-ad03-08dbbf25f856
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 06:50:00.3851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gschn+FDoZIgP0sjOL57eADg8hbt2iFfglg1zXHSU1wkfOAFsoA6mDKYQkxoEb9TbQQis3D8xOqI27V+IOEJ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8021
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.842300-8.000000
X-TMASE-MatchedRID: ge9e+QLSeazUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tH5YQyOg71Zb4qCLIu0mtIGHZ+cd7VyKX4nz
 kw7itaMi+MslyyVDSuEh4Y4fHA6Yv0RCs70uuPqGtxpVfAE2l7+PmXK6rwg5BE+5bAfeaWupoPn
 UBy5rqazqMk+tGjwDokZOl7WKIImrS77Co4bNJXQtuKBGekqUpPjKoPgsq7cA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.842300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C14ACA4C2FEE3AC24FF782E0ADCDB1A7A097637C189FC6BCC68C559A57E86E012000:8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTIzIGF0IDE5OjM2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDIyLzA5LzIwMjMgMDk6MjEsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IENoYW5nZXMgc2luY2UgdjU6DQo+ID4gLSBSZWJhc2Ugb24gdjYuNi1yYzIuDQo+ID4g
LSBEZXBlbmRlbnQgZHRzaSBmaWxlczoNCj4gPiAgIA0KPiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTc4NjUxMQ0KPiA+IC0g
RGVwZW5kcyBvbjoNCj4gPiAgIE1lc3NhZ2UgSUQgPSAyMDIzMDkxMTA3NDIzMy4zMTU1Ni01LXNo
YXduLnN1bmdAbWVkaWF0ZWsuY29tDQo+ID4gLSBTcGxpdCBvdXQgY29tbW9uIHByb3BlcnRpcyBm
b3IgUkRNQS4NCj4gPiAtIFNwbGl0IGVhY2ggY29tcG9uZW50IGludG8gaW5kZXBlbmRlbnQgcGF0
Y2hlcy4NCj4gDQo+IEFuZCBpZ25vcmVkIHByZXZpb3VzbHkgZ2l2ZW4gZmVlZGJhY2suIFRoYXQn
cyBub3QgdGhlIHdheSB5b3Ugc2hvdWxkDQo+IHdvcmsgd2l0aCB1cHN0cmVhbSBjb21tdW5pdHku
IEl0IGZlZWxzIGxpa2UgYSB3YXN0ZSBvZiBteSB0aW1lIGFuZCBpdA0KPiBpcw0KPiBub3QgZmFp
ciB0aGF0IE1lZGlhdGVrIGlzIGRvaW5nIGl0IDooDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KPiANCkhpIEtyenlzenRvZiwNCg0KV2hpbGUgc3BsaXR0aW5nIHRoZSBiaW5kaW5n
cywgSSB3YXMgc28gZm9jdXNlZCB0aGF0IEkgYWNjaWRlbnRhbGx5DQptaXNzZWQgY29ycmVjdGlu
ZyB0aGUgcHJvcGVydGllcyB0aGF0IG5lZWRlZCB0byBiZSBmaXhlZC4NCkkgc2luY2VyZWx5IGFw
b2xvZ2l6ZSBmb3IgdGhpcyBvdmVyc2lnaHQuDQpNb3ZpbmcgZm9yd2FyZCwgSSB3aWxsIGhhbmRs
ZSBzdWNoIG1hdHRlcnMgd2l0aCBncmVhdGVyIGNhcmUuDQoNClNpbmNlcmVseSwNCk1vdWR5DQo=
