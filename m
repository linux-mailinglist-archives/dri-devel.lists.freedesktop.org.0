Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B661F222
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C499310E2F1;
	Mon,  7 Nov 2022 11:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749C110E2EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:47:11 +0000 (UTC)
X-UUID: 25c29958f9074be1bc61dced6a59dad2-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=70UvSXUmoINhhG7EUlsIadtRRPhXS7VEQ5V9huCsoIc=; 
 b=efk7hD9/q1Xae8eGlLR5f1T6mGknskEjv293i7lGmq8SaAV2oWwsbpDVFZBUAE2H1I+4Ml2d8Rub04v2QWmBw+0TPSYOK5B+QFsS3vvo3xFmj5IULwSWPswdeGRz/nHfMxaOkQCjAMn+JN1HIHWdtVq8F52OxdFQm3HDXzAIoNk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:095b832e-5842-4a4c-9e67-61cd13caaef9, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:62cd327, CLOUDID:169ae8f3-a19e-4b45-8bfe-6a73c93611e9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 25c29958f9074be1bc61dced6a59dad2-20221107
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 382096585; Mon, 07 Nov 2022 19:47:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 7 Nov 2022 19:47:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Mon, 7 Nov 2022 19:47:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVB6crkz1RA2yDAZ2syT2kPDbMoO+t2Bw4I3SzqWtaGppHnn4Zqm9QJaL6rBkEe+HrdUJE1wnNzXKeFh4jxAeQWlaG7uY3rwf1fWHPIlXoRYLK52IJ6RlA+cH8vGkIZo8VPUycjXDj8NyHlxg6koAyrP780ceHkclprFEsmozl93UW/h0sVL3xq64hzJ81jWPRbT0N1ZrnMY9D+IFqTb+7+p2jTdAsU8ImajhN3ICyF1YuQVuHWS/J6cyw2Gdy9CcmyRz7nooXb6UECnap8y37OXYaz5UVgwKX3W5YkKfhsy/oYrHsFl64G+hE2fKLW5KLZW2Xv80TA33PfXRopUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70UvSXUmoINhhG7EUlsIadtRRPhXS7VEQ5V9huCsoIc=;
 b=T1JXhIHPH/QxXgYCeFMC1rcUcX9FJ3/FO9+wBUaNP7rpNgYjCP6AK67XXOk39s1q6bcrAOnaMbt7Z53smpnAqLRurNyHQWJmV7fsVKmrwQO105LwVFwhH/ce1UAoIkpM8p7q8aK5iq1Ryw7VzBQI/vMtCaPCiUH9lwj4bkW0HWg6aIhmlbyGjXeG7oS5MP7yW6VZniJAOVa1mb9izn1CkGtAuJq44PFVAEhTurIg0oyei9YOdUX7Ena0W3hS0KOzAwgKDRjYxXrdkBVRCKsiGj6BLDye756LnaNNn4Bx2Posc+lSWJn3zkw+9jcoWtRwq4eKxucqpSrfq/pWb0wb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70UvSXUmoINhhG7EUlsIadtRRPhXS7VEQ5V9huCsoIc=;
 b=dogo1f6Lv5hS9r4ckXr9l8a5P7SGyx4MibXi4//6gDRo+RVcS8eCwf1+h6tyjLdlJkrToSa4ZCYTFwldwNRtqLhJHqiB0jnPW8Di6MB9lDaO+W+6BfgV1C26Lawt0BF8eYpnxktjTVqzK+nQrR/7g9MdCDurDIy56p/60Wyb/4k=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by SI2PR03MB5999.apcprd03.prod.outlook.com (2603:1096:4:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 11:46:58 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::a0e1:17bd:db1c:f57b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::a0e1:17bd:db1c:f57b%6]) with mapi id 15.20.5791.025; Mon, 7 Nov 2022
 11:46:58 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nicolas@ndufresne.ca"
 <nicolas@ndufresne.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?utf-8?B?TWluZ2ppYSBaaGFuZyAo5byg5piO5L2zKQ==?=
 <Mingjia.Zhang@mediatek.com>, "tfiga@google.com" <tfiga@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>
Subject: Re: [PATCH v5] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
Thread-Topic: [PATCH v5] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
Thread-Index: AQHY6BPrz+YzbirvrEW+ivpJnEkUl64zbR+A
Date: Mon, 7 Nov 2022 11:46:58 +0000
Message-ID: <b7f6e258d00e9946852b900ada0548e342c1ce50.camel@mediatek.com>
References: <20221025014659.7158-1-mingjia.zhang@mediatek.com>
In-Reply-To: <20221025014659.7158-1-mingjia.zhang@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|SI2PR03MB5999:EE_
x-ms-office365-filtering-correlation-id: e8f537a2-a615-4593-8fa0-08dac0b5c70e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNsoR77ZinQiBDokK1mR7XJtYeE5Vmrq3w8fKsI6EJwSu8DHNEdmLXXKxb8ycY4JHTlXj28HXJlV2IIRucg3mqJBoieNHyf4PFZCluKu6e3kl2U0z69puFwpdQEmJZK7M6o8nPZia3uV5YgtwDrVoc23CrKB7L9/uSWvymXTCIwT4Y16KXvZv7ZxYQSgBsCZ8xTs4BpXF1Cda9YMkfoKhu2TZC3JGOH/hYr/8QBnrGODAjAsmezK9cpsWRsOmZ3w8F47ntXv1j33wq2Hb3xq4f6EqJztKmMCXUPXMF2q+EW7NFuGs0otTlA5BaTQwoy7mVlHJhT4pDXUhXxo9psBolYC9+uSFq4tqOQgipnVYFkYLFAdiczVHkUBO2SDy3H7bL2suYui3TVMhIyw/zp5y6UbmkvrDENzC9TAtBJtXTRbi02OqS4weT2lwQe6ZyxvbMR4kZSwpyTRQtCMiYaausPGGgPyjjrCKDIkdMObmG/vYAj8Sd8/GAsjNYCfRyJeMNo7TJR7vJIrp9FotDF8QM8tMLVzN6sEgBcz+5UDYChbtRjA7B7WRMvFEk4LHEkFG+jGEYLf/fv32CpIcJxwSYibab9kTcc4ZSlw0spcV7lhSEzCpx5CzLbI9afFXGmlerlSDt3FYJ8ciXiYeqDaTi4cBkug+H9DMkvbrsO2kNcIRoe16/ESAmdxnJGlSXWOT1674POzKr6KVjYXAN1LhovbbgXiMr7pgdz77Utmj4RAMeAqKFcvxfmK1Yk0OsZ6RxrEdZRqDJq2o0yR+gOlsI+uC0j8QoS2TdA9cH3odXlj92AuaTZo5aoz/3ppm0hSm9mj6fCnpCG0Am0Q3tEeqY2xFokftuWJVWLv5HU0YsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR03MB4153.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(86362001)(85182001)(36756003)(38100700002)(5660300002)(8936002)(7416002)(2906002)(4001150100001)(6512007)(83380400001)(2616005)(186003)(921005)(38070700005)(4326008)(110136005)(316002)(8676002)(41300700001)(91956017)(54906003)(66476007)(76116006)(122000001)(26005)(64756008)(66556008)(66946007)(66446008)(107886003)(6486002)(478600001)(6506007)(71200400001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHg3bEFRMjRFc0lXOGlmb0xTNGcyeEYvV1prSmhlU1VuV0lnMHRFNGhkbklh?=
 =?utf-8?B?NDBBYmZYY2trY3Flc2VxdVZ0L2wzSUJaamRNUmhEVXJmQlVRR2laZGY5QktF?=
 =?utf-8?B?MnE5cE5NSERxczVhR2xUY2NjdnlWMmFDTjZjYWRHV2RpeU5GR0NTZkdKdHdK?=
 =?utf-8?B?Z01janV4TmF4SFYzQzNJNUVPR0tjMzlXQklaYUh0aFlqYlBUU2QrRGIwZWc4?=
 =?utf-8?B?Y1FCMFI0M0djU0JPakZBZEpjaG0wbXN6TEFIY2tBenJneWpLa04vQUczbzl1?=
 =?utf-8?B?NUNQWlAzNEszdGd1Tk84NkRBcTZRdEg0TmpqOWRFVTBDVm9YWXJBUFZhMURq?=
 =?utf-8?B?QXIxT2lLY3hub2Ira3VVNHY3ZmVrR0FDVERSanpMSEg5SytWV29wYXVjRGVV?=
 =?utf-8?B?eXpCcDNaNmZ4cDhCeldQL2ZTUytYUUwwbE9pZytLRnR0TnM2N0hVUU9YWEFM?=
 =?utf-8?B?SDcxSVoxNk5naVZHTThXMW9SWEhXSzBoRDZVZGtDUTZmYTJDSkdhcnB4RmZ6?=
 =?utf-8?B?aWlMSmQydE45S1FndEdsWG5PaTBLY3Roeit2Z2lHMHhhRlMreG1FSGxuVzZE?=
 =?utf-8?B?M1luSHhKUFZhTFlZM0hRdkgrbVpPNUh1RFVCKzh3TmsvclpnVVFyYVBPUGk3?=
 =?utf-8?B?R3o5T21SUFlSL1V5dVI2U2hsd2hJZ2hiVk0razNJVnpUSlVxUytQQWdyUW1H?=
 =?utf-8?B?d0o0cmg0SHVaVnduSHliODVZYjB2WVdlTWMxemRnNThoSXBxakJWZ0U5VlVL?=
 =?utf-8?B?WWRydTNEbTB2NTBYZStRazNGV2RFRzl5R0JIVUFYZ0ttbjdYK1RUNmRidjky?=
 =?utf-8?B?V2k1bkh5OWhnemR3RnFNdDR4SWoxVUpkSnVLM0sycEYwbGZTOEFkZWxkQkZv?=
 =?utf-8?B?NUxGc0ZEZTNXNk1tUGlRekhpQ2RPYjBrcUhEWnlqdnFlM3RRZC8ycEpVZmV0?=
 =?utf-8?B?a1J2Q1FuOUFsRnRNVWdQYllLVVhPVGRmL0pHZ09rSTRwUTBNbUM3VUthc1I4?=
 =?utf-8?B?MHkyeDVPZTVhbGRNWUNtaHg0NVFsWi9NS3JTUVlyMWNZcEVGL0pNM3UyMElv?=
 =?utf-8?B?aHpjcXNqNEE0c1h5cUlXVWc1QzR6ay9EdlRPYjUyUW5PekQvRmIzMWNNZWlX?=
 =?utf-8?B?Uk9UYkp1clAyelJmT21Odkg3KzJWM2Z3S1FUSytVMU92UEVaQXNkMjVxNXNB?=
 =?utf-8?B?Z0RtcktmZXB0dVhBTzNtSDMvQUpLRm9zZjB3ZVVka1pGZHZvN002b09xVWJ3?=
 =?utf-8?B?aCt0WHhjYk9QZkZUUUxmZ2hiRFJ4amJPd2xXVDJyWEgwK2xybWJHR1NwajZL?=
 =?utf-8?B?NlFsSlRnYTloaDVsVFRVQlNqeW5yTTdnakdHTGpkU1JwNDNXWDR0Z0RzbGto?=
 =?utf-8?B?VWNEbG1hbTgrMFRyc1NKaFo3bGVIS1EvdmRqK2NRSklBOFhqbzlNL2ovVDhz?=
 =?utf-8?B?YzZqL2xNMWVBVUhqYisyeHQvQ2doeFgxOWxwakg2L0k5MldmUTZBTmd6cm5G?=
 =?utf-8?B?ZlEraExvUWlPTVFEV1pSZktkTHptZTREM3JRSnFIZThsYUV6WlJlWFRXYWVu?=
 =?utf-8?B?aFJvR3U5NCtwK0N4VmYveFNDZ1liUmJUdFFyRUZqR3drTVFjc1VhTnFEZDdQ?=
 =?utf-8?B?S3hQVjFEUUJ5UDA5eGcwZytHSllxVFh6M1c0SGYyTGU1cVdUdEhOeWtkSHRO?=
 =?utf-8?B?ditmZEdiU0pUQWsweG0wdDlwRDk3OVpJSWdyc2d5aWpOb01VOHM2bjAxWmNF?=
 =?utf-8?B?VE11eFdrcXEwNHdKcW1ucG9DMmR1aEtxTWNEbmVtZzQwT2hIanZEaFU3TXhw?=
 =?utf-8?B?QWwrZXh6TXByMUQ2UzQ3MUQ2MU1KdDNZTXZCYWZ0UENyTGwzNllyU0xIc1Fp?=
 =?utf-8?B?K1N2eGlCTzNIVzZ3M0ZyNE1zM0c2Ui9BaENPaU5ZbEtQdEIySmxXc3J2QTd4?=
 =?utf-8?B?bERxc0YwZlBYUDdTbjdHMHdqN2Uvck5rT0Qzak5uZVBBSDBRcU1hOVk4MXRy?=
 =?utf-8?B?a3dJMVJlTHdEb2tCRWw2anhTM3lvV3VlSjluMTdqV21pTDlONG51dFBPczZx?=
 =?utf-8?B?cHVUTG1rY1o4anFWVStxMXR2d1N2QVM5bFdxdHhMV0xjMWdDVEtodExCVW5N?=
 =?utf-8?B?c0psZVljK3lsUXhNdlpEVk92Nk1oRGJ5TWd3Z2tickRqb1F3RlNXSCtPL0Q2?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <879A45BFF3D1384DAB7BD96ED3B2B1CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f537a2-a615-4593-8fa0-08dac0b5c70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 11:46:58.7424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FW4lsdFE05+01Yl9Q3seSrsZ6pvTQbFZym/lq1vJh+7xM3NKWg2hHgOIImKRpuvyC0EZFPr8PeLA4Z3veXuGQUvRS+4U7o0MPKYpm9mkh78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5999
X-MTK: N
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?WGlhb3lvbmcgTHUgKOWNouWwj+WLhyk=?= <Xiaoyong.Lu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWluZ2ppYSwNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KU29tZSBjb21tZW50cyBuZWVk
IHRvIGdldCB5b3VyIGZlZWRiYWNrLg0KT24gVHVlLCAyMDIyLTEwLTI1IGF0IDA5OjQ2ICswODAw
LCBNaW5namlhIFpoYW5nIHdyb3RlOg0KPiBFbmFibGUgVlA5IGlubmVyIHJhY2luZyBtb2RlDQo+
IFdlIHNlbmQgbGF0IHRyYW5zIGJ1ZmZlciB0byB0aGUgY29yZSB3aGVuIHRyaWdnZXIgbGF0IHRv
IHdvcmssDQo+IGluc3RlYWQgb2Ygd2FpdGluZyBmb3IgdGhlIGxhdCBkZWNvZGUgZG9uZS4NCj4g
SXQgY2FuIGJlIHJlZHVjZSBkZWNvZGVyIGxhdGVuY3kuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
aW5namlhIFpoYW5nIDxtaW5namlhLnpoYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+IENoYW5n
ZXMgZnJvbSB2MzoNCj4gDQo+IC0gQ1RTL0dUUyB0ZXN0IHBhc3MNCj4gLSBGbHVzdGVyIHJlc3Vs
dDogUmFuIDI3NS8zMDMgdGVzdHMgc3VjY2Vzc2Z1bGx5DQo+IA0KPiBDaGFuZ2VzIGZyb20gdjI6
DQo+IA0KPiAtIENUUy9HVFMgdGVzdCBwYXNzDQo+IC0gRmx1c3RlciByZXN1bHQ6IFJhbiAyNDAv
MzAzIHRlc3RzIHN1Y2Nlc3NmdWxseQ0KPiANCj4gQ2hhbmdlcyBmcm9tIHYxOg0KPiANCj4gLSBD
VFMvR1RTIHRlc3QgcGFzcw0KPiAtLS0NCj4gIC4uLi92Y29kZWMvdmRlYy92ZGVjX3ZwOV9yZXFf
bGF0X2lmLmMgICAgICAgICB8IDg1ICsrKysrKysrKystLS0tLS0tDQo+IC0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0DQo+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlYy92ZGVj
X3ZwOV9yZXFfbGF0X2lmLmMNCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYw0KPiBpbmRleCA4MWRlODc2ZDUxMjY3Li4x
YjM5MTE5Yzg5OTUxIDEwMDY0NA0KPiAtLS0NCj4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYw0KPiArKysNCj4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRf
aWYuYw0KPiBAQCAtNDM2LDYgKzQzNiw3IEBAIHN0cnVjdCB2ZGVjX3ZwOV9zbGljZV9yZWYgew0K
PiAgICogQGZyYW1lX2N0eDoJCTQgZnJhbWUgY29udGV4dCBhY2NvcmRpbmcgdG8gVlA5IFNwZWMN
Cj4gICAqIEBmcmFtZV9jdHhfaGVscGVyOgk0IGZyYW1lIGNvbnRleHQgYWNjb3JkaW5nIHRvIG5l
d2VzdA0KPiBrZXJuZWwgc3BlYw0KPiAgICogQGRpcnR5OgkJc3RhdGUgb2YgZWFjaCBmcmFtZSBj
b250ZXh0DQo+ICsgKiBAbG9jYWxfdnNpOgkJbG9jYWwgaW5zdGFuY2UgdnNpIGluZm9ybWF0aW9u
DQo+ICAgKiBAaW5pdF92c2k6CQl2c2kgdXNlZCBmb3IgaW5pdGlhbGl6ZWQgVlA5IGluc3RhbmNl
DQo+ICAgKiBAdnNpOgkJdnNpIHVzZWQgZm9yIGRlY29kaW5nL2ZsdXNoIC4uLg0KPiAgICogQGNv
cmVfdnNpOgkJdnNpIHVzZWQgZm9yIENvcmUgc3RhZ2UNCj4gQEAgLTQ4Miw2ICs0ODMsOCBAQCBz
dHJ1Y3QgdmRlY192cDlfc2xpY2VfaW5zdGFuY2Ugew0KPiAgCXN0cnVjdCB2NGwyX3ZwOV9mcmFt
ZV9jb250ZXh0IGZyYW1lX2N0eF9oZWxwZXI7DQo+ICAJdW5zaWduZWQgY2hhciBkaXJ0eVs0XTsN
Cj4gIA0KPiArCXN0cnVjdCB2ZGVjX3ZwOV9zbGljZV92c2kgbG9jYWxfdnNpOw0KPiArDQo+ICAJ
LyogTWljcm9QIHZzaSAqLw0KPiAgCXVuaW9uIHsNCj4gIAkJc3RydWN0IHZkZWNfdnA5X3NsaWNl
X2luaXRfdnNpICppbml0X3ZzaTsNCj4gQEAgLTE2MTYsMTYgKzE2MTksMTAgQEAgc3RhdGljIGlu
dA0KPiB2ZGVjX3ZwOV9zbGljZV91cGRhdGVfc2luZ2xlKHN0cnVjdCB2ZGVjX3ZwOV9zbGljZV9p
bnN0YW5jZSAqaW5zdGFuY2UNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGludCB2ZGVjX3ZwOV9zbGlj
ZV91cGRhdGVfbGF0KHN0cnVjdCB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZQ0KPiAqaW5zdGFuY2Us
DQo+IC0JCQkJICAgICBzdHJ1Y3QgdmRlY19sYXRfYnVmICpsYXRfYnVmLA0KPiAtCQkJCSAgICAg
c3RydWN0IHZkZWNfdnA5X3NsaWNlX3BmYyAqcGZjKQ0KPiArCQkJCSAgICAgc3RydWN0IHZkZWNf
dnA5X3NsaWNlX3ZzaSAqdnNpKQ0KPiAgew0KPiAtCXN0cnVjdCB2ZGVjX3ZwOV9zbGljZV92c2kg
KnZzaTsNCj4gLQ0KPiAtCXZzaSA9ICZwZmMtPnZzaTsNCj4gLQltZW1jcHkoJnBmYy0+c3RhdGVb
MF0sICZ2c2ktPnN0YXRlLCBzaXplb2YodnNpLT5zdGF0ZSkpOw0KPiAtDQo+ICAJbXRrX3Zjb2Rl
Y19kZWJ1ZyhpbnN0YW5jZSwgIkZyYW1lICV1IExBVCBDUkMgMHglMDh4ICVseCAlbHhcbiIsDQo+
IC0JCQkgcGZjLT5zZXEsIHZzaS0+c3RhdGUuY3JjWzBdLA0KPiArCQkJIChpbnN0YW5jZS0+c2Vx
IC0gMSksIHZzaS0+c3RhdGUuY3JjWzBdLA0KPiAgCQkJICh1bnNpZ25lZCBsb25nKXZzaS0+dHJh
bnMuZG1hX2FkZHIsDQo+ICAJCQkgKHVuc2lnbmVkIGxvbmcpdnNpLT50cmFucy5kbWFfYWRkcl9l
bmQpOw0KPiAgDQo+IEBAIC0yMDkwLDYgKzIwODcsMTMgQEAgc3RhdGljIGludCB2ZGVjX3ZwOV9z
bGljZV9sYXRfZGVjb2RlKHZvaWQNCj4gKmhfdmRlYywgc3RydWN0IG10a192Y29kZWNfbWVtICpi
cywNCj4gIAkJcmV0dXJuIHJldDsNCj4gIAl9DQo+ICANCj4gKwlpZiAoSVNfVkRFQ19JTk5FUl9S
QUNJTkcoY3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkgew0KPiArCQl2ZGVjX3ZwOV9zbGljZV92
c2lfZnJvbV9yZW1vdGUodnNpLCBpbnN0YW5jZS0+dnNpLCAwKTsNCj4gKwkJbWVtY3B5KCZpbnN0
YW5jZS0+bG9jYWxfdnNpLCB2c2ksIHNpemVvZigqdnNpKSk7DQo+ICsJCXZkZWNfbXNnX3F1ZXVl
X3FidWYoJmN0eC0+ZGV2LT5tc2dfcXVldWVfY29yZV9jdHgsDQo+IGxhdF9idWYpOw0KPiArCQl2
c2kgPSAmaW5zdGFuY2UtPmxvY2FsX3ZzaTsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoaW5zdGFuY2Ut
PmlycSkgew0KPiAgCQlyZXQgPSBtdGtfdmNvZGVjX3dhaXRfZm9yX2RvbmVfY3R4KGN0eCwJTVRL
X0lOU1RfSVJRXw0KPiBSRUNFSVZFRCwNCj4gIAkJCQkJCSAgIFdBSVRfSU5UUl9USU1FT1VUX01T
DQo+ICwgTVRLX1ZERUNfTEFUMCk7DQo+IEBAIC0yMTAyLDIyICsyMTA2LDI1IEBAIHN0YXRpYyBp
bnQgdmRlY192cDlfc2xpY2VfbGF0X2RlY29kZSh2b2lkDQo+ICpoX3ZkZWMsIHN0cnVjdCBtdGtf
dmNvZGVjX21lbSAqYnMsDQo+ICAJfQ0KPiAgDQo+ICAJdmRlY192cDlfc2xpY2VfdnNpX2Zyb21f
cmVtb3RlKHZzaSwgaW5zdGFuY2UtPnZzaSwgMCk7DQo+IC0JcmV0ID0gdmRlY192cDlfc2xpY2Vf
dXBkYXRlX2xhdChpbnN0YW5jZSwgbGF0X2J1ZiwgcGZjKTsNCj4gKwlyZXQgPSB2ZGVjX3ZwOV9z
bGljZV91cGRhdGVfbGF0KGluc3RhbmNlLCB2c2kpOw0KPiAgDQo+IC0JLyogTEFUIHRyYW5zIGZ1
bGwsIG5vIG1vcmUgVUJFIG9yIGRlY29kZSB0aW1lb3V0ICovDQo+IC0JaWYgKHJldCkgew0KPiAt
CQltdGtfdmNvZGVjX2VycihpbnN0YW5jZSwgIlZQOSBkZWNvZGUgZXJyb3I6ICVkXG4iLA0KPiBy
ZXQpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gKwlpZiAoIUlTX1ZERUNfSU5ORVJfUkFD
SU5HKGN0eC0+ZGV2LT5kZWNfY2FwYWJpbGl0eSkpDQo+ICsJCS8qIExBVCB0cmFucyBmdWxsLCBu
byBtb3JlIFVCRSBvciBkZWNvZGUgdGltZW91dCAqLw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlt
dGtfdmNvZGVjX2VycihpbnN0YW5jZSwgImZyYW1lWyVkXSBkZWNvZGUNCj4gZXJyb3I6ICVkXG4i
LA0KPiArCQkJCSAgICAgICByZXQsIChpbnN0YW5jZS0+c2VxIC0gMSkpOw0KPiArCQkJcmV0dXJu
IHJldDsNCj4gKwkJfQ0KPiAgDQpJZiBpbm5lciByYWNpbmcgZGVjb2RlIGVycm9yLCBob3cgdG8g
ZG8/IExvb2tzIHRoaXMgZXJyb3IgY29uZGl0aW9uDQpvbmx5IGluIG5vbiBpbm5lciByYWNpbmcg
bW9kZS4NCj4gLQltdGtfdmNvZGVjX2RlYnVnKGluc3RhbmNlLCAibGF0IGRtYSBhZGRyOiAweCVs
eCAweCVseFxuIiwNCj4gLQkJCSAodW5zaWduZWQgbG9uZylwZmMtPnZzaS50cmFucy5kbWFfYWRk
ciwNCj4gLQkJCSAodW5zaWduZWQgbG9uZylwZmMtPnZzaS50cmFucy5kbWFfYWRkcl9lbmQpOw0K
PiAgDQo+IC0JdmRlY19tc2dfcXVldWVfdXBkYXRlX3ViZV93cHRyKCZjdHgtPm1zZ19xdWV1ZSwN
Cj4gLQkJCQkgICAgICAgdnNpLT50cmFucy5kbWFfYWRkcl9lbmQgKw0KPiAtCQkJCSAgICAgICBj
dHgtDQo+ID5tc2dfcXVldWUud2RtYV9hZGRyLmRtYV9hZGRyKTsNCj4gLQl2ZGVjX21zZ19xdWV1
ZV9xYnVmKCZjdHgtPmRldi0+bXNnX3F1ZXVlX2NvcmVfY3R4LCBsYXRfYnVmKTsNCj4gKwl2c2kt
PnRyYW5zLmRtYV9hZGRyX2VuZCArPSBjdHgtPm1zZ19xdWV1ZS53ZG1hX2FkZHIuZG1hX2FkZHI7
DQo+ICsJdmRlY19tc2dfcXVldWVfdXBkYXRlX3ViZV93cHRyKCZjdHgtPm1zZ19xdWV1ZSwgdnNp
LQ0KPiA+dHJhbnMuZG1hX2FkZHJfZW5kKTsNCj4gKwlpZiAoIUlTX1ZERUNfSU5ORVJfUkFDSU5H
KGN0eC0+ZGV2LT5kZWNfY2FwYWJpbGl0eSkpDQo+ICsJCXZkZWNfbXNnX3F1ZXVlX3FidWYoJmN0
eC0+ZGV2LT5tc2dfcXVldWVfY29yZV9jdHgsDQo+IGxhdF9idWYpOw0KPiArDQo+ICsJbXRrX3Zj
b2RlY19kZWJ1ZyhpbnN0YW5jZSwgImxhdCB0cmFucyBlbmQgYWRkcigweCVseCksIHViZQ0KPiBz
dGFydCBhZGRyKDB4JWx4KVxuIiwNCj4gKwkJCSAodW5zaWduZWQgbG9uZyl2c2ktPnRyYW5zLmRt
YV9hZGRyX2VuZCwNCj4gKwkJCSAodW5zaWduZWQgbG9uZyljdHgtDQo+ID5tc2dfcXVldWUud2Rt
YV9hZGRyLmRtYV9hZGRyKTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMjEzOSw0
MCArMjE0Niw0MCBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX2RlY29kZSh2b2lkDQo+ICpo
X3ZkZWMsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqYnMsDQo+ICBzdGF0aWMgaW50IHZkZWNfdnA5
X3NsaWNlX2NvcmVfZGVjb2RlKHN0cnVjdCB2ZGVjX2xhdF9idWYgKmxhdF9idWYpDQo+ICB7DQo+
ICAJc3RydWN0IHZkZWNfdnA5X3NsaWNlX2luc3RhbmNlICppbnN0YW5jZTsNCj4gLQlzdHJ1Y3Qg
dmRlY192cDlfc2xpY2VfcGZjICpwZmM7DQo+ICsJc3RydWN0IHZkZWNfdnA5X3NsaWNlX3BmYyAq
cGZjID0gTlVMTDsNCj4gIAlzdHJ1Y3QgbXRrX3Zjb2RlY19jdHggKmN0eCA9IE5VTEw7DQo+ICAJ
c3RydWN0IHZkZWNfZmIgKmZiID0gTlVMTDsNCj4gIAlpbnQgcmV0ID0gLUVJTlZBTDsNCj4gIA0K
PiAgCWlmICghbGF0X2J1ZikNCj4gLQkJZ290byBlcnI7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiAgDQo+ICAJcGZjID0gbGF0X2J1Zi0+cHJpdmF0ZV9kYXRhOw0KPiAgCWN0eCA9IGxhdF9idWYt
PmN0eDsNCj4gIAlpZiAoIXBmYyB8fCAhY3R4KQ0KPiAtCQlnb3RvIGVycjsNCj4gKwkJcmV0dXJu
IC1FSU5WQUw7DQo+ICANCj4gIAlpbnN0YW5jZSA9IGN0eC0+ZHJ2X2hhbmRsZTsNCj4gIAlpZiAo
IWluc3RhbmNlKQ0KPiAtCQlnb3RvIGVycjsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4g
IAlmYiA9IGN0eC0+ZGV2LT52ZGVjX3BkYXRhLT5nZXRfY2FwX2J1ZmZlcihjdHgpOw0KPiAgCWlm
ICghZmIpIHsNCj4gIAkJcmV0ID0gLUVCVVNZOw0KPiAtCQlnb3RvIGVycjsNCj4gKwkJZ290byB2
ZGVjX2RlY19lbmQ7DQo+ICAJfQ0KPiAgDQo+ICAJcmV0ID0gdmRlY192cDlfc2xpY2Vfc2V0dXBf
Y29yZShpbnN0YW5jZSwgZmIsIGxhdF9idWYsIHBmYyk7DQo+ICAJaWYgKHJldCkgew0KPiAgCQlt
dGtfdmNvZGVjX2VycihpbnN0YW5jZSwNCj4gInZkZWNfdnA5X3NsaWNlX3NldHVwX2NvcmVcbiIp
Ow0KPiAtCQlnb3RvIGVycjsNCj4gKwkJZ290byB2ZGVjX2RlY19lbmQ7DQo+ICAJfQ0KPiAgCXZk
ZWNfdnA5X3NsaWNlX3ZzaV90b19yZW1vdGUoJnBmYy0+dnNpLCBpbnN0YW5jZS0+Y29yZV92c2kp
Ow0KPiAgDQo+ICAJcmV0ID0gdnB1X2RlY19jb3JlKCZpbnN0YW5jZS0+dnB1KTsNCj4gIAlpZiAo
cmV0KSB7DQo+ICAJCW10a192Y29kZWNfZXJyKGluc3RhbmNlLCAidnB1X2RlY19jb3JlXG4iKTsN
Cj4gLQkJZ290byBlcnI7DQo+ICsJCWdvdG8gdmRlY19kZWNfZW5kOw0KPiAgCX0NCj4gIA0KPiAg
CWlmIChpbnN0YW5jZS0+aXJxKSB7DQo+IEBAIC0yMTkwLDI0ICsyMTk3LDI2IEBAIHN0YXRpYyBp
bnQgdmRlY192cDlfc2xpY2VfY29yZV9kZWNvZGUoc3RydWN0DQo+IHZkZWNfbGF0X2J1ZiAqbGF0
X2J1ZikNCj4gIAlyZXQgPSB2ZGVjX3ZwOV9zbGljZV91cGRhdGVfY29yZShpbnN0YW5jZSwgbGF0
X2J1ZiwgcGZjKTsNCj4gIAlpZiAocmV0KSB7DQo+ICAJCW10a192Y29kZWNfZXJyKGluc3RhbmNl
LA0KPiAidmRlY192cDlfc2xpY2VfdXBkYXRlX2NvcmVcbiIpOw0KPiAtCQlnb3RvIGVycjsNCj4g
KwkJZ290byB2ZGVjX2RlY19lbmQ7DQo+ICAJfQ0KPiAgDQo+IC0JcGZjLT52c2kudHJhbnMuZG1h
X2FkZHJfZW5kICs9IGN0eC0NCj4gPm1zZ19xdWV1ZS53ZG1hX2FkZHIuZG1hX2FkZHI7DQo+ICAJ
bXRrX3Zjb2RlY19kZWJ1ZyhpbnN0YW5jZSwgImNvcmUgZG1hX2FkZHJfZW5kIDB4JWx4XG4iLA0K
PiAgCQkJICh1bnNpZ25lZCBsb25nKXBmYy0+dnNpLnRyYW5zLmRtYV9hZGRyX2VuZCk7DQo+IC0J
dmRlY19tc2dfcXVldWVfdXBkYXRlX3ViZV9ycHRyKCZjdHgtPm1zZ19xdWV1ZSwgcGZjLQ0KPiA+
dnNpLnRyYW5zLmRtYV9hZGRyX2VuZCk7DQo+IC0JY3R4LT5kZXYtPnZkZWNfcGRhdGEtPmNhcF90
b19kaXNwKGN0eCwgMCwgbGF0X2J1Zi0NCj4gPnNyY19idWZfcmVxKTsNCj4gLQ0KPiAtCXJldHVy
biAwOw0KPiAgDQo+IC1lcnI6DQo+IC0JaWYgKGN0eCAmJiBwZmMpIHsNCj4gLQkJLyogYWx3YXlz
IHVwZGF0ZSByZWFkIHBvaW50ZXIgKi8NCj4gLQkJdmRlY19tc2dfcXVldWVfdXBkYXRlX3ViZV9y
cHRyKCZjdHgtPm1zZ19xdWV1ZSwgcGZjLQ0KPiA+dnNpLnRyYW5zLmRtYV9hZGRyX2VuZCk7DQo+
ICt2ZGVjX2RlY19lbmQ6DQo+ICsJLyogYWx3YXlzIHVwZGF0ZSByZWFkIHBvaW50ZXIgKi8NCj4g
KwlpZiAoSVNfVkRFQ19JTk5FUl9SQUNJTkcoY3R4LT5kZXYtPmRlY19jYXBhYmlsaXR5KSkNCj4g
KwkJdmRlY19tc2dfcXVldWVfdXBkYXRlX3ViZV9ycHRyKCZjdHgtPm1zZ19xdWV1ZSwNCj4gKwkJ
CQkJICAgICAgIHBmYy0NCj4gPnZzaS50cmFucy5kbWFfYWRkcik7DQo+ICsJZWxzZQ0KPiArCQl2
ZGVjX21zZ19xdWV1ZV91cGRhdGVfdWJlX3JwdHIoJmN0eC0+bXNnX3F1ZXVlLA0KPiArCQkJCQkg
ICAgICAgcGZjLQ0KPiA+dnNpLnRyYW5zLmRtYV9hZGRyX2VuZCk7DQo+ICANCj4gKwlpZiAocmV0
KSB7DQpObyBuZWVkIHsNCg0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gIAkJaWYgKGZi
KQ0KPiAgCQkJY3R4LT5kZXYtPnZkZWNfcGRhdGEtPmNhcF90b19kaXNwKGN0eCwgMSwNCj4gbGF0
X2J1Zi0+c3JjX2J1Zl9yZXEpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWN0eC0+ZGV2LT52ZGVjX3Bk
YXRhLT5jYXBfdG9fZGlzcChjdHgsIDAsIGxhdF9idWYtDQo+ID5zcmNfYnVmX3JlcSk7DQo+ICAJ
fQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo=
