Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8890A38F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DAB10E1A2;
	Mon, 17 Jun 2024 06:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HVTzx6x+";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iizXwqIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C0510E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:00:34 +0000 (UTC)
X-UUID: e648c6882c6e11efa54bbfbb386b949c-20240617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=IwKw1gnEffA6m9SuFVsfEBNiXqPD45DIYfwxsvI1zyA=; 
 b=HVTzx6x+KJrl3g1/NWPDrziChVMmyPrMOG2NQx2Qlnl4R73+ft6YfjM2+H1RfMdvpXOdTekUA75Qo0m8BZnxFoRhshwoTSeeSN5muu4/+6BghH6tqAJxy+Vpb9bW6tRRwiTqd/kTwFQ5knypF7Vkr0eICUi4lJbbK0wKfl9rnCQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:e9d2b82b-bfcb-4204-a585-2c74d9ebd0bb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:8965a944-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e648c6882c6e11efa54bbfbb386b949c-20240617
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1573324805; Mon, 17 Jun 2024 14:00:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 17 Jun 2024 14:00:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Jun 2024 14:00:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlFEGIFrPB18LoxI6XgMgEWUvjT+mYPW1Snu8wU5yuxd0AQICYNqPetTgTzwrvTeXv/9Yix/O6pJWgLRw+ONGviWGc7LetUkvAm+XMwuogxhFVi6Cfgrc0uG++ShxA+Mkgz1QrG5gkw69hLWLpaL52BlKJlOB7Z64bAFfR5sOtJbpezPhtajdsmprKdY9L0zUl75fx88O6lo9zsbqTIRGGn52NtmtTapm9+5gThWMRf7AervKCtOrt3QeERwQijuMh2ZB6xT77GzY1qjfLsPT9GtdBORN5D7RrgEfZpUL5dHnsuEH69bJS5Aeho7PHthYfawB7ogkYyT9Vtob8SzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwKw1gnEffA6m9SuFVsfEBNiXqPD45DIYfwxsvI1zyA=;
 b=C0XrEJJ0VP6hH01czwgAqAguu5qaLoUSY4+ufLTblCSecdYwTFoQ/fOnh8DFx7Ivd+jlf1IsPqI7znoU5a5Eam/FoxzsEsNKi/PylWr6oU43m2gx2aWjbi4snkDmVuPnIgMguM9AZvhmVqD/UAYpqA+IKNgvne9ivxgZUUIDU/MHvOj3368KAxh+mL385/AjDvgyZ20zqFp7MGVGIN8sb5ZVvPlcoTae8qnOH+v2acQmPfNaa8T5y/i2AA34fu2btEwv8HtB3jEb3/EpCqbQ+VJzD4J9ULbbvflxTWASduMj7bwhK85bUeAOXyMooG3gW8j8pWB/xwRkK1oukYy1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwKw1gnEffA6m9SuFVsfEBNiXqPD45DIYfwxsvI1zyA=;
 b=iizXwqITrIN4dyo3olaQ/jZOcLtMpcg6jeQay/TwynebLPwwqChWsVgGxhFhMZhPCDZoiOveVQjb4MGhJ3DkiPKg9FmBuzkKvnalNqKOWPHIotS+MZndiuVwmK1S/HoOi35CQauElWfTpU8ELrIhvwXRgrADDxF+CDEsxenbSkM=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYZPR03MB6669.apcprd03.prod.outlook.com (2603:1096:400:1f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Mon, 17 Jun
 2024 06:00:25 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:00:25 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tfiga@chromium.org" <tfiga@chromium.org>, "frkoenig@chromium.org"
 <frkoenig@chromium.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "wenst@chromium.org"
 <wenst@chromium.org>, "jstultz@google.com" <jstultz@google.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nicolas.dufresne@collabora.com"
 <nicolas.dufresne@collabora.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "jkardatzke@google.com"
 <jkardatzke@google.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "tjmercier@google.com"
 <tjmercier@google.com>, "sebastian.fricke@collabora.com"
 <sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v6, 19/24] media: mediatek: vcodec: disable wait interrupt
 for svp mode
Thread-Topic: [PATCH v6, 19/24] media: mediatek: vcodec: disable wait
 interrupt for svp mode
Thread-Index: AQHaqEAT5MGeXjaYP0u415qX7SP/HrHLpsiA
Date: Mon, 17 Jun 2024 06:00:24 +0000
Message-ID: <43b2632e045af2fd18df3a37d52655b196eae4d3.camel@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-20-yunfei.dong@mediatek.com>
 <81b099b1f70253501c39b7d538f9759c64bc880e.camel@mediatek.com>
In-Reply-To: <81b099b1f70253501c39b7d538f9759c64bc880e.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYZPR03MB6669:EE_
x-ms-office365-filtering-correlation-id: fe0fea8d-3487-4d39-c626-08dc8e92c7ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|7416011|1800799021|376011|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?WVRxNy82SnlXcGZRTnBkeG8wT3h6ZDdmelZnME9mbWZHbnpJaGZvUEovQVNr?=
 =?utf-8?B?U2ozaVdJY2h3YUxEQmZrcEhySUR2SENWVkxHT1JDVnRjVHhsQXErdm5tdzNK?=
 =?utf-8?B?amFraDg0WWNYSjVEWnU4WldsVnJGL1ZGakt3NGNIdkV6ZTcxYUJwd1Qxc2hJ?=
 =?utf-8?B?S3QzV1RZQkZ1OVpEdDRxQjVDWDJXSC9pSHZ0elJZNnBnUjFRdkxvQ2xQQ0Ex?=
 =?utf-8?B?bjJITEtMOEljaGFSWDF0ZFJKek9kc0M4Y1hlTzNPUXZ2Q1JkUFcyUzhodE13?=
 =?utf-8?B?OFBDamFxdm42TWF4NnlUZWVsdXhUNGhld0RYS2JBQ2s2TWx1MFI4NWRmYlRV?=
 =?utf-8?B?MEU5VHcvd0kweFpzU1IxRTF1aUhuZWdxRUppSTlnUmZEUXcwaVhXdzhxdlZl?=
 =?utf-8?B?ZXAvUFBHVFZwL0lkb2JzM0FqRFA3QWZodVBRMnpYb3ZsVFVsalNMWFZNcVhE?=
 =?utf-8?B?bkJhVWszckVka05XNlB5RlRkSU5tdDJoeWQrWDZ1ZUxMOHE5V1NYTWdBZlR1?=
 =?utf-8?B?MlJVT3htdTRHZGpVS2ZraVlRK0gvcGx1WS9DeC9sWEZHMlQzRGpjZ2dsQ2M2?=
 =?utf-8?B?YVg4bGVCT3lYNUNEeEx2Z0ZadjUyeFhRRnU0Nm03Q1g4TitlVXBjZFFjRFZv?=
 =?utf-8?B?ZkpjdGhESXI5b1hrb1ZEakFKMld6dXBPNzNEUHQyUW1lL21EaTZ1cmNTYzJ6?=
 =?utf-8?B?dENTTUVJN0dOVXRXTEE3MTNTMDFST2xKWlI4NWlYaG8xVGU0ZDhJcjQ4Y3py?=
 =?utf-8?B?QjQzcXJtQ1NJSXdzaUw3ZWI1SFQwa1dmcmc1NG5BaENjWlcyS0hTZXZQbGMv?=
 =?utf-8?B?YWFXaVVsT1JSRC9STUlzTzFsMlFodnNOeFFUL3pGaFY2ODNzV2pHc3lsY3E3?=
 =?utf-8?B?S1NKUXJzWjdkUXd4NTZVQTl4cHFqWkEyTGU3VFN4S2ZyYWVQVjBYdU4vQ0xZ?=
 =?utf-8?B?elY4SnNFTE5rN2o5a0hQaWRlSkp2eTRMcmxzQXlSWVErb2p1UTczNWRlVWJw?=
 =?utf-8?B?Rm5tRWpUUm5mbFdRcWk2V3A0THc3cEZHajRYb2lMaWM1S0FJcE1NbUR0azRO?=
 =?utf-8?B?ZW1xS2JITmY3aUpyZTl2c1Y4WldBdk9IdkdGeGhwaUUxNlJ1MEhUeHVaM1pK?=
 =?utf-8?B?cFV0dW1EZkMzSUZnVWNkTzZiQnBicHduc01OWVk2VUExa3JWMDJGT01GSFE1?=
 =?utf-8?B?S0d2bEJXT3hpeTMxUUdDdjBhTlU4dzZidVhROHRNSzJnYjZ2NVk3dkpGQ3o0?=
 =?utf-8?B?UnRpR1pxeW1VSnVLdi9JZnBCZ3RLMkkxbUZQNi9LblRMTnB1MTNPNml4Z3Fm?=
 =?utf-8?B?ZUJUUUFUVWFyeU9Jc1NqcktmVWpMNUo4bGRrc0Z2eEhRWTZ4N1dqWkRRRlVK?=
 =?utf-8?B?dzl6dmxCcHUrMzQ0akJkWVljaWUzbWFrU21jSU44bk1JR3ZrOHlWdnp3NHNl?=
 =?utf-8?B?NkUxZjZ4OXlCdDVyZmo2UGFPcm9kOEkzREgydnZyZTAwdk1vaExObm5hc3RR?=
 =?utf-8?B?SGJOam5uNU1JTzBNS25ZQ2VCVStHdVd4RG96eFdkWUh2cUgyUUJMZ29YZWZv?=
 =?utf-8?B?QVk2SkhVVHV4TUdmNDNoNXVXQXgyaDVTWHdJZEdMMWFJKytBNnFGd01NeFp5?=
 =?utf-8?B?VUl2aDU1KzNUZlpVTlh6anBaU1NQRXZidDJwTnV3cVlWOTRLZTBtQjhFSTk2?=
 =?utf-8?B?eUQzL3ViQklpNitHajdBYVcyWC9La3hHVzd1bCsybUNGQktLckR2U1Q1U3hH?=
 =?utf-8?B?dlBFKyt1TVdYc01OZ0hCbjFBYmplU3lrcmE5U2M2a2hJNHBKRmt6NFB5MU53?=
 =?utf-8?Q?1a7cZkGs8qSdPzKMAOUj5UOBWfrSnQfSnc2i0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSQPR03MB8697.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(7416011)(1800799021)(376011)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WCtRNXNMaUZqYkUzTE5NV3FlMis1TmFqTnlyQlEraDFJMzd1Y2N1REwvRmt6?=
 =?utf-8?B?U0lHNG9MdkErWjhuWHNGZVpNSkF1R2kxQW9keEZ6dmtPRWpaT1RVaWtTTk0x?=
 =?utf-8?B?VEc0VjA3djZmaVY4MjA5Tkd4TmJwZFZIU2JlUzZzMnV1Z3FmMlF2TzV6dXpi?=
 =?utf-8?B?aHdYN0oyZ0RQa1ZzeCtpaSt4eThRb1lYbE54K0NCNWhCT3E1SEVoRmZSNnUv?=
 =?utf-8?B?RmlhZHplWC8zbjBuMmx6VE5PWWdCUmlMdElpRUZhUm0xQ3pQU0xGV0QwV2J2?=
 =?utf-8?B?a3J3dkdkRnhibnFPNHgyR3RYMXFud0drSzZ4UGs1SU9CckxVc3YyMEZrVTRE?=
 =?utf-8?B?RllSeGljYmlGeDlVa3FvbTFiNndpZG1KRERrb2FHWWpMQkRvZUxXc1lkNXAx?=
 =?utf-8?B?bUc0MDFDQk82TThVZ1ZEZkZBQmt0RXJQanA2UFlBRzJDTHh0aUpQb01xY1pT?=
 =?utf-8?B?SXhLQ0dlZHFLVVZma05mb1ZMRE1raDYzam5kVDBCMjZBNXlPMnFnczdXRkxk?=
 =?utf-8?B?M0NtMUdvVHh5RUtRU2padkNyaEFjdTE4UW9wWitqN3p1RDdNV3pOcWI0YUxu?=
 =?utf-8?B?UWNER1hWeURHUEorZHJSUVR0RVhPUVl2ZWRyNklwTExreUNNa3VEbGRzQlJl?=
 =?utf-8?B?aysxZldBNml4NzBxTndWdEoxcmNTM29RRHhyQmVFeEFtSkgwUERWMmxNZysz?=
 =?utf-8?B?YmFBei9XMFhoOU1oTTJVS0xMbDZRVkVuMG53Y1hNWHo1SEY1TFlVMFdmaGZi?=
 =?utf-8?B?SnlLNEhzNlBPREMxRmlLRDdiL1lEWmhWdjZGNU9EeUxBVUM3VFlZeEZoeHZM?=
 =?utf-8?B?L1JIdU1WK1Y3WGdDSDZZb3ZEcEVNRlFUR3IrNGZ2UzFrcXB1bTNJcG1tb1Ri?=
 =?utf-8?B?Q0VNS0ZvN3ZmNXkxRWFHbHovNmxwblZNczZnY0txUTd1c3p5bXlPOTMrRkd0?=
 =?utf-8?B?TkF6cjBobDJRLytUdHBQWHVhMUVOWStxYm5qZXlPQk5YN29jN3FxWi9ENStk?=
 =?utf-8?B?Y0ZQMkVoSjN4R3pVTEJZNklDMmtJTnlCU0pEVi94bUExbTFLWHdiMFp4OHNh?=
 =?utf-8?B?ckt6R3FQdCt1VWoxWW9qdDAwNFlKbmFCRmNUSnZvMmtGTGNhYU1hek5UTnh0?=
 =?utf-8?B?NkdMcEU5L09XMDVxT0xoaDA1WUtOVmVnYm54YzYvb3Nub3lTVW5rZXlhTE5M?=
 =?utf-8?B?emR2c1BVdytkM3grNWlSNVNZY3hOUGVCZ3h5R3FmRDN6a0I1OTVjSi9mL1lm?=
 =?utf-8?B?azF1WkoxL1duWE1hV2huSUk4N3I2U3dwUWpjTmVXYjRsSG1pNjRpSjh2cFlm?=
 =?utf-8?B?alo5b0tTRXdDVUFVbklQNXd6ZUM0clJUUHFpb2ZqT2djZ3VsNGp5UXNlVG5y?=
 =?utf-8?B?bGZFZWhKd2hhK2pjNmd0ZnlFQUFMbnNwWkdaMXRvL0Rpb3FxMUxYMFBIczAz?=
 =?utf-8?B?bnlGYzZpT1hZaVlqUmhKVGQwc1luSlh6T20rQ2c0M2dCOGdGY21vQkxOTjRC?=
 =?utf-8?B?UlFxbUxKNjcwYnhlZ0I3c1FTTWQ5SkhmZUEvVys4c2E5QzZRTkRCSTBtT1RN?=
 =?utf-8?B?cW1XRklWajNUUDdvemo2WFozSUJ5QTJSYkFzaldsdVZKTlppNTRWellJK256?=
 =?utf-8?B?MjJZZnVnbVVGQWFaM2NqRzd6QjV3eUJrckZTVVZwMkE3ZEdvbmlxYzJ3STJW?=
 =?utf-8?B?dkZpZVZYUy9COERzVHk0dTFuNEl4U2h2OE5SY01sOFQzaWNScmdhSzRiRXNy?=
 =?utf-8?B?UXIwV2h4NkFOSGo3b2h2a3VSRjJmMnVBWnpHUTM0S3dabW8xTzRvR3NhditI?=
 =?utf-8?B?RjYyUzlGZktRS2hmbGJQUElnOUR2Mkl1VXlxcCtySFdVOG1yZ1BqbURXVkc4?=
 =?utf-8?B?VEZlVFlWUDJ4eGQ1MVY1YlU2UnhyR2M4b0FhdmRINEhKVzFxWEVwT1dRTlVS?=
 =?utf-8?B?RFdKUU9PZzNaeS8wdnhyMHY1c200SlZBRThkK09oRVdPNHc5ZTZ3YzBTVXo4?=
 =?utf-8?B?RHJNQW5pdGZKM0s3bDN0NWFkNHpQd3BqaU1QNDc5RVVtWEEzemI3RG05cjZB?=
 =?utf-8?B?YXgwTTZqVzFteEMzRkZpVHpyQXhTSGpjQ09yN1FUVmdrR2d2b3EzYXFDOVc0?=
 =?utf-8?B?NzBsK0F4R3BYVytyOUxkcEdqSHlVcEpIeWF0bXVHazIxQm5WelV3SjVhZ2hu?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <722CB0A18C60E1458C2A61A951B33645@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0fea8d-3487-4d39-c626-08dc8e92c7ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 06:00:24.9904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YTXGNmwhjJBQHgseNRjMo/2wkF2OEHQLhe6B9NWLNtVvwB1+xeJRLe2lWyQzkwN+FQVqMlFwTY25cmE6o3HGmdIobv+v6ntoS80FR6u34E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6669
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.060500-8.000000
X-TMASE-MatchedRID: UuaOI1zLN1gDJrf2+hNOhZmug812qIbzvD4YKo9Sttyo+b+yOP0oGMkU
 hKWc+gwPo0hcL4S9vYP5qR7J2CotBhgpb8HNtH0+GVyS87Wb4lwdQSyPGb6mCNZXHs4LdwyUZvo
 +mFW19mDUGHwBDBRESWlMzgdmISFztR3ZHtcq+fcCNMj/7qB/gx4J8iSTQF/4V9eB8vnmKe8JXk
 YbHAT1XIUoqictMoEswfkpxVc9KOXoSi9uJV6wyYv2/i8VNqeOU2fjZiNvIyn82ks92f+GmkBIC
 Rren7xCZ4CilovzSeWOKw4razJxJZYeam+R4okHAoNa2r+Edw34uJ1REX4MHcA0eOJZYj7t0ZeB
 CmEdCbFqUxrTVbe5OfkUC4Gy/fkVkfRhdidsajPSBVVc2BozSnJnzNw42kCxxEHRux+uk8h+ICq
 uNi0WJO4ttUy0qXXn85T8lXail7VRh+LlTj6e7Kho02ai5xevftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.060500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 03CD28CCFBDE49DEC890BD0E1F1771B249510505B0D2774DF38B8C66103D42422000:8
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

SGkgQ0ssDQoNClNvcnJ5IHRvIHJlcGx5IHlvdXIgc3VnZ2VzdGlvbiB0b28gbGF0ZS4NCg0KVGhh
bmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2guDQpPbiBGcmksIDIwMjQtMDUt
MTcgYXQgMDk6NTMgKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiBIaSwgWXVuZmVp
Og0KPiANCj4gT24gVGh1LCAyMDI0LTA1LTE2IGF0IDIwOjIwICswODAwLCBZdW5mZWkgRG9uZyB3
cm90ZToNCj4gPiBXYWl0aW5nIGludGVycnVwdCBpbiBvcHRlZS1vcyBmb3Igc3ZwIG1vZGUsIG5l
ZWQgdG8gZGlzYWJsZSBpdCBpbg0KPiA+IGtlcm5lbA0KPiA+IGluIGNhc2Ugb2YgaW50ZXJydXB0
IGlzIGNsZWFuZWQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZl
aS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3Zjb2RlYy9kZWNvZGVyL210
a192Y29kZWNfZGVjX2h3LmMgICAgICAgIHwgMzQgKysrKystLS0tLS0NCj4gPiAgLi4uL3Zjb2Rl
Yy9kZWNvZGVyL210a192Y29kZWNfZGVjX3BtLmMgICAgICAgIHwgIDYgKy0NCj4gPiAgLi4uL2Rl
Y29kZXIvdmRlYy92ZGVjX2gyNjRfcmVxX211bHRpX2lmLmMgICAgIHwgNTcgKysrKysrKysrKyst
LQ0KPiA+IC0tLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKyksIDQz
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfaHcuDQo+ID4g
Yw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9t
dGtfdmNvZGVjX2RlY19ody4NCj4gPiBjDQo+ID4gaW5kZXggODgxZDVkZTQxZTA1Li4xOTgyYzA4
OGM2ZGEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2h3Lg0KPiA+IGMNCj4gPiArKysNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfaHcuDQo+ID4gYw0KPiA+IEBAIC03MiwyNiArNzIsMjggQEAgc3RhdGljIGlycXJl
dHVybl90IG10a192ZGVjX2h3X2lycV9oYW5kbGVyKGludA0KPiA+IGlycSwgdm9pZCAqcHJpdikN
Cj4gPiAgDQo+ID4gIAljdHggPSBtdGtfdmNvZGVjX2dldF9jdXJyX2N0eChkZXYtPm1haW5fZGV2
LCBkZXYtPmh3X2lkeCk7DQo+ID4gIA0KPiA+IC0JLyogY2hlY2sgaWYgSFcgYWN0aXZlIG9yIG5v
dCAqLw0KPiA+IC0JY2dfc3RhdHVzID0gcmVhZGwoZGV2LT5yZWdfYmFzZVtWREVDX0hXX1NZU10g
Kw0KPiA+IFZERUNfSFdfQUNUSVZFX0FERFIpOw0KPiA+IC0JaWYgKGNnX3N0YXR1cyAmIFZERUNf
SFdfQUNUSVZFX01BU0spIHsNCj4gPiAtCQltdGtfdjRsMl92ZGVjX2VycihjdHgsICJ2ZGVjIGFj
dGl2ZSBpcyBub3QgMHgwDQo+ID4gKDB4JTA4eCkiLCBjZ19zdGF0dXMpOw0KPiA+IC0JCXJldHVy
biBJUlFfSEFORExFRDsNCj4gPiAtCX0NCj4gPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJh
Y2spIHsNCj4gPiArCQkvKiBjaGVjayBpZiBIVyBhY3RpdmUgb3Igbm90ICovDQo+ID4gKwkJY2df
c3RhdHVzID0gcmVhZGwoZGV2LT5yZWdfYmFzZVtWREVDX0hXX1NZU10gKw0KPiA+IFZERUNfSFdf
QUNUSVZFX0FERFIpOw0KPiA+ICsJCWlmIChjZ19zdGF0dXMgJiBWREVDX0hXX0FDVElWRV9NQVNL
KSB7DQo+ID4gKwkJCW10a192NGwyX3ZkZWNfZXJyKGN0eCwgInZkZWMgYWN0aXZlIGlzIG5vdCAw
eDANCj4gPiAoMHglMDh4KSIsIGNnX3N0YXR1cyk7DQo+ID4gKwkJCXJldHVybiBJUlFfSEFORExF
RDsNCj4gPiArCQl9DQo+ID4gIA0KPiA+IC0JZGVjX2RvbmVfc3RhdHVzID0gcmVhZGwodmRlY19t
aXNjX2FkZHIpOw0KPiA+IC0JaWYgKChkZWNfZG9uZV9zdGF0dXMgJiBNVEtfVkRFQ19JUlFfU1RB
VFVTX0RFQ19TVUNDRVNTKSAhPQ0KPiA+IC0JICAgIE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NV
Q0NFU1MpDQo+ID4gLQkJcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ICsJCWRlY19kb25lX3N0YXR1
cyA9IHJlYWRsKHZkZWNfbWlzY19hZGRyKTsNCj4gPiArCQlpZiAoKGRlY19kb25lX3N0YXR1cyAm
IE1US19WREVDX0lSUV9TVEFUVVNfREVDX1NVQ0NFU1MpDQo+ID4gIT0NCj4gPiArCQkgICAgTVRL
X1ZERUNfSVJRX1NUQVRVU19ERUNfU1VDQ0VTUykNCj4gPiArCQkJcmV0dXJuIElSUV9IQU5ETEVE
Ow0KPiA+ICANCj4gPiAtCS8qIGNsZWFyIGludGVycnVwdCAqLw0KPiA+IC0Jd3JpdGVsKGRlY19k
b25lX3N0YXR1cyB8IFZERUNfSVJRX0NGRywgdmRlY19taXNjX2FkZHIpOw0KPiA+IC0Jd3JpdGVs
KGRlY19kb25lX3N0YXR1cyAmIH5WREVDX0lSUV9DTFIsIHZkZWNfbWlzY19hZGRyKTsNCj4gPiAr
CQkvKiBjbGVhciBpbnRlcnJ1cHQgKi8NCj4gPiArCQl3cml0ZWwoZGVjX2RvbmVfc3RhdHVzIHwg
VkRFQ19JUlFfQ0ZHLCB2ZGVjX21pc2NfYWRkcik7DQo+ID4gKwkJd3JpdGVsKGRlY19kb25lX3N0
YXR1cyAmIH5WREVDX0lSUV9DTFIsDQo+ID4gdmRlY19taXNjX2FkZHIpOw0KPiA+ICANCj4gPiAt
CXdha2VfdXBfZGVjX2N0eChjdHgsIE1US19JTlNUX0lSUV9SRUNFSVZFRCwgZGV2LT5od19pZHgp
Ow0KPiA+ICsJCXdha2VfdXBfZGVjX2N0eChjdHgsIE1US19JTlNUX0lSUV9SRUNFSVZFRCwgZGV2
LQ0KPiA+ID5od19pZHgpOw0KPiA+ICANCj4gPiAtCW10a192NGwyX3ZkZWNfZGJnKDMsIGN0eCwg
Indha2UgdXAgY3R4ICVkLCBkZWNfZG9uZV9zdGF0dXM9JXgiLA0KPiA+IC0JCQkgIGN0eC0+aWQs
IGRlY19kb25lX3N0YXR1cyk7DQo+ID4gKwkJbXRrX3Y0bDJfdmRlY19kYmcoMywgY3R4LCAid2Fr
ZSB1cCBjdHggJWQsDQo+ID4gZGVjX2RvbmVfc3RhdHVzPSV4IiwNCj4gPiArCQkJCSAgY3R4LT5p
ZCwgZGVjX2RvbmVfc3RhdHVzKTsNCj4gPiArCX0NCj4gPiAgDQo+ID4gIAlyZXR1cm4gSVJRX0hB
TkRMRUQ7DQo+ID4gIH0NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3BtLg0KPiA+IGMNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zj
b2RlY19kZWNfcG0uDQo+ID4gYw0KPiA+IGluZGV4IGFlZmQzZTllMzA2MS4uYTk0ZWRhOTM2ZjE2
IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19wbS4NCj4gPiBjDQo+ID4gKysrDQo+ID4gYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX3BtLg0KPiA+IGMNCj4gPiBAQCAtMjM4LDcgKzIzOCw4IEBAIHZvaWQgbXRrX3Zjb2RlY19k
ZWNfZW5hYmxlX2hhcmR3YXJlKHN0cnVjdA0KPiA+IG10a192Y29kZWNfZGVjX2N0eCAqY3R4LCBp
bnQgaHdfaWR4KQ0KPiA+ICAJCW10a192Y29kZWNfZGVjX2NoaWxkX2Rldl9vbihjdHgtPmRldiwg
TVRLX1ZERUNfTEFUMCk7DQo+ID4gIAltdGtfdmNvZGVjX2RlY19jaGlsZF9kZXZfb24oY3R4LT5k
ZXYsIGh3X2lkeCk7DQo+ID4gIA0KPiA+IC0JbXRrX3Zjb2RlY19kZWNfZW5hYmxlX2lycShjdHgt
PmRldiwgaHdfaWR4KTsNCj4gPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJhY2spDQo+ID4g
KwkJbXRrX3Zjb2RlY19kZWNfZW5hYmxlX2lycShjdHgtPmRldiwgaHdfaWR4KTsNCj4gPiAgDQo+
ID4gIAlpZiAoSVNfVkRFQ19JTk5FUl9SQUNJTkcoY3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkN
Cj4gPiAgCQltdGtfdmNvZGVjX2xvYWRfcmFjaW5nX2luZm8oY3R4KTsNCj4gPiBAQCAtMjUwLDcg
KzI1MSw4IEBAIHZvaWQgbXRrX3Zjb2RlY19kZWNfZGlzYWJsZV9oYXJkd2FyZShzdHJ1Y3QNCj4g
PiBtdGtfdmNvZGVjX2RlY19jdHggKmN0eCwgaW50IGh3X2lkeCkNCj4gPiAgCWlmIChJU19WREVD
X0lOTkVSX1JBQ0lORyhjdHgtPmRldi0+ZGVjX2NhcGFiaWxpdHkpKQ0KPiA+ICAJCW10a192Y29k
ZWNfcmVjb3JkX3JhY2luZ19pbmZvKGN0eCk7DQo+ID4gIA0KPiA+IC0JbXRrX3Zjb2RlY19kZWNf
ZGlzYWJsZV9pcnEoY3R4LT5kZXYsIGh3X2lkeCk7DQo+ID4gKwlpZiAoIWN0eC0+aXNfc2VjdXJl
X3BsYXliYWNrKQ0KPiA+ICsJCW10a192Y29kZWNfZGVjX2Rpc2FibGVfaXJxKGN0eC0+ZGV2LCBo
d19pZHgpOw0KPiA+ICANCj4gPiAgCW10a192Y29kZWNfZGVjX2NoaWxkX2Rldl9vZmYoY3R4LT5k
ZXYsIGh3X2lkeCk7DQo+ID4gIAlpZiAoSVNfVkRFQ19MQVRfQVJDSChjdHgtPmRldi0+dmRlY19w
ZGF0YS0+aHdfYXJjaCkgJiYNCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcQ0KPiA+IF9t
dWx0aV9pZi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcQ0KPiA+IF9tdWx0aV9pZi5jDQo+ID4gaW5kZXggZjI3
ZDMyNmYwMGJhLi4zMTg2Nzc3ZGNjMTMgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcQ0K
PiA+IF9tdWx0aV9pZi5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcQ0KPiA+IF9tdWx0aV9pZi5j
DQo+ID4gQEAgLTU5MywxNCArNTkzLDE2IEBAIHN0YXRpYyBpbnQgdmRlY19oMjY0X3NsaWNlX2Nv
cmVfZGVjb2RlKHN0cnVjdA0KPiA+IHZkZWNfbGF0X2J1ZiAqbGF0X2J1ZikNCj4gPiAgCQlnb3Rv
IHZkZWNfZGVjX2VuZDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQkvKiB3YWl0IGRlY29kZXIgZG9u
ZSBpbnRlcnJ1cHQgKi8NCj4gPiAtCXRpbWVvdXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9yX2RvbmVf
Y3R4KGluc3QtPmN0eCwNCj4gPiBNVEtfSU5TVF9JUlFfUkVDRUlWRUQsDQo+ID4gLQkJCQkJICAg
ICAgIFdBSVRfSU5UUl9USU1FT1VUX01TLA0KPiA+IE1US19WREVDX0NPUkUpOw0KPiA+IC0JaWYg
KHRpbWVvdXQpDQo+ID4gLQkJbXRrX3ZkZWNfZXJyKGN0eCwgImNvcmUgZGVjb2RlIHRpbWVvdXQ6
IHBpY18lZCIsIGN0eC0NCj4gPiA+ZGVjb2RlZF9mcmFtZV9jbnQpOw0KPiA+IC0JaW5zdC0+dnNp
X2NvcmUtPmRlYy50aW1lb3V0ID0gISF0aW1lb3V0Ow0KPiA+IC0NCj4gPiAtCXZwdV9kZWNfY29y
ZV9lbmQodnB1KTsNCj4gPiArCWlmICghY3R4LT5pc19zZWN1cmVfcGxheWJhY2spIHsNCj4gPiAr
CQkvKiB3YWl0IGRlY29kZXIgZG9uZSBpbnRlcnJ1cHQgKi8NCj4gPiArCQl0aW1lb3V0ID0gbXRr
X3Zjb2RlY193YWl0X2Zvcl9kb25lX2N0eChpbnN0LT5jdHgsDQo+ID4gTVRLX0lOU1RfSVJRX1JF
Q0VJVkVELA0KPiA+ICsJCQkJCQkgICAgICAgV0FJVF9JTlRSX1RJTUVPVQ0KPiA+IFRfTVMsIE1U
S19WREVDX0NPUkUpOw0KPiA+ICsJCWlmICh0aW1lb3V0KQ0KPiA+ICsJCQltdGtfdmRlY19lcnIo
Y3R4LCAiY29yZSBkZWNvZGUgdGltZW91dDoNCj4gPiBwaWNfJWQiLCBjdHgtPmRlY29kZWRfZnJh
bWVfY250KTsNCj4gPiArCQlpbnN0LT52c2lfY29yZS0+ZGVjLnRpbWVvdXQgPSAhIXRpbWVvdXQ7
DQo+ID4gKw0KPiA+ICsJCXZwdV9kZWNfY29yZV9lbmQodnB1KTsNCj4gPiArCX0NCj4gDQo+IElu
IHN2cCBtb2RlLCBvcHRlZSBkcml2ZXIgd291bGQgd2FpdCB0aGUgaXJxLCBidXQgd2h5IG9wdGVl
IGRyaXZlcg0KPiBkb2VzIG5vdCBub3RpZnkgbm9ybWFsIHdvcmxkIGRyaXZlcj8gVGhlIG5vcm1h
bCB3b3JsZCBkcml2ZXIgaGVyZQ0KPiBkb2VzIG5vdCB3YWl0IGFueXRoaW5nIGFuZCBrZWVwIGdv
aW5nLCBzbyBpdCB3b3VsZCBnZXQgdGhlIGZyYW1lDQo+IHdoaWNoIGhhcyBub3QgYmVlbiBwcm9j
ZXNzZWQgZG9uZSBhbmQgcGFzcyBpdCB0byBuZXh0IG1vZHVsZSBzdWNoIGFzDQo+IG1kcD8gVGhl
IG5vcm1hbCB3b3JsZCBkcml2ZXIgZG9lcyBub3Qgd2FpdCBoZXJlLCBob3cgZG9lcyBpdCBtYWtl
DQo+IHN1cmUgdGhlIGZyYW1lIGlzIHByb2Nlc3NlZCBkb25lPw0KPiANCk5vcm1hbCBhbmQgc2Vj
dXJlIHdvcmxkIGNhbiByZWNlaXZlIHRoZSBpbnRlcnJ1cHQgYXQgdGhlIHNhbWUgdGltZSB3aGVu
DQpwbGF5IHNlY3VyZSB2aWRlby4NCg0KVGhlIGRyaXZlciBwcm9jZXNzIHRoZSBpbnRlcnJ1cHQg
YW5kIGNsZWFuIHRoZSBpbnRlcnJ1cHQgaW4gb3B0ZWUtb3MNCndoZW4gcGxheSBzZWN1cmUgdmlk
ZW8sIG5vdCBub3JtYWwgd29ybGQuIFNvIHRoZSBkcml2ZXIgbmVlZG4ndCB0byB3YWl0DQppbnRl
cnJ1cHQgYW5kIGNsZWFuIHRoZSBpbnRlcnJ1cHQgaW4gbm9ybWFsIHdvcmxkDQo+IFJlZ2FyZHMs
DQo+IA0KPiBDSw0KPiANCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo+ID4gIAltdGtfdmRl
Y19kZWJ1ZyhjdHgsICJwaWNbJWRdIGNyYzogMHgleCAweCV4IDB4JXggMHgleCAweCV4IDB4JXgN
Cj4gPiAweCV4IDB4JXgiLA0KPiA+ICAJCSAgICAgICBjdHgtPmRlY29kZWRfZnJhbWVfY250LA0K
PiA+ICAJCSAgICAgICBpbnN0LT52c2lfY29yZS0+ZGVjLmNyY1swXSwgaW5zdC0+dnNpX2NvcmUt
DQo+ID4gPmRlYy5jcmNbMV0sDQo+ID4gQEAgLTcyNCwxNCArNzI2LDE2IEBAIHN0YXRpYyBpbnQg
dmRlY19oMjY0X3NsaWNlX2xhdF9kZWNvZGUodm9pZA0KPiA+ICpoX3ZkZWMsIHN0cnVjdCBtdGtf
dmNvZGVjX21lbSAqYnMsDQo+ID4gIAkJdmRlY19tc2dfcXVldWVfcWJ1ZigmaW5zdC0+Y3R4LT5t
c2dfcXVldWUuY29yZV9jdHgsDQo+ID4gbGF0X2J1Zik7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0J
Lyogd2FpdCBkZWNvZGVyIGRvbmUgaW50ZXJydXB0ICovDQo+ID4gLQl0aW1lb3V0ID0gbXRrX3Zj
b2RlY193YWl0X2Zvcl9kb25lX2N0eChpbnN0LT5jdHgsDQo+ID4gTVRLX0lOU1RfSVJRX1JFQ0VJ
VkVELA0KPiA+IC0JCQkJCSAgICAgICBXQUlUX0lOVFJfVElNRU9VVF9NUywNCj4gPiBNVEtfVkRF
Q19MQVQwKTsNCj4gPiAtCWlmICh0aW1lb3V0KQ0KPiA+IC0JCW10a192ZGVjX2VycihpbnN0LT5j
dHgsICJsYXQgZGVjb2RlIHRpbWVvdXQ6IHBpY18lZCIsDQo+ID4gaW5zdC0+c2xpY2VfZGVjX251
bSk7DQo+ID4gLQlpbnN0LT52c2ktPmRlYy50aW1lb3V0ID0gISF0aW1lb3V0Ow0KPiA+ICsJaWYg
KCFpbnN0LT5jdHgtPmlzX3NlY3VyZV9wbGF5YmFjaykgew0KPiA+ICsJCS8qIHdhaXQgZGVjb2Rl
ciBkb25lIGludGVycnVwdCAqLw0KPiA+ICsJCXRpbWVvdXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9y
X2RvbmVfY3R4KGluc3QtPmN0eCwNCj4gPiBNVEtfSU5TVF9JUlFfUkVDRUlWRUQsDQo+ID4gKwkJ
CQkJCSAgICAgICBXQUlUX0lOVFJfVElNRU9VDQo+ID4gVF9NUywgTVRLX1ZERUNfTEFUMCk7DQo+
ID4gKwkJaWYgKHRpbWVvdXQpDQo+ID4gKwkJCW10a192ZGVjX2VycihpbnN0LT5jdHgsICJsYXQg
ZGVjb2RlIHRpbWVvdXQ6DQo+ID4gcGljXyVkIiwgaW5zdC0+c2xpY2VfZGVjX251bSk7DQo+ID4g
KwkJaW5zdC0+dnNpLT5kZWMudGltZW91dCA9ICEhdGltZW91dDsNCj4gPiAgDQo+ID4gLQllcnIg
PSB2cHVfZGVjX2VuZCh2cHUpOw0KPiA+ICsJCWVyciA9IHZwdV9kZWNfZW5kKHZwdSk7DQo+ID4g
Kwl9DQo+ID4gIAlpZiAoZXJyID09IFNMSUNFX0hFQURFUl9GVUxMIHx8IGVyciA9PSBUUkFOU19C
VUZGRVJfRlVMTCkgew0KPiA+ICAJCWlmICghSVNfVkRFQ19JTk5FUl9SQUNJTkcoaW5zdC0+Y3R4
LT5kZXYtDQo+ID4gPmRlY19jYXBhYmlsaXR5KSkNCj4gPiAgCQkJdmRlY19tc2dfcXVldWVfcWJ1
ZigmaW5zdC0+Y3R4LQ0KPiA+ID5tc2dfcXVldWUubGF0X2N0eCwgbGF0X2J1Zik7DQo+ID4gQEAg
LTgzMSwxNiArODM1LDE5IEBAIHN0YXRpYyBpbnQgdmRlY19oMjY0X3NsaWNlX3NpbmdsZV9kZWNv
ZGUodm9pZA0KPiA+ICpoX3ZkZWMsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqYnMNCj4gPiAgCWlm
IChlcnIpDQo+ID4gIAkJZ290byBlcnJfZnJlZV9mYl9vdXQ7DQo+ID4gIA0KPiA+IC0JLyogd2Fp
dCBkZWNvZGVyIGRvbmUgaW50ZXJydXB0ICovDQo+ID4gLQllcnIgPSBtdGtfdmNvZGVjX3dhaXRf
Zm9yX2RvbmVfY3R4KGluc3QtPmN0eCwNCj4gPiBNVEtfSU5TVF9JUlFfUkVDRUlWRUQsDQo+ID4g
LQkJCQkJICAgV0FJVF9JTlRSX1RJTUVPVVRfTVMsDQo+ID4gTVRLX1ZERUNfQ09SRSk7DQo+ID4g
LQlpZiAoZXJyKQ0KPiA+IC0JCW10a192ZGVjX2VycihpbnN0LT5jdHgsICJkZWNvZGUgdGltZW91
dDogcGljXyVkIiwgaW5zdC0NCj4gPiA+Y3R4LT5kZWNvZGVkX2ZyYW1lX2NudCk7DQo+ID4gLQ0K
PiA+IC0JaW5zdC0+dnNpLT5kZWMudGltZW91dCA9ICEhZXJyOw0KPiA+IC0JZXJyID0gdnB1X2Rl
Y19lbmQodnB1KTsNCj4gPiAtCWlmIChlcnIpDQo+ID4gLQkJZ290byBlcnJfZnJlZV9mYl9vdXQ7
DQo+ID4gKwlpZiAoIWluc3QtPmN0eC0+aXNfc2VjdXJlX3BsYXliYWNrKSB7DQo+ID4gKwkJLyog
d2FpdCBkZWNvZGVyIGRvbmUgaW50ZXJydXB0ICovDQo+ID4gKwkJZXJyID0gbXRrX3Zjb2RlY193
YWl0X2Zvcl9kb25lX2N0eChpbnN0LT5jdHgsDQo+ID4gTVRLX0lOU1RfSVJRX1JFQ0VJVkVELA0K
PiA+ICsJCQkJCQkgICBXQUlUX0lOVFJfVElNRU9VVF9NUw0KPiA+ICwgTVRLX1ZERUNfQ09SRSk7
DQo+ID4gKwkJaWYgKGVycikNCj4gPiArCQkJbXRrX3ZkZWNfZXJyKGluc3QtPmN0eCwgImRlY29k
ZSB0aW1lb3V0Og0KPiA+IHBpY18lZCIsDQo+ID4gKwkJCQkgICAgIGluc3QtPmN0eC0+ZGVjb2Rl
ZF9mcmFtZV9jbnQpOw0KPiA+ICsNCj4gPiArCQlpbnN0LT52c2ktPmRlYy50aW1lb3V0ID0gISFl
cnI7DQo+ID4gKwkJZXJyID0gdnB1X2RlY19lbmQodnB1KTsNCj4gPiArCQlpZiAoZXJyKQ0KPiA+
ICsJCQlnb3RvIGVycl9mcmVlX2ZiX291dDsNCj4gPiArCX0NCj4gPiAgDQo+ID4gIAltZW1jcHko
Jmluc3QtPnZzaV9jdHgsIGluc3QtPnZwdS52c2ksIHNpemVvZihpbnN0LT52c2lfY3R4KSk7DQo+
ID4gIAltdGtfdmRlY19kZWJ1ZyhpbnN0LT5jdHgsICJwaWNbJWRdIGNyYzogMHgleCAweCV4IDB4
JXggMHgleA0KPiA+IDB4JXggMHgleCAweCV4IDB4JXgiLA0K
