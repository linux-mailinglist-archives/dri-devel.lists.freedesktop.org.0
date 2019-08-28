Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80720A0578
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219B2890BF;
	Wed, 28 Aug 2019 15:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150089.outbound.protection.outlook.com [40.107.15.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBD8890BF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 15:00:42 +0000 (UTC)
Received: from VI1PR0801CA0083.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::27) by HE1PR0801MB1849.eurprd08.prod.outlook.com
 (2603:10a6:3:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Wed, 28 Aug
 2019 15:00:38 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR0801CA0083.outlook.office365.com
 (2603:10a6:800:7d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16 via Frontend
 Transport; Wed, 28 Aug 2019 15:00:38 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 15:00:37 +0000
Received: ("Tessian outbound aa6cb5c8f945:v27");
 Wed, 28 Aug 2019 15:00:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce30f03f349cbbe7
X-CR-MTA-TID: 64aa7808
Received: from a64bf5be92b7.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 738CCCAB-1CF4-4A87-99DC-284A7E01FF1D.1; 
 Wed, 28 Aug 2019 15:00:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a64bf5be92b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 28 Aug 2019 15:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcNszn9gwKjyOxLOweNcRL2gbDpbGq9LFYtQTqU4DgPiTyHf/BuLvDSO17NevpN1euXyizPpLdCeudKUApTTAiXrosU7LekhazP/F47ka99AXz6zX+eCbCA1+EaLsowNh1O81khXzOLJy5hNYIUszHHT1hl0rIV59yKph+jfscsfBK7jTWoZVMUWBZwT3xquX1cI2S9LMw3nDWCMpT+i9IM2ZFS890rgHx45QKwcERgCa48aMIly9Zy9BSxAMpjCWbI2G0CKY5UgPL2SxrbFcClXKiSba9XCbNqrGDWWqK6nNXq/Zs7PUInZGAHtnZVYxv/OXMaENO8tt+XoCRF5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM1IEgb87yGxGmqT6sYLlZkZjBxtjy4yeyRXYt4Mt6c=;
 b=WvFXwapjgJ7wR9u13s5vjcu0k1dCDW11stl+BzwE7gQkSqKD6WhfKC34mdXQ0t2LrOYw8aU7l2NYse6Klbtl2Vi7L5WpddWPRrhXkuJvCezxe1YPx2yD6b2KaxeF2z6MQ1YLip06SHecNi6BI/rzDGTknoVB3RKkStBiX60vRUdgxRT1nw0yR9Elol76pAdDFhb9wLFE4xcVYLJR4CRog0893sWTL1bpmFQOLjRr36gwe1zJOTVq1aRd8XZv1K6CXQWNgOkOTrgJD/4bzbSEv2Np7cfGWoZpaaj7rliEl8bQD6lXE4atX1x/nKIaFzlGFfwpbCZ/J9mkQGhk564mGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.212.135) by
 AM0PR08MB3955.eurprd08.prod.outlook.com (20.178.119.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 15:00:19 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::1de:178b:2ca:42e5]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::1de:178b:2ca:42e5%2]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 15:00:19 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "malidp@foss.arm.com"
 <malidp@foss.arm.com>, "airlied@linux.ie" <airlied@linux.ie>, "james qian
 wang (Arm Technology China)" <james.qian.wang@arm.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Topic: [PATCH v2] drm/komeda: Reordered the komeda's de-init functions
Thread-Index: AQHVXbFOPtkOyMBO7Em37TZu77ub2Q==
Date: Wed, 28 Aug 2019 15:00:19 +0000
Message-ID: <20190828145945.15904-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::7)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d02d6fe1-2a10-416a-b344-08d72bc87c15
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3955; 
X-MS-TrafficTypeDiagnostic: AM0PR08MB3955:|HE1PR0801MB1849:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1849097CFA5D6CE9412EE76FE4A30@HE1PR0801MB1849.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:78;OLM:78;
x-forefront-prvs: 014304E855
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(66946007)(26005)(66556008)(102836004)(66476007)(64756008)(86362001)(52116002)(50226002)(99286004)(5660300002)(186003)(110136005)(1076003)(54906003)(6486002)(6436002)(316002)(3846002)(66446008)(2201001)(4326008)(478600001)(2906002)(476003)(66066001)(25786009)(2616005)(6506007)(5024004)(386003)(14454004)(486006)(6512007)(44832011)(71190400001)(6116002)(71200400001)(7736002)(81156014)(81166006)(8936002)(2501003)(36756003)(305945005)(256004)(14444005)(8676002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3955;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: DtlUvpQ/raR5nEkk0UAaVab5doBrb3G4hTOB54l3wcN0R/kjgF7Z0vM4hOF187wWAqWWLmIaT+WoJymVWpdvHwqyTZE6EulnbKXjh4w4mM4qCDmOAbKERASJBLivhfLxlo+DglZkP4lY8TQiyQ8OgYKdzGa/5VaI4PmV5p9SbK277yCHk7DO2oTc++Lpzv7uvV7TApGtbYWxC1CTwxsVIxJ3x1/mBGTxBsGayFmJ9Xninl1e1PfgqpM1E+3LRtviayiuul48bfCounm7XGk2/rT/mk4CZuiNMIR+vW18gn87Q29rF8lAY0Cf4Tu71FCEIN0ZNKtDtiV4qvwo8rZUMSmAZh0xq8ZZgu4GMi6AXDszkWMxLCG4AXOhPKk46Q+w7KcHDjbBuIrkwgVdWuXCn3sv1rxlgkdQ7qFDdrb1gV4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3955
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(189003)(199004)(305945005)(476003)(126002)(50466002)(2616005)(4326008)(25786009)(66066001)(1076003)(63350400001)(23756003)(63370400001)(47776003)(76130400001)(6506007)(386003)(22756006)(8676002)(6512007)(356004)(102836004)(336012)(2906002)(36756003)(2201001)(186003)(5024004)(14444005)(2501003)(7736002)(26005)(486006)(36906005)(81166006)(86362001)(81156014)(6486002)(3846002)(316002)(6116002)(8936002)(8746002)(110136005)(50226002)(54906003)(5660300002)(99286004)(70206006)(478600001)(70586007)(26826003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1849;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9461d39a-582f-4f1f-870b-08d72bc8715a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1849; 
NoDisclaimer: True
X-Forefront-PRVS: 014304E855
X-Microsoft-Antispam-Message-Info: q6GMGfXJFptTThNCDfmt5Cq9DSLZuNovJL8gq5/3mNS5EjZpOuerJGl1hGdsy4jBHJ9x3Pw6BIXTVFy+22xS/RRCsfYbTLTScq1pGVvB+YUwqdNZ/E9IHS9TfO4zQG93X9ZUAEqdShxmDBq0oYqQmKg3GlUJ9o/JV3refWAiAujMTZzX2jy9sPZGeF4o0PDY0F/3rZ0Dr5VOMeiqktrwQUy4+m3bA4YHrk0somndQhPol6Otu7+7cY73YIaVJ4f4cbwE6yqzMjuQ8KpYijMy5+YOMUqKj9W2rkISflIaOe2cyQwsViV889CmQZkdT/Mx7tI0qn2Q6y8g3o5+RntyQ26ZFHYHkFLkue1ob3yBnig9zP/bQ47JvdsGPS6P5T/B7NLUPe1L6B8m636p05uwiZmCzZzqIzb3j8n83K1qwXY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 15:00:37.0133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02d6fe1-2a10-416a-b344-08d72bc87c15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM1IEgb87yGxGmqT6sYLlZkZjBxtjy4yeyRXYt4Mt6c=;
 b=mKAwPuxpEplh6RAsyV4bEypVyEna80EeP5JSvVU/ObBlZnvwzjF42fjur90piydRo4gARoGGEcj67AelqAs/X65CPCODYoilBD8/ZzFG+IPpdr/V+ry6oA0A5vGha2qqPBnKWXDRLgYP2wacylc1Kl9TAzimfBLzDWhZTUpARJY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM1IEgb87yGxGmqT6sYLlZkZjBxtjy4yeyRXYt4Mt6c=;
 b=mKAwPuxpEplh6RAsyV4bEypVyEna80EeP5JSvVU/ObBlZnvwzjF42fjur90piydRo4gARoGGEcj67AelqAs/X65CPCODYoilBD8/ZzFG+IPpdr/V+ry6oA0A5vGha2qqPBnKWXDRLgYP2wacylc1Kl9TAzimfBLzDWhZTUpARJY=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, nd <nd@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXlhbiBIYWxkZXIgPEF5YW4uSGFsZGVyQGFybS5jb20+CgpUaGUgZGUtaW5pdCByb3V0
aW5lIHNob3VsZCBiZSBkb2luZyB0aGUgZm9sbG93aW5nIGluIG9yZGVyOi0KMS4gVW5yZWdpc3Rl
ciB0aGUgZHJtIGRldmljZQoyLiBTaHV0IGRvd24gdGhlIGNydGNzIC0gZmFpbGluZyB0byBkbyB0
aGlzIG1pZ2h0IGNhdXNlIGEgY29ubmVjdG9yIGxlYWthZ2UKU2VlIHRoZSAnY29tbWl0IDEwOWM0
ZDE4ZTU3NCAoImRybS9hcm0vbWFsaWRwOiBFbnN1cmUgdGhhdCB0aGUgY3J0Y3MgYXJlCnNodXRk
b3duIGJlZm9yZSByZW1vdmluZyBhbnkgZW5jb2Rlci9jb25uZWN0b3IiKScKMy4gRGlzYWJsZSB0
aGUgaW50ZXJydXB0cwo0LiBVbmJpbmQgdGhlIGNvbXBvbmVudHMKNS4gRnJlZSB1cCBEUk0gbW9k
ZV9jb25maWcgaW5mbwoKQ2hhbmdlcyBmcm9tIHYxOi0KMS4gUmUtb3JkZXJlZCB0aGUgaGVhZGVy
IGZpbGVzIGluY2x1c2lvbgoyLiBSZWJhc2VkIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IGRybS1taXNj
LWZpeGVzCgpTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJAYXJt
LmNvbT4KUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJt
LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAg
fCAyMyArKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2ttcy5jCmluZGV4IDFmMGUzZjRlOGQ3NC4uNjlkOWUyNmM2MGM4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwpAQCAtMTQs
OCArMTQsOCBAQAogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ly
cS5oPgotI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9i
ZV9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCiAjaW5jbHVkZSAia29t
ZWRhX2Rldi5oIgogI2luY2x1ZGUgImtvbWVkYV9mcmFtZWJ1ZmZlci5oIgpAQCAtMzA2LDExICsz
MDYsMTEgQEAgc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprb21lZGFfa21zX2F0dGFjaChzdHJ1Y3Qg
a29tZWRhX2RldiAqbWRldikKIAkJCSAgICAgICBrb21lZGFfa21zX2lycV9oYW5kbGVyLCBJUlFG
X1NIQVJFRCwKIAkJCSAgICAgICBkcm0tPmRyaXZlci0+bmFtZSwgZHJtKTsKIAlpZiAoZXJyKQot
CQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7CisJCWdvdG8gZnJlZV9jb21wb25lbnRfYmluZGlu
ZzsKIAogCWVyciA9IG1kZXYtPmZ1bmNzLT5lbmFibGVfaXJxKG1kZXYpOwogCWlmIChlcnIpCi0J
CWdvdG8gY2xlYW51cF9tb2RlX2NvbmZpZzsKKwkJZ290byBmcmVlX2NvbXBvbmVudF9iaW5kaW5n
OwogCiAJZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7CiAKQEAgLTMxOCwxNSArMzE4LDIxIEBAIHN0
cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYg
Km1kZXYpCiAKIAllcnIgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7CiAJaWYgKGVycikKLQkJ
Z290byBjbGVhbnVwX21vZGVfY29uZmlnOworCQlnb3RvIGZyZWVfaW50ZXJydXB0czsKIAogCXJl
dHVybiBrbXM7CiAKLWNsZWFudXBfbW9kZV9jb25maWc6CitmcmVlX2ludGVycnVwdHM6CiAJZHJt
X2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7CiAJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOwor
CW1kZXYtPmZ1bmNzLT5kaXNhYmxlX2lycShtZGV2KTsKK2ZyZWVfY29tcG9uZW50X2JpbmRpbmc6
CisJY29tcG9uZW50X3VuYmluZF9hbGwobWRldi0+ZGV2LCBkcm0pOworY2xlYW51cF9tb2RlX2Nv
bmZpZzoKIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwogCWtvbWVkYV9rbXNfY2xlYW51
cF9wcml2YXRlX29ianMoa21zKTsKKwlkcm0tPmRldl9wcml2YXRlID0gTlVMTDsKKwlkcm1fZGV2
X3B1dChkcm0pOwogZnJlZV9rbXM6CiAJa2ZyZWUoa21zKTsKIAlyZXR1cm4gRVJSX1BUUihlcnIp
OwpAQCAtMzM3LDEzICszNDMsMTQgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qga29t
ZWRhX2ttc19kZXYgKmttcykKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJmttcy0+YmFzZTsK
IAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGRybS0+ZGV2X3ByaXZhdGU7CiAKLQlkcm0tPmly
cV9lbmFibGVkID0gZmFsc2U7Ci0JbWRldi0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYpOwogCWRy
bV9kZXZfdW5yZWdpc3Rlcihkcm0pOwogCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwor
CWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7CisJZHJtLT5pcnFfZW5hYmxlZCA9IGZh
bHNlOworCW1kZXYtPmZ1bmNzLT5kaXNhYmxlX2lycShtZGV2KTsKIAljb21wb25lbnRfdW5iaW5k
X2FsbChtZGV2LT5kZXYsIGRybSk7Ci0Ja29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2Jqcyhr
bXMpOwogCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7CisJa29tZWRhX2ttc19jbGVhbnVw
X3ByaXZhdGVfb2JqcyhrbXMpOwogCWRybS0+ZGV2X3ByaXZhdGUgPSBOVUxMOwogCWRybV9kZXZf
cHV0KGRybSk7CiB9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
