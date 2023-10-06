Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B97BB2ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029A10E4BA;
	Fri,  6 Oct 2023 08:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF0A10E4BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 08:20:14 +0000 (UTC)
X-UUID: 29d3ff6a642111ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hNqfZdDTOOWxHM6QCysWsERKvOWGKijwDNG+8yBG9/Q=; 
 b=U7qD69GZMYAi2ldEnapPyJ18TDJH9H9c4e7YuRT0cr57EETe1ZNxdRgMLfq2lKTUoIm99blljna6b5WJ0YfGylwwrgAkj4ZsLwPJJJo9hPawdGpXTrRufx45lrLPmLR4/eu1uOb30OAOxL9MxKnNGP4unbePznq0E/r1XYC7mxw=;
X-CID-CACHE: Type:Local,Time:202310061550+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:1374fe34-5ef3-4158-980d-37d3b0932b6b, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5f78ec9, CLOUDID:ac8da6bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 29d3ff6a642111ee8051498923ad61e6-20231006
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 654462866; Fri, 06 Oct 2023 16:20:09 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 16:20:08 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 16:20:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKVJYmGkAE1PvhKAQVnABR2AvL24cC/2MKqi3mOJqMFspJTFFrGFMFyftTSf8vNAZ5wKlD3UfLi2ONbWkWJM469bUjz6VvEVv0XQc4w+LlWP1Nboxbhh4oXu0L+hJn+qpuUAvMrTTO7gxB2Kqi1knA7zYh+/nCPtogF1O93o/DnMTfALXDefzuBOBM6LYhZxITSgnIZvl4MHPv4shGh6e0DJpGACCr7Cg9l2+S5Zlb8wMVzGDxf5W9VZhl3CIgvTkvun+qzVC3bdZS8GajY3h8Ijflz7P8CzF48wMKVOFeEmzcdVBgpbe20hYP+XgjhT6WsDxygoEcBAY9aZQi5BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+FQBC2TSkZbLRr1V3kRHzF4ReTNh0TGeIiW7ikxzog=;
 b=UXZxr7JOk3Wwcv/uZWA6LPorqCvXpRGqpqLILrQmKMEFWzKsMabn3N78nqxJhs5pPKhWJdtsrQpryd3VzFzngIqvIkS4O1Ct5eQLZ7nV7FR8rdUCd/APiEAkjRRLfUVkUy+FCG4YaJbNigDaK0OXsLXsWx7mprRR8OAUxbRubO43+tYwXvv/37twdG0oaCyVjDMeHJNXpFYIAVs+CNV/kal0Qitii90FVDVpodfD/iLxd0klpmRE41UaM+/eATnG/9AzqlFYPlg4IXWQN1ulgEkRIeouu+SjB2jh9ltpz1FZlvALtkknAeZ+baxJZWwtAoJXPA9OxoMrOt4Bp1kfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+FQBC2TSkZbLRr1V3kRHzF4ReTNh0TGeIiW7ikxzog=;
 b=MHex2/vW2+luvQqJzyoTHlQ9ZT1prLO6pIXvXq4Nu6UyR9W4PdfQHG7e1/2ZKQrrAzVKnONgrV0fnVPe0/Eu78rODfAHplBnJ3Jg/C6siIOy4/DXz6zBy+jO1c0g2lSSye91jUUSUW0TmQNo6pa1oM3kvWg7/6ar78q82zoKJyw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI2PR03MB6167.apcprd03.prod.outlook.com (2603:1096:4:14f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 08:20:04 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::8c0:a8fa:8e5:159d%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 08:20:03 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
Thread-Topic: [PATCH v11 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
Thread-Index: AQHZ9mwpUBQW6ez4gEOg0kwPXXruJbA8ZqkAgAAIR4A=
Date: Fri, 6 Oct 2023 08:20:02 +0000
Message-ID: <6dc998e37f849e6a0f9c546c4f6e459832e4918e.camel@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
 <20231004024013.18956-8-jason-jh.lin@mediatek.com>
 <2fb9fa5915b69b381142da60d1a7ece9ca9fa395.camel@mediatek.com>
In-Reply-To: <2fb9fa5915b69b381142da60d1a7ece9ca9fa395.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI2PR03MB6167:EE_
x-ms-office365-filtering-correlation-id: c585bdc7-59a0-4621-75f9-08dbc6450a11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e2IhueqLJPu4dR9wtO+Jx1lfE0M+XQEhXf9b7oCh59CtPcq0jKSxSG4XwpR3124aYQ7jy6GOsehN8VEaMUI7slAAvTfzRbtVm9FBZXLSG+bbrQkjFUHoCnx2vy/3D5L7Htq2M/96Oau2cpT2VevbjKqbow5k/6aTWJhmBpTu1R3EqXn5qMKH0aLtid1gFydvB0eheqQj1m8dvnzF7rd9FD+o6K5riL+JW0sNcuomJSfrLLmhXgrbzy7QdrlC1e0xljrDMGtctNFaGSBx6yjSYaC8kJIuqhNDpUPGiJi1EGTbcqCy3V/dVJMESX1z0yGMzmfihsnmkWyBluuL37eQHbglZKcSbGfa/ACVvSXxHDhFp8qwbiVNrIlSXI1bSpgEbm0iKWKUYyFQf6A1bcQYd79Zg6rao3yq8Mw+211oBWaiQIkmiibyfNT8vLk2tAjBqM/08DUU3H+vFpqu6wFEov8y89jXiPvk0Fq9VGcRLJ75qWxdY6opPUEHHUN4jWMjBSL90z2EUwSFHvt9putLkAgKuVxPDGXeKRZt7Q4TmmNaaiHqaxwsCx3RutwHS7oMSydetwKX3idf+lWb7SOrCSqiMZtCzPotydnfda2W2MBSYphPdzeAgto7c0ntd6IQ5W4eIL6+7BIXtME2NbLzVQeOxI/+lXiDlc1ZtbnDNGQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(6506007)(6486002)(6512007)(38100700002)(38070700005)(86362001)(4744005)(122000001)(2906002)(26005)(71200400001)(2616005)(8676002)(66946007)(66556008)(66446008)(54906003)(36756003)(85182001)(8936002)(4326008)(64756008)(76116006)(5660300002)(91956017)(41300700001)(66476007)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDAzRkRxVmRVR2lCdUYzNVd3aCtsekNVR1NtdWpGY3VmM0p3NlhUWTZGenpB?=
 =?utf-8?B?VDR0YXRqWWQrZVdHU3RRK3lGRDhydnVSVmp2c2FHejZSQXRVaGpNS20wY1lH?=
 =?utf-8?B?S25VM2NIYnNXQ0E1ME1PNEQwZDlxRkFCZFpLRzFkMUFpeUdkUUpvc1Ruait1?=
 =?utf-8?B?Q0w5RXN3VjFpcU5lbWtRQ3JiZXkvWndnMHUxMXdCQk9JeFJlakd6Z21IREdH?=
 =?utf-8?B?Uk1RWVp3MTNoek9Qb1g0enRHVjlNQ0lWeDFEZkRCRTN4TUN4U2U5MWxhblJl?=
 =?utf-8?B?ZjI3VEJzelRjZlJRNW1LOUE2Rm42cDNLWmRXb0RMVWlIU1dtY1ptK1FnMkJo?=
 =?utf-8?B?YktJSDRWRTdFM2JPSUNvTzlSeTVBOEZoQ0RtQ1cvMWFzZFd2TlljVDdaZVlW?=
 =?utf-8?B?NUphMnhmcFUyOURzOUhTSjZaNW14UXNIVlN1ZTBDZGJNbTFZNnhtZjN5RVo4?=
 =?utf-8?B?enBZYTQvckQvMjk2dHF1NlE0UEphNnhXWWw5Q3gxVjZVdjFFUGhjQjN3Z0lo?=
 =?utf-8?B?ZGlTSURaNXdKeTh6c2ljV3JFZklvVzJiOTNSa3JKZVdoWVRweURnWS9nRENX?=
 =?utf-8?B?dGY4UXV0UnNCVWlzZEtPRXVpZXBoUnVqWTJNbVU3bmZYUSsvSGhYRmlIcXpa?=
 =?utf-8?B?LzZDMXVLcjRwc1NXNjRvcG5iV2t0c2JFbXQ0WG9JdlBOZ3h2TlFBcXFXc3Q0?=
 =?utf-8?B?b1Q0cVJqQlQ1WDRzVDFjdm5adnJha2FQeHlqVjNIM3MzNUpCcU5EVXZHNWlk?=
 =?utf-8?B?TXRrQmQzL1RXdFNjZllEQjVDYTI2QmJkdDlHbDNIUmZ4MTliYnFETm9PT0Vn?=
 =?utf-8?B?Tm9NYzA1d296Z0hWZ3Zhc3QxR0NSRjNhVElJT0ZvRnFGUUhSUTZRUyt5Mnlj?=
 =?utf-8?B?bXlkR1dGeit1eVcrUjRnMXh0eGc5WUZCOExBZW5sZkp1UGVTOEp2NC9jeEo0?=
 =?utf-8?B?SEIxN1ZBVDVMdU5VNmY4RERLWEgwWVUzYms0aDVLdVZZdXZSeU5FcjNCUUUv?=
 =?utf-8?B?dlI0d1RKZng2RzkySXhleVVRR2pKZGRVTS9BbEdoUXRyTFBEZnlKZElRbXV6?=
 =?utf-8?B?VUl1dUFKSGpjOW1lUTBST041a0pBUUdjR3E1Z0VRcmsybkpoSzNYNzNPOXNM?=
 =?utf-8?B?aWdxVy9IbW9CckYyaWFPbk11d2xvQ3c0UkZLc05oNi84TTlCSUJMQVkyWThQ?=
 =?utf-8?B?TjJ4OXB0M2pRR0Y5Tlc4Tm9DVjdoNmlzNUJtNGYzM292RXdhTjR3YUlsL2p0?=
 =?utf-8?B?T3FXYURkemtuVUdiclo4OUdxOFN0UjBiL3krMnFlaTBzRlVFSmxVV1J3MDFt?=
 =?utf-8?B?Ky9adnpBTCtSSGpJTTRRN2sxdzlCaklhQkpxcXdQSkFHOWlNYmEyc28veDc1?=
 =?utf-8?B?akdKaFpjQVJKRGUxN2hvL01xRFJxZXlNZVBhR2pFYWhFUE5abHQwa2ZudXNo?=
 =?utf-8?B?RDlwNUI5ZWNuTEhsZXl6NFN4ZWpUYkw2azlreTJwekpPRUoyaGFIRk5FNndM?=
 =?utf-8?B?VTZ6MEc1WnMyR0EyamJkZXlZM3NNbzM5Mm1NWFFKa1krVzMzNUlnU1lHMVBi?=
 =?utf-8?B?K3hxdDZmeWJtZ1RsUVBZVFdUS25PL2dEZ2daSTdlMzk3dHE1Z0tlbkY4cks2?=
 =?utf-8?B?ODFINkF2MVgra245YkJJSUkzN3ZiNGVOUDBkaU92RFV1Q0hNV0ZvL0lYRTBw?=
 =?utf-8?B?VXlNSzFIelFmeDh1Y0NxeE41bUhEYkdGcityQkgxMDVqMVd6WEI4clZjUXJu?=
 =?utf-8?B?aC9aL1NlNkFnd1A5YmE1dTRPUzU1VWdKbGE5NEFHNHpRWi8ydU54R1BwOWh5?=
 =?utf-8?B?emY2RWQ5RXRTS2tvYUtMM2wvblRVb0F6UTBPcDJXWEVWT21VSnNLbUw4WXRS?=
 =?utf-8?B?R0hremFNdnhJUmNIdnFlZzdhdVpYa0duUjhKUEFGaUpTWEo3ZXpvNCs5VHhz?=
 =?utf-8?B?OXVVTFdOYVZlQ25aK213UDJySmdxOVFQTXkwZThUaWVGYU1wOUx4aXhOU1Iw?=
 =?utf-8?B?a1d3dThBeG9MeS9sNFk5VVRQM3UyOE16QmtDdHk5bTJVZ3h1WE9Jck5KaUpk?=
 =?utf-8?B?YnNTc1lCSERkWnJHbzRYT0M3ZTYvMXA2UUVhczY0dFNGcG5ybWdzSE5hS09m?=
 =?utf-8?B?TjdOenZoYmVVZlVYTGdTZ0JZZm1KeW9hUUp6Snl3a1h6ZWNiY1dLS0ViVTZt?=
 =?utf-8?B?NHc9PQ==?=
Content-ID: <29EFAB884ACAE445845B962D8F35AA98@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c585bdc7-59a0-4621-75f9-08dbc6450a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 08:20:02.6886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jwld7kh0A4UDcrSgfi1BQHtniQCISDiFn1pZAkgd3sWiab9w3L5EQ7UkfBkHsAmyNcLDBUuactt6GGf7GyASpoqgfFR8Sp2zrcskLe+nQ9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6167
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_722249417.58592322"
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

--__=_Part_Boundary_006_722249417.58592322
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0xMC0wNiYjMzI7YXQm
IzMyOzA3OjUwJiMzMjsrMDAwMCwmIzMyO0NLJiMzMjtIdSYjMzI7KCYjMzI5OTM7JiMyMDQyNjsm
IzIwODA5OykmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SGksJiMzMjtKYXNvbjoNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7T24mIzMyO1dlZCwmIzMyOzIwMjMtMTAtMDQmIzMyO2F0JiMzMjsxMDo0MCYjMzI7
KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7TW92
ZSYjMzI7RERQX0NPTVBPTkVOVF9EUF9JTlRGMCYjMzI7ZnJvbSYjMzI7bXQ4MTg4X210a19kZHBf
bWFpbiYjMzI7YXJyYXkmIzMyO3RvJiMzMjthDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25uZWN0b3Im
IzMyO3JvdXRlcyYjMzI7YXJyYXkmIzMyO2NhbGxlZCYjMzI7bXQ4MTg4X210a19kZHBfbWFpbl9y
b3V0ZXMmIzMyO3RvJiMzMjtzdXBwb3J0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkeW5hbWljJiMzMjtz
ZWxlY3Rpb24mIzMyO2NhcGFiaWxpdHkmIzMyO2ZvciYjMzI7bXQ4MTg4Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtJJiMzMjt3b3VsZCYjMzI7bGlrZSYjMzI7dG8mIzMyO21lcmdlJiMzMjt0aGlzJiMz
MjtwYXRjaCYjMzI7d2l0aCYjMzI7WzkvOV0uDQomZ3Q7JiMzMjtBbGwmIzMyO3RoaXMmIzMyO3Nl
cmllcyYjMzI7bG9vayYjMzI7Z29vZCYjMzI7dG8mIzMyO21lLCYjMzI7c28mIzMyO0kmIzMyO3dv
dWxkJiMzMjttZXJnZSYjMzI7dGhlc2UmIzMyO3R3byYjMzI7cGF0Y2hlcw0KJmd0OyYjMzI7YnkN
CiZndDsmIzMyO215c2VsZi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMy
O0NLDQomZ3Q7JiMzMjsNCg0KT0ssJiMzMjtUaGFua3MmIzMyO2ZvciYjMzI7eW91ciYjMzI7aGVs
cCENCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_722249417.58592322
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNCg0KT24gRnJpLCAyMDIzLTEwLTA2IGF0IDA3OjUwICswMDAwLCBDSyBIdSAo6IOh
5L+K5YWJKSB3cm90ZToNCj4gSGksIEphc29uOg0KPiANCj4gT24gV2VkLCAyMDIzLTEwLTA0IGF0
IDEwOjQwICswODAwLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gTW92ZSBERFBfQ09NUE9ORU5U
X0RQX0lOVEYwIGZyb20gbXQ4MTg4X210a19kZHBfbWFpbiBhcnJheSB0byBhDQo+ID4gY29ubmVj
dG9yIHJvdXRlcyBhcnJheSBjYWxsZWQgbXQ4MTg4X210a19kZHBfbWFpbl9yb3V0ZXMgdG8gc3Vw
cG9ydA0KPiA+IGR5bmFtaWMgc2VsZWN0aW9uIGNhcGFiaWxpdHkgZm9yIG10ODE4OC4NCj4gDQo+
IEkgd291bGQgbGlrZSB0byBtZXJnZSB0aGlzIHBhdGNoIHdpdGggWzkvOV0uDQo+IEFsbCB0aGlz
IHNlcmllcyBsb29rIGdvb2QgdG8gbWUsIHNvIEkgd291bGQgbWVyZ2UgdGhlc2UgdHdvIHBhdGNo
ZXMNCj4gYnkNCj4gbXlzZWxmLg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQoNCk9LLCBUaGFu
a3MgZm9yIHlvdXIgaGVscCENCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_006_722249417.58592322--

