Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5D5E73A9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ADA10E3CA;
	Fri, 23 Sep 2022 06:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FB010E3CA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:05:33 +0000 (UTC)
X-UUID: 1bda5a5a7a044f659a3cb3029408bac6-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tNBJrm1hwpCam3xPNrlyeiPjLVLH83anJtSPBjr/6vA=; 
 b=VtogJLhO4MYS+lHNqPvo3j6evJ+6WfxGWeKGccVTiETuQydAWwuuS38MVisCzOpjJSrcwGqKzvO7EWTbnCjaMumNLjK89xJz7oMIuQL3toL2b+jn2ZjqxiyauYObvVNum4ke69WGgaJzw+SEUv8XOFWZqgOndX0/28BK40EI+X8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:25ad6b6c-6922-4a74-91f4-7d43d70c1b07, IP:0,
 U
 RL:0,TC:0,Content:24,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:24
X-CID-META: VersionHash:39a5ff1, CLOUDID:6076f9e3-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1bda5a5a7a044f659a3cb3029408bac6-20220923
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 306844472; Fri, 23 Sep 2022 14:05:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 23 Sep 2022 14:05:27 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 14:05:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR7mYI7EOdWvUk2K4r1QkfwWpDlb/uZ/M2cLuVxK8bn3KVmHHOrkzfkAF4Xk2a3UX0iQTd9qVE5d3sxcKHpO/ZqUZH6NvqdRjUqtQEb1ba4RDqhgkf5QOsD/5s6r6qjXGUGZnJvOCxK4+qWbzo49YyK+VdtyIP3rIWaJWk/CdN0iD3u/Fk2aqynQF6S0awGMvykKP5Qc/Ogiamkuc5fVOy2Pet40ZhCmiyBHGfnYTG5w9eRb2vJ7iqrAhui5Bp78zsXR/opKJshbb/x8jTFcvu7/Z0ahA3uB3hUtXXBTL7s7pN0qo27sI6zR3ipPamKK8jgxdTyXM7tKC9t8gIJ92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/om91tZzpE7ugZwzQwnq8CxgFPmVzgslaXvCRFXKLqE=;
 b=eDlJDvBLAxCh37jvraNIjwTS5N0ajof7ptVPSvqgijWvCNuGLf3O2PYDtf6+7AUHMa5tdICstX2dzPmrHGXYveP/oYQPAOF1N9Z34yByI1xMJVTm9Yf+H8Niqqi6cGUtLpSarivv3QEJXZREspSsoqusEzg9KAgX27xySqCDnXr/2IU3pqH5yggyynrON9Xp7/d58wsP4QQH2rGlzLk7ZAUQkXzAQZM24PDUGbgKF+gIiQWAA23Tpx0bqKlHd4SWnKpAYGzLzqTkBRK4aWSm7RYTJ1ICBGC8Nqw46x1nMp1AUcsfSAoBipRyF6kiQrdCJg65RtgmqXznkpcBCiGJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/om91tZzpE7ugZwzQwnq8CxgFPmVzgslaXvCRFXKLqE=;
 b=VUe4ehI3eLb8SWpF+55KtylQssCAVMyB+AkaeNQB8BUMkFqzLRpsEhtMcbh4VsPrQ+wSS4M/Bk4n+cOHF2trGKcWiqaSNsDlQyZp/zp8N/vcILbP2SMJm2WYthOJxXaI4asmGGw34yilKGQHqD89cc3ZlbBGdFfuE7PCH2A3m7Q=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY2PR03MB3581.apcprd03.prod.outlook.com (2603:1096:404:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 06:05:24 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b958:c9e0:9f6d:9ed%7]) with mapi id 15.20.5676.007; Fri, 23 Sep 2022
 06:05:24 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 =?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8,3/3] drm: mediatek: Add mt8186 dpi compatibles and
 platform data
Thread-Topic: [PATCH v8,3/3] drm: mediatek: Add mt8186 dpi compatibles and
 platform data
Thread-Index: AQHYzoFPVoeg9vxeNE2auQxeSbRSK63sh+yA
Date: Fri, 23 Sep 2022 06:05:24 +0000
Message-ID: <960824ae2c00914e5c42cb4ce58480a56da52f1e.camel@mediatek.com>
References: <1663850702-26529-1-git-send-email-xinlei.lee@mediatek.com>
 <1663850702-26529-4-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1663850702-26529-4-git-send-email-xinlei.lee@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY2PR03MB3581:EE_
x-ms-office365-filtering-correlation-id: 647a7f9b-a3a4-4a47-974f-08da9d299b1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nt8B41CqtObR+EO++RoDhULgDsFEUDLReuMWnLLgChgj06O+TiBxGdfgQWJ4dIt3LBMzETB7r8R5RO+eoglS27yhspIaLEAlzStAHVnjIjwueb1B7FY+b7Mvdh0K9QJnJfSCgWJuzmKmr1V4jNSToClHWjRejnmlWVAuNHLbfG2YkjxSLyMwYg6JYl1MDHto/7THudIkNzjg/myiC1Sg/pR0oFMneXh0+jXoL8ynklN5L5vcffly4SwoRQ6Zwe0UT3nEURGt+Y3m2Ys+EQbsuN7JgyAmS9dnhdVDDIVnfAg6smO0AAqSfxS5ZbMsghS6Mje2XE9w6X2D4dudShlgM1vSijbPVhXBS6pJvMnZxQXDXrAL9+q7CauqvdMSmunsAvSIvVqfmKR1bSs4zd4GEcJV2EMpDqtraYd1NhVLGaeRqwcWMLpqCdCu7JvlydgqU81FZM3co8LsoX+c5kg8k9EQrofS38VINCWOAdOBFBT4zTA48LQqRGOkhjOQPwRPSxFWgERQ7DiLlo647pRFEhAwxeWXtpcsmIidgmGL8SHq8bzWLBzEjU7OSt7bMKVVOkKyfTZFPC+2GNBOkN6Pxibln6BknICZrN3MwNO55AIzD/OF/t3iVoFSLbJECAmKa5ubC5izbSVnR4ZUVthEH4DFOHh5uYc5/DUumHeJDIWvX9d4PWkBqRyq6Dz4tR5D5jwPmIsExzw+yYljGVuzIo/KY59RREPETwG0tABRdNaqmvsa07HDr0x8Xr090nvIrApZJ4BJSdBqSrk9wEs65g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(4326008)(2906002)(26005)(316002)(66946007)(66476007)(66446008)(64756008)(91956017)(66556008)(6506007)(76116006)(86362001)(110136005)(38100700002)(36756003)(8676002)(41300700001)(54906003)(5660300002)(122000001)(71200400001)(83380400001)(8936002)(6486002)(85182001)(478600001)(38070700005)(107886003)(6512007)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGlsN05OYlFUODJuTk5OcHRad0JhdDNsSGcwSmtnL1lzZ3ErTUJYMXdGaXJw?=
 =?utf-8?B?bFk4YllZSlhyMWZyeksyeURzb2R0Ym9Dc214cDRVVUs0elB4UDR5b2IrV3h1?=
 =?utf-8?B?UUw3NW9KbUdVbDJod3JIMk1rT2VQMFBwSTJaaWFlWHNTVC81SkdRMTFxSWlF?=
 =?utf-8?B?aXF5M1lmR1BYMjFVekw5THZudjVRRzc0QldlQTNWT0NyVWtPMXpoNHIrSHd4?=
 =?utf-8?B?S0kwendBSXVldW9kTkxheDdMNEh6eWRhUklYeUhIdzAwOGxCRXdOU2poa053?=
 =?utf-8?B?VStRTllHcHl6ZWsvMkYzcjBlTHhHUWJvVThvYUdkbmlGVXhzS24yTG1xUzM3?=
 =?utf-8?B?SEZDaWQwSTYwT1JjY1FsL2ZDRENDZ1ZzaTdJV3AzUWRzMTFnR3l2dTB5TExL?=
 =?utf-8?B?ZWNjSnVDWXFKVlMzMlRQcUJjb2kxRzJlMktZZXRYanJjdXAwbEl6WC9WQVRU?=
 =?utf-8?B?OXZVSjNVM2VoK04wVkt5b3pUT3ZXcytSZExzcHFzUDhSd1dIak5tdTlYNU5t?=
 =?utf-8?B?VjROd2x1c2ZWTHFoVXdPZ0tXMmRIMUpoMWNMQ3hpZWticTlkR0M5WTdDcWQv?=
 =?utf-8?B?OGU0TTU0TXM2ekxPdmt3TjkvV29jbXhEUEkxeUtkWU1VbnhsalA1RDNpQnpE?=
 =?utf-8?B?WFZMVThMSlBhUE9PWFhWdDFtcG5qRC9SMnBuZ09xTjlHREhtS2FpZGY1MkJW?=
 =?utf-8?B?TTlHcW1YSXNRV2ZvTS9rekdQR1JpN1dHK21mcVVkMXJnYmlrVi9vWVVLU0xx?=
 =?utf-8?B?ZWY0enRjMzVURzFPU1dvMFhVQ0lrZk5QSXVxVDFNVkhUcURQNm5IdWk3WVdk?=
 =?utf-8?B?YjVQU2dWQjZCSVAxbG13OVVEVmlyaUhaTE5rbFhqUlI0UXNMb2h4cUt4eS9T?=
 =?utf-8?B?K1d0ZlZxekdwRmhSMDlFMDY2T3NidTRTUnF1L2JBaGdkcno3YWlaS0l5NlhW?=
 =?utf-8?B?bUZJSklHbnNwUWRWcUo0WFUvSzF5UW10VS9YaFhUVmpSU1IwUTZWbUcwOU8z?=
 =?utf-8?B?d1BsOGI3QjFDZW9WUFFaY2RROXlhcFIrVnJRazFSTllsVnhWM09qay9mWDlO?=
 =?utf-8?B?S2JFRmoyd0xzWm5oSzU1dUhYSzNzY0E5L3RDcUU5YmlFbkhBbmVKcGVYMGhH?=
 =?utf-8?B?ZGVVODE4c2EwbzdIRXRuM2dxbERQWTlGTjdOQVhvK3gzV05XLzhQU1NWV0h3?=
 =?utf-8?B?cVhuVE1VT051NFZ1dDZnaGpmM3R5WlhVYjd1OGl5R3JkU2ttVXRuc1pCbGww?=
 =?utf-8?B?dWRHLzRXZmpvZXJYeUVKQkg3UncrVS9hY1FGcXJJcG5kUTd1ZzNQTjdXWW5w?=
 =?utf-8?B?U0t5UnZadnlkRjJVTHpBVEJYSU16amFxY0c2T21tRmd1a2F1Zld3NDNmaGxN?=
 =?utf-8?B?VjB6b2R5OUYvQjUyc3NINTN1K1NBdzZXSTlJUEluYVlBalpESGtrZHJkY1Zx?=
 =?utf-8?B?WVpzbFFNMmUrVUdzZ3ZTdEl4K0JRQzdJV1UzS1F3VWtYV1FxOEhBZnRNQys3?=
 =?utf-8?B?TFRXYnc0aHpDcHMyckVhK2VQUk9JN1NZMkhqZEI0Z1dXb1JnLzRxVkxIZHE5?=
 =?utf-8?B?UU5ZdVAzellEQlRxZnFSQ1dmRThpWUhIejUvOEZnY1V6Qmkwb0NnY3pZcjh0?=
 =?utf-8?B?S2hjZ3BmNnRrSnZuMHkzNVE0bUdFeVdCeEdTdnd5YTV3R1VxWnhTcE5YMTdD?=
 =?utf-8?B?VDM1LzIzOUdYU1U5MlBuTUZGMURTajR3cWo5ZWdNamlEa09pd2ZFVW4zVW52?=
 =?utf-8?B?YjJzWkVwMUZQK2cxRXg5eFhmQjBUaXNoV2NlU2FPWkZZTkFiTVNCYTd3UTNO?=
 =?utf-8?B?WldQUzFpL0tMejFQMVJ6eEZZREwwN29DUVpmNk5JT0lveURKcUkyRXJ5bSs2?=
 =?utf-8?B?QkZFdm9jVUNmaFdwYkx6RDQ3TW9VL2ZmL1pVV0tacXV5eVp3RWhQcEdjczR3?=
 =?utf-8?B?bE03VjlXOEVGRTAyWngySzlaYmRIZWJDWit3QUVIZ3o4bkhYcXBiVFB5UXd5?=
 =?utf-8?B?cHFDWUVtTEFnM1Nnc2lyaVRWSDBvMmxac3pvZWRucTVSMnR5VmZQNVI0Zzds?=
 =?utf-8?B?V01RT0I3Znp4ejNVUS92MmZMQ3RPdkpiaWFGUW5yTHEwVUpQZzFwS093SlVN?=
 =?utf-8?Q?VZMdxzuGnqsPNRsgW4zTtIrDY?=
Content-ID: <074F4D49D1568C47A8826B8A0E9E2E5E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647a7f9b-a3a4-4a47-974f-08da9d299b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 06:05:24.7727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /PrNVcU8q4KuR5hTQHnX+oYZkSr9lRyPtMJoVrn01N/IdRpezcElvdViSDNX56B8i2HMafd12Gc0T3WbwhLO2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3581
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1773657445.1077515619"
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
Cc: =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1773657445.1077515619
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7WGlubGVpOg0KDQpPbiYjMzI7VGh1LCYjMzI7MjAyMi0wOS0yMiYjMzI7
YXQmIzMyOzIwOjQ1JiMzMjsrMDgwMCwmIzMyO3hpbmxlaS5sZWVAbWVkaWF0ZWsuY29tJiMzMjt3
cm90ZToNCiZndDsmIzMyO0Zyb206JiMzMjtYaW5sZWkmIzMyO0xlZSYjMzI7Jmx0O3hpbmxlaS5s
ZWVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3RoZSYjMzI7
Y29tcGF0aWJsZSYjMzI7YmVjYXVzZSYjMzI7dXNlJiMzMjtlZGdlX2NmZ19pbl9tbXN5cyYjMzI7
aW4mIzMyO210ODE4Ni4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5o
dUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO1hpbmxlaSYjMzI7TGVlJiMzMjsmbHQ7eGlubGVpLmxlZUBtZWRpYXRlay5jb20mZ3Q7DQom
Z3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsyMSYjMzI7KysrKysrKysrKysrKysr
KysrKysrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jJiMzMjt8JiMzMjsmIzMyOzImIzMyOysrDQomZ3Q7JiMzMjsmIzMyOzImIzMyO2ZpbGVzJiMz
MjtjaGFuZ2VkLCYjMzI7MjMmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7
ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0K
Jmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtp
bmRleCYjMzI7YmQxODcwYTg1MDRhLi4yZmNmN2E2MWMzNDAmIzMyOzEwMDY0NA0KJmd0OyYjMzI7
LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOysr
KyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjtAQCYj
MzI7LTk0MSw2JiMzMjsrOTQxLDI0JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3Ry
dWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO210ODE4M19jb25mJiMzMjs9JiMzMjt7DQomZ3Q7JiMz
MjsmIzMyOy5jc2NfZW5hYmxlX2JpdCYjMzI7PSYjMzI7Q1NDX0VOQUJMRSwNCiZndDsmIzMyOyYj
MzI7fTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtjb25zdCYjMzI7c3Ry
dWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO210ODE4Nl9jb25mJiMzMjs9JiMzMjt7DQomZ3Q7JiMz
MjsrLmNhbF9mYWN0b3ImIzMyOz0mIzMyO210ODE4M19jYWxjdWxhdGVfZmFjdG9yLA0KJmd0OyYj
MzI7Ky5yZWdfaF9mcmVfY29uJiMzMjs9JiMzMjsweGUwLA0KJmd0OyYjMzI7Ky5tYXhfY2xvY2tf
a2h6JiMzMjs9JiMzMjsxNTAwMDAsDQomZ3Q7JiMzMjsrLm91dHB1dF9mbXRzJiMzMjs9JiMzMjtt
dDgxODNfb3V0cHV0X2ZtdHMsDQomZ3Q7JiMzMjsrLm51bV9vdXRwdXRfZm10cyYjMzI7PSYjMzI7
QVJSQVlfU0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLA0KJmd0OyYjMzI7Ky5lZGdlX2NmZ19pbl9t
bXN5cyYjMzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMyOysucGl4ZWxzX3Blcl9pdGVyJiMzMjs9JiMz
MjsxLA0KJmd0OyYjMzI7Ky5pc19ja19kZV9wb2wmIzMyOz0mIzMyO3RydWUsDQomZ3Q7JiMzMjsr
LnN3YXBfaW5wdXRfc3VwcG9ydCYjMzI7PSYjMzI7dHJ1ZSwNCiZndDsmIzMyOysuc3VwcG9ydF9k
aXJlY3RfcGluJiMzMjs9JiMzMjt0cnVlLA0KJmd0OyYjMzI7Ky5kaW1lbnNpb25fbWFzayYjMzI7
PSYjMzI7SFBXX01BU0ssDQomZ3Q7JiMzMjsrLmh2c2l6ZV9tYXNrJiMzMjs9JiMzMjtIU0laRV9N
QVNLLA0KJmd0OyYjMzI7Ky5jaGFubmVsX3N3YXBfc2hpZnQmIzMyOz0mIzMyO0NIX1NXQVAsDQom
Z3Q7JiMzMjsrLnl1djQyMl9lbl9iaXQmIzMyOz0mIzMyO1lVVjQyMl9FTiwNCiZndDsmIzMyOysu
Y3NjX2VuYWJsZV9iaXQmIzMyOz0mIzMyO0NTQ19FTkFCTEUsDQomZ3Q7JiMzMjsrfTsNCiZndDsm
IzMyOysNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtf
ZHBpX2NvbmYmIzMyO210ODE5Ml9jb25mJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOy5jYWxf
ZmFjdG9yJiMzMjs9JiMzMjttdDgxODNfY2FsY3VsYXRlX2ZhY3RvciwNCiZndDsmIzMyOyYjMzI7
LnJlZ19oX2ZyZV9jb24mIzMyOz0mIzMyOzB4ZTAsDQomZ3Q7JiMzMjtAQCYjMzI7LTEwOTEsNiYj
MzI7KzExMDksOSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7b2Zf
ZGV2aWNlX2lkDQomZ3Q7JiMzMjttdGtfZHBpX29mX2lkc1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMz
MjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxODMt
ZHBpJnF1b3Q7LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyZhbXA7
bXQ4MTgzX2NvbmYsDQomZ3Q7JiMzMjsmIzMyO30sDQomZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGli
bGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4Ni1kcGkmcXVvdDssDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOy5kYXRhJiMzMjs9JiMzMjsmYW1wO210ODE4Nl9jb25mLA0KJmd0OyYjMzI7K30s
DQomZ3Q7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRl
ayxtdDgxOTItZHBpJnF1b3Q7LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LmRhdGEmIzMyOz0m
IzMyOyZhbXA7bXQ4MTkyX2NvbmYsDQomZ3Q7JiMzMjsmIzMyO30sDQomZ3Q7JiMzMjtkaWZmJiMz
MjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0
OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYjMzI7
aW5kZXgmIzMyOzU0NmI3OTQxMjgxNS4uM2QzMmZiYzY2YWMxJiMzMjsxMDA2NDQNCiZndDsmIzMy
Oy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0OyYj
MzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7
JiMzMjtAQCYjMzI7LTY0Niw2JiMzMjsrNjQ2LDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0
JiMzMjtzdHJ1Y3QmIzMyO29mX2RldmljZV9pZA0KJmd0OyYjMzI7bXRrX2RkcF9jb21wX2R0X2lk
c1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7
KHZvaWQmIzMyOyopTVRLX0RQSSYjMzI7fSwNCiZndDsmIzMyOyYjMzI7eyYjMzI7LmNvbXBhdGli
bGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kcGkmcXVvdDssDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsuZGF0YSYjMzI7PSYjMzI7KHZvaWQmIzMyOyopTVRLX0RQSSYjMzI7fSwN
CiZndDsmIzMyOyt7JiMzMjsuY29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4
MTg2LWRwaSZxdW90OywNCiZndDsmIzMyOysmIzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lk
JiMzMjsqKU1US19EUEkmIzMyO30sDQomZ3Q7JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMz
Mjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTItZHBpJnF1b3Q7LA0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lkJiMzMjsqKU1US19EUEkmIzMyO30sDQomZ3Q7
JiMzMjsmIzMyO3smIzMyOy5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgx
OTUtZHAtaW50ZiZxdW90OywNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4q
KioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1773657445.1077515619
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFhpbmxlaToNCg0KT24gVGh1LCAyMDIyLTA5LTIyIGF0IDIwOjQ1ICswODAwLCB4aW5sZWku
bGVlQG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBt
ZWRpYXRlay5jb20+DQo+IA0KPiBBZGQgdGhlIGNvbXBhdGlibGUgYmVjYXVzZSB1c2UgZWRnZV9j
ZmdfaW5fbW1zeXMgaW4gbXQ4MTg2Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBt
ZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
YyAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIHwgIDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IGluZGV4IGJk
MTg3MGE4NTA0YS4uMmZjZjdhNjFjMzQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMNCj4gQEAgLTk0MSw2ICs5NDEsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBp
X2NvbmYgbXQ4MTgzX2NvbmYgPSB7DQo+ICAJLmNzY19lbmFibGVfYml0ID0gQ1NDX0VOQUJMRSwN
Cj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4Nl9j
b25mID0gew0KPiArCS5jYWxfZmFjdG9yID0gbXQ4MTgzX2NhbGN1bGF0ZV9mYWN0b3IsDQo+ICsJ
LnJlZ19oX2ZyZV9jb24gPSAweGUwLA0KPiArCS5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLA0KPiAr
CS5vdXRwdXRfZm10cyA9IG10ODE4M19vdXRwdXRfZm10cywNCj4gKwkubnVtX291dHB1dF9mbXRz
ID0gQVJSQVlfU0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLA0KPiArCS5lZGdlX2NmZ19pbl9tbXN5
cyA9IHRydWUsDQo+ICsJLnBpeGVsc19wZXJfaXRlciA9IDEsDQo+ICsJLmlzX2NrX2RlX3BvbCA9
IHRydWUsDQo+ICsJLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsDQo+ICsJLnN1cHBvcnRfZGly
ZWN0X3BpbiA9IHRydWUsDQo+ICsJLmRpbWVuc2lvbl9tYXNrID0gSFBXX01BU0ssDQo+ICsJLmh2
c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywNCj4gKwkuY2hhbm5lbF9zd2FwX3NoaWZ0ID0gQ0hfU1dB
UCwNCj4gKwkueXV2NDIyX2VuX2JpdCA9IFlVVjQyMl9FTiwNCj4gKwkuY3NjX2VuYWJsZV9iaXQg
PSBDU0NfRU5BQkxFLA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBp
X2NvbmYgbXQ4MTkyX2NvbmYgPSB7DQo+ICAJLmNhbF9mYWN0b3IgPSBtdDgxODNfY2FsY3VsYXRl
X2ZhY3RvciwNCj4gIAkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsDQo+IEBAIC0xMDkxLDYgKzExMDks
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBtdGtfZHBpX29mX2lkc1td
ID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRwaSIsDQo+ICAJICAu
ZGF0YSA9ICZtdDgxODNfY29uZiwNCj4gIAl9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTg2LWRwaSIsDQo+ICsJICAuZGF0YSA9ICZtdDgxODZfY29uZiwNCj4gKwl9LA0KPiAg
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWRwaSIsDQo+ICAJICAuZGF0YSA9ICZt
dDgxOTJfY29uZiwNCj4gIAl9LA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYw0KPiBpbmRleCA1NDZiNzk0MTI4MTUuLjNkMzJmYmM2NmFjMSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTY0Niw2ICs2NDYsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7
DQo+ICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RQSSB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTgzLWRwaSIsDQo+ICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RQSSB9LA0K
PiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg2LWRwaSIsDQo+ICsJICAuZGF0YSA9
ICh2b2lkICopTVRLX0RQSSB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTky
LWRwaSIsDQo+ICAJICAuZGF0YSA9ICh2b2lkICopTVRLX0RQSSB9LA0KPiAgCXsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRwLWludGYiLA0K

--__=_Part_Boundary_003_1773657445.1077515619--

