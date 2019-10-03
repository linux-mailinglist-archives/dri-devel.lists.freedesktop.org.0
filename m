Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF7CA0EF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 17:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9D26EA0E;
	Thu,  3 Oct 2019 15:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2019 15:10:40 UTC
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DB16EA0F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 15:10:40 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AQYKrPhGO8+M6SRUSxUdw0J1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+efzpaDYhGslZfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CyAABpDZZd/40NJK1lHAEBAQQBAQw?=
 =?us-ascii?q?EAQGBVQUBAQsBgUpQA4FDIAQLKoQig0cDikaCNyWXeIEugSQDVAkBAQEMAQE?=
 =?us-ascii?q?tAgEBhEACF4IuIzYHDgIDCQEBBAEBAQIBBQRthS0MhUsBAQEBAgESEQQNDAE?=
 =?us-ascii?q?BNwEPAgEIDgoCAiYCAgIwFRACBAENBSKDAIFrAw4PAaNKAoE4iGF1fzOCfQE?=
 =?us-ascii?q?BBYUIGIIXCYEMKAGMDRiBQD+BOAyCXz6EDU6CdoJYjQKCaY5njmoKgiOVEgY?=
 =?us-ascii?q?bmUCOK5kxAgQCBAUCDgEBBYFZATGBWHAVgydQEBSBTwwXg1CKU3SBKY1gglQ?=
 =?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.67,252,1566864000"; d="scan'208";a="627753930"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 03 Oct 2019 15:03:12 +0000
Received: from XCH-ALN-015.cisco.com (xch-aln-015.cisco.com [173.36.7.25])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id x93F3Cna010498
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 3 Oct 2019 15:03:12 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-ALN-015.cisco.com
 (173.36.7.25) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 3 Oct 2019 10:03:12 -0500
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xhs-rtp-002.cisco.com
 (64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 3 Oct 2019 11:03:11 -0400
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 3 Oct 2019 11:03:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRYwpYCuJNdDXAbvRP89nHnJPReamTHDsszXM4SiNIumEnXHxTbMSTYubqgD6r94lSRvTU9LyeA9BDmVK5q+/tsjtHSELo9pV4LU+Wn7/+wTBWS9lv/a5McL9iYeu9cn64BaB10ggVXkOcSZOLJqOYj7rjNdUa11TgZYPasNJEP3FE37klowpT/iSLhOITj8FJ9zgbV/4c/imvGYCTNIou5gHPjUgGjmTsKw0dT0x52D9VUqZvLBLJ7fyiiJjRKmsOY1vvV6djF8eb/cSsT0WAW+jVbQSPJwV//tlJl+T3l5XEEAZjKVscztfsazuD2PAl9BZbJ+JymBLczhWqRMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDysDnIMWI/2cJ508I6cFmliiZyQgZ6rHPJmAof8t38=;
 b=VPQl2YI6cvnq/gIq4T/bcrKpODCAjgfRZtK/rfk2cOF6UZR5LExuCnjvZf+VJ6P+xfKMe6blyHvN8Kzt9EvOVBHRYrB3/O6pSW/rOLct8EBD166jN6+ohhZeY8SZCaZH58mrUJeahJ8ORb91CF6O2MjOnp35sESC/1dJeVmlwpJhvWi86bqgrumqhQ8xukWV0D2lQPiNh3mq2+pynFddvR2IqU/s4HIcmmU7SfBg4+6HhDhIXtihJOauEESZJ5bpi14gOGe/E+jLztkxI8h3wbb2VHAVTjEiP8YXB+ZULBxtO9uK515PG50Nx/KpcNn9UI+vqBFBlE59m9ykJ7WwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com (10.174.104.137) by
 DM5PR1101MB2284.namprd11.prod.outlook.com (10.174.108.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 15:03:10 +0000
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::9511:5547:ff62:72e6]) by DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::9511:5547:ff62:72e6%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 15:03:10 +0000
From: "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Thread-Topic: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Thread-Index: AQHVebpwiYPUJFa2nk+tYdVtmvLfh6dJAv0AgAAA5IA=
Date: Thu, 3 Oct 2019 15:03:10 +0000
Message-ID: <b2fef514-4161-3c13-cf8e-1b378f5e1f22@cisco.com>
References: <20191003071549.31272-1-jkorsnes@cisco.com>
 <3d11335d-8e5c-f062-91f5-fb3bf87c77b9@xs4all.nl>
In-Reply-To: <3d11335d-8e5c-f062-91f5-fb3bf87c77b9@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:420:44c1:2576:6778:78a3:599f:41d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 230f96f8-7201-4630-c60d-08d74812ce51
x-ms-traffictypediagnostic: DM5PR1101MB2284:
x-microsoft-antispam-prvs: <DM5PR1101MB22842925307C48AC69113614D79F0@DM5PR1101MB2284.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:409;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(189003)(199004)(6486002)(486006)(6436002)(229853002)(305945005)(36756003)(186003)(31696002)(4326008)(86362001)(316002)(6506007)(31686004)(256004)(14444005)(102836004)(53546011)(46003)(6512007)(2501003)(7736002)(25786009)(110136005)(71190400001)(71200400001)(99286004)(478600001)(8676002)(8936002)(6116002)(81156014)(14454004)(2906002)(81166006)(64756008)(66446008)(66556008)(476003)(91956017)(76116006)(11346002)(66946007)(2616005)(66476007)(446003)(6246003)(5660300002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1101MB2284;
 H:DM5PR1101MB2140.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTfSEldoZIyrIbqMHKNQNk4Es/lTKI45ssXhQaWAhWiTv4JV3/oT+498lBJXASZqotNMDpz/mea2XwUQet3MPxBoYAx6Qo4yONXAUXHfNUQpV0hl8kruX6CvIHUW7BW5dcalPJikLT6ug6AdorCQGxlHvIEBeKjreQJMp5/rx7fijs1S7jtXdREzDH+moIEbFSS2lXMFhSRCVk+MWVlLD4neduu2EVQQ8dwxp2qGAWTuBXQMPJoYxeR/+k29mPjv0QQSBsYNv0SFY9je9+JFiv1v6M9GfyR1qfq2H+zPPkJQtFMZ01ctghHJX/+QeWmWhPjJUWe84M/81MbA7/Akbv8YoQnx1UK1Pk/pVNkXjr/UElMYzXJm2DT/kpBlGGUvtLQv4mX6Omd9U3ylzrrkN/lNDoQW9Mc78Bh+Ompqhv8=
x-ms-exchange-transport-forked: True
Content-ID: <87EC658BF4CFCF4C8193ACA04997D8A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 230f96f8-7201-4630-c60d-08d74812ce51
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 15:03:10.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+nTPzCoReRbzH9LeoZUaPhqN/RHWTB2C1YuRnxP5+xKQf0JSb0HMWPYq85G2Uq6A3LscfLoewmT6yVpnMUuJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2284
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.25, xch-aln-015.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2726; q=dns/txt; s=iport;
 t=1570115440; x=1571325040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=LDysDnIMWI/2cJ508I6cFmliiZyQgZ6rHPJmAof8t38=;
 b=W/EBQxZcBg8kgSGAYBw297flzu3elKIOvj5i31K46DDIiZTks991Bata
 rBMALXhfusEK3w7G55pI+cEsMEBtjyS0bImvSrv8CU9goehb27m2vkRdg
 ixjhuf0QegBFty57ZPp6JRhuiCVc9ZacLqJyen25xxSL1m0RpheaxT0/B
 Q=;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDysDnIMWI/2cJ508I6cFmliiZyQgZ6rHPJmAof8t38=;
 b=COYTgSh1tBpS4rkhNwIVItKo3m9yBAIFeEAXZHvUOM4hRQib8o3ii9EZOQtWi0m11CPpSj2w2JN36TDezlEbScxYyfHfUy4hnjLkoJKtjOojiD3b/lB5KFDe07rCu14rSeanZUaMrD7raDTiADwMkkTRKGkv0UKsJaLOa5wXjt8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
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
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMTAvMjAxOSAxNi41OSwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBPbiAxMC8zLzE5IDk6
MTUgQU0sIEpvaGFuIEtvcnNuZXMgd3JvdGU6DQo+PiBXaGVuIGxvZ2dpbmcgdGhlIEFWSSBJbmZv
RnJhbWUsIGNsZWFybHkgaW5kaWNhdGUgd2hldGhlciBvciBub3QgdGhlDQo+PiBleHRlbmRlZCBj
b2xvcmltZXRyeSBhdHRyaWJ1dGUgaXMgYWN0aXZlLiBUaGlzIGlzIG9ubHkgdGhlIGNhc2Ugd2hl
bg0KPj4gdGhlIEFWSSBJbmZvRnJhbWUgY29sb3JpbWV0cnkgYXR0cmlidXRlIGlzIHNldCB0byBl
eHRlbmRlZC4gWzBdDQo+Pg0KPj4gWzBdIENUQS04NjEtRyBzZWN0aW9uIDYuNCBwYWdlIDU3DQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gS29yc25lcyA8amtvcnNuZXNAY2lzY28uY29tPg0K
Pj4gLS0tDQo+PiAgZHJpdmVycy92aWRlby9oZG1pLmMgfCA4ICsrKysrKystDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jDQo+PiBpbmRl
eCBmMjlkYjcyOGZmMjkuLmE3MDllMzhhNTNjYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlk
ZW8vaGRtaS5jDQo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2hkbWkuYw0KPj4gQEAgLTY4Miw4ICs2
ODIsMTQgQEAgc3RhdGljIHZvaWQgaGRtaV9hdmlfaW5mb2ZyYW1lX2xvZyhjb25zdCBjaGFyICps
ZXZlbCwNCj4+ICAJaGRtaV9sb2coIiAgICBhY3RpdmUgYXNwZWN0OiAlc1xuIiwNCj4+ICAJCQlo
ZG1pX2FjdGl2ZV9hc3BlY3RfZ2V0X25hbWUoZnJhbWUtPmFjdGl2ZV9hc3BlY3QpKTsNCj4+ICAJ
aGRtaV9sb2coIiAgICBpdGM6ICVzXG4iLCBmcmFtZS0+aXRjID8gIklUIENvbnRlbnQiIDogIk5v
IERhdGEiKTsNCj4+IC0JaGRtaV9sb2coIiAgICBleHRlbmRlZCBjb2xvcmltZXRyeTogJXNcbiIs
DQo+PiArDQo+PiArCWlmIChmcmFtZS0+Y29sb3JpbWV0cnkgPT0gSERNSV9DT0xPUklNRVRSWV9F
WFRFTkRFRCkNCj4+ICsJCWhkbWlfbG9nKCIgICAgZXh0ZW5kZWQgY29sb3JpbWV0cnk6ICVzXG4i
LA0KPj4gIAkJCWhkbWlfZXh0ZW5kZWRfY29sb3JpbWV0cnlfZ2V0X25hbWUoZnJhbWUtPmV4dGVu
ZGVkX2NvbG9yaW1ldHJ5KSk7DQo+PiArCWVsc2UNCj4+ICsJCWhkbWlfbG9nKCIgICAgZXh0ZW5k
ZWQgY29sb3JpbWV0cnk6IE4vQSAoMHgleClcbiIsDQo+PiArCQkJZnJhbWUtPmV4dGVuZGVkX2Nv
bG9yaW1ldHJ5KTsNCj4+ICsNCj4+ICAJaGRtaV9sb2coIiAgICBxdWFudGl6YXRpb24gcmFuZ2U6
ICVzXG4iLA0KPj4gIAkJCWhkbWlfcXVhbnRpemF0aW9uX3JhbmdlX2dldF9uYW1lKGZyYW1lLT5x
dWFudGl6YXRpb25fcmFuZ2UpKTsNCj4+ICAJaGRtaV9sb2coIiAgICBudXBzOiAlc1xuIiwgaGRt
aV9udXBzX2dldF9uYW1lKGZyYW1lLT5udXBzKSk7DQo+Pg0KPiANCj4gSSBqdXN0IHJlYWxpemVk
IHRoYXQgdGhlcmUgYXJlIG1vcmUgZmllbGRzIGxpa2UgdGhhdDoNCj4gDQo+IGNvbnRlbnRfdHlw
ZSBpcyBvbmx5IHZhbGlkIGlmIGl0YyA9PSB0cnVlDQo+IA0KPiBxdWFudGl6YXRpb25fcmFuZ2Ug
aXMgb25seSB2YWxpZCBpZiBjb2xvcnNwYWNlIGlzIFJHQg0KPiANCj4geWNjX3F1YW50aXphdGlv
bl9yYW5nZSBpcyBvbmx5IHZhbGlkIGlmIGNvbG9yc3BhY2UgaXMgWUNDDQo+IA0KPiBDYW4geW91
IG1ha2UgYSB2MiB3aGVyZSB0aGVzZSBmaWVsZHMgYXJlIGhhbmRsZWQgaW4gdGhlIHNhbWUgd2F5
Pw0KPiBUaGF0IHdvdWxkIHJlYWxseSBoZWxwIHJlZHVjZSB0aGUgY29uZnVzaW9uIHdoZW4gbG9n
Z2luZyB0aGUNCj4gQVZJIEluZm9GcmFtZS4NCg0KSSB3aWxsIG1ha2UgYSB2MiBoYW5kbGluZyB0
aGVzZSBjYXNlcyBhcyB3ZWxsOyB0aGFua3MgZm9yIHBvaW50aW5nIGl0DQpvdXQuDQoNCkJlc3Qg
cmVnYXJkcywNCkpvaGFuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
