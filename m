Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12CC1AC5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 06:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02936E32C;
	Mon, 30 Sep 2019 04:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B3D6E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 04:54:47 +0000 (UTC)
Received: from AM4PR08CA0052.eurprd08.prod.outlook.com (2603:10a6:205:2::23)
 by DB8PR08MB3946.eurprd08.prod.outlook.com (2603:10a6:10:b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 04:54:43 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by AM4PR08CA0052.outlook.office365.com
 (2603:10a6:205:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 04:54:43 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 04:54:42 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 30 Sep 2019 04:54:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c3c08a1728b2649
X-CR-MTA-TID: 64aa7808
Received: from e70aef5713ef.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1CC3D04E-17BF-4A7D-A665-C8873433BD7C.1; 
 Mon, 30 Sep 2019 04:54:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e70aef5713ef.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 04:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bw2TuEQfCYEUpKEiCbuRTsjTWgAqYAj/4IDgGZ3CrvDiA506bme61YQRUDqUO4JnPn/iqecOkK1ej/fVyUVAPSYULKaMzhdzj/IMaJeohZ19k9mZQXSp8L//+20mbeZ3lTKzCDZxPA3o4HdTfVLi3KSA+1exM74dJZptthyp57ZNRkWrd6egFQ8ef5kE61FRiR4Vci/WNFI5tqGbqRK7TysKT426qtBKRnN/E7TXwXZxy6dwGRE8xeLiDqxyAV3frEdNPXAgknIsfKgyQGYHdfLSKwn4KxqjQDXNrv+b0pLBl+uwnLf2+D/t8E+LYGo3RpuDI1v1zhWK0bbP0AJv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QZnQDz9b36TsgB9c9MJyvWdQprrhPmacBd5Q7k2Gek=;
 b=CVABDymTYmTdr7srz8WoV59ozLocGYBW+ByZgwQmzhSKKrejlWaBUad48Vzx88A4lDtXQ+a1ifLpgry2Q2hkRPsPBrAx4WJYMPC/kza8wy8fEdnpE9zoakLAZI7d/QOybEwwR2ridsvA2RUF9LoaqDq4kK53sh6VCCRAkrHVdhmR2+s/FDCl2mjaQvSpsmB6sXWiYz/S1uWUzdDdX1xH3NqI0TRhKE6vRyP1jZUvEOzzsfmYLh/QrSrircBlLKfyHhPuGTGYBjZv2mb+xMf8jkWHp6939L4biV2h+Kq5GFUbTlgSxyw9D6/iKgknFn7huDsOcVCrXb8lx8hG2S6CYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4703.eurprd08.prod.outlook.com (10.255.27.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 04:54:29 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 04:54:29 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 0/3] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH 0/3] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVd0sjIemk22GyqU+XOJLEc9v6FQ==
Date: Mon, 30 Sep 2019 04:54:28 +0000
Message-ID: <20190930045408.8053-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f0bc1c03-4ce4-417c-67ce-08d745624e92
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:|VE1PR08MB4703:|DB8PR08MB3946:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB3946D99E6F5F8131631EF58DB3820@DB8PR08MB3946.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(199004)(189003)(6116002)(3846002)(103116003)(966005)(26005)(36756003)(2201001)(256004)(305945005)(71200400001)(7736002)(6486002)(55236004)(102836004)(8676002)(81156014)(2501003)(52116002)(71190400001)(66946007)(6436002)(81166006)(14454004)(64756008)(2616005)(66476007)(66556008)(86362001)(66446008)(478600001)(99286004)(6506007)(386003)(6512007)(14444005)(66066001)(8936002)(1076003)(476003)(2906002)(6306002)(316002)(486006)(4326008)(50226002)(54906003)(5660300002)(186003)(110136005)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4703;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tFynB+G3m5Q0A2lZdo+nFKCHdrPJhsISADP0rqiY6I1WlBjnEGLnbT7IsrfNfYyYutB0G1Dof2Apjq5ixKKyeV56LQkmXPmSq9FRERhzHlQiQY1JuhQTG23zob7xzX1IN6OLCw3YsYq1XbHJ8I6AwVlXWJtp5XqjiVv2p7SVFVrB5GoYWfrymd1+ozHV69Zd10zlLD9rstKBh3+PiZLfq14WE/BOYuNjqdMS4ViO2S+BQzZ2v7lC6ifUzQrlPodj5ZQlGsqeyQ9Gowc7f7yhFHlpy57kesObKyI/mx7F4y532ANDEHpCohNyjgE0dLMSsAQgw1+/B/iS4RBxZRenPH2RUioK6JZNiSxFitZldZTtjHpofonS1WnMilkVV0RVt0vsB6/TAB4GrXFiu41BxOX/tbYRHGKemQ8aCTT8ZoB5TK1NerMn3kpSbf+ZkzR1K3Up8YSiOYgK2kt9FrL8uA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(346002)(376002)(136003)(199004)(189003)(8676002)(66066001)(36756003)(70206006)(14454004)(86362001)(386003)(6506007)(1076003)(47776003)(102836004)(50466002)(22756006)(5660300002)(81166006)(81156014)(126002)(2616005)(476003)(3846002)(2906002)(305945005)(63350400001)(70586007)(2201001)(6116002)(4326008)(486006)(966005)(76130400001)(478600001)(7736002)(26826003)(54906003)(186003)(6306002)(356004)(6512007)(336012)(316002)(2501003)(103116003)(25786009)(99286004)(8746002)(110136005)(50226002)(26005)(6486002)(8936002)(23756003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3946;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c4fb2f3-95f3-42cf-de47-08d745624611
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoHzp+ahfd+ljV/g+izUWm0aAMvN3amD7F/Jy8H5PQsyjP4SzSlXLckigw/ERzrRn1QTx8OWtJlnUEzFwySZXYhwhomWYtHAP6Sc3vlfmYszkPVPfwXg24vgeClNJpZT7LdlO03kDamu33N+dAUGUTTdFxEMd9Lq8LNuhvTCq8B2qwLY1h+RFOdlLVYsUk8MNG1FrorwiNXKausxPQE3aA/pJuOTliNU0aNsFK8g3m73HqbUbf6GV628q2e+AuEZUdsag8OoFJHtAaZVVNvHWFc00Hl9sA/p4E9oQ3PUDSRpx0S0ar0dzfCN1q3vua0AATmumVScpO58iMqknAJJ0YrJRKYSNzoo17C4RlMQvYrch0ZsenjcrLHTiZAheRoQEwHz97GHqQ/MHESxxdlpAoNoGkxUIKdETOQgCkBCekIVHumHtJHl00dXQp6JtS9NVueAXFJh1WxJ5o5ptZZutg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 04:54:42.2883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bc1c03-4ce4-417c-67ce-08d745624e92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3946
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QZnQDz9b36TsgB9c9MJyvWdQprrhPmacBd5Q7k2Gek=;
 b=ckNWgg8lB+hBCo3wt0RYL5ZThciUvchVueTpSY2yOJxrNgq+rZkP4cI5G8Mfq8uW/8wMUJSfEEq8NwaohUdS97vGiiDqjFhkiJu6LxCX9p3chNVyDJXqmXvZGjUN0nk3LWnNMUOrj7rjZavUvuDcKs5f32BTTbHfzamXgu6dI6c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QZnQDz9b36TsgB9c9MJyvWdQprrhPmacBd5Q7k2Gek=;
 b=ckNWgg8lB+hBCo3wt0RYL5ZThciUvchVueTpSY2yOJxrNgq+rZkP4cI5G8Mfq8uW/8wMUJSfEEq8NwaohUdS97vGiiDqjFhkiJu6LxCX9p3chNVyDJXqmXvZGjUN0nk3LWnNMUOrj7rjZavUvuDcKs5f32BTTbHfzamXgu6dI6c=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgZW5hYmxlIENSVEMgY29sb3ItbWdtdCBmb3Iga29tZWRhIGRyaXZlciwgZm9y
IGN1cnJlbnQga29tZWRhIEhXCndoaWNoIG9ubHkgc3VwcG9ydHMgY29sb3IgY29udmVyc2lvbiBh
bmQgZm9yd2FyZCBnYW1tYSBmb3IgQ1JUQy4KClRoaXMgc2VyaWVzIGFjdHVhbGx5IGFyZSByZWdy
b3VwZWQgZnJvbToKLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIvcGxhbmUgY29sb3ItbWdtdDoK
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYwODkzLwoKLSBkcm0v
a29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210CiAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy82MTM3MC8KCkZvciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoK
LSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzMwODc2LwoKTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJtL2tvbWVkYTogQWRkcyBnYW1tYSBh
bmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMKCmphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToKICBkcm0va29tZWRhOiBBZGQgZHJtX2x1dF90b19m
Z2FtbWFfY29lZmZzKCkKICBkcm0va29tZWRhOiBBZGQgZHJtX2N0bV90b19jb2VmZnMoKQoKIC4u
Li9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKwog
Li4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgNzkgKysrKysr
KysrKysrKysrKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5o
ICAgIHwgMTAgKystCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMu
YyAgfCAgMiArCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAg
fCAgMyArCiAuLi4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAg
NiArKwogNiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
LS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
