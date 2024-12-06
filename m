Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A39E7486
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612110F125;
	Fri,  6 Dec 2024 15:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="CP5UqlaV";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="COX5rueO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911410F125
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:39:25 +0000 (UTC)
X-UUID: 42f6aec6b3e811efbd192953cf12861f-20241206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=47bN1oj07M7LDzhHOMQgHzcE/K5pUHKp4saUUmkQv8w=; 
 b=CP5UqlaVeLnLIn0fejg+jXG5EW0pUb9PZowymbEX1n3Ie8VFm/7/u2+7abfgbVoF7L/ZnqwK6gRcV8lqNS8QzT4mtqimzERLST9I9wxqhLaVtTJ31RwgEvofifh9bZX24JaZZtlq69C/kcXhjJxQ4qD+mwoATuvSslXJHF/NzAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:e31a66bf-d6e1-43a5-9486-9d6eb7126b4a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:513e78a4-c699-437d-b877-50282f19c2c6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 42f6aec6b3e811efbd192953cf12861f-20241206
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1454754789; Fri, 06 Dec 2024 23:39:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Dec 2024 23:39:19 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Dec 2024 23:39:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGqKq9KaPukRW7Il/tpANacMnw3sBlIrVXfWRG+PCWaz19zWC3qBlrgUwBEyS5eOTqcWEwB8GsXT/1ToL8nveJ7FNskXGLCsK/zKbT3f5JTlqz3IGIAZhqLAjogRgaKHM9NJrkvwwBZAs44o/czRYg9pGmXkQ2mwnxwjW5nUa6YWTyXK0Cs4RvNA5De4NJyerVuT7gzXKszCBrf4rbEUfl7djIDOw2YHKCqK6uBVBowb/xibOD7jGBioYQbU3ZwOg99hNcqSuGtyU+klzUptKpFjX7/ZrL00S7inryuVEgchGccdD0xyjcBcXwQNtCkOwoTuutHXcmT93Xg1hZTmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4Cj2mS+xmqfNy6zeQAXJpH9cLIvnFDii9acqMCaZ1Y=;
 b=V759d0b0OLGhsKbRapw+osyerj7AjFfow7gRkpE724H7nnOy93R55bcbwI6QlNonFa9sl+bL0WMHIcTIbXjHIFUfg0kVQFcl29dPoOdJuWV52CJywYMJ77pytVkd8aSgsBg+tfAsrtBx1Up9EOV3auG/ek/4tmth/yIyPt9+Fcm7eU3fYYeOiZbYw2dgkNyPOmBY4rEhL+8KyPJ9AgXakPVyobFpTk0/Bgq++Dq9DL8sbZDvZ5EXuw/kHAV14hf94aB5Dtco+IIeMv6vy3lufpEVwo/h9q09kuO8GHYhVqKzcpkPwRsJRnjhcILLN7HVoASkxmI98n56BfSM+TUXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4Cj2mS+xmqfNy6zeQAXJpH9cLIvnFDii9acqMCaZ1Y=;
 b=COX5rueOZ0XDbXDKH0BHUXYw6uYm7d5fRMzbSbUGdPPBzSSpQMGqQU9f3u7kE3e/o/JAlgdqNelmN0jYSAN+GuHnCCDeuGNKlB2hQkrPYDXcMokFNjmVc+7eoTm8WamItGrVcYBUaVMyLtHYbAq8M9PWhXdydSiZEsa5pELoCdM=
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com (2603:1096:101:50::10)
 by TYSPR03MB7705.apcprd03.prod.outlook.com (2603:1096:400:40e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 6 Dec
 2024 15:39:16 +0000
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::a0a8:8edf:b2da:9262]) by SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::a0a8:8edf:b2da:9262%4]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 15:39:15 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kuninori.morimoto.gx@renesas.com"
 <kuninori.morimoto.gx@renesas.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Nicolas Prado
 <nfraprado@collabora.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQCAAbf+AIAC/qmAgAAE8QCABeevAIAAKsUAgAy4s4CAACTNAIRqB42AgAFPmICABnEcAA==
Date: Fri, 6 Dec 2024 15:39:15 +0000
Message-ID: <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
References: <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
 <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
 <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
In-Reply-To: <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6459:EE_|TYSPR03MB7705:EE_
x-ms-office365-filtering-correlation-id: d1cb3623-4a22-4bdc-ccd0-08dd160c2412
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VkEvKzRlSWhNVzVMUGlrY0Y0dFF6TTZtYm5XbEVvMXdCK3BrWUpwbENjUFY5?=
 =?utf-8?B?TEgvaHBSUGJsdmlRcGtqbGFpQjl3RWVQTUJreklhQmxyNW83b0RHRzZyWVRx?=
 =?utf-8?B?U2VaSzR2eTNVYWRmT0YxVzBSN1JsU3Z5Y1hmOXdacmYrQWRYS3FUcDcydDdF?=
 =?utf-8?B?ZCtPU3RHVHFiNE1VOXpEY2FiQ1Zzejd3ZFVFZklhaFM3Uy9JUm5DbjNNUklB?=
 =?utf-8?B?UzhreURlRkFCaXRBbFhKWXFqWlZUNGFaVUxXV0RZRmV3TzBPUEJzdGhjOHAw?=
 =?utf-8?B?ZHEvdzlPWlQ5cVBTb3RhWjh6WVFGL2pOL1duMWRCVGxFNzYrTTZ5a0loSXlt?=
 =?utf-8?B?NFkyci82V09NUFJrSVFsbzA4K2xHdUp2WTZVcDB3Wm0zK3JuQkNzNStkcWE4?=
 =?utf-8?B?enl1eGxaK1Zha2h6TDZIN1ZyZDlQMUh4alNEbXNqQ1FJdU1seDk4dnlCbDhu?=
 =?utf-8?B?STJ6a3RYRlZVRG9wank5TXNBNzNweGhnWWwvY0pmRzJ0aEcxRCszdGh4bnhj?=
 =?utf-8?B?SGRDaityelRBUmF6UXFVczBXVGRuYWQ3dU1KL2dyckZ5TTdPTFpMTnVwWmpB?=
 =?utf-8?B?S0J5MkdNYjhBbVF3a2dIOUJQNjcyRzg3OXNHa21zMXdWUkIwU0JuZmt4KzVa?=
 =?utf-8?B?Rml2VEpqd1VZTG5RcWtka3ZRRHhJMUwySkl3NmNEMjg1bUkrWnpqUE9hMjUx?=
 =?utf-8?B?b2tlTXlUNTdJcW1zOGR5SnZNQ0w1ZFV2OVRvUkN4Y096b0VVc3E2MTNqQjQz?=
 =?utf-8?B?WjhDVlJxVW9RN0R2Qk51MFprYVRVdGdKTWN0TXdVbDVlVGVYazdWVWZnd0NX?=
 =?utf-8?B?ZXBHTXB1ZXdtRzNwTU5GSC9SS1NpODIyZVVLN3FhMWlaR1NXaWVHMFhZK1NO?=
 =?utf-8?B?eXg2VEJlK0V4Z3ZHWlhCSXFGMjc4WnJ6cEFHcHdqQkFtNDNURENjVmg2cEZN?=
 =?utf-8?B?YWVSOGJiWVkrUnFRZ0NqSmdOZWs4SlVwRUo0SXhDZDlUU3pGdnp2QWhKcmd0?=
 =?utf-8?B?RHhMWDVhSXJJZjU3UWJXT3pXUUQ5YTlRSGZMTG51dTRSWlNuSE9yS25wOWp3?=
 =?utf-8?B?dDBXdm51QnF1Q29sZStpSmMraVg1eXQ1QWdUVkVCYXk4VW8zTElERVZuR1NC?=
 =?utf-8?B?YzhDeGR6clhScTBWRlpqL2lsY2ppeXdBb1drMkZJQ1kzN29HN2Y1RGhjdnNS?=
 =?utf-8?B?ekJwU2ZLK0hrTFVWV3c5dmtJd2lrc3VTNEY5czlEcXQ1Ykg1M29oMjRXM3h3?=
 =?utf-8?B?bk0zT1oxQzlmSy9QQ1E0cFpnY3NFVjlwZ2ZpOTJreURqVG9YRS93Yy9VRk9B?=
 =?utf-8?B?aDJqSU5wNFNBUzh0Q3JYeGNUZEQyWWVYZE9ocWFZUlVhU1VBSUI3Y3NManlP?=
 =?utf-8?B?Y1lvZGRvWnhXRTZVK1dPSXNqNldUNFZVSk9LQ25IejdlVEhMUkhNMVo2Snpm?=
 =?utf-8?B?WUp1QnFqRk00ai91Rlhtb1RiVHFIUGZ2bW56ZUJUL09JejMrdExsWlBpaStt?=
 =?utf-8?B?V2w0bW9xMW9Fek8ycG0vV2lLNUFBenk1dWRTSCtvWWpuSGtUMU9SYmoyMkRX?=
 =?utf-8?B?UUE2MG15djZHUWdlSi9xNkdhSkIvc051c0p5MG00dVp3SkVMdTljNTg3MTky?=
 =?utf-8?B?Q29YMjI3dXExUXBHNURGczlZbzFsdHVKMVRJaU1CczJjYXFmNXBEbWt5K0hG?=
 =?utf-8?B?cHA1bmoyY01jL0tkSE5KcU9RRW1QVWc5S3BRNFFHdVBFWk9RcUR0R0ErU2Zn?=
 =?utf-8?B?Ty9GOW9Cc3BZZGp2Z1RyOFFpTFFsZnMxVk9DMW10aFJoakZRVlJvRTVTNmYr?=
 =?utf-8?B?aW9EY3Awd0pwWjhzSXJUUFQ2ZlVpN0M4eGZjbGVjY1VrMXlGYWZMZ3o1WVdQ?=
 =?utf-8?B?cXg0SWRDZTMyNVlvS1FqTW9uM0Vzd0t5RmRiNkNIY0hjSEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6459.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW1uMDdmVHFXU0cydGtjVExZSXQ5bTQvc0piYi84ZS80ZnVkYy85R1E4QTJh?=
 =?utf-8?B?OVBINWNqbGc3Rngzd3Z3SG12S2czUkJrTlgxTTI0RVB1Unc5KzErcDVrSXJE?=
 =?utf-8?B?d0ZzZHF6QVpTM01odnNzeEhHN0czcDN6emtVYW44YkUxSDgzNHY5WXpqLzRQ?=
 =?utf-8?B?TnVkMHJjd3dvWjRkd0pvVDlEeU0vMDZGbk53ay8zNU81ZVZjWElNRm4rRmlZ?=
 =?utf-8?B?Q0x3cTB6cVJRbStLM0xEUTZCcjNRUXJuM3BXUFhiR0dPM1gwclk5dXQ0RWw3?=
 =?utf-8?B?UENIY2N4NVpoeXNwS2t4bEQyS0dZVFNGTnhkWlhhQjZvcjBtS1Z0UmNnc2pz?=
 =?utf-8?B?dXVDVy9FQ05WYi9teldkOTh0V2RjY2RzbGNyOGJHdTZhL2FjVWJTT2tVcU9o?=
 =?utf-8?B?ZW9uOUFkSytMWkc0b0piZHU0dngzTkhMOGJPZERRTTM5NFBKMVJHZDFoVWNY?=
 =?utf-8?B?dUIwdkVhNVEvZm9JaWNpWDBEeVRvcTZtTHRaRE9jcS90ZzhGRmx5a1lmV2c1?=
 =?utf-8?B?Vy92NVZWbE1xTVdsWjZyb3RybXNDcjlIZ1BQZ0t4R3NZSk1rK1dHeEF1RUtX?=
 =?utf-8?B?UW01U0RTckp1WjdZT3paTHQya1g2QjR5eWhuTUhvVmZvaDA5WXhlaUFuckcz?=
 =?utf-8?B?bC9EaTI2WGkrUDdBLzA0MTR6K3ZicDlxUVBLaTQ2OC8vcFVmRDE4YXlRRmJX?=
 =?utf-8?B?cGNmYTQrOGJOcmh3bE9MYmpyUSs4aUF3TUNJQUR3TGNya2thWDhwMkI5UnQx?=
 =?utf-8?B?RUwzSkdCMTNHK0kvNHRSenk1WGM3QUNhVXl1UDZnMGJsU0QrQjdSSjVMY3dS?=
 =?utf-8?B?T3llVHpESFRaUi9GMEExYWo0UTFZV0x0eld1WFNteVRCNE1NSHpVaGxQNEta?=
 =?utf-8?B?NmhIdjQzMTNkTzRVMDEwZG16d1FndTZzYXhwRm55SjI0V2pKOEpRSTA0aXRr?=
 =?utf-8?B?UWh5NXVzd3IzVkpucjNzN1NtUUNiYjhyekhoMUNCTjFNVFljTlpNZzFGUlpn?=
 =?utf-8?B?SEovQzdVQmJaK3B3alNTV094amZmMXZQT093Ump5M2N1QWk3VnZDSmZObm1Q?=
 =?utf-8?B?S0lOY28zRTBTa3VBWWc1bEF4OUJxc2ZFVE9XZkFQLzdpODYzSFRMUFhWU0I4?=
 =?utf-8?B?YWxLRXVYanZ4eXdubisvcFFOdHpNdGV3MGRWalBmSEJ0WWh2NlBseDUrUkhl?=
 =?utf-8?B?YWd6T0xzdi9qbnpjTytlQ0RaSXBqNkd4TW9KQUhDbWt5bnVibkVpMTBiU2FV?=
 =?utf-8?B?SjRyNnZIRVdBS0hNZ29xRTJ1Tk8yVmFUTTFDVDV1UjI2aEZTd2RmYkVYWjRp?=
 =?utf-8?B?bFdYdUFKK3hjb0JtT3VSaWhkSXNVdnFpU1p1TjVaaVQ0YW8xcUxUQW9RQnd1?=
 =?utf-8?B?bzg4dUFhRW9DYzduUG1pZ0ZOaEwzaldVU01ETXRWRzFWOEx1NGFXT2c4dC9i?=
 =?utf-8?B?dnQ2cmR1Q1Bmc2RreW1HRWRMaEJrRVh6NHdkczBoZnM5Y01KZzc2UWU3NXF6?=
 =?utf-8?B?VWRRRm5iemhic092RE1YZ2lqd0tHb3VKY2daYWw3NE5weU1RVGk3VXB4S1lm?=
 =?utf-8?B?eXVOZjBkdTNHWGo4V2FCT0t3bXNoSVBXem5wNEE5VUh1SnR0Mm14NEhxeXZD?=
 =?utf-8?B?TDFFWkwvR01vK2tvTjBjcGhxSUYvdHVmR0dGcVhoalZsbGhlRnVadkZya2Qr?=
 =?utf-8?B?NHllQkJhaGNyME1uZGVwcTFGeDhJVkhaNGNvNWRqcXdpT2V3RExPNnM4S2hR?=
 =?utf-8?B?ZEw5OEQ2U0l3R2JwVGgxU0I4aXRwY0ZXaGhWUWpDMlNTUXV6RWZlcG5NWGNU?=
 =?utf-8?B?VFhjZHRCd09IUzJJa0FJams0WDdKb2JoV1Bwb1h1QjlvMzFoWlUvcVFFaHFP?=
 =?utf-8?B?cW5pZUVkOWtHM0dBOFRVdFZrbHVjRzNrc0VqTWl5Ym9XUWZDNTRybjRtRFlN?=
 =?utf-8?B?ZGNJWVg3VzBWOUtHaXl5MVd2UWdycnF0dGNBUVV4RWNpTjl5dkw1ZU1KZGpP?=
 =?utf-8?B?VnZQa2tTWUJ0am9xaVJoenhpQ1dueU1UK1NmRzJvYUpFeXd5clBoVm80Q0pI?=
 =?utf-8?B?eCs4TlJRbEY0MWlvcFQxd1pCV0dwbEp5MFUxUkEzek5yRHZObnEzT1dHNXIv?=
 =?utf-8?Q?YnVELPWNKS2adQD+T/MB8/hjP?=
Content-ID: <FC74EE46EA718E4E8BB7F6A4B8A36FA0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6459.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cb3623-4a22-4bdc-ccd0-08dd160c2412
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 15:39:15.7074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UP0hjpD4lwazBVSUUiL68IADpH7VB+F0wBd5Md3hSAX4118JQF5gUA2HTMLlQiEFfhtBKd2pxLp9r6WWuGy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7705
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_433999975.884982864"
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

--__=_Part_Boundary_007_433999975.884982864
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTEyLTAyIGF0IDEzOjE2ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBTdW4sIERlYyAwMSwgMjAyNCBhdCAwNToxNTo0NVBNICswMDAwLCBKaWF4aW4gWXUgKOS/nuWu
tumRqykgd3JvdGU6DQo+IA0KPiA+IFNvIEkgd2FudCB0byBhc2sgaWYgSSBjYW4gZG8gaXQgYnkg
anVzdCBhZGRpbmcNCj4gPiBTT0NfREFQTV9QSU5fU1dJVENIKCJTcGVha2VycyIpIGFuZCBTT0Nf
REFQTV9QSU5fU1dJVENIKCJIRE1JIik/DQo+ID4gQ29ycmVzcG9uZGluZ2x5LCBkYXBtIHdpZGdl
dCBhbmQgcm91dGUgcGF0aCBuZWVkIHRvIGJlIGFkZGVkLiBUaGF0DQo+ID4gaXMNCj4gPiAiU05E
X1NPQ19EQVBNX1NQSygiU3BlYWtlcnMiLCBOVUxMKS8gU05EX1NPQ19EQVBNX0xJTkUoIkhETUkx
IiwNCj4gPiBOVUxMKSINCj4gPiBhbmQgInsiU3BlYWtlcnMiLCBOVUxMLCAiU3BlYWtlciJ9LyB7
IkhETUkxIiwgTlVMTCwgIlRYIn0iLg0KPiANCj4gWWVzLCB0aGF0J3Mgd2hhdCBJJ2QgZXhwZWN0
IHRvIHNlZS4NCg0KRGVhciBNYXJrLA0KDQpTbyBpZiBJIG9wZW4gdGhlICJIRE1JIFN3aXRjaCIg
YW1peGVyIGNvbnRyb2wsIGl0IHdpbGwgY2FsbA0KJ2hkbWlfY29kZWNfc3RhcnR1cCcsIHdoaWNo
IGluIHR1cm4gY2FsbHMgImF1ZGlvX3N0YXJ0dXAoKSIgIGluDQonaGRtaV9jb2RlY19vcHMnLiBD
b252ZXJzZWx5LCBpZiBJIGNsb3NlIGl0LCBpdCB3aWxsIGNhbGwNCidoZG1pX2NvZGVjX3NodXRk
b3duJywgd2hpY2ggaW4gdHVybiBjYWxscyAnYXVkaW9fc2h1dGRvd24nIGluDQonaGRtaV9jb2Rl
Y19vcHMnLiBJcyB0aGlzIHVuZGVyc3RhbmRpbmcgY29ycmVjdD8NCg0Kc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfc29jX2RhaV9vcHMgaGRtaV9jb2RlY19pMnNfZGFpX29wcyA9IHsNCiAgICAgICAg
LnByb2JlICAgICAgICAgICAgICAgICAgICAgICAgICA9IGhkbWlfZGFpX3Byb2JlLA0KICAgICAg
ICAuc3RhcnR1cCAgICAgICAgICAgICAgICAgICAgICAgID0gaGRtaV9jb2RlY19zdGFydHVwLA0K
ICAgICAgICAuc2h1dGRvd24gICAgICAgICAgICAgICAgICAgICAgID0gaGRtaV9jb2RlY19zaHV0
ZG93biwNCiAgICAgICAgLmh3X3BhcmFtcyAgICAgICAgICAgICAgICAgICAgICA9IGhkbWlfY29k
ZWNfaHdfcGFyYW1zLA0KICAgICAgICAucHJlcGFyZSAgICAgICAgICAgICAgICAgICAgICAgID0g
aGRtaV9jb2RlY19wcmVwYXJlLA0KICAgICAgICAuc2V0X2ZtdCAgICAgICAgICAgICAgICAgICAg
ICAgID0gaGRtaV9jb2RlY19pMnNfc2V0X2ZtdCwNCiAgICAgICAgLm11dGVfc3RyZWFtICAgICAg
ICAgICAgICAgICAgICA9IGhkbWlfY29kZWNfbXV0ZSwNCiAgICAgICAgLnBjbV9uZXcgICAgICAg
ICAgICAgICAgICAgICAgICA9IGhkbWlfY29kZWNfcGNtX25ldywNCiAgICAgICAgLmF1dG9fc2Vs
ZWN0YWJsZV9mb3JtYXRzICAgICAgICA9ICZoZG1pX2NvZGVjX2Zvcm1hdHMsDQogICAgICAgIC5u
dW1fYXV0b19zZWxlY3RhYmxlX2Zvcm1hdHMgICAgPSAxLA0KfTsNCg0KIHN0cnVjdCBoZG1pX2Nv
ZGVjX29wcyB7DQogICAgICAgICAvKg0KICAgICAgICAgICogQ2FsbGVkIHdoZW4gQVNvQyBzdGFy
dHMgYW4gYXVkaW8gc3RyZWFtIHNldHVwLg0KICAgICAgICAgICogT3B0aW9uYWwNCiAgICAgICAg
ICAqLw0KICAgICAgICAgaW50ICgqYXVkaW9fc3RhcnR1cCkoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhKTsNCg0KDQogICAgICAgICAvKg0KICAgICAgICAgICogU2h1dHMgZG93biB0aGUg
YXVkaW8gc3RyZWFtLg0KICAgICAgICAgICogTWFuZGF0b3J5DQogICAgICAgICAgKi8NCiAgICAg
ICAgIHZvaWQgKCphdWRpb19zaHV0ZG93bikoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRh
KTsNCg==

--__=_Part_Boundary_007_433999975.884982864
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMTItMDImIzMyO2F0
JiMzMjsxMzoxNiYjMzI7KzAwMDAsJiMzMjtNYXJrJiMzMjtCcm93biYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtPbiYjMzI7U3VuLCYjMzI7RGVjJiMzMjswMSwmIzMyOzIwMjQmIzMyO2F0JiMzMjswNTox
NTo0NVBNJiMzMjsrMDAwMCwmIzMyO0ppYXhpbiYjMzI7WXUmIzMyOygmIzIwNDQ2OyYjMjM0Nzg7
JiMzNzk5NTspJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U28mIzMy
O0kmIzMyO3dhbnQmIzMyO3RvJiMzMjthc2smIzMyO2lmJiMzMjtJJiMzMjtjYW4mIzMyO2RvJiMz
MjtpdCYjMzI7YnkmIzMyO2p1c3QmIzMyO2FkZGluZw0KJmd0OyYjMzI7Jmd0OyYjMzI7U09DX0RB
UE1fUElOX1NXSVRDSCgmcXVvdDtTcGVha2VycyZxdW90OykmIzMyO2FuZCYjMzI7U09DX0RBUE1f
UElOX1NXSVRDSCgmcXVvdDtIRE1JJnF1b3Q7KSYjNjM7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDb3Jy
ZXNwb25kaW5nbHksJiMzMjtkYXBtJiMzMjt3aWRnZXQmIzMyO2FuZCYjMzI7cm91dGUmIzMyO3Bh
dGgmIzMyO25lZWQmIzMyO3RvJiMzMjtiZSYjMzI7YWRkZWQuJiMzMjtUaGF0DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7JnF1b3Q7U05EX1NPQ19EQVBNX1NQSygmcXVv
dDtTcGVha2VycyZxdW90OywmIzMyO05VTEwpLyYjMzI7U05EX1NPQ19EQVBNX0xJTkUoJnF1b3Q7
SERNSTEmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtOVUxMKSZxdW90Ow0KJmd0OyYjMzI7Jmd0
OyYjMzI7YW5kJiMzMjsmcXVvdDt7JnF1b3Q7U3BlYWtlcnMmcXVvdDssJiMzMjtOVUxMLCYjMzI7
JnF1b3Q7U3BlYWtlciZxdW90O30vJiMzMjt7JnF1b3Q7SERNSTEmcXVvdDssJiMzMjtOVUxMLCYj
MzI7JnF1b3Q7VFgmcXVvdDt9JnF1b3Q7Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtZZXMsJiMzMjt0
aGF0JiMzOTtzJiMzMjt3aGF0JiMzMjtJJiMzOTtkJiMzMjtleHBlY3QmIzMyO3RvJiMzMjtzZWUu
DQoNCkRlYXImIzMyO01hcmssDQoNClNvJiMzMjtpZiYjMzI7SSYjMzI7b3BlbiYjMzI7dGhlJiMz
MjsmcXVvdDtIRE1JJiMzMjtTd2l0Y2gmcXVvdDsmIzMyO2FtaXhlciYjMzI7Y29udHJvbCwmIzMy
O2l0JiMzMjt3aWxsJiMzMjtjYWxsDQomIzM5O2hkbWlfY29kZWNfc3RhcnR1cCYjMzk7LCYjMzI7
d2hpY2gmIzMyO2luJiMzMjt0dXJuJiMzMjtjYWxscyYjMzI7JnF1b3Q7YXVkaW9fc3RhcnR1cCgp
JnF1b3Q7JiMzMjsmIzMyO2luDQomIzM5O2hkbWlfY29kZWNfb3BzJiMzOTsuJiMzMjtDb252ZXJz
ZWx5LCYjMzI7aWYmIzMyO0kmIzMyO2Nsb3NlJiMzMjtpdCwmIzMyO2l0JiMzMjt3aWxsJiMzMjtj
YWxsDQomIzM5O2hkbWlfY29kZWNfc2h1dGRvd24mIzM5OywmIzMyO3doaWNoJiMzMjtpbiYjMzI7
dHVybiYjMzI7Y2FsbHMmIzMyOyYjMzk7YXVkaW9fc2h1dGRvd24mIzM5OyYjMzI7aW4NCiYjMzk7
aGRtaV9jb2RlY19vcHMmIzM5Oy4mIzMyO0lzJiMzMjt0aGlzJiMzMjt1bmRlcnN0YW5kaW5nJiMz
Mjtjb3JyZWN0JiM2MzsNCg0Kc3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtzbmRfc29j
X2RhaV9vcHMmIzMyO2hkbWlfY29kZWNfaTJzX2RhaV9vcHMmIzMyOz0mIzMyO3sNCiYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsucHJvYmUmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PSYj
MzI7aGRtaV9kYWlfcHJvYmUsDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LnN0YXJ0dXAmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjs9JiMzMjtoZG1pX2NvZGVjX3N0YXJ0dXAsDQomIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LnNodXRkb3duJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyO2hkbWlfY29kZWNfc2h1
dGRvd24sDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Lmh3X3BhcmFt
cyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PSYj
MzI7aGRtaV9jb2RlY19od19wYXJhbXMsDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7LnByZXBhcmUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjtoZG1pX2NvZGVjX3ByZXBhcmUsDQomIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LnNldF9mbXQmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjtoZG1p
X2NvZGVjX2kyc19zZXRfZm10LA0KJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOy5tdXRlX3N0cmVhbSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjs9JiMzMjtoZG1pX2NvZGVjX211dGUsDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7LnBjbV9uZXcmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjtoZG1pX2NvZGVjX3BjbV9uZXcsDQomIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LmF1dG9fc2VsZWN0YWJsZV9mb3JtYXRz
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOyZhbXA7aGRtaV9j
b2RlY19mb3JtYXRzLA0KJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5u
dW1fYXV0b19zZWxlY3RhYmxlX2Zvcm1hdHMmIzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOzEsDQp9
Ow0KDQomIzMyO3N0cnVjdCYjMzI7aGRtaV9jb2RlY19vcHMmIzMyO3sNCiYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy8qDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyomIzMyO0NhbGxlZCYjMzI7d2hlbiYjMzI7QVNv
QyYjMzI7c3RhcnRzJiMzMjthbiYjMzI7YXVkaW8mIzMyO3N0cmVhbSYjMzI7c2V0dXAuDQomIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyomIzMyO09wdGlv
bmFsDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyov
DQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpbnQmIzMyOygq
YXVkaW9fc3RhcnR1cCkoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsq
ZGF0YSk7DQoNCg0KJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
LyoNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7KiYj
MzI7U2h1dHMmIzMyO2Rvd24mIzMyO3RoZSYjMzI7YXVkaW8mIzMyO3N0cmVhbS4NCiYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7KiYjMzI7TWFuZGF0b3J5
DQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyovDQom
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt2b2lkJiMzMjsoKmF1
ZGlvX3NodXRkb3duKShzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3ZvaWQmIzMyOypk
YXRhKTsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_433999975.884982864--

