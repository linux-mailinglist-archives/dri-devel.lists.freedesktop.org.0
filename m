Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912B7CF76F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 13:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32D410E4C5;
	Thu, 19 Oct 2023 11:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DC510E4CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 11:51:01 +0000 (UTC)
X-UUID: c3a28d386e7511eea33bb35ae8d461a2-20231019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=VhbPFEqeb430P49yeLSflX9xPtyY7x4fNWg0QkcGynE=; 
 b=mGXEZ+dKbJolAACBn3e438MvwVxlAKed2su6qFa2qQrL4S0NzMIKlk21rGINEjuLE1LO7JqZXwDaQnYS3f6ThnmEwwGXGtNemOe4reFd27nli+UG1cjG+ZSXsQfMp8zmGlNPkzezLvpQJo8KCAqkPCEYBs/oBgb9GNxOEVd1VOI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:41df58c6-c781-4e90-9497-c1df7311d2da, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:74befcf0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c3a28d386e7511eea33bb35ae8d461a2-20231019
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2028969842; Thu, 19 Oct 2023 19:50:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 19:50:55 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 19:50:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1GNUHmFJP+oGNNo/NtA6WM7IUyvVrzmpIUoE8LKywR5AOFsgvQeNhgeF42aC9TUP7AxsifUbbMmYPHV+LmeH/gpQIsdKx0arkVDRsdyipELiJgK1KsopN0KwVxjHlrXNdUowFoZZBLzDmzeEpVpWqXpctart4qsZ6tSMbCk/yUs9DRsfnZZMbwlalBm5jWQON/HGhR6iC49+6UB50VXZfw3x+61spxZ5PdtwKK47x8XUeHoAzz9L3rnIDw6X7wvZezCKqjBu7v5b6YkOr3BeXGE1Q1IIKeGfBSg3jYF2FmeWpPykVLEMG8ZFN+hlGuIuI2G7zv1GlBxAOAJJ1vXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWcUrgqDfyWTxG6jYi9ZzCpzFE23UrK6z0f3fSz3Jv4=;
 b=NLBwiY4Y3iJ8T1xvkZ1NR1KzUVnBC75WJrW5NRulBk7lbUllWRAurfJN2vnJrTH2knoQYsz3YjXTz/SA9JD67Sjlw5RNI5DomWl0SRcvceZbRDqjdwiy9h0oa+n0zao9HYyswzcYdGEF8Qr3aPpowaJr7lvmcHMaJZpz/t3bzarGme9Vn58ocUJ06Qdm1Qp8P/Ph3p6J9tV2BEVvj53Ym+ksDkrAID/RxRXdtCOpGgLKuSh/g1ZnOzxNMZaebM7gD2wqJurevMOoudyRDq8nVYeMxN47D0H+/T4LjWJn9dBbCrt5126iM8AGSb7zB+igz/OQmNP/SQC1rnOtccColw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWcUrgqDfyWTxG6jYi9ZzCpzFE23UrK6z0f3fSz3Jv4=;
 b=ZmZ0QTUjY1FhwSLyov2UP2UP7L3Oa1oXmAdKPa/IlNRk/OCLHSCzLOZUDC5vJsQ82wz7x4Ae0OQJyCo6cjRCHlnPJ1DPB1MgEql6MRPCIkjbg7B31cHNWyHXt0Ibrujm6oLC2eFlHqXkJIZnfCKU8dttb+o4VmTmC2mJB9lFQ2A=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB5213.apcprd03.prod.outlook.com (2603:1096:405:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 11:50:53 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:50:53 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v10 20/24] drm/mediatek: Add Padding to OVL adaptor
Thread-Topic: [PATCH v10 20/24] drm/mediatek: Add Padding to OVL adaptor
Thread-Index: AQHaAlEpIYYc1XC6tkSPO2BtlpGtkLBQ03mAgAAC24CAAAnqAIAAICQA
Date: Thu, 19 Oct 2023 11:50:53 +0000
Message-ID: <c1d57c8abceba9418b0904b95e44d10ef879199a.camel@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-21-shawn.sung@mediatek.com>
 <0a3b0755-73e3-4698-9a3a-be38578ceb3f@collabora.com>
 <9939f8f5fbc2fcc469db212cf53fd3be0231384f.camel@mediatek.com>
 <fdeea37a-6683-44dd-b946-ee708a0b9000@collabora.com>
In-Reply-To: <fdeea37a-6683-44dd-b946-ee708a0b9000@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB5213:EE_
x-ms-office365-filtering-correlation-id: 3c47f441-1e3a-424b-2e0a-08dbd099a618
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HxP3J4Zn7djyFbVzM+ZQt/0mLGYjUvUOYl6I0E2YGJepfAtuAar6y9F7wMcT6wl2Nnxv7wwwdYSa+ZTW7jCTMVP46KLQpaVzvEHPgYu7edW2NznXQ9orL83f21Xi0Qh1XfGw0VO1tJZf4Trp8Q8eIbC6GQ3qzHRT1VjWWcTMGVwHVVUbNuO5RI9F2QmOjUfs+VKJITpoHcoBDHW+p3Tbkla9jXAC2EGXhTacocKnTQBhguGR5YHZAlY3Cds93F2RjcqrznAoUrD67f3TSJTphX/A3gkcrzk0PIf/bxEbl0hvD5VqfalARwui6su3Qwq2aQ+WCV1AQqJE7DjcbPzwAB84uA3frxdThaiKZNY0KrESTOGA/m4YHTVYlE+XIA6G508rKBcI5TASh0UK7e0Cc6anD0dRZBCHdjrDwP3Wn7z2fVj3hWFSEVVUyWyVFk3ulob/A8+6Ssgmr+ZsKVFv6edGAG58w4Ov7FQfMcgeuuNprlyqnor8+DZY5MtJYCnXmbDUE3WpjU0xHPokHMJJVPoypxpi3m6x+f+an98n7Fti2CoJA1NXP0RGJDc+nDkW53z2G2+gycSXb+Tkg7MMiTdnPTSKm9GE+ufn0QaYjw0bnOUJ8MRHJTh9CPxLV7968NDWs8royKvngVALwPcOpf4Y4ThbGN1q712JW0fddHA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(110136005)(66946007)(66446008)(54906003)(4001150100001)(64756008)(5660300002)(41300700001)(76116006)(6486002)(6506007)(26005)(6512007)(2616005)(4326008)(71200400001)(4744005)(2906002)(66556008)(7416002)(8676002)(8936002)(122000001)(316002)(478600001)(66476007)(38100700002)(38070700005)(86362001)(85182001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlFCZHE1TnB3UTNmK0hHdG9zNENPNHA2clZBa05ma2wvR2tXSGpPMzlDV3c2?=
 =?utf-8?B?c3E0eDVzL3lvS2swdHJ1b0hCZ3dCKzIwM0VpWThveDhGdmJwK0FZeS9SZWtv?=
 =?utf-8?B?VytyWlFhYkFUbmplSjVlVUtUaU00a1pSTGJVblFhb3NSamVBbWtQZCtLclhL?=
 =?utf-8?B?aGJnTFpLOWhqTGY5Z013aVNKTmEvbnFSUFN4bjhVOWVLQ3pnMkJkMXpOcTdw?=
 =?utf-8?B?K2VxQ2ZEOUFsUjJyVzZRdTBka2Vhc2NQRnowRG1hZzQrV3MrdkplKzNWejk4?=
 =?utf-8?B?YTdzaUJCQUM0Z0txNWlmc2cxSjRVeDV1SlpDbERQSkw3Q2hBSUFjK3dldDdp?=
 =?utf-8?B?ekFWMEEydnNiU3ZSVGxTei9QTDRDR01vdlJ2bzFpczVDSk1mNEw2MWZZSkho?=
 =?utf-8?B?dVdXeHdnV0RFVk52cUJrY1ArdVZyYnNKTjNxQ0dFUnZyNWgzNmtwTE1ENDBE?=
 =?utf-8?B?MHozdDlrZ000TWd4YVhvam03Y2U1YURjeEdWempWb3RDS2kyVWFjRm04MkQ1?=
 =?utf-8?B?bDlSWTZpaTBRTFVvSnRxQ1l0V3Jwb1g1ZmhnbDJuVm1xekQ5T2YwODlYcVpz?=
 =?utf-8?B?S3UxOHM3Vll0VWJmbVdtd00xc1BQaVlNZEhLZyt1RGVWWGF3NDBEemxLNSsz?=
 =?utf-8?B?N3RyM2pmb2w1RjNkd3NCWVhOWkRIYTdnMTdNSUNwZHgwc0lIWEE5alFqUjBR?=
 =?utf-8?B?MWFHT2dhNk9xRlQ4aFVjMUg1eng2TFJja21MNGN2SDFDekZ5bEtmWTd2ajBM?=
 =?utf-8?B?OFlZRy85KzFQYmx3cVI4Z0krcFJoczhIbXlQbndsS1JlZVFrM09kTFdQaGwr?=
 =?utf-8?B?SUJkRzhONm5Wd2ZDYUxPdm43eDFlZjlKeTl3VjFLUDNWOFZaOVVYQzBBaWh5?=
 =?utf-8?B?Q0UrTnBkTFYrWUk3bllRa2tNenJsSStZSVcrSlMweXk2emhWZDhxdHJ1b2lK?=
 =?utf-8?B?QVp1Wnlwa1B4MWtnRXFQbElaMmpHRGZGSEZ6Q1IvZTRvK1MxR1orTVJVaHNh?=
 =?utf-8?B?Q3YzMGhjT1JMRzBGVmVoSldWdFZUNC9tMDZVaXpwV2h5YnRkdG5ac3hVQ21C?=
 =?utf-8?B?T05RSng1U05rc0ovOXp0MFZFSDFDR2JjL2g0ZmFwQWxoZFlFTi9PSkl4RnJB?=
 =?utf-8?B?UXpUNDgxc2JrSHk5RDkva0p3T0tHL2M0T2o5OGhRVlNFbTN5bE54Z1BhSjd2?=
 =?utf-8?B?TU15OC9XUzFIL1ZLQWYwY1JLc3dlREhaakg3Yy9HUElYNVpPWVZNRThSYWl5?=
 =?utf-8?B?YmV1eHQ4U3dhd05vY1E3STM1ZWJ2NWcrWWhBZ1cyVHFnam9scTZ2T2YrVW5x?=
 =?utf-8?B?SWdvWmo5dHQxMTlxRUxZcy9WNzYraHJFUnNZQ3lZWjhIbTVDTkZMVWhEaVdF?=
 =?utf-8?B?b3IvUlU2TmQ4SlBXRmhJL2xsMDJUaHNqRHl4ZHBnU3kzVkgybHBFTHhlbUxw?=
 =?utf-8?B?dVRuTE9iM0w2Tk53aXdGVzBQUDZCVTRKRHdOcU9SbzVGcTZRMTBYdjVBK3Nt?=
 =?utf-8?B?emRkY2JBdEFMRE5CZW8vNU9nYzIwVm9FNjgvVHdkSnN1RGRJRDdIWS9XeGpt?=
 =?utf-8?B?dE1tQkU0WlQ3MzNMVU9LYTdCSXkreGFxYjB3ODR6cUozNGUxWlkvZ3BkY3ha?=
 =?utf-8?B?Ym5NQ3BuVzN2YU9hMzdmcWtaZDc4YkZub1kzZXFpeEExenJrNlpaN2ltT2tw?=
 =?utf-8?B?UWRpeStEZTkyTy91NkorK2lxU1pRYk43MmJhSE9teGh6cVV5RTY1M1hSUUxQ?=
 =?utf-8?B?V09MZVpGUGx3L0N2RW5rVEdielRLTjBPQUNoRDdja3NjT3hpTHpTYmhxbEhW?=
 =?utf-8?B?TWJuUVZXdlVhOW13MmdURk0rOFg2blNpQ1VpV1lOWHF5YlZtVitUZDhEWE5V?=
 =?utf-8?B?ZkdhdkxIc1pnb2VXZElndXp5QXRGZ1dFMVlaYXlzZ1dYNkFWWjlwOHBQNzRo?=
 =?utf-8?B?eXpUSndBRW41MEZ3QkpzUnk1QS83WU1TWERiZ3FkRWwxWFBBdUZoZ1ZuQTZv?=
 =?utf-8?B?S0dwaWZIR1Z2bnZDMHRrc0VJV2dwL2ZsbEZDZzNYWmx0a2FuZjQrVkhTbDQy?=
 =?utf-8?B?bnNoREUzMXVZbFUvTXRhWURESEx2VmRRY2ZPbGhac0ZQS2c1Rk9uK3dma3dM?=
 =?utf-8?B?MnI1ejlPcmNNSzV1UTAxRVRSbnBsdis3em9mZ0dUN2QrQWwvUzNTM1N1VkMz?=
 =?utf-8?B?OHc9PQ==?=
Content-ID: <B1B0CB77D911264DB41D44E7558123AF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c47f441-1e3a-424b-2e0a-08dbd099a618
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 11:50:53.7902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMPhBPWl10/ByPssuGwPRdjLBEF+dwyJl1sND+p4Tlc9qYE4Mq258ekHL2KdgFuEjCAmov4ghu6GFEtWBo5OIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5213
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1916778861.2106400701"
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
Cc: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "johnson.wang@mediatek.corp-partner.google.com"
 <johnson.wang@mediatek.corp-partner.google.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1916778861.2106400701
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTEwLTE5JiMzMjth
dCYjMzI7MTE6NTUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYXQmIzM5O3MmIzMyO2xpa2Um
IzMyO21hbnkmIzMyO290aGVyJiMzMjtjb21wb25lbnRzJiMzMjtpbiYjMzI7TWVkaWFUZWssJiMz
MjtzbyYjMzI7d2UmIzMyO2NhbiYjMzI7a2VlcCYjMzI7dGhlDQomZ3Q7JiMzMjttdGstZGlzcC1w
YWRkaW5nDQomZ3Q7JiMzMjtuYW1lLi4uLiYjMzI7aW4mIzMyO2RldmljZXRyZWUsJiMzMjt3ZSYj
MzI7d2lsbCYjMzI7YW55d2F5JiMzMjt1c2UmIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1tZHAz
LQ0KJmd0OyYjMzI7cGFkZGluZyZxdW90OyYjMzI7YXMmIzMyO29uZSYjMzI7b2YNCiZndDsmIzMy
O3RoZSYjMzI7Y29tcGF0aWJsZSYjMzI7c3RyaW5nKHMpLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtU
aGlzJiMzMjtpcyYjMzI7dGhlJiMzMjtvbmx5JiMzMjt3YXkmIzMyO3RoYXQmIzMyO3dlJiMzMjto
YXZlJiMzMjt0byYjMzI7YWN0dWFsbHkmIzMyO2Rpc3Rpbmd1aXNoJiMzMjtiZXR3ZWVuDQomZ3Q7
JiMzMjtjb21wb25lbnRzJiMzMjt1c2VkDQomZ3Q7JiMzMjtmb3ImIzMyO01EUDMmIzMyO2FuZCYj
MzI7Y29tcG9uZW50cyYjMzI7dXNlZCYjMzI7Zm9yJiMzMjt0aGUmIzMyO2Rpc3BsYXkmIzMyO3N1
YnN5c3RlbSwmIzMyO2lmJiMzMjt3ZSYjMzI7a2VlcA0KJmd0OyYjMzI7dGhlbSYjMzI7JnF1b3Q7
Z2VuZXJpYyZxdW90Ow0KJmd0OyYjMzI7d2UmIzMyO3dvbiYjMzk7dCYjMzI7dW5kZXJzdGFuZCYj
MzI7d2hhdCYjMzk7cyYjMzI7Z29pbmcmIzMyO29uJiMzMjtpbiYjMzI7Y2FzZSYjMzI7b2YmIzMy
O2lzc3Vlcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhlJiMzMjtkcml2ZXImIzMyO25hbWUmIzMy
O3Nob3VsZCYjMzI7Y29udGFpbiYjMzI7JnF1b3Q7ZGlzcCZxdW90OyYjMzI7Zm9yJiMzMjtjb25z
aXN0ZW5jeSYjMzI7d2l0aCYjMzI7YWxsJiMzMjtvZiYjMzI7dGhlDQomZ3Q7JiMzMjtjb21wb25l
bnQNCiZndDsmIzMyO2RyaXZlcnMmIzMyO2luJiMzMjttZWRpYXRlay1kcm07JiMzMjtpZiYjMzI7
dGhpcyYjMzI7d2FzbiYjMzk7dCYjMzI7aW4mIzMyO3RoaXMmIzMyO2ZvbGRlciwmIzMyO3dlJiMz
Mjtjb3VsZCYjMzk7dmUNCiZndDsmIzMyO2Ryb3BwZWQmIzMyO3RoZQ0KJmd0OyYjMzI7JnF1b3Q7
ZGlzcCZxdW90OyYjMzI7aW4mIzMyO3RoZSYjMzI7bmFtZSwmIzMyO2J1dCYjMzI7dGhhdCYjMzk7
cyYjMzI7bm90JiMzMjt0aGUmIzMyO2Nhc2UuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NvbnNpc3Rl
bmN5JiMzMjtpcyYjMzI7IzEuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NoZWVycywNCiZndDsmIzMy
O0FuZ2Vsbw0KJmd0OyYjMzI7DQoNCkdvdCYjMzI7aXQuJiMzMjtUaGFuayYjMzI7eW91JiMzMjtm
b3ImIzMyO21ha2luZyYjMzI7dGhhdCYjMzI7Y2xlYXIuDQpXaWxsJiMzMjtjaGFuZ2UmIzMyO2l0
JiMzMjtpbiYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLg0KDQpDaGVlcnMsDQpTaGF3bg0K
DQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFU
RUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_1916778861.2106400701
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBUaHUsIDIwMjMtMTAtMTkgYXQgMTE6NTUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiANCj4gVGhhdCdzIGxpa2UgbWFueSBvdGhlciBj
b21wb25lbnRzIGluIE1lZGlhVGVrLCBzbyB3ZSBjYW4ga2VlcCB0aGUNCj4gbXRrLWRpc3AtcGFk
ZGluZw0KPiBuYW1lLi4uLiBpbiBkZXZpY2V0cmVlLCB3ZSB3aWxsIGFueXdheSB1c2UgIm1lZGlh
dGVrLG10ODE5NS1tZHAzLQ0KPiBwYWRkaW5nIiBhcyBvbmUgb2YNCj4gdGhlIGNvbXBhdGlibGUg
c3RyaW5nKHMpLg0KPiANCj4gVGhpcyBpcyB0aGUgb25seSB3YXkgdGhhdCB3ZSBoYXZlIHRvIGFj
dHVhbGx5IGRpc3Rpbmd1aXNoIGJldHdlZW4NCj4gY29tcG9uZW50cyB1c2VkDQo+IGZvciBNRFAz
IGFuZCBjb21wb25lbnRzIHVzZWQgZm9yIHRoZSBkaXNwbGF5IHN1YnN5c3RlbSwgaWYgd2Uga2Vl
cA0KPiB0aGVtICJnZW5lcmljIg0KPiB3ZSB3b24ndCB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBv
biBpbiBjYXNlIG9mIGlzc3Vlcy4NCj4gDQo+IFRoZSBkcml2ZXIgbmFtZSBzaG91bGQgY29udGFp
biAiZGlzcCIgZm9yIGNvbnNpc3RlbmN5IHdpdGggYWxsIG9mIHRoZQ0KPiBjb21wb25lbnQNCj4g
ZHJpdmVycyBpbiBtZWRpYXRlay1kcm07IGlmIHRoaXMgd2Fzbid0IGluIHRoaXMgZm9sZGVyLCB3
ZSBjb3VsZCd2ZQ0KPiBkcm9wcGVkIHRoZQ0KPiAiZGlzcCIgaW4gdGhlIG5hbWUsIGJ1dCB0aGF0
J3Mgbm90IHRoZSBjYXNlLg0KPiANCj4gQ29uc2lzdGVuY3kgaXMgIzEuDQo+IA0KPiBDaGVlcnMs
DQo+IEFuZ2Vsbw0KPiANCg0KR290IGl0LiBUaGFuayB5b3UgZm9yIG1ha2luZyB0aGF0IGNsZWFy
Lg0KV2lsbCBjaGFuZ2UgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KU2hhd24N
Cg==

--__=_Part_Boundary_003_1916778861.2106400701--

