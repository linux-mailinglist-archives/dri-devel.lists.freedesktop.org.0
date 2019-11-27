Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2F10C4FD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D4B6E622;
	Thu, 28 Nov 2019 08:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2C86E2E4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 13:49:32 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D6C44C0095;
 Wed, 27 Nov 2019 13:49:30 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5B506A0079;
 Wed, 27 Nov 2019 13:49:30 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Nov 2019 05:49:30 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 27 Nov 2019 05:49:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYv7UTZv6L0GUrZM+GXigCAzvxkgME/rbHKXKX81s5WGrdHd9i/o9eEWVhw/mMdXHanyjdeiLTCCFtEWSL7O/tro2z/uFWM3cp6E+0J/nTpbLMYj4rENmT67GHr2lyYY6hT0jNiazyOsc90D64aQmy+Ps1O6KMRE7/k8KmkIY9GIn5kIotwIRm0MMpAqX/ja+Tz1U+M7rHIJOv0cGbFRnycUbs8q05e/fqFwdI2h9/H6auw5sJoZkXff6lTSKS5BgeGCeG4X9+IF5bXfqOcznj4bHo5AKZaSlyF8oQhRQMGhV80II3I6VDVy6BZv3hWKs1lipQiJVQUea2Z8eztgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKe1iddQU2zNc4mVcQ2CudE5R7BYCsjjT2qg0OkqMuo=;
 b=gUuSzLo9XfOmhm4OuJstGTR3BNhRuGQUGj4T+993uEZUsA9pQBxf6jpzpZNMc/PaQHpVcD8bqRwD8Gt3uZEvYE7eU5ALRdfY5A34Ux92gigYQSxpFzkzgIGjY60g5LhuAktm0kp/IdHumZ2h5KjNY1XXiXtpq/28o2nND0H4jP+SbEkdUQ3R+n+gCr0fdHcHQKUSbKIGrs3RHwIPmurnHMqHoD/i+jtjdVCgUPf6vIXnY5wxJHYL4xZCS/2vlh5t5T+DWhm/bPnSJRTmubcIbFBVOyTFDhLHWSo4QKSgpUVMSPWZbOS64V+Bia+eflqvcRNgth5Tg/R8f8j4YxqQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com (10.172.78.14) by
 CY4PR1201MB0261.namprd12.prod.outlook.com (10.172.78.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Wed, 27 Nov 2019 13:49:28 +0000
Received: from CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69]) by CY4PR1201MB0120.namprd12.prod.outlook.com
 ([fe80::dd88:2597:6bfa:9c69%9]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 13:49:28 +0000
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Topic: [GIT PULL] drm/arc: Yet another set of minor fixes
Thread-Index: AdWk9uGIdHrNqX0yQ6SZMMOjZA+q3QAE3eIAAAaVHaA=
Date: Wed, 27 Nov 2019 13:49:27 +0000
Message-ID: <CY4PR1201MB01201760E81B40589D182E08A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <CY4PR1201MB012062AAE1D2223BEF3AB204A1440@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191127100634.GE29965@phenom.ffwll.local>
In-Reply-To: <20191127100634.GE29965@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.204.78.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9904db2-b90b-4820-9ff7-08d773409f22
x-ms-traffictypediagnostic: CY4PR1201MB0261:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0261B803494BD09FBA80A229A1440@CY4PR1201MB0261.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(51914003)(199004)(189003)(13464003)(66446008)(53546011)(33656002)(966005)(6116002)(5660300002)(26005)(2906002)(54906003)(102836004)(3846002)(86362001)(186003)(7696005)(4001150100001)(256004)(14444005)(74316002)(4326008)(71200400001)(575854001)(81156014)(76176011)(64756008)(81166006)(14454004)(71190400001)(6246003)(8936002)(6306002)(8676002)(66476007)(6436002)(498600001)(9686003)(229853002)(55016002)(446003)(99286004)(76116006)(66066001)(52536014)(25786009)(6916009)(66946007)(6506007)(11346002)(305945005)(7736002)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1201MB0261;
 H:CY4PR1201MB0120.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D8O+p/qwtoJuMDAKZYcY7s5xjXvs83069tU6teUMYxEKb1BhKBd+ZcCbNgUHnGK43/pfZ6AeTU64I89d7Rl/5Nqz7Md4eMFDcrzMXIndxRqSd0BCrYSq8vuDHMPWv78tLMonwtG/kVzlAr/+wgmlfztI6fHYl89crwfGJgngtzfct6//Ezj2kD7i75XwUmERtT2RxPZy4WijXeFi9d1HuEyiacWb9ehQ+C1yXr4uGwNp2fHj2cys3RRidsfKzfkqMXG/whjkT27F8TspfEZTUJBPgPapuMKiezssnRhsRL+Z2BB0KfeOoVOzdknl1nMPgUxlvboEl3rTZXUj3Py4VtymP/gYi6dZlLwgujX72V2SB5ka2HXUm6Pj1yaKM1V20t4s3NV3j5wc3tKfgxWHvfmdxsi8Vtdvua0efpFXy3+I3XFYTuZ0ynX0F5irYhndqwQPvioHCbZof7HSkf4lcQ7jo3xKRYrMS7dTAPkCluc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9904db2-b90b-4820-9ff7-08d773409f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 13:49:27.9233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrTNWazAGVKOMvtnlpcn02lU15kOautns2wyEX7VfSNfN7WP82iU869yd9fgNHQNYAJ1gQjDY0JO9gT13+cZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0261
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1574862571; bh=KZiQWNf1lJ4TR73RvCDQW4r9WaLz9/T64oweiT/c3gA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UIOp/li8oJvgNKsLQoH9PqkQtGTs1eOzKFPD5fCrtKIoV1xIROuhRUW0RHPb9hOvd
 0Kb88cBY83hq/kMFgGf+Ku+73MxDlc30FFjT/Iem+o9dq28YLyQfixh72cOE5T3yjn
 Schr1z2c+O6JBw2YHTMoWgPbM4boZElcuQZSh1Yq7tFofSrT/5/pIgRncRQnqWFVMy
 D1+PTHna6oE/yqgkG6krasfeGFZWYyoOtPGZM0a/uNmWWRUhZgEq3e9kPGrsbErCmx
 Nkss06jJ5CvnUM+skMu2eixDoW6k8cYLO/qk1ZjyxN8YiNkXleHr47P/SHPMqO5KDJ
 HuM6aTpj9z3yQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKe1iddQU2zNc4mVcQ2CudE5R7BYCsjjT2qg0OkqMuo=;
 b=gGTZHtaWhSW2QLiyUT1xLQ9p5On+Oh+61XobTXra7TespLEH/bOvtgdfdM3E6tM13uO5FDnPYqy8xVdA62ZN0RqVbAIXtIbuWuJ3AkyXxuE3mYAwujklMvzuN9VtBNAnB+GUOkHcZbZCtaDMei4dy1QxNjSIWXLgg4g+arrrJGU=
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
Cc: David Airlie <airlied@linux.ie>, arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAy
MDE5IDE6MDcgUE0KPiBUbzogQWxleGV5IEJyb2RraW4gPGFicm9ka2luQHN5bm9wc3lzLmNvbT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPjsgYXJjbWwgPGxpbnV4LXNucHMtCj4gYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmc+OyBFdWdlbml5IFBhbHRzZXYgPHBhbHRzZXZAc3lub3BzeXMuY29tPjsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbR0lUIFBVTExdIGRybS9hcmM6IFll
dCBhbm90aGVyIHNldCBvZiBtaW5vciBmaXhlcwo+IAo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0
IDA3OjQ4OjA0QU0gKzAwMDAsIEFsZXhleSBCcm9ka2luIHdyb3RlOgo+ID4gSGkgRGF2aWQsIERh
bmllbCEKPiA+Cj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDgwODI3MzE4
MzBhMGI5NWY3ZjdhNjNiNzhkZTY3ZGU0NDYwMTNjODA6Cj4gPgo+ID4gICBkcm0vdnJhbTogcmVt
b3ZlIHVudXNlZCBkZWNsYXJhdGlvbiAoMjAxOS0xMS0yNyAwNzo1MTo0OSArMDEwMCkKPiA+Cj4g
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+Cj4gPiAgIGdpdEBn
aXRodWIuY29tOmFicm9ka2luL2xpbnV4LmdpdCB0YWdzL2FyY3BndS11cGRhdGVzLTIwMTkuMTEu
MjcKPiA+Cj4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYjJjNjhmYjE1YTRjMmUy
N2Y4MDM1M2QzMDY3ZGNlMzA4ODJhMDk3MjoKPiA+Cj4gPiAgIERSTTogQVJDOiBQR1U6IGFkZCBB
UkdCODg4OCBmb3JtYXQgdG8gc3VwcG9ydGVkIGZvcm1hdCBsaXN0ICgyMDE5LTExLTI3IDEwOjM4
OjI0ICswMzAwKQo+ID4KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IENsZWFuLXVwIGFuZCBmaXhlcyBmb3IgRm91
ckNDIGhhbmRsaW5nIGluIEFSQyBQR1UuCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gRXVnZW5peSBQYWx0
c2V2ICg0KToKPiA+ICAgICAgIERSTTogQVJDOiBQR1U6IGZpeCBmcmFtZWJ1ZmZlciBmb3JtYXQg
c3dpdGNoaW5nCj4gPiAgICAgICBEUk06IEFSQzogUEdVOiBjbGVhbnVwIHN1cHBvcnRlZCBmb3Jt
YXQgbGlzdCBjb2RlCj4gPiAgICAgICBEUk06IEFSQzogUEdVOiByZXBsYWNlIHVuc3VwcG9ydGVk
IGJ5IEhXIFJHQjg4OCBmb3JtYXQgYnkgWFJHQjg4OAo+ID4gICAgICAgRFJNOiBBUkM6IFBHVTog
YWRkIEFSR0I4ODg4IGZvcm1hdCB0byBzdXBwb3J0ZWQgZm9ybWF0IGxpc3QKPiAKPiBVaCwgdGhp
cyBzZWVtcyB0byBiZSBiYXNlZCBvbiBzb21lIHJhbmRvbSBzbmFwc2hvdCBvZiBkcm0tbWlzYy1u
ZXh0LCBzbwo+IGNvbnRhaW5zIGEgX2xvdF8gbW9yZSB0aGFuIGp1c3QgdGhlc2UgNCBwYXRjaGVz
IChjb21wYXJlZCB0byBkcm0tbmV4dCkuCgpJbmRlZWQgaXQncyBiYXNlZCBvZmYgb2YgdG9kYXkn
cyAiZHJtLW1pc2MtbmV4dCIuIFRoYXQncyBiZWNhdXNlIEkgc3RpbGwgZ2V0Cmxvc3Qgd2hlbiBJ
IGhhdmUgdG8gZGVhbCB3aXRoIERSTSB0cmVlcyB3aGljaCB3ZSBoYXZlIGEgcGxlbnR5LgoKSSBn
dWVzcyB0aGVyZSBzaG91bGQgYmUgYSBjbGVhbiBleHBsYW5hdGlvbiBvZiB3aGljaCByZXBvIGFu
ZCBicmFuY2ggc2hvdWxkIGJlCnVzZWQgZm9yIHdoaWNoIHB1cnBvc2UsIHJpZ2h0PyBNYXkgSSBo
YXZlIGEgcmVmZXJlbmNlIHRvIGl0IHRoZW4/Cgo+IElmIHlvdSB3YW50IHRvIG1vdmUgYXJjcGd1
IHRvIGRybS1taXNjICh3aGljaCB3b3VsZCBtYWtlIHRvbnMgb2Ygc2Vuc2UgaW1vKQoKQ291bGQg
eW91IHBsZWFzZSBlbGFib3JhdGUgYSBiaXQgb24gdGhpcz8gR2l2ZW4gd2UgaGF2ZSBhIGNvdXBs
ZSBhIHBhdGNoZXMgaWYKYXQgYWxsIGZvciBlYWNoIGtlcm5lbCByZWxlYXNlIEknZCBwcmVmZXIg
dG8gZXNjYXBlIGEgbmVlZCB0byB1c2UgeWV0IGFub3RoZXIKcmVwbywgdG9vbHMgZXRjIGFzIHRo
aXMgZG9lc24ndCBzaW1wbGlmeSBhbnl0aGluZyBidXQgaW5zdGVhZCBtYWtlcyBzaW1wbGUKdGhp
bmdzIG11Y2ggbW9yZSBjb21wbGV4IChpZiBkb25lIHJhcmVseSkuCgo+IHRoZW46Cj4gLSBjcmVh
dGUgYSBNQUlOVEFJTkVSIHBhdGNoIHRvIGFkZCBkcm0tbWlzYyBhcyB0aGUgZ2l0IHJlcG8gZm9y
IGl0Cj4gLSByZXF1ZXN0IHlvdXIgYWNjb3VudCBmb3IgZHJtLW1pc2MsIHNlZSBodHRwczovL3d3
dy5mcmVlZGVza3RvcC5vcmcvd2lraS9BY2NvdW50UmVxdWVzdHMvCj4gLSBhbmQgc2V0IHVwIHRo
ZSBzY3JpcHRzIGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRv
b2xzL2dldHRpbmctc3RhcnRlZC5odG1sIAoKVGhhbmtzIGZvciB0aGUgcG9pbnRlcnMKCj4gT3Ig
cmVzcGluIHRoaXMgb25lLCBidXQgdGhlc2Ugc21hbGwgcHVsbHMgaGF2ZSBhIGhhYml0IG9mIG9j
Y2FzaW9uYWxseQo+IGdldHRpbmcgbG9zdCA6LS8KCldlbGwgSSdkIGJldHRlciByZS1zcGluIHRo
aXMsIHNlZSBiZWxvdy4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYWNjNjFi
ODkyOTM2NWU2M2EzZThjOGM4OTEzMTc3Nzk1YWE0NTU5NDoKCiAgTWVyZ2UgdGFnICdkcm0tbmV4
dC01LjUtMjAxOS0xMS0yMicgb2YgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYv
bGludXggaW50byBkcm0tbmV4dCAoMjAxOS0xMS0yNiAwODo0MDoyMyArMTAwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXRAZ2l0aHViLmNvbTphYnJvZGtp
bi9saW51eC5naXQgdGFncy9hcmNwZ3UtdXBkYXRlcy0yMDE5LjExLjI3Cgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gOWMyYWNjMjZjODk5YWExMmFkMDA5ZGZmMTBhNTU3M2VmNzY5YTdm
ZDoKCiAgRFJNOiBBUkM6IFBHVTogYWRkIEFSR0I4ODg4IGZvcm1hdCB0byBzdXBwb3J0ZWQgZm9y
bWF0IGxpc3QgKDIwMTktMTEtMjcgMTY6NDM6MzkgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNsZWFuLXVwIGFu
ZCBmaXhlcyBmb3IgRm91ckNDIGhhbmRsaW5nIGluIEFSQyBQR1UuCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkV1Z2VuaXkg
UGFsdHNldiAoNCk6CiAgICAgIERSTTogQVJDOiBQR1U6IGZpeCBmcmFtZWJ1ZmZlciBmb3JtYXQg
c3dpdGNoaW5nCiAgICAgIERSTTogQVJDOiBQR1U6IGNsZWFudXAgc3VwcG9ydGVkIGZvcm1hdCBs
aXN0IGNvZGUKICAgICAgRFJNOiBBUkM6IFBHVTogcmVwbGFjZSB1bnN1cHBvcnRlZCBieSBIVyBS
R0I4ODggZm9ybWF0IGJ5IFhSR0I4ODgKICAgICAgRFJNOiBBUkM6IFBHVTogYWRkIEFSR0I4ODg4
IGZvcm1hdCB0byBzdXBwb3J0ZWQgZm9ybWF0IGxpc3QKCiBkcml2ZXJzL2dwdS9kcm0vYXJjL2Fy
Y3BndV9jcnRjLmMgfCAzNiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X3JlZ3MuaCB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKLUFsZXhleQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
