Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F02CBD59
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063396EBBA;
	Fri,  4 Oct 2019 14:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535526EBB9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:34:53 +0000 (UTC)
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by DBBPR08MB4476.eurprd08.prod.outlook.com (2603:10a6:10:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 14:34:43 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Fri, 4 Oct 2019 14:34:43 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 4 Oct 2019 14:34:42 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 04 Oct 2019 14:34:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b281391d09dab027
X-CR-MTA-TID: 64aa7808
Received: from 1341f0c0c52e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC9F5286-A553-4FC7-91D5-BBE4AEBCD382.1; 
 Fri, 04 Oct 2019 14:34:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1341f0c0c52e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Oct 2019 14:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkwIv6pgI4SC2keqCO67pTpAokzQsdB4r/Ti4I5rWxfLSJthWRTHKMjHrFp10HCuNE93MFCeagUcLlBBq44kCe3H/btTR5MtereZ6A6fXLsOC5vEDT8++hkAhxUMeQ/I4KFClKR5VeVFboYhJlC8UNeERQ6zeJRpnVJntJvBaXmWLj75Gxr0aTNOJ93nLykyb4B4dDne2CirCrmlD9ash1aJQIjNvf5Hk7J7h5f1mlgXnkLTDdPKFT77cRjO6upDi/sbAbAaSnspR2E+Lw9AL8TGDyRSRt4ZQJgH6grphYP9NEkXM5PR4R/bQ5jCdoAH9fcYZWWgk2TSwmnLBaWIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQr2G/Kqwc17l+b9AgiMhs9TFIDdPxarqe0SC9pnd0o=;
 b=eKob8wTEt92Rpg8u1dSOvsFyI4eLyPD48z05FucBhzuYtBm/H4xqYdoOXkyZzKck7+vr+RcL5E1s8WA4cGIR+ivkN6iYQrl614iRKZrBX1OJrd3LBs0OLr/yHmcnFIq6W1gddsoXsNBwzVa3lZAKMc2E8zkcf3KmhazWEOcb1DZhuKEwGgjGTaqUjx2spaubnZFUI1QeHX6CrK+mHJhb2l7MgKjSS9UhbbAg1/C/6QkZNmFCPtPnbDecEF6MC+4BXZcR1ylr40AR38kUzUVvRNi5ySS0QtRFF82QOBsxrV5Lc9sMOas4+rD7R5QHAk04aEkIEBtuhYP1oteIruDLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4288.eurprd08.prod.outlook.com (20.179.25.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:34:34 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:34:34 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/komeda: Support for drm_bridge endpoints
Thread-Topic: [PATCH 0/3] drm/komeda: Support for drm_bridge endpoints
Thread-Index: AQHVesDXsGC2pRfd7UunGC+bnCP1Fg==
Date: Fri, 4 Oct 2019 14:34:34 +0000
Message-ID: <20191004143418.53039-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 557c37d5-6cf9-4c26-9ac5-08d748d7fea9
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4288:|VI1PR08MB4288:|DBBPR08MB4476:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB44765831D9E93D2CB6D242EB8F9E0@DBBPR08MB4476.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 018093A9B5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(199004)(189003)(1076003)(66066001)(14454004)(66556008)(102836004)(2906002)(966005)(5660300002)(478600001)(36756003)(26005)(50226002)(3846002)(2501003)(6116002)(66446008)(386003)(186003)(64756008)(6506007)(66476007)(8936002)(66946007)(14444005)(2616005)(4326008)(256004)(44832011)(6306002)(81166006)(6512007)(99286004)(486006)(6436002)(5640700003)(8676002)(6486002)(86362001)(25786009)(71190400001)(476003)(6916009)(7736002)(305945005)(71200400001)(2351001)(54906003)(316002)(52116002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4288;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MD+cO4484pqWb8wKXKtEuZSsIbsdYtxs0PBTmhnbFDknWPxOGVyp1ePH+ff+D35UDcE8YqXbVdnCjv34CuF7gJcoNG9yEzrfqpkHokODcWguOlgrqv7xfF8a4SQcL0IQ7oZxdj7xkoFxTROHtNHfM0ikEvzerf7nfW/gmvDCTAvTDdpxohq05QxKDNBnP5jKaEl3LXmgbneRq7oqU33ppjAI7i3OS8lp3hUtBCJpOu1ymGbeIf9o0DJaxPMHMIzf+RHXhXScWT3UFKa1ZNhYJrIDdPqphoDl9NNfViu2pll3L7PMEsyDpxGoOdEXH4skQ4GaLM4YvYSx+2FLU4psAPVvprYOrKAV0ClIpNKwfQoLswux383QRcXJplb75yabeTyyWsGh09UFD063eDF32R53H2gsL9t29yo1yOxj0sHtu91MD2/CEoB0nSLkv/aL6X/ymFsRAKEsf7yTfrlUkg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4288
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(1076003)(54906003)(66066001)(5640700003)(50466002)(2906002)(8676002)(47776003)(126002)(476003)(486006)(63350400001)(5660300002)(102836004)(26005)(6306002)(22756006)(3846002)(6916009)(6512007)(6116002)(2616005)(186003)(36906005)(6486002)(6506007)(386003)(316002)(336012)(4326008)(86362001)(966005)(26826003)(70586007)(36756003)(2351001)(70206006)(76130400001)(2501003)(14454004)(107886003)(478600001)(8936002)(7736002)(356004)(305945005)(14444005)(50226002)(25786009)(99286004)(81156014)(81166006)(23756003)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4476;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9bab6445-39fb-46db-6fa4-08d748d7f9db
NoDisclaimer: True
X-Forefront-PRVS: 018093A9B5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90YnMOs9kpAKwJM0obojJ48j2X/9elYcDrpPXSP2W9faubbfsuQHmz23LWG1kMBdbumGJBkzad40HBY3xb7gIBJ06+lT4z8eiSA/rVLR4HsPf7BTH+02SZjfLO5PxSEr063TVc3bZmg/iIPeFfVf4JVYOViBeFd/6jjTuNEh1bR1CmpWvxKIkn+6sAtEvvjxYLJLO2mO5whItDue58sVXH7aLFQNSy0WZjPvXrgr6wIIgBRE2vW3MURnIkv1KsgcAd9NnLoZfbR1b+CP8MIDPUarJ7BnhVNOuiQMKpLm53g/FQXtXj31RdrVdppZ+g6WWXwGgmYFF+u9xKMapt+h77rUwAytpWNOHOHfuvCCwOt3DGg8vtP2SwAlfMRlUBLN7kd9IvdfWApZKPOxZqJoylHJvgJkGyv8jITuXf4n7tFGNC0vQLlBSl7R3ABWAJFIhHja6tTjRLpAVY1FCmh96g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 14:34:42.2670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557c37d5-6cf9-4c26-9ac5-08d748d7fea9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQr2G/Kqwc17l+b9AgiMhs9TFIDdPxarqe0SC9pnd0o=;
 b=L/c4FkarPoBRW8CWg/8+oGLszDUMbULNJJN4psgAUZ/nArmV5vFQQdEhvE50JsQzJ17IdM9ay7+fTA7/Ocsz6mUMtD6npwgLMwB4l6zPV1cfnzf1Mb+7KO+tA2rjC6dZj9qW7IYwf/gA2WpxlPKg/tzP40zrfY+NUoIDBCXch2E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQr2G/Kqwc17l+b9AgiMhs9TFIDdPxarqe0SC9pnd0o=;
 b=L/c4FkarPoBRW8CWg/8+oGLszDUMbULNJJN4psgAUZ/nArmV5vFQQdEhvE50JsQzJ17IdM9ay7+fTA7/Ocsz6mUMtD6npwgLMwB4l6zPV1cfnzf1Mb+7KO+tA2rjC6dZj9qW7IYwf/gA2WpxlPKg/tzP40zrfY+NUoIDBCXch2E=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R3JlZXRpbmdzLAoKVGhpcyBzZXJpZXMgYXR0ZW1wdHMgdG8gYWRkIHN1cHBvcnQgZm9yIGVuZHBv
aW50cyAoaW4gdGhlIERUIHNlbnNlKQp3aG9zZSBkcml2ZXJzIG9ubHkgaGF2ZSBhIGRybV9icmlk
Z2UgaW50ZXJmYWNlLCB1bmxpa2UgdGhlIHRkYTk5OHgsCndoaWNoIHVzZXMgdGhlIGNvbXBvbmVu
dCBmcmFtZXdvcmsgYW5kIHByb3ZpZGVzIGFsbCBvZiBkcm1fZW5jb2RlciwKZHJtX2JyaWRnZSwg
ZHJtX2Nvbm5lY3Rvci4KCjEgJiAyIHNob3VsZCBiZSBmYWlybHkgbm9uLWNvbnRlbnRpb3VzLCBh
bmQgSSBiZWxpZXZlIGFyZSB2YWx1YWJsZQplbm91Z2ggb24gdGhlaXIgb3duIGFzIHRoZXkgcmVt
b3ZlIHNvbWUgcG9pbnRlciBjaGFzaW5nIGFuZCBhIGZldwphbGxvY2F0aW9ucyBhdCB0aGUgdG9w
IGxldmVsIG9mIGtvbWVkYS4KCjMgaXMgdGhlIG1lYXQgb2YgdGhpcyBzZXJpZXMsIHdoZXJlIEkg
YWRkIHRoZSBkcm1fYnJpZGdlIGVuZHBvaW50IGNvZGUuClRoaXMgd2FzIHRlc3RlZCB3aXRoIHRp
X3RmcDQxMCBvbiB0aGUgYmFjayBlbmQgb2YgYSBENzEuIEkndmUgdGFnZ2VkIGl0CndpdGggYW4g
UkZDIHNpbmNlIEkgZHJldyBpbnNwaXJhdGlvbiBmcm9tIHRpbGNkYywgd2hpY2ggZG9lcyBzaW1p
bGFyCnNoZW5hbmlnYW5zIHRvIGRldGVjdCB0ZGE5OTh4IHZzIG5vbi10ZGE5OTh4LCBhbmQgaXMg
aGVuY2UgYSBwcmVjZWRlbnQKZm9yIGluY2x1ZGluZyBzaW1pbGFyIGhhbmRsaW5nLCBidXQgSSB3
YXNuJ3Qgc3VyZSBpZiB0aGVyZSdzIGEgbW9yZSB3ZWxsCmVzdGFibGlzaGVkIHBhdHRlcm4uCgpO
b3RlIHRoYXQgSSBvcHRlZCBub3QgdG8gcmVtb3ZlIHRoZSBwcmV2aW91cyB3YXkgb2YgZG9pbmcg
dGhpbmdzIGZvcgp0ZGE5OTh4LCBldmVuIHRob3VnaCBpdCBjb3VsZCB3b3JrIHdpdGggdGhlIGRy
bV9icmlkZ2UgaGFuZGxpbmcKZGlyZWN0bHksIHNpbmNlIEFGQUlVSSwgZGV2aWNlIGxpbmtzIGhh
dmVuJ3QgYmVlbiBpbXBsZW1lbnRlZCBmb3IKZHJtX2JyaWRnZSAoc2VlIFsxXSBmb3IgYW4gYXR0
ZW1wdCBhdCBkb2luZyB0aGF0IHRoYXQgbmV2ZXIgbGFuZGVkLCBhbmQKSSdtIG5vdCBhd2FyZSBv
ZiBhbnkgcmVmY291bnRpbmcgaGF2aW5nIGJlZW4gYWRkZWQgc2luY2UpLCBhbmQgdGhlcmVmb3Jl
CmdldHRpbmcgYSBkcm1fYnJpZGdlIGRyaXZlciBybW1vZCdlZCB3aGlsZSBpbiB1c2Ugd291bGQg
YmUgQmFkKHRtKS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgwNDI2MjIz
MTM5LjE2NzQwLTEtcGVkYUBheGVudGlhLnNlLwoKQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRh
dUBhcm0uY29tPgpDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgpDYzog
SmFtZXMgKFFpYW4pIFdhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgoKCk1paGFpbCBBdGFuYXNzb3YgKDMpOgogIGRybS9rb21lZGE6IENv
bnNvbGlkYXRlIHN0cnVjdCBrb21lZGFfZHJ2IGFsbG9jYXRpb25zCiAgZHJtL2tvbWVkYTogTWVt
b3J5IG1hbmFnZSBzdHJ1Y3Qga29tZWRhX2RydiBpbiBwcm9iZS9yZW1vdmUKICBkcm0va29tZWRh
OiBBbGxvdyBub24tY29tcG9uZW50IGRybV9icmlkZ2Ugb25seSBlbmRwb2ludHMKCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAgfCAgMjEgKy0tCiAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAgIDkgKy0KIC4uLi9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8IDExOCArKysrKysrKy0tLS0t
CiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAxNTkgKysr
KysrKysrKysrKysrKy0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5oICAgfCAgIDkgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMjQzIGluc2VydGlvbnMoKyksIDczIGRl
bGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
