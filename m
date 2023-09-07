Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA179703C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 08:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105EA10E764;
	Thu,  7 Sep 2023 06:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495910E764
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 06:12:28 +0000 (UTC)
X-UUID: 82a6e4c44d4511ee8051498923ad61e6-20230907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=zEeimzn1DGklrDfJCcM3+p6RymkSEPZ3uriO16ptVQQ=; 
 b=InWNGx9QXKLPsA30NLmYWN+l+soRLyIlAefn44DHGwoizkn25LPvnE9bbJidph8GmN1fP857ICIuZqEcFbm8Y4YpUYaNJ58Hv057o0uGQXcQyiR9hM+MfOPyEh43An3CgrzjN7CGA3SBzRGSKobbZi2nygCh8x9UtkunoZsR6AA=;
X-CID-CACHE: Type:Local,Time:202309071409+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:25764774-eb92-4244-9946-0a076f231fbf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:2d676aef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 82a6e4c44d4511ee8051498923ad61e6-20230907
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 369239540; Thu, 07 Sep 2023 14:12:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Sep 2023 14:12:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Sep 2023 14:12:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht/lzis6i0qDL4agwAurIDuTMqsrWdLizdg1lp1Crg550JCcr1oUq/uq7jjMGiC5M6OcjqT3rW0gKgHjAZniEzotPDbpPpkhVrHFQFbrbqbKB8SsJhnuIhU15gQ8/eZ43yqTBYCrL1PnUFN/XxycN0l2/NdZNXNKgl7klY5OE9mIjJrXDpXf+2imP6DpPvcfTVCM0GGaFOAoauv71KqyWGsfIKDo3jFR6Gz8c1ny7DSAPYH/I5IfhaGxxxVnmXEkTcaIOeMhI+srPHPwbnP+ThbGCSD1l62SAzyd67RWddbBE/zqbyVqn5ZG77KHa1o7wU6AxN15cfUmhzB6MzuV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMh6k7QC2XNswn4pnDuWE8mEfZ0mNwT2vZt3T52kZxY=;
 b=McA65sr7Z0mX+ElE/fDRj/5AMezKBWDjD2Q9mbd3vvu32cD4p+yOsztwe1ZkO/cuZCgGrEmetoSOFP9ffgF856bzull5Squ9++ObECi/5WJ/uhwOFlV2kS3Q6VaQfFSKDrFvLIMXZByQjw7eR51cypKWQV3Y6bd3run4GTUBaFP2eQHEtlsSSHIvOuZ1W/3uMcAa1igGLMVuTyIyELNmeyZ1Yn0iNoDo4HgH0HFePFalLwpfrTDTloaTyEJ4NgLkzzaquDXzvuWip5ivjNNEyyZihXvwFERW3BPk/Q0ifNMqDLs2AiHxDI6nah7zfN+ZDVOef8YZ7eN0vh1j0YHLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMh6k7QC2XNswn4pnDuWE8mEfZ0mNwT2vZt3T52kZxY=;
 b=tk1MqF8OiSofCYFNYVNqmETAGZ8NYsH9Ohv9gYvO394JAR/tSQBCmNwCxEZc/awkEE49D31lfJ5a9cFpiTQ9lf9f6KQdXk1K6lKrchrq0GeSukHofRBgYTTtu8s2DEKk8BXJXOV6Bl50A6ibz26F587EH3RWlblCmzjHUpDCb40=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8312.apcprd03.prod.outlook.com (2603:1096:990:4d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:12:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:12:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2,2/3] drm/mediatek: Add mt8188 dsi compatible to
 mtk_dsi.c
Thread-Topic: [PATCH v2,2/3] drm/mediatek: Add mt8188 dsi compatible to
 mtk_dsi.c
Thread-Index: AQHZoCVaukQPOe/o9U6IjmLMU9LbZbAPYzmAgAAA/4A=
Date: Thu, 7 Sep 2023 06:12:19 +0000
Message-ID: <338122485db025f6bfb8be550d426ca11698497c.camel@mediatek.com>
References: <20230616073659.26536-1-shuijing.li@mediatek.com>
 <20230616073659.26536-3-shuijing.li@mediatek.com>
 <67813ea6e688036d68c10fa979562b6aab80bda9.camel@mediatek.com>
In-Reply-To: <67813ea6e688036d68c10fa979562b6aab80bda9.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8312:EE_
x-ms-office365-filtering-correlation-id: ff37d9bd-0d3e-426a-a1c5-08dbaf6964ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: geQ6TNwI7S1AuvcChaQhDc3AF9yZ0fDzIZVtBq7Ami03bNzfyHq6AS6Lic6gkVhgE1j06B7e1WVMPfUx5k5uH61GvbC8WaygMMSQU7C/jxuPLlU6WyB1TdHMfWpsYT9athruMmoZuNIm0HRdaU6DyTwH3stLJSp3dbrTKlMt5IZ/lUIy5f9SPEAUGrsBBw1uA9dZAUcubfULhCeQ8AQ6N/hurkfZmYUYxbu8PWdy6OIrwndLYfHL/WST99GuJf6We00IFgVR8dZxyG2trn7IbtmJQ+OaB64QHhDvuf7Nf9AQlD1/GtbFNSfrBfKKjgHMDd/AI98CwbXD4FM2RY8fw2K8RLnbC9zBkotWhgB6JYaA/Wru6RYXXEb0BuQ40g01o0qV45fVQmttRNKDiTtuitO0P/rboIWkuR6P5KsS8fN86UFqNi+iSR/yhpm9LpIYyQQy+11vG2R/OIvYpUx0vSXxVZzLYenGciBUhkSj05gB9J1Aa3k1deimxP0wRYMUSfYL2ub9I2v8gEVl/1/T51luGeF0Ihms93VMkcs10abyRh7PZON7jZlybqks6VM17EkAc+DQWNajlj60eWaNsMhQG62KDKfZho1O84Vg2HmRSo8jppKM3+QKV+MGjSJbdeoibamP+we2nhXBHRxLtHg1tmnVIfglMlbbULR5feYefjNqMYeHi9yTyruW908H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(186009)(451199024)(1800799009)(921005)(122000001)(6486002)(6506007)(8936002)(71200400001)(36756003)(86362001)(38070700005)(38100700002)(85182001)(478600001)(7416002)(26005)(2906002)(83380400001)(6512007)(107886003)(110136005)(2616005)(4326008)(41300700001)(54906003)(316002)(8676002)(5660300002)(66476007)(76116006)(64756008)(66556008)(66446008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjFDRHlvcUV4b0hoSVVBT0IxWVp0Ri9kb3hmOWlKTmlFaVg0b2pET0JPQmNw?=
 =?utf-8?B?V2w2YlY0VDNvNytwbnQycFZzd1VPbDMxRG53VGEyeWVhOVlZS0c5QWdBYk9k?=
 =?utf-8?B?dWg5MjZEb2hFV1QwWWpIdUpqbjkwa0l0cExVWFBxM0F0NlBhRjBwWk9zTThp?=
 =?utf-8?B?a21rWjJoaEg5YW9uaXh3RzlwQkUrcWgyOVRxR2tRZUtBOXAzbzRpbHc5Q0dI?=
 =?utf-8?B?L2Z4Z2xCZTJTUUZYcWxlNElpM0toRUgrb1FPMjR2Sk4xYkhCdmpSWHJYS2Yw?=
 =?utf-8?B?NkV6cU1oS1NvNERjenlTcmZyS0ZiSlpuVGl6dXlwcjFGMXFRNVMyR2d5QTVo?=
 =?utf-8?B?L3FwblZjbEJlMHRtcUNrSFNyNkozQjZUMTlJNk1vcXE4YXIrQTFXRmIvSllx?=
 =?utf-8?B?R294WTJ1WlVGNXB4YjFNWG1mQWFoYVJ1VEV0YXMzWEJPUkhvc0tiYUpvZDI4?=
 =?utf-8?B?T0ZsUGZKMFRvV1czenhIMWkyK0FVdmNNNWtVVU8yOXNTdFRlZDZnT2JyMGg2?=
 =?utf-8?B?ZzZPanpvbEdRWEZCMzllSW1RUlFEMFBzcnErMEp2a3FjSThlV3Y1U09BdVp0?=
 =?utf-8?B?ZE00eTU4QWRxMjRXcUduY1RHMDF4UjN3azY2cGtBSmU4R3RDaTNaSHBlT05r?=
 =?utf-8?B?Zms4QUZFZzlBMlNkZjlWMEY3cEJ6MllzNkUydDRoV0UwUE1vZ1FlcVBlUHVv?=
 =?utf-8?B?Sm8rRWpXOENHbk5TUnYxRTc5YzBEVUtxN1Jad21vNm1PcnNuQkREVU8ySW1U?=
 =?utf-8?B?UFp4bzVvaTFZSUVGd2xFMHZEWWFTdG5oRTVHaitaVUh5R1ltdDlmazRLbDMx?=
 =?utf-8?B?TVYyMUhDVnlsOHBVamxFTS9XRVlOQTFWeXo1eGdsOGNNMGZ5Z3RXQ3l3VzYy?=
 =?utf-8?B?aUFMZWhNaE5SSVh2MTh1eUdmUXdramNrM21ZazBMcjBZVEo0ZGhTdHBONlBD?=
 =?utf-8?B?Z0lodlBvOGpINUxlcGI3U2s0Rk8xR2VGSjArUU5jbm9SZUhSY3hGNFpTb1NG?=
 =?utf-8?B?WGUyNzNESWIxZVZ6OHZlclpwZ2hlK216NGM3cExUK1E5VG1HbTFiNmxPdkFJ?=
 =?utf-8?B?VGp0aFpHVENVT0pHRjdQTmlURkU5SVVDNWRsYXNQR1FtVzhVRzhNdm5xUFJs?=
 =?utf-8?B?T1BySmZ6UTBmVUxDK1ZHQ1hZdlpaRWhySnZ3RUFadjN2VmxOVnFjT3NhZXQ0?=
 =?utf-8?B?L1ZCaXZGSXl3RnF3KzVQeFlIOXFPZTljSVROZlZWOFU3VnJpd1BBZm1ITUJE?=
 =?utf-8?B?aGV3T051ZU5XWU9RbGNxbWc2am5XanA4dnVHTXEzSkdTOERyTFhsaVVhL0hR?=
 =?utf-8?B?MnJQakRQVTJIYUJsOW1TM24wRG9yWjVxd2Z5Y25ETEtRUWQ0SGtiRjc0bzVH?=
 =?utf-8?B?M0cwYUNYNlRhUmloT0t2NFFsMVU3YUlzb1c0ZERHTEJ5eDJUUHRrN01VbXoy?=
 =?utf-8?B?OUoyc2NVb3QxNUdZVkUwMGZhaGhXbng0Q1VSenZTZzgvc0h2RHhxbkFNVTNN?=
 =?utf-8?B?MnBER2IzaVRjYnFHcFJmeVViK1BzYlM3V1FjTVVOd3VsdVFWdnlPZHNFSlBs?=
 =?utf-8?B?bHZKbG1XNEJuSzFDeHdxN1FveEJ6VENWWEpkdGtIZzFSUnpOczQ2bHd0cEZZ?=
 =?utf-8?B?SkVneml2WnRDKy9vQmxPSE1aSXBxUnJoVFhqS3lqd3czazBiV2FraXJHU0kr?=
 =?utf-8?B?Z3ZkSmUxam9QcXFUM3lveENKYmkrTUNndS9uUGNJTk1xZ2psMWIyYXBEZGEy?=
 =?utf-8?B?eStuK0Zrb29yVVh3VFNYK1V2aUpoUlNYRzYrWWRhZmlGcHloUWF6T3B2S1Yr?=
 =?utf-8?B?YzA2WVNFWUU5cE9xbXR2WlpZL3F3S0lOTXJ5dzlWOS9zcHdINjVzbmpxdmxL?=
 =?utf-8?B?SFFMWFd2T3N0djZEU056aDZrWE9xVmhpQmswMEt2VEhkTHlQYWl4cmpmc2pp?=
 =?utf-8?B?OVZjRFQvRFJKWU54Mk8rVUZtMkhIYTJRT0tDcWRTR1ZhcnAwd3YwWGQ2d3FD?=
 =?utf-8?B?TGI1QkZjZVhqVDFWSk1ENmhMeHJMTHJmZ1F6M3REN2pYRDkvdkF3U1ZUSUdF?=
 =?utf-8?B?ODByNDBBb1JhcC8wQW50am1SRFUvRUw4clNPYWRSTFFjemthUDZyRHpvUGFS?=
 =?utf-8?Q?dA0jJr4BXmqy22aXu2MI1ouDi?=
Content-ID: <D569F77F17769749A07945722CD2021D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff37d9bd-0d3e-426a-a1c5-08dbaf6964ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 06:12:19.9257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6h6lKFCGaATSJd7EOEc5yi04EEXOBP6ULJxmijRs0Zjt2UPZY6RaTULAsAzgOy0WkVAaz3qDgia7y+3OsdeRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8312
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1036336671.1445932216"
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
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1036336671.1445932216
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7U2h1aWppbmc6DQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA5LTA3JiMz
MjthdCYjMzI7MTQ6MDgmIzMyOyswODAwLCYjMzI7Q0smIzMyO0h1JiMzMjt3cm90ZToNCiZndDsm
IzMyO0hpLCYjMzI7U2h1aWppbmc6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtGcmksJiMz
MjsyMDIzLTA2LTE2JiMzMjthdCYjMzI7MTU6MzYmIzMyOyswODAwLCYjMzI7U2h1aWppbmcmIzMy
O0xpJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0FkZCYjMzI7dGhlJiMzMjtjb21wYXRp
YmxlJiMzMjtiZWNhdXNlJiMzMjt0aGVyZSYjMzI7YXJlJiMzMjtkaWZmZXJlbnQmIzMyO2RlZmlu
aXRpb25zJiMzMjtmb3ImIzMyO2NtZHENCiZndDsmIzMyOyZndDsmIzMyO3JlZ2lzdGVyJiMzMjti
aXQmIzMyO2NvbnRyb2wmIzMyO2luJiMzMjttdDgxODguDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHVpamluZyYjMzI7TGkmIzMyOyZs
dDtzaHVpamluZy5saUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7Sml0YW8mIzMyO1NoaSYjMzI7Jmx0O2ppdGFvLnNoaUBtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO01hdHRoaWFzJiMzMjtCcnVn
Z2VyJiMzMjsmbHQ7bWF0dGhpYXMuYmdnQGdtYWlsLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyYjMzI7fCYjMzI7MiYjMzI7KysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7ZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8
JiMzMjs4JiMzMjsrKysrKysrKw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsyJiMzMjtmaWxlcyYj
MzI7Y2hhbmdlZCwmIzMyOzEwJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7NmRj
YjRiYTI0NjZjLi4wMDcwODk0ZDAxNDgmIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0t
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMN
CiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNzY0LDYmIzMyOys3NjQsOCYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2aWNlX2lkDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjttdGtfZGRwX2NvbXBfZHRfaWRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilNVEtfRFNJJiMzMjt9
LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1
b3Q7bWVkaWF0ZWssbXQ4MTg2LWRzaSZxdW90OywNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilNVEtfRFNJJiMzMjt9LA0KJmd0OyYj
MzI7Jmd0OyYjMzI7K3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxt
dDgxODgtZHNpJnF1b3Q7LA0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsuZGF0YSYjMzI7
PSYjMzI7KHZvaWQmIzMyOyopTVRLX0RTSSYjMzI7fSwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
eyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzdkNTI1MDM1
MTE5My4uNTAwYTMwNTQyODJkJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7Jmd0
OyYjMzI7QEAmIzMyOy0xMjA4LDYmIzMyOysxMjA4LDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtj
b25zdCYjMzI7c3RydWN0JiMzMjttdGtfZHNpX2RyaXZlcl9kYXRhDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjttdDgxODZfZHNpX2RyaXZlcl9kYXRhJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzMyOy5oYXNfc2l6ZV9jdGwmIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
O307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3N0YXRpYyYj
MzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2RzaV9kcml2ZXJfZGF0YSYjMzI7bXQ4MTg4X2Rz
aV9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky5yZWdfY21kcV9v
ZmYmIzMyOz0mIzMyOzB4ZDAwLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky5oYXNfc2hhZG93X2N0bCYj
MzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMyOyZndDsmIzMyOysuaGFzX3NpemVfY3RsJiMzMjs9JiMz
Mjt0cnVlLA0KJmd0OyYjMzI7Jmd0OyYjMzI7K307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2ZfZGV2
aWNlX2lkJiMzMjttdGtfZHNpX29mX21hdGNoW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsm
IzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10Mjcw
MS1kc2kmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7
PSYjMzI7JmFtcDttdDI3MDFfZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0KJmd0OyYjMzI7Jmd0OyYj
MzI7QEAmIzMyOy0xMjE3LDYmIzMyOysxMjIzLDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0
JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZA0KJmd0OyYjMzI7Jmd0OyYjMzI7bXRrX2RzaV9v
Zl9tYXRjaFtdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsu
ZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxODNfZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0
ZWssbXQ4MTg2LWRzaSZxdW90OywNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOy5k
YXRhJiMzMjs9JiMzMjsmYW1wO210ODE4Nl9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10
ODE4OC1kc2kmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOy5kYXRhJiMzMjs9
JiMzMjsmYW1wO210ODE4OF9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO210ODE4OF9kc2lfZHJpdmVyX2RhdGEmIzMyO2lzJiMzMjtpZGVudGljYWwmIzMyO3RvJiMz
MjttdDgxODZfZHNpX2RyaXZlcl9kYXRhLCYjMzI7c28mIzMyO3VzZQ0KJmd0OyYjMzI7bXQ4MTg2
X2RzaV9kcml2ZXJfZGF0YSYjMzI7YW5kJiMzMjtkcm9wJiMzMjttdDgxODhfZHNpX2RyaXZlcl9k
YXRhLg0KDQpTb3JyeSYjMzI7dGhhdCYjMzI7bmV4dCYjMzI7cGF0Y2gmIzMyO3dvdWxkJiMzMjtt
YWtlJiMzMjttdDgxODhfZHNpX2RyaXZlcl9kYXRhJiMzMjtkaWZmZXJlbnQmIzMyO3RoYW4NCm10
ODE4Nl9kc2lfZHJpdmVyX2RhdGEuJiMzMjtTbyYjMzI7cmVvcmRlciYjMzI7dGhpcyYjMzI7cGF0
Y2gmIzMyO3RvJiMzMjtiZSYjMzI7YWZ0ZXImIzMyO3RoZSYjMzI7bmV4dA0KcGF0Y2guDQoNClJl
Z2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtDSw0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3smIzMyO30sDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO01PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsJiMzMjttdGtfZHNpX29mX21hdGNoKTsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17
LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50
aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBk
aXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpj
b252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlz
c2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVu
ZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxh
d2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWls
LCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1036336671.1445932216
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodWlqaW5nOg0KDQpPbiBUaHUsIDIwMjMtMDktMDcgYXQgMTQ6MDggKzA4MDAsIENLIEh1
IHdyb3RlOg0KPiBIaSwgU2h1aWppbmc6DQo+IA0KPiBPbiBGcmksIDIwMjMtMDYtMTYgYXQgMTU6
MzYgKzA4MDAsIFNodWlqaW5nIExpIHdyb3RlOg0KPiA+IEFkZCB0aGUgY29tcGF0aWJsZSBiZWNh
dXNlIHRoZXJlIGFyZSBkaWZmZXJlbnQgZGVmaW5pdGlvbnMgZm9yIGNtZHENCj4gPiByZWdpc3Rl
ciBiaXQgY29udHJvbCBpbiBtdDgxODguDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWpp
bmcgTGkgPHNodWlqaW5nLmxpQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoaWFz
IEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMiArKw0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICB8IDggKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYw0KPiA+IGluZGV4IDZkY2I0YmEyNDY2Yy4uMDA3MDg5NGQwMTQ4IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gPiBAQCAt
NzY0LDYgKzc2NCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gbXRr
X2RkcF9jb21wX2R0X2lkc1tdID0gew0KPiA+ICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RTSSB9
LA0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODYtZHNpIiwNCj4gPiAgCSAg
LmRhdGEgPSAodm9pZCAqKU1US19EU0kgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTg4LWRzaSIsDQo+ID4gKwkgIC5kYXRhID0gKHZvaWQgKilNVEtfRFNJIH0sDQo+ID4g
IAl7IH0NCj4gPiAgfTsNCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMNCj4gPiBpbmRleCA3ZDUyNTAzNTExOTMuLjUwMGEzMDU0MjgyZCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiA+IEBAIC0xMjA4LDYgKzEyMDgsMTIgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhDQo+ID4gbXQ4MTg2X2RzaV9kcml2
ZXJfZGF0YSA9IHsNCj4gPiAgCS5oYXNfc2l6ZV9jdGwgPSB0cnVlLA0KPiA+ICB9Ow0KPiA+ICAN
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhIG10ODE4OF9kc2lf
ZHJpdmVyX2RhdGEgPSB7DQo+ID4gKwkucmVnX2NtZHFfb2ZmID0gMHhkMDAsDQo+ID4gKwkuaGFz
X3NoYWRvd19jdGwgPSB0cnVlLA0KPiA+ICsJLmhhc19zaXplX2N0bCA9IHRydWUsDQo+ID4gK307
DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHNpX29m
X21hdGNoW10gPSB7DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kc2ki
LA0KPiA+ICAJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ID4gQEAgLTEy
MTcsNiArMTIyMyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gbXRr
X2RzaV9vZl9tYXRjaFtdID0gew0KPiA+ICAJICAuZGF0YSA9ICZtdDgxODNfZHNpX2RyaXZlcl9k
YXRhIH0sDQo+ID4gIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4Ni1kc2kiLA0KPiA+
ICAJICAuZGF0YSA9ICZtdDgxODZfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ID4gKwl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE4OC1kc2kiLA0KPiA+ICsJICAuZGF0YSA9ICZtdDgxODhfZHNp
X2RyaXZlcl9kYXRhIH0sDQo+IA0KPiBtdDgxODhfZHNpX2RyaXZlcl9kYXRhIGlzIGlkZW50aWNh
bCB0byBtdDgxODZfZHNpX2RyaXZlcl9kYXRhLCBzbyB1c2UNCj4gbXQ4MTg2X2RzaV9kcml2ZXJf
ZGF0YSBhbmQgZHJvcCBtdDgxODhfZHNpX2RyaXZlcl9kYXRhLg0KDQpTb3JyeSB0aGF0IG5leHQg
cGF0Y2ggd291bGQgbWFrZSBtdDgxODhfZHNpX2RyaXZlcl9kYXRhIGRpZmZlcmVudCB0aGFuDQpt
dDgxODZfZHNpX2RyaXZlcl9kYXRhLiBTbyByZW9yZGVyIHRoaXMgcGF0Y2ggdG8gYmUgYWZ0ZXIg
dGhlIG5leHQNCnBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gUmVnYXJkcywNCj4gQ0sN
Cj4gDQo+ID4gIAl7IH0sDQo+ID4gIH07DQo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10
a19kc2lfb2ZfbWF0Y2gpOw0K

--__=_Part_Boundary_001_1036336671.1445932216--

