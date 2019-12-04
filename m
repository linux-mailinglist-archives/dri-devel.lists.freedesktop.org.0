Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4161112A9D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3390E6F4F8;
	Wed,  4 Dec 2019 11:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4886E8DE;
 Wed,  4 Dec 2019 11:48:37 +0000 (UTC)
Received: from VI1PR0802CA0035.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::21) by AM0PR08MB3011.eurprd08.prod.outlook.com
 (2603:10a6:208:64::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 4 Dec
 2019 11:48:35 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR0802CA0035.outlook.office365.com
 (2603:10a6:800:a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:35 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received: ("Tessian outbound 224ffa173bf0:v37");
 Wed, 04 Dec 2019 11:48:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5acb59b5d3ab0914
X-CR-MTA-TID: 64aa7808
Received: from 27b0b5ea6d36.8
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BCBC33A-A306-46EF-AA00-F67C455BA3BB.1; 
 Wed, 04 Dec 2019 11:48:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27b0b5ea6d36.8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSyJIHM/g84h9uPKgoy4iCKjJx+I+PniyVmIpWES8rEXFfUOJswmIxH4wGhu/kjk+2IrWRag/FGcTPhRGLUP37meYRfjwui4jVrSpSumxAE5biVVnCXzZZrXjMSubeqQHAL/CCu0uMuLPbwNVvm+Qxjg612EJJaASpsg+0B6HpZffGbAxmsD7fENPKZaHJKOiaEvF8JSSxiotV/CmBgTmiQVy97akKjGpY+jUMg3zkTtxxNOf29r/m9EvOSTCusn5vSMsbou6yddw0OV8VrVVmVmx6Q4VoDVdWT9rYf5Kom83qYiALMw2p/OkMll5dB3O0ks26s4NEiGwpgyfRMnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=ca6vJvTuQ9ICiri/nSY8O8EGGWMtsR4zfIf/bWkAfwqe2wpgLNGk0709jRdwXl5ch/ssm5BQxo4vSM20JYTXcvmkxpSRVLRghWiXpUQQqrywxvpSsizW5YSbrlNMsm0RVhtOjlfPvZWxjoMzAROWjNuAoAXbNHTui+4HSZTz84n+//TvNJIy+NxcsDd70L6wHKhUW8i0UFEUN8OEU+uqzE0zgqKk1rZnNUmKhimT6Et3znlfU1XRLDjFRzxPaOBRqp9ak0R+9/OUa34nGNEX1OW9Korvt3KiS/Tp7yMM3cqoyECuLMcGs7paJ0rbbdDBmy8k/rRx86cyVhmBhEkOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:26 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 28/28] drm/msm: Use drm_bridge_init()
Thread-Topic: [PATCH v2 28/28] drm/msm: Use drm_bridge_init()
Thread-Index: AQHVqpi8TVGRoIDoh0OFCoA0pbs6IA==
Date: Wed, 4 Dec 2019 11:48:25 +0000
Message-ID: <20191204114732.28514-29-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b42bf3d-c42b-4fe9-3cb7-08d778afe4c7
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|AM0PR08MB3011:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3011E1DB81116BC41AC09C4F8F5D0@AM0PR08MB3011.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(5024004)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4624;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Lez9SUM230WUagT5ubKBLA86pC51KWmbiO8LPtuTEmv3r1p+zwBFKqEh6p0eFOoF+lZ0DQ1a1gryVTSfUUSRCGH9kDuq7BOP+1VygsvpwJo5CAAFeO77n2JOrsG3MzdM7+C5RMEWGxyEWDOUbN1y4rAO5BEHlU8wAtzTooWWwSAMefzZv3FiJiqYHlwSS7mvqg70kj9t0hnRe17W5ONZiAagrwePC8oWdHkb4E6aKEZ4uIAkj18A2eKGF7Htkvfr38aGC4+YSQ8QzYRdJFrizZ5GoAiPnS5RUlwncuFunW/jFvLENsF6ojXPVlBtawPJHexNGCx/qn59T+2o3CQY1S0kdbde1q1Gc690zxg06v3E2i8OMhQinD8EGLmw+3F1sSr9t5GrQFNzfIj3XaUwWyFje1+lyKBhzkSSRVWO2VOLFxUaonJU3UjU+IdwaSkQ
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(199004)(189003)(5640700003)(8936002)(86362001)(2501003)(11346002)(50226002)(2616005)(3846002)(478600001)(26826003)(2351001)(26005)(99286004)(6116002)(76176011)(8746002)(102836004)(23756003)(5024004)(4326008)(107886003)(6486002)(25786009)(6916009)(6506007)(450100002)(6512007)(8676002)(336012)(7736002)(50466002)(2906002)(305945005)(81166006)(81156014)(186003)(5660300002)(316002)(54906003)(14454004)(22756006)(1076003)(70206006)(36756003)(356004)(70586007)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3011;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ea17270-feb6-4e97-0518-08d778afdf5f
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SIYgVSteyI1CyBn7K+8FnypZ1ZfE676QInRO7uboPZDB59NaJ/IucZCxkaPJ+IhYS2eTRXy2lY8F2fyDQ9ajdnA8Q/geCWlJ57L8eQKQeD547JOiAeBbIh5tY/TjhtMAbWfcnzGHbkvflYR+2tTZUxvCAmV+hz07bnFx+SB4YUmJTYA2aaAnyuSLNMUksTEHTJ/jYJGOTShBGZLDjIWDeZnrBZjmgGPYxgZ+qYFNfjsu2qYIagltFcgfqlVQchWE8BsGjPXIR9T1QS2CkyHup3Int/Eo9VmrvMofujvew6q4BPPCw9x+CppJzOH4N2svPexQoP4CL/zn8PESDr6hVZL3bc8+wd82tK6gkgFeZSv1P13dU+NMlYgqKtFcT3PnvvJNks3S69h4NUVoI3n1xe/a9xqZkTs6e+mFAKNgsLzQ6+VaR3nqaEWPOvfi1b6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:34.8266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b42bf3d-c42b-4fe9-3cb7-08d778afe4c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3011
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=B1rYgWszkhTJjE2gQVMKWzmn92fQEwWvRD1DPY+MgW2JQtmlzLrfK5gvjfsyjmXbZOhzxj679psQl2UQw0Qt72+Xra1kXFBfVIyR1eDh+u3yuTnC/QZQfdvPdB2GQiNWJIFABbO9qQYRral+z2HANrQoQVH9kOMvVe1Y8THzYKU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxo3+RzQSfhOefcNBomfpRFJ4IJWVvT6Vr/vLAaxzWU=;
 b=B1rYgWszkhTJjE2gQVMKWzmn92fQEwWvRD1DPY+MgW2JQtmlzLrfK5gvjfsyjmXbZOhzxj679psQl2UQw0Qt72+Xra1kXFBfVIyR1eDh+u3yuTnC/QZQfdvPdB2GQiNWJIFABbO9qQYRral+z2HANrQoQVH9kOMvVe1Y8THzYKU=
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
Cc: "open list:DRM DRIVER
 FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2U6IGRybV9icmlkZ2VfaW5pdCgpIHNldHMgYnJpZGdlLT5vZl9u
b2RlLCBidXQgdGhhdCdzCm5vdCB1c2VkIGJ5IG1zbSBhbnl3aGVyZSwgYW5kIHRoZSBicmlkZ2Vz
IGFyZW4ndCBwdWJsaXNoZWQgd2l0aApkcm1fYnJpZGdlX2FkZCgpIGZvciBpdCB0byBtYXR0ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYyAgfCA0ICsrLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcF9icmlkZ2UuYyAgIHwgMyArLS0KIGRyaXZlcnMv
Z3B1L2RybS9tc20vaGRtaS9oZG1pX2JyaWRnZS5jIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNp
X21hbmFnZXIuYwppbmRleCAyNzFhYTdiYmNhOTIuLmJhNTQwNDlhNjMzOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCkBAIC02NjIsOCArNjYyLDggQEAgc3RydWN0IGRybV9i
cmlkZ2UgKm1zbV9kc2lfbWFuYWdlcl9icmlkZ2VfaW5pdCh1OCBpZCkKIAllbmNvZGVyID0gbXNt
X2RzaS0+ZW5jb2RlcjsKIAogCWJyaWRnZSA9ICZkc2lfYnJpZGdlLT5iYXNlOwotCWJyaWRnZS0+
ZnVuY3MgPSAmZHNpX21ncl9icmlkZ2VfZnVuY3M7Ci0KKwlkcm1fYnJpZGdlX2luaXQoYnJpZGdl
LCBtc21fZHNpLT5kZXYtPmRldiwgJmRzaV9tZ3JfYnJpZGdlX2Z1bmNzLAorCQkJTlVMTCwgTlVM
TCk7CiAJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKIAlp
ZiAocmV0KQogCQlnb3RvIGZhaWw7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Vk
cC9lZHBfYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHBfYnJpZGdlLmMKaW5k
ZXggMjk1MGJiYTRhY2E5Li41M2Q0ZGM1OTFiZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZWRwL2VkcF9icmlkZ2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHBf
YnJpZGdlLmMKQEAgLTg5LDggKzg5LDcgQEAgc3RydWN0IGRybV9icmlkZ2UgKm1zbV9lZHBfYnJp
ZGdlX2luaXQoc3RydWN0IG1zbV9lZHAgKmVkcCkKIAllZHBfYnJpZGdlLT5lZHAgPSBlZHA7CiAK
IAlicmlkZ2UgPSAmZWRwX2JyaWRnZS0+YmFzZTsKLQlicmlkZ2UtPmZ1bmNzID0gJmVkcF9icmlk
Z2VfZnVuY3M7Ci0KKwlkcm1fYnJpZGdlX2luaXQoYnJpZGdlLCBlZHAtPmRldi0+ZGV2LCAmZWRw
X2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZWRw
LT5lbmNvZGVyLCBicmlkZ2UsIE5VTEwpOwogCWlmIChyZXQpCiAJCWdvdG8gZmFpbDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2JyaWRnZS5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9oZG1pL2hkbWlfYnJpZGdlLmMKaW5kZXggYmE4MTMzOGE5YmY4Li5kMDM4NTk5
Mjc5YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2JyaWRnZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2JyaWRnZS5jCkBAIC0yODUsOCAr
Mjg1LDggQEAgc3RydWN0IGRybV9icmlkZ2UgKm1zbV9oZG1pX2JyaWRnZV9pbml0KHN0cnVjdCBo
ZG1pICpoZG1pKQogCWhkbWlfYnJpZGdlLT5oZG1pID0gaGRtaTsKIAogCWJyaWRnZSA9ICZoZG1p
X2JyaWRnZS0+YmFzZTsKLQlicmlkZ2UtPmZ1bmNzID0gJm1zbV9oZG1pX2JyaWRnZV9mdW5jczsK
LQorCWRybV9icmlkZ2VfaW5pdChicmlkZ2UsIGhkbWktPmRldi0+ZGV2LCAmbXNtX2hkbWlfYnJp
ZGdlX2Z1bmNzLAorCQkJTlVMTCwgTlVMTCk7CiAJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goaGRt
aS0+ZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKIAlpZiAocmV0KQogCQlnb3RvIGZhaWw7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
