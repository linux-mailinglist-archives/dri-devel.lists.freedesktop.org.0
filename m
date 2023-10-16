Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB47C9E2A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 06:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F57610E070;
	Mon, 16 Oct 2023 04:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545710E070
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 04:23:58 +0000 (UTC)
X-UUID: ced60cf86bdb11eea33bb35ae8d461a2-20231016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=T0vZaNSIZJDLXRTzicl9jeVja2/CN9kGmtNhSIaYQq4=; 
 b=YXquIM66LlUPf08jdEEcozRlFcdSPeKqCFoou9FcTd6Orib7oLPtlYff9DL4HZ10FvJTevM3qXFNXlgP5vKI1eMLvNYoagqTAp0xEUbM7cqyFDyohakjYHEhA9iz1roYx00nTn3IlDkOeiqPrfxVRqgSf4oC43H+sKozLmT4+8Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:030c1f85-4b26-4a29-a10e-f17236abfa45, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:937629c4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ced60cf86bdb11eea33bb35ae8d461a2-20231016
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1995762163; Mon, 16 Oct 2023 12:23:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Oct 2023 12:23:49 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Oct 2023 12:23:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV61PfM+QTQgvgkG2xkC+ypx8WL0MJzduRVlqCBRK/7YWpctMT618GbyVwoi2OeZgkIX1qx8wSkAa9UiC654t35wbYp09qJDJPf+TjaZZ6MVRsO6SHHVDhP3E7xsq3tojF9uo1xWiZ0Yu/uXEhQrOIcjaMaDw9szEL97N1YiENgrwwHKrlyNoFWYWaBd9LXGuvNjTT1Y0pKXyBxOk7kZ0SZQ6GWwIorIjm9lXIfwEbgLTac4qj1vRrSLTSOp4HgVhtm73a3PWcyO0RSBx2U1hZ+ZrksdhIsI3KnhD3+lHRu9nV674ZdVU4MqFyIWE3QIKTuOJ1nFKEWDl5yCMJriEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=;
 b=WGfN/DI71/4gr9zSg8rK5tqCMgvzABmOocAkm15MEnG33TjCtnGucCbNexiFBR+3f9VKuIldmz75rXshlnbFGbsDszlOWYTDzYP53nDTHX9FhjtZeEsw9vSDu+FPtcpdpDKEtYgjXvbn80ggwOtqJImppHQYnDMlF2toIlMprgnLbKVUCbNIy5FMtKEUUW3InvRUu90C1PVuNTUeF6bQAJ7i0Lcx3r49YBA8seulZFKhpV4dYT2jqGpZ98D3Z7fBgE5HOGVL1RfE2EIuvauyNSJlK92f0Qk11vUCQu/mbn+Q1nxRzb7cBXZT5tf5/AfkPH3Hwz0lDlHcuVT1DcwfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpswUfXLNiKotA2JlFCji9ao9T3QR4pwHz8ESUw3pB4=;
 b=CGi374j9WNBueWyey97nuGe9PMKz18FzHpkk5tIHZMKfzWOCIINgn0F7TMJxrjcY9v79sFyLz25LxOapTAZeNfAp/kzn3QHAVy5gjbs5tALnPxWqGD9p120692WL5vP2nc+bWqYLd1vj9iPKgOFqo3OGjxgdz9wL0LLbPduBudA=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by SEYPR03MB8077.apcprd03.prod.outlook.com (2603:1096:101:16b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 04:23:45 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 04:23:45 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "daniel@fooishbar.org" <daniel@fooishbar.org>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Topic: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Thread-Index: AQHZ+Cgp187jkr0vBEqA6ERKZhPrzbBH886AgAPs+YA=
Date: Mon, 16 Oct 2023 04:23:45 +0000
Message-ID: <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-5-shawn.sung@mediatek.com>
 <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
In-Reply-To: <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|SEYPR03MB8077:EE_
x-ms-office365-filtering-correlation-id: 16f10b01-3691-4670-4d06-08dbcdffafb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JTzRmGCxg7jpVD2K5cHbBuiSGMxmVxd0AwX535u5Oip6wPyv306W3RelKkUoHOMXAnxW1Gi8Z7coHRZfMNYI5TAXwpzTxW1Ftc8v/NrX5neagYwBw/F2F41ND8hherBYqsSiisx12vhaKv3CD3A+Fz+brNVp8+OoV03haaDnz8dZQu8rAcEnXdBeXjh6SwXIrPt33HJq0V3U5a5TouwO6Y6zQPuc9/Jo+FO1G/RlZkTWNLXyYss9/LCRRTt8cTkPyU9htOA158hKh4linG9sjugHRRf+Kz/oZlkIK4+o42ATUN+x9+tVKJhyamtEiohPBCY8t8LJ7r5ziZ/e4fvYV0alrIvtBneviutE7aHVCyPpLkiC1yU3iY1bRRdUhhM5ODSWYowhbhyOUMhWyoW6lwvpFE+W8GV5pR9Tv+46tyVSv59UE1NsMBVHkQq0RkqclGduzOTTEH5d2FEefexpMQHFEJG2nUgyq6faDm66VPSGt2B//iqaxYQefHp0R/clPGF+ptcrw25jWmgXX31GrsRkiIIADQ/DqgkQlm4ZDa6mk3gJdE4tejuC0z/Q1dNP2uItSm0AiAenECTVdZpuNrP31hQD75czFI6Ewahaau1uItyPyTIbVCX8kns7QIA+Kqofw44xDNHJDOIZNGJzszmcUUKjT8zFIkZDq1vOBoQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(6486002)(122000001)(85182001)(36756003)(38070700005)(38100700002)(83380400001)(71200400001)(6512007)(26005)(6506007)(66446008)(76116006)(66946007)(66556008)(66476007)(6916009)(316002)(64756008)(54906003)(478600001)(2616005)(4001150100001)(7416002)(41300700001)(2906002)(86362001)(5660300002)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3lSWWJEL2RCcGtaSk1GT1EyQ2p3dFRZUUs2YWNocm1LbFlkcmlKTk10N2Np?=
 =?utf-8?B?K1dLcjNOZTdWSnBQT2MvYS9kNzBNUmFWNmo1d3ZnR0hCa0FMWmZqQ3greWFN?=
 =?utf-8?B?UnBnN0VnVlhmM3F1YVNvUW1DMUlhQmMxNmt6S0hoVjZTVDYyVVF5dTNGcW5k?=
 =?utf-8?B?TmNFTWMzQ2ZoenZ0STJJcml5OFpvOTY3Uys3N0ZUTWRUcE1xc1Y4OVdyS2Zt?=
 =?utf-8?B?MC80YnB6dkViZ1BnL1FOYXovVWt5czZwaTF4WFNtQ1UxSDB5OVJOKzZXTmVZ?=
 =?utf-8?B?M09VSzBnbnZ5RVdSVFkyL1kzbTFKSEppd2Fwc091dzhUV0dTaVRrdi9Hdnpy?=
 =?utf-8?B?Sm9mbFRJZVl0dEVTNGpZU3I5b0VtSHAzeDRXNWpJak1DY1N0WExrZWpTK1d1?=
 =?utf-8?B?UWJPQXFSR0FYNkMvRWpTUjNOcTI0ZEt4L1hVeGE4OHQyNG9rQi9nMkpRNjhM?=
 =?utf-8?B?blFrRjdEQ1p5UXJyMVJyQXQyNWdBb3JUNlM1MmNFQ0hjK0tOdEZGT1hhL1F1?=
 =?utf-8?B?M0hsUHBwVm5zd2JQckRSVk10aVZlZmI5N3JkdE92Y0dJTnhvWnYxNXQ0SWZu?=
 =?utf-8?B?U3RWcDRNTGxieVRIeTk2UTlhWWdMWDNHczNvS05Gd05MSG5aS3U0dEZkc2FH?=
 =?utf-8?B?T2F4eWRnUUhZNkRLK2MxSko5ZUF4bmNyc1RoaXRqcUxPdExPdjA2RXNtYVNw?=
 =?utf-8?B?Rk0xbXp0U2dURmhKT1hMWTFiemV0UGdiZU1sVUFSS25ocnBTdzA4NnVQcHZE?=
 =?utf-8?B?cnVFWCtER1lzYU1aRW9aTE5Udjd2TXR1QSs3OTJWOU80Mkc0WW5JL2F6RFk3?=
 =?utf-8?B?empBNDMrN1VMK3VNc2Y1N3RRaE1EeXlydmJ3TFdrUEFxTmtVeDBtTkROQW1v?=
 =?utf-8?B?WkhIZkFiTzQ3dVlpN25OZEw4Qzl0ME5FTWVxVnZQS1dFdCtOeEo3T3duTXA2?=
 =?utf-8?B?eXhJcnVHMCt2QUZ2blhXRWowZlNtc3pZTVd0R3l6aE4rMEJhYU9PSFV6ZWt1?=
 =?utf-8?B?d0NQSU00Rk5iQXAvbGNxWmJVZWtiNWU5ZTcyb2ZIb2Q5eVVpWGx6YzZZdXY5?=
 =?utf-8?B?dWgvZ1dNUS81OFBXVnlsWU4xTUtoc3Roblg5OGQ1NXMwLzB5dW9Cb2hDeThF?=
 =?utf-8?B?dFZabDl3NzQ4MEZZTjR4WVJpTHI4TXdRYlN5N2k3ZHBXR3NTeXgvcDRwcnJ2?=
 =?utf-8?B?WVFJMDYzOUJsMlZmdDlBRHlRaC9XWk9YcnNmcUJiU09aODhndFI0cE1JQWlE?=
 =?utf-8?B?QU5Md0lNSG9iU1k1dzJMaUxMWjFuclJ1R0ZQNHBYK0V0bjBXNk1hL2orOE5r?=
 =?utf-8?B?YzRFcGlBcG9ER0FScElVbjAzSTdLN2NMd3N3L25tU04yNGpWUTFMeVNKbXZI?=
 =?utf-8?B?aFBydHMzVTQ1MW9kelpOQ3RJak8yMkp2MTNGVTh0WGZPUGVNSHFjelNlNlVP?=
 =?utf-8?B?SzRqTGY3M0VQOHg5Q2xKZGNRSSt0ZHBSVWdlR1gyS25WaWs3V1MwRmNUeDBV?=
 =?utf-8?B?c1ZxRHFLTGJENW81R0RpT1MydGhhNmRSUFdSY2JCTkZIT2hsVDBYODg3VWxQ?=
 =?utf-8?B?cTNEbVpVbXk4bDRIblQ1b2JrMjJDSlpFOFlhSlJXUEFWeU0xa0YvTGVITkVB?=
 =?utf-8?B?WEtURkxyZlUvbUNZM1JoTXZBdnFSVlN1NXE1R2lUN3JhWWxuMTZwN0E1Z29Q?=
 =?utf-8?B?aUhMb2RoMFVZYk0xbU55KzE5NFlwUzNkZXZNQTR0cTgrZHcxb1JDT2JGeTVN?=
 =?utf-8?B?YkRBcTRIdllVWnNjOFBqR2twcFpmazF2Tzg4QmJ2UTJoeWdEclN4cncvT0cr?=
 =?utf-8?B?RGRWTFl0aDRKaWVLd3hBVG5CQSsrRnRFZlFPUnJKQWpYUEpQR2JlTEptYXFD?=
 =?utf-8?B?NjZlVE9WSjJRdDNrajJWRjd6V3lSdjUzUHV3Lzg4NzhjTzFnaC9PckJVNk5s?=
 =?utf-8?B?NFcyYXppT1BZbENqU2hvdStaNWdxQWhRUHY2b0I5SlN2N0NvYU5hNHV3TFhw?=
 =?utf-8?B?V0E1d3Q3MkF2YW02YzZJM0xHaTdlNlhPSXR4TVJ3a1NxdWFCbFU2MFVMb2xi?=
 =?utf-8?B?N09iVzljbDFQN0l0ZTk3MllEdTNSZUgxRjZKNlV4RkFTVkprSExEb2JrWS9O?=
 =?utf-8?B?S3ZKVGl4em1hdmRJUXhjcWZnVHlNb1BqQVVIdDViQlBCM3JZOHBXcEdEK1gx?=
 =?utf-8?B?Y3c9PQ==?=
Content-ID: <6DBDC21625B0884AAF1E4D84E0975AED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f10b01-3691-4670-4d06-08dbcdffafb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 04:23:45.1062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U31HDVLKQekmTEvcS3oPHLqzBNk0iyH5W+cKWJpFWSniA9Z0S55gP7TNL825o20TTGECtRiWG7DGK4pmCHiTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8077
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1231622268.1067526301"
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
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_1231622268.1067526301
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtEYW5pZWwsDQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTEwLTEzJiMzMjth
dCYjMzI7MTc6MjYmIzMyOyswMTAwLCYjMzI7RGFuaWVsJiMzMjtTdG9uZSYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMy
O1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3Bl
biYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zl
cmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZn
dDsmIzMyOyYjMzI7SGkmIzMyO1NoYXduLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7RnJp
LCYjMzI7NiYjMzI7T2N0JiMzMjsyMDIzJiMzMjthdCYjMzI7MDg6MzgsJiMzMjtIc2lhbyYjMzI7
Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDsNCiZndDsmIzMyO3NoYXduLnN1bmdAbWVkaWF0ZWsuY29t
Jmd0OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyO1BhZGRpbmcmIzMy
O3Byb3ZpZGVzJiMzMjthYmlsaXR5JiMzMjt0byYjMzI7YWRkJiMzMjtwaXhlbHMmIzMyO3RvJiMz
Mjt3aWR0aCYjMzI7YW5kJiMzMjtoZWlnaHQmIzMyO29mJiMzMjthDQomZ3Q7JiMzMjtsYXllciYj
MzI7d2l0aA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjtzcGVjaWZpZWQmIzMyO2NvbG9y
cy4mIzMyO0R1ZSYjMzI7dG8mIzMyO2hhcmR3YXJlJiMzMjtkZXNpZ24sJiMzMjtNaXhlciYjMzI7
aW4mIzMyO1ZET1NZUzENCiZndDsmIzMyO3JlcXVpcmVzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMz
MjsmIzMyO3dpZHRoJiMzMjtvZiYjMzI7YSYjMzI7bGF5ZXImIzMyO3RvJiMzMjtiZSYjMzI7Mi1w
aXhlbC1hbGlnbiwmIzMyO29yJiMzMjs0LXBpeGVsLWFsaWduJiMzMjt3aGVuDQomZ3Q7JiMzMjtF
VEhEUiYjMzI7aXMmIzMyO2VuYWJsZWQsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyO3dl
JiMzMjtuZWVkJiMzMjtQYWRkaW5nJiMzMjt0byYjMzI7ZGVhbCYjMzI7d2l0aCYjMzI7b2RkJiMz
Mjt3aWR0aC4NCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7UGxlYXNlJiMzMjtub3RpY2Um
IzMyO3RoYXQmIzMyO2V2ZW4mIzMyO2lmJiMzMjt0aGUmIzMyO1BhZGRpbmcmIzMyO2lzJiMzMjtp
biYjMzI7YnlwYXNzJiMzMjttb2RlLA0KJmd0OyYjMzI7c2V0dGluZ3MmIzMyO2luDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsrJiMzMjsmIzMyO3JlZ2lzdGVyJiMzMjttdXN0JiMzMjtiZSYjMzI7Y2xlYXJl
ZCYjMzI7dG8mIzMyOzAsJiMzMjtvciYjMzI7dW5kZWZpbmVkJiMzMjtiZWhhdmlvcnMmIzMyO2Nv
dWxkDQomZ3Q7JiMzMjtoYXBwZW4uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0lmJiMzMjtJJiMzMjt1
bmRlcnN0YW5kJiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7Y29ycmVjdGx5LCYjMzI7cGFkZGluZyYj
MzI7aXMmIzMyO2F1dG9tYXRpY2FsbHkNCiZndDsmIzMyO2FwcGxpZWQNCiZndDsmIzMyO3RvJiMz
Mjtjb21wZW5zYXRlJiMzMjtmb3ImIzMyO3VuYWxpZ25lZCYjMzI7ZGltZW5zaW9ucy4mIzMyO1Ro
ZSYjMzI7Zmlyc3QvbGFzdCYjMzI7cm93cy9jb2x1bW5zDQomZ3Q7JiMzMjtvZg0KJmd0OyYjMzI7
dGhlJiMzMjtvdmVybGF5JiMzMjthcmVhJiMzMjt3aWxsJiMzMjtiZSYjMzI7ZmlsbGVkJiMzMjt3
aXRoJiMzMjthJiMzMjtzcGVjaWZpZWQmIzMyO2NvbG91ciYjMzI7KGJsYWNrJiM2MzspJiMzMjt0
bw0KJmd0OyYjMzI7cHJlc2VydmUmIzMyO3RoZSYjMzI7YXJlYS4mIzMyO1RoaXMmIzMyO2lzJiMz
Mjt1bmZvcnR1bmF0ZWx5JiMzMjtub3QmIzMyO09LJiMzMjt0byYjMzI7ZG8mIzMyO3RyYW5zcGFy
ZW50bHkuDQomZ3Q7JiMzMjtVc2Vyc3BhY2UmIzMyO211c3QmIzMyO2JlJiMzMjthd2FyZSYjMzI7
b2YmIzMyO3RoaXMmIzMyO3BvbGljeSYjMzI7ZGVjaXNpb24mIzMyO2FuZCYjMzI7c3BlY2lmaWNh
bGx5DQomZ3Q7JiMzMjtyZXF1ZXN0JiMzMjtpdC4mIzMyO0lmJiMzMjtub3QsJiMzMjt0aGUmIzMy
O2F0b21pYyYjMzI7cmVxdWVzdCYjMzI7Y2hlY2smIzMyO3Nob3VsZCYjMzI7ZmFpbCYjMzI7YW5k
JiMzMjt0ZWxsDQomZ3Q7JiMzMjt1c2Vyc3BhY2UmIzMyO3RoYXQmIzMyO3RoZSYjMzI7cmVxdWVz
dGVkJiMzMjtjb25maWd1cmF0aW9uJiMzMjtpcyYjMzI7bm90JiMzMjtwb3NzaWJsZSYjMzI7dG8N
CiZndDsmIzMyO2FjaGlldmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NoZWVycywNCiZndDsmIzMy
O0RhbmllbA0KDQpZZXMsJiMzMjtQYWRkaW5nJiMzMjt3b3JrcyYjMzI7YXMmIzMyO3lvdSYjMzI7
ZGVzY3JpYmVkLCYjMzI7dXNlcnMmIzMyO2NhbiYjMzI7YXNzaWduJiMzMjtiYWNrZ3JvdW5kJiMz
Mjtjb2xvcnMNCmZvciYjMzI7dGhlJiMzMjtmaWxsZWQmIzMyO2FyZWEmIzMyO2luJiMzMjsxMGJp
dCYjMzI7UkdCJiMzMjtmb3JtYXQsJiMzMjtob3dldmVyLCYjMzI7dGhlJiMzMjtyb3dzJiMzMjth
bmQmIzMyO2NvbHVtbnMNCnRoYXQmIzMyO2FyZSYjMzI7ZmlsbGVkJiMzMjtieSYjMzI7UGFkZGlu
ZyYjMzI7d2lsbCYjMzI7YmUmIzMyO2Nyb3BwZWQmIzMyO2J5JiMzMjt0aGUmIzMyO2hhcmR3YXJl
JiMzMjtjb21wb25lbnRzDQphZnRlciYjMzI7aXQmIzMyO3RvJiMzMjthdm9pZCYjMzI7c2l0dWF0
aW9ucyYjMzI7YXMmIzMyO3lvdSYjMzI7bWVudGlvbmVkLCYjMzI7c28mIzMyO3VzZXJzJiMzMjtz
aG91bGQmIzMyO25vdA0Kbm90aWNlJiMzMjthbnkmIzMyO2RpZmZlcmVuY2UuDQoNClRoZSYjMzI7
cmVhc29uJiMzMjt3aHkmIzMyO3dlJiMzMjthZGQmIzMyO3BhZGRpbmdzJiMzMjt0byYjMzI7dGhl
JiMzMjtmcmFtZSYjMzI7YW5kJiMzMjt0aGVuJiMzMjtyZW1vdmUmIzMyO2l0JiMzMjtiZWZvcmUN
CnNob3dpbmcmIzMyO2l0JiMzMjtvbiYjMzI7dGhlJiMzMjtzY3JlZW4mIzMyO2lzJiMzMjtkdWUm
IzMyO3RvJiMzMjt0aGUmIzMyO2xpbWl0YXRpb24mIzMyO29mJiMzMjtFVEhEUi4mIzMyO1doZW4m
IzMyO0hEUiYjMzI7aXMNCmVuYWJsZWQsJiMzMjt0aGUmIzMyO2lucHV0JiMzMjtwaXhlbHMmIzMy
O2luJiMzMjt3aWR0aCYjMzI7bXVzdCYjMzI7YmUmIzMyOzQtcGl4ZWwmIzMyO2FsaWduZWQsJiMz
MjtidXQmIzMyO2ZvciYjMzI7bm93DQpFVEhEUiYjMzI7aXMmIzMyO2J5cGFzc2VkJiMzMjtzbyYj
MzI7YXMmIzMyO3RoZSYjMzI7UGFkZGluZ3MuDQoNClNpbmNlJiMzMjt0aGUmIzMyO1BhZGRpbmdz
JiMzMjthcmUmIzMyO2Fsd2F5cyYjMzI7YnlwYXNzZWQmIzMyO2N1cnJlbnRseSwmIzMyO3RoZSYj
MzI7bG9naWNzJiMzMjtkZXNjcmliZWQNCmFib3ZlJiMzMjthcmUmIzMyO25vdCYjMzI7aW1wbGVt
ZW50ZWQmIzMyO3lldCwmIzMyO210a19wYWRkaW5nX2NvbmZpZygpJiMzMjt3aWxsJiMzMjthbHNv
JiMzMjtiZQ0KcmVtb3ZlZCYjMzI7aW4mIzMyO3RoZSYjMzI7bmV4dCYjMzI7dmVyc2lvbiYjMzI7
YXMmIzMyO3RoZSYjMzI7cmV2aWV3ZXImIzM5O3MmIzMyO3N1Z2dlc3Rpb24uDQoNCkNoZWVycywN
ClNoYXduDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_009_1231622268.1067526301
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgRGFuaWVsLA0KDQpPbiBGcmksIDIwMjMtMTAtMTMgYXQgMTc6MjYgKzAxMDAsIERhbmllbCBT
dG9uZSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSBTaGF3biwNCj4gDQo+IE9uIEZyaSwgNiBP
Y3QgMjAyMyBhdCAwODozOCwgSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdAbWVkaWF0
ZWsuY29tPiB3cm90ZToNCj4gPiArICBQYWRkaW5nIHByb3ZpZGVzIGFiaWxpdHkgdG8gYWRkIHBp
eGVscyB0byB3aWR0aCBhbmQgaGVpZ2h0IG9mIGENCj4gbGF5ZXIgd2l0aA0KPiA+ICsgIHNwZWNp
ZmllZCBjb2xvcnMuIER1ZSB0byBoYXJkd2FyZSBkZXNpZ24sIE1peGVyIGluIFZET1NZUzENCj4g
cmVxdWlyZXMNCj4gPiArICB3aWR0aCBvZiBhIGxheWVyIHRvIGJlIDItcGl4ZWwtYWxpZ24sIG9y
IDQtcGl4ZWwtYWxpZ24gd2hlbg0KPiBFVEhEUiBpcyBlbmFibGVkLA0KPiA+ICsgIHdlIG5lZWQg
UGFkZGluZyB0byBkZWFsIHdpdGggb2RkIHdpZHRoLg0KPiA+ICsgIFBsZWFzZSBub3RpY2UgdGhh
dCBldmVuIGlmIHRoZSBQYWRkaW5nIGlzIGluIGJ5cGFzcyBtb2RlLA0KPiBzZXR0aW5ncyBpbg0K
PiA+ICsgIHJlZ2lzdGVyIG11c3QgYmUgY2xlYXJlZCB0byAwLCBvciB1bmRlZmluZWQgYmVoYXZp
b3JzIGNvdWxkDQo+IGhhcHBlbi4NCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB0aGUgZHJpdmVyIGNv
cnJlY3RseSwgcGFkZGluZyBpcyBhdXRvbWF0aWNhbGx5DQo+IGFwcGxpZWQNCj4gdG8gY29tcGVu
c2F0ZSBmb3IgdW5hbGlnbmVkIGRpbWVuc2lvbnMuIFRoZSBmaXJzdC9sYXN0IHJvd3MvY29sdW1u
cw0KPiBvZg0KPiB0aGUgb3ZlcmxheSBhcmVhIHdpbGwgYmUgZmlsbGVkIHdpdGggYSBzcGVjaWZp
ZWQgY29sb3VyIChibGFjaz8pIHRvDQo+IHByZXNlcnZlIHRoZSBhcmVhLiBUaGlzIGlzIHVuZm9y
dHVuYXRlbHkgbm90IE9LIHRvIGRvIHRyYW5zcGFyZW50bHkuDQo+IFVzZXJzcGFjZSBtdXN0IGJl
IGF3YXJlIG9mIHRoaXMgcG9saWN5IGRlY2lzaW9uIGFuZCBzcGVjaWZpY2FsbHkNCj4gcmVxdWVz
dCBpdC4gSWYgbm90LCB0aGUgYXRvbWljIHJlcXVlc3QgY2hlY2sgc2hvdWxkIGZhaWwgYW5kIHRl
bGwNCj4gdXNlcnNwYWNlIHRoYXQgdGhlIHJlcXVlc3RlZCBjb25maWd1cmF0aW9uIGlzIG5vdCBw
b3NzaWJsZSB0bw0KPiBhY2hpZXZlLg0KPiANCj4gQ2hlZXJzLA0KPiBEYW5pZWwNCg0KWWVzLCBQ
YWRkaW5nIHdvcmtzIGFzIHlvdSBkZXNjcmliZWQsIHVzZXJzIGNhbiBhc3NpZ24gYmFja2dyb3Vu
ZCBjb2xvcnMNCmZvciB0aGUgZmlsbGVkIGFyZWEgaW4gMTBiaXQgUkdCIGZvcm1hdCwgaG93ZXZl
ciwgdGhlIHJvd3MgYW5kIGNvbHVtbnMNCnRoYXQgYXJlIGZpbGxlZCBieSBQYWRkaW5nIHdpbGwg
YmUgY3JvcHBlZCBieSB0aGUgaGFyZHdhcmUgY29tcG9uZW50cw0KYWZ0ZXIgaXQgdG8gYXZvaWQg
c2l0dWF0aW9ucyBhcyB5b3UgbWVudGlvbmVkLCBzbyB1c2VycyBzaG91bGQgbm90DQpub3RpY2Ug
YW55IGRpZmZlcmVuY2UuDQoNClRoZSByZWFzb24gd2h5IHdlIGFkZCBwYWRkaW5ncyB0byB0aGUg
ZnJhbWUgYW5kIHRoZW4gcmVtb3ZlIGl0IGJlZm9yZQ0Kc2hvd2luZyBpdCBvbiB0aGUgc2NyZWVu
IGlzIGR1ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBFVEhEUi4gV2hlbiBIRFIgaXMNCmVuYWJsZWQs
IHRoZSBpbnB1dCBwaXhlbHMgaW4gd2lkdGggbXVzdCBiZSA0LXBpeGVsIGFsaWduZWQsIGJ1dCBm
b3Igbm93DQpFVEhEUiBpcyBieXBhc3NlZCBzbyBhcyB0aGUgUGFkZGluZ3MuDQoNClNpbmNlIHRo
ZSBQYWRkaW5ncyBhcmUgYWx3YXlzIGJ5cGFzc2VkIGN1cnJlbnRseSwgdGhlIGxvZ2ljcyBkZXNj
cmliZWQNCmFib3ZlIGFyZSBub3QgaW1wbGVtZW50ZWQgeWV0LCBtdGtfcGFkZGluZ19jb25maWco
KSB3aWxsIGFsc28gYmUNCnJlbW92ZWQgaW4gdGhlIG5leHQgdmVyc2lvbiBhcyB0aGUgcmV2aWV3
ZXIncyBzdWdnZXN0aW9uLg0KDQpDaGVlcnMsDQpTaGF3bg0K

--__=_Part_Boundary_009_1231622268.1067526301--

