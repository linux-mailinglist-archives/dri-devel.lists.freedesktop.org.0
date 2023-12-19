Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50A817F82
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 03:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBD110E3D1;
	Tue, 19 Dec 2023 01:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E395B10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 01:59:54 +0000 (UTC)
X-UUID: 4af690889e1211eea5db2bebc7c28f94-20231219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=dm83H+5/sN1HpFBNwfDXtC7kB1dImpCvVfnSXVI+lDk=; 
 b=SfG9mF5iwKNGa8DZNhM+5EP6wfpmOEpGtO+zH3cyZj3Y+po5BxiAlO8++UnaxlGuvC4408T+V6iyu3y6pM/4cmtzEL9flOj4dO5WiW+KzoYGfkH0RqQq3N0CoUQtSyl+wzPAZBvFXbhh9bikr3PTE9RZUYTdixFVrUPUW40s0R4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:25cfc46c-a062-41df-8ae8-c8cde9fc3f7a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:e77a5961-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4af690889e1211eea5db2bebc7c28f94-20231219
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1822623940; Tue, 19 Dec 2023 09:59:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Dec 2023 09:59:48 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Dec 2023 09:59:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDGxnuNSoqxUf6yPl1cCKk6W6fhHGsdtSI25SXSvAW+cuTbKRjX8sJGxPkGfGU6l7AAZcZglU/t23fSUSCPz7Xqh1Ouzl0zJAQ6fzbigzP5S3MdJNcnix29P3eCCRxq5O5+Wid5tZlY+PS4Al1TpSkoyRuYhmWPQ6JD2SznlVlOB7babj7IZEIexqp3XypZFP2v0PHBVjJsldaoyKz7B6rU9DQTS6IVWlOzsaotw449UUaoA3WLLEhXufmqMI//rpwjNFflYPyZYuzhFWnLwQ/B7g+1Ry19bIBOMYS7oVpslQqYtklKDiSM//3iPT/1t7j4KjA/nRad0GC0Ec4trFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMglanoxa96ECTZreGtfRZ3mYu2hYZ5/MQFMiOab1R8=;
 b=Auo6fol3DsRLxnAszsJyyQOjd8w1kJCp++h6cbh2/ibjnvxYBhi83yzo/IdPD6SOKMrZRAC/k1HC6aC2WwjlYEpHmVmYqdczYP1JqNHEDKeIOM8UUciZC5pr7SpgXfNUdiLLMPpYs8KYpvKutE85JQLimZvRQzZNN0YXDiwsKLAY0GdV6VLScRbKynHWLR1uwLrL4/gHiAHOaIcBceI1HF0d0DbXWZC53Ti6g13UGYLKlwUR0Js9Zw2WWG4aa7ONrD2d/GiAcElH2la5aMD3jvQXSvY2X5+PCn/1YigSdmzjYXBRWOTdD1cZoZbky51zseY57/bwWJXwNg/cxAsZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMglanoxa96ECTZreGtfRZ3mYu2hYZ5/MQFMiOab1R8=;
 b=H0Labt//kZxIwP4aKqpfOBWyL5QyGQPrDk4gOPsmOo877fcuNbdskUhR/S/EL3hKOcIvUNxfsG88i1jNVInObGKaz4Lg+HFAWp+xn2fbqpmiCiO0NnbEnjZfG7N/BBYW6ObAhcCB2bZt0fZruLw6v+uvcz9QpOj4QWsvr2hCIdw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6278.apcprd03.prod.outlook.com (2603:1096:4:169::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 01:59:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 01:59:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrCwAKuA
Date: Tue, 19 Dec 2023 01:59:46 +0000
Message-ID: <73674f38c33051c0dac151e9fe0cdac02198b4bb.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6278:EE_
x-ms-office365-filtering-correlation-id: c193adfa-5ce2-40c4-aff5-08dc00362cdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STDv344Qvz8jGs5DCUale/Z3QHQEAOxTbG+QpoBmg4wDY473Ddx8dNLz+jjKgbP92f+UffQVGIU8HmV3AFyMRhi+h1wkJiuo+IhCa8jBniMd2lEU5fU8IWwGTbfnTQy8fiXoQ1+jduv4q7fsEXa2Iuy9iE5oTEkc3h1ZN1T4eu0/PMM5onO/Ew5sbNM4qQaJrGiGrAMNHgjpwGJuzt5YyPrCGveFkS+s62YtaANHQ6HFZ8xisuHLIsLbKTYXFvuVUVdYzOaC9iMU2queFMBYuY1QFzYFTQEn3pMtu75wSEr9nr6emetmAUUcrsuwBGASPWMuMUHcRGriI2cPIJre98Jnzi23YVyjzk2RXpPf68s3s8x9XN9v/qlo3b+Xd6tcsayrlTOnSgN2YNqUacuVDNZ0I9ESSljqkyqqhdi/QjzI9VtvovX27hmkzFBR+Qxe74TE8bnJhKt18XdvEuLfZpitTdR5+8GDuatkAofbJmjEP06/l9i4mwjkP+LYpJWPcvWoGONA3uA9PrlyxQWYMZuUO21rWJE5NjTXss5XzPLH9AycF4NKVHN2FCAnxRv4L4ybgyJe3IlKBgAa2I8NH755nFYtqpuhN0qlQVeGx0ed8Jkq08QYLmMMjLQI6DKv3+RLfdKFjVY7AhMtTYcWnKpnmyTp/DSMtwUWMQY83Ds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(2616005)(6506007)(316002)(41300700001)(4326008)(83380400001)(4744005)(54906003)(7416002)(8676002)(4001150100001)(2906002)(5660300002)(478600001)(71200400001)(6486002)(110136005)(8936002)(66476007)(66446008)(76116006)(64756008)(66556008)(66946007)(86362001)(36756003)(85182001)(107886003)(26005)(38100700002)(122000001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bk5mMlJVbWdtWEVZaWIxODF6VER0bUIyQXhIMWZpNVZlOG42MDR4K1FXdlJF?=
 =?utf-8?B?TnhVbzYyNmttY1ZQVzVWOFBVMUY2dXcrZ2ZlQnRzK1REU0tibXRTK0NXUFJy?=
 =?utf-8?B?WU11d2pORHhYcUxOYkVuYmpwc01MWjczdXJkVEkwdGwzcG1nclRSdXNhdHpK?=
 =?utf-8?B?UzBlVXpnL0EyOGxneUk1b2FLVVdnMDFtMFhaVUNtSFhObjVJdHBzNFBGMXlX?=
 =?utf-8?B?WkZUUDdZNDNHR3dEWVNJNmFOZE5wV1ZqckNaR1hOWlFFNU85cVJ5NHhSby9F?=
 =?utf-8?B?VGFxb2lZYy9YNEFkNjdEdU1XWnc2M1o0N2NuTTAxMnhUcU5HRnlVN3BTaWpM?=
 =?utf-8?B?UlZRZkk5MmNnT2VLaFhKVVZNZlpjZGliei8xQVd2a3MrZWNGYXVtVktLamdu?=
 =?utf-8?B?N1RPQ3ZJK0lUL3VVbmprL0xvRHlOZ2h1TTdyaC9RaGw0Y3g1ZDY3YzlXTks1?=
 =?utf-8?B?NkhvU05jL3BlWi9QL0FubWxZVjhFd1YrK28wYTN1Z0VQbVVFb3JuYmxiWlNj?=
 =?utf-8?B?bUhOL0FiZHNJTVdZN0o1b1BwMEJqTlJ4cUVlYWMrRCt5eVFlN0pvdnRuWU03?=
 =?utf-8?B?aUx4Y1RuYXRVc3V3bkxTeHBmR3NoY0VzUWNVdnIyVkFWM3pZdWg3RWxFWHpG?=
 =?utf-8?B?VU91Ky9XaW1SKy9Veis4bVFrVUFvWEhxMFkvTnBmQ0RsSkNTa2Q1WUdvVUdS?=
 =?utf-8?B?WkdUa2J3YW45c3Y3VlE2eE5qMi9aNThON200RFZjQjJJcjBxYTF0Rk1VZ3BI?=
 =?utf-8?B?a0xLMHFGWjkycHN5Z241Q21HSEhSV0cyWll4czEyYVVnb0hGSkcwM1Z0cUhR?=
 =?utf-8?B?ME1mQnk1T2JYa29JcS96dlk5WWp0VFBOZmROWFFpa0tlRCt3ZDlUdEtIQlpm?=
 =?utf-8?B?L0dKMTZ1bzlLV2RIZjNlMnVucW9jU0JSWFlTOHY0bW1oaVkxelZIeTJBdTFM?=
 =?utf-8?B?bzZubnduQ2NpTHRPK1dlMHpYNkZINitoRlExQjVYdUk3eVlnUjlHVTFDRkpy?=
 =?utf-8?B?SzVadzEvekZmbVovZ2pWWUVVdWlLMVJMMG51WVdOMFVaUmpSc0pyWi96bGxC?=
 =?utf-8?B?RGhOQlNRRmsyTEJRY1JwSis1Y1p3aEErKyswU3N3bDR0YWluWGhyS1M4VGk0?=
 =?utf-8?B?OGxSb0hFTHdQVUhjb2ZsZk0xZE9lQUFkRDhNRnB2Y0xhNGJxeEtiQ08ydVpS?=
 =?utf-8?B?ZWcxVXdWcEtSY0tXeUQxTzREM1RHSHQxUXpXcng1aVhtVVNWM29DUG5jZGpN?=
 =?utf-8?B?YUs3Qm52Y3E4VW9ZL0x0Wlg4NVdpWCs2R0pQR1A0VCtacW9pcmgrTWZPUUVr?=
 =?utf-8?B?T1Y5NEI2eTVmMmVTVzR2a0k1V2FZNVF1bmphRCtUTUR5eGJZR2pkMHZuRTNJ?=
 =?utf-8?B?QlBkcEJndER2anlHNDRQNXN1R2VSamVFclhYWVNtbXNHQjdHZDBQdTJPZ0xs?=
 =?utf-8?B?bDI2UkdSRldrKy9vOFZlVVVBclJNc2ZoZi9QbnJHU0hPS3R4UWZaKy9kdWVT?=
 =?utf-8?B?VFFpcUpOWHIwOTh6ck01MHVIU3pWcEJKZmxwVGlSclhPeEQwYmM1NGJyaEdE?=
 =?utf-8?B?QVNwd1lKTlE4eXp3aGJZQmFpU1JhMWF2cUc5b3h0eEsrZUlPT1hlSU5VdEtl?=
 =?utf-8?B?TmlySmYzak9Hd3U1MEZSdklqVklxZWp2bkMxZVR1MjNLRlIxWTdXTUZVZlNV?=
 =?utf-8?B?U0VUYUdtUlFCdlpjczQ3OVVFRUJ5NnprQVE3ZGF5azFNQXpmbXhDRTl6cWdu?=
 =?utf-8?B?dlpaNDBlVFhkeVFOZC9yaDZPeEpUcFVuaHNoQmllWHAyVTRRQTIvK3AwTjZa?=
 =?utf-8?B?R2VxRXludG4rdmkwR0NKd1B6UW5RZnVFVGU2MXF5blF5WkVoN1VkNFRlNmJR?=
 =?utf-8?B?TzcyR29yeE9TMDhxTzlpMjhQUzJtb0ExL0NjQ1czV0hZcW5sSUxLNm9NSU5B?=
 =?utf-8?B?VmFpWlBITVNTSkNtTkRvWE1sOU1uTzk0N0pFYTVCa0dCSWZ0am5ZRjg3dkI3?=
 =?utf-8?B?dWVTQ0JyVEpKSDhNRXFTTWNCUHNtTjZxWkZ3VjQvSEEvUFBPcVBoZVplYWdL?=
 =?utf-8?B?NXZKSVVZY3lLaXN1WXMvUlFxU1RCaWdTbG5xNngzZTBteU5mdWVtSVRENC9l?=
 =?utf-8?Q?pOWzSU2wNN0oQIV8l89xKkJSH?=
Content-ID: <AD433C2B2B654F40A124A63EBD52C4C4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c193adfa-5ce2-40c4-aff5-08dc00362cdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2023 01:59:46.0601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0qnaZI+YHzrKIPBBIHer18IFrno1tN4Wr2gG8BECdnOD3kp6xuOd0G8BMe1JVhYNhLWn1XqHl1ok9ptuAFXIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6278
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_269672008.525634475"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_269672008.525634475
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7TWFjOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0xMS0yNCYjMzI7YXQm
IzMyOzE2OjUzJiMzMjsrMDgwMCwmIzMyO21hYy5zaGVuJiMzMjt3cm90ZToNCiZndDsmIzMyO0Fk
ZCYjMzI7dGVlJiMzMjtjbGllbnQmIzMyO2FwcGxpY2F0aW9uLCYjMzI7SERDUCYjMzI7MS54JiMz
MjthbmQmIzMyOzIueCYjMzI7YXV0aGVudGljYXRpb24mIzMyO2Zvcg0KJmd0OyYjMzI7RGlzcGxh
eVBvcnQNCiZndDsmIzMyO3RvJiMzMjtzdXBwb3J0JiMzMjt0aGUmIzMyO0hEQ1AmIzMyO2ZlYXR1
cmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjttYWMuc2hlbiYjMzI7
Jmx0O21hYy5zaGVuQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOw0KDQpbc25pcF0NCg0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7bWhhbF9kcF90eF9oZGNwMXhf
c2V0X3JlcGVhdGVyKHN0cnVjdCYjMzI7bXRrX2hkY3BfaW5mbw0KJmd0OyYjMzI7KmhkY3BfaW5m
bywmIzMyO2Jvb2wmIzMyO2VuYWJsZSkNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsraWYmIzMyOyhl
bmFibGUpDQomZ3Q7JiMzMjsrbXRrX2RwX3JlZ191cGRhdGVfYml0cyhoZGNwX2luZm8tJmd0O3Jl
Z3MsDQomZ3Q7JiMzMjtNVEtfRFBfVFJBTlNfUDBfMzRBNCwmIzMyO0JJVCgxNSksJiMzMjtCSVQo
MTUpKTsNCiZndDsmIzMyOytlbHNlDQomZ3Q7JiMzMjsrbXRrX2RwX3JlZ191cGRhdGVfYml0cyho
ZGNwX2luZm8tJmd0O3JlZ3MsDQomZ3Q7JiMzMjtNVEtfRFBfVFJBTlNfUDBfMzRBNCwmIzMyOzAs
JiMzMjsmIzMyO0JJVCgxNSkpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyNpZmRlZiYjMzI7SUZf
WkVSTw0KJmd0OyYjMzI7K2lmJiMzMjsoaGRjcF9pbmZvLSZndDtoZGNwMXhfaW5mby5yZXBlYXRl
cikmIzMyO3sNCiZndDsmIzMyOyt1OCYjMzI7dGVtcDsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0
ZW1wJiMzMjs9JiMzMjtCSVQoMCk7JiMzMjsvKiYjMzI7UkVBVVRIRU5USUNBVElPTl9FTkFCTEVf
SVJRX0hQRCYjMzI7Ki8NCiZndDsmIzMyOytkcm1fZHBfZHBjZF93cml0ZShoZGNwX2luZm8tJmd0
O2F1eCwmIzMyO0RQQ0RfNjgwM0IsJiMzMjsmYW1wO3RlbXAsDQomZ3Q7JiMzMjsxKTsNCiZndDsm
IzMyOyt9DQomZ3Q7JiMzMjsrI2VuZGlmDQoNCklGX1pFUk8mIzMyO2lzJiMzMjtub3QmIzMyO2Rl
ZmluZWQsJiMzMjtzbyYjMzI7cmVtb3ZlJiMzMjt0aGVzZS4NCg0KUmVnYXJkcywNCkNLDQoNCiZn
dDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_269672008.525634475
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IA0KDQpbc25pcF0NCg0KPiArDQo+ICtzdGF0aWMgdm9pZCBtaGFsX2RwX3R4X2hkY3Ax
eF9zZXRfcmVwZWF0ZXIoc3RydWN0IG10a19oZGNwX2luZm8NCj4gKmhkY3BfaW5mbywgYm9vbCBl
bmFibGUpDQo+ICt7DQo+ICsJaWYgKGVuYWJsZSkNCj4gKwkJbXRrX2RwX3JlZ191cGRhdGVfYml0
cyhoZGNwX2luZm8tPnJlZ3MsDQo+IE1US19EUF9UUkFOU19QMF8zNEE0LCBCSVQoMTUpLCBCSVQo
MTUpKTsNCj4gKwllbHNlDQo+ICsJCW10a19kcF9yZWdfdXBkYXRlX2JpdHMoaGRjcF9pbmZvLT5y
ZWdzLA0KPiBNVEtfRFBfVFJBTlNfUDBfMzRBNCwgMCwgIEJJVCgxNSkpOw0KPiArDQo+ICsjaWZk
ZWYgSUZfWkVSTw0KPiArCWlmIChoZGNwX2luZm8tPmhkY3AxeF9pbmZvLnJlcGVhdGVyKSB7DQo+
ICsJCXU4IHRlbXA7DQo+ICsNCj4gKwkJdGVtcCA9IEJJVCgwKTsgLyogUkVBVVRIRU5USUNBVElP
Tl9FTkFCTEVfSVJRX0hQRCAqLw0KPiArCQlkcm1fZHBfZHBjZF93cml0ZShoZGNwX2luZm8tPmF1
eCwgRFBDRF82ODAzQiwgJnRlbXAsDQo+IDEpOw0KPiArCX0NCj4gKyNlbmRpZg0KDQpJRl9aRVJP
IGlzIG5vdCBkZWZpbmVkLCBzbyByZW1vdmUgdGhlc2UuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9
DQo+ICsNCg==

--__=_Part_Boundary_001_269672008.525634475--

