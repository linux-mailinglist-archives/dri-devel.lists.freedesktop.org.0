Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6548BA69E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 07:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7358410EC68;
	Fri,  3 May 2024 05:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Aoa9gLnX";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ia9PIOT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4510EC68
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 05:29:33 +0000 (UTC)
X-UUID: 1ce28352090e11ef8065b7b53f7091ad-20240503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=kb+Ayo0ha20fP36OGLyOyM/HbFm6hZYoZ8pazsvg1ow=; 
 b=Aoa9gLnXNs9aCN0W20UqpbJxFW3hRtYuh7V96xd5O5nMImEZEndo9ylQxBPlZl6cct8ngH2gze/oQ1Fa12QM44upQHdyfFb+mmLAVaa6gh0Na/P1bvjzC7KsPe7nRK88cAx1mGyqt1FRwJg7K/ESueiR2zxi+3COJLfrWekXi1g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ff5fd8c3-40a0-43bc-bc13-0b754308ef72, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:87cea2fb-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1ce28352090e11ef8065b7b53f7091ad-20240503
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 84144269; Fri, 03 May 2024 13:29:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 May 2024 13:29:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 May 2024 13:29:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMBBMMDbARNf8TAPvsJDZZwoSwkmhnL6tKHjfeCSHdkMiB9pk2FTa2tjkK1NF86uw5k97m9v5wEvwsrWRCwCekT6tTxkeD1Dy0ojL5QAwc2N8ChIbYcAsznzXlPM700gwJQQeowx5nBFd86qoAyhKXcaVyCP2vuiBoG5nwP4H2TTY5udbrpqCEu0W+NPAV6jbwDqTIxYG8kqioTwkmPKUqFQiafcPrLDeLpXTKs17Z4HPqVnLyQxFKybp+kW2rL5ss6zPM40d1bWB8VjVamMAXbJJqa1Qwhnz5YtW+yWjSvGAJ0hEMq3uD09gbWPKsjJbNJdrWWPFv812rU/aef39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXaBgYgenpBbk4tHuVYf0WU5BJDSW96QbcjaajCNPp4=;
 b=KqWfkm9664IWeyXkf9w049fUu1O81a+xf7V2ItjcUhGke2xQRW5HWWLvdrHQSx5Wcby4iW5KPo+lzD96hKp9yOiZkZDbiQ6sJLZAsuQhSKIBVsEoZ1fY+m9a5KFn5Ti3N0cQk+8hVRgBVp7GcEPH2tcFk+OjjH13GUSpn3gGBpsxsuOM095JxlXpmAw6X5K2calLZhhgVohrzR5LHD/1lGMeoSN93jxWmnJBmzr10q2aEn0zHG0GrpbXwG3IvFkjBQg+PDHbIc18gJ0rNNuBDIiz+M7g6XBcVxnepAxe8SAKI6UkCMKn37kOtp6NgTPsVbMyk1StjiTMULsIv/41Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXaBgYgenpBbk4tHuVYf0WU5BJDSW96QbcjaajCNPp4=;
 b=ia9PIOT8ZrvBPmOxMwXaee41YQrqo12dcPvkeBe4xa/iiLv47C/Xdqb9JlKsG2PG5v9o2SdH2FpnQvhgObiecgSm3GMzig6xHa8mG2l0t6NUXshxHc7LDvR/e4V3ygPC2E2bSMd8xbkACjSYyDD0mOEXIn1pyiNaNIK51hGg+ZQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8439.apcprd03.prod.outlook.com (2603:1096:405:73::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 05:29:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 05:29:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 09/18] drm/mediatek: Support constant blending in OVL
Thread-Topic: [PATCH v7 09/18] drm/mediatek: Support constant blending in OVL
Thread-Index: AQHanH0LihYW7HR1qEKfMRscOmQkPrGE/L6A
Date: Fri, 3 May 2024 05:29:25 +0000
Message-ID: <d96ba0780c8b42257b0a60b4878e4cf229536de8.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-10-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-10-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8439:EE_
x-ms-office365-filtering-correlation-id: 3381e0b5-dd44-4ae2-8470-08dc6b31ff32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?Nnk5a3FEQTVjU0dMcjhtY0ZrQjZzTzhxU3AvVjA0WGFmQ01YK01JakVlYTdu?=
 =?utf-8?B?aVZiVEdRdytlYXF6VUNYbjhpN2lvSFhCT2F1L09sWWxkMDFDNGY4VFh1ZlNY?=
 =?utf-8?B?K0g3NU10L3BJTW9MTGxLOUZ5MWNYRENKaS9tSWk5UzBUZEIxbVNkMUNkaU5Z?=
 =?utf-8?B?aXNwY0l3UHJzVnhwVEtmZFhYbzhOcUY1Tk9mZ0FCTUJDTythK2xxV0F6ZnBD?=
 =?utf-8?B?WWlNczBGRTkyc3RjdzB6YlNldlA2YlZTL2VhTmpaUiszVkxwK0htLzd4K1kr?=
 =?utf-8?B?OVBZdnhwRU9kWkFGSmEwa2tBTkZZcmtkc3FBa3ZISVBBY0txRlgxeldVVGJ0?=
 =?utf-8?B?SGFYNElDMExBV2RPUnZoeTliZG1vN25PekE4NzdlMVA0ZXhaVlc4Tm9EOEZp?=
 =?utf-8?B?ZVgwTG1nSk5RdXJ1Z1o5SXYvdm9TUzN3aEUzUzJGVmVza2Q0bnpQZTJQanRZ?=
 =?utf-8?B?KzVJc0htVHN3RjZEbWFsZlMrRitPaFdTSlIva2J3MStiSU9FUndhQmhvZnZn?=
 =?utf-8?B?Yk1KZURjQU9OYWkxcVRuS2o2NmowUHlLWUFsUUxVUy9aYVpzbUU5eVJlQUNx?=
 =?utf-8?B?OWsvQTJBMVRFUmNFWkFZVU9KYzJ2VmUxNHo2WXZlY3ZsY3NQTTBENnJzSHQw?=
 =?utf-8?B?T3B4THh6UXdCMEY1OTdtRytnSFZiWXlZYTYxYlBZVU53NHhLSjlHNVlsbEhz?=
 =?utf-8?B?RDF5VGFBczU0V1Nvd294dnhraG5tVGM5VU12enJFUG9MUVVPREJKcitkVXU1?=
 =?utf-8?B?aUp3TW8zK2JJS2hWUVJTUEc3NWROT1BPWFpHeVI3eE03OW5GQ2hHR3V3Vnkw?=
 =?utf-8?B?cVNGUEkyclRiNzZ4a1oyeEt5emtTeS9OanJsMXlkVm1tdHdRQStKSk85Qm8y?=
 =?utf-8?B?NUIvd3ZkSm9pcXBOdDJkcWs0WG5JeVdSVHcvcGdIUGdoZzRNaVZ1SFdMZTJG?=
 =?utf-8?B?dTBJSU5qRk1XM3lOUjVBMXZUaFJOdDFQSWhMK0l2eXN4c0ZQN3FXR0NXVTlw?=
 =?utf-8?B?MUpVUlRqR05PQkJIdjhIbUVuNDJDTUdIbUlLSHJGdC9MbmVUd0dHNVk5Sm9T?=
 =?utf-8?B?UjJ3eXFDSVN4ZFlJZmRKTy9ka3c0UU1CTU9iTHI0a0txWC9ZQkZ2bko4SndL?=
 =?utf-8?B?UVVEZ044UW9QV1I1RnZrSWJhN3NMYzFnNTlSaXVwTXBlaFFpWDN6SVBtVWJE?=
 =?utf-8?B?RHNVK2lBR29TcXN6blpIKzg1YTRBeWVrUU05RjBIMUV5eEJKSW9jN09md2ZB?=
 =?utf-8?B?Mzl5NjRucWN1V3pBYkw5VGtyOVVGbkx5amJ1RG1QOCtNUlArSTVmWmxZUks1?=
 =?utf-8?B?SmhmaUVKZTBQMFhCQUFYZllId2tZS3BRbnJTNG9hT1NDOEVucU1OcDNuUUZO?=
 =?utf-8?B?cUxnWkNkZW53UDFFK0xMK1l1NDNCY3pFd0dlMXNMVG5GamFvZnYzU08yeldn?=
 =?utf-8?B?YlVSTUY0MGZTUlBhMWFzNWE2YlRjd0tSSVpSeFVOUXIxeUViNUtQaGJOdUdt?=
 =?utf-8?B?TklCbDlaVXNGTkVWSTZkMXVDVHVrUkFDM3p6L0RGN3lBa21mQnB5bkR0ZWZV?=
 =?utf-8?B?N2JZK1oyY09jRFNhZUdkZW50ajQxTit3amdRVkNtN2ROakRBbTV6QVNDZi9R?=
 =?utf-8?B?OTlhdGd4djJMZUtGYkd6RG5xYkwzQmJOeE13QnpYTWdFVVNTRXNSRE5jc1Rz?=
 =?utf-8?B?cDlEMXhsT0ZENm5qckVFMElsOG5IbnI4SnhkUEtwUjhCMDMvSWNkM1JRNjBR?=
 =?utf-8?B?SmJoQjJUMTdyUExQRmN5VHpxU3N2MHNlV25OVDRldForSG9leWpLaWI4djh5?=
 =?utf-8?B?bW5FUi9oY21tVlh1Z3ZIZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjE1OUVzaGhjQWVObHhLK01wazhnWFJSeStVWWwwenJlMVFUOUpuTEk0VTV5?=
 =?utf-8?B?T0lzSTNocnk2Nmx1T2VWY1JJeTVYMHlHbk1JTFhRMWxHblZsTzR0bnB1b1Ey?=
 =?utf-8?B?RkxXQUNtV1huaFU1cjBtTzZyc3NVYU03YTVBRlJZS0JCR3FMYXYxNzBVS3Bh?=
 =?utf-8?B?azZHYmJPaVd0c0xaMkdGcGZEYlE3ZWdhT3ZVS01wQzZKQXdrY2ZqZEdQNm5K?=
 =?utf-8?B?bU95YWh3MENOTmM4NjVCVklZdXQ1T0pMMzE2TExwUnNLQ09RTVhzTk5TVERS?=
 =?utf-8?B?RER3L0ZUSk5zekhWMjk3RHFoTG9iK1Q3RGhYYzRTVy80TGZwUFhkQTJCR3Zv?=
 =?utf-8?B?Y2RGV2t3ZkRzU2ZlYlFxT1lUU3Z3a3pmNi9SOVVkUHN4VDdGT3pOcDB2L2dI?=
 =?utf-8?B?dkZBTnhqWTlmbjR2WFNUVStCTnoySHljcHcyK1ZBYm1EV3BjREtiVHRKb2pT?=
 =?utf-8?B?dEdITStvV3QyYmlNSk1PR3pTVkl6cmRqWDZFVTVoTWczVnNWaW1QdTFFUnNR?=
 =?utf-8?B?eW9JMW1idGpWdWZCUmVFVDNkdEthYXpIeGYyZklkQk5wZWxyQjNHWXdEQmdj?=
 =?utf-8?B?R1RoR2JHVGR2TTlRZDBrMTVBS2R4clNIWmN3YjhtVkZxRnArWjJQT2VpYTc0?=
 =?utf-8?B?QldUbzNpZUJIUEJzRmdqL2hQdGRaR1ZEb2ZKVngxYVBrYWJOVm9RVnlpbHAv?=
 =?utf-8?B?NGxyTUtFSys3N1JUeWtmdEVURWdseFNESkpXTEtGSnVYcm9tdDhEQkMybENl?=
 =?utf-8?B?N3FjRTJIWkk3TWdoeW9wMmI3azRjakp1T09NYUh5WWZyRU5YWFVla0ZNLzlV?=
 =?utf-8?B?L2tCZERhc3Z6ZHNORWJzN0YyQ0RHSTU2R1NsS2FXL1VocjhGOUtNeGMxSWk1?=
 =?utf-8?B?NW5MWlI0ak5MR0RabUJqUC9jQnUwOE5pZjdFbW1LdmoySU90RGxQZHhzRnE0?=
 =?utf-8?B?SVFPQUVyTWtVMXRqMEZLMFovaEVoNlVuWUpIeitlUnBTdEd3YjZ2MjNUc1FK?=
 =?utf-8?B?SUN4aTkyd3hRVmRVazh3WE5jcFZsTjRya0hzS2tqR0ZjdkV4eFlFY3VtK3Z2?=
 =?utf-8?B?NzR3RC9od1JvYzVwVyt3bEJMWXZQZkdJQ2IvQUdSckJ6TDducjJ1U0JmSk9v?=
 =?utf-8?B?TWw5YmpUa2dJc21UVFZlRWQ0TEVVZDhFSmNxZ2lJM2FXMTIxQmhxa1dFYjlw?=
 =?utf-8?B?QzkvQXhOb1hLQm9qUG84bjYxUTlPdmxwdjhXWjJ1Q09EUldBK2lzdVpxdTFJ?=
 =?utf-8?B?VDU3eWtTa2FXM2MzZ05Ud0h2dExZSmJlZThTUmo0azNsaXZRSy95NDlLdUts?=
 =?utf-8?B?KzcyV0hWczJtU21uTGRVQ2RPbi9IRU5zV2pUc1M4UGx1a2dBQStuSW9PdWNK?=
 =?utf-8?B?aTlJOVZqWVlSYmRkUDRGdytvTFpHbTY0eFVwajlGSlI0TjFOWkUxNC9JSUR4?=
 =?utf-8?B?NGMzSnJLK2E1SE85SWN5Qjc3UWMxVHZPS0s1cHVjSitzQzRnb2NnUWs4Mk5W?=
 =?utf-8?B?QVVKdjVMOWMwNFJzRStuM1BnNWpyWElHMHBLUnpWVTlPM2x4dzhjKzRNa0lz?=
 =?utf-8?B?UjM1SE5oMmltUTE1RUFCL01jbmJIYitDUk5zcjBaWUJqYWYzWTZXbjZ5MWQ2?=
 =?utf-8?B?WXNsU2cxMmhWTm9rVkhzZkU0L3JMWG9QSjVsOXEyelQvemRmVitENW1HZlhM?=
 =?utf-8?B?VE85b0ZPdy9jelh5NFZ2WGh6Mk5wb3UvSDRGa1VoYVhrdElkbm9PTVZ1cG4r?=
 =?utf-8?B?SlRKampkWDRwVHVrQUlwNytGSHhwc3JQT0k0K0VBbXVRQklST0pyVExydXN0?=
 =?utf-8?B?cTNoUTNmamphWXZzd3hrdjRFSzh6VHVGWXpMNmFYalU1YlBzTS9rY2wrTExr?=
 =?utf-8?B?RUFLckVDbXVsekR5OTgybnd3cmYzTmJUeEhINU5zK0xDZkJQWnFLajNkT2Ns?=
 =?utf-8?B?Uk5XR3JXa2pxZDBrTUpidW9hUDdXeEF4NVV0dzBIMlpwOW8rdWF2NjF0OXdK?=
 =?utf-8?B?V0FxWXo2OC9Dckd1UEpsM0tHN1ZuUEY1bTd0d3R5aWJ6Z1FidG8xRmtzVHZ2?=
 =?utf-8?B?clh2T24xQWVNeVdkczlqZCtqd3A5U3MyazY0QVh4aXV6Q2lTaW1kSDk1b1RW?=
 =?utf-8?Q?K94btZktWYNltQHFasFbcBTXv?=
Content-ID: <1B1BDF8A4000A74B8E7AE70D58EDA604@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3381e0b5-dd44-4ae2-8470-08dc6b31ff32
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 05:29:25.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0TA5rfRFuZTioCUjESubomPyS3BSlKP8FBnivATkDHsPrX7cvZ2qxRRKC3Ws6W7K+hyl+tyGbz45Lm+FGKAuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8439
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_725080714.1156498077"
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

--__=_Part_Boundary_006_725080714.1156498077
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gU3VwcG9ydCBjb25zdGFudCBhbHBoYSBibGVuZGluZyBpbiBPVkwuDQoNCldo
YXQgaXMgY29uc3RhbnQgYWxwaGE/IEkgc2VhcmNoIGluIHdpa2lwZWRpYSBidXQgZmluZCBub3Ro
aW5nIGFib3V0DQpjb25zdGFudCBhbHBoYS4gVGhpcyBpcyBub3QgYSBjb21tb24gdGVybSwgc28g
ZXhwbGFpbiBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhzaWFv
IENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDkgKysrKysrKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCA3MzgyNDRhNjE2NGU4Li5l
NDFmZDgzZTM2ZTc5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jDQo+IEBAIC0zOCw2ICszOCw3IEBADQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9QSVRDSF9N
U0IobikJCSgweDAwNDAgKyAweDIwICogKG4pKQ0KPiAgI2RlZmluZSBPVkxfUElUQ0hfTVNCXzJO
RF9TVUJCVUYJCQlCSVQoMTYpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9QSVRDSChuKQkJCSgw
eDAwNDQgKyAweDIwDQo+ICogKG4pKQ0KPiArI2RlZmluZSBPVkxfQ09OU1RfQkxFTkQJCQkJCUJJ
VCgyOCkNCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JETUFfQ1RSTChuKQkJKDB4MDBjMCArIDB4
MjAgKiAobikpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9SRE1BX0dNQyhuKQkJKDB4MDBjOCAr
IDB4MjAgKiAobikpDQo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9BRERSX01UMjcwMQkJMHgwMDQw
DQo+IEBAIC00MjgsNiArNDI5LDcgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+IHVuc2lnbmVkIGludCBpZHgsDQo+ICAJdW5zaWduZWQgaW50IGZtdCA9
IHBlbmRpbmctPmZvcm1hdDsNCj4gIAl1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gKHBlbmRpbmctPnkg
PDwgMTYpIHwgcGVuZGluZy0+eDsNCj4gIAl1bnNpZ25lZCBpbnQgc3JjX3NpemUgPSAocGVuZGlu
Zy0+aGVpZ2h0IDw8IDE2KSB8IHBlbmRpbmctDQo+ID53aWR0aDsNCj4gKwl1bnNpZ25lZCBpbnQg
aWdub3JlX3BpeGVsX2FscGhhID0gMDsNCj4gIAl1bnNpZ25lZCBpbnQgY29uOw0KPiAgCWJvb2wg
aXNfYWZiYyA9IHBlbmRpbmctPm1vZGlmaWVyICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUjsNCj4g
IAl1bmlvbiBvdmVybGF5X3BpdGNoIHsNCj4gQEAgLTQ0OSw2ICs0NTEsOSBAQCB2b2lkIG10a19v
dmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gdW5zaWduZWQgaW50IGlkeCwN
Cj4gIAlpZiAoc3RhdGUtPmJhc2UuZmIgJiYgc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2Fs
cGhhKQ0KPiAgCQljb24gfD0gT1ZMX0NPTl9BRU4gfCBPVkxfQ09OX0FMUEhBOw0KPiAgDQo+ICsJ
aWYgKHN0YXRlLT5iYXNlLmZiICYmICFzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEp
DQo+ICsJCWlnbm9yZV9waXhlbF9hbHBoYSA9IE9WTF9DT05TVF9CTEVORDsNCj4gKw0KPiAgCWlm
IChwZW5kaW5nLT5yb3RhdGlvbiAmIERSTV9NT0RFX1JFRkxFQ1RfWSkgew0KPiAgCQljb24gfD0g
T1ZMX0NPTl9WSVJUX0ZMSVA7DQo+ICAJCWFkZHIgKz0gKHBlbmRpbmctPmhlaWdodCAtIDEpICog
cGVuZGluZy0+cGl0Y2g7DQo+IEBAIC00NjQsOCArNDY5LDggQEAgdm9pZCBtdGtfb3ZsX2xheWVy
X2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IHVuc2lnbmVkIGludCBpZHgsDQo+ICANCj4g
IAltdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIGNvbiwgJm92bC0+Y21kcV9yZWcsIG92
bC0+cmVncywNCj4gIAkJCSAgICAgIERJU1BfUkVHX09WTF9DT04oaWR4KSk7DQo+IC0JbXRrX2Rk
cF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBvdmVybGF5X3BpdGNoLnNwbGl0X3BpdGNoLmxzYiwN
Cj4gJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gLQkJCSAgICAgIERJU1BfUkVHX09WTF9Q
SVRDSChpZHgpKTsNCj4gKwltdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIG92ZXJsYXlf
cGl0Y2guc3BsaXRfcGl0Y2gubHNiIHwNCj4gaWdub3JlX3BpeGVsX2FscGhhLA0KPiArCQkJICAg
ICAgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gRElTUF9SRUdfT1ZMX1BJVENIKGlkeCkp
Ow0KPiAgCW10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwgc3JjX3NpemUsICZvdmwtPmNt
ZHFfcmVnLCBvdmwtDQo+ID5yZWdzLA0KPiAgCQkJICAgICAgRElTUF9SRUdfT1ZMX1NSQ19TSVpF
KGlkeCkpOw0KPiAgCW10a19kZHBfd3JpdGVfcmVsYXhlZChjbWRxX3BrdCwgb2Zmc2V0LCAmb3Zs
LT5jbWRxX3JlZywgb3ZsLQ0KPiA+cmVncywNCg==

--__=_Part_Boundary_006_725080714.1156498077
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1N1cHBvcnQmIzMyO2NvbnN0YW50JiMzMjthbHBoYSYjMzI7YmxlbmRpbmcmIzMyO2luJiMzMjtP
VkwuDQoNCldoYXQmIzMyO2lzJiMzMjtjb25zdGFudCYjMzI7YWxwaGEmIzYzOyYjMzI7SSYjMzI7
c2VhcmNoJiMzMjtpbiYjMzI7d2lraXBlZGlhJiMzMjtidXQmIzMyO2ZpbmQmIzMyO25vdGhpbmcm
IzMyO2Fib3V0DQpjb25zdGFudCYjMzI7YWxwaGEuJiMzMjtUaGlzJiMzMjtpcyYjMzI7bm90JiMz
MjthJiMzMjtjb21tb24mIzMyO3Rlcm0sJiMzMjtzbyYjMzI7ZXhwbGFpbiYjMzI7aXQuDQoNClJl
Z2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lh
byYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsN
CiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMmIzMyO3wmIzMyOzkmIzMyOysrKysrKystLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2Rl
bGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCiZndDsmIzMyO2IvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7NzM4MjQ0
YTYxNjRlOC4uZTQxZmQ4M2UzNmU3OSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQomZ3Q7JiMzMjtAQCYjMzI7
LTM4LDYmIzMyOyszOCw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtESVNQX1JF
R19PVkxfUElUQ0hfTVNCKG4pKDB4MDA0MCYjMzI7KyYjMzI7MHgyMCYjMzI7KiYjMzI7KG4pKQ0K
Jmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtPVkxfUElUQ0hfTVNCXzJORF9TVUJCVUZCSVQoMTYp
DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9QSVRDSChuKSgweDAwNDQm
IzMyOysmIzMyOzB4MjANCiZndDsmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOysjZGVmaW5lJiMz
MjtPVkxfQ09OU1RfQkxFTkRCSVQoMjgpDQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1Bf
UkVHX09WTF9SRE1BX0NUUkwobikoMHgwMGMwJiMzMjsrJiMzMjsweDIwJiMzMjsqJiMzMjsobikp
DQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0RJU1BfUkVHX09WTF9SRE1BX0dNQyhuKSgweDAw
YzgmIzMyOysmIzMyOzB4MjAmIzMyOyomIzMyOyhuKSkNCiZndDsmIzMyOyYjMzI7I2RlZmluZSYj
MzI7RElTUF9SRUdfT1ZMX0FERFJfTVQyNzAxMHgwMDQwDQomZ3Q7JiMzMjtAQCYjMzI7LTQyOCw2
JiMzMjsrNDI5LDcmIzMyO0BAJiMzMjt2b2lkJiMzMjttdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1
Y3QmIzMyO2RldmljZSYjMzI7KmRldiwNCiZndDsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2lk
eCwNCiZndDsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7Zm10JiMzMjs9JiMzMjtwZW5k
aW5nLSZndDtmb3JtYXQ7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO29mZnNl
dCYjMzI7PSYjMzI7KHBlbmRpbmctJmd0O3kmIzMyOyZsdDsmbHQ7JiMzMjsxNikmIzMyO3wmIzMy
O3BlbmRpbmctJmd0O3g7DQomZ3Q7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO3NyY19z
aXplJiMzMjs9JiMzMjsocGVuZGluZy0mZ3Q7aGVpZ2h0JiMzMjsmbHQ7Jmx0OyYjMzI7MTYpJiMz
Mjt8JiMzMjtwZW5kaW5nLQ0KJmd0OyYjMzI7Jmd0O3dpZHRoOw0KJmd0OyYjMzI7K3Vuc2lnbmVk
JiMzMjtpbnQmIzMyO2lnbm9yZV9waXhlbF9hbHBoYSYjMzI7PSYjMzI7MDsNCiZndDsmIzMyOyYj
MzI7dW5zaWduZWQmIzMyO2ludCYjMzI7Y29uOw0KJmd0OyYjMzI7JiMzMjtib29sJiMzMjtpc19h
ZmJjJiMzMjs9JiMzMjtwZW5kaW5nLSZndDttb2RpZmllciYjMzI7IT0mIzMyO0RSTV9GT1JNQVRf
TU9EX0xJTkVBUjsNCiZndDsmIzMyOyYjMzI7dW5pb24mIzMyO292ZXJsYXlfcGl0Y2gmIzMyO3sN
CiZndDsmIzMyO0BAJiMzMjstNDQ5LDYmIzMyOys0NTEsOSYjMzI7QEAmIzMyO3ZvaWQmIzMyO210
a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7aWR4LA0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHN0YXRlLSZn
dDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjtzdGF0ZS0mZ3Q7YmFzZS5mYi0mZ3Q7Zm9ybWF0
LSZndDtoYXNfYWxwaGEpDQomZ3Q7JiMzMjsmIzMyO2NvbiYjMzI7fD0mIzMyO09WTF9DT05fQUVO
JiMzMjt8JiMzMjtPVkxfQ09OX0FMUEhBOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytpZiYj
MzI7KHN0YXRlLSZndDtiYXNlLmZiJiMzMjsmYW1wOyZhbXA7JiMzMjshc3RhdGUtJmd0O2Jhc2Uu
ZmItJmd0O2Zvcm1hdC0mZ3Q7aGFzX2FscGhhKQ0KJmd0OyYjMzI7K2lnbm9yZV9waXhlbF9hbHBo
YSYjMzI7PSYjMzI7T1ZMX0NPTlNUX0JMRU5EOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtp
ZiYjMzI7KHBlbmRpbmctJmd0O3JvdGF0aW9uJiMzMjsmYW1wOyYjMzI7RFJNX01PREVfUkVGTEVD
VF9ZKSYjMzI7ew0KJmd0OyYjMzI7JiMzMjtjb24mIzMyO3w9JiMzMjtPVkxfQ09OX1ZJUlRfRkxJ
UDsNCiZndDsmIzMyOyYjMzI7YWRkciYjMzI7Kz0mIzMyOyhwZW5kaW5nLSZndDtoZWlnaHQmIzMy
Oy0mIzMyOzEpJiMzMjsqJiMzMjtwZW5kaW5nLSZndDtwaXRjaDsNCiZndDsmIzMyO0BAJiMzMjst
NDY0LDgmIzMyOys0NjksOCYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19vdmxfbGF5ZXJfY29uZmln
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LA0KJmd0OyYjMzI7dW5zaWduZWQmIzMyO2ludCYj
MzI7aWR4LA0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7bXRrX2RkcF93cml0ZV9yZWxh
eGVkKGNtZHFfcGt0LCYjMzI7Y29uLCYjMzI7JmFtcDtvdmwtJmd0O2NtZHFfcmVnLCYjMzI7b3Zs
LSZndDtyZWdzLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtE
SVNQX1JFR19PVkxfQ09OKGlkeCkpOw0KJmd0OyYjMzI7LW10a19kZHBfd3JpdGVfcmVsYXhlZChj
bWRxX3BrdCwmIzMyO292ZXJsYXlfcGl0Y2guc3BsaXRfcGl0Y2gubHNiLA0KJmd0OyYjMzI7JmFt
cDtvdmwtJmd0O2NtZHFfcmVnLCYjMzI7b3ZsLSZndDtyZWdzLA0KJmd0OyYjMzI7LSYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO0RJU1BfUkVHX09WTF9QSVRDSChpZHgpKTsNCiZndDsmIzMy
OyttdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsJiMzMjtvdmVybGF5X3BpdGNoLnNwbGl0
X3BpdGNoLmxzYiYjMzI7fA0KJmd0OyYjMzI7aWdub3JlX3BpeGVsX2FscGhhLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyZhbXA7b3ZsLSZndDtjbWRxX3JlZywmIzMy
O292bC0mZ3Q7cmVncywNCiZndDsmIzMyO0RJU1BfUkVHX09WTF9QSVRDSChpZHgpKTsNCiZndDsm
IzMyOyYjMzI7bXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCYjMzI7c3JjX3NpemUsJiMz
MjsmYW1wO292bC0mZ3Q7Y21kcV9yZWcsJiMzMjtvdmwtDQomZ3Q7JiMzMjsmZ3Q7cmVncywNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7RElTUF9SRUdfT1ZMX1NS
Q19TSVpFKGlkeCkpOw0KJmd0OyYjMzI7JiMzMjttdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9w
a3QsJiMzMjtvZmZzZXQsJiMzMjsmYW1wO292bC0mZ3Q7Y21kcV9yZWcsJiMzMjtvdmwtDQomZ3Q7
JiMzMjsmZ3Q7cmVncywNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVw
bHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhl
ciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_725080714.1156498077--

