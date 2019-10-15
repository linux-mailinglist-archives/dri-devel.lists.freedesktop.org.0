Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAAD6D1E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 04:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689A36E5DA;
	Tue, 15 Oct 2019 02:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BF16E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 02:11:11 +0000 (UTC)
Received: from VI1PR08CA0103.eurprd08.prod.outlook.com (2603:10a6:800:d3::29)
 by VI1PR08MB4366.eurprd08.prod.outlook.com (2603:10a6:803:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 02:11:06 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0103.outlook.office365.com
 (2603:10a6:800:d3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Tue, 15 Oct 2019 02:11:06 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 02:11:05 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Tue, 15 Oct 2019 02:11:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ea56d70985e14a7
X-CR-MTA-TID: 64aa7808
Received: from 67c7e3bd8aa3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82CD08CE-DCEF-46A6-AAE7-FD7736A85D7E.1; 
 Tue, 15 Oct 2019 02:10:56 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 67c7e3bd8aa3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 15 Oct 2019 02:10:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5GCFt8S9ZbVVQLQkPJ5Q8JAYjUBXpPOWLnsfaha+28Cltyj6C1UVOxbeDzuMltN6V5WNnzkGL1sl7YKnsS/xaLYV3rbqAJb8HUkeXkentzqWRV2OpQDS5AsOa8eX2DuckiF1K/lGH+pn4cZ1Yjuvc7GykyW9JUho6bIWSsXA1FULM8t0xPBG7zkKl4Byt/SN9gaSBXeR4GkP8FsK2mPexsCXR87L0rXTFrFe0QXlDht2Gvpt2nU+cM1519zvBvpZqt5iGNpi1s1JjtqU9t3AYjgjPF/HY2nL6b5VBQxk6PCM80uwGM+soAwmCjxTMvo0asIo4GQ3kHMvM/S1LUryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+CVUl4qWxenCBixN/jWd32qUXnMZcRNCV0P3x8wYzk=;
 b=gb2CgO027n2vz1EmLZq60cdLiuQ4stbjR9MoDEssugnatDZZvdu+ylNhHJYSVl84bnTVykSP5vTgPUPY66q41stpnpk9vfulcOeqNbLA0FMeQ0bXhHIE37yGQxbpWg+dlZEG3Q/KawfPjQFtt8P3iMS7ZCCroIuy5rsd1VFsFbMnL1COXvXc7/r+kFcTF+J+wrNalGW1CSL31Nebbep0vjf0UjWuhq3ViQr08TaRjyhCNub1vU2+VrfrdYl88M3t1IVtsJwBm4EiiVFOyVk7JjBV/942zAM//YkXKQVkiICVozWzmPO5xCNjWTZYFoVsSnGEv7kfwSt3Vd5uOyBEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 02:10:54 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 02:10:54 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVgv3GI0L46yKgNUGru0epkUV1dw==
Date: Tue, 15 Oct 2019 02:10:53 +0000
Message-ID: <20191015021016.327-3-james.qian.wang@arm.com>
References: <20191015021016.327-1-james.qian.wang@arm.com>
In-Reply-To: <20191015021016.327-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 17285621-1f38-4222-ca91-08d75114ef36
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|VI1PR08MB4366:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4366CDD8B6AE68DB24CBD0B8B3930@VI1PR08MB4366.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(189003)(199004)(66066001)(476003)(76176011)(110136005)(54906003)(66946007)(64756008)(66476007)(66446008)(71200400001)(66556008)(26005)(103116003)(2201001)(86362001)(6512007)(186003)(71190400001)(316002)(36756003)(6506007)(446003)(11346002)(386003)(2616005)(486006)(2906002)(256004)(52116002)(14444005)(55236004)(102836004)(2171002)(8936002)(14454004)(478600001)(6486002)(81156014)(81166006)(305945005)(50226002)(2501003)(4326008)(8676002)(7736002)(5660300002)(1076003)(6116002)(3846002)(25786009)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cfKYnAsGCVJorudqwrhl2d7VJ7+/yWklsxh2CWOpj/VaB4F8b93xUFNR3HjS/vQ6PbhVtUHez5H5V+/OmgwtY2HWTUOmCk1aRsqB6ezsT740USWkGWhpfG/dklQ0vla9XNkzyNtSzlNQWD3RwILqjfwdU+gOmbt6gCDzHOfBJCawaPvo1Fkq0S1+UU7U4tUwiyeSlQG5hqPb83nc3535iHNPn2n4fx1+nCJMlS4vsq0tk8DyHTedKoAdOgh4Ft7c/wONs4j6JRyNSuV0KjKc49Dszi3z9LF3wf3R8K+KarXFIt+nlK65ALgwanRq3vJ4r8ldIdQ3TJzT5KvNuQshpL9/1ebtD3fikpEhkeUQ+CQZAoK5Oqb9q9a1vEzmKg9lH75LJIbu8OqQ4lWH/yM5v7uxdFtrigB4fW4HEu7Agvc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(99286004)(50466002)(7736002)(26005)(386003)(316002)(76176011)(486006)(4326008)(1076003)(54906003)(110136005)(5660300002)(305945005)(356004)(336012)(25786009)(63350400001)(2906002)(103116003)(2616005)(476003)(126002)(11346002)(22756006)(446003)(6506007)(6116002)(3846002)(186003)(86362001)(102836004)(2201001)(478600001)(26826003)(50226002)(70586007)(81156014)(8676002)(81166006)(8746002)(14454004)(6512007)(8936002)(14444005)(2501003)(70206006)(76130400001)(2171002)(66066001)(6486002)(47776003)(23756003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4366;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4800d94f-3272-43bb-2a78-08d75114e867
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FOuwIsdzibVBy+aSzp0N606ryLs1+HFSR3/rYApIDy/OzueHcUKeEsLsa6sbM52CE1fpK0fCLV1Bs6L0jUO7isHrcK70CP+xBM7zj2eZIIEgMvivh5/DnDaBD5eCkblFMwERFwnZU/BcDmkEM4RbJ/iWXpZBLmPa/UrBUe/u2bngmFJ4q9X6vFaObvUSZRA0zGYfSYRBfa34W9uvlOysC9XkS0CmCRot2mhWQ8jWMBhB3zZ321D5/yicWfauZqTGIk/JO/mVezoLVuY0UC7nH4oa49W77tmqtO1gCPvshS27FEQJiH2XiD8gWXcKVYL39g4mqhM6ToK4K/Ebr41lPUGa9iO8PNzflqjwEANhHL3nlDQh+3s9yVRWWyr/SnvN7Zl1I90Kk8zrvz6HxtjLFnpi/OrdVdNrNGx3NQYoco=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 02:11:05.0245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17285621-1f38-4222-ca91-08d75114ef36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4366
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+CVUl4qWxenCBixN/jWd32qUXnMZcRNCV0P3x8wYzk=;
 b=RyP3qy9lmz3B6X+mVDqdsXTc9pLR19quzSSv2uVAJdTAXoPCK2i3VGfNp7EQ/EfIqi88z9KMW1KaM4KR+4rxYvZm0PzX4pPr0+CySnXkaMoKqrcG/dO/b2CiTPI3CMCBAtFkQEXKNH+gRucOpu9KQnk696fXUfuY5xcjC2NOrU4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+CVUl4qWxenCBixN/jWd32qUXnMZcRNCV0P3x8wYzk=;
 b=RyP3qy9lmz3B6X+mVDqdsXTc9pLR19quzSSv2uVAJdTAXoPCK2i3VGfNp7EQ/EfIqi88z9KMW1KaM4KR+4rxYvZm0PzX4pPr0+CySnXkaMoKqrcG/dO/b2CiTPI3CMCBAtFkQEXKNH+gRucOpu9KQnk696fXUfuY5xcjC2NOrU4=
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

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIDNkbHV0IHRvIGtvbWVkYSBIVyBy
ZXF1aXJlZCAxZCBjdXJ2ZQpjb2VmZnMgdmFsdWVzLgoKU2lnbmVkLW9mZi1ieTogamFtZXMgcWlh
biB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpS
ZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgot
LS0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDUyICsr
KysrKysrKysrKysrKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21n
bXQuaCAgICB8ICA5ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuYwppbmRleCA5ZDE0YTkyZGJiMTcuLmMxODBjZTcwYzI2YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYwpAQCAtNjUsMyArNjUsNTUgQEAgY29uc3QgczMyICprb21lZGFfc2VsZWN0
X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNvbG9yX3JhbmdlKQogCiAJ
cmV0dXJuIGNvZWZmczsKIH0KKworc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciB7CisJdTMyIGJv
dW5kYXJ5X3N0YXJ0OworCXUzMiBudW1fb2Zfc2VnbWVudHM7CisJdTMyIHNlZ21lbnRfd2lkdGg7
Cit9OworCitzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VnbWVudCB7CisJdTMyIHN0YXJ0OworCXUzMiBl
bmQ7Cit9OworCitzdGF0aWMgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciBzZWN0b3JfdGJsW10g
PSB7CisJeyAwLCAgICA0LCAgNCAgIH0sCisJeyAxNiwgICA0LCAgNCAgIH0sCisJeyAzMiwgICA0
LCAgOCAgIH0sCisJeyA2NCwgICA0LCAgMTYgIH0sCisJeyAxMjgsICA0LCAgMzIgIH0sCisJeyAy
NTYsICA0LCAgNjQgIH0sCisJeyA1MTIsICAxNiwgMzIgIH0sCisJeyAxMDI0LCAyNCwgMTI4IH0s
Cit9OworCitzdGF0aWMgdm9pZAorZHJtX2x1dF90b19jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0
eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsCisJCSAgc3RydWN0IGdhbW1hX2N1cnZlX3Nl
Y3RvciAqc2VjdG9yX3RibCwgdTMyIG51bV9zZWN0b3JzKQoreworCXN0cnVjdCBkcm1fY29sb3Jf
bHV0ICpsdXQ7CisJdTMyIGksIGosIGluLCBudW0gPSAwOworCisJaWYgKCFsdXRfYmxvYikKKwkJ
cmV0dXJuOworCisJbHV0ID0gbHV0X2Jsb2ItPmRhdGE7CisKKwlmb3IgKGkgPSAwOyBpIDwgbnVt
X3NlY3RvcnM7IGkrKykgeworCQlmb3IgKGogPSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zf
c2VnbWVudHM7IGorKykgeworCQkJaW4gPSBzZWN0b3JfdGJsW2ldLmJvdW5kYXJ5X3N0YXJ0ICsK
KwkJCSAgICAgaiAqIHNlY3Rvcl90YmxbaV0uc2VnbWVudF93aWR0aDsKKworCQkJY29lZmZzW251
bSsrXSA9IGRybV9jb2xvcl9sdXRfZXh0cmFjdChsdXRbaW5dLnJlZCwKKwkJCQkJCUtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworCQl9CisJfQorCisJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NP
TE9SX1BSRUNJU0lPTik7Cit9CisKK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVj
dCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQoreworCWRybV9sdXRf
dG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsIHNlY3Rvcl90YmwsIEFSUkFZX1NJWkUoc2VjdG9y
X3RibCkpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IGEyZGYyMThmNThlNy4uMDhhYjY5MjgxNjQ4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xv
cl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5oCkBAIC0xMSw3ICsxMSwxNCBAQAogI2luY2x1ZGUgPGRybS9kcm1fY29sb3Jf
bWdtdC5oPgogCiAjZGVmaW5lIEtPTUVEQV9OX1lVVjJSR0JfQ09FRkZTCQkxMgorI2RlZmluZSBL
T01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTIKKyNkZWZpbmUgS09NRURBX0NPTE9SX1BSRUNJU0lP
TgkJMTIKKyNkZWZpbmUgS09NRURBX05fR0FNTUFfQ09FRkZTCQk2NQorI2RlZmluZSBLT01FREFf
Q09MT1JfTFVUX1NJWkUJCUJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQorI2RlZmluZSBLT01F
REFfTl9DVE1fQ09FRkZTCQk5CisKK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVj
dCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKTsKIAogY29uc3QgczMy
ICprb21lZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNv
bG9yX3JhbmdlKTsKIAotI2VuZGlmCisjZW5kaWYgLypfS09NRURBX0NPTE9SX01HTVRfSF8qLwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
