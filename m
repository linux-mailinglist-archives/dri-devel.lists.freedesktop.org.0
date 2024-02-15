Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438A855DC5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31710E4A9;
	Thu, 15 Feb 2024 09:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gnR5xvC5";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hrg5Kp1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2D10E49E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:20:52 +0000 (UTC)
X-UUID: 81aed9b0cbe311eea2298b7352fd921d-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=o8oEfgo9eKdz8EU5jyzfa7Z4s37Z54nmMXEBc4Lm53Q=; 
 b=gnR5xvC5PXeYtTuXSwUCWweJz1hkuJhDRCPvA7ZPAAvNjyhrFmhe4NTh2OS6HItzMP10VoQebbXkJifTD3rh4wp2/pfixg6PJoyzLjzrOG5gzBgLlGbvA++Rr/QGszUvvT4V3q3R2yDnLicOxEOQ7cR6tonePBxQds4f3ayGdVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:0d79291d-8548-4304-b5ff-9abc538e32a3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:d5f16a80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 81aed9b0cbe311eea2298b7352fd921d-20240215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2042224642; Thu, 15 Feb 2024 17:20:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 17:20:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 17:20:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRfKzfqf41UvY2gnB5ZyzEwA3OzVZf9zGdSeAlSncKeLhyMhy6C3HdOsUxZCkwCs2atBgU6ETMFbFwQF+gyZA/su+tNOLySHh/kk5LhNl78OcWbSYSyqcSCbCepaqNu0V/Us/uH02Stb1l0FmlyMGs0B7RM4F6HA+XRiWh1UFAPTj59m16T3YAm3JH3fVW/BXMlrqMGNR2mxNngpUJI0NFKClR7tsf/bx5E/KxtnC3HV2G28ORGmgXscdiJGXtKkE9Q1OMHJO7UxAa3ALCMUDfPK63E6SmqPdNJJNp/joWyJ577bmnV1DXE9yXliwYJxviL/0CIeClT2krR4982cgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4bFe+gnRMOEcZZmH27YmSQXgK8xHCkkIMnnSjnw0rc=;
 b=LyFglClJwaKBtUm907mvRxXUWwrUlcDikCEGeO9Z7eEqfMbsJ6v2UQCs3E5SeqYy7X8xZ7PL3ozIsr9EM9+eRpF1qadeW2LMUeHZa3QPNLnUNXhbrk6coLIPWnEoZ+0NsgXn2Y7dRBswxgFdszQJdXIwWxqmZnJHPupL3BT5tHYtU/86CZL3WtYONrw63fj9hyq8mjw34oXeL6G7kT4nXvCmLdriM/GjSjME1vRKgEP7maEQU6V4xcgqFecH7DdByqz8gVvo7AQpxlXL2GfrNBKnyFiZh6zUY35u/aSKO3YbLNM8QcpYaji8f9QThu8y9hiPze+a5avSalrO9/r68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4bFe+gnRMOEcZZmH27YmSQXgK8xHCkkIMnnSjnw0rc=;
 b=hrg5Kp1y7DLFqkoXSK4QbNRQpbzDWfR/iELy1L2ATLC6O5uLe+uE7FKNOC8n8zEGd/rhuxYD4Q8bUuPv7fl67XbgTSjuD0JJKBoxGCmiejp4D3ELQ/NSSmIcPAAEUtudUsLxYASb2DR5ttGL87Z0oCIxThCEqm7ilw35nz9XYWU=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR03MB8009.apcprd03.prod.outlook.com (2603:1096:820:100::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 09:20:45 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::afa5:be3f:bc79:48fe]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::afa5:be3f:bc79:48fe%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 09:20:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v6 8/9] drm/mediatek: dsi: Compress of_device_id entries
 and add sentinel
Thread-Topic: [PATCH v6 8/9] drm/mediatek: dsi: Compress of_device_id entries
 and add sentinel
Thread-Index: AQHaX+ylbFvtVQVQ9USxLeZgXiyPqLELIKcA
Date: Thu, 15 Feb 2024 09:20:45 +0000
Message-ID: <d491ddeba2f0ffad7360899a5c0f247af2f21681.camel@mediatek.com>
References: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
 <20240215085316.56835-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215085316.56835-9-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR03MB8009:EE_
x-ms-office365-filtering-correlation-id: ff6e7f0e-62be-4ac3-3262-08dc2e0763ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MQP421NGvw+rLcJb5rrro2kxmP1h0S4V31YFipL/USebbY/MqUOibQ3OYMc97YeMRNIE5EBIBf8dpFmM0MLmetMWL3OOFUrNM8nR/WqSozIpf4aESqwNUB8JDBEwWiC05YfNiIGtVf1F3FJQhb2fRbi0z3WqzBsWT9Qqrg7hg4lBnB2tJk7ndP6QCSdcBDbPJqQD/d64Xgd2xV0odw8QNjDFEM31GMWmLQU/1WR1SydFN6Y6mRHsman383RsAfIb1ZNf0hSQ/RaC7LyF+QFu2vJAHKCEJmlBFXo6Ok5NudL37uVnFUHS8+xIXhvoXIr+4WNARRQddG/DWO1OrxQrPExWaR+M/D11xGGzVKftn85XVXsyz56FZXPucdntm4siCXPOaHdaSVqsDhZS81CLoIbyAJDr1VESR9csX8VIrmIXB0LYRvVqLK6U01J97ldlkdN6kyAxq2TFYCOCJV+rQ97WNxNHmr/AmpDc8Q9a8+MzAw/htCgfp6aYgeasRHhXGNc1VJgCOKI/etuhrqaPdw4LbA0KpXbDmPhwWwjdc3PiwO0pn3dHgj3Bd8NjHctwE2heDDO3U3WtVNnTRuo/U6sNhgaYPBeQ/wP7PG1OT8w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(7416002)(2906002)(26005)(41300700001)(85182001)(2616005)(36756003)(38070700009)(478600001)(38100700002)(122000001)(83380400001)(6506007)(86362001)(66476007)(8936002)(66446008)(64756008)(76116006)(66946007)(66556008)(8676002)(6512007)(4326008)(6486002)(54906003)(110136005)(71200400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDBhNG9QSllldzJaL3JNTEVLcWdveTd3TTZVUXpsak5nUXY3bHMxVzBJSGdZ?=
 =?utf-8?B?TUNLczR4dXVlSDFja3ZDNXZ0aEU2alRzKy9kNUFPc0N5NFVTb3V0QzNrcWdy?=
 =?utf-8?B?cHJyM1FvdHUvQ2ZQSFZNdnhOdC8wUDJtVks1R3FtUC9oYkNobmt5OTJiYnYw?=
 =?utf-8?B?cENCSkoyeUtCTnZuWFZobnVqUWI4UGI1TkE5WnI5VldUUUE2QythVDlSMkFu?=
 =?utf-8?B?QUNDa241WmE0S2xHMnJYdnRLcGNFaWRGMFZOTHRVblBEVUgzUjRJY3llQ2E0?=
 =?utf-8?B?V1QrMTBucHBYS2gyZ3RvWW95ZFdPdDVXTTJ3akEyUGVTQ3JFU2pwakxaL280?=
 =?utf-8?B?RDI2MkY2ZHo5SEV4NEp6VzM3T2JlOW1ERzRtaG9Pd3puOEpLeTZqcy8vZ3RE?=
 =?utf-8?B?KzgyZUpTb1NVcXUwaUdBYllzT01ac3R0U2RlV1BtOUdlOHo5QXBZZ0k0Ulpt?=
 =?utf-8?B?dnhjbExXZEkrL24xSEc5UXBGaUpUeEpwV2U1dVBVbEQzdmlyZkFLdG5YVUNQ?=
 =?utf-8?B?V0tPdXE4M1JxUjZGd0ZUYjRlNW40WVhKK1hBWnpaRE9veDdvN2I5TmxGbjBZ?=
 =?utf-8?B?VGJMdUFmY1NCOWZhRnhMMFpZei8wK1lhdXljMmFlYVYrNjBFY0lrRm5qLzZJ?=
 =?utf-8?B?ZHBTWGNvRXJ2UWhnTlhLK1p2OHRHaWFuclZFZEpEZUdBMjBhMXppMFlRK05m?=
 =?utf-8?B?cHMrc3hDOTd2S3g5czJwWU9EWUF4SjJKSDZiaXVSVWdZOTVnanJQdVNHL2xr?=
 =?utf-8?B?L1RSdVJoRXpxSDNQbWxqcTlkT2k5QmJXRXJXakhlNy84U2lPbVZPMW84bzJk?=
 =?utf-8?B?bGJaUk5KTTNNS0lMQTdGenNlcGZyUDBKNWlObkc1clRDOUZCelYzcmphYzh5?=
 =?utf-8?B?OGl4c1dtbEZkVVlJcFZLVE9OZElpVHY5bUYxNFNybUhDZ1dkQVorTTZldFh1?=
 =?utf-8?B?WWIvVlEzSnFiRnpUR0tzYXBuUW53T0ViZVpzWWRVak1OREJTeTlxcytXYkQv?=
 =?utf-8?B?aEZVUU1wYUpXcWhld3BzNXg4N1UwV0g3TVorN1FvdGlaMnFLMTJBTDNBR2th?=
 =?utf-8?B?ZnVNU1AvNktFS3NRS0pybEFwbGMvNDdidERuRTViRFM2aDVWTTYvdGxRdlRn?=
 =?utf-8?B?UFQyd0lIYlhtbEU1LzBhRktROU4xT0lCazlDOTNWclZJZGYvT0VoOEp4SDR1?=
 =?utf-8?B?Q3JZcXJKMEE5eDNxSU5HSXlVQ0NEYVlDbndDRWkvaXdxQnhIWnBCM2Q1M2F0?=
 =?utf-8?B?VldNT3F4SytFaWFiemhRTXNzMDh1SDdBbStWaGdSRk5HeU1pc0pEOG14TjRP?=
 =?utf-8?B?aFJtT0NHaExqV0YzV0xuZUk1R0pkM0h5V2gyZ2hKVVdXNmNCWWNHM3pwOTYv?=
 =?utf-8?B?QWZJb2R0SVBaby9PcEZ3MFluR0UrbU43cWtocVJCL05uZ3o5VlJnS21NUFJr?=
 =?utf-8?B?TTRzMUVkeUhTRGtXS3IwVDlRbHZhUXVXMG1IMGRCUnMwSFZ0c2prUXROTmJL?=
 =?utf-8?B?QXFxTnRnQlg5bUZUZW1JTUVpS1dxcVdLWk42aWNYV0dwQXRjY2FvWVl2anlt?=
 =?utf-8?B?ZGtORE9TYngzSDJBTkQ2WFgyTlpabjhKaUNVVk1qbHFUWm4wZ2pGU2ZOcGdm?=
 =?utf-8?B?anJEc0ZjS3dydmtrclkyMGxSUVNMZktiaFZNSXRjay9UMS96MnpIQ2I4R1B3?=
 =?utf-8?B?aXV5TlEyVFZkK08rVGE0TlhZQUlBR3V2d1RFK2hIeHBqVTZaa3ZGbEJoTGVl?=
 =?utf-8?B?WkR5TUs3eUlvMTBCRFBqWWZyYjFqakhqRzlMMDNPUE8xQ290N2FDcENSUkVC?=
 =?utf-8?B?YUsxVFpNM2RvUS9TcmNOWHQvYTRZOTZaZ1lyNEU4UkZLSCtIM1R6RE1XMGZt?=
 =?utf-8?B?a0dqUU9jTXJXZzVDK1dsdEV1SkdZdVU1bWViY252ZDZ4aHVXd2NHc3N0aW5U?=
 =?utf-8?B?bmhLdFZvc3U2UEIvSGozcmZ4b1JjQ2VNS1pHbmh5WEV2aTgvM3hFY3BCYWV2?=
 =?utf-8?B?c1FYL1ZSeWZyTWVNVFdsNVlhU3NEdk1ZV1RtQTBJNVNtUnMvMS9Mb3NNbXBi?=
 =?utf-8?B?R1ZJRVQxYlZQYTgwa1RwQ0pQaklIMlRoV09wTTd1UzhlV0tzMEZod0ZrMXNr?=
 =?utf-8?B?dEFRd1VjcnV4aytBWjRkdEpCOStiOCtDRVllZlk3MmFqbGc3a3BJSWwvTi9q?=
 =?utf-8?B?elE9PQ==?=
Content-ID: <A658AA422211074EBF2EE7807A3B1C95@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6e7f0e-62be-4ac3-3262-08dc2e0763ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 09:20:45.1270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /twDdK33s2kGHclPTMf5dC4j8RsVfUGJJecSbX2mAc+/pC8rvxP4JxeuzKjBS3AWUPC05Bej+xyUtqDFatLZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8009
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.783500-8.000000
X-TMASE-MatchedRID: fgYTp5XatxYNtKv7cnNXnSa1MaKuob8PC/ExpXrHizxcKZwALwMGs3Iu
 7Bbf4TXto5qw/iFKtvYBtjkcfRMmqRAq4jU0QZlBFYJUGv4DL3wikU4xQFgb7psoi2XrUn/J+ZL
 5o+vRV7yhMIDkR/KfwI2j49Ftap9EOwBXM346/+xtNewwFuO3FOyl63qoQ/KBZivbS6773dw/Ls
 S81CmZljTs60WxwrxP
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.783500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 690E887A788B2A766C4367B0344C54E72776459C52516BD86555F1F0B2E832232000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_719683841.157755325"
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

--__=_Part_Boundary_009_719683841.157755325
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTAyLTE1JiMzMjthdCYjMzI7MDk6NTMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtBbGwmIzMyO2VudHJp
ZXMmIzMyO2ZpdCYjMzI7aW4mIzMyOzgyJiMzMjtjb2x1bW5zLCYjMzI7d2hpY2gmIzMyO2lzJiMz
MjthY2NlcHRhYmxlOiYjMzI7Y29tcHJlc3MmIzMyO2FsbCYjMzI7b2YNCiZndDsmIzMyO3RoZSYj
MzI7bXRrX2RzaV9vZl9tYXRjaFtdJiMzMjtlbnRyaWVzJiMzMjt0byYjMzI7YSYjMzI7c2luZ2xl
JiMzMjtsaW5lJiMzMjtmb3ImIzMyO2VhY2guDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1doaWxlJiMz
MjthdCYjMzI7aXQsJiMzMjthbHNvJiMzMjthZGQmIzMyO3RoZSYjMzI7dXN1YWwmIzMyO3NlbnRp
bmVsJiMzMjtjb21tZW50JiMzMjt0byYjMzI7dGhlJiMzMjtsYXN0JiMzMjtlbnRyeS4NCg0KUmV2
aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoN
CiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbGV4YW5kcmUmIzMyO01lcmdu
YXQmIzMyOyZsdDthbWVyZ25hdEBiYXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2Zm
LWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0
OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYj
MzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMm
IzMyO3wmIzMyOzE3JiMzMjsrKysrKystLS0tLS0tLS0tLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtm
aWxlJiMzMjtjaGFuZ2VkLCYjMzI7NiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzExJiMzMjtkZWxl
dGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MTk1ZmY0ZGZjM2EzLi5iNjQ0
NTA1ZGU5OGEmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEyMDQsMTcmIzMyOysxMjA0LDEyJiMz
MjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZHNpX2RyaXZlcl9k
YXRhDQomZ3Q7JiMzMjttdDgxODhfZHNpX2RyaXZlcl9kYXRhJiMzMjs9JiMzMjt7DQomZ3Q7JiMz
MjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0
JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7bXRrX2RzaV9vZl9tYXRjaFtdJiMzMjs9
JiMzMjt7DQomZ3Q7JiMzMjsteyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlh
dGVrLG10MjcwMS1kc2kmcXVvdDssDQomZ3Q7JiMzMjstJiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMz
MjsmYW1wO210MjcwMV9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsteyYjMzI7LmNv
bXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE3My1kc2kmcXVvdDssDQomZ3Q7
JiMzMjstJiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE3M19kc2lfZHJpdmVyX2Rh
dGEmIzMyO30sDQomZ3Q7JiMzMjsteyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21l
ZGlhdGVrLG10ODE4My1kc2kmcXVvdDssDQomZ3Q7JiMzMjstJiMzMjsmIzMyOy5kYXRhJiMzMjs9
JiMzMjsmYW1wO210ODE4M19kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsteyYjMzI7
LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4Ni1kc2kmcXVvdDssDQom
Z3Q7JiMzMjstJiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE4Nl9kc2lfZHJpdmVy
X2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsteyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90
O21lZGlhdGVrLG10ODE4OC1kc2kmcXVvdDssDQomZ3Q7JiMzMjstJiMzMjsmIzMyOy5kYXRhJiMz
Mjs9JiMzMjsmYW1wO210ODE4OF9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsteyYj
MzI7fSwNCiZndDsmIzMyOyt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0
ZWssbXQyNzAxLWRzaSZxdW90OywmIzMyOy5kYXRhJiMzMjs9DQomZ3Q7JiMzMjsmYW1wO210Mjcw
MV9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGlibGUmIzMy
Oz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE3My1kc2kmcXVvdDssJiMzMjsuZGF0YSYjMzI7PQ0K
Jmd0OyYjMzI7JmFtcDttdDgxNzNfZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0KJmd0OyYjMzI7K3sm
IzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxODMtZHNpJnF1b3Q7
LCYjMzI7LmRhdGEmIzMyOz0NCiZndDsmIzMyOyZhbXA7bXQ4MTgzX2RzaV9kcml2ZXJfZGF0YSYj
MzI7fSwNCiZndDsmIzMyOyt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0
ZWssbXQ4MTg2LWRzaSZxdW90OywmIzMyOy5kYXRhJiMzMjs9DQomZ3Q7JiMzMjsmYW1wO210ODE4
Nl9kc2lfZHJpdmVyX2RhdGEmIzMyO30sDQomZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGlibGUmIzMy
Oz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4OC1kc2kmcXVvdDssJiMzMjsuZGF0YSYjMzI7PQ0K
Jmd0OyYjMzI7JmFtcDttdDgxODhfZHNpX2RyaXZlcl9kYXRhJiMzMjt9LA0KJmd0OyYjMzI7K3sm
IzMyOy8qJiMzMjtzZW50aW5lbCYjMzI7Ki8mIzMyO30NCiZndDsmIzMyOyYjMzI7fTsNCiZndDsm
IzMyOyYjMzI7TU9EVUxFX0RFVklDRV9UQUJMRShvZiwmIzMyO210a19kc2lfb2ZfbWF0Y2gpOw0K
Jmd0OyYjMzI7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVw
bHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhl
ciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_009_719683841.157755325
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTAyLTE1IGF0IDA5OjUzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gQWxsIGVudHJpZXMgZml0IGluIDgyIGNvbHVt
bnMsIHdoaWNoIGlzIGFjY2VwdGFibGU6IGNvbXByZXNzIGFsbCBvZg0KPiB0aGUgbXRrX2RzaV9v
Zl9tYXRjaFtdIGVudHJpZXMgdG8gYSBzaW5nbGUgbGluZSBmb3IgZWFjaC4NCj4gDQo+IFdoaWxl
IGF0IGl0LCBhbHNvIGFkZCB0aGUgdXN1YWwgc2VudGluZWwgY29tbWVudCB0byB0aGUgbGFzdCBl
bnRyeS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+
IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgTWVyZ25hdCA8YW1lcmduYXRAYmF5bGlicmUuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTcgKysrKysrLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IGluZGV4IDE5NWZmNGRmYzNhMy4uYjY0NDUwNWRlOThh
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTEyMDQsMTcgKzEy
MDQsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRhDQo+IG10ODE4
OF9kc2lfZHJpdmVyX2RhdGEgPSB7DQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBtdGtfZHNpX29mX21hdGNoW10gPSB7DQo+IC0JeyAuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDI3MDEtZHNpIiwNCj4gLQkgIC5kYXRhID0gJm10MjcwMV9kc2lfZHJpdmVy
X2RhdGEgfSwNCj4gLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kc2kiLA0KPiAt
CSAgLmRhdGEgPSAmbXQ4MTczX2RzaV9kcml2ZXJfZGF0YSB9LA0KPiAtCXsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTgzLWRzaSIsDQo+IC0JICAuZGF0YSA9ICZtdDgxODNfZHNpX2RyaXZl
cl9kYXRhIH0sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODYtZHNpIiwNCj4g
LQkgIC5kYXRhID0gJm10ODE4Nl9kc2lfZHJpdmVyX2RhdGEgfSwNCj4gLQl7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4OC1kc2kiLA0KPiAtCSAgLmRhdGEgPSAmbXQ4MTg4X2RzaV9kcml2
ZXJfZGF0YSB9LA0KPiAtCXsgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Mjcw
MS1kc2kiLCAuZGF0YSA9DQo+ICZtdDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ICsJeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwgLmRhdGEgPQ0KPiAmbXQ4MTczX2RzaV9k
cml2ZXJfZGF0YSB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRzaSIs
IC5kYXRhID0NCj4gJm10ODE4M19kc2lfZHJpdmVyX2RhdGEgfSwNCj4gKwl7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4Ni1kc2kiLCAuZGF0YSA9DQo+ICZtdDgxODZfZHNpX2RyaXZlcl9k
YXRhIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtZHNpIiwgLmRhdGEg
PQ0KPiAmbXQ4MTg4X2RzaV9kcml2ZXJfZGF0YSB9LA0KPiArCXsgLyogc2VudGluZWwgKi8gfQ0K
PiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19kc2lfb2ZfbWF0Y2gpOw0KPiAg
DQo=

--__=_Part_Boundary_009_719683841.157755325--

