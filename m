Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBFB10AE75
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 12:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE2A6E28A;
	Wed, 27 Nov 2019 11:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FC46E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 11:06:08 +0000 (UTC)
Received: from VI1PR08CA0106.eurprd08.prod.outlook.com (2603:10a6:800:d3::32)
 by HE1PR0802MB2234.eurprd08.prod.outlook.com (2603:10a6:3:c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Wed, 27 Nov
 2019 11:06:05 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR08CA0106.outlook.office365.com
 (2603:10a6:800:d3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Wed, 27 Nov 2019 11:06:04 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Wed, 27 Nov 2019 11:06:04 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Wed, 27 Nov 2019 11:06:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f1067049a300a7d
X-CR-MTA-TID: 64aa7808
Received: from b96fe9d401f2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4CC2479-6B90-42E8-A367-00311F2A2D09.1; 
 Wed, 27 Nov 2019 11:05:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b96fe9d401f2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Nov 2019 11:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izGsrJ1ZcejIYTdtjLEqxhu63BcFtQm2akycqig/hx7lBzUqZY8NFx7F0j2JqT7KGPSFlZTPNKQejI/vEbT+e6ApaVz2+grIicmKP71FK9pY6JFRbtTOH1AYKdMG9WyqQrYiPrzjiH32hT1O1raM1Z4AmyqOCrtPALET5LiMExbKJ2BeSGYPOzX0iGOeOpu/BYwGXGdeZ//r6jOlc1/3THipMdc9ushHPOAR+PNleqOP6+p9bgAiWrLr3nbhBrKKLSO/5Wmah/nDkLOEAkkg0xb1IIycqcoQ7HD+QYhVBtEjtHR3P7BgmwfAj79Uh7AgYU6oZ9jODmtO8FtNrIHAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS1MOdiVDXdRepJDZ2iQiCzzxgQs8nV55gwxJvsQJKk=;
 b=jiK11NtF+ujSptvPUGlzTDB0GaFK4b0/scIMHLLQ3HCxzJOHeoy/WXxIe5jdfbB7MpE7xR2pXIG57g59IbNCoRuSc3ZbTNAwULWfz6RzONkT5umLFJdTmQ50zagi1xkC0uzcc7jZ9Qv1+UsdVIohbAITUbtgiVqKlMAmAi3+DufybERGT+PAGzYKUWTEP7MK0SpvmFDDQHhVDI2axtemO7aRnM1dBJsz5v9TugLpe9leLyssTdZb8x6BDkaI8dlz8Un9jjSgmYUQN8tB/yTgg4PGBpCZSn0zI2iiukT+GQNB5r2oh0/jyVmhkoFUErtQFrbT6i3+dd7LE1DoKMf40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5373.eurprd08.prod.outlook.com (52.133.245.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 11:05:56 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 27 Nov 2019
 11:05:56 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Index: AQHVpFukMd5nbiwRlEK6zRU7NBRujaedgi4AgAADJICAAFBIgIABBvWA
Date: Wed, 27 Nov 2019 11:05:56 +0000
Message-ID: <2196368.mua8KTRpvS@e123338-lin>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
 <11447519.fzG14qnjOE@e123338-lin> <20191126192445.GA2044@ravnborg.org>
In-Reply-To: <20191126192445.GA2044@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::36) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe7ff616-dd0c-40c1-477a-08d77329cbce
X-MS-TrafficTypeDiagnostic: VI1PR08MB5373:|HE1PR0802MB2234:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB223451D4EB675E10D85BB95D8F440@HE1PR0802MB2234.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:2887;
x-forefront-prvs: 023495660C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(199004)(189003)(6506007)(102836004)(446003)(11346002)(6916009)(3846002)(6486002)(5660300002)(8676002)(4744005)(66476007)(66556008)(64756008)(66446008)(66946007)(6246003)(66066001)(71190400001)(71200400001)(256004)(6436002)(25786009)(8936002)(33716001)(4326008)(229853002)(81156014)(54906003)(99286004)(316002)(81166006)(6512007)(478600001)(52116002)(6116002)(86362001)(305945005)(7736002)(14454004)(76176011)(186003)(26005)(386003)(9686003)(2906002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5373;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bjkwXFmTbSM0+mBRS/WV5T5/02GsDK6WU//Yw/TYzuLiRlTlOL8zlauRoEBoaGgMaFka99EnY2k8eemOiNKR+dlDb3JY8HvTfQmXXjHUN4O7jaEIhLUqn7hriEtKLoET+59CSMeuC8eBjpvbWQXIsNKYNbPaCqjV5NcyGvzN5AodFFwPgcNbJUki6Fr6N1WgU3PNyab7AzufPh3Xv3Wo3JFbl9IQiWM/vCy3LmvfzHqlUIBfoFV0uu7l7ZjgwldRvt1cu+AsnD0skkmzERsHHLSQZCxn99W5Cbs/1DdD1GfDJR4/L/6l73vlSaAqim4sNV9wKdpPcEsYGMxvPJJkFRClV1+MoHD8Ame+4Dd6MIt3pqAhv3S9960V7F2+/veh/VO2XFK2F/0f2Q6IGj3SlasQDIm5bi0roVMqXzgqzKMqWp+fpkPOCn8rwT80sBu5
x-ms-exchange-transport-forked: True
Content-ID: <F2C90664F8B5984B956E288C72397E0E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5373
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(76176011)(6862004)(22756006)(25786009)(76130400001)(107886003)(86362001)(11346002)(7736002)(4744005)(97756001)(4326008)(33716001)(6246003)(70586007)(6512007)(47776003)(9686003)(70206006)(81156014)(81166006)(50466002)(6486002)(66066001)(26826003)(46406003)(446003)(229853002)(8746002)(8936002)(8676002)(14454004)(102836004)(36906005)(186003)(54906003)(316002)(3846002)(6116002)(26005)(23726003)(2906002)(5660300002)(106002)(356004)(99286004)(305945005)(478600001)(336012)(6506007)(386003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2234;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e2c63a60-2af2-4c6e-eea8-08d77329c6fa
NoDisclaimer: True
X-Forefront-PRVS: 023495660C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imuPbMUqY3qvjXIKp5ldKq90CDGw8YPJcHlSA4ZVgfEuKtm6slIOa4CrF3A86Q6611vEGPxgrfO2JJ7Ohw1a2HM0F/AmFLTdKlJ004T9kHidU4jJzNlWHX4FEghWlOYXBz2ZcL1ghYxHC1J1wCbhatiSUwJUuhWicIJo1I/vnUMJmF6YTQ5OIMpAVmvjIh3h5pWNAJvQL2yp2z3rHUod6OY2Ev5fHblJoeKhjc+1MuuZQ8bHJR8LMh0pL9xLJMEVt2mdqvjq7XCiq56m+2M6SFQWeZBi8xTjVdiwV83pILtB+iKbHYePWOzCsTx731qDaAfKZl9i/SPx4jeuVY9qIHrSOaZmPyzQXueLlGJDsNn4nNuoLRTXJ5LNl/F+RJ/5+t3DBua97ebrObFKNvGAdnZhqz6WOBBg4sRQMEpAxelHw6FIuNrUoPQ4soYMHF3n
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 11:06:04.5580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7ff616-dd0c-40c1-477a-08d77329cbce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2234
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS1MOdiVDXdRepJDZ2iQiCzzxgQs8nV55gwxJvsQJKk=;
 b=j/bmWQqLSxvCHIUPSTHdT8BQnTTQUNkZ6wLYopUnXppkw6es6AtHcizwEtG8Ny7h6D+Q2IH3p1jpNC7GrJsW50XU++vEYMhNCh1WLXPhbcFrVAwOmhzqScdFGX6B8huKPznlaPk8lshSJj1M0atbD6tX4WRLg6tHS3yDyUhrE70=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS1MOdiVDXdRepJDZ2iQiCzzxgQs8nV55gwxJvsQJKk=;
 b=j/bmWQqLSxvCHIUPSTHdT8BQnTTQUNkZ6wLYopUnXppkw6es6AtHcizwEtG8Ny7h6D+Q2IH3p1jpNC7GrJsW50XU++vEYMhNCh1WLXPhbcFrVAwOmhzqScdFGX6B8huKPznlaPk8lshSJj1M0atbD6tX4WRLg6tHS3yDyUhrE70=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjYgTm92ZW1iZXIgMjAxOSAxOToyNDo0NSBHTVQgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIE1paGFpbC4KCkhpIFNhbSwKCj4gCj4gPiBBY2ssIGJ1dCB3aXRoIG9uZSBjYXZl
YXQ6IGJyaWRnZS0+ZGV2IGlzIHRoZSBzdHJ1Y3QgZHJtX2RldmljZSB0aGF0IGlzCj4gPiB0aGUg
YnJpZGdlIGNsaWVudCwgd2UgbmVlZCB0byBhZGQgYSBicmlkZ2UtPmRldmljZSAocGF0Y2ggMjkg
aW4gdGhpcwo+ID4gc2VyaWVzKSB3aGljaCBpcyB0aGUgc3RydWN0IGRldmljZSB0aGF0IHdpbGwg
bWFuYWdlIHRoZSBicmlkZ2UgbGlmZXRpbWUuCj4gT3RoZXIgcGxhY2VzIHVzZXMgdGhlIHZhcmlh
YmxlIG5hbWUgImRybSIgZm9yIGEgZHJtX2RldmljZS4KPiBUaGlzIGlzIGxlc3MgY29uZnVzaW9u
IHRoYW4gdGhlICJkZXYiIG5hbWUuCj4gCj4gSXQgc2VlbXMgYSByZWNlbnQgdHJlbmQgdG8gdXNl
IHRoZSB2YXJpYWJsZSBuYW1lICJkcm0iIHNvIHlvdSBjYW4gZmluZCBhCj4gbG90IG9mIHBsYWNl
cyB1c2luZyAiZGV2Ii4KPiAKPiBiaWtlLXNoZWRkaW5nIC0gYnV0IGFsc28gYWJvdXQgcmVhZGFi
aWxpdHkuCj4gCj4gCVNhbQo+IAoKSSdtIG9rYXkgd2l0aCB0aGUgaWRlYSwgSSBjYW4gZG8gYSBm
b2xsb3ctdXAgcGF0Y2ggb3Igc2VyaWVzIGZvciB0aGUKcmVuYW1lOyBJIGV4cGVjdCBpdCB3b3Vs
ZCBiZSBhIGJpdCBoZWZ0eSB0byBkbyBpdCBwcmlvciB0byB0aGlzLgoKQERhbmllbCwgdGhvdWdo
dHMgb24gcy9icmlkZ2UuZGV2L2JyaWRnZS5kcm0vIGFuZApzL2JyaWRnZS5kZXZpY2UvYnJpZGdl
LmRldi8gYWZ0ZXIgdGhpcyBzZXJpZXM/CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
