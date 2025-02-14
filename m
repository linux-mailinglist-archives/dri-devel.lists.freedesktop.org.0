Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF8A3560A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 06:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8C910E46D;
	Fri, 14 Feb 2025 05:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Qw66Y55/";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hpW35oDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3797F10E210
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:10:47 +0000 (UTC)
X-UUID: 09aa2feaea9211efb8f9918b5fc74e19-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CnA3GCNlKmgpunje6vUAk10cc2R95fkEwXInRUSf1HY=; 
 b=Qw66Y55/UR0wrD4ptogIPtKm+Nx97X0BaIgSldtjnpZugUXOAOVVlsTAHqrVpel8kIbnPMv7NdI+URNhXnf7MpoOhqzOxzS+tCV+PCiVoCayadiJDl0y3apenlch2n8frwD91LuO2N78kMm53ZKh7oOgEIlDju6G5nTfyxkrSTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:3abd2a14-e191-4e76-af60-f918da1dc328, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:749774a1-97df-4c26-9c83-d31de0c9db26,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 09aa2feaea9211efb8f9918b5fc74e19-20250214
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1841719350; Fri, 14 Feb 2025 13:10:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:10:40 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:10:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CF2hdGb7eYkzUwTe39e4PHks5Kk9ECsZCO+cn9llmy8Ft0W5aGP5UrcFEGDemGZaR7FFx+2dtYr7qvdN3kv69u66Z4RFUnmleFiIGlpCm100BrRWEMXynQ2TWvfC7lYOK+92LZNeeQjZBV7JgQ9H74c7ZiUaW3KpORSSMURR/5jqReMKIgOIzRQ1eWoMwuHd6M+sWtPqwlc1txkBMJqPyxjODSHON/zGPnInwLU1Wo/Tx3TJnbcz8/US6RzIBUo80Q+rYRMItHeiIX0P5w8sdW3Te/Mf27/uxbDJNACJHIXvlXzcXZ9BnzFs0H0f279NYQmP/QF/mAFRAYXfX7GLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP8ITwN65OsXYmQDQ9posBOLXD9/rUvaj/spSNNNQgc=;
 b=bdjyHAke7BgFYAw6X5Zx8jD6JWih7Y34qL3/O4/bjLCiAReLJs+VJptxTnoWdiAO3WP3i/hh8Q0B65SbXm2hAS/xf6The5oNvu+CPpyOGUGLdzb7xkOlb7VzzJCcj8IRnCSTMtY1NOKucljBefaM8bbEkv3irYTwyD7Q58tuXztf99sgwSI5wHxOMuzeil8ciozUSgCYunjXSJCwnSTuC2mqcrlL4ZvXHNklbdgApqud4iLgzlaRJtPOT1AIhCj0Nw/YtY0W92yZwiZgg3M7cFNkkoJNHfKgSutyMO+F/u1rS2dVPgLx/78GVm2LKo5fxxRA+lkfDKmp/w9BsBUY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP8ITwN65OsXYmQDQ9posBOLXD9/rUvaj/spSNNNQgc=;
 b=hpW35oDWLT4EYIWYmkN7gRrfu9tiubO23MqDr7eE/YdVva3Wqkr1Y+sn7kSrSsLN/SHO86gMc+OA9dJto5b+Y+ZH2WBs9gF9L9/n8WRvC+HFmttN5GOI0mcx/NPS0ZnSc+3isYf6v71saLmvNAckS2cUikOuFW5k7u1p0xytoe4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7901.apcprd03.prod.outlook.com (2603:1096:820:f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 05:10:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 05:10:37 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 37/42] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Topic: [PATCH v6 37/42] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Index: AQHbfHk038p6zcjPCUqdeoNCelyMUbNE+AiAgAAVwoCAATbTAA==
Date: Fri, 14 Feb 2025 05:10:37 +0000
Message-ID: <d42cda0ea5d6ee496cc42b81cc82a6a5e1ba444f.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-38-angelogioacchino.delregno@collabora.com>
 <4ff6d01a040b37d4f581ea3808db4851e555a4fe.camel@mediatek.com>
 <1eff72da-c88f-46bc-aa0a-4e7615184202@collabora.com>
In-Reply-To: <1eff72da-c88f-46bc-aa0a-4e7615184202@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7901:EE_
x-ms-office365-filtering-correlation-id: 464eef95-4627-42ae-236e-08dd4cb5eb0f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z040WHA2NDlxTHVBc0QvUWp2WFpoYisyQzFVS1VRcUtETjhxeEdqVWFFWSs5?=
 =?utf-8?B?Y29DSVN0aTRKQmQ4NW1Ha3R4MWdDdHNZa0M1L2pOcHlqY2g3VVBOMlVQNE9r?=
 =?utf-8?B?RmR0SDNiWjFUajgwcXlTVktvZ1ROYlR1UFVPUUVVeVBKRTRJZHNaTXlrSENW?=
 =?utf-8?B?d0JDKzJWM29HOUg5UHN4akpOK3EvOVdudDgvaXFOSW53RmNTMEJZOHhaZ3B5?=
 =?utf-8?B?aEhqVlNqYWJGQ2lpSk9JNlpCdXdVTm1KODhwaDJoQy9QUFpaOUhmM0J5VHpY?=
 =?utf-8?B?WGtFRjZXVmNpeGdhRGtPUzFYQUNJQnZUa09haVpPenF1VU5EbXJEdjFYZmlv?=
 =?utf-8?B?Q1J6dHhVL1dHMzVuQ2ZISHNpV3VLMmdvZlRUYnpUdU8veDlyempMUkZoYzJW?=
 =?utf-8?B?dlhxSkFCcUUzRjUyKy8xV242UWtmTWliVVVnampWWjBETGgwMUhuQ0RTRVJG?=
 =?utf-8?B?QVFTVFJrK295aXhvSHVoVWk5MTBjTDd4ZnBqWHI0YkF2Q1NVK0hwWmNVaTN4?=
 =?utf-8?B?WlcrdHAvSytKRjhsOUJEV21HbHFSam1CWTZtam5IUDRyUGZqNXRLWUc5Vk1i?=
 =?utf-8?B?bmU2NiswNFBuK1BlRWpjMWtmak1QSEJBZXdFeHRHSDc2WHczbmhUTFRYTU5p?=
 =?utf-8?B?YUJ5SkhrL3B4QWRPM1FiR0p2eEt3YTZKeTRrbndMT1FGT3cwNVNoa3JndDJC?=
 =?utf-8?B?MlBtdzFPWWtsTndyeGZKci9zSkZUd1VQL3VsTWN5dnNOYWdlZlJUVHdUdnRK?=
 =?utf-8?B?VHVSR29peWsvNDBzajVMK00vYkVEZlpzYWo5NGlLc3VqOGRNcFRiRno3UFps?=
 =?utf-8?B?bk56V3RRZFl2S0Z1YU8rUmlxaHZiMWFGZ1BPZmlaSi83cFgyQk9qdE93Ujdz?=
 =?utf-8?B?dUZoZG9wdTZYSzM3QTQzM244YWhFbE1oNWpwK28weC92bFdzblJEdG5YdjhG?=
 =?utf-8?B?VTVuUFdtSys3RUJ6enpuN3VtTEx5YW55TXRsMzJJUkpWcDZNaUFmZlMveUtL?=
 =?utf-8?B?THlOWnpGKzRrWThYaTlGQWgyOWpuYkxwRis1LzlQY2k4UnZGbUhFamx2NnBK?=
 =?utf-8?B?Z0RFT25kTFRxOFBzY1B0YVNGeTJ6RmM4V05PbFZBMHdQd1lvTGcyOXFCTlZs?=
 =?utf-8?B?eXRlbkk3U0hYWWZ1aDVJOHVJUTl3VjVkbC83dDdCVTVwU2I4VDVFYVN0enBL?=
 =?utf-8?B?RmRzT3I2NGN3ekpmZ3VPSEdEUUVLNitiU0lDc2ZkQnZHczVzcnlMd2d6R2dr?=
 =?utf-8?B?dEtuOXE1eW5BaU9zMWhRdFJZb29BUXZkZHJ0VWpJNW1tTTYrUW9oNVdmTGN6?=
 =?utf-8?B?aFJsMGlxSm1JSGZHREF0SFFEcmF3K1lBcWFtVHVqR201VERDZ0R0SHpZYWZ5?=
 =?utf-8?B?cDN6THRwM28rRlFWSC9MdGtkc21NY0tuVzZ0MEJkQTlWeFVnd0pEYWpjZXVT?=
 =?utf-8?B?MndjUmM1QTg0Y2R3TTRyMllJZ3hydTZVa05IZGdySXczT2loaEl0RjFiYzNs?=
 =?utf-8?B?d0RvS1BHWTkxQ0M2djhJQW1OMkVRYnBRdjFPTjRzT1d3cXc4M1JzRUwxV1lU?=
 =?utf-8?B?aVpXSjB2VjZDV2FiMktZQlBlUHBaeTIrNU9nQzg3RkRJbHFVSTBxOGtkejdD?=
 =?utf-8?B?bE9ZaTZWVm5WNm5pbHFMUkU5R2k4cE54NXNJMlRFcm1JNlB6eTNLY01YR2dt?=
 =?utf-8?B?SS9KRDNzUU9GanhZOThrbnl0bUlKajlwbVlqS09DYU5vYi9pbHhqWlpjVUZP?=
 =?utf-8?B?bzUwV0hLNjZXWGFXWEhVWXVhbXViRTVDMm1DRUprQXduSE1UMm5vTGh1bTJL?=
 =?utf-8?B?TUdMdlhZOVRlUCtIZjdhc0pOZklwclRLWkVaUXZPZ0FIS0N0UHVyaktGYjNI?=
 =?utf-8?B?bm5rakN6UFg0SXgyVDlSbTIxYXNsd1VMVzIraVhxMHRiL2MwaXAySWJFenpx?=
 =?utf-8?Q?vePJkTlTAXUKSNAsrtiNmGWOGXruvha8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVZmd1pISXJyUEhBcGlWU3pIUjVXenRCcVhyMFQxNktNVUNERGZsNGxna2I5?=
 =?utf-8?B?VTlTSzUyb2g0c0dNdlBYcEowdiswVmFkU1ZUSnBtWWVVMXFPSE9hRlhMaElo?=
 =?utf-8?B?anlTTWtKa2FDQ3Qvc3RqdDdFZzRQcnpCTCtrYmZhbmlQdUxSTC9Cdzh0NGl2?=
 =?utf-8?B?bE5OTndGRVRJKzlXWnVzUlVjVHpkQXBzd25CRU1FYzZBWnRodzcwMktYTzFV?=
 =?utf-8?B?L3dvaWdRYkpubEMweC96WDFMOURWY2ZZWmE3UGQvVnFHeW8xeTNWMThLZDht?=
 =?utf-8?B?Mkx4bXJJQlhnVXpzUWdRUE01ejVMU1ZibGFBL0NWRlRsTEVhaHZvZzNtcjJ5?=
 =?utf-8?B?VFBkWDlBeitwVndoZ0RMZ0tiLzlSWmVMcjMvNUdHR0E3WG9NYUNCUDgrSG9G?=
 =?utf-8?B?dldUZUtQSzFNRWM4MTFmMTN2bHJOYmtRTDZidGdPYXpCMjU4M0I4bGJNbzd0?=
 =?utf-8?B?NHI4U3U1bFJOWUxTczhuaFg2NmN0M25aYkdEbERuN1JlKzZCTHRaOTd4NFky?=
 =?utf-8?B?L3lPeEFaTHhNZnBqOHowQk1TSnpnNFE3NURYMEMwbzNzSjA5NEY2WWFPSVd5?=
 =?utf-8?B?Q0NpTnYxeVNLeDFhUnUwS3RjZTdPVm1ibUo3Q0RBdERXMWY2RW9TUU1iYXE3?=
 =?utf-8?B?QkxQbVRVTzFwaGhDZllHTFQwaWhOSWRlSHhIQVdLWW1WbmNhWlZ1RFlRWVNC?=
 =?utf-8?B?UnNlenMrUTZaVEp2dDIvaC9xcENXZTFvVHhYQ2dJb0NwY3lpUG0wK0VWWFBp?=
 =?utf-8?B?cm8rb1o1dngvQ2ZyN1NTcTNUb2ZIblJFOXdMRlRZaXNkTFNxVzhoeVhjVWlr?=
 =?utf-8?B?Y2VLeUpxaFM1d2RzWkx0MnFncXVEZ3JzdDR6aTlvbDM5eHFqeG5DQThWTFZU?=
 =?utf-8?B?MXRmTnkyQnYvdXcyeWpLelk3UCttM3d3SnVpNS8wUTlVRW9LSm1XUGtXWE80?=
 =?utf-8?B?SElTT3NTRlhjdmlhbjRDa1JvS3lab3dWc3FhZElKZlpKaHVWVEdNRGhmczhi?=
 =?utf-8?B?R2R6Z21Fa3dTL3lQUWhtN0ZuZnRpVE04WCtRL1d4aDQ0RW1HVzZQWTZGUUZC?=
 =?utf-8?B?OGVieVRPN2d0cWxQTlo4K056SnlsVDJGSFAwY0ErYTdoWnBwc3Z2RWtsVXNh?=
 =?utf-8?B?MzB4MHdVckxGQmFWakQ2OE1nb3dpQTdJblRDemQ2NkE5TWc5VGh4dGpaSlpC?=
 =?utf-8?B?SERnN2NwS0djSjU3dzcvOHFONnpPdzRjT0QyVytwOU9SRGNGZEZqTFE4OWhL?=
 =?utf-8?B?MXUzWXZSMS9pS2prbFpiWk5BQU0wU2R2dWU1Y3h2cFlubk1Fa1N2VkVoWTZW?=
 =?utf-8?B?TjZmTC9nNWRYTWhwWWs4WFp1WFZPU2dSa1RaOXErVnRxcmNuUHBuZ1BlejZ5?=
 =?utf-8?B?a1VsSzJiWlRDU3NOUHo4a0R0SVFaalYvR1ZyTFZlUTlxRlZBbFZYUUswNzU3?=
 =?utf-8?B?WC9TMVQrUkxtVFNMZXNYMnpwSUJKdFZ0cTU5Vks3QzZrVVNhM1p0UzViMmVk?=
 =?utf-8?B?YjNwV1ZCUXdtOUNtUVhSemlJSzFnVmFxMERSS2wxcnAxM25hV2Y2dWxXOTdm?=
 =?utf-8?B?NklXR3JhRnU4MS81cTdZbXUyMFF5amM3VHZxYURjQjhJdlZuTG5TTWoycVNJ?=
 =?utf-8?B?c2p5WkFxTWR0WmkxcmFodEFGcUZua1VPNk5NdnQreVp2QklrRnR5VDgrUEpZ?=
 =?utf-8?B?aytONGVqMXJTdEZVMTQ1dFU1TTlGM1N6M1JtZmRZRVFFUTZRSkVSUzFwTSt1?=
 =?utf-8?B?Y3k1YkMzUXNkLzJpc0dEdUpMMHozanVhcmVZQ0JYaUJGSW5mV0RkRWUwWVNO?=
 =?utf-8?B?WkZIZ3Q3OWo3bDIxeld4VzlJaDhhK0hhNTNWaExHeXZQK0xCTmk5REI0TUtO?=
 =?utf-8?B?RDZRVEp5ajZOYTgwN1QxRU9BdDFXbzBIV3VqSXJFYk5rUENQK1pJTVhweEdm?=
 =?utf-8?B?N0JKYU1SOE9vM09Kc0gxcDRsZlQwWWVabllxTk43WmZFMFF0L0FzV1pwL0E1?=
 =?utf-8?B?SFRzaldBMXBybjdTNUNoL3A4c2s5YWN2YTk4enF5US95OUptTGlyaGVzaEd1?=
 =?utf-8?B?bWEzZ2NKMnZBWkZQa2lKcWNSK3h4aXc2bXVSOXozazZaV0xscWlTU3FIanUy?=
 =?utf-8?Q?LBOmhYVUWQYvj4Kb5QltQ7KEp?=
Content-ID: <58BFFA32788BC94AAF27498AE64E41B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464eef95-4627-42ae-236e-08dd4cb5eb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:10:37.2372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzyR86ND4WbY/Y/39oEwmyUztUYMxijYUK7hJAdQ549+R1Q8tVWuLsCqg7POitQ5yeX4RXjBCc/KhAAeP2uGbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7901
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1921848855.1156353929"
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

--__=_Part_Boundary_009_1921848855.1156353929
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTAyLTEzIGF0IDExOjM4ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMy8wMi8yNSAxMDoyMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBPbiBUdWUsIDIwMjUtMDItMTEgYXQgMTI6MzQgKzAxMDAs
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiA+ID4gRXh0ZXJuYWwgZW1haWwg
OiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHRoZSBuZXcgSERNSSBUWCB2MiBJUCBk
cml2ZXIsIGFzc2lnbiB0aGUNCj4gPiA+IHBvaW50ZXIgdG8gdGhlIEREQyBhZGFwdGVyIHRvIHN0
cnVjdCBkcm1fYnJpZGdlIGR1cmluZyBwcm9iZS4NCj4gPiANCj4gPiBJIGNvdWxkIG5vdCBmaW5k
IHdoZXJlIHRvIHVzZSBoZG1pLT5icmlkZ2UuZGRjIGluIHRoZSBwYXRjaCBvZiBhZGRpbmcgaGRt
aSB2Mi4NCj4gPiBDb3VsZCB5b3UgZGVzY3JpYmUgbW9yZSBhYm91dCB3aGVyZSBvciB3aGljaCBm
dW5jdGlvbiB3b3VsZCB1c2UgdGhpcz8NCj4gPiANCj4gDQo+IEkgaGF2ZSBhbHJlYWR5IHJlcGxp
ZWQgdG8gdGhpcyBleGFjdCBxdWVzdGlvbiBhIGxvbmcgdGltZSBhZ28uDQo+IA0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvYjVhNzc2MzctNjRiMC00ZWQzLTk2MTktZTc2ZDA5NDUwNWFm
QGNvbGxhYm9yYS5jb20vDQoNClNvcnJ5LCBJIGZvcmdldCB0aGlzLg0KDQpSZXZpZXdlZC1ieTog
Q0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+
IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+IA0KPiA+ID4gVGhpcyBjb21taXQg
YnJpbmdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWlfY29tbW9uLmMgfCAxICsNCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWlfY29tbW9uLmMNCj4gPiA+IGluZGV4IDVlYTQ1NjA4OTIxYy4uMmM5MWY2NWYyNmZhIDEwMDY0
NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5j
DQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMN
Cj4gPiA+IEBAIC00MTEsNiArNDExLDcgQEAgc3RydWN0IG10a19oZG1pICptdGtfaGRtaV9jb21t
b25fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ICAgICAgICAgIGhk
bWktPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09QX0RFVEVDVCB8IERSTV9CUklER0VfT1BfRURJ
RA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IERSTV9CUklER0VfT1BfSFBEOw0K
PiA+ID4gICAgICAgICAgaGRtaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfSERN
SUE7DQo+ID4gPiArICAgICAgIGhkbWktPmJyaWRnZS5kZGMgPSBoZG1pLT5kZGNfYWRwdDsNCj4g
PiA+ICAgICAgICAgIGhkbWktPmJyaWRnZS52ZW5kb3IgPSAiTWVkaWFUZWsiOw0KPiA+ID4gICAg
ICAgICAgaGRtaS0+YnJpZGdlLnByb2R1Y3QgPSAiT24tQ2hpcCBIRE1JIjsNCj4gPiA+IA0KPiA+
ID4gLS0NCj4gPiA+IDIuNDguMQ0KPiA+ID4gDQo+ID4gDQo+IA0KPiANCg0K

--__=_Part_Boundary_009_1921848855.1156353929
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMDItMTMmIzMyO2F0
JiMzMjsxMTozOCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjsxMy8wMi8yNSYjMzI7MTA6MjAsJiMzMjtDSyYjMzI7
SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZn
dDsmIzMyOyZndDsmIzMyO09uJiMzMjtUdWUsJiMzMjsyMDI1LTAyLTExJiMzMjthdCYjMzI7MTI6
MzQmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMy
OzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYj
MzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zl
cmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24mIzMyO2ZvciYjMzI7
YWRkaW5nJiMzMjt0aGUmIzMyO25ldyYjMzI7SERNSSYjMzI7VFgmIzMyO3YyJiMzMjtJUCYjMzI7
ZHJpdmVyLCYjMzI7YXNzaWduJiMzMjt0aGUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3Bv
aW50ZXImIzMyO3RvJiMzMjt0aGUmIzMyO0REQyYjMzI7YWRhcHRlciYjMzI7dG8mIzMyO3N0cnVj
dCYjMzI7ZHJtX2JyaWRnZSYjMzI7ZHVyaW5nJiMzMjtwcm9iZS4NCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzI7Y291bGQmIzMyO25vdCYjMzI7ZmluZCYjMzI7d2hl
cmUmIzMyO3RvJiMzMjt1c2UmIzMyO2hkbWktJmd0O2JyaWRnZS5kZGMmIzMyO2luJiMzMjt0aGUm
IzMyO3BhdGNoJiMzMjtvZiYjMzI7YWRkaW5nJiMzMjtoZG1pJiMzMjt2Mi4NCiZndDsmIzMyOyZn
dDsmIzMyO0NvdWxkJiMzMjt5b3UmIzMyO2Rlc2NyaWJlJiMzMjttb3JlJiMzMjthYm91dCYjMzI7
d2hlcmUmIzMyO29yJiMzMjt3aGljaCYjMzI7ZnVuY3Rpb24mIzMyO3dvdWxkJiMzMjt1c2UmIzMy
O3RoaXMmIzYzOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzMy
O2hhdmUmIzMyO2FscmVhZHkmIzMyO3JlcGxpZWQmIzMyO3RvJiMzMjt0aGlzJiMzMjtleGFjdCYj
MzI7cXVlc3Rpb24mIzMyO2EmIzMyO2xvbmcmIzMyO3RpbWUmIzMyO2Fnby4NCiZndDsmIzMyOw0K
Jmd0OyYjMzI7aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2I1YTc3NjM3LTY0YjAtNGVkMy05
NjE5LWU3NmQwOTQ1MDVhZkBjb2xsYWJvcmEuY29tLw0KDQpTb3JyeSwmIzMyO0kmIzMyO2Zvcmdl
dCYjMzI7dGhpcy4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBt
ZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMy
O0FuZ2Vsbw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7
Jmd0OyYjMzI7Q0sNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGlzJiMzMjtjb21taXQmIzMyO2JyaW5n
cyYjMzI7bm8mIzMyO2Z1bmN0aW9uYWwmIzMyO2NoYW5nZXMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtB
bmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jJiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEm
IzMyO2luc2VydGlvbigrKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7NWVh
NDU2MDg5MjFjLi4yYzkxZjY1ZjI2ZmEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24u
Yw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7QEAm
IzMyOy00MTEsNiYjMzI7KzQxMSw3JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7
Km10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBk
ZXYpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2Uub3BzJiMzMjs9JiMzMjtEUk1fQlJJ
REdFX09QX0RFVEVDVCYjMzI7fCYjMzI7RFJNX0JSSURHRV9PUF9FRElEDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7RFJNX0JSSURHRV9PUF9IUEQ7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2UudHlwZSYjMzI7PSYjMzI7RFJNX01PREVfQ09O
TkVDVE9SX0hETUlBOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLmRkYyYjMzI7PSYjMzI7aGRtaS0m
Z3Q7ZGRjX2FkcHQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2UudmVuZG9yJiMzMjs9
JiMzMjsmcXVvdDtNZWRpYVRlayZxdW90OzsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRn
ZS5wcm9kdWN0JiMzMjs9JiMzMjsmcXVvdDtPbi1DaGlwJiMzMjtIRE1JJnF1b3Q7Ow0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstLQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Mi40OC4xDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1921848855.1156353929--

