Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E729D2195
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 09:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D7810E1BC;
	Tue, 19 Nov 2024 08:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cES+9m+g";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Aqvcj3z7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D6610E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 08:29:57 +0000 (UTC)
X-UUID: 72975fd6a65011ef99858b75a2457dd9-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ChmBUenAMeM5/H26/gdUSWyWkYi6l7To1FFjN37aw2I=; 
 b=cES+9m+gG47JtCr2Ya9UdmOeF810vmQHPuqnT1PpEtklWty4l4LOOhNpLkxKklvti92pGEOwAk3ErASdZSvcJ7m1G4f9+nGgpn4w5KzKHWtNo18Prhb6SIb7JjDA/Abn5Oib30hAaU1vFh8FcOWM6cJ4UqZeDBZ51+/vpzUu/s0=;
X-CID-CACHE: Type:Local,Time:202411191623+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:a65f87d5-352c-4501-8ad7-ea5466e05fcb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:1208e05c-f18b-4d56-b49c-93279ee09144,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 72975fd6a65011ef99858b75a2457dd9-20241119
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1840360993; Tue, 19 Nov 2024 16:29:52 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 16:29:50 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 16:29:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFKfRRd6CPSMFFYc7Q404IhBlHk2OlQMApiHVNc1CoFSaAEZKl00fGsSZpfcNPKj1CAZfFtTiRpOJAFq8/TdFzz02C+I4qFToubraYBQw6N3gZmLcxkkwZpp1rqgBA17OdGAbT4zuLYAQn41mA+parx3SBNVHofFHHBNSPJN/uKJhmQHKMzp4vYJuhz3DFMBjW1qZj2PGqq7v66kYG6hNBU69YldZkwswtJdVSy4wTnu/Tm1//4gdOZMoej8L4HS1py4rZ/+rlv8himRtv/XBB75DNEAO3GjITNZ11kNMG9VfGpbcZpS4Kukt/8iIHBfYRmE0vxG9aA2Aa3c9+Hviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=;
 b=IWZMAPuXGAObkx9Abg9WoydK8fD5jUMGBimn8eEs25bXlD4Pppch5S3ZOT8Tt17NLh4ogARJCArdKtMVIMQ92s/dWgeUrcwWiyiAJBZ3N63XWYyx3fZtdCW3SK3iR/+5/5TT1hnu5g164cjJMeMO4iOcxpsFylX539y6zX8UYae2DbfCua9fqqmcTtTpH59QSaf0UZck5nUy2eV0XWrVBJaak/XDZoxeFRZQfIcPMGs92mrzuSSahsI8KvXwMAVVWXgctxdDk1puM/9x3WUPoWgN92gzBx+Rif54UVCAnZBkBY2/1bulhJR4jwmwiiHO/EtDh+wA22rElraDiaH7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+RSeVyl/VnEE0gaA4eNPQcCpxjnOdOrT3JiSL+jejI=;
 b=Aqvcj3z7cYWaeL3kEOwTyzU12qEfK76z1kJCMY9oMOZBvL4ZgD3Tqiv+HoHbTYud9Eop04aO+MjWtdVD2I3GLLEl3bV3ps/tmWb2M3oy0geIaDhBxm+9dRel/h7udT0Qac9HRi+YU/futcS4mYrHcMn5CjS0p2ugwYFgx/mx+JU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 08:29:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 08:29:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK+heeA
Date: Tue, 19 Nov 2024 08:29:47 +0000
Message-ID: <cda227f98dfa4262882d2866b9bca47007076f03.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6688:EE_
x-ms-office365-filtering-correlation-id: 011eb7fc-ebfd-4472-b4e3-08dd0874544c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eVp4VkE1alVOWVdJUkpFenJtc0JRelZNUGtFVGJQcWFjQWhSUlhSZ2NMS3dB?=
 =?utf-8?B?ZTJ3azlHQmk5dXFSZW42L1JjTWY5VTllTUVIVndMREt4R2NZeFpzNkx4SW9K?=
 =?utf-8?B?MFRJYlFvTVM3bHM3a3dUSHlvNFNkdnBOK1FBYlRCMFVva1E0TncranBldWhx?=
 =?utf-8?B?ejhNdXFZN3dFWVlwbnQrNnd6eXpzekZtZTdHNkptWWJsRlI2VXBSQ0RsaWJN?=
 =?utf-8?B?cU1tMHZrRFBpaE1ydHlZYWRtYVRMQWJzS1pMbk1kdDZ3MkR6QUxXa050OUVI?=
 =?utf-8?B?RkxtRERKbllQU1F1U0p5bWpJbHRFNkpBQ0dYTU5DbThYYXl3V2lMd3dRNGFM?=
 =?utf-8?B?Y2s0dHJWTkF2cWtNcEJIUmpCa2dyWW9WS3ZyVXdBK2JUdXEyM3hOVER1L05z?=
 =?utf-8?B?c3UwYjhHSExaRk9yN2srVEFJS0w2MzFEbm5JbkY2SHpycC9uWXZoYnpqMUlP?=
 =?utf-8?B?eXpFQ0NDYWVVTFZXZ3NWVHVUdWxCc3hwM1d1N0lhUTJncWY4NkIxZnpFWHRv?=
 =?utf-8?B?K0c0MzdiT3BabG5kSU5tYXhkYmlXbXRHRkpIR05GK1U3TFdwY3pKUnVoeVlv?=
 =?utf-8?B?M1NnWlZCMm5Lckk3SWY2bzFldnJQRzZPbldWTFZpN0FZRTVpT2dQdVd1RWZZ?=
 =?utf-8?B?RWxtVHRPMnRvMzFaZkxuNWJJZEplYWNtYlcwVkpHYzNsRk1KekpLQnZpWXBu?=
 =?utf-8?B?R3k2WDJYaDM0MGwycXk0a2RpVWprbW8xaUFYcmtQVFppR2JhRnZlVUtpay9M?=
 =?utf-8?B?YjJwUlZKazZEVkVoZENWYWg1eWU4RjJFcGZ3dVJ2NVhoVFhkaERybUduMjJ3?=
 =?utf-8?B?d3YxYlN6WlJ6V0RxcHZwcGZoSDg2bXMvUmJad241WklFS2xlNUMxUWxYSTBv?=
 =?utf-8?B?aTdzYnI0c1dmcnZHdVJobGF2TDdKL0dNbjgwOUF1WmlQQWxlYVkwcUFySEp6?=
 =?utf-8?B?bXpNWW1nK25GZUI5Nkk0M1lSdkhhTXlDcCtnTGJtMmZkdG01VE5zalNvU0ZH?=
 =?utf-8?B?enYrbjI3dFJiNnVXQmF4UHJaRnBIR2FxQndxQ3M1SFZnZnVOLzZTTEhhMFNs?=
 =?utf-8?B?cFNBSXFoTXdleTVONE1rcHYzWXpob0g0YlNqY1B2N1MxMjBSZXpzMS9hQjN1?=
 =?utf-8?B?Yklxd2xQandWOUZxa1RDODNsZHpUaVA1NUNvZEhuWHBtRWxPZHZ2NkRrRVZR?=
 =?utf-8?B?b0s5NlQxc3RiOUExeC9GU0pWM2dKNlB6ZHlxdFZsbCtuT3l6b2x2THJUOSsy?=
 =?utf-8?B?R0pRcHp0OXZVUFV6L2UwSnB1dUJLZ0FKbWt5Y3dxTzEyM0xFVDdzMXRmWGVE?=
 =?utf-8?B?b3NjOW9BYlhWdGM0eWZDRW8xN3BnS2FNOStUVGJGai9iUzhyNk1sbFJrV1p6?=
 =?utf-8?B?R0xPWmp4cFNVSW5LdDNOdjZlSFNKMzYwVGg0UnJkN21IU2NTbHhYdjNpRDc1?=
 =?utf-8?B?dkozbmxpN28rWGJOSHAxSmF3WWtEMDRTbmwyUW1WNTF4QjFEaVhMOXdpM09t?=
 =?utf-8?B?YXg4VFI1eDJBd1FIK0NMUnVhY3l3eGRMY1ViUzNPVUxGeThCQnI2MHFmZE40?=
 =?utf-8?B?S1Bic1FvME5Uc1IwdHN5SjdtOHJYcnIzZmY1VTUwSVUwQytLWjdVK21EZ29H?=
 =?utf-8?B?K3kwYTlxWTROUUorVUVnM3ZTZHFTNGhNcWlTL3hXVWd4bjZmWmZOSm8vRzRG?=
 =?utf-8?B?V2djY3U5RlFVN2pmOFp2QkNUTFprNWxhNHVET0wzSTVNam4zZnltV3hQUnMv?=
 =?utf-8?B?MTBTazFJeWw0cWsvRlMweENscGhQc0pBVHhTSVcrOWpKVnA1ZjdQUTFYVHpk?=
 =?utf-8?Q?O7SHSd1amoaPpmjT13sD0nodLgNMtyPj5rYRc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjBielBDVWZWWXV0SGdqa1ZTMDkxam5RdmhoN3RjN0hsSDNZNWh6WXMxYS84?=
 =?utf-8?B?Sml3YUZvbkZ6Z0hwcXUrbjRudTVBamIvNVp0Qm5lWld1dUZldC9ERnhscGN3?=
 =?utf-8?B?MHZYMUJPdGdOeE5lakdVVUpLTkplajRQUXlCVzhUQzJoZEFBUmNCRzBZMndQ?=
 =?utf-8?B?V1BrUDNwY2lGMWNjMjQ3MVc0aFJ4YTQ3Wm9PbWtWTisyQ1I5bXhpN3ZUZjNv?=
 =?utf-8?B?Z3ViMExlK3FlQW9SaVd6WUZBNjZKYmxDWS8rTkFpdVBFUWFicDhXZFd3SWlz?=
 =?utf-8?B?NThVMTJlTHlQcThVK09mZDlxM0dMc3BIa0JtcHZsVmJZWERIZGxqSTQvYXQr?=
 =?utf-8?B?LzVEaEhiMHpPYzhaRG9pUzlSKzlQbkFYKzY3VUl6Y2lueG5Udjk3S2l4dVZ1?=
 =?utf-8?B?UGpHSjlwN2d0WmorN251OVNDQnN3NDFzSzFzeEorR1A0c3ZxcTBnWWVVbmdO?=
 =?utf-8?B?ZlRjQ0V2bGRmdXN6a1piay9yRjArZGxuS3llVkpaVzNvOWozSWowVWNpK01E?=
 =?utf-8?B?RnRjZFNVb3VPcDY3TFV1MDhNajB6QXNYcXJWakF4VWtpUmo3YUNETTJHZzdG?=
 =?utf-8?B?ZXpWQk5LOVAwQ0xlVnRWMXorVUt1aFJldjlHT3JtaE1YOGJhdFFuS0ZjeGFH?=
 =?utf-8?B?anVWWW5DK3EyWHRRd1R0eWI4M3o0NUJHYXRQcXlza2xYNzhjY0E3ckRmU2hl?=
 =?utf-8?B?b1JYczhQZHVZRTlEaGtVTGt0N29ycW1iSGFGaWNLU3pCUWdGdzI2Nlc1QTN3?=
 =?utf-8?B?YW9FRGtvRXU1Nkcyck1Od1pTUHNRWEJTbkp2cnNsMXEzTXU2SGVUdUtJTi9j?=
 =?utf-8?B?MkFwUGNpWEsrTXBTZWkyUmUzN2M1eTQvOGs0QnlON2RnSHdEMlhaNER4eTdZ?=
 =?utf-8?B?YlpxdmY4WmhCVkVLRWZVbEtoMDdWZVA3am1XTEplVmZKUlNXNUpROHZFYllk?=
 =?utf-8?B?UXdSVlNDcUtUNnJQU0wyZHhWN1IrdUdFRE1DMmJhMlZRL2x1S1g1M2l5QmNT?=
 =?utf-8?B?TEpuVXhNQkJWYjArWUZibFgzRlY1b2VtNTlUb1hMYllhZldJbldEWFhua1U2?=
 =?utf-8?B?S1NmSFBBUmphTXhOakhIU3dUVHFSaEpsd3ZSMTlERTZiU2JSSnFPWW83L0pE?=
 =?utf-8?B?VEN6VXhETUwvY2lJTFY5ZUlFZ2FtQi9rdXp2SjVSSlROMHRsT3RSK0NPa0pE?=
 =?utf-8?B?TnQ1Tkk3R0tHL3BBaW5mYmpQeVlVdHZlcFYyODFQeGdYTG9QRE1YL3RUS05n?=
 =?utf-8?B?L2FYdGx0d2RLbHNkQlF3ZXFpbjA1OXZ0RHk3MnZHaFczNkxDVjg4Z1gzTnhS?=
 =?utf-8?B?UmlHMEFZazN4RmxTaExyajA4TEJmUEt0QnZVOUpGL2RLbzk4WTdsMFpxczFn?=
 =?utf-8?B?V0hNQlpOWDdRYXFwdlRza0h3ZytxcE1YRnNWb3BXcHpMMGUyeGVaQXM5Y3c1?=
 =?utf-8?B?VVNWcWJwZzlidGtOS0UveDNOaHk2bE1pVFdrT3UzWE04RzhXSldUeUhnY2tP?=
 =?utf-8?B?ZS9VM1RHdWJ1U0gzY1RlVUJhcVNuK29qa3I2Wm9ka2Z2NFEzTVJGUnFVeGhO?=
 =?utf-8?B?VWozRUxyQXh6YStlU1JvQzNqWjd1STJHd2hPNGdrNEdHeFVKWVk5TVFEY21P?=
 =?utf-8?B?bk85Tms5VEUwaTJ2YTdpKzYzbUtIemMxaFVSUU9uR094cVFLanE2ZXgydFh2?=
 =?utf-8?B?UGNXb1R2WlZOS0NhVWtva1lTYStWRWxQMjBNSW9ZaU1UUWxhSnRWSW1ZS1lJ?=
 =?utf-8?B?MXFDcGZEVHdRTVgzem5mZy9MMlp4T3NvcUxoSjNNZHU5Q1h1bnB3OWhoYWtv?=
 =?utf-8?B?WDRIazdERWlkclJENnNNYWVYNHN1RVVXWWlnVnZFSDVZS2w5enZSNWlKVGNK?=
 =?utf-8?B?QkdDUVoraXNoMWZyRzdWY0dEckY1cE12K2xnL0c2Q3lPdnVjeGo5eEt3cFFm?=
 =?utf-8?B?N2RiSHVaS29Rd0FBTUFFNXlyM2FiTlBFakRVMUZZL3dXM2JOWTBwMFpBUmFo?=
 =?utf-8?B?SEh6WHk3UE9GOU44ZHViVlk0QjU0NWcwT2Jhc0M4RGhJZ1AvRG9jRjdxeTJy?=
 =?utf-8?B?QUJ4VHhzc1NGVzF2UU9TNGdmSE5QM1gvbVRwU2tBVElIaE1rQzg3WGVIWWJr?=
 =?utf-8?Q?jvXEpVqVc2sw1o9+djjwd/KDj?=
Content-ID: <F8510625881EE64A94DF37D8202E259B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011eb7fc-ebfd-4472-b4e3-08dd0874544c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 08:29:47.9506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFwCLBULUbcYyM8M4DpldoKL+96IcYdJfJ4phtpKV2qsB/0MitxRU+mYHKAD4PnS4GiFzC6vQhYwh/NGVlrZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6688
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_616670238.1438090055"
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

--__=_Part_Boundary_008_616670238.1438090055
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
IEZvciBMQklUX01PREUgRzIgKi8NCj4gK2VudW0gbXRrY2FtX2lwaV9zd19mZWF0dXJlX2NvbnRy
b2wgew0KPiArCU1US0NBTV9JUElfU1dfRkVBVFVSRV9OT1JNQUwJCT0gMCwNCj4gKwkvKiBOb3Jt
YWwgKi8NCj4gK307DQo+ICsNCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBtdGtjYW1faXBpX2NvbmZp
Z19wYXJhbSB7DQo+ICsJdTgJZmxhZ3M7DQo+ICsJc3RydWN0IG10a2NhbV9pcGlfaW5wdXRfcGFy
YW0JaW5wdXQ7DQo+ICsJdTgJbl9tYXBzOw0KPiArCS8qIG1heGltdW0gIyBvZiBwaXBlcyBwZXIg
c3RyZWFtICovDQo+ICsJc3RydWN0IG10a2NhbV9pcGlfaHdfbWFwcGluZyBtYXBzWzZdOw0KPiAr
CS8qIHN1Yl9yYXRpbzo4LCB2YWxpZCBudW1iZXI6IDggKi8NCj4gKwl1MTYJdmFsaWRfbnVtYmVy
c1tNVEtDQU1fSVBJX0ZCQ1hfTEFTVF07DQo+ICsJdTgJc3dfZmVhdHVyZTsNCg0KT25seSBvbmUg
c3dfZmVhdHVyZSAoTVRLQ0FNX0lQSV9TV19GRUFUVVJFX05PUk1BTCkuIFNvIGl0J3Mgbm90IG5l
Y2Vzc2FyeSB0byBwYXNzIHRoaXMgaW5mb3JtYXRpb24gdG8gc2NwLg0KRHJvcCB0aGlzIGFuZCBN
VEtDQU1fSVBJX1NXX0ZFQVRVUkVfTk9STUFMLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArfSBfX3Bh
Y2tlZDsNCj4gKw0KDQo=

--__=_Part_Boundary_008_616670238.1438090055
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Ky8qJiMzMjtGb3ImIzMyO0xCSVRfTU9E
RSYjMzI7RzImIzMyOyovDQomZ3Q7JiMzMjsrZW51bSYjMzI7bXRrY2FtX2lwaV9zd19mZWF0dXJl
X2NvbnRyb2wmIzMyO3sNCiZndDsmIzMyOytNVEtDQU1fSVBJX1NXX0ZFQVRVUkVfTk9STUFMPSYj
MzI7MCwNCiZndDsmIzMyOysvKiYjMzI7Tm9ybWFsJiMzMjsqLw0KJmd0OyYjMzI7K307DQomZ3Q7
JiMzMjsrDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtjYW1faXBpX2NvbmZp
Z19wYXJhbSYjMzI7ew0KJmd0OyYjMzI7K3U4ZmxhZ3M7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtt
dGtjYW1faXBpX2lucHV0X3BhcmFtaW5wdXQ7DQomZ3Q7JiMzMjsrdThuX21hcHM7DQomZ3Q7JiMz
MjsrLyomIzMyO21heGltdW0mIzMyOyMmIzMyO29mJiMzMjtwaXBlcyYjMzI7cGVyJiMzMjtzdHJl
YW0mIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtjYW1faXBpX2h3X21hcHBpbmcmIzMy
O21hcHNbNl07DQomZ3Q7JiMzMjsrLyomIzMyO3N1Yl9yYXRpbzo4LCYjMzI7dmFsaWQmIzMyO251
bWJlcjomIzMyOzgmIzMyOyovDQomZ3Q7JiMzMjsrdTE2dmFsaWRfbnVtYmVyc1tNVEtDQU1fSVBJ
X0ZCQ1hfTEFTVF07DQomZ3Q7JiMzMjsrdThzd19mZWF0dXJlOw0KDQpPbmx5JiMzMjtvbmUmIzMy
O3N3X2ZlYXR1cmUmIzMyOyhNVEtDQU1fSVBJX1NXX0ZFQVRVUkVfTk9STUFMKS4mIzMyO1NvJiMz
MjtpdCYjMzk7cyYjMzI7bm90JiMzMjtuZWNlc3NhcnkmIzMyO3RvJiMzMjtwYXNzJiMzMjt0aGlz
JiMzMjtpbmZvcm1hdGlvbiYjMzI7dG8mIzMyO3NjcC4NCkRyb3AmIzMyO3RoaXMmIzMyO2FuZCYj
MzI7TVRLQ0FNX0lQSV9TV19GRUFUVVJFX05PUk1BTC4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsm
IzMyOyt9JiMzMjtfX3BhY2tlZDsNCiZndDsmIzMyOysNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_616670238.1438090055--

