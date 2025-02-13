Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413CA3395D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 08:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9C610EA1D;
	Thu, 13 Feb 2025 07:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Pt7G7h6L";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VCSrLH8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7D910EA22
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:57:29 +0000 (UTC)
X-UUID: 1aa220bce9e011efbd192953cf12861f-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=D/BY3HALRMSWS+xOgkkQPV/nI2sFWn+3NuetlI9eJxU=; 
 b=Pt7G7h6LBt6R3olba6sPRerFKSXgG5Ztvks9OG3tEMq48Xwrm6J1S3OO5ayLuQZ8hNoZORSNVN9oPniynvsIRhlu+8w1uizewHb/wNvmSZXnwrP4DTLr+YaWcdcUZWvYE52kz71VHxVArEliBaAr32hhk1wFcs5tvzI/QA2QILI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:818e7837-51db-4a8e-940e-14dc3bafc3e5,
 IP:-32
 768,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FIL
 E:-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:nil, BulkID:nil, BulkQuantity:0,
 Recheck:
 0,SF:nil,TC:nil,Content:nil,EDM:nil,IP:nil,URL:nil,File:nil,RT:nil,Bulk:ni
 l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
 :0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1aa220bce9e011efbd192953cf12861f-20250213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 258237809; Thu, 13 Feb 2025 15:57:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 15:56:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 15:56:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2zZv3CDQuAQi+ix41vKZCxeCQFQ5MjojDxn/CbAy33SMh05B8JTbMA8XcWee8rU60kbmZrY1bpqN1VcmaVzewjMSVtf/ZaHJ1v8zxAl4sTOvr58Q1lygC9A2/XrIVG96aNRcyB1UMJtHEDp4BBOd93IDLTQBqAr3zXL4jaFYPbsCSwxPsCUC0SScwbaQSWnVuw90yafgBV0YI+waT/lq4imFNBuyW4vWFGx2jae7l9itZUJN5D220f9WL8v6H/eUFVRhKgFMXE8hdLp3TpdLT0hywKwdkvzXXw9zWV2mW6aEFW86uiuN3kq2uhj3RKnjs/VBqjHEu8gWoZWcjvUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ldhEua6YVdJZ0CRNeyYuf9R3hXTEHPuRKrB75my5sk=;
 b=xPx17KPzYLYH1XecBbPSMx0YDr/zAktKHwhvEUW7MSUt9rfYnGdgSpLkjkTZ+GaDS2tnlbowTQH21hnKPD1SOAZ9vxA6gmW0haXVJC6HJBEo0SpknplLYfHzjeHkJZQXQutd+oEJImC5BU8pPBxUZaro42nizf7F5eKnZ+H5kYcIWZO3rIq8W+bb2zlw6tOrJPshXQFbtq0R95XKnyBgq479Jvm5aCF2AcKIj5mc7W4z86pnoC/LPM2vpXTQ4wqVOZj6skJUcEa6Gw+QCByGbnBDT649s0yv66xrpbQeVb+iG+w1NJyPqAhJ/gMr4vvcwokeeR1Vt59xNuYDxsFc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ldhEua6YVdJZ0CRNeyYuf9R3hXTEHPuRKrB75my5sk=;
 b=VCSrLH8v0XUZOWIzcvKlpwbdZA+lc7clr0lkw6n5+ham+Z5XaiAUolBfd2npLvTCy8m3Rw+JgJVGyVIBkydSjeRow6lCB2eEMFNCPzORjw/ab9lQUhF+fn099scVRDaVQCshaQEjmzhmBp5ThetREPZN1Di3aAYXaE1R/4qaxy4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6979.apcprd03.prod.outlook.com (2603:1096:400:284::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 07:56:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 07:56:54 +0000
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
Subject: Re: [PATCH v6 32/42] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Topic: [PATCH v6 32/42] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Index: AQHbfHkwmrecY8U9bkGH3H8V2qFZybNE4L8A
Date: Thu, 13 Feb 2025 07:56:54 +0000
Message-ID: <1f9b973387f57026a74ab6caeaea4f1b8b1e0369.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-33-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-33-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6979:EE_
x-ms-office365-filtering-correlation-id: ca93e700-b0eb-4319-b0b4-08dd4c03fbc6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cy8xcXZNRS9LY1kwQXBybzl3VFg2Zm0rN1RUaUpFb3ozZkRXSTZEV3FzR3hH?=
 =?utf-8?B?a1RoT2JXY2ZSQTdnc2NuUlZTRzNYQXJrQTdZTEtyWUlOSFBFeG4wVEk3MHdS?=
 =?utf-8?B?VXVYVnE4T0VqYm1uK2ZaVHR4WkxINWdjUUI0RVhaWnMvMGhXY2ZIaGhRTkMr?=
 =?utf-8?B?M3ZOcnR3MUZJbVRCN25Canl2WDhxNWlmcWVxUGNLS044cHRJMFJIZngyNWFp?=
 =?utf-8?B?RG1rV0l1V2taMTY0WlNQOU5xTkNZM1Fmb0g5aUdscXhaS1d5ZjVBeDM4aFJV?=
 =?utf-8?B?N0xlK0YxaExsbElsbEFSWW4zOEE3ZnptZk9RaGRyOS9HSXRsNUZkUW96eVQ4?=
 =?utf-8?B?SFZmOS9DRisweWtzWE9NbHh2dVRTUjc4ZmtMcTlNQ3ZiREYreWpOUGJqM2lJ?=
 =?utf-8?B?NlFObnRCV3lNSHlOb1FrZjQ3TmhCYTM2akxjRlZxamRObHVDSUpodnA2UUtq?=
 =?utf-8?B?REx1aHhhUmZtNzlwNEhCS3hkOVlYajQvL2ZGekw5dmFBUkJxVUt0NFI0OVFZ?=
 =?utf-8?B?UC9xTzBrUUJEZ0pMNHByQjhyKzZsVm1aeHJ0VkppbnlmMnl0MVZXNm5zazRu?=
 =?utf-8?B?OGxKVFRzQnRZVUlhL0ZZQ00vUEpwNWM2U2tQR2xKUVB0YVFsMDJxeDV4UjFI?=
 =?utf-8?B?OStJT1QwV0o3c3lzV05qT3lLVnNiVVlJWFU4aXBOeXdHa0JUTlpTak5wNTBv?=
 =?utf-8?B?NWJwUDlMcGNnQnFhYWhrdFVINXR0Zmp5WDhCeGVYWU9zVzhRMnNwbHRocFFN?=
 =?utf-8?B?UmVEeTd2eWZJck5WRk9YWklDMnRBalJJWEprNTlmZ3l5Sk9BQmVMRXBBVW0y?=
 =?utf-8?B?VThDMys4bVBFcTVxa1E5VXNiUmtEdGxyNVVrbWc2QWxmZDB2TkhuSmFobFZZ?=
 =?utf-8?B?Q0loUzlSVGd5V1pnQWkwcWRZQVJCVngxcTAyUDVVeUhOUTNpZVVYSW93czFj?=
 =?utf-8?B?Y3N2c2w2bzU1MnJoTXJrOFRsOGhiZWs1cnpQbnRCR0JOR2RDbDRseXlHeUN5?=
 =?utf-8?B?TW5tR010WU5Pd21TVUJJcEQ1dmt2cGlTOGZsWDcycDd3MXptK3BHRmx5UDZY?=
 =?utf-8?B?WE0zSnV6Z3IyWlcwaCtnU3NoZmo4YnJnREJ3MytBbDNQdis4R0lNR2FYS3Ur?=
 =?utf-8?B?MUVxNm05YnlpN2FDeE5aNVZuS2xJQmdJWk9VL1FBZ2tzN0dDWjRqOC9nZERF?=
 =?utf-8?B?ejBWWi9QVjlJTWZmQzQyYVU5aU1oZE1ESjUxdTByS1hNT0phR3hHSGppdzZw?=
 =?utf-8?B?WHFqYU8zNzdNOHlOS0w5aXUyL0pNVHpNa3VVOHB0N0FqMlBVUE1lMmd0aVlP?=
 =?utf-8?B?b0VLelNtMFBPSzBDMjJQQXczbjh2dWdlN1YybEJ0T2ZFRWJ3cmJaS3NpUDR2?=
 =?utf-8?B?WVhqUTJRUElXQ1pMUnpxQncxMW10cEN1WTJLYnh0a2JsZFI5WC9sa21nNDRP?=
 =?utf-8?B?ekxpM1RZdUkzQjJHTythNzBLcVJPU3h0U2lsb05NSWQvRXY1QnA1NDgrdk1M?=
 =?utf-8?B?QWQ0ajlOdnZYSWZTWkpIUXVlTHErZzZXbkFVOGV1YjhqTlVPbE9MeTlCT1J2?=
 =?utf-8?B?NnFQMEhoUzF6emMySEZqQ3NwaWd6N2hJdTM2cFZ6dWdyZWVzS25XcTJWL25M?=
 =?utf-8?B?czFlOHcvaXQ1NlR0S2txUHRpd2tBaW5KUzJZazZaM0QvOU5lemhGeUtzOEZB?=
 =?utf-8?B?dE83aFh6WEhFRm9ycURja3RKK1NiOXZmdGt1TzE2eC9UYWk3blVXbTlkOWJq?=
 =?utf-8?B?Vk1lYys5YlZIRTR2VU5GeXYxNk1oMW05Tndqai84YnJ4dHpCS2tjU1JISHlz?=
 =?utf-8?B?Y28vU1RUSU43RG1LNGtJL2M3cWRiamQ1aDZIQk5CNE9sMU9FVFhQZ285Tjdt?=
 =?utf-8?B?U1V5aE1udExZQmRYWFAxVytqakIxb2thWDFvZ2Fkb20wUDZKaGFFN1NnU1Zi?=
 =?utf-8?Q?T9OEZ7Wt3yMmEWWN9QOcBu5VPRo6Jwf0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qzl0d1JuMUlDNmhYK1BEMlhOa1JFVE1mZXZzV2lJVFNYNjBkT0V0dS8rY2Rz?=
 =?utf-8?B?WWNiRHdsdW9Kd2dyZDJKcDdTM2grb1lwZEk3WmtCVmN5WDl5U1U1ZjBjUjY4?=
 =?utf-8?B?dlpabjlKeHEwQnYyTDh1UEgxRzZCelJYamppRGxYV1E3WWZqZ1NHbEJMY0hr?=
 =?utf-8?B?WW9FMnV2OTRVM2JxMlVwQkVWZDJkZXlNQmd0b1lsUnhtRkRCYXVHT1gvVjNT?=
 =?utf-8?B?bWRQVkZMSHhGazVvNTM0aGNFdk9wYzFJTFpSbkJwdkdFam4wWjN4S29qMnpQ?=
 =?utf-8?B?SkVMaGM4L3cvZmpyOEdQTDlRL2tza1JKL3poeGZuQlREZXY5Q1dUcUdSdENG?=
 =?utf-8?B?VnNCMEcyUnRQLzhPVXZrRXJCbVVSWjYzWjVwZ2NXRmcyUnFvQU1HM0pFMjBl?=
 =?utf-8?B?RWFXRnlJTXh1UVhjaStKSjRIc0pSNUZ2eWVYamFZeGY3K2VUcFpoejVQQ0pU?=
 =?utf-8?B?bm5lUVVBY1lKeUh6TGVPVk92WWhtMVJlZzFYNkJ6K0ZZaW05aFdIbENrc2Nu?=
 =?utf-8?B?Q1NNdUs4aUU0ckZWd3JWS0kzRVNBU2VZNmRaM3EyNWtyZkw4VmN4aXh4ZG9R?=
 =?utf-8?B?ZWwvMktRSzA2aXlHRHAyZjhaQlhKZyttcEhNaHhqTlZ2WFdDV1pFb05yRFNs?=
 =?utf-8?B?UTFoLy90QTlKZ2hUL0wwUzU5RmhhYS9rSXM3Z3hISk81ZGdadE5lWCsyV3Jz?=
 =?utf-8?B?ZHF2VGRoSnZ4akkvQ2swL1JKbjhOcGEzcFBYNDVJSW5IYjI0UmtXbXE0NFlQ?=
 =?utf-8?B?aitCNmc1UkkyaUZscDRQdjN4TDRzQUVhcG52VmNWU2QvdVBxQUZDaGYzV0hQ?=
 =?utf-8?B?UGpYMTBaTk1iM01kM0ZkL1BHR2ZNQ08xS2JHTzNTbzFvNjJCbERLOUNWcWhN?=
 =?utf-8?B?NVhKM0MxWkp3SnpsYU81SHo1eDhwaHRVTTBlemJXdVdIRmlhL0dzVVVWMW5D?=
 =?utf-8?B?ajNEQU1QMVFTWi9hMHVkRTd3TFdtZzdnRDJjcnMrNDZhQmxTYmtaRHNvRzVP?=
 =?utf-8?B?WU56RGN0KzE0Z0t5MEtvbnRkbjlDUk1FZUk1b3V5c2o1RHEwVUFmRmJiRjlL?=
 =?utf-8?B?cDQ2bDg5QklNY2ZqSTN3aXl5TzRSL3JTZVRKbmxvaTJGUHlob1RnaHdaT044?=
 =?utf-8?B?ejlNKzZ4UCs4L3orS1l3dXdWTVFsZmJaMXdlZzdVZTBzQ3VWdzJoSkFvMFdH?=
 =?utf-8?B?QWg5OWFyRHJJKzBza0lCbFZjbE5nVk44Tm5iZDlRNTRsTjNBcjBidzNEVjFS?=
 =?utf-8?B?M0QxOGN6ZEhWNkp1MytpcVBpcW5qQWcwcnFpeS9vaVVZdGp5WjVGcjgxRnNu?=
 =?utf-8?B?Kzl3bTB0MW53aUV4RHFucXNBL1hFdkd6WTVNaksyRmMyMTBkY3J6U0dpWDBS?=
 =?utf-8?B?TFl5UVRGdStEck1jV1pxcnhQTEFYQXBrNitGL1l0QlZIOXJIYi9TRFJOckVX?=
 =?utf-8?B?eWpqdm41dG84eCtaQWsyVFl4bkhzSEFJYktqUFFENnBOaVI3QVpneFZtdnIv?=
 =?utf-8?B?L2xqTWlxRmhUU0QvSEFiV0s5NTdUV2JqZnpVMHBwTVpPWGVaUDZFanBpMlhI?=
 =?utf-8?B?bVZxcWtEa3BTd3I1dkJVdkJEVEJveTdMU3VGZVZkOWNhV0Q4YkFYY3RGTUla?=
 =?utf-8?B?TStDWWtVR0crL040K1RFQnB5WjZjUVI0UWlLc2Y1ZXlFV1Z5bW1SNHUwUFM2?=
 =?utf-8?B?N2ZodjdBQzlMY2YwZ2cwYmlsTTdyU1FJRE4wZUFlNkRmUnBiaU04bGFYTzAx?=
 =?utf-8?B?Mnk5UnNZSWoyY1JST1NiRHhTdCtzQnN4K3FFSU1kb3poajQ2KzNoNFhhQWs2?=
 =?utf-8?B?OG5iLysvVjFiRmpKY2Q1cWlhWHoyYTdzZ1lPRGhuNEQ1em9uQW5jaWtycmho?=
 =?utf-8?B?SGluZEdGVFBxVFRjNFZYRXppVVlWdEFYekFVZ0tBN05HVnVtYmpWbTR0TU1K?=
 =?utf-8?B?R2J2U3lpY3FOWnpZMXBnZGkvVlNpdDJnbHF6WHFDaE0zQ09wWlFoRUZzU0NT?=
 =?utf-8?B?amk0RFEzMm5xa2doZUxHaUYxcFB4aUI1Vi9ZTCsxTmZrZHVEY0FQeWxmN24w?=
 =?utf-8?B?NkV4eDN1alZJY3hRc05sM241dWtFb0hYN2pWM2pMMDVhRVd2dmJPQ3VLVVRU?=
 =?utf-8?Q?eyzGhAGaisqogPbYduEhpbvMd?=
Content-ID: <97C5EB3E13D47D4A831370B9297BE0CA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca93e700-b0eb-4319-b0b4-08dd4c03fbc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:56:54.8556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbOrU+Ev8FxvV1DHa8VC7//ykW/i96YdI+4FfaC73kRNcXXQMlgCEpdvyc8ZjYhSSmToqA0CsAyxRN9OpaUJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6979
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1657265975.519500765"
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

--__=_Part_Boundary_009_1657265975.519500765
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBSZW1vdmUgdGhlIGVycm9yIHByaW50IGluIGNhc2Ug
b2YgbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbygpDQo+IGZhaWx1cmVzOiBzaW5jZSB0aGUgQVBJ
cyB3aWxsIGFscmVhZHkgcHJpbnQgb24gdGhlaXIgb3duLCBoYXZpbmcNCj4gb25lIGluIHRoZXJl
IGlzIHJlZHVuZGFudC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCA5ICstLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMNCj4gaW5kZXggNTNjMjg3MzdhYzJhLi44ZjMxMzYzYzU1MjIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBAIC0xNzA0LDE1ICsxNzA0LDgg
QEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfaGRtaV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAgICAgICBpbnQgcmV0ID0gMDsNCj4gDQo+IC0g
ICAgICAgcmV0ID0gbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsNCj4gLSAgICAgICBp
ZiAocmV0KSB7DQo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImhkbWkgcmVzdW1lIGZh
aWxlZCFcbiIpOw0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLSAgICAgICB9DQo+
IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gKyAgICAgICByZXR1cm4gbXRrX2hkbWlfY2xrX2Vu
YWJsZV9hdWRpbyhoZG1pKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMo
bXRrX2hkbWlfcG1fb3BzLCBtdGtfaGRtaV9zdXNwZW5kLCBtdGtfaGRtaV9yZXN1bWUpOw0KPiAt
LQ0KPiAyLjQ4LjENCj4gDQoNCg==

--__=_Part_Boundary_009_1657265975.519500765
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1JlbW92ZSYjMzI7dGhlJiMzMjtlcnJvciYjMzI7cHJpbnQmIzMy
O2luJiMzMjtjYXNlJiMzMjtvZiYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbygpDQomZ3Q7
JiMzMjtmYWlsdXJlczomIzMyO3NpbmNlJiMzMjt0aGUmIzMyO0FQSXMmIzMyO3dpbGwmIzMyO2Fs
cmVhZHkmIzMyO3ByaW50JiMzMjtvbiYjMzI7dGhlaXImIzMyO293biwmIzMyO2hhdmluZw0KJmd0
OyYjMzI7b25lJiMzMjtpbiYjMzI7dGhlcmUmIzMyO2lzJiMzMjtyZWR1bmRhbnQuDQoNClJldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMz
MjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjs5JiMzMjsrLS0tLS0tLS0NCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwmIzMyOzgm
IzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzUzYzI4NzM3YWMyYS4u
OGYzMTM2M2M1NTIyJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTE3MDQsMTUmIzMyOysxNzA0
LDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO19fbWF5YmVfdW51c2VkJiMzMjtpbnQmIzMyO210a19o
ZG1pX3N1c3BlbmQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsmIzMyO3N0
YXRpYyYjMzI7X19tYXliZV91bnVzZWQmIzMyO2ludCYjMzI7bXRrX2hkbWlfcmVzdW1lKHN0cnVj
dCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7
KmhkbWkmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7LSYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aW50JiMzMjtyZXQmIzMyOz0mIzMyOzA7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYj
MzI7PSYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsNCiZndDsmIzMyOy0mIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsocmV0KSYjMzI7ew0KJmd0OyYj
MzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldl9lcnIoZGV2LCYjMzI7JnF1b3Q7aGRtaSYjMzI7cmVz
dW1lJiMzMjtmYWlsZWQhJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO30NCiZndDsmIzMyOy0NCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3JldHVybiYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsN
CiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7U0lN
UExFX0RFVl9QTV9PUFMobXRrX2hkbWlfcG1fb3BzLCYjMzI7bXRrX2hkbWlfc3VzcGVuZCwmIzMy
O210a19oZG1pX3Jlc3VtZSk7DQomZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Mi40OC4xDQomZ3Q7JiMz
MjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_1657265975.519500765--

