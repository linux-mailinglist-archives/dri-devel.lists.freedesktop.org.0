Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF057495E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 10:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDB66E69C;
	Thu, 25 Jul 2019 08:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680082.outbound.protection.outlook.com [40.107.68.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DE96E69C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCo4xrOQHC+RNGr7cv8+Svjy6slPAZWeRiRrQRHMZXn9KC2RQjJ8u/xR+0x7TeQqtQe660kOVgnDG7XjcFrKcLocy6marftXp9zLp0NOdtAeviPIFIlzaLZ9bSGIBOAVR2sgvI+vw+r9Qh1Cg7C9JFCNYLdnSJ5iXOeliR4kuM3dwSmaOXLMHTt4XdMbbsVwj+9eHrM2iNggYXEpVjfh5AFcGOmaNDHz3KgPFxN0RuRk//EI7NX8mcyAxJhKq8T0i+TnodAQOAfR+PNgP4kOB7yBJaKUDVivXExbuVIUZrmkmpT+SOOK+uEkaaW8v2HdKnaFPh4H1gezOFROxIKNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh002u5XworLt+RZghwPlngt/9KUro9xjk92/UbZXHs=;
 b=RWtGcK1sA4Ev35phd6X/88Jfd6ovSpVRrxSJNOGIe37PEIGLX5y9zdE61vwHFy/GjCxf93vrOo3PfXMwDT96sVv+PwI0sl8ySyVfto6/yZ0ZYjxXRIukMWQBS9lsFJAhLnLwJx/74JLDbPfgoezap4Fgdr9XLNkrzqW+oz7PrtvgFhgW8MOp2vSG4rKFlPw9KdmKUVy37cL08IkZi8O6qAWDx93EFbdbeV5ML8DnixKhzqECuDr4oNYoDhzIbXCxg05iLUuUhUQiuehdrQRn7ci4+AGAp0PRfArzknT9ysjXwdmau4D4/3LwfroXo0+A3siJNUZuVKmzYDx1kdmxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3822.namprd12.prod.outlook.com (10.255.237.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 08:50:24 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 08:50:24 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Recall: [PATCH libdrm] libdrm: wrap new flexible syncobj query
 interface v2
Thread-Topic: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface
 v2
Thread-Index: AQHVQsX/IanbPCeQb0GxMaXdMRwlnQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Thu, 25 Jul 2019 08:50:23 +0000
Message-ID: <MN2PR12MB2910346448531345DBF84764B4C10@MN2PR12MB2910.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a4293a-2146-46e8-c0ff-08d710dd2205
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3822; 
x-ms-traffictypediagnostic: MN2PR12MB3822:
x-microsoft-antispam-prvs: <MN2PR12MB382235BFBE6CD63FD57E846EB4C10@MN2PR12MB3822.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(25786009)(14454004)(478600001)(2501003)(6436002)(9686003)(53936002)(66556008)(66446008)(64756008)(55016002)(52536014)(66476007)(5660300002)(66946007)(76116006)(86362001)(74316002)(2906002)(33656002)(305945005)(8936002)(7736002)(316002)(4326008)(71200400001)(81166006)(102836004)(8676002)(71190400001)(476003)(7696005)(99286004)(68736007)(558084003)(6116002)(3846002)(256004)(186003)(6506007)(26005)(486006)(66066001)(54906003)(110136005)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3822;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1t4CtsOsRePTHR1f1rWoV1hMGpW/IOm2XyNJEeHC14lj1s8V8JBi1mxQ1UfFfSXHGDFB8vNdofKB+ODmgwgrQa1YHsFkUwIVoVM9m+8fM5dNmZvhKS/I3wPWsJNLdbvZcet/9GwetRgaiqzyPh/f9k5FSNwqTvm4QVg6zGeY6RN3sUtQZiqeAHeEzqMho9kUhjoX7zo1UfnOCAUAanyed1GuzySqLQZZ6nEA7V4ITkFfizcxUxwNQ6ZzXk2pSscJJgs+bTwZeKGFNaIbZANPSOJPauLb9OOUmLnf35E4Ua0pqOfsYmFfsc2GwvY1cZiMizKX4Qs5dMEzMQy3ekSeGvH3wo5OH5/LqnSiLivRcosKdMhBSEDzamaiJb59/SkLcb8kAgoxSntpm17hUqsRnG7TK6UAnppH7rEI/JvALu4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a4293a-2146-46e8-c0ff-08d710dd2205
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 08:50:23.9344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3822
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh002u5XworLt+RZghwPlngt/9KUro9xjk92/UbZXHs=;
 b=HmHDf1c5wyPID/xk66SU4kO0k9TwOa0rOt1tOTUMQTBjsOy6Jx7C8b+9PGXS23CsgL3FOY8wvTzp4aiDDYijiwlMAcue5SQNyj9A0vlFX6lkDjwaIBKaWA/EeN7NIj2Weoct3Z8fd2KJxvd40kdQpXBaas2F2VtTlnvGnwJEjLc=
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
