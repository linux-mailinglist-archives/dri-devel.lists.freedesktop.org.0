Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21576AB9E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 10:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C794A10E099;
	Mon,  6 Mar 2023 09:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B0110E099
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 09:33:30 +0000 (UTC)
X-UUID: f0be123cbc0111eda06fc9ecc4dadd91-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=37cNyof6sXf9DU1HIMm62VZfULPXBnyXorZnDil65xY=; 
 b=V+j28/g13IRVDZaBQgD/NHMqoPVcQD9bNVN/vLoXoNbsxrF9Z4TTqMybCCvR8tgRTEY12eAEF3Hlt6hdjr3H8BS2thuoTHuleNWnUPteXPWdCJWZ5Yv/wLLUsMC5/N0JO4dH4udLSoS3/kcJ9ybXBWvefUi26jE7TE17KQmgLbU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20, REQID:a51d3c9f-8498-403e-a18e-2057aaef7ac3, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:25b5999, CLOUDID:0c0e7727-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: f0be123cbc0111eda06fc9ecc4dadd91-20230306
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 563479225; Mon, 06 Mar 2023 17:33:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 6 Mar 2023 17:33:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 17:33:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdoRVeZiMFaHnWHupJdG09YBYW0ztL0LnhHeiTPGVnrsE4LH12YBw1eeDYcDog36avMviUvVKJo9Q9nTNP5JyAb+pMlL08fpVCzFgKC4zTR0WHu6iR5LtvgEZewbGcHLJPsEOcG+IGLeuKo3GBTxI5TPO8UupG9knWuUHjIefwxoN8CUEAes5ebjBLAE3aQY4AuRuF3TTDACvkwTsGzGsIC/H3TfIrZLWBXxKRryK9AgYg0GwMCWq8OTQjIPGBC7f7XFYKy87cITpSpirMzJfzj1z6ZRucOO0vXMmVYmUId1nMkzqZpZldlf8BwhckOq+0nW1B28A0UZm2P+PAlESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=;
 b=bni4Zl04y1EcPd3QgS0jGfolAefavoeJKpf0aeyT3Q71F+HiTgS7de6l4nHXfJGCaxRat3cZND8tMwFm3y19iT2gZX9IDoxn2k83wCuzUCnzjkCZx7qGrzJ852PgEq2NktnH9RAsHa/TQB7xleyC3vI+syoWIagUOvtNL59RKA19IpTeO9ini/XSL5a012i7cqP/BmIQVKY5X8tM+HW1QA7hYgIHV5mUwnyUbVi0AOBdOSR/ZxY0TVuXQ7zZbTO8DsQgo86K8OiINzW7viF0MIDppaThN9KXHYrZOa8c9oU1lWPVCDdQmcAqA5nwBZgEe+8neAccPLkgNFTwt4KgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga01whr8HMzr0QM7C31PQwLj+OU6tkY3Jf3DvW2v/vs=;
 b=acTbqO9J6nJ6dNt7LM1rreGGeFrSDWj6+i3/MFkgm31AXBNghoPnS06hSS6MufIZg7nOlDCJLelxekvUQ4JNVszrsV+wRqlPNQ7ybZuvlgicZjAPgQ/SW0IA1pIdQtxoWPht22z9mc+Av8lM5pCW2vZlRDvDhG1BanjANf7q+QA=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by SI2PR03MB5498.apcprd03.prod.outlook.com (2603:1096:4:123::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 09:33:18 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::f560:14f:26e3:74d8]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::f560:14f:26e3:74d8%6]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 09:33:18 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Thread-Topic: [PATCH v7 1/2] drm/mediatek: change mmsys compatible for mt8195
 mediatek-drm
Thread-Index: AQHZGce/MnRAbIbkqEmJgEyroyqYVK7bIZoAgBLIM4A=
Date: Mon, 6 Mar 2023 09:33:18 +0000
Message-ID: <f1376c4bc859b17a2d40203747b8362108f29d9e.camel@mediatek.com>
References: <20221227074759.5216-1-jason-jh.lin@mediatek.com>
 <20221227074759.5216-2-jason-jh.lin@mediatek.com>
 <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
In-Reply-To: <24f7dcf8-4f65-d397-b080-30840536012b@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|SI2PR03MB5498:EE_
x-ms-office365-filtering-correlation-id: c281081d-a7ca-44b4-f9e4-08db1e25d1a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xgaNWqTN6Q/gKFrQsdtFQ0Hm91IuB53lBhuR2qhvdhfx6q3nsO6QUCv43NMKOJJ3urnOGRdWff3ALQOYumjH+gmnguzAMM5DElr54UbQS6YgYAB++Y5RaC986ngrohyXcig7RKZOlsRqIAPvWwQr17q2XG6xuHR8FOecqwhQQkSybH6jjkivhlKhDn59uXGz0I/NTffUVMtJjsYmfqtIzrU01z9yfQOBepKhypyYmO9oRIWx1289xQ23M1d15lhA6VEKb/32tCnw+enDE4qcTrxy8nQV4ADXmkQXtIW7MYQAL5S4oiWi9RaZliR9/Dv1TpS06KmkF137QvR0UhZOTageMfIu1VA8ma1K736FxtVH2TDkcSo6JG4tDBwop3PZObddzRURH4OUmXTh16HteO+KdN6FoJKrUDAiYG1tVDj1m+VrGhBJde7iqGzgJFFgI1fufeNWq95t+GigMM3FKDOHhGhY9TJXDcm2Gjcwg+EmHKiKp6aBhUVT+HIfuOhh+X+Q7qM2LZQ/eOGfo9Rx3XIMw6k02OPBF1kFi2/PyQfNJjO0UGJcjOiEeKpIjtdxqfbVuA7DYHrduh0PObEnAn7hfxwOC2uSvvdQzmIrKgtiYNsr2s+D1bvYf5q9gs6AFB2qphYYflYzjUOmx/HdAlJxAMZnGCCanHTxE0eNLfczrvwZKRuVKudWKC5ak5TI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199018)(186003)(122000001)(38100700002)(91956017)(38070700005)(8936002)(41300700001)(4326008)(66556008)(66946007)(8676002)(64756008)(2906002)(5660300002)(76116006)(71200400001)(478600001)(107886003)(6506007)(2616005)(66476007)(26005)(6512007)(966005)(6486002)(110136005)(316002)(54906003)(36756003)(85182001)(83380400001)(86362001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmNnb1BwSEZkWUtiVUtKQnVqNTVzdUJldGdDLzFWNTBoaHBwVytyWGZSaTB1?=
 =?utf-8?B?QW9QNU9DWWJDeXFtVWdWUllGV2xBY0pLL0pPVUNBSmE4NzU3UjNpT212Y1V2?=
 =?utf-8?B?L0FvL2g5RXNDVk9sZlRPZk03RFh4NEhhZW9oZkNkNDlKSHJRWkhrUzFyZ2Yw?=
 =?utf-8?B?c3FUREhzY0JKYzYrVndQOVNRemhHWXJBNS9aZTVPZ21Jc2ErTW0rdmpJZzJK?=
 =?utf-8?B?ekRtZFptOXVKUUppMXRyVGp5YXpkZ0tZak5IR0d2WWNOME5hMmpTbnV0STlY?=
 =?utf-8?B?NElDUkt1Z3c2MU9HckNvUFQ1TjltSXdQVGJNaWtvOElSbFJaR3NrSTRKaDVF?=
 =?utf-8?B?Rk5sUzdkdzBUTURaY1lFQkdVK0c0R0d6MGdFS2daNE5EV0Z1Z0MyTjhtMDBM?=
 =?utf-8?B?MkQ0TGl3OE5PYW9JN2p6Wk4wUndHdTJGUEpCTzlmeXdSZTVVeTgweDVEZ1Ns?=
 =?utf-8?B?U0tJc3lWVk5NT0RRWmE5czhKVG9vdWJCdDhPYmlESzJYbVdaaUpkMnVZc2lv?=
 =?utf-8?B?Z3FMQWR1WHYrekl3d2JFVW5ITkZoV2hvUGVPckVNTTVFNGRsblNLUFNMYmFJ?=
 =?utf-8?B?WGl4MDJOUEhLQVhUcDJRWllmbVFGcUdCTmdhck5JcmV5OHhLRkIySHZOVVdZ?=
 =?utf-8?B?YmZYSWlyL2pWSXk4YXkwam1hMXlDOXNzNjMxZGMraUxFU2VYb1kxYjR3TTRK?=
 =?utf-8?B?MlhlUnNZeEFCbjdCM3hRaHhjUGZrMm5sVTd2Rkdvd3Exb1RFcUtObUFlVEcx?=
 =?utf-8?B?MDJOeExOMnRwTCtrVmhGZXVxYmNyaWMrck1vaUpMWTc1K2UrWU45djdQcGFV?=
 =?utf-8?B?S21uMkp0Y2tiMTNpV2lHSDVtRlM3aWRGRGpacW5mTWpFNHV6L2xrOFQzdmF6?=
 =?utf-8?B?ZFRpTFB1YlF3NzhBOG5CZjh5YXpKZXJXL0N0bWpqaG0xOERsSGJTNHBqK2d5?=
 =?utf-8?B?ajVDVlRxcFByVE5XSytpbFB0bGNOeW1SeEhFQ1FYcUxBQXg1MEd6VkRQUkFk?=
 =?utf-8?B?bUtnNmcxWFNoejNrNWtrSGsyK2FSdmtCYnF6c0pQUkxpSUlFYjM1bFNQWEM3?=
 =?utf-8?B?V0ZPc0lzeGltVE9RZmJLWFA1b0VGNHROL1NOTFRaZmtMRDk0a2doMHcrOU9D?=
 =?utf-8?B?eTJERzdFQVVmSnJ1RkFCWjlmWVlUNkVEWXNDcE1BYk5tbGZRREw3RGtRZSs1?=
 =?utf-8?B?WWJYYjBkdmVvcXA5TVRVS3FRa2Y2QVZYR05NN2VNSXphaFlSbXkxSjJUdGxY?=
 =?utf-8?B?cVgydDhtZHdCbGh5OFp5QnNQTWlWTXVkUmhvMWFHckdwaFBPcDdBblZjYzc4?=
 =?utf-8?B?SlByaFQyb0FHclhQeUtvMnZHN1M5dEcvbk44ZWY4QldtcXZtT0hvZGVmZVJM?=
 =?utf-8?B?NDlXVE9qMnhKYnFaN0tvVzhIc1Z1NHpRNFZZeVRpd25DbEdZTWZqTFhPUkVK?=
 =?utf-8?B?VllQLzFZWmpLZ3NZTTBRMkZRMkhlMms4N1E4VmZONitTa29ZcVJJWGJLTnhp?=
 =?utf-8?B?NCs1cVU5TStzSXFaUnVBMVl1dDdsTDRpbjZJaEh6aHMySjNDSHZmdmdLKzlr?=
 =?utf-8?B?S2hjcXhpV3V3TVg4djdEdUY3dXhTTjdkYjFGMFlHK21aSXRIclJQUXRLeVRL?=
 =?utf-8?B?a1pkL0JMT3lkWUFPUWt2dkJWWFErVDd3ZG1OeUg3QTQ3aExaUmNKNWN6Z0Vy?=
 =?utf-8?B?c21KeDZRbjhYQjROYm9TLzdDb2lFSFZxazhMUzBaZ1JUYXFQS0hHbVF0dStW?=
 =?utf-8?B?Z0FmcTBXT3NHZ3BISHVEMS9EYUdyMTRuTmFVVGxXUVRDSEo4dE8wWm9OOFc3?=
 =?utf-8?B?R2pqZEplWm0va0dOYWFWL2swN3h4UWt0WU81K3FlZGt4SURRMHRRc3lhMEcv?=
 =?utf-8?B?ZklQNktEeGgrdzRIU0hqZVB3eUlsK3R6TTdqeCs1amJTcDFXVTUvekVndEJW?=
 =?utf-8?B?ZmpPdWNXeGdCUVhEbzA4aHZ0Tk1hTkdzdnZBZmFIM3ptOVBrK3NhVWJsY0M0?=
 =?utf-8?B?dU9QeVVMeUxwYlJ0VTNVOE5uTjZFbTZ1Qlg5dmJFSzBzK0V3ZWM3b1JqdjVn?=
 =?utf-8?B?NEcraklJenJ0Zno4dFUxcERyYUt0ZXBxcW9qbmFZQlo2eVNUcHN2MlEyMnhD?=
 =?utf-8?B?TElpSlJmVy84ejBjenJjUnpnSDloTHlvNHlBdFRXZzhwdG1lSHRKenI4L3Q3?=
 =?utf-8?B?Vmc9PQ==?=
Content-ID: <CCEB970D2B1AFE499A17770686902447@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c281081d-a7ca-44b4-f9e4-08db1e25d1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 09:33:18.2199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pa4hsHsTGdhUMLlz/Q/0SRnUwQ+L52jq9UBlGnqtKYZpBDU7ZWOKswEMlgXwDX9yA0Qr6TKfMNllMa0WP33B5oO1MXfdEoLUaIZSOi+0G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5498
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1834454553.1797533687"
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
Cc: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1834454553.1797533687
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmll
d3MmIzMyO2FuZCYjMzI7c29ycnkmIzMyO2ZvciYjMzI7bWlzc2luZyYjMzI7dGhpcyYjMzI7bWFp
bCYjMzI7OiYjMzk7KA0KDQpJJiMzOTt2ZSYjMzI7cmVzZW50JiMzMjt2OCYjMzI7dG9kYXk6DQoN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDIzMDMwNjA4MDY1OS4xNTI2MS0yLWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQoNClJl
Z2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KT24mIzMyO1dlZCwmIzMyOzIwMjMtMDItMjImIzMyO2F0
JiMzMjsxMTo0NCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjsyNy8xMi8yMiYjMzI7MDg6NDcsJiMzMjtK
YXNvbi1KSC5MaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7QmVjYXVz
ZSYjMzI7Y29tcGF0aWJsZSYjMzI7b2YmIzMyO210ODE5NSYjMzI7aXMmIzMyO2NoYW5naW5nJiMz
Mjtmcm9tJiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTUtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttbXN5
cyZxdW90Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7dG8mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS12
ZG9zeXMwJnF1b3Q7Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtXZSYj
MzI7aGF2ZSYjMzI7dG8mIzMyO3JldmVydCYjMzI7dGhlJiMzMjttdWx0aXBsZSYjMzI7Y29tcGF0
aWJsZSYjMzI7ZmluZGluZyYjMzI7ZnVuY3Rpb24mIzMyO2FuZA0KJmd0OyYjMzI7Jmd0OyYjMzI7
YWRkJiMzMjtkcml2ZXImIzMyO2RhdGEmIzMyO29mJiMzMjttdDgxOTUmIzMyO3Zkb3N5czAmIzMy
O3RvJiMzMjttZWRpYXRlay1kcm0mIzMyO2FuZCYjMzI7dGhlJiMzMjtzdWINCiZndDsmIzMyOyZn
dDsmIzMyO2RyaXZlci4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0phc29uLUpILkxpbiYjMzI7Jmx0O2phc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jJiMzMjt8JiMzMjsm
IzMyOyYjMzI7NiYjMzI7KysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyYjMzI7JiMzMjsmIzMyO3wmIzMyOzEyOCYjMzI7
KysrLS0tLS0tLS0tLS0tLS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0tLQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oJiMz
MjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOzYmIzMyOy0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzMyOyYjMzI7MyYjMzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjsyMCYjMzI7aW5zZXJ0aW9ucygr
KSwmIzMyOzEyMCYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9yZG1hLmMNCiZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzBlYzJlNDA0
OWUwNy4uNjZjZGQwYmMxMzExJiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0zNzAsNiYjMzI7KzM3MCwxMCYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2Rpc3BfcmRtYV9kYXRhDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjttdDgxODNfcmRtYV9kcml2ZXJfZGF0YSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjsmIzMyOy5maWZvX3NpemUmIzMyOz0mIzMyOzUmIzMyOyomIzMyO1NaXzFL
LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrc3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMz
MjttdGtfZGlzcF9yZG1hX2RhdGEmIzMyO210ODE5Ml9yZG1hX2RyaXZlcl9kYXRhJiMzMjs9JiMz
Mjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLmZpZm9fc2l6ZSYjMzI7PSYjMzI7NSYjMzI7KiYjMzI7
U1pfMUssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210
a19kaXNwX3JkbWFfZGF0YSYjMzI7bXQ4MTk1X3JkbWFfZHJpdmVyX2RhdGEmIzMyOz0NCiZndDsm
IzMyOyZndDsmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsuZmlmb19zaXplJiMz
Mjs9JiMzMjsxOTIwLA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtAQCYjMzI7LTM4MSw2JiMzMjsrMzg1LDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2Nv
bnN0JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZA0KJmd0OyYjMzI7Jmd0OyYjMzI7bXRrX2Rp
c3BfcmRtYV9kcml2ZXJfZHRfbWF0Y2hbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDttdDgxNzNfcmRtYV9kcml2
ZXJfZGF0YX0sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGlibGUm
IzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kaXNwLXJkbWEmcXVvdDssDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE4
M19yZG1hX2RyaXZlcl9kYXRhfSwNCiZndDsmIzMyOyZndDsmIzMyOyt7JiMzMjsuY29tcGF0aWJs
ZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTkyLWRpc3AtcmRtYSZxdW90OywNCiZndDsm
IzMyOyZndDsmIzMyOysmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7bXQ4MTkyX3JkbWFf
ZHJpdmVyX2RhdGF9LA0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRp
YmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTUtZGlzcC1yZG1hJnF1b3Q7LA0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7JmFtcDtt
dDgxOTVfcmRtYV9kcml2ZXJfZGF0YX0sDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7e30s
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NhbiYjMzI7eW91JiMzMjtwbGVhc2UmIzMyO2Ryb3AmIzMy
O3VucmVsYXRlZCYjMzI7Y2hhbmdlcyYjMzI7aW4mIzMyO210a19kaXNwX3JkbWEuYyYjMzI7YW5k
JiMzMjtzZW5kJiMzMjthDQomZ3Q7JiMzMjt2OCYjNjM7DQomZ3Q7JiMzMjtXZSYjMzI7c2hvdWxk
JiMzMjthaW0mIzMyO3RvJiMzMjtnZXQmIzMyO3RoaXMmIzMyO2VudGlyZSYjMzI7dGhpbmcmIzMy
Oyg4MTk1JiMzMjt2ZG9zeXMxKSYjMzI7ZmluYWxseQ0KJmd0OyYjMzI7dXBzdHJlYW0uDQomZ3Q7
JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7QWZ0ZXImIzMyO2Ryb3BwaW5nJiMzMjttdGtfZGlz
cF9yZG1hLmMmIzMyO2NoYW5nZXM6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYj
MzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiAN
CnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCks
IGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K
PC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_1834454553.1797533687
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzIGFuZCBzb3JyeSBmb3IgbWlzc2lu
ZyB0aGlzIG1haWwgOicoDQoNCkkndmUgcmVzZW50IHY4IHRvZGF5Og0KDQpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMzAzMDYwODA2
NTkuMTUyNjEtMi1qYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KDQpSZWdhcmRzLA0KSmFzb24t
SkguTGluDQoNCk9uIFdlZCwgMjAyMy0wMi0yMiBhdCAxMTo0NCArMDEwMCwgQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IElsIDI3LzEyLzIyIDA4OjQ3LCBKYXNvbi1KSC5MaW4g
aGEgc2NyaXR0bzoNCj4gPiBCZWNhdXNlIGNvbXBhdGlibGUgb2YgbXQ4MTk1IGlzIGNoYW5naW5n
IGZyb20gIm1lZGlhdGVrLG10ODE5NS0NCj4gPiBtbXN5cyINCj4gPiB0byAibWVkaWF0ZWssbXQ4
MTk1LXZkb3N5czAiLg0KPiA+IA0KPiA+IFdlIGhhdmUgdG8gcmV2ZXJ0IHRoZSBtdWx0aXBsZSBj
b21wYXRpYmxlIGZpbmRpbmcgZnVuY3Rpb24gYW5kDQo+ID4gYWRkIGRyaXZlciBkYXRhIG9mIG10
ODE5NSB2ZG9zeXMwIHRvIG1lZGlhdGVrLWRybSBhbmQgdGhlIHN1Yg0KPiA+IGRyaXZlci4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRl
ay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
cmRtYS5jIHwgICA2ICsrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyAgIHwgMTI4ICsrKy0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgIHwgICA2IC0tDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEyMCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiA+IGluZGV4IDBl
YzJlNDA0OWUwNy4uNjZjZGQwYmMxMzExIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+ID4gQEAgLTM3MCw2ICszNzAsMTAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGENCj4gPiBtdDgxODNfcmRtYV9kcml2ZXJfZGF0
YSA9IHsNCj4gPiAgIAkuZmlmb19zaXplID0gNSAqIFNaXzFLLA0KPiA+ICAgfTsNCj4gPiAgIA0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX3JkbWFfZGF0YSBtdDgxOTJfcmRtYV9k
cml2ZXJfZGF0YSA9IHsNCj4gPiArCS5maWZvX3NpemUgPSA1ICogU1pfMUssDQo+ID4gK307DQo+
ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2RhdGEgbXQ4MTk1
X3JkbWFfZHJpdmVyX2RhdGEgPQ0KPiA+IHsNCj4gPiAgIAkuZmlmb19zaXplID0gMTkyMCwNCj4g
PiAgIH07DQo+ID4gQEAgLTM4MSw2ICszODUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZA0KPiA+IG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoW10gPSB7DQo+ID4gICAJ
ICAuZGF0YSA9ICZtdDgxNzNfcmRtYV9kcml2ZXJfZGF0YX0sDQo+ID4gICAJeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxODMtZGlzcC1yZG1hIiwNCj4gPiAgIAkgIC5kYXRhID0gJm10ODE4
M19yZG1hX2RyaXZlcl9kYXRhfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWRpc3AtcmRtYSIsDQo+ID4gKwkgIC5kYXRhID0gJm10ODE5Ml9yZG1hX2RyaXZlcl9kYXRh
fSwNCj4gPiAgIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1kaXNwLXJkbWEiLA0K
PiA+ICAgCSAgLmRhdGEgPSAmbXQ4MTk1X3JkbWFfZHJpdmVyX2RhdGF9LA0KPiA+ICAgCXt9LA0K
PiANCj4gQ2FuIHlvdSBwbGVhc2UgZHJvcCB1bnJlbGF0ZWQgY2hhbmdlcyBpbiBtdGtfZGlzcF9y
ZG1hLmMgYW5kIHNlbmQgYQ0KPiB2OD8NCj4gV2Ugc2hvdWxkIGFpbSB0byBnZXQgdGhpcyBlbnRp
cmUgdGhpbmcgKDgxOTUgdmRvc3lzMSkgZmluYWxseQ0KPiB1cHN0cmVhbS4NCj4gDQo+IA0KPiBB
ZnRlciBkcm9wcGluZyBtdGtfZGlzcF9yZG1hLmMgY2hhbmdlczoNCj4gDQo+IFJldmlld2VkLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gDQo+IA0K

--__=_Part_Boundary_001_1834454553.1797533687--

