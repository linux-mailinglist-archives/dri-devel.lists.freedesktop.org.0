Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C726B27CE3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 11:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3B10E252;
	Fri, 15 Aug 2025 09:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pn5jARjX";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="flK8cCp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B4E10E252
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 09:22:31 +0000 (UTC)
X-UUID: 59bd280a79b911f0b33aeb1e7f16c2b6-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=B/fjOJ3dJ3ju44dyw6gyp7ciq7WuwBDEfUq9ew7mNds=; 
 b=pn5jARjXPTGytIhkTS1gDtVsbCl67bXIaV8tLP23XAjuLlOmAqzg27kB246FD6rf5RmcGrnJX2bE98yAwaTqhG2QWl2+8SV1g/Ds5sUKS/AtE8KsvPtcw02XkUHVn3QY4V6C+xhXqoGcGvt2yuUZGqpMC5XCw+HxPZJEiqrxvnI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:6141bfae-10f4-4fa2-9feb-bffab729a03d, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:a5638344-18c5-4075-a135-4c0afe29f9d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 59bd280a79b911f0b33aeb1e7f16c2b6-20250815
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1802747669; Fri, 15 Aug 2025 17:22:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 17:22:20 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 17:22:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0598nHgctjz4X9paZ4uMi4OaT7vPKYJ1gEtZBleYUT/u5W+8igmEBY3r86Kruo8y3XkklYIxJ0r2UzTkszBJavdbGgDr7t2epEH6iUtXaGAYe6fc8jm0sKeljqAMIam3Fw05Dw9GR0k5klcJVbdCJyv90+NiAqaYZbaqcp9UdZmmkxcZfF43fqt+UbJMA+gbbKX0iZqoHGPMRB8td9O2ifDPCHJ8k5NpLJrxf++kT0bRSSBZBh4BZhaMRNYgPJ1y/0EN4YJZD0FdaYYzCfZ1oT9eDUNt15tX3nlhngP/WX70Zbcz71GQ+HTpZhTTb/Pl76VbNRK/yuSfbxEmvb4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4ZqYSi1SipCjkYR68Ny6DQoaLz+n7As1J3k6CawvWE=;
 b=pRDHgOeTlnqLotfzHNFqVOO1xSPMBu1+O0EKdP3hMOE662WUwzLooaJ4fH7XgvWDKh0SoEbs5L+AfkN2+V6rNBPARBuc/tXoZ/6NQKRy6zMsmpkQG5zJ/KPiDmrH7A32j4RUbxbbBVASCan85suVHGC2hhbU9/rwIiIfV/TYK7Ym4pcVfh9X09kdsJcTs2ElJaFk1j1+hfPfhseNC4ACbubBY7bfMxuI2MXN1kXihQAjB0+bAIThnc2KAMTc46zI116BEH+ZDD4zIvPc/b2FSFJHt99bIp4M7jiRriSGIiXurXrly+k3eNGxlRsHZCEYG1IgfwaP2mHrfuQ/FvRJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4ZqYSi1SipCjkYR68Ny6DQoaLz+n7As1J3k6CawvWE=;
 b=flK8cCp7nG/zk/lyPYwmpS6bMxYdXSf7L0HRxwoJtw5ec4/anQaPH6IqwJ3De4xu5S0+4IX3EowoRRTFzH4LKHAPnFYN6wyeIomvny6AWDb4iZ1MFLs89FnCpQ2XDpvDPDK0wlPriLAZ/eEdMKQxZyUu6NQMWjCfo0O4daLTFwY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6572.apcprd03.prod.outlook.com (2603:1096:101:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 09:22:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:22:19 +0000
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
Subject: Re: [PATCH v10 01/10] drm/mediatek: mtk_hdmi: Drop redundant clock
 retrieval in mtk_hdmi_get_cec_dev
Thread-Topic: [PATCH v10 01/10] drm/mediatek: mtk_hdmi: Drop redundant clock
 retrieval in mtk_hdmi_get_cec_dev
Thread-Index: AQHcCE0lusMD8+7ocU2fvwFD+izTH7Rje5YA
Date: Fri, 15 Aug 2025 09:22:18 +0000
Message-ID: <feabc447d5030d5fc727c4f890e470efc111e40b.camel@mediatek.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
 <20250808-mediatek-drm-hdmi-v2-v10-1-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-1-21ea82eec1f6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6572:EE_
x-ms-office365-filtering-correlation-id: 7ba4a2c7-41b6-4191-601d-08dddbdd3b94
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YmZRL015SDNpMzB6S290WEJYeU02VStGTVZxMTQxWEtQamlxd3ZGT0dNTldP?=
 =?utf-8?B?aW5SQTVtdlFoZ0l3b0xSbGdlWXg2MHhhMU1lVlZMbExhZ29ObjQ4SkdqWGpp?=
 =?utf-8?B?SlVQbklWM0k5bGIyR3d3RS9NdkJnNjFIdU9QdG9SWlh2UERRdmZrTlZPOEtC?=
 =?utf-8?B?OXQwTHVObzUzbytDVmdEbW81REJobldlYy9haDZTaE1yYmNLUWRORkl6Q3hx?=
 =?utf-8?B?S1BMREd2T1ZaRHNVMjhPTkd3cGxHWjJrOHFYd1laSHdLRzNUaG9kTkd4aTJ0?=
 =?utf-8?B?U3lNeDY2aFY3dld3SS9aSFZieER4YXRwSjV5L2cvSGRsMTBHamFmaWRUZmpB?=
 =?utf-8?B?QzJtWnltL2lFN1F5N3dsRXhZR3RFVHlJVy9pSlg2SGFHUzREZXNPVGJaVTVC?=
 =?utf-8?B?T1NmZndoaXova0lXSitHZHpNTTYxUEVkbDJ3VTF0anJZS2s5ZlBaOVdCNFBz?=
 =?utf-8?B?UzlmUXVvSTZ4Ui8wcnQrY21BcjR6UGg1Nm9wUVhnejd1UnMyU1pLNC9MN2gy?=
 =?utf-8?B?VkNNSlZWTmNqTlQrY2NLUmdFM3FmY2toTlVSMUNNYXV5cHdKbWpCMVBkME15?=
 =?utf-8?B?elk3R1krNldYTUIycDdsTkt4MWV6eFVrTXRRWlo1NnhCZWNQR0t1UHd5c3JX?=
 =?utf-8?B?a1FPZmM4K2RHbzBjUVZ1WDhYVVN4ZW43Q1J1U0Uxb24wMG5SUGI1TE1EZzFB?=
 =?utf-8?B?eWNrR0N4N2UrYlVTNlBTMGVPUnVJOHU2OXJhcVl6aytJbVBENExNL2cyU3Nh?=
 =?utf-8?B?TUlOc0VjMWJNUE1iNjFsemFEZU1vc3g0VHZvcDRYa056TEREM0RvT2pYRlgw?=
 =?utf-8?B?cjNRbE1JTjBPTFU0UzBXcEU1K01GODE3RVNxVkwzbnFzL3orQnNnd3QxTFZp?=
 =?utf-8?B?Q2x6Y1lzbjd1Vk9TSzFTWmdBTHZHMzlvdmFsTUNpZmxXWGFvVitqMVhkV2hS?=
 =?utf-8?B?dnV4enlvSW1RdmRqQ2dnNWdxVW1PU0hxeFBscnBPaXpvTjRtcXgzeXVLUjNx?=
 =?utf-8?B?QkpVMno1N3VKUmdkZ3JaUng0Wkc3N0ZhSExXSFFzdGZkd0IyTmMzMDU2bVJz?=
 =?utf-8?B?RVh1ZmRJZkIvdjh1Ny9hTE1rVml6bWdNVHpLWUUzNnFMdHBSZ21rcEtVVG1h?=
 =?utf-8?B?YUN3bDd1WUE0NWhUMktWWTFRNXRiZjZ6elRkNStOeEZ0S2x0V0lkTGtEaUNr?=
 =?utf-8?B?UVcydElGazErVTYyNHlZMDNsaXRyLzBFQzQwY3l5eVhTVWZrWTdmTjUvbkVS?=
 =?utf-8?B?OGk3amxsUkNhL1FNa1FXUWRGbFFyUDUyMDFxZkREem5wMTdDblRyeVp4RnZr?=
 =?utf-8?B?Z215eUJQYS9od3N5ZVlZYnB5K0hzZWJuZUtPd3ljT2N3TGROQWxKRSt0bmR2?=
 =?utf-8?B?aGxaaWU2WERNVWY1RU9nV2dpd3hYcXNnQVNBcU5RVmJRMjF3REdtUU0wOTUw?=
 =?utf-8?B?RzJXcHRLR0hZcUxCdnIyT1d5dncvY1NQWGszNWRMaEsvZlczd1dGdk9uZmVt?=
 =?utf-8?B?OTZFNWxNR0JqMmJ2VVBIcDdUYThNK3FzTGJXTmw1N2ZITTVGaS9QVjViTURW?=
 =?utf-8?B?d00xaVovbkJ0VHR5TGJqajdBNnRPeXlKdnJTQnRpY25zOElORytxLzBpWmNY?=
 =?utf-8?B?QXNWZTJYTnpIbjRuS3VHVTlPRlJCMEwxNXQxa3F2OE5hRC9Xb1dIUEpIYXla?=
 =?utf-8?B?eVBwTWh2YWRQZ3JPZWpDdG1pbTYrZndEUzIzOXVxQjVQKzVBTko0b3cyS0FY?=
 =?utf-8?B?cGxPYnRDTGdVcytNYUhwVktCUlpEYk9zQkswcVRLS3g3YUFUeVBhNm1pSGtm?=
 =?utf-8?B?djk3U2JxM0lUaDBqR0FlQlZ6MDJnWXJvc1l4eEJmMElsdE9FTmlkMDJRUUdS?=
 =?utf-8?B?aEltcDBiM215WUoyM3d0MDBmZDVCQXpQTGlIL2E3bWZsTHc1LzRHeXRUUkdB?=
 =?utf-8?B?QmU4ak1nVWtvWW95aGpvQlJHMWlEVC82KzJPVnBtWTFYUVM4UHdMVHhabDdn?=
 =?utf-8?B?eUNRbGdHaUdBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(7416014)(376014)(366016)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWp1WjRYM1NMRnM2VmU2RHd3YVZpVG4rWnJvMTVUNDBybGZQOHlQTFprTlNT?=
 =?utf-8?B?OXV1NzVDNW1YdndnQ1gySG9tK2c3VFRZYjdMODVGZlZIV1ROVEI1WlJJb1Bu?=
 =?utf-8?B?M21nSCtJaWxxb0xIbmd3RDMwLzlnRENiY2FQUVhETWFxajFFcWJsaE03RXVX?=
 =?utf-8?B?V240TmFiSWJwUS9oY3oyQit0N3NrUi9reGtEbTQrQVVUSDFBdjJwZkdxN3la?=
 =?utf-8?B?MHRmTjdoMGpMcXhNekxUV2xReGt1c3JqOUVsc3JTOVJadUhiU3M2bW42aEZN?=
 =?utf-8?B?RWVpaVQ1VHB1UkVBbThOTlBRYWdnSHhFNHFzWi9kTFJhc29WQ3hlOWhoN2pp?=
 =?utf-8?B?QUpNSTc3RS9hV3RQRmloNTlDWk0waWpscDJtWFFXaEJUdVo3ZDdIOGhPK2Vk?=
 =?utf-8?B?ekdudXNTMDlFY2FNNmdMa1BVUHFoWGNNLzBIZzNIRytLa00xVktpNzByako0?=
 =?utf-8?B?N1FsY2FXakRLV2tidXVpMlpST1BGYVVZS3E3ejhuMnJaTnI2WFNUSlhWd1VH?=
 =?utf-8?B?clpmc0g4SEdZSDJ2WjVONlI5czZZNW9hSGFrSy9iRnhhbFZkeXI5aUFDcGZ2?=
 =?utf-8?B?eUs1VUVoMEZJakEvYmNYUCt5dExWNEJscXp2OEpyNmcyNTR0THlpbGhndlAv?=
 =?utf-8?B?RzJMb1RXcGJ3emo4NHYwR3VCMmpPcGU4U2ZjOG1sZkhMR3BYVHc3RlpXVjZB?=
 =?utf-8?B?RE41Szg1NTZQanR0eURGTEZzS0c5REE1VE9aTWNOYk9MeE54YVlndk1Zc1g5?=
 =?utf-8?B?TW5WajdIK1F5bXltaDBuKzA4Tm9lV1dMa01nSkNZQ0tSUkhDbksvNi9HMDYv?=
 =?utf-8?B?d2tiUk1UWTB3UUVRS3duN0ZKQXR2MThkVk5uWm9Mb2ZuQnJtM05TQjdhT0t0?=
 =?utf-8?B?WC9qaGRiek9sWFRwOTlHZHBXNUNhUjlCWVIzeUtPbE5QQkxIUmVEY01iRjds?=
 =?utf-8?B?ODkrMlB1MWNnRVByVThjaXdJbGY4eGlkalZkcVBUamZrRGQ5Q2NkZU9nRk9q?=
 =?utf-8?B?QmgwQXpJVTNFZDB0TlZNNWs5VGFyMklxMUF5SnJkcDRkM1NvaE40dTdDZjBm?=
 =?utf-8?B?NDF2Z3JUL0hUYlFUcVFDUkpyUUt3aS9YU1N0YXB4cHh3SUpaMlMzUzYrdnl1?=
 =?utf-8?B?bFV4U21paThSZ2wxR0xVUEkweElzSTM5TnVCZHBWYm9LdXZDdDlTUGF2bGU4?=
 =?utf-8?B?b2lPYVNPZnozY2VDNXo2NkI0bzdINW9Kd1hLOFhWRG1BV0NtV29zY2xRWXov?=
 =?utf-8?B?YzgrSHp4czB2Q25hSld4N2VpcGR0UTM2dXBEeGVIMENZOE9ZVnRYV2dZU040?=
 =?utf-8?B?cDBMLzFBVDhncHovM2E1QU5EbUlYREFRdmtObldYN0d0a2c3cHEyK3J2cnJQ?=
 =?utf-8?B?aXFQTDBCcDFhOGtHdnUycGptR1JJUEpFSTQvRlp3VGlFT3c0R29Jb2xxYWxJ?=
 =?utf-8?B?aWlCZHBtWGwxR2JJeXhEREMxWHlsUFZYZ2h0OWlqdW5EUUplaG1wREllODVG?=
 =?utf-8?B?YjB5aFltOTdJZlV5VGRNcG1OZ3d1SmVIYTNPSGRCOFo4ZWo0NWNtRXBxa0JP?=
 =?utf-8?B?TlVIMTlmOU1aSDhnSlRGdUdtMFdsZXRDaHViSDJHL2FuZUlOQTJhdW55NmVv?=
 =?utf-8?B?QkNPRG92N0FxWEdwcW9TbEl6YTNoUUh2U0RvcXlMcUE2clpjQlY3Z2R0MmpT?=
 =?utf-8?B?bVRqTHp2TzV2NEdjVU9NY2F0eFRVRDVBTjN5aG45blRaQmN3N0E4TEZjNXV1?=
 =?utf-8?B?Z0w3eWE2M3JUcThsK2haNjg5OXM2aWNCRzlQYkxybVVRcXFpaDBxQXM5cGJX?=
 =?utf-8?B?OGkwQjFRL25zL0tYSGFrY1Z5am5FVi9hYUQ0UGM0WCt5aDl5am11RnNKT3h6?=
 =?utf-8?B?MnZMYmxPd3JtdmNXRkwxdGNuci9BaDllV29sRzFDdUt3c0dNWVEwcDgvNkVo?=
 =?utf-8?B?aXpBQjNXNkJ2WVNoUXN5SlQ4TCtLR0RUbHc4aUh0TFdYdUcrbHNtTytiaFBi?=
 =?utf-8?B?dWlEc1FuMmp3MnMwS2Fqenp1V3lGVENGeEFQQTFQaEl5elc4Q2Z2RlhHOGdl?=
 =?utf-8?B?ZDR5djBNNnJIRGg2aGpUMW1wc3dOcnJzRmFvaVVoclprSlRCUnJYSjB6TlNG?=
 =?utf-8?Q?BTGS0AeMj+7RSPilgOqjt6oXg?=
Content-ID: <EDF15C2E71D5B049B71B57CBE70B28AC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba4a2c7-41b6-4191-601d-08dddbdd3b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 09:22:19.0116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqZBA0xKfToHL04tO9YARRJvTKagqatzu3AKv67FR2aZd6FCePiKoUhBHQwJpUXBaowD4cWzihxSXDdvcw2FQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6572
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_32068506.1736490369"
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

--__=_Part_Boundary_002_32068506.1736490369
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA4LTA4IGF0IDEyOjEyICswMjAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEluIG10a19oZG1pIGRyaXZlciwgd2hlbiB0aGUgQ0VDIGRldmlj
ZSBwYXJzaW5nIGxvZ2ljIHdhcyBtb3ZlZCBmcm9tDQo+IG10a19oZG1pX2R0X3BhcnNlX3BkYXRh
IGZ1bmN0aW9uIHRvIHRoZSBuZXcgbXRrX2hkbWlfZ2V0X2NlY19kZXYgc3ViDQo+IGZ1bmN0aW9u
LCB0aGUgY2FsbCB0byBtdGtfaGRtaV9nZXRfYWxsX2NsayB3YXMga2VwdCBpbiBib3RoIGZ1bmN0
aW9ucywNCj4gd2hlcmVhcyBpdCB3YXMgb25seSBjYWxsZWQgb25jZSBpbiB0aGUgb3JpZ2luYWwg
bXRrX2hkbWlfZHRfcGFyc2VfcGRhdGENCj4gY29kZSBhbmQgZG9lcyBub3QgbmVlZCB0byBiZSBj
YWxsZWQgYSBzZWNvbmQgdGltZS4NCj4gU28sIHJlbW92ZSB0aGlzIGNhbGwgZnJvbSBtdGtfaGRt
aV9nZXRfY2VjX2RldiB0byBrZWVwIHRoZSBzYW1lIHNlcXVlbmNlDQo+IGFzIHByZXZpb3VzbHku
DQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBGaXhl
czogNzQ4NWJlOTY3ZjdmICgiZHJtL21lZGlhdGVrOiBtdGtfaGRtaTogTW92ZSBDRUMgZGV2aWNl
IHBhcnNpbmcgaW4gbmV3IGZ1bmN0aW9uIikNCj4gU2lnbmVkLW9mZi1ieTogTG91aXMtQWxleGlz
IEV5cmF1ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCA1IC0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
DQo+IGluZGV4IDg0NWZkOGFhNDNjM2M5MTY1OTgwOGQ5ZTZiYjc4NzU4ZDFmOWI4NTcuLjBhYzRl
NzU1YmRmOGFhY2U3NjZmZWZmYTU3NzEyYThmYmY0ZmY3OTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBAIC0xMzQ5LDExICsxMzQ5LDYgQEAgc3RhdGljIGludCBt
dGtfaGRtaV9nZXRfY2VjX2RldihzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWMNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpjZWNf
cGRldjsNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNlY19ucDsNCj4gLSAgICAgICBp
bnQgcmV0Ow0KPiAtDQo+IC0gICAgICAgcmV0ID0gbXRrX2hkbWlfZ2V0X2FsbF9jbGsoaGRtaSwg
bnApOw0KPiAtICAgICAgIGlmIChyZXQpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsNCj4gDQo+ICAgICAg
ICAgLyogVGhlIENFQyBtb2R1bGUgaGFuZGxlcyBIRE1JIGhvdHBsdWcgZGV0ZWN0aW9uICovDQo+
ICAgICAgICAgY2VjX25wID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQobnAtPnBhcmVudCwgIm1l
ZGlhdGVrLG10ODE3My1jZWMiKTsNCj4gDQo+IC0tDQo+IDIuNTAuMQ0KPiANCg0K

--__=_Part_Boundary_002_32068506.1736490369
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDgtMDgmIzMyO2F0
JiMzMjsxMjoxMiYjMzI7KzAyMDAsJiMzMjtMb3Vpcy1BbGV4aXMmIzMyO0V5cmF1ZCYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8m
IzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVu
dHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3Nl
bmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtJbiYjMzI7bXRrX2hkbWkmIzMyO2RyaXZlciwmIzMyO3doZW4mIzMyO3RoZSYjMzI7
Q0VDJiMzMjtkZXZpY2UmIzMyO3BhcnNpbmcmIzMyO2xvZ2ljJiMzMjt3YXMmIzMyO21vdmVkJiMz
Mjtmcm9tDQomZ3Q7JiMzMjttdGtfaGRtaV9kdF9wYXJzZV9wZGF0YSYjMzI7ZnVuY3Rpb24mIzMy
O3RvJiMzMjt0aGUmIzMyO25ldyYjMzI7bXRrX2hkbWlfZ2V0X2NlY19kZXYmIzMyO3N1Yg0KJmd0
OyYjMzI7ZnVuY3Rpb24sJiMzMjt0aGUmIzMyO2NhbGwmIzMyO3RvJiMzMjttdGtfaGRtaV9nZXRf
YWxsX2NsayYjMzI7d2FzJiMzMjtrZXB0JiMzMjtpbiYjMzI7Ym90aCYjMzI7ZnVuY3Rpb25zLA0K
Jmd0OyYjMzI7d2hlcmVhcyYjMzI7aXQmIzMyO3dhcyYjMzI7b25seSYjMzI7Y2FsbGVkJiMzMjtv
bmNlJiMzMjtpbiYjMzI7dGhlJiMzMjtvcmlnaW5hbCYjMzI7bXRrX2hkbWlfZHRfcGFyc2VfcGRh
dGENCiZndDsmIzMyO2NvZGUmIzMyO2FuZCYjMzI7ZG9lcyYjMzI7bm90JiMzMjtuZWVkJiMzMjt0
byYjMzI7YmUmIzMyO2NhbGxlZCYjMzI7YSYjMzI7c2Vjb25kJiMzMjt0aW1lLg0KJmd0OyYjMzI7
U28sJiMzMjtyZW1vdmUmIzMyO3RoaXMmIzMyO2NhbGwmIzMyO2Zyb20mIzMyO210a19oZG1pX2dl
dF9jZWNfZGV2JiMzMjt0byYjMzI7a2VlcCYjMzI7dGhlJiMzMjtzYW1lJiMzMjtzZXF1ZW5jZQ0K
Jmd0OyYjMzI7YXMmIzMyO3ByZXZpb3VzbHkuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1
JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0Zp
eGVzOiYjMzI7NzQ4NWJlOTY3ZjdmJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7bXRrX2hk
bWk6JiMzMjtNb3ZlJiMzMjtDRUMmIzMyO2RldmljZSYjMzI7cGFyc2luZyYjMzI7aW4mIzMyO25l
dyYjMzI7ZnVuY3Rpb24mcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7TG91aXMt
QWxleGlzJiMzMjtFeXJhdWQmIzMyOyZsdDtsb3Vpc2FsZXhpcy5leXJhdWRAY29sbGFib3JhLmNv
bSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyYjMzI7fCYjMzI7NSYjMzI7LS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7
ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7
aW5kZXgmIzMyOzg0NWZkOGFhNDNjM2M5MTY1OTgwOGQ5ZTZiYjc4NzU4ZDFmOWI4NTcuLjBhYzRl
NzU1YmRmOGFhY2U3NjZmZWZmYTU3NzEyYThmYmY0ZmY3OTEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7
LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMyO0BA
JiMzMjstMTM0OSwxMSYjMzI7KzEzNDksNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjtt
dGtfaGRtaV9nZXRfY2VjX2RldihzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSwmIzMyO3N0
cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7c3RydWMNCiZndDsmIzMyOyYjMzI7ew0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
cGxhdGZvcm1fZGV2aWNlJiMzMjsqY2VjX3BkZXY7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtkZXZpY2Vfbm9kZSYjMzI7KmNlY19u
cDsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2ludCYjMzI7
cmV0Ow0KJmd0OyYjMzI7LQ0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7cmV0JiMzMjs9JiMzMjttdGtfaGRtaV9nZXRfYWxsX2NsayhoZG1pLCYjMzI7bnApOw0K
Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQp
DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtkZXZfZXJyX3Byb2JlKGRl
diwmIzMyO3JldCwmIzMyOyZxdW90O0ZhaWxlZCYjMzI7dG8mIzMyO2dldCYjMzI7Y2xvY2tzJiM5
MjtuJnF1b3Q7KTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOy8qJiMzMjtUaGUmIzMyO0NFQyYjMzI7bW9kdWxlJiMzMjtoYW5kbGVz
JiMzMjtIRE1JJiMzMjtob3RwbHVnJiMzMjtkZXRlY3Rpb24mIzMyOyovDQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2VjX25wJiMzMjs9JiMzMjtvZl9n
ZXRfY29tcGF0aWJsZV9jaGlsZChucC0mZ3Q7cGFyZW50LCYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4
MTczLWNlYyZxdW90Oyk7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjUwLjEN
CiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_32068506.1736490369--

