Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA5A95DB4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 08:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5D410E4F7;
	Tue, 22 Apr 2025 06:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qHHJEoIh";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="o2cwMpao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573C10E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:04:13 +0000 (UTC)
X-UUID: 9a96fa421f3f11f09b6713c7f6bde12e-20250422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=oIAqpEWrLGlqSViRrKzjZm5ALz8WbywiutSjvLXDvgw=; 
 b=qHHJEoIhgCD/FJFOSiUekSkk/cPTAQ+q6MHKRl5VshwQo/QJgeb9HCQ0bwMrmSW6jOBGWWxcoPX/DQMPJW5s/nAKBSZqRHGRC4GGyl9/5te2qNVW5caS+Be+1xz9ymaewuR5sZ+DBg++50kdPihbMR0tUsM+x7uU7uVXZ8zsEP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:773d434d-a531-4c13-9029-52d658703ba1, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:8ca95ba6-c619-47e3-a41b-90eedbf5b947,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9a96fa421f3f11f09b6713c7f6bde12e-20250422
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2083452257; Tue, 22 Apr 2025 14:04:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Apr 2025 14:04:07 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Apr 2025 14:04:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/1RNwls1eG55Q6iH1+gvYwqtz3VusPv15AQajULUPoY8sm0hdxQ+WNeGPNOohSj8HU7IMqLAVVvTsoRa34RcoUH5m/pOqZLLp+AclfdNddYPE5zITz6xd3dslY9wKN5D2Cp7aFvMte5Z6EWBgjDGD1Qli6lSZcd8NGRWHCIxScZv4Ib5fa1f+MWPzJVdYlqABOMpgmQjH8vUJzLCq8noeN93Lw5iQ3kLXDthggATyxtXV8EzekNJUOCZ94U2+F5G8Y6+w9dqtUJE5T8E0dYhoydId4rS8URyxApeLIWrtTadZ9DsXececB+w0x/hH9ALIXPBY+HZ+NeMfwJUqf0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCsxgezsI7b0KAsZnHygDE9CGJC3rYiI1hJOhVK+7VE=;
 b=Hzw6hzWxj2QkyvSXFFxZUj87al+W3tbNASX3XEOx4xsvMw7DgI4QKEGIsV+wAjGsQo7J4oyvdYl4qrCbJaHp47LWnBtx5EPONxQ3qJdOzjT2XvjtAETrJFDY2dmIs/sSa5O9EzjrBzLmX1lbH/QGles3quBKK2FZIX2O+m0PLGWMx8z0bF/J+JHXiwso/TtrL0TDdfQPtp+/mQAY8G6pAA3tFO0lziE+dhwA8BAagFS+4VunJc0uR9QDl+wgDhxhLaNIvBrET529ZiZib6iQrcjgSNv7ofoAuEQtXyXOIrRSwpIGFluVwtGtc6tEhsztZj2Jfaq+5aVt7YdELl4uoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCsxgezsI7b0KAsZnHygDE9CGJC3rYiI1hJOhVK+7VE=;
 b=o2cwMpaoPlGyXGycwOaZxR/nSg/VXTHi2bZiAHY7udrVPyX7+X+tNgMJAP2lRA4VQoUkkzqzOuacC48lppPjpRbpC3+oHmXzNEdMlWwTIZiZJbC+NigaJokR+rDZNH7kgG66WmygiJ6CYUtraHRfMvhP8b4TLysaIyQVGK/cFRk=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by JH0PR03MB7879.apcprd03.prod.outlook.com (2603:1096:990:32::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 22 Apr
 2025 06:04:04 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 22 Apr 2025
 06:04:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v1 5/5] drm/mediatek: mtk_dpi: Rename output fmts array
 for MT8195 DP_INTF
Thread-Topic: [PATCH v1 5/5] drm/mediatek: mtk_dpi: Rename output fmts array
 for MT8195 DP_INTF
Thread-Index: AQHbqVFfJzzFPsj1sEa9QZqUhVzS2rOvRg4A
Date: Tue, 22 Apr 2025 06:04:03 +0000
Message-ID: <17edb4bdca86ea79f89208567cc6e17778821b50.camel@mediatek.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
 <20250409131306.108635-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131306.108635-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|JH0PR03MB7879:EE_
x-ms-office365-filtering-correlation-id: 10603798-1eb9-4038-4bde-08dd81637bf2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QUJGeFQ4STVBclRKbndEZnhzdkh3VlcyUCtrd1NXVkJWK1RWdHA3YkxNakJG?=
 =?utf-8?B?MFlCYkZ3Ym5ZOTRrYWw4cmtvb1pnZ25Fek9IcnMySzRCMmN3Z09lNG1vVTJF?=
 =?utf-8?B?cnNUK0trbng3bEREekd1ZFFVK3c1V0ZPVDUzZXFocGNvSGhTbVNhSE1uZ0Np?=
 =?utf-8?B?ZXdqcEpmVGlobWxrM1FRZ095YmhUM3ZNMnh0MHgzSEYzZHhmMXJid1ZCbHVj?=
 =?utf-8?B?NG1FNHdWYlpUZTZEWFMxOFNmQjVrTVBhNTJmNTcweTdoRGo5QXI5aGNZdHB4?=
 =?utf-8?B?c1BXZlhLWVFHYS9TcERmMnJPejE2UXV5NUg1RG9mdmRQZVZxQXJRMWxLU2V6?=
 =?utf-8?B?Ujk3Wmk1TVRMaFJNV0Zjbm5VVk14S1dwb3VaOU16dlBqdUtPQy8xYzVjY0lh?=
 =?utf-8?B?VHRWUy8yU0RzRVpjNko0akhMdHZJWlFTWEZtcXlLc09rcW82U2FyMm5FUDRP?=
 =?utf-8?B?UTJXUzRBd0lHbE4yN093QzBpVndNdURJeFVkS0ZYdEdqVzBXOGxYZUl4ZTVl?=
 =?utf-8?B?cVVUSTFMK1hKWTdydkM4UDYxRDZGYlhJeDJuQmJJc1Q0cnBXYXlzNDEwNkhl?=
 =?utf-8?B?U3F5dHBCZnJvakpCTW9YOWc2VXNVTklIampMQ0lVa3JiWjJVM0g3SWNVTkk2?=
 =?utf-8?B?VTBJYzExVFVuVXQ4MWl2dTg3dkhNTGhNSVhmT0xva1hNZmZzMERyZW5wVzNn?=
 =?utf-8?B?Sk1WKzFSelZ2eVg5MWpSUUptMGNIVjcxUEtxcmhId0psVnBDL3dCUW5veFlM?=
 =?utf-8?B?YWxrTlIrWXg3UVJlVW9iQmNLSHhtUkcxbzFOTldYVXhZelR3OU9GcDdObWhj?=
 =?utf-8?B?TzR3cnFsbFlybmlpemV2dVFLSFpTdDBqTVJjRUdlbVcrL1ZjV2J6M0V5dVRD?=
 =?utf-8?B?TFpianlVYzdjWU5RN2UybVllN0xydkhLNmFHNDBLUFlvTXh4VlpZdnN4YjhW?=
 =?utf-8?B?TXJ5eWxTSWlzeUhpUUU2UDJSRjk1am1uQ0FQd3pVaWxUb1llL0NUSmFMSUVq?=
 =?utf-8?B?N1lud1hjN2NpZDJ2V2NVLzZPOHc5OUhaTXFzb2NKdUhXdGZQQlRueExnMGZs?=
 =?utf-8?B?N1J2VUFodE5TbEt2Y3JJTCtCcy9uMGljMjgvVUt2S2ZmNzNWUGUrNkt4UURU?=
 =?utf-8?B?NjNSTWV1eEZxaTdaR0h5eC9ZcG1XTmlnTU1CcU5CdG9EMFNiZlNGMWN5enp5?=
 =?utf-8?B?TlV5THhtR0lPVVZBblJnREhFTVhjV0NhZ1YySHRwNUk3Umh1b24rQ0l5alVT?=
 =?utf-8?B?U1d3alpiZUpKVnUrR3pFVTJEQ29rbXlkR3NrMkxhUlk2a1FWVTZyOElXWVNB?=
 =?utf-8?B?dGY2ai9YWSt0eEdZV01ROTZOcW1KYmlyWE13Z0dqSDl6dExPTndjTUw0K3hN?=
 =?utf-8?B?eDROR1Vtd0JvQ2RDelJmYjViVDg3bkFHdkFGV1JYdkdZTUJwMGZKL1dyVXB4?=
 =?utf-8?B?MGsvbVRLc2pNZndtL1FZS25XMEU2YWMyTXNBbnRvOGZUbXdIRVlRdnFGNlVD?=
 =?utf-8?B?eVE4dTc2enBVVDV6QVpHSCtPSE9LRkVVaGZ3N3VRTXRTMTVlRyt3VVlrOWFZ?=
 =?utf-8?B?U3Y1aGt5aW1WaUdqZWJQdFVwQ1hlS3hibTFvY2prNG9sU21EM0ZEMDNlWGtq?=
 =?utf-8?B?Yk5PaGhkUDhIVVBRWnhwZDNiSTRpVU9scDduSVpQU2FsVzZjeWtiTDdhc2dN?=
 =?utf-8?B?S3hpKzczZzZ6K3FKOFcraHM3WWI2dDk1eGVTcEREbWhCV0hqSHE4OVpuVk96?=
 =?utf-8?B?WXlqeHlFTisyRWZ6eXpLZi9JT25RNEhkdWgxYkpWSXhhZm1uWXVQWU9ERkZp?=
 =?utf-8?B?NUc0NzlKdXJaRUg5clp1dmZaaS9objd4KytISlNnSm5XSThNYU5ZVUNLUDU4?=
 =?utf-8?B?V0JVTlBUbUVJVWszdzZpODNZdmFEYkE0bldRT1dtRUxlNlJyc1F2Tjd6UnJT?=
 =?utf-8?B?TTZIb1BpeUdpZ1dLdmJjaHEvRVR4TVpRckZtV09MbFQ2K0pjTjBjVm9CL2ZQ?=
 =?utf-8?B?aWFHOSt1Uy9BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEhsVHJWRkZ3VkxjUU9NRUJSVDFIVFM4ZFVwQTM4ejlKa1VrSDVEOHZWRlBz?=
 =?utf-8?B?WDRObjY4dEwxR3pDQVNuRFFHYUViY0J2RzgvdGMzRDdTTWhDMUo4N0pzeEMy?=
 =?utf-8?B?K3hZWURsQXZzN1ZGeGo3VnYraHc1dXhwSjhVNnVCVlIyeHovV3hRdWREQmd2?=
 =?utf-8?B?THhnZ1h4VW5URTdIdUJJaFhTclJvNjBMdHl0U0QydU1YRUN3SWdFUmFqQnRQ?=
 =?utf-8?B?d3hkU3NieWtQaGRONDlEREh1MmxtT0hBNkkvcnJ0TEtCdjVPNG1ibExZWURK?=
 =?utf-8?B?dHJWNCtMbUVudUxKZzU4TWJjYjZnNW5XSFlSZFhrMjFSSVdsMUNRR2RKekd2?=
 =?utf-8?B?S05SRlpqZERzaUdxWjUxRlRrRytaQ1FzMXJCWHlIWHZQSmsvOW5hSzlJbWhW?=
 =?utf-8?B?ZWVZRVFFNnFjYUc1dkNndEc4Tk9mTnBrWmVzeHNwK0t4ajg2ckx5cjBvdmtY?=
 =?utf-8?B?VDlLdlBLV2lQUitQdTJUNWpTYjFKV0ErN1BuWmVaeEhwRTMvSDFXOFBmWFhE?=
 =?utf-8?B?R1ppVlFSblAvR0IzclhiWWNkcGVVNk1VMHU4MlFveXhNWWozRmJHcjQ1MFZq?=
 =?utf-8?B?N2IwZkJWSXczT1JJRnJKWHhFcllWbTM5MHFxYU1rZHoxUzlHRHRXUllSayt1?=
 =?utf-8?B?MGJSOWQ4RjZHQXFkeUM2c2tBeDJxVTVka0kyVGVlZHF1VjVOZXRZVmNDak9s?=
 =?utf-8?B?OWZCUXg1L0pISjQ5Wm9IaWZxWUtXUVB3ZlV1MWl3aXlpUGEzKzlMYmJHRzFx?=
 =?utf-8?B?VzQ5blZJSjk4dThBdkpZOVN0ZXN6blphdlY2Z3l5WmpCc0dlemtvMzZSL0dR?=
 =?utf-8?B?RVA1N1pST1JENUtvbkdSam1xRWM5Qzh0QTNEaVNCRXFXNnVVS0Urb2p6d3FE?=
 =?utf-8?B?YnlsRWpjOTJGcy9aS3JTUEgwUXo5TURrNGhFWGh0VHA1RnRDNUEzbDNxZ3dX?=
 =?utf-8?B?dlFtYXhuTzN2QXZsU1ZjbEZwMlc2SnlEV2pObDliQlA2Nm1vdFBqa1ZyQUlu?=
 =?utf-8?B?dEEvRVp6ZzBtQWhRdmhTRXJQc2VZNUNTd05DV2daM0FKSy9TSGNLaVloOTc1?=
 =?utf-8?B?WFRWQXV2VzdndjRZNkFsTEVpeG9PVHQxYmhBdzhYZkIxTE1ma3ExcnUrcm9D?=
 =?utf-8?B?b1NUVXZiNVAydThkYUplMDlLMUNJUllHdStuVmxaOEVBSFJFTUZtd0Q3N3RV?=
 =?utf-8?B?aEpBaUd3dDYwV0VIZWlsbVJNUnVyV3E2RnBYNFdWdWE3cUVGcVlNbElJRWNv?=
 =?utf-8?B?cFpleDB0STU3UnhzQlFaK1I3azdnc3N4eUxVUVFWVTFGNXR5dC94N0dtaG1J?=
 =?utf-8?B?Ym1Pdk9yZ3dBbXNpeW1sTlhVcTBzbG8wdTYzd0xqZHZ4WmpzclNkUjlHUU1B?=
 =?utf-8?B?RjRnSGdOcmtZOGh0RU9xdkc3Rm9IRHFvaDB6d3l3SUR3V25MTWo5L1lBZ1d4?=
 =?utf-8?B?aGY1ejRlSVJGMnBTQUkxTmVGUExmRVhCa3BQcDRxeDA0ampPNUNTWDZNaHBq?=
 =?utf-8?B?ZFRMK3RhbEswY1dOd1dQa1Y1M0Z3K2t6Nm1iQ20raVJPRHBZMkFzY3VuWTVV?=
 =?utf-8?B?Qm9mWDE5MlVZKy9tVUN2alFsaDdZK3g1V2lsVkFNVS9Tc0VaVGdGUlAwVnB2?=
 =?utf-8?B?RHdodmFPSEtYcmdTOGJxTmFKYkp3SXNqTVJxSFdlMnRCRWh3UWVBRGxBMitN?=
 =?utf-8?B?WVVYUEpUallpRkZCWTg2SS8wNmV3aXcrWEk1MWMydGFuU3dsS05xZkdaQzNG?=
 =?utf-8?B?dW5PTFN4SDI5YXpFSGpLWlpCdWduVE43V1d4RzFPZllQWG1hdDdNbFhjS2ZI?=
 =?utf-8?B?d2NGcE1NeFdsU09vZjdsQWZxZGpjYlQxSlpqTGpnMmk4aytYREFxeUgyTnkr?=
 =?utf-8?B?dXhYWFhCcVRXSys2UnpBQ21maUQ0RzZ6bFRVY2Y4bWY1L1pGbHlWaGd4cG1x?=
 =?utf-8?B?bVd5L1RFam8waFBBOVBndUZ0UmYrU093UC9XbjdFZ1NIWUgrZ2k3SkNxelFE?=
 =?utf-8?B?RW0wYStXeTRyZXF2Z05UVTNOMDFGeGpqaWkxQkdkUWlubUVwUWdabUphRklQ?=
 =?utf-8?B?S2RwNWpZU3FMK2JRUm54ZnppMFBFSDBoNGFFRlZrY3B6WlErR29mTEpjVmN3?=
 =?utf-8?B?OHJ2bk8wS0dzcy9lTlhZaTFDL2JWbHBTZE9TeDRWVGJkdjcwUlEzYkFURDRt?=
 =?utf-8?B?TlE9PQ==?=
Content-ID: <76FA11DD79232C40AC503FC4DA790213@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10603798-1eb9-4038-4bde-08dd81637bf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 06:04:03.7281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07XVam8WbVfVoBs0z+BjBZV7aw3FxrGmEAaDgWJDw1h4ZBWvtN6LTvOrcN+hmbNLhXmDjL1x1sjF2bmkd1Xg/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7879
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_960309453.266570169"
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

--__=_Part_Boundary_004_960309453.266570169
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGb3IgdGhlIHNha2Ugb2YgaW5jcmVhc2luZyBodW1h
biByZWFkYWJpbGl0eSBhbmQgYXZvaWQgcG9zc2libGUNCj4gY29uZnVzaW9uIGJldHdlZW4gRFBJ
IGFuZCBEUF9JTlRGIG91dHB1dCBmb3JtYXRzIChhcyB0aGUgdHdvIGFyZQ0KPiBldmVyIHNvIHNs
aWdodGx5IGRpZmZlcmVudCksIHJlbmFtZSB0aGUgbXQ4MTk1X291dHB1dF9mbXRzIGFycmF5DQo+
IHRvIG10ODE5NV9kcF9pbnRmX291dHB1dF9mbXRzLg0KPiANCj4gVGhpcyBjb21taXQgYnJpbmdz
IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDYgKysrLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGluZGV4IDlkZTUzN2E3NzQ5My4uMGI3ZjkxZmI1MTlmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gQEAgLTExMDYsNyArMTEwNiw3
IEBAIHN0YXRpYyBjb25zdCB1MzIgbXQ4MTk1X2RwaV9vdXRwdXRfZm10c1tdID0gew0KPiAgICAg
ICAgIE1FRElBX0JVU19GTVRfWVVWMTBfMVgzMCwNCj4gIH07DQo+IA0KPiAtc3RhdGljIGNvbnN0
IHUzMiBtdDgxOTVfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gK3N0YXRpYyBjb25zdCB1MzIgbXQ4MTk1
X2RwX2ludGZfb3V0cHV0X2ZtdHNbXSA9IHsNCj4gICAgICAgICBNRURJQV9CVVNfRk1UX1JHQjg4
OF8xWDI0LA0KPiAgICAgICAgIE1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUsDQo+ICAgICAg
ICAgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRSwNCj4gQEAgLTEyNDgsOCArMTI0OCw4IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE5NV9kcGludGZfY29uZiA9IHsN
Cj4gICAgICAgICAuZHBpX2ZhY3RvciA9IGRwaV9mYWN0b3JfbXQ4MTk1X2RwX2ludGYsDQo+ICAg
ICAgICAgLm51bV9kcGlfZmFjdG9yID0gQVJSQVlfU0laRShkcGlfZmFjdG9yX210ODE5NV9kcF9p
bnRmKSwNCj4gICAgICAgICAubWF4X2Nsb2NrX2toeiA9IDYwMDAwMCwNCj4gLSAgICAgICAub3V0
cHV0X2ZtdHMgPSBtdDgxOTVfb3V0cHV0X2ZtdHMsDQo+IC0gICAgICAgLm51bV9vdXRwdXRfZm10
cyA9IEFSUkFZX1NJWkUobXQ4MTk1X291dHB1dF9mbXRzKSwNCj4gKyAgICAgICAub3V0cHV0X2Zt
dHMgPSBtdDgxOTVfZHBfaW50Zl9vdXRwdXRfZm10cywNCj4gKyAgICAgICAubnVtX291dHB1dF9m
bXRzID0gQVJSQVlfU0laRShtdDgxOTVfZHBfaW50Zl9vdXRwdXRfZm10cyksDQo+ICAgICAgICAg
LnBpeGVsc19wZXJfaXRlciA9IDQsDQo+ICAgICAgICAgLmRpbWVuc2lvbl9tYXNrID0gRFBJTlRG
X0hQV19NQVNLLA0KPiAgICAgICAgIC5odnNpemVfbWFzayA9IERQSU5URl9IU0laRV9NQVNLLA0K
PiAtLQ0KPiAyLjQ5LjANCj4gDQoNCg==

--__=_Part_Boundary_004_960309453.266570169
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDQtMDkmIzMyO2F0
JiMzMjsxNToxMyYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0ZvciYjMzI7dGhlJiMzMjtzYWtlJiMzMjtvZiYjMzI7aW5jcmVh
c2luZyYjMzI7aHVtYW4mIzMyO3JlYWRhYmlsaXR5JiMzMjthbmQmIzMyO2F2b2lkJiMzMjtwb3Nz
aWJsZQ0KJmd0OyYjMzI7Y29uZnVzaW9uJiMzMjtiZXR3ZWVuJiMzMjtEUEkmIzMyO2FuZCYjMzI7
RFBfSU5URiYjMzI7b3V0cHV0JiMzMjtmb3JtYXRzJiMzMjsoYXMmIzMyO3RoZSYjMzI7dHdvJiMz
MjthcmUNCiZndDsmIzMyO2V2ZXImIzMyO3NvJiMzMjtzbGlnaHRseSYjMzI7ZGlmZmVyZW50KSwm
IzMyO3JlbmFtZSYjMzI7dGhlJiMzMjttdDgxOTVfb3V0cHV0X2ZtdHMmIzMyO2FycmF5DQomZ3Q7
JiMzMjt0byYjMzI7bXQ4MTk1X2RwX2ludGZfb3V0cHV0X2ZtdHMuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1RoaXMmIzMyO2NvbW1pdCYjMzI7YnJpbmdzJiMzMjtubyYjMzI7ZnVuY3Rpb25hbCYjMzI7
Y2hhbmdlcy4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRp
YXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0Fu
Z2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7NiYjMzI7KysrLS0t
DQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjszJiMzMjtpbnNlcnRp
b25zKCspLCYjMzI7MyYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYm
IzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzlk
ZTUzN2E3NzQ5My4uMGI3ZjkxZmI1MTlmJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7QEAmIzMyOy0xMTA2LDcm
IzMyOysxMTA2LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjt1MzImIzMyO210ODE5
NV9kcGlfb3V0cHV0X2ZtdHNbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfWVVWMTBfMVgzMCwNCiZndDsm
IzMyOyYjMzI7fTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7LXN0YXRpYyYjMzI7Y29uc3QmIzMyO3Uz
MiYjMzI7bXQ4MTk1X291dHB1dF9mbXRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOytzdGF0aWMm
IzMyO2NvbnN0JiMzMjt1MzImIzMyO210ODE5NV9kcF9pbnRmX291dHB1dF9mbXRzW10mIzMyOz0m
IzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtN
RURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO01FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUsDQomZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUVESUFfQlVTX0ZNVF9S
R0I4ODhfMlgxMl9CRSwNCiZndDsmIzMyO0BAJiMzMjstMTI0OCw4JiMzMjsrMTI0OCw4JiMzMjtA
QCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO210
ODE5NV9kcGludGZfY29uZiYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kcGlfZmFjdG9yJiMzMjs9JiMzMjtkcGlfZmFjdG9yX210
ODE5NV9kcF9pbnRmLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOy5udW1fZHBpX2ZhY3RvciYjMzI7PSYjMzI7QVJSQVlfU0laRShkcGlfZmFjdG9yX210
ODE5NV9kcF9pbnRmKSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsubWF4X2Nsb2NrX2toeiYjMzI7PSYjMzI7NjAwMDAwLA0KJmd0OyYjMzI7LSYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Lm91dHB1dF9mbXRzJiMzMjs9JiMzMjttdDgx
OTVfb3V0cHV0X2ZtdHMsDQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsubnVtX291dHB1dF9mbXRzJiMzMjs9JiMzMjtBUlJBWV9TSVpFKG10ODE5NV9vdXRwdXRf
Zm10cyksDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsub3V0
cHV0X2ZtdHMmIzMyOz0mIzMyO210ODE5NV9kcF9pbnRmX291dHB1dF9mbXRzLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Lm51bV9vdXRwdXRfZm10cyYjMzI7
PSYjMzI7QVJSQVlfU0laRShtdDgxOTVfZHBfaW50Zl9vdXRwdXRfZm10cyksDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LnBpeGVsc19wZXJfaXRlciYj
MzI7PSYjMzI7NCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsuZGltZW5zaW9uX21hc2smIzMyOz0mIzMyO0RQSU5URl9IUFdfTUFTSywNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsuaHZzaXplX21hc2smIzMy
Oz0mIzMyO0RQSU5URl9IU0laRV9NQVNLLA0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDkuMA0K
Jmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0
IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRv
IGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1
c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9y
IGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkg
dW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0K
YmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_960309453.266570169--

