Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57809D3997
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164F6EBBB;
	Fri, 11 Oct 2019 06:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750099.outbound.protection.outlook.com [40.107.75.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969E06E3F4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 02:08:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHouel33XLD/253E+RRq9qXmiBq5oCwak8C0jdNJiBLSN2F86rwmga1QDbsZZL3w5y8gJtzP2CvcN8VK966ehYsDzmT/fFwPxINnPb2OYdzY+A6CD/lNgsgp7a+M4sOb/8kCfeM3Gb7HsoHi4/LNHGv4vZaQuZ/Oou+hs3BulphReo6kVbV/J7OVH23VFnCJHA6/I39qA7SW2ZJT4pdH8whzJbE0eVBGnBTVmejMrIgFjnromSTswDMXFAIUx4XiWmuMOPdtDv3vNOl5YESAYzkJP7VKxdQMxhfPO9xLpanjjAIho3NKB4/h0f7O+Xv2J8b0LY+Y4wz+Y6JFsgO3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkWLf+lwpa3bNkDStcFz/F4MOFOX2bq/N3ayqRSYRPs=;
 b=B277/Oy/3iOig9doSJsrkR7EtZaTGYLRmBYl4F7xlevIvewAcI2yzn9ZXHaVqoBKxBDB80CiGHWFqD8FH0C768brWk2NQb4t/GyW7LcmYmN3kFoB+yPRoZfU4O5TfIrFyYPz4ktclpR8ZZBWmHdb7Ho/2QibliKF7rkbnStNCSW3Kow1ZUuPQQy1mfFWMuoQ6yK2cF2/7zzeZ2J/3SHbsn/11ZdAzvQGjGLQAB6NQQvTAhrvFv443/7FvkNUfFVhowljFAavF6tdc0oQHSof8K/E8aq4dIUTnDP2EWtwN9Mi4JgeNzYAq6bNJKiezCvKYlNA3Qsw8v+sugccJiLCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from BL0PR04MB4532.namprd04.prod.outlook.com (10.167.181.144) by
 BL0PR04MB4516.namprd04.prod.outlook.com (10.167.172.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 02:08:51 +0000
Received: from BL0PR04MB4532.namprd04.prod.outlook.com
 ([fe80::c184:37a4:7e6e:aa42]) by BL0PR04MB4532.namprd04.prod.outlook.com
 ([fe80::c184:37a4:7e6e:aa42%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 02:08:51 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Thread-Topic: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Thread-Index: AQHVf00oAsK7Lki4wU2Sq6LUBIfyh6dToneAgAAA2YCAAQ+sAA==
Date: Fri, 11 Oct 2019 02:08:50 +0000
Message-ID: <20191011020838.GA24665@xin-VirtualBox>
References: <cover.1570699576.git.xji@analogixsemi.com>
 <43f48a7036e5a2991bd6bd8a7361107b27e48c54.1570699576.git.xji@analogixsemi.com>
 <20191010095315.GK13286@kadam> <20191010095617.GL13286@kadam>
In-Reply-To: <20191010095617.GL13286@kadam>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:2e::36) To BL0PR04MB4532.namprd04.prod.outlook.com
 (2603:10b6:208:4f::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71e79915-43f9-455f-ef12-08d74deff547
x-ms-traffictypediagnostic: BL0PR04MB4516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB451612E1E6A2646508F9E663C7970@BL0PR04MB4516.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(346002)(136003)(366004)(396003)(39850400004)(376002)(199004)(189003)(33716001)(33656002)(7736002)(14454004)(6116002)(71190400001)(478600001)(7416002)(6512007)(9686003)(305945005)(1076003)(4326008)(3846002)(256004)(71200400001)(8676002)(8936002)(54906003)(2906002)(316002)(81156014)(81166006)(6916009)(26005)(76176011)(6506007)(386003)(186003)(102836004)(66066001)(6486002)(25786009)(86362001)(486006)(52116002)(99286004)(476003)(6436002)(66446008)(66946007)(66556008)(66476007)(64756008)(229853002)(5660300002)(6246003)(107886003)(11346002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR04MB4516;
 H:BL0PR04MB4532.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: usKS3wylebWlSSkYQwC9iMZVGVwMnI012B776Vij0BVDqfOxn0a0FvRxSuJO8ImmKg9nZz7u0x71qaV062uqiVJNZBH4JDTd8LJR3q4U8C0zsPlYmFlJkz87G7lisXuxHgXcJLNk+alDnuhRS96MKnElCH09SXySr5GJ8SKIvd4VTjHUePB+uC/YElie1r0sWKXNEKInE3WQHY633U0uaY81+wm8HwCa+8MiWtkPYSrn45yKsW5RDJeoPD/65Jn2PBBm+Fik2D+obp+SeG1gFgWdJOIl6NS7bETWAa7hZRex3Tf3J53KzjcBmGumgdOoeWibMtp2wGiUtREFKlCPFFkW4v4s/Fl+qG5xvh7GGYvstMbVPxXyES3KvX8WEWOpRyvuJ2pUxCKXSSJXA27gj1fp9GZxK24+HfsCZ/zH+HU=
Content-ID: <74774DB8CEF834469574AC2BF8907A4B@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e79915-43f9-455f-ef12-08d74deff547
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 02:08:50.9675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZYKiGDEgQL4ZvGLttVYYMI25yzDrRuHuXYsq4+zpzheDHegNEpbpKN5eqw4uPG1uYAnMYOzaLB3lbokuf8hww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4516
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkWLf+lwpa3bNkDStcFz/F4MOFOX2bq/N3ayqRSYRPs=;
 b=O1Y84+iZXk9pFKFmzv0LBXXjaw5psV7qvRtUBi56UgRl1/U2WVsklDU6AMiFIVNssw5nwcMmXsb2WomUG43gAxldYUH4PMNjJblq9kM/4S/fgWzSLcvtx3dE3d1SZdYn5xckE4CLshNy6MqKvh/YpzU6KUUnAVWOUF8Vi46u7bU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuIENhcnBlbnRlciwKClRoaXMgaXMgYSBidWcsIEknbGwgZml4IGl0IHJpZ2h0IG5vdy4K
ClRoZSBjb2RpbmcgaXMgbXVjaCBuaWNlciB0aGFuIGJlZm9yZSwgdGhhbmtzIGZvciB5b3VyIGNv
bW1lbnRzLAppdCBpcyB2ZXJ5IGhlbHBmdWwgZm9yIG1lLgoKVGhhbmtzLApYaW4KCgpPbiBUaHUs
IE9jdCAxMCwgMjAxOSBhdCAxMjo1NjoxN1BNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDEyOjUzOjE1UE0gKzAzMDAsIERhbiBDYXJwZW50ZXIg
d3JvdGU6Cj4gPiBUaGlzIGNvZGUgaXMgKnNvKiBtdWNoIG5pY2VyIHRoYW4gYmVmb3JlLiAgSSBo
b3BlIHlvdSBmZWVsIGdvb2QgYWJvdXQKPiA+IHRoZSBjaGFuZ2VzLiAgSXQgbWFrZXMgbWUgaGFw
cHkgdG8gbG9vayBhdCB0aGlzIGNvZGUgbm93Lgo+ID4gCj4gPiBPbiBUaHUsIE9jdCAxMCwgMjAx
OSBhdCAwOTozNDoxOUFNICswMDAwLCBYaW4gSmkgd3JvdGU6Cj4gPiA+ICtzdGF0aWMgaW50IGVk
aWRfcmVhZChzdHJ1Y3QgYW54NzYyNV9kYXRhICpjdHgsCj4gPiA+ICsJCSAgICAgdTggb2Zmc2V0
LCB1OCAqcGJsb2NrX2J1ZikKPiA+ID4gK3sKPiA+ID4gKwlpbnQgcmV0LCBjbnQ7Cj4gPiA+ICsJ
c3RydWN0IGRldmljZSAqZGV2ID0gJmN0eC0+Y2xpZW50LT5kZXY7Cj4gPiA+ICsKPiA+ID4gKwlm
b3IgKGNudCA9IDA7IGNudCA8IEVESURfVFJZX0NOVDsgY250KyspIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXgo+IAo+ID4gPiArCQlzcF90eF9hdXhf
d3IoY3R4LCBvZmZzZXQpOwo+ID4gPiArCQkvKiBzZXQgSTJDIHJlYWQgY29tIDB4MDEgbW90ID0g
MCBhbmQgcmVhZCAxNiBieXRlcyAqLwo+ID4gPiArCQlyZXQgPSBzcF90eF9hdXhfcmQoY3R4LCAw
eGYxKTsKPiA+ID4gKwo+ID4gPiArCQlpZiAocmV0KSB7Cj4gPiA+ICsJCQlzcF90eF9yc3RfYXV4
KGN0eCk7Cj4gPiA+ICsJCQlEUk1fREVWX0RFQlVHX0RSSVZFUihkZXYsICJlZGlkIHJlYWQgZmFp
bGVkLCByZXNldCFcbiIpOwo+ID4gPiArCQkJY250Kys7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl4KPiAKPiBJIG1lYW4gdGhhdCBpdCdzIGluY3JlbWVudGVkIHR3aWNlLCB5ZWFoPwo+
IAo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
