Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3407B7807
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 08:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB0A10E0A8;
	Wed,  4 Oct 2023 06:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F95E10E0A8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 06:41:10 +0000 (UTC)
X-UUID: ff148b7e628011ee8051498923ad61e6-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=y5A9RC+ZzMNlupJ7+/5cIineCZXal64r5VahogU/swM=; 
 b=GA3zZWYSYuvyTeqTWwk6rDi/7f7FuhcFlfUoLIIg6uG2aerNY0WmD2zxTnNW6SDUko7P3Gl1EdTsQc0RuraWhf1L2pINMtzLs0KsoqArGH2z0EV65bmcb90VBhQ633UqvR5YaQJXUmLeEffyUbAQze3Kw6h+sb0o+Ww/mt60/Z8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:2cf360b0-76c7-44a4-899c-74817c063dc4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:1e2cab14-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: ff148b7e628011ee8051498923ad61e6-20231004
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 126320930; Wed, 04 Oct 2023 14:41:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 14:41:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 14:41:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho/DLvyFADV46MpYWIx+bjCSTrx+0XUtSLJsLyUCmmGKuqRPRHQACdHNGyJRca39P9zde0Q9J6Cabk0R67pjASku7+rIDZHso1D1VTpIOYJDC6tgSZBO14folSypopycv4+0lOg44ILA6wQSKdIxGUaUQO8W57eXKW+StkDAU10igRgOOfIxhtb59KBI9+oNhlTj1H44l4FFJ+q5u1T0d0cSQVafZjOQAC5UXbhsAP6syOuNjFytuCDguvNLZeu1AwemIqOcor/otfZWGlufS+VxQqfm4Har/emsNZtW0hLGqJb1p4gYwOzPNTdGky/BhKQhUZpoHV9pQDSHNeicBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eotFIPzQxb5iNMDY7eUgoCMJ6lU2KdLM+flKTGBsLGA=;
 b=YA7tslVo/12qI0b01/17xsGh8wg1Fg5khz0HN6F8bOb6/PFYm/6aQhe7w17czZbb3KZOblnTiAWtUxBX6jgZtohAegCZ/41coYWTPBPaBoMOq0vgjlHS79a8KdSIEmPozWyhtaxMr3H9P8TB9Hd5myytWZ3h8bF8URDDVc0nR2wfQFNkiWAAylbpEnYTEf+XTDcdSDLaQYdVpSYOyeuSASKJBFBuqJ6eOFJAZ5Jj68c978g47w1fWh8IXt8SdX2Efl4svbkJJKS03nHC9+PSzlg7TSWNtPhDRXEaF7wM74zRNKBhFO9wcZIgg/AGamMdfiGS1pLvkFen0bpLcSpFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eotFIPzQxb5iNMDY7eUgoCMJ6lU2KdLM+flKTGBsLGA=;
 b=T3EDxVqY8ThcQY3Q2j0Kws4cKIqs9dQPAqJ1aLcrJ5T2AV3l9WBebWdlDVaWYXo3qy2wKOgDOLRPTnoOKlUzh+kBHcCCtyMKWGMiO27yPkfVyCz4J1dH4vvRmxwRlVmgcNF7hPZbx6Ylj7OoKbku+wrFGfaBSwasgs615+j7FDs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6473.apcprd03.prod.outlook.com (2603:1096:400:1bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 06:41:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Wed, 4 Oct 2023
 06:41:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v10 14/16] drm/mediatek: aal: Rewrite kerneldoc for struct
 mtk_disp_aal
Thread-Topic: [PATCH v10 14/16] drm/mediatek: aal: Rewrite kerneldoc for
 struct mtk_disp_aal
Thread-Index: AQHZxqWQLuwVe/7AdUSFGkEJbvd4YbA5ji+A
Date: Wed, 4 Oct 2023 06:41:02 +0000
Message-ID: <a62c60b2ab55e3f7594b3d2c3584c27ab7130bd1.camel@mediatek.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-15-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6473:EE_
x-ms-office365-filtering-correlation-id: 8cc80ffd-7a3c-4660-fa07-08dbc4a4e083
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7vtxGCdWh58OuJR0b56KtYtJUbFkHkrUM0abas23k6TA4Upu69ElopyglPmG6ATKRiOXX6FDSOOvcUihT/fn1Vt2I5ZYtqT1jPxOhdvlz2aj4kxzDMChSbeX+Dh5RFSCRzPyH1ff3lL2akwJfpX0O/AsicGkA6UtW/waD+p+JwoGUR5MZwbeUUeiUd984ykgwFQ1EtyD5Xeo3bE1N7uH2WL0/rlNCfLio1LFcuzF56gegkwsrbUxfSk2jZE/dcW9Kw16GQmLZrkbO8cS8cM4JANHEpqC1fRIIbRcoiC3p8ErUoz5FvXMCqO+A2ST5oI2TX5FNTkIjFQOE7/+QvuBdY/QjzgpQbp8mVcZMwxL4sr8FO4rITyxLdp6WQql+Daq4Wji/9No4+Pj4Ua0xKnFKly2ths0VAkYrxTJv4rPS0mlew7x3Otu3RlJCRj99AHdNDJdirRavsuk93olr5NevdUfyKJDAkIhd0bk5dlWDHaiffjOT7xqnPPHf24OOmMcMaioGIMtRGStuVSOm/KVgl7r6l4WA3ph4yvNtBZ874uI7gLu6akGkquegSfy3PfF6ZoTpyNwr1mUVQM6F9OquA7v0+8so4Ti2DurzucHRSlQiSjA7JDQMltd+6emrLKKzCJnA8jbIt0lu5CfPlL7qvS3pia+/3wlz+8N95MJ8bo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6506007)(6486002)(478600001)(71200400001)(83380400001)(2616005)(6512007)(26005)(7416002)(66556008)(2906002)(5660300002)(41300700001)(76116006)(66946007)(66446008)(316002)(4326008)(54906003)(64756008)(110136005)(66476007)(8936002)(8676002)(36756003)(85182001)(38070700005)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEFaSnlvTDAyR0I5WVlQRTUxK29VS0NSN3VSckZyWnJNUlg5Y3drenpGd2s1?=
 =?utf-8?B?b3J5amtRQWtDRURxd1ZvbG96K2g4MS9meWJ0bmxQclZ2Slk3Y3dBT2ZZSm1p?=
 =?utf-8?B?aDlhVEpKbXJRZTBXcGkycU1UUzB2ZmhwdmdUdWNZeW1CTC8ycWFjaG93VXFB?=
 =?utf-8?B?QnBVcm13a2dTNE5HK3Jpb3Y5emtESlpRR1Zya0VFcnM1QkVDUjh5czZkbXNH?=
 =?utf-8?B?Q0JTajBpcVNVV3RVdlZWN21jYTV0YURKZ1kvbHRFczNrM1lMZCtxbXV2Umh1?=
 =?utf-8?B?clVUWHhQQ0dqanFIMVRIRjRtVGZwR29yNlhXNHNDMUhscEpsai9mbWRvV1dU?=
 =?utf-8?B?dUJ5OE5pQ3ZhRFJ5SFVmZldSWjlLN1RwS1ZPb1JsYzFDQlE0Y3dLbW5IVjJh?=
 =?utf-8?B?TTUwbTZZbmVueTZZL0RrWDVya2ZGVG5mUGxoTmt0ZGwrc2xVR0pIbndZRTJ4?=
 =?utf-8?B?d1ZVSC9Lc3NVK2VqVmxwdm85cTdRcWhGK053c0dxSi8wN1B0OHcyN0hsaEc5?=
 =?utf-8?B?VVBVNXU0UEN0WktOT3NmZ3RwOXhBOTJqSzFja05kS2sxc2piV215cy9xRTd6?=
 =?utf-8?B?NGdXdnVOVEZ5MjM1OVRTdUZTbmQyMDNOTTRSR0kxUlZucTd6YXJFUFZtQ2JD?=
 =?utf-8?B?T0lMcTVRU2JHNWJMNzJGbnNvaCtKbUZmeHJacTNXZS95L2xoQUIzK2NPQ0pY?=
 =?utf-8?B?bkRESGlJZ1ltUGFWL1IzWmVFWUVlSW1SaDVvRHJZSG9oMWI4aDVJQVN3L3dv?=
 =?utf-8?B?cFhTRXAzN0JFSXYwa2lvNzNhOWFtOW9SVkFHTURmMWRtSkFNMWU1SS9EVDdr?=
 =?utf-8?B?WHRYQWdrdThhc0t0MzU3dVBCeitGelJCWXJ5dmI1amc0N0RKOXkvWnh2NHVX?=
 =?utf-8?B?b0NLbWkyRUdCdW1nSU5QLytRckt6UzNWUnNiaEJXcDY5TzQyTGR0VzdXUVRR?=
 =?utf-8?B?TUF6QWY2aDFTaHhhQlJOak4ydzEvOWc2Y21HK3psaW4rTlJ0M2V4NXFITEV2?=
 =?utf-8?B?TXRsUXkrUWhXWjBDT0Q1b3I3OVV4OXkwRm9VSldtOTllaDRNQmh2OHBWaWRJ?=
 =?utf-8?B?RVlFWXVFUEdPODJJQWdoVXU1dVdXZUpZNHpWYytJR25qN1ZOM1IxQVNiaElk?=
 =?utf-8?B?K0JnaHJQNlovdzkxWCt0STRCV29nV21nNFUrK0xROTRYY1FNMzBndCtoMkdW?=
 =?utf-8?B?SmlOa2RnbEc4N3JsNU5Ia1ZXQW1zV2lUMWhRUkVsWDV2WlA5Y3hHcXlJWm9D?=
 =?utf-8?B?bzdHbVFobFJIeVBtZWlLWHkvNzRDbGc1NTRMMmlOa2VBZklRRUppSFFxWFps?=
 =?utf-8?B?WG5KdE9aOUw5bkFnZyt1MTlyWEViMU16TUdPeFZBN2dzWTd2R09Cc0NYcS8y?=
 =?utf-8?B?R05rb3NEMStDeUI0N1U4cEppQmduMnRNR3BIMUJJMVZuenZ6ZENjSE5qQ09N?=
 =?utf-8?B?bzJXK2I5dzZUVStkU3Z6YVNjNHlLYkhzOXFHUkFiMnhka0x1THNFZW10T2pR?=
 =?utf-8?B?Q01lakJiS1Zmc20yaW1YNGlFdDlCKzk1V0ZWcDZVdkx6TEtMNkFxSDFpTE9o?=
 =?utf-8?B?YS9GR0NGcEE0eDRWLy9CYk95dTAvK3ZtT253VDduWGJYUys3VEwxZ3ZueTl6?=
 =?utf-8?B?ZXRyazRpcjlrVkpVSmppTEFBYXQwK09pUjdkeXAwMUhZa1pXUmlpdFZiUVRS?=
 =?utf-8?B?dUdyUEYyaGo3ZzJmWDgwOU55OEVDZTV2cXdybDZpS1pyRFFtZU54d3RRSlBV?=
 =?utf-8?B?Mlk4YlFIck56RFpqV1VnM3lWRi95WHUvR1ZnSzBVdFpmRHBNSWYvR2M2RTNZ?=
 =?utf-8?B?Vk40L2hzaWs1WThVMlZ1bkY1bDhRZ2dWTUYzVk9QK0FySndOSWV0WGIwRXQr?=
 =?utf-8?B?a1RidEZLNGxCazF5TEo1N29iTmZkMEZFdUJ4T3BjN0ZEcW43QXIxZ0FOb2gy?=
 =?utf-8?B?UGJ4eS9ZQkFTWC9UbmRTaEkyVDFGdHdzOUhYditoKzZpdGkrSzR2dzlwdktM?=
 =?utf-8?B?eDd4cnFpT0RxejF0dzRzQVNZNThqOTNoZm5IRVRzSXYvYVRXbExVR0FtWlQv?=
 =?utf-8?B?VUFvVjN2SFJ6MEFlR3lrSGJUUi8xN3g5WXlMUm5EdzdnUTNkKzdzaUpLM0Nz?=
 =?utf-8?Q?G5Wq4A9STGjZJKlS/ST4NkAU1?=
Content-ID: <358F72B6CBBF374DAC33801D5FE6F770@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc80ffd-7a3c-4660-fa07-08dbc4a4e083
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 06:41:02.3353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIhWkAoSqBY4jnm3I4a8Y+JkGHoZtlhxxbkIY4Jru6SqRKGbp3aL6ggtlueRXb2Lv7gIslAEfRQi57DvTdGD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6473
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_198597855.345331815"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_198597855.345331815
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0wOC0wNCYjMzI7
YXQmIzMyOzA5OjI4JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhlJiMzMjtrZXJuZWxkb2MmIzMyO2ZvciYjMzI7
c3RydWN0JiMzMjttdGtfZGlzcF9hYWwmIzMyO3dhcyYjMzI7ZW50aXJlbHkmIzMyO3dyb25nOiYj
MzI7cmV3cml0ZSYjMzI7aXQNCiZndDsmIzMyO3RvJiMzMjthY3R1YWxseSYjMzI7ZG9jdW1lbnQm
IzMyO3RoZSYjMzI7c3RydWN0dXJlLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7
Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQt
b2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0K
Jmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0
OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9hYWwuYyYjMzI7fCYjMzI7OCYjMzI7KysrKystLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7Zmls
ZSYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2luc2VydGlvbnMoKyksJiMzMjszJiMzMjtkZWxldGlv
bnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzk5MmRjMTQyNGM5
MS4uZTZhYjNlYWExMTI2JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCiZndDsmIzMyO0BAJiMzMjstMzYsOSYj
MzI7KzM2LDExJiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9hYWxfZGF0YSYjMzI7ew0K
Jmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7LyoqDQomZ3Q7
JiMzMjstJiMzMjsqJiMzMjtzdHJ1Y3QmIzMyO210a19kaXNwX2FhbCYjMzI7LSYjMzI7RElTUF9B
QUwmIzMyO2RyaXZlciYjMzI7c3RydWN0dXJlDQomZ3Q7JiMzMjstJiMzMjsqJiMzMjtAZGRwX2Nv
bXAmIzMyOy0mIzMyO3N0cnVjdHVyZSYjMzI7Y29udGFpbmluZyYjMzI7dHlwZSYjMzI7ZW51bSYj
MzI7YW5kJiMzMjtoYXJkd2FyZSYjMzI7cmVzb3VyY2VzDQomZ3Q7JiMzMjstJiMzMjsqJiMzMjtA
Y3J0YyYjMzI7LSYjMzI7YXNzb2NpYXRlZCYjMzI7Y3J0YyYjMzI7dG8mIzMyO3JlcG9ydCYjMzI7
aXJxJiMzMjtldmVudHMmIzMyO3RvDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtzdHJ1Y3QmIzMyO210
a19kaXNwX2FhbCYjMzI7LSYjMzI7RGlzcGxheSYjMzI7QWRhcHRpdmUmIzMyO0FtYmllbnQmIzMy
O0xpZ2h0JiMzMjtkcml2ZXINCiZndDsmIzMyO3N0cnVjdHVyZQ0KJmd0OyYjMzI7KyYjMzI7KiYj
MzI7QGNsazomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjbG9jayYjMzI7Zm9yJiMzMjtE
SVNQX0FBTCYjMzI7Y29udHJvbGxlcg0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7QHJlZ3M6JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO01NSU8mIzMyO3JlZ2lzdGVycyYjMzI7YmFzZQ0KJmd0OyYjMzI7
KyYjMzI7KiYjMzI7QGNtZHFfcmVnOiYjMzI7Q01EUSYjMzI7Q2xpZW50JiMzMjtyZWdpc3Rlcg0K
Jmd0OyYjMzI7KyYjMzI7KiYjMzI7QGRhdGE6JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3BsYXRm
b3JtJiMzMjtzcGVjaWZpYyYjMzI7ZGF0YSYjMzI7Zm9yJiMzMjtESVNQX0FBTA0KJmd0OyYjMzI7
JiMzMjsmIzMyOyovDQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2Rpc3BfYWFsJiMzMjt7
DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7Y2xrJiMzMjsqY2xrOw0KDQo8L3ByZT48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_198597855.345331815
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDIzLTA4LTA0IGF0IDA5OjI4ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gVGhlIGtlcm5lbGRvYyBmb3Igc3RydWN0IG10
a19kaXNwX2FhbCB3YXMgZW50aXJlbHkgd3Jvbmc6IHJld3JpdGUgaXQNCj4gdG8gYWN0dWFsbHkg
ZG9jdW1lbnQgdGhlIHN0cnVjdHVyZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRp
YXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYyB8IDggKysrKystLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+IGluZGV4IDk5MmRj
MTQyNGM5MS4uZTZhYjNlYWExMTI2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX2FhbC5jDQo+IEBAIC0zNiw5ICszNiwxMSBAQCBzdHJ1Y3QgbXRrX2Rpc3BfYWFsX2Rh
dGEgew0KPiAgfTsNCj4gIA0KPiAgLyoqDQo+IC0gKiBzdHJ1Y3QgbXRrX2Rpc3BfYWFsIC0gRElT
UF9BQUwgZHJpdmVyIHN0cnVjdHVyZQ0KPiAtICogQGRkcF9jb21wIC0gc3RydWN0dXJlIGNvbnRh
aW5pbmcgdHlwZSBlbnVtIGFuZCBoYXJkd2FyZSByZXNvdXJjZXMNCj4gLSAqIEBjcnRjIC0gYXNz
b2NpYXRlZCBjcnRjIHRvIHJlcG9ydCBpcnEgZXZlbnRzIHRvDQo+ICsgKiBzdHJ1Y3QgbXRrX2Rp
c3BfYWFsIC0gRGlzcGxheSBBZGFwdGl2ZSBBbWJpZW50IExpZ2h0IGRyaXZlcg0KPiBzdHJ1Y3R1
cmUNCj4gKyAqIEBjbGs6ICAgICAgY2xvY2sgZm9yIERJU1BfQUFMIGNvbnRyb2xsZXINCj4gKyAq
IEByZWdzOiAgICAgTU1JTyByZWdpc3RlcnMgYmFzZQ0KPiArICogQGNtZHFfcmVnOiBDTURRIENs
aWVudCByZWdpc3Rlcg0KPiArICogQGRhdGE6ICAgICBwbGF0Zm9ybSBzcGVjaWZpYyBkYXRhIGZv
ciBESVNQX0FBTA0KPiAgICovDQo+ICBzdHJ1Y3QgbXRrX2Rpc3BfYWFsIHsNCj4gIAlzdHJ1Y3Qg
Y2xrICpjbGs7DQo=

--__=_Part_Boundary_002_198597855.345331815--

