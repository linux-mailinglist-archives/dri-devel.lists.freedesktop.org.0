Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BACFFF52
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 08:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B0789FE6;
	Mon, 18 Nov 2019 07:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085189FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 07:10:09 +0000 (UTC)
Received: from VI1PR0801CA0080.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::24) by AM5PR0802MB2420.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Mon, 18 Nov
 2019 07:10:06 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR0801CA0080.outlook.office365.com
 (2603:10a6:800:7d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Mon, 18 Nov 2019 07:10:06 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Mon, 18 Nov 2019 07:10:05 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 18 Nov 2019 07:10:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 947c85fda77d0eee
X-CR-MTA-TID: 64aa7808
Received: from 498dd6388baf.2 (cr-mta-lb-1.cr-mta-net [104.47.2.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99106DCD-027B-4BD8-B1C7-2624159E9292.1; 
 Mon, 18 Nov 2019 07:09:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 498dd6388baf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Nov 2019 07:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht32QYjV6gNa0s3dg+LDahpv9MOsHQfaBS1QRsXZtd1X1CjvNa5ZFkgi7eI9RPW+Hkwws5BlurtRyJkV8vx5envygFRiugM+VJDdnwzXxf+Y3NNmj65gnmzd204PPplMZEhsJ4qYlR7Eot+8EiFTul25Pyo7bGL6WbUAd+dxgXyYfrJklZry9VFzPx0aKFMAPI3RxOKxwWw+VQk52kXjbso/bWhiubHHVVnITqRiZHmtyS9OwD8eQ6uetWKiraOe/Y+O8pNIm1eeNGMVfZ4vHhfdupHLs0ngIcbjEM/kpIAP7gqOf5p/PSmXl16D2urb5wJOkmGliKrSVSOj0QIJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtuZyXcKA5SRIxsILFpCatF4ixwLGqi5570owm7z1KM=;
 b=BEQjVL2IwxmDEAolGqGmahsog/BDQ6UsNDvyyBqddD6+Mu8DULNXYYXKM3AD7tBDa8EVlWa9MLAP51Dxl0RKH9PU1wT3O1ogH2kOiu9BTsqDcp66H/+TKPQkabg9YZS3chUooaE7rx15zSLOi/bkv2o2jBLo4wm0QMqC6gmE5C4gQjtmtTkMnhHIqCOPoTrcV1CoLwt478LdAfb6CMdC8A0KpZPORn8q8H4U7CF+qF8khJDl5le5I5z6x8dvpjqJAWm8FyE9xuN2ktXhi5aVau/dVC/8nFNeLzsZD0fj4FPE6ziEL1fA7BPkr1SVpZ5sfu/64Ktnh/j19kaEqMqB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5023.eurprd08.prod.outlook.com (20.179.30.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Mon, 18 Nov 2019 07:09:57 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 07:09:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Topic: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Index: AQHVk1z8xHY+gDfYy0i/iDKbshedr6eBdzAAgAbusQCAAKGHAIAA7isAgACLqoCABhZeAA==
Date: Mon, 18 Nov 2019 07:09:56 +0000
Message-ID: <20191118070949.GA27075@jamwan02-TSP300>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-4-andrzej.p@collabora.com>
 <20191108160954.GA17321@arm.com> <20191113020146.GB2746@jamwan02-TSP300>
 <20191113113954.GN23790@phenom.ffwll.local>
 <20191114015220.GA16456@jamwan02-TSP300>
 <CAKMK7uH06iu9OTz-1ZTbv6oVBHtBojSQE6sUu1GWfWk1om8LQQ@mail.gmail.com>
In-Reply-To: <CAKMK7uH06iu9OTz-1ZTbv6oVBHtBojSQE6sUu1GWfWk1om8LQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bad8b09c-b56a-4fc2-3d59-08d76bf6567a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5023:|VE1PR08MB5023:|AM5PR0802MB2420:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB242019D6ABE4E5B921EB2A47B34D0@AM5PR0802MB2420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0225B0D5BC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(53754006)(199004)(189003)(6506007)(386003)(102836004)(486006)(186003)(5660300002)(6436002)(446003)(6916009)(71190400001)(71200400001)(1076003)(6486002)(33656002)(476003)(6246003)(7736002)(6512007)(9686003)(587094005)(6306002)(66066001)(4326008)(53546011)(2906002)(33716001)(55236004)(256004)(305945005)(7416002)(14444005)(11346002)(478600001)(316002)(3846002)(6116002)(76176011)(52116002)(64756008)(66476007)(66556008)(229853002)(8676002)(66446008)(966005)(26005)(99286004)(14454004)(66946007)(81156014)(81166006)(86362001)(8936002)(54906003)(58126008)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5023;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: m0SfD/vR0RxWmTNEU0GNo5UPa6dRKogw0t27y+SBXz3y8CTqA4lOSp7dQLRJsimenay7Gdv3k7EnaAUTojrVdKwrIzTE2pHwaXsQkzoDe+qjIvFzZnYMpgGGmro5IcRmANbTGNYfZN9+omhkcYVIQwO8xNAP5rqrcA2dI351ZmTw+Zj2TWFox1JfjCe8RMJ4ng80ts6q1XYsYI6ml0t34aFQjuSgpS9oDf3hha98czhJQwTCmHXNV+nTpGsg83zfJ/qgO+8lQK4DCmLlWK23huoUYyb5wViLz5krM5cI02DlAHzG2kfXbIpJE3AalxXT6cCE8CLwkXfvbW1GgsqIBbngsm+HMAh4y1gs/GPMvyG1jwSQ6CV+D0N+K8FDO1sVx0pcUmtJEK8hsupYFR5pY4sxCexD5Q/AuFhXoqFAyeFFfKtJ4o4IQqS/XIrF0UAl
Content-ID: <51F1CC8578D54B4F9FDC3D2BABE5E83D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5023
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(376002)(346002)(136003)(1110001)(339900001)(53754006)(189003)(199004)(336012)(70206006)(76176011)(6306002)(9686003)(105606002)(6512007)(102836004)(6506007)(53546011)(6246003)(14444005)(33716001)(386003)(478600001)(4326008)(6862004)(50466002)(33656002)(22756006)(66066001)(3846002)(356004)(2906002)(70586007)(8746002)(47776003)(6116002)(229853002)(6486002)(86362001)(81166006)(81156014)(8936002)(8676002)(126002)(76130400001)(305945005)(11346002)(446003)(23756003)(54906003)(486006)(58126008)(7736002)(587094005)(1076003)(316002)(5660300002)(36906005)(26005)(25786009)(966005)(186003)(14454004)(26826003)(476003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2420;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5a765217-c78e-4f6a-bf12-08d76bf6512d
X-MS-Exchange-PUrlCount: 1
NoDisclaimer: True
X-Forefront-PRVS: 0225B0D5BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXtTdBKPFZDs/9uNWQYTzfohONV+kynIsK41vE5HdvgNWFvQNAdWxPHKRLie2gtO1eD7TMj5FesSUWByC7Xezr2GsQFpJ1Bm3HgJ7BsOx1eqPXJlfwVIXUv2HYZbNtNprKL0/5NjgynTsymtMPPEM+/EOcbVDyrE2QOJ3uBeMME3Fj005xhm6aE6YVg5u/6TyMIumYALxfZA13+pZhRyOq11W7To17zOTc+Tenw2KzxB6DitFmaGLKgLTVVKHwfuNglG3twYModHCxWdYXysvXvRg9Xoz9JIoDPfoWbbj7mUIAwc7tbmOcYwjrGUySAK0q+e2SUVTWGYyZx/QycuSzP9DGUFcokujdAPhJqxUSZimtNf+vK90xV6bCUhA4qNwRR2VjJeVSj4fttti1wNW/f2sq8Ywc6Eou0cWBjJTIGomi3c8KZGMuNnhN5CUuc4TKssA0Wy6IwziTa/u6evUGnNsnLhoAmUbsOcDt6Dhiw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2019 07:10:05.2372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8b09c-b56a-4fc2-3d59-08d76bf6567a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtuZyXcKA5SRIxsILFpCatF4ixwLGqi5570owm7z1KM=;
 b=pWp3KYFwae+9q7TT+8pKFFnrFfQI3fGLNwhEPVTmFPHj3YpStXKfVSbtDO0FOBP7KWJH8FtakqqYlXmIQhkmWak2eQai6/EoGconr4VDgDS8Hi2UmS6eOyaYMKpJuP/kmYlXOI2FNJ2OoNylSJ2kk/bWdAhB2qpDyvSdB9DjIM4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtuZyXcKA5SRIxsILFpCatF4ixwLGqi5570owm7z1KM=;
 b=pWp3KYFwae+9q7TT+8pKFFnrFfQI3fGLNwhEPVTmFPHj3YpStXKfVSbtDO0FOBP7KWJH8FtakqqYlXmIQhkmWak2eQai6/EoGconr4VDgDS8Hi2UmS6eOyaYMKpJuP/kmYlXOI2FNJ2OoNylSJ2kk/bWdAhB2qpDyvSdB9DjIM4=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "kernel@collabora.com" <kernel@collabora.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTE6MTI6MTNBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE5vdiAxNCwgMjAxOSBhdCAyOjUyIEFNIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpCj4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToK
PiA+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDEyOjM5OjU0UE0gKzAxMDAsIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgTm92IDEzLCAyMDE5IGF0IDAyOjAxOjUzQU0gKzAwMDAs
IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+IE9u
IEZyaSwgTm92IDA4LCAyMDE5IGF0IDA0OjA5OjU0UE0gKzAwMDAsIEF5YW4gSGFsZGVyIHdyb3Rl
Ogo+ID4gPiA+ID4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MTI6MjdQTSArMDEwMCwgQW5k
cnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+ID4gPiA+ID4gPiBUaGVyZSBhcmUgYWZiYyBoZWxw
ZXJzIGF2YWlsYWJsZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5k
cnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiA+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fw
cy5oICAgfCAgMSAtCj4gPiA+ID4gPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
cmFtZWJ1ZmZlci5jICAgfCA0NCArKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiA+ID4gPiA+ID4gaW5kZXggMzIyNzNjZjE4Zjdj
Li42MDdlZWE4MGU2MGMgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiA+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAo+
ID4gPiA+ID4gPiBAQCAtMzMsNyArMzMsNiBAQAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgI2Rl
ZmluZSBBRkJDX1RIX0xBWU9VVF9BTElHTk1FTlQgICAgICAgOAo+ID4gPiA+ID4gPiAgI2RlZmlu
ZSBBRkJDX0hFQURFUl9TSVpFICAgICAgICAgICAgICAgMTYKPiA+ID4gPiA+ID4gLSNkZWZpbmUg
QUZCQ19TVVBFUkJMS19BTElHTk1FTlQgICAgICAgICAgICAgICAgMTI4Cj4gPiA+ID4gPiA+ICAj
ZGVmaW5lIEFGQkNfU1VQRVJCTEtfUElYRUxTICAgICAgICAgICAyNTYKPiA+ID4gPiA+ID4gICNk
ZWZpbmUgQUZCQ19CT0RZX1NUQVJUX0FMSUdOTUVOVCAgICAgIDEwMjQKPiA+ID4gPiA+ID4gICNk
ZWZpbmUgQUZCQ19USF9CT0RZX1NUQVJUX0FMSUdOTUVOVCAgIDQwOTYKPiA+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1l
YnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFt
ZWJ1ZmZlci5jCj4gPiA+ID4gPiA+IGluZGV4IDFiMDFhNjI1ZjQwZS4uZTljODc1NTFhNWI4IDEw
MDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiA+ID4gPiA+ID4gQEAgLTQs
NiArNCw3IEBACj4gPiA+ID4gPiA+ICAgKiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMu
cWlhbi53YW5nQGFybS5jb20+Cj4gPiA+ID4gPiA+ICAgKgo+ID4gPiA+ID4gPiAgICovCj4gPiA+
ID4gPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9hZmJjLmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8
ZHJtL2RybV9kZXZpY2UuaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9o
ZWxwZXIuaD4KPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+ID4gPiA+ID4g
PiBAQCAtNDMsOCArNDQsNyBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21l
ZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4gPiA+ID4gPiAgICAgICAgIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gJmtmYi0+YmFzZTsKPiA+ID4gPiA+ID4gICAgICAg
ICBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0gZmItPmZvcm1hdDsKPiA+ID4g
PiA+ID4gICAgICAgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiA+ID4gPiA+ID4gLSAg
ICAgICB1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFsaWdubWVudF9oZWFk
ZXIsIG5fYmxvY2tzLCBicHA7Cj4gPiA+ID4gPiA+IC0gICAgICAgdTY0IG1pbl9zaXplOwo+ID4g
PiA+ID4gPiArICAgICAgIHUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxp
Z25tZW50X2hlYWRlciwgYnBwOwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIG9iaiA9
IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBtb2RlX2NtZC0+aGFuZGxlc1swXSk7Cj4gPiA+
ID4gPiA+ICAgICAgICAgaWYgKCFvYmopIHsKPiA+ID4gPiA+ID4gQEAgLTUyLDE5ICs1MiwxNSBA
QCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0
IGRybV9maWxlICpmaWxlLAo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9F
TlQ7Cj4gPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtICAgICAg
IHN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykg
ewo+ID4gPiA+ID4gPiAtICAgICAgIGNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMzJ4
ODoKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGFsaWdubWVudF93ID0gMzI7Cj4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICBhbGlnbm1lbnRfaCA9IDg7Cj4gPiA+ID4gPiA+IC0gICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiA+ID4gLSAgICAgICBjYXNlIEFGQkNfRk9STUFUX01PRF9C
TE9DS19TSVpFXzE2eDE2Ogo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYWxpZ25tZW50X3cg
PSAxNjsKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGFsaWdubWVudF9oID0gMTY7Cj4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ID4gLSAgICAgICBkZWZhdWx0
Ogo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgV0FSTigxLCAiSW52YWxpZCBBRkJDX0ZPUk1B
VF9NT0RfQkxPQ0tfU0laRTogJWxsZC5cbiIsCj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgIGZiLT5tb2RpZmllciAmIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFX01BU0spOwo+ID4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gPiA+ICsgICAgICAgaWYgKCFk
cm1fYWZiY19nZXRfc3VwZXJibGtfd2goZmItPm1vZGlmaWVyLCAmYWxpZ25tZW50X3csICZhbGln
bm1lbnRfaCkpCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArICAgICAgIGlmICgoYWxpZ25tZW50X3cgIT0gMTYgfHwg
YWxpZ25tZW50X2ggIT0gMTYpICYmCj4gPiA+ID4gPiA+ICsgICAgICAgICAgIChhbGlnbm1lbnRf
dyAhPSAzMiB8fCBhbGlnbm1lbnRfaCAhPSA4KSkgewo+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgRFJNX0RFQlVHX0tNUygiVW5zdXBwb3J0ZWQgYWZiYyB0aWxlIHcvaCBbJWQvJWRdXG4iLAo+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbGlnbm1lbnRfdywgYWxp
Z25tZW50X2gpOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiA+ID4gPiA+IFRvIGJlIGhvbmVzdCwgdGhlIHByZXZpb3VzIGNvZGUgbG9v
a3MgbXVjaCBtb3JlIHJlYWRhYmxlCj4gPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiAgICAgICAgIC8qIHRpbGVkIGhlYWRlciBhZmJjICovCj4gPiA+ID4gPiA+IEBA
IC04NCwyMCArODAsMTQgQEAga29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRh
X2ZiICprZmIsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgIGdvdG8gY2hlY2tfZmFpbGVkOwo+ID4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gLSAgICAgICBuX2Jsb2NrcyA9IChrZmItPmFsaWduZWRfdyAqIGtmYi0+YWxp
Z25lZF9oKSAvIEFGQkNfU1VQRVJCTEtfUElYRUxTOwo+ID4gPiA+ID4gPiAtICAgICAgIGtmYi0+
b2Zmc2V0X3BheWxvYWQgPSBBTElHTihuX2Jsb2NrcyAqIEFGQkNfSEVBREVSX1NJWkUsCj4gPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsaWdubWVudF9oZWFk
ZXIpOwo+ID4gPiA+ID4gPiAtCj4gPiA+ID4gPiA+ICAgICAgICAgYnBwID0ga29tZWRhX2dldF9h
ZmJjX2Zvcm1hdF9icHAoaW5mbywgZmItPm1vZGlmaWVyKTsKPiA+ID4gPiA+ID4gLSAgICAgICBr
ZmItPmFmYmNfc2l6ZSA9IGtmYi0+b2Zmc2V0X3BheWxvYWQgKyBuX2Jsb2NrcyAqCj4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBBTElHTihicHAgKiBBRkJDX1NVUEVSQkxLX1BJ
WEVMUyAvIDgsCj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBRkJD
X1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gPiA+ID4gPiA+IC0gICAgICAgbWluX3NpemUgPSBrZmIt
PmFmYmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOwo+ID4gPiA+ID4gPiAtICAgICAgIGlmIChtaW5f
c2l6ZSA+IG9iai0+c2l6ZSkgewo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgRFJNX0RFQlVH
X0tNUygiYWZiYyBzaXplIGNoZWNrIGZhaWxlZCwgb2JqX3NpemU6IDB4JXp4LiBtaW5fc2l6ZSAw
eCVsbHguXG4iLAo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvYmot
PnNpemUsIG1pbl9zaXplKTsKPiA+ID4gPiA+IFdlIG5lZWQga2ZiLT5vZmZzZXRfcGF5bG9hZCBh
bmQga2ZiLT5hZmJjX3NpemUgdG8gc2V0IHNvbWUgcmVnaXN0ZXJzCj4gPiA+ID4gPiBpbiBkNzFf
bGF5ZXJfdXBkYXRlKCkuIEF0IHRoaXMgbW9tZW50IEkgZmVlbCBsaWtlIHB1bmNoaW5nIG15c2Vs
ZiBmb3IKPiA+ID4gPiA+IG1ha2luZyB0aGUgc3VnZ2VzdGlvbiB0byBjb25zaWRlciBhYnN0cmFj
dGluZyBzb21lIG9mIHRoZSBrb21lZGEncyBhZmJjCj4gPiA+ID4gPiBjaGVja3MuIFRvIG1lIGl0
IGRvZXMgbm90IGxvb2sgbGlrZSBrb21lZGEoaW4gdGhlIGN1cnJlbnQgc2hhcGUpIGNhbiB0YWtl
Cj4gPiA+ID4gPiBtdWNoIGFkdmFudGFnZSBvZiB0aGUgZ2VuZXJpYyBfYWZiY19mYl9jaGVjaygp
IGZ1bmN0aW9uIChhcyB3YXMgc3VnZ2VzdGVkCj4gPiA+ID4gPiBwcmV2aW91c2x5IGJ5IERhbnZl
dCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSG93ZXZlciwgSSB3aWxsIGxldCBqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbSwKPiA+ID4gPiA+IE1paGFpbC5BdGFuYXNzb3ZAYXJtLmNvbSwgQmVuLkRhdmlz
QGFybS5jb20gY29tbWVudCBoZXJlIHRvIHNlZSBpZgo+ID4gPiA+ID4gdGhlcmUgY291bGQgYmUg
YSB3YXkgb2YgYWJzdHJhY3RpbmcgdGhlIGFmYmMgYml0cyBmcm9tIGtvbWVkYS4KPiA+ID4gPiA+
Cj4gPiA+ID4KPiA+ID4gPiBIaSBhbGw6Cj4gPiA+ID4KPiA+ID4gPiBTaW5jZSB0aGUgY3VycmVu
dCBnZW5lcmljIGRybV9hZmJjIGhlbHBlcnMgb25seSBzdXBwb3J0IGFmYmNfMS4xLCBidXQKPiA+
ID4gPiBrb21lZGEgbmVlZHMgc3VwcG9ydCBib3RoIGFmYmMxLjEvMS4yLCBzbyBJIHRoaW5rIHdl
IGNhbjoKPiA+ID4gPiAtIEFkZCBhZmJjMS4yIHN1cHBvcnQgdG8gZHJtIGFmYmMgaGVscGVycy4K
PiA+ID4gPiAtIGZvciB0aGUgYWZiY19wYXlsb2FkX29mZnNldCwgY2FuIHdlIGFkZCB0aGlzIG1l
bWJlciB0bwo+ID4gPiA+ICAgZHJtX2ZyYW1lYnVmZmVyID8KPiA+ID4gPiAtIFRoZSBhbGlnbmVk
X3cvaCBhcmUgaW1wb3J0YW50IGZvciBhZmJjLCBzbyBjYW4gd2UgaGF2ZSB0aGVtIGluCj4gPiA+
ID4gICBkcm1fZnJhbWVidWZmZXIgPwo+ID4gPgo+ID4gPiBIb3cgZXhwZW5zaXZlIGlzIGl0IHRv
IHJlY29tcHV0ZSB0aGVzZSBmcm9tIGEgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcj8KPiA+ID4KPiA+
ID4gSSdkIGp1c3QgZ28gd2l0aCBvbmUgZnVuY3Rpb24gd2hpY2ggY29tcHV0ZXMgYWxsIHRoZXNl
IGRlcml2ZWQgdmFsdWVzLCBhbmQKPiA+ID4gc3R1ZmZzIHRoZW0gaW50byBhIHN0cnVjdCBkcm1f
YWZiYy4gVGhlbiBkcml2ZXJzIGNhbGwgdGhhdCBvbmNlIG9yIHNvLgo+ID4gPgo+ID4KPiA+IEEg
c3RydWN0IGRybV9hZmJjLCBnb29kIGlkZWEsIEkgbGlrZSBpdC4gOi0pCj4gPgo+ID4gYW5kIHdl
IGNhbiBjb21wdXRlIGl0IHdoZW4gZG8gdGhlIGFmYmMgc2l6ZSBjaGVjayBsaWtlCj4gPgo+ID4g
ICBkcm1fYWZiY19jaGVja19mYl9zaXplKC4uLiwgJmtvbWVkYV9mYi0+ZHJtX2FmYmMpOwo+IAo+
IERpc2N1c3NlZCB0aGlzIGFsc28gd2l0aCBBbmRyemVqIG9uIGlyYyBvbiB3aGVyZSBleGFjdGx5
IHRvIHBsYWNlCj4gc3R1ZmYuIEkgdGhpbmsgaWRlYWxseSB3ZSdkIGJlIGFibGUgdG8gZ2V0IHJp
ZCBvZiB0aGUgY3VzdG9tCj4gbWFsaWRwX2ZiX2NyZWF0ZSBjb21wbGV0ZWx5LCBhbmQga29tZWRh
IHNob3VsZCBhbHNvIGJlIGFibGUgdG8gZ2V0IHJpZAo+IG9mIG1vc3Qgb2YgdGhlIG9wZW4tY29k
ZWQgY2hlY2tzIChpdCdzIGxhcmdlbHkgcmVpbnZldGluZwo+IGRybV9nZW1fZmJfY3JlYXRlX3dp
dGhfZnVuY3MsIGltbyBiZXR0ZXIgdG8ganVzdCBjYWxsIHRoYXQgZmlyc3QsIHRoZW4KPiB0aGVu
IGRvIGEgZmV3IG1vcmUgY2FsbHMgb2YgdGhlIHNwZWNpZmljIHRoaW5ncyB5b3UgbmVlZCB0byBo
YXZlCj4gY29tcHV0ZWQgaW4gYWRkaXRpb24pLgo+IC1EYW5pZWwKClRoZSBhZmJjIHN1cHBvcnQg
aXMgdGhlIG9ubHkgcmVhc29uIHdoeSBtYWxpZHAva29tZWRhIGRlZmluZSBvdXIgb3duCmZiX2Ny
ZWF0ZSgpLCBpdCBpcyBnb29kIGZvciBrb21lZGEgYW5kIG1hbGlkcCBpZiB3ZSBwdXQgYWZiYyBz
dXBwb3J0CmRpcmVjdGx5IGludG8gdGhlIHN0YW5kYXJkIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhf
ZnVuY3MuCgpCVFc6CgpjYW4gd2UgYWRkIG9uZSBtb3JlIGFyZ3VtZW50OiBmYl9zdHJ1Y3Rfc2l6
ZSB0bwoKICBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKC4uLiwgc2l6ZV90IGZiX3N0cnVj
dF9zaXplKTsKCnRoZW4gZHJpdmVyIGNhbiB1c2UgaXQgdG8gZXh0ZW5kIGl0cyBvd24gZmIgc3Ry
dWN0IGFuZCBhZGQgc29tZSBwcml2YXRlCmluZm9zLgoKVGhhbmtzCkphbWVzCj4gPgo+ID4gVGhh
bmtzLgo+ID4gSmFtZXMKPiA+Cj4gPiA+IEZvciByZXdvcmtpbmcgZHJtX2ZyYW1lYnVmZmVyIGl0
c2VsZiBJIHRoaW5rIGl0J3MgcHJvYmFibHkgYSBiaXQgdG9vCj4gPiA+IGVhcmxpZXIuIEFuZCBp
ZiB3ZSBkbyBpdCwgd2Ugc2hvdWxkIG1heWJlIGdvIGEgYml0IG1vcmUgYm9sZCwgYWltaW5nIHRv
Cj4gPiA+IHByb3BlcnR5LWZ5IGFsbCB0aGUgZnJhbWVidWZmZXIgc2V0dGluZ3MsIG1heWJlIGV2
ZW4gbWFraW5nIGl0IGV4dGVuc2libGUsCj4gPiA+IGFuZCBoYXZlIGRyaXZlcnMgaGFuZGxlIGEg
Y29ycmVzcG9uZGluZyBkcm1fZnJhbWVidWZmZXJfc3RhdGUuCj4gPiA+Cj4gPiA+IEEgdGhpcmQg
b3B0aW9uIHdvdWxkIGJlIHRvIGNyZWF0ZSBhIGRybV9hZmJjX2ZyYW1lYnVmZmVyIHdoaWNoIGVt
YmVkcwo+ID4gPiBkcm1fZnJhbWVidWZmZXIgYW5kIHdoaWNoIGRyaXZlcnMgd291bGQgbmVlZCB0
byB1c2UuIEJ1dCBhbHNvIGZlZWxzIGEgYml0Cj4gPiA+IGxpa2UgdG9vIG11Y2ggY2h1cm4uIFJl
Y29tcHV0aW5nIHNob3VsZCBiZSBxdWljayBlbm91Z2ggYW5kIG11Y2ggZWFzaWVyLgo+ID4gPiAt
RGFuaWVsCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MKPiA+ID4gPiBKYW1lcwo+ID4gPiA+
Cj4gPiA+ID4gPiBUaGFua3MgYW55d2F5cyBmb3IgdGFraW5nIGEgc3RhYiBhdCB0aGlzLgo+ID4g
PiA+ID4gLUF5YW4KPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArICAgICAgIGlmICghZHJtX2Fm
YmNfY2hlY2tfZmJfc2l6ZShtb2RlX2NtZC0+cGl0Y2hlc1swXSwgYnBwLAo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb2RlX2NtZC0+d2lkdGgsIG1vZGVf
Y21kLT5oZWlnaHQsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFsaWdubWVudF93LCBhbGlnbm1lbnRfaCwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb2JqLT5zaXplLCBtb2RlX2NtZC0+b2Zmc2V0c1swXSwKPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQUZCQ19TVVBFUkJM
S19BTElHTk1FTlQpKQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290byBjaGVja19mYWls
ZWQ7Cj4gPiA+ID4gPiA+IC0gICAgICAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICAg
IGZiLT5vYmpbMF0gPSBvYmo7Cj4gPiA+ID4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiA+IDIuMTcuMQo+ID4gPgo+ID4gPiAtLQo+ID4gPiBEYW5pZWwgVmV0
dGVyCj4gPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gPiBodHRw
Oi8vYmxvZy5mZndsbC5jaAo+IAo+IAo+IAo+IC0tIAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
