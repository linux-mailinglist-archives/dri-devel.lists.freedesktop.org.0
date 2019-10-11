Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF487D38C1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8E76E3FE;
	Fri, 11 Oct 2019 05:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E3F6E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:43:29 +0000 (UTC)
Received: from VI1PR0802CA0047.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::33) by AM5PR0801MB1635.eurprd08.prod.outlook.com
 (2603:10a6:203:3b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 05:43:24 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR0802CA0047.outlook.office365.com
 (2603:10a6:800:a9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:43:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:43:23 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 11 Oct 2019 05:43:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4416ce3dc06705bf
X-CR-MTA-TID: 64aa7808
Received: from 409fc30ad3a0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B73E81B-7DA7-4424-BCAD-AE93652C5A61.1; 
 Fri, 11 Oct 2019 05:43:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 409fc30ad3a0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhsAP9maEmuMzkLff2QVmr4nGIrkxlwyBfMlGBvQQIeZCIfrJeLsDkCqozT9DBk3M0U6gQJUB7bFHIi28AMCwp9qRqjn85quThue068vqUQZKpMd6kpyGLcPGxsnji+BEX8Gm3uqMg2lv63LDIur0qOr2GP2qbFjkd7RkVBA4VlqYkPkLzg5zDVqg+DNsnX4mQNPNjoFJwnDOcgK0PX6mfpXqhXh+Q63E4JCensIDJP+nx81tC5VVi+NIRAP7EimNKR32839Gt/Bdx/P6M970MeoUafQ44HTgB2qfyZJiG6JZmiDbif72zuAzNfrYjMXKpogjv1FNqlMt3lR1Wwx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MROpJRQlAYcnH6kxPcSNEQcaOoQ01vB9i7fkB8VnXF4=;
 b=oczJEaFE2H9FHUkdiGc9gwaASoIj5/XuetAP16zSRy49cD29glguKxrYLq3FkGU4JejF8cpKK/E2LY+toJaQ4ODqd6di0Xkd7hcBZUbeVNl8jb4yKYq+BNCphwlwX0mwRJ/VXbd5Ntj728vg8G4K5u63H6SGgxvsBP0Sf0zDe4pgG8dPLD5BHBTGdJ0wpjUPZdvmIYPuhm/iQPf75MFcqe1FfunHa4BLt74lDg03I+/0/Gmv4E5KET9Stesur7RIpD8vaYtfY+nFXIJSCnBl4Je2HcAytT4lgS21Zmmcj19JLHAoy2p+MWs+r0OsHtJoV0O7dijpggXU4VO9C5SyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5134.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:43:09 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:43:09 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bDNAzoDxuLVU+by7UkFix6lA==
Date: Fri, 11 Oct 2019 05:43:09 +0000
Message-ID: <20191011054240.17782-2-james.qian.wang@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 66974046-fb4b-4040-c8de-08d74e0dee16
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5134:|VE1PR08MB5134:|AM5PR0801MB1635:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16350457F30BF39E3E22F0FAB3970@AM5PR0801MB1635.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(66066001)(486006)(386003)(6506007)(64756008)(99286004)(50226002)(52116002)(81156014)(6486002)(8936002)(81166006)(66946007)(102836004)(8676002)(305945005)(55236004)(26005)(66476007)(71200400001)(6116002)(3846002)(66556008)(6436002)(71190400001)(7736002)(76176011)(36756003)(186003)(2906002)(256004)(476003)(6512007)(2616005)(66446008)(446003)(11346002)(54906003)(25786009)(14454004)(2501003)(103116003)(110136005)(316002)(4326008)(5660300002)(86362001)(478600001)(2201001)(1076003)(2171002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5134;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ndGrfEnsw4RRr1scCRcgej+L0luzMHm1bQa33tlKL9+Dz/sZOFD47eFSSpN6OnHsYKa5urJrJz5z7G88LJAEnoEsPna6sLyOKxoVjOdKJDy8pmx4+Of26YEuNZtKZMS+V4Zfooy9PzANEUaeMx75FaMvuJCfodljj1qgWPMoUtHYYkOaDEFI882+pj1DHVuZ7K73Mz4ODIbyuPouvRWgTqiiS/yIrKnPOANCbeS6kFW8rzudRkkMkGx8Eh0Kaxp7VY0cqrTgoOIAzDAUik0mtV9bxuNYeu2+Id08sIef7HYpRxLuqP2l/V0C/QL9ATSBIU/Y1D4UJmGEekCUVQmrp3A+1wKlTH3HPUyKi4Qb0PonxtYp8REXeg9XiCZ/UMvcKECMM5nTrM/ZwqNvE24QQouoGx5hgy/X1Pdfctn7PNc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(189003)(199004)(86362001)(305945005)(103116003)(102836004)(23756003)(11346002)(36756003)(14454004)(6486002)(2171002)(47776003)(6116002)(2616005)(3846002)(22756006)(478600001)(7736002)(5660300002)(6512007)(50226002)(76176011)(4326008)(26826003)(99286004)(36906005)(66066001)(446003)(8746002)(316002)(25786009)(26005)(70586007)(8936002)(63350400001)(126002)(70206006)(2906002)(76130400001)(110136005)(54906003)(6506007)(476003)(1076003)(81156014)(81166006)(386003)(8676002)(336012)(186003)(50466002)(486006)(356004)(2501003)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1635;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0573589d-19dc-4e45-9d87-08d74e0de57e
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ob+TPcY5qFHQvWz+YPXsSaEsKeXOaySwAsS8HuuWMo3bZETE8QsUiRNxvO5MsD33bH1FbWJVyVnp74XrONRR//d29u/fUb+GxeHCZSKieoopK3d/hsJuWJ9Q/jV6cqmNekbnWvuZb7GDQVXF6gBIbAO/Row95g3O0rWcJn7xK76bMzJP6kV2EsIkfQ/KFJMhngtuNPGe8DzLzwRa7XGg+GDqitCftZEjY8tkTxAdBCNaUAHYx9KNhH8O10zOgVT6crghgd0qHhPhgmHB7bKiP4dbYQvnBfi0VcAKqGWZwKX6uWueg0v27WOm8cxix/UUXXwk+yjf3O3SwcYLtWPIUvss82T2JDiZdCNB1gyS9HOtH7gIILLOXfdLy6SLdklG24kCq3m6f/EZ8bMPNVxlh+sDzgdAEuXRrR0RhkBTvfk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:43:23.1666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66974046-fb4b-4040-c8de-08d74e0dee16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1635
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MROpJRQlAYcnH6kxPcSNEQcaOoQ01vB9i7fkB8VnXF4=;
 b=Lvk7ZBam/+KrJiBvhFlW/yzp3KzI2Choq0oJsjV98JstYqM9xP6lFePXjDwYq/1Z0/AC2fTQlNMSEpN8HVGm5xvzExTO+sTAnUl05pKNWK0AuD2WpfWTG1J2jI1/nenk8aFiBGkBkl9fHtk4Vhat4NupyP9l90GNkJz4zVzcJ9U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MROpJRQlAYcnH6kxPcSNEQcaOoQ01vB9i7fkB8VnXF4=;
 b=Lvk7ZBam/+KrJiBvhFlW/yzp3KzI2Choq0oJsjV98JstYqM9xP6lFePXjDwYq/1Z0/AC2fTQlNMSEpN8HVGm5xvzExTO+sTAnUl05pKNWK0AuD2WpfWTG1J2jI1/nenk8aFiBGkBkl9fHtk4Vhat4NupyP9l90GNkJz4zVzcJ9U=
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

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bwpjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBj
b21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5CmhhcmR3YXJlLgoKU2lnbmVkLW9mZi1ieTogamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMKaW5kZXggNGNlNWM2ZDhkZTk5Li4zZDUzM2QwYjQ1YWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3Jf
bWdtdC5jCkBAIC0xMzIsNiArMTMyLDI5IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFj
dCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQogfQogRVhQT1JU
X1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwogCisvKioKKyAqIGRybV9jb2xvcl9jdG1f
czMxXzMyX3RvX3FtX24KKyAqCisgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUKKyAqIEBtOiBu
dW1iZXIgb2YgaW50ZWdlciBiaXRzCisgKiBAbjogbnVtYmVyIG9mIGZyYWN0aW5hbCBiaXRzCisg
KgorICogQ29udmVydCBhbmQgY2xhbXAgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidz
IGNvbXBsZW1lbnQuCisgKi8KK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24o
dWludDY0X3QgdXNlcl9pbnB1dCwKKwkJCQkgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKQor
eworCXU2NCBtYWcgPSAodXNlcl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7CisJ
Ym9vbCBuZWdhdGl2ZSA9ICEhKHVzZXJfaW5wdXQgJiBCSVRfVUxMKDYzKSk7CisJczY0IHZhbDsK
KworCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMnMgY29tcGxlbWVudCBpcyBbLTJebittLCAyXm4r
bSAtIDFdICovCisJdmFsID0gY2xhbXBfdmFsKG1hZywgMCwgbmVnYXRpdmUgPyBCSVQobiArIG0p
IDogQklUKG4gKyBtKSAtIDEpOworCisJcmV0dXJuIG5lZ2F0aXZlID8gMGxsIC0gdmFsIDogdmFs
OworfQorRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKKwogLyoq
CiAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50
IHByb3BlcnRpZXMKICAqIEBjcnRjOiBEUk0gQ1JUQwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2NvbG9yX21nbXQuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKaW5kZXggZDFj
NjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xv
cl9tZ210LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaApAQCAtMzAsNiArMzAs
OCBAQCBzdHJ1Y3QgZHJtX2NydGM7CiBzdHJ1Y3QgZHJtX3BsYW5lOwogCiB1aW50MzJfdCBkcm1f
Y29sb3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNp
c2lvbik7Cit1aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVz
ZXJfaW5wdXQsCisJCQkJICAgICAgdWludDMyX3QgbSwgdWludDMyX3Qgbik7CiAKIHZvaWQgZHJt
X2NydGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCXVpbnQg
ZGVnYW1tYV9sdXRfc2l6ZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
