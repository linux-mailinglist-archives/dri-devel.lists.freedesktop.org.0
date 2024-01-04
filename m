Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C4823BFD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 07:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C435710E39B;
	Thu,  4 Jan 2024 06:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD45410E39B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 06:00:16 +0000 (UTC)
X-UUID: 83dacbc4aac611eea2298b7352fd921d-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ZUrhXM1+85O2dYtR3/07BDhIkXya/hBTxtSjl5r9uWE=; 
 b=FQ5eFYAsaHGgPDOHX1xxE+/XQK3LDGsoi5K2upSRPo8Pgw47aqcER1Nph5c++uc2TRsGPtXuG4v5kG+Z43v0Vwplt+rIWkFLzGN+Adx0W1DZ71t34sNL7Lqwd/oaJe9zEVhktUqtsqLRncBChD2JTTfJVVAiiXUPGFhVgwQMjb4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:80fa1c9b-6db2-461d-a940-4df714638fdd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:7e77f97e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 83dacbc4aac611eea2298b7352fd921d-20240104
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1147716174; Thu, 04 Jan 2024 14:00:08 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 14:00:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 14:00:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nF3yDZxkdtQjrdLmI4TgIuAGjQPfVQuJvGaU2lfODJHP2x+5jmbuAUbOR+BE9xRXWesxnpXR9BI+yC+aDG71XjsR3TxebCjC377F6FRj+RcnV7lHltLwqYYcdGXdxpJsgqmQ+Kx5oxuvKLzu1M0r2LQbwuRDkqTeJzIdCK6dwi2WySHkLAoURhl7KFYSsIBDj4SiithAH2Vh6QeT671L+1HjvODNtsAkmNMf/I8cCA6NGUEOYvSDdemZ0P8unqD1Yv1nKezh7MfGu+o8F2lP7EoaW5WMFw7mFlFGlp8Y799iJH+B4BUGlGeXTEtHwrooMYT/2uSBGZ5yMde6h295wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt8VLSh3hi+teOQg+P+IoqchDSiIjvIJHLhkvgiAxKw=;
 b=J69PD3YSAZlO4nZV5u+1c//IpxQ/y85fkVRThoXhe0YUFGJaczk3O0eSFSnWGfiZVwDvrGIjtMGYXupSkBLpOMUdoTPSQ3JJ4oLQQAUlQbB1tB67Qc9keKWiaAYSRjW9HXRVAiHZh0Xr/+XCOVYJvGXySxT+coQGr5Rm8bBtnMdYOZjS0x9E4v5ioPgU9fAoXj3iEHqao4XdZgrKjNfMGlusbMw+oA7Ll/CSmztJ3FXNgJM2JgVcuSi+49+nTMdNxptuApnVbNzbBXD2P8+/lo3cOZQNXPAdthFY+uHs2/jA6nFHEl+eBOssQaEo8xLW0XXL6/AaDhqpxeqtWWfsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt8VLSh3hi+teOQg+P+IoqchDSiIjvIJHLhkvgiAxKw=;
 b=il/1X3Whm9hIMkNghSS3kAN5mAS8owQC9VyJlRBkjwxuM5FS+67p/320rCfBj3VqC2xUVxz7iVHeVTgFY93j1lNvlix+aggMbPnOzFTDibpIaYkN7x7HoMAFZ4OMC2dLPlvTjO7K3sLsAY3o3OP0tEmFEZz9MTNC92fV0ilEX7Y=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OS8PR03MB9083.apcprd03.prod.outlook.com (2603:1096:604:2ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 06:00:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 06:00:03 +0000
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
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDJaRsA
Date: Thu, 4 Jan 2024 06:00:03 +0000
Message-ID: <c645c91387c1056307b2ee303474bb8dd32211bd.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OS8PR03MB9083:EE_
x-ms-office365-filtering-correlation-id: c5e5b8a9-935b-40df-1e0f-08dc0cea6522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 379H2RUNLj/aSj2OJlHgOJssjXgP2k8Mbu+QpuZbrNMR/9ki+4xfk+5btjn/6BzJI5rxTJGAePMdYiuW8NMDN8HnOfVyqLjw34syuB8b7QjmKEiL3DaaCBUD8XlWnX/qiNdlxpNzF02R2As7gce0PsmR2zLWh5iL2r7nRick6JpH13rqNDZx5/huZljKqThOUbR0dKRkbniHiPXHOj/UAdpSwaWxItS+CAa8OrDfe0ODenNLyeiSL820Yabj/ghmoc2KmQjuMV1iZBVSZ7PGs2bi+arZpHrA86Pb+yqMWjGWgBenwKC5keU20cPcxBNB1gJ67EIj/Ws2GSuOeHijb7KNHjXop2PAVZoDT61GWlec6G3Zz/mrrbwgIUkrfGANK0jOvc69gEBihegUWLttsC+GVbXW0sWmrb70zWDlGCiX/CbWIvDxYgXEzjf7W6lVeyM91zLH1kBeYeAtN6sAAnM47V3xg1ZinPsHxpPjlOckpQDyDcp7223dcN0BroLfwaAChF5B6E2mjazVRJqNWC+UL+aFQz2jUk6SDZXLSnydPjCVYqaDPSCjS1mh5hIC/6Ue8X+jnJmM93oauXJqpnGigEOOMPC59Xq9W59R6bm5eE+b8IOxcnH8seMCBAyZbloniXcThuPBUUIPui1QyImki5vGDnjEh/If5mC2IzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4326008)(85182001)(38070700009)(4001150100001)(86362001)(8936002)(8676002)(4744005)(7416002)(5660300002)(2906002)(478600001)(71200400001)(41300700001)(6486002)(6512007)(38100700002)(6506007)(122000001)(76116006)(91956017)(36756003)(64756008)(316002)(66446008)(66476007)(66946007)(66556008)(110136005)(107886003)(2616005)(54906003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1J6ZkdVK2JWWnFWYnI1a2wxZ3NHbXI5ZXR1VTduczlobllHYVdKV3JTbXJV?=
 =?utf-8?B?OUZDa0pGS1R0ZEErMnpqVmlEL0wvUmtLSHhneUpzUldsUVM0ZzMwakZTWGV6?=
 =?utf-8?B?ak5wRUxJb3VVM3BpblNqUzJTeU94Z1lsMEg4SEw5a1h0aXFsWUY5Tmx5ekV0?=
 =?utf-8?B?NFdrSGc1eGZqUy9QVXM1YzVYeW9EdjFvbmtRcWlSSEhTWUVuQTFncTJPelFs?=
 =?utf-8?B?VGhUTng1dG4reU1OYWlHeVBkMm0yVDFXY1VqTTNtYjh6UitBT3BkdlFkWEZw?=
 =?utf-8?B?T3Z1SDQvc3JCcjgzWEYvTXJIaG5ZNDlHRjdRWjBVVnFkSDVIalIvVUhEV21s?=
 =?utf-8?B?VGY3YlFlOTl0dXFCU1NYNloyT2l5N3N6N2lTeE1jUzl5WnVSSmQvak44NTJL?=
 =?utf-8?B?V0lwbTlDdEoyZDk1UzVHMnRCWnBXc01OVDQyaFcrcVgweEEwY09NZ0w5TEx5?=
 =?utf-8?B?WXFNYWtCZUs3RG1QV0pDMFJmbkNCYjkxUWl2bENZOVVxUGx0NkNZZTllSHJG?=
 =?utf-8?B?am9RbzhhSVl6NWhMZkVqcFltQXFrYnFuckdja202dUZYd0ZQbjQrOENxWGwy?=
 =?utf-8?B?VmhVYkhQbnRkanYvZWhjcEZaVG4zM1J2Z0F3RzdXVWVkOWh2ZGYvRnJqMGRK?=
 =?utf-8?B?RW1NU1hqVDhhN05MSlF5bzg4bWdiSEhTaXBDNXV0RzlmeXBSN01LaThCaXFC?=
 =?utf-8?B?QUYrNHVoWXlVLzFhbUZES0NDQSt1c0RITzdNQjdRcE5xK3kvK3FPMmF6ZjhE?=
 =?utf-8?B?Qm1zR3duYWVpbyttRVJxcXRlOXU0K1J6Z3FpUERkSVZGWWpCeStYUzdWdkxQ?=
 =?utf-8?B?WDBCcVhIb0dVRzJUMjdLTFEwSnlxMEdnaTJqMVJTTFF0RFhrRmVkTENvSGVN?=
 =?utf-8?B?MWF5ejUzNXRCeTRxdWcvZWVVL1B6M0NFT2tva2o4NlRlUVczUFJKMGh2RVYz?=
 =?utf-8?B?WDBUN00wZHZqVUdpTFVET3p3TnNaTmZIYWtQME10VVhCTW9FZSttUlpRYXp1?=
 =?utf-8?B?ZTUxS3REa0gzVUVFVlZ6dUdtTHNmZk5zVE9zRzBiTmxsZkZieDExa1BCOStl?=
 =?utf-8?B?cEhxdkkvU1p1aFp5aTFNZkRKTmMyeXBDVUVPeEF5UUVWWWxqZjdNcnh5ZTNu?=
 =?utf-8?B?bEQrZ2NtQTZTUkRTZXY5bGhGYnMxTVQ5ckV1Wm92bzBMSCsvb1M1YXd0T1dE?=
 =?utf-8?B?N1RjMk93K09YYmVVMVVyY0p3S01GVEhGbmt1SEJhMXRBQTIyYVZiM3gzKzJh?=
 =?utf-8?B?cENNNzYzWWwxOXRpRHh3UzhJbm1aaWF0UzdXWU1WejJJYlpHbFJua092QWts?=
 =?utf-8?B?bDJHSXRrR0FnOXl4QnBRTk1aVWhBZTZxbnk4VG82UU1ja29XeTFYeldiakpL?=
 =?utf-8?B?ZlVvR05BOEQrblAxc0ZWRml0YU5kZjhobU5MTit3T0NCS3RDM1ZFWHcxQVBs?=
 =?utf-8?B?alNOYzBsdHFUcVZyUmJTUU9UTkt1YUJORWk0SVhCWUlXOHRsSTY4NUNoL2RI?=
 =?utf-8?B?cno1UloxQ1luYXVpei9yZlhHYURVUzd5QzZoUnRRYkp6RE11RVozblZmUGFl?=
 =?utf-8?B?TnhkSHdiOGxkbzZ1Qk13RmpuQytYRXcyQjBCWW5UVE1mLzdrRkJzV3FlNTRz?=
 =?utf-8?B?N3k3czBiRWtQZlhFV0FjTVlrOUdGT054dnM1cEdQcWU2QkZwNkZvaWlxT3NV?=
 =?utf-8?B?OUVWMzNpTWRmZ3VLR2FYUDB0cTQ0K1NZdHFhK3B2L1FITlJyWW9Cekh5NjBl?=
 =?utf-8?B?WXlyL2hRS1piYmJLQ1pMTkIzL3d1RnJCYXYvNld4K1RzOWdWL21lTjRseU1s?=
 =?utf-8?B?TWhUTjBGZXEwZ1dTd1VYbkdCOGJDT2o1d244eU9jVXZ6THlOWmhTQzdaOTF1?=
 =?utf-8?B?UU9Zb2h5SHAweEIwSUZDb3oxZEFRRTY5Q1pqUU9UUnNtWHZyZWQ1cTB6QjIy?=
 =?utf-8?B?Y2paZlpHUmZFL3gyYUdydkRNTHI5NUgvWFJDWjlYd1ZYaG5EdDQyWUdKSWlB?=
 =?utf-8?B?eGRkWjB6ZSs5Q3dDeWJ5bmFRK1hzUDlYNWRIWHpmd3FHQ21ObUFqbC9aT0M5?=
 =?utf-8?B?bXE2cVB1Vno1KzUrTXFnQzBTaTZmTTlJZ0dSQjhJVUtuaHVLNm1EME1LWkJX?=
 =?utf-8?Q?W0uMlyDbNauAQO+CFnKmk2vBr?=
Content-ID: <DE9289916DF3B840A01677B21A33F558@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e5b8a9-935b-40df-1e0f-08dc0cea6522
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 06:00:03.7882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGTRpUbFFO+Odhae3NQYlD6werrZstNjKiHcAoMFZxmNSj6eNVaWifgPqj1cExl0F8zaiRchJNNb1sx+mBGkpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB9083
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.344600-8.000000
X-TMASE-MatchedRID: 5+1rHnqhWUTPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxcKZwALwMGs8uj
 Rkt05a7cM2MQQW7DL3i1q48Rh4wr9SnPugGsN3p5W7gz/Gbgpl5u95mt47DzNruwJO8uVRhKo8W
 MkQWv6iUVR7DQWX/WkQGLeSok4rrZC24oEZ6SpSkj80Za3RRg8GUMaEIvhw1iLkz46FWQ+ZPrXm
 RpP3OitNlO+f0pO05KHgxrP73AZWE=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.344600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AF9CAF2EB33E05A5F6BF1CA201947181B5A6BF9AF9730EE082307FD4A9B19EAB2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1762431194.1685114560"
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

--__=_Part_Boundary_002_1762431194.1685114560
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtGcmksJiMzMjsy
MDIzLTExLTI0JiMzMjthdCYjMzI7MTY6NTMmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24sJiMz
MjtIRENQJiMzMjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7Zm9y
DQomZ3Q7JiMzMjtEaXNwbGF5UG9ydA0KJmd0OyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYj
MzI7SERDUCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7aW50
JiMzMjttdGtfZHBfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2KQ0K
Jmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRr
X2RwOw0KJmd0OyYjMzI7QEAmIzMyOy0yNjU3LDYmIzMyOysyNzc4LDE2JiMzMjtAQCYjMzI7c3Rh
dGljJiMzMjtpbnQmIzMyO210a19kcF9wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZQ0K
Jmd0OyYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsocmV0KQ0KJmd0OyYjMzI7JiMz
MjtyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrSU5JVF9XT1JLKCZh
bXA7bXRrX2RwLSZndDtoZGNwX3dvcmssJiMzMjttdGtfZHBfaGRjcF9oYW5kbGUpOw0KJmd0OyYj
MzI7K210a19kcC0mZ3Q7aGRjcF93b3JrcXVldWUmIzMyOz0mIzMyO2NyZWF0ZV93b3JrcXVldWUo
JnF1b3Q7bXRrX2RwX2hkY3Bfd29yayZxdW90Oyk7DQomZ3Q7JiMzMjsraWYmIzMyOyghbXRrX2Rw
LSZndDtoZGNwX3dvcmtxdWV1ZSkmIzMyO3sNCiZndDsmIzMyOytkZXZfZXJyKG10a19kcC0mZ3Q7
ZGV2LCYjMzI7JnF1b3Q7ZmFpbGVkJiMzMjt0byYjMzI7Y3JlYXRlJiMzMjtoZGNwJiMzMjt3b3Jr
DQomZ3Q7JiMzMjtxdWV1ZSZxdW90Oyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjstRU5PTUVNOw0K
Jmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOyttdGtfZHAtJmd0O2hkY3BfaW5mby5h
dXgmIzMyOz0mIzMyOyZhbXA7bXRrX2RwLSZndDthdXg7DQomZ3Q7JiMzMjsrbXRrX2RwLSZndDto
ZGNwX2luZm8ucmVncyYjMzI7PSYjMzI7bXRrX2RwLSZndDtyZWdzOw0KDQpJdCYjMzk7cyYjMzI7
bm90JiMzMjtuZWNlc3NhcnkmIzMyO3RvJiMzMjtkdXBsaWNhdGUmIzMyO2F1eCYjMzI7YW5kJiMz
MjtyZWdzLCYjMzI7c28mIzMyO2Ryb3AmIzMyO3RoaXMuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO210a19kcC0mZ3Q7YnJpZGdlLmZ1bmNzJiMzMjs9JiMzMjsm
YW1wO210a19kcF9icmlkZ2VfZnVuY3M7DQomZ3Q7JiMzMjsmIzMyO210a19kcC0mZ3Q7YnJpZGdl
Lm9mX25vZGUmIzMyOz0mIzMyO2Rldi0mZ3Q7b2Zfbm9kZTsNCiZndDsmIzMyOyYjMzI7bXRrX2Rw
LSZndDticmlkZ2UudHlwZSYjMzI7PSYjMzI7bXRrX2RwLSZndDtkYXRhLSZndDticmlkZ2VfdHlw
ZTsNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQt
LT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90
aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRo
aXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNv
bmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0
IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRv
IGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1
c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9y
IGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkg
dW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0K
YmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlz
IGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwg
aW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBs
eWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5k
IGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVy
IHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1762431194.1685114560
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICBzdGF0aWMgaW50IG10a19kcF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBtdGtfZHAgKm10
a19kcDsNCj4gQEAgLTI2NTcsNiArMjc3OCwxNiBAQCBzdGF0aWMgaW50IG10a19kcF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVy
biByZXQ7DQo+ICANCj4gKwlJTklUX1dPUksoJm10a19kcC0+aGRjcF93b3JrLCBtdGtfZHBfaGRj
cF9oYW5kbGUpOw0KPiArCW10a19kcC0+aGRjcF93b3JrcXVldWUgPSBjcmVhdGVfd29ya3F1ZXVl
KCJtdGtfZHBfaGRjcF93b3JrIik7DQo+ICsJaWYgKCFtdGtfZHAtPmhkY3Bfd29ya3F1ZXVlKSB7
DQo+ICsJCWRldl9lcnIobXRrX2RwLT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIGhkY3Agd29yaw0K
PiBxdWV1ZSIpOw0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKwl9DQo+ICsNCj4gKwltdGtfZHAt
PmhkY3BfaW5mby5hdXggPSAmbXRrX2RwLT5hdXg7DQo+ICsJbXRrX2RwLT5oZGNwX2luZm8ucmVn
cyA9IG10a19kcC0+cmVnczsNCg0KSXQncyBub3QgbmVjZXNzYXJ5IHRvIGR1cGxpY2F0ZSBhdXgg
YW5kIHJlZ3MsIHNvIGRyb3AgdGhpcy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiAgCW10a19k
cC0+YnJpZGdlLmZ1bmNzID0gJm10a19kcF9icmlkZ2VfZnVuY3M7DQo+ICAJbXRrX2RwLT5icmlk
Z2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gIAltdGtfZHAtPmJyaWRnZS50eXBlID0gbXRr
X2RwLT5kYXRhLT5icmlkZ2VfdHlwZTsNCj4gDQo=

--__=_Part_Boundary_002_1762431194.1685114560--

