Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE3D8C73B6
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 11:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7DD10E126;
	Thu, 16 May 2024 09:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="q78Cp+wU";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fC/8YJkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C510E126
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 09:23:22 +0000 (UTC)
X-UUID: ebe9706e136511efb92737409a0e9459-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=dpLxCbNbmogoVEr3aS1RDexCew4E5Zjds3wpcGQSS+4=; 
 b=q78Cp+wUGvs9YYanhK3eAEuPZYTnr5EO29rtFfrjHUICwWpSq6RXerf+E4cFUvUO6CXSDkDMvTAUKx731UOLeqRPXd8sAw+Bs69gw2OF5VpC81AmkmNJ5bYc/r+JAO0uzuwQVOLaNWAN+XflnXVryIGqS1hiYnfHPB7EEKHgmt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:766542ff-722f-4c3f-aba1-4b6f8a9cf831, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:36ba6e87-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ebe9706e136511efb92737409a0e9459-20240516
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2087284064; Thu, 16 May 2024 17:23:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 02:23:13 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 17:23:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7GSOMBCiIT+8I2q0lAkB0+NVnOl5MerqSqnNWjcFXfqyYyJzx1NgxkZ1G9ET60OlnMm7P1r66ECbSTSLziRgSLLv+WfroxOpFHVynKrQm1A2yjOIwhw5pwQu9pbVvs3xqYMDWugPDWbd1fCAaOP4FdsxFAkaCvCEXxa07ikOeHjkU7SZAj3ubqqGo8V3M5QdGKA2fUtbgQF+4kSi5t1zm2/EPCD1wdmDY38ZN4PoAEygnugGnIl8h/Anegq1nfjyYhHbCA5X2LfkBIXiYhukXPRe9HTHXFabb2o2Bzxj/TWILmxGrLhAfA/yt97kUHxnvQSviSaA7pEYdM9VwWItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBWlcRVV8a/lHykfbIUF6ycDnLhdfKsJBwUNXBz2gOk=;
 b=F1lKdQfu/OP+UZg/evhC/No9U2xTE3Hr/rbHFWr/qHIZTZNmZxQIxVaFNHHNBP+zfYp2bHUe6rkWMl/h84+2ZjPKWL8KFGUKFWbxA0Ypb51WjGyHgcrApLmOWozGDw5hF4j8xXaDvLRhED0g0hNRteUBjq914lOD219dBc2eWdf7/fShFAH4RtXGx98PTosbNQjlMnVDps1sJXPwxZmm9pE8rfnxYF+pxcVEHM0ckiS5KO0vzbchS+HG0EOuNd8sCROfrpdVniJsHoEpjsfn8NgD4YmSJxI9ha5KwHE5oGOgtGKctsIQEvA+7URo1bJzgPHktR+idPmTpKrD5BGqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBWlcRVV8a/lHykfbIUF6ycDnLhdfKsJBwUNXBz2gOk=;
 b=fC/8YJkAzMQkp8+zU9MpAYHOU6t1A8c5lH4Bl1DwmqDdaHol3RQ6Pv+kCiMcKe4SeJO65ynAlhthMKWrJ9kx+RgK7bRFka41VFyjvm9bRiG3k1jk8eTOYrmSr5x9xRj2HNtRNIWepABkTJGN0euHHAwwIhHQQLR/DZw+bfjA3VA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7168.apcprd03.prod.outlook.com (2603:1096:101:d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 09:23:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7587.026; Thu, 16 May 2024
 09:23:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?=
 <Yu-chang.Lee@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Thread-Topic: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Thread-Index: AQHap2i1qnONRvG1REyaGCPv7RPWILGZloIA
Date: Thu, 16 May 2024 09:23:09 +0000
Message-ID: <389716757b2a79f56b3cf4f4127549795c867785.camel@mediatek.com>
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7168:EE_
x-ms-office365-filtering-correlation-id: baafc2dd-34f3-4f79-e2ec-08dc7589cd63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|7416005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?K0wwNVk1WXRMMEw5bHZ1OHViU0NGWlpBUjNTc0IvVzU3YWVEcEdmRHoyZFZH?=
 =?utf-8?B?aEFYcFJGZURrK081NzFCaE4vaktucXJqSitHdDIzM3BRRWk4NklrZGNkREhQ?=
 =?utf-8?B?SmE3MUpBM2tISlJTNno1NjRzcHlRUWJIQTFST0tGcGFzcnozVmVubW1lQ25L?=
 =?utf-8?B?Y1JmaGRiaWZmSCs3c0s0L2Y4RzZVekdGUUQrVjQ3NlhoMU1kOXpyTnNZVWxy?=
 =?utf-8?B?R3pUU2NFOFBhSkRnamFEdUFzR2hlSUVVUTJBNmM5Nnl0OWdMd29uS1hna09M?=
 =?utf-8?B?aU9ZR0tERHdqVkhmejhNQmtUV1VUMzh3aVY3NmFMR3RBdDZQeTU1YXI3Zngx?=
 =?utf-8?B?dXlRbVlFdStVTlFuVGNMK2ovT3Fma3RESy82ZTFESHlOSkdMZ1JPTnRJMHI4?=
 =?utf-8?B?Q09rL0dsOVg0Vi9GaTFaN3pYME9hd3Y2VGFQL2thNSt3bzdEYjF4MHc5R0lz?=
 =?utf-8?B?c3VGS2ZTS2NjTDhVeXVOMmozWWxRTldHT2NrdnhnQUlxNTFmenFwdXJDY1Aw?=
 =?utf-8?B?UlU2bWNxKzR6WFdBL1FuWDhXZXh2U015WGlFV3JQNFZkK29ycXowWmJpMkd5?=
 =?utf-8?B?dUZQU2lhLzBiTGk5MUhsYk9yeWZERlh5Y0RhaGhhM0R4K204b3NEamd0QVp3?=
 =?utf-8?B?UUtGajJhTzJUc3R6a0IrTEZXbE5yTzl5dnNOejAyTjJJdkxaa0RCQnk5cVAw?=
 =?utf-8?B?TEd4WW1acTM5ay9QdVZmLzdXYitCV1RrUUVtdTdHWC9SREFmRklPVUJ5cGVF?=
 =?utf-8?B?bXZnOWpmWUk2QkdoVzk1bnFKM3huR3I4WHE1SDdGMlJ0S04zTjJTUGhSMysr?=
 =?utf-8?B?bUZjeDhpSElnMFhGNXF6bkdDUUxXb1ZKb1QwWDlFcFM3aVNZd1R0cWFpQ0w3?=
 =?utf-8?B?SnJSOEVHNCtsaE40N1VrUGNGZXJ0NTAyMndTemN2MldsSDkrZ2k5VmhxTVFp?=
 =?utf-8?B?SGo5dC9HYUt0bzFtcko4UFVRdWY3a1h4VWhDb3FuNExwc0F6Q1hMRzdoSEpa?=
 =?utf-8?B?dnFPQWVSU2IrL0g3T3hHbW9lUGRud090WDVtMUo2OGZUcDVJb1FNTytXbUV4?=
 =?utf-8?B?Zk5LSkYrR3lHNGtuaG0ydEdtSm14RkVudCswR2Q3NTdCN3pQM0lnb3BRTSt1?=
 =?utf-8?B?RlVHQVJpQmxPZzg3VGxwTDBPM0RBSng1SkRHMWVYU0dqUUJKRzMweWkyWVpB?=
 =?utf-8?B?Q1F3K2JwNW1TZHJOeHV0U0puSGFYOEwrT0tvaTBGdkFCMDl4VTQxcVhLQTF3?=
 =?utf-8?B?NnJFMFgzNmV3SGZLVkNwN21OUEF5b0ZwNDVwL0RsMFRGOTE5T2xybUFTcDU1?=
 =?utf-8?B?cjVmK25waUtCYVlUOTY3Nmxjd0xEeFRFUENpTEhxSGtJZEIwRmtsRXI3Z3Fq?=
 =?utf-8?B?NDlxT05DUCt0S2pNTVphUEFqZ3FXRldjUDk1OWd5aU8yOEVxY3gwaW5kd29p?=
 =?utf-8?B?TFNwcmJGZjJDdndKUlFnQ0FnTzlDTXJSZzkwWHVMT1dXcXJxSTNMa09tZjh4?=
 =?utf-8?B?aEp5eEl0S2VmbkY4UHQ1M3BpTW9jYU1vN2RlNmlibndvYWdTeFNtTkRvL2N4?=
 =?utf-8?B?KzZtUmYrSTJhN3FJT0hwakFMNFg4MUYvT0VMelptQUJxRUE1WGNKT0hCSFpl?=
 =?utf-8?B?WHIvY3lDN3M1QmNzY2xwL2JyU3JSWXlZVkFSRlo5cVdRUnBjTmhuS2pBcWpB?=
 =?utf-8?B?bzU2SzQ5blRxWEF0bUtYV0dFVTl6dTd4Y1J2SlAybTFkR3ZoTUcyRmp1N0dm?=
 =?utf-8?B?UkJEYzNvS2VoRGpTU2RiNEErOFMzeEhZVDFkdnBNVTBuc1JtK0o3bVhMVTkr?=
 =?utf-8?B?dzBWWDZBWDRiTlQySWsydz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MytTM002d3ZwYktVSWtjQ3Y1V2JtVzFkWkZ2bC8rQnJHWVgxdk9vQ1h0RXV2?=
 =?utf-8?B?SkZzYjRQSm9VV0lNQllpMmZyVTc1MFFkcHBHQWN1L3JsUlhjbkd5WEFPaGZ3?=
 =?utf-8?B?TDNPb0VtUXRFVGZYNVlSWldlK3ZKY0JmeVNaL2Jud3IxWmJVd3pqRlMrTlJ0?=
 =?utf-8?B?OE1ONE9iRTBkemNpSEJ6ZVpvblcwcGRHa0tBRkk3MmdTTStoS3VLRUZCYXN2?=
 =?utf-8?B?NWhMNzFCMXRIVFlOTjNUZmRvcTNuWUtZL3JIWU1RcktlZEpaSWlTTG5vTnVV?=
 =?utf-8?B?SzhqdWt0dWtHdFZrcUhOczlNNXJTeTBKRUhxU1lQVHdSZDBLU2VFcmVRMy9h?=
 =?utf-8?B?aHg1cW9nanVMNUdzaHlYSXhBYzUxZ3c1TlhZZENkdlNmdXlCNEhTTER0eEx1?=
 =?utf-8?B?ZTBqODMrRXNpYVhoTWJONEdQNnV6NEgxb2RpY01sUkxhZnZ1UE9KZzBJUlpY?=
 =?utf-8?B?M0RUcGI3eEtrS2EwSEhNcmRFOEtjVHR5a3VXd2orUWN5ZzI5REJPYnNJcU5X?=
 =?utf-8?B?V0EwTE14eWdZTGhZeldSdGlWVmM0Tk1kWDdmQTVlL1FoSElhTmJod0VkdXEv?=
 =?utf-8?B?OTVpMUtUVXNpazRXQnV0Y3RqV29oNThoeFh3dDUrMHNQdkl1dVFDNi9iY1NV?=
 =?utf-8?B?T2NVUmJYazlaZU5nR3h2ZXA3TzQ4UzhMSzNrMnNDOHEzK0lqZ3VyY3JJL2Z6?=
 =?utf-8?B?dTNwR2Zyd0NDcC84OEFQTWREaXUrS1pWbHBkQXdXNWprZUZQeTN5Y0NJVHhI?=
 =?utf-8?B?bXRwNW5HTkNqS2o4aEZQWStxL1lVT3FuUlhud2QyQmcrYlVjMkczK1EwYm42?=
 =?utf-8?B?VmhjZHdTQ2YxNVdlNVRZb0dDRHRFVGNNeHdGRExJdEZDUmVmSGpIRExkMU9j?=
 =?utf-8?B?cHNPcGNHMVd1Nlg3U2xaL3lWZlM4ZUlnd3NCT0xvWURtTkFUSUcvUEZmWjFH?=
 =?utf-8?B?RUY0R3RLQTNmb2NWWW9LcWprTHMyNkt5RGZjKzhFb2VtMml1WmpmUWdOU1ZT?=
 =?utf-8?B?ZTRBQ09uUlEwT2IvN3A1clZmSlBGbkxMMHgrM0MzVkt2UUFxNDlWMGlaZVBL?=
 =?utf-8?B?Z2VTME5qbzRPdzRGYU14eGVrSllTRHRUWTZNbkVwUlFjUTE1Y1RQKzBNZkVl?=
 =?utf-8?B?UHFlOXg4d3pUamtLY2NjcS84WUJaMW92eTRpWFBPdGdJM0l4STByRVJDUGxL?=
 =?utf-8?B?WnRicUJidWFrWm1hNlFLZ3I2MjhwR3FEdUljd2gwSzk1a0VrZk1rSEdMMU1l?=
 =?utf-8?B?MnhSUmorK3dVSk96VWE1OEZoK1c4K3pzQXoyM2xLbjRRVm8vYzZsaUxLaFRY?=
 =?utf-8?B?WnBJUVZiM3FQOHQvaC9hSUIvL3p6eVpYWlQrOXlmTEpvbVpBa25Db0sraDU0?=
 =?utf-8?B?eW9ack1vL3puVDJXd0VJVTFpSytzVkliS1Jhc3NnOHl5QzRYcktKc2t1dXBl?=
 =?utf-8?B?a0I1cnRyOVIxUnlkakZxWDAyWXlnekNvZS85TFVnQzJKV3EvWEpodURha0Va?=
 =?utf-8?B?d3dYR3ZUUmhDMWtzN0JsSVlOK1hrak9QTnhOMWp0TWtxbFZlV3NOME9UUWpu?=
 =?utf-8?B?U2JiL3hldHI4bExZM0dIMmY0Y0hJSzdmMTJlM3A5OUJtdVJRUEJtUFBXbUts?=
 =?utf-8?B?bkhGNHpwREJtMytCd2t4WEZBNkZueko3UkpNcWRidWpyZjBOdC8rSGEzMmo2?=
 =?utf-8?B?WnJvQzhEUzdsZkh5NnE4WGlUdEM4YmZiNlprZ244dVFKdk0vRmdZYytIdlJy?=
 =?utf-8?B?NmtwOWt0TFErcTBNR3lSdWkvMjd6YWFKUjUzSTl4LytvWEtkd0IrQjhHcTNh?=
 =?utf-8?B?RnA2azFtQUxMRUFKUE8vQjBNcTJ6dFNDTzNmT1EydFEvRkJKM3lpamFISjB2?=
 =?utf-8?B?dDRnemhWVTRuL1dCeWtpdHBKTzlITlAwZUliMmNwdk1MNC81WDhzOTZoVitu?=
 =?utf-8?B?SnpzV09LS1ZMWjRGYTM2WjRmTjl4Y003UlhBb2NObHA5TldxQkZrWUc4RkF0?=
 =?utf-8?B?TmxHaSs4dUNLY05vZFRkR201Zlg0dGtuVjIzTWd4Q0xKYmpycGtzVFdSVmxz?=
 =?utf-8?B?aTBKNW4xaDdBNnZqMVBIamg3UGxzK0tFdXd2NUNaQmtTL2xJKzBGZlFmaW9R?=
 =?utf-8?Q?rOU1jinbG/A3kEAuqESfPD3h+?=
Content-ID: <EB669B979850E742922B8D2BDB1307CC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baafc2dd-34f3-4f79-e2ec-08dc7589cd63
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 09:23:09.6424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGaVFDxu50YaDVxH7oIGH/J4g5dN0UxscdxhYzRWeoNmtItj+CllAB6V9KIaF9uU4lxZuK5a0qyui7oCm1nKuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7168
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1532375749.611101582"
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

--__=_Part_Boundary_007_1532375749.611101582
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTA1LTE2IGF0IDEwOjExICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRG9jdW1lbnQgT0YgZ3JhcGggb24gTU1TWVMv
VkRPU1lTOiB0aGlzIHN1cHBvcnRzIHVwIHRvIHRocmVlIEREUCBwYXRocw0KPiBwZXIgSFcgaW5z
dGFuY2UgKHNvIHBvdGVudGlhbGx5IHVwIHRvIHNpeCBkaXNwbGF5cyBmb3IgbXVsdGktdmRvIFNv
Q3MpLg0KPiANCj4gVGhlIE1NU1lTIG9yIFZET1NZUyBpcyBhbHdheXMgdGhlIGZpcnN0IGNvbXBv
bmVudCBpbiB0aGUgRERQIHBpcGVsaW5lLA0KPiBzbyBpdCBvbmx5IHN1cHBvcnRzIGFuIG91dHB1
dCBwb3J0IHdpdGggbXVsdGlwbGUgZW5kcG9pbnRzIC0gd2hlcmUgZWFjaA0KPiBlbmRwb2ludCBk
ZWZpbmVzIHRoZSBzdGFydGluZyBwb2ludCBmb3Igb25lIG9mIHRoZSAoY3VycmVudGx5IHRocmVl
KQ0KPiBwb3NzaWJsZSBoYXJkd2FyZSBwYXRocy4NCj4gDQo+IFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFt
bCB8IDI4ICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sDQo+IGluZGV4
IGIzYzY4ODhjMTQ1Ny4uMGVmNjdjYTQxMjJiIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbWwNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRp
YXRlayxtbXN5cy55YW1sDQo+IEBAIC05Myw2ICs5MywzNCBAQCBwcm9wZXJ0aWVzOg0KPiAgICAn
I3Jlc2V0LWNlbGxzJzoNCj4gICAgICBjb25zdDogMQ0KPiAgDQo+ICsgIHBvcnQ6DQo+ICsgICAg
JHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ICsgICAgZGVzY3Jp
cHRpb246DQo+ICsgICAgICBPdXRwdXQgcG9ydCBub2RlLiBUaGlzIHBvcnQgY29ubmVjdHMgdGhl
IE1NU1lTL1ZET1NZUyBvdXRwdXQgdG8NCj4gKyAgICAgIHRoZSBmaXJzdCBjb21wb25lbnQgb2Yg
b25lIGRpc3BsYXkgcGlwZWxpbmUsIGZvciBleGFtcGxlIG9uZSBvZg0KPiArICAgICAgdGhlIGF2
YWlsYWJsZSBPVkwgb3IgUkRNQSBibG9ja3MuDQo+ICsgICAgICBTb21lIE1lZGlhVGVrIFNvQ3Mg
c3VwcG9ydCBtdWx0aXBsZSBkaXNwbGF5IG91dHB1dHMgcGVyIE1NU1lTLg0KDQpUaGUgZGlzcGxh
eSBwaXBlbGluZSBudW1iZXIgdXN1YWxseSBkZXBlbmQgb24gaG93IG1hbnkgZGlzcGxheSBpbnRl
cmZhY2UuIERpc3BsYXkgaW50ZXJmYWNlIGlzIGluIHRoZSBlbmQgb2YgcGlwZWxpbmUuDQoNCklu
IGJlbG93IGNhc2UsIHR3byBSRE1BIGlzIG1lcmdlZCBpbnRvIG9uZSBwaXBlbGluZSBhbmQgb3V0
cHV0IHRvIG9uZSBkaXNwbGF5IGludGVyZmFjZSBEUF9JTlRGLiBUaGlzIGlzIHVzdWFsbHkgT05F
IGRpc3BsYXkuDQoNClJETUEgLSsNCiAgICAgIE1lcmdlIC0+IC4uLiAtPiBEUF9JTlRGDQpSRE1B
IC0rDQoNCkluIGJlbG93IGNhc2UsIG9uZSBSRE1BIGRhdGEgb3V0cHV0IHRvIHR3byBkaXNwbGF5
IGludGVyZmFjZSBEU0kgYW5kIERQSS4gVGhpcyBpcyB1c3VhbGx5IFRXTyBkaXNwbGF5IHdpdGgg
dGhlIHNhbWUgY29udGVudC4NCg0KICAgICAgICAgICAgICAgKy0+IERTSQ0KUkRNQSAtPiAuLi4g
LT4gKw0KICAgICAgICAgICAgICAgKy0+IERQSQ0KDQpTbyB0aGUgZGlzcGxheSBwaXBlbGluZSBu
dW1iZXIgZG9lcyBub3QgZGVwZW5kIG9uIHRoZSBudW1iZXIgb2YgZmlyc3QgY29tcG9uZW50LiBJ
dCB1c3VhbGx5IGRlcGVuZCBvbiB0aGUgbnVtYmVyIG9mIGRpc3BsYXkgaW50ZXJmYWNlLg0KDQpS
ZWdhcmRzLA0KQ0sNCg0KDQo+ICsgICAgcHJvcGVydGllczoNCj4gKyAgICAgIGVuZHBvaW50QDA6
DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvZW5kcG9p
bnQNCj4gKyAgICAgICAgZGVzY3JpcHRpb246IE91dHB1dCB0byB0aGUgcHJpbWFyeSBkaXNwbGF5
IHBpcGVsaW5lDQo+ICsNCj4gKyAgICAgIGVuZHBvaW50QDE6DQo+ICsgICAgICAgICRyZWY6IC9z
Y2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvZW5kcG9pbnQNCj4gKyAgICAgICAgZGVzY3Jp
cHRpb246IE91dHB1dCB0byB0aGUgc2Vjb25kYXJ5IGRpc3BsYXkgcGlwZWxpbmUNCj4gKw0KPiAr
ICAgICAgZW5kcG9pbnRAMjoNCj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMv
cHJvcGVydGllcy9lbmRwb2ludA0KPiArICAgICAgICBkZXNjcmlwdGlvbjogT3V0cHV0IHRvIHRo
ZSB0ZXJ0aWFyeSBkaXNwbGF5IHBpcGVsaW5lDQo+ICsNCj4gKyAgICBvbmVPZjoNCj4gKyAgICAg
IC0gcmVxdWlyZWQ6DQo+ICsgICAgICAgICAgLSBlbmRwb2ludEAwDQo+ICsgICAgICAtIHJlcXVp
cmVkOg0KPiArICAgICAgICAgIC0gZW5kcG9pbnRAMQ0KPiArICAgICAgLSByZXF1aXJlZDoNCj4g
KyAgICAgICAgICAtIGVuZHBvaW50QDINCj4gKw0KPiAgcmVxdWlyZWQ6DQo+ICAgIC0gY29tcGF0
aWJsZQ0KPiAgICAtIHJlZw0K

--__=_Part_Boundary_007_1532375749.611101582
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTA1LTE2JiMzMjthdCYjMzI7MTA6MTEmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtEb2N1bWVudCYjMzI7
T0YmIzMyO2dyYXBoJiMzMjtvbiYjMzI7TU1TWVMvVkRPU1lTOiYjMzI7dGhpcyYjMzI7c3VwcG9y
dHMmIzMyO3VwJiMzMjt0byYjMzI7dGhyZWUmIzMyO0REUCYjMzI7cGF0aHMNCiZndDsmIzMyO3Bl
ciYjMzI7SFcmIzMyO2luc3RhbmNlJiMzMjsoc28mIzMyO3BvdGVudGlhbGx5JiMzMjt1cCYjMzI7
dG8mIzMyO3NpeCYjMzI7ZGlzcGxheXMmIzMyO2ZvciYjMzI7bXVsdGktdmRvJiMzMjtTb0NzKS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtNTVNZUyYjMzI7b3ImIzMyO1ZET1NZUyYjMzI7
aXMmIzMyO2Fsd2F5cyYjMzI7dGhlJiMzMjtmaXJzdCYjMzI7Y29tcG9uZW50JiMzMjtpbiYjMzI7
dGhlJiMzMjtERFAmIzMyO3BpcGVsaW5lLA0KJmd0OyYjMzI7c28mIzMyO2l0JiMzMjtvbmx5JiMz
MjtzdXBwb3J0cyYjMzI7YW4mIzMyO291dHB1dCYjMzI7cG9ydCYjMzI7d2l0aCYjMzI7bXVsdGlw
bGUmIzMyO2VuZHBvaW50cyYjMzI7LSYjMzI7d2hlcmUmIzMyO2VhY2gNCiZndDsmIzMyO2VuZHBv
aW50JiMzMjtkZWZpbmVzJiMzMjt0aGUmIzMyO3N0YXJ0aW5nJiMzMjtwb2ludCYjMzI7Zm9yJiMz
MjtvbmUmIzMyO29mJiMzMjt0aGUmIzMyOyhjdXJyZW50bHkmIzMyO3RocmVlKQ0KJmd0OyYjMzI7
cG9zc2libGUmIzMyO2hhcmR3YXJlJiMzMjtwYXRocy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2
aWV3ZWQtYnk6JiMzMjtSb2ImIzMyO0hlcnJpbmcmIzMyOyhBcm0pJiMzMjsmbHQ7cm9iaEBrZXJu
ZWwub3JnJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8m
IzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7Li4uL2JpbmRpbmdzL2Fy
bS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sJiMzMjt8JiMzMjsyOCYjMzI7KysrKysrKysr
KysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7Mjgm
IzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMy
O2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxtbXN5cy55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbA0KJmd0OyYjMzI7aW5kZXgmIzMyO2IzYzY4ODhj
MTQ1Ny4uMGVmNjdjYTQxMjJiJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlh
bWwNCiZndDsmIzMyOysrKyYjMzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbWwNCiZndDsmIzMyO0BAJiMzMjstOTMsNiYj
MzI7KzkzLDM0JiMzMjtAQCYjMzI7cHJvcGVydGllczoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzk7I3Jlc2V0LWNlbGxzJiMzOTs6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7Y29uc3Q6JiMzMjsxDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjtwb3J0
Og0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzNjtyZWY6JiMzMjsvc2NoZW1hcy9n
cmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMy
O2Rlc2NyaXB0aW9uOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO091
dHB1dCYjMzI7cG9ydCYjMzI7bm9kZS4mIzMyO1RoaXMmIzMyO3BvcnQmIzMyO2Nvbm5lY3RzJiMz
Mjt0aGUmIzMyO01NU1lTL1ZET1NZUyYjMzI7b3V0cHV0JiMzMjt0bw0KJmd0OyYjMzI7KyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3RoZSYjMzI7Zmlyc3QmIzMyO2NvbXBvbmVudCYjMzI7
b2YmIzMyO29uZSYjMzI7ZGlzcGxheSYjMzI7cGlwZWxpbmUsJiMzMjtmb3ImIzMyO2V4YW1wbGUm
IzMyO29uZSYjMzI7b2YNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt0
aGUmIzMyO2F2YWlsYWJsZSYjMzI7T1ZMJiMzMjtvciYjMzI7UkRNQSYjMzI7YmxvY2tzLg0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO1NvbWUmIzMyO01lZGlhVGVrJiMz
MjtTb0NzJiMzMjtzdXBwb3J0JiMzMjttdWx0aXBsZSYjMzI7ZGlzcGxheSYjMzI7b3V0cHV0cyYj
MzI7cGVyJiMzMjtNTVNZUy4NCg0KVGhlJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZSYjMzI7bnVt
YmVyJiMzMjt1c3VhbGx5JiMzMjtkZXBlbmQmIzMyO29uJiMzMjtob3cmIzMyO21hbnkmIzMyO2Rp
c3BsYXkmIzMyO2ludGVyZmFjZS4mIzMyO0Rpc3BsYXkmIzMyO2ludGVyZmFjZSYjMzI7aXMmIzMy
O2luJiMzMjt0aGUmIzMyO2VuZCYjMzI7b2YmIzMyO3BpcGVsaW5lLg0KDQpJbiYjMzI7YmVsb3cm
IzMyO2Nhc2UsJiMzMjt0d28mIzMyO1JETUEmIzMyO2lzJiMzMjttZXJnZWQmIzMyO2ludG8mIzMy
O29uZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7b3V0cHV0JiMzMjt0byYjMzI7b25lJiMzMjtk
aXNwbGF5JiMzMjtpbnRlcmZhY2UmIzMyO0RQX0lOVEYuJiMzMjtUaGlzJiMzMjtpcyYjMzI7dXN1
YWxseSYjMzI7T05FJiMzMjtkaXNwbGF5Lg0KDQpSRE1BJiMzMjstKw0KJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7TWVyZ2UmIzMyOy0mZ3Q7JiMzMjsuLi4mIzMyOy0mZ3Q7JiMzMjtEUF9J
TlRGDQpSRE1BJiMzMjstKw0KDQpJbiYjMzI7YmVsb3cmIzMyO2Nhc2UsJiMzMjtvbmUmIzMyO1JE
TUEmIzMyO2RhdGEmIzMyO291dHB1dCYjMzI7dG8mIzMyO3R3byYjMzI7ZGlzcGxheSYjMzI7aW50
ZXJmYWNlJiMzMjtEU0kmIzMyO2FuZCYjMzI7RFBJLiYjMzI7VGhpcyYjMzI7aXMmIzMyO3VzdWFs
bHkmIzMyO1RXTyYjMzI7ZGlzcGxheSYjMzI7d2l0aCYjMzI7dGhlJiMzMjtzYW1lJiMzMjtjb250
ZW50Lg0KDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsrLSZndDsmIzMyO0RTSQ0KUkRNQSYjMzI7LSZndDsm
IzMyOy4uLiYjMzI7LSZndDsmIzMyOysNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOystJmd0OyYjMzI7RFBJ
DQoNClNvJiMzMjt0aGUmIzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5lJiMzMjtudW1iZXImIzMyO2Rv
ZXMmIzMyO25vdCYjMzI7ZGVwZW5kJiMzMjtvbiYjMzI7dGhlJiMzMjtudW1iZXImIzMyO29mJiMz
MjtmaXJzdCYjMzI7Y29tcG9uZW50LiYjMzI7SXQmIzMyO3VzdWFsbHkmIzMyO2RlcGVuZCYjMzI7
b24mIzMyO3RoZSYjMzI7bnVtYmVyJiMzMjtvZiYjMzI7ZGlzcGxheSYjMzI7aW50ZXJmYWNlLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtwcm9wZXJ0
aWVzOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2VuZHBvaW50QDA6
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzY7
cmVmOiYjMzI7L3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9lbmRwb2ludA0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZXNjcmlwdGlvbjom
IzMyO091dHB1dCYjMzI7dG8mIzMyO3RoZSYjMzI7cHJpbWFyeSYjMzI7ZGlzcGxheSYjMzI7cGlw
ZWxpbmUNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtlbmRwb2ludEAxOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvZW5k
cG9pbnQNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
ZGVzY3JpcHRpb246JiMzMjtPdXRwdXQmIzMyO3RvJiMzMjt0aGUmIzMyO3NlY29uZGFyeSYjMzI7
ZGlzcGxheSYjMzI7cGlwZWxpbmUNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtlbmRwb2ludEAyOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwj
L3Byb3BlcnRpZXMvZW5kcG9pbnQNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7ZGVzY3JpcHRpb246JiMzMjtPdXRwdXQmIzMyO3RvJiMzMjt0aGUmIzMy
O3RlcnRpYXJ5JiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7b25lT2Y6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7LSYjMzI7cmVxdWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtlbmRwb2ludEAwDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVxdWlyZWQ6DQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMz
MjtlbmRwb2ludEAxDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYj
MzI7cmVxdWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjstJiMzMjtlbmRwb2ludEAyDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsm
IzMyO3JlcXVpcmVkOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7Y29tcGF0aWJsZQ0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVnDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48
L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_1532375749.611101582--

