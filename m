Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A14987D05
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 04:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26B110EBF7;
	Fri, 27 Sep 2024 02:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="AD0qs1Kj";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EqAKSBvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B5810EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:27:27 +0000 (UTC)
X-UUID: 055f38fa7c7811efb66947d174671e26-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=MK55stSi05uWiU6xb2eTXjVeyDtA97fmkclcLVv+GRI=; 
 b=AD0qs1KjYTm/cDoOSFY8uYI1YEQIBcCEz7y0u/m1PhYOr3XlzS/tUTg/o4Ild0qYs5XnfiEqJ17fElURGnoZ8UYlKAaviaz0bR4EP0LP40DAXudehhA7+RMaKrdbnI00avnOnMWgo8/lOOfd4e8SdcVhhgkRG5+skxHWZD0qRLU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:f36a5e2b-3698-4468-a269-661d137e222a, IP:0,
 U
 RL:0,TC:0,Content:8,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:8
X-CID-META: VersionHash:6dc6a47, CLOUDID:188f5318-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 055f38fa7c7811efb66947d174671e26-20240927
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 203970013; Fri, 27 Sep 2024 10:27:19 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 10:27:18 +0800
Received: from outbound.mail.protection.outlook.com (172.21.101.237) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 10:27:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtXPCPAogx5ylh3FWqaXc7QuX0oBH6P96jwEZeJGSvY962hs5ZIA6h+LTmmqgWz7/8bLS4nMemxvmrizVv7UqE6So4QWjr5+zFGFsbeFYfuFQZWLHLujGqCfY8TQvbDfuMHfOt4UHvPrllrtPeczp7dE+yphsTEfmMnTV7pCbDa187YeiPhDjRuogb36nPuZjEYoBHbHe1dL4AEe61gZgUr8lxfYLzGTN0j6zrX/2fw+aL4RkGzJxDlHDtNLCsDD+S0nQ+9iCOUP9DE5Il1vzhLjGFHkxu6q53Ry+yYm5xg8f6UwkI+5wnludnHyTsNGeRwVETfnEVtKohgStPFE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MK55stSi05uWiU6xb2eTXjVeyDtA97fmkclcLVv+GRI=;
 b=xJIf/BlbBa/TETvx/V7TwNac7Z+1Hq4bOati8wQQVE+LXalBIbzx8hUqP3X8Sm0dvh11nG4SP0m6tz6R6aejkVDqiN6I/RHgp2CtPbU3CMeM26XgoghtjAtlbUlCQKeufTA9FSyZLFMAtiibNN69DMO+Orh+s2VtVBa3Xt26yfuRLSpDe+2u83nvayVjcuRnYxla1ESNxOL8S5sDzDuZblGuekVm5xrj+OveFoYHzJqNBr7LzzpOx6e/YptKr0Lk8xZo5lhlOrasW6BUfFkqMCaLNwg/hWQcqxn2ywqZxYGxlkcwBq+UAN09OAZsof0/wr/WsNsw2G7Qa0JQU4FtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK55stSi05uWiU6xb2eTXjVeyDtA97fmkclcLVv+GRI=;
 b=EqAKSBvlb+0D/U4TrtaZ2m9AS7GG4jYgTwtYC5MU9f9STesTRq+f1nLrhLKo6bygOzf1lDLIPr8JU7g7Ag/y5yLzcN+YH9pEbqVbWFWIrS72RvgkdMWnwItQ8SfGu0AL0PbtJhYvOtt2Oh+Jlm9uHU4wu7Qv5UkkNTWl0XoLHTk=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB8376.apcprd03.prod.outlook.com (2603:1096:820:12c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 02:27:15 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 02:27:14 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
CC: =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
 <bear.wang@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?TWFjcm9zcyBDaGVuICjpmbPos6Lnoqkp?= <macross.chen@mediatek.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "macpaul@gmail.com" <macpaul@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?utf-8?B?U2VuIENodSAo5YKo5qOuKQ==?=
 <Sen.Chu@mediatek.com>, "will@kernel.org" <will@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Thread-Topic: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Thread-Index: AQHbDybsIa6PZ1ANM02yNRDDI32jX7JokdAAgAE/iICAARnggA==
Date: Fri, 27 Sep 2024 02:27:14 +0000
Message-ID: <93d9ffbe466ff61d5426b6f158a4b8464f56824d.camel@mediatek.com>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
 <20240924-commute-collision-13ad39717d31@spud>
 <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
 <20240925-satisfy-epidermal-bd414891479a@spud>
 <7a1315ef-4be5-4528-858b-9f07c814636d@collabora.com>
In-Reply-To: <7a1315ef-4be5-4528-858b-9f07c814636d@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB8376:EE_
x-ms-office365-filtering-correlation-id: 8484f96c-95cc-4288-49b8-08dcde9be683
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SHpGYnJ1ai9kNElGODlYaHdnZ0ZBSGtUbHd2K3VZUmRkQ1pwbUJBUlNQMklE?=
 =?utf-8?B?Nkt1emhlTzJmdC9HUXE4M2NtWXdzQUtKUkVXVUdmZ1NXemRKSGRMMlk0K3VC?=
 =?utf-8?B?djBTTW02aHZJUzFrYzRBL3RPSnBnWVRlMWx3WHlmVldYQ04xb0VqYXBzb2dM?=
 =?utf-8?B?eG9kdnN2RlhDWmNON0hrdkttLzRuNlNFYzViRHVpZnUxWGJXUTY0c0tTOTJy?=
 =?utf-8?B?Ny9SNks4VU5DVzNNRW1hWE93MTZ5aFNWb1p1enM5MmZpNk5lc3RDU1ltNjlt?=
 =?utf-8?B?QXFIcVE1eHdrT1F4L3NKdDNqUFVHclRUR21lVW41WDF5VlBxZllPaTNWSG9u?=
 =?utf-8?B?VnVVNWtCUWtjL3JqUXQzVU1vYnNmb1dkd1FqZFI5b1pxZ2tJUFNobkx6c08w?=
 =?utf-8?B?MlhQWWNya1RlbHk1S0NLMFcvZWtOMEozdUpzSS9rREtLYnV0bHVRSTZZY1dZ?=
 =?utf-8?B?elBQemM1NTlWTXE0aFNtcWRTRlp1SzlqNk1CU016aWoyc3hrUzkyeUlrWHlV?=
 =?utf-8?B?bjNNSm9velJDeSs1MnNjMFZvenQ2ZVFialkySXNUTEZhcE5DWERRL0g0Uk1C?=
 =?utf-8?B?M2lnczNVWDFyWDgyVXlQOVozNFgyZlErUUkyNWRRWXRDenFyTzN6ZmRpY1lW?=
 =?utf-8?B?WGpkeW9jUFkzaUd3SzdYbzJMQnZjMjlSTHFIY28rUGRoQXBQOVlkRXpUcDU3?=
 =?utf-8?B?OU5VQ3B6QjlMVityeFpmK2hJZEN0WjQ1SXpydmE5UTFHOE1uNTMvZDF4UHVr?=
 =?utf-8?B?bGVacStpZUFqSVNjSm5ZR044eXMxcWRyMlBKY3JGNXREVWhlTVF4NmoyWlpL?=
 =?utf-8?B?ZFdpM1g2bUZMaVR4Rk85VzFSS2U0N3E1cVpOb3RVc2dCdW9HS2JDZ0syay9J?=
 =?utf-8?B?RWhmc1RGUnRLemZJc0hPNy85aDNWdFZJMTlaNS9MZThOWVNYVFFodFJSQTFa?=
 =?utf-8?B?M1pMQVpTRzlXeDEvM3o3R0k2ZUhTQW9seVRpcEwwZ1RkLzZKaWRoVEs5cmsr?=
 =?utf-8?B?c01oMGFndXN0S0NQaWo5c3hFKzlTRTl6QmEwU3R6QlFsQjNWaFEreVVyd2JJ?=
 =?utf-8?B?U1c0WXJwL1FTWThtdFdjb0xDcnZ2Z2JlV3BjVTZrRnoxRVNsTGhhUFlXVG9H?=
 =?utf-8?B?NlNkY0N6elNLVk9QRTZiMzRrTGJ4RlMxbHhKUzJaSUpzV1BheFlhME41bmZZ?=
 =?utf-8?B?STU0a2hKZURmenNEajlVYUVNR3krUTg1ZU0vSHRtYTUrdStLNGd1RmhWYkxh?=
 =?utf-8?B?QUtldS9obVF6dWxSaDczVytrVWZYM2dibXlxUi8rQmtTcWhzMWZ6a0FmSGgy?=
 =?utf-8?B?TlFjMEhYTmh5aktRYnI3cHpIc3RBWDJuUDEzUWFNTU5rQ3FhZHpUME9CamxE?=
 =?utf-8?B?U1NUd3Bma1BheHZtODhOVCtpaXYrL2xyU1ZRZ3FneE1TRGVqa2M0ajZkY0hU?=
 =?utf-8?B?aXFpMk9iSmNKL2pzeUNaQzN4eWk0bXJGQmlxUlhrZ1V0N1VkTitHMll5aTFn?=
 =?utf-8?B?Wk53K3NVZWdZa00xUTdqSURrZmhRTXJ2aXVjZ3JBK3pWMUZ6R0tpWnNvK2pS?=
 =?utf-8?B?UEowNVlKL0FMaC9tTTJBMy9sSWU0MktrWURVNzlKSG1aaWpSTi9Hc1dwM3VV?=
 =?utf-8?B?NHFiK1hNemtLMGZpMnFwa2FXN1p5VW1kVzBYTmVYZHgvcFRSWHNoZjlSSlNu?=
 =?utf-8?B?Z1ZTR2hCeU5DMFprcFZlYXZPb1c1QXpOMk1IaGJXaVFQWTVtS2dJZC8vRVJy?=
 =?utf-8?B?S21DUXkzVDdvYjc4TFJIN2ltQ0J3ZmJCRzdiNTVpMFFMMEQ4STJDd1FKZWlt?=
 =?utf-8?B?YzEzTERNNjQrV05wWTg4dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SCtsTHlzRllmYWF5VFA5RHY5WG42YldLWXJoVGlPSGNBbG4vOFplTlF6bmZa?=
 =?utf-8?B?Q0JYSndVSUJEOEpvc2lRSVJZL1ZCMkpmUk85RTc5bmFIY3NpQVQ0ZmpzQmxY?=
 =?utf-8?B?b0VvdFpKdm1wZlNRQzdndmVjdkp6S0FKRjFibHdhQXM2YUxudWp3ZmJQTitR?=
 =?utf-8?B?NTRCTzV5VUxVbDA5NWNjVHMrQloydE45MnZCdW5BbW1nL2JpSTVzbTNBelpW?=
 =?utf-8?B?R25lMDZ3dnFXYWlUTm9aVzVudy9yZnFXb0VOQ0t5RHdHVUlmMWFtazczT1hm?=
 =?utf-8?B?biszOVl6REk0QUdFV0FiTmRUc0NIT2VGbm82Wm1wSFdnWHdQeTlLVVdid1pI?=
 =?utf-8?B?RXpNbDRTZ0R3RUtmTHI4QTd6emVjYnV5Q0t3ZE56UE9RbHNMOStkakszdjZt?=
 =?utf-8?B?UGo0ajFNZUZBTlRSRnZLeEozOGorT083KzVoUU45OW90UlRTNUtFUURMUm8v?=
 =?utf-8?B?N3NWZWV1ODJtcmpCNGVLVHhaSFdnRzFpdXRFUG1BV2JNRDJ6R2pxTWV2RS9M?=
 =?utf-8?B?ak05eGZIcyswSmJNd29WYnRqc2RkQU1nQS9vR1ZSVDMvNkcyaUZHYTJDckR6?=
 =?utf-8?B?bmc0a0dUWkVlMzkwS2l2VlhrZFFUZThWM0VlMmxwZlZiU0NIZ1BsMExCWEw3?=
 =?utf-8?B?ZWd3dE1IOVB5WHZ1T0x2ZGRBRDZaL0VDaG9jYlNVSkhtei93RHdRcjN3MXdJ?=
 =?utf-8?B?WjN2M0gyR1p3UWN5aVVFUE0wN3BUeDVOYVo4aXY3RGdBa2tDTTk0em5FcDhI?=
 =?utf-8?B?Mkg5ZGNSWlo0Z0tLMlNsMEtpOTNzamlmSXJiWXkvcGcvcnN0WCtIdXp4bW1j?=
 =?utf-8?B?VFdhSVVpRkhNU3FxVzVmUXA0OHFsODJESlZqcWxweG8xZElqb1k0S2toTHdS?=
 =?utf-8?B?TSt3aUlVeVhQbE03TS9VSlBIQWh6d1RLUlY1Vmlpb0tkd3Fidmd1NldtUVcy?=
 =?utf-8?B?a2VEcFJBSFpXdU0zRXFJM1lEZC9qZUxETHF1YmU2bnpoanhjZkJxQmIzaVFz?=
 =?utf-8?B?d0tHZDlhb2Jra2Faa1ZzN2FNajVDTkdKMEdIRzRiMFV2T0htSzRFRGdNSzRl?=
 =?utf-8?B?NGY2ZmdlN0txZ0VlNVdnbFdEZ1ZuV2cvOWtsL0ZtQXkvL3gySkVCcmRoOGxD?=
 =?utf-8?B?TDRpN3FQdmtGZ0FLNTl1T2R3alBQUVpHMmp2a25PMUlTbEw3aS83UjJxN3lU?=
 =?utf-8?B?dHViOHYvS01lSjBNOTVvajlWMFZ5RUxDTXQwZnVXdFY1Y0cyNW5iMGlDU1pX?=
 =?utf-8?B?MktvTEpOV1UxTFFYY3NrQm9NUnJIN0lwVVdJZFZadFo3azRPMFdDV1lWSEl6?=
 =?utf-8?B?cGVWYlBTdFdoTTZRUVJ4YXh6bUp5bFV5eTVvSEdmbXVMR0FWVkhOR2tIblNU?=
 =?utf-8?B?eDJ2eUw0NDFoY3NkQVkrUlpYKzRqMjU2TUtmMjRaeDRXLy90N3dFSE5mNEto?=
 =?utf-8?B?MjRpc2h5QUxyNXBTNXhhTEVFdER2OTAybnVNN1d3aEFoUGJLclJydDJOUnBO?=
 =?utf-8?B?WCtDN0VXSFlhWHhzcDdyTWUxU3kwNzBRL2dHOGNvaWtEb2cxcUJKMm84K2Zk?=
 =?utf-8?B?ajAwdEdqRWRMUmVGc2RRcWN1Y2JSQ2IwQVVUMUtqOG8vRDVPODRQQUVIV1Vv?=
 =?utf-8?B?bzdkZklLaXNQblY4UjQ3OXZxditYY3BJUDFDdFg0SU8xd3NsblA5dnVMMTFS?=
 =?utf-8?B?OGpQTXNUekhvRDMySUdsOHZULzcvWDJDeWZQbmtDZE5aZFp4YzJFNVJORFhG?=
 =?utf-8?B?QVZWK3dONkVWNk9YR00xK3A2bm9PYVFSa0RxWWVqVzMxeHNRbDVwK0NxYzVD?=
 =?utf-8?B?RkNPbTlhc1BDQlhPUWIxVEFYUTJhdUpjUWo0QlVFRjUxM1Qrc2wzZ05vY2lE?=
 =?utf-8?B?M2NrSTE5eElhNnJSTkVxbjUxYjJqdHd3d0NqSXZ2Zk1XcEhaV0dUZEk1SkNJ?=
 =?utf-8?B?bWNLTjI1eHMvZGpidWxCOUVJVGY4UUJYTVFaKzdPU0E0bHhtbkRkVzBJY2JD?=
 =?utf-8?B?amw5cmR2dXB0V0syZFZQU0ErdERkRTJIMTd6TjJiQ1B3TUUzVDJ6WVczTHNu?=
 =?utf-8?B?MGpBcU1sY3RXbWRVU0VvbE1xTDBaeWQ4KzhYdTRBLy9YWjlkOXhCWVJUL2pQ?=
 =?utf-8?B?SnJBZFZleWw3T1RxZzdxcjlOR0xIMERoVHRwYzJkaEpkL2dtVnlGMlc5b2RU?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12BDA48CC3D7724A9327A10474CF3E3D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8484f96c-95cc-4288-49b8-08dcde9be683
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 02:27:14.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xu/gStVc0zQYPtdll1+EVk5KlCoynJUiW7Nwk88F2MEv+DluBUC4K+fXVUlTVRbEXSxuBfJ/yAIY2bAb5J2Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8376
X-MTK: N
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

T24gVGh1LCAyMDI0LTA5LTI2IGF0IDExOjM4ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjUvMDkvMjQgMTY6MzQsIENvbm9yIERvb2xleSBoYSBzY3JpdHRv
Og0KPiA+IE9uIFdlZCwgU2VwIDI1LCAyMDI0IGF0IDA0OjQyOjU5UE0gKzA4MDAsIE1hY3BhdWwg
TGluIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBPbiA5LzI1LzI0IDAwOjAwLCBDb25vciBEb29sZXkg
d3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDI0IGF0IDAxOjQyOjAxUE0gKzAyMDAs
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsDQo+ID4gPiA+IFJlZ25vIHdyb3RlOg0KPiA+ID4gPiA+IEls
IDI0LzA5LzI0IDEyOjMxLCBNYWNwYXVsIExpbiBoYSBzY3JpdHRvOg0KPiA+ID4gPiA+ID4gVGhl
IGRpc3BsYXkgbm9kZSBpbiBtdDgxOTUuZHRzaSB3YXMgdHJpZ2dlcmluZyBhIENIRUNLX0RUQlMN
Cj4gPiA+ID4gPiA+IGVycm9yIGR1ZQ0KPiA+ID4gPiA+ID4gdG8gYW4gZXhjZXNzaXZlbHkgbG9u
ZyAnY2xvY2tzJyBwcm9wZXJ0eToNCj4gPiA+ID4gPiA+ICAgICAgZGlzcGxheUAxNGYwNjAwMDog
Y2xvY2tzOiBbWzMxLCAxNF0sIFszMSwgNDNdLCBbMzEsDQo+ID4gPiA+ID4gPiA0NF1dIGlzIHRv
byBsb25nDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwg
YWRkICJtYXhJdGVtczogMyIgdG8gdGhlICdjbG9ja3MnDQo+ID4gPiA+ID4gPiBwcm9wZXJ0eSBp
bg0KPiA+ID4gPiA+ID4gdGhlIERUIHNjaGVtYS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
Rml4ZXM6IDRlZDU0NWU3ZDEwMCAoImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogZGlz
cDoNCj4gPiA+ID4gPiA+IHNwbGl0IGVhY2ggYmxvY2sgdG8gaW5kaXZpZHVhbCB5YW1sIikNCj4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRl
ay5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ICAgICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0DQo+ID4gPiA+ID4gPiAueWFt
bCAgICAgfCAxICsNCj4gPiA+ID4gPiA+ICAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXQN
Cj4gPiA+ID4gPiA+IGVrLHNwbGl0LnlhbWwNCj4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0DQo+ID4gPiA+ID4gPiBl
ayxzcGxpdC55YW1sDQo+ID4gPiA+ID4gPiBpbmRleCBlNGFmZmM4NTRmM2QuLjQyZDJkNDgzY2My
OSAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXQNCj4gPiA+ID4gPiA+IGVr
LHNwbGl0LnlhbWwNCj4gPiA+ID4gPiA+ICsrKw0KPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXQNCj4gPiA+ID4gPiA+
IGVrLHNwbGl0LnlhbWwNCj4gPiA+ID4gPiA+IEBAIC01Nyw2ICs1Nyw3IEBAIHByb3BlcnRpZXM6
DQo+ID4gPiA+ID4gPiAgICAgICBjbG9ja3M6DQo+ID4gPiA+ID4gPiAgICAgICAgIGl0ZW1zOg0K
PiA+ID4gPiA+ID4gICAgICAgICAgIC0gZGVzY3JpcHRpb246IFNQTElUIENsb2NrDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gVGhhdCdzIGF0IGxlYXN0IGNvbmZ1c2luZyAoZ3JhbnRlZCB0aGF0IGl0
IHdvcmtzKSAtIGVpdGhlcg0KPiA+ID4gPiA+IGFkZCBhIGRlc2NyaXB0aW9uIGZvcg0KPiA+ID4g
PiA+IGVhY2ggY2xvY2sgYW5kIHRoZW4gc2V0IGBtaW5JdGVtczogMWAgKHByZWZlcnJlZCksIG9y
IHJlbW92ZQ0KPiA+ID4gPiA+IHRoaXMgIlNQTElUIENsb2NrIg0KPiA+ID4gPiA+IGRlc2NyaXB0
aW9uIGFuZCBhbGxvdyBhIG1heGltdW0gb2YgMyBjbG9ja3MuDQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gUmVtb3ZpbmcgdGhlIGRlc2NyaXB0aW9uIGNhbiBiZSBkb25lIC0gSU1PIC0gYmVjYXVzZSAi
U1BMSVQNCj4gPiA+ID4gPiBDbG9jayIgaXMsIHdlbGwsDQo+ID4gPiA+ID4gc2F5aW5nIHRoYXQg
dGhlIFNQTElUIGJsb2NrIGdldHMgYSBTUExJVCBjbG9jayAuLi4gc3RhdGluZw0KPiA+ID4gPiA+
IHRoZSBvYnZpb3VzLCBhbnl3YXkuDQo+ID4gPiA+IA0KPiA+ID4gPiBSaWdodCwgYnV0IHdoYXQg
YXJlIHRoZSBvdGhlciB0d28gbmV3IGNsb2Nrcz8gQXJlIHRoZXkgYXMNCj4gPiA+ID4gb2J2aW91
cz8NCj4gPiA+ID4gVGhlcmUncyBubyBjbG9jay1uYW1lcyBoZXJlIHRvIGdpdmUgYW55IG1vcmUg
aW5mb3JtYXRpb24gYXMgdG8NCj4gPiA+ID4gd2hhdCB0aGUNCj4gPiA+ID4gb3RoZXIgY2xvY2tz
IGFyZSBzdXBwb3NlZCB0byBiZS4NCj4gPiA+ID4gDQo+ID4gPiA+IEtpbmRhIHVucmVsYXRlZCwg
YnV0IEkgdGhpbmsgdGhhdCAiU1BMSVQgQ2xvY2siIHByb2JhYmx5IGlzbid0DQo+ID4gPiA+IHdo
YXQgdGhlDQo+ID4gPiA+IG5hbWUgb2YgdGhlIGNsb2NrIGluIHRoZSBJUCBibG9jayBpcyBhbnl3
YXksIHNvdW5kcyBtb3JlIGxpa2UNCj4gPiA+ID4gdGhlIG5hbWUNCj4gPiA+ID4gZm9yIGl0IG9u
IHRoZSBwcm92aWRlciBlbmQuLg0KPiA+ID4gDQo+ID4gPiANCiAqIFRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb25zLiBJIHRoaW5rIE1vdWR5IGNvdWxkIGhlbHAgb24gdGhlIG5ldw0KICAgZml4ZXMN
Cj4gPiA+IGZvciBib3RoIERUIHNjaGVtIGFuZCBtdDgxOTUuZHRzaS4gVGhpcyBwYXRjaCBjb3Vs
ZCBiZSBzZXBhcmF0ZWQNCj4gPiA+IGZyb20NCj4gPiA+IG9yaWdpbiBwYXRjaCBzZXQuDQo+ID4g
DQo+ID4gTm90IHN1cmUgd2hhdCB5b3UgbWVhbiBhYm91dCBzZXBhcmF0aW5nIGl0LCBpZiB5b3Ug
bWVhbiBjb3JyZWN0aW5nDQo+ID4gdGhlDQo+ID4gZGVzY3JpcHRpb24gZm9yIHRoZSBzcGxpdCBj
bG9jayBzdXJlLiBUaGUgb3RoZXIgc3R1ZmYgSSBtZW50aW9uZWQNCj4gPiBuZWVkcw0KPiA+IHRv
IGJlIHJlc29sdmVkIGJlZm9yZSBJJ20gd2lsbGluZyB0byBhY2sgdGhpcy4NCj4gDQo+IEhlIG1l
YW5zIHNlcGFyYXRpbmcgdGhpcyBwYXRjaCBmcm9tIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgdGhh
dCBoZQ0KPiBwdXNoZWQgLSB3aGljaA0KPiBpcyBva2F5LCBhcyBpdCdzIGEgYml0IG1peGVkIGFu
eXdheSA6LSkNCj4gDQo+IEJlc2lkZXMgLi4uIE1vdWR5LCBjYW4geW91IHBsZWFzZSBoZWxwIHRv
IGNsYXJpZnkgdGhlIGRlc2NyaXB0aW9uIG9mDQo+IHRob3NlIGNsb2Nrcz8NCj4gDQo+IENoZWVy
cywNCj4gQW5nZWxvDQoNCkdyZWV0aW5ncywNCg0KTWF5IEkgYWRkcmVzcyB0aGUgY2hlY2sgZXJy
b3IgYnkgYWRkaW5nIDIgZnVuY3Rpb25hbCBkZXNjcmlwdGlvbnMgYW5kDQpzcGVjaWZ5aW5nICdt
aW5JZWltczogMScgZm9yIHRoaXMgcHJvcGVydHksIGFuZCBhcHBseSB0aGUgbGltaXQgYnkNCnNl
dHRpbmcgJ21heEl0ZW1zOiAzJyBpbiBNVDgxOTUgYWRkaXRpb25hbCBjb25kaXRpb24/DQoNClNp
bmNlcmVseSwNCk1vdWR5IEhvDQo=
