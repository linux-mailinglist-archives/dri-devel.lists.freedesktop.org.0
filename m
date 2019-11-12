Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E824DF8DAC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B516EB0D;
	Tue, 12 Nov 2019 11:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20081.outbound.protection.outlook.com [40.107.2.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0986EB12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:10:36 +0000 (UTC)
Received: from VI1PR08CA0131.eurprd08.prod.outlook.com (2603:10a6:800:d4::33)
 by HE1PR08MB2698.eurprd08.prod.outlook.com (2603:10a6:7:34::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Tue, 12 Nov
 2019 11:10:31 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR08CA0131.outlook.office365.com
 (2603:10a6:800:d4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Tue, 12 Nov 2019 11:10:31 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 11:10:30 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 12 Nov 2019 11:10:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 027fd423d32f3d12
X-CR-MTA-TID: 64aa7808
Received: from ce5f38f6e7fd.2 (cr-mta-lb-1.cr-mta-net [104.47.4.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8501F687-5FC8-47C7-A37C-12BEA18BA52A.1; 
 Tue, 12 Nov 2019 11:10:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce5f38f6e7fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 11:10:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOTYJxHtNEpwd83fJdyDyzwRCL5q1RDb7OCtxvsJCFBhqv27GIFv5IcZcKlniNmu3+aIA3/cprLp1B2RcgUmQ7+Fq9QMgDUIREK9rcdpusWY/Z6nl12U2Z9o2LPWDTDqdNT494ZCn33hJQiPYNtCzcaXwB6GI1VGGibQY/aiKfO2//ZnCfHRp2a7q6pXtzfPa+uAcYutugQdmmcP0D8NehTyg/YlfTyNjUu2E4Ioq6APoXX5vAVM+6ALAwgZxyj2QCUbtgAFVLpv3KhtvPpVavTqL3jKxCQcmUJUKixiDQFyKUgOzAyqrh+66FjjNyTyzZ9WDoanO6i/O6aL+hxd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=LGQfxE9Lk28dFr/MvuBomSM8MqYAeN29QgcjW5SyQ3JrfW2CbCvs5qdiLpcBQywr6H0kHTW5D6PE8w5W2de0f9Z707r3X6sLNRFi9UmI6wHII2Tow5hC9hrbxEgw2JLCoeBPH5ux9dNuAGUsIzA9wD7Z2AjCb1Q/dV4tRZA5PPoaD3RUhZIAe552fDbzdpn4J2guBPvCRFbiIggq6GYr5FMJ2kEANhjk3VoqRFI0BPjPQzgBAfrYMpucFVBvNKBarsi5cfRFRbwCCXC48bb8iohdOJrS+8HnaxJImYvrHWaEFXtLzRBrlsBtOsUpCSCyGdqtOG8rT2s4aqvRii28bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB3636.eurprd08.prod.outlook.com (20.177.43.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 11:10:18 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:10:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v10 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v10 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVmUnEN7Mkw/Fd7UqlRzpEzWbLAw==
Date: Tue, 12 Nov 2019 11:10:18 +0000
Message-ID: <20191112110927.20931-4-james.qian.wang@arm.com>
References: <20191112110927.20931-1-james.qian.wang@arm.com>
In-Reply-To: <20191112110927.20931-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d8ac2f0-5991-4108-3e1b-08d76760ee42
X-MS-TrafficTypeDiagnostic: AM0PR08MB3636:|AM0PR08MB3636:|HE1PR08MB2698:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR08MB26986BFC4FBAA54C56795D5FB3770@HE1PR08MB2698.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(2906002)(99286004)(446003)(2616005)(476003)(7736002)(66066001)(6512007)(6436002)(6486002)(11346002)(54906003)(256004)(305945005)(103116003)(110136005)(316002)(2201001)(14454004)(6116002)(2501003)(86362001)(3846002)(486006)(71200400001)(71190400001)(186003)(386003)(36756003)(1076003)(6506007)(5660300002)(81166006)(8676002)(4326008)(50226002)(26005)(76176011)(66946007)(2171002)(52116002)(81156014)(66446008)(102836004)(66476007)(64756008)(8936002)(66556008)(25786009)(55236004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3636;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v6S7xoxEQ6a4ktTxsZZslhXSYoGeQFJLRixLZSXbgYToQTolzVKSVn6CNY3QKzFEgTnXvpqyvr4IEG41DgqcfvpcSk7qH3uRH1DzWPXhZPf/yHI6kMCXENbHL2a65OkclUHiHvSLi+KapOGbfCyjS9nl3FzKIU8DDLN1I4nyy9X3UNzrs5ZTcbLJb0TG7virp1Kj7uckyNANTyAntTzBx7MZ/u2v9Y+JCSaeyix+OHcE22OqDBPxpAeXvAgvA4XUxchw8TIHVDfClm8bRgZb491/Bg2+r2cEFEya6kzvsFSCXthK3UIkCpn8PsUFl6AkgdrUvWXNswtUenDbFzo45p7Vr/aaM+ntDD0eQgDG+aM68cG8katPic6RyGtD801n99GrTNUXF9Grwpu3ZiNWT8q314W9IMiyqMZ2FWS33fHAiGmPIwGjRh6vSbrDR3sf
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(1110001)(339900001)(199004)(189003)(3846002)(86362001)(6116002)(22756006)(4326008)(66066001)(70586007)(70206006)(1076003)(5660300002)(478600001)(2171002)(7736002)(26826003)(50466002)(316002)(47776003)(76130400001)(305945005)(2201001)(6486002)(25786009)(356004)(336012)(99286004)(110136005)(102836004)(2906002)(486006)(6506007)(386003)(6512007)(126002)(11346002)(50226002)(23756003)(105606002)(76176011)(14454004)(2501003)(8746002)(103116003)(186003)(8676002)(81156014)(54906003)(81166006)(36756003)(2616005)(8936002)(26005)(446003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR08MB2698;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 305e0879-1316-4f33-2c7b-08d76760e6c4
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buMSyz7TNLjoeXYluCTrcAIcP69/ALh9lIRQapr1XV8aYY+mtEYdMEpZo+kCrXINugeRSPb/bkX5vPEDLtRPBExxhlJaKw8S0nT6t5N39FefRdUC4CNONkvq3mCX9W/l0AywF3FN53VOMyelSjS5dyoaAGdf5n5KgqnFTLGPjqIJx3rcCEmuZQk1+DRJyDPRTRgAJ/azjcSsW45yaLDUFDvALxQYcxPCVBzuuVH7m9R/zhuUDVIUaLOwx6/V48XowYiVyhgWdsvaWWGDIiET+3L0L0l+WRG3FNwyY2UYZwad13Bbxc0WicROOnuImvEBaI6iis9XRAdGo0ltuuqydqlWURDcMfBMvCkvYTjHxBcpzRPTdlyyrv6X1iXVO1f1xnmvhSqrtwFgL7QAkXSjrenn7W7aRBUOq/PA2KlVE8mwPAnMzFsf3vLbi7Ta/U2b
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:10:30.6913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8ac2f0-5991-4108-3e1b-08d76760ee42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=h8GeG11ulgLAUBiVbkVEaFhHzw1PMP086RvWRq5WnCtcbvF1HyhTGW6qWm30dBcYIMfJAdiwy8ZU1z385UNJnO9Lc0YswqeGYv10hWovJ9BWifYc92fXUj8op9uKb3SUFI3vukdWNeeRMVKnKkGZNXQ9OlWfV2vUnvEGc/Mu/qE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=h8GeG11ulgLAUBiVbkVEaFhHzw1PMP086RvWRq5WnCtcbvF1HyhTGW6qWm30dBcYIMfJAdiwy8ZU1z385UNJnO9Lc0YswqeGYv10hWovJ9BWifYc92fXUj8op9uKb3SUFI3vukdWNeeRMVKnKkGZNXQ9OlWfV2vUnvEGc/Mu/qE=
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
