Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B011F8D08
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BF86EB06;
	Tue, 12 Nov 2019 10:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D766EB06
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:40:52 +0000 (UTC)
Received: from VI1PR08CA0234.eurprd08.prod.outlook.com (2603:10a6:802:15::43)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Tue, 12 Nov
 2019 10:40:50 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0234.outlook.office365.com
 (2603:10a6:802:15::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Tue, 12 Nov 2019 10:40:50 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 10:40:50 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Tue, 12 Nov 2019 10:40:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cce31c35067135f7
X-CR-MTA-TID: 64aa7808
Received: from d981cce78eee.2 (cr-mta-lb-1.cr-mta-net [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5F06376-502B-421F-8A7B-8FEBFE531604.1; 
 Tue, 12 Nov 2019 10:40:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d981cce78eee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 12 Nov 2019 10:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n92d6PvBTLOYVxR/ZTs3g7pD1M7PctfgQEF4HZExbBbewosiWjavSYGY4HTlCf7VnCZiUSaLX7uncj6sHvuNwiSY8BXmmhY8CqepD4ZqQuKrXYzT4ytYaDRuYMG5Iatk1GtULLEqHk7uNlU7YL5quKW8qX6zwluVLv74SGURRpz+FUWVp4q7LRwczaAZNg2k/ztq6oLeKluYVGNOKZflMM1VHpKQUaJXafsU7aWoUhLbSAEuySha9HrbzKWxvfv8qc0UPrwzX3O39LpwUVWdlfl86f+JVwxU3i3bbiRNua51T980w102i6pU+cZlmB/a8JN4lr4ghI6C6Nqxn22jaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=WPBgaqoOVlyhfGuyJx7/vH9o//7S0zc4brTayxxOMFRQZU7niufLx/235/iZtmv2ck3KYzZ1blbxXJPoGZK7Uy+70Kwz845fiEWEdcH97gzqZ1mz14ZmJQo1HpfX6lLG0uEHYKuheFSIgKu7gNxNJOQYRWnh8xmA1EeHulJoA3dVWoJF/QgaYJB7ANKkUNtVUVwB5IBciiq5WxLff/e3qCU4Hy1AmXHq6oA9VeZa+R7QDPR8UVVMhKPl9GiStnFlR4x8rvUFdFkp27zhUeRrusweNU1GEhmsrmZQ+tN4Wr/4nvkgMWjzCmDSBSHDN1ydvMG5Fo3rA7tKfcDY7bB34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB3313.eurprd08.prod.outlook.com (52.134.92.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 10:40:38 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 10:40:38 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v9 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v9 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVmUWfqKXksz1BtEuyt+x5WWTWPg==
Date: Tue, 12 Nov 2019 10:40:38 +0000
Message-ID: <20191112103956.19074-4-james.qian.wang@arm.com>
References: <20191112103956.19074-1-james.qian.wang@arm.com>
In-Reply-To: <20191112103956.19074-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:203:72::27) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a37dedc-b421-40cb-02da-08d7675cc8f1
X-MS-TrafficTypeDiagnostic: AM0PR08MB3313:|AM0PR08MB3313:|AM6PR08MB4691:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46914871E3E279168C7EAD9CB3770@AM6PR08MB4691.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(189003)(199004)(305945005)(8676002)(102836004)(476003)(2616005)(5660300002)(11346002)(99286004)(55236004)(81166006)(81156014)(7736002)(2906002)(50226002)(6506007)(66066001)(386003)(76176011)(26005)(186003)(71190400001)(71200400001)(2501003)(52116002)(8936002)(1076003)(25786009)(36756003)(256004)(6116002)(3846002)(4326008)(2171002)(66476007)(6512007)(446003)(478600001)(54906003)(486006)(6486002)(103116003)(64756008)(66946007)(66446008)(6436002)(14454004)(86362001)(316002)(110136005)(66556008)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3313;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5nPUsM/sEumHnGKHMxynTlM/yrvf6V2IsxcPPQ6bE8hOmL/ms1UK9pWpDK/YGCO+B+PaSk5r4wTeg34B/qrvFaa8oMEcQJXpPeSpicLPB5ugSZKhhV3S1gJmFryw6Z50CX2tW/lSIURLRHMG7WywiRm8n10JWOoy/Qic7OGUNZLV4XSKHqR57VzgknsgsGLrDu0gcJi43rbqVlHbAowrl/C8O4iMIKtQKRsRiwtO9/Awtgllar4UzRzN5Hh4p0GX8io0vySJpycuttFFk4cNI8SWNKWAi2bj006l0Aoh1or5b6sqpXcSaRQr9JALYSDnwoH2SBXdkV5HzL1mlI/Nye1rQ+pFyhZRho5Fuo2BmrbJbxE9H84Vw3ig5rxAU2b7t8TJ/LVb1DTFTmuZAj6BDqXyvZ5h7BT2nJMkt0glAw0baM3tLeJbHIBjkNGf1Bge
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3313
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(1110001)(339900001)(199004)(189003)(6486002)(6512007)(36756003)(2201001)(186003)(2171002)(102836004)(6506007)(54906003)(478600001)(25786009)(36906005)(99286004)(386003)(4326008)(446003)(7736002)(26005)(476003)(336012)(11346002)(486006)(305945005)(76176011)(316002)(86362001)(126002)(2616005)(110136005)(14454004)(26826003)(3846002)(356004)(8746002)(8936002)(2906002)(70206006)(5660300002)(50466002)(70586007)(50226002)(22756006)(47776003)(6116002)(76130400001)(23756003)(1076003)(2501003)(66066001)(8676002)(103116003)(81156014)(105606002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4691;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8346d92d-9665-4d5c-bc98-08d7675cc18b
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFC+nd+774Quh2BQzdrqCidYqYoUTdIfbFi+1LIhFcuvebmk+QlIi6hRRS20Q6KD2IiNCnbD5z7LjGayFEndeGrKfOTlIsALrnsFVpuOSHclEJl1Iol+WK9V/a085ABfQtf+7VbXMmcD0hH1sRAqIRrRy7e1t1aRGvZb2LNrMA3Us8u2C/CoA/ElJDLMa6ig5pBbu9zRGhEDNWbEvbtRsKmRLrJAVONn/jvBPZKEbT74ld0Xvsu4yRuXvLSFWSEvN4eglbkUtqAc0XvD4Yl3qWHThSSCUjKPhCuF7HMuIsMBQPD//BbXYqpc5Mco+U8v9l0jztRjwQ4Nl1mdxpjRprwnzEDc1ABgN4cIArIo+nFFJd+j8cgxCy+bY7c5P7gwz8hvh1zF3oEkx8HioWxfGwWpqH5PBX/69OEeK1+Hed/NA0/DWLAsaP2Tml7+bQFy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 10:40:50.1454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a37dedc-b421-40cb-02da-08d7675cc8f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=3viNEZC7HJOZbeLf+UCIaKL2UR7my6B2ub48hVwaHTTwt0BsWnbOwIlV3MDFjMW/c81PPBZyu5MyqO0lhLLZX51USHwZvhyYsk1dbyI9IZYoIfkTbkaza3CUMFhTMzoEkbjp5CMj686kj9dLxC/VDCtf4dp3Fp01kVVsytIT7yM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=3viNEZC7HJOZbeLf+UCIaKL2UR7my6B2ub48hVwaHTTwt0BsWnbOwIlV3MDFjMW/c81PPBZyu5MyqO0lhLLZX51USHwZvhyYsk1dbyI9IZYoIfkTbkaza3CUMFhTMzoEkbjp5CMj686kj9dLxC/VDCtf4dp3Fp01kVVsytIT7yM=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyBmb3IgY29udmVydGluZyBkcm1fY29sb3JfY3RtIG1hdHJpeCB0byBr
b21lZGEgaGFyZHdhcmUKcmVxdWlyZWQgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1ND
IG1hdHJpeC4KCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMx
XzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgpTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+ClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRh
bmFzc292QGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCAxNCArKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggYzE4MGNlNzBjMjZjLi5kOGU0NDllNmVi
ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKQEAgLTExNywzICsxMTcsMTcgQEAgdm9pZCBkcm1fbHV0X3RvX2Zn
YW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2Vm
ZnMpCiB7CiAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwg
QVJSQVlfU0laRShzZWN0b3JfdGJsKSk7CiB9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVy
bjsKKworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9O
X0NUTV9DT0VGRlM7IGkrKykKKwkJY29lZmZzW2ldID0gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbihjdG0tPm1hdHJpeFtpXSwgMywgMTIpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IDA4YWI2OTI4
MTY0OC4uMmY0NjY4NDY2MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCkBAIC0xOCw2ICsxOCw3IEBACiAjZGVm
aW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKIAogdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOwordm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1
MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
