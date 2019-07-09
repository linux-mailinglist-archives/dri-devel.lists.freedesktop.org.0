Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6E642B7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940E89C60;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697CE895E1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 16:24:55 +0000 (UTC)
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Nicolas.Ferre@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="Nicolas.Ferre@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
IronPort-SDR: zq5nIXG1+hmWDqopAW2SsZlZNdGqGrbS7syFp9E8b8nhay8fJxWjVG/nO5UZBVkN8bHiKHAAl8
 MpLqOD6ASftRqloKwdn4WimpXIWu/UimxwzjijOKxCHJvkLVd5RaH9J/l01TbNOzyu1KGMmg9K
 2dlKrFs2mg1+u9Xp+aOhwbpFY7Scqb4uXZ//Xd7uYLO3G9SdPc+B8w4vbb8iP706hdzrXiEyj/
 5PqxIrLivl3L2heVQsMBwLng6Fd6cLJJdCVLAYPm/UCFcmMKcmBCAoas0Z6PQIAoD726pV6jm1
 8yM=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="37495532"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jul 2019 09:24:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 09:24:52 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 9 Jul 2019 09:24:52 -0700
Received: from DM5PR11MB1658.namprd11.prod.outlook.com (10.172.36.9) by
 DM5PR11MB1308.namprd11.prod.outlook.com (10.168.105.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 16:24:49 +0000
Received: from DM5PR11MB1658.namprd11.prod.outlook.com
 ([fe80::ac00:e9e5:9236:a53b]) by DM5PR11MB1658.namprd11.prod.outlook.com
 ([fe80::ac00:e9e5:9236:a53b%6]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 16:24:49 +0000
From: <Nicolas.Ferre@microchip.com>
To: <Joshua.Henderson@microchip.com>, <bbrezillon@kernel.org>,
 <airlied@linux.ie>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable replication
 logic
Thread-Topic: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable replication
 logic
Thread-Index: AQHVNnLUp3D4BDdODU6yB+9d2PU0ng==
Date: Tue, 9 Jul 2019 16:24:49 +0000
Message-ID: <13aa50e4-a726-3f82-b186-79b452199a02@microchip.com>
References: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
In-Reply-To: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To DM5PR11MB1658.namprd11.prod.outlook.com
 (2603:10b6:4:8::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.41.198.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62245927-3bd6-4118-01be-08d70489f6dc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB1308; 
x-ms-traffictypediagnostic: DM5PR11MB1308:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB1308F77FDC29F5387E107390E0F10@DM5PR11MB1308.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(189003)(446003)(966005)(476003)(68736007)(2616005)(11346002)(26005)(81156014)(81166006)(8676002)(486006)(31686004)(8936002)(186003)(14454004)(86362001)(36756003)(6506007)(386003)(52116002)(256004)(31696002)(99286004)(76176011)(71190400001)(71200400001)(2906002)(25786009)(478600001)(72206003)(4326008)(3846002)(6116002)(14444005)(6246003)(66556008)(110136005)(54906003)(229853002)(66946007)(6306002)(102836004)(66066001)(316002)(53546011)(305945005)(6436002)(6512007)(5660300002)(73956011)(7736002)(53936002)(66476007)(64756008)(6486002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1308;
 H:DM5PR11MB1658.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 50CNWcAuCXwrGnE9pqzMPizA65j1Si8QXij5ao+SjCvZSM10OwHDgLX03DxlZo7bay5ZZF43LWwuR/ld82NKi5eXf/UnmIl8AWd4Qg0zhaYJJl9htWmIKv+imkVZjkviYAEpD3yhCRbSlhPsBWhfhAxowPRGNPMR/umGAE3gG3CNLo37NGFF2gx523K7y+GCjXVHVmHi4BcO9DL/cLGwtHUoVyA0SLXgBxETkLyJyeGs8LPXkUOTkaL9Fapn74JQwpz9Sc+u/UHaG8eiKw/8alHdUsnZYsT0WLLMdODTBTQcA+wdDS9c5HMQVVRYsASJztjnPMcHZpa1ZTVI97TDENryTQl3fhil2uken7elyi428n12WWG3CxrENAuNHqyUqhA1z7WzcMc2Kcx3rEjY9Jdayuz/yOZuElRLx7E2cLk=
Content-ID: <FD2526B8CCCAF349AEF9DF04105D5153@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62245927-3bd6-4118-01be-08d70489f6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 16:24:49.6700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nicolas.ferre@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1308
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzpU393+ErV/wSZV5KBYY30BN4kZCxO4qbcA3mHDmhM=;
 b=yXwu/in0Vrs4oBL6HVhKySdRxbf63fYcq4pBv/wlWQv7ynSFjJBfvz1rZfQdgEGSvGfiPMoDamdjTdVMWZgQCGOQBIxjfgYXzMYNaokVrG7iyYqhDr7H/8ytIl1s4T3RKvc1RD3PDL8PzC5GFUPFKwxlL64wXjdaE2uhFrcS7y4=
X-Mailman-Original-Authentication-Results: esa6.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Nicolas.Ferre@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: sam@ravnborg.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDcvMjAxOSBhdCAxNzozNSwgSm9zaHVhIEhlbmRlcnNvbiB3cm90ZToKPiBUaGlzIGJp
dCBlbmFibGVzIHJlcGxpY2F0aW9uIGxvZ2ljIHRvIGV4cGFuZCBhbiBSR0IgY29sb3IgbGVzcyB0
aGFuIDI0Cj4gYml0cywgdG8gMjQgYml0cywgd2hpY2ggaXMgdXNlZCBpbnRlcm5hbGx5IGZvciBh
bGwgZm9ybWF0cy4gIE90aGVyd2lzZSwKPiB0aGUgbGVhc3Qgc2lnbmlmaWNhbnQgYml0cyBhcmUg
YWx3YXlzIHNldCB0byB6ZXJvIGFuZCB0aGUgY29sb3IgbWF5IG5vdAo+IGJlIHdoYXQgaXMgZXhw
ZWN0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIEhlbmRlcnNvbiA8am9zaHVhLmhlbmRl
cnNvbkBtaWNyb2NoaXAuY29tPgoKQWNrZWQtYnk6IE5pY29sYXMgRmVycmUgPG5pY29sYXMuZmVy
cmVAbWljcm9jaGlwLmNvbT4KCkhlcmUgaXMgcGF0Y2h3b3JrIGVudHJ5OgpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzExMDM3MTY3LwoKVGhhbmtzLCBiZXN0IHJlZ2FyZHMsCiAg
IE5pY29sYXMKCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfcGxhbmUuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMv
YXRtZWxfaGxjZGNfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19wbGFuZS5jCj4gaW5kZXggZWI3YzRjZi4uNmY2Y2Y2MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jCj4gQEAgLTM4OSw3ICsz
ODksNyBAQCBhdG1lbF9obGNkY19wbGFuZV91cGRhdGVfZ2VuZXJhbF9zZXR0aW5ncyhzdHJ1Y3Qg
YXRtZWxfaGxjZGNfcGxhbmUgKnBsYW5lLAo+ICAgCWF0bWVsX2hsY2RjX2xheWVyX3dyaXRlX2Nm
ZygmcGxhbmUtPmxheWVyLCBBVE1FTF9ITENEQ19MQVlFUl9ETUFfQ0ZHLAo+ICAgCQkJCSAgICBj
ZmcpOwo+ICAgCj4gLQljZmcgPSBBVE1FTF9ITENEQ19MQVlFUl9ETUE7Cj4gKwljZmcgPSBBVE1F
TF9ITENEQ19MQVlFUl9ETUEgfCBBVE1FTF9ITENEQ19MQVlFUl9SRVA7Cj4gICAKPiAgIAlpZiAo
cGxhbmUtPmJhc2UudHlwZSAhPSBEUk1fUExBTkVfVFlQRV9QUklNQVJZKSB7Cj4gICAJCWNmZyB8
PSBBVE1FTF9ITENEQ19MQVlFUl9PVlIgfCBBVE1FTF9ITENEQ19MQVlFUl9JVEVSMkJMIHwKPiAK
CgotLSAKTmljb2xhcyBGZXJyZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
