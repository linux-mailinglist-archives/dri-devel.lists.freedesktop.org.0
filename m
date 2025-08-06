Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7927B1C09E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 08:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC5510E2F6;
	Wed,  6 Aug 2025 06:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="thkhC5kc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dSeF7cDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998E410E2F6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 06:50:26 +0000 (UTC)
X-UUID: 9d86749e729111f08871991801538c65-20250806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=TlBobX0l3ZRK2PqzW5GJtw6rIzP0n4A0TlI0UySGask=; 
 b=thkhC5kcYJLdEx4f9g9jPcrpZEs+4mPYcKTJp6uis/PzIcOp4oZpZZ+8vfA+5XzFgCvuZX3E/ioJ3swW4d23Jss5YbLqRU3N2OpuARtdMWN6b/XU+YndlTI0+Tl1X6mzS9gjdNzDuprYaW+BONCV7cy4FBP+2/Myoul/CBjvNMU=;
X-CID-CACHE: Type:Local,Time:202508061450+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:4083bc60-7328-4187-9c53-f9e9aa437164, IP:0,
 UR
 L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:25
X-CID-META: VersionHash:9eb4ff7, CLOUDID:31d72b09-aadc-4681-92d7-012627504691,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:
 nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
 C:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9d86749e729111f08871991801538c65-20250806
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2101643016; Wed, 06 Aug 2025 14:50:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 6 Aug 2025 14:50:12 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 6 Aug 2025 14:50:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxtz8RWh/RwhIEBnFVJmVa87kVCX8EMf+YyaO8CRZASOwFun9xrw2A8CMLA4fAb5BqTyTMQB0W8lEKR25hLBrTxBRby7uS8WAZjqTrMDUcA1Fyw18VmjVhPI77GRJ/IjfWyOaxde7/8u1PoqS6qQKUpWTtnTQQC3o/0THoEcxWJ9gABqza+9FtyeFZnFjwnndhJ22SrhS7MAA8vvfenc3V+c7twLKZ2PpeZRriGRTmHf+Tl8hYYh04ck41cEEYe2PVWnJRxM49tvTwuEwjtn7dVBMw39WcKQsV64dLQpXIJwI1JfzcnkI3CObwwXMMIAXD/KyNxcSj+/6ZWoHhY0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I69r11ORRTnnXGHDya/fbprX51FZJt8eZ/X6I/+geiI=;
 b=Eee6KsDe1JAC0JVLqpIW1+9kfd3Vsg40Mf7ySviVoJMux3XFlj2cY6cKT7rycJgD8N3H75OmDD15ZUb9PH3NTYU0WQVFvsOUObylyIpKrO3fVOsrVh6s83AdczIg9MExcRjG5mXT7JglGyHxk1ztCFl404gypIrr35L/wXLwCRJvM88l1xdQKmxEvGOo4Tvz97JBTe7PYAqZLwU15KHT4JciOjuTgQdrJTujenw1jkLfIVY6IF8xx/yaZOfkFDdldNeCHBHkngNfr9oyvWfwq/+AcZQgrW2Uomc3nBuVujcbfXzlHNz7Zs8Vcw9rMn5HuPIwYrtyRaZyUuAzmcEpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I69r11ORRTnnXGHDya/fbprX51FZJt8eZ/X6I/+geiI=;
 b=dSeF7cDi4ZoY7Oy95Lw+Q1a1VljzwQriZIEB8onigAli+BNgr/9nf3mAC1ss7cZNSKIKn20flo6FLiQcfsFJ2i5s+X1s/wldpwiXNnnxW+0LlR5Tn661Riyq9QC91zjp2Qr/LhMOcMLgWZ1tEHyl2jFVSX8YqCA1IVv3GXQf8/M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7123.apcprd03.prod.outlook.com (2603:1096:101:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 06:50:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 06:50:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Topic: [PATCH v2 4/7] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Thread-Index: AQHb/sZ1vdp72A4KRUGK5l6RL04mw7RVPyQA
Date: Wed, 6 Aug 2025 06:50:09 +0000
Message-ID: <e847cf85d4548e62230354cc44a155c5a583f4cd.camel@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-5-jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-5-jay.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7123:EE_
x-ms-office365-filtering-correlation-id: 62c91d10-bc83-41ab-c27d-08ddd4b57c32
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Y2lFRnByVGR6OHp2YWZuWTdlbGRORjZDT0J4dGxUS0h0TkVtby9waTYycmFM?=
 =?utf-8?B?R2RabXl6cUxnMWsvMFpIc1FibGJ5cTFxWXlPN05MWGdYWkwrTFpUMU01ZTRu?=
 =?utf-8?B?ZDIzMnNoUDNiY0tMTHZzU3FIT3RJK1BIOW9uWTFmU0FRQjZCbktsNWxnNUdZ?=
 =?utf-8?B?U1FqYVYwcFN3d2dhQmVOeVNpM1hZM05nRnl2WFhtei92TFNvVlBlK1Nyckdw?=
 =?utf-8?B?Njg2Vk15OHM1QktHUzczTUtXMFZ5cDhUaHRIV2pMSm5TMUs0cElualRMZkRL?=
 =?utf-8?B?WVA3eXA1YkE4OWZzT2tmUDM1ajhTOHdKT1htNEJpeU4rQ0x3WEdKZDF1YXFS?=
 =?utf-8?B?SXZYdlI1UWYzNnV0aHB1RklxcDZRMG9GeWNmcWR0QzQ3cFNYUGo4clJZMGxm?=
 =?utf-8?B?WWdnM0l4T2FuTUswWTN4c0ZJRHdweWJxVEV2UTh4dzZRbnVHYnFsMnExOWlT?=
 =?utf-8?B?dTlJdjdEUzFvNUZSdXVoeDBtaVRLd0w5SUwvcEF2UmcwejArNWExTjlDZXFD?=
 =?utf-8?B?eklUK1did1lIYk5oakN5UzNtOHpocUF4SWdmdGM5QXR0aDY3VGNwYU9sYk50?=
 =?utf-8?B?RE8rOHZzdnlkeElSNUI2UExOWElJMGZ5TmhsajB6UVhoenR6ZjZPN0dQVmpn?=
 =?utf-8?B?cGtYQ0pwMlVSOUNRNkhBV1A4elVobFY4SlQvbkgzZjhLeHAvY1RpbFRHL25R?=
 =?utf-8?B?WlROc0FiT095Z0IzVTVmQmNLdXV1VDdod0ZsQkRINkt0SUhidGZBNXdzNmhF?=
 =?utf-8?B?TGdtK1FKYnhDZy9DamZRelhmOGcrN2VQdkF3R3p5dXdlTUh2S2ZFRlkzK0xG?=
 =?utf-8?B?M1YwcDl1VEtpNW9pMU1nYlBMVDgrY21WK2lmMjQyUXJpYXJqOVQxVXpLM1dh?=
 =?utf-8?B?WDRUV21VRlgrUDJhQlYzUURIaFVjeGhyYllkdGRrY2pMblBIR2xBS1Npc0xD?=
 =?utf-8?B?dmdGTXdPUDNpVHZlcHowRHozamJlSDY0UEQ2bGRrT3BBeEczZ0JsS1l0aVJU?=
 =?utf-8?B?RXhBR0ZNMXV2b2I3Sk1hdEFYeDIyQWgvSHQ5c3Z1OTMvWG84bTFHMENRUUc0?=
 =?utf-8?B?a1J5TzJ5YXh1MisydytzbWV2RWtWOVBsL2RYalFhMTAvQlV6MDdRVVZSVWlF?=
 =?utf-8?B?NGo4SE9UWUIzUjFpTjU0OHdqdjNvK0UzYzcyeW0xT2FVdnJJQ25LUGhKR3dj?=
 =?utf-8?B?OGE4QzBrZW1jNHU5QzRuaHRSamxoMjltcGhKT1NUOGhSdDh1QTNVdjlscUlF?=
 =?utf-8?B?T2tydVRMdERFeVBoRkNmZ0l4cDNQL0ZRWkV4NFUrYlNyYmRKMk5kSEtyU1Zi?=
 =?utf-8?B?NDNaQXRwYlU2amIreWJVb0NrQ2FodFpIa3JDZ0dieE5vL3RseDFKdHI5TDN0?=
 =?utf-8?B?b0Q4a2pvNzdoNUdsaEYyYXZWRTl0VFpxbllzOFhnTXRqOUpCdStlRDNacXhR?=
 =?utf-8?B?cFkzam9XTkZETFpySEF4cGpYQ3g5TmtQMVN5aGVzbWM4MldJZXlUY1lTMlBL?=
 =?utf-8?B?ME5UY1pkNFZwWmcvM2U1Q2Yyd1cwRkVOanM3WjU3TUlweG1NWWcvSnp1YXdC?=
 =?utf-8?B?N3ZQbmpQWkZWalRlc2oyVUhmR0dRRjc2ME8zQ2JJVnpBRENHWUdjKzhUMC8x?=
 =?utf-8?B?ajRGbU9WaXhDMVRHOGxwT2VMTDVTOGpVMi9aaStPSlN1UEtYdW40TUNZWmFj?=
 =?utf-8?B?c3o2bUhqaXlzMXIxV0FXcVdjNEdSQ2E1RW1tWnhvUmRuY2FKVkxGU0JpMWVR?=
 =?utf-8?B?Q3ZzUnFNOEUrQjJuSUZoSGx0dHF2cmExY29ZY0IwNmhRWjZ0U3FCMG9rZ3Yx?=
 =?utf-8?B?WjRBRzEyNE5lRitMeWMzZ0YvN3FOSVh4L1NkRjN6ZTNnQ1ZnS243eE15Wi96?=
 =?utf-8?B?Vzd2U3dibkdzSllnZTBYNUIrVGlIVC9OdU02eEw3OFk4S0pobFZyZWZscTFB?=
 =?utf-8?B?U25uR2Y1N3dHZFFieTZlcVUwRXdJTUJzdXpzOCtrUXA2RnJiam5RT29yY3ZR?=
 =?utf-8?B?VitpVi9YTkJ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjF6enUyY1J4NGdGdWRQUG5PaWNVNFFkUWRqMFczZGNTUnk5NWFjZGJSMitO?=
 =?utf-8?B?Y2Z3YTZYbzBFY1dhM3JKYkFJOUhxY2ZpbmpiR0ZadCtSczRPZXhFeENCWDU5?=
 =?utf-8?B?SEVaMWQrNUFyR0lZOWpyVThXVFVZTjBQRE5rY0VyV1poWDJVL2hvMGQ0R3ZK?=
 =?utf-8?B?bUliUXBDVWY5NXYyRkp0UGhkdmNRbkg5Z2w3N3ZLN0htWmU4L1c1TnphZktt?=
 =?utf-8?B?VzVGZjdCYVZSOXlvT0RnUW42OUtmaGRUYURkck5lc0o4MnZJQnJINFNGa2o3?=
 =?utf-8?B?WkVJZkh2T2hkbzErTmoxbVB6REU3MHBFWlNmOGxheDVFQlpRMlQ0RytxM0Jl?=
 =?utf-8?B?dlY1UEc0TFR1N1VNSWxsblAvUndxUjk1Z1ZDNThLV3VqZHBOc0NmM2RNV3k3?=
 =?utf-8?B?QWM2ZktCRWhxUnhTZUpXdU1GR1FpR1M3NTgwNTB5M1FOTEZGNkJtK3Q0QWVS?=
 =?utf-8?B?MjRzMys5cDd2dFVvT2VvSTE3RDMvclVPcnVXZFdoQnZyeUxCMGFBeFlNUEVl?=
 =?utf-8?B?RFArY2MrQ1pKTWRjMHJtdTQzMWw5ajBLVHplSXY5dkQ0cWQ5M1VCZ0F2VE80?=
 =?utf-8?B?OU1vY0dOZTY1NkNienh1eldLbGp0blJkRmJXOUlZV1BFZGJMR2llUC9TRG5u?=
 =?utf-8?B?V2M0QUcyM3ZzWUNrc3EvV0RKSkFIQnZwMElzaE4rQUdQMXlKd0hmcFNUcDU2?=
 =?utf-8?B?USt0bnR3Qm5OREJaK3FFcUR5aXZPWk9BbjVpbFRDNjVralY3SkdVTnU2Sy8z?=
 =?utf-8?B?MVpSdklmL0c5WnNHNVNlNmMvSm9zTnlDTXdmM0ZzRlZRdHV3RmRqeFA0Nk11?=
 =?utf-8?B?Z29pQkhuN2dUUkY4VWtVTGR1Tmg1VHVNM0t0c0Yzb3FJMTlheS9vYjZWeSsv?=
 =?utf-8?B?YW83dVAvZHF0MzFJUmFoN1NKSjVwLzFnbmFhdENrc1NHYk1kK2dCWVY4Vjh1?=
 =?utf-8?B?MmVLU3M3T2pneG9DUzJBQlgvSnBjdTVlaEpPQ3h2Tnd1ZDZYcXlqYjFZL1JJ?=
 =?utf-8?B?amo3a3NtZWwwbW1hZ3QweVNNNGwzU0c2SGU2Q1ZEVXNFZzZ6cWVJVE1BeVRx?=
 =?utf-8?B?VFRISkxhcGo4VXVTSmNnYW9sK3ZsYWVwU3FXcFQ5RHFOTkFYTEJxODArdTlG?=
 =?utf-8?B?L3kxOXpGekNjdFZGRSsrU3FmYnc2cEhVcjNBYkEyNTRDNzFTTjlkWE5VanJy?=
 =?utf-8?B?NHBDK003d0ZIVFArK1krMG83eXNtQVNqWE5VcHQwSGxnYVVQNDFwOHV5N3d4?=
 =?utf-8?B?dktFQkVrK0dGOS9oTHdsMDFzV1hrRTZJK0FKdTlFYS9ZaFM2ZGVTYmR0VlRP?=
 =?utf-8?B?cVAyR1dnaDc0SW1iOW1wV25IZ0MyUXFsM1BhSWRITWFXQS9QdWtWOVBpb3Qz?=
 =?utf-8?B?L3lZY2tGQUIwSjNNUWFlazc2ZldYZTdrd0N6WTAzOTBMTGt4d3hHbmtPMWRB?=
 =?utf-8?B?K3prTW1jNGw3UGQvN2pMSnRwMDE0RHRwY1l1NkJ1Ry81SCtsa2Z3NXpaV1R2?=
 =?utf-8?B?ZUFQZk85MGl0NFVPOU5aVFhuUEJLb2ZDT21qcFg3UEljWDJpeXdzdmN5TmRT?=
 =?utf-8?B?dWh6dXZJbHVTZmplUDRCOTNFb1pVTm9acklsVFdmNWc0VUdGQWdYSFJXcndu?=
 =?utf-8?B?SXpDMTJGYWZxT2dUYzByTElZa3AxQWJXQmRnUDdMaFNOZmVpd3BzNWhnTGQv?=
 =?utf-8?B?cnVMRmN4clJjTjdMV004a1VqZ3ZQZFNLTGc1N0ZzdytLSnFzdUNHa0s4cjBL?=
 =?utf-8?B?WEZyc2lzUENvUkIzeFNxNEhzcjdDMCsxYkw0Q1E4a3dBZ1pFcHRaREowdDFr?=
 =?utf-8?B?Y3piN2tYZ0g2UDlFR1FtVEpJbGdabitsYUZLcUtSL3loWjZybndWVk5KemFw?=
 =?utf-8?B?SWdDdTAxalk1Kyt2RnU5RVhpSnJ2Y3I5elJPRVZVTVk2MGJxZi94ZDVVR1g2?=
 =?utf-8?B?MWpqWlBNeVdlZi9sb0FlSkFyYUJpTklVWEdGdys2YzdXbEt3bVlvTGZXYVRv?=
 =?utf-8?B?dEZBTERXNkV5ZnFzc1IybzE0WHQ5ak4yY1U2cWRyTERDcyt6cEgzSTlNc3Z6?=
 =?utf-8?B?Ri9POTZIRUIzcmtMYU9TYkhKYzdGeWovdVRFQVlBeUwraG9ObjJVbWtYUHpM?=
 =?utf-8?Q?soJlMu2rypWQlmMTz6CF2PhSJ?=
Content-ID: <BD7688983524204DAF0D2A99E2E0D590@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c91d10-bc83-41ab-c27d-08ddd4b57c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 06:50:09.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhYIb9GZX/FRy9eT7wdkxDhdUg1IviRWtWt0FkG2jr8O5L3ieJp8nh7AAJPrvBQbZbJ+4ZAfHt8by7aedOys2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7123
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1422415987.1442950075"
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

--__=_Part_Boundary_004_1422415987.1442950075
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDI1LTA3LTI3IGF0IDE1OjE1ICswODAwLCBKYXkgTGl1IHdyb3RlOg0KPiBBZGQg
ZGlzcC10ZHNocCBoYXJkd2FyZSBkZXNjcmlwdGlvbiBmb3IgTWVkaWFUZWsgTVQ4MTk2IFNvQw0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmF5IExpdSA8amF5LmxpdUBtZWRpYXRlay5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IDIwMjIwMzE1MTUyNTAzIGNyZWF0ZWQgPGpheS5saXVAbWVkaWF0ZWsuY29t
Pg0KPiAtLS0NCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AtdGRzaHAueWFt
bCB8IDUwICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2Q5NWVjZmMwZDE5DQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sDQo+IEBAIC0wLDAgKzEs
NTAgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQ0KPiArJVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLXRkc2hwLnlhbWwj
DQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4gKw0KPiArdGl0bGU6IE1lZGlhVGVrIGRpc3BsYXkgMkQgc2hhcnBuZXNzIHByb2Nlc3Nv
cg0KPiArDQo+ICttYWludGFpbmVyczoNCj4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4NCj4gKyAgLSBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPg0KPiArDQo+ICtkZXNjcmlwdGlvbjogfA0KPiArICBNZWRpYVRlayBkaXNwbGF5IDJEIHNo
YXJwbmVzcyBwcm9jZXNzb3IsIG5hbWVseSBURFNIUCwgcHJvdmlkZXMgYQ0KPiArICBvcGVyYXRp
b24gdXNlZCB0byBhZGp1c3Qgc2hhcnBuZXNzIGluwqBkaXNwbGF5IHN5c3RlbS4NCj4gKyAgVERT
SFAgZGV2aWNlIG5vZGUgbXVzdCBiZSBzaWJsaW5ncyB0byB0aGUgY2VudHJhbCBNTVNZU19DT05G
SUcgbm9kZS4NCj4gKyAgRm9yIGEgZGVzY3JpcHRpb24gb2YgdGhlIE1NU1lTX0NPTkZJRyBiaW5k
aW5nLCBzZWUNCj4gKyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy55YW1sDQo+ICsgIGZvciBkZXRhaWxzLg0KPiArDQo+ICtwcm9w
ZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgICAgLSBlbnVtOg0KPiArICAgICAgICAg
IC0gbWVkaWF0ZWssbXQ4MTk2LWRpc3AtdGRzaHANCg0KUGF0Y2ggWzMvN10gdGRzaHAgZHJpdmVy
IGRlcGVuZCBvbiB0aGlzIGNvbXBhdGlibGUgc3RyaW5nLCBzbyBwYXRjaCBbMy83XSBkZXBlbmQg
b24gcGF0Y2ggWzQvN10uDQpUaGUgcGF0Y2ggb3JkZXIgaXMgd2VpcmQuDQpVc3VhbGx5IHRoZSBi
aW5kaW5nIGRvY3VtZW50IGlzIGluIGZyb250IG9mIGEgc2VyaWVzIHRoZW4gZm9sbG93IHRoZSBk
cml2ZXIuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1z
OiAxDQo+ICsNCj4gKyAgY2xvY2tzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gK3JlcXVp
cmVkOg0KPiArICAtIGNvbXBhdGlibGUNCj4gKyAgLSByZWcNCj4gKyAgLSBjbG9ja3MNCj4gKw0K
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0KPiArDQo+
ICsgICAgc29jIHsNCj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ICsgICAgICAg
ICNzaXplLWNlbGxzID0gPDI+Ow0KPiArDQo+ICsgICAgICAgIGRpc3AtdGRzaHBAMzIxZTAwMDAg
ew0KPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTYtZGlzcC10ZHNo
cCI7DQo+ICsgICAgICAgICAgICByZWcgPSA8MCAweDMyMWUwMDAwIDAgMHgxMDAwPjsNCj4gKyAg
ICAgICAgICAgIGNsb2NrcyA9IDwmZGlzcHN5c19jb25maWdfY2xrIDEwNz47DQo+ICsgICAgICAg
IH07DQo+ICsgICAgfTsNCg0K

--__=_Part_Boundary_004_1422415987.1442950075
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1N1biwmIzMyOzIwMjUtMDctMjcmIzMyO2F0
JiMzMjsxNToxNSYjMzI7KzA4MDAsJiMzMjtKYXkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7JiMz
MjtBZGQmIzMyO2Rpc3AtdGRzaHAmIzMyO2hhcmR3YXJlJiMzMjtkZXNjcmlwdGlvbiYjMzI7Zm9y
JiMzMjtNZWRpYVRlayYjMzI7TVQ4MTk2JiMzMjtTb0MNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0pheSYjMzI7TGl1JiMzMjsmbHQ7amF5LmxpdUBtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7MjAyMjAzMTUxNTI1MDMmIzMyO2NyZWF0
ZWQmIzMyOyZsdDtqYXkubGl1QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYj
MzI7JiMzMjsuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLXRkc2hwLnlhbWwmIzMy
O3wmIzMyOzUwJiMzMjsrKysrKysrKysrKysrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2Zp
bGUmIzMyO2NoYW5nZWQsJiMzMjs1MCYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7JiMzMjtj
cmVhdGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNocC55YW1sDQomZ3Q7JiMz
MjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AtdGRzaHAueWFtbCYjMzI7
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkaXNwLXRkc2hwLnlhbWwNCiZndDsmIzMyO25ldyYjMzI7ZmlsZSYjMzI7bW9kZSYjMzI7
MTAwNjQ0DQomZ3Q7JiMzMjtpbmRleCYjMzI7MDAwMDAwMDAwMDAwLi4zZDk1ZWNmYzBkMTkNCiZn
dDsmIzMyOy0tLSYjMzI7L2Rldi9udWxsDQomZ3Q7JiMzMjsrKysmIzMyO2IvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC10ZHNo
cC55YW1sDQomZ3Q7JiMzMjtAQCYjMzI7LTAsMCYjMzI7KzEsNTAmIzMyO0BADQomZ3Q7JiMzMjsr
IyYjMzI7U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6JiMzMjsoR1BMLTIuMC1vbmx5JiMzMjtPUiYj
MzI7QlNELTItQ2xhdXNlKQ0KJmd0OyYjMzI7KyVZQU1MJiMzMjsxLjINCiZndDsmIzMyOystLS0N
CiZndDsmIzMyOysmIzM2O2lkOiYjMzI7aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLXRkc2hwLnlhbWwjDQomZ3Q7JiMzMjsrJiMzNjtz
Y2hlbWE6JiMzMjtodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMN
CiZndDsmIzMyOysNCiZndDsmIzMyOyt0aXRsZTomIzMyO01lZGlhVGVrJiMzMjtkaXNwbGF5JiMz
MjsyRCYjMzI7c2hhcnBuZXNzJiMzMjtwcm9jZXNzb3INCiZndDsmIzMyOysNCiZndDsmIzMyOytt
YWludGFpbmVyczoNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7Q2h1bi1LdWFuZyYjMzI7SHUm
IzMyOyZsdDtjaHVua3VhbmcuaHVAa2VybmVsLm9yZyZndDsNCiZndDsmIzMyOysmIzMyOyYjMzI7
LSYjMzI7UGhpbGlwcCYjMzI7WmFiZWwmIzMyOyZsdDtwLnphYmVsQHBlbmd1dHJvbml4LmRlJmd0
Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2Rlc2NyaXB0aW9uOiYjMzI7fA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjtNZWRpYVRlayYjMzI7ZGlzcGxheSYjMzI7MkQmIzMyO3NoYXJwbmVzcyYjMzI7cHJv
Y2Vzc29yLCYjMzI7bmFtZWx5JiMzMjtURFNIUCwmIzMyO3Byb3ZpZGVzJiMzMjthDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyO29wZXJhdGlvbiYjMzI7dXNlZCYjMzI7dG8mIzMyO2FkanVzdCYjMzI7c2hh
cnBuZXNzJiMzMjtpbiYjMTYwO2Rpc3BsYXkmIzMyO3N5c3RlbS4NCiZndDsmIzMyOysmIzMyOyYj
MzI7VERTSFAmIzMyO2RldmljZSYjMzI7bm9kZSYjMzI7bXVzdCYjMzI7YmUmIzMyO3NpYmxpbmdz
JiMzMjt0byYjMzI7dGhlJiMzMjtjZW50cmFsJiMzMjtNTVNZU19DT05GSUcmIzMyO25vZGUuDQom
Z3Q7JiMzMjsrJiMzMjsmIzMyO0ZvciYjMzI7YSYjMzI7ZGVzY3JpcHRpb24mIzMyO29mJiMzMjt0
aGUmIzMyO01NU1lTX0NPTkZJRyYjMzI7YmluZGluZywmIzMyO3NlZQ0KJmd0OyYjMzI7KyYjMzI7
JiMzMjtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlh
dGVrLG1tc3lzLnlhbWwNCiZndDsmIzMyOysmIzMyOyYjMzI7Zm9yJiMzMjtkZXRhaWxzLg0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2NvbXBh
dGlibGU6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51
bToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5Ni1kaXNwLXRkc2hwDQoNClBhdGNoJiMzMjtbMy83
XSYjMzI7dGRzaHAmIzMyO2RyaXZlciYjMzI7ZGVwZW5kJiMzMjtvbiYjMzI7dGhpcyYjMzI7Y29t
cGF0aWJsZSYjMzI7c3RyaW5nLCYjMzI7c28mIzMyO3BhdGNoJiMzMjtbMy83XSYjMzI7ZGVwZW5k
JiMzMjtvbiYjMzI7cGF0Y2gmIzMyO1s0LzddLg0KVGhlJiMzMjtwYXRjaCYjMzI7b3JkZXImIzMy
O2lzJiMzMjt3ZWlyZC4NClVzdWFsbHkmIzMyO3RoZSYjMzI7YmluZGluZyYjMzI7ZG9jdW1lbnQm
IzMyO2lzJiMzMjtpbiYjMzI7ZnJvbnQmIzMyO29mJiMzMjthJiMzMjtzZXJpZXMmIzMyO3RoZW4m
IzMyO2ZvbGxvdyYjMzI7dGhlJiMzMjtkcml2ZXIuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO3JlZzoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyO21heEl0ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjtjbG9j
a3M6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjttYXhJdGVtczomIzMyOzENCiZndDsm
IzMyOysNCiZndDsmIzMyOytyZXF1aXJlZDoNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7Y29t
cGF0aWJsZQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjtyZWcNCiZndDsmIzMyOysmIzMyOyYj
MzI7LSYjMzI7Y2xvY2tzDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrYWRkaXRpb25hbFByb3BlcnRp
ZXM6JiMzMjtmYWxzZQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2V4YW1wbGVzOg0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7c29jJiMzMjt7DQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyNhZGRyZXNzLWNlbGxzJiMzMjs9
JiMzMjsmbHQ7MiZndDs7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyNzaXplLWNlbGxzJiMzMjs9JiMzMjsmbHQ7MiZndDs7DQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rpc3AtdGRz
aHBAMzIxZTAwMDAmIzMyO3sNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVv
dDttZWRpYXRlayxtdDgxOTYtZGlzcC10ZHNocCZxdW90OzsNCiZndDsmIzMyOysmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZWcmIzMy
Oz0mIzMyOyZsdDswJiMzMjsweDMyMWUwMDAwJiMzMjswJiMzMjsweDEwMDAmZ3Q7Ow0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2Nsb2NrcyYjMzI7PSYjMzI7Jmx0OyZhbXA7ZGlzcHN5c19jb25maWdfY2xrJiMzMjsx
MDcmZ3Q7Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjt9Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7fTsNCg0KDQo8L3ByZT4NCjwvcD48
L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBN
RURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0
YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250
ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJl
PjwhLS19LS0+

--__=_Part_Boundary_004_1422415987.1442950075--

