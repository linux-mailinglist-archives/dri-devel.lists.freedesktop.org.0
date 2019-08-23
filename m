Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0E9B79F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 22:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6156F6ED2A;
	Fri, 23 Aug 2019 20:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740084.outbound.protection.outlook.com [40.107.74.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB116ED2A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 20:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHXGWkBaZITCnWDJKiSQVaFDLICUIGht6w8oBB3MUqsZARrdYtCV6UtFenioIIxdRL2HLVf/hFEtAQqPbI4tX2qz69rZmeZfq2Swkb1NUmFTpbTP3dhimf1Auke7Bshct70zqeLo/Tn6d4uMQgdP5CRIZn7QN+DiJTQuiEOepaaT+gMGfrQVyeo2/6e98RNwEYxXS98n4UFhkkzYqOJT8N58+ySbd5JzLIPIEeTRvAmalnKK7vgoCJmupsQJh+MUH4BmxNeiNBfqFY0C/zW04vdLHpsnJk1Otb82w2PzXMcaiJmwU57YmeGZwaCly0aTrl6SMlfv6DnVN4z7xXWrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmyRQVK8N/ipUKz2EnasUBaXxz0NFecLZSwGN5ary24=;
 b=ILZ/cNaGnnhft9WRpCw6I+sE2xupELkpdMiQguni1Qckeqey97XqDcUi5s9yuMHkPAqkCcPmUlzQN9hpIB1gLGYMzBoUwUWu2t3oB/8UbLMjHf2rYF4ZK2lKs2I1t5T8UbyU8o5OVvjPrmH5G8Rr0zI+gVypWvS9D2T8fEMsyNeGNQFLDmjHG5kFRO7dNnR+PS/aAnV7KQlt/88XmN3AbeQCcGhcw/KOSQeYTl7ZBUyvh4MoWzISrKlU7l/I9Zh6M/qKA+7SyQPVKBMQdeqide0tkidqGpeobP+1iAfBAB5wwoeZ/oWtX8K7KHYRL3QOFGGllQgmJGuFiYYMiU0SVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.67.158) by
 BN8PR12MB3059.namprd12.prod.outlook.com (20.178.210.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 20:24:12 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77%7]) with mapi id 15.20.2178.018; Fri, 23 Aug 2019
 20:24:12 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH v4 0/5] MST DSC support in drm-mst
Thread-Topic: [PATCH v4 0/5] MST DSC support in drm-mst
Thread-Index: AQHVWPGTPvksOSH9PkOo6R/qe6L79KcH2o8AgAFPqTI=
Date: Fri, 23 Aug 2019 20:24:12 +0000
Message-ID: <BN8PR12MB3217665BEE3614FD2396520BEFA40@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190822135741.12923-1-David.Francis@amd.com>,
 <f9d4069b4ff7818db49177527820ebcb5e8b8dc1.camel@redhat.com>
In-Reply-To: <f9d4069b4ff7818db49177527820ebcb5e8b8dc1.camel@redhat.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c67ebfd-5aae-4248-35e9-08d72807dca9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3059; 
x-ms-traffictypediagnostic: BN8PR12MB3059:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN8PR12MB30593A3206BD82DB8AB78824EFA40@BN8PR12MB3059.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(7696005)(316002)(33656002)(256004)(14444005)(76176011)(486006)(478600001)(71190400001)(5660300002)(66446008)(229853002)(9686003)(6436002)(25786009)(52536014)(55016002)(66556008)(53936002)(6306002)(86362001)(2501003)(446003)(110136005)(8676002)(74316002)(66066001)(81156014)(99286004)(476003)(2906002)(26005)(102836004)(76116006)(66476007)(64756008)(305945005)(6506007)(7736002)(8936002)(81166006)(14454004)(66946007)(71200400001)(186003)(53546011)(966005)(6246003)(11346002)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3059;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1gRiNEm+kINQqyDSB8+9ZD0M327JN2s30Sv9XxrCf4R57kRM2jl2FgB6SfsxauHmcIV3+PTUxYaUXFdfBMSg8Qpx6gCBGi7U1oBok6/T04nDHZPJpbzWM04S0YKedjFsf+d7m3pGT2PpgO/tzkeNhvhBVKCGJUI3dvhjC0Z+vaO0cy2iyTBGFT+qgljDYQRm4p0RkS7VG++Fx3aXjPcPX3W4nuKs0L8zgNVgnqXjz9tfbweOZcHlrVMhv+pIoa2fxetH/8eUjyRkBl4AwOYznVew6wFmv6IWlNwVuO/8yPW2mcyA2lcXbUp6Lu4ycXChjhJr8L70piuh/ccTVMETPjKIHd1l2VxYUXegujssDENfSieycRJJ662Tx9v2Jy7DzD7IZ02CKxDMWKZnioAKGMZwsWdNjJZc2daLXtr/qhg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c67ebfd-5aae-4248-35e9-08d72807dca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 20:24:12.5315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IaBRAK81cqT+bXr5s7N9WegoZbZH5nlCoLUK5SUYPQPSWz/D+S+AD32V8iQgPVLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmyRQVK8N/ipUKz2EnasUBaXxz0NFecLZSwGN5ary24=;
 b=0lfWgkV+hNGCLcvrHTNv9fb7GABj3+xY0JwKvgs9Y0vJVyMouUMyf5qyAYWbBgMSb2Ip1rWRV3Jr73KOJJbApCKCUfo97zD0WU/AXIf4TWI8wuvPhcnXi6Yo3OgU7vFGHNMX/WYso1vbFH2LB8mHRQUCAX4SZlxajalm3FcXROI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaW5nIERTQyBmdW5jdGlvbmFsaXR5IHRvIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKCkgaXMg
YSBnb29kIGlkZWEuCkhvd2V2ZXIsIHVudGlsIGFtZGdwdSBzd2l0Y2hlcyBvdmVyIHRvIHRoYXQg
c3lzdGVtLCBJIHdvdWxkbid0IGJlIGFibGUKdG8gdGVzdCB0aG9zZSBjaGFuZ2VzLiBNYWtpbmcg
dGhhdCBzd2l0Y2ggaXMgb24gb3VyIFRPRE8gbGlzdCwgYW5kIGl0IHdvdWxkCmZpeCBhIG51bWJl
ciBvZiBwcm9ibGVtcyB3aXRoIG91ciBjdXJyZW50IE1TVCBpbXBsZW1lbnRhdGlvbiwgYnV0Cml0
J3MgZ29pbmcgdG8gYmUgYSBtYWpvciByZXdyaXRlLgoKTVNUIERTQyBoYXJkd2FyZSBpcyBhbHJl
YWR5IG9uIHRoZSBtYXJrZXQuIEl0IHdvdWxkIGJlIGV4cGVkaWVudCB0bwptZXJnZSB0aGUgcGF0
Y2hlcyB3ZSBuZWVkIGZvciBOYXZpIHN1cHBvcnQgc29vbmVyIGFuZCB1cGRhdGUKZHJtX2RwX21z
dF9hdG9taWNfY2hlY2sgd2hlbiB3ZSdyZSBhYmxlIHRvIHRlc3QgaXQuCgpEYXZpZCBGcmFuY2lz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+ClNlbnQ6IEF1Z3VzdCAyMiwgMjAxOSA4OjAzIFBNClRvOiBG
cmFuY2lzLCBEYXZpZDsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWFuYXNpIE5h
dmFyZQpTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvNV0gTVNUIERTQyBzdXBwb3J0IGluIGRybS1t
c3QKCk9LLWRvbmUgcmV2aWV3aW5nLCBidXQgdGhlcmUncyBzb21lIHN0dWZmIG1pc3NpbmcgaGVy
ZS4gVGhlIFBCTiBiYW5kd2lkdGgKY2hlY2tzIGluIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC8zMjU2MDQvP3Nlcmllcz02NTQyMyZyZXY9MwpuZWVkIHRvIGJlIG1vdmVk
IGludG8gZHJtX2RwX21zdF9hdG9taWNfY2hlY2soKSwgYWxvbmcgd2l0aCBtb3ZpbmcgYW1kZ3B1
IG92ZXIgdG8gdXNpbmcgZHJtX2RwX21zdF9hdG9taWNfY2hlY2soKS4gRG9pbmcgc28gd2lsbCBh
bHNvIGdpdmUgdXMgUEJOIGJhbmR3aWR0aCBjaGVja3MgaW4gYm90aCBpOTE1IGFuZCBub3V2ZWF1
IGFzIHdlbGwsIGFuZCBrZWVwcyB0aGUgYmFuZHdpZHRoIGNhbGN1bGF0aW9uIHdoZXJlIGl0IHNo
b3VsZCBiZS4KCkFkZGl0aW9uYWxseSwgeW91IHN0aWxsIG5lZWQgdG8gbW92ZSB0aGUgY29kZSBo
ZXJlIGludG8gYW4gTVNUIGF0b21pYyBoZWxwZXIKb3IgZHJtX2RwX21zdF9hdG9taWNfY2hlY2so
KSBhcyB3ZWxsOgoKaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyNTYx
MS8/c2VyaWVzPTY1NDIzJnJldj0zCgpVbmxlc3MgSSdtIG1pc3Rha2VuLCBhZGRpbmcgZWFjaCBD
UlRDIHdoaWNoIGhhcyBhIGNvbm5lY3RvciB3aG9zZSBQQk4gcmVxdWlyZXMKcmVjYWxjdWxhdGlv
biBpbnRvIHRoZSBhdG9taWMgc3RhdGUgaXMgc29tZXRoaW5nIGV2ZXJ5IERSTSBkcml2ZXIgaXMg
Z29pbmcgdG8KbmVlZCB0byBkby4gQW5kLCB5b3UgY2FuIGRvIHRoaXMgbW9yZSBlYXNpbHkgYnkg
YWRkaW5nIFBCTiBpbmZvcm1hdGlvbiBpbnRvCmRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUuIFll
cy1pdCdzIGEgbG90IG9mIGxvY2tzLCBidXQgc2luY2UgZXZlcnkgY29ubmVjdG9yCmluIGFuIE1T
VCB0b3BvbG9neSBpcyBzaGFyaW5nIHRoZSBiYW5kd2lkdGggb24gdGhlIHNhbWUgbGluayBpdCdz
IGtpbmQgb2YKZXhwZWN0ZWQuIEkgYWxyZWFkeSBrbm93IEknbSBnb2luZyB0byBoYXZlIHRvIGRv
IGJhc2ljYWxseSB0aGUgc2FtZSB0aGluZyB3aXRoCmV2ZXJ5IGRyaXZlciBvbmNlIEkndmUgZ290
IHRoZSB0aW1lIHRvIGFjdHVhbGx5IGltcGxlbWVudCBmYWxsYmFjayBsaW5rIHJhdGUKcmV0cmFp
bmluZyB3aXRoIE1TVCB0b3BvbG9naWVzLgoKSWYgeW91IG5lZWQgaGVscCBmaWd1cmluZyBvdXQg
aG93IHRvIHN0cnVjdHVyZSB0aGlzIGluIGEgd2F5IHRoYXQgd29ya3MgZm9yCmFsbCBkcml2ZXJz
LCBJJ20gd2lsbGluZyB0byBoZWxwIGFuZCBJJ20gc3VyZSBNYW5hc2kgaXMgYXMgd2VsbC4KCk9u
IFRodSwgMjAxOS0wOC0yMiBhdCAwOTo1NyAtMDQwMCwgRGF2aWQgRnJhbmNpcyB3cm90ZToKPiBB
ZGQgbmVjZXNzYXJ5IHN1cHBvcnQgZm9yIE1TVCBEU0MuCj4gKERpc3BsYXkgU3RyZWFtIENPbXBy
ZXNzaW9uIG92ZXIgTXVsdGktU3RyZWFtIFRyYW5zcG9ydCkKPgo+IHY0OiBTcGxpdCBwYXRjaHNl
dCBhbmQgcmViYXNlIG9udG8gZHJtLXRpcAo+Cj4gRGF2aWQgRnJhbmNpcyAoNSk6Cj4gICBkcm0v
ZHAtbXN0OiBBZGQgUEJOIGNhbGN1bGF0aW9uIGZvciBEU0MgbW9kZXMKPiAgIGRybS9kcC1tc3Q6
IFBhcnNlIEZFQyBjYXBhYmlsaXR5IG9uIE1TVCBwb3J0cwo+ICAgZHJtL2RwLW1zdDogQWRkIE1T
VCBzdXBwb3J0IHRvIERQIERQQ0QgUi9XIGZ1bmN0aW9ucwo+ICAgZHJtL2RwLW1zdDogRmlsbCBi
cmFuY2gtPm51bV9wb3J0cwo+ICAgZHJtL2RwLW1zdDogQWRkIGhlbHBlcnMgZm9yIHF1ZXJ5aW5n
IGFuZCBlbmFibGluZyBNU1QgRFNDCj4KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9hdXhfZGV2
LmMgICAgICB8ICAxMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAg
IHwgIDEwICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyNDMg
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxw
ZXIuaCAgICAgICB8ICAgOCArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI2MCBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKPgotLQpDaGVlcnMsCiAgICAgICAgTHl1ZGUgUGF1bAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
