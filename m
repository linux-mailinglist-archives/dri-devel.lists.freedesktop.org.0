Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B4AE7865
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 09:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E683F10E67F;
	Wed, 25 Jun 2025 07:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="aGPugK9I";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qwUIC3h0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD27410E67B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 07:22:41 +0000 (UTC)
X-UUID: 2962eb5a519511f0b910cdf5d4d8066a-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=iTFPEKSStXz+ll46yjwQkJOPxr9GAjmYeouwuWWY/J4=; 
 b=aGPugK9IgimXUNFMrNUu+2RPsMoNHVp0nAAGUgH+DVh9RrXm8tTpkNww00fvwbTES4SdOmr3EOKhuHcoLobFXE18IoRuH/rztN1Wg44SW867PCpRfKDQQAdU/jJakHpYCYsSvAzZAkt+iJyJypb43B5KQ4aL6VeEGkypeFC8lWw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:78502816-78db-4e33-b8a9-49654f46b77a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:68a28a14-6a0e-4a76-950f-481909c914a4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2962eb5a519511f0b910cdf5d4d8066a-20250625
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 266917610; Wed, 25 Jun 2025 15:22:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 15:22:31 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 15:22:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts8QAY9NKcFU0VjN0fvkswIYT8l8HkJNdDvSxVQnGH8ARvT5Ia+r/latj8Z6lgFg0xpaMxfWT68+dTSLCNMncPpqbES3KA5LqvNrpjQJPLxVAlwbKXpQrBU5yDnUR6SP73QiH13erW+Zx/knK3Sv+GwqUsBL9QL1ARJz6PGUcrTnURg1XqW9wQNOszDIXyfQlRpUu7yvkhhGb9k0efcxnVGj8N70BTDbXo+b6hT+HuDh9RToH5yMIgZc0G2/9qs12K2wH1EVluKPNVoli67NTq/BAccigo0K5V2y4KeDq7BRYkzCBq3ST9nVOtdIhvB3t/TjBtaMj2UpE7WyrsGcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
 b=YYUahFb2PFbpxpLAMZEi7O67vgoc7/OOhFKFmUszBg/pPg33eF49DjzHixSplbURlyrAs7k4V1r26Z+GpKsNQ6IPw3DLhpnwb8QdpW+pw8Kc4r65wQ1MaxYYMBX8tPtp4WNkgAMtRLfQQMNpPUyCv9ldUTIeVD+TnMo2H/HfnZxsBtv9j+JTHnEaMqqgI2oIb17NB7Lu3Rs8VYEah9pPBHQa4ck/K2aGZHcHvnDJZYEB9CjEMNDLRHoxiaXKQ1gXv+1gW0j2ByrCXUP8De6Vdg14lVCOeTjEaggDX9URHGjjpNbNvjmupm2JbRbGsp6wwb+xIgSATSW7NoFiTc6ViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n4YlxoN1hNuFiOBHlaBPV0pigQPewyGx+MC7HN+ZxE=;
 b=qwUIC3h0phxth7A6aApeeEVfNz0vML8KQxOOxPDYR78flEuozDPruJkTQ6qgQzBQ6h6hJ8BBdno9VmPZLkzKQUByL5b5iOxB/0nMdLU28fI6lsnxERJjlEOlCm2ADdc3k9M1t3VCHpIIO3ybF5GgJiy4QTcrWQ5NJuCrikAlR/w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6435.apcprd03.prod.outlook.com (2603:1096:101:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 07:22:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 07:22:29 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kernel@collabora.com"
 <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on MT8195/88
Thread-Topic: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on
 MT8195/88
Thread-Index: AQHb1uHqKVQVd8nI90y4eIJj2hJhgrQTlgsA
Date: Wed, 25 Jun 2025 07:22:29 +0000
Message-ID: <870d30cbb6a3f423a5440a59a63bccd2757b5e7b.camel@mediatek.com>
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6435:EE_
x-ms-office365-filtering-correlation-id: f49e8091-7809-4920-b0b7-08ddb3b90b2b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MVAzWUNtZ2hobG1xdzBON2V3TElUQk5tRWwyWk13ekpqWDRMY2dzUVpMeWhF?=
 =?utf-8?B?WHFLMWJCY1dNSUtqNm1MZzliN1Y4Y2d6Y0ZDTFlOdXNVZzBNUmV6Qi9HblFI?=
 =?utf-8?B?eFpLd0VkbjJwN3BPYXdKZGJCVDU2U3ZhaGF2UkpYMXdSOHhINEdnN2pCRlhi?=
 =?utf-8?B?YVNxQ2RxRlJaYlNOd296REZxNWsxU0VBckUzV0didUM2WXRwY1JxSHF0UnVL?=
 =?utf-8?B?Q2JrZ0FaM3JxVFp0N1A0VjFjbGo1Z1NHbTFoYzZkaW5UblR0UU1uQ0JVTit1?=
 =?utf-8?B?SmZHVEVYNWJPV3RCUVVNYi9pZWNBRlBVdzJoWkRWZ2ZlZDVETzBoVVNNbitW?=
 =?utf-8?B?NFhKUHZoVytDTnp0Q09aMC9vdXczM3E0aHRwdWh3QklnSHhYSWljV2pWR2pj?=
 =?utf-8?B?L0pXSnRSU1VEcThvU3ZsZHg2Q2o3Q0dwY1RRbkl6OG81blBSTFZhZ213a2xq?=
 =?utf-8?B?Z29SVlNuUWlEV2c0b25ZdEFWM0dsc3RxRGh1ckl4Nit6b05ZZGd6eStncFlm?=
 =?utf-8?B?SkdWQVUvaGhzS0NxRnhNQzFpejdwYjhodUhHalVYekVPMjlwRUQwZjFPREEz?=
 =?utf-8?B?bWZuOWs2WTFNTzdyVWJOaGlXc2RQZlZSWE5XTXNLYkV3cWFLYzN3cUprc2hz?=
 =?utf-8?B?aFUwbHFBNjBGd3M5cEdkb3ppQlQ3bGZ4VXNKTzhRUEpSYXh5QVkxTnNjYUFK?=
 =?utf-8?B?TkcrYmhNOXVkODZCWFJWNWlNNTNlZWk1cHBEMTQyeml6SklaTHo2ak53SnZV?=
 =?utf-8?B?UmlYV0RsNnNsVXluRjZ0dTErbUdyN09rUkdTbUduWmFmSTAwWnZJL1NSbmhZ?=
 =?utf-8?B?eFppbkpaa3RkUFRJdGwrR3oxMWNWVFE5aHl6VDFYd2RwNmd4ZVBJSDJYVjFp?=
 =?utf-8?B?clYvNXN4S2FDUjJid09NSTE4aVRGc2pQcm1QOTFRVmlRTFluZGpMa0NWMnRR?=
 =?utf-8?B?QzErVmJ6R0hTQTJ4OUtoVm5UTjRwYS93V0srQXA4eWpmMVQwbWhENE00c2tU?=
 =?utf-8?B?alh5d1NHaGJWQUs4b2pXUExqRzRZWVd2VVhDWk9YOFpGS1BQOU9pdmdaTjRQ?=
 =?utf-8?B?dldCeWltSUlkL3VGNTk2MTZyQmwwWXpBWnRhcVdvZ010c3pyMnUwOHQ4TkJz?=
 =?utf-8?B?YmxKanJyUEoxTTBBUktXVmt1SkJnOFgxTkw5UWZoY2lLcElxVVJQTkdHL2Qy?=
 =?utf-8?B?TTNzdjVOMVBuMUFDd2hYK1JaQVp1YTE3eVo0N3F6RUxhZzhCMG55bXhnOHl2?=
 =?utf-8?B?ci9wRW15SEtQQm5rVVlQK1RCY3Voa2tpb1NuVlVaeXQyTUVjVlRHR3hpRmQ4?=
 =?utf-8?B?OUR4c3pldjVHaEdLT0tmL2NESW1QRHcyNFB5bVRVTnZTRUdQMHNiSWRkNTBQ?=
 =?utf-8?B?TG5aVHZJSmVKaGFRdm1hTjNSbUxMME0vSERXM05iZkRhcEZxK0JENFNXd1B6?=
 =?utf-8?B?WWxkdmh4RGdRb1RTK2t2Z3JCeEU1SEFDNjRpbDJrT1hvaWRMYlJkcFJQMFdi?=
 =?utf-8?B?VEduUTVyK3NCc3Nsalh0UDEyUlhYdUpna2NRQmNKaXRSNGdVczFUY0s3K0NV?=
 =?utf-8?B?Y01EakcxZUg0L1FnMVJHT0hLSzdVb2wyWG9SMFZjKzRIWUk2anpralVWbnpE?=
 =?utf-8?B?c1hsSG9KTUVSZzE4RmZ0SVZ2aUpOMXZqZ1hFU0hOS2sranJkTnBIMkdCb3dj?=
 =?utf-8?B?WHltdjc3UGxyYm1ROEt0aTlOam5wRkFoeTZPbGE0VVVNc1E3Z1B6YmlSYlFJ?=
 =?utf-8?B?RlRYU09zSi9SSEkzVnRBVTFMb2hQM0lXZWpkenJRdEZBZ045YnJDbytCd0dZ?=
 =?utf-8?B?eG1ka0NKc1NFb2NKSWZ6QWxoMVBRVGFJdVMvamxpZmxBZzhocVIrNEN1V1d0?=
 =?utf-8?B?VHZreVV3SWFYT1Y0UEljbS9FNHpoRjZ0dXhGaW1EeHhQLzZpRVhxNVFxaHZt?=
 =?utf-8?B?VGh4YnhoT2dRSlBJK3ByejVGT0c3ekNqMHh5RytLWEpvVWtja1ltaUVRR3NF?=
 =?utf-8?B?QnRISlJndlpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWY4bHdGcmtQWVVvWFE3d3N2MXRpd3FLWEt2dDZpWUVVU1ZjbU5Kbi9RTm5q?=
 =?utf-8?B?L2VxNG9saTBvRG9CZmpqQWlOQkpnTUd6RnZLWjlZVE9DdjEyYkQyNnBXUlJp?=
 =?utf-8?B?dGR0UTI3RGcrVTVocmFDbzFuOTZJRFR3ZkZLYmkwYUpuVklyaVhSWWxieGZ2?=
 =?utf-8?B?VXBkR2ljSk03V2NNWmFNVEdOdzhFb2pzRFB4NHNlL1F3QzJSdERlL2NlMDZO?=
 =?utf-8?B?eU9QdS96NERwWjdWQXNEVER6RHk4SGhWT3RGVU93RnUyYUp6ZjI4U0VNMk8v?=
 =?utf-8?B?TlF5NThkK3lXSGhOZlRsYUVnQUlHY2trZEVvd3pyMVl2L1VHYVZ6bmcrRHBQ?=
 =?utf-8?B?L3RnTHpvWVJoVHVicEdPNkgwMDB5NjUzcEVZdXZ4NERvK1JKZjByRE5Uamlz?=
 =?utf-8?B?TXVGNmM5eUdpNzZKUWhPcU1uVmhXNS9lVitTcXZTN0hPTi9ueFpNYlJZZ1Nl?=
 =?utf-8?B?eXhjN3dMeTV5REswZkNEUzBxL2p6OW50ZXcvVGFMWGQ1dHp3aitHR2JhQ091?=
 =?utf-8?B?WkJnM25NcnZmVDEvNkJGK24wOS9lZkF6WnFPcUNvazVhZHhuYTZNVGFCU0JL?=
 =?utf-8?B?UVRwWTduaHhiS3pubnpCS29ZYm9RTjFDK1BPZTc5QVRiMmRCTE9ZbllEd2Ro?=
 =?utf-8?B?S2dHTFpmN1dqRnNMS1MrRGgrZHpDeFIvNG92bHZzejNZYnk0TDYrc0dUSldo?=
 =?utf-8?B?d0oySmJOdzRTVmdYY2FzRFVtY2dIT2djMHNuUzJJQVZIdHlMbEpvWGg1cFNT?=
 =?utf-8?B?a0RlRVdMaTFEZEFJSDhZYmtIQ3dWM0J0ZVdwVmVmaStUYjB3bmJGRjFpaXE5?=
 =?utf-8?B?L3JNR21LNExPN2NoRDdSbmplSmlHN0w4Uk5iWm9FM0ZUZjB4ZUFnckV4RWZj?=
 =?utf-8?B?QWlKdDhyMEVrTWxYMHdWRjY4U0Z5dkFwVUZMQ0M3OEZJWThkTjk1emtCekhn?=
 =?utf-8?B?Q1VTd3hnMVdoNTJiNngxdWxvalFyM2Z0ZEY2M1FPcGRBY3FWMklHR0pvWFJy?=
 =?utf-8?B?WHVEOHdtRlFtUWNRbUkzWjh2bEdVMUptWDF5MkhiUFRQaU5uMExBUllrcktv?=
 =?utf-8?B?d0k5djNwSmZ3Z0ZUMUxycVRwUFgyMzhuZGtVWGE2ZXRWSE95VzFySTZrY2t4?=
 =?utf-8?B?YWZqT0MxR3VVQU5nWng0MU5nWXVVd1ZCZmI5ajFjSEJiOXZMRlRLSjJvRjBW?=
 =?utf-8?B?S3NIWTM2a2xKaXJDQ1ZjTUQ2SG5tZU5ISzJpSFJVMXlOV0xGalRSbFJnNlln?=
 =?utf-8?B?VlNmU3pqeENDU3dEUGNicG1DR2gxaHhmb0hzb1E3RlRmSnlpM3ZxY29KS2JP?=
 =?utf-8?B?M3pnRlNnWDQwMUx1YjRMY1c0ZnpOekxMN3J1cHFXaTB2UW5ERU1EcGVhbExx?=
 =?utf-8?B?OGMwaGhabkRGdHd4QWx5azFHMTZwUThCSGk1L0cwcENxS3FrSzkvODU4SzBh?=
 =?utf-8?B?VU02NTdlcGErbVFUSEg1dnN0bko0b2V3RjR0cU1CTVVJSlNaSno2dGp6Sjd4?=
 =?utf-8?B?eDk5bDVQR1FuWHNCYlNtWEQyWVlIcUViRGpWdmNEd25VVmxSTWZrRWEySUZH?=
 =?utf-8?B?dlJGQjA4aE9QZGcrMlRLemh5N0pwR0labEpzZ1ltWk1kOTdNZjlvUldNY1NP?=
 =?utf-8?B?VE1VdkRNaFZ0MUJkTXBBcWQxczN0UE5TL210UEM0N2VmbDFsNUJrNnIzSFdn?=
 =?utf-8?B?dVh0T1NjTVJ5aG85Z0FLZUZRUHp0UUkyQ3JsWnFuYno2cEFjR0JJYzNrM0JU?=
 =?utf-8?B?ZmlickEvYW1GY3lLRTdOTVhXdkJldGRucEhMeWJrNG01QjJ1V2ZSdnJQS28x?=
 =?utf-8?B?by9pODlSdWd0bFVJVWZUTTRvR3p6QjREVUtiVGswSk90Ri9MZWc0c1NTVGY2?=
 =?utf-8?B?K3FGY0M3VDJFa3M0bytDLzFpUGV0c1ZDYlM4OXVLZDZFWm9pbSs3dG0wak51?=
 =?utf-8?B?c2pTQ2FUTXhvM1VmbmF1WmxuWlhxc1FFMkdXZ3JMVFRBL09tSkRoUCt3bUgy?=
 =?utf-8?B?THdZRnRWRjRVbkI5SDVxMllObjFDVURaWWVncjJnSElELzlIM2pTUTRYenhT?=
 =?utf-8?B?emE3dDJ1Ti9GTjlTWFBuNUx4Vk1oa2N6aitpNlM3THZheGZLS3hDY0gzVzEz?=
 =?utf-8?Q?RuUCU6UOLjSEblrlzwvpmV4xz?=
Content-ID: <858977FCC3780B4E90474D5A3E7ECDC5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49e8091-7809-4920-b0b7-08ddb3b90b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:22:29.3610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4W5wKnCAZPakGMrh3nIYXqbbygUO2PQUmMdqB5bMisM2Vlzh19bm4r23UznheAhLAFkjugJdCoJeUO3o7Rwxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6435
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_2079080285.347051141"
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

--__=_Part_Boundary_009_2079080285.347051141
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE0OjUwICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IFJlb3JkZXIgb3V0cHV0IGZvcm1hdCBhcnJheXMgaW4gYm90aCBN
VDgxOTUgRFBJIGFuZCBEUF9JTlRGIGJsb2NrDQo+IGNvbmZpZ3VyYXRpb24gYnkgZGVjcmVhc2lu
ZyBwcmVmZXJlbmNlIG9yZGVyIGluc3RlYWQgb2YgYWxwaGFudW1lcmljDQo+IG9uZSwgYXMgZXhw
ZWN0ZWQgYnkgdGhlIGF0b21pY19nZXRfb3V0cHV0X2J1c19mbXRzIGNhbGxiYWNrIGZ1bmN0aW9u
DQo+IG9mIGRybV9icmlkZ2UgY29udHJvbHMsIHNvIHRoZSBSR0Igb25lcyBhcmUgdXNlZCBmaXJz
dCBkdXJpbmcgdGhlDQo+IGJ1cyBmb3JtYXQgbmVnb3RpYXRpb24gcHJvY2Vzcy4NCg0KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiAyMGZhNmE4
ZmM1ODggKCJkcm0vbWVkaWF0ZWs6IG10a19kcGk6IEFsbG93IGFkZGl0aW9uYWwgb3V0cHV0IGZv
cm1hdHMgb24gTVQ4MTk1Lzg4IikNCj4gU2lnbmVkLW9mZi1ieTogTG91aXMtQWxleGlzIEV5cmF1
ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiBpbmRleCA2ZmI4NWJjNjQ4N2EwMTljZGNkYjM3NzBkYzA2YTFkZWFiOGQ1YmRh
Li5hMmZkY2VhZGYyMDlmNmQyMTY2ZTc1MjNiODJjYTE4YzgyYzdkNDM1IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gQEAgLTEwOTUsNyArMTA5NSw2IEBAIHN0YXRpYyBj
b25zdCB1MzIgbXQ4MTgzX291dHB1dF9mbXRzW10gPSB7DQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBj
b25zdCB1MzIgbXQ4MTk1X2RwaV9vdXRwdXRfZm10c1tdID0gew0KPiAtICAgICAgIE1FRElBX0JV
U19GTVRfQkdSODg4XzFYMjQsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwN
Cj4gICAgICAgICBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xFLA0KPiAgICAgICAgIE1FRElB
X0JVU19GTVRfUkdCODg4XzJYMTJfQkUsDQo+IEBAIC0xMTAzLDE4ICsxMTAyLDE5IEBAIHN0YXRp
YyBjb25zdCB1MzIgbXQ4MTk1X2RwaV9vdXRwdXRfZm10c1tdID0gew0KPiAgICAgICAgIE1FRElB
X0JVU19GTVRfWVVZVjhfMVgxNiwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVWVYxMF8xWDIw
LA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQsDQo+ICsgICAgICAgTUVESUFf
QlVTX0ZNVF9CR1I4ODhfMVgyNCwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNCwN
Cj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzAsDQo+ICB9Ow0KPiANCj4gIHN0YXRp
YyBjb25zdCB1MzIgbXQ4MTk1X2RwX2ludGZfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gLSAgICAgICBN
RURJQV9CVVNfRk1UX0JHUjg4OF8xWDI0LA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRfUkdCODg4
XzFYMjQsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9MRSwNCj4gICAgICAg
ICBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0JFLA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRf
UkdCMTAxMDEwXzFYMzAsDQo+ICAgICAgICAgTUVESUFfQlVTX0ZNVF9ZVVlWOF8xWDE2LA0KPiAg
ICAgICAgIE1FRElBX0JVU19GTVRfWVVZVjEwXzFYMjAsDQo+ICsgICAgICAgTUVESUFfQlVTX0ZN
VF9CR1I4ODhfMVgyNCwNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1lVVjhfMVgyNCwNCj4gICAg
ICAgICBNRURJQV9CVVNfRk1UX1lVVjEwXzFYMzAsDQo+ICB9Ow0KPiANCj4gLS0tDQo+IGJhc2Ut
Y29tbWl0OiBiM2JkZWQ4NWQ4MzgzMzYzMjZjZTc4ZTM5NGU3ODE4NDQ1ZTExZjIwDQo+IGNoYW5n
ZS1pZDogMjAyNTA2MDYtbXRrX2RwaS1tdDgxOTUtZml4LXdyb25nLWNvbG9yLTVhYWIwZjZkMmQy
Nw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBMb3Vpcy1BbGV4aXMgRXlyYXVkIDxsb3Vp
c2FsZXhpcy5leXJhdWRAY29sbGFib3JhLmNvbT4NCj4gDQoNCg==

--__=_Part_Boundary_009_2079080285.347051141
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDYtMDYmIzMyO2F0
JiMzMjsxNDo1MCYjMzI7KzAyMDAsJiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3Nl
bmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtSZW9yZGVyJiMzMjtvdXRwdXQmIzMyO2Zvcm1hdCYjMzI7YXJyYXlzJiMzMjtpbiYj
MzI7Ym90aCYjMzI7TVQ4MTk1JiMzMjtEUEkmIzMyO2FuZCYjMzI7RFBfSU5URiYjMzI7YmxvY2sN
CiZndDsmIzMyO2NvbmZpZ3VyYXRpb24mIzMyO2J5JiMzMjtkZWNyZWFzaW5nJiMzMjtwcmVmZXJl
bmNlJiMzMjtvcmRlciYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyO2FscGhhbnVtZXJpYw0KJmd0OyYj
MzI7b25lLCYjMzI7YXMmIzMyO2V4cGVjdGVkJiMzMjtieSYjMzI7dGhlJiMzMjthdG9taWNfZ2V0
X291dHB1dF9idXNfZm10cyYjMzI7Y2FsbGJhY2smIzMyO2Z1bmN0aW9uDQomZ3Q7JiMzMjtvZiYj
MzI7ZHJtX2JyaWRnZSYjMzI7Y29udHJvbHMsJiMzMjtzbyYjMzI7dGhlJiMzMjtSR0ImIzMyO29u
ZXMmIzMyO2FyZSYjMzI7dXNlZCYjMzI7Zmlyc3QmIzMyO2R1cmluZyYjMzI7dGhlDQomZ3Q7JiMz
MjtidXMmIzMyO2Zvcm1hdCYjMzI7bmVnb3RpYXRpb24mIzMyO3Byb2Nlc3MuDQoNClJldmlld2Vk
LWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7MjBmYTZhOGZjNTg4JiMzMjsoJnF1b3Q7ZHJtL21l
ZGlhdGVrOiYjMzI7bXRrX2RwaTomIzMyO0FsbG93JiMzMjthZGRpdGlvbmFsJiMzMjtvdXRwdXQm
IzMyO2Zvcm1hdHMmIzMyO29uJiMzMjtNVDgxOTUvODgmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7TG91aXMtQWxleGlzJiMzMjtFeXJhdWQmIzMyOyZsdDtsb3Vpc2FsZXhpcy5l
eXJhdWRAY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjt8JiMzMjs0JiMzMjsrKy0tDQomZ3Q7
JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRpb25zKCsp
LCYjMzI7MiYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0t
Z2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzZmYjg1YmM2
NDg3YTAxOWNkY2RiMzc3MGRjMDZhMWRlYWI4ZDViZGEuLmEyZmRjZWFkZjIwOWY2ZDIxNjZlNzUy
M2I4MmNhMThjODJjN2Q0MzUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEwOTUsNyYjMzI7KzEw
OTUsNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3UzMiYjMzI7bXQ4MTgzX291dHB1
dF9mbXRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOw0KJmd0OyYj
MzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjt1MzImIzMyO210ODE5NV9kcGlfb3V0cHV0X2Zt
dHNbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7TUVESUFfQlVTX0ZNVF9CR1I4ODhfMVgyNCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LA0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19G
TVRfUkdCODg4XzJYMTJfTEUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7TUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRSwNCiZndDsmIzMyO0BAJiMz
MjstMTEwMywxOCYjMzI7KzExMDIsMTkmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjt1
MzImIzMyO210ODE5NV9kcGlfb3V0cHV0X2ZtdHNbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfWVVZVjhf
MVgxNiwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtN
RURJQV9CVVNfRk1UX1lVWVYxMF8xWDIwLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQsDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtNRURJQV9CVVNfRk1UX0JHUjg4OF8x
WDI0LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01F
RElBX0JVU19GTVRfWVVWOF8xWDI0LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfWVVWMTBfMVgzMCwNCiZndDsmIzMyOyYjMzI7
fTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjt1MzImIzMy
O210ODE5NV9kcF9pbnRmX291dHB1dF9mbXRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOy0mIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfQkdSODg4XzFYMjQs
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUVESUFf
QlVTX0ZNVF9SR0I4ODhfMVgyNCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xFLA0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfUkdCODg4
XzJYMTJfQkUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7TUVESUFfQlVTX0ZNVF9SR0IxMDEwMTBfMVgzMCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtNRURJQV9CVVNfRk1UX1lVWVY4XzFYMTYsDQomZ3Q7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUVESUFfQlVTX0ZN
VF9ZVVlWMTBfMVgyMCwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO01FRElBX0JVU19GTVRfQkdSODg4XzFYMjQsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUVESUFfQlVTX0ZNVF9ZVVY4XzFYMjQsDQomZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUVESUFfQlVTX0ZNVF9Z
VVYxMF8xWDMwLA0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstLS0NCiZn
dDsmIzMyO2Jhc2UtY29tbWl0OiYjMzI7YjNiZGVkODVkODM4MzM2MzI2Y2U3OGUzOTRlNzgxODQ0
NWUxMWYyMA0KJmd0OyYjMzI7Y2hhbmdlLWlkOiYjMzI7MjAyNTA2MDYtbXRrX2RwaS1tdDgxOTUt
Zml4LXdyb25nLWNvbG9yLTVhYWIwZjZkMmQyNw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtCZXN0JiMz
MjtyZWdhcmRzLA0KJmd0OyYjMzI7LS0NCiZndDsmIzMyO0xvdWlzLUFsZXhpcyYjMzI7RXlyYXVk
JiMzMjsmbHQ7bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjsN
Cg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioq
KioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwg
bWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFs
LCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNj
bG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252
ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2Vt
aW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1
bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBv
ciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_2079080285.347051141--

