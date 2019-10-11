Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB15D38C3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B506EA2E;
	Fri, 11 Oct 2019 05:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492096E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:43:39 +0000 (UTC)
Received: from AM4PR08CA0067.eurprd08.prod.outlook.com (2603:10a6:205:2::38)
 by AM0PR08MB4194.eurprd08.prod.outlook.com (2603:10a6:208:130::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Fri, 11 Oct
 2019 05:43:35 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::208) by AM4PR08CA0067.outlook.office365.com
 (2603:10a6:205:2::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:43:35 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:43:33 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Fri, 11 Oct 2019 05:43:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0408181c2184aa88
X-CR-MTA-TID: 64aa7808
Received: from def52121f048.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3536CFD4-E67A-4F19-802B-2882B752D560.1; 
 Fri, 11 Oct 2019 05:43:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id def52121f048.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIX8KfvK1PC9Hjxr4VOhiihXXqOGTL4eZ0GnjphyqTjA+zRTNLX1cQS/mWrRi8dYkCVVnV4zcCRGbCqiPvowKFGwGD0Xj/hBYDZ0nszkDyEodEbd7moob8vv7klrqKC8vGi3u9pNmhWHPb7++b57LT8r26HmNFTH+1WO1s5eA97ppj9Duu8mPsymQ+sZdZGQJB5DwGOVsY+RA+wIAfPTwQfuldc7oJqofcowEQ0AIyj/TqPI/HnAGOrcGKp7XuTaNhdP3CMB8IxgXlg9FjY/MD99Hbbw44FgC3v/q11z/AwIfyu4ipr1XONkKfzBZsvsgD7EQnkFf3/+n3iSQbACUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=SKkZo7Nq3yN0o2wAxO7W1HENmMymzf6Jpvtkth1oHdt/Wk7iOd4yAs0kZPiMUOQwrpzQF7ZwCq/aS3QY+53f0G6EZe31pLB6kse2ccpgwEuHJvbkbDEpN+FFRsjkzb+mF0eobn/Ee9OzlLjvmefRrOO+lWwi8rZbDpjQhYlqIlUGgEeQqKLmaw/uQPiNwGXDdIeeiwff7rItJfvY2vArJtdUCzaLEv921vkZjtjidr//03AaRnMqmaqmVtd311JftF77GF9WtqhLOrJD/262HWhmxKyMVvJEMN0h/V0pJ8VNZrIYfOh2HOHcCVDugoJWMUoDBVHAgkMxXWDaLTUC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:43:16 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:43:16 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVf/bHoOHFMdio50qJmyeMboFsfA==
Date: Fri, 11 Oct 2019 05:43:16 +0000
Message-ID: <20191011054240.17782-3-james.qian.wang@arm.com>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
In-Reply-To: <20191011054240.17782-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: abbbb220-1470-49a1-60b5-08d74e0df426
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5134:|VE1PR08MB5134:|AM0PR08MB4194:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB419497CEDD6846B13A3CE4F2B3970@AM0PR08MB4194.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(66066001)(486006)(386003)(6506007)(64756008)(99286004)(50226002)(52116002)(81156014)(6486002)(8936002)(81166006)(66946007)(102836004)(8676002)(305945005)(55236004)(26005)(66476007)(71200400001)(6116002)(3846002)(66556008)(6436002)(71190400001)(7736002)(76176011)(36756003)(186003)(2906002)(256004)(476003)(6512007)(2616005)(14444005)(66446008)(446003)(11346002)(54906003)(25786009)(14454004)(2501003)(103116003)(110136005)(316002)(4326008)(5660300002)(86362001)(478600001)(2201001)(1076003)(2171002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5134;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: amr7MgCh3e3rl1SrN65nY/ld+kZSeuJuQFfarRGf1E6lxg9tSJFtf49njxvNROJA6VAtujI5PiKAixykM03LQ/jlBs80ae2aruaZJUigT/+T1dJuBliv6hnqk+PgBu8tCLI7QFUOpkQIcNeOa77Jux2Xs7e7m185eKkU9/GsnL7AKP1B+sd3A4gcWqpWfjCfkb5iJaScmZDlCBdp4LRCwLImsj+Jw2iXCu50KbRDg7jBMpsojvBJ4JhMPZkMwwNR5PgfhrhYdBUJ77BwPHIWRBRTI13h2kU81HjkP1x/SJo5p4NDr5EHsjyzaciAGKfb8IXYolYopEbfLRdCGCQoE+qrmF76Yex2s1xfr9ApXIUR6m4WJRsJizxZAL0SGAZTOXdB2Nk5ziSI3tMOdqYxvyHH3qB7jhViIXogowL/iPg=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(63350400001)(7736002)(26826003)(81166006)(8746002)(103116003)(6512007)(81156014)(186003)(2616005)(11346002)(446003)(26005)(476003)(4326008)(126002)(486006)(25786009)(66066001)(8676002)(2171002)(336012)(76176011)(5660300002)(6506007)(386003)(478600001)(99286004)(2201001)(86362001)(14454004)(6486002)(305945005)(3846002)(36756003)(1076003)(50466002)(102836004)(6116002)(50226002)(110136005)(14444005)(76130400001)(8936002)(22756006)(36906005)(54906003)(23756003)(316002)(47776003)(70586007)(2501003)(70206006)(2906002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4194;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3b2cbfa1-1358-412c-b44e-08d74e0de9e9
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVmdaF4WE9sI64DgANsiaQEd1fyXU5qRyWxyF5IyZmfgiU+r2z47f+fdypCBLjX/rfyE4TtDWH1zLODARWIr9pZ2ytkWkeYyhffJT70ZS2j8g1lHcNvddKIsSyHPFJXhNJdbE7zSpEW0WAcn6pnsufkAORdphJ9PODpFM0pKkbtHM1q4tTi74AVTMGUA2goIkCWLilCuDwMM3VJnpuOmTehL7T/J6v+Jaajkz7E7VVVI2WKdI/v3aRLsRzEUl/OakpmOWox7+G8P1TY3ERLvVqDf0bIExwl+ngdOwo/rf58/qkTWEs18swOTxcIPJktrfcyVacpDpjqZg+NwvUBRYwD0RE6dZuYnVEq9ehnGr7npHYNRiNWuxqR78OGB51sPmWH+wjCkF2dnm3cNSeOL7s4pikYa63YSKm8CtRnxBvU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:43:33.2870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abbbb220-1470-49a1-60b5-08d74e0df426
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4194
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=gXKdIrIoYDlyk23wfjeGXfSe1JLu1JCIUw+hX48B9sUi4QXal1abWQeOiP2+NjopUPHiGDkgeKEJlZ8fLX2DqA51lk45V2EJdRo0PXeEL9TT6BddzAo0t15Hi1OnCN1KQPqblgKxZStip/unBu8zQjU7qR/RQrHTFGxi7eEh6XM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=gXKdIrIoYDlyk23wfjeGXfSe1JLu1JCIUw+hX48B9sUi4QXal1abWQeOiP2+NjopUPHiGDkgeKEJlZ8fLX2DqA51lk45V2EJdRo0PXeEL9TT6BddzAo0t15Hi1OnCN1KQPqblgKxZStip/unBu8zQjU7qR/RQrHTFGxi7eEh6XM=
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
biB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgot
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
