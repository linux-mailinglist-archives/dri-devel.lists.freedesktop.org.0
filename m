Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C134A10C50F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077736E632;
	Thu, 28 Nov 2019 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 420 seconds by postgrey-1.36 at gabe;
 Wed, 27 Nov 2019 07:55:57 UTC
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8466E1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 07:55:57 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 287D8C008F;
 Wed, 27 Nov 2019 07:48:53 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 71607A0069;
 Wed, 27 Nov 2019 07:48:53 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Nov 2019 23:48:06 -0800
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 26 Nov 2019 23:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7NjrtWsjCqyG7+CiAHd6Ul+KY1gM4BsoDuXPo5CIxs/ixjBjOAu7/VSYUIFJ8P/Lw7MfNsXOR+ecPigjbVNi6Km7V/zl+XB+m9iFrn5HGlS+bcPBGIJ1BAdi5X4NLuRimxEeHglK1EfCbZ5C5YO5cQXZrpGrPVljZoBMPCeC+1/g3aBCXlxWquPO9dNdf/r+7N40nmSdUkht8NHTtUw0kncCxsAEL/S59nNPOSNnJYyz8rxiuHXLQVx6laNpvzja/lGtwkMcRFPwF2h8/oemnsc30H2kFkptsAC5YXp11mV1OaH+9/zUF7N640PdKvqeoCelbK/LjHhs7gvNZKLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q4ii8KQulDFHwssmIsvl2zKeXzwBQw5EdPyuUEaUMA=;
 b=iDiu8QmnlbJaqAmZbumOMYmnUbQ4kBIBloVPRcy2ZpXpBpFnIq3N3keV0hyYyZOqMXWWYKby0D85r94a0RUnXM7anjIrekZXFn3sduUVumRK3E/1LEFSPM03Lvv5ls0VvNi/Lc56rCnFw5j60ECR6lCdELlXNT8zxWBHXGffQsW8+W0tSNPG/dd8qgGygKr0/gJ01IY+cSVdPjIbmSYEfYF1gsL7UmY8bryEEXQ1Hwnp5nPzo/A5WkUM6lUJViGO6eHzV22Nn9TBObOTTpFxzpTz3WR9kL+txQtZ7Em/WJfO8LerKq2SV1I7NPqKPuJzSqQQ+Mk68N05zh3S4/VCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Wed, 27 Nov 2019 07:48:04 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 07:48:04 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Topic: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Index: AdWk9uGIdHrNqX0yQ6SZMMOjZA+q3Q==
Date: Wed, 27 Nov 2019 07:48:04 +0000
Message-ID: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0d801ae-2443-43cd-cff2-08d7730e22bb
x-ms-traffictypediagnostic: CY4PR1201MB0102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB010264DB131B8C065FABCB9EA1440@CY4PR1201MB0102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(4001150100001)(102836004)(7736002)(74316002)(305945005)(99286004)(6506007)(5660300002)(256004)(9686003)(55016002)(316002)(26005)(33656002)(186003)(8936002)(54906003)(71190400001)(6436002)(7696005)(66066001)(3846002)(52536014)(8676002)(6116002)(66946007)(81166006)(66556008)(66476007)(66446008)(478600001)(64756008)(2906002)(81156014)(14454004)(76116006)(4326008)(25786009)(86362001)(71200400001)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0102;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ujKGM7dlpDYLUbsE7nGYOmbS1yai/wPYklJvzlunDVi77e+rk296v5HkaCw5sdOI8+l+0bLkfDuMt8y8eRyP4mUj4GkQ4vj2RFG3txD3wRh36SrLOykM2HgcV1Qag3KZ8/hw3K1dwV+m5wHdR0/DeQa+zpzJ6XYXxD++f7DPM7tXToOpx0PjoII+f8yKinD1W+rIpAa9GW79o0jTyqyn1/AhPP8Q8+v2jxVRqeweTj2eEJGsI0ckjh/WH/7jZyw+GzZbaOBmfs81O6bevU+WkjrWqMJ6ipBjnqTyCF55lXWDW9sAL57sTmPhXad/M65I57YaQUBd164gJgMsPEdCBcLXfEF0ovhClgAgyEu5ZuZmKTjI2WDhuxYj8xeMQVosgMdIn0KlsAw3Nrt4xaqsGxoaf9UfRpMtKb/OHaxpm7j6nN6bLWjywNBbp3GFbza0
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d801ae-2443-43cd-cff2-08d7730e22bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 07:48:04.4285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YT7+/Oa/4/Lab1J7BsIBjRacCExzFwUHDFGgWMLa5Ibfl2Rgl0ftOuLGAI8HrXYzrJCk8YMQQGUnh/tjBZ6Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0102
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574840936; bh=j+JxVLun5KMJTetqvtzbMunQK5SoGQGC3QR/l8xl+cs=;
 h=From:To:CC:Subject:Date:From;
 b=JYxSjMbnEavkY47ZJskwCzq3WQKMvoDwU/65OTg89xgHjnwZzx63E6QKkZ4Vap2qU
 cmCwbKzFdJQyDd1Vs8uEeAV1JwYACy0GbIgwpxaH1WTHOL9YV5HD++vZUBAuGd6r3Q
 prpTf3zMJuy1ZTFc+qlzJnQci6oXVfjGmW2Tk2h1799Ke/pvE+yZuj0q1pVR6f6n2A
 CD7r6XLOsFyKROoIeYMjnDOtjlhI3sYJAP3voF+K4HPymfIKMkxqLFxkS+oDuElJD0
 KZ0C0hLdWOos/kdcY7L8sEpVx3ZlEXmCIYi3UB+bbNLvIPR7k29iZXynHe9pABZVbc
 rj5aA4Qxuxa2A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q4ii8KQulDFHwssmIsvl2zKeXzwBQw5EdPyuUEaUMA=;
 b=HTeezfkMrO9+35MaIr25pmcB0DNJUCbzbecgrsdsw6YEfFIIRcI/0FkL+SG03fcJnl8KT0umrgkirZL4OTU+ZZ/3FEqycicyxCBHjL//qKDThidOXsGHkrRm2c1cJiFTsZdlX8tKwt2Y6n1Lc7InNlaIEGNNs8l+GNrjMJCWi6g=
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
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsIERhbmllbCEKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODA4
MjczMTgzMGEwYjk1ZjdmN2E2M2I3OGRlNjdkZTQ0NjAxM2M4MDoKCiAgZHJtL3ZyYW06IHJlbW92
ZSB1bnVzZWQgZGVjbGFyYXRpb24gKDIwMTktMTEtMjcgMDc6NTE6NDkgKzAxMDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0QGdpdGh1Yi5jb206YWJyb2Rr
aW4vbGludXguZ2l0IHRhZ3MvYXJjcGd1LXVwZGF0ZXMtMjAxOS4xMS4yNwoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIGIyYzY4ZmIxNWE0YzJlMjdmODAzNTNkMzA2N2RjZTMwODgyYTA5
NzI6CgogIERSTTogQVJDOiBQR1U6IGFkZCBBUkdCODg4OCBmb3JtYXQgdG8gc3VwcG9ydGVkIGZv
cm1hdCBsaXN0ICgyMDE5LTExLTI3IDEwOjM4OjI0ICswMzAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDbGVhbi11cCBh
bmQgZml4ZXMgZm9yIEZvdXJDQyBoYW5kbGluZyBpbiBBUkMgUEdVLgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpFdWdlbml5
IFBhbHRzZXYgKDQpOgogICAgICBEUk06IEFSQzogUEdVOiBmaXggZnJhbWVidWZmZXIgZm9ybWF0
IHN3aXRjaGluZwogICAgICBEUk06IEFSQzogUEdVOiBjbGVhbnVwIHN1cHBvcnRlZCBmb3JtYXQg
bGlzdCBjb2RlCiAgICAgIERSTTogQVJDOiBQR1U6IHJlcGxhY2UgdW5zdXBwb3J0ZWQgYnkgSFcg
UkdCODg4IGZvcm1hdCBieSBYUkdCODg4CiAgICAgIERSTTogQVJDOiBQR1U6IGFkZCBBUkdCODg4
OCBmb3JtYXQgdG8gc3VwcG9ydGVkIGZvcm1hdCBsaXN0CgogZHJpdmVycy9ncHUvZHJtL2FyYy9h
cmNwZ3VfY3J0Yy5jIHwgMzYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9yZWdzLmggfCAgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKClRoYW5rcywKQWxleGV5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
