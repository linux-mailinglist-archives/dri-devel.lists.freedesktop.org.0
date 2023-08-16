Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15A377DAF6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 09:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D060410E2F1;
	Wed, 16 Aug 2023 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F2810E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 07:12:21 +0000 (UTC)
X-UUID: 3ba08d163c0411ee9cb5633481061a41-20230816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/6UIcergMotWf1imMgddACNOm5hTrjOz85Yxrh+1EVc=; 
 b=XzT7uayEKM9cRMgt9+IWuX6HLa/YSF2gzmW0dnaIKzfCZ3ejbXiYFQeLMjyw8+w4VUfITyBIYP/toQPsaHZ3rX8jqDoY/tymCgcLNUbnYvIjP8UKRwWe8H2qhmZhiT3mzIC4tc9e+QChSB0fsO7pCJylump1+H0DQJSqgJJOg5Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:209ebe10-5aad-4d2b-ba93-5a7ddf6dc11e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:d689e9c1-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ba08d163c0411ee9cb5633481061a41-20230816
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1734658349; Wed, 16 Aug 2023 15:12:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Aug 2023 15:12:16 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Aug 2023 15:12:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAPpYIngM8ENyF/7/B40Ye7KS1iQwsahc5AXI8SyguPdTtAi4mgc6u7TZwfPShbuRovCwCikIt+Xach+J7MQteN9NM3EUoc5VndSnZdf9LMKwYZtcTj3fKybZSn+y2ukqsAz/3veC+UTa4FTzN/mRCfrNfNihdlyEuzh1iLNHTP7mCEZ12WJpKoSIgfBvdv0M1ldCC0Wni9yCP8fFEH+BHfZwsimpTR9HUgaPnVBf2vXlm1rF7mP9FlmDHhyPeY0rCR6iIjPk5nEr6EhbcGSJAIK8LwRru8EPcv/C/eM9NW8SjdGDFnY9HlkL0IxAhUOzWMhuCzZ3Gw5+UEZKtJtUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqctsjWRqRYcvLH8Lywnn9seBiwAB3yOj9TKZnZW6dk=;
 b=l0j52ntOCBDkEB7qJBGWARtMGzXxLOB7oeK/PGvNXiZU8awbIcnUvHc/uOr55b5IG4uaTnp/enKsHuTUiDrI92COR3x59gKY+eeSxfMDu59TUrhpBPWtr+snuPAHzwnqDpQ8duAtlKOVhyhkoJnU6e6UYVPLxxc3Neme536NtDcghdwtXzG5s8nPVWCHMWh+Ukj/USEoBNtgcknIDJBSosRrAVNL8vdCmXSzRdwTNtD1xodImzy8RvUnyFY7Fo2GByFbZXkI2MtLR3qg1cDM1PN0zyDAk5d5ZTlLSAnOt+u+3/ApR6dyEMJ2QhK8oRMu6KGZUTJ1lYEiQIYd6J/jpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqctsjWRqRYcvLH8Lywnn9seBiwAB3yOj9TKZnZW6dk=;
 b=OSEM9dXrgVb2++NQvcYsfF4s1ezhI/IdFofhn1HmjA/iMjjIWciKchEWFBdvNUgby8MRwa4Opq8uZ/lCffUsXRfLFPZqQF/AcbPLJAv9kAhD+t2uQVPcJL/mtP/1Z+PUEowbGH9CVyuXOZkB8NLlOg74aIkDoCssbzpZE9sK1Jw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB5422.apcprd03.prod.outlook.com (2603:1096:400:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 07:12:14 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 07:12:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4,0/3] Add compatible to increase MT8188 audio control
Thread-Topic: [PATCH v4,0/3] Add compatible to increase MT8188 audio control
Thread-Index: AQHZzoEAo2Ld1GRUWUmF56Jws1l5T6/shPIA
Date: Wed, 16 Aug 2023 07:12:13 +0000
Message-ID: <c1c84616f3da83a8a2bc245b0d3c7697153cd81a.camel@mediatek.com>
References: <20230814072842.28597-1-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-1-shuijing.li@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB5422:EE_
x-ms-office365-filtering-correlation-id: 1789f435-75a4-4ad4-957e-08db9e281dd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSeh08N0Svi7fMYVG1Ovu+aCAmrg92TuvMjjA5Odvp4YEDGqjiY+G2BhUBmqR1A5a619bGIdxIUs/TilxBbiYY9gJdJpdOWwVqG5y5tkoeyC5Lb3SGwoxh7uWuvTia8dM6nS/QTXvoR1/bbWtqEu28DV+tlzRYux2h+hlDvpzRZJL6EZEQrjlRJLdMdSJxU4CX6IaqZs0a7qqbZ5PAnpMwC5dW8YBkcejqchfUZA+BDPj2dwlNbojZCMNpFm3KFnH81ae748Z508T8qGaiU9fFRt//KGyDx/YWhi99vqzCOcEpszLmXZC6VD/tRucZNoaUv1eJJNo8Fq3eOo2FkZnNlkszYbKGh3QznE7hiViVr18XJjwwYnjoTZKuCtZ9mkeAdb204uB9NVEWh291dI5JQlq80rH7etmdNKawRDFA/S8WbKeYp6dePv7SPa3M9WmskmU+JlXiSa7MJFCJwIa2Qcx1KYwLZAwLfiV7OsErPWcTEB079Pkzv30wgIwm64PoBHhu8nxWJdINjUDYremOrHK4cIZ+Bz6Avk6eLD0TZkFH6Xy0AoFmvyVHq2QaH/yc531LIZ3VJymJ2M5gUOe0Zzjzm+4wj+1HOl41pmLoidntDTeyhMOufKYbkbmaHDn5HTAxwsbSfHab4hOHogPLVECNtlr0eR6PyO1r4U7tZCKpf5cyiUjp2dijhKD2jgiV/Ng2NTPMoIg/9i0pOZ5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(1800799009)(451199024)(186009)(7416002)(122000001)(38100700002)(478600001)(6486002)(921005)(71200400001)(12101799020)(4326008)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(316002)(54906003)(110136005)(8936002)(8676002)(5660300002)(38070700005)(2616005)(36756003)(85182001)(6512007)(83380400001)(86362001)(2906002)(107886003)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0I2dVZncFBCTCtKd0NTRk1teEdGN0cxZllwNDJ1L2FxeDhyaDFRMTJZTmtY?=
 =?utf-8?B?UDU0eHZ5dGU3SUFLYnNmMWFNL055ZkwrNTVlMFNJeEZrSWFZU1czUW9QYWtX?=
 =?utf-8?B?cnM5em8yemNwTXRXZ1dneEoyNDJCMCtxeGxOSGpIRFVZc0VtQVArTnJJdHZF?=
 =?utf-8?B?R0Q5TmcrdDNia2ZnbnlweW41N25uU2NmZURmZ0tESXg4THpWNXBydlZWT2hL?=
 =?utf-8?B?MVdtR2ZyOVRGVUhwUkwvc2U5NW1URE9zZkU3UUI1eHdkN0VVeXNJNkhabm5y?=
 =?utf-8?B?UUZsbEVXM3pQeTYzVDZja08vQzEyZGFyeTJITnNHSm1hRW14UStuT3NmWEht?=
 =?utf-8?B?MkpBaGhkSUpPSlhqT1VqeW0waVp4a0w2MHZhTEtRcjh5T2JpVlloSHphdUEv?=
 =?utf-8?B?L0VkZEZwNEdKNnVFUHkrRUlCcFBnS2lETUx6OXFzSWJMMDJneThaSE83bVVI?=
 =?utf-8?B?aGJTUzB3YTN2WjRndWp4RWNrdGttN1krQWVLazlEcWFLU2ljbXF0clBqeDJx?=
 =?utf-8?B?Tm0rNVNxcndkNU44c2czQVZPanpLdFVBV1dBZmw4WWlTK01weDdqc2orYURo?=
 =?utf-8?B?S1NjTE9la2VUZnVQR29EalZURGlQVEJSZXIwcFgxTjBuaG40cE5VTUhJdnNY?=
 =?utf-8?B?V1g1WEVqcGtDajVaSFUxUStCM0NxTmg0TDNEb2lCNFBvV2dXVEhXTFhFM28y?=
 =?utf-8?B?Rm41Q1FMZGVFNmRLRG5JczB6eTVXbGtmVGtYU2pwdUlxbXEzTk0zYnZ3eDJ0?=
 =?utf-8?B?SzBXR2krRDdLTUlrSWRSdVU2N0d6RnorNHordTFlTHJYc1FkaDRCWnRxdnov?=
 =?utf-8?B?a1ZjeWcyK0RIOUJjWHJaZksvRktkVlhROEZYNUJCTVJPVWN0UEFjL2pIcnlL?=
 =?utf-8?B?R3YzWW5NbWQ0d29zMjE0MDZqdzFUNDFsM0YwMFlqL3VzUjR1ZmFVZG96ZUFt?=
 =?utf-8?B?dTZBSFR6MVJvNWNkMC9PNVFXb21nMmNtTGY2NHlMaTJ3SUtUcS91aTVacHdU?=
 =?utf-8?B?VWxYUkNQT00ySVRNSWtjNXdEVHV3ZE1tWVFDYmNPU3d6ZU9pbllCbCtqeEdi?=
 =?utf-8?B?a0o3eTdBWkM1VE1ZQWJzNTdsQzZZQmliOWQ0NTE0N3FYb244S2RlZWR0UDlV?=
 =?utf-8?B?MXJ2WDZYQ0ZydUhFMHlqK2tQVTBJc0ptSlBTNzgwNVM3d29tb2g0b1ZVRHdN?=
 =?utf-8?B?ZGVBSHpCVHJ1bGtNV0hnU3Q3NnY5dU5EdDllcWYyN1dnUTBVZDNYL04yMXQ4?=
 =?utf-8?B?VWxIc3duN3BiU0JyTVduSVJUWlhjSXBJTkRxQkRCR29QTlFqSlpoY3lNTDBp?=
 =?utf-8?B?c0J2UFZrUDJKSURzRE5uRThCcDFQemZYNmRjL2t6TUdOWEFSZFk1SzgrZitJ?=
 =?utf-8?B?eE1zN2x6bXE3NWY2MUwwYTZwdVoxVEJnTi9xWGxOSVVzMzNiSnY2bWZXVlN5?=
 =?utf-8?B?eGhCS1U1TWsyOGRsdFF4RmZWSFhHVFpQampPZFJnL2Q3TjVOSWxOei9GZ0Fh?=
 =?utf-8?B?ZXpuUDUrN3FvbVluMitSWEl3bm9pRjUvSkEzSWVscXVvZXlPSDdrdW9lcitx?=
 =?utf-8?B?ODZpVnpKczRUeFJsMHJiNkdLTFdHZGdueVFSMTlKSU5aaVVrcnh1VkYyVlJL?=
 =?utf-8?B?VEFFZmVLanhna0cwTWJCeGhnMTcvQnpGaGl0SURvYzRYcG1rb08xWG5TL0FM?=
 =?utf-8?B?Tkh4YTJTamJNVmJHdjZFNWtzMmJ4NHYxVjQvZlhLK0xWWkxMcHAxNFdpY1Ra?=
 =?utf-8?B?NTJvaFJqOTJhb0ZMbjBxaVErOWx5YmN5L0RCR3g2M21LZ3NyUkltV0d2Y09H?=
 =?utf-8?B?cmxyT1dndkJVbGUvd09DRkk3Z3BqZzZwUVRHaytkbFF2cndYNGNtZXVVNi9X?=
 =?utf-8?B?N1pFZEQ5aldyNnM0MXN1dHIxUXd0ZExwbStUSmVGcUM5ODVtRDdxbjFPdmh3?=
 =?utf-8?B?WVdxVVZzK01xSEdZaWlmRWV4eVJJL0hBa2VIbXRiQStQcDFFYm5TTlhCQjhB?=
 =?utf-8?B?NXptMjdIRDE5alFDZ0NubmJuVE9NMkx5Zy9KQWZiWVdZNHZXSVZTQ2dscHFO?=
 =?utf-8?B?aFg0Nm5GQzZqSkVPSWVRd3B2dVZ0L1dwdHpQb3hKM0FwS1FxcnJXbWQ1Y05K?=
 =?utf-8?Q?akqIn8dJUOyt4q5sTmHkauGHt?=
Content-ID: <4A78178D2F9DC94E9886F87278727A1C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1789f435-75a4-4ad4-957e-08db9e281dd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 07:12:13.9154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJWfWqmCeYyJiAGdcI79Fxp4OvoAdt8U1z57bkGti5jWfPGKB/7d8+7FroBs17uo3NqX0vbEVFaNOpg11AVYAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5422
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1176409530.601046555"
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
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_1176409530.601046555
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7U2h1aWppbmc6DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA4LTE0JiMz
MjthdCYjMzI7MTU6MjgmIzMyOyswODAwLCYjMzI7U2h1aWppbmcmIzMyO0xpJiMzMjt3cm90ZToN
CiZndDsmIzMyO0FkZCYjMzI7ZHQtYmluZGluZyYjMzI7ZG9jdW1lbnRhdGlvbiYjMzI7b2YmIzMy
O2RwLXR4JiMzMjtmb3ImIzMyO01lZGlhVGVrJiMzMjtNVDgxODgmIzMyO1NvQy4NCiZndDsmIzMy
O01haW5seSYjMzI7YWRkJiMzMjt0aGUmIzMyO2ZvbGxvd2luZyYjMzI7dHdvJiMzMjtmbGFnOg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsxLlRoZSYjMzI7YXVkaW8mIzMyO3BhY2tldCYjMzI7YXJyYW5n
ZW1lbnQmIzMyO2Z1bmN0aW9uJiMzMjtpcyYjMzI7dG8mIzMyO29ubHkmIzMyO2FycmFuZ2UmIzMy
O2F1ZGlvDQomZ3Q7JiMzMjtwYWNrZXRzJiMzMjtpbnRvJiMzMjt0aGUmIzMyO0hibGFua2luZyYj
MzI7YXJlYS4mIzMyO0luJiMzMjtvcmRlciYjMzI7dG8mIzMyO2FsaWduJiMzMjt3aXRoJiMzMjt0
aGUmIzMyO0hXDQomZ3Q7JiMzMjtkZWZhdWx0JiMzMjtzZXR0aW5nJiMzMjtvZiYjMzI7ZzEyMDAs
JiMzMjt0aGlzJiMzMjtmdW5jdGlvbiYjMzI7bmVlZHMmIzMyO3RvJiMzMjtiZSYjMzI7dHVybmVk
JiMzMjtvZmYuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOzIuRHVlJiMzMjt0byYjMzI7dGhlJiMzMjtk
aWZmZXJlbmNlJiMzMjtvZiYjMzI7SFcsJiMzMjtkaWZmZXJlbnQmIzMyO2RpdmlkZXJzJiMzMjtu
ZWVkJiMzMjt0byYjMzI7YmUmIzMyO3NldC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QmFzZSYjMzI7
b24mIzMyO3RoZSYjMzI7YnJhbmNoJiMzMjtvZiYjMzI7bGludXMvbWFzdGVyJiMzMjt2Ni40Lg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtTaHVpamluZyYjMzI7TGkmIzMyOygzKToNCiZndDsmIzMyOyYj
MzI7JiMzMjtkdC1iaW5kaW5nczomIzMyO2Rpc3BsYXk6JiMzMjttZWRpYXRlazomIzMyO2RwOiYj
MzI7QWRkJiMzMjtjb21wYXRpYmxlJiMzMjtmb3ImIzMyO01lZGlhVGVrDQomZ3Q7JiMzMjtNVDgx
ODgNCiZndDsmIzMyOyYjMzI7JiMzMjtkcm0vbWVkaWF0ZWs6JiMzMjtkcDomIzMyO0FkZCYjMzI7
dGhlJiMzMjthdWRpbyYjMzI7cGFja2V0JiMzMjtmbGFnJiMzMjt0byYjMzI7bXRrX2RwX2RhdGEm
IzMyO3N0cnVjdA0KJmd0OyYjMzI7JiMzMjsmIzMyO2RybS9tZWRpYXRlazomIzMyO2RwOiYjMzI7
QWRkJiMzMjt0aGUmIzMyO2F1ZGlvJiMzMjtkaXZpZGVyJiMzMjt0byYjMzI7bXRrX2RwX2RhdGEm
IzMyO3N0cnVjdA0KJmd0OyYjMzI7DQoNCkkmIzMyO3dvdWxkJiMzMjtsaWtlJiMzMjt0byYjMzI7
c2VwYXJhdGUmIzMyO210ODE4OCYjMzI7cmVsYXRlZCYjMzI7Y29kZSYjMzI7ZnJvbSYjMzI7dGhl
c2UmIzMyO3R3byYjMzI7cGF0Y2hlcyYjMzI7dG8NCmEmIzMyO25ldyYjMzI7cGF0Y2hlcy4NCg0K
ZHJtL21lZGlhdGVrOiYjMzI7ZHA6JiMzMjtBZGQmIzMyO3RoZSYjMzI7YXVkaW8mIzMyO3BhY2tl
dCYjMzI7ZmxhZyYjMzI7dG8mIzMyO210a19kcF9kYXRhJiMzMjtzdHJ1Y3QNCmRybS9tZWRpYXRl
azomIzMyO2RwOiYjMzI7QWRkJiMzMjt0aGUmIzMyO2F1ZGlvJiMzMjtkaXZpZGVyJiMzMjt0byYj
MzI7bXRrX2RwX2RhdGEmIzMyO3N0cnVjdA0KZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtzdXBw
b3J0JiMzMjtNVDgxODgmIzMyO2RwL2VkcCYjMzI7ZnVuY3Rpb24NCg0KUmVnYXJkcywNCkNLDQoN
Cg0KDQoNCg0KJmd0OyYjMzI7DQoNCiZndDsmIzMyOy4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRwLnlhbWwmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8
JiMzMjsmIzMyOzImIzMyOysrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHAuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MzYNCiZndDsmIzMyOysrKysrKysrKysrKysrKysrKy0N
CiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaCYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzIzJiMzMjsrKysr
KysrKy0tLS0NCiZndDsmIzMyOyYjMzI7MyYjMzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjs1NCYj
MzI7aW5zZXJ0aW9ucygrKSwmIzMyOzcmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQoNCjwv
cHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmlt
bWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFs
bCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJv
bSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBl
LW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_1176409530.601046555
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodWlqaW5nOg0KDQpPbiBNb24sIDIwMjMtMDgtMTQgYXQgMTU6MjggKzA4MDAsIFNodWlq
aW5nIExpIHdyb3RlOg0KPiBBZGQgZHQtYmluZGluZyBkb2N1bWVudGF0aW9uIG9mIGRwLXR4IGZv
ciBNZWRpYVRlayBNVDgxODggU29DLg0KPiBNYWlubHkgYWRkIHRoZSBmb2xsb3dpbmcgdHdvIGZs
YWc6DQo+IA0KPiAxLlRoZSBhdWRpbyBwYWNrZXQgYXJyYW5nZW1lbnQgZnVuY3Rpb24gaXMgdG8g
b25seSBhcnJhbmdlIGF1ZGlvDQo+IHBhY2tldHMgaW50byB0aGUgSGJsYW5raW5nIGFyZWEuIElu
IG9yZGVyIHRvIGFsaWduIHdpdGggdGhlIEhXDQo+IGRlZmF1bHQgc2V0dGluZyBvZiBnMTIwMCwg
dGhpcyBmdW5jdGlvbiBuZWVkcyB0byBiZSB0dXJuZWQgb2ZmLg0KPiANCj4gMi5EdWUgdG8gdGhl
IGRpZmZlcmVuY2Ugb2YgSFcsIGRpZmZlcmVudCBkaXZpZGVycyBuZWVkIHRvIGJlIHNldC4NCj4g
DQo+IEJhc2Ugb24gdGhlIGJyYW5jaCBvZiBsaW51cy9tYXN0ZXIgdjYuNC4NCj4gDQo+IFNodWlq
aW5nIExpICgzKToNCj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGRwOiBBZGQg
Y29tcGF0aWJsZSBmb3IgTWVkaWFUZWsNCj4gTVQ4MTg4DQo+ICAgZHJtL21lZGlhdGVrOiBkcDog
QWRkIHRoZSBhdWRpbyBwYWNrZXQgZmxhZyB0byBtdGtfZHBfZGF0YSBzdHJ1Y3QNCj4gICBkcm0v
bWVkaWF0ZWs6IGRwOiBBZGQgdGhlIGF1ZGlvIGRpdmlkZXIgdG8gbXRrX2RwX2RhdGEgc3RydWN0
DQo+IA0KDQpJIHdvdWxkIGxpa2UgdG8gc2VwYXJhdGUgbXQ4MTg4IHJlbGF0ZWQgY29kZSBmcm9t
IHRoZXNlIHR3byBwYXRjaGVzIHRvDQphIG5ldyBwYXRjaGVzLg0KDQpkcm0vbWVkaWF0ZWs6IGRw
OiBBZGQgdGhlIGF1ZGlvIHBhY2tldCBmbGFnIHRvIG10a19kcF9kYXRhIHN0cnVjdA0KZHJtL21l
ZGlhdGVrOiBkcDogQWRkIHRoZSBhdWRpbyBkaXZpZGVyIHRvIG10a19kcF9kYXRhIHN0cnVjdA0K
ZHJtL21lZGlhdGVrOiBBZGQgc3VwcG9ydCBNVDgxODggZHAvZWRwIGZ1bmN0aW9uDQoNClJlZ2Fy
ZHMsDQpDSw0KDQoNCg0KDQoNCj4gDQoNCj4gLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHAueWFtbCAgICAgICAgIHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHAuYyAgICAgICAgICAgICB8IDM2DQo+ICsrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmggICAgICAgICB8IDIzICsrKysrKysrLS0tLQ0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiAN
Cg==

--__=_Part_Boundary_007_1176409530.601046555--

