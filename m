Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D5C113D26
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045126F5F0;
	Thu,  5 Dec 2019 08:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF986F5EF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:36:13 +0000 (UTC)
Received: from VI1PR08CA0101.eurprd08.prod.outlook.com (2603:10a6:800:d3::27)
 by DB6PR08MB2790.eurprd08.prod.outlook.com (2603:10a6:6:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Thu, 5 Dec
 2019 08:36:09 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by VI1PR08CA0101.outlook.office365.com
 (2603:10a6:800:d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 08:36:09 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 08:36:09 +0000
Received: ("Tessian outbound a4662a02422d:v37");
 Thu, 05 Dec 2019 08:36:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7981b86e7e73f93b
X-CR-MTA-TID: 64aa7808
Received: from ef55844377f8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6739013-FDFC-4A91-933B-A7AA873F9A8A.1; 
 Thu, 05 Dec 2019 08:36:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef55844377f8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 08:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhejpaP+lbyZNeNa/Jhf7lL2onD2lTLKk0Ej4FSoB4yYANMDaomDTruZo1BHfSKfkenu/py0DMc6r0er7nG6J2DV5+XG+U4GdBhmBMCUM/vbZgsbNCuUHCxa5Czas7XG70xRhTzNrCrXF7CsCqXkk9NJILq57MMmbPsAGRJkz+TenjwxH0YrB4nHbpIJ9WZm0YyTsrWQBAxGPtjY5UQiI8cL1cPRgW6C8vxtHMOt2OglSO8jpPD+xRcwSX6RprAivzW0743CdPfhJ9ZwKG17ekW5QnS0/vAuQ4HeV9zuGgASZv9DD7VHK0Boss1w+G+W+t+YousBMMug5NTZNo0rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=jlGs0plwuzgePZ4+s+Kvlw6QnUAMlKTrePIU1wkfaN5DcPLehvtHFqxHrfi0pMb5027t30zNgZgs4ncMxurCXtim19csqdo92lDjXvUwJtNMFKGvbk/h6kqEGwSfZeShpWrjb9YQ+bYvLxO1lsO5cbo3j0vFDV96KRmfrr5oNkDpyIMK83cjccvY6l6mrlrGNsEHQyrRAulBz5N73/tCHPWjxt9H/IfEy2W/njDoAw3rAqO3xaOOsTUQMgBDde1fz2tAhRf5eFiIczgCnys6W+anTJmSYEr+f+1rq4U1n7/B2d1aq6ZK9CQVmg3UH+Kwl0wJRIDuYfrMEdmggmpG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 AM0SPR01MB0026.eurprd08.prod.outlook.com (52.135.152.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 5 Dec 2019 08:35:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Thu, 5 Dec 2019
 08:35:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v5 5/5] drm/komeda: Update writeback signal for side_by_side
Thread-Topic: [PATCH v5 5/5] drm/komeda: Update writeback signal for
 side_by_side
Thread-Index: AQHVq0cF03eyLO6qo0idLgyeebDndg==
Date: Thu, 5 Dec 2019 08:35:59 +0000
Message-ID: <20191205083436.11060-6-james.qian.wang@arm.com>
References: <20191205083436.11060-1-james.qian.wang@arm.com>
In-Reply-To: <20191205083436.11060-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f656b3c-630d-40fa-6877-08d7795e2da9
X-MS-TrafficTypeDiagnostic: AM0SPR01MB0026:|AM0SPR01MB0026:|DB6PR08MB2790:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2790802966AFEDAF9DA9EBEDB35C0@DB6PR08MB2790.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(199004)(189003)(8676002)(5660300002)(71200400001)(71190400001)(7736002)(86362001)(305945005)(2906002)(316002)(36756003)(103116003)(50226002)(1076003)(81156014)(81166006)(6862004)(8936002)(55236004)(6636002)(4326008)(99286004)(186003)(478600001)(11346002)(2616005)(102836004)(26005)(25786009)(76176011)(52116002)(14454004)(6506007)(66446008)(6116002)(54906003)(66946007)(66476007)(66556008)(64756008)(3846002)(37006003)(6436002)(6486002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB0026;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mFS7CyQlowxH376tvEwyXToG/sUDqBhLVVEg25HPWHduhv6V5GfkxsCQzwNqYDKZ8izQ5bahJ3zwAH33G3LFt2plqXIV5Bt14YtF/Iwa9JkujJsqIwHcV2GOYRr/3jUdLUfE9QAw+/ULA67yyhC2BWTrFDm36qDRV4/ykhSSUAmu4qQGUu5stXwzE9t4I+jN48IeiXbzEtrCs1q0Bm8RQ5WxlacWdsowHJfzuflIi4u0QOXSniKm4nm8qdKnZNz2ME+Zdsjl8TgFiXYm+s+LJTe4vLsE6LoCyRh+5wcq7B0iQIxP3d8sSztkPyiE+kxFiIh21HWY8S2HjaKDCGciKN/KX7YSHF6EA8EG/pars3IumhZcuw0SqhQ8Js0GHIgrTFMwjYgBi8ilfo6bzn9A4DTLV5kXuB9Of1o+ra4MyX/hTOHjpZTMYfXx2KMj7NEO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB0026
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(8676002)(26005)(1076003)(102836004)(25786009)(76130400001)(6636002)(7736002)(4326008)(6506007)(22756006)(6512007)(305945005)(81166006)(54906003)(336012)(186003)(81156014)(23756003)(6862004)(76176011)(11346002)(86362001)(5660300002)(6486002)(50466002)(26826003)(3846002)(356004)(103116003)(99286004)(70206006)(37006003)(36756003)(478600001)(6116002)(316002)(70586007)(2616005)(8746002)(2906002)(50226002)(8936002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2790;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 22bd2655-0fcc-4004-114e-08d7795e2774
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TSsW0JOjfawm27kFDF9CL19A5PeqLa7JyhzjwcQN6BwiBWgBpFf2NPI12HgM47ub2cCtFNFJS+yn2hkQ+LiwAtMLrqtSF2iD3UsH2On1+1R7l6Irykq2cpKDSP9VTpTF9x5zf6H7Ecabq5DRyrSEhfh92H/Vs8p0eXReX6lOxYHThcItKZdubluW0Cabu5ReQcMhcQgk7EG7GVEKfX8LxssOV6GFZ5DbK3gJ3q6KJCtBwa85RZvQoGYQUXhZFjkzdD9K3kVN9qaOWDzRwW2A0Wkxypc5ivwlg5PEaS8AvQl5xsFToZgFWQtzj1wGYGNZNnWYae48oZbwkYxi4MjhHZiXtBDRYIdYXTJQ5tdBONVfYm34Z/Z8bL3DF856wBVztUPQi7fDvmhryVpLknEJ905qveXrsJb/z7Mb6r+/v2YFhU8gqVNjFNE4KEn3W7S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 08:36:09.5647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f656b3c-630d-40fa-6877-08d7795e2da9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=fvUaaP82b1BxI7e/YojWlAuAHflK3AHmHbQeWSP+T3AWLdN1kWGEuf6BJYzyg5atWGb2KxewJprku67Ggs9WaOY5vQ0GK8+nYoTvI3cQO8yO50tnptBW+NrNJZZ9J7U5jR3OCMpNEVZLEJ5k95vFx/4uAIdC1PtcEbKoRKnN7z0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=fvUaaP82b1BxI7e/YojWlAuAHflK3AHmHbQeWSP+T3AWLdN1kWGEuf6BJYzyg5atWGb2KxewJprku67Ggs9WaOY5vQ0GK8+nYoTvI3cQO8yO50tnptBW+NrNJZZ9J7U5jR3OCMpNEVZLEJ5k95vFx/4uAIdC1PtcEbKoRKnN7z0=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gc2lkZSBieSBzaWRlIG1vZGUsIGEgd3JpdGViYWNrIGpvYiBpcyBjb21wbGV0ZWQgYnkgdHdv
IHBpcGVsaW5lczogbGVmdApieSBtYXN0ZXIgYW5kIHJpZ2h0IGJ5IHNsYXZlLCB3ZSBuZWVkIHRv
IHdhaXQgYm90aCBwaXBlbGluZSBmaW5pc2hlZCAoRU9XKSwKdGhlbiBjYW4gc2lnbmFsIHRoZSB3
cml0ZWJhY2sgam9iIGNvbXBsZXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAg
IHwgIDUgKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMg
IHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Ny
dGMuYwppbmRleCAyNDkyOGI5MjJmYmQuLjc4MzUxYjcxMzVmOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMTkzLDI3ICsxOTMs
MjggQEAga29tZWRhX2NydGNfdW5wcmVwYXJlKHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpCiAJ
cmV0dXJuIGVycjsKIH0KIAotdm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtv
bWVkYV9jcnRjICAgKmtjcnRjLAordm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0
IGtvbWVkYV9jcnRjICprY3J0YywKIAkJCSAgICAgIHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRz
KQogewogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZrY3J0Yy0+YmFzZTsKKwlzdHJ1Y3Qga29t
ZWRhX3diX2Nvbm5lY3RvciAqd2JfY29ubiA9IGtjcnRjLT53Yl9jb25uOwogCXUzMiBldmVudHMg
PSBldnRzLT5waXBlc1trY3J0Yy0+bWFzdGVyLT5pZF07CiAKIAlpZiAoZXZlbnRzICYgS09NRURB
X0VWRU5UX1ZTWU5DKQogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKGNydGMpOwogCi0JaWYgKGV2
ZW50cyAmIEtPTUVEQV9FVkVOVF9FT1cpIHsKLQkJc3RydWN0IGtvbWVkYV93Yl9jb25uZWN0b3Ig
KndiX2Nvbm4gPSBrY3J0Yy0+d2JfY29ubjsKKwkvKiBoYW5kbGVzIHdyaXRlYmFjayBldmVudCAq
LworCWlmIChldmVudHMgJiBLT01FREFfRVZFTlRfRU9XKQorCQl3Yl9jb25uLT5jb21wbGV0ZV9w
aXBlcyB8PSBCSVQoa2NydGMtPm1hc3Rlci0+aWQpOwogCi0JCWlmICh3Yl9jb25uKQotCQkJZHJt
X3dyaXRlYmFja19zaWduYWxfY29tcGxldGlvbigmd2JfY29ubi0+YmFzZSwgMCk7Ci0JCWVsc2UK
LQkJCURSTV9XQVJOKCJDUlRDWyVkXTogRU9XIGhhcHBlbiBidXQgbm8gd2JfY29ubmVjdG9yLlxu
IiwKLQkJCQkgZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7CisJaWYgKGtjcnRjLT5zaWRl
X2J5X3NpZGUgJiYKKwkgICAgKGV2dHMtPnBpcGVzW2tjcnRjLT5zbGF2ZS0+aWRdICYgS09NRURB
X0VWRU5UX0VPVykpCisJCXdiX2Nvbm4tPmNvbXBsZXRlX3BpcGVzIHw9IEJJVChrY3J0Yy0+c2xh
dmUtPmlkKTsKKworCWlmICh3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9PSB3Yl9jb25uLT5jb21w
bGV0ZV9waXBlcykgeworCQl3Yl9jb25uLT5jb21wbGV0ZV9waXBlcyA9IDA7CisJCWRybV93cml0
ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oJndiX2Nvbm4tPmJhc2UsIDApOwogCX0KLQkvKiB3aWxs
IGhhbmRsZSBpdCB0b2dldGhlciB3aXRoIHRoZSB3cml0ZSBiYWNrIHN1cHBvcnQgKi8KLQlpZiAo
ZXZlbnRzICYgS09NRURBX0VWRU5UX0VPVykKLQkJRFJNX0RFQlVHKCJFT1cuXG4iKTsKIAogCWlm
IChldmVudHMgJiBLT01FREFfRVZFTlRfRkxJUCkgewogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRl
eCBhZTY2NTRmZTk1ZTIuLjE3NGZiMGEwYjQ5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTU4LDYgKzU4LDExIEBAIHN0cnVjdCBr
b21lZGFfd2JfY29ubmVjdG9yIHsKIAogCS8qKiBAd2JfbGF5ZXI6IHJlcHJlc2VudHMgYXNzb2Np
YXRlZCB3cml0ZWJhY2sgcGlwZWxpbmUgb2Yga29tZWRhICovCiAJc3RydWN0IGtvbWVkYV9sYXll
ciAqd2JfbGF5ZXI7CisKKwkvKiogQGV4cGVjdGVkX3BpcGVzOiBwaXBlbGluZXMgYXJlIHVzZWQg
Zm9yIHRoZSB3cml0ZWJhY2sgam9iICovCisJdTMyIGV4cGVjdGVkX3BpcGVzOworCS8qKiBAY29t
cGxldGVfcGlwZXM6IHBpcGVsaW5lcyB3aGljaCBoYXZlIGZpbmlzaGVkIHdyaXRlYmFjayAqLwor
CXUzMiBjb21wbGV0ZV9waXBlczsKIH07CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCA0NGU2
Mjg3NDc2NTQuLmQ2ODMzZWEzYjgyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTE1Nyw2ICsxNTcs
OSBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21z
X2RldiAqa21zLAogCQlyZXR1cm4gLUVOT01FTTsKIAogCWt3Yl9jb25uLT53Yl9sYXllciA9IGtj
cnRjLT5tYXN0ZXItPndiX2xheWVyOworCWt3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9IEJJVChr
Y3J0Yy0+bWFzdGVyLT5pZCk7CisJaWYgKGtjcnRjLT5zaWRlX2J5X3NpZGUpCisJCWt3Yl9jb25u
LT5leHBlY3RlZF9waXBlcyB8PSBCSVQoa2NydGMtPnNsYXZlLT5pZCk7CiAKIAl3Yl9jb25uID0g
Jmt3Yl9jb25uLT5iYXNlOwogCXdiX2Nvbm4tPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQo
ZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
