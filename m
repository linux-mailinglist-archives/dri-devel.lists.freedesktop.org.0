Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1B7E185E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 02:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273E410E24C;
	Mon,  6 Nov 2023 01:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D322710E24C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 01:36:18 +0000 (UTC)
X-UUID: df6510687c4411eea33bb35ae8d461a2-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=9n7zI1jlbrZI7swq41S6eDQH9C4zemyZn/cLAtzOTwg=; 
 b=tSf5c/3zVAU2cCNOphcaAYv4ymCMQkpl2pvWBk7woadelc9KeTfUTD2J6+Y+jd/nViyXypQCxJy3sdriy/I6iiEOwpH+d+TaH9a/rMZbgOO021i5kzHLvMRg6bVJy9qpaQoCvsx4W5U4Mg9VISWKl8aP9pyXlBsIQuvkpx6FLYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:26c7bf11-f43c-4fc2-b14b-d53d92698675, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:13b7b55f-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: df6510687c4411eea33bb35ae8d461a2-20231106
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 848050395; Mon, 06 Nov 2023 09:36:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 09:36:13 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 09:36:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcSU02iwsWOBdr25EfQK44KUQ+iQktWMQBJcPcGWl7kExl3GpKW62dNtyk6dCkUzcH3AqIK8jvShinjvjgovCR5gaa9DU+b4eymBDx9qTttQ66kElxm0BfLOS8f+UnBr2tcpjhvjIFEYDqxa1EwCfNOBE+zdHZXEG7aEcKy9qo7Sl/3GB/LOEX7zzwbSMH/OMh8J8ZIPJ5MbkZIKoo6VrsUWtXOfG1dx7K9PRj15LUMfMko10/BpPQW4vTITsMdHyy7vrl77hKL3t5WA++Oh3JtHxM0/FtTlC//SrpRxFfZfokKhQfQu3PSKqT7Xxv+BOZSnyuw0RRgHpkkaFk3Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WLtff3RTjo3DHyKJzEfY4amHpw4lT/cif0vmvXTK0g=;
 b=DXfufPePU0wxfXqEGGAY0Ot+RJJ07nX07qdLsRAw60UNAFh34F1cwKTYx1d7mb5On3e4mZ5iKqWZIIccJQ4e218H9YSG0GnHxOwFwab2nnRVcpzDcPpCwz7mhJAm0qrxM2gzhq6ZxJhABvS2jtzGUELV6rD8F6RmFmz3Jx77DpkmAeHTphcLdVc9LrpcTFE6cgjd/KHsZJAUzkWG5m89rDNyTyz0XnTXOdbx5uiThMoHIhoI70knNJQe1b9alI1oSORlWGTH2pD+R0IhGKE4MWGARnwCQS1cshfgcirDxq++GE7eI2mBiV4X7ZGgT99ykbTXBWiMu9xBlTGLHCo/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WLtff3RTjo3DHyKJzEfY4amHpw4lT/cif0vmvXTK0g=;
 b=M5TnqJVjUyLXeQZDJfto51SVn0xEKQ1/6FMdf1fiYn14s4yh3qkHHoEFNTQfVFNcChSPlG26Hr8rE02HBbXNzNw2DnuWMICV/2yufgdEml8Kb+jwBO0mUHiP2uwdYcvAotF6ZFlUZYBsnr5okbtd0p9ZJ9+sGGwn/4wSWOU8Fic=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8314.apcprd03.prod.outlook.com (2603:1096:101:19d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Mon, 6 Nov
 2023 01:36:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a4e1:1557:a3fe:c252%4]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 01:36:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Topic: [PATCH v2 10/11] drm/mediatek: Add cmdq_insert_backup_cookie
 before secure pkt finalize
Thread-Index: AQHaBWv+PhA/HnZqn02pJP46ox1LtLBbXOuAgBByPACAAMk5AA==
Date: Mon, 6 Nov 2023 01:36:06 +0000
Message-ID: <cde7fe7dd8e7b26954c1cdfb132d9aa1b6f51745.camel@mediatek.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-11-jason-jh.lin@mediatek.com>
 <7e856cd887d2f0319810f9b3ec50f9f5a52a8147.camel@mediatek.com>
 <393154d13115196fde483cc840393719a8844fc1.camel@mediatek.com>
In-Reply-To: <393154d13115196fde483cc840393719a8844fc1.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8314:EE_
x-ms-office365-filtering-correlation-id: 558e4e49-4ca7-4b90-5565-08dbde68bf39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BLFhjDUDBwmHIGvx1TIe0oDz2A/p6QVivtU+g/RE6bm0aExAM0LLj8vTXaRmKQ5W60F3IctfajbaYWTtxc54m4Vvd6Ji0Nz3G08ukeWF6YuIdDwNSXD24b3w8XmatfwWODtDvHWkEjyRjoaTzcVJnZeVbwDePpebyM+9KkPiyeXOtrTa5vXkK2HltpjiqlO5c1pEGzsyKhnadUoU6RPV273ZBTRmXhI5La25rxj5pfXJ/zWzneJyM9rytwWaE1KZFV5OyzGeaoZqRLdIRzmkWfLuqdQSMbsIwlQqeOju++B4W9xVpInoLWKHvP9iGLZLf4nicLOr/NKE+SE2GBMJkuU5VWGIJwnnnQQvHTGGLpZ0zoCjmzpNbI8XsHM+wMvw82O8Keu6pYVlk9WIkStaQiUBj57n/UeDSddrHnjskjnrO1uKgHLWDZ72hZgg2i6ktShF9vTeXSJEGP4GfqrQH+gpsX4g6txqH8A6DM3OTMtOpyoq51FMNs6Z7Wgz02Y1/olA1NpzgcofOOw1ahQ0V1Rgo7rfGyy1EY028Qi0r8oNE21SW8bNkxhs5XiJnDJsqXl5+SHaFxrxmk++xU16SmaYocV0DMjBmVhr8ZfP140uy980UrTdHVIFeWDUIsoReOwN7mEDtxbKjs2Hd8IdI0DlVJYpKj82vaX/MDajfWY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(41300700001)(4001150100001)(7416002)(5660300002)(38100700002)(6506007)(64756008)(86362001)(36756003)(76116006)(66946007)(54906003)(85182001)(66556008)(66476007)(2616005)(110136005)(122000001)(26005)(6486002)(6512007)(71200400001)(478600001)(66446008)(83380400001)(316002)(38070700009)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b051VUVkTXdNb0FSOHQwNnQ2MHlIUUJ1QmE4Q3lNTzUyNGgrSDR3OTYwRHB4?=
 =?utf-8?B?KzZFS2RKNlIzQkJKQXJIY1RkV2tsSnpocHVBZzhLcGpkaGYySzJsSzAzb3Ft?=
 =?utf-8?B?M1FiTDdvUldCT2RyWDhrbys1Y2lsV0VtZW1mY0hWQVRVRC9rVDRCN3NIVWR3?=
 =?utf-8?B?MVNWbHNjTXJpQXBuZXhNRDJCUVZRWlEvU0VQaFpHa1JUYW55L2NyZTMrZkRj?=
 =?utf-8?B?Y3hPc0Z2T2dISENrelZOZzFyVVAxRnN5NkhReW5qRkVvN0tQM3NYNXJuTFlx?=
 =?utf-8?B?OGJwemQ3WXlhSm1lWG5CbXY3K2hIUUV4QitmeTBrbWNZYm55UHpaWWlhbEN0?=
 =?utf-8?B?KzU1ZnR0WjlDQXRnN3FhaTR6YThmY3Zwd2VvR01TNnpGVHNlNXBscERCT3N3?=
 =?utf-8?B?Rk1zbW13d2lrMWVsTnVOVVcyanE2aTc2c3l1Vy9xQXpVR053RDJSeWNjWXJz?=
 =?utf-8?B?OG5La2J3RHNYR0FlKzFhZVNobGE1NmNZQlA5RUhNemtNRHpOWW90ME1GZGFR?=
 =?utf-8?B?QkFMbllUMHZLU2NSbGRxbCtWZ1RqUlF0UDg0ZFY3TGJMb0xuWGNiTFd1RHhV?=
 =?utf-8?B?TlYzeC9xSXBuS1VlVkxTRmU5RG1rTTRBQUFTNnF1Z0JFb3c0M2dOSTIwUThI?=
 =?utf-8?B?T2lCZmQ1Ulo4WlRnNDJJcUVMa2RaSTcvaDJTeWExdWExYkZGalFiTW43RUhw?=
 =?utf-8?B?b3pyWE9mbU1jY3luZFhHUURzMHlJTDNJZXVHZjZwM3ZHZHVHd2hpZ1EwNFdI?=
 =?utf-8?B?UWVEa0dGLytqMWlFNEl5bUFmUU90NXMySTByajNkUHZjcktzRlQ2UG42YVFI?=
 =?utf-8?B?QzhTV2ppMlB0SjR3SzVRTEJKd0szd2p3MDZlTGxoWFNkUWVSbVJyUnpwYkw5?=
 =?utf-8?B?dEs0OEZBL2ZHZExxSTRZZGhoV3k3Nyt2RkRoR29vZklzdnZZSTVIOTZONUhh?=
 =?utf-8?B?L29SZ2FsNVVWUk9qSnRVb3F6dG4xMnZ1enZuVHMwYVMxa003YjBQTzhySHBx?=
 =?utf-8?B?TEIzclF2OUMzTmJKaW4vUk9rSGxXd2RDeVBsL0NjalZVdXM0R1JlY2Y4bGY0?=
 =?utf-8?B?UXJIeTJUUHEvczZpUGNYZWp6WTVsa3QvT1IwcmM1akQ5eFZ3WWVGNUZ0TDZa?=
 =?utf-8?B?YnlpYmtmVTlBb25HMDdpWUs1aUJ2ZkMwRGc0SEoyczlwT3BkbjBYbitzTjdk?=
 =?utf-8?B?Tk91eHBJNXVha3hZQ25RQ3h1YTRESmJUT3lZVm1aQ0MxaFc3enU2SkJRa3FM?=
 =?utf-8?B?cUI1clh4SjNIbGJhbmhLVUQ4d0N0T3U2V1FrMFR2UndqS2JKTVlMbkhEUDlP?=
 =?utf-8?B?UElXM0J1TEFzYmJuQlV1SGR0MFJocUU4RXBObDNMT0pONkQ3S0d1aTVPYnIx?=
 =?utf-8?B?TjIzQWgwRnQ2L0pZWGo3dklsTnNHeWpPUzVWWnBzWFBpYWhBVytzU1doQVMr?=
 =?utf-8?B?VDBzeEUxOU9uakhhUktwNldscVRMZWs0NGxTbG42ZldERlYzR2lwa0pMOEpB?=
 =?utf-8?B?N0FoMDNmQ3cyK1d0MWVkYnZPV2NVQkorUE56MW5JdXF5aW5ObmorcGVzaWw1?=
 =?utf-8?B?cmVZM010bGdoVHpNUXFzTGd4b084cUhEWU9JSE1VSW9wK3gzbmExcHhSQkli?=
 =?utf-8?B?Rzhkc00wUHBncGhzNkFZcTFUVHdDazA0UDIxUldTczZvNGNMdU5SRVNTTVpK?=
 =?utf-8?B?eWI4b3dPSlVqcnFtdm5tb0NWZHZTMWp6ZEJYb3M0RGhBdjAyUzlCc1RoMnJh?=
 =?utf-8?B?RDl4VHl3eXdXaTV6anZJZlBwa0JEUVdSVzZtQWVWNkRSanNkWnlMRDZHcmFP?=
 =?utf-8?B?VTJsRmgyTlF4TUNORDYxNVFkbnBRYnViSHlxWXQ5MVB2Z1hhaTk0UW5iRTUr?=
 =?utf-8?B?TlVZVUQzczVUZ3ZtcHRlSlhiOVBwelRBaUFnZ1pJNTNoOU9zTEViNlFoNXpC?=
 =?utf-8?B?alZmUlEvTTJZbGxGWkNWRGplYkF1Y3duVUFzRUNhUkY3UlZtcnF6blk0aklV?=
 =?utf-8?B?aFJIaTMzY3VJbzJuMTBKdjJMSWxub2RMVW9hdGZKc0lFTG84cWdDRHRibkRK?=
 =?utf-8?B?RHJNaCt3OWRWVEljcFZZc25CcFcrUUhpN1FPOGExZHBXZHppTzdVb2FtYmJp?=
 =?utf-8?Q?hWrCMFCVg1B0yZDXX8JqZg200?=
Content-ID: <0D1281731CBE834DBF55A6DD7ED75FA4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558e4e49-4ca7-4b90-5565-08dbde68bf39
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 01:36:06.9179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JyDD/Ju8o0dzyvFZyhDuiVwelrVE7JcPH1/COxl8TfTzSE/Bfho4TWLFwezL784cPJOjl5tmdkM05uDmRB30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8314
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_244650715.290237938"
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
Cc: "jkardatzke@google.com" <jkardatzke@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_244650715.290237938
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtTdW4sJiMzMjsyMDIzLTExLTA1JiMzMjthdCYjMzI7MTM6MzUmIzMyOysw
MDAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7KCYjMjY1MTk7JiMzMDU5MTsmIzMxMDc3Oykm
IzMyO3dyb3RlOg0KJmd0OyYjMzI7SGkmIzMyO0NLLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtPbiYj
MzI7VGh1LCYjMzI7MjAyMy0xMC0yNiYjMzI7YXQmIzMyOzAyOjI2JiMzMjsrMDAwMCwmIzMyO0NL
JiMzMjtIdSYjMzI7KCYjMzI5OTM7JiMyMDQyNjsmIzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYj
MzI7Jmd0OyYjMzI7SGksJiMzMjtKYXNvbjoNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7T24mIzMyO01vbiwmIzMyOzIwMjMtMTAtMjMmIzMyO2F0JiMzMjsxMjo0NSYjMzI7
KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7QWRkJiMzMjtjbWRxX2luc2VydF9iYWNrdXBfY29va2llJiMzMjt0byYjMzI7YXBwZW5k
JiMzMjtzb21lJiMzMjtjb21tYW5kcyYjMzI7YmVmb3JlJiMzMjtFT0M6DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsxLiYjMzI7R2V0JiMzMjtHQ0UmIzMyO0hXJiMzMjt0aHJlYWQmIzMyO2V4
ZWN1dGUmIzMyO2NvdW50JiMzMjtmcm9tJiMzMjt0aGUmIzMyO0dDRSYjMzI7SFcmIzMyO3JlZ2lz
dGVyLg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Mi4mIzMyO0FkZCYjMzI7MSYjMzI7dG8m
IzMyO3RoZSYjMzI7ZXhlY3V0ZSYjMzI7Y291bnQmIzMyO2FuZCYjMzI7dGhlbiYjMzI7c3RvcmUm
IzMyO2ludG8mIzMyO2EmIzMyO3NoYXJlZA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7bWVt
b3J5Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJJiMzMjt0aGluayYj
MzI7d2hlbiYjMzI7Y21kcSYjMzI7ZHJpdmVyJiMzMjtoYW5kbGVyJiMzMjtpbnRlcnJ1cHQsJiMz
MjtpdCYjMzI7Y291bGQmIzMyO3NpbXBseSYjMzI7Y2FsbA0KJmd0OyYjMzI7Jmd0OyYjMzI7aW50
bw0KJmd0OyYjMzI7Jmd0OyYjMzI7VEVFJiMzMjt3aXRoJiMzMjthbiYjMzI7QVBJJiMzMjt0byYj
MzI7cXVlcnkmIzMyO3N0YXR1cy4mIzMyO1RoZSYjMzI7c3RhdHVzJiMzMjtub3QmIzMyO29ubHkm
IzMyO3RoZSYjMzI7ZXhlY3V0ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Y291bnQsDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtidXQmIzMyO2Fsc28mIzMyO290aGVyJiMzMjttZXNzYWdlJiMzMjtpbmNsdWRpbmcm
IzMyO2Vycm9yJiMzMjtpbmZvcm1hdGlvbi4mIzMyO1NvJiMzMjtpdCYjMzk7cyYjMzI7bm90DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtuZWNlc3NhcnkmIzMyO3RvJiMzMjt1c2UmIzMyO3N1Y2gmIzMyO25v
bi10cmlja3kmIzMyO3dheSYjMzI7dG8mIzMyO2dldCYjMzI7ZXhlY3V0ZSYjMzI7Y291bnQuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1RoZSYjMzI7cmVhc29uJiMzMjt3aHkmIzMyO3dlJiMzMjt1c2Um
IzMyO3NoYXJlZCYjMzI7bWVtb3J5JiMzMjt0byYjMzI7cmVjb3JkJiMzMjtleGVjdXRlJiMzMjtj
b3VudCYjMzI7aGVyZSYjMzI7aXM6DQomZ3Q7JiMzMjsxLiYjMzI7bm9ybWFsJiMzMjt3b3JsZCYj
MzI7Y2FuJiMzMjtub3QmIzMyO2FjY2VzcyYjMzI7dGhlJiMzMjtyZWdpc3RlciYjMzI7b2YmIzMy
O3NlY3VyZSYjMzI7R0NFJiMzMjt0aHJlYWQmIzMyO2luDQomZ3Q7JiMzMjtub3JtYWwmIzMyO3dv
cmxkLg0KJmd0OyYjMzI7Mi4mIzMyO2NhbGxpbmcmIzMyO1RFRSYjMzI7aW52b2tlJiMzMjtjbWQm
IzMyO2luJiMzMjt0aGUmIzMyO2lycSYjMzI7aGFuZGxlciYjMzI7d291bGQmIzMyO2JlJiMzMjtl
eHBlbnNpdmUmIzMyO2FuZA0KJmd0OyYjMzI7bm90DQomZ3Q7JiMzMjtzdGFibGUuJiMzMjtJJiMz
OTt2ZSYjMzI7dGVzdGVkJiMzMjt0aGF0JiMzMjthJiMzMjtzaW5nbGUmIzMyO1RFRSYjMzI7aW52
bG9rZSYjMzI7Y21kJiMzMjt0byYjMzI7Q01EUSYjMzI7UFRBJiMzMjtjb3N0cw0KJmd0OyYjMzI7
MTkmIzEyNjs1MyYjMzI7dXMuJiMzMjtNYXliZSYjMzI7aXQmIzMyO3dvdWxkJiMzMjtjb3N0JiMz
Mjttb3JlJiMzMjtkdXJpbmcmIzMyO3RoZSYjMzI7c2NlbmFyaW8mIzMyO3RoYXQmIzMyO25lZWRz
DQomZ3Q7JiMzMjttb3JlDQomZ3Q7JiMzMjtDUFUmIzMyO2xvYWRpbmcuDQoNCkFkZCYjMzI7dGhp
cyYjMzI7dG8mIzMyO2NvbW1lbnQuDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtPbmUmIzMyO21vcmUmIzMyO3F1ZXN0aW9uLiYjMzI7VGhlJiMzMjtj
b21tYW5kJiMzMjtidWZmZXImIzMyO2lzJiMzMjtub3QmIzMyO3NlY3VyZS4mIzMyO0RvZXMmIzMy
O3RoZSYjMzI7R0NFDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtoYXJkd2FyZSYjMzI7ZXhlY3V0ZSYjMzI7
dGhpcyYjMzI7bm9uLXNlY3VyZSYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiM2MzsNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtHQ0UmIzMyO2NvbW1hbmQmIzMyO2J1ZmZl
ciYjMzI7aXMmIzMyO2dlbmVyYXRlJiMzMjtpbiYjMzI7dGhlJiMzMjtub3JtYWwmIzMyO3dvcmxk
JiMzMjtmaXJzdC4mIzMyO1RoZW4mIzMyO2l0DQomZ3Q7JiMzMjt3aWxsDQomZ3Q7JiMzMjtiZSYj
MzI7Y29waWVkJiMzMjt0byYjMzI7dGhlJiMzMjtzaGFyZWQmIzMyO21lbW9yeSYjMzI7YW5kJiMz
MjtwYXNzJiMzMjt0byYjMzI7dGhlJiMzMjtzZWN1cmUmIzMyO3dvcmxkLiYjMzI7QWxsJiMzMjt0
aGUNCiZndDsmIzMyO2luc3RydWN0aW9uJiMzMjtpbiYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiMz
Mjt3aWxsJiMzMjtiZSYjMzI7dmVyaWZpZWQmIzMyO2luJiMzMjtzZWN1cmUmIzMyO3dvcmxkJiMz
Mjt0aGVuDQomZ3Q7JiMzMjt0aGV5JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y29waWVkJiMzMjt0byYj
MzI7dGhlJiMzMjtzZWN1cmUmIzMyO2NvbW1hbmQmIzMyO2J1ZmZlciYjMzI7YW5kJiMzMjtleGVj
dXRlZCYjMzI7YnkmIzMyO0dDRQ0KJmd0OyYjMzI7c2VjdXJlJiMzMjt0aHJlYWQuJiMzMjtJJiMz
OTtsbCYjMzI7YWRkJiMzMjt0aGlzJiMzMjtpbmZvcm1hdGlvbiYjMzI7dG8mIzMyO3RoZSYjMzI7
Y292ZXImIzMyO2xldHRlciYjMzI7YXQmIzMyO3RoZQ0KJmd0OyYjMzI7bmV4dCYjMzI7dmVyc2lv
bi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcw0KJmd0OyYjMzI7SmFzb24tSkguTGluDQom
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtD
Sw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_244650715.290237938
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIzLTExLTA1IGF0IDEzOjM1ICswMDAwLCBKYXNvbi1KSCBMaW4gKOael+edv+el
pSkgd3JvdGU6DQo+IEhpIENLLA0KPiANCj4gT24gVGh1LCAyMDIzLTEwLTI2IGF0IDAyOjI2ICsw
MDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gPiBIaSwgSmFzb246DQo+ID4gDQo+ID4g
T24gTW9uLCAyMDIzLTEwLTIzIGF0IDEyOjQ1ICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+
ID4gPiBBZGQgY21kcV9pbnNlcnRfYmFja3VwX2Nvb2tpZSB0byBhcHBlbmQgc29tZSBjb21tYW5k
cyBiZWZvcmUgRU9DOg0KPiA+ID4gMS4gR2V0IEdDRSBIVyB0aHJlYWQgZXhlY3V0ZSBjb3VudCBm
cm9tIHRoZSBHQ0UgSFcgcmVnaXN0ZXIuDQo+ID4gPiAyLiBBZGQgMSB0byB0aGUgZXhlY3V0ZSBj
b3VudCBhbmQgdGhlbiBzdG9yZSBpbnRvIGEgc2hhcmVkDQo+ID4gPiBtZW1vcnkuDQo+ID4gDQo+
ID4gSSB0aGluayB3aGVuIGNtZHEgZHJpdmVyIGhhbmRsZXIgaW50ZXJydXB0LCBpdCBjb3VsZCBz
aW1wbHkgY2FsbA0KPiA+IGludG8NCj4gPiBURUUgd2l0aCBhbiBBUEkgdG8gcXVlcnkgc3RhdHVz
LiBUaGUgc3RhdHVzIG5vdCBvbmx5IHRoZSBleGVjdXRlDQo+ID4gY291bnQsDQo+ID4gYnV0IGFs
c28gb3RoZXIgbWVzc2FnZSBpbmNsdWRpbmcgZXJyb3IgaW5mb3JtYXRpb24uIFNvIGl0J3Mgbm90
DQo+ID4gbmVjZXNzYXJ5IHRvIHVzZSBzdWNoIG5vbi10cmlja3kgd2F5IHRvIGdldCBleGVjdXRl
IGNvdW50Lg0KPiANCj4gVGhlIHJlYXNvbiB3aHkgd2UgdXNlIHNoYXJlZCBtZW1vcnkgdG8gcmVj
b3JkIGV4ZWN1dGUgY291bnQgaGVyZSBpczoNCj4gMS4gbm9ybWFsIHdvcmxkIGNhbiBub3QgYWNj
ZXNzIHRoZSByZWdpc3RlciBvZiBzZWN1cmUgR0NFIHRocmVhZCBpbg0KPiBub3JtYWwgd29ybGQu
DQo+IDIuIGNhbGxpbmcgVEVFIGludm9rZSBjbWQgaW4gdGhlIGlycSBoYW5kbGVyIHdvdWxkIGJl
IGV4cGVuc2l2ZSBhbmQNCj4gbm90DQo+IHN0YWJsZS4gSSd2ZSB0ZXN0ZWQgdGhhdCBhIHNpbmds
ZSBURUUgaW52bG9rZSBjbWQgdG8gQ01EUSBQVEEgY29zdHMNCj4gMTl+NTMgdXMuIE1heWJlIGl0
IHdvdWxkIGNvc3QgbW9yZSBkdXJpbmcgdGhlIHNjZW5hcmlvIHRoYXQgbmVlZHMNCj4gbW9yZQ0K
PiBDUFUgbG9hZGluZy4NCg0KQWRkIHRoaXMgdG8gY29tbWVudC4NCg0KPiANCj4gPiANCj4gPiBP
bmUgbW9yZSBxdWVzdGlvbi4gVGhlIGNvbW1hbmQgYnVmZmVyIGlzIG5vdCBzZWN1cmUuIERvZXMg
dGhlIEdDRQ0KPiA+IGhhcmR3YXJlIGV4ZWN1dGUgdGhpcyBub24tc2VjdXJlIGNvbW1hbmQgYnVm
ZmVyPw0KPiA+IA0KPiANCj4gR0NFIGNvbW1hbmQgYnVmZmVyIGlzIGdlbmVyYXRlIGluIHRoZSBu
b3JtYWwgd29ybGQgZmlyc3QuIFRoZW4gaXQNCj4gd2lsbA0KPiBiZSBjb3BpZWQgdG8gdGhlIHNo
YXJlZCBtZW1vcnkgYW5kIHBhc3MgdG8gdGhlIHNlY3VyZSB3b3JsZC4gQWxsIHRoZQ0KPiBpbnN0
cnVjdGlvbiBpbiBjb21tYW5kIGJ1ZmZlciB3aWxsIGJlIHZlcmlmaWVkIGluIHNlY3VyZSB3b3Js
ZCB0aGVuDQo+IHRoZXkgd2lsbCBiZSBjb3BpZWQgdG8gdGhlIHNlY3VyZSBjb21tYW5kIGJ1ZmZl
ciBhbmQgZXhlY3V0ZWQgYnkgR0NFDQo+IHNlY3VyZSB0aHJlYWQuIEknbGwgYWRkIHRoaXMgaW5m
b3JtYXRpb24gdG8gdGhlIGNvdmVyIGxldHRlciBhdCB0aGUNCj4gbmV4dCB2ZXJzaW9uLg0KPiAN
Cj4gUmVnYXJkcw0KPiBKYXNvbi1KSC5MaW4NCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBDSw0KPiA+
IA0K

--__=_Part_Boundary_006_244650715.290237938--

