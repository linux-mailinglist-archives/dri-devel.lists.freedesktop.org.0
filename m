Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298A98997A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 05:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC41410E03A;
	Mon, 30 Sep 2024 03:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OgCNAvXZ";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gLxKyknU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAD010E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 03:28:55 +0000 (UTC)
X-UUID: 1c619e4c7edc11efb66947d174671e26-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=AdOXrh2i7YF1FYDGugOLkbXGgncoomkGqLi2U0cyclU=; 
 b=OgCNAvXZen8MSxtMQL0xnKHd2UnfSxKzqejBJ7YFCC52Vvyh+TX7FPXHvdQZtktwYVS5fP/QrYPMxBFhBVT58FTMEz388NRCuzyLY08yIarjDrT4GnmAxEMUJYioegovb2rsJW7lzqIgs1ARzyc1EYO/ywVtJUGtpuMbpCmDWpo=;
X-CID-CACHE: Type:Local,Time:202409301121+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:97530ac3-b979-4b7b-b09e-1f70c8ce862b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:49967318-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1c619e4c7edc11efb66947d174671e26-20240930
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2115157177; Mon, 30 Sep 2024 11:28:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 11:28:48 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 11:28:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbQ1mz/r7pHDaE5Mdr4gJuNslYrxn3m8gFG7IkxUXI9PCzgTevcvOLLNRzgL0Prr3Yf1jD0hhKX9IjCS32e3vTTbpkwtTamfkFqVN5wNgoy8+CFtKqlWPJIxXBSwRPNyXxMsFuG7twbvKOL9tLTCGLx0BijXqqw6bhmJl8VFjCMIxM2qg9NRg+OeqqBdyj82S2nb41V5Pqzxe2NyOF8ofWkiDcV7E32SH2qcdsK3X8LxrunzBGyhEkDoCJimIWgtbpAoXVCHf6h2Rj2n0Arf7KoMZBhvDTQGa8lSWStdTDEdTWimpg+XsoKEId/NfkWRmy2Uq2d3Qd6MXim3BQ5yfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdOXrh2i7YF1FYDGugOLkbXGgncoomkGqLi2U0cyclU=;
 b=uSRVaBCtsO013U0u+5r976dST10WkelnLvRP7+JXpxIO99moWTtHP9ejqWvhaen2UIVjZb6By0+lIu2iUy6tMORrkniWPFtsdqZ8mlTOVksnaiYFvXKOPOdyFqa+45VeJ+42Y6sgHyxv/8Sk28+2b2+JaYLopJiXoMaweBGI4oYqeOlJ9zDxUPiksbthwLxgXuP11re3ADfM211pHHfGBuKGb/NKGT964s5ZYgZLKud2wyao/9ymszbsC46HzegoDD3ZbJ9kVICkNQ7NMRnrSYK5Bd6Voja5NlQjdycQ5fktcHSjorTV5Q7PqER7Z3npLU1mYExZncS+hVs9jQP3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdOXrh2i7YF1FYDGugOLkbXGgncoomkGqLi2U0cyclU=;
 b=gLxKyknU31QkM5KHWJvmmdMoWxvRX+OcaXVJBuGFaFimgiRIBJeuTVbA+K9pdHQ8ZnTNnvu7u9BMdi6qZyTBAVomjUjbNYPVUx57oC95emx4c7MAplZURwizDRF7KWaVlIhbvg+0DFmxFb0KUQ1jEPmW5Dfobzg6lyFHI95tWco=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI6PR03MB8687.apcprd03.prod.outlook.com (2603:1096:4:252::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 03:28:45 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 03:28:44 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?=
 <Macpaul.Lin@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moudy.ho@mediatek.corp-partner.google.com"
 <moudy.ho@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Topic: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Index: AQHbEKFZtJplMt7Gp0Sp496AFj88+LJrYFiAgARQGIA=
Date: Mon, 30 Sep 2024 03:28:44 +0000
Message-ID: <e78c2a518b258d6287233367be1e071c2da1a724.camel@mediatek.com>
References: <20240927055140.19688-1-moudy.ho@mediatek.com>
 <pnpj4pexz6nff72kmk6thupwvp2dgkz32ye7o44qdpuctbewb4@kpokc7c2rflr>
In-Reply-To: <pnpj4pexz6nff72kmk6thupwvp2dgkz32ye7o44qdpuctbewb4@kpokc7c2rflr>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI6PR03MB8687:EE_
x-ms-office365-filtering-correlation-id: 009fb075-2041-40a1-6c2c-08dce0fffcfc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UStFMUEvSTBpTm9lLytROXFqSjlaZEI1OElJTElaWUdMSUdLcDUxVHNGTzlM?=
 =?utf-8?B?VWkzdWRPcUREei9aNVV4eXlseW1Wb09sYlg5YXh2c2hyNTZ3bnhhZUR6ZC96?=
 =?utf-8?B?RjZFK1ZXOXNoN1BpTnRJZ1NocEJRbGcwYlRUMU56K1Q0bnE3SWVaS3Z0WFli?=
 =?utf-8?B?SHZaZlNFOWhQUjNxMWZZZVB1NkFHYVp2aWxYaE95QWpxVzV5cWc4Y254Mmhl?=
 =?utf-8?B?Z0t1OHdhTEdiNlhDcU5vWncyK1VUMHdUdUxDUERIVnN0S3d1VE15WDN2VlVx?=
 =?utf-8?B?aUo4ODd5Z2c2Q3NxYjhuMytIcnViVWowb1hGMkxHeCtZdDU3QXJCR1ExNWtW?=
 =?utf-8?B?VTNlWVFWTXNFcmNOTDd0QTFkc2htNnVFVDhQem9zajBFUUJGWjZCaUloLy82?=
 =?utf-8?B?cU5PMEZXK1hDK3JCaDNOeHMvQTRVSVBLdGhFeExydzJUeEFuQ1VRRFRuVW04?=
 =?utf-8?B?THVYUXFEWUhjSFN1U284SjJaSFNPMHdFOE1IamJNQ2czUDVONDY0T2IwelhS?=
 =?utf-8?B?dHlXaU90RWJVWTJtKzcyOCtRMGNTcG9pWkIrWlh5Zm9lOE1kUTJidTFveXJt?=
 =?utf-8?B?aXJVQ3ZVNjRvSjRlL0w3S2hTc2toT2JJODRsa3dwMkI2SDBpREpFUzBsWFVE?=
 =?utf-8?B?eGs1ZDlKSGZFWkl2NkRLd1lpZWs4MUpsVUhwZUV1Q0dONVVab0JQNDZqcTRk?=
 =?utf-8?B?Y3M5c2NKRUx2QzNBWExwUVV0S3ZOZ2ZtYW0yWmpKeVRYN3phYWlpVXBEWnlr?=
 =?utf-8?B?T0tKOGYxQi9MSEk0YkFFNFhkZEp5Wis0eW9iMWVmMXFXYit5QW4ySUhFNkFU?=
 =?utf-8?B?dWNRRnkwa2MwWkcxOUtTWGV3aUhWblRXcEQ5RGNrVDhxM2h5bGliMWtKMHZo?=
 =?utf-8?B?MnoyZ3NXRzdjV2tGMkN6dkEyYlJ3OFdCRnpRRXFYZjR3a2dWR2xNYmdyTFk2?=
 =?utf-8?B?UFphNWFDSkdndzZ2NzZzSXphZm9qSENGUWpRN2I4cW5BQVUwLythZFBKalhs?=
 =?utf-8?B?d29vSDVYZEhqS0VZNExVbVZoNnlTNEYxYkVPY3JHV0IzMTdNaVMzZ3VMVzhz?=
 =?utf-8?B?eFhwM3F3d25nQ0djRDk1RE1URHQxREN3a203VExjR0trQm82MUpSZU1idEdt?=
 =?utf-8?B?TEQvc3g1bzBXTE5DQ2YzUGRoUUI3YittbkppYmVxQ3lpNkJSZGlrZkRhL2Fu?=
 =?utf-8?B?ZFIrOUxPdWZyM3VVQW9VcTNhcDRJL01xU3BOZ295ZzNDTy9oSGdHVzdQODU3?=
 =?utf-8?B?U3ZidTlZeGpMN3NmalNPQk1LV1NZTUx0dW16V2VFb2FVa1N5TnFrYmRNZGJ6?=
 =?utf-8?B?d01RYVJXekFMdzB2dUhFQzY3dkVSVmkxZXM2anJtQVlMalJNaUxEc1pRQ3lI?=
 =?utf-8?B?T1l2WlVoNXNyWkRWOHo3d3p1dTNNVFRKcVNGa1dXNlNhRUdad1Z0VUl6TTlR?=
 =?utf-8?B?YUFRSzUzSGdVSDlITGNYYk03TzNxNXdxUFhBekNIdVNxMXZ2SU1IWm1RNFNv?=
 =?utf-8?B?MWl0Q25vS2V1UlNrNmlYdTFTWGNSZzcvU1dLQmNwZU1Rb0ZsVTlRNlRCeUNC?=
 =?utf-8?B?NUttYUNOakFBOUlXM0doZ1RxZS9BOWtsV3JvdnZOdytISGFmcGYwWXRjRjZS?=
 =?utf-8?B?amFIVXdlcVVBbGdINjJHaVoxZUYrdmVNOC9DTEgxTURvK2dESmpvcnVPaUp3?=
 =?utf-8?B?Q09LMnhCR0pyRlhPYlp3TGJhUVhtMVhjbEFIL0lXQWNjaGhvN0pCNkg5SlY3?=
 =?utf-8?B?blRrTExkZlNib0JWa2xZZWI1cmxqYWlvcjdYYS9XUlBQUHg4RDBNcGZCZ3Zu?=
 =?utf-8?B?REZHR1lDNmUrZ1FHYmhRQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGFpRjM0UklFV2RWaWJCYzNwcXl5OWF5OG9jS0FYbHdwUDQwVThUY05QVndM?=
 =?utf-8?B?bUUrM1JLdFBCN2VmcGNIdDJvRVpKSExiU0hybERNVXZZbXZMdXZMdVdlbml3?=
 =?utf-8?B?S3E4SFNXV3lBZTFvaEJoSG1hdGpaQUMvZUEySXVYbVZBaTQwQjVSNDlObE5Y?=
 =?utf-8?B?WGV6b0c4WEZsNmFnNk5CWGJUMGdvbGZuNlFlaWs4RXF3Rk01SW4xa1RLZWRF?=
 =?utf-8?B?ZFNJazhyNTZ6TzZLbGhPZmh6WXhnaEhYQ0M0czlBM25xc21PVTk0OERZLzVC?=
 =?utf-8?B?RXBaUVNUai9SRklpY1dhaFd3ZjB5cWJOdUJ4cWk2cFU2b3JwTUdYTkN6QzE0?=
 =?utf-8?B?ZS9JTmNRa2hHd3N2b0l1YmZxZFo4cmkvd0U1MUFxVWdhTVZFbFJ4Ujk2a2tC?=
 =?utf-8?B?cW4xS3hwY2FTY29WNmZPZnBsY1E4aFpZbjRlRm15dmJvY1JidlNWMlZCeVVL?=
 =?utf-8?B?TDNZSXo4dmE1WlNSMHFVS1V2SjdKc3o5d0ZSSUFEeFNlRWE0c2NVZ1d0MUVv?=
 =?utf-8?B?eXhwODdnSWNRclB5K2VSRG85Ui9MMEluR3NkNzlRMVBFK3Iwd25HS1FlMmU5?=
 =?utf-8?B?ZHZEczdOZVlVVit0RUh5OVlFaXF0eEM2eERpQWtkWk9MamltaXd4ZXAxUWZy?=
 =?utf-8?B?ZDY4T1Y0bTV0a3Q1MUIxc1ZsMjQzalNSZFo2K0NVZnVrRmpxMUNXVEdpbzdP?=
 =?utf-8?B?aDg5cXhxS3FUOXRlQjdUR0d2N0pBT09OY0JQUStqSUhGakFNNEhmelovVENO?=
 =?utf-8?B?QTQ3ZkZraGMvcDVkQm9vOUVqcjhlRHhIRE5WNGQzUzg4ZkEwdDlnSmhtVjJs?=
 =?utf-8?B?SHVwT3gxeTV0UDdTRldDZlJOS1FMcmNIQTlJcHlwWVJNdHpSSWNmZ0xkM1V0?=
 =?utf-8?B?VEl5MVpNbjN0S3R3dzlodnRCYnFISjEzWHN1b0lsZzFZOG12bXFUZWNDcHNv?=
 =?utf-8?B?TXdyVzkzUVJMVzVVMXIrRFB5NGFiWmRSRG0wcVg5Q2tsN1ZrR3ZTeGFnQjdo?=
 =?utf-8?B?Q2l5Z2VlRUo1S0Rkd1k0RC9EZUNESG9Rd3ZxSUtUQVNBZk9sMng5K2JKTlk2?=
 =?utf-8?B?b0xoeUltSVFaZ2JQQUplQUYvV1RSTkpKbEg2UjVSOUN6SHhkdlNOd3psUExm?=
 =?utf-8?B?NkFTZFpvTVdUNVJ0MnBSMHRTdnVpU0hqcmx1c0lQaTA0UHM4djhuR3BRVUg1?=
 =?utf-8?B?YzBvRjhjWlpDY2prYVU2eHJHZUp1R3BYL29yK05NaVVIWkVVSXh1V01oeDM3?=
 =?utf-8?B?MlQ2VnlBaGZyRnR0YmlmQkhkMU9haHJBN1BWSWdJc2I2UVlPQmcybVZqbFRF?=
 =?utf-8?B?MnY3c2ZiTjB2R3dHNWxJSExtSXBjSjVHYkV2QkdFaEdQRE1XMEJpaXhXT211?=
 =?utf-8?B?dUdOcUxvU0lPa244Y3R5NnhJMnNERE45dWQydzJpV3FReUU4UjViQTNVa1lU?=
 =?utf-8?B?NWtvc1AvSEZnaW9LTnBsNkNEMWh5SmdlemxhdldGNTR1Nll5LzBqckhMUzFD?=
 =?utf-8?B?M2NkeldIdUZJM3ZpVDNVemtISUUwRnRyYmtPVW9KVDZMdmp4UWtIWVIxcTJR?=
 =?utf-8?B?aDdCMHZpOUVpQlJzNzhEbVVabDd1V3hlcm1INjZaQVpuQWRMT2xlZGt3dkhh?=
 =?utf-8?B?eE9qV2IvL3BxZVIvcHRjUTh1QS9DQ1ZwYnRYWDVabmZjMFRtVWZZM2RUaDlK?=
 =?utf-8?B?dTg1amVzM3RuWHdCeVprbC9Zb21ZVTFNSEVNdkR3VWFweXZJTzNlaFRXL1Yr?=
 =?utf-8?B?YkRLTUZKeW8wM1BLL0hENkZNb0l2S25YTnFpdGpGandML3MrVFN0ajhncjhh?=
 =?utf-8?B?MldXaHZPaFl1YW0rejEwdWpRNzhpNzlSY0pXSC9zcHZHbFlDampWNmswcVda?=
 =?utf-8?B?NjZQeTFwYmk1K1laVVpZL255c2pYMy9VR3JXZmZaWDJqb1BHaXNOSURWK0c4?=
 =?utf-8?B?U3pnOTBKTGpyUmVoOVBWUjIwc3VQemVJbDdWWE1zTmYzZkJZaUttV0htM3Ez?=
 =?utf-8?B?cXhFMTRRZVBtMkxsOWNndHpZeG9ZZWY3ajgrV1F5Y0hQKzk0b2hRdEdrUmRJ?=
 =?utf-8?B?VURMV1BkYUMyUE5yZjhhSWFnRkxKSURHMGR1aS9ibGl0TGRObW1IMVp4cmdS?=
 =?utf-8?B?YklQVUJaVEJXS0ZXNmVISUk4NmtKV3U5VzJkMzlEbi9YWXN1V1hNMU5yaEVk?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B948A21D03A6F24B963B29BD3DC2558B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009fb075-2041-40a1-6c2c-08dce0fffcfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 03:28:44.4947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpKslnB4ay2azrBOn+9Vds8zvXHi3O6Plk2OtYAgltmC4tMItiIKueYOUIzBeT7R0ycHQZU27Xz48xoA5pYS9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8687
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.831400-8.000000
X-TMASE-MatchedRID: 2SDSohiwfqTUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tOX8ug76mOgDhKQh1LCmGBlHpIy6wt5Uw+IY
 kSFz4ayE0ebVZ7WTyR9Tj2Jvu5Ph0+uobhwVz9gBfLa2Qr61pJFxIyn/X4Smn2+mPn502VC8/ZY
 KUN+nf2ld1lEAdsm4CagYVG0Qcg4xD22D6nfxmiZLktajbF9ff75oFMklhrniyjD4RhbLov7O7H
 rcLsqvXHYuq52T4UtOIADUMHhbNRGFqPXSLpNdAGVyS87Wb4lyX0RsAdZZVkt9RlPzeVuQQNDPj
 saoNaOlCUOgjALyv3+aFAlhfN4pPj2hRzH1UwuDSBVVc2BozSlkMvWAuahr8+gD2vYtOFhgqtq5
 d3cxkNUcIn3wCvI9Ys2lUs3kde0DHY9leVwAOhkp+uVl+gzm01B83V2g7jX0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.831400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 63EC8AC42D12D992553ABEBDDC8CF79825A309848F65DC3CB1306AD4EEEB351B2000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBGcmksIDIwMjQtMDktMjcgYXQgMTE6MzcgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBk
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2
ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgT24gRnJpLCBTZXAgMjcsIDIw
MjQgYXQgMDE6NTE6NDBQTSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gRnJvbTogTW91ZHkg
SG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiA+IA0KPiA+
IFRoZSBkaXNwbGF5IG5vZGUgaW4gbXQ4MTk1LmR0c2kgd2FzIHRyaWdnZXJpbmcgYSBDSEVDS19E
VEJTIGVycm9yDQo+IGR1ZQ0KPiA+IHRvIGFuIGV4Y2Vzc2l2ZWx5IGxvbmcgJ2Nsb2NrcycgcHJv
cGVydHk6DQo+ID4gICBkaXNwbGF5QDE0ZjA2MDAwOiBjbG9ja3M6IFtbMzEsIDE0XSwgWzMxLCA0
M10sIFszMSwgNDRdXSBpcyB0b28NCj4gbG9uZw0KPiA+IA0KPiA+IFRvIHJlc29sdmUgdGhpcyBp
c3N1ZSwgYXBwbHkgdGhlIGxpbWl0IGJ5IHNldHRpbmcgJ21heEl0ZW1zOiAzJyBpbg0KPiBNVDgx
OTUNCj4gPiBhZGRpdGlvbmFsIGNvbmRpdGlvbi4NCj4gPiANCj4gPiBGaXhlczogNGVkNTQ1ZTdk
MTAwICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkaXNwOiBzcGxpdA0KPiBlYWNo
IGJsb2NrIHRvIGluZGl2aWR1YWwgeWFtbCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogTWFjcGF1bCBM
aW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBI
byA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPg0KPiANCj4gWW91ciBTb0IgZG9lcyBub3QgbWF0Y2gu
DQo+IA0KPiBQbGVhc2UgcnVuIHNjcmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgZml4IHJlcG9ydGVk
IHdhcm5pbmdzLiBUaGVuDQo+IHBsZWFzZQ0KPiBydW4gIGFuZCAocHJvYmFibHkpIGZpeCBtb3Jl
IHdhcm5pbmdzLg0KPiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVkLCBlc3BlY2lhbGx5IGZy
b20gLS1zdHJpY3QgcnVuLCBidXQgdGhlDQo+IGNvZGUNCj4gaGVyZSBsb29rcyBsaWtlIGl0IG5l
ZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRoZQ0KPiB3YXJuaW5nDQo+
IGlzIG5vdCBjbGVhci4NCj4gDQoNCkkgYXBvbG9sZ2l6ZSBmb3IgdGhlIG1pc21hdGNoIGFuZCB3
YXJuaW5nLiBJIHdpbGwgbWFrZSB0aGUgY29ycmVjdGlvbnMNCmluIHRoZSBuZXh0IHZlcnNpb24u
DQoNCj4gPiAtLQ0KPiA+IFRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gc2VwYXJhdGUg
dGhlIGNvcnJlY3Rpb25zIGZvcg0KPiA+IE1lZGlhVGVrIFNQTElUIENIRUNLX0RUQlMgZXJyb3Ig
ZnJvbSB0aGUgb3JpZ2luYWwgbWFpbGluZyBsaXN0DQo+ID4gbWVudGlvbmVkIGJlbG93Og0KPiA+
IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MjQxMDMxNTYuMTMxMTktMi1t
YWNwYXVsLmxpbkBtZWRpYXRlay5jb20vDQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4g
PiAgIC0gQWRkaW5nIGZ1bmN0aW9uYWwgZGVzY3JpcHRpb25zIGFuZCBxdWFudGl0eSByZXN0cmlj
dGlvbnMuDQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLHNwbGl0LnlhbWwgICAgICAgICAgIHwgNg0KPiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxzcGxpdC55
DQo+IGFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLHNwbGl0LnkNCj4gYW1sDQo+ID4gaW5kZXggZTRhZmZjODU0ZjNkLi5i
Y2UxYjhiODY2Y2UgMTAwNjQ0DQo+ID4gLS0tDQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3BsaXQueQ0KPiBhbWwNCj4gPiAr
KysNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxzcGxpdC55DQo+IGFtbA0KPiA+IEBAIC01Nyw2ICs1Nyw5IEBAIHByb3BlcnRp
ZXM6DQo+ID4gICAgY2xvY2tzOg0KPiA+ICAgICAgaXRlbXM6DQo+ID4gICAgICAgIC0gZGVzY3Jp
cHRpb246IFNQTElUIENsb2NrDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEhETUkgUlggQ2xv
Y2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogSERNSSBNZXRhZGF0YSBDbG9jaw0KPiA+ICsg
ICAgbWluSXRlbXM6IDENCj4gPiAgDQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJs
ZQ0KPiA+IEBAIC03Miw2ICs3NSw5IEBAIGFsbE9mOg0KPiA+ICAgICAgICAgICAgICBjb25zdDog
bWVkaWF0ZWssbXQ4MTk1LW1kcDMtc3BsaXQNCj4gPiAgDQo+ID4gICAgICB0aGVuOg0KPiA+ICsg
ICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gDQo+IG1pc3NpbmcgbWlu
SXRlbXMNCj4gDQo+IE1pc3NpbmcgY29uc3RyYWludHMgZm9yIGFsbCB0aGUgdmFyaWFudHMuDQo+
IA0KDQpEb2VzIHRoaXMgbWVhbiB0aGF0IGEgJ21heEl0ZW1zOjEnIGNvbmRpdGlvbiBuZWVkcyB0
byBiZSBhZGRlZCBmb3INCm10ODE3MyBjbG9jayBwcm9wZXJ0eSB1bmRlciB0aGUgJ2FsbE9mJyBz
ZWNpdG9uPw0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQpTaW5jZXJlbHks
DQpNb3VkeSBIbw0K
