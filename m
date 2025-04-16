Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09242A8B0B5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C5110E842;
	Wed, 16 Apr 2025 06:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DP61/i8s";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="p2pB+77Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38A010E842
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:44:46 +0000 (UTC)
X-UUID: 45c5c5621a8e11f0aae1fd9735fae912-20250416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PrpGHnn8kQYLjEwLQRLM0+rh5wSDuKGdVsf9EHtnT7o=; 
 b=DP61/i8shBuR0HwjZFqKDWKbQtsVRQ/YNvS6bzk4IIKrsOFjYMipQd1ZILsRAszBDXsgUEsKVnSLeWWw0exdf78uRJgagrwi4neAosneZUFHq/AeUUl0hD5dYb5H4t2dCuh/jc02VVSwgM3qa7I9TdXqZJZ8/ZU8cX/4lvYY6BY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:8df87700-4b0c-4917-a539-2bce8610a19f, IP:0,
 UR
 L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:2
X-CID-META: VersionHash:0ef645f, CLOUDID:a530ab8d-f5b8-47d5-8cf3-b68fe7530c9a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:4|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 45c5c5621a8e11f0aae1fd9735fae912-20250416
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1601956332; Wed, 16 Apr 2025 14:44:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Apr 2025 14:44:40 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Apr 2025 14:44:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJomXxlPNCCkH9eGTalZATUEipSfuHT7asSVq+c/MYvkiM+EuSExhCgBuXHRqLsviqL0gQIJz+VRZqLXro3v7x8ack3MTAh4srGEkD5w1JWX4Ht3MGr12aSysDm3NlKWBYM+daBJXYRMx87sQYfk32VSf+1na6rBQvyiYcukKZJvT1mznjKouc9lQW5H2/i6Z6zhrDxFcfjDnnkfS+brQ0Fw2k6sgdDwKgCJkX0QlOesso/6FqmQrk5hs9xCXrYiTTSawKb+DB4taR3Un979m5maO4gB37jo08SpJTRplZ91So84tGa7Zx1Zq0sNrQvRj5lCbxLnxRpdg8L10FSHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDh4NSkBLDSZJ0fw2dly6F85e32KD/DhBJqs4VB4OqQ=;
 b=gW2b5rGxkKAd64I4hSqjhN4flfz0DVSFgR5JIU+XjqhSq2EwVZFdGSA7VSOD4Hs1OcChLaRDb9TOtYl7kN0uxZrh1aBQ5nVsl+2bGc/kix3LChbNbRIrgj7fAFvDJvYXLPcyy3mhsq6FJNz8CXcxOncfGFL5fdaOy28/xaP9j4HnIKyZKZ4D80fjLbvDtvgo4iqwQD7QZwtqFWYlPOrZtODrwdKMX1Hvu4Rvowl2FYGp0+CpU3iyOPPvRURp3pGKSu7d3NB7dUIQcRzC+WyRi7KXarFHlNh4fGgAYRMlybzc3xiTfvGgI0Z8mJv+SOdDD/F2N6fOb019VXcqrzX8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDh4NSkBLDSZJ0fw2dly6F85e32KD/DhBJqs4VB4OqQ=;
 b=p2pB+77ZESYEYEriXgqMTH1ksE3ENwc9gTABadouJ7c+2cX1li+4Jh8sIhYhwgzYztF1z+XJjrQwbdIBVvnuDh+WL9ewxmoPUs/eB6HjZBp7M0Zbdth7mk8NuoQHDBoifLAD1DHDFnbPDGhDYjbZwqFU8v1nb1DZW/TaY/OHm9Q=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by JH0PR03MB7879.apcprd03.prod.outlook.com (2603:1096:990:32::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Wed, 16 Apr
 2025 06:44:37 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 06:44:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v9 17/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v9 17/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbrfOCsrseSajKLkur/SW6kxvbcrOki+yAgAFONgA=
Date: Wed, 16 Apr 2025 06:44:37 +0000
Message-ID: <01872a8318e2c87b124631822785d3ea494030f0.camel@mediatek.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
 <20250415104321.51149-18-angelogioacchino.delregno@collabora.com>
 <bc094a07-2a4c-4048-8c15-b096db62f142@collabora.com>
In-Reply-To: <bc094a07-2a4c-4048-8c15-b096db62f142@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|JH0PR03MB7879:EE_
x-ms-office365-filtering-correlation-id: 668d1688-7d52-4f58-ebab-08dd7cb227dc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZU9WdGJwNGFLTndlWUQvY1cwYlVZNmRuY3RpOFJFcHY3dXVXRDJNS21xM3Z2?=
 =?utf-8?B?bSt2TFROZ1kveEtLVDg1K0NGYXV2aDUzTE9uVDgyYjRKL054MjI0b2luck9v?=
 =?utf-8?B?dWtub3JBTmg2RTh1MDRjWm1UQVFxSnF6Yk9Kc0tSbS9LUkhabTRJVklxMlZy?=
 =?utf-8?B?NGIrU3p6NWVHT29vZmVYVXpCSUVCT1dwOTByenRkbHNQaGJhUmtxOFFLYndX?=
 =?utf-8?B?S0YzMnd2dzZ6NmNLV0x1ZnZDRml1ZmpMaFRFcGYrSnRhOWo5UUt0NllycU9M?=
 =?utf-8?B?RXIwaVRka2xvaHF0Y05PekpEZndnRnlFRm8zQmlBQ2NlbGp4blBjWVFxQnRx?=
 =?utf-8?B?VFUxMUxPZy9odVhFZlIzbXc3bUlmdFlzczQ2TWlYNjNKUkxNN3ZlK201ZFNh?=
 =?utf-8?B?UVpKNUlZNHE0alF3NFdBZ2lvcFE2THZtTDdEVkhXbEZKQWdkYXpLcGVmOVZV?=
 =?utf-8?B?dDZUQW9HdnZYeHpUVUpDMGs2V0FpbFFxM0dQbVBrLzNiUHoydFZLVW8zZ1Zr?=
 =?utf-8?B?WVExYjVDWGx3VXBzTlNzOEVwaS81bkVNWml5VmJ5VDdDZzNRNEsrM1VpVnY0?=
 =?utf-8?B?STFIT01aOFV5a2QvZXo0Ujd2QXNLTUZtYzJsUm5zMlZDNXBTVnlJdEVYcEg1?=
 =?utf-8?B?ZmNpc2F5UXp3ZkxnQ0lpSUhEb1l4eE5NN0ZkMDlveEhBcjl2clFvenRvWHA1?=
 =?utf-8?B?SS9DajNsVTRDd2JxUzVJSWhHbmdGeE9CcFFieEJXVWNzV2dpSmhlTVk0dVgw?=
 =?utf-8?B?TzZadWx3cTAwODhuRVE3VlQ3b2dSUjhSWHB5NTdNNHR1KzVic1hBRk9lcU82?=
 =?utf-8?B?Snk3ek1EL1MvaS9EeTV5NUN6MFM2clhYR0l2dHJSSzB4V3RrdXh3eVgzUFVJ?=
 =?utf-8?B?RTJhZ2x3N0x0RTJkSmdBd1U5akMwb0JvRlpmWXJPaGd5Z2ZwM3lJQ25MeVpy?=
 =?utf-8?B?c1h4WDd4ZFUvbmpoUEhrQlZLdXFIbkZIeWY2MTV4V2JNTEpDdlVRZVpzZnVr?=
 =?utf-8?B?L2EzRVhBQzBvMFlDRG9udThhQjdqZm83c3B5QVFiMW4zYnhhNEZlTTg5d21J?=
 =?utf-8?B?YVl2RjVNYzl5V2ZyYjNWUDMxdHVUeU05d2d3SzdxSmhSMFpIejhPaUF5MlhB?=
 =?utf-8?B?WWQxa1ZCNGF0TnNDQzBTaHo4RWZjS0VMWGV5RTZnTmpFdHp1MDhXOHVacEZ5?=
 =?utf-8?B?cjVjRTFhTStRNVgzQStaWVgzTTY3YU5iaGdGWnJGMDZYTDVnRlVDbXdRRmp1?=
 =?utf-8?B?TDFhK3BCcUtDMmwyMUw2OXBKMXM5WUVySFRHOXBOR2NGR2RGYldPb0hoNWps?=
 =?utf-8?B?eE16UHNvWXRJeTFCU2lMU3ZUd3VaRTg4dUw0R1NsV2ZjRTUwZTVWNGJNSEVp?=
 =?utf-8?B?UUFmNzZkb2N1ZXlqLzduMVU4ekRuZklaRTlFSHByYk9IZjh3OUFVMGxCOEw0?=
 =?utf-8?B?RnRUc1U3TTZzTWNoVGdXQVZoM3I3WnVOUkJsZG8waTg4NjAwSHhSaXFMZjdu?=
 =?utf-8?B?TFlnQjA4VDJqTmZFTndkcGpZaUJvWnFRRWo2d2Nqb1p6QjdZRjFTOHJhUUJH?=
 =?utf-8?B?OE50OG9aYUttSGMzQ1ZGbE1JaFF5U1ptcWRITTZOYjFKVFIybWZTWWFxQzJk?=
 =?utf-8?B?cytuRE14Qkl5ZWtxT3dZbUxrcGpFQnhjdC9zYmp1V2VCdUpWMGMxTUNQNVhn?=
 =?utf-8?B?K2NGcHZDV1dhQ0p2OE1ybFFBdThkQldFK3MrcUNOYkYxN3RneXc3elNNTXNR?=
 =?utf-8?B?WkVhNm5wbWVqeFRia1lKcEt6VDlyWWhpeHJVNkpnWThKY2k1OUVzblZ6QzBa?=
 =?utf-8?B?SkdZcWJyTmNSNTlYWENldG1DYk0wY2VoSDhxdGpWNTFLMEJCa29kTkgwYklJ?=
 =?utf-8?B?bGttUFU1M0kzVWJtRFFNUzV5dld0d3ZsTmpOQWR1REhEMzQxTlZHL0VlWVZq?=
 =?utf-8?B?cUV4Y2pBUStWTVJMK2VuUzFUVXU2TW9SWWlkbE1oZmVhS2NDNlBicHczamhh?=
 =?utf-8?B?RDFzK011dDVBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wnhhd1RTRWYxZzJiYXZId012aFlKeS9EMHY5SkFIanYwbFo5eUQzbm81cXV0?=
 =?utf-8?B?T2Zja3cwMDdvUkhYaDlGUVVOb0FqNUJyWVJjNERhc293TVpOcWxVMXBQUjFq?=
 =?utf-8?B?d0hwaFZ4MWlNS2ZZNGNNZEhJOGRpZ3N3a0x3TzZ4TzZoMm4ybi9zbTJtS0E0?=
 =?utf-8?B?dU9oRGhuUjIrNEdKR1g0U2IrbmdnOGU3b1NMbmhmZmJ3aFYyLy9WS0VlT1By?=
 =?utf-8?B?emlsdE1CSjE5VDd5bGdadWlCVldDbGNrNStwd2NoTlJLS0t0Z1YxSHJRdjVV?=
 =?utf-8?B?R3JjSm1mMkNuTDgrcjhja1VXVDgwTzhGcFR2UFZpVXVzdTNlMEZSRlZiQ3Nt?=
 =?utf-8?B?L2FEb0FTVHpqUGl0OG1rUksvd1FjY25VVk55UEIwNUJqMVdMMXZiUVFzeVF3?=
 =?utf-8?B?cnRMY1Nma2RMRGQ1OXhOR3pPNlJUUG4wT1VuM05wQVE2Q1pkT04vTUU3dWRE?=
 =?utf-8?B?N045ZXJGYjUxS2NCSnVZL2p3eVlWNkpQK0lrZHhKUVNzRU16YkVtQmowQ0NU?=
 =?utf-8?B?YlZTckNWMDQvUC9qcDlZUFlZemJoWldSNDlPaVpSM0pQRXhqUTlHTnRCMjhy?=
 =?utf-8?B?SWtyZ2JEdmoyT2RsQjY3ZWJSenAxWVYxWkwvZWxBREVYSGM3YU5SRFkwL0c2?=
 =?utf-8?B?SGYvdU9jVHNid3dQRUVsRmNQUjVMZUE1UHM4RXFXN3N3bnBiVnYrQ1lxWDlM?=
 =?utf-8?B?WWVadDJJdmRrckMzSlY2QUxyRUQ5MDgyclpXUXZ5V2NqVG5uc0tUdGttMDdK?=
 =?utf-8?B?eTR4ZU5oWEROcU5tbjVXMkVMZUovc1MzeFJielBOQjZVY09iRW5tOU9FRHUx?=
 =?utf-8?B?QlQyUElDK1piTEthOXdJZll1QUxibThESHcydnZwaXc0T01rNGZQZkNWUE91?=
 =?utf-8?B?dHFteWVSYklPZmdqNWRGRWVZcTFkMnc5R3Nkd0FjeUlaZk9Ib1RDVGhqWmx4?=
 =?utf-8?B?VlhqZmx6b21ETjRYV2RDTUxmc2MzVDhFUVhIQ01XdmdReFE3YTRxWkIvVlNp?=
 =?utf-8?B?dUh2T1QrcW0zS3dKVnZYcTEzWGZKK0dPdy9ZdXVwYlRzYzA1YnpqMk9YZmhz?=
 =?utf-8?B?M2ZVYWZNZ1ltOVNTN2JmK0xWSDkrMkFkdnNQT0JFZW53WHBjak8yRVF5UXJO?=
 =?utf-8?B?bUlqdDlTSHRFUkh6T3h6UnlIeXRIRFE4T2J1K1czRWZPcWFCV3FKeGRmMGEw?=
 =?utf-8?B?bU42UlhRdFp6by8valNObWZCdUNCNUZiTTJyWk9IZEpERU9QT1JkRVB3N1Vo?=
 =?utf-8?B?MUlBRzVZL0RpdndtUWY1NUkrK1hmRVdHYnltL1dCN005blpyVTNCbFBWYjNk?=
 =?utf-8?B?dDIyMzhtK0MzeTloVTNvRWNVUWlCT0xIK0RMbnRVU3dBYmt5a1J3ZUNNL0x4?=
 =?utf-8?B?M0VDRHVxNzhDRnZZc0FDUWc3amlLSkw4VVNwRXBibTN2c2cwZjBERlljdTFh?=
 =?utf-8?B?S1FaT3NoaEJCQXFjUkNNSWVtWTFDNlM3aVFUclVxbnFqK3JtYkgxVFBWVFJy?=
 =?utf-8?B?cjRYUTNIVHRtQ1lZWklJZ2xXQ2dSTzNkSHcycXRhT2pjRExiYkd4VXZDVGUx?=
 =?utf-8?B?RnlNM2srZFVRQ3dqNkFLdWFSOVNqdXI5cTc5UGFJbXJZYmtoSHgzczErQWFL?=
 =?utf-8?B?VFh3TXpWSWdCRXFxMnJmbkNaR21Nd3pCUzRWV1pkYk9FLzF2Q0ZSUExGS1Qy?=
 =?utf-8?B?aFZ5WFAvKzJCV0xBVWxSQ25aQWkwYWRRaFBKK200SjR6MWZpVDMrL0tiQjdK?=
 =?utf-8?B?VmgzNWNlcTBab1JhRTR0QXE4d3hSMFZnNWJRSXZ4blNnWUFzdTlDYU5LRDRk?=
 =?utf-8?B?V3RWTUk1K3BWeURZWlgyb0JBbHdpNThoaUxFTHN5M08xZjZsTEZjU2c2U1ZG?=
 =?utf-8?B?WlRFZUpiSi84dTdoYXR1UHdRSExJR2U2amxISyswM3crWW5jNG15YkpOOWta?=
 =?utf-8?B?dzI0bVNYUGdhTVgxNCtlOEYraFFCZ2pSYW1jVkpEM1ZXVGZWbDFDNVFBZGpW?=
 =?utf-8?B?T2VqV3d6bWk2eE1HQ1gyb3JGRlVIRmdKTVBJc0hhZHFWa2dqRWZFZ3QwWUhQ?=
 =?utf-8?B?TkxJRFhxSERNVkYvWGhaVEZkT0h2cTVPcUFtdFQ2UlhiN0UxeFhtUitXUmF4?=
 =?utf-8?Q?+FlSqrylR0X6noqJdB3OedZBB?=
Content-ID: <0C10BC0E4E1FF948B43E60DBCB1AA84C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668d1688-7d52-4f58-ebab-08dd7cb227dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:44:37.0962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPmcElpTY9CfxpnWagKYMxuPsJMHq+5wZvyzOw7Be/9kCt/x8extZbtBAtuBp5+ix5EWEH7UnlyZVAbRnfkSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7879
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1196397801.456945613"
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

--__=_Part_Boundary_009_1196397801.456945613
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTA0LTE1IGF0IDEyOjQ4ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxNS8wNC8yNSAxMjo0MywgQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gaGEgc2NyaXR0bzoNCj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5n
IGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+ID4gc3BsaXQgb3V0IHRoZSBm
dW5jdGlvbnMgdGhhdCB3aWxsIGJlIGNvbW1vbiBiZXR3ZWVuIHRoZSBhbHJlYWR5DQo+ID4gcHJl
c2VudCBtdGtfaGRtaSAodjEpIGRyaXZlciBhbmQgdGhlIG5ldyBvbmUuDQo+ID4gDQo+ID4gU2lu
Y2UgdGhlIHByb2JlIGZsb3cgZm9yIGJvdGggZHJpdmVycyBpcyA5MCUgc2ltaWxhciwgYWRkIGEg
Y29tbW9uDQo+ID4gcHJvYmUgZnVuY3Rpb24gdGhhdCB3aWxsIGJlIGNhbGxlZCBmcm9tIGVhY2gg
ZHJpdmVyJ3MgLnByb2JlKCkNCj4gPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1
cGxpY2F0aW9uLg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgfCAgIDExICstDQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgfCAgICAxICsNCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICB8ICA1MzggKy0tLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYy5vcmlnICAgfCAxNzY5
ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWlfY29tbW9uLmMgfCAgNDIyICsrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWlfY29tbW9uLmggfCAgMTg4ICsrKw0KPiA+ICAgNiBmaWxlcyBjaGFuZ2VkLCAy
Mzk4IGluc2VydGlvbnMoKyksIDUzMSBkZWxldGlvbnMoLSkNCj4gPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYy5vcmlnDQo+IA0KPiBDSywg
SSBqdXN0IGFja25vd2xlZGdlZCB0aGF0IGEgLm9yaWcgZmlsZSBzbGlwcGVkIHRocm91Z2ggYW5k
IGdvdCBzZW50IG91dCB3aXRoDQo+IHRoaXMgcGF0Y2guLi4uDQo+IA0KPiBUcnVseSBzb3JyeSBm
b3IgdGhhdCwgY2FuIHlvdSBwbGVhc2UgZml4IHRoYXQgdXAgd2hpbGUgYXBwbHlpbmcgd2l0aG91
dCBoYXZpbmcgbWUNCj4gc2VuZCBhbm90aGVyIHBhdGNoYm9tYj8NCg0KSSB3b3VsZCBkcm9wIG10
a19oZG1pLmMub3JpZyB3aGVuIGFwcGx5IHRoaXMgcGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQo+
IA0KPiBNYW55IHRoYW5rcywNCj4gQW5nZWxvDQo+IA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiA+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaA0K
PiA+IA0KDQo=

--__=_Part_Boundary_009_1196397801.456945613
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDQtMTUmIzMyO2F0
JiMzMjsxMjo0OCYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjsxNS8wNC8yNSYjMzI7MTI6NDMsJiMzMjtBbmdlbG9H
aW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMy
OyZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9yJiMzMjthZGRpbmcmIzMyO2EmIzMy
O25ldyYjMzI7ZHJpdmVyJiMzMjtmb3ImIzMyO3RoZSYjMzI7SERNSSYjMzI7VFgmIzMyO3YyJiMz
MjtJUCwNCiZndDsmIzMyOyZndDsmIzMyO3NwbGl0JiMzMjtvdXQmIzMyO3RoZSYjMzI7ZnVuY3Rp
b25zJiMzMjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y29tbW9uJiMzMjtiZXR3ZWVuJiMzMjt0
aGUmIzMyO2FscmVhZHkNCiZndDsmIzMyOyZndDsmIzMyO3ByZXNlbnQmIzMyO210a19oZG1pJiMz
MjsodjEpJiMzMjtkcml2ZXImIzMyO2FuZCYjMzI7dGhlJiMzMjtuZXcmIzMyO29uZS4NCiZndDsm
IzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2luY2UmIzMyO3RoZSYjMzI7cHJvYmUm
IzMyO2Zsb3cmIzMyO2ZvciYjMzI7Ym90aCYjMzI7ZHJpdmVycyYjMzI7aXMmIzMyOzkwJSYjMzI7
c2ltaWxhciwmIzMyO2FkZCYjMzI7YSYjMzI7Y29tbW9uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwcm9i
ZSYjMzI7ZnVuY3Rpb24mIzMyO3RoYXQmIzMyO3dpbGwmIzMyO2JlJiMzMjtjYWxsZWQmIzMyO2Zy
b20mIzMyO2VhY2gmIzMyO2RyaXZlciYjMzk7cyYjMzI7LnByb2JlKCkNCiZndDsmIzMyOyZndDsm
IzMyO2NhbGxiYWNrLCYjMzI7YXZvaWRpbmcmIzMyO2xvdHMmIzMyO29mJiMzMjtjb2RlJiMzMjtk
dXBsaWNhdGlvbi4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7UmV2aWV3
ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVs
JiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bSZndDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYjMzI7JiMzMjsxMSYjMzI7Ky0N
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFr
ZWZpbGUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wm
IzMyOyYjMzI7JiMzMjsmIzMyOzEmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOzUzOCYjMzI7Ky0tLS0tDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMub3JpZyYj
MzI7JiMzMjsmIzMyO3wmIzMyOzE3NjkmIzMyOysrKysrKysrKysrKysrKysrKysrDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2Nv
bW1vbi5jJiMzMjt8JiMzMjsmIzMyOzQyMiYjMzI7KysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgmIzMyO3wm
IzMyOyYjMzI7MTg4JiMzMjsrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjs2JiMzMjtm
aWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzIzOTgmIzMyO2luc2VydGlvbnMoKyksJiMzMjs1MzEmIzMy
O2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO2NyZWF0ZSYjMzI7bW9k
ZSYjMzI7MTAwNjQ0JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYy5vcmln
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NLLCYjMzI7SSYjMzI7anVzdCYjMzI7YWNrbm93bGVkZ2Vk
JiMzMjt0aGF0JiMzMjthJiMzMjsub3JpZyYjMzI7ZmlsZSYjMzI7c2xpcHBlZCYjMzI7dGhyb3Vn
aCYjMzI7YW5kJiMzMjtnb3QmIzMyO3NlbnQmIzMyO291dCYjMzI7d2l0aA0KJmd0OyYjMzI7dGhp
cyYjMzI7cGF0Y2guLi4uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RydWx5JiMzMjtzb3JyeSYjMzI7
Zm9yJiMzMjt0aGF0LCYjMzI7Y2FuJiMzMjt5b3UmIzMyO3BsZWFzZSYjMzI7Zml4JiMzMjt0aGF0
JiMzMjt1cCYjMzI7d2hpbGUmIzMyO2FwcGx5aW5nJiMzMjt3aXRob3V0JiMzMjtoYXZpbmcmIzMy
O21lDQomZ3Q7JiMzMjtzZW5kJiMzMjthbm90aGVyJiMzMjtwYXRjaGJvbWImIzYzOw0KDQpJJiMz
Mjt3b3VsZCYjMzI7ZHJvcCYjMzI7bXRrX2hkbWkuYy5vcmlnJiMzMjt3aGVuJiMzMjthcHBseSYj
MzI7dGhpcyYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O01hbnkmIzMyO3RoYW5rcywNCiZndDsmIzMyO0FuZ2Vsbw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmIzMyOyYjMzI7Y3JlYXRlJiMzMjttb2RlJiMzMjsxMDA2NDQmIzMyO2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsmIzMyO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgNCiZndDsmIzMyOyZndDsmIzMyOw0KDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1196397801.456945613--

