Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C76DE535
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF324899DB;
	Mon, 21 Oct 2019 07:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20067.outbound.protection.outlook.com [40.107.2.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82BA899DB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:23:14 +0000 (UTC)
Received: from AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35)
 by AM5PR0801MB1859.eurprd08.prod.outlook.com (2603:10a6:203:49::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Mon, 21 Oct
 2019 07:23:10 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by AM6PR08CA0023.outlook.office365.com
 (2603:10a6:20b:b2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 07:23:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 07:23:08 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 21 Oct 2019 07:23:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc5c19b7bc3fd90b
X-CR-MTA-TID: 64aa7808
Received: from 0116dc2b193f.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61EFADBE-4C64-4786-A89F-2329A4302BB0.1; 
 Mon, 21 Oct 2019 07:22:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0116dc2b193f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 07:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB5kLZgTCNDRQ0VLnGuHucWDnbl2D9ECTQ7NuCFEZZA6SKiGqLXz0wYsKA/Y082K/+oHxXaBDgp0TsahSIR3kqACq5VQs6HkhhVLs35vWwkQficaW0uKicFnJ3lwPMmFZyR9pdy0V++XK5WL/yLCRDZyYfGZlBnGCofIO13nrhqYpBdHUGU4DuWpCC0orlEl6tnzq1Gic5z1QBZYwy9RiWw4Ywk+yi+OjWFjMZYBcClzb+ZFNd7PMNeKcQj1oj0kksYDLg0GfjJe5NrjKEpYoVZdkJGsFgCNOqCXN+AlcEfNJOeZb3R/e0Juqc1Crfgs+gfdrVR05tmEf+FeN5Fj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=FqYQmYlOV+rZXj8saB3MkeYofj8upB/nhgD60QSks/03E1UNj3rwmuajTUMVhYAbmibm/bHu5GRORwrBZ29LTq3DoPexSPMfI8n5tcfXGwIG4MCARG+4wKQEPjIDf1IRchVGVxhI4uJwdfvsaTWkgCTn/txny0sccOrWl9o8ysE0SotCLqpkLWTuM8R+gNeyDNr8YMh3OM4YweMTWWvZUh7fzLLqpr/P6alKu/4hXBsud8dr4GE3NL+uDXtqLf/Axp7xDIIYgDvA24tmjVUMexbVoibnEn+lAbHpr9i1RdyB7FigIee+SusMQJXimbGjaUUM0PW9MsOxM2vraPKxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4831.eurprd08.prod.outlook.com (10.255.115.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 07:22:55 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 07:22:55 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v6 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v6 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVh+BbShqgZztuuU6+TkzZNLRVVQ==
Date: Mon, 21 Oct 2019 07:22:55 +0000
Message-ID: <20191021072215.3993-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0019.apcprd04.prod.outlook.com
 (2603:1096:202:2::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 296af0df-5359-482b-25f2-08d755f785df
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4831:|VE1PR08MB4831:|AM5PR0801MB1859:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1859BB1C17B84C51E65B21ABB3690@AM5PR0801MB1859.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(199004)(189003)(110136005)(6506007)(6486002)(386003)(66066001)(4326008)(966005)(8676002)(66946007)(54906003)(99286004)(103116003)(36756003)(6512007)(6436002)(66446008)(64756008)(66556008)(66476007)(6306002)(55236004)(2171002)(102836004)(2501003)(26005)(14454004)(186003)(81156014)(81166006)(2201001)(478600001)(316002)(2906002)(7736002)(86362001)(71190400001)(71200400001)(256004)(6116002)(25786009)(305945005)(14444005)(486006)(3846002)(52116002)(5660300002)(8936002)(2616005)(476003)(1076003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4831;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: VtTJ/aonrK8J62/p3ISZjZaKsy4xwxA3eX3miBViE3RM16ZX0rj+IZ6L96r6K93eEbkBzDTkJJbIrTo1HGPF3xcAyQk/f7Pqy/VintKKNuLgDZ0Pt4ME8ANsxc5gdJCWZkgZpylHrD+YhhA3l4/zTDUFANKUQ4PQu/aPhsslDGizPZ3amxn9FOVyE6ZpENLX6SUipt8Ze3jT/7yC/jFPQwU09W8vCML70ncsx34fJ+aAnFmKFFCQA9sO67GP184XhG/d454PsbVhWmWO9eLQwCyPUGE+dskgmyXJRlZP4xJD8csSrB5bwYcpJhecxr10I7naFDoQVvei0KE6zfE66W/es1vSpcTRTNi08deh/8N9Yj/y2zbVT0wysZvwG5AF2kpCVUtPM0fpnmhuOuffSHpD/MeObaUfj5tj42l26L7WbCUw6BkZdu2ES00RwIOY
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4831
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(189003)(199004)(336012)(54906003)(316002)(110136005)(356004)(50466002)(7736002)(36756003)(66066001)(47776003)(305945005)(26005)(2906002)(486006)(102836004)(26826003)(476003)(63350400001)(186003)(2616005)(126002)(386003)(6506007)(478600001)(14454004)(22756006)(70586007)(70206006)(103116003)(966005)(2501003)(14444005)(76130400001)(99286004)(2171002)(2201001)(5660300002)(3846002)(6116002)(6486002)(1076003)(81156014)(81166006)(8746002)(8936002)(8676002)(50226002)(6306002)(23756003)(4326008)(86362001)(25786009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1859;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01010e68-0779-46cd-fe08-08d755f77d98
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixOLxccLAsl3nETzx95YnJzWYN8WeRv3v8zof7LwFyrLDBhAiRELYzZArDwsYhUq8dhrZFGTQ8adEG3lw+ZriEjx6Vdq2g6Kan2W3NUdVOnh7FdMsQ6puEEiNDMm6pjE3GflV7WwlChMh7xC8SOoNLV85tifWzQ6gmvLIyEw6zSwuwF/C8Bb3CVraXMsTTTJXB4Kh7hfVNMqak5T13/Ulv0dy43rsXZwlrICJM746Lg3JwHFY/gylM6JpBsF++X4/qozAdZc1vI4CQRvfDGtMiRQnHM7Qw4+xiLFOZOlYC4aqGdkwluaM7qwRaweSb0Y6aO3fOGueu8yyVK965iYXLTrl5KE23jcHE0Nvg9JB6aVclm8MDtXvxiGSBPnNhePsw90TiJnolLnQEuwcNcW0pk42RAmxI2kGugfdxO+vDK1CYN7/wWotJoPkbBfmsmbd6SA1nkMgRXhDs8QOY9A4y4+/4VzvcWJplv68QvzAFk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 07:23:08.6981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 296af0df-5359-482b-25f2-08d755f785df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1859
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=zyDY8cunxghdhJqbHmbP6ZbgmQMyY9Q/WidHVoKouaCo7YNhvhztN9B0F0qionpePxkaY4vl7NsYbtImKMW31QFO1NqG2uNq+P/Q2ch+oG3FA1SvuHu3RKQE105MTwxJ9T5qlz7Z54s8Eyy63YjUgRnVSXq1jWMaBVH1Ka3283Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lTSa4rYX3Lu+7lcq+ZpvV7iUcBTi5ViWo+mOBrwSCc=;
 b=zyDY8cunxghdhJqbHmbP6ZbgmQMyY9Q/WidHVoKouaCo7YNhvhztN9B0F0qionpePxkaY4vl7NsYbtImKMW31QFO1NqG2uNq+P/Q2ch+oG3FA1SvuHu3RKQE105MTwxJ9T5qlz7Z54s8Eyy63YjUgRnVSXq1jWMaBVH1Ka3283Y=
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

SGk6CgpUaGlzIHNlcmllcyBlbmFibGUgQ1JUQyBjb2xvci1tZ210IGZvciBrb21lZGEgZHJpdmVy
LCBmb3IgY3VycmVudCBrb21lZGEgSFcKd2hpY2ggb25seSBzdXBwb3J0cyBjb2xvciBjb252ZXJz
aW9uIGFuZCBmb3J3YXJkIGdhbW1hIGZvciBDUlRDLgoKVGhpcyBzZXJpZXMgYWN0dWFsbHkgYXJl
IHJlZ3JvdXBlZCBmcm9tOgotIGRybS9rb21lZGE6IEVuYWJsZSBsYXllci9wbGFuZSBjb2xvci1t
Z210OgogIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjA4OTMvCgot
IGRybS9rb21lZGE6IEVuYWJsZSBDUlRDIGNvbG9yLW1nbXQKICBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzcwLwoKRm9yIHJlbW92aW5nIHRoZSBkZXBlbmRlbmNl
IG9uOgotIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMzA4NzYvCgpM
b3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToKICBkcm0va29tZWRhOiBBZGRzIGdh
bW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gc3VwcG9ydCBmb3IgRE9VLUlQUwoKamFtZXMgcWlhbiB3
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgKDMpOgogIGRybS9rb21lZGE6IEFkZCBhIG5ldyBo
ZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpCiAgZHJtL2tvbWVkYTogQWRkIGRy
bV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9jdG1fdG9fY29l
ZmZzKCkKCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMxXzMy
X3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgp2NDoKICBBZGRy
ZXNzIHJldmlldyBjb21tZW50cyBmcm9tIE1paGFpLCBEYW5pZWwgYW5kIElsaWEuCgpWNToKLSBJ
bmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgotIFJlYmFzZSB3
aXRoIGRybS1taXNjLW5leHQKCnY2OgogIEFsbG93cyBtID09IDAgYWNjb3JkaW5nIHRvIE1paGFp
bCdzIGNvbW1lbnRzLgoKTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgZHJt
L2tvbWVkYTogQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1J
UFMKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgzKToKICBkcm06IEFk
ZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpCiAgZHJtL2tvbWVk
YTogQWRkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcygpCiAgZHJtL2tvbWVkYTogQWRkIGRybV9j
dG1fdG9fY29lZmZzKCkKCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50
LmMgICAgfCAyMCArKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21n
bXQuYyAgICB8IDY2ICsrKysrKysrKysrKysrKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NvbG9yX21nbXQuaCAgICB8IDEwICsrLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lLmggIHwgIDMgKwogLi4uL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jICAgIHwgIDYgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5j
ICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmggICAgICAgICAgICAgICAgICB8ICAyICsKIDggZmlsZXMgY2hhbmdlZCwgMTQ0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCi0tCjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
