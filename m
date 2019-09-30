Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1EC1FBD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 13:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530689CBA;
	Mon, 30 Sep 2019 11:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10061.outbound.protection.outlook.com [40.107.1.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981D489CBA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 11:04:57 +0000 (UTC)
Received: from AM6PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:20b:b2::28)
 by VI1PR08MB4592.eurprd08.prod.outlook.com (2603:10a6:803:b5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 11:04:53 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM6PR08CA0016.outlook.office365.com
 (2603:10a6:20b:b2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Mon, 30 Sep 2019 11:04:53 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 11:04:52 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 11:04:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30ac3e6b0742160c
X-CR-MTA-TID: 64aa7808
Received: from dfd7421f2557.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E27A28D-C822-4792-B7C4-F069EC24830A.1; 
 Mon, 30 Sep 2019 11:04:41 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfd7421f2557.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 11:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTxSvJUx7VTBhKPOV/7d8qvVSLF6nOfTcoukuI6S9wR6t6ofYjtPt47oeCYD8E6Q59WENAEicB2yn/Enwbl/edDZNne4rMr2BpuLmsur+q0EYG99/O+2e3ziW9legmVcnMoO1yzDHdn6GVkyFSz6FTgMlqp+OafgG2IklIVqyF6Eg+vMvnbxxA9m/jVnv7LnN8Zrs63TxiqnMEsRiPVROidQmP6E/8jbBaeikH+fhxMseX/pxgebNRvF9iDfHh/JdKqmZPrB8L1fJ5pBUD4RkMiSpk51QL2Hftht5yKKUaNKZxpWJTBoGLfU9HdcuuQp5kbB2W4tNIzoqjqTd17UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieXO29+sPFFvolftawXOulWfErEGKiRbsgPQ0a4e9G4=;
 b=GkhjUbzX7e3GikZTplbVDkSzGhR8LZJs28u6vISHv6qjlbXDRkrL9uY5PSbr6V5Sq9EThUs5VzcXWy4AcJFIe/oRHEPokiYMV3Jz3D/ysNlrJgChhlGKJLn/le6/j1ajP6hHIQMgtYREZzEiIsD5FqjFegrgaElLF7P/VzNbvD0/UfGEFN7GvYGzM9sswIuSsAjh+BD0FcMzSvg6EHJ7HZ0gTXi7dFr1G9PqalXBT6vMFkamI/kYaGwuT5gWu8/FsLBamz9RrpXtnErlUZuxJO3O5JFPNClOCUgeEtP0qKiiEK/nemhHt7wzpwxUozWU7gfmCU31mRd0jhSDfe1wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4998.eurprd08.prod.outlook.com (10.255.120.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 11:04:39 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 11:04:39 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH 2/3] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHVd0syoKU25huCdkWmRqYuLiJjnqdEDx0A
Date: Mon, 30 Sep 2019 11:04:39 +0000
Message-ID: <20190930110438.6w7jtw2e5s2ykwnd@DESKTOP-E1NTVVP.localdomain>
References: <20190930045408.8053-1-james.qian.wang@arm.com>
 <20190930045408.8053-3-james.qian.wang@arm.com>
In-Reply-To: <20190930045408.8053-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LO2P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::18) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: df921b79-57c2-4c9d-f02d-08d7459604c1
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB4998:|AM6PR08MB4998:|VI1PR08MB4592:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB45929555518B02857EFBD4E8F0820@VI1PR08MB4592.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(199004)(189003)(186003)(2906002)(1076003)(229853002)(8676002)(52116002)(81156014)(6486002)(14454004)(76176011)(8936002)(86362001)(476003)(486006)(81166006)(6246003)(66066001)(102836004)(256004)(11346002)(26005)(99286004)(6506007)(386003)(446003)(7736002)(9686003)(6512007)(6436002)(305945005)(5660300002)(6636002)(66446008)(54906003)(66946007)(66476007)(66556008)(64756008)(71200400001)(44832011)(25786009)(478600001)(6862004)(4326008)(6116002)(58126008)(3846002)(71190400001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4998;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1XPx0EX+SyiasvlgzLgRuTTpEDB5KaCDukA4vc+fbUALuh8eTtopZtwqujNf/TEBN7OW8VCGi+DN7n/WB5aQZA/1VXK+SgUpPqt6tAzToL0pwQIo2jGApHgo5Z0xfz2K7eFarsqiiF7Y6S2F8+n31wdEm0zPjz68IsHxkHZWGtILuQM3TddP4ACiVsC+n48R1zaCsDJ84v2yQpK9jTlWz/VOlmBwEk+56obv1d6z5Lj6z3yTXGK+fYqy9FvFWevCSxOMOTJY6T4nKqXPQLCgeMV0SPNn8mAwWDl+hx2gi06arrOc1WDIKI3RbJx/yBlTgkMq6qnf2ZH9calv0lIYJFvTiEMWRiasD4A5V6i7EgwYD6rjBRRvZ7DspVdPALwrcMC4nDsACAF3fg8tMzXiJCIFPS5qJtY+hX8NIGllqhA=
Content-ID: <ED06BD66BDDFF842BB9EF9FC05ADCD00@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4998
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(22756006)(86362001)(63350400001)(486006)(126002)(5660300002)(1076003)(8746002)(305945005)(4326008)(8936002)(6636002)(336012)(476003)(97756001)(81166006)(46406003)(8676002)(7736002)(356004)(81156014)(11346002)(446003)(6116002)(102836004)(66066001)(26826003)(478600001)(6486002)(70206006)(99286004)(47776003)(76130400001)(2906002)(9686003)(70586007)(26005)(229853002)(76176011)(23726003)(6512007)(54906003)(6506007)(386003)(50466002)(3846002)(6862004)(58126008)(6246003)(316002)(25786009)(14454004)(36906005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4592;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c8e89a5-87a9-4ffa-db50-08d74595fce4
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7gn1MJKwOtEIXKdddz7+H4nSuJ+YGHeZUSbd/bALh1SGvdglwWpp8GG+s4XugfB3YM/5ItBW+JH54A1Hr62xXNQZyszOQ0yOan7WSuWUypxI+DFKxXOZ5af5K1k44/g8f9DCllYiij5U12jglSXAiqEBJ9bMqgG9iMyAfCGAlI5Qh2qzmTmV1hIn/9oKZUNFe5g0FnL6/jbq8XzCDtNb5ygAKou/eqFUPiORPKJEpxQg4+XA/kLgWpOWpdmB/GwkZtdmyZwBQ0poEYbTp1cUBiA5pL+PGGY1zKHT7oh9qKrKG8y9yFibouOCiaL1SQE7w/oSabwbd1fo/cRruhtYgSk0UtAET4N0Sn8qph4U0lKm+tm/RA3GoBjbXY5vuSHH7kPHSYamUATlMFP7XTB+u4DO2Csm8wfDgN+mr9DeOM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 11:04:52.2733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df921b79-57c2-4c9d-f02d-08d7459604c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4592
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieXO29+sPFFvolftawXOulWfErEGKiRbsgPQ0a4e9G4=;
 b=KX+UEKh2HgHfIOKLty/waDzA7U93zB3/Xn7lXeFo+wkO9twOfPlwUYMIIDLvlznBSax0DRJryKT7J+Z/16TcGIWhKEES71SOenxWx04A3VeREXXne9ADv3mouaLcFUdlHSVN5Ov+/oTiKJhjLhNkQGsC2enSU37tZattvA27DK0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieXO29+sPFFvolftawXOulWfErEGKiRbsgPQ0a4e9G4=;
 b=KX+UEKh2HgHfIOKLty/waDzA7U93zB3/Xn7lXeFo+wkO9twOfPlwUYMIIDLvlznBSax0DRJryKT7J+Z/16TcGIWhKEES71SOenxWx04A3VeREXXne9ADv3mouaLcFUdlHSVN5Ov+/oTiKJhjLhNkQGsC2enSU37tZattvA27DK0=
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
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNDo1NDo0MUFNICswMDAwLCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBUaGlzIGZ1bmN0aW9u
IGlzIHVzZWQgdG8gY29udmVydCBkcm1fY29sb3JfY3RtIFMzMS4zMiBzaWduLW1hZ25pdHVkZQo+
IHZhbHVlIHRvIGtvbWVkYSByZXF1aXJlZCBRMi4xMiAyJ3MgY29tcGxlbWVudAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5x
aWFuLndhbmdAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5jICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwo+ICAuLi4vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiBpbmRleCBjMTgwY2U3MGMyNmMu
LmM5MmM4MmVlYmRkYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKPiBAQCAtMTE3LDMgKzExNywzMCBAQCB2
b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1
dF9ibG9iLCB1MzIgKmNvZWZmcykKPiAgewo+ICAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2Is
IGNvZWZmcywgc2VjdG9yX3RibCwgQVJSQVlfU0laRShzZWN0b3JfdGJsKSk7Cj4gIH0KPiArCj4g
Ky8qIENvbnZlcnQgZnJvbSBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gSFcgUTIuMTIgMidzIGNv
bXBsZW1lbnQgKi8KPiArc3RhdGljIHMzMiBkcm1fY3RtX3MzMV8zMl90b19xMl8xMih1NjQgaW5w
dXQpCj4gK3sKPiArCXU2NCBtYWcgPSAoaW5wdXQgJiB+QklUX1VMTCg2MykpID4+IDIwOwo+ICsJ
Ym9vbCBuZWdhdGl2ZSA9ICEhKGlucHV0ICYgQklUX1VMTCg2MykpOwo+ICsJdTMyIHZhbDsKPiAr
Cj4gKwkvKiB0aGUgcmFuZ2Ugb2Ygc2lnbmVkIDJzIGNvbXBsZW1lbnQgaXMgWy0yXm4sIDJebiAt
IDFdICovCj4gKwl2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/IEJJVCgxNCkgOiBC
SVQoMTQpIC0gMSk7Cj4gKwo+ICsJcmV0dXJuIG5lZ2F0aXZlID8gMCAtIHZhbCA6IHZhbDsKPiAr
fQoKVGhpcyBmdW5jdGlvbiBsb29rcyBnZW5lcmFsbHkgdXNlZnVsLiBTaG91bGQgaXQgYmUgaW4g
RFJNIGNvcmUKKGFzc3VtaW5nIHRoZXJlIGlzbid0IGFscmVhZHkgb25lIHRoZXJlKT8KCllvdSBj
YW4gdXNlIGEgcGFyYW1ldGVyIHRvIGRldGVybWluZSB0aGUgbnVtYmVyIG9mIGJpdHMgZGVzaXJl
ZCBpbiB0aGUKb3V0cHV0LgoKVGhhbmtzLAotQnJpYW4KCj4gKwo+ICt2b2lkIGRybV9jdG1fdG9f
Y29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqY3RtX2Jsb2IsIHUzMiAqY29lZmZzKQo+
ICt7Cj4gKwlzdHJ1Y3QgZHJtX2NvbG9yX2N0bSAqY3RtOwo+ICsJdTMyIGk7Cj4gKwo+ICsJaWYg
KCFjdG1fYmxvYikKPiArCQlyZXR1cm47Cj4gKwo+ICsJY3RtID0gY3RtX2Jsb2ItPmRhdGE7Cj4g
Kwo+ICsJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9OX0NUTV9DT0VGRlM7IGkrKykKPiArCQljb2Vm
ZnNbaV0gPSBkcm1fY3RtX3MzMV8zMl90b19xMl8xMihjdG0tPm1hdHJpeFtpXSk7Cj4gK30KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oCj4gaW5kZXggMDhhYjY5MjgxNjQ4Li4yZjQ2Njg0NjYxMTIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3Jf
bWdtdC5oCj4gQEAgLTE4LDYgKzE4LDcgQEAKPiAgI2RlZmluZSBLT01FREFfTl9DVE1fQ09FRkZT
CQk5Cj4gIAo+ICB2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3Bl
cnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gK3ZvaWQgZHJtX2N0bV90b19jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpOwo+ICAK
PiAgY29uc3QgczMyICprb21lZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNv
ZGluZywgdTMyIGNvbG9yX3JhbmdlKTsKPiAgCj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
