Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C67492D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 10:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15EA6E699;
	Thu, 25 Jul 2019 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4E6E699
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cka+zB+sCL8dApB2ibwZMc5MQDOdNT31+gMTQeUf34KkMIrPuedfjZDBcDshYXhMovgizyFQeBNuY0YOv2IRTL2i2QdSIF0VXFIW9pIn0g9Z/bws6snZvMNFtFlwfgzvr3WVO1JtTU4M4SB8o7P+wUjDiLvE8JoetI4OHZKgbpssGysztzgDSa6bQJcgAIU9MPJZgv/W1xn2o1gwJO2sQIftmz2pGsASMYDLLDmDs6tyEN/EizjfmC6vXWBO7RwwYqZT+UsfJv2cDyeeIdUg3oxNGzDVHaJ9qyP0m7RaFHZ39ZLaMH2/LBSRbIpDPTx+wNNBqPfcgKStTNpkv1zfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh002u5XworLt+RZghwPlngt/9KUro9xjk92/UbZXHs=;
 b=m4Pc9TqrziRSPtJ0FrIdZJvDna4PPL0b8xvCWQ5/HKf/vv8vcul4Vw52lXIcPaxGpXDiZyJo9Nfd57z9p3cYPbJykz4nxXhrfwCmV0vtYHS6nwV3pQiHhsBRiqPic5HU9PKNpT7ErO/0yjevt+phqxZDjy9OFFrENiXWnw7ijTYoqUTnzfZ7L1/uGCZJjQeg5WpFSmg01M9tXNzFgsNVayEFp2wixwA9uoJGt+Zl5HOX4pUgaluunanlAMOBZphXGstU9xJA184YO0qWwYBZQrXrD37ARl310WPoP6eY8t030n3l0EQkPe2SGNbjLEJUBxZoQzKT4cD5qsnfFVTmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3984.namprd12.prod.outlook.com (10.255.238.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 08:34:39 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 08:34:39 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Recall: [PATCH libdrm] libdrm: wrap new flexible syncobj query
 interface v2
Thread-Topic: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface
 v2
Thread-Index: AQHVQsPMyIFBxwFv3EyfPqMiaCKqrg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 33
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 08:34:39 +0000
Message-ID: <MN2PR12MB291065C9FF1CA9963C7569BFB4C10@MN2PR12MB2910.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe40caff-0403-41c9-8106-08d710daef09
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3984; 
x-ms-traffictypediagnostic: MN2PR12MB3984:
x-microsoft-antispam-prvs: <MN2PR12MB39842884F522AD52B255E367B4C10@MN2PR12MB3984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(199004)(189003)(478600001)(256004)(5660300002)(305945005)(66066001)(52536014)(55016002)(476003)(486006)(9686003)(14454004)(558084003)(26005)(7736002)(186003)(4326008)(25786009)(71190400001)(71200400001)(66946007)(74316002)(316002)(2906002)(53936002)(86362001)(64756008)(76116006)(66556008)(66476007)(66446008)(6116002)(3846002)(102836004)(6506007)(6436002)(8676002)(81166006)(81156014)(33656002)(7696005)(68736007)(2501003)(110136005)(8936002)(54906003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3984;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EuZIClG4GH3x56Vwir9SEkjJ7RvaFL4d6wFzwUIUUnKecJVDqF5rrkodNFne1Dgx5icp/fXr4B5oNUka2jssv7HqiNHnVufMXwdAW2S+LVpgWOCR6FJUfszzTSfgosXN69Yb+peJeOU6Ec2Ek2ri1VF00UGeYXMkuNKmqzOc/LRJzCNbCJAIMfBBJ9o0XmqFO49qQEiHHeGW/gWTJkO6Qgv1wfuExVlM/BIdv/wUpjRsptcFjYK4uhw+TvDZ3U7m9mLSErY+JEOMA1lydiewrd/hQ0EhRfa6b/yo6CasoWLRrzjdL2gFbiYY5GAOE8ry29DatP+qZIDMeN0EbgvR00SI5zmtAsbMwRQBQqgq3rzrF6LsDyrWWLAc1e5PJvM9yZlAQmsbo0nVNn0lxCZJ7dJ5S3iC4FwawaMcWwxaTNo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe40caff-0403-41c9-8106-08d710daef09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 08:34:39.4617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3984
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh002u5XworLt+RZghwPlngt/9KUro9xjk92/UbZXHs=;
 b=Mf3y4lBZ7hSefp5I6Zr0mv10FZFAJHeiQgCLLmGO9w6nGTp4/k1VM7H9/di8Leu+qxsAmTwOk3H8cEfjoiY64Qdr9Q+cL3Q86kzYKyf5fknBKp3wCJRlVEEAd4ezK2B9qIWb+Yk8z5F2KEwFjm0GBeY/GcOnRq0G/eaXpZAcV2Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WmhvdSwgRGF2aWQoQ2h1bk1pbmcpIHdvdWxkIGxpa2UgdG8gcmVjYWxsIHRoZSBtZXNzYWdlLCAi
W1BBVENIIGxpYmRybV0gbGliZHJtOiB3cmFwIG5ldyBmbGV4aWJsZSBzeW5jb2JqIHF1ZXJ5IGlu
dGVyZmFjZSB2MiIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
