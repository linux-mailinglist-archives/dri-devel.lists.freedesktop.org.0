Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D6C1378
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 07:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F3E6E109;
	Sun, 29 Sep 2019 05:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC356E109;
 Sun, 29 Sep 2019 05:23:33 +0000 (UTC)
Received: from VI1PR08CA0087.eurprd08.prod.outlook.com (2603:10a6:800:d3::13)
 by DB6PR08MB2887.eurprd08.prod.outlook.com (2603:10a6:6:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.21; Sun, 29 Sep
 2019 05:23:28 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0087.outlook.office365.com
 (2603:10a6:800:d3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Sun, 29 Sep 2019 05:23:28 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 05:23:26 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Sun, 29 Sep 2019 05:23:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ed8157f2402cf5c
X-CR-MTA-TID: 64aa7808
Received: from 8e86b7e8f3cf.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B49AD9E9-9769-404B-A0D3-BC3FDE6EB248.1; 
 Sun, 29 Sep 2019 05:23:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e86b7e8f3cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sun, 29 Sep 2019 05:23:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9aA+zM3U04TKZQCxqMdgBw4pZ519Z3yOnH8flUw0iS2T1UWut7JANdO8b5dyd3zJR6KAXs3v4KzRTu201Aiig/NMxRig5svt7Q7OqhthPzmAOurq8eICzGhzAXBm/TGSCZHjKSSrvlR0EKt72Mi2NXMr/fJt7YOQTHFsHXB0+tw9jClO8sug7teAgenjzlUQK7gdBrxBAg1PpZ4SbOsmvrptkTyJYe9WMOU3DD1vufqYYh2LOAryNFRuZ38tJ0D1FTVj5mHoCcXcweBCIbcr+B9Cb30sqzpM/LTGvaAy98LKzwMmhBjZgLR7ACVlZieUogVubnI1GWCIeolKVn55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P+wAd+Z1hHNNb9A9N6OTC+duUrGTYpjIxR+D145nnE=;
 b=cZ3drsQj+AfbJokAlAYgjqN1nFrKT8Ngi8hE4pg3xIRYA5SdEzr2LQKthVKNOlGE1ug6zRcGiNosKaVOPRC/GF22thZmMn5MAZFVdIS9XAoiLbJbKe41gbRlGH5mJ8odmc9oaz0keZ3rR2QZTz4payDLE5qPH7Dnm0PnxW4liGh3nJAFmgts+2uotwwKZG63r3iMKV3AE2cVIFHnVqlaubVwQbyv/co90MFopk9KTergm4HV89fFlnOP9kDOv4dfTfp7E3NmzJ/bTHrc+64zMNUliChxSsx7FJpVYjZBYxupcIFGemm163cXxWBq5P2JcY/7mM0ZvydrbPMRi+1ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4830.eurprd08.prod.outlook.com (10.255.113.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 05:23:14 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 05:23:14 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [v8,2/4] drm/panel: set display info in panel attach
Thread-Topic: [v8,2/4] drm/panel: set display info in panel attach
Thread-Index: AQHVdoX9hlvb+H46dE2AJOeuAIY3EA==
Date: Sun, 29 Sep 2019 05:23:14 +0000
Message-ID: <20190929052307.GA28304@jamwan02-TSP300>
References: <20190925225833.7310-3-dbasehore@chromium.org>
In-Reply-To: <20190925225833.7310-3-dbasehore@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f9c8e9d3-7943-4ebc-9a6c-08d7449d282a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4830:|DB6PR08MB2887:
X-Microsoft-Antispam-PRVS: <DB6PR08MB2887BBC75503CCB140658BBCB3830@DB6PR08MB2887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 017589626D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(39850400004)(376002)(396003)(136003)(346002)(189003)(199004)(5660300002)(6486002)(25786009)(256004)(58126008)(54906003)(6246003)(99286004)(86362001)(4326008)(229853002)(33656002)(6512007)(9686003)(5024004)(66066001)(81166006)(7416002)(316002)(8676002)(6916009)(6436002)(8936002)(52116002)(81156014)(64756008)(66446008)(66476007)(11346002)(2906002)(26005)(446003)(3846002)(186003)(76176011)(66556008)(102836004)(55236004)(386003)(6506007)(1076003)(71200400001)(6116002)(66946007)(71190400001)(476003)(486006)(305945005)(14454004)(33716001)(7736002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4830;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: V+gWh0SOiCJZx9vpM8JB+q2TrlXBzjfX+GqN7IDKsMDhSpDcSwRIEIsps3vubKYAngvTMALFRI8R0CG/qxZDfK4O1SVdauHoD+53E1q/cvlNNE2Ed0jR5zYJns2mxJojTPd25ou6wAyDLmgR+Tay3suM44LmfB7HLwhvFnSoXEbVyDM4cvZHksuVJ0jDJSvI720OdJNcmfv5JIUPBbk1/NpsWHdoRY7zDINCpFHddJNQGFs2fQvRrIUy8gHb0L7k1MG17/UPSpY8CW8lIOR+S6oTZYYwHDZCc2Qx7DDyfX5dS473J/FeMI0YOSX5xHNSpZbmw5YmY4joPWNnTG6lFTrFHB4VxRV8WwmF4ygNATvRQv8VkFUsd1RF2ARsjZ6il4vM+JIQ0RLyxPyHpKLBm+EW7iElnHdJVvcoVhFekkg=
x-ms-exchange-transport-forked: True
Content-ID: <672C734F3D2D1142A821032C5E0FBE8C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4830
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(396003)(39850400004)(136003)(199004)(189003)(6862004)(446003)(476003)(102836004)(33656002)(8936002)(33716001)(1076003)(6246003)(4326008)(50466002)(14454004)(11346002)(8676002)(66066001)(336012)(99286004)(70206006)(486006)(450100002)(478600001)(386003)(6506007)(186003)(26005)(26826003)(70586007)(76176011)(86362001)(5024004)(126002)(25786009)(47776003)(76130400001)(8746002)(63350400001)(229853002)(2906002)(356004)(58126008)(46406003)(7736002)(81156014)(6486002)(3846002)(9686003)(305945005)(81166006)(6512007)(6116002)(5660300002)(22756006)(36906005)(54906003)(23726003)(316002)(97756001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2887;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 89114cdd-ee15-4b23-7be2-08d7449d2048
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB6PR08MB2887; 
NoDisclaimer: True
X-Forefront-PRVS: 017589626D
X-Microsoft-Antispam-Message-Info: CKau0lfVKpsPAXlvJwMjnEzdhNBlZ8+vCedzFcs/O16dcxJ2sRl+VhppecJmrzbc0dU3bOJr+HdsSR9KtGhcT6CUYUEOqDdvuk39grwysBidoWcJzyLmhEBhqH/cFcCfojOnbEHaIQ46hs1+L7DU1n/K2ltoHrfaBtfHioHoALrSU3Em6++KSrS7uH5Qy8OaT99aYBryEQrbnBjepzIhxxadCOXSy1chv+er4moWf5baJNzMb4hxz5MaJ0DeC/FEdeJFfMhSP2MBM8wytVbeMQ4EFlgYs/Oyd0Tdnkd8l/eLWJ4iU2X1IbG2MKY+IwX/vDyMTGD6opjZVBEOAEpFY5meytiWj9MnRpgp6CCA+oZ154tzcQ3uz+uHYKM+MvQFjfHO/8Dv4gmssgXkOgM0CySfBaKiQdjCh6a8CVq8Z+4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 05:23:26.9288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c8e9d3-7943-4ebc-9a6c-08d7449d282a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P+wAd+Z1hHNNb9A9N6OTC+duUrGTYpjIxR+D145nnE=;
 b=2uCNeb0yTLgZjjhHfCflhfgnDaP+DDmJJYPP7PptP+hlWZxaQ8uGxQrZN9hGFGmfaNQFeLnCQtYd7To8j5UYnGe6WwLXHFYx6rqiPq2wo5Lorq/SySCD9wADRWB21/YkKNVuB54neoHMZAh8q5VbrdJwe/1Ztontu2Fh9HXDRgU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P+wAd+Z1hHNNb9A9N6OTC+duUrGTYpjIxR+D145nnE=;
 b=2uCNeb0yTLgZjjhHfCflhfgnDaP+DDmJJYPP7PptP+hlWZxaQ8uGxQrZN9hGFGmfaNQFeLnCQtYd7To8j5UYnGe6WwLXHFYx6rqiPq2wo5Lorq/SySCD9wADRWB21/YkKNVuB54neoHMZAh8q5VbrdJwe/1Ztontu2Fh9HXDRgU=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDM6NTg6MzFQTSAtMDcwMCwgRGVyZWsgQmFzZWhvcmUg
d3JvdGU6Cj4gRGV2aWNldHJlZSBzeXN0ZW1zIGNhbiBzZXQgcGFuZWwgb3JpZW50YXRpb24gdmlh
IGEgcGFuZWwgYmluZGluZywgYnV0Cj4gdGhlcmUncyBubyB3YXksIGFzIGlzLCB0byBwcm9wYWdh
dGUgdGhpcyBzZXR0aW5nIHRvIHRoZSBjb25uZWN0b3IsCj4gd2hlcmUgdGhlIHByb3BlcnR5IG5l
ZWQgdG8gYmUgYWRkZWQuCj4gVG8gYWRkcmVzcyB0aGlzLCB0aGlzIHBhdGNoIHNldHMgb3JpZW50
YXRpb24sIGFzIHdlbGwgYXMgb3RoZXIgZml4ZWQKPiB2YWx1ZXMgZm9yIHRoZSBwYW5lbCwgaW4g
dGhlIGRybV9wYW5lbF9hdHRhY2ggZnVuY3Rpb24uIFRoZXNlIHZhbHVlcwo+IGFyZSBzdG9yZWQg
ZnJvbSBwcm9iZSBpbiB0aGUgZHJtX3BhbmVsIHN0cnVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
ZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X3BhbmVsLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX3Bh
bmVsLmggICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gaW5k
ZXggMDkwOWI1M2I3NGU2Li4xY2QyYjU2YzlmZTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9wYW5lbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gQEAg
LTEwNCwxMSArMTA0LDIzIEBAIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX3JlbW92ZSk7Cj4gICAq
Lwo+ICBpbnQgZHJtX3BhbmVsX2F0dGFjaChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCwgc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+ICsJc3RydWN0IGRybV9kaXNwbGF5X2lu
Zm8gKmluZm87Cj4gKwo+ICAJaWYgKHBhbmVsLT5jb25uZWN0b3IpCj4gIAkJcmV0dXJuIC1FQlVT
WTsKPiAgCj4gIAlwYW5lbC0+Y29ubmVjdG9yID0gY29ubmVjdG9yOwo+ICAJcGFuZWwtPmRybSA9
IGNvbm5lY3Rvci0+ZGV2Owo+ICsJaW5mbyA9ICZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbzsKPiAr
CWluZm8tPndpZHRoX21tID0gcGFuZWwtPndpZHRoX21tOwo+ICsJaW5mby0+aGVpZ2h0X21tID0g
cGFuZWwtPmhlaWdodF9tbTsKPiArCWluZm8tPmJwYyA9IHBhbmVsLT5icGM7Cj4gKwlpbmZvLT5w
YW5lbF9vcmllbnRhdGlvbiA9IHBhbmVsLT5vcmllbnRhdGlvbjsKPiArCWluZm8tPmJ1c19mbGFn
cyA9IHBhbmVsLT5idXNfZmxhZ3M7Cj4gKwlpZiAocGFuZWwtPmJ1c19mb3JtYXRzKQo+ICsJCWRy
bV9kaXNwbGF5X2luZm9fc2V0X2J1c19mb3JtYXRzKCZjb25uZWN0b3ItPmRpc3BsYXlfaW5mbywK
PiArCQkJCQkJIHBhbmVsLT5idXNfZm9ybWF0cywKPiArCQkJCQkJIHBhbmVsLT5udW1fYnVzX2Zv
cm1hdHMpOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gQEAgLTEyNiw2ICsxMzgsMjIgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fcGFuZWxfYXR0YWNoKTsKPiAgICovCj4gIHZvaWQgZHJtX3BhbmVsX2Rl
dGFjaChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiAgewo+ICsJc3RydWN0IGRybV9kaXNwbGF5
X2luZm8gKmluZm87Cj4gKwo+ICsJaWYgKCFwYW5lbC0+Y29ubmVjdG9yKQo+ICsJCWdvdG8gb3V0
Owo+ICsKPiArCWluZm8gPSAmcGFuZWwtPmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOwo+ICsJaW5m
by0+d2lkdGhfbW0gPSAwOwo+ICsJaW5mby0+aGVpZ2h0X21tID0gMDsKPiArCWluZm8tPmJwYyA9
IDA7Cj4gKwlpbmZvLT5wYW5lbF9vcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFU
SU9OX1VOS05PV047Cj4gKwlpbmZvLT5idXNfZmxhZ3MgPSAwOwo+ICsJa2ZyZWUoaW5mby0+YnVz
X2Zvcm1hdHMpOwo+ICsJaW5mby0+YnVzX2Zvcm1hdHMgPSBOVUxMOwo+ICsJaW5mby0+bnVtX2J1
c19mb3JtYXRzID0gMDsKPiArCj4gK291dDoKPiAgCXBhbmVsLT5jb25uZWN0b3IgPSBOVUxMOwo+
ICAJcGFuZWwtPmRybSA9IE5VTEw7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+IGluZGV4IGQxNjE1OGRlYWNkYy4u
ZjM1ODdhNTRiOGFjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiBAQCAtMTQxLDYgKzE0MSw1NiBAQCBzdHJ1Y3Qg
ZHJtX3BhbmVsIHsKPiAgCSAqLwo+ICAJY29uc3Qgc3RydWN0IGRybV9wYW5lbF9mdW5jcyAqZnVu
Y3M7Cj4KCkFsbCB0aGVzZSBuZXcgYWRkZWQgbWVtYmVycyBzZWVtcyBkdXBsaWF0ZWQgd2l0aCBk
cm1fZGlzcGxheV9pbmZvLApTbyBJIHRoaW5rLCBjYW4gd2UgYWRkIGEgbmV3IGRybV9wbGFuZV9m
dW5jcyBmdW5jOgoKaW50ICgqc2V0X2Rpc3BsYXlfaW5mbykoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwsCiAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZv
KTsKClRoZW4gaW4gZHJtX3BhbmVsX2F0dGFjaCgpLCB2aWEgdGhpcyBpbnRlcmZhY2UgdGhlIHNw
ZWNpZmljIHBhbmVsCmRyaXZlciBjYW4gZGlyZWN0bHkgc2V0IGNvbm5lY3Rvci0+ZGlzcGxheV9p
bmZvLiBsaWtlCgogICAuLi4KICAgaWYgKHBhbmVsLT5mdW5jcyAmJiBwYW5lbC0+ZnVuY3MtPnNl
dF9kaXNwbGF5X2luZm8pCgkJcGFuZWwtPmZ1bmNzLT51bnByZXBhcmUocGFuZWwsIGNvbm5lY3Rv
ci0+ZGlzcGxheV9pbmZvKTsKICAgLi4uCgpUaGFua3MKSmFtZXMKCj4gKwkvKioKPiArCSAqIEB3
aWR0aF9tbToKPiArCSAqCj4gKwkgKiBQaHlzaWNhbCB3aWR0aCBpbiBtbS4KPiArCSAqLwo+ICsJ
dW5zaWduZWQgaW50IHdpZHRoX21tOwo+ICsKPiArCS8qKgo+ICsJICogQGhlaWdodF9tbToKPiAr
CSAqCj4gKwkgKiBQaHlzaWNhbCBoZWlnaHQgaW4gbW0uCj4gKwkgKi8KPiArCXVuc2lnbmVkIGlu
dCBoZWlnaHRfbW07Cj4gKwo+ICsJLyoqCj4gKwkgKiBAYnBjOgo+ICsJICoKPiArCSAqIE1heGlt
dW0gYml0cyBwZXIgY29sb3IgY2hhbm5lbC4gVXNlZCBieSBIRE1JIGFuZCBEUCBvdXRwdXRzLgo+
ICsJICovCj4gKwl1bnNpZ25lZCBpbnQgYnBjOwo+ICsKPiArCS8qKgo+ICsJICogQG9yaWVudGF0
aW9uCj4gKwkgKgo+ICsJICogSW5zdGFsbGF0aW9uIG9yaWVudGF0aW9uIG9mIHRoZSBwYW5lbCB3
aXRoIHJlc3BlY3QgdG8gdGhlIGNoYXNzaXMuCj4gKwkgKi8KPiArCWludCBvcmllbnRhdGlvbjsK
PiArCj4gKwkvKioKPiArCSAqIEBidXNfZm9ybWF0cwo+ICsJICoKPiArCSAqIFBpeGVsIGRhdGEg
Zm9ybWF0IG9uIHRoZSB3aXJlLgo+ICsJICovCj4gKwljb25zdCB1MzIgKmJ1c19mb3JtYXRzOwo+
ICsKPiArCS8qKgo+ICsJICogQG51bV9idXNfZm9ybWF0czoKPiArCSAqCj4gKwkgKiBOdW1iZXIg
b2YgZWxlbWVudHMgcG9pbnRlZCB0byBieSBAYnVzX2Zvcm1hdHMKPiArCSAqLwo+ICsJdW5zaWdu
ZWQgaW50IG51bV9idXNfZm9ybWF0czsKPiArCj4gKwkvKioKPiArCSAqIEBidXNfZmxhZ3M6Cj4g
KwkgKgo+ICsJICogQWRkaXRpb25hbCBpbmZvcm1hdGlvbiAobGlrZSBwaXhlbCBzaWduYWwgcG9s
YXJpdHkpIGZvciB0aGUgcGl4ZWwKPiArCSAqIGRhdGEgb24gdGhlIGJ1cy4KPiArCSAqLwo+ICsJ
dTMyIGJ1c19mbGFnczsKPiArCj4gIAkvKioKPiAgCSAqIEBsaXN0Ogo+ICAJICoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
