Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C097B45398
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B3D10EB4E;
	Fri,  5 Sep 2025 09:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cwMqbwyG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CbM5IZtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8185810EB4E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:42:04 +0000 (UTC)
X-UUID: 911dda548a3c11f0bd5779446731db89-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0awnFnkUE0Mp104x3ZXnMYWwGFUYb19inawN3X1KM8Y=; 
 b=cwMqbwyG0STWxbr0ePo7eSyhwzUs2MWy2HUiSA2PLLWQbNJ42uxm1v2a0kEBsL57CZ+uh5eUFWMqzUA9yGZGzkAluVbwzM0AXGgQV1q1Wb/6K8+hpLCA1+llIKlHZ4uGBwgZq3EW9L3A2BDXMdvlQGQN3lUNDhWJ622cpbv5JpA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:de3d1f3f-5bf3-4167-bcbc-bae9dbab67e0, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:46d300a9-24df-464e-9c88-e53ab7cf7153,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 911dda548a3c11f0bd5779446731db89-20250905
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 768097033; Fri, 05 Sep 2025 17:41:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 17:41:42 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 17:41:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oP/5Mg9cBP7gOTACZ7aveV+yNXSlGnkul9FbO185DsZ0X0tVGZDO5zXK60YeO2ig3KSUN26spegZT7vONwPGshxBm0nma1iok64EKMERYaxNyWzm+vULDx2sUgStiO080pu7IWBN1HZXP0ckndtD2srnPANQ3fsOwOWsM17RYezG2RuoAXjYr9Fj1/Bo2s56XjMutcSwc5aL4ArPi13rB3YJhOsJMWw3XS+J6OU8pBSKIeBtVVE/EnVP8Poy5cinnRiZeJ6UtJtt36YyXVLFDKtNm7Vk0TUxgccAkdXhsdv1c4O8PZpSJqj7mWDaTNuO7vgzxkA9io3aZKgvs9LkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
 b=rPHTrK8eZmuePOIDs6xYGPF1BwEyhRCKFUYS4RJNHlx5PxnkBVWQXzO1GYi93f80lHnfoHCFjGmYEUgwYp4U/CZmeLogkxLHC8biYjIeiVC5lJbrfgtqzioIFrLwOM0vO4ZKayCaUaLv7MNHAzGXn7CR0VYHcKn86pgoKXg7rzoD7Vk9YMaq90pF7Z5jcrvwEemNvoWeELoJ9GYmzbwvxP6fixmzqGfmYT0dsxcm1OnnFq3ieyvYIczuFl8bTtupL9wOnJpVwXw2DW+djAKafHJs1TDWHKpLJaZWy8Yt9xM+8fwItp4J7+uCumbqjYIthRN42LXyH6a5nCvoV8iWTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPgCDe7WO4V86DXkOSx7jbCp24cG4uCm6C+Qtt8gfPI=;
 b=CbM5IZtXXBFdf0YQHWPdjdEMOY3n/NpD3I7ajuZJ1yjIU9ox7XRS6MefMXTBOAP06iyDyJg55ZRUmrBEtOK1Lm0E2B3ymOV3mb9tQmmWlQ0tjtLaIT5poBd0iyjv414ph+lzz29/hTibBpzpTuVyjeknJ2TnXyagfHEs5VC+zuo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6540.apcprd03.prod.outlook.com (2603:1096:4:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:41:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 09:41:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Topic: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to
 replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Index: AQHcF0eLeT2L4UGJx0WwI0G+5FmVsLSEZA2A
Date: Fri, 5 Sep 2025 09:41:52 +0000
Message-ID: <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
In-Reply-To: <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6540:EE_
x-ms-office365-filtering-correlation-id: 7d9b7c2a-d89e-4cec-4766-08ddec6071a6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bncrRkphbGpTeGZSUUxJMHNiQnlRMURFSFY2aDV3ckhOMm9sMWUxVjVSaE4v?=
 =?utf-8?B?a3c5SVJDVHdobEE2M0l6b3doNjhkcmNUWHE4clNKLzM0OVlqem9WRFhON3I1?=
 =?utf-8?B?UTY1TjhGTnJuNVMrcU5NTXk5LzB1RUhCTFZYNzZQSFNVNGRTbk54SU9iTjlx?=
 =?utf-8?B?amRwR0xROUZRb1pRZlpYUlNCa3ZuaDB0NjRuTG8vRThsT251VzVMYnEvNVhh?=
 =?utf-8?B?S1BKNllLMlRWa21DZ3pUSmEzeGs3T0pNVEM5K0o1Q0pkYnVaUEdnUHVodUR6?=
 =?utf-8?B?YldDcDU4WnJTaGtuN3ZDSnlVaWlicSs2TmRwWm1iRWtwUHZuNVpjUThvUEVO?=
 =?utf-8?B?UjZmaWNlRWIrNGsxWk9IcERHcWJrQVE2YmQrV29BclUwQ3BPM0tjVFlYUzky?=
 =?utf-8?B?MmptVkR3NzJiVVVKVTAvWGs4aG84QXgvRk9RalhGb21WOERyZzJzYnBGWXYw?=
 =?utf-8?B?U1JtbzlPRnIyMWNRdHdtVlI1ZUozN1ZCaDdySzZZUTl0aUdBKzJycHZ3eDJ0?=
 =?utf-8?B?azExY1NScEFRM084dFR5L3hIZ2o1S1lXUVRTeTIxNTB4blp3WVRXc1BEWXB0?=
 =?utf-8?B?cml0WFpxMmJlWitkVzJORElCM2ZUQVZmWUE2R053a09TWDZUVGZ5S1BDdnBQ?=
 =?utf-8?B?KzNaSkdYZ2M1WHkyemdXb3hEWFV3L1JJak5jRzN1ZlZuSVpSR0oxNkY2QW1Q?=
 =?utf-8?B?MFZIbG5ETFRDRVVDTHFyQ1JNQ1hwbCsvTE9NOWszSGpvQnRJN0lydmh1SDRw?=
 =?utf-8?B?dXdJMGpTTGVMVnp2VnAzRElYR2tkVkhsMVZMMmxWdGp6LzN1SXBwd0I5UUtY?=
 =?utf-8?B?VU9UOWo4K1FxbzBucm03cXRZYjVJNnltbEFCS1IrUlcwWVEzalArUENVUjJG?=
 =?utf-8?B?eGZjOXZudXQvTDh6UDROTXovNDZvb2h3NTNkc245aFlZOUFsR3VDTXI0Z3JF?=
 =?utf-8?B?WDQrdmJYZnNMMVRZVDYzYlBoa04xRDBNR1FQN3oybU9kTXBTaHJEa1lzdTRS?=
 =?utf-8?B?TitUYXlOUVVYZXdJYlhQclg2Lyt3eGR3cFhUR0tyV1RMTFdEaC9HN0tPcDlR?=
 =?utf-8?B?b3dXcjB0dG9ZR2IwTXBNQlFXWmUxL2xsSEVXdWgxZm9KWTU0cXNrSjVYdWpF?=
 =?utf-8?B?b2ZHbkN4NkxCQ1paUll4L2w5VW0vaTB0d0djWXhkYWdyRzZYVnA4eFNlc3FT?=
 =?utf-8?B?S1RBUDlKYncrZyt4SVhFcHdYYWZZSjBsQ1NPb3RsRUF4SGR0N0huM05YMUdC?=
 =?utf-8?B?Ty9tand6VG90ZmJMS1BqdUtOTjN2SG9yeXBodGNJRS9HcWxuRjVXUFluSzRq?=
 =?utf-8?B?U3dCeGVKcmxSbE5tWkUrWXVqL1d3ejNMMXUrTW95bkMyWnZxYnhHU1c1anhx?=
 =?utf-8?B?Slh0bnNobWdUNXFReU1nUk9xL2t0ZXF2N0VZc1k4cGRxRFUyS09QVzljRU02?=
 =?utf-8?B?VTB4cldVaGk2dEl5d3ZpSldHbEczVEpkUkd3M1RHRTg4ZGoxcmZUMGhJbXRJ?=
 =?utf-8?B?U0xhVmFtZ2txUldkazJZOTI3U3FmdllaS21LeDhuWTBjTXBNK2kwdHFsT0lt?=
 =?utf-8?B?aU5zaXluOFhnV3BwT2hRTUlOdFYyd1g3TFg2eWhKQUxRa2Y3TG5zTW5YTXRZ?=
 =?utf-8?B?Z0pQV2RtWjRIK0ZQRkhnOERwV1FEWG9xa3p4dFlhM3Y4L2EzQWVWMFF2TEtI?=
 =?utf-8?B?eGsyNG80MG5ESFJmUWY1QVVhSW1iNWw5OTAxcVhvMEhLa1ArOWxtK2VZWXVx?=
 =?utf-8?B?SWNtaU1zemF4bjV2aExDRUlSU09JT1poMTR3cDJ6OVhZdmJ2TTNDK3lCZGR1?=
 =?utf-8?B?YW92MmQ0bVpBenhScU9ka3E0ZjRITlhzMkxQcXFpclUrNUNVYTIxenV1eWtC?=
 =?utf-8?B?NitnS3YyQ2lkdEVEMkIyZ05ZNzJYb0ZEUVI5K1JkN0VMaloveG5LY1JxSUNY?=
 =?utf-8?B?SDM5a1l0TURNeTYralN1NC9hcy8ydXYwMzlxU2p4VWNoRGMyYStyZXdvc0VL?=
 =?utf-8?B?NW94c0FZbG93PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(7416014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWhSMDRpbXVsdyt0V2IxcHNHRllXbndKekUrd2x2UlNiNWdLb251eno5VVlp?=
 =?utf-8?B?bStGUVN3WFdJVGxZYUxjZlBlYnI5ZVhXQlBza3BlRHVYRzhneTZWOTQ1VnBH?=
 =?utf-8?B?dHYyUFl3aWpGd2QzN0FnN3FGWEVVR3l0b0hWdG5XeTBBcGE2U3FhalpLNE1n?=
 =?utf-8?B?blJrUmh3YmF5S1RiUUtkaXB0a0dWRm5RNnFycnp6S0xIcmxsdE5EQU5VTzhv?=
 =?utf-8?B?c2tHZWw3b2ZqQXp0THJWV2VvSTRjNlM4Ym82YU8rSnZLMDB1TUFTUC9FeFpF?=
 =?utf-8?B?VlQ2SkE3b0pZWGtSTzdBdEpweGZLRmhNOTRZRDFUWkE5eDRRcDhNVld0cXZ3?=
 =?utf-8?B?TjFuSEUvWDdEVEpqS1JCVkVoUzV6bElxVUN5VGYzcWYyazJYNjNwT1owYlEv?=
 =?utf-8?B?MURHOGppVm1tSlZ6cEIrQmJJTlBlaS83S0dqMFNGWFl6NHVvZzlSWTdHQ3Bx?=
 =?utf-8?B?UDkyOEJEb1V2eWhOVWQrZEhMUWQ5dW9SeUFPNnJpR1IrcmlVMTBoaUhjc1Js?=
 =?utf-8?B?NGlqNGZxTWR1SzRBaGJJVk9BTUZFZDl3cml2VXc1NVNUR3RYdVZhUUMvZG9s?=
 =?utf-8?B?QTJYMTRnZFNZeTN5THIwNVZId01QS3BVQW1DQktuTGdpSEZrTzRMdzAwaHVF?=
 =?utf-8?B?dm5qRFNaaStjTnEyaUJKRnRPZEhGM3UwNVlWYWpKbDZtTnpBQmh4RERHOWlU?=
 =?utf-8?B?U3dWRHRTVWw0emU0Y3cyNEZiZzNhSU91QUxOaFFqSm1IRk1pelRybTZyaWlM?=
 =?utf-8?B?RXE2ZktrTURMTU5wNDFQenR0YWVVdzBjcHJQdVN6RFNDVWg4aWhQZnFKQ1dk?=
 =?utf-8?B?STk2N0VpaUU1SHpJMjQ1Ky90N2ZmK2psaWpXdStRNmFoQU9wbUJrK1EyeTR1?=
 =?utf-8?B?VTlRUnJXb01EWFJtSXlOUlNkTEp4RVgvTU5qRXdiWlpTbEZ6ZzJNc2FaS25R?=
 =?utf-8?B?UUo3U0NQZ1dxY3kzUjFGdk1reXlVRlRpbk1BWjlWWlVvVVVjTEJ4U0djeTZp?=
 =?utf-8?B?cXdHTnJjMnoyVkM3aG90ZlUrczlZcWNobWFyK2V3dVNHWDZNd2ZuL0xaV0Vn?=
 =?utf-8?B?NTUvbnJKUUhCV3BIaEpSYzdRajBkNHJhOGpNazcrYjArL3FUWlB5VGpYd3FD?=
 =?utf-8?B?TFU1NEx3ZFlaamJTeFlsV3NRUFh1YXJnTzJTOUNZMWszVW9IekVDelBTNUIx?=
 =?utf-8?B?cWxzVE1OUjdwVjYxMDJsOXB0NTFLdC9hMmJPMmh2cHhFKzBtVTBiMFhrSS9j?=
 =?utf-8?B?azFhQ0ZnVHBLcmFXYWV1VFVuVkdtRGRZdEtuU0pCNTJWU0lsc3ZWOUJLNWU2?=
 =?utf-8?B?NmtXQUkvU3dwNjBJYk02ajJ1VjNMYmpCL04xQ0o0aGMvb1lDeCtNTWorZlYz?=
 =?utf-8?B?cEwwZDMzUFVWd3AyRWNpUG9yUFlZNFNYYTVCcTBoLzloRm5wNzFiamJuNGcx?=
 =?utf-8?B?U1JYQjVaN3lPMmFTWS9XL2lSQjQyN3k2ZzMwempielFOUFM2dEduYWtxdzg3?=
 =?utf-8?B?Rk8vMDFLWHZZOWdlUnJTR0JXeVVMZXFQaWNpQjZoVXFETXVneVRqS1VmMEpP?=
 =?utf-8?B?cDRMQ0RBbnprMmE0YXc1OHdyM1llQzh0RmsrU1RxM2c0MHBjUk5lbUxFZDJi?=
 =?utf-8?B?QWJYTjlleXBjbkxpMEQvTTVtUVpJeVlQaGlvREdZSUlRdWFQbnJSUTRHejJP?=
 =?utf-8?B?eVd0TmdzQ3FQR0ZtKy9kSGtMbjBWVDVYYWJTN3paNUpoWUZsdTJEaXh2Q3Ni?=
 =?utf-8?B?NnV4WkVPYXY5enlCQlduenliVEFRWDVHc3hucE1hc1lZaExwRDdqT3lvU3Fv?=
 =?utf-8?B?M01sVDcrK3hYTUhrSGtHc3E2Yjcvb2RCaHRUcGUyRE5POXRVVUpBaVdTVldi?=
 =?utf-8?B?dGFKbjhwaUtmVmMzUFhQRzhRWmRtWjExb2xRMXQybnJBN3FwNWh6NTZWbGZy?=
 =?utf-8?B?YXhFMGVQSUdlRURrQjlOT29ERXRVQTRDRncwVGRadFpLaVNWd0x4NTlwaWVl?=
 =?utf-8?B?OU1nSkdiSnN4Y2lQZVI0NGFwNTZUcVRuMnRaeEt2ZjUzaFZXTlc0TU1ONTkr?=
 =?utf-8?B?K1Z5SUo4djcxM09WdFNFQitVYjdPbmhUTDJodlhhSEI2SU84aGw4NVBjMzdt?=
 =?utf-8?Q?TMH7dT2WMR434Bw0w+eyJQnA6?=
Content-ID: <440E5BD12505DE47A7CACA6119A2D0BC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9b7c2a-d89e-4cec-4766-08ddec6071a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 09:41:52.3684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ie5VithX7ebafkpzXYAuEDh1zUjA6ZKmhbVgAKZ7XiqU8mjNJ3kHwlh3gmGMnyNrb4K2IaL468r2Ru2qsN6jMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6540
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_352368819.1211345083"
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

--__=_Part_Boundary_009_352368819.1211345083
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE5OjM3ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRvIHN1cHBvcnQgZ2VuZXJhdGluZyBHQ0Ugd3JpdGUgaW5zdHJ1Y3Rpb25zIHVzaW5nIGJvdGgg
cGFfYmFzZSBhbmQNCj4gc3Vic3lzLCB0aGUgb3JpZ2luYWwgY21kcV9wa3Rfd3JpdGUoKSBhbmQg
Y21kcV9wa3Rfd3JpdGVfbWFzaygpIGhhdmUNCj4gYmVlbiBleHBhbmRlZCBpbnRvIGZvdXIgbmV3
IEFQSXM6DQo+IC0gUmVwbGFjZWQgY21kcV9wa3Rfd3JpdGUoKSB0byBjbWRxX3BrdF93cml0ZV9w
YSgpIGFuZA0KPiAgIGNtZHFfcGt0X3dyaXRlX3N1YnN5cygpLg0KPiAtIFJlcGxhY2VkIGNtZHFf
cGt0X3dyaXRlX21hc2soKSB0byBjbWRxX3BrdF93cml0ZV9tYXNrX3BhKCkgYW5kDQo+ICAgY21k
cV9wa3Rfd3JpdGVfbWFza19zdWJzeXMoKS4NCj4gDQo+IFRoZSBvcmlnaW5hbCBjbWRxX3BrdF93
cml0ZSgpIGFuZCBjbWRxX3BrdF93cml0ZV9tYXNrKCkgd2lsbCBiZSByZW1vdmVkDQo+IGFmdGVy
IGFsbCBDTURRIHVzZXJzIGhhdmUgbWlncmF0ZWQgdG8gdGhlIG5ldyBBUElzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgNDEgKysrKysr
KysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCAgfCA3OSAr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gaW5k
ZXggNDFlMTk5N2NkZDUzLi43ZTg2Mjk5MjEzZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1jbWRxLWhlbHBlci5jDQo+IEBAIC0yMTMsNiArMjEzLDI2IEBAIGludCBjbWRxX3BrdF93
cml0ZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTggc3Vic3lzLCB1MTYgb2Zmc2V0LCB1MzIgdmFs
dWUpDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlKTsNCj4gIA0KPiAraW50
IGNtZHFfcGt0X3dyaXRlX3BhKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMgLyp1bnVz
ZWQqLywgdTMyIHBhX2Jhc2UsDQo+ICsJCSAgICAgIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSkNCg0K
c3Vic3lzIGlzIHVzZWxlc3MuIERyb3AgaXQuDQoNCj4gK3sNCj4gKwlpbnQgZXJyOw0KPiArDQo+
ICsJZXJyID0gY21kcV9wa3RfYXNzaWduKHBrdCwgQ01EUV9USFJfU1BSX0lEWDAsIENNRFFfQURE
Ul9ISUdIKHBhX2Jhc2UpKTsNCj4gKwlpZiAoZXJyIDwgMCkNCj4gKwkJcmV0dXJuIGVycjsNCj4g
Kw0KPiArCXJldHVybiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgQ01EUV9USFJfU1BSX0lE
WDAsIENNRFFfQUREUl9MT1cob2Zmc2V0KSwgdmFsdWUpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJP
TChjbWRxX3BrdF93cml0ZV9wYSk7DQo+ICsNCj4gK2ludCBjbWRxX3BrdF93cml0ZV9zdWJzeXMo
c3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTMyIHBhX2Jhc2UgLyp1bnVzZWQqLywN
Cj4gKwkJCSAgdTE2IG9mZnNldCwgdTMyIHZhbHVlKQ0KDQpwYV9iYXNlIGlzIHVzZWxlc3MuIERy
b3AgaXQuDQoNCj4gK3sNCj4gKwlyZXR1cm4gY21kcV9wa3Rfd3JpdGUocGt0LCBzdWJzeXMsIG9m
ZnNldCwgdmFsdWUpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0ZV9zdWJz
eXMpOw0KPiArDQo+ICBpbnQgY21kcV9wa3Rfd3JpdGVfbWFzayhzdHJ1Y3QgY21kcV9wa3QgKnBr
dCwgdTggc3Vic3lzLA0KPiAgCQkJdTE2IG9mZnNldCwgdTMyIHZhbHVlLCB1MzIgbWFzaykNCj4g
IHsNCj4gQEAgLTIzMCw2ICsyNTAsMjcgQEAgaW50IGNtZHFfcGt0X3dyaXRlX21hc2soc3RydWN0
IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woY21kcV9w
a3Rfd3JpdGVfbWFzayk7DQo+ICANCj4gK2ludCBjbWRxX3BrdF93cml0ZV9tYXNrX3BhKHN0cnVj
dCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMgLyp1bnVzZWQqLywgdTMyIHBhX2Jhc2UsDQo+ICsJ
CQkgICB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUsIHUzMiBtYXNrKQ0KDQpzdWJzeXMgaXMgdXNlbGVz
cy4gRHJvcCBpdC4NCg0KPiArew0KPiArCWludCBlcnI7DQo+ICsNCj4gKwllcnIgPSBjbWRxX3Br
dF9hc3NpZ24ocGt0LCBDTURRX1RIUl9TUFJfSURYMCwgQ01EUV9BRERSX0hJR0gocGFfYmFzZSkp
Ow0KPiArCWlmIChlcnIgPCAwKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJcmV0dXJuIGNt
ZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShwa3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiArCQkJ
CQkgICBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlLCBtYXNrKTsNCj4gK30NCj4gK0VYUE9S
VF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfbWFza19wYSk7DQo+ICsNCj4gK2ludCBjbWRxX3BrdF93
cml0ZV9tYXNrX3N1YnN5cyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTggc3Vic3lzLCB1MzIgcGFf
YmFzZSAvKnVudXNlZCovLA0KPiArCQkJICAgICAgIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSwgdTMy
IG1hc2spDQoNCnBhX2Jhc2UgaXMgdXNlbGVzcy4gRHJvcCBpdC4NCg0KPiArew0KPiArCXJldHVy
biBjbWRxX3BrdF93cml0ZV9tYXNrKHBrdCwgc3Vic3lzLCBvZmZzZXQsIHZhbHVlLCBtYXNrKTsN
Cj4gK30NCj4gK0VYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMpOw0KPiAr
DQo=

--__=_Part_Boundary_009_352368819.1211345083
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDgtMjcmIzMyO2F0
JiMzMjsxOTozNyYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjt3cm90ZToNCiZn
dDsmIzMyO1RvJiMzMjtzdXBwb3J0JiMzMjtnZW5lcmF0aW5nJiMzMjtHQ0UmIzMyO3dyaXRlJiMz
MjtpbnN0cnVjdGlvbnMmIzMyO3VzaW5nJiMzMjtib3RoJiMzMjtwYV9iYXNlJiMzMjthbmQNCiZn
dDsmIzMyO3N1YnN5cywmIzMyO3RoZSYjMzI7b3JpZ2luYWwmIzMyO2NtZHFfcGt0X3dyaXRlKCkm
IzMyO2FuZCYjMzI7Y21kcV9wa3Rfd3JpdGVfbWFzaygpJiMzMjtoYXZlDQomZ3Q7JiMzMjtiZWVu
JiMzMjtleHBhbmRlZCYjMzI7aW50byYjMzI7Zm91ciYjMzI7bmV3JiMzMjtBUElzOg0KJmd0OyYj
MzI7LSYjMzI7UmVwbGFjZWQmIzMyO2NtZHFfcGt0X3dyaXRlKCkmIzMyO3RvJiMzMjtjbWRxX3Br
dF93cml0ZV9wYSgpJiMzMjthbmQNCiZndDsmIzMyOyYjMzI7JiMzMjtjbWRxX3BrdF93cml0ZV9z
dWJzeXMoKS4NCiZndDsmIzMyOy0mIzMyO1JlcGxhY2VkJiMzMjtjbWRxX3BrdF93cml0ZV9tYXNr
KCkmIzMyO3RvJiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrX3BhKCkmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO2NtZHFfcGt0X3dyaXRlX21hc2tfc3Vic3lzKCkuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1RoZSYjMzI7b3JpZ2luYWwmIzMyO2NtZHFfcGt0X3dyaXRlKCkmIzMyO2FuZCYjMzI7Y21k
cV9wa3Rfd3JpdGVfbWFzaygpJiMzMjt3aWxsJiMzMjtiZSYjMzI7cmVtb3ZlZA0KJmd0OyYjMzI7
YWZ0ZXImIzMyO2FsbCYjMzI7Q01EUSYjMzI7dXNlcnMmIzMyO2hhdmUmIzMyO21pZ3JhdGVkJiMz
Mjt0byYjMzI7dGhlJiMzMjtuZXcmIzMyO0FQSXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlh
dGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstY21kcS1oZWxwZXIuYyYjMzI7fCYjMzI7NDEmIzMyOysrKysrKysrKysrKysNCiZn
dDsmIzMyOyYjMzI7aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCYjMzI7JiMz
Mjt8JiMzMjs3OSYjMzI7KysrKysrKysrKysrKysrKysrKysrKysrKysNCiZndDsmIzMyOyYjMzI7
MiYjMzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjsxMjAmIzMyO2luc2VydGlvbnMoKykNCiZndDsm
IzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEtaGVscGVyLmMmIzMyO2IvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVs
cGVyLmMNCiZndDsmIzMyO2luZGV4JiMzMjs0MWUxOTk3Y2RkNTMuLjdlODYyOTkyMTNkOCYjMzI7
MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEt
aGVscGVyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21k
cS1oZWxwZXIuYw0KJmd0OyYjMzI7QEAmIzMyOy0yMTMsNiYjMzI7KzIxMywyNiYjMzI7QEAmIzMy
O2ludCYjMzI7Y21kcV9wa3Rfd3JpdGUoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwmIzMy
O3U4JiMzMjtzdWJzeXMsJiMzMjt1MTYmIzMyO29mZnNldCwmIzMyO3UzMiYjMzI7dmFsdWUpDQom
Z3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7RVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0
ZSk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2ludCYjMzI7Y21kcV9wa3Rfd3JpdGVfcGEo
c3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwmIzMyO3U4JiMzMjtzdWJzeXMmIzMyOy8qdW51
c2VkKi8sJiMzMjt1MzImIzMyO3BhX2Jhc2UsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVlKQ0KDQpzdWJzeXMm
IzMyO2lzJiMzMjt1c2VsZXNzLiYjMzI7RHJvcCYjMzI7aXQuDQoNCiZndDsmIzMyOyt7DQomZ3Q7
JiMzMjsraW50JiMzMjtlcnI7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtj
bWRxX3BrdF9hc3NpZ24ocGt0LCYjMzI7Q01EUV9USFJfU1BSX0lEWDAsJiMzMjtDTURRX0FERFJf
SElHSChwYV9iYXNlKSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhlcnImIzMyOyZsdDsmIzMyOzApDQom
Z3Q7JiMzMjsrcmV0dXJuJiMzMjtlcnI7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMz
MjtjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwmIzMyO0NNRFFfVEhSX1NQUl9JRFgwLCYjMzI7
Q01EUV9BRERSX0xPVyhvZmZzZXQpLCYjMzI7dmFsdWUpOw0KJmd0OyYjMzI7K30NCiZndDsmIzMy
OytFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX3BhKTsNCiZndDsmIzMyOysNCiZndDsmIzMy
OytpbnQmIzMyO2NtZHFfcGt0X3dyaXRlX3N1YnN5cyhzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsq
cGt0LCYjMzI7dTgmIzMyO3N1YnN5cywmIzMyO3UzMiYjMzI7cGFfYmFzZSYjMzI7Lyp1bnVzZWQq
LywNCiZndDsmIzMyOysmIzMyOyYjMzI7dTE2JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbHVl
KQ0KDQpwYV9iYXNlJiMzMjtpcyYjMzI7dXNlbGVzcy4mIzMyO0Ryb3AmIzMyO2l0Lg0KDQomZ3Q7
JiMzMjsrew0KJmd0OyYjMzI7K3JldHVybiYjMzI7Y21kcV9wa3Rfd3JpdGUocGt0LCYjMzI7c3Vi
c3lzLCYjMzI7b2Zmc2V0LCYjMzI7dmFsdWUpOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOytFWFBP
UlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX3N1YnN5cyk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsm
IzMyO2ludCYjMzI7Y21kcV9wa3Rfd3JpdGVfbWFzayhzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsq
cGt0LCYjMzI7dTgmIzMyO3N1YnN5cywNCiZndDsmIzMyOyYjMzI7dTE2JiMzMjtvZmZzZXQsJiMz
Mjt1MzImIzMyO3ZhbHVlLCYjMzI7dTMyJiMzMjttYXNrKQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7
JiMzMjtAQCYjMzI7LTIzMCw2JiMzMjsrMjUwLDI3JiMzMjtAQCYjMzI7aW50JiMzMjtjbWRxX3Br
dF93cml0ZV9tYXNrKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3QsJiMzMjt1OCYjMzI7c3Vi
c3lzLA0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyO0VYUE9SVF9TWU1CT0woY21kcV9w
a3Rfd3JpdGVfbWFzayk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2ludCYjMzI7Y21kcV9w
a3Rfd3JpdGVfbWFza19wYShzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0LCYjMzI7dTgmIzMy
O3N1YnN5cyYjMzI7Lyp1bnVzZWQqLywmIzMyO3UzMiYjMzI7cGFfYmFzZSwNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjt1MTYmIzMyO29mZnNldCwmIzMyO3UzMiYjMzI7dmFsdWUsJiMzMjt1MzIm
IzMyO21hc2spDQoNCnN1YnN5cyYjMzI7aXMmIzMyO3VzZWxlc3MuJiMzMjtEcm9wJiMzMjtpdC4N
Cg0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytpbnQmIzMyO2VycjsNCiZndDsmIzMyOysNCiZndDsm
IzMyOytlcnImIzMyOz0mIzMyO2NtZHFfcGt0X2Fzc2lnbihwa3QsJiMzMjtDTURRX1RIUl9TUFJf
SURYMCwmIzMyO0NNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCiZndDsmIzMyOytpZiYjMzI7KGVy
ciYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO2VycjsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytyZXR1cm4mIzMyO2NtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShwa3QsJiMz
MjtDTURRX1RIUl9TUFJfSURYMCwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtDTURRX0FERFJf
TE9XKG9mZnNldCksJiMzMjt2YWx1ZSwmIzMyO21hc2spOw0KJmd0OyYjMzI7K30NCiZndDsmIzMy
OytFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRlX21hc2tfcGEpOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K2ludCYjMzI7Y21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMoc3RydWN0JiMzMjtjbWRx
X3BrdCYjMzI7KnBrdCwmIzMyO3U4JiMzMjtzdWJzeXMsJiMzMjt1MzImIzMyO3BhX2Jhc2UmIzMy
Oy8qdW51c2VkKi8sDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjt1MTYmIzMyO29mZnNldCwmIzMyO3UzMiYjMzI7dmFsdWUsJiMzMjt1MzImIzMyO21hc2spDQoN
CnBhX2Jhc2UmIzMyO2lzJiMzMjt1c2VsZXNzLiYjMzI7RHJvcCYjMzI7aXQuDQoNCiZndDsmIzMy
Oyt7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtjbWRxX3BrdF93cml0ZV9tYXNrKHBrdCwmIzMyO3N1
YnN5cywmIzMyO29mZnNldCwmIzMyO3ZhbHVlLCYjMzI7bWFzayk7DQomZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7K0VYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfbWFza19zdWJzeXMpOw0KJmd0OyYj
MzI7Kw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_352368819.1211345083--

