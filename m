Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01197ACFDD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 08:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2596710E1E3;
	Mon, 25 Sep 2023 06:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D0810E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 06:10:57 +0000 (UTC)
X-UUID: 47c8ffe45b6a11eea33bb35ae8d461a2-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hPGjGstyb4oFh2fGpwZi5teL2IMswm+GFMBTEuDIu8M=; 
 b=MiR3hNmprpmb+18au9ekBYOCs3ZdL6s/5sFFktOS12eja8RgXd/uExYbQ7tLZomNkWZ4GCuXoeP8i2s2WJsWmy++cnDeMJEqqa9ekzGVSsVeSBuuf7/oAkaxcfLLSQ9av+DrwWXsbUBeozv1hOV5CwxQfX953pSL8M4cjvazIDw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:bd39ece2-e14e-46d1-acdb-1696b3fc2b3f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:7ac65514-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 47c8ffe45b6a11eea33bb35ae8d461a2-20230925
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1117781041; Mon, 25 Sep 2023 14:10:52 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 14:10:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 14:10:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH3fPnGU/T78mU4InawGCziDCvdS70WXydPS3hVKosA1T2NDMTPiF0Ck2sIkQNI7kIZKyK6XCF4DxfkchiL3IZcNM579YeiYRODxN3zMAWG/4/dR8ZY5CtFUhSVeBVXVssoo3EiLoPD8+tmh1Rtp/uE5lMiwGiFTSPcQZ83baESK1CCrs6AQdUFaP5eSp97Jc/eNKanBG9tUi6LJy/XNQzNdimTy5/mAnCIxLXCh3Dgnc2ETpGxZv7lIL96eeJEmadR3392zgoGowmKxv1PAc/ouEUjBFVlClcCBEVYagL4jrU3RP8uLD+RJAH5sAeQXAsHL9k/b/Dt7o9T9x0ARhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyDkXqgROhTcXPYym/ZGnuPyBoTrVGifUhYflUKKP6Y=;
 b=dE6getgzAE6lCoI17obrS4Dc3WX68egrGsFkm6YeN4GeQ8IMTgphrYoxvPlWZ7Wx5LxkJuZkYMEsmu1PNUAbsmihaLztfD8C4WpgPRe80bpq7pYaNuJTIV7eG6qhx/9lF2kycPLFC2cnasTeAC1iJJwWsBrXIwI9UJ3libY/1a72qxNFYCIEFOW6faoYZRlckBEKYmiwrhqP0GcPBWW3n++PGYUk6mowMOHK6xR/Ciaa1DrFNcDzgS6N/x+v83D/CBGIrm8HyjcvVXireO2mvFXIragZBtrJuIBAg097Ee5oHGyFvG9ZCKjdJiDnBX9XsmxY7Xliaer/5QWtNUHrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyDkXqgROhTcXPYym/ZGnuPyBoTrVGifUhYflUKKP6Y=;
 b=XyiYaYNxxdeoZ+seuWoH3Wj3l6z/ERofqZ7CVUSchzNeNrs10u+uyBn/yS2d0UyUanGDbFv9Io3j8Or0Gr0fNhe4EvS9wZCC17AsAnb5zCI5Ra6nleriebOyVlk3Kq36269mXmQlrIwhTIw7j3APFwHI7yKhlDJxDwxPXcPJTM4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB5770.apcprd03.prod.outlook.com (2603:1096:4:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 06:04:58 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:04:58 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Thread-Topic: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Thread-Index: AQHZ6mWDa+rwkVDFL06SYTk3XuyKWbAovQ+AgAJakYA=
Date: Mon, 25 Sep 2023 06:04:58 +0000
Message-ID: <b4a7b38d81e7d0634a172dcdd11f0106ac9449a9.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-9-jason-jh.lin@mediatek.com>
 <ecda52ed-1d17-45e8-ab90-a9070ceb2d1c@linaro.org>
In-Reply-To: <ecda52ed-1d17-45e8-ab90-a9070ceb2d1c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB5770:EE_
x-ms-office365-filtering-correlation-id: 369a3048-3290-4dbf-23f9-08dbbd8d58e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lMKlzjMJC+4FMXoZ23sjMEGt4gNW/bzXrSixCb7KMpWZ9YsfrJALx6eyrdbE33SUsdHB0oDV4F5Karge0nqQB6J7Kv7utJ98mP1+c5AEC2Z9iLNs1gKnyD5Z34ZDuxdmY0dnUDNbJ264iKbPz1qfUXl72dRFf84MpuFvbLQTpJ2dsoYt49O5WOZFnb6J60HUoVog1wiB4R9hNT6RysExmO8XS6EawSSndgqaDU5I7rdjzszaJm7zSz98YnHop7bn1SRRq6Kdp+rPEbLvqg8hmIe9jtpvK1u5QeLgM+piGp024YlAmLs9dv3k5uBySo6sPAiD9Hdw5KsdsJ3Bw7SQO8ELtfrbXLd4tLxaOmlEkYrNtoTobA7SmJgnQrClDCAaTsjovL5kpl1e2rhi0W1gn6bHWMaGc+iKpio9tr8RTX8TFXUrijdyBDoTt+ZxMY7vcZsbLXEMgh8iFeVLIMC88xve7A27ncRxAuObQHaY6q2NfVetXS65eS1U2+s7UP6Hz9VUqPDVXoToJIo49g8hfc6NcWR7Dvhcw6QEpcqi90qcmG0IRRLzEXErlY04anTOjtdlU3QCfzRkkd1NKo5PBctZrR/1mAUFEJbiDG0m0ftUSsj7G8VNqTMuD2ikkFxnN7vyma+ttbpG0KVUWwTXqoBTGR7wtPttw9dvvNIFEbc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(53546011)(6486002)(6512007)(107886003)(26005)(71200400001)(2616005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(110136005)(91956017)(86362001)(478600001)(122000001)(38070700005)(38100700002)(83380400001)(54906003)(2906002)(8676002)(8936002)(4326008)(85182001)(36756003)(5660300002)(316002)(41300700001)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHhndEYvZjFialIwTWtReDBpNDAvL0xBN3h0ZW1DcXNWUkg0MFVRakdCU1JY?=
 =?utf-8?B?TjlZNGdaZjJZbHVKOXQ2Qm84UTVpK0oranhNbHdpKzRQNytQb2FaOFU4TDQ2?=
 =?utf-8?B?bmRMcFdlWFc3NGxpeWJtbWdxWUlvNWlIaEJzcGlmbzRyZjNnZG85czF0VGk2?=
 =?utf-8?B?cm45Ujk1TzVsNWE3TVVHT1FubW9Qd2pOcERadjA5N1RpK2ZiN3I0THU0bjUy?=
 =?utf-8?B?NWxKTjBFM2I4czlhN3R2bmo0bURzV01SV0pYRWQvU3U1eFFJU1B3LzNLaHZU?=
 =?utf-8?B?dUt3czBuYkdnMDNBQTl4d2g2Y0xQTWdnQkpBbTFEa1dUM3JlcitRUUFhWFkw?=
 =?utf-8?B?NGpJaXgvQzFIQnRQNUN2TVk5cG1FbDNzZklKRjBaR3p2bW1SQUlRWGZ4RFRy?=
 =?utf-8?B?Z3M0RU9iZ0VINVZuUHFVMTREckNhUXZnbnRQRkdBaUpQVGxEUUJzMXF1ZVdm?=
 =?utf-8?B?S2FBNGtCQjNWV3hjYzRULzR2cThtc3hGRnVvWlYzV1hPbXZJaWF3Qjd0UW9z?=
 =?utf-8?B?VjlnQUdFVWJPRWI5emRRSm5iYTFpMWptWG1nK2txSnZVUGpsNnNZNXkwaTRO?=
 =?utf-8?B?SG0wTCsrTnpvT2o5a1FuakpHK2lSNWlOSng4NUtDVy8xRmhNVHI1WEU2elRh?=
 =?utf-8?B?N2kyUWViVytrMHlBaFVBT3JSVGNjSklrRkZLcC81OEpkeWtZSStuRFdoTitt?=
 =?utf-8?B?eWdPdUw3Ry9FVm9nY3RIb2RUOWc4eFZ2b1Q0cFc1Ny81UTlYOTdQU0NFb2ty?=
 =?utf-8?B?ZVlOZ1RycjZVS291bUdhdHUxUGhmK0hraUl2bzIwTUl1TFVFU3h0VmVXRWZj?=
 =?utf-8?B?Z25jWDFQM1RGVlJhRzFDS1E0Wm5lQ1liVkFQaS9lZ2lxVEZ3UkFKMWpycmVN?=
 =?utf-8?B?VGVMMDlFRTRvKzROcU5pcUpsVkJzOGU0dW56aTRGbE9uZHlUWGQ2RHFiUUdK?=
 =?utf-8?B?bUN0UFZsR29NOHFDS1dqSnhxbURHYy9GWU5sOEVPOUpGMGhXb1FLR2Q0Ynh1?=
 =?utf-8?B?TTRJZkRGdEVZajhNcHU2QXI3TTBNc2lsazduMWNRaGRRelRRQmhqb2hxa2xL?=
 =?utf-8?B?aHJuSndlUlRselNyaXQxeWpmdTd1cy9qUXpkVFRPekdnc0lMTFE1aTFMOHI1?=
 =?utf-8?B?QlNCS1FqZmU5Q0dXSkJHVmI2VmdCajJMaXZKMXFBVVJ5cXBmNmtBcDJ4NmpT?=
 =?utf-8?B?TkkvTzFyTEE4TTFPRzNXZXlKemRqMDFGeDJROFNLckVkRzJvemdjWXluQ3ZB?=
 =?utf-8?B?TVFEbnlidHIwZ0ZFSjloalVhNTJoWHdsZU92T3Rla3hVMlFmTHhhZXR4QlR6?=
 =?utf-8?B?eXVQSnAyR21IaDRKLzVPNlZnOTFUL2FwNy9nRUwxckVWTTlOUTQvMUFOWTBX?=
 =?utf-8?B?NXV3cnNqc2VXa0FDMm55WGRzNEh0UnNCU1Rqa2hxV1pxUW1WdXdDTVdrRkdK?=
 =?utf-8?B?R0hXTklocXd0QmlXd3JvQjJKTkZJdmZKNDVFMy9DcGpmNGpaY3VnQjl2TjNa?=
 =?utf-8?B?eURnK3k5Zk0rclR2MC8rYko2ejVxTUpyK1J5YnZDbXQ4U2JoZGNNMm9DUFd2?=
 =?utf-8?B?eDNWM01HNVRMd1NDbzBlemY1aDdGNWFsZmVOU09uQ0NDbklKVjhSdmVEQ0p4?=
 =?utf-8?B?Y0VmQk9icDdHdGx4U3NtdGxXeXUrUEEyeE44aWNETTBKd05hemgzRjR2R0xu?=
 =?utf-8?B?OTRzcXdzTkY2M0grTWRLdzhibVBES0oweFV3dWRWc3VHTkcrNXd2TjJJT1JR?=
 =?utf-8?B?NnF0a0NjaXVacFBtQXZxc0hCQ0lGbm1ZRmxiZEJnZm0zM0svK2tYSnZKVFFj?=
 =?utf-8?B?bERDVzBRaEpJYVNNYkUxL2FyUGQ0SDRnRk9TR1o2SCtrcStaWGpIdjVyUDNh?=
 =?utf-8?B?cEZCdGMzMzV1OERYWXhIUjRmejZ3aGF3TGIvbHlpNjQyamJXbUlZaGY5aDgv?=
 =?utf-8?B?eHlMbFY1OXVCUExOTkJTdnA3RFdHMGZ0aVlLVTNKancwWk9BR0RUZERvd1dn?=
 =?utf-8?B?U1VzRDYvdnlqTHhxUWpWV3p0ckdDMUM2NlpncjFLU0ZNeVNiM0hUcmdaaGRh?=
 =?utf-8?B?N2JwR01INythdlRiUkVuSzBJUFRXV2NKNElqN0hxcEVFdDBhZlV6Q2lwd0FK?=
 =?utf-8?B?Z0h4QlZhRDFYZmtIa2FTeGpIS3B2a3NNZXdFVGtqelRYZHIxTm44MG9NdG4x?=
 =?utf-8?B?R3c9PQ==?=
Content-ID: <E2E0C09E282E974AA00DEBB87126A784@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369a3048-3290-4dbf-23f9-08dbbd8d58e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 06:04:58.2495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojpReX8ooS5QL/JP0oH+aGyeeOdpbn9S10/toS/KGKe2qDnAuSDuLijbvt1MwrVBku8ZKhWGZtTmUQvKK6SHwPBam1nYi1Nn6sDjLdcoyv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5770
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1487958234.855261471"
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
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1487958234.855261471
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtLcnp5c3p0b2YsDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jl
dmlld3MuDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6MDgmIzMy
OyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2Um
IzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0
dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYj
MzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsm
IzMyO09uJiMzMjsxOC8wOS8yMDIzJiMzMjsyMToyMSwmIzMyO0phc29uLUpILkxpbiYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO2NtZHFfcGt0X2ZpbmFsaXplX2xvb3AmIzMy
O3RvJiMzMjtDTURRJiMzMjtkcml2ZXIuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyO2NtZHFfcGt0X2ZpbmFsaXplX2xvb3AmIzMyO2FwcGVuZHMmIzMyO2VuZCYjMzI7b2Ym
IzMyO2NvbW1hbmQoRU9DKSYjMzI7aW5zdHJ1Y3Rpb24mIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYj
MzI7anVtcCYjMzI7dG8mIzMyO3N0YXJ0JiMzMjtvZiYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiMz
MjtpbnN0cnVjdGlvbiYjMzI7dG8mIzMyO21ha2UmIzMyO3RoZSYjMzI7Y29tbWFuZA0KJmd0OyYj
MzI7Jmd0OyYjMzI7YnVmZmVyJiMzMjtsb29wYWJsZS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2ph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMm
IzMyO3wmIzMyOzIzDQomZ3Q7JiMzMjsrKysrKysrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjtpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oJiMzMjsm
IzMyO3wmIzMyOyYjMzI7OCYjMzI7KysrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7MiYj
MzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjszMSYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzRi
ZTJhMThhNGEwMi4uYmJiMTI3NjIwYmIzJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KJmd0OyYjMzI7
Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5j
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTQ3NSw2JiMzMjsrNDc1LDI5JiMzMjtAQCYjMzI7
aW50JiMzMjtjbWRxX3BrdF9maW5hbGl6ZShzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0KQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO0VYUE9SVF9T
WU1CT0woY21kcV9wa3RfZmluYWxpemUpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOytpbnQmIzMyO2NtZHFfcGt0X2ZpbmFsaXplX2xvb3Aoc3RydWN0JiMzMjtj
bWRxX3BrdCYjMzI7KnBrdCkNCiZndDsmIzMyOyZndDsmIzMyOyt7DQomZ3Q7JiMzMjsmZ3Q7JiMz
Mjsrc3RydWN0JiMzMjtjbWRxX2luc3RydWN0aW9uJiMzMjtpbnN0JiMzMjs9JiMzMjt7JiMzMjt7
MH0mIzMyO307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtlcnI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyomIzMyO2luc2VydCYjMzI7RU9DJiMzMjthbmQm
IzMyO2dlbmVyYXRlJiMzMjtJUlEmIzMyO2ZvciYjMzI7ZWFjaCYjMzI7Y29tbWFuZCYjMzI7aXRl
cmF0aW9uJiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2luc3Qub3AmIzMyOz0mIzMyO0NNRFFf
Q09ERV9FT0M7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraW5zdC52YWx1ZSYjMzI7PSYjMzI7Q01EUV9F
T0NfSVJRX0VOOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K2VyciYjMzI7PSYjMzI7Y21kcV9wa3RfYXBw
ZW5kX2NvbW1hbmQocGt0LCYjMzI7aW5zdCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsraWYmIzMyOyhl
cnImIzMyOyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMzMjtlcnI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyomIzMyO0pVTVAmIzMyO3Rv
JiMzMjtzdGFydCYjMzI7b2YmIzMyO3BrdCYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytlcnIm
IzMyOz0mIzMyO2NtZHFfcGt0X2p1bXAocGt0LCYjMzI7cGt0LSZndDtwYV9iYXNlKTsNCiZndDsm
IzMyOyZndDsmIzMyOytpZiYjMzI7KGVyciYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOyZndDsm
IzMyOytyZXR1cm4mIzMyO2VycjsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOytwa3QtJmd0O2xvb3AmIzMyOz0mIzMyO3RydWU7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMzMjtlcnI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0K
Jmd0OyYjMzI7Jmd0OyYjMzI7K0VYUE9SVF9TWU1CT0woY21kcV9wa3RfZmluYWxpemVfbG9vcCk7
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO05BSy4mIzMyO05vJiMzMjt1c2VycyYjMzI7KGFuZCYjMzI7
cGxlYXNlJiMzMjtjYXJlZnVsbHkmIzMyO3RoaW5rJiMzMjtiZWZvcmUmIzMyO3lvdSYjMzI7YW5z
d2VyJiMzMjt0aGF0JiMzMjt5b3VyDQomZ3Q7JiMzMjtvdGhlciYjMzI7cGF0Y2gmIzMyO3VzZXMm
IzMyO2l0KS4NCiZndDsmIzMyOw0KDQpBcyYjMzI7SSYjMzI7a25vdywmIzMyO3RoZSYjMzI7QVBJ
JiMzMjt3aXRoJiMzMjtFWFBPUlRfU1lNQk9MJiMzMjttZWFucyYjMzI7aXQmIzMyO2NhbiYjMzI7
YmUmIzMyO3VzZWQmIzMyO2J5JiMzMjthJiMzMjtkeW5hbWljDQpsb2FkZWQmIzMyO21vZHVsZS4N
Cg0KRG8mIzMyO3lvdSYjMzI7bWVhbnMmIzMyO3RoYXQmIzMyO210ay1jbWRxLXNlYy1tYWlsYm94
LmMmIzMyO2luJiMzMjtbUEFUQ0gmIzMyOzEwLzE1XSYjMzI7aXMmIzMyO2EmIzMyO2J1aWx0LWlu
JiMzMjsNCm1vZHVsZSYjMzI7Y3VycmVudGx5LCYjMzI7c28mIzMyO0kmIzMyO3Nob3VsZCYjMzI7
bm90JiMzMjthZGQmIzMyO0VYUE9SVF9TWU1CT0wmIzMyO3RvJiMzMjt0aGlzJiMzMjtBUEkmIzYz
Ow0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMs
DQomZ3Q7JiMzMjtLcnp5c3p0b2YNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCjwvcHJlPjwhLS10
eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRp
YWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5
IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMg
b2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5
c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8g
YW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1487958234.855261471
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBTYXQsIDIwMjMt
MDktMjMgYXQgMjA6MDggKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ICAJIA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiAgT24gMTgvMDkvMjAyMyAyMToyMSwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+IEFk
ZCBjbWRxX3BrdF9maW5hbGl6ZV9sb29wIHRvIENNRFEgZHJpdmVyLg0KPiA+IA0KPiA+IGNtZHFf
cGt0X2ZpbmFsaXplX2xvb3AgYXBwZW5kcyBlbmQgb2YgY29tbWFuZChFT0MpIGluc3RydWN0aW9u
IGFuZA0KPiA+IGp1bXAgdG8gc3RhcnQgb2YgY29tbWFuZCBidWZmZXIgaW5zdHJ1Y3Rpb24gdG8g
bWFrZSB0aGUgY29tbWFuZA0KPiA+IGJ1ZmZlciBsb29wYWJsZS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMjMNCj4gKysr
KysrKysrKysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEuaCAgfCAgOCArKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEtaGVscGVyLmMNCj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0K
PiA+IGluZGV4IDRiZTJhMThhNGEwMi4uYmJiMTI3NjIwYmIzIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+ID4gKysrIGIvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gPiBAQCAtNDc1LDYgKzQ3NSwyOSBAQCBp
bnQgY21kcV9wa3RfZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3QpDQo+ID4gIH0NCj4gPiAg
RVhQT1JUX1NZTUJPTChjbWRxX3BrdF9maW5hbGl6ZSk7DQo+ID4gIA0KPiA+ICtpbnQgY21kcV9w
a3RfZmluYWxpemVfbG9vcChzdHJ1Y3QgY21kcV9wa3QgKnBrdCkNCj4gPiArew0KPiA+ICtzdHJ1
Y3QgY21kcV9pbnN0cnVjdGlvbiBpbnN0ID0geyB7MH0gfTsNCj4gPiAraW50IGVycjsNCj4gPiAr
DQo+ID4gKy8qIGluc2VydCBFT0MgYW5kIGdlbmVyYXRlIElSUSBmb3IgZWFjaCBjb21tYW5kIGl0
ZXJhdGlvbiAqLw0KPiA+ICtpbnN0Lm9wID0gQ01EUV9DT0RFX0VPQzsNCj4gPiAraW5zdC52YWx1
ZSA9IENNRFFfRU9DX0lSUV9FTjsNCj4gPiArZXJyID0gY21kcV9wa3RfYXBwZW5kX2NvbW1hbmQo
cGt0LCBpbnN0KTsNCj4gPiAraWYgKGVyciA8IDApDQo+ID4gK3JldHVybiBlcnI7DQo+ID4gKw0K
PiA+ICsvKiBKVU1QIHRvIHN0YXJ0IG9mIHBrdCAqLw0KPiA+ICtlcnIgPSBjbWRxX3BrdF9qdW1w
KHBrdCwgcGt0LT5wYV9iYXNlKTsNCj4gPiAraWYgKGVyciA8IDApDQo+ID4gK3JldHVybiBlcnI7
DQo+ID4gKw0KPiA+ICtwa3QtPmxvb3AgPSB0cnVlOw0KPiA+ICsNCj4gPiArcmV0dXJuIGVycjsN
Cj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X2ZpbmFsaXplX2xvb3ApOw0KPiAN
Cj4gTkFLLiBObyB1c2VycyAoYW5kIHBsZWFzZSBjYXJlZnVsbHkgdGhpbmsgYmVmb3JlIHlvdSBh
bnN3ZXIgdGhhdCB5b3VyDQo+IG90aGVyIHBhdGNoIHVzZXMgaXQpLg0KPiANCg0KQXMgSSBrbm93
LCB0aGUgQVBJIHdpdGggRVhQT1JUX1NZTUJPTCBtZWFucyBpdCBjYW4gYmUgdXNlZCBieSBhIGR5
bmFtaWMNCmxvYWRlZCBtb2R1bGUuDQoNCkRvIHlvdSBtZWFucyB0aGF0IG10ay1jbWRxLXNlYy1t
YWlsYm94LmMgaW4gW1BBVENIIDEwLzE1XSBpcyBhIGJ1aWx0LWluIA0KbW9kdWxlIGN1cnJlbnRs
eSwgc28gSSBzaG91bGQgbm90IGFkZCBFWFBPUlRfU1lNQk9MIHRvIHRoaXMgQVBJPw0KDQpSZWdh
cmRzLA0KSmFzb24tSkguTGluDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo+
IA0K

--__=_Part_Boundary_001_1487958234.855261471--

