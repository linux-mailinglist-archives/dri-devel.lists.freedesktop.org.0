Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF02585D9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4666E558;
	Thu, 27 Jun 2019 15:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760093.outbound.protection.outlook.com [40.107.76.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1586E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=T+3Bw3wjKsLg3qLrIG4eesjlCc4Blmokld2SZtxf43wbnGTzjLP6j0gIKcOkJvdSz2A1fdzUJdCvu87RS2WkUryJdxjilwY3sTG3IlVRAKQ75UB+nEnQ9U+eJ10CGTKiq8MeY/HSnhtxN+Ufr8dP+vPJlKmEZZJGSpwLHMrllRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVdvPTvGgec/4z9jJCgGfdguG3KPfoiVEmfURUy1VwQ=;
 b=ftAhQFquyA3+xrircDifLvrN9y1zycmgG3G1GwfvM0aJDBUciXuERC+geBgcxNLcnhDlTZ7/D6jkt/GK+qCxvhe3FMBesnOzC8IviX2qtOcETfbgyOYe1RjXkrkXcmAaajkH7vbs7h/BXMq24zJSpBs+8wi3KgGjdjUY7Ch2kE4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB5839.namprd04.prod.outlook.com (20.179.22.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.17; Thu, 27 Jun 2019 11:24:39 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635%3]) with mapi id 15.20.2032.016; Thu, 27 Jun 2019
 11:24:39 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Adjust analogix chip driver location
Thread-Topic: [PATCH] Adjust analogix chip driver location
Thread-Index: AQHVLAwnWdhoUTbW6kumQO1/091b5g==
Date: Thu, 27 Jun 2019 11:24:39 +0000
Message-ID: <20190627112430.GA4197@xin-VirtualBox>
References: <20190626104430.GA11770@xin-VirtualBox>
 <20190626122317.GC30972@kroah.com>
In-Reply-To: <20190626122317.GC30972@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0179.apcprd02.prod.outlook.com
 (2603:1096:201:21::15) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 851cd163-83d2-4bb1-c354-08d6faf20acc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB5839; 
x-ms-traffictypediagnostic: MN2PR04MB5839:
x-microsoft-antispam-prvs: <MN2PR04MB58398E866F68ED4FB40F61A0C7FD0@MN2PR04MB5839.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(396003)(346002)(366004)(39850400004)(376002)(136003)(189003)(199004)(305945005)(6916009)(66446008)(107886003)(5660300002)(3846002)(6116002)(256004)(2351001)(14444005)(66066001)(5640700003)(33716001)(6246003)(478600001)(1076003)(33656002)(53936002)(71200400001)(71190400001)(86362001)(52116002)(76176011)(25786009)(11346002)(6506007)(229853002)(4326008)(6486002)(476003)(26005)(486006)(64756008)(66476007)(446003)(66556008)(6436002)(54906003)(7736002)(186003)(2906002)(68736007)(81156014)(8936002)(386003)(81166006)(316002)(1730700003)(6512007)(9686003)(99286004)(66946007)(73956011)(14454004)(102836004)(8676002)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5839;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VD4jp2iIVVHS0qYnZpRWJHubvSKV3ujXMA5kTO/XDSFsJKRBDyHHxx+2GssY2nd4QjlHnIB7KYX69M4uY98oHWdCb+geYwkulhn1oBvoaZ5L5x9IUO8u7on540t7c8+nuHcheFOOhN91qUbD3OLpyIdcx3RauhYsAyD095nA3bEtD8Mk8f+SEIkT5hdTBBeTfqTZ8ZDC+6gOnviweeXOvWxrmIihNlh/qZ8V1jgYYO6cuQkRG9J3mhIhCCjdtO7p6C8UdymX85AFeIEjbFdKtkKIJSd04uHm3peM+FIr5Qtltt7IDSfayvEbUSFq3gdKd55DcGYaj8Pnh863F9pNPVhAb3aSU5INI08jJ6ej3dLAKENhFzbxTM9W98Ig+T30saxXLzfO6jmIc0ErJof5DEUizrxzV0jR47Eh+j22/V4=
Content-ID: <23DDEA1C4E97CA499C817164357FB5E7@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851cd163-83d2-4bb1-c354-08d6faf20acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 11:24:39.5611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xji@analogixsemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5839
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:33:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector1-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVdvPTvGgec/4z9jJCgGfdguG3KPfoiVEmfURUy1VwQ=;
 b=WESFCbhyaUeFY+HOSWtIQsqH8YLZH9U2uLfG1X42K+EtMGq+x+Tbg63v8IfAOapbT+ANfmKpamxdUoHggAe/TAQxyQCJFmPS6qcv8JW+zUuVDshUU6feA9O440gb9iWZKeAVcnH6hAb3BDaic7MFOyYvsxlzn308JX4/YuDy7J4=
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sjoerd.simons@collabora.co.uk" <sjoerd.simons@collabora.co.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6MjM6MTdQTSArMDgwMCwgZ3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6NDQ6MzhBTSAr
MDAwMCwgWGluIEppIHdyb3RlOgo+ID4gTW92ZSBhbmFsb2dpeCBjaGlwIEFOWDc4WFggYnJpZGdl
IGRyaXZlciBpbnRvICJhbmFsb2dpeCIgZGlyZWN0b3J5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDEwIC0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDMgKy0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyAgICAgICAgICB8
IDE0ODUgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4LWFueDc4eHguaCAgICAgICAgICB8ICA3MTAgLS0tLS0tLS0tLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvS2NvbmZpZyAgICAgICAgICAgIHwgICAxMCArCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9NYWtlZmlsZSAgICAgICAgICAgfCAgICAy
ICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHgu
YyB8IDE0ODUgKysrKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguaCB8ICA3MTAgKysrKysrKysrKwo+ID4gIDggZmls
ZXMgY2hhbmdlZCwgMjIwOCBpbnNlcnRpb25zKCspLCAyMjA3IGRlbGV0aW9ucygtKQo+ID4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHgu
Ywo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
LWFueDc4eHguaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguaAo+IAo+ICdnaXQg
Zm9ybWF0LXBhdGNoIC1NJyBpcyB1c3VhbGx5IGEgbG90IGJldHRlciB0byB1c2Ugd2hlbiBtb3Zp
bmcgZmlsZXMKPiBhcm91bmQsIGFzIGl0IHNob3dzIHlvdSBvbmx5IGFueSBjaGFuZ2VzIGluIHRo
ZSBmaWxlcywgbm90IGEgaHVnZQo+IGRlbGV0ZS9hZGQgY3ljbGUuCj4gCj4gdGhhbmtzLAo+IAo+
IGdyZWcgay1oCgpUaGFua3MsIEknbGwgc3VibWl0IG5ldyB2ZXJzaW9uLgoKWGluCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
