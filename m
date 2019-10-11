Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC5D38C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B506EB99;
	Fri, 11 Oct 2019 05:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30073.outbound.protection.outlook.com [40.107.3.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48106EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:43:48 +0000 (UTC)
Received: from DB6PR0801CA0057.eurprd08.prod.outlook.com (2603:10a6:4:2b::25)
 by VI1PR0802MB2142.eurprd08.prod.outlook.com (2603:10a6:800:9b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 05:43:39 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by DB6PR0801CA0057.outlook.office365.com
 (2603:10a6:4:2b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:43:39 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:43:37 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 11 Oct 2019 05:43:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee808d8164c2722d
X-CR-MTA-TID: 64aa7808
Received: from fd5ed3b62776.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85D9C0D8-A6AC-4F39-B690-BF3B8484CAA7.1; 
 Fri, 11 Oct 2019 05:43:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd5ed3b62776.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQSVksWfi2JHOMnjim9q4tKncJYJoXJI0DSogRbWMxu0bDHghaRZ8f0ECvra9IQVkK1195GL9fAq8AeiblQkzhEeiEjT2O6VyFCAFHpxVYhgEqJ55q3EuZ20z6wVFF5EZjZd2aw4dzFFmlnEGL1Sr3FXu8mcoQOVEyo3zmeUZUBeFCxqFgp+bxWZSdCDKq2j2CSqxKq+QtzcDQNmnf+1eqjza/twgUu1mqTwr1hFlXEdh6jDmHzLNu72JiyUIuqNFx9nE0slLAXCoy7NH3uDsl6PnHDCxDPxgID5PT9GjgHLMUQrVtRd8bNQOoMb9rAqgz5pgc1apMSMzdJBDRgrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=Ch58dwjpx9SKzbln/LfMGrzzd0obdXcpr1BT4Ho2aNxmmgCrgFFehURz6CiWurm/uLBVpJSCKhPoJrW6GCwb+Vd+kmzJS0nipj8FpoNc0664RRILHUDN5oEt0cNMQQdBC0BV8eCqU3QIjGIUzrX/RNxjOBiBaY2p5rdAHO0t4SMyRQ9eZHPJsCe49N+dWziflfzjAALbQYDtC058Qk2+Ysr48vMpU5A6MnFO8k9jcZwCjmLB4virhINYRNc+yjvnBEF+t/qn2v+ZNMj5Eb3X8mepkpsOxuofr/+FpnSmgPuFBxY5jStMF2eUDhPVuSQcglmDM+tpIcwDDK/02w8igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:43:30 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:43:30 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support for
 DOU-IPS
Thread-Topic: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVf/bQ8wvdbeg7lUSqVOfgqlbTpA==
Date: Fri, 11 Oct 2019 05:43:30 +0000
Message-ID: <20191011054240.17782-5-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6d5c2f0-1049-43c4-c0fd-08d74e0df6db
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5134:|VE1PR08MB5134:|VI1PR0802MB2142:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2142803C027E5DD071A7B0ACB3970@VI1PR0802MB2142.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2958;OLM:2958;
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
X-Microsoft-Antispam-Message-Info-Original: 9PNdl4Zbz5TBG3FnTm+9TJrSG3EWK4iMTxGY97c3vAhN7iFLvVmEhtUtqjbyfdRJvzrqg+2Jz7nYJWeyg1f8WC8unT6wOKFjGlKPJw2OGnCAKseIC6rjCRxe2UUE+CvYwWWIm8l08zYzUOTdMQmmXvbS9vCZu4zqEcNmx2xKqo+R0KT2IJsImef3NPgvJNAbi9hXvkI9ZTMx5EqPDUp4coLNtMb9OMkag46p+6P4cOQtbx6AVf+Hrs+OooYc8ypGF0LUcg897wTAoQpfz5HxtcMRdLHcdP1a6PsvYEiaHWNLoArACadq3hnyFLAqTruyv6U9z/scVRt+jH5g/QJcipp7twQMrgkCJTaeTFZj1QnE0OEau5Z1IMNth+2dBuITB2imvKZi36rJruA20YqHLJXkofUurSbPAwS/RLd76UA=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(103116003)(476003)(36906005)(110136005)(126002)(486006)(2171002)(47776003)(8676002)(54906003)(23756003)(316002)(2906002)(50226002)(22756006)(102836004)(86362001)(14444005)(386003)(305945005)(2201001)(76176011)(36756003)(6506007)(7736002)(99286004)(1076003)(63350400001)(2501003)(6486002)(478600001)(5660300002)(11346002)(26826003)(25786009)(2616005)(26005)(186003)(14454004)(356004)(81156014)(50466002)(6512007)(3846002)(81166006)(8746002)(446003)(70206006)(70586007)(4326008)(336012)(76130400001)(8936002)(6116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2142;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2a6ceaf6-f21c-4bac-99d7-08d74e0df26e
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu0CezrEFUlVc4VPMtfsscpN7KertZwCp7bFMb/kJzroiuZZVspRZGppk8S60aZhyElE414fuuW16h8MmpWLRcQLP+HYHmel43ijlQhaR/jLVdrwFws0OPUzh2x1sOin1l5Igbz+y2S66G588zof1f3VsHm9mhaOtxz6g3Jlov7EsT5/ZKmIrmDsfzl7tIIMSINiKZy741uWlsGoLGmQrMpZjVGJOOpNrV3XmYQ0F+kWrT4uFdNZoUTE7VWX+b1YQ8uYYRLO0yZjj7MQXOfjUf+wpssjMp0shqi/dYz571f5d0EPJ+l9X3GhKT4PAFjAVO7ycSGi5w+KwAMj4Whg+LYPNW+Y7sMIhieW5HYus26JsD6KueOiuc/I1Sd1oqQXpv0tendOJG4kLfZ5QI0G9Y1M1OReCVc/2VR/ZWi+keg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:43:37.8311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d5c2f0-1049-43c4-c0fd-08d74e0df6db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=05N3VmuW+BombtrDyRihPLhEnlvcAczbMfb1pYkQl8FtawDe5qt6y2jMWDJpy2OqMOkMEAufwzaIj4qTniauVD3kSXoF4iOJDGEPxckohcoXDbl8/Kq9oXzhvyh1y2odxpWJ7LG/+9ClNQJUtYgqldCgtgUGOE6E3iA+b3F22es=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIUGSIoTFS+rG3rkaZCUgjh5FrULV5M3gll9vYVFpDA=;
 b=05N3VmuW+BombtrDyRihPLhEnlvcAczbMfb1pYkQl8FtawDe5qt6y2jMWDJpy2OqMOkMEAufwzaIj4qTniauVD3kSXoF4iOJDGEPxckohcoXDbl8/Kq9oXzhvyh1y2odxpWJ7LG/+9ClNQJUtYgqldCgtgUGOE6E3iA+b3F22es=
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
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERPVS1JUFMuCkFk
ZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1fY29lZmZzIHRvIGtvbWVk
YV9pbXByb2Nfc3RhdGUuCklmIGNvbG9yIG1hbmFnZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFu
ZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKysrKysrKysrKysr
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAyICsr
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMyArKysK
IC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA2ICsrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXggYzNk
MjljMGIwNTFiLi5lN2U1YThlNDQzMGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTk0MiwxNSArOTQyLDM5
IEBAIHN0YXRpYyBpbnQgZDcxX21lcmdlcl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIAkJ
CSAgICAgIHN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpzdGF0ZSkKIHsKKwlzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7CiAJc3RydWN0IGtv
bWVkYV9pbXByb2Nfc3RhdGUgKnN0ID0gdG9faW1wcm9jX3N0KHN0YXRlKTsKKwlzdHJ1Y3QgZDcx
X3BpcGVsaW5lICpwaXBlID0gdG9fZDcxX3BpcGVsaW5lKGMtPnBpcGVsaW5lKTsKIAl1MzIgX19p
b21lbSAqcmVnID0gYy0+cmVnOwogCXUzMiBpbmRleDsKKwl1MzIgbWFzayA9IDAsIGN0cmwgPSAw
OwogCiAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwgaW5kZXgpCiAJCW1hbGlkcF93cml0
ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICogNCwKIAkJCSAgICAgICB0b19kNzFfaW5w
dXRfaWQoc3RhdGUsIGluZGV4KSk7CiAKIAltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBI
Vl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7CisKKwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdt
dF9jaGFuZ2VkKSB7CisJCW1hc2sgfD0gSVBTX0NUUkxfRlQgfCBJUFNfQ1RSTF9SR0I7CisKKwkJ
aWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgeworCQkJbWFsaWRwX3dyaXRlX2dyb3VwKHBpcGUtPmRv
dV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCisJCQkJCSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZG
UywKKwkJCQkJICAgc3QtPmZnYW1tYV9jb2VmZnMpOworCQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsg
LyogZW5hYmxlIGdhbW1hICovCisJCX0KKworCQlpZiAoY3J0Y19zdC0+Y3RtKSB7CisJCQltYWxp
ZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9DT0VGRjAsCisJCQkJCSAgIEtPTUVEQV9O
X0NUTV9DT0VGRlMsCisJCQkJCSAgIHN0LT5jdG1fY29lZmZzKTsKKwkJCWN0cmwgfD0gSVBTX0NU
UkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KKwkJfQorCX0KKworCWlmIChtYXNrKQorCQltYWxp
ZHBfd3JpdGUzMl9tYXNrKHJlZywgQkxLX0NPTlRST0wsIG1hc2ssIGN0cmwpOwogfQogCiBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsIHN0cnVj
dCBzZXFfZmlsZSAqc2YpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMKaW5kZXggOWJlZWRhMDQ4MThiLi40MDZiOWQwY2EwNTggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTU5
MCw2ICs1OTAsOCBAQCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRhX2tt
c19kZXYgKmttcywKIAogCWNydGMtPnBvcnQgPSBrY3J0Yy0+bWFzdGVyLT5vZl9vdXRwdXRfcG9y
dDsKIAorCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIHRydWUsIEtPTUVEQV9D
T0xPUl9MVVRfU0laRSk7CisKIAlyZXR1cm4gZXJyOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCBiMzIyZjUy
YmE4ZjIuLmM1YWI4MDk2Yzg1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC0xMSw2ICsxMSw3IEBACiAjaW5jbHVk
ZSA8ZHJtL2RybV9hdG9taWMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4K
ICNpbmNsdWRlICJtYWxpZHBfdXRpbHMuaCIKKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5o
IgogCiAjZGVmaW5lIEtPTUVEQV9NQVhfUElQRUxJTkVTCQkyCiAjZGVmaW5lIEtPTUVEQV9QSVBF
TElORV9NQVhfTEFZRVJTCTQKQEAgLTMyNCw2ICszMjUsOCBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJv
YyB7CiBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7CiAJc3RydWN0IGtvbWVkYV9jb21wb25l
bnRfc3RhdGUgYmFzZTsKIAl1MTYgaHNpemUsIHZzaXplOworCXUzMiBmZ2FtbWFfY29lZmZzW0tP
TUVEQV9OX0dBTU1BX0NPRUZGU107CisJdTMyIGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZG
U107CiB9OwogCiAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9sbGVyICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3Rh
dGUuYwppbmRleCAwYmE5YzZhYTM3MDguLjRhNDBiMzdlYjFhNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0
ZS5jCkBAIC03NTYsNiArNzU2LDEyIEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9pbXByb2MgKmltcHJvYywKIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKIAlzdC0+dnNp
emUgPSBkZmxvdy0+aW5faDsKIAorCWlmIChrY3J0Y19zdC0+YmFzZS5jb2xvcl9tZ210X2NoYW5n
ZWQpIHsKKwkJZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKGtjcnRjX3N0LT5iYXNlLmdhbW1hX2x1
dCwKKwkJCQkJIHN0LT5mZ2FtbWFfY29lZmZzKTsKKwkJZHJtX2N0bV90b19jb2VmZnMoa2NydGNf
c3QtPmJhc2UuY3RtLCBzdC0+Y3RtX2NvZWZmcyk7CisJfQorCiAJa29tZWRhX2NvbXBvbmVudF9h
ZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0LCAwKTsKIAlrb21lZGFfY29tcG9uZW50
X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwgJmltcHJvYy0+YmFzZSwgMCk7CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
