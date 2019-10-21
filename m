Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E5DE539
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA3F899F2;
	Mon, 21 Oct 2019 07:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F5A899F2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:23:37 +0000 (UTC)
Received: from VI1PR0802CA0046.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::32) by AM6PR08MB3605.eurprd08.prod.outlook.com
 (2603:10a6:20b:48::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Mon, 21 Oct
 2019 07:23:34 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR0802CA0046.outlook.office365.com
 (2603:10a6:800:a9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 07:23:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 21 Oct 2019 07:23:32 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Mon, 21 Oct 2019 07:23:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 770fbb7ace524f3e
X-CR-MTA-TID: 64aa7808
Received: from fae602638719.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9791980E-354E-46AC-846C-91DFE96FBF6F.1; 
 Mon, 21 Oct 2019 07:23:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fae602638719.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 21 Oct 2019 07:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQz6ScPRp49Sou41ysKSM5FvnXaCfEmsDYw6TzXqOKh9PyLXanuXW+IMvH/Fawo+c+GwsyYzKWTPYal/WxJFmJouYoytJkA9CfsfewZdDJWPof/K0eBtle2tBkHZ1gTWlo+avBPivEaH/0Y50nlJo5eSMoDVtGyrfTUroMe5A47XulR86ICmNk1VE+46XrAxSvgE1Z5DuR/EwxqFUmu6AddPBGVkZa2kULNthwgCfwKvqwtOrQFxX8cKJy79TkunwqczbNbJ5gr+W8yHlGm7/1QGgoHl62Wo+zOk3148ZTUMpIgMUOtldpaUMTKs4DAMM8rwHhGV9BNh32WLt+DLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=RytdKtUpRG+RmgqI6xuAKm27LOZ/YYETg82RtMZpej4Z7FcjAm+FwOkeWwTubDPDQd0YWZEnHULBqOjMewdG2AgO2J17jgXFla8P4PBxmwHVQBlJJAdRcbCLwFjscVySdzC19eTBeUYF0dski8slxePRdBo+HYggYwACS9W0FJvU0+XuJ/IM6M+PKiNkTohAkqH0PiSgzODA86F1D36tWXyOy/A5HaGVYNFLJqfINzjMT9uojh6Ig++mr3qb6KuY145SfMOaN3ZOwoZs+lz7GijSLyMpCH09V/npTKGm2lT2dlM7jCQTiCdAYwNOmOg4nC/lBpZVSOR/5Rxa13R1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4831.eurprd08.prod.outlook.com (10.255.115.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 07:23:21 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 07:23:21 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v6 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v6 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVh+BqsLSH/wZFl0yjO/mZcFyErw==
Date: Mon, 21 Oct 2019 07:23:20 +0000
Message-ID: <20191021072215.3993-4-james.qian.wang@arm.com>
References: <20191021072215.3993-1-james.qian.wang@arm.com>
In-Reply-To: <20191021072215.3993-1-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8fc5c24b-31e4-46b0-309d-08d755f79440
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4831:|VE1PR08MB4831:|AM6PR08MB3605:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36052510A8D286B92BED37BDB3690@AM6PR08MB3605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(199004)(189003)(110136005)(6506007)(6486002)(386003)(66066001)(4326008)(8676002)(66946007)(54906003)(99286004)(103116003)(36756003)(6512007)(6436002)(66446008)(64756008)(66556008)(66476007)(55236004)(2171002)(102836004)(2501003)(26005)(14454004)(186003)(81156014)(81166006)(2201001)(478600001)(11346002)(446003)(316002)(2906002)(7736002)(86362001)(71190400001)(71200400001)(256004)(6116002)(25786009)(305945005)(486006)(3846002)(76176011)(52116002)(5660300002)(8936002)(2616005)(476003)(1076003)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4831;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JYP/2F8ql3ReP+WqFtop8aEapL76Fmdpf8q9t7VZKb31uJGA8KDyL9KYIU2yLCi4b+ttkTNXXXPaXaSQV52siaOAuwbPtZ3Yf7AfU47ML91pNADPiqGeWDrwuZI0GerIDdxfVS6mZzwPsBkoANOETqP6UMhC2K+uV7cqFMoj2d4JsJj0EDMhkC+YUuImbJY2NP0jq8yuwdJxEGVQy9LkOPEc28PLDvWtzkp4fb6PQvlq+9tzunQmFSPd04P/x2fTwqupNU1EQpGaSXaxwY6x3/yI0niqbPAVcmguAe9jKiFiHf7c1ScEa2Q3gtKpJlIuQDiIaYzyW4+wXB4Qyw4EWRmQL2X/UThvwJ2pTBtvVlSuWbwDAuG2KK4dv5pWL/1tfz8U58B4OQ1gaWv29Kth5u+xCtLPb2v2cffG1VtscU4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4831
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39850400004)(346002)(199004)(189003)(6116002)(76130400001)(110136005)(3846002)(99286004)(476003)(6486002)(47776003)(63350400001)(486006)(126002)(50226002)(305945005)(6512007)(22756006)(11346002)(8936002)(2906002)(8746002)(5660300002)(446003)(1076003)(7736002)(8676002)(50466002)(86362001)(2616005)(81166006)(66066001)(81156014)(186003)(2201001)(36906005)(70586007)(316002)(2171002)(6506007)(336012)(2501003)(36756003)(4326008)(103116003)(70206006)(386003)(25786009)(14454004)(54906003)(478600001)(26826003)(356004)(26005)(23756003)(76176011)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3605;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a8de9c36-8413-4d50-57c1-08d755f78cde
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nizm30HN7/VQcEDBMUnJ8HZegHfIyZE0TccD7ivKWQ5KYMwwtj3FC8XUGziEIAhjmmW2N3jWCny/Bo/SgDVKPDagFsNf5Q+Ek7rG0l+AEnnnUnsVpAz2lEaB1/qaPb8LfkkrTuIQOhKPkWW+pzR0GwZiD+DW9xcUa9LR8PhcN2Q/+3dR6JinXuuUMLeoKTkTVpOR01GcoF57N/f8hJCTteWgbtKrM9Qdwk9d/P5fShSIshGDnfU2Fqq9/QT8ipw2Ii2c6C8qPhdCxX6w8PRehhHHUmtMfKGo/m1zIke9I4dTpud7EC/5Jv0xvkPEtrIr8+dcLPER+kXXoArhdRlo9egvV+GTq4qgP/qRzDcv2Ibtoi07H+aWtK9IEWyb8KhG813Ofqn38OuOMg4Nfxb3+glBD0Rl4mRvgc5KwO+Xd2pA5Bivhl1nh4HWLzPA+Wai
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 07:23:32.8141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc5c24b-31e4-46b0-309d-08d755f79440
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3605
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=T1NX/4te0E46cFTcYzomNTVVtxWriVcYq2fOLauQ4Pv6BDfm1QW8lxm03b/NW1U5eIMZBYTans/PQHzziVjRb07lssV5lVqZPJs7qRBFH6cAENTEYhFRHdl1qnbZXdG6fRIbgMMIOFy5e0TsboH3HVf6sh9WoV/wN5Tm8PqmU2s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=T1NX/4te0E46cFTcYzomNTVVtxWriVcYq2fOLauQ4Pv6BDfm1QW8lxm03b/NW1U5eIMZBYTans/PQHzziVjRb07lssV5lVqZPJs7qRBFH6cAENTEYhFRHdl1qnbZXdG6fRIbgMMIOFy5e0TsboH3HVf6sh9WoV/wN5Tm8PqmU2s=
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
