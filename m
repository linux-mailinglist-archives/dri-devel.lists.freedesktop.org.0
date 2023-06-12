Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9072BA37
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C132E10E1BC;
	Mon, 12 Jun 2023 08:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E576B10E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:21:34 +0000 (UTC)
X-UUID: 2197255c08fa11eeb20a276fd37b9834-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=HikG+OqBzK9w48GbWMnrm7AqaMssmPDdCZnF4KtBZ/M=; 
 b=Qea/X0MNh5BZHNEcVJacfw8caVsnn8kD0KVlQ2vAQem0Y4CSIqYpUkMAFVgMh553T9GXiJhHOiE4LS94MU7FM5uOMK7x2Y/x0CpP2BDCKHLn4vVHaiBDEIcyDHPO1AGAQiog2n1BWx6DqujO3V8Qj+m4buzAKmUKIK8sqqQ6U6U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:c9fdc093-dedc-4585-b8a5-226ab13a264a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:cb9a4e1, CLOUDID:2199243e-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2197255c08fa11eeb20a276fd37b9834-20230612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1384863224; Mon, 12 Jun 2023 16:21:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 16:21:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 16:21:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7TYKeKM9AhG3ZeV2q4CCPkNmIwC9elqmKt2QbrFQr/0U/oAihKRiRKUeMTNLcfjFMRz4pv8leZpxUTbdNOgM2YsfhW1xWbQQkBUud9btxd8oTglqI0SCnS02Wx9Wzec0r1FyJl/uLx69e7pLrVa88Z8Mehj0gCSz0J7s94F+GQlKpc5hnpYLTBi9tbABGYTCM+Efh+tChIKbHnMXV0qMHJp6KHCsNrZ8T0cDfuxkKvb2iY8kOgk7DIlYIi+A523zsAIHX1uOA09xX9s4KtWQl6VrssP8CNCN6JVGlKldKQA7KbjNB6UaifUvCY5ivpi7gzAUusDh6lqxd0x+bQHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaRpETr7QbuMddJDkCEg87udlJMuxYxjRas3INZXvsE=;
 b=PC+pX6EGj8ugnt0Fx7lHQ0w48iVdHiCWFYPtW8EFFBRZaxwBI8zjGiQfrx8UDxr5U3HAscepclnGOaXbp4bz6WZd+fdqRHdy3ptL2IZS29VyVa/4VGDBHhhW17RPP4w+l0jiLkd1Fy8OJE3M/KqIbEjC6j3BgjW7hD4wq2c4rsFYZBFnNsBfiCzCcCtFxi+Invv300q0JUTO0zlp2oIUfZUyZhOiG4+gyUkTbpn0nbTI30kOZ5UhnodhJZglUgcFzbbWY6774ceC7UybqFswyqOx5BO1Eg7irIZi+d+Z13PTaG9fH8cqrXEPA6gsFReMsw8LIDl0Cq/15+j7ZPyyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaRpETr7QbuMddJDkCEg87udlJMuxYxjRas3INZXvsE=;
 b=ud/7qIaypXeiI/MBngOvUch/Z+Vd/SU9AtnCPONw/UEW0eV+HD3fJ6oiVjuQiosAwQy+up9+paBMXIS4IrIOMiLI4ikp+wwCkegodGLzT5waa/qhh5TviuYrjq/SBF5OpzHwvcpOdkbXhPQTiMFlYjDmDn5HRv4l98OP3ZTaz1I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8145.apcprd03.prod.outlook.com (2603:1096:990:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 08:21:25 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 08:21:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/5] drm/mediatek: Add cnt checking for coverity issue
Thread-Topic: [PATCH 2/5] drm/mediatek: Add cnt checking for coverity issue
Thread-Index: AQHZaRzkszaZPQv+JEqlqqeJL/E0hq+HO4eA
Date: Mon, 12 Jun 2023 08:21:25 +0000
Message-ID: <04d7db4fe0b8965da63f3f240289639941b7298d.camel@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
 <20230407064657.12350-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230407064657.12350-3-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8145:EE_
x-ms-office365-filtering-correlation-id: 27200524-1259-4b0c-8c67-08db6b1e03b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FRw9WgRmWj0jHCC2ab+Pf1hx7XPzA8N1c/JEOq+D1/JErJ2lrrIkxW0UJ9DZyw80818AbI7g8vcCd7Tetow9OGows1dRBaUQUpf3WjgAkRiUDfw+5+qlO+F4UZIY5Soa8cWe5p5j9B94DeWYSyHG1JyND1QJO2swvTMxCKRy8CNcYSuB5O7fBqczH6emUz16hWV2zb5PAcgKXijxsND0AXmS8AXQa9619ArkhNv6piVedSBDT4nAVeBvR1gTLfmugtugRJeLwJ0Ct04WtNpvkv3vGbQSPt3jraidXEK+oqq5GZNAH0dylM2Eif7/gdHv4MOYsuYlgK3UYqeK/brfbPJ1BDjc2qsUlkVfD/iB3j6WMrlOg1hstAgBVIgolG9ALpQChgOdBV5GZ6QCZ2hmySNK7u/DAbDJHznUzpDV4vHglCvNZvmYr1ZwQd2Zpl8Jq5pxgFCXikpODl2X4RTH/yksvSjYR9pD7BwG9sGhJjivvygE+aI1m4QTsamULc8+k6Pwf4dO5IrXmUGw7IrmL1i3TcLP8Li4SlmIz4Ud6bIKRDnwNidBPgNfjO3TdZmgiZG8git/iSUgy1DchlEnzJFEnZwwEPbampOVUVn5YRBRS7AFc36FQ5HUY3CWojfbk4zousE128yVDlQFFewHk2J0pZz4oouQVZjt6QoNdsI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(316002)(6486002)(41300700001)(83380400001)(86362001)(2616005)(38070700005)(6506007)(26005)(186003)(107886003)(2906002)(6512007)(122000001)(38100700002)(85182001)(8676002)(36756003)(5660300002)(8936002)(76116006)(66556008)(66476007)(66946007)(478600001)(91956017)(54906003)(110136005)(4326008)(71200400001)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1BPZlN4V1d3aVd2eGE3cjFFcTZFeVVSbkhQV1pFUllBUUZndWtRc1c3OFVL?=
 =?utf-8?B?M2FmUE91L3I0eG1MZGVoQjVpcm1oMzZ0Y3hpdUlJN0ZvTEVIWDYwNlRWQmZ6?=
 =?utf-8?B?anZjeVRwdU5XZXRwZVVSbEd3RXdtUGxGM0txNWord3d5R0ZBNnVBakNVZWxT?=
 =?utf-8?B?bjVwTlZVUkF5RXFFZ2JkZ0NEbmdPMkN4VU5EdTVsNXEraDI2SzEwUnVOdXVL?=
 =?utf-8?B?ZlpobmJiOW5hckFiNEM5dG9mUFRIVm9haC8rV2FYZmhMbW0zZVByQUxFdVpk?=
 =?utf-8?B?bW5jdjNiS1QzbVN4a1dOUHdmeWNUOVJ5VmgyS1hINy9iVWJYN3N0N2dtbncv?=
 =?utf-8?B?a2kyb1M3amFjbFZOYnZKOWZYeSt0Ui9NYzNrYlBNKytaQmtlMWJkUlA1Qk9k?=
 =?utf-8?B?RzUxMGdxL1k0eFRxdkFkKzFvYVhSQUFwR1dFYXd3VStZcVVUeEJIL0FSZEQ2?=
 =?utf-8?B?OTJtdzRHSkdzNUJnbHRGQjgzbzR0dVJXUWhFcVVVZkJIcUNudnU0WHJmbE96?=
 =?utf-8?B?amErYS9xN01GbmFzZFRUQW9OMEhmZWIvbGl6TkVYQ2FsY05paE42cWhJTVhB?=
 =?utf-8?B?MllOVlhWcVZvVzZEeDVyNHBPWmJyaThKaVgvcFJsRHRaR3ZMeVQ2amg5K2dU?=
 =?utf-8?B?K3NPVEZlZXlTZ0syZDE0dS82Z3RNVExWRGJoVFd0QUJLQ00xd2xvb2duZkpr?=
 =?utf-8?B?cFJObUw0KzVTUk1mUGIxNURtRjNFWFU4TXFjdHlERjYzZTY1L3VvbDJkZ0hF?=
 =?utf-8?B?OGRnTXJhMm1XTzhCdmVna0RFKzhhYnpCRVJhK0ZlQ2htN2d6cGRVR3JoZGpp?=
 =?utf-8?B?d0FGdC9FZ0dYNkJIMUZxU040VGwySTZHSXJTSE12MGQ2ZjZqZTYzTmx6MGlO?=
 =?utf-8?B?UDgyaGc1WWFQOUZicUNhNlY0N0U0UEg2Q2YyeE56aUI4SlZmZlpCMjVhZ0sv?=
 =?utf-8?B?R1NGZVBNNkdGUllYR3V0Uyt0QkxaZ0NpU2dsL2NsTUdrOU80UXRXeUVyV2NS?=
 =?utf-8?B?Ynp1MDlJMDZGUFNkdVp3cXUra0x0TWE3OVRaWVhrK3lDVW02cklFUHJLUHBR?=
 =?utf-8?B?Tlp3M0RyZ1F6VFRUVTI0cHozcVgzT2V3RmhzTnM4bktlRFRicHlwanNRN0ZE?=
 =?utf-8?B?SGtOaENRTWdoelZyMC9oMU92TjBtWk9pQkRscW96ZVF1elMrUDFYc1VZOTdN?=
 =?utf-8?B?ZElJY3IwUXl1aXNDdkczbTJQTzZSVkMrMWllSjQ5aFdvSUZiTmNuOHY3LzFV?=
 =?utf-8?B?M0M4Q09vNTF5ZXhFV1FQUjFOSDdvWnVPWEFWQkRORGVYRzJwQUIvV25nTi9w?=
 =?utf-8?B?bmZJMHdIV0t0MDYwMW9JdVhKZlVGaGNkWjBiR2FhdzcxZU05TEJaR0JHY0M4?=
 =?utf-8?B?U3cwTnkwUVNwbDJ6MnZodk5Wb1B1Mzg3QjRzNTcrT25ueHFFU21oSGZuUnNT?=
 =?utf-8?B?T3BhYlZsMHhQV3plZWhWbnRIODNSY0hiVmpQajhHa3kyNlNmQ0JRTlNJNEhy?=
 =?utf-8?B?ZFBqdlRVUUV3ekxjTy96dlhwWEc1cERoSnJKSFJjbG42U0pSVVBZWEprenh1?=
 =?utf-8?B?cmd5eW0yT3owSHNzZHFPZmc4b1JHSEN2b3c3MU1RYUV5UnFJakYzb2duaUd4?=
 =?utf-8?B?b2lQaWwzU3NmTTJMQTdRUFNKa0xqMDQ3akpiekk5ZjRISE1oV2FJSkdRMXJF?=
 =?utf-8?B?MWl3MnhLQ3N1YVBoOVBKdlpyN0RZcUpGQmVQeEpyOVlHeU1QS2JMLzgyV1Fr?=
 =?utf-8?B?REJqV0hURmc5d2RDMFJoMlRSQ1NSc3RIejEwQVNYdHY5cjNWbHdTQklZaHhK?=
 =?utf-8?B?WFpSZmpEeU5iejBFb2NSdFgraStLbzVrQmc3enRiUGQ1WWhYZVFUbUEvWm1n?=
 =?utf-8?B?MXJSZ0dnVmsvdXV2UVVsRDExTS9keHBTemVHOGRybGJEckd4MC9vemhvMzBn?=
 =?utf-8?B?cCt6bGt5ZENkZTVKMnRPMkdVZEF4QzVvaGlnbU5iTFlDT1BwTUVsV3M1Qi9K?=
 =?utf-8?B?VFZVemZnMEVCOE1lblF1b2dDSzUrQkNmejVWcFhhZm9EOE5oSHd6aENqSm16?=
 =?utf-8?B?UXFXdE5IaUxwM1hreHg0RFZneHoxdUpFR3dpL1o2b3lWMnRITmZ4UnVBWkxa?=
 =?utf-8?Q?YUduLZ14bfImKXNkiYyqIIduk?=
Content-ID: <FDF2AF052951914B9E97C70343B9646C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27200524-1259-4b0c-8c67-08db6b1e03b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 08:21:25.8637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/PSZXgUbblxQaDvF4VkEzKdm1tzejd2dd08TYQ8NuvVDyT1/b/kCdvYFQKlQZNFltlWah9KWRmFlHc05wyjHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8145
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1218808078.1092718616"
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

--__=_Part_Boundary_003_1218808078.1092718616
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTA0LTA3JiMzMjth
dCYjMzI7MTQ6NDYmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0NFUlQtQyYjMzI7Q2hhcmFjdGVycyYjMzI7YW5kJiMzMjtTdHJpbmdzJiMzMjsoQ0VSVCYj
MzI7U1RSMzEtQykNCiZndDsmIzMyO2FsbF9kcm1fcHJpdltjbnRdJiMzMjtldmFsdWF0ZXMmIzMy
O3RvJiMzMjthbiYjMzI7YWRkcmVzcyYjMzI7dGhhdCYjMzI7Y291bGQmIzMyO2JlJiMzMjthdCYj
MzI7bmVnYXRpdmUNCiZndDsmIzMyO29mZnNldCYjMzI7b2YmIzMyO2FuJiMzMjthcnJheS4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7SW4mIzMyO210a19kcm1fZ2V0X2FsbF9kcm1fcHJpdigpOg0KJmd0
OyYjMzI7R3VhcmFudGVlJiMzMjt0aGF0JiMzMjtzdG9yYWdlJiMzMjtmb3ImIzMyO3N0cmluZ3Mm
IzMyO2hhcyYjMzI7c3VmZmljaWVudCYjMzI7c3BhY2UmIzMyO2ZvciYjMzI7Y2hhcmFjdGVyDQom
Z3Q7JiMzMjtkYXRhJiMzMjthbmQmIzMyO3RoZSYjMzI7bnVsbCYjMzI7dGVybWluYXRvci4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U28mIzMyO2NoYW5nZSYjMzI7Y250JiMzMjt0byYjMzI7dW5zaWdu
ZWQmIzMyO2ludCYjMzI7YW5kJiMzMjtjaGVjayYjMzI7aXRzJiMzMjttYXgmIzMyO3ZhbHVlLg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsm
bHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7MWVm
N2VkNDgzNTZjJiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYjMzI7TW9kaWZ5JiMzMjttZWRpYXRl
ay1kcm0mIzMyO2ZvciYjMzI7bXQ4MTk1DQomZ3Q7JiMzMjttdWx0aSYjMzI7bW1zeXMmIzMyO3N1
cHBvcnQmcXVvdDspDQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMmIzMyO3wmIzMyOzQmIzMyOysrLS0NCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMoKyksJiMzMjsy
JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMy
O2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyO2IvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyO2luZGV4JiMzMjs4
NjI1NWEwNjZmYWYuLmZjZmExMDMzMjE2NiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCiZndDsmIzMyOysrKyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7QEAmIzMy
Oy0zNzgsNyYjMzI7KzM3OCw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtib29sJiMzMjttdGtfZHJt
X2dldF9hbGxfZHJtX3ByaXYoc3RydWN0DQomZ3Q7JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7
JiMzMjsmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZCYjMzI7Km9mX2lkOw0K
Jmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZV9ub2RlJiMzMjsqbm9kZTsNCiZndDsmIzMy
OyYjMzI7c3RydWN0JiMzMjtkZXZpY2UmIzMyOypkcm1fZGV2Ow0KJmd0OyYjMzI7LWludCYjMzI7
Y250JiMzMjs9JiMzMjswOw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2NudCYjMzI7
PSYjMzI7MDsNCiZndDsmIzMyOyYjMzI7aW50JiMzMjtpLCYjMzI7ajsNCiZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjsmIzMyO2Zvcl9lYWNoX2NoaWxkX29mX25vZGUocGhhbmRsZS0mZ3Q7cGFyZW50
LCYjMzI7bm9kZSkmIzMyO3sNCiZndDsmIzMyO0BAJiMzMjstMzk3LDcmIzMyOyszOTcsNyYjMzI7
QEAmIzMyO3N0YXRpYyYjMzI7Ym9vbCYjMzI7bXRrX2RybV9nZXRfYWxsX2RybV9wcml2KHN0cnVj
dA0KJmd0OyYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjtjb250aW51ZTsNCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2FsbF9kcm1fcHJpdltjbnRdJiMzMjs9JiMzMjtk
ZXZfZ2V0X2RydmRhdGEoZHJtX2Rldik7DQomZ3Q7JiMzMjstaWYmIzMyOyhhbGxfZHJtX3ByaXZb
Y250XSYjMzI7JmFtcDsmYW1wOyYjMzI7YWxsX2RybV9wcml2W2NudF0tDQomZ3Q7JiMzMjsmZ3Q7
bXRrX2RybV9ib3VuZCkNCiZndDsmIzMyOytpZiYjMzI7KGNudCYjMzI7Jmx0OyYjMzI7TUFYX0NS
VEMmIzMyOyZhbXA7JmFtcDsmIzMyO2FsbF9kcm1fcHJpdltjbnRdJiMzMjsmYW1wOyZhbXA7DQom
Z3Q7JiMzMjthbGxfZHJtX3ByaXZbY250XS0mZ3Q7bXRrX2RybV9ib3VuZCkNCiZndDsmIzMyOyYj
MzI7Y250Kys7DQoNCg0KSSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RvJiMzMjthZGQmIzMyO2Jl
bG93JiMzMjtzdGF0ZW1lbnQmIzMyO2hlcmU6DQoNCmlmJiMzMjsoY250JiMzMjs9PSYjMzI7TUFY
X0NSVEMpDQpicmVhazsNCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1218808078.1092718616
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjMtMDQtMDcgYXQgMTQ6NDYgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQ0VSVC1DIENoYXJhY3RlcnMgYW5kIFN0cmluZ3MgKENFUlQgU1RSMzEt
QykNCj4gYWxsX2RybV9wcml2W2NudF0gZXZhbHVhdGVzIHRvIGFuIGFkZHJlc3MgdGhhdCBjb3Vs
ZCBiZSBhdCBuZWdhdGl2ZQ0KPiBvZmZzZXQgb2YgYW4gYXJyYXkuDQo+IA0KPiBJbiBtdGtfZHJt
X2dldF9hbGxfZHJtX3ByaXYoKToNCj4gR3VhcmFudGVlIHRoYXQgc3RvcmFnZSBmb3Igc3RyaW5n
cyBoYXMgc3VmZmljaWVudCBzcGFjZSBmb3IgY2hhcmFjdGVyDQo+IGRhdGEgYW5kIHRoZSBudWxs
IHRlcm1pbmF0b3IuDQo+IA0KPiBTbyBjaGFuZ2UgY250IHRvIHVuc2lnbmVkIGludCBhbmQgY2hl
Y2sgaXRzIG1heCB2YWx1ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFz
b24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gRml4ZXM6IDFlZjdlZDQ4MzU2YyAoImRybS9tZWRp
YXRlazogTW9kaWZ5IG1lZGlhdGVrLWRybSBmb3IgbXQ4MTk1DQo+IG11bHRpIG1tc3lzIHN1cHBv
cnQiKQ0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwg
NCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gaW5kZXgg
ODYyNTVhMDY2ZmFmLi5mY2ZhMTAzMzIxNjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jDQo+IEBAIC0zNzgsNyArMzc4LDcgQEAgc3RhdGljIGJvb2wgbXRrX2Ry
bV9nZXRfYWxsX2RybV9wcml2KHN0cnVjdA0KPiBkZXZpY2UgKmRldikNCj4gIAljb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZDsNCj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+
ICAJc3RydWN0IGRldmljZSAqZHJtX2RldjsNCj4gLQlpbnQgY250ID0gMDsNCj4gKwl1bnNpZ25l
ZCBpbnQgY250ID0gMDsNCj4gIAlpbnQgaSwgajsNCj4gIA0KPiAgCWZvcl9lYWNoX2NoaWxkX29m
X25vZGUocGhhbmRsZS0+cGFyZW50LCBub2RlKSB7DQo+IEBAIC0zOTcsNyArMzk3LDcgQEAgc3Rh
dGljIGJvb2wgbXRrX2RybV9nZXRfYWxsX2RybV9wcml2KHN0cnVjdA0KPiBkZXZpY2UgKmRldikN
Cj4gIAkJCWNvbnRpbnVlOw0KPiAgDQo+ICAJCWFsbF9kcm1fcHJpdltjbnRdID0gZGV2X2dldF9k
cnZkYXRhKGRybV9kZXYpOw0KPiAtCQlpZiAoYWxsX2RybV9wcml2W2NudF0gJiYgYWxsX2RybV9w
cml2W2NudF0tDQo+ID5tdGtfZHJtX2JvdW5kKQ0KPiArCQlpZiAoY250IDwgTUFYX0NSVEMgJiYg
YWxsX2RybV9wcml2W2NudF0gJiYNCj4gYWxsX2RybV9wcml2W2NudF0tPm10a19kcm1fYm91bmQp
DQo+ICAJCQljbnQrKzsNCg0KDQpJIHdvdWxkIGxpa2UgdG8gYWRkIGJlbG93IHN0YXRlbWVudCBo
ZXJlOg0KDQoJCWlmIChjbnQgPT0gTUFYX0NSVEMpDQoJCQlicmVhazsNCg0KUmVnYXJkcywNCkNL
DQoNCj4gIAl9DQo+ICANCg==

--__=_Part_Boundary_003_1218808078.1092718616--

