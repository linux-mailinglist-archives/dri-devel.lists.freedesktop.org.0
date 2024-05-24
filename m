Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A48CE090
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 07:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79710E00B;
	Fri, 24 May 2024 05:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FCm2Kzc3";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DT+r2Att";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A002E10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 05:21:59 +0000 (UTC)
X-UUID: 8725ee86198d11efbfff99f2466cf0b4-20240524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uF+7heykEghbFraPi/8HNTmrRYOVzaP3QdpXzejc3lc=; 
 b=FCm2Kzc3nQmO1ywZLms6OrxkQ+8x1RSrdb0YKSDYD7ATIhQ5NO0LRsLxx9AHhzcRYfwaoaCmowe3/HKPzRF1AM7cVgOJ6Hbw2DE6KZuKF73ilYH59/g1I/rMgqNlb1go6n5V2NoxmhXLSPHEwTkWlw5L2SIp/+ThRdSEh8RsItQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:a3cbf686-8537-415a-934f-16c039861849, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:84b6c187-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8725ee86198d11efbfff99f2466cf0b4-20240524
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 129338428; Fri, 24 May 2024 13:21:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 May 2024 13:21:50 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 May 2024 13:21:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCiN9lsJKRmztW7lMrtZBDFDmKNKC7e+qik/eoQrceoNNkBNE8qSI7e/2dRk/pSyX3GsPZK+5UsyQKWE0S2KA3lPW4VVGmOGCp+NO1QNBZmouG4NvXfVkvjP39FvMxSb/uNzEKJQKB0t8RR3Y8Oo3T8YDnLES9qi3S+f59vhgKIGPA1OjgllWyIKg2ed+5qajFMCK7y9wkhyMENXAmAA4IVlfO8Vk9L/hKmfqadwpHKyAT+0lkXKB5M6jktSGLPECj+utvg29FdasH/nMFZnKN+gD5Ft87Q5LqT4uSTMXSSCNTRu7qVEpBQM5aZw2FdBSLlvwY66qCUff+xN+ryaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+UWhJBvg1aqlXedG52M26h3wlioEw7rQmJx2IYnxbA=;
 b=j1JWjabedoZbfp62KIklnl1QFtthTTF5SlPmF9VsRDS0ocrC1279jamuzAqKqTHsLg05H/lJYgFNhsWUksvAyYEGnlcPbeH5MnViq2dHkN0kr5K11RYnOprrjQR/WLo0WbuLGv9+YyTswQ0nRcjggZdFdgUGPciThKgCnJNEttzppPZEtO1ng0x4J8t9YEfS59eEkv3HVCmLeK1cM9ZfNyRTT4AnBEBFDou6z0kbFGMqeoxOmzz8e1aO22DqXOpAcEnpt7w0WOAvJlSw+dWh2L1EH+2ypvx8AyQx9XiWJnE9IUooA8hCc8Rh3KHp1giULz/ePnw4Be5NUJsXVZMqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+UWhJBvg1aqlXedG52M26h3wlioEw7rQmJx2IYnxbA=;
 b=DT+r2AtttPkqcEDtBH1mJszFBtc/LtRax6EmkCMk5YCpufVvTXVu4ys4kQosHn1vzvPG9Wpsb7tGbR2E9dP4I+8n9jqZb7Lhqm5Np+DrwwxmDhGI8tydfVGvJjIvdsEDZzhH6mkfE9Dgx5/9HKE8tDsUgxlhMSQAQVQ9heGkwzw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7083.apcprd03.prod.outlook.com (2603:1096:400:342::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Fri, 24 May
 2024 05:21:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 05:21:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "amergnat@baylibre.com" <amergnat@baylibre.com>,
 "robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "will@kernel.org"
 <will@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 02/15] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Thread-Topic: [PATCH v4 02/15] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
Thread-Index: AQHarQ+vARzkp6UMqkKQDIk8RIjBsLGl2myA
Date: Fri, 24 May 2024 05:21:48 +0000
Message-ID: <c983a57452d871975c8c8d9d607e82a42b43e2ef.camel@mediatek.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-2-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-2-ed82eb168fb1@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7083:EE_
x-ms-office365-filtering-correlation-id: 1cfc689e-007b-4f56-14b9-08dc7bb1693c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|366007|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?cUFENExvYVpuZFFMMmxvKzl0YklIYTFRL3ZVdHFRNDlJaGpkR2hKVy9wOWQ1?=
 =?utf-8?B?VTIzZ3cxeTRRNzJDeURKdGpUbkRUK2xCS2FnNmV0Y3pSSkhvTmRCdTZQQ3Rx?=
 =?utf-8?B?a1VYbWVTUlA4eUVhWldXbmtnS2NwZmQxaUFzS0h3ZkFvMHFrNHA2Ni80TlhM?=
 =?utf-8?B?N2ZlaDl0bC9YRzFyWHpaY0xudWFGTWNaRmRFSWE5dmpEQlhVcGs0Y1lVYmpl?=
 =?utf-8?B?ZlY4eTFCZ29vWUphK00rdHY4d0NhOUQzNm1vcDRFNjNaODVNdldWYUM5RkIw?=
 =?utf-8?B?QkJEc09wMkJpOGFwbk45NGF1WG9iV0xSdVZaRCs2RHBGcnc0M0k5cUUweGwr?=
 =?utf-8?B?NStRUGJjZlZlS1BsM081Sld4dk4rdnRQQjBYUmNaUGZyMnlzMHd5ZFZ6SDNO?=
 =?utf-8?B?Z2xrMFFaM0ZGSncxbmVjNzhIZ1A5MGtVNU5wZVlTZzFnU0dqYWZqSXdyekhT?=
 =?utf-8?B?THJKeUZ2TURhWDJzVXE5eVI3ZE9BKzl5VDh5K0t5UTZMdlZSWlBTZ2ZNc250?=
 =?utf-8?B?QmpFdzlqOHpqeHFEMXBoNHBXU09YRkhDOXB1UVVQdngyTk92dlVFeU4valFo?=
 =?utf-8?B?bEwzWWVhazhrWnJobkdVM3hWZzUxc1ZDdmlMY0JCRVhlNE5Pb2UrNUVKcHVJ?=
 =?utf-8?B?MkFMTVBrdHpYYVpMRTEyU1Y4T0Q3aUhaWTROUUhNUUFLMnBXRUlQSk94UFdG?=
 =?utf-8?B?SkMveWhoemRaY3VjUnpnSVpiU0NuNWpYbE9kUU8vVVIrRDZCK245U1RmTGZB?=
 =?utf-8?B?ZnMrSldtNGZ0RDIwU3dPWWRTMGdxTWxFL0hHRVhZcExBUjhlTDh0VXFMSGJs?=
 =?utf-8?B?andHUHFKdUxqKzFxUGl1eTJGRnp4WkxZRmtGd2d4d0E5RUZDblFjTVRSRDNK?=
 =?utf-8?B?WXJKaXBqTnpyelg4SU10bFoxYkJsdTRDRWh6WW9rYS9kdzBzRXhwMElyR1Uw?=
 =?utf-8?B?MGI1YlBaOThod0tuOGxhOXRTdVBFSWZBTlppMS9YemF3TkxGV0xEbmd6RzNz?=
 =?utf-8?B?MjVMY1o1UVBVWlVpT3VFNytMSU1Wb21IT1pCTk1wZHRkYWFjdnAwTFpnMllG?=
 =?utf-8?B?enFUMTZtYkxYdjc2d1JJMHhZV3UxazMzdU5GbnFVRnVYMUNMVVkwQllzaTBF?=
 =?utf-8?B?dlZkdU5QT2FHNWdWSFdxMzVzYjZJWEJlOHFPc25xbVhNRHgyWVBhUFhPY25K?=
 =?utf-8?B?ZFRJTmJEcVJlWkM0Qks1U1VyOGwvS0NDVSt1dDJZSDhyMFQzLzZjUnRML2d0?=
 =?utf-8?B?dGM0d3IxS1VVR0thVmlWWmdTdkl1d1YxakxQUUNiam5uSUZRWlNqTkNiMXlW?=
 =?utf-8?B?NGdsQzdiMlhQM0V2MVRmeW1yNVhuY0JSdS9JTUZXd3dTTHNRMkdVUDIrMnZ0?=
 =?utf-8?B?Qkc0VDJ4dmE4R1M5R0FwMU41TStXQjZuRDhBNmZ4cEd0T3BwS0E4L0NwK3h0?=
 =?utf-8?B?Vi9YR2tPY2JVRlFjR0ZGK05yR3FjRURaYWVmaEtHYUVxOUZEL2hyeTAySE1R?=
 =?utf-8?B?TGNib09VaFdxRkd1RXB0LzUxZHJGK2c0VFh6NkNWUFdxNFcxNHJGUGxKME5D?=
 =?utf-8?B?K1BzR0gzNmZ3R0N2Z2J2cFM2bTE0NGxsYmZrZEVyLytPcHFiUVpia0JzSXZt?=
 =?utf-8?B?ZFpSTXJ4eXJsY3VtM3hxLzM1cE0rZ3BCblVKS3BoR3hycHZVY0l2NkYrS0Fy?=
 =?utf-8?B?SmljZC9VNDJVRWhlL2Z2R09xK2ZmUUt0Rkc2cEQ2MVNWTHJDTzdBNFJXUmxF?=
 =?utf-8?B?MDdBZk9DRlovSS8yMlRDV2xaNWE3Q1ExTTdkb0VkWEdsbFcxRVpFU1BJdEEv?=
 =?utf-8?Q?Dw1weUpt/OHfxlLi8Fw36VseJyJj/9G2hCzIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUh4b3dCcU1takFyVkNFc29XOE1tOFE1YmRFek4ySnVUTGhPQW1KekduYStG?=
 =?utf-8?B?bWFrMUtFT2w0NlQzblRDM3Bwd04zckpQN1NPMWttcFBWc2xubEZKNlF4cmZn?=
 =?utf-8?B?MWNSZXFDSFZsekFqQythZmVzdlpWVENWN2w4Si9UMnkrQ20yem4rbWNBUXA5?=
 =?utf-8?B?cW9qRFlHcEo2UzZ6cFY5YUxHYnpOSUZib29hN3gwQ09EUGhRRnZScUJDOW5i?=
 =?utf-8?B?ZWliMDNKcXM0MWlDNzRGaEpwY3c5Q0Y0Rm5KNDlFZm5mZjljSUtlWG9PWFRt?=
 =?utf-8?B?cER0amUrc0NaTmVGT1BsVjZQYk9SQXpIRVRDM3NLcEJSaG1wTkszVmxENUZM?=
 =?utf-8?B?ZWhUcnkvYlI5OGNVWm5USGwvOCtTR0I5azY4RDZZUlc0U1E1NlJGWEhyS3hv?=
 =?utf-8?B?dHRwUGRnNW5PUkVlTURrcUtkeE0zbUFnQ0FldmxkZFEzSUVQZ0U1KzBXUWU1?=
 =?utf-8?B?VXNZTnYwcUk0Z25lTmx5dnJ3Z3liVlc1TmJabU1pWCtMUFhzSmQ4c1dONHFH?=
 =?utf-8?B?QzFTUEtyRHU3Q1ZHajVxaWdSQTUwdGVJUHYrUXdIaFdjTTVoQWtRbjJYdDRn?=
 =?utf-8?B?VWd0a3dvbEduNUQ3cVpnSEpRZWkxRVE3WktmZVJJVHRxOEo5OHptU000N0tJ?=
 =?utf-8?B?TzJ2TG4rWVNtUWJ0aXpZaWJUbDluTU9xYVpHQVBKMERKR1ZpbzBUMlVmZGdN?=
 =?utf-8?B?Z1dlVjRkSXFmWU9qTC95OVZVMjVJYkM5WFFnMnNIaEVKSjg1eXQwK0RSUW9m?=
 =?utf-8?B?NlpzRXZsZUpYT01xVFN6TXpjWFVYcXJkKzBwQmVzenVDbHBaS08zbjJFZVg0?=
 =?utf-8?B?eXRtbHhEK2VPL1huYzNOUVdpWkdTUWJLQU02R3FuR3kwZm43M2RWZmlRZVMr?=
 =?utf-8?B?dmVQYldLcmNWQlBZVW13eVZWWFYvYTVmY2JUOWcraCsrMlVqQnc1RGN2K2VN?=
 =?utf-8?B?WjhlT0dxNlpHMUVMY2o0dG5nOXpTVE9neUhCdTZoSURiNXF1cHZ3ZkJsVy82?=
 =?utf-8?B?N0ZUN2czYmhGekxET3ZpVFRpNEE0WEhUbmM5ZmpwQ2JRRmtOdmhjaTcrVmNZ?=
 =?utf-8?B?TUttVTlINkdrTzdRMnA1UUFISXVGY1lGYUo1OHIzRGtjRk9GMTRDSG9qcysy?=
 =?utf-8?B?SzBPWGZJS0VCd2t5c05sc2U4TXZwd0daUXREcXA1TldnaCt0NEpORGdRcEJw?=
 =?utf-8?B?QTBGdVU3aEVPamJyQnpWN2U5WW1SSEE0VVN2Wm9NY2J3dC9hZmRFR09pa0FO?=
 =?utf-8?B?clR0MXpHem5oZ1NGZFhrYzRZUDhBUGg3TExNR2FLNEF6clBZVVhjOWxVY3hR?=
 =?utf-8?B?em91SGY3QXZaczhNb2RyYUs2bFZidnVsVzNFMGdycTNrcWJRZUNFbWNKeGxZ?=
 =?utf-8?B?NlJRRVJHWWM2WFV4QVYrSTNUaTlnRnNxYTZhVHA4TmxqUEFJNHFSdWlsNGo0?=
 =?utf-8?B?aXFyVDRQeGEydnRsTFpRTVdpeFJDZ3JEc2pVd3VoYkRrcWMvaENpNk1UTUhv?=
 =?utf-8?B?YTM3cGZud3g4TFBtTFdSUko4SlBrb0RZVURWb3dHeVlSNUlEOEJQUFVYNXdh?=
 =?utf-8?B?Tk9WRHROTFA5RG1yV1VMMmtSZUYyYS9DNjRVUW9ja280ZCtWeGpyVUJUYXli?=
 =?utf-8?B?V1NndDhLK29QeHVETllmYTdjdTBqZG5XR0tqUTJ4NmlEMUkvdVF5Y2hpdzNK?=
 =?utf-8?B?SjFSdmF5ZThHd1dpRjh5YXhTbDJKdm0rWE9ZSTNtaDBEb05GcUxYcnhrY0Rp?=
 =?utf-8?B?R0pjMktiZmJxc3FPSzlRVXJ4TnZ6a1NXODhodHBWdENCc2tuUE10SGFXTGNa?=
 =?utf-8?B?bFhvaE9CZVRMbzdJKzdwRXA2LzFRS01LcXIzOHVGR1BkL0N1eWVnSjVVR0d5?=
 =?utf-8?B?U0NQQjBoWFpOcWRaQkg4TVc0WncyWkYzSWNnaVJGYW9oYkNPNzl5N1RtUXk1?=
 =?utf-8?B?cytPS052RXVvMm82WDM4YzYrMmxrVWlERVVWVm1hRm42Rlk2T0NON3lXc3pS?=
 =?utf-8?B?c3cxQjM2bWVNNGFsRmY2a3krcG01UXQ0c1pqbEEwOVVoRklkWk9WZCtPaG45?=
 =?utf-8?B?ejZOalFPTERiTTEreUtNVGxZd2dlOE9jSzlaNXY3STZQNklxSkNxbTlMSjFk?=
 =?utf-8?Q?WeRfSSLU7YP71UCU4p3bZbgMS?=
Content-ID: <4107EB1784E7AD48A8A69CBC74513D0A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfc689e-007b-4f56-14b9-08dc7bb1693c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 05:21:48.4521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y60/022ZvD/PutEz+yf6TMI+K39DwqxbR6+6XhowTyFC9vHVr2xGKOZoF4HU0zl45qRZbcw+ZR8DZH2L9WmB9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7083
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1654081820.429832846"
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

--__=_Part_Boundary_003_1654081820.429832846
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFsZXhhbmRyZToNCg0KT24gVGh1LCAyMDI0LTA1LTIzIGF0IDE0OjQ5ICswMjAwLCBBbGV4
YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlm
aWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBEb2N1bWVudCB0aGUgZGlzcGxheSBD
b2xvciBDb3JyZWN0aW9uIG9uIE1UODM2NSwgd2hpY2ggaXMgY29tcGF0aWJsZQ0KPiB3aXRoIHRo
YXQgb2YgdGhlIE1UODE4My4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3Jn
Pg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IE1lcmduYXQgPGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjY29yci55YW1s
IHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxjY29yci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY2NvcnIueWFtbA0KPiBpbmRleCA3MWVhMjc3YTVk
OGUuLmZjYThlN2JiMGNiYyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY2NvcnIueWFtbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxjY29yci55YW1sDQo+IEBAIC0yNCw2ICsyNCw5IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgICAt
IGVudW06DQo+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZGlzcC1jY29ycg0KPiAgICAg
ICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWRpc3AtY2NvcnINCj4gKyAgICAgIC0gaXRlbXM6DQo+
ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MzY1LWRpc3AtY2NvcnINCj4gKyAgICAg
ICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtZGlzcC1jY29ycg0KPiAgICAgICAgLSBpdGVt
czoNCj4gICAgICAgICAgICAtIGVudW06DQo+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTg2LWRpc3AtY2NvcnINCj4gDQo+IC0tIA0KPiAyLjI1LjENCj4gDQo=

--__=_Part_Boundary_003_1654081820.429832846
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbGV4YW5kcmU6DQoNCk9uJiMzMjtUaHUs
JiMzMjsyMDI0LTA1LTIzJiMzMjthdCYjMzI7MTQ6NDkmIzMyOyswMjAwLCYjMzI7QWxleGFuZHJl
JiMzMjtNZXJnbmF0JiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4
dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGlj
ayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMy
O3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7
dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtEb2N1bWVudCYjMzI7dGhlJiMzMjtkaXNw
bGF5JiMzMjtDb2xvciYjMzI7Q29ycmVjdGlvbiYjMzI7b24mIzMyO01UODM2NSwmIzMyO3doaWNo
JiMzMjtpcyYjMzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7d2l0aCYjMzI7dGhhdCYjMzI7b2YmIzMy
O3RoZSYjMzI7TVQ4MTgzLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2Nr
Lmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBY2tlZC1ieTomIzMy
O1JvYiYjMzI7SGVycmluZyYjMzI7KEFybSkmIzMyOyZsdDtyb2JoQGtlcm5lbC5vcmcmZ3Q7DQom
Z3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVn
bm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQom
Z3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QWxleGFuZHJlJiMzMjtNZXJnbmF0JiMzMjsmbHQ7
YW1lcmduYXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGNjb3JyLnlhbWwmIzMyO3wmIzMyOzMmIzMyOysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxl
JiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtkaWZmJiMzMjstLWdpdCYjMzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjY29yci55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNjb3JyLnlhbWwN
CiZndDsmIzMyO2luZGV4JiMzMjs3MWVhMjc3YTVkOGUuLmZjYThlN2JiMGNiYyYjMzI7MTAwNjQ0
DQomZ3Q7JiMzMjstLS0mIzMyO2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssY2NvcnIueWFtbA0KJmd0OyYjMzI7KysrJiMzMjtiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGNjb3JyLnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMjQsNiYjMzI7KzI0LDkmIzMyO0BAJiMzMjtw
cm9wZXJ0aWVzOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjst
JiMzMjtlbnVtOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE4My1kaXNwLWNjb3JyDQomZ3Q7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTkyLWRpc3AtY2NvcnINCiZndDsmIzMyOysmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtpdGVtczoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVk
aWF0ZWssbXQ4MzY1LWRpc3AtY2NvcnINCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4
MTgzLWRpc3AtY2NvcnINCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7aXRlbXM6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7ZW51bToNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE4Ni1kaXNwLWNjb3JyDQomZ3Q7JiMzMjsNCiZndDsm
IzMyOy0tJiMzMjsNCiZndDsmIzMyOzIuMjUuMQ0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_003_1654081820.429832846--

