Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573E6CA09
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6866E328;
	Thu, 18 Jul 2019 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jul 2019 21:19:40 UTC
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2E06E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 21:19:40 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A162C1209;
 Wed, 17 Jul 2019 21:09:47 +0000 (UTC)
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EB757A009F;
 Wed, 17 Jul 2019 21:09:46 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 17 Jul 2019 14:09:31 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 17 Jul 2019 14:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geMpjnX5LnkvINe9NY5/91NCeSOU+oXgJyXk8s/nsGIsLkPMjKLWuO0nb7RKtH5ByWCqyrNi9jpxLhnoEgM0eFI17pXOLspG9j2X2CBigkoejjNcsAeYxhEh/Ol9eSY/W97zRk4gXw1P93jFYaUZliLP7m1ejTHDybrIcRGrXOzZM/qJd6Nds7dD+l1pZ5o+NSBYKRu2hbzko8y9LieQfJrRqACHfZPYeg5FgGgrJpZwzVjxGAkHBwUMz3fRFarlqqt1DWM6ygpCTN4K2aa38VrTF8I7nwCLiFB+tMPtcgD0u7IDPK3glPg4mxlu6VWmkJKGiKakSHTDV2W0s9EOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaxCEr9ghSmdC4vUAR4GZOTelrm+iqD1427EbYqt4rw=;
 b=TDyl3O9wA7EqJtZWr7Uet7XwuiXmoLoh2yNsJp8sTPAYuclundFNZH0qhcL/qDZXvBEsoI5XL/4HQTOmcnKtJIgQv5/pfyUp87bxN808T2zHapJ/4RYQCOp+TEA2adYkIFGaLkc8X6UuKGiQGYh1BzRBM6PRk8e6iTEzxUYHrwFFnrc476EgkT1kIDTUkECb8BkVACCmGxigT3UZPhyBp9/7t85dAuCqSPsKoddOOR9rBz0FVqAd6MAUrnf5Y6KpxAd6N5UoidiV4uvlzyGsAiD7CjpSsFWGFrPOfKseHBWLDoI2tYF2YZaS6TC5iMxZ0xhk7KZLJ6HGzpayxed8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0021.namprd12.prod.outlook.com (10.172.77.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 21:09:29 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1c8d:9b3c:7538:477b]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::1c8d:9b3c:7538:477b%4]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 21:09:29 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrw==
Date: Wed, 17 Jul 2019 21:09:29 +0000
Message-ID: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0b291ee-65f4-4757-ddb9-08d70afb0ede
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0021; 
x-ms-traffictypediagnostic: CY4PR1201MB0021:
x-microsoft-antispam-prvs: <CY4PR1201MB002110CC9984C3E9A10E9B72A1C90@CY4PR1201MB0021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39860400002)(366004)(136003)(346002)(189003)(199004)(186003)(4744005)(102836004)(8676002)(6506007)(256004)(4326008)(33656002)(25786009)(316002)(7696005)(66066001)(81166006)(110136005)(81156014)(71190400001)(8936002)(54906003)(26005)(71200400001)(476003)(99286004)(6436002)(55016002)(66556008)(9686003)(53936002)(64756008)(66446008)(66476007)(74316002)(6116002)(305945005)(52536014)(7736002)(86362001)(66946007)(3846002)(68736007)(14454004)(2906002)(5660300002)(478600001)(486006)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0021;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3m2eQMyV7U972qBdKIKIYT4y/hex+I9xBGmxLKw0EScadEQviax10g9GP47kTvRJmCDW/kvMIwum6hKZI6YywIJDQFSprUSvUKxDfGguK6isCxD11QzLBSKkmxFCfmMLopNONra/nIXma7G6DJqQbqVXC8QznPDCLiRPHD0PDk2Fegt4d8NIhasOdXge7TJ790zO4jBvwQcgMvfCX2oAhZKBmqBZGCkhgxoxCs54zmReB3RGtqoNGkOKRZ8NE3vm/SXsSeHE1mI5KhmIU3mFF0SEkkxhUDNgojcqNfv3LsEc3NANGTnShGXSTyS58iLf/5QxYrWOjx9iiCyV0whOMxlAmtxQYM0zuVpExYZCR+Bq2+DCfiJHrIxbe+MXR/voFhEu5pIIrmQ5nS1eh00K3X0BL0vNit0p1ML9H3s5mc4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b291ee-65f4-4757-ddb9-08d70afb0ede
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 21:09:29.7710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abrodkin@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0021
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 18 Jul 2019 07:39:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1563397788; bh=oMgzyMefxkfuJDPpUiJAWzzK9z+tCAGY1s96GhyONuQ=;
 h=From:To:CC:Subject:Date:From;
 b=UeU6qmrtXMJbsNcDy3x1BXyAGgGJC+WaYV010XcrrNMxNFvbKvjWHLUV4PoIIeoyF
 ldHyfNB54SX/xhWHeNujZ0YzK5xM64vf5h8vNmvQC2m0Yy/R2u/JuEaDSCPSt39hK4
 jc7OkS3hfyR+2gN1WI+47COJ0NzLWpnrQfZAtEc3134kROcOuMaGoyCRkp3mUQLYDU
 BvKE0fxrPGsS/NyOCdcb2qIrTFgURX0ht6FwsKoI1yyWXcKq2UowQCg1rTOa4pIQdU
 hzuLME+Au5aTWDUaQEVdI/2dMvXurLcjCuwlJvUihikRT9fDdw67nwN1kRTVi97AE1
 PUBEvlA3Y/obA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaxCEr9ghSmdC4vUAR4GZOTelrm+iqD1427EbYqt4rw=;
 b=ClRbmvmOJYZj0h/bLfSwSQOEeYm3SV+tHHYSwpsL4WCuxy3ooTOhhTAkCSEjiqkM+CLMYAUykd+lJzarE9yVVf+4caEqbZzBt1Boj6g0JL5jomey9SUKXlkeLlOFBJ2WEGpbJhljgfHJUPcLkZZftUhGr/ybdkGfaXBeMiwJ+Zs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=abrodkin@synopsys.com; 
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3YWFk
ZGQ5NmQ1ZmViY2Y1YjI0MzU3YTMyNmIzMDM4ZDQ5YTIwNTMyOgoKICBkcm0vbW9kZXM6IERvbid0
IGFwcGx5IGNtZGxpbmUncyByb3RhdGlvbiBpZiBpdCB3YXNuJ3Qgc3BlY2lmaWVkICgyMDE5LTA3
LTE2IDEwOjM0OjM4ICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6CgogIGdpdEBnaXRodWIuY29tOmFicm9ka2luL2xpbnV4LmdpdCB0YWdzL2FyY3BndS11cGRh
dGVzLTIwMTkuMDcuMTgKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjZWUxN2E3MTY1
NmU5ZTFiNWZmYzAxNzY3ODQ0MDI2NTUwZDVmNGE5OgoKICBkcm0vYXJjcGd1OiByZXdvcmsgZW5j
b2RlciBzZWFyY2ggKDIwMTktMDctMTcgMjM6MzY6NTYgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoaXMgaXMg
YSBwcmV0dHkgc2ltcGxlIGltcHJvdmVtZW50IHRoYXQgYWxsb3dzIHRvIGZpbmQgZW5jb2Rlcgph
cyB0aGUgb25lIGFuZCBvbmx5IChBUkMgUEdVIGRvZXNuJ3Qgc3VwcG9ydCBtb3JlIHRoYW4gb25l
KSBlbmRwb2ludAppbnN0ZWFkIG9mIHVzaW5nIG5vbi1zdGFuZGFyZCAiZW5jb2Rlci1zbGF2ZSIg
cHJvcGVydHkuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkV1Z2VuaXkgUGFsdHNldiAoMSk6CiAgICAgIGRybS9hcmNwZ3U6
IHJld29yayBlbmNvZGVyIHNlYXJjaAoKIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2Rydi5j
IHwgMTYgKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpSZWdhcmRzLApBbGV4ZXkKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
