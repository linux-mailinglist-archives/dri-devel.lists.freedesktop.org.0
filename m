Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F35762AD3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 07:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D283B10E413;
	Wed, 26 Jul 2023 05:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6118B10E413
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:31:14 +0000 (UTC)
X-UUID: 9cf51b762b7511ee9cb5633481061a41-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=lsfstsmnkLhRzzKcQPK74Zm11o5MPgRAh3URU3Z8lmQ=; 
 b=SlubjCiIzAcqduJkN7Z/uitMgRh/wCGlsRXhHm1NXlmZUhyqMJ0bIKEA2/eUthGE25EPS3i+GpP4TAWxrbmiKpAarFACd5fZjsUIhFrudsCV+1LeT8zf5ucWW0hZ8dx/fqE0fVSVKSTU6lELYl8b9zEevFfKMgRsDgABeXIZssU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:22633032-2290-4f4c-82e1-c993594b0a78, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.29, REQID:22633032-2290-4f4c-82e1-c993594b0a78, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:e7562a7, CLOUDID:0a52ccb3-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:230726132113E515F44O,BulkQuantity:6,Recheck:0,SF:28|17|19|48|38|29|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN
X-UUID: 9cf51b762b7511ee9cb5633481061a41-20230726
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1637248196; Wed, 26 Jul 2023 13:31:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 13:31:03 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 13:31:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvMc9G27/uPIG9oTOvNQzUqJndwHwbyZNmh5jZmHipkjNSe93LXlnTYfVNynmKKNSaqAPGHoO9FqE3gCgLhp2oFIix2x5ou6atIPhkPSIGwsEea64oc5EzZtMci7nql4GtOTQT9u5oCvEEX/xFGIXjjIFsrq94cvyvWVxV9wM7LMUSH1OPGDo698kXDy4rafGAGoNuDOb4iOYTegd7ujc+4eaH/BKngGg29998TfOiEkJK75W60ryfTaWAzwwurN5IzSC58vzmGT7Lqc6PncDR2t9biUqTAW6MQjdb6vasO2QWlHdKZpgbnPG+aXx/EWrof54IW9wgck2vJIS7kZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hgk6In8uHt2ef+C00yX3HQ6PARR2a9vRxTyQe11m9Mw=;
 b=hOnBPRgjtw/lYn6wLPIq5064V51dZICdOMVkqiKKGFpAB/bGFxII8243vgflsEKxeith38JoN4p9sEg5WGLP5KnMBjSYGUuaG3oN71g8znkNvYcBnJIrjqtWTwIH4mGjTc+SepIEOY60RiGxxtE0ya16aCJe4RxW6Ad8qzpHm9I5WJcu1KeYt+8bs2RVm7S1LIbaKBY2KwPDzj6hsYiISZMMZ1TsPfUFtt5TdsUFJn4bZFSd0vw/SM846pdO8tp/vfgcJhn6wMjgtwf9FlvfLBchV1Qxi9e7mRobWzaQK5nUJLg8CXlRgoO6m+F5L7RKgCTNNw7z/qQGO73TfiW/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgk6In8uHt2ef+C00yX3HQ6PARR2a9vRxTyQe11m9Mw=;
 b=J1ZMpy0/t7NlK30cwFDj4WWLVXRVTtDWQ1Cln3RrzlyNN+e9lI3F7RVsZkdg3RiD4OF7vxS4JgnfCBfdJuHecI2nzxapccVegj94FIS5qKnOk38BABChSv18oSoyPz8EHJPfAda1Wi38FQd/7edKvuReZibBpiyvxrJlCCchoMI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6811.apcprd03.prod.outlook.com (2603:1096:101:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 05:31:00 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 05:31:00 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Topic: [PATCH v2 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Index: AQHZuhXZQux28wh05kKxYnXmvsQj4q/LjcsAgAACwQA=
Date: Wed, 26 Jul 2023 05:31:00 +0000
Message-ID: <70995c8fcafa6bdd7e522fe795d30d73d27cd619.camel@mediatek.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-2-angelogioacchino.delregno@collabora.com>
 <dde9d51db2c496fcddfb4161465851b6dff8e62e.camel@mediatek.com>
In-Reply-To: <dde9d51db2c496fcddfb4161465851b6dff8e62e.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6811:EE_
x-ms-office365-filtering-correlation-id: 518a7e26-b4c4-4a68-a85b-08db8d997f3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8+673dKXvaeI2piJ2b2iLMhMITfv0rFUsZpMwC2c8TfQa4FGX7SF51bW97FURm1s5XyyKRSnASjAlS4mj4yASKkPavazn8kuf1E2kCZ65fLJeb/57+MeKE3VnCUin9a0num2PoKfyBAOwMXhslGHYmVlwy8Q6Y8TmKu46tUmbFZBfOezu3/Xuof2wrUkdXK9lWozXE86XsBRGxaH3BekFEbzURSCPqd09gZC9LanE0gFOfRX1+ctOcD7fb54BP1L59Yf8VKX1nkrrpPdopeeaPTPNhMebttHldLTf7RMi0xNWvp68r+y2thFx4WTUp7zMv/1lGtmwDzzTwOjDJ4Wxlou9PC6hqHP5w914ciJPIg/RaLn4ZVlyVjCoXWgVp+WrmLu5nXlxD8yrvlZNzV1pN5vrZ+eGGiZFJx5B6NM84Ipy+6ZMknd4b3jnt1OB/YrtUTGeFrmarjNYqDiDWtaczqBB1gZ0tY7kCjDLIb/cSY1XRnOS1g5unRrnEBsKsXEPFrQ/HNfB6iQHy75Wjxw1Khw5hwA9DkhfYP71EQ5QBvQ4RMgrQMDszlxoc5CyEkYSqAM6lq4YTXTV/LIaDoUWUXsHBDkiX25BP1fOVWAozFCOAUzk5C99z2eTc87J89nBtfGNitoY6hndAE0PGXourKhheZZCrhSke0miDDVeZ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(36756003)(85182001)(86362001)(38070700005)(2906002)(110136005)(83380400001)(186003)(26005)(6506007)(6486002)(38100700002)(122000001)(6512007)(54906003)(478600001)(4326008)(66556008)(66446008)(64756008)(8936002)(316002)(8676002)(76116006)(66946007)(41300700001)(66476007)(71200400001)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlFtT01jOGdqeEl1QWpQdy9MRWtqU20ra25mQ1BvamRCZEpvMnNCTVMyK3lz?=
 =?utf-8?B?dE1ZWXQ0dU9WY0cvT3R3RnBuRGU2Wk56OE5qTlBvenpySzNwQ3huWStsa3Jv?=
 =?utf-8?B?RmtlYlYycTFYOHp5RUdJd0s1WDE1eGhVZmdjc0pCa005STYwbmRNZ2pnWDQx?=
 =?utf-8?B?djduZ2JQN0U5aENKMzZidjEyNS9JRzd0cVpKM0xUTlpEd3k2ejBYMEVRZDBy?=
 =?utf-8?B?cXdHWHErMDYxQ3RFdEFrNWlhVHdka1owZzBVQnQyYmpyRURBQ3FQVmllQ1lr?=
 =?utf-8?B?bXVkUzAxUlp4c00zK09MNkdKVXhiM2RYMWJaNXEyNVoxNmlWRDhjTlA4RHB3?=
 =?utf-8?B?cEZHbWg1LzBRZlMrU055NzU1WGhFRitlcHdYcjNqQkJaeTZSZmEzNE1WM3dK?=
 =?utf-8?B?S1FFQ3NBRk9meE91VTFLaU9TaDduMVdKclNqdThuWnNUSE9LZnpWQkoyY3ds?=
 =?utf-8?B?STQ2ZU5tcENXdTFDMllBU2Z4Nm1yQmxjenJNQzcrT2lWM3kySHd6a2RHZElT?=
 =?utf-8?B?NllLcE1zTlJ2YWQyaFRCeit5dmQ2RkNUN04zbDdYL0lFU2JJWW54eTBSMXZh?=
 =?utf-8?B?MmRiQTZBdlVIb3hDN0pzSFdCMXAraUlBSmVzekcyU1YrZHRiL2FqV0RleWl2?=
 =?utf-8?B?am91d1RSaWNEZTZ3NEhjMG5ZSUdjOC9FS0VHK1hhM0JUSHA4aDBrb2RLRXh6?=
 =?utf-8?B?VXhYN2YrL0hkWlFhcElWNHozYXZzdlllRmZZSDBnWXhEOVY1S2psa2UyVGVz?=
 =?utf-8?B?VytmRk1hVlc2clRJclFHUFpKSUxEd0QwUXFFbm00TlJVMW9XZGg5b0U3dG5n?=
 =?utf-8?B?M3V1S0o2clRMOGRIdVI0eXg2dHlZdU9CN01PdzgrbjMvY295Q3ZlaGlUSXRS?=
 =?utf-8?B?N2M3K0VRNStCNXVmeHQrYTNoWm5uWFIzMndXYy84ZWgyY2UxR2JrRVVoYlNG?=
 =?utf-8?B?ZlNlQjAydEV3UlZPdlhadmJRcWkyNDBMR2c3MkpWL0J1TWJucFhsSWdlR01l?=
 =?utf-8?B?TzhHK09aK0JsTnFPUWtEWWdHTXA2clE0d3lrenpubUE3MUlabUsvMy9Ya21w?=
 =?utf-8?B?RTRRMmFyY3VmWkdQaEErSERwbnNyc2FUakQzUkxiRzVIdE5tYmc4M3lkNFU2?=
 =?utf-8?B?ZGRrZzJWUFNubEZGSCs2aHJMR0VCaG1HTUtVVVF6NUFSUitvbEhxc0xZT2Z5?=
 =?utf-8?B?SWhXanl1SkdaNHJ2anI0aGR6ZjZSTjM2YzhjYUZKSkR4Um4yNlRUZ1g2YktX?=
 =?utf-8?B?SnM2Q0EwZzA2aTV2V2NzVExYQTExRkxHNEJTZ2cxNUd4YlJUdzhKek5VWmp1?=
 =?utf-8?B?NGpkQnQ5cjBlKzZPMmloNjBsNWFpd28wdkNreHd0d2RETkMwbUN3Nkp5SzIy?=
 =?utf-8?B?YW5xMzRwZzYwVU9WcEJvUE5JbER3MXB6QkdzbTFkWks2eHN4MXE4TGNtaWdO?=
 =?utf-8?B?OTFuVXJWVi80U0xlbE83MTJsRjBCVDNBZVVGb2ltQ2ZtbXZISll0bkdJV0p5?=
 =?utf-8?B?c3pRWmkxclJQd09UcUlsa2NQcFN0aEd2ZU13YkRiaGZ0WnRORjl3ZHhOU0po?=
 =?utf-8?B?ZEVOeGo0QzFvOGVvNXZQRVhSZUhmVDdkZVBjWDh6QWZlc3h3OUlxbkFzN3Q2?=
 =?utf-8?B?OXMwQ0tqMTZIb2h6aFg3bWhENnRvcXlQdWszMEQyY2d2akI5TWJielRVN2dN?=
 =?utf-8?B?OEUyMkJSbWp5NDY1Vk9CUG41bHA3WWIxcnprSUhUaUxvWS9WMGNINjQzaVkr?=
 =?utf-8?B?QjNmSmdWL3duN251SDhEZTI5NDZRT0RjeUp2ZUhiOS92VmVXczdOeHdvQ3FH?=
 =?utf-8?B?TXJxRS9VWmZ4SkpPU01IQTdaRDdyQ2g5QlBaT2F4U3plWERlZGc1dUhlekgr?=
 =?utf-8?B?NFNkWUk2cTdRYTZmUURNY1IrRVpML215R0V1ejR4L2lRaDR0NXNuOEdZZ1cx?=
 =?utf-8?B?YXlwY2dHZE1ETnpsamkxZTl4QmcrR0h5dE1lOFdpVHRYQTRoVFZsQk1lSlVR?=
 =?utf-8?B?K2ZZbXYwOFdQM0p5YlpHTE9DaStMeU1VaW9aL0tTK3VXK1pZVGFTRmZsRWZy?=
 =?utf-8?B?NHVYemx5WklhUFdicVhJNURzNnBGVjluUjZMcG5rVnJCLzgxUXN3OFhNc016?=
 =?utf-8?Q?Xx7Q6F56wqiRMqwdk7MMC6Kct?=
Content-ID: <3DB2712CC545FA4B8DC4FBC0F0409478@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518a7e26-b4c4-4a68-a85b-08db8d997f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:31:00.7037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LM/RIQEAeiV2VpHnxpfjTijgWU5y7/aoXqpeaZ3rAjzzY6Dl1mS7Mp/97ndOsz5CxF/LSatmSqpnGWv1Aqp1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6811
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_408590170.1756993144"
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_408590170.1756993144
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0yNiYjMzI7
YXQmIzMyOzEzOjIxJiMzMjsrMDgwMCwmIzMyO0NLJiMzMjtIdSYjMzI7d3JvdGU6DQomZ3Q7JiMz
MjtIaSwmIzMyO0FuZ2VsbzoNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1dlZCwmIzMyOzIw
MjMtMDctMTkmIzMyO2F0JiMzMjswOTo1MCYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5v
JiMzMjtEZWwmIzMyO1JlZ25vJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0NoYW5nZSYj
MzI7ZHJtX2JyaWRnZV9hZGQoKSYjMzI7dG8mIzMyO2l0cyYjMzI7ZGV2bSYjMzI7dmFyaWFudCYj
MzI7dG8mIzMyO3NsaWdodGx5JiMzMjtzaW1wbGlmeQ0KJmd0OyYjMzI7Jmd0OyYjMzI7dGhlDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtwcm9iZSYjMzI7ZnVuY3Rpb24uDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1Jldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0
Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7ZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7NiYjMzI7KysrLS0tDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjszJiMzMjtp
bnNlcnRpb25zKCspLCYjMzI7MyYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzk0OGE1M2YxZjRi
My4uNzQwNjhhYTcwZTBjJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysm
IzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7Jmd0OyYj
MzI7QEAmIzMyOy0xMDkwLDExJiMzMjsrMTA5MCwxMiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50
JiMzMjttdGtfZHBpX3Byb2JlKHN0cnVjdA0KJmd0OyYjMzI7Jmd0OyYjMzI7cGxhdGZvcm1fZGV2
aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7ZHBpLSZndDticmlkZ2Uub2Zf
bm9kZSYjMzI7PSYjMzI7ZGV2LSZndDtvZl9ub2RlOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtk
cGktJmd0O2JyaWRnZS50eXBlJiMzMjs9JiMzMjtEUk1fTU9ERV9DT05ORUNUT1JfRFBJOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOy1kcm1fYnJpZGdlX2FkZCgm
YW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMyOyZndDsmIzMyOytyZXQmIzMyOz0mIzMyO2Rl
dm1fZHJtX2JyaWRnZV9hZGQoZGV2LCYjMzI7JmFtcDtkcGktJmd0O2JyaWRnZSk7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrcmV0dXJuJiMzMjty
ZXQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtyZXQm
IzMyOz0mIzMyO2NvbXBvbmVudF9hZGQoZGV2LCYjMzI7JmFtcDttdGtfZHBpX2NvbXBvbmVudF9v
cHMpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtpZiYjMzI7KHJldCkmIzMyO3sNCiZndDsmIzMy
OyZndDsmIzMyOy1kcm1fYnJpZGdlX3JlbW92ZSgmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7ZGV2X2VycihkZXYsJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMz
MjthZGQmIzMyO2NvbXBvbmVudDomIzMyOyVkJiM5MjtuJnF1b3Q7LCYjMzI7cmV0KTsNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
O30NCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstMTEwNyw3JiMzMjsrMTEwOCw2JiMzMjtAQCYj
MzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlfcmVtb3ZlKHN0cnVjdA0KJmd0OyYjMzI7Jmd0
OyYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
c3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpJiMzMjs9JiMzMjtwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCg0KUmVtb3ZlJiMzMjt0aGlzJiMzMjthbHNvLiYjMzI7U28mIzMyO2Ryb3AmIzMy
O215JiMzMjtSZXZpZXdlZC1ieSYjMzI7dGFnLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7Y29tcG9uZW50X2RlbCgmYW1w
O3BkZXYtJmd0O2RldiwmIzMyOyZhbXA7bXRrX2RwaV9jb21wb25lbnRfb3BzKTsNCiZndDsmIzMy
OyZndDsmIzMyOy1kcm1fYnJpZGdlX3JlbW92ZSgmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7fQ0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_408590170.1756993144
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTI2IGF0IDEzOjIxICswODAwLCBDSyBIdSB3
cm90ZToNCj4gSGksIEFuZ2VsbzoNCj4gDQo+IE9uIFdlZCwgMjAyMy0wNy0xOSBhdCAwOTo1MCAr
MDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+ID4gQ2hhbmdlIGRybV9i
cmlkZ2VfYWRkKCkgdG8gaXRzIGRldm0gdmFyaWFudCB0byBzbGlnaHRseSBzaW1wbGlmeQ0KPiA+
IHRoZQ0KPiA+IHByb2JlIGZ1bmN0aW9uLg0KPiANCj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+DQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIDwNCj4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMg
fCA2ICsrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4g
aW5kZXggOTQ4YTUzZjFmNGIzLi43NDA2OGFhNzBlMGMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMNCj4gPiBAQCAtMTA5MCwxMSArMTA5MCwxMiBAQCBzdGF0aWMgaW50
IG10a19kcGlfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJ
ZHBpLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gPiAgCWRwaS0+YnJpZGdlLnR5
cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJOw0KPiA+ICANCj4gPiAtCWRybV9icmlkZ2VfYWRk
KCZkcGktPmJyaWRnZSk7DQo+ID4gKwlyZXQgPSBkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwgJmRw
aS0+YnJpZGdlKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiAgDQo+
ID4gIAlyZXQgPSBjb21wb25lbnRfYWRkKGRldiwgJm10a19kcGlfY29tcG9uZW50X29wcyk7DQo+
ID4gIAlpZiAocmV0KSB7DQo+ID4gLQkJZHJtX2JyaWRnZV9yZW1vdmUoJmRwaS0+YnJpZGdlKTsN
Cj4gPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgY29tcG9uZW50OiAlZFxuIiwgcmV0
KTsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJfQ0KPiA+IEBAIC0xMTA3LDcgKzExMDgsNiBA
QCBzdGF0aWMgaW50IG10a19kcGlfcmVtb3ZlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPiAgCXN0cnVjdCBtdGtfZHBpICpkcGkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShw
ZGV2KTsNCg0KUmVtb3ZlIHRoaXMgYWxzby4gU28gZHJvcCBteSBSZXZpZXdlZC1ieSB0YWcuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+ID4gIA0KPiA+ICAJY29tcG9uZW50X2RlbCgmcGRldi0+ZGV2LCAm
bXRrX2RwaV9jb21wb25lbnRfb3BzKTsNCj4gPiAtCWRybV9icmlkZ2VfcmVtb3ZlKCZkcGktPmJy
aWRnZSk7DQo+ID4gIA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCg==

--__=_Part_Boundary_003_408590170.1756993144--

