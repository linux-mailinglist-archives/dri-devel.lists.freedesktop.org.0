Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7219880946
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 02:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60FE10E66D;
	Wed, 20 Mar 2024 01:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dMOO6tBU";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nQYk2Exg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3243210E66D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 01:55:46 +0000 (UTC)
X-UUID: f5068b90e65c11eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=mjf3Z1NqyWOwwIVevlTlV0OCcFE93ewy0d2xhO/49ts=; 
 b=dMOO6tBUQHba7zPFrVEzgM0BovybsTSqKFoxdKsdPStxzsTL/WY3xu97/NcjPJGkr1jI0nGAQwyvsFiK/TvZO/RO+X7uVzUdVpOmho8PYMBCBl1vw16VzXjPPadDpz1iJFXP+9lopAL5i4UJ6NsHpSJ5KHNSSzYMRQfHCdUtzoE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:38bb5297-3666-44bc-b583-ff3fb8c78dc5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:74df9990-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f5068b90e65c11eeb8927bc1f75efef4-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1566158847; Wed, 20 Mar 2024 09:55:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 09:55:40 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 09:55:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA4bBi+BhEfMD/yXQsBor3KltNzscrKRUHsXXK/RMiCKBztXxBgnWzGqXcj96z3BR98bflq6MvrTnphTvx63EqXN5SDYkcPz1Ofqx4DwNt48CWVYEoZ/Z5JvvJzyCOVTeRE48biy4ZGtGjzCf4/jX41QRHMh3+RA0llq22aZJlBgfFoA6Ra/8iQdUCLvEsuGX9X/Z97gKLJv6QOBCX/n7RKl0XyS7v9yX6FzpzxerK5cVxOAaJ8Ho25F4TwDTZ5ASNlrtWCSw7AzAsl4iVIOpc+V6/q0CWc5l30yJYvekxyDUr+oCd0sv3SjyFKffvBucaDS+l1J/DAW8d9YHHO8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4vh3uUbUHTKfFWk4bYsvH0oj5afsOzAUpdPXj5ggdE=;
 b=QpBuE4bkbo4O3BkXZC4GixhQplMAZwGsyXdkYP6uAIMWvpFKn78IlbNBl1D93CyUM0CSXvdWr52c8ei2tE40zj/XvTxQtCB4p7TbBEJkKnuff4+x68H0sLURpPcXb0TtMI/9Hlev7IV1ge0dIyzq3nd3ZPFpdrwltKlGxw5hvRkd0ATnszhI4gBYmobhySMEY8stMfwBa1jVMudCtCEEy2DJPB6anZPFriNM2rjIM8chgDhAMUHbLHXWObx39g6c72Fuk2uVotd6hShJJdHAVzoKt/O+JoD8+fmt8SYk/kP87HfIfo97YFAwuYXIQT/GgPB8WwdZZ05g8wlaV2xN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4vh3uUbUHTKfFWk4bYsvH0oj5afsOzAUpdPXj5ggdE=;
 b=nQYk2ExgY7ZhZblqaGC+48Ol9yvqx+jkCgizchqo7ubz9u8timCbNlCqTahyCLeEXqwGFozIWYxviiQ3Arix32EfWPAuMgZ5kGTTZIdA9RKT5X6ASPzr990nQ2LhxXskYSJuD34bWcFu6I8+ENbUrWvdVOPS+JcBDhpx929n2ek=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6978.apcprd03.prod.outlook.com (2603:1096:400:285::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Wed, 20 Mar
 2024 01:55:37 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 01:55:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 09/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.c"
 to "mtk_ddp_comp.c"
Thread-Topic: [PATCH v2 09/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.c"
 to "mtk_ddp_comp.c"
Thread-Index: AQHaecvKujYgoPoPM02xO7ChU3d0TbE/39CA
Date: Wed, 20 Mar 2024 01:55:37 +0000
Message-ID: <3448d96a52877991a50125c7f1bfb36ae1d741d8.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-10-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-10-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6978:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4iP+ZDJJqzzxMki3dqMSFpElGkRECnw/CkR366DQPfT8wxcs3DCn+qwZZz+reXgujEWzmxc8h/n9gDo206IdVy2U3A2B8dSaQ755zRbBPCfj1CIEdBJ0lBiR+lq4TsraRW18338p9bCEB13hhUXgPhvdsYuHVZCJaah3DUz+wK8z8cbCaXzeWo57GGZVPCInXFI44wnAMVNtE0Y7hA31al9eR5PnmIyQS2J7AhG9RYu3DFHrD+ZbyFff0Q7aZou+YiL82I5l+knwBtGtWJddcTbiFFrYvi4kt3+sSX+cATQ1uhCtDx/6iMsLIHF3Gv0U+zijqtNUz0XDrqbV5xp7Adp2gY2cxRwBtyda0R0u6Fdjgsl99DOa4u2OxDmHQZcMSIx31GpGDeUJYWj6iQIgz8TZxO+kcCOnhlJBUqFSPP3ZPpNTbyN1lIYv586ERl3D5Oft+JKtMHON9vhL8p4CTNXfLbxMaOEpHRB+/B6ielYILPnihCzq0kyhpHn+D7jUU34lrs19CPdjNd3eoxKKfQWeh2rvlVHhK4vihcUE4hTFocupsVCXEg9RJ78bYixr270qoBmffcpZWOU+1eXJsf4kkVSl9lZgZKCSEptJLM3AM9erbS9NMaFfuyk1rLqt6PaD3z5KJMR1coAR65GTdYnFigOWmxoOoVdfG5doxMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXZOVEg2TEF1RXd3ZURQaUc2OHg3QWNDRmpsZG5DaFM2Wng0TkR6U3U0ZVRV?=
 =?utf-8?B?QVVZNTRLU2RLMEdoSGJkbytzenFsVXUySXI4eGlPeUtUMmk0MWk3cTFKdmE0?=
 =?utf-8?B?RVk2a3c3Mm9iU2tOdWhWUEFHOTBjdzFWOHB2VFQ3OUhEYU5GOUs2ZGRPWkNG?=
 =?utf-8?B?ekdLdlZSdXJXZHdkTDdZbTNraVBMdU1WN0JGSW14a0VsQWg4YXM1SmZyTHRE?=
 =?utf-8?B?cjd0TWZTVlFvZlJEZjZvYkNnekxLYWwwUFZHMW5YQUtwUGRSR3BwTmFrMEZj?=
 =?utf-8?B?QVduaEtZM0JyNzVDM3JYT0ZTSlQ0ei9tRTZxU25weXkrY0Q5dVhWSnRvVWY3?=
 =?utf-8?B?cDZtRVVmdDN5YlpNUUdnWGhHcUoyNk50TlU0MWFWQlpnTEsxeGFlNEhTVWt3?=
 =?utf-8?B?MmZRaVlNanlMdWlwV0N1L01PYTdjNzU2emM5Ui94WUViQTlXK2pkVlRQWUI0?=
 =?utf-8?B?dk5JSGZtdEtSY3BTUm83Q24ySkRTNXFxZ1lLNDE1QytvQUd1dDNwUW1sdkd0?=
 =?utf-8?B?bWl3cEVHWWtSd3hQZGp2cG4waVROaUl2VGdPejFMLzArUzNFTVRzMStWTjNB?=
 =?utf-8?B?dUd3dDFPbk9UNy8yZUJOUWFBb3dONzVpTHlYa1BPUmZkMEYySTU3aTcrWUdL?=
 =?utf-8?B?NldXckhIelNzOUtuWThJSkNNUWp1VlJ0WFg3TGhtVndXN3N1ek1NdnJpRkhI?=
 =?utf-8?B?MjU3eUxuRjEyN081WnltaHZ4RjBrR0Fzb2lLTE1oUGk3M2c0dTViWHVQZWFD?=
 =?utf-8?B?VVhPYlZVNHNpeTNXUG9KanZiMkNia2JTMzM1Um9wdGhxUEZZMURYYmp0Vm1q?=
 =?utf-8?B?clhBbjh3am1McHVZR0hXZEdnMjR1OG5DbWROblpqNU1WZVB1ZmV6Q3RWOEhX?=
 =?utf-8?B?OHJLTSs2WGFXdWtZV2UrNEs3NzYyS2FQUUtVSndxN3Q2SFp1N3FadHR6b0Jw?=
 =?utf-8?B?ajMvNzZXTFJ0RXV6N0NPaEUzZlhkQTMyNHZaWU9QTmRQRW1jdU00dW9EcTJw?=
 =?utf-8?B?ZVZSS3ljcGJJMlZiS3FSQjYxRzRFVi9VVHcrWmVuT21PWFR4bWJBNy9yYWN2?=
 =?utf-8?B?S0R5azAyR3dnbUxxRmpwekRpWUZFY1EzWktTZ2lDNWM0RnVZSHdqRGNMOXRr?=
 =?utf-8?B?RzBsTTNaUk9ERDdJazh5VWFHeVl1WWMrNzFLRU9RUXNDZjVmZG1manFHWlY5?=
 =?utf-8?B?VURiRzFxcStXOXVKM21Za0NPeSs2VTFEbHhlYjQ4bGhRU2xNREk4V21iWnZp?=
 =?utf-8?B?M2FZYjhYVEJwcXZCdTU2VEZId0Z3N1huUDJWN0I2QzBRczFNbG1zZzVYQWcz?=
 =?utf-8?B?Zk9qWE1vZHNwTC9WSUEwaVBqNTZrS2p6eWIvdWdzYVFJZDJ5OFNuZ0ZjdEVK?=
 =?utf-8?B?UkpXVVE3aDRPUXVPd3lXZkpLamJUem81WGdJMXl2MTZPUXhGak9UbHN4NmZH?=
 =?utf-8?B?NU5pTHlaU1FhSlV0T09EVTVxaEkyMkxnWWErQmR5cWdpMXFOYVNEK0VnNG9N?=
 =?utf-8?B?d3JRbSswcWljMDVHTFJveTdRbk9ETmtDWXJPL1BsdU14bC9kMlFLalo0d2tL?=
 =?utf-8?B?Z2l0eFdPUUxCUXhuMkN6KzZMekRhTkJhNkdNUlQ1ZnpXWjhiN3cxZFMwWlF6?=
 =?utf-8?B?VGtVd2RzZlJiaHJ6aWxPMkFHMzdWMWJhZUJYSGFLY2FGUllEb2tBd0ZwWTBm?=
 =?utf-8?B?aG1aWktncnB5TnNYMW1zdkpCdHFqTlJrdEt5MHBmdUJ5VnZQaC9wMjhaNExM?=
 =?utf-8?B?U2NGOUhrOVhMRk5Fbi8zNHlpRzhBTWdMMnBuSHZZYy82YnpZOXVvVHAwdDB1?=
 =?utf-8?B?bWd5RjlIcGtkeS9kS0VUcEFiaVgwL2h6eGs5WDJqZWowOGZMdVlGSHBHSkRM?=
 =?utf-8?B?cGZscjRJU2FkRlBkUUJ2SXAzNWhBM2Z3WVhtYjRsYXIrdTIwWktpNjhPekdW?=
 =?utf-8?B?dnoyL1JVL1JFSWJUYXNEbUo0Q1o0YXdINlcwdm9NbnU3aG45Q0czVlMzaTlk?=
 =?utf-8?B?aDFXbXc4QWU3dXd6cHBYYUFLZzFRa2RQZERCblladnp3djJzaE1GL1FqeVVz?=
 =?utf-8?B?eXM1NjRnanMxTHJpNXRFRWJWcTFDeHpBZ1oxYXVLV0NNK01sQmxnN3JvQU5R?=
 =?utf-8?Q?2F61ZeyhBoAsO3S/tABlks3zB?=
Content-ID: <6D059BC20B30E6468CBA6552DE1B4908@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5a79d3-b4d3-43e6-e16f-08dc4880d6ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:55:37.8147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vgsu2oP6xTkmqPyg8+QCNQ+uiJIYFfoFC5a1x2BtxHNOenuIMfWSKloIVF390pdDYYuJTPdYia3aow17j+LEYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6978
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1352461513.1094061820"
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

--__=_Part_Boundary_008_1352461513.1094061820
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9kZHBf
Y29tcC5jIHRvIG10a19kZHBfY29tcC5jIGFuZA0KPiBtb2RpZnkgdGhlIE1ha2VmaWxlIGFjY29y
ZGluZ2x5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdAbWVkaWF0
ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMg0KPiArLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL3ttdGtfZHJtX2RkcF9jb21wLmMgPT4gbXRrX2Rk
cF9jb21wLmN9IHwgMA0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiAgcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay97bXRrX2RybV9kZHBf
Y29tcC5jID0+DQo+IG10a19kZHBfY29tcC5jfSAoMTAwJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvTWFrZWZpbGUNCj4gaW5kZXggMDE5OGI1MDgyMGQ0Yy4uYmRiNzE3MzhlMWYzMSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KPiBAQCAtMSw2ICsxLDcgQEANCj4gICMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gIA0KPiAgbWVkaWF0ZWstZHJtLXkg
Oj0gbXRrX2NydGMubyBcDQo+ICsJCSAgbXRrX2RkcF9jb21wLm8gXA0KPiAgCQkgIG10a19kaXNw
X2FhbC5vIFwNCj4gIAkJICBtdGtfZGlzcF9jY29yci5vIFwNCj4gIAkJICBtdGtfZGlzcF9jb2xv
ci5vIFwNCj4gQEAgLTksNyArMTAsNiBAQCBtZWRpYXRlay1kcm0teSA6PSBtdGtfY3J0Yy5vIFwN
Cj4gIAkJICBtdGtfZGlzcF9vdmwubyBcDQo+ICAJCSAgbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IubyBc
DQo+ICAJCSAgbXRrX2Rpc3BfcmRtYS5vIFwNCj4gLQkJICBtdGtfZHJtX2RkcF9jb21wLm8gXA0K
PiAgCQkgIG10a19kcm1fZHJ2Lm8gXA0KPiAgCQkgIG10a19kcm1fZ2VtLm8gXA0KPiAgCQkgIG10
a19kcm1fcGxhbmUubyBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBf
Y29tcC5jDQo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiByZW5hbWUgZnJvbSBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQo+IHJlbmFtZSB0byBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCg==

--__=_Part_Boundary_008_1352461513.1094061820
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1R1ZSwmIzMy
OzIwMjQtMDMtMTkmIzMyO2F0JiMzMjsxNTowMiYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZndDsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmVuYW1lJiMzMjtmaWxlcyYjMzI7bXRrX2RybV9kZHBfY29t
cC5jJiMzMjt0byYjMzI7bXRrX2RkcF9jb21wLmMmIzMyO2FuZA0KJmd0OyYjMzI7bW9kaWZ5JiMz
Mjt0aGUmIzMyO01ha2VmaWxlJiMzMjthY2NvcmRpbmdseS4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtD
SyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0
OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0
Ow0KJmd0OyYjMzI7c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbSZn
dDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
TWFrZWZpbGUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzIN
CiZndDsmIzMyOystDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay97bXRr
X2RybV9kZHBfY29tcC5jJiMzMjs9Jmd0OyYjMzI7bXRrX2RkcF9jb21wLmN9JiMzMjt8JiMzMjsw
DQomZ3Q7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0
aW9uKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOyYjMzI7cmVuYW1lJiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fZGRwX2NvbXAuYyYjMzI7PSZndDsNCiZn
dDsmIzMyO210a19kZHBfY29tcC5jfSYjMzI7KDEwMCUpDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2Rp
ZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZQ0KJmd0
OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyO2luZGV4
JiMzMjswMTk4YjUwODIwZDRjLi5iZGI3MTczOGUxZjMxJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyOysrKyYj
MzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMyO0BAJiMzMjst
MSw2JiMzMjsrMSw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjJiMzMjtTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjomIzMyO0dQTC0yLjANCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO21lZGlh
dGVrLWRybS15JiMzMjs6PSYjMzI7bXRrX2NydGMubyYjMzI7JiM5MjsNCiZndDsmIzMyOysmIzMy
OyYjMzI7bXRrX2RkcF9jb21wLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjtt
dGtfZGlzcF9hYWwubyYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kaXNw
X2Njb3JyLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZGlzcF9jb2xv
ci5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7QEAmIzMyOy05LDcmIzMyOysxMCw2JiMzMjtAQCYjMzI7
bWVkaWF0ZWstZHJtLXkmIzMyOzo9JiMzMjttdGtfY3J0Yy5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7bXRrX2Rpc3Bfb3ZsLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjttdGtfZGlzcF9vdmxfYWRhcHRvci5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7bXRrX2Rpc3BfcmRtYS5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjtt
dGtfZHJtX2RkcF9jb21wLm8mIzMyOyYjOTI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtf
ZHJtX2Rydi5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2RybV9nZW0u
byYjMzI7JiM5MjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcm1fcGxhbmUubyYjMzI7
JiM5MjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kZHBfY29tcC5jDQomZ3Q7JiMzMjtzaW1pbGFyaXR5JiMzMjtpbmRleCYjMzI7MTAw
JQ0KJmd0OyYjMzI7cmVuYW1lJiMzMjtmcm9tJiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5jDQomZ3Q7JiMzMjtyZW5hbWUmIzMyO3RvJiMzMjtkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRt
bD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNo
bWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBv
dGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJ
dCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVj
aXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRp
bmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0K
YXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1l
ZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwg
Y29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20g
eW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1t
YWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1352461513.1094061820--

