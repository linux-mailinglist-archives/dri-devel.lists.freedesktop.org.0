Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB2770EB1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 10:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBFF10E17C;
	Sat,  5 Aug 2023 08:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3610E19F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 08:10:50 +0000 (UTC)
X-UUID: 9402d482336711ee9cb5633481061a41-20230805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=fWwxS4c4CYM8lyhcS9YbmxD8kqIHCmn64AywoaEWSf8=; 
 b=EOZm8WLOsYMNm+XZLhpJGUW9CBPXS6krE1hZoT22us3DBW98I7DF/oTTaAZ79yFdEz/CHRDBLd9Z3Gy90PsiYWgQ0KnRZFhe/a48j04r4XHMQvVPVDsRVEC3GuLSSbnmvIiX/H6q7eIoohNxLLbV7EkfVgqg8b/sYE1HfNmkjzQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:1359ede4-37a9-4a45-a311-29d50e01a7c1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.30, REQID:1359ede4-37a9-4a45-a311-29d50e01a7c1, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:1fcc6f8, CLOUDID:ac2deaa0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:230805161047124I6TUB,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 9402d482336711ee9cb5633481061a41-20230805
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1876200989; Sat, 05 Aug 2023 16:10:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 5 Aug 2023 16:10:44 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Sat, 5 Aug 2023 16:10:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Maebl4SMHKAUwsgQJx94cdMQ5EJEOHdS7yAs1+X3keKYgn4SzED6MAWLm+5/9T0TtVuc+XAUVykeWur1FLd1F3ym8LAxZ6lJw/2+Jz0dgBjEZs00f41RDjpNCz6mrH/SnIv4gMsXkLdtPfEDX39JiPIzjELvzXhkcySyxG42jVnlcElEUVnopqPhs+Bfy7mGmINnY2iiZDmMnsIMMh8hIF5qy6qdyJ/fUw7wSWZGIY80INci5FlOGoutkhkLSPna2ncgvv1pj2VHGUin/HN/dTkWwrBu97YOQDJk2++k3zTIWAu1+RB0FVY5h0CyRebmZg3OcEiguEJPtTlOGc2SMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjVowDS10LYAHrwy5ylsup/VpKIPBBSIxCShTaorAZk=;
 b=fabWUB2AGI3JyXj6cbyDmnhVVLypNDTD5Lyna4HjxWiOrIpUYv03ZXXdpuJvWxcLTIcP0mi6cZymagvcdl//Kcw0FxG34vJV8uYQZJKGdiorgPIr/G/64Lz3xa0E3TqOc+JNOYgdEHBJpcUkRIswbiRF14FjhFIsOk9Lmg4jQ+drC1rm5OQZf87gVF2bOCVdFHuq8qi+Qr56eKl2/r2YnVgx52Oac/tsfnwTRvr6wryhuPuZOAy4XaGqQMbnVWS3vJofUsyjeEGfLEowblWNicGPo3VWb0vccsrOknpYCsUfuOZhsb0IVk2LXB3dISvhY6usyrDx/pYW/1WSD6zE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjVowDS10LYAHrwy5ylsup/VpKIPBBSIxCShTaorAZk=;
 b=aDeAnLVkAsetVHr556u7vOKApB+avejrOIZ+aB/bWDbig8YidLOA+NP+i4b9XmZjlUKFJYGNRL+equAzKStzkMv+5PF7RtIV5Fvlxz+JZR2pk+TenNYADpBRpIYoqnaiWXVBFTNy2+3x/mxqxUoHh8XtGT2Eis1x0LtvNpkFMdw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB5968.apcprd03.prod.outlook.com (2603:1096:400:128::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Sat, 5 Aug
 2023 08:10:41 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6652.020; Sat, 5 Aug 2023
 08:10:41 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Topic: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Thread-Index: AQHZsxGYm13+FK938kCE0SepgE5u3K+42reAgAbd0QCAC/3uAIAPzAwA
Date: Sat, 5 Aug 2023 08:10:40 +0000
Message-ID: <90fec7158aade0020cf7314b7043f3eeb007ff7a.camel@mediatek.com>
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
 <9ba9347d4e5e05299fef80707bd1b3c5db61d657.camel@mediatek.com>
 <7adca80c59d5c3cb8d97c24995f824cd7bf5fea2.camel@mediatek.com>
 <480ec4606a163e6c2881c1dd904fc99b24e48aae.camel@mediatek.com>
In-Reply-To: <480ec4606a163e6c2881c1dd904fc99b24e48aae.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB5968:EE_
x-ms-office365-filtering-correlation-id: 7d2a049e-f971-47e4-2ed9-08db958b75ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NEjrxIeNsie4NkzLbviWoLe2KzijUZnl6ZheS/m0y10K0rHL/SpJikCcY5C3Hyq486F5+9CecbugfeM5nEjrrbq5QCTzIhT85Pff7JFewh0Nz09u32RLy6MW+lobSfatlObo7jDHe1FTX5JILKtqefvLqm7++cwV4dUOqR5eAey4qa5UrfBjKKCN5uIwl/AiGKYSjPWDvWukv1JLpyE/bU/yZPpY/8uwjNYj/jlPfYH5pwcqv690kH7StJX3h7S488kDvd1kkStgdNlWuL/tNrGx+h9z8OR1soplIOUCKbfBEhCEmWOqoqqMat9A0cQL2pTMIZ1ZETCV/ErOuz12qqSNmHqTPwwAmf/FlN1TdlK9bXjgqCerhZxxG9H17Vx0KyGl12rJQOC2lBTDuFBDC8RnnRcSsyAEFqRUPvFfLXWzvpOMYMZsFbGDmKEaAJrv8WfI/ovJimtUigIf0D/Wlpt6k9YQMrru7WB1p/n7z79vJazJduj76kPuoF6zPZRvEgvK7VmmVMOIfW88+7QEwxE53qH6qQkqROacvLxvdD7E03H3d1+m1vG7v7zko9Tx9zm4Ycyt/6AqW/mgoGKWZDC9mtUwDYmiFyVEs/w240Yt/Qtlq5UWtn18N1SiJLzBL5IV7HS6tlZNo0bTWHzcUL6Sh6rdbkDe68dBbFw/0jg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(396003)(39850400004)(346002)(186006)(1800799003)(451199021)(38070700005)(2616005)(2906002)(86362001)(85182001)(36756003)(38100700002)(83380400001)(122000001)(71200400001)(6486002)(76116006)(54906003)(8936002)(5660300002)(8676002)(110136005)(91956017)(478600001)(41300700001)(66946007)(64756008)(66446008)(4326008)(66556008)(66476007)(316002)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1VDdTUzUkxaYkhTYkc3N09XVlMzSDNIR3ZkRTRDN2V6eVczQVBqZVdDbUl4?=
 =?utf-8?B?MkpXTERCL0xqNlozRXB0eld3NWtsV1pDV0RYTlVqN01Id3hHQ1lrb3VQaGsw?=
 =?utf-8?B?akpGUnhmSlJWZnZKanNLb0ZhWVZlV1I0NXFOczRGdWZxdHZheXcvR0F0bk5a?=
 =?utf-8?B?aUJtdjh3U1liejFjSk11R2psS3IxQmNBdkRIVHNqS3JFRDdNY29heHg2bTB0?=
 =?utf-8?B?bnAyKzF4aFNUVGlsWUZYMFZNOUtKeExhVWJVTGplYk1ORWpkaDdGVHR3RTd3?=
 =?utf-8?B?ZzY3MTFwbGRaVXBaSTlMNzIxS1F4Um9wL2tDeWQ3SUZmSkFySFFIYnhRSStF?=
 =?utf-8?B?dkJad1dMakwxeEpHR3hJVjg1bEc0VVdjemlBSjhXVFhOay9oYkxGdTVVVzVY?=
 =?utf-8?B?Mm91UHhTcXl3alhyTHFVY0FzOUJzbUE3QmtiOFBtcHFyL1hJclMrVHVJY0h2?=
 =?utf-8?B?T05SLzdYb3FSVGF6aGFCUWt6NThrYUw2b3lpenFhTXhrZkhqa3htUlJVZCtE?=
 =?utf-8?B?TVFWbjl4b1NEeHhWN2hZNmxsTHNZVUpCNjM0bDIzbTdxZU9VK0hQWmZrLzZo?=
 =?utf-8?B?ZjVOZTNGMm9zRURwUTlucUpHL250QURjZmRlVDNXZzFwcVl2SWVNUDlNTVFD?=
 =?utf-8?B?bFNlaTV4ZmhDUUtpNURzblVEVTMxS0ttQU1ueFpvcGcyS2t3d2dsR2p3R1N1?=
 =?utf-8?B?QWNnV0NMQmRSMC9adkl0Y2NzZXJlSUV5RzMyNVVxL0dsM29NVHV0Mm5nYllI?=
 =?utf-8?B?MGpxN1V0SWh1SDV1NUhMQkdCY2hkcEN6WkNGclN0U0h4ZUZOTFVTMGxMRnRi?=
 =?utf-8?B?OVBzYW9wK25IdHl5dUZLVUg0dURPR0RKeGRKdnZRWFAybHJYQmFXSWErVDUv?=
 =?utf-8?B?QnI1Mkg4OTNBbnlkaTRpUjNBazdUd2Q5d25rdy94MnJOUVVTMUJwazhxUmRW?=
 =?utf-8?B?ZElvdGJLZ1FRMzhNTStpU2dXUjRVNTVGa1FGWXlieDl6YmFBaUg0T1F2ajht?=
 =?utf-8?B?QXdsZkVNMkRoQTQ3VEd4QU9QczRqdzhmNmZnM0JUaVpadGlLNEd4RVE1ZHFv?=
 =?utf-8?B?L0hnemhPdVBMVkJpQk94OENnam9aRE45UGRNdmQvUHl4c1lhTXU0blBWODVl?=
 =?utf-8?B?ZUlKZGk2M0RlanMydStzUm5MMWRoQnVDelV0eEdZRGhHMW85c2Y1aW5PczJZ?=
 =?utf-8?B?aVFhWnNncE1URXZDVFlZN0VPWFpERU01aXhuV3dkOTRJb0o1cCtlcFZQNTRW?=
 =?utf-8?B?ckNHdE9oZHVrWDdIM0lXMEo5WTVVQndsVE1KMVk2cjU3RCs5eDJHUjZndXNl?=
 =?utf-8?B?M3ZGdHllck5oTVBsSTlCMlhXQmQ2N1FsRWxIT3gzZjl5aUZ3WVBTVG1uMlFC?=
 =?utf-8?B?Znd6S2JCcm5WVEhzT1JUR2V0YXEyWTBCWG5KYWhrUDJ5bittNDVzYjlqaDM1?=
 =?utf-8?B?VnB1cU0vcW03dGxicVNkMmdWeTREY3FaVm5HcU00Y3pGRy9sa1VKaW5nd3V6?=
 =?utf-8?B?WEloeTc2TzJGMmpkNDZaS3VOdC95TlRQUnhRN2hESGxQUDcvTmwrdHpoaEla?=
 =?utf-8?B?YVQxN1o1b21oZjJrTWNpSjVEYWl2MkM3UjR1Yit3SS9XbmZNNDNkSmJNK1dp?=
 =?utf-8?B?NEZGVWs2RTloaEwwSHlRMzFxWTV2czVydWpxSjQxM1NXWHdpUG52NjMzWXJj?=
 =?utf-8?B?RzZIOFZXbUNRS1JTcDFRMjV6ZjA5bFI5MXdkeGxsRkRMVjNPVmVNdkVncnBL?=
 =?utf-8?B?cGQ5aHVYMWRtMEdtZytVdjE3S1AydlUvMTM4Q3lOYWFXdWsySkhMQ1B2emd2?=
 =?utf-8?B?R0tJVmNmejQ4c25qT1RGSGZCL3VYdlV1eDlMUjUvcmwyUE52cUdCdkg0SG5F?=
 =?utf-8?B?bGg5WDdMR3VCU0MyNW9iTFJGUkxoZzNxOXYvMG9rcDE1Sk1aQXU0ZDUzMUc4?=
 =?utf-8?B?NGJZZDl2c2dCOTV4K21iSXkxZFJ5V3JBbmtvNXRzZGJXMy9ReTBpQXZ2S2tE?=
 =?utf-8?B?K0V4U2dxMkNsQWFMdlhkL21ZNnUybmRyT0Q4VTNkWHcydkh5NnlaaHZNR0xQ?=
 =?utf-8?B?bXBUTGNKQmhKeDcwcXc3dkRuTGg2UWtNLzMzcmxyQndjZDVuaWRqVGF4OFVP?=
 =?utf-8?B?djdIUWdNM3pzOFdJdWE1M0VEdzZJdDZ2V2JUa1dSdGxUdUU5dDF5QUpNOWZM?=
 =?utf-8?B?amc9PQ==?=
Content-ID: <5D60CC890499F748AC4D1993F535E673@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2a049e-f971-47e4-2ed9-08db958b75ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 08:10:40.9645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBYS43j7orlQKPmD34GFV2hg+a73dTg9NF+QvlDyvRhCEZmeOFgWKUxpvyLLcQryehmxWL9QuYp1lzqW3QgOW9U44DPkD5+wwTpi4KTeFIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5968
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1487160526.550933475"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1487160526.550933475
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KT24mIzMyO1dlZCwmIzMyOzIwMjMtMDctMjYmIzMyO2F0JiMz
MjswNjo1NiYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMy
MDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7SmFzb246DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO09uJiMzMjtUdWUsJiMzMjsyMDIzLTA3LTE4JiMzMjthdCYjMzI7MTU6NDgmIzMyOysw
MDAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7KCYjMjY1MTk7JiMzMDU5MTsmIzMxMDc3Oykm
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7SGkmIzMyO0NLLA0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZXZpZXdz
Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7RnJpLCYjMzI7
MjAyMy0wNy0xNCYjMzI7YXQmIzMyOzA2OjU3JiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7
KCYjMzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7SGksJiMzMjtKYXNvbjoNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO01vbiwmIzMyOzIwMjMtMDctMTAmIzMyO2F0
JiMzMjsxNzozMiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7T1ZMJiMzMjtsYXllciYjMzI7c2hvdWxkJiMz
Mjtub3QmIzMyO2JlJiMzMjtlbmFibGVkJiMzMjtiZWZvcmUmIzMyO2NydGMmIzMyO2lzJiMzMjtl
bmFibGVkLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjtwbGFu
ZV9zdGF0ZSYjMzI7b2YmIzMyO2RybV9hdG9taWNfc3RhdGUmIzMyO2lzJiMzMjtub3QmIzMyO3N5
bmMmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO3Bs
YW5lX3N0YXRlJiMzMjtzdG9yZWQmIzMyO2luJiMzMjttdGtfY3J0YyYjMzI7ZHVyaW5nJiMzMjtj
cnRjJiMzMjtlbmFibGluZywNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3Nv
JiMzMjtqdXN0JiMzMjtzZXQmIzMyO2FsbCYjMzI7cGxhbmVzJiMzMjt0byYjMzI7ZGlzYWJsZWQu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyO0ZpeGVzOiYjMzI7MTE5ZjUxNzM2MjhhJiMzMjsoJnF1b3Q7ZHJt
L21lZGlhdGVrOiYjMzI7QWRkJiMzMjtEUk0mIzMyO0RyaXZlciYjMzI7Zm9yJiMzMjtNZWRpYXRl
aw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U29DDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtNVDgxNzMuJnF1b3Q7KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0
O2phc29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jJiMzMjt8JiMzMjszJiMzMjsr
KysNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYj
MzI7Y2hhbmdlZCwmIzMyOzMmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZGlm
ZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7aW5kZXgmIzMyO2Q0MDE0Mjg0MmY4NS4uNTFkMTBlNjUwMDRlJiMzMjsxMDA2NDQNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNDEwLDYmIzMyOys0MTAs
OSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1
Y3QNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO210a19kcm1fY3J0YyYjMzI7
Km10a19jcnRjKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjt1bnNp
Z25lZCYjMzI7aW50JiMzMjtsb2NhbF9sYXllcjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
O3BsYW5lX3N0YXRlJiMzMjs9JiMzMjt0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtJmd0O3N0YXRl
KTsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOysvKiYjMzI7c2hvdWxkJiMzMjtub3QmIzMyO2VuYWJsZSYj
MzI7bGF5ZXImIzMyO2JlZm9yZSYjMzI7Y3J0YyYjMzI7ZW5hYmxlZA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOytwbGFuZV9zdGF0ZS0mZ3Q7cGVuZGluZy5lbmFibGUmIzMyOz0mIzMyO2ZhbHNlOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtBbGwm
IzMyO3BsYW5lJiMzMjtoYXMmIzMyO2JlZW4mIzMyO2Rpc2FibGUmIzMyO2luJiMzMjttdGtfZHJt
X2NydGNfYXRvbWljX2Rpc2FibGUoKSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2RvZXNu
JiMzOTt0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtpdCYjNjM7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7WWVz
LCYjMzI7aXQmIzMyO2RvZXMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
O0J1dCYjMzI7c29tZWhvdyYjMzI7dGhlJiMzMjtwbGFuZV9zdGF0ZSYjMzI7Z2V0JiMzMjtmcm9t
JiMzMjt0b19tdGtfcGxhbmVfc3RhdGUobXRrX2NydGMtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjtwbGFuZXNbaV0pJiMzMjtpcyYjMzI7bm90JiMzMjtzeW5jZWQmIzMyO3RvJiMzMjt0aGUm
IzMyO3BsYW5lX3N0YXRlJiMzMjtpbiYjMzI7YXRvbWljX3N0YXRlLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTbyYjMzI7SSYjMzI7dGhpbmsmIzMyO3dlJiMzMjtzaG91
bGQmIzMyO2Rpc2FibGUmIzMyO292bCYjMzI7bGF5ZXImIzMyO3RvJiMzMjthdm9pZCYjMzI7aW5j
b3JyZWN0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwbGFuZV9zdGF0ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
YXBwbHlpbmcmIzMyO3RvJiMzMjtPVkwmIzMyO0hXJiMzMjthdCYjMzI7dGhlJiMzMjtIVyYjMzI7
aW5pdCYjMzI7c3RhZ2UuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0RvJiMzMjt5b3UmIzMyO21lYW4m
IzMyO3BsYW5lX3N0YXRlJiMzMjtpbiYjMzI7YXRvbWljX3N0YXRlJiMzMjtpcyYjMzI7Y29ycmVj
dCYjMzI7YnV0JiMzMjtpdCYjMzk7cyYjMzI7bm90DQomZ3Q7JiMzMjtzeW5jZWQNCiZndDsmIzMy
O3RvJiMzMjttdGtfY3J0Yy0mZ3Q7cGxhbmVzJiM2MzsmIzMyOw0KWWVzLg0KDQomZ3Q7JiMzMjtJ
ZiYjMzI7c28sJiMzMjt0aGUmIzMyO2F0b21pY19zdGF0ZSYjMzI7aXMmIzMyO2J5cGFzc2VkJiMz
MjtpbnRvDQomZ3Q7JiMzMjttdGtfZHJtX2NydGNfYXRvbWljX2VhbmJsZSgpJiMzMjthbmQmIzMy
O3lvdSYjMzI7Y291bGQmIzMyO3N5bmMmIzMyO2l0JiMzMjtoZXJlLg0KJmd0OyYjMzI7DQpJJiMz
OTt2ZCYjMzI7dHJpZWQmIzMyO3RoaXMmIzMyO21ldGhvZC4mIzMyO0l0JiMzMjtjYW4mIzMyO2Fs
c28mIzMyO2ZpeCYjMzI7dGhpcyYjMzI7cHJvYmxlbS4NClNvJiMzMjtJJiMzOTtsbCYjMzI7dXNl
JiMzMjthdG9taWNfc3RhdGUmIzMyO3RvJiMzMjt1cGRhdGUmIzMyO210a19wbGFuZV9zdGF0ZSYj
MzI7aGVyZS4NClRoYW5rcyYjMTI2Ow0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCiZndDsm
IzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtDSyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyOyZndDsmIzMyO0phc29u
LUpILkxpbg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtD
Sw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyO2NvbXAmIzMyOz0mIzMyO210a19kcm1fZGRwX2NvbXBfZm9yX3BsYW5l
KGNydGMsJiMzMjtwbGFuZSwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZh
bXA7bG9jYWxfbGF5ZXIpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMz
MjtpZiYjMzI7KGNvbXApDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
O210a19kZHBfY29tcF9sYXllcl9jb25maWcoY29tcCwNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyO2xvY2FsX2xheWVyLA0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
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

--__=_Part_Boundary_008_1487160526.550933475
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCk9uIFdlZCwgMjAyMy0wNy0yNiBhdCAwNjo1NiArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBKYXNvbjoNCj4gDQo+IE9uIFR1ZSwgMjAyMy0wNy0xOCBhdCAx
NTo0OCArMDAwMCwgSmFzb24tSkggTGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiA+IEhpIENLLA0K
PiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQo+ID4gDQo+ID4gT24gRnJpLCAyMDIz
LTA3LTE0IGF0IDA2OjU3ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiA+IEhp
LCBKYXNvbjoNCj4gPiA+IA0KPiA+ID4gT24gTW9uLCAyMDIzLTA3LTEwIGF0IDE3OjMyICswODAw
LCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gPiA+IE9WTCBsYXllciBzaG91bGQgbm90IGJlIGVu
YWJsZWQgYmVmb3JlIGNydGMgaXMgZW5hYmxlZC4NCj4gPiA+ID4gVGhlIHBsYW5lX3N0YXRlIG9m
IGRybV9hdG9taWNfc3RhdGUgaXMgbm90IHN5bmMgdG8NCj4gPiA+ID4gdGhlIHBsYW5lX3N0YXRl
IHN0b3JlZCBpbiBtdGtfY3J0YyBkdXJpbmcgY3J0YyBlbmFibGluZywNCj4gPiA+ID4gc28ganVz
dCBzZXQgYWxsIHBsYW5lcyB0byBkaXNhYmxlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEZpeGVzOiAx
MTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlaw0K
PiA+ID4gPiBTb0MNCj4gPiA+ID4gTVQ4MTczLiIpDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAzICsrKw0KPiA+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiANCj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiA+
ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiA+ID4gPiBp
bmRleCBkNDAxNDI4NDJmODUuLjUxZDEwZTY1MDA0ZSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiA+ID4gPiBAQCAtNDEwLDYgKzQx
MCw5IEBAIHN0YXRpYyBpbnQgbXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0DQo+ID4gPiA+IG10
a19kcm1fY3J0YyAqbXRrX2NydGMpDQo+ID4gPiA+ICAJCXVuc2lnbmVkIGludCBsb2NhbF9sYXll
cjsNCj4gPiA+ID4gIA0KPiA+ID4gPiAgCQlwbGFuZV9zdGF0ZSA9IHRvX210a19wbGFuZV9zdGF0
ZShwbGFuZS0+c3RhdGUpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJCS8qIHNob3VsZCBub3QgZW5h
YmxlIGxheWVyIGJlZm9yZSBjcnRjIGVuYWJsZWQNCj4gPiA+ID4gKi8NCj4gPiA+ID4gKwkJcGxh
bmVfc3RhdGUtPnBlbmRpbmcuZW5hYmxlID0gZmFsc2U7DQo+ID4gPiANCj4gPiA+IEFsbCBwbGFu
ZSBoYXMgYmVlbiBkaXNhYmxlIGluIG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZSgpLA0KPiA+
ID4gZG9lc24ndA0KPiA+ID4gaXQ/DQo+ID4gPiANCj4gPiANCj4gPiBZZXMsIGl0IGRvZXMuDQo+
ID4gDQo+ID4gQnV0IHNvbWVob3cgdGhlIHBsYW5lX3N0YXRlIGdldCBmcm9tIHRvX210a19wbGFu
ZV9zdGF0ZShtdGtfY3J0Yy0NCj4gPiA+IHBsYW5lc1tpXSkgaXMgbm90IHN5bmNlZCB0byB0aGUg
cGxhbmVfc3RhdGUgaW4gYXRvbWljX3N0YXRlLg0KPiA+IA0KPiA+IFNvIEkgdGhpbmsgd2Ugc2hv
dWxkIGRpc2FibGUgb3ZsIGxheWVyIHRvIGF2b2lkIGluY29ycmVjdA0KPiA+IHBsYW5lX3N0YXRl
DQo+ID4gYXBwbHlpbmcgdG8gT1ZMIEhXIGF0IHRoZSBIVyBpbml0IHN0YWdlLg0KPiANCj4gRG8g
eW91IG1lYW4gcGxhbmVfc3RhdGUgaW4gYXRvbWljX3N0YXRlIGlzIGNvcnJlY3QgYnV0IGl0J3Mg
bm90DQo+IHN5bmNlZA0KPiB0byBtdGtfY3J0Yy0+cGxhbmVzPyANClllcy4NCg0KPiBJZiBzbywg
dGhlIGF0b21pY19zdGF0ZSBpcyBieXBhc3NlZCBpbnRvDQo+IG10a19kcm1fY3J0Y19hdG9taWNf
ZWFuYmxlKCkgYW5kIHlvdSBjb3VsZCBzeW5jIGl0IGhlcmUuDQo+IA0KSSd2ZCB0cmllZCB0aGlz
IG1ldGhvZC4gSXQgY2FuIGFsc28gZml4IHRoaXMgcHJvYmxlbS4NClNvIEknbGwgdXNlIGF0b21p
Y19zdGF0ZSB0byB1cGRhdGUgbXRrX3BsYW5lX3N0YXRlIGhlcmUuDQpUaGFua3N+DQoNClJlZ2Fy
ZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBSZWdhcmRzLA0KPiBDSyANCj4gDQo+ID4gDQo+ID4gUmVn
YXJkcywNCj4gPiBKYXNvbi1KSC5MaW4NCj4gPiANCj4gPiANCj4gPiA+IFJlZ2FyZHMsDQo+ID4g
PiBDSw0KPiA+ID4gDQo+ID4gPiA+ICAJCWNvbXAgPSBtdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFu
ZShjcnRjLCBwbGFuZSwNCj4gPiA+ID4gJmxvY2FsX2xheWVyKTsNCj4gPiA+ID4gIAkJaWYgKGNv
bXApDQo+ID4gPiA+ICAJCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsDQo+ID4gPiA+
IGxvY2FsX2xheWVyLA0K

--__=_Part_Boundary_008_1487160526.550933475--

