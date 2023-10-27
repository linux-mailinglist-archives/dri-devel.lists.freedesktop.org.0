Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398E7D903D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 09:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD5D10E94C;
	Fri, 27 Oct 2023 07:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF01A10E94C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:47:48 +0000 (UTC)
X-UUID: 1d148240749d11eea33bb35ae8d461a2-20231027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5RgAXGtvuU34ogsFxLPbLU5/Txzk5kOLXSj+lIJh5iM=; 
 b=uqz3MKctVW3znIWog4PTWKhZEOlhqem5hHSG6gA/IXfvndwOyersn34wNsX5pQTyubJEKfCg8agAKkGzo7r8z5qa0CGTPLpIPStzg0aIYBX1S+xDb1Im+s/2E3SzkHTXPOR7pRHoLGiHjKA9XEkYSWFOqfUzU7i1E23lxcMWfTQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:715cdd54-4c49-4d3f-afb9-05b53b7bd4ce, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:d16563d7-04a0-4e50-8742-3543eab8cb8e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d148240749d11eea33bb35ae8d461a2-20231027
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 966884629; Fri, 27 Oct 2023 15:47:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Oct 2023 15:47:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Oct 2023 15:47:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFKGoll1xTHNCoNd5+IPeM/v+k78FRqsdv9GVXAlD1naAgTdafNQOFDJazorcC/pYkGNddQFpkq18jGsWG1Jgq0Ns1cQCF+cO17/e4aHEmkpYzDAPKFOnGle206jfi1ftdss80A7mdS9kxdbM7lGO/BrBRkRGNar33qXh8niAcGnN9m5ZFWkM5Zg6fxaGnu1t1RphZeEl9MmO8wvyZ4/BjsvsCM+eARiDv9ceq79aWQHvYnlE5srJh4BDJhIA9Xdf4IZol2Ih1X5iI435I07shgX0VKRJ8HTYb4qr54Df33ZIFhBGBRhHrTdoqzOTbMAz5YNm6pdiULN6wUcxHOLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RgAXGtvuU34ogsFxLPbLU5/Txzk5kOLXSj+lIJh5iM=;
 b=m4GdI5Tx1WUgzwGxBQtwVhamdfbpk6DxPi8iHYcVZZoSK0+Y2gkQFS1P6xbyQqwO6NmOoyjf5m58bhGiSI0BM8CX4AS9LxSXJEjzSnszx9FP3DvHDQPlnukLPUEUTw7Gtphb7oQSdLCGPgq7w+OsoTOH//9I3XMb5QIlXbO3ZEO7E+2d0i3myXnfnZKCG2kfJYE8rRvjO4tmOLr9/Wf6PjLP6g31o8kYg0Nin0jr/tgDuxkBXJZoFp6s9dahjj0ZnQM7F3Nr9FsaA+G5ZYBySxAHC1o5fwLTB1q1GPplB2rVPqlUBXSiW9pTvL9vXJgfDZ1TNHigOhT8djySrRG2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RgAXGtvuU34ogsFxLPbLU5/Txzk5kOLXSj+lIJh5iM=;
 b=FWgVcvTshjqgf+pVn7gdivte8giHepu9wteHLqSWv6Hz3gvaX4ImGg3pZfChsXVfjmHJSsQOcU5YtASgKiESYC6+y4EvNGBzYxJ6Opt74epgUjwijvfXx4V1txdcFUxyTV17jF6E4ci54w3IViAqwdC0kS/hWQYL1yCBmfB4GHA=
Received: from KL1PR03MB5891.apcprd03.prod.outlook.com (2603:1096:820:81::9)
 by TYZPR03MB5454.apcprd03.prod.outlook.com (2603:1096:400:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.20; Fri, 27 Oct
 2023 07:47:40 +0000
Received: from KL1PR03MB5891.apcprd03.prod.outlook.com
 ([fe80::7570:e874:f473:48b]) by KL1PR03MB5891.apcprd03.prod.outlook.com
 ([fe80::7570:e874:f473:48b%4]) with mapi id 15.20.6933.019; Fri, 27 Oct 2023
 07:47:39 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Thread-Topic: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Thread-Index: AQHZ5FgcsYZL1VMcSUC+/rX+uk2OfbBQxXUAgAHqBgCACRcmgIABxGUA
Date: Fri, 27 Oct 2023 07:47:39 +0000
Message-ID: <7eb7ca8f64789c4eb5096e19f4cf15f6b53bb260.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-5-yong.wu@mediatek.com>
 <5d806772-a2b4-4304-be45-7c2ed2930fcc@quicinc.com>
 <c8bf01a083182fdc83742de8daad8c5ce8d56d5b.camel@mediatek.com>
 <ac44de13-f4e0-4bae-b06b-af90fadaa96c@quicinc.com>
In-Reply-To: <ac44de13-f4e0-4bae-b06b-af90fadaa96c@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5891:EE_|TYZPR03MB5454:EE_
x-ms-office365-filtering-correlation-id: c50cde0c-6b96-4e3a-1be1-08dbd6c0fec2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FidOWPnhG9kizKDCH9phsrdsIafs9cxiwjMKNtb5ccphVojOPPiMFQDmh9p7+YQzS35ddLx5zFe5D9gkAVgIy0ElQg30gk51p9qVGfPDVF/aKPubq89FalOYR5miz6jSqb/mrsMQ/Bkp4+5aiVfytXBOwdicy7Jkyb90UXN5cmeb2F3F5JGVMLz6SqIow9CwkFqPMGqeksVurbcr+FnQiVBvchNnhQ5fk12Adni6AwmtGo7hNtOrW6+ArWNqm+E/Cp+Okx0G/qLJxRDMvBeI8wrPyypSOmEG5sUM2KGLu5AxDPJIPkGv0StIiW0y8RFsjcAw/2Y+7pkCX5eBZxWPMD+t7u7s63r3hMt1bbZdd/VE5lVaMb7yMf1Esiuf9zY3ahqHyzBt51QKLOHPISI+yIfExTCliWFcivq54KhXNspdmqxzNOzCbOrAZNtRzNZhHNxyWsVL+JCbxtR1GpamUWQ2H8xB89T74NbvUu4uRy8/oJs6Vb4t4Vm9q0eLR8p+7Q2bsP1i9BfurCoGdEbxReWvDhgJ/FmfB6eAkxdlKFv0q1Lwc+/ltgPzZAe3fVuKQbMyuRadmGVgbqKKvcZEfXfFTIxO7pABVPF6ZZSzJdYreux6P/mQA+YeNadLUcvJ5IFDyWkwjRSfCv7AApuPNMqaHb5UQzs92WKhklY7kJnIaqvBltWyDeqkauktMPD1gGczCjAuuSXHnD/Ixd0nIWBObM/HVGBZ/5/2l1sPuW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB5891.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799009)(2906002)(41300700001)(83380400001)(478600001)(4326008)(8936002)(8676002)(4001150100001)(6486002)(7416002)(91956017)(110136005)(66946007)(76116006)(66556008)(54906003)(5660300002)(86362001)(316002)(66446008)(66476007)(64756008)(71200400001)(53546011)(38100700002)(2616005)(6506007)(122000001)(85182001)(26005)(36756003)(6512007)(38070700009)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmxNczcxd3BmRTNJdkdFdzJ6Yld0akFsWEQ2STRkanNNMlBJZS9WVFY2R1RX?=
 =?utf-8?B?VkFoakNaZkV4alh4YXRsVjRUN0xxdjFJN1F5bmFkR2dxY3NCRWtGbzNaT0Fh?=
 =?utf-8?B?TFpERldmbjlEZW1FM3Rjb2QxQ0tMejYwRHk2QVdSUUF0dkl4WnF6RUpjYkJ6?=
 =?utf-8?B?Zkgrd0Vsb01JVm9OZnQrd2N2REhmL3ZPZkMxZ2xsdEFNL0FuVDE2aDhIeW1i?=
 =?utf-8?B?bktvVGU2em55Ri9sMm5hdGphVTFXSy9FM0xseS9GU0VrVnhmRFNRUFVsVCtN?=
 =?utf-8?B?NnlWYTBlam1mbmo5cytYZ0pldWxsaDNhMnJrendlcmRuZE1HaWFlV1Y3cmRE?=
 =?utf-8?B?bFE3N0txV2NHdjVTZ0ZTNmFmRmFva0Z2L1YvVjBnVTYzUUlka0p0Yk9sMlFk?=
 =?utf-8?B?cTd2RllUYmp0eWdhaXRKUGhNelhzd050cnh6dGwyUEdNbnV3QStXblRZT1E4?=
 =?utf-8?B?REVpVFVxRHQ5dzZZT0QvdkFJWjNtOUJEL2dQa0RDajZWSE1nQVNDTjNwTHJz?=
 =?utf-8?B?TkV5YzJKeW1qR2FZS0E2OVdrQVp4dFdoWGZBQUhtQW9QUnJnTEtUUzNVNE4r?=
 =?utf-8?B?bGpSM3ZaMERxVnJjZE1NN2w1S00xQXhnaWJMcFQ3azRzYXBnbkh2aXppUjBS?=
 =?utf-8?B?aGZiQitVd2Z3RkJvdm53Ym1NdDY4MDdSaDFaWldJeU5ZMkZEUnpWOHRsYVpD?=
 =?utf-8?B?aW5oN3p2aXZPRmsvei9sM2JGZnp1bHZjYVBmQ0JJbVpsZGhzRFg1bXdadmZB?=
 =?utf-8?B?SHhxbkhnUVFaeUxER1IxL1ZoQ3hQdEhibE5CZDZuQUVreSt6Vm9VNjViTVJq?=
 =?utf-8?B?clphNHEweDdHOEZhb2d5ZDlVRkM1azF2aUxVTWIwWEoweVFHRWw2TDdrUGhQ?=
 =?utf-8?B?TkpoNllJVUgwV3BBQm1GVkdYRVhvWS9wUVJQRk8wRnFPWnc0NFM5TWNvNVdU?=
 =?utf-8?B?N2VRUkYybFh2ZXhPaUJoKzUvMkI1bFNWQk9FM2Q2ak5raTFYeVh4NFhkV21P?=
 =?utf-8?B?RjFTMVZ4RUdNYWNxZFYwNzhhdGdlc1NFY2Fha2h0eVVIRTZ4c2ErL09EVmE2?=
 =?utf-8?B?dUYxbEtkb1V3clFsYTh0OWhoVjBrVGJ3YW1kTEsvNlF5QkNzOWVQd0FnR0x0?=
 =?utf-8?B?bEc2ZHN3WkEybjZvVUhhdWVrQ1oxQkFETFJ4SmRiV2RFZStYTENMMjgySUZY?=
 =?utf-8?B?RXFpWm5GbmFoUHd0SkZHZEU4bnFVQVNpWlYwZlhrc3JwQ3JkR2R6R05aT2VK?=
 =?utf-8?B?QStoVmF6UmRDTm9lbU0yZmRTSllRSUxCUVQ0L2J4V2NNK291Ry8vZHVRQmJX?=
 =?utf-8?B?Mi9BT2ZyVVpMMGtvd0xNdUxySTROakxlWUhhMjZVWXYwQjZGS1FvOXB1SS9O?=
 =?utf-8?B?b3ZlWkljalpwM1dlZkI3WjRCYTFyb0FHdEZaOU96Z3ZvR2pqMGxudVB3YUNF?=
 =?utf-8?B?bWlzNVZVM0x3VkwrcHAwR3RmU1cwYnhYUzBwcG0rc1ZvTzV0Y3RHUEJ4cDJI?=
 =?utf-8?B?SzE5VHA1SVZPSGl3a0QrQWJJM1ZVUG9pVnFlKzdmbVhVeThYWlo2TlF3ZFNa?=
 =?utf-8?B?Mm1td012N1IvZkNSdzRGS2UvOUhDaHltMS9mZkJpRWU3OTRkSk9XZnl3bEJL?=
 =?utf-8?B?L1I0OTFsUzBmRXM4cFNXQnlSbFkvcnlMbFNRU0xUdWxha2Q4UXVVLzNTczBV?=
 =?utf-8?B?cDFnVjlVTVMyeDRrVlNpa2g3dmJlL2laQUJLVkZYemhydU52TU13R0hVQThm?=
 =?utf-8?B?MDBCalI2OSs2eVJGMjN6dURqblljTUVFSlJlZHh6ZDBiOHFXc1VFMDJESDNp?=
 =?utf-8?B?UjZ5Smt4SFdBYzFtZzE3VGlYMCtaYzhIVm80WkJ1YzBlQXV3ODBSakExdXRU?=
 =?utf-8?B?R25yMUo5YXA3azRXVnhrOUlRZmdxdHdMdkcvLzNJWnB2bHNYQ3RBRTdBaVl6?=
 =?utf-8?B?RnNBRHJ3akNFeG85Z2FJRVk4VVBUbWc3VzY5NlBqOVluaUVDR2RZRWF4UFdw?=
 =?utf-8?B?Z1plbEtoaHUyWDdGVlhZMEtPdUliZU9Lc3BOMXo2VTBZRU8ydzFYZUMrbkhV?=
 =?utf-8?B?UUc1ckZ1Slg0Yms3b1k4N3orblQ1TkJwU0t5U0I5cEJiRWJaaFd3bVdha1Rx?=
 =?utf-8?B?b2Vmd0VSSW82dnFkdkg3RjJNSHFqN2pWTG5xN3ZLSk4zbEgwbVBvdGp1RnBt?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60B64C07B9F9DE4581D29040B8F213A7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5891.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50cde0c-6b96-4e3a-1be1-08dbd6c0fec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 07:47:39.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYAVsFy7mtzwiFM96QvJvYI0GUjFLFZgLeo9KO151MAOy1APhB3Q81XfidOPZL3xtjkKzItFLfSfuALCnfXZ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5454
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.987400-8.000000
X-TMASE-MatchedRID: GagEC7nsA0TUL3YCMmnG4ia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCifZYRtbOr2tXP5rFAucBUHljSRvSGpq3AvfK0LrjZKR+Vi
 hXqn9xLE8VyRVdn8owHHEY3wAlhGZuHOrhBa04XYZXJLztZviXCaXkqwRSzYhVz8J52OVy+TNCc
 A6Zdzj7/ussAPktum8UH1fATrWE7ZU6u9UHHozeGtGlKM15tA2Fa3BY8pK6XbHkH7uosEn7HzK3
 Q9zSFL7FswrvCXzJM1ndx8+Uhq6S+N8IkV2qksKDYh1Uz6zv6MA9LOqZd1iiZsoi2XrUn/J+ZL5
 o+vRV7yhMIDkR/KfwI2j49Ftap9E4kYXbobxJbLnIzRzWS2P0w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.987400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 17C4349B9EBA4D09F19ADDE8FA2C340A2C626624C1E5889088D19FCB490A88482000:8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTI2IGF0IDEwOjE4ICswNTMwLCBWaWpheWFuYW5kIEppdHRhIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gIA0KPiANCj4gT24gMTAvMjAvMjAyMyAzOjI5IFBNLCBZb25nIFd1
ICjlkLTli4cpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMy0xMC0xOSBhdCAxMDoxNSArMDUzMCwg
VmlqYXlhbmFuZCBKaXR0YSB3cm90ZToNCj4gPj4gICANCj4gPj4gRXh0ZXJuYWwgZW1haWwgOiBQ
bGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMNCj4gdW50aWwNCj4g
Pj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPj4gIA0K
PiA+Pg0KPiA+PiBPbiA5LzExLzIwMjMgODowMCBBTSwgWW9uZyBXdSB3cm90ZToNCj4gPj4+IElu
aXRpYWxpc2UgYSBtdGtfc3ZwIGhlYXAuIEN1cnJlbnRseSBqdXN0IGFkZCBhIG51bGwgaGVhcCwN
Cj4gUHJlcGFyZQ0KPiA+PiBmb3INCj4gPj4+IHRoZSBsYXRlciBwYXRjaGVzLg0KPiA+Pj4NCj4g
Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgICAgICAgICAgIHwgIDgg
KysNCj4gPj4+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvTWFrZWZpbGUgICAgICAgICAgfCAgMSAr
DQo+ID4+PiAgZHJpdmVycy9kbWEtYnVmL2hlYXBzL210a19zZWN1cmVfaGVhcC5jIHwgOTkNCj4g
Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KDQpbLi4uXQ0KDQo+ID4+PiArDQo+ID4+PiAr
c3RhdGljIHN0cnVjdCBkbWFfYnVmICoNCj4gPj4+ICttdGtfc2VjX2hlYXBfYWxsb2NhdGUoc3Ry
dWN0IGRtYV9oZWFwICpoZWFwLCBzaXplX3Qgc2l6ZSwNCj4gPj4+ICsgICAgICB1bnNpZ25lZCBs
b25nIGZkX2ZsYWdzLCB1bnNpZ25lZCBsb25nIGhlYXBfZmxhZ3MpDQo+ID4+PiArew0KPiA+Pj4g
K3N0cnVjdCBtdGtfc2VjdXJlX2hlYXBfYnVmZmVyICpzZWNfYnVmOw0KPiA+Pj4gK0RFRklORV9E
TUFfQlVGX0VYUE9SVF9JTkZPKGV4cF9pbmZvKTsNCj4gPj4+ICtzdHJ1Y3QgZG1hX2J1ZiAqZG1h
YnVmOw0KPiA+Pj4gK2ludCByZXQ7DQo+ID4+PiArDQo+ID4+PiArc2VjX2J1ZiA9IGt6YWxsb2Mo
c2l6ZW9mKCpzZWNfYnVmKSwgR0ZQX0tFUk5FTCk7DQo+ID4+DQo+ID4+IEFzIHdlIGtub3csIGt6
YWxsb2MgY2FuIG9ubHkgYWxsb2NhdGUgNE1CIGF0IG1heC4gU28sIHNlY3VyZSBoZWFwDQo+IGhh
cw0KPiA+PiB0aGlzIGxpbWl0YXRpb24uDQo+ID4+IGNhbiB3ZSBoYXZlIGEgd2F5IHRvIGFsbG9j
YXRlIG1vcmUgbWVtb3J5IGluIHNlY3VyZSBoZWFwID8gbWF5YmUNCj4gPj4gc2ltaWxhciB0byBo
b3cgc3lzdGVtIGhlYXAgZG9lcz8NCj4gPiANCj4gPiBUaGlzIGlzIGp1c3QgdGhlIHNpemUgb2Yg
YSBpbnRlcm5hbCBzdHJ1Y3R1cmUuIEkgZ3Vlc3MgeW91IG1lYW4gdGhlDQo+ID4gc2VjdXJlIG1l
bW9yeSBzaXplIGhlcmUuIFJlZ2FyZGluZyBzZWN1cmUgbWVtb3J5IGFsbG9jYXRpbmcgZmxvdywN
Cj4gb3VyDQo+ID4gZmxvdyBtYXkgYmUgZGlmZmVyZW50IHdpdGggeW91cnMuDQo+ID4gDQo+ID4g
TGV0IG1lIGV4cGxhaW4gb3VyIGZsb3csIHdlIGhhdmUgdHdvIHNlY3VyZSBidWZmZXIgdHlwZXMo
aGVhcHMpLg0KPiA+IGEpIG10a19zdnANCj4gPiBiKSBtdGtfc3ZwX2NtYSB3aGljaCByZXF1aXJl
cyB0aGUgY21hIGJpbmRpbmcuDQo+ID4gDQo+ID4gVGhlIG1lbW9yeSBtYW5hZ2VtZW50IG9mIGJv
dGggaXMgaW5zaWRlIHRoZSBURUUuIFdlIG9ubHkgbmVlZCB0bw0KPiB0ZWxsDQo+ID4gdGhlIFRF
RSB3aGljaCB0eXBlIGFuZCBzaXplIG9mIGJ1ZmZlciB3ZSB3YW50LCBhbmQgdGhlbiB0aGUgVEVF
DQo+IHdpbGwNCj4gPiBwZXJmb3JtIGFuZCByZXR1cm4gdGhlIG1lbW9yeSBoYW5kbGUgdG8gdGhl
IGtlcm5lbC4gVGhlDQo+ID4ga3phbGxvYy9hbGxvY19wYWdlcyBpcyBmb3IgdGhlIG5vcm1hbCBi
dWZmZXJzLg0KPiA+IA0KPiA+IFJlZ2FyZGluZyB0aGUgQ01BIGJ1ZmZlciwgd2Ugb25seSBjYWxs
IGNtYV9hbGxvYyBvbmNlLCBhbmQgaXRzDQo+ID4gbWFuYWdlbWVudCBpcyBhbHNvIHdpdGhpbiB0
aGUgVEVFLg0KPiA+IA0KPiANCj4gVGhhbmtzIGZvciB0aGUgZGV0YWlscy4NCj4gDQo+IEkgc2Vl
IGZvciBtdnBfc3ZwLCBhbGxvY2F0aW9uIGlzIGFsc28gc3BlY2lmaWMgdG8gVEVFLCBhcyBURUUg
dGFrZXMNCj4gY2FyZSBvZiBhbGxvY2F0aW9uIGFzIHdlbGwuDQoNClllcy4gVGhlIGFsbG9jYXRp
b24gbWFuYWdlbWVudCBvZiB0aGVzZSB0d28gaGVhcHMgaXMgaW4gdGhlIFRFRS4NCg0KPiANCj4g
SSB3YXMgdGhpbmtpbmcgaWYgYWxsb2NhdGlvbiBwYXRoIGNhbiBhbHNvIGJlIG1hZGUgZ2VuZXJp
YyA/IHdpdGhvdXQNCj4gaGF2aW5nDQo+IGRlcGVuZGVuY3kgb24gVEVFLg0KPiBGb3IgZWcgOiBB
IGNhc2Ugd2hlcmUgd2Ugd2FudCB0byBhbGxvY2F0ZSBmcm9tIGtlcm5lbCBhbmQgc2VjdXJlIHRo
YXQNCj4gbWVtb3J5LA0KPiB0aGUgY3VycmVudCBzZWN1cmUgaGVhcCBkZXNpZ24gY2FuJ3QgYmUg
dXNlZC4gDQoNClNvcnJ5LCBUaGlzIG1heSBiZSBiZWNhdXNlIG91ciBIVyBpcyBzcGVjaWFsLiBU
aGUgSFcgY291bGQgcHJvdGVjdCBhDQpjZXJ0YWluIHJlZ2lvbiwgYnV0IGl0IGNhbiBvbmx5IHBy
b3RlY3QgMzIgcmVnaW9ucy4gU28gd2UgY2Fubm90DQphbGxvY2F0ZSB0aGVtIGluIHRoZSBrZXJu
ZWwgYXJiaXRyYXJpbHkgYW5kIHRoZW4gZW50ZXIgVEVFIHRvIHByb3RlY3QNCnRoZW0uDQoNCj4g
DQo+IEFsc28gaSBzdXBwb3NlIFRFRSBhbGxvY2F0ZXMgY29udGlndW91cyBtZW1vcnkgZm9yIG10
a19zdnAgPyBvciBkb2VzDQo+IGl0IHN1cHBvcnQNCj4gc2NhdHRlcmVkIG1lbW9yeSA/DQoNClll
cy4gQWZ0ZXIgdGhlIFRFRSBydW5zIGZvciBhIHBlcmlvZCBvZiB0aW1lLCB0aGUgVEVFIG1lbW9y
eSB3aWxsDQpiZWNvbWUgZGlzY29udGludW91cywgYW5kIGEgc2VjdXJlIElPTU1VIGV4aXN0cyBp
biB0aGUgVEVFLg0KDQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4gVmlqYXkNCj4gPj4NCg==
