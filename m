Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64B84360F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 06:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677B113901;
	Wed, 31 Jan 2024 05:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB535113901;
 Wed, 31 Jan 2024 05:27:28 +0000 (UTC)
X-UUID: 669b54c8bff911ee9e680517dc993faa-20240131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=B3n82rU9DAOStgOr3IggnpZ63tpEQcRq6tZeNDvZSR8=; 
 b=fTlDFoc6NyAensA6rMdupZGjD8by8+6aALDOExstl6dd3npmU6XoxYJRqm1W14t4QbtzwnvaLDf3ORrTtx8eRA8jJOTBnlo/5HDmvnYxmPhueFFec34YRKfOr2MZ/uwoNsX/VqbPd34P0ODlxonQmaHebVJAyJJbuQ6QxTjTuP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:4b826c58-e690-43f0-8910-1e4860fdfc3e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6e16cf4, CLOUDID:c6827283-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 669b54c8bff911ee9e680517dc993faa-20240131
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 868725122; Wed, 31 Jan 2024 13:27:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jan 2024 13:27:17 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jan 2024 13:27:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg+VCrppaiLDMj74e87ujH1pGyCL+TrKp3QBG9Xe01eJ4KDYxhG6x1nSkGDosAzxUBzspSujUOR6xLmr/b3WpKWorOBs70O5vEHbou6oyof7negoaEGEnY2Dpq+PL7ieZkjfM835yK/z7nDDOiptwgyIqLfudjTuyhjpoK2XpDS2D8W67i4DhUM97jSxAn7A/ymsK79ptQXD6kdoinY8RPItvIG3wYCry3ZHuVKgnZm6Rar9J5ilKMUi1m5tiMqteH3qO6RvNGbVjXHUWJtU55cQoQWO7NFm/hyQh3ccb76CUnNPbU9GKrgtbGtUkNXZ7wMt6IP/9yhgYyZrM2F6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12kAn5ETUAB7ea4zG4rUvK7A+d4P9mYF4KOoXRKm1Xw=;
 b=laqB8U7tIcHV/RXHo12tjvDp0rU2eUdZ5rJmLW5WFiQcyy+3IaVHU4BiqhKgpP0PJVXsPRf8/eigxjEvWED2U0rJbSWzWKrnoTE1uzAWWZOHvRqCZytLwQpDfHkXkOVGcWzU+pNW8Ca1PrWeYp442qOEqpVyR8XoUXdIDJIJ/T6myKLdOt1uP0nToan0TnbSpTjpc7tlSHQw9nCceBc14Pz6qYAVntzzkaHYKZp+3Ukz8v1GfhUWJgPV0stPYLr8mdtV6gaVHeyPuurg0cJPRLx8qjZbcdKuclUewJfj3RslIl/1E4w8hbcHhNHR1CRnnCBQtuc0clhFLPkmvolepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB5564.apcprd03.prod.outlook.com (2603:1096:4:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 05:27:14 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::d006:ec9c:ff42:ff60%5]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 05:27:14 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "michel@daenzer.net" <michel@daenzer.net>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "mikita.lipski@amd.com"
 <mikita.lipski@amd.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "nicholas.kazlauskas@amd.com"
 <nicholas.kazlauskas@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "quic_abhinavk@quicinc.com"
 <quic_abhinavk@quicinc.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "sean@poorly.run"
 <sean@poorly.run>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Thread-Topic: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Thread-Index: AQHaTaau1JBuNr0KqkifWFu/qedV2rDm6fyAgAPwMICABCH8AIAEdNSA
Date: Wed, 31 Jan 2024 05:27:14 +0000
Message-ID: <afa82f2028296dbf586a5e61949179831d69af06.camel@mediatek.com>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
In-Reply-To: <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB5564:EE_
x-ms-office365-filtering-correlation-id: 24d92243-e599-4f2a-341c-08dc221d484c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yA5E9oEbezRHKfod7AsDKnYRxhKaDmid3lZya0+17TQzSsScGh1Ln4kzbAjz+32+qEeFC/ZFl3mE7KGJ/7qsQpqG9VVpsxBrtsMpJrtNCKaHtKAyiv/oiHE4TEHSRie6YhsPbqkwxe6htiCTKyA/+Zi5poHuTrh94MkaJKONM0sOuiHFlahcVhLGGFoB1SDjjLeqa1xsIJRXihy41nG5xS2IkycSy0j/tu2ltuawNUEzyNxDyGk2hrhGFongCp7Ch3srMEJBnhSLmC8AfnIgg051dipwx+zFuLgHtCq8A+fR5agAtTCo/gbv1eOEj97vc2NCJhmltkYkhMKsg+UMRr8NriEGO9zdOARcO6HjsL4eJ7EqBMA2DZcrd7lBBQo98T1/gB9mSUwWgKofhPNcWqsesnPHr+3h4ssUkxEB7G2kGAMJZ/q70LMT7irhltkOickhjo8mgKyGJ0cw1fhVZJY3XsFs+fTsyMh17L0a24D5g6xBKBIn64IzKN8ZV181VZkMur/OSNek2tcf7R6P7gZGZ/bROUPqfQF6j2pvBN9rtwA0xCELVzMtVvRhHxcajW85jV8Vv3JPF0TFXmyHiUHGlwmZT8Elqi7m5IttBMPGOQTWhOFDCdMQcIZjirOeRnDv5jFcfu4wlVXd9UHewQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(6512007)(26005)(2616005)(38100700002)(122000001)(5660300002)(8676002)(8936002)(7416002)(2906002)(478600001)(45080400002)(6486002)(6506007)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(110136005)(921011)(38070700009)(86362001)(36756003)(85182001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUxsUC9MQzQxQnlIVmRienYyc0FQazFLanNMdzdVSmJaN3FkbUpia2Q1dWk1?=
 =?utf-8?B?VjVGMDlxOVVPak81eTQ1R2U1TEFDdUVWQlJwcG9pY2c5K1BmMUNFaU52SWpY?=
 =?utf-8?B?dytYMUE3eG9KbXNaUkNDazdxZ0luQWoyOFZCbXF6WE5vL2hnS2s3eE1RZS9o?=
 =?utf-8?B?Z0J1R3EvaVh1bkZGalZhRm1TZVAyRDBaT0FtQU9ZTVd0Y0cxeCtNNERhMGRO?=
 =?utf-8?B?c3pVa2RuRGtab09rODBCTmV4MHJ6MUFucmZqY0pJQ0dLK2tXaTFIVVBXRFBH?=
 =?utf-8?B?Z0ZrRWs2WkliclQ0Tk5IUFFvZndURXdCUTk1eFNsb0NOaGVDMkxWQnJST2Ur?=
 =?utf-8?B?ZkVnNTljY2tmRExrdUNKcjhwNzJzSWd2NG1lVWFSOVV2NGtQSzNxT3o3NVli?=
 =?utf-8?B?dE5mM25MWm13V3Y5S1RpcXR2V1RPc1BlbmRoWlFycEtPbTBZZFlXZGRwM0J3?=
 =?utf-8?B?UDl5Rm1LNVFITjc1aldYYnhwRmNNb2FJdEFnUi9HYzh0N00zc3hJZmo0c1d4?=
 =?utf-8?B?NWdKWnBLRkdhYVRGcHdOeVJSSzhSZDhHV015YTBCVkRiQmhCR2hrQlNrbm9D?=
 =?utf-8?B?bytSQ3hZS1V1cGxyYmdBVzdzanZRbys0VS8vcUxZcDNndlBZMFNOV0JjQ3oy?=
 =?utf-8?B?V1VFc3AyYmI2OGk3SGNHb3ZxOHAvYnlQdFh4UVlsZXZMeEpiQm1wZzdTaXZh?=
 =?utf-8?B?em5wVU1YSDArV2I4QnYrNVdXSC9xN21VTmpYSGk3OHBlSXExYk10M3BOOWVQ?=
 =?utf-8?B?YjhOeDYzSnJFKzUvOFZHT0dpaWEwZ3NNRHdaa2FxZ1BZRFFGdmJpVEE5M0Iy?=
 =?utf-8?B?Z0krTjZxbDhWOFBGOUZWM2NPQzNlS1g2OGVQTENFQjk4NUVib0M1My91SFlR?=
 =?utf-8?B?elhkZzh1Y3htTGdnMi93TjR4cW93VHBaQWhlcGpDeW9KRzRsK055RUZRZDRQ?=
 =?utf-8?B?UVEzbFkzUkxvRXlKWU9DRXljMUx0S3dnV1VUNmtZY24rZDBjWnhnbnZVZkRR?=
 =?utf-8?B?T0V2S1hsSm1EdTVuUWJXZjFnMUx5MlF6dGt0b09ZUHpUcUdqZkJkOHBxQnpZ?=
 =?utf-8?B?ZEFCbmJBQ2VsN0s0MDMwUjZDNWZ1QXdJb2lyV2pQWDNvMkltcmNBaDIwcGF0?=
 =?utf-8?B?amRSTzgvZlY3c1FxN0NQQ0hMZktlOGRwendpYTdVWUpmeSs4UW9NM0Y4MGcx?=
 =?utf-8?B?azBWdG4vWWZPU2Rwd2ZiR0dnMXlyZ0d4T0tMbDQzRzJkVS91eGFmMU5ZWkFm?=
 =?utf-8?B?RmhjaXU5bE95RnU5QUN4dkZBZGVqQm4wS0VUQVl1QkJOWFp4WDgzRGFLbmhY?=
 =?utf-8?B?V1ZxS1NTRTdUaTFFbFJEemdIbm5pSjl0OHZWWWVPd3ZIbEZRYnZXSkdKRHB5?=
 =?utf-8?B?VEpJcVRiTmI4Y1pYVnQwTlBGaDcra0lsUU5GUU1ZOFZBTVJKQ3RhVFJ4clYw?=
 =?utf-8?B?ZDZ5MCtRT0JZeFZMclhGZFZ1QllLRlRmMkd5dDA2Z1NSbXlUTU52NXh0S3U0?=
 =?utf-8?B?VTM3TVJoblJaUm5oZzAwZVA0TU1NQ3Y1U3UreGxxSWlodktBalAyM3BRd2dn?=
 =?utf-8?B?VlJmd2Ftd2hDNEhYa0plbmxZOTBEcnZBV0xIUFlLRFNRc0YvTmQvMDJHeXJ3?=
 =?utf-8?B?VXk1WTJwNFNYNjhFK3MzeTNhU0hWWVRmSkVuRmhnSVE2OTZwVnJBVkNGTGlT?=
 =?utf-8?B?d0VRaGJoZDhMckN3cXQ5N0hjNTFyYk9BTXNWTlNkdW9rZy9Sck5FSmNydzlk?=
 =?utf-8?B?VmxSMkZpdjhEc3lRTXNqL3ZPSmswTEFJakFMak14UjR6VHVnYlpIVTdVZTVC?=
 =?utf-8?B?VUNLZlhPSUJBamN1VmgzL3RiTVd6eXlFQzJFd29nSkx6RnIxSzJTZXd0dnZW?=
 =?utf-8?B?cTU1RHNPaUtLeVI2SjdIbFJKU05reCtVVlF6M2dZNmMyNCt2VWlzSGRpbEdv?=
 =?utf-8?B?WVIzaEpKamlRYVNVWWtVRHpKeXVzbGFNdDVGV3NzVUgxM1IvVkpNU1lqYWxo?=
 =?utf-8?B?RFlXWVJ3WXQ3Rzh1NzdPbld3NXlqeUt3dDljVzA0TlhvM3ZHVGVLZDdQQUJ5?=
 =?utf-8?B?dS9RZ2drNnhoVkV4ek9yRUk5OHNqOFZTa2lrMmpZbEo0WnhTSWloTXNncFJS?=
 =?utf-8?B?S1hEQXlJbjN0c0ZQbFQzb2libTFtZUh5R2pzMFhNQnY3b25HZk9VZ0dET1lr?=
 =?utf-8?B?Tnc9PQ==?=
Content-ID: <A91863CE658FA244BC1A18F5F6D53CCF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d92243-e599-4f2a-341c-08dc221d484c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 05:27:14.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTja7jfhlBPipD53jZhdwRFtHnOnvC2m+Rakd/nPafrPNLfDxN8lvszlIaorSQGJGIDk35MGZp97++4guxb/lZxk3LK4ViZpfqSzrKXpYh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5564
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_723854662.1918036052"
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

--__=_Part_Boundary_003_723854662.1918036052
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KDQpPbiYjMzI7U3VuLCYjMzI7MjAyNC0wMS0yOCYjMzI7
YXQmIzMyOzEwOjI0JiMzMjsrMDEwMCwmIzMyO01heGltZSYjMzI7UmlwYXJkJiMzMjt3cm90ZToN
CiZndDsmIzMyO09uJiMzMjtUaHUsJiMzMjtKYW4mIzMyOzI1LCYjMzI7MjAyNCYjMzI7YXQmIzMy
OzA3OjE3OjIxUE0mIzMyOyswMTAwLCYjMzI7RGFuaWVsJiMzMjtWZXR0ZXImIzMyO3dyb3RlOg0K
Jmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO1R1ZSwmIzMyO0phbiYjMzI7MjMsJiMzMjsyMDI0JiMz
MjthdCYjMzI7MDY6MDk6MDVBTSYjMzI7KzAwMDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjso
JiMyNjUxOTsmIzMwNTkxOyYjMzEwNzc7KSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjtIaSYjMzI7TWF4aW1lLCYjMzI7RGFuaWVsLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtXZSYjMzI7ZW5jb3VudGVyZWQmIzMy
O3NpbWlsYXImIzMyO2lzc3VlJiMzMjt3aXRoJiMzMjttZWRpYXRlayYjMzI7U29Dcy4NCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7V2UmIzMy
O2hhdmUmIzMyO2ZvdW5kJiMzMjt0aGF0JiMzMjtpbiYjMzI7ZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0X3JwbSgpLCYjMzI7d2hlbg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7ZGlzYWJsaW5n
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO2N1cnNvciYjMzI7cGxhbmUsJiMz
Mjt0aGUmIzMyO29sZF9zdGF0ZS0mZ3Q7bGVnYWN5X2N1cnNvcl91cGRhdGUmIzMyO2luDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtkcm1fYXRvbWljX3dhaXRfZm9yX3ZibGFuaygpJiMzMjtp
cyYjMzI7c2V0JiMzMjt0byYjMzI7dHJ1ZS4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0Fz
JiMzMjt0aGUmIzMyO3Jlc3VsdCwmIzMyO3dlJiMzMjthcmUmIzMyO25vdCYjMzI7YWN0dWFsbHkm
IzMyO3dhaXRpbmcmIzMyO2ZvciYjMzI7YSYjMzI7dmxiYW5rJiMzMjt0byYjMzI7d2FpdA0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Zm9yJiMzMjtvdXINCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyO2hhcmR3YXJlJiMzMjt0byYjMzI7Y2xvc2UmIzMyO3RoZSYjMzI7Y3Vyc29yJiMzMjtw
bGFuZS4mIzMyO1N1YnNlcXVlbnRseSwmIzMyO3RoZSYjMzI7ZXhlY3V0aW9uDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjtwcm9jZWVkcyYjMzI7dG8mIzMyO2RybV9hdG9taWNfaGVscGVyX2Ns
ZWFudXBfcGxhbmVzKCkmIzMyO3RvJiMzMjsmIzMyO2ZyZWUmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7Y3Vyc29yDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtidWZmZXIu
JiMzMjtUaGlzJiMzMjtjYW4mIzMyO2xlYWQmIzMyO3RvJiMzMjt1c2UtYWZ0ZXItZnJlZSYjMzI7
aXNzdWVzJiMzMjt3aXRoJiMzMjtvdXImIzMyO2hhcmR3YXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtDb3VsZCYjMzI7eW91JiMzMjtw
bGVhc2UmIzMyO2FwcGx5JiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7dG8mIzMyO2ZpeCYjMzI7b3Vy
JiMzMjtwcm9ibGVtJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO09yJiMzMjthcmUm
IzMyO3RoZXJlJiMzMjthbnkmIzMyO2NvbnNpZGVyYXRpb25zJiMzMjtmb3ImIzMyO25vdCYjMzI7
YXBwbHlpbmcmIzMyO3RoaXMmIzMyO3BhdGNoJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7TW9zdGx5JiMzMjtpdCYjMzI7bmVlZHMmIzMyO3NvbWVvbmUmIzMyO3Rv
JiMzMjtjb2xsZWN0JiMzMjthJiMzMjtwaWxlJiMzMjtvZiYjMzI7YWNrcy90ZXN0ZWQtYnkmIzMy
O2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7dGhlbiYjMzI7bGFuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7
aXQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0kmIzM5O2QmIzMyO2Jl
JiMzMjtfdmVyeV8mIzMyO2hhcHB5JiMzMjtpZiYjMzI7c29tZW9uZSYjMzI7ZWxzZSYjMzI7Y2Fu
JiMzMjt0YWtlJiMzMjtjYXJlJiMzMjtvZiYjMzI7dGhhdCYjMzI7Li4uDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1RoZXJlJiMzOTtzJiMzMjthbHNvJiMzMjt0aGUmIzMy
O3BvdGVudGlhbCYjMzI7aXNzdWUmIzMyO3RoYXQmIzMyO2l0JiMzMjttaWdodCYjMzI7c2xvdyYj
MzI7ZG93biYjMzI7c29tZSYjMzI7b2YNCiZndDsmIzMyOyZndDsmIzMyO3RoZQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7bGVnYWN5JiMzMjtYMTEmIzMyO3VzZS1jYXNlcyYjMzI7dGhhdCYjMzI7cmVhbGx5
JiMzMjtuZWVkZWQmIzMyO2EmIzMyO25vbi1ibG9ja2luZyYjMzI7Y3Vyc29yLCYjMzI7YnV0DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtJJiMzMjt0aGluaw0KJmd0OyYjMzI7Jmd0OyYjMzI7YWxsJiMzMjt0
aGUmIzMyO2RyaXZlcnMmIzMyO3doZXJlJiMzMjt0aGlzJiMzMjttYXR0ZXJzJiMzMjtoYXZlJiMz
Mjtzd2l0Y2hlZCYjMzI7b3ZlciYjMzI7dG8mIzMyO3RoZSYjMzI7YXN5bmMNCiZndDsmIzMyOyZn
dDsmIzMyO3BsYW5lDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt1cGRhdGUmIzMyO3N0dWZmJiMzMjttZWFu
d2hpbGUuJiMzMjtTbyYjMzI7aG9wZWZ1bGx5JiMzMjt0aGF0JiMzOTtzJiMzMjtnb29kLg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjt0aGluayYjMzI7dGhlcmUmIzMyO3dhcyYjMzI7YWxzbyYj
MzI7YSYjMzI7cmVncmVzc2lvbiYjMzI7d2l0aCYjMzI7bXNtJiMzMjtubyYjMzI7b25lJiMzMjty
ZWFsbHkmIzMyO2ZpZ3VyZWQNCiZndDsmIzMyO291dCYjNjM7DQoNCk9LLi4uDQpCdXQmIzMyO0km
IzMyO2FtJiMzMjtvbmx5JiMzMjthdmFpbGFibGUmIzMyO29uJiMzMjtNZWRpYVRlayYjMzI7cGxh
dGZvcm0uDQoNCkRvZXMmIzMyO2l0JiMzMjthbHNvJiMzMjtjYXVzZXMmIzMyO2EmIzMyO3JlZ3Jl
c3Npb24mIzMyO3dpdGgmIzMyO21zbiYjMzI7aWYmIzMyO0kmIzMyO3JlLXNlbmQmIzMyO2EmIzMy
O3BhdGNoJiMzMjtmb3INCmRybV9hdG9taWNfaGVscGVyLmMmIzMyO29ubHkmIzYzOw0KDQpSZWdh
cmRzLA0KSmFzb24tSkguTGluDQomZ3Q7JiMzMjsNCiZndDsmIzMyO01heGltZQ0KDQo8L3ByZT4N
CjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_723854662.1918036052
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiBTdW4sIDIwMjQtMDEtMjggYXQgMTA6MjQgKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6
DQo+IE9uIFRodSwgSmFuIDI1LCAyMDI0IGF0IDA3OjE3OjIxUE0gKzAxMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6DQo+ID4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMDY6MDk6MDVBTSArMDAwMCwg
SmFzb24tSkggTGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiA+ID4gSGkgTWF4aW1lLCBEYW5pZWws
DQo+ID4gPiANCj4gPiA+IFdlIGVuY291bnRlcmVkIHNpbWlsYXIgaXNzdWUgd2l0aCBtZWRpYXRl
ayBTb0NzLg0KPiA+ID4gDQo+ID4gPiBXZSBoYXZlIGZvdW5kIHRoYXQgaW4gZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0X3JwbSgpLCB3aGVuDQo+ID4gPiBkaXNhYmxpbmcNCj4gPiA+IHRoZSBjdXJz
b3IgcGxhbmUsIHRoZSBvbGRfc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlIGluDQo+ID4gPiBk
cm1fYXRvbWljX3dhaXRfZm9yX3ZibGFuaygpIGlzIHNldCB0byB0cnVlLg0KPiA+ID4gQXMgdGhl
IHJlc3VsdCwgd2UgYXJlIG5vdCBhY3R1YWxseSB3YWl0aW5nIGZvciBhIHZsYmFuayB0byB3YWl0
DQo+ID4gPiBmb3Igb3VyDQo+ID4gPiBoYXJkd2FyZSB0byBjbG9zZSB0aGUgY3Vyc29yIHBsYW5l
LiBTdWJzZXF1ZW50bHksIHRoZSBleGVjdXRpb24NCj4gPiA+IHByb2NlZWRzIHRvIGRybV9hdG9t
aWNfaGVscGVyX2NsZWFudXBfcGxhbmVzKCkgdG8gIGZyZWUgdGhlDQo+ID4gPiBjdXJzb3INCj4g
PiA+IGJ1ZmZlci4gVGhpcyBjYW4gbGVhZCB0byB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMgd2l0aCBv
dXIgaGFyZHdhcmUuDQo+ID4gPiANCj4gPiA+IENvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBw
YXRjaCB0byBmaXggb3VyIHByb2JsZW0/DQo+ID4gPiBPciBhcmUgdGhlcmUgYW55IGNvbnNpZGVy
YXRpb25zIGZvciBub3QgYXBwbHlpbmcgdGhpcyBwYXRjaD8NCj4gPiANCj4gPiBNb3N0bHkgaXQg
bmVlZHMgc29tZW9uZSB0byBjb2xsZWN0IGEgcGlsZSBvZiBhY2tzL3Rlc3RlZC1ieSBhbmQNCj4g
PiB0aGVuIGxhbmQNCj4gPiBpdC4NCj4gPiANCj4gPiBJJ2QgYmUgX3ZlcnlfIGhhcHB5IGlmIHNv
bWVvbmUgZWxzZSBjYW4gdGFrZSBjYXJlIG9mIHRoYXQgLi4uDQo+ID4gDQo+ID4gVGhlcmUncyBh
bHNvIHRoZSBwb3RlbnRpYWwgaXNzdWUgdGhhdCBpdCBtaWdodCBzbG93IGRvd24gc29tZSBvZg0K
PiA+IHRoZQ0KPiA+IGxlZ2FjeSBYMTEgdXNlLWNhc2VzIHRoYXQgcmVhbGx5IG5lZWRlZCBhIG5v
bi1ibG9ja2luZyBjdXJzb3IsIGJ1dA0KPiA+IEkgdGhpbmsNCj4gPiBhbGwgdGhlIGRyaXZlcnMg
d2hlcmUgdGhpcyBtYXR0ZXJzIGhhdmUgc3dpdGNoZWQgb3ZlciB0byB0aGUgYXN5bmMNCj4gPiBw
bGFuZQ0KPiA+IHVwZGF0ZSBzdHVmZiBtZWFud2hpbGUuIFNvIGhvcGVmdWxseSB0aGF0J3MgZ29v
ZC4NCj4gDQo+IEkgdGhpbmsgdGhlcmUgd2FzIGFsc28gYSByZWdyZXNzaW9uIHdpdGggbXNtIG5v
IG9uZSByZWFsbHkgZmlndXJlZA0KPiBvdXQ/DQoNCk9LLi4uDQpCdXQgSSBhbSBvbmx5IGF2YWls
YWJsZSBvbiBNZWRpYVRlayBwbGF0Zm9ybS4NCg0KRG9lcyBpdCBhbHNvIGNhdXNlcyBhIHJlZ3Jl
c3Npb24gd2l0aCBtc24gaWYgSSByZS1zZW5kIGEgcGF0Y2ggZm9yDQpkcm1fYXRvbWljX2hlbHBl
ci5jIG9ubHk/DQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCj4gDQo+IE1heGltZQ0K

--__=_Part_Boundary_003_723854662.1918036052--

