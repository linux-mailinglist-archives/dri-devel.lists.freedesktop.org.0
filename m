Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DFB72B9C7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE39410E1B4;
	Mon, 12 Jun 2023 08:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6F10E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:06:59 +0000 (UTC)
X-UUID: 1604a7d408f811eeb20a276fd37b9834-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XRXpGlhqT0h2WJ8GlXIdE4Pc5MlA/5cPFYZtBsfbqFs=; 
 b=CkCJwGUdzoHefISjLc9llUdaXX8QgSf1e3iDhU05qXo1WKAKSFT5G8r0DpN8r1A/BpP9d+gNbHaP5uBLUmLUbzimZQoZEjfIXmMsj/Vlccfqeaf98YLzmTGvIsqKLc2nddLUR2KpufCdKo0WL6eokq550m20yJ60BfDf0pSz6fE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:5ed192c1-28e8-4549-a4a7-e252d0fd6398, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:cb9a4e1, CLOUDID:dd15243e-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1604a7d408f811eeb20a276fd37b9834-20230612
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1690894677; Mon, 12 Jun 2023 16:06:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 16:06:49 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 16:06:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAdYOLADa1KeQLHExsJ3tY5csBJJRB52PHr/qIsjdmwSL6gQlwaQ1lBty3XTLF3cxHueLdmZyvGoOKtiMOTRvqzq1OQlmihBjtSZjBJQ8ok0dkZHsADlYCKbsWv4kIFPVCij6Hgqw3ynAoBUtpm0GbOIC0n6NDTl+P/nkrwgmnc2oMYgQO6sCiyOrE1p/xjZGQVg9PZk7jUYjM05aDW8aE/tvNjB+dpM8vJyGHAtb4F9bTIYn4T+81xkCmrVn8UgShFYRUJ2Moe9og0t7Lfcv8y7DnaPKyIgt55L+i5EEACjx+v2osa0Xwy1xsKhkjetM50vFramvAD/rLRgN7RWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HH9zLb3Gy7rOvad9zB0nHtjORohOCRdqXHYRb0pLKE=;
 b=J4t/0CDm5Bx7BdYywoP3lGG9NmBK1ldLjXuK4ycaBwtIYqbkrcCj7tF0qA7ny4k0aAzmvDVJCDFlKqkTomkFHZfWajCLkYhcMCDsjE3zpmD96u/04LVs4z8kGjCpagXbzbA7tR7cC0U0SGCk7ZV2MXtuhCtb1QxhdHtRGNZZdFTD8CQ/g2U/bUinkhXRQSDZmLyAAqOaq4obB1h/jkEKiK/rjLrJC4ksMO69trQiTOM/uiGJvKWuEipdnGTanGFocmEZdlbtw8BqGkn13mKO+BiZeVZVX2PJspOMHnonEgVdMU9aVt3+QiP/+mgDG9QFVD+Mj4j2cBNORDJ/x6HyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HH9zLb3Gy7rOvad9zB0nHtjORohOCRdqXHYRb0pLKE=;
 b=bEcDmFwTE9OKp0oXzqIYaWEEc1aK6QK1MuwigplryLqBLCyoW1QNOSqqg1oTMgqYxzxzdiRRus5FKWmY47BKRfmzIJJsATnPt3dx5hgRHOTXQ7RJm68oSLsB5YexvH5pmxpJKgZTqZcSSYbiDbR7fzBFoi5P+fRQ1Q3pIyKAf2g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7954.apcprd03.prod.outlook.com (2603:1096:400:465::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 08:06:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 08:06:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/5] drm/mediatek: Remove freeing not dynamic allocated
 memory
Thread-Topic: [PATCH 1/5] drm/mediatek: Remove freeing not dynamic allocated
 memory
Thread-Index: AQHZaRzwMJJDPOPx3km55eBytHqn8q+HN3CA
Date: Mon, 12 Jun 2023 08:06:47 +0000
Message-ID: <2ff94f781b17c25229d547e763f74ef43aac35f6.camel@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
 <20230407064657.12350-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20230407064657.12350-2-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7954:EE_
x-ms-office365-filtering-correlation-id: a1a1c007-08ff-4ab6-3335-08db6b1bf829
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BQtcVuI/L0+5zKPg9O2ohXyKB2PkHIpU3XbhDXkVPlJMMRDH+AVaViuLAzwfQ6/NH51xQNj3Vl+yUCzecRx871JnUzi094taUFI1H3hDWTURWpShYeeZz48cUuXz4q31wL7mCluUplaBcGELq61PnePOu9cbdQ5UoMPOn91ZIaavVScg6wBcm3UXbBrULLQ1RJ4jRpC2iflJqnGGITzxMRbxPKLKkmliNt4mhRZhAyFeSOCAG0+IqKQNYtcjGCdi/T+syjwXVeL0m/V85OT7yV1WMvuq0aAU8fY6iEBKcOML5KmBH1g1YmGF7hHF+y+yLqpLMkKfC9x48kYOPCjyvD47K+U0DnNtqsXsuM2yG6CgzlZx+73JYwiz+rTgmqVURfK00mLIUCBdWd/9o/9LPKgPh8YD8nUeVKYZFXgSw4IMHD3sTkNcGrIx/5Bxs8cM2QvCa+GZdvor+0ggwNPft6BhiMedHysCWMGnF8qH+682sRb7NqOjIM5KgU5WnvUhmeSzU3ZXyJiR3tuvbf/5HGBjgm7+IvbQs7HVtMONT9iiTwR6H/2LW+NVGNS9gwFWuVwnEg6qJJ1kb1YOd0akTqsKMHmYT5Tbez7JSphp6RKN9fqyhlpA2kQ3sCpwZSR0No9pjmczDQ+qrDreKaSVOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(66476007)(66446008)(66556008)(85182001)(36756003)(86362001)(66946007)(8936002)(41300700001)(4326008)(8676002)(64756008)(76116006)(316002)(6486002)(478600001)(54906003)(71200400001)(2906002)(5660300002)(110136005)(4744005)(38070700005)(38100700002)(186003)(122000001)(83380400001)(2616005)(26005)(6506007)(6512007)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjdKY3crQ3ZMTFVqM2dsaTBiVFhHQ1JHZW9yWE9mSm4vell2bkJObXplQnFV?=
 =?utf-8?B?c21MUkpORHlrTHZmRUVZUDlPWnU3Sk5EdmUzc2ozcWZ3amxkejBCdHNkVVlP?=
 =?utf-8?B?aXlEWlRuV3Z0bC9oekY3T2xSOHo0N3BSaW9vYXJRUksxOFNvSlBCa3RCWWlW?=
 =?utf-8?B?NUUwODllNjBaVStxRXltc1JSMHNpTENEcExGWm5vQkVWczg4bnZWRDc2NERC?=
 =?utf-8?B?ZGlHdDlOVENmMmNJcnhnczV5cGpNNHB5ekhBMDZSRUg2UFZMRFRBQ281eDho?=
 =?utf-8?B?ajU0Y1JVRWNDcUw4RnZYL09mTW1Gdk5lZlV1YWJLSXZVT0RVVi90ZzFxK281?=
 =?utf-8?B?VFpycWt0SHJ1ZXExWDdXeG55Sm5EZ2Q1V3ZkUEU3UzJ1bDhvYTRGTUl0L2N0?=
 =?utf-8?B?S3BDRlV6eGVvY1dpelNsKzJEZ0g1UTJKU3RVNkNKVjBNei9ZMVZERnh3amFV?=
 =?utf-8?B?WWxaaTcxZGJIdk10QzRtdmR1M0VrNSt1Q0RkZEYvbUhmd25nYld4WWg0YTY5?=
 =?utf-8?B?MldmRHB3L0F6aC9UbWtHWVN3RjdpREN1bzk0WjZxb3ozV2UrYWhrQWpPL0Fz?=
 =?utf-8?B?MFhQL1lMeXFUNzY0YlNmVzVMTkRaQXlJSXE4aTBXdytpZlRXM3FUUHY5MkVK?=
 =?utf-8?B?cHJCVDZ2b2YzamFDZWZGVjl5NmdPdTlIZGk1c3R6RTBwaEZ3VStubnBRZVdn?=
 =?utf-8?B?ZVRqQTFWWlIzbTlmMmVMYk5tN1VRQ0lEM0xLcjU2UkZMOUR6eDVQelhSMElR?=
 =?utf-8?B?QTZqYmtadEM1dUlsRnJoRzIyREtRcFFIRkNqakU5VzB1U0FrSTJHVVpNdXRN?=
 =?utf-8?B?WXpzMHFRVnJKOTFGblZOMWxFanRJS0dZdEpGT2t2bzhtdms3TjI0Wis5ZWs5?=
 =?utf-8?B?WnZOQlRyT1dPNk1KYXJXWVNyYm9DYmM5UXh6dGVxdmh4eFNBcDl6V0NxMmVq?=
 =?utf-8?B?SmhySzNrYWhBODRpOHo1Wk1LTUxYVkFSdDNHcGxrV3RHTWZDUFV6TCt1STVw?=
 =?utf-8?B?eW94Sk50cE9EMW8wSnV5OFBPL2J0bXY0S0NLNGlKc3RrZWd2L3dJRmJFdkZT?=
 =?utf-8?B?TWpEU1drMEVNbEJabGlRR3ZZOFBOKzVQQnVaMkVRZHFDRjRmVU8yRWpnVG9P?=
 =?utf-8?B?Q1pCbzhpQXJnQ0c5UWE2QjE2bEJqVVdkN0ozYWEvZlBWQjA0bmJ0ZDdsMzdG?=
 =?utf-8?B?TkM2OTg3ZWZBenNMRUZSbDV5QURHWjhxbFRMdUhZZVY1RUUzeTdtU1ZqOTZY?=
 =?utf-8?B?N093dU42U3BNbkxscVUyeXp1OTk5dW91VTlwTkkwZDRudkJTMWVmQ1JsTzRT?=
 =?utf-8?B?Qm13My9keE5IaVQ3QTVFalZiMTlEYXpyOVF6VWVhdmx2aTVERC9EdGJReVJx?=
 =?utf-8?B?VXJucWpLdVVPVVpjNFpkUTdEVG5NVWJQWmI3d3RvaTZiYlh2Y29LeFVxSmJp?=
 =?utf-8?B?L1dqcUVicWEyWmsvM1Q3a3V3emZWdjBPNjhNdGtqc2d1OVFCRTgrbDFEZUpN?=
 =?utf-8?B?L3pOOURqUFJ4bkhSbVJQemZjTFEydHE4ZzBRaWNiMTU0Q0dKcWkwd1hIVSs5?=
 =?utf-8?B?SHEvcHlpRVRhdmtnN1RkSjI5ZXNMTUV6NFZrOTVkbitoVDR0VWRpRnh6YXU5?=
 =?utf-8?B?UnJjd3VrQ2l4MWkwcmlVYVFIaW4yV0FOcldsVGZSTEYrY3B1TXVISzhnd2dC?=
 =?utf-8?B?K3htTkhOdFMrVkFNMU9vWHE3VWpFR2JEb1I0d0QxVUxIaU83dHlITTRKM3FV?=
 =?utf-8?B?U0dxYWZOZlZNNkhmU1ZRK2RyTUJoOUZZREpNRjVDNUVaZEp5V0w3aFVqbHdF?=
 =?utf-8?B?K2NmSjBnS3hPVUhvU3VpSjU1bTY3UVRWdy9Ka0pDcWVwS0t6Y1J4c1B2UjQr?=
 =?utf-8?B?cEtOa3Z4Mnoyby8rQXkrbWlwTCtVT0NTNVQvWUx4ZVZXWU1DZ1M2dFZ0SHVm?=
 =?utf-8?B?SXByYm05clY5bVNydS8vS0JxaHY2M3RGVlVQYVZxdlBqWFRmMU5mbEE5VXZI?=
 =?utf-8?B?aURYUUJ5RzR3SlFvZUlxcDhldzBmRnhtNzFzaFVzcXhaV0NWc3lwN1ZYNGRV?=
 =?utf-8?B?VC9xTXNOL3JIZEN0WGQ4RUFoV0FwcWswY1dYcThndldpVWkydTRZejhsZkxa?=
 =?utf-8?Q?KCwlWVppavibuq/eu8REqltkg?=
Content-ID: <A45876CB71367F4FA8FF7A5FB0511E5F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a1c007-08ff-4ab6-3335-08db6b1bf829
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 08:06:47.4432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPBKevBT4g8Y+U3Z+h7nsFIFhuVyCTb+hGbJjr0+W/sujrkksaNdTeQEG9ECXMN8BbL+B7ywpE5s/zujNscdsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7954
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_944988213.428800143"
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
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_944988213.428800143
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTA0LTA3JiMzMjth
dCYjMzI7MTQ6NDYmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0ZpeGluZyYjMzI7dGhlJiMzMjtjb3Zlcml0eSYjMzI7aXNzdWUmIzMyO29mOg0KJmd0OyYj
MzI7bXRrX2RybV9jbWRxX3BrdF9kZXN0cm95JiMzMjtmcmVlcyYjMzI7YWRkcmVzcyYjMzI7b2Ym
IzMyO210a19jcnRjLSZndDtjbWRxX2hhbmRsZQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTbyYjMzI7
cmVtb3ZlJiMzMjt0aGUmIzMyO2ZyZWUmIzMyO2Z1bmN0aW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7NzYyNzEyMmZkMWMwJiMzMjsoJnF1
b3Q7ZHJtL21lZGlhdGVrOiYjMzI7QWRkJiMzMjtjbWRxX2hhbmRsZSYjMzI7aW4mIzMyO210a19j
cnRjJnF1b3Q7KQ0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyYjMzI7fCYjMzI7MSYjMzI7LQ0KJmd0OyYjMzI7JiMzMjsx
JiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fY3J0Yy5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzRiYzQ1Y2RiZGRmMS4uYzdiMDNlNTY0MDk1JiMz
MjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmMNCiZndDsmIzMyO0BAJiMzMjstMTQ4LDcmIzMyOysxNDgsNiYjMzI7QEAm
IzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RybV9jbWRxX3BrdF9kZXN0cm95KHN0cnVjdA0K
Jmd0OyYjMzI7Y21kcV9wa3QmIzMyOypwa3QpDQomZ3Q7JiMzMjsmIzMyO2RtYV91bm1hcF9zaW5n
bGUoY2xpZW50LSZndDtjaGFuLSZndDttYm94LSZndDtkZXYsJiMzMjtwa3QtJmd0O3BhX2Jhc2Us
JiMzMjtwa3QtDQomZ3Q7JiMzMjsmZ3Q7YnVmX3NpemUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7RE1B
X1RPX0RFVklDRSk7DQomZ3Q7JiMzMjsmIzMyO2tmcmVlKHBrdC0mZ3Q7dmFfYmFzZSk7DQomZ3Q7
JiMzMjsta2ZyZWUocGt0KTsNCg0KDQpBbHNvJiMzMjtmaXgmIzMyO3RoZSYjMzI7c2FtZSYjMzI7
cHJvYmxlbSYjMzI7aW4mIzMyO210a19kcm1fY21kcV9wa3RfY3JlYXRlKCkuDQoNClJlZ2FyZHMs
DQpDSw0KDQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7I2VuZGlmDQomZ3Q7JiMzMjsm
IzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_002_944988213.428800143
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDQtMDcgYXQgMTQ6NDYgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gRml4aW5nIHRoZSBjb3Zlcml0eSBpc3N1ZSBvZjoNCj4gbXRrX2RybV9j
bWRxX3BrdF9kZXN0cm95IGZyZWVzIGFkZHJlc3Mgb2YgbXRrX2NydGMtPmNtZHFfaGFuZGxlDQo+
IA0KPiBTbyByZW1vdmUgdGhlIGZyZWUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IEZpeGVzOiA3NjI3MTIy
ZmQxYzAgKCJkcm0vbWVkaWF0ZWs6IEFkZCBjbWRxX2hhbmRsZSBpbiBtdGtfY3J0YyIpDQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgMSAtDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYw0KPiBpbmRleCA0YmM0NWNkYmRkZjEuLmM3YjAzZTU2NDA5NSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBAQCAtMTQ4
LDcgKzE0OCw2IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY21kcV9wa3RfZGVzdHJveShzdHJ1Y3QN
Cj4gY21kcV9wa3QgKnBrdCkNCj4gIAlkbWFfdW5tYXBfc2luZ2xlKGNsaWVudC0+Y2hhbi0+bWJv
eC0+ZGV2LCBwa3QtPnBhX2Jhc2UsIHBrdC0NCj4gPmJ1Zl9zaXplLA0KPiAgCQkJIERNQV9UT19E
RVZJQ0UpOw0KPiAgCWtmcmVlKHBrdC0+dmFfYmFzZSk7DQo+IC0Ja2ZyZWUocGt0KTsNCg0KDQpB
bHNvIGZpeCB0aGUgc2FtZSBwcm9ibGVtIGluIG10a19kcm1fY21kcV9wa3RfY3JlYXRlKCkuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+ICB9DQo+ICAjZW5kaWYNCj4gIA0K

--__=_Part_Boundary_002_944988213.428800143--

