Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBBAFC123
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEB76E2D3;
	Thu, 14 Nov 2019 08:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 13 Nov 2019 11:35:37 UTC
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C0B89A98
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:35:37 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6215FC0E94;
 Wed, 13 Nov 2019 11:30:31 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4F127A007B;
 Wed, 13 Nov 2019 11:30:29 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 13 Nov 2019 03:30:30 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 13 Nov 2019 03:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixz58hTuvyO96Uwwq8ceLdOxMwW9JBZV9hCnCeQtzxlHoaUebayshhm/v0+6qqg/DrIJMI65pXf9vIp26LDvAXOytVEZIH8SY8QXLVihgqi1PoH0FdhxFDd6vzXOu23YZKSPzoUFLaYv6dHZuFt2fwMsefDguIXlYcfvCW5N8TL386KMd9EMrFSZLfQFDw6r8ynQ8wt+qj0YSA/q3BCt/u4hK8Tl4iaAx2lHDv0iWRhx9OnVjQzKVVVO03SV3ALS3BQgJTdSYzSsXvqbrHYezFTNK3K6K6J11Z+OhgtnFZTWNqKVlBjIqzHHIaP1SQukaOewduFWkQ34Z1wtJ+rRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcXRyQC0vQiV6bTxinskrV4zuYqy6q4nVsYQhqbU4jA=;
 b=dAcV4NJplS0MjPuEU32bY9zNX3TxW7lVkDR/8ZtmHNlvxrlJjIk4VXeoz4ZSipEeM1NcPvi1E9z3BVa0hHq3D7WLfZpejJXKG/dprfjorNHJzKrXMaDZ9PR9Ym5ikjeUpIW25tCxeuQbrTJLmmCzdzxIlYKicVdJiuEld1r6dBda5LA5rPyNd1aeCT0E/0Nt+hidOzayvPj+1KkkmO/ARF60GVLoXmIKhkg1TwqrKtQzJDEoFlRM2iSYJfKiJzEnyKMur2PrDwyeNQLcVkjuQfNLUkKcqzASXMQDTLIt+G83hGhbcYceWvr63CBgLqBWbcKE3j0dLpu06qO7ypBsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0231.namprd12.prod.outlook.com (10.174.54.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 13 Nov 2019 11:30:28 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3049:a98a:7419:838]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::3049:a98a:7419:838%9]) with mapi id 15.20.2451.023; Wed, 13 Nov 2019
 11:30:28 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: RE: [GIT PULL] drm/arc: Minor improvements
Thread-Topic: [GIT PULL] drm/arc: Minor improvements
Thread-Index: AdU84kwKkbpOuRO9SbWDn3t0PURjrxdMyW8w
Date: Wed, 13 Nov 2019 11:30:28 +0000
Message-ID: <CY4PR1201MB0120267C8184D31C677A6B37A1760@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR1201MB0120FDB10A777345F9C27720A1C90@CY4PR1201MB0120.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2df98b98-dc8d-4729-279d-08d7682ce295
x-ms-traffictypediagnostic: CY4PR1201MB0231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB023147F11CF33A7070E3E8ADA1760@CY4PR1201MB0231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:303;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(346002)(39860400002)(136003)(13464003)(199004)(189003)(66946007)(64756008)(66556008)(66476007)(476003)(66446008)(486006)(14454004)(74316002)(478600001)(25786009)(186003)(26005)(7696005)(76176011)(11346002)(7736002)(33656002)(52536014)(305945005)(5660300002)(53546011)(6506007)(102836004)(446003)(6436002)(54906003)(4326008)(6246003)(110136005)(107886003)(316002)(9686003)(6116002)(3846002)(8676002)(99286004)(76116006)(81156014)(81166006)(55016002)(86362001)(2906002)(8936002)(256004)(66066001)(71200400001)(229853002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0231;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 39RXhrtZL7eui2DBXW/UenCYPQqUyt7Vj0ZeBtbyt6Gdp4AILqKK50qhD5m9oUX8Hyxl+QtK+x3V2gK8tffG+9/tCBBQQH14emgPZFGUw4Gp/FZeea8IxHnYF0SPM9ExxsjGzHxhDoDdf4obYri/zWA3Wxzsdn0fqVlihDlMrxniT7iVwCUDGQDM2vGHHGLbGYaNTHKaF8zp0oPIJo41lqTPTPn690UAkhzCTsU9RdtLjafO0ymYs28mtyjFrnwp80PrNJWRUvPelunXbrj0UdIZuQzUHvqBkLBUyCfPCk22W0h/+06Ucsk07QBJvQcdRqB5RPgpj9P5d0P2WFXvSBA4Tgaq/fgsxFcfLOzAPkU5gDuF+xi9rvpQwSarV/iAzca9JYtUYjL+p0nl39QGlDxfhL4t5R/pBmysljmE50aCW383irhxXdVwNCfohzDj
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df98b98-dc8d-4729-279d-08d7682ce295
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 11:30:28.4560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvbNFvkXf9YGzLWt+AyWVygbEpS7JftOCGyk9tNVfpM5jHTch3at2yXwkLj0V3d1Qle2cU8HbQrX5+oKCtBjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0231
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1573644633; bh=2jbuiDULVEcs/T9Z7F1VZPUV29jJc41wFANmGaKydIs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=X6B+IXvKnlm2fcLPQYkpW9a9nxHTGbTQkRRLgvjjcEetvPkyGjLB8KiM27St/azHc
 YINw6MhCmLv+g1U66zn4zDmAuA4fCb3MqPSc50OGI5Vs5+T64bxYaduoIgwEz+rj3J
 8YQdJ8oDZS7W32/zKy5kRkSlqLeAFtKY4O0h35oJZcpMOdEvBHeZMx6Ag7iCJ1TIYI
 kRYD+abWL6tx/iNDZxcDZhdYsccoUCUsK+DNodIb49brI5ZAOKKMX67e65/2uFcxEv
 rwy8CmFecth8LZwrOXVsixpAAwUSMGHZi1PSb9djvKMAGeao8Ym34ODWdjbsD6lxjb
 n1QeVXpiYdAhg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcXRyQC0vQiV6bTxinskrV4zuYqy6q4nVsYQhqbU4jA=;
 b=GA4hWucN31VyziUZj7LIFQqCkWnpNCcYFI9NzZBMHDlxQT///F3ru0imB2GGN4QBXZ9QHKsq6GZm/22PflE91RGvdaUP52WakU56zob+LWtpfCvq2S/Qq+N6rg4O8Xd7U+TSDwuTrqRQGqt51L9gT7wmwR/asdZ4Drfr8GM+L2U=
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

SGkgRGFuaWVsLCBEYXZpZCwKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBs
aW51eC1zbnBzLWFyYyA8bGludXgtc25wcy1hcmMtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3Jn
PiBPbiBCZWhhbGYgT2YgQWxleGV5IEJyb2RraW4KPiBTZW50OiBUaHVyc2RheSwgSnVseSAxOCwg
MjAxOSAxMjowOSBBTQo+IFRvOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IGFyY21sIDxsaW51eC1zbnBzLWFyY0Bs
aXN0cy5pbmZyYWRlYWQub3JnPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1
YmplY3Q6IFtHSVQgUFVMTF0gZHJtL2FyYzogTWlub3IgaW1wcm92ZW1lbnRzCj4gCj4gSGkgRGF2
ZSwgRGFuaWVsLAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgN2FhZGRk
OTZkNWZlYmNmNWIyNDM1N2EzMjZiMzAzOGQ0OWEyMDUzMjoKPiAKPiAgIGRybS9tb2RlczogRG9u
J3QgYXBwbHkgY21kbGluZSdzIHJvdGF0aW9uIGlmIGl0IHdhc24ndCBzcGVjaWZpZWQgKDIwMTkt
MDctMTYgMTA6MzQ6MzggKzAyMDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6Cj4gCj4gICBnaXRAZ2l0aHViLmNvbTphYnJvZGtpbi9saW51eC5naXQgdGFncy9h
cmNwZ3UtdXBkYXRlcy0yMDE5LjA3LjE4Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIGNlZTE3YTcxNjU2ZTllMWI1ZmZjMDE3Njc4NDQwMjY1NTBkNWY0YTk6Cj4gCj4gICBkcm0v
YXJjcGd1OiByZXdvcmsgZW5jb2RlciBzZWFyY2ggKDIwMTktMDctMTcgMjM6MzY6NTYgKzAzMDAp
Cj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IFRoaXMgaXMgYSBwcmV0dHkgc2ltcGxlIGltcHJvdmVtZW50IHRoYXQg
YWxsb3dzIHRvIGZpbmQgZW5jb2Rlcgo+IGFzIHRoZSBvbmUgYW5kIG9ubHkgKEFSQyBQR1UgZG9l
c24ndCBzdXBwb3J0IG1vcmUgdGhhbiBvbmUpIGVuZHBvaW50Cj4gaW5zdGVhZCBvZiB1c2luZyBu
b24tc3RhbmRhcmQgImVuY29kZXItc2xhdmUiIHByb3BlcnR5Lgo+IAo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBFdWdl
bml5IFBhbHRzZXYgKDEpOgo+ICAgICAgIGRybS9hcmNwZ3U6IHJld29yayBlbmNvZGVyIHNlYXJj
aAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9kcnYuYyB8IDE2ICsrKysrKysrKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpBbnkgY2hhbmNlIGZvciB0aGlzIG9uZSB0byBnZXQgcHVsbGVkIGludG8geW91ciB0cmVlKHMp
IHNvbWV0aW1lIHNvb24/CgotQWxleGV5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
