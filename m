Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39557BDE2A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CCC6EBA4;
	Wed, 25 Sep 2019 12:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820074.outbound.protection.outlook.com [40.107.82.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8FE6EBA4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0m5xowIbJ5fMwg3UvvqKISySm8J+JZegTHJR5eR75zNIio5DHiD3XV663MPf2LfpaBK76N1EsZfqHnQeLds3F4vjRjukTaprpCACDXzaqOGJrc5VH15KfeDVKfAW8HhAl24paEJwkuZ02HIxWIJu+T2Vrse3eDYE5gNMmlzQYblU2g1mBx6hyj0wFUaV8qC0IJLQK0nGVWdwDQIXTwHZioypnvp/b1R2He0Hb/uFf0wQ6kk8Vgg2MbhOlbNXLCA4WMUd2jJnrcmSAZovihPMso/Amq9ze1zRLtafuiPfnReM/9cGIno/EWxWeS6d7whePfWQHQLCbbnUxRc7tfJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4vNLewW3nKrn3QlETrmmrlK2bFxgr7L3Tyz/NLSKec=;
 b=Vr3n5sMGgCTERQk0MMZQdEfI5eQE3fNoLX2UYXo4AbYsCWXLCZ8YuebW8o7GC7fNaJL6Y/Xr/i6E3HQpl5oARFpP+55nIEf9ySt9Ehvzk388WgPRTk6yjEKJ0oWpMRQLJhXAEyTyFt2+UT/kylfb/tr6AD5P3AWlfNw/7aFv+KsGceh38Gq0Gmcy3yHrKTAtomBQtuztDVnzJPC/AAEQaLlEcRKnA7y/eU2qYL8C/MGQGC5iQnC3Qj8Mj29+Do/mYgHz0mbIeeSkIC+QXCdqgRFP145y9OoBhp6NCpKekV4L6dfLd3TVROagTgAY9Io5NtQ38M9/eDxs9v1K/vC2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6655.namprd05.prod.outlook.com (20.178.246.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.12; Wed, 25 Sep 2019 12:38:44 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977%2]) with mapi id 15.20.2305.013; Wed, 25 Sep 2019
 12:38:44 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>
Subject: Re: Re-review? WAS [PATCH 2/7] drm/ttm: Remove explicit typecasts of
 vm_private_data
Thread-Topic: Re-review? WAS [PATCH 2/7] drm/ttm: Remove explicit typecasts of
 vm_private_data
Thread-Index: AQHVc50Hbw0JM7w/qEWvrOJfn2VIsg==
Date: Wed, 25 Sep 2019 12:38:44 +0000
Message-ID: <MN2PR05MB6141CBA945C146354AD4125BA1870@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20190918125914.38497-1-thomas_os@shipmail.org>
 <20190918125914.38497-3-thomas_os@shipmail.org>
 <5e4546771edfd92291538612676c64e47d139cc2.camel@vmware.com>
 <97f96346-9954-ae43-8687-acdc5723777b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46cba1c6-1922-4bd0-8ea1-08d741b54d90
x-ms-traffictypediagnostic: MN2PR05MB6655:
x-microsoft-antispam-prvs: <MN2PR05MB665591A80FAFF1EDEEFB9CE4A1870@MN2PR05MB6655.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(189003)(199004)(74316002)(66066001)(5660300002)(26005)(14454004)(8676002)(316002)(99286004)(6436002)(55016002)(52536014)(5640700003)(33656002)(81156014)(3846002)(2501003)(6116002)(81166006)(66946007)(66476007)(186003)(64756008)(66556008)(66446008)(91956017)(76116006)(71200400001)(66574012)(476003)(486006)(2351001)(14444005)(256004)(6246003)(446003)(9686003)(102836004)(71190400001)(8936002)(6916009)(25786009)(305945005)(478600001)(6506007)(2906002)(53546011)(229853002)(76176011)(7696005)(7736002)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6655;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ypLuiUT2xLOMbVr2CUULLcpyfzL7oVSewwz60lVcTmNnYOPbnfz3rb9oiUX7je+6xJme+lX6C5a0CN27/yzJ9acyLQ1BlbVaM617/p91cAfs0Ll47XR9uupy1fy8pqTo9gKf5cfX3i71n1UEDigRt+oCp+jdzQXqW5FbimZssCeEwg1koce8xggpdv6ymh/TYsduAJLVFgsem1uxt2+s60SYYTKj5P3Z2RJ3LR/b4kcXaWQQuLV61yl/VJ72C9iuPo3lQeyo8+BcrNPAj7gOKRjQD/sFqm2SE87bRFg8fePQQKkiJnxDNn+v6R5D9//ESr/dCdlxxTJ+9sW8FDdwbj1tDL/eQbyVOiFiyZirmtT/QauRIfqD4HQ4GK+mRIpZioxkCBCYhRC7N2lH6WdePkPxIfjlf1WecUbPu4b7JM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cba1c6-1922-4bd0-8ea1-08d741b54d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 12:38:44.0790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95XDyTsLip2pmkF1sTvy7sfCbgk42hKsdj8hltnaVMb0vLLEOUt8rnCNWadjmNYQJyi5QNrHg8YU2n0WYROOEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6655
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4vNLewW3nKrn3QlETrmmrlK2bFxgr7L3Tyz/NLSKec=;
 b=sYKuPxv+J/gZNuHFnAXmPaKqGLMmVGaO/vJG4f0H357LGX1d9+VjOQqf1Rjf7dxFSDIxU+to+SWFsbLG7uu/ZkswpblTBCQzVhYTFd5sdK7jTihSh2sRp7f3M2GEQp3yGKslxlpMPAery47J5zoAvp9T1s6W/Rjws6PMAT55r98=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yNS8xOSAyOjMwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEhpIFRob21hcywK
Pgo+IHRoaXMgb25lIGFuZCBwYXRjaCAjMyBhcmUgc3RpbGwgUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+IEFueSBvYmplY3Rpb25z
IHRoYXQgSSBjaGVycnkgcGljayB0aGVtIG92ZXIgaW50byBvdXIgYnJhbmNoPyBVcHN0cmVhbWlu
ZyAKPiB0aGF0IHN0dWZmIGdvdCBkZWxheWVkIHF1aXRlIGEgYml0IGFuZCBJIHdhbnQgdG8gYmFz
ZSBhIGNsZWFudXAgb24gdGhpcy4KPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCgpTdXJlLCBwbGVh
c2UgZG8uIFdlIGNhbiBzb3J0IG91dCBhbnkgbWVyZ2UgcHJvYmxlbXMgbGF0ZXIuIExldCBtZQpx
dWlja2x5IGZpeCB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgcGF0Y2ggIzMgc2luY2UgaXQgZG9lc24n
dCByZWZsZWN0IHRoYXQKd2UgZXhwb3J0IG1vcmUgaGVscGVycywgYW5kIEknbGwgc2VuZCBvdXQg
dGhlc2UgdHdvIGFzIGEgc2VwYXJhdGUgcGF0Y2hzZXQuCgpUaGFua3MsClRob21hcwoKCgoKPgo+
IEFtIDE4LjA5LjE5IHVtIDE1OjIwIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHJvbToKPj4gSGksIENo
cmlzdGlhbiEKPj4KPj4gU2luY2UgSSBpbnRyb2R1Y2VkIHRoaXMgcGF0Y2ggYW5kIGNoYW5nZWQg
dGhlIFRUTSBWTSBoZWxwZXIgcGF0Y2gKPj4gZW5vdWdoIHRvIG1vdGl2YXRlIHJlbW92aW5nIHlv
dXIgUi1CLCBJIHdvbmRlciB3aGV0aGVyIHlvdSBjb3VsZCBkbyBhCj4+IHF1aWNrIHJldmlldyBv
biB0aGVzZSB0d28gYW5kIGlmIE9LIGFsc28gYWNrIG1lcmdpbmcgdGhyb3VnaCB2bXdnZng/Cj4+
Cj4+IFRoYW5rcywKPj4gVGhvbWFzCj4+Cj4+Cj4+IE9uIFdlZCwgMjAxOS0wOS0xOCBhdCAxNDo1
OSArMDIwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4+PiBGcm9tOiBUaG9t
YXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Pgo+Pj4gVGhlIGV4cGxpY2l0
IHR5cGNhc3RzIGFyZSBtZWFuaW5nbGVzcywgc28gcmVtb3ZlIHRoZW0uCj4+Pgo+Pj4gU3VnZ2Vz
dGVkLWJ5OiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+IC0tLQo+
Pj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgOCArKystLS0tLQo+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4+IGluZGV4IDc2ZWVkYjk2MzY5My4uODk2MzU0NmJm
MjQ1IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+Pj4gQEAgLTEwOSw4ICsxMDks
NyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fYm9faW9fbWVtX3BmbihzdHJ1Y3QKPj4+IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKPj4+ICAgc3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2Zh
dWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4gICB7Cj4+PiAgIAlzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+Pj4gLQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
ID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKQo+Pj4gLQkgICAgdm1hLT52bV9wcml2YXRl
X2RhdGE7Cj4+PiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZh
dGVfZGF0YTsKPj4+ICAgCXN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Cj4+
PiAgIAl1bnNpZ25lZCBsb25nIHBhZ2Vfb2Zmc2V0Owo+Pj4gICAJdW5zaWduZWQgbG9uZyBwYWdl
X2xhc3Q7Cj4+PiBAQCAtMzAyLDggKzMwMSw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192
bV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQKPj4+ICp2bWYpCj4+PiAgIAo+Pj4gICBzdGF0aWMgdm9p
ZCB0dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4+ICAgewo+Pj4g
LQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0KPj4+IC0JICAgIChzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKil2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+ICsJc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+Pj4gICAKPj4+ICAgCVdBUk5f
T04oYm8tPmJkZXYtPmRldl9tYXBwaW5nICE9IHZtYS0+dm1fZmlsZS0+Zl9tYXBwaW5nKTsKPj4+
ICAgCj4+PiBAQCAtMzEyLDcgKzMxMCw3IEBAIHN0YXRpYyB2b2lkIHR0bV9ib192bV9vcGVuKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdAo+Pj4gKnZtYSkKPj4+ICAgCj4+PiAgIHN0YXRpYyB2b2lkIHR0
bV9ib192bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4+ICAgewo+Pj4gLQlz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
KXZtYS0KPj4+PiB2bV9wcml2YXRlX2RhdGE7Cj4+PiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+ICAgCj4+PiAgIAl0dG1fYm9fcHV0KGJv
KTsKPj4+ICAgCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gTlVMTDsKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
