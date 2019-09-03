Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E68A6A4D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF238929C;
	Tue,  3 Sep 2019 13:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986918929C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:46:16 +0000 (UTC)
Received: from VI1PR0802CA0025.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::11) by DB8PR08MB4955.eurprd08.prod.outlook.com
 (2603:10a6:10:38::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18; Tue, 3 Sep
 2019 13:46:12 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR0802CA0025.outlook.office365.com
 (2603:10a6:800:a9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Tue, 3 Sep 2019 13:46:12 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 13:46:11 +0000
Received: ("Tessian outbound d33df262a6a7:v27");
 Tue, 03 Sep 2019 13:46:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3234693feceb187
X-CR-MTA-TID: 64aa7808
Received: from 50d3a98a17d0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1991112-D4EA-4C76-A23A-8973D821680D.1; 
 Tue, 03 Sep 2019 13:46:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50d3a98a17d0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 03 Sep 2019 13:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcaAB3NyW6kLAt65nWPxoQ2JZaX2ajJTuNhPDhr8uCgUPOjq1HtC9DIEnUsckqjWW/JcUq70pKUna1+2XobN81hTpw7jrV8w2Te6KPIKHu6N9QOgJurY+y5kBYi0+6ppS/a5u0hXWsODOnF/pNhwSRQM2mDRveTpOm4iSwARwb54AKXXWCqN9tcKJpk/zBLP5f/q7ZiG/YqgQ0nCawnS1JKPL7N/ZXvdThob2PLXRKBiPWg2dALxUvM9urttj20UeYiO9i6yoKTphZgifDivSY/35Y9NFtaiQDCbODe7Mxb5fmVpMd+dzI9xZ4vpqntGuraPS3yL3Ck1k92mf0iSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+bYsjeRB4H83K8KQASm9Q0JVA1Rjd3M+GjL+LC8FZs=;
 b=Qb1CsEUz8uyMCjxeH5iWmyU3a4oxdMKSkiujCHV+L9RbJ9CWpakau/OldenKqbc3coCEBLGl3Sd4jYwEYa/GoNhlRX0FZkrNC4HO3bvF9g0Eb8SLxIm6FRhGKx9BJjyEb+smmDqZ4xfYogIHgte3pGW5LscOIU9Mgx2hQCGjkVU4Kp+L5R2Ml0+syE/ZHUUk8Q5vBnV8XA5OeRdiT1R9UnG2IEZYICM3UnstqAaPUIDMCpgyUhFspPZiL2w3CFOI897HgbkxTtEmQwnVp8lWEvzwFoqQnAwR/kbRZ96U4tICnRq5idfqmwDOJOxB6UFKSpmaasymhY5OcgXW+x9yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB3090.eurprd08.prod.outlook.com (52.134.90.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 13:46:02 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::a820:853d:e981:a76c]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::a820:853d:e981:a76c%2]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 13:46:02 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Topic: [PATCH] drm/komeda: Add ACLK rate to sysfs
Thread-Index: AQHVXZBFvBwgvZ1PNEmL4p2YP+CqdacQmt0AgAll2oA=
Date: Tue, 3 Sep 2019 13:46:02 +0000
Message-ID: <20190903134601.GA9315@arm.com>
References: <20190828110342.45936-1-mihail.atanassov@arm.com>
 <20190828141508.GA6738@jamwan02-TSP300>
In-Reply-To: <20190828141508.GA6738@jamwan02-TSP300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::32) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4c28a1bd-4a0b-4b11-93dd-08d730751495
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3090; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB3090:|AM0PR08MB3090:|DB8PR08MB4955:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB495538663DD37EA1C1BE1EBCE4B90@DB8PR08MB4955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:415;OLM:415;
x-forefront-prvs: 01494FA7F7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(86362001)(81166006)(64756008)(476003)(2616005)(446003)(11346002)(81156014)(66476007)(66946007)(486006)(1076003)(4326008)(25786009)(8936002)(6486002)(36756003)(316002)(99286004)(256004)(8676002)(33656002)(102836004)(7736002)(305945005)(14454004)(966005)(478600001)(2906002)(66446008)(52116002)(66556008)(37006003)(26005)(66066001)(3846002)(6116002)(6862004)(76176011)(44832011)(6506007)(386003)(186003)(53936002)(5660300002)(6436002)(6246003)(6512007)(71190400001)(6636002)(6306002)(54906003)(71200400001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3090;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: aNoory+9hmecTDwscWmU6cCYPFpFh95+vLo/DBjeBwsxi3KwAnIef+5Sym/OqUlWBS1DE6MGZbNt2sjBkDnehNpLjhH2FYuy7G4vg7cmekjLPmotGvExbB5IX8ZMLTOfkOZE1tXKe0AS0rwkSL4pqzCVZrvUtq+lXELAnEop6k0xSj1+x0mi0eMvvk6+utmW236iAm7bjDEDD6Q6ZDUTadAaSm5pXFE+LAK5F8+/MFdEdnlTUjUJe3zC4wUvndKmvhL1zcIrY8rjCDw32RMoY14xwYQQU7oygdCR9odS8qyZw2R1p08Fc8CffAxj4E1tpw/ysxi0U7yKf0p/5pZ7oDMwnQQcJbJJFW24/RsjZ0Jen3s6Bgmg0ejDqBFfQv68Yhv5TxVx2d77C1XQZZXWuBW78yMI14oxpraWB4x4jSg=
Content-ID: <1B5BE7F30491A649A54770DE417F951A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3090
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(63350400001)(966005)(11346002)(63370400001)(478600001)(446003)(25786009)(8676002)(2616005)(81156014)(81166006)(6306002)(126002)(336012)(476003)(8746002)(8936002)(6512007)(6636002)(70206006)(26826003)(4326008)(7736002)(356004)(76130400001)(70586007)(37006003)(54906003)(6862004)(305945005)(316002)(14454004)(486006)(5660300002)(97756001)(1076003)(22756006)(229853002)(99286004)(186003)(26005)(6246003)(102836004)(66066001)(2906002)(386003)(6506007)(3846002)(50466002)(36756003)(23726003)(46406003)(86362001)(33656002)(6486002)(47776003)(76176011)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4955;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a92c249-1cfa-449d-89b5-08d730750f37
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB4955; 
NoDisclaimer: True
X-Forefront-PRVS: 01494FA7F7
X-Microsoft-Antispam-Message-Info: O16rCA3dtqRoc4IS2SN+WkrgSkfemqW9C9owdnsio5+aONcVeAf0OW0j9nht8+fygnt3C31rc8MTys6MJmKv3T36SCanAPtzetswh0xOsNRyeb/QcHXmrjlqbrHlb3X0OJiTKHFhG9vcaiVTcvaz8ATFpdO0zEtJKMAkawX/QIz0IEvkTnAVaB30u6qDJQ0ajDQFNVFn+/MG02+mUyS9CroyPQaHuh7gn8YQIp6K8L3wMt8sFNWNhnnH6lSgCJ9yNsrwSf8+XcgfmEjQMwZYx2+WvWYwIju8IAQ5NbkWqID5hr8r/G9KDZejkWNNKQFI7tISQC7qqEmi+Sg6LTS5qlzU0Op7ggHMzT2LIWPHvGXmMlojeGmwz73umo/1420NWXD/B4XwgxEAG3tjtGOmp30RMZSL427j/Smj0um5DEk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 13:46:11.0328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c28a1bd-4a0b-4b11-93dd-08d730751495
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4955
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+bYsjeRB4H83K8KQASm9Q0JVA1Rjd3M+GjL+LC8FZs=;
 b=aS7tc+94hpCznG6V96zvWbsDhrjWiovCLu2rBu19KTTYGjnOE24btYU2t5N/1leL+fBgeflOAwICv589h38lusvaFxfsqXwwCbzD5Wr+Y9CRsriRaACjWJHbaz1DHC5LjidNOxO+6cOqUiR9LKiq8hOS8ViWqOG4o8Su3olZn8U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+bYsjeRB4H83K8KQASm9Q0JVA1Rjd3M+GjL+LC8FZs=;
 b=aS7tc+94hpCznG6V96zvWbsDhrjWiovCLu2rBu19KTTYGjnOE24btYU2t5N/1leL+fBgeflOAwICv589h38lusvaFxfsqXwwCbzD5Wr+Y9CRsriRaACjWJHbaz1DHC5LjidNOxO+6cOqUiR9LKiq8hOS8ViWqOG4o8Su3olZn8U=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDI6MTU6MTVQTSArMDAwMCwgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gSGkgTWloYWlsOgo+IAo+IExvb2tzIGdv
b2QgdG8gbWUuCj4gCj4gUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPgpQdXNoZWQgdG8gZHJtLW1pc2Mt
bmV4dCAgNWZjZDA1NTE5M2M1ZDRjYWM2ZDIwNWJkNjVlNTJjOTU3ZWEwNTdjMgpBbmQgdGhhdCB2
ZXJpZmllcyBteSBuZXcgZGltIHNldHVwLiA6KQo+IEphbWVzLgo+IAo+IE9uIFdlZCwgQXVnIDI4
LCAyMDE5IGF0IDExOjAzOjQ5QU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBF
eHBvc2Ugbm9kZSB3aXRoIHRoZSBuYW1lICdhY2xrX2h6Jwo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDEwICsr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4g
aW5kZXggMDE0MmVlOTkxOTU3Li5lOGQ2NzM5NWEzYjkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPiA+IEBAIC05MSw5ICs5
MSwxOSBAQCBjb25maWdfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vf
YXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gPiAgfQo+ID4gIHN0YXRpYyBERVZJQ0VfQVRU
Ul9STyhjb25maWdfaWQpOwo+ID4gIAo+ID4gK3N0YXRpYyBzc2l6ZV90Cj4gPiArYWNsa19oel9z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNo
YXIgKmJ1ZikKPiA+ICt7Cj4gPiArCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2X3RvX21k
ZXYoZGV2KTsKPiA+ICsKPiA+ICsJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWx1
XG4iLCBjbGtfZ2V0X3JhdGUobWRldi0+YWNsaykpOwo+ID4gK30KPiA+ICtzdGF0aWMgREVWSUNF
X0FUVFJfUk8oYWNsa19oeik7Cj4gPiArCj4gPiAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmtv
bWVkYV9zeXNmc19lbnRyaWVzW10gPSB7Cj4gPiAgCSZkZXZfYXR0cl9jb3JlX2lkLmF0dHIsCj4g
PiAgCSZkZXZfYXR0cl9jb25maWdfaWQuYXR0ciwKPiA+ICsJJmRldl9hdHRyX2FjbGtfaHouYXR0
ciwKPiA+ICAJTlVMTCwKPiA+ICB9Owo+ID4gIAo+ID4gLS0gCj4gPiAyLjIyLjAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
