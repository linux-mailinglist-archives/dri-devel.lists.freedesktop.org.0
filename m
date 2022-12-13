Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987DC64B748
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAAB10E328;
	Tue, 13 Dec 2022 14:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358C510E328
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:23:44 +0000 (UTC)
X-UUID: 48c62f68504744d799386cf80f4d32a3-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=t+Gtktw4ZoVzO2Iy411X5k7J+W/PPbhYrfiR9BopFh4=; 
 b=b9Ptpc/rVEeLF/eT2l4k3QGdDJW/8NMT+ydpS0BnG3BPQ5QNYzTUFMkQJT0vKa8vEnINMY5ZV9qTGpvUfpX8JycPjflBljmW/94uNGf5HmmNku064Zo8YtWWZuZQnCBEiFDoj1WGPebaDnHwRtEEX6yL8MoZp1v8QudZ9eBL3I4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:0d0a5a5a-33b1-48ce-af4b-c0e591c0023f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:ebad2a25-4387-4253-a41d-4f6f2296b154,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 48c62f68504744d799386cf80f4d32a3-20221213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 689476558; Tue, 13 Dec 2022 22:23:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 13 Dec 2022 22:23:34 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Tue, 13 Dec 2022 22:23:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqQClmiRGGXG96Y6RZl/X9qWJUD1fmnbiD5MWSR0Ckyz5zlFouEWTWhD7QrSf25va8S0aQRmbt40zCziJ0j4ryRa7FWv/AQ+SJDLTc77ktA6N9iUAoRypJb8bTRXGQ9Kl2IkUhgE8csOcGe8QdpNWmoaAcU7JYjftyk5HlP4hQoOylK0mip0vYGIjXC5YA5wWHSxd+ccxcSoRysVS9XqjiWN9KUBTkz7NUF/CfTxH7cDJMJuPo3axFkS72ELrB2D+osFB/kmzgstgyFumCCePqlOEzyRkjizgzfwdh/9AOGKktTH1qaslq6yTDA2jyYHTuFM7T5f2GoV5NRdLTCb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t5upXJEVKmjQUKnksk+mbp4FHD7k0hV1SItK3hVnXA=;
 b=dkBBN/MVHVABB3EjyU+AUz+qqG/eKaR0i00HjZSwD7p8Fy6iBg9rWyh42fzt1mRJguVtYUzIxPMsy51Bx2Rvv35Z19ieFssFO5dmJ5r/k89aWzfZQDEP43m+8fxt2eDC8Hx2MshBrUHAdzq1KYOIQEFAEzHgdJfRSV55C2wU4bundX0HMf892jIJlQ7alpzdQ8OWEBR3rHxUNg6/4CdMEeDwVk7c2b1aTArcS+9tnKEUTKoZXB4BlkT8NiChpi4C/8lL4t1V43xVuaBnRuJLR95gg41DQsJLRN4XoBjxyu3kTbGUnxKOhXWQPDSaBBvacJlzJi4W+J8RVpYqOb/RnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t5upXJEVKmjQUKnksk+mbp4FHD7k0hV1SItK3hVnXA=;
 b=cNbhI7Sef9r6XUo6ONBfzuhroWy7mFwi1QbL0IlKW17+xLD2AAF3FqC9zJqYdWM/G8eIY7UF+OTlrh46NDLbZyv5iAtHp1IItkQE3xrgAJ5i2rK+GnkBIAayflMzoh4R0Nybu4bapbCTQ849I3RMGlrQ8Qdvu2S1dThu4opefg4=
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com (2603:1096:803:49::13)
 by PUZPR03MB6886.apcprd03.prod.outlook.com (2603:1096:301:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 14:23:32 +0000
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f]) by PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:23:32 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQCAAbf+AIAC/qmAgAAE8QCABeevAIAAKsUAgAy4s4A=
Date: Tue, 13 Dec 2022 14:23:32 +0000
Message-ID: <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
In-Reply-To: <Y43e+EsNCrCpZSIH@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB3384:EE_|PUZPR03MB6886:EE_
x-ms-office365-filtering-correlation-id: 9433ab08-911a-4628-b998-08dadd159cff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dsn+b5SrYoOSrHQ/Isg5Kgl887FFiODvM9SCtNADbUgWM7AMKzK5j9d9yd8tRaUL3jWiz9JEj2RqVF8juqldDLlWxwpWcibOD9D5cugpVpstWNQv6qHygDEwzspqK/VpRdRpcJZXHyx/BnywjBRtiTaB5vANc1qI/2Yf28F+a7kn5TUNWgsEkbYeIASouGp1TaXdFGBsDWax45+CqjchtONRjVl42mMVZsiLlBinAZyZ86knI83ycuA5XtPgi6zk/i7bFg/l4UzOibNO8sS3e1YvSwnN83idGoG90QVDYVFwf3cSyCfGK3yjMpMVstMXZZN6GZcKr4FvPcri4Y6sCb/VOtQVOLRpWlUi1T8xWeVY9XD9nGoBP4VY/RLpai8oQA4bZQmPpil4KhH5GwB1e6LEl2CSTM+jYET9UpIEafqhLEPhI9XBXo1iUF7nYXoGyr9OcIsEc8p/rM0cEDb/9KBNWiKR0HV4C/kycOG63Km3YapSxzHquHAMZKa+QjYYhH3Mlz5mEM94+Fm9IkMAYeyIOHf7I1nrYBFIxWQHt44rZ/EyoRstD5Y4+K83TVfKN6gsnOCEgSXDIMNRcAU5NRNJbwZslvScp29DMk5SpCkiSRdQopZQJYC5CVpEviw2aIePks4tWrFwYYtl8+J7RZV9LGajZW/2UeyjmafIwicZlsIvI9vC6Nz/nv267uWDTrtKXZWxPOamJKhNJe5pLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR03MB3384.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(41300700001)(36756003)(5660300002)(85182001)(38070700005)(7416002)(8936002)(86362001)(6512007)(26005)(71200400001)(478600001)(6486002)(76116006)(54906003)(6506007)(64756008)(91956017)(66946007)(66446008)(8676002)(66556008)(66476007)(4326008)(316002)(6916009)(83380400001)(38100700002)(122000001)(2906002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3FQaXQrNzFTclRiMVduR01WZVE1OTBHa2hJbGdmVHppZEcxdDlSSElYYjZq?=
 =?utf-8?B?ak80QUZqaHA0SjlxTFJqUUg4YmppYnZ0VW9QaC8vMjRFaFRvaTl0YjI1RHBM?=
 =?utf-8?B?elVhZkhWS1B2ZVRCYXRXaFV1NUc4T3RJTWkzK2ZMR0J3RVQ5TktOTC90NjdT?=
 =?utf-8?B?WmhRNmpDSGJ2MmxWT1l6ZkpnRGJycWh3MklEd1dDOFlmWUUzSk43L1VQL2pa?=
 =?utf-8?B?NlN0REpwdGp0TjJaczFuSE0zYXdwNzZLQVBqVlk0b0FmWlpMK2JYbjR5c09s?=
 =?utf-8?B?MHdnaGlBWTI1bnkyaXh1KzY4ajZUa2cxZ0VJSE1MYnVNVDVTNnB5S3dCemJh?=
 =?utf-8?B?eGRIU253TWhXY2xMbm1oZEsvS1FMVnBjRStaejUyNXA3aUZnK2pla0x3dlZj?=
 =?utf-8?B?Q2k4a2UybDdjaXp3cWxwWlc3VnRGTTBqQnducUZydDJ1djJuakdUSDlOSUpB?=
 =?utf-8?B?M3FQWjVSR1pqY05PaTROd25FL2RidWlXT2d6YU1vL2dybFNPL1ZQdVVVYXdp?=
 =?utf-8?B?SlNFREoydVZyY3VJYXQyWHBtTkF6d1M2UnRuNVJ4NWt6b08zS3hQa1NPZHV1?=
 =?utf-8?B?RFBNZlJwK0Zja0xYWFM1QXZwLytCY2p0OFlaOGJ1VDVaS0FWUG5yaWFzNHJr?=
 =?utf-8?B?bUlyRkhkV3FWTUxkcElNdjN3NWp3NlpuUXAzV3hmdURPaWp1Z2NhRU5IWFVo?=
 =?utf-8?B?cWhMRXJDL3dETUlraWhBWXZNQ1lDZHJyK3lBbEZxWnh2UjJSUmtqV3lQZDlt?=
 =?utf-8?B?akc2cEVPcmdLZjI0RXBFOFhDak5MMlE3a21zQUJjTzEvMCs2M29mZlFEdWVR?=
 =?utf-8?B?dENMNit0akRLWGNnWHRVOC9RSHd3bjE0MmoxMGJpc2xYZ25lb2d1S1FFZGl4?=
 =?utf-8?B?Q3REc3d3OUVDWHQ5M3VyV2xoS3lYS0JwUS9pc2w2YnpKNWRMVFVGWkdlK2tI?=
 =?utf-8?B?dXpsNVFEZHV6Vm5GQXhGS1pFQXE3cEpMQzY3N0hSa3RXN0xLcG5uaVZLRUNJ?=
 =?utf-8?B?MUJFZmhBb1JRS1h6dXpLa3NWMmVsVGVjeUdXUkxaREdVSVZCQXZaNW5RYXVH?=
 =?utf-8?B?WCtKSU9hbGxQTVlXK1hXL1BFeCszWHlDb3YvT001UWttOUNvU0l0MDFPZ2o2?=
 =?utf-8?B?Z1ZuNm5lZGsremNRT3lMYmFkUnN6SWhpcStyT2N2UmJqM3BsWnRRUnRTREFs?=
 =?utf-8?B?eXlMMWFERlhLUkFrV2hpNGlCSWltNCswN08yejU1ZlJaS202RHRlRksrTXBn?=
 =?utf-8?B?SzY2NEhldytXVHJNMkJ3a1Z0TEw2TThja1RBT3F5MjQ4UXpwSkErVGdDU1Iz?=
 =?utf-8?B?dG1pOG5uWGw5c3pGVFBFU1NkWEs0anNXQUxKSlJmeUcweDVlbkxBU0tpd2N2?=
 =?utf-8?B?VXFjYy90UXdQSUs1cU93OUI3MFNQdmlRZ3BjQzhZMitNUUljWFN2N292U2hV?=
 =?utf-8?B?ZmEvV2htamcxLytxNE5lbElRMFR6aHFtWDllRVRxRWtsUndPbGxqeGRNc2xx?=
 =?utf-8?B?WHhzdDRIeFcrQ3dkT2NzMlVwVlNWRmFiRUxlelA0MGphTlBabmFIV05CaW9T?=
 =?utf-8?B?K1J2U3FPaXJPY0NxKzh2UGszV0E1OEplc3dRQjM4NisrYlpyemZnTW1MKzJY?=
 =?utf-8?B?a1grUmNhSTZoZ1dZZjljWXVhWGg1SUMrd0ZNRHFoSjlNb0Eza3BMdWJvTmxn?=
 =?utf-8?B?UUcwcnYrSGdtNDMrc2dyeHlIOEhHYzNhMWZVZjhyeUdyc3d5YURab2F0MW1L?=
 =?utf-8?B?RDk0TFIwdXJLbitUNmpXdDFjVEtDWjZibDBXczA2YldtT3krMHNtZ2U5Tjkx?=
 =?utf-8?B?Z2JKS1F2WHdoVCtDRGpJVnJtR2tlMXg5Q0xSUm5XenBBb1FsWk1iditzbU8v?=
 =?utf-8?B?ODQ3UWphc3ZjbU5vNk5QeTZ0MFB1WStWcEc0Z1hJKzhOMFMrTkhwb0l4Vk9s?=
 =?utf-8?B?cmR6b2I4NUlHeWJoQ2JqNC9FQnBBT1FGeVlWdzRLOXRIQ280V0l1NWpCVDc5?=
 =?utf-8?B?V2xZYVhheEhMVXdPUmxWM2hmWmtERTBWTFMyMHdYdHpXQm04VFhaeWsyMEpN?=
 =?utf-8?B?VDdBZW83VTNrTkFPakhzdmx2dS9vbVdCU2JxSGpGZVNGek1FL2VjdGlRbDU3?=
 =?utf-8?B?cERQZ0VjWG5kSGxvK216ZjZqV01PZjU2N3ZncTRWZVl2b1ZHY2hSWTE4NDNS?=
 =?utf-8?B?V2c9PQ==?=
Content-ID: <E896478E124A2C4E8EF51690A6EA8C90@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB3384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9433ab08-911a-4628-b998-08dadd159cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 14:23:32.4090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVkPx/SvT6WfTEexcN91irfV/088MTAUC/qmaO9vYnP9UQNmTiSfp1Mhlp8g6rD+6SzS1hNm7fZOaYhIkdwBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6886
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_698116934.704393101"
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_698116934.704393101
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIyLTEyLTA1JiMzMjthdCYjMzI7MTI6MDcmIzMyOysw
MDAwLCYjMzI7TWFyayYjMzI7QnJvd24mIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO01vbiwm
IzMyO0RlYyYjMzI7MDUsJiMzMjsyMDIyJiMzMjthdCYjMzI7MDk6MzQ6MTdBTSYjMzI7KzAwMDAs
JiMzMjtKaWF4aW4mIzMyO1l1JiMzMjsoJiMyMDQ0NjsmIzIzNDc4OyYjMzc5OTU7KSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOzEuJiMzMjtJJiMzMjtoYXZlJiMzMjth
ZGRlZCYjMzI7YSYjMzI7REFQTSYjMzI7d2lkZ2V0JiMzMjt0aGF0JiMzMjtpcyYjMzI7JnF1b3Q7
U0RCJnF1b3Q7LCYjMzI7d2hlbiYjMzI7d2UmIzMyO29wZW4mIzMyO29yJiMzMjtjbG9zZQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7SERNSQ0KJmd0OyYjMzI7Jmd0OyYjMzI7UElOX1NXSVRDSCwmIzMyO3Ro
ZSYjMzI7Y2FsbGJhY2smIzMyOyYjMzk7aGRtaV90eF9ldmVudCYjMzk7JiMzMjtyZWdpc3RlcmVk
JiMzMjtpbiYjMzI7dGhlJiMzMjt3aWRnZXQNCiZndDsmIzMyOyZndDsmIzMyO3dpbGwNCiZndDsm
IzMyOyZndDsmIzMyO2JlJiMzMjt0cmlnZ2VyZWQuJiMzMjtNYXliZSYjMzI7eW91JiMzMjttZWFu
JiMzMjtJJiMzMjtzaG91bGRuJiMzOTt0JiMzMjt1c2UNCiZndDsmIzMyOyZndDsmIzMyO1NORFJW
X1BDTV9UUklHR0VSX1NUQVJUDQomZ3Q7JiMzMjsmZ3Q7JiMzMjthbmQmIzMyO1NORFJWX1BDTV9U
UklHR0VSX1NUT1AmIzYzOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtObywmIzMyO0kmIzMyO21lYW4m
IzMyO3RoYXQmIzMyO2lmJiMzMjt5b3UmIzMyO3dhbnQmIzMyO3RvJiMzMjtjb250cm9sJiMzMjt0
aGUmIzMyO2VuYWJsZSYjMzI7YW5kJiMzMjtkaXNhYmxlJiMzMjtvZiYjMzI7dGhlDQomZ3Q7JiMz
MjtvdXRwdXQmIzMyO3BhdGgmIzMyO3lvdSYjMzI7c2hvdWxkJiMzMjtpbXBsZW1lbnQmIzMyO2Em
IzMyO0RBUE0mIzMyO3dpZGdldC4NCiZndDsmIzMyOw0KTWF5JiMzMjtJJiMzMjthc2smIzMyO3do
aWNoJiMzMjtkcml2ZXImIzMyO2ZpbGUmIzMyO3RvJiMzMjthZGQmIzMyO2EmIzMyO25ldyYjMzI7
REFQTSYjMzI7d2lkZ2V0JiM2MzsmIzMyO0lzJiMzMjtpdCYjMzI7dGhlJiMzMjticmlkZ2UNCmlj
JiMzMjtkcml2ZXImIzMyO2xpa2UmIzMyO2l0NjUwNS5jJiM2MzsmIzMyO09yJiMzMjtpcyYjMzI7
aXQmIzMyO2xpbmtlJiMzMjt0aGUmIzMyOyZxdW90O1NEQiZxdW90OyYjMzI7YWRkZWQmIzMyO2lu
JiMzMjt0aGlzJiMzMjtwYXRjaCYjNjM7DQoNCiZndDsmIzMyOyZndDsmIzMyOzIuJiMzMjtJZiYj
MzI7SSYjMzI7ZG9uJiMzOTt0JiMzMjt1c2UmIzMyO2hjZC5vcHMtJmd0O3RyaWdnZXImIzMyO25v
dGlmaWVzJiMzMjt0aGUmIzMyO2JyaWRnZSYjMzI7aWMmIzMyO2RyaXZlciYjMzI7dG8NCiZndDsm
IzMyOyZndDsmIzMyO3N3aXRjaCYjMzI7dGhlJiMzMjthdWRpbywmIzMyO3doaWNoJiMzMjtvcHMm
IzMyO3Nob3VsZCYjMzI7SSYjMzI7dXNlJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyO0kmIzMyO2Fj
dHVhbGx5JiMzMjt3YW50JiMzMjt0byYjMzI7a25vdyYjMzI7aGRtaS1jb2RlYy5jJiMzMjthbmQm
IzMyO2l0NjUwNS5jJiMzMjtleGNlcHQNCiZndDsmIzMyOyZndDsmIzMyO2hkbWlfY29kZWNfb3Bz
LCYjMzI7aXMmIzMyO3RoZXJlJiMzMjthbnkmIzMyO290aGVyJiMzMjt3YXkmIzMyO3RvJiMzMjtj
b21tdW5pY2F0ZSYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0xpa2UmIzMyO0kmIzMyO3NhaWQm
IzMyO3lvdSYjMzI7c2hvdWxkJiMzMjt1c2UmIzMyO3RoZSYjMzI7ZXZlbnQmIzMyO29uJiMzMjt0
aGUmIzMyO0RBUE0mIzMyO3dpZGdldC4mIzMyOyYjMzI7VGhpcyYjMzI7d2lsbA0KJmd0OyYjMzI7
cmVxdWlyZSYjMzI7cHJvdmlkaW5nJiMzMjtvcGVyYXRpb25zJiMzMjtmb3ImIzMyO3RoZSYjMzI7
ZXZlbnRzJiMzMjt0byYjMzI7dGhlJiMzMjtkcml2ZXJzLg0KWWVzLCYjMzI7SSYjMzI7c2hvdWxk
JiMzMjthZGQmIzMyO2EmIzMyO25ldyYjMzI7c2V0JiMzMjtvZiYjMzI7ZXZlbnRzLCYjMzI7c3Vj
aCYjMzI7YXM6DQoNCmVudW0mIzMyO3sNCiYjMzI7JiMzMjsmIzMyOyYjMzI7SERNSV9DT0RFQ19U
UklHR0VSX0VWRU5UX1NUT1AsDQomIzMyOyYjMzI7JiMzMjsmIzMyO0hETUlfQ09ERUNfVFJJR0dF
Ul9FVkVOVF9TVEFSVCwNCiYjMzI7JiMzMjsmIzMyOyYjMzI7SERNSV9DT0RFQ19UUklHR0VSX0VW
RU5UX1NVU1BFTkQsDQomIzMyOyYjMzI7JiMzMjsmIzMyO0hETUlfQ09ERUNfVFJJR0dFUl9FVkVO
VF9SRVNVTUUsDQp9DQoNClRoZW4mIzMyO3Byb3ZpZGUmIzMyO2hhbmRsZXMmIzMyO2ZvciYjMzI7
dGhlc2UmIzMyO2V2ZW50cyYjMzI7aW4mIzMyO3RoZSYjMzI7aXQ2NTA1JiMzMjtkcml2ZXIuJiMz
MjtBbSYjMzI7SSYjMzI7cmlnaHQmIzYzOw0KDQoNClRoYW5rcywNCkppYXhpbi5ZdQ0KDQo8L3By
ZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSBy
ZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0K
aW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQg
YWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlz
IGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_698116934.704393101
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIyLTEyLTA1IGF0IDEyOjA3ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIERlYyAwNSwgMjAyMiBhdCAwOTozNDoxN0FNICswMDAwLCBKaWF4aW4gWXUgKOS/nuWu
tumRqykgd3JvdGU6DQo+IA0KPiA+IDEuIEkgaGF2ZSBhZGRlZCBhIERBUE0gd2lkZ2V0IHRoYXQg
aXMgIlNEQiIsIHdoZW4gd2Ugb3BlbiBvciBjbG9zZQ0KPiA+IEhETUkNCj4gPiBQSU5fU1dJVENI
LCB0aGUgY2FsbGJhY2sgJ2hkbWlfdHhfZXZlbnQnIHJlZ2lzdGVyZWQgaW4gdGhlIHdpZGdldA0K
PiA+IHdpbGwNCj4gPiBiZSB0cmlnZ2VyZWQuIE1heWJlIHlvdSBtZWFuIEkgc2hvdWxkbid0IHVz
ZQ0KPiA+IFNORFJWX1BDTV9UUklHR0VSX1NUQVJUDQo+ID4gYW5kIFNORFJWX1BDTV9UUklHR0VS
X1NUT1A/DQo+IA0KPiBObywgSSBtZWFuIHRoYXQgaWYgeW91IHdhbnQgdG8gY29udHJvbCB0aGUg
ZW5hYmxlIGFuZCBkaXNhYmxlIG9mIHRoZQ0KPiBvdXRwdXQgcGF0aCB5b3Ugc2hvdWxkIGltcGxl
bWVudCBhIERBUE0gd2lkZ2V0Lg0KPiANCk1heSBJIGFzayB3aGljaCBkcml2ZXIgZmlsZSB0byBh
ZGQgYSBuZXcgREFQTSB3aWRnZXQ/IElzIGl0IHRoZSBicmlkZ2UNCmljIGRyaXZlciBsaWtlIGl0
NjUwNS5jPyBPciBpcyBpdCBsaW5rZSB0aGUgIlNEQiIgYWRkZWQgaW4gdGhpcyBwYXRjaD8NCg0K
PiA+IDIuIElmIEkgZG9uJ3QgdXNlIGhjZC5vcHMtPnRyaWdnZXIgbm90aWZpZXMgdGhlIGJyaWRn
ZSBpYyBkcml2ZXIgdG8NCj4gPiBzd2l0Y2ggdGhlIGF1ZGlvLCB3aGljaCBvcHMgc2hvdWxkIEkg
dXNlPw0KPiA+IEkgYWN0dWFsbHkgd2FudCB0byBrbm93IGhkbWktY29kZWMuYyBhbmQgaXQ2NTA1
LmMgZXhjZXB0DQo+ID4gaGRtaV9jb2RlY19vcHMsIGlzIHRoZXJlIGFueSBvdGhlciB3YXkgdG8g
Y29tbXVuaWNhdGU/DQo+IA0KPiBMaWtlIEkgc2FpZCB5b3Ugc2hvdWxkIHVzZSB0aGUgZXZlbnQg
b24gdGhlIERBUE0gd2lkZ2V0LiAgVGhpcyB3aWxsDQo+IHJlcXVpcmUgcHJvdmlkaW5nIG9wZXJh
dGlvbnMgZm9yIHRoZSBldmVudHMgdG8gdGhlIGRyaXZlcnMuDQpZZXMsIEkgc2hvdWxkIGFkZCBh
IG5ldyBzZXQgb2YgZXZlbnRzLCBzdWNoIGFzOg0KDQplbnVtIHsNCiAgICBIRE1JX0NPREVDX1RS
SUdHRVJfRVZFTlRfU1RPUCwNCiAgICBIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1RBUlQsDQog
ICAgSERNSV9DT0RFQ19UUklHR0VSX0VWRU5UX1NVU1BFTkQsDQogICAgSERNSV9DT0RFQ19UUklH
R0VSX0VWRU5UX1JFU1VNRSwNCn0NCg0KVGhlbiBwcm92aWRlIGhhbmRsZXMgZm9yIHRoZXNlIGV2
ZW50cyBpbiB0aGUgaXQ2NTA1IGRyaXZlci4gQW0gSSByaWdodD8NCg0KDQpUaGFua3MsDQpKaWF4
aW4uWXUNCg==

--__=_Part_Boundary_005_698116934.704393101--

