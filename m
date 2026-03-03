Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKW6EhSMpmnMRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:21:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100521EA158
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C14F10E647;
	Tue,  3 Mar 2026 07:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="KCLRwaH9";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="W9W9ibAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ED710E647
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:21:50 +0000 (UTC)
X-UUID: a403a98816d111f1bcd7499a721e883d-20260303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=; 
 b=KCLRwaH9ZLabEVA+ykTxcHGFg8u5P0awjcnBQMEV1rU2gx5e+zhGYmkTDpxzD09m9QAJu7bcAN/CgAHiP5CV+hTpoFxMEkyJOBnW0dx6nooQkaLCZkCEIOFbpqBE8le/iS9s7Oqw0UmvzyfCZABq781NOX6aaCen5EAn3eAL0mw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:272d7797-f471-4bc9-8542-d4ecd9a4a5bc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:12ae2eea-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a403a98816d111f1bcd7499a721e883d-20260303
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1303036328; Tue, 03 Mar 2026 15:21:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 15:21:47 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 15:21:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPnyj1eCTEcEUaDdfr2rAlCxWV+xwIhPMCX2qeKn7JzoW4jNegGpJ8W9oxhd/5awGrq/213xeoJ1jSmXX0X3aCgwDVjcOwQ0c4mL/truV3mWxZJ+ke/4rlwmaKdo8xORz1Mt++93R8jjKoWPIj0iNGW3jn5u4T1TRjfaGGbcMcsEaLUTVqZat6L91gvPnbWG8ufECta2b/sNEE2Nm8lpVU1eV+xJmkliTaTsksEIsnTt0uZGdBT/pa7AX8J6aI6JMhxpgDoCwQOUKOM5doQdGqSOZ402JFL4STnOQ2r8bX4r1hdLrLmbghM3y9Hpz14blM+FOEn+5IOKVwtshsYW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=;
 b=X0c3stL79zXMlmRI/8VNA6Eykg+qnblreIwpX4AuHr5gx+9NXcv4AnEmGgetHmzzp0vn9dWW62qvkA4EXReGTjBPzPMxrUIyoJw4uFFu10x1qk4eTXugPZ66FB8duVMwml8JiqAo1vD719O6hQBflkZ/T9P8PZ3dQXETB3iS4T9nuuRLhtgfCsBRI/GnthPsl3YnHz3iqqu0EbmWuZpC3SnCKqDAgIeuEHfmuixUPNmnhZleFgs2O/LUKqYdUYtY9b/nf4LaBDhKYJ91wKtL2mfAI44sw/wO7QYGoSUuHmt3DPGX/jn9YicCXQccQ7sJ/1knyOCZCSVkfjx0uwO40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQReZo44LGEfsj+dfAnrhESoU00jZpYpyy5GHsBO2No=;
 b=W9W9ibAZj1Pp88KjqlfFPBEK25h42/CkDMasL0Ilrisv9enuDPSQGrxcxstQDl2eWfBZ/jTI4m7p2WUrXvtuvQnnyU/fRkJeCcsEznlBiD/Rf5x6vP0DZZKo9BM2CBeNRYZVbLeCtO5Sk/oRWmUJ4YyN17qay9rwYTOrTJmCzAg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8798.apcprd03.prod.outlook.com (2603:1096:820:140::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:21:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:21:42 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Ariel D'Alessandro
 <ariel.dalessandro@collabora.com>, "kernel@collabora.com"
 <kernel@collabora.com>
Subject: Re: [PATCH 11/11] drm/mediatek: Check 3x3 Matrix colorop has DATA set
Thread-Topic: [PATCH 11/11] drm/mediatek: Check 3x3 Matrix colorop has DATA set
Thread-Index: AQHcdEUS44Tta/8+7UmSOMwdcpusP7Wc1DoA
Date: Tue, 3 Mar 2026 07:21:42 +0000
Message-ID: <b4d8324f849b6d8670387f292eb30f24cbc84cca.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-11-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-11-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8798:EE_
x-ms-office365-filtering-correlation-id: 670934da-6220-475e-740b-08de78f584fb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: F1/Bvx3sphXKseHl/RIvOo6zbc53uPBbUzyMpM/FnlF4I/qgx5um2hWAeIAQGIgC6NM6ieVYjFEA0jAlqvj0gaJjub/mqdb5Nrlywpp0bszc2ycWp1degoDTATXMf/5boAvld5M8hX9oOIEKTwMy4GKiil6SWrPSBBsCezbDzAjf7ZXYYeQKHrIsKiguWgVSPzpCH1v3ynSo07B/w2rSqgM8lS7Jkk/QOSoxTLP+YCMFXGQA4i29VGh3RAq6HnwomG7p5zI2hcsKAxX3vr1ug5nzJ87ac7Dcwfz9R7AGDQdz0F1kbn1R4dNuazcu28EC9pv+X7Jhpmct6MbsSmwUSxWCyjcu7fpleWnwKTEpbrETqZd4mXs1aEOS6JeQnMJN595NzZQoNF5Dggg8OpCSKk9I2QBMlXuKoKTsfZJIjfj8PydCylgpSZ2GGgMiTD17STVYTWLrGuoFsTCtvm0DdjPEBIpE6txCM5ZqQAg3l1HGqO0V0udzK8FDTqB3D3HD+pdDuEftca+o35TFOJRAnneIvMM78ql25IRuQ8TiKDnQ8dggHs+fS7c00OYTW2hdFg6P4cnH1H6AYPWdgYI305htjd4+dSxs0nbNecCE0gRfTmu+50xXFjaUu5LTYQ4Vjg7zH/Yb2Q1tG2F/ssvkOW0WF1VUsXYCk4jn+i+wv8MroceylCyV0AsnLkyn8vkl4A5kLB5EN1ITkjQzbqwLpg1R6QCByCq1HGSFbrpAvt/g9bdMdGU4mj39OE5nHxbnjk6j73rM5wkmxTuPeY20iZ9Ky2McMKzwSgeO8Ok+21ejE0lMq+9dFx1YLe1a9oq5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0NCYytCR2N6VkRKY2Z0aFBJcisrdDdpUnpqTTZvWnd1UlNIbDlDaXJRNk92?=
 =?utf-8?B?M21jOUk5QVBSdkxBb1d6TzMrNi9hUy9HWG5JQy9jVjRTdGJUU3laWGRtaWFW?=
 =?utf-8?B?cGlyd3AwcnJGUDM0UWtsMFA1N0JoYXdUZllpYVRSenlvZE0zbzlMZlNFV3F0?=
 =?utf-8?B?Mm5FS0NiZlBmVk1ZVERjZlJ6RWJPd3dJNHF0bXU5S2NKbkxyWlRUeFZvSGYv?=
 =?utf-8?B?QUVQWlB0czB3ZUZtSndYWWhaQlVuNnpLNHZINytPUm1jdGZ2VlFrTWpyWWw2?=
 =?utf-8?B?bWNkTWo4U1F5TXl1cFcyL0t6dWh5Wk5wZHQ0NDNJVVc0Y3VxbnMzbjhiK1Bo?=
 =?utf-8?B?Nmtrb0pOR2pKM2tDODYrYzh1eStSMXkxTytlVmEyV0hnSWEyNVlPajNCdVZ6?=
 =?utf-8?B?T3hVUmFRa2Rkd3BQcTlJOTlIV3JLTWxzL2VDd2FIMCthQ0ZiaHYxemxQU0k3?=
 =?utf-8?B?VlZZRnFBNXovVmRnRTdwSkxDWHBCOHZYZFVNMmtSUzA3V0VpUTg3MFcwRElD?=
 =?utf-8?B?VzdacWVXeHlOSzg2dkk0TEJVWHc0VWZ6TStadkdnL0RPdXYzbWVuekx4K3ZJ?=
 =?utf-8?B?V2VSdjlhVmJrWmtiZjlPZHdvYjl3cXVwUlU4U2MxZm9VMVFwaWxzUEp6c0h2?=
 =?utf-8?B?emhmbTNDY0dscmp6N3c5djhyR2E1akFVc2RJSjR2eXdscE5GODFmUU1FZk1a?=
 =?utf-8?B?WGo5RnlrdEFNYkNVbWhaY3d6bXVpNW5hc0NsMGlyYkFSeFhFMUxLZVlpaXB1?=
 =?utf-8?B?WWZDcThlTFJFQXB0NGlMN081NTVEeUs3bFZBd2JHWEZMNFIyakNTNnlHMTZQ?=
 =?utf-8?B?U2s2Zkg2SU5TditwT3pIZC9uQkVRNTZLdkg1dWlYbzBaeEY4VFArd0t5b3Z0?=
 =?utf-8?B?R1U2ajB3aUptN09TY1JKSS9aWXdtTG1OSk5rWEF5eHJ0Q3hRSzVHNU9lWW1W?=
 =?utf-8?B?VmZTNU5aWGQ2Y3I0ZUhKRGc5RTlHVytSM2tZMWtVY2h1VmhwME1LQ1VDWk9D?=
 =?utf-8?B?RDdrK1U1QU16U3dnSGYyazl3UUV0VlYzZnM4NjVNdWlUY0w3ak83UjV0bWUy?=
 =?utf-8?B?cE1EMkZtalV3blBubWhFdXg4M1BzZTErcjY5QmN5K1U1R2FBY09CQ25WZ3NQ?=
 =?utf-8?B?aXhhcTVTTXRUc0VKYUtOWW9USHpPUEpMMWUyQ00vVHZHQk94cE1WeXh3eGtp?=
 =?utf-8?B?RkY0M1VMNnp6YmhYRyszQjB0MnhVb21rK0htMGw5TVdlVzRZOVpqbzkvemNk?=
 =?utf-8?B?TTdnVUxiUzNIYUxJSXJDSHlnRkNIK2RkMjhORjI4bUtqN0hoYnlmc0hFT3Qy?=
 =?utf-8?B?QWdjRk5nTkZOSWNMMW9SL2VpZWZ0blZvd2dHQlN2UHRLUW1pNGY2OXlpZFVW?=
 =?utf-8?B?SUVnVTRWeXIzbms4SFVaRzE3b2dNR0ZlcCttODdHbk9oK2dUYW5NU1dYTHdn?=
 =?utf-8?B?QVNNb001allPVTFCSkR2cG84a2xnemhnakdEaWxKZlBMTGkxZ1pLOENWakVz?=
 =?utf-8?B?cXRYUVRrVEhsbElWTldDbXFIaDRTRkV2akNsa3BTRTRpaGJ2RzBPWWxpMHJU?=
 =?utf-8?B?TWRUdHFKa3R4aGhoWWpRN0hBMkRGMmlTN2YvZFdtYTBlWXVsS0gyQzQrNXpG?=
 =?utf-8?B?L1ZFUmxwVTNES3c2eXdEVFJaSEF6MW1FS0lJcGc0RkwyS2NheGpEYXJUSGI2?=
 =?utf-8?B?OURib3FlNm9iYXc3WHZ1KzZnK2FTMDhpeTF1MWFoZUZrOC8zY2pLT2RjbG5o?=
 =?utf-8?B?dVVUMy9ENUVZNzZiS2oxa1RhSHZQS2FlRTlwUnJ2ZVZTYXVZdFBSS0Zxd2E5?=
 =?utf-8?B?SGRCUEJuVDNZekRDa1lYMjJKUDhOSytsaWNtNU5ZcEthNWxWcllYaGJCbnZM?=
 =?utf-8?B?NVhPWUU0MVhqTmFaOUszWWlUdVJPcXk1cmhJQnd3bjUzbU95cUVuZlErQWVZ?=
 =?utf-8?B?V0hmZUNRZjVHaUNOOGhVeU9iRHhIMnBucDNseGdzcmR3QTdtcGI3WC85QSsy?=
 =?utf-8?B?RUowaTNsT1BYaGt2S250UC9CNHBFSHJ0NzBWVFBpS1hYQUhmT3pRZXJGVURT?=
 =?utf-8?B?VTlvekJJODVCVFRYWHlOUUw5NStpL3FhczFNY0s4YnFMemQrbE9NUVZOaUll?=
 =?utf-8?B?YnVKM2dWVTB1NERLNXZncGNNcTByQmVZbnlVY3RyclZ6SlE3YWR1b3pTMzdm?=
 =?utf-8?B?SVRTMGg4Z2dxS2pxTG1OdWVNdWF3RmYwT0JhZEVIcFlGWGNTMU1XUUdnUDBW?=
 =?utf-8?B?SUNteFRqdFc4OFZxRFpSdmhZVm42WGFJT3R0bUk5Q0NZK1doL0c5YmdPaWp3?=
 =?utf-8?B?MUQvRjZXTGh1R2g5Z2ozeGVkaU9JVVhoWENnbDFoa3E2OFdESW12UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BB9D5697059FD4A9578AF7BFCB12328@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JujczVPKQ95REvq1Akj92VTCeQnc+d8Vy/oFe+73kbHb1e4xQUt6zuVfPWslD8sEmm3GOmM8oACBKZoaawZdaGiLWtSeOTjzHkJrqGeLNvVudawGGUW31S+rnZ/sbWxfIFU1KKP1Q8PUgZuHMp1giQKk9UNG5MhqXyG8sGGFtvKEZq0F94Ka+oDvcfno0Zid9eIWybILTSoaDhRLv5J1ERULVdrAvwUUSRsZqxFv/rsM5yhqTFbD25oQrRwAS2Q4IGZlhEch4MbF88VundASXPCojrF++aAk3DqgWxu6LDqm4MPO7NxhWOYjMEQl1R4ll9h7H9hcxl9IMsik52j6Ww==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670934da-6220-475e-740b-08de78f584fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:21:42.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byI7UhAdAFiKMrkewsRr6GFC0SvYJpJmNpZERt5xmV0Z69Ay5gl5/cIT07H2DEz3oOFMflE4Dxj8VL1VDoNPsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8798
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
X-Rspamd-Queue-Id: 100521EA158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:nfraprado@collabora.com,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:daniels@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,ffwll.ch,collabora.com,gmail.com,pengutronix.de,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mediateko365.onmicrosoft.com:dkim,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYW4gYXRvbWljIGNoZWNrIGhvb2sgZm9yIHRoZSBD
UlRDIGFuZCB1c2UgaXQgdG8gdmVyaWZ5IHRoYXQgYW55IDN4Mw0KPiBNYXRyaXggY29sb3JvcCwg
d2hpY2ggcmVxdWlyZXMgdGhlIERBVEEgcHJvcGVydHkgdG8gYmUgc2V0LCBkb2VzIGluIGZhY3QN
Cj4gaGF2ZSBpdCBzZXQuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19jcnRjLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5j
DQo+IGluZGV4IGY3ZGIyMzVkOTg2Zi4uMWE1NWQ1ZGY2ZGJlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBAQCAtODk3LDYgKzg5NywzMSBAQCBzdGF0aWMgdm9pZCBt
dGtfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgICAgICAgIG10
a19jcnRjX3VwZGF0ZV9jb25maWcobXRrX2NydGMsICEhbXRrX2NydGMtPmV2ZW50KTsNCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgaW50IG10a19jcnRjX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgZHJtX2NvbG9yb3Bfc3Rh
dGUgKm5ld19jb2xvcm9wX3N0YXRlOw0KPiArICAgICAgIHN0cnVjdCBkcm1fY29sb3JvcCAqY29s
b3JvcDsNCj4gKyAgICAgICBpbnQgaTsNCj4gKw0KPiArICAgICAgIGZvcl9lYWNoX25ld19jb2xv
cm9wX2luX3N0YXRlKHN0YXRlLCBjb2xvcm9wLCBuZXdfY29sb3JvcF9zdGF0ZSwgaSkgew0KPiAr
ICAgICAgICAgICAgICAgc3dpdGNoIChjb2xvcm9wLT50eXBlKSB7DQo+ICsgICAgICAgICAgICAg
ICBjYXNlIERSTV9DT0xPUk9QX0NUTV8zWDM6DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlm
ICghbmV3X2NvbG9yb3Bfc3RhdGUtPmJ5cGFzcyAmJiAhbmV3X2NvbG9yb3Bfc3RhdGUtPmRhdGEp
IHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fZGJnX2F0b21pYyhjcnRj
LT5kZXYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ik1pc3NpbmcgcmVxdWlyZWQgREFUQSBwcm9wZXJ0eSBmb3IgQ09MT1JPUDolZFxuIiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb2xvcm9wLT5iYXNl
LmlkKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gKyAgICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0NCj4gKw0KPiArICAg
ICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRj
X2Z1bmNzIG10a19jcnRjX2Z1bmNzID0gew0KPiAgICAgICAgIC5zZXRfY29uZmlnICAgICAgICAg
ICAgID0gZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZywNCj4gICAgICAgICAucGFnZV9mbGlw
ICAgICAgICAgICAgICA9IGRybV9hdG9taWNfaGVscGVyX3BhZ2VfZmxpcCwNCj4gQEAgLTkxNCw2
ICs5MzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9mdW5jcyBtdGtf
Y3J0Y19oZWxwZXJfZnVuY3MgPSB7DQo+ICAgICAgICAgLm1vZGVfdmFsaWQgICAgID0gbXRrX2Ny
dGNfbW9kZV92YWxpZCwNCj4gICAgICAgICAuYXRvbWljX2JlZ2luICAgPSBtdGtfY3J0Y19hdG9t
aWNfYmVnaW4sDQo+ICAgICAgICAgLmF0b21pY19mbHVzaCAgID0gbXRrX2NydGNfYXRvbWljX2Zs
dXNoLA0KPiArICAgICAgIC5hdG9taWNfY2hlY2sgICA9IG10a19jcnRjX2F0b21pY19jaGVjaywN
Cj4gICAgICAgICAuYXRvbWljX2VuYWJsZSAgPSBtdGtfY3J0Y19hdG9taWNfZW5hYmxlLA0KPiAg
ICAgICAgIC5hdG9taWNfZGlzYWJsZSA9IG10a19jcnRjX2F0b21pY19kaXNhYmxlLA0KPiAgfTsN
Cj4gDQo+IC0tDQo+IDIuNTEuMA0KPiANCg0K
