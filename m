Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E749FD38CB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C146E554;
	Fri, 11 Oct 2019 05:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B956E554
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:45:53 +0000 (UTC)
Received: from VI1PR08CA0152.eurprd08.prod.outlook.com (2603:10a6:800:d5::30)
 by VI1PR08MB3664.eurprd08.prod.outlook.com (2603:10a6:803:85::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 05:45:49 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0152.outlook.office365.com
 (2603:10a6:800:d5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 05:45:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:45:47 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Fri, 11 Oct 2019 05:45:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee33e86667b35187
X-CR-MTA-TID: 64aa7808
Received: from e02de6d1ad5a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53D50113-D5A6-4B8F-94F2-90B2EFAC6E97.1; 
 Fri, 11 Oct 2019 05:45:37 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e02de6d1ad5a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnW9vM/69pyvXM5QdOx/44ArSrxixR9Kvwcoo46GZbdf6Ug/XZzrdSaYWWdDRWZ6gaNiyBVA9fKDspbzsAvgvICChfSJGeHbzl9DLmneYlY4ITVBLJk0LF4HrRSWkVIbAyLPaxr+eSq69iZQGX94H8GTsQpL1CSUIbL/kSQG31aI6s+9QFVS5VTtkvIEGpOSTbApm+foM7shJrMQJEwUAGjPFp6QctYMreI7fuQMlNtslLY317iNQleeE1LSX4hyrEumWtLZhBpjeSjYbhAka0Mzu6JCzG+avym4B3pNbUp6iQ4NgfLVus25YlyXGN2uzBeLKgqr4mUqR6D1kkuEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=c1KAGTB0qU1jk8NveHdZBAxbwGIFz3GB8rfN7X+oz0Lb7aM1uXUaXW7S/rIp0A4Y6wWw4tXgckGKqTmQD2GRLctpbMR9NfcvcrKEvZWwZ2DqQrqUkBmM3smxSZDx0AipwFGq7PY/84xyhMDrFXTf0dVCMtPqZGAvvq97mD8qY2vX44pXmg3xF/vy6UGPXZh23/xq040eI41Pqm/Q+oTYkdHWpn6nFPmkAptSyx4TLTk3V6VCvQvCvufGTnUvZdaxcb+hxlKdpkiZt5a4SWg0eMOdfc9sIIeQ4VGzfwvDWDKTeLNozyvNndf90b5wfUeolNkAazwxEJ2lh1EXHNN4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:45:35 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:45:35 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v2 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVf/cahg9HTk7nnke/u6sXaUorqg==
Date: Fri, 11 Oct 2019 05:45:35 +0000
Message-ID: <20191011054459.17984-3-james.qian.wang@arm.com>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:2e::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 06545c5e-4a04-4235-600f-08d74e0e4456
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VE1PR08MB4816:|VI1PR08MB3664:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3664EA9162572B9834634320B3970@VI1PR08MB3664.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(4326008)(2201001)(2171002)(86362001)(2906002)(103116003)(36756003)(6512007)(1076003)(316002)(110136005)(81156014)(81166006)(8936002)(6436002)(54906003)(99286004)(50226002)(305945005)(7736002)(8676002)(3846002)(76176011)(6116002)(5660300002)(52116002)(6486002)(66476007)(6506007)(386003)(66556008)(66446008)(64756008)(14454004)(446003)(186003)(11346002)(14444005)(256004)(26005)(102836004)(71200400001)(2616005)(476003)(486006)(66946007)(55236004)(25786009)(71190400001)(2501003)(66066001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dn4tcfyUpPpF4U/YXbMcs75xZEIW+aIPB1vmXTROjeqHPNdrzsvKZ+oQPdMpOAvxZCsFmniQWinA6c5V/sTOAm/Sk76MAK1hQLaWiuo3kPkLZnOgKB6q6ts51HQGqD0hQ//VfVJkP4NHPjizqm/QTNPgKT1fm4C+TuVgM02RbLn+rH4O5ZoN5sruP15J+A4YC9qrfU3iufGxIUG9+ZoVDix8KGcfnKnJ01921vs4HhMfkOVg1CU/oPzyA5GEyywoSx5RNtaDSADhY4rSD8Al9VMlKEwCuIdBjQFd0GlmKSZPKOvFqiMJHxWrMTLT0nwdpwdZzwqS6zj3gdUkBNknnwYXSLgNadGDTHzLb/2N+KB6DW9ZXTsEwqhUKPQyXWrFgOOcJcPTn0WNu0WRZhfSImGpOfPQFWn8AMhk/jcryS4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(76130400001)(6116002)(3846002)(54906003)(6486002)(23756003)(50226002)(103116003)(110136005)(4326008)(99286004)(6512007)(36906005)(70586007)(70206006)(22756006)(316002)(86362001)(25786009)(2171002)(7736002)(305945005)(50466002)(1076003)(14454004)(47776003)(5660300002)(66066001)(81166006)(81156014)(8676002)(8746002)(8936002)(2201001)(356004)(14444005)(2501003)(36756003)(186003)(6506007)(2616005)(126002)(478600001)(76176011)(386003)(336012)(102836004)(486006)(446003)(2906002)(11346002)(26005)(63350400001)(26826003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3664;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2430ebd0-358a-4d8d-7b92-08d74e0e3cc0
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aImk91QjUYkiC5v7g/ErnLnt5sg4Sug0mHsFmO37RWDfmBas0knUsDGXmMdwyKEOUIkjRnOgNxIT/2B+ZsThzge5SjWggmaLbVfTRU8wpAjxSHoXG3Mmxs1otpvMZb0qYrDzr5N1WzhHgk9Ed459PYVZDzkIZF5MWVz9S4zrzeVT2qH1Dj3arETfNDCFn6jycuYFPHZaQqgYJ3BzsxQFKWmR5BsNvJniu8U/jZ9IsNKURUJDQD0lCQe3QfuUQjkgb5MQMu3RxoJx+KmHdZsaEL4mONxo5JO8QMrU29BCFBH1YhEdYjU6Vo1iQjKwFgQvqHOymHkkbImE3y+5FmcyUcoMy/g37KlKu+PHbWjrNugG2Oj70d0isaUXt4ytdQZjcIrFYLL2ndc3+9lm6pOmJuYaqv9EGDafETGkF92lCU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:45:47.8193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06545c5e-4a04-4235-600f-08d74e0e4456
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=zuW0j5Hx8HGQv59K8T1irjc9S+l+UndyNXCVECA3YSE7+eviUs6qXfYlSlTTfsKbZJ/C9PU1q9LLviHeGjoyhbVGHb2ip0O3EzPf4ckHwkg40uKCCmv+Nmh9gg/iqtU+iwMvG8YzBpwLZvn2oMPrhSK6PIA13lcyDThAyctXF2s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUBbQ6jci7ZZBrBwHMNuLpOgBHySGEUsJ89UPIG5ETg=;
 b=zuW0j5Hx8HGQv59K8T1irjc9S+l+UndyNXCVECA3YSE7+eviUs6qXfYlSlTTfsKbZJ/C9PU1q9LLviHeGjoyhbVGHb2ip0O3EzPf4ckHwkg40uKCCmv+Nmh9gg/iqtU+iwMvG8YzBpwLZvn2oMPrhSK6PIA13lcyDThAyctXF2s=
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
