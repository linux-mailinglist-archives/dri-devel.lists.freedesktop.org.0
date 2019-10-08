Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D4CF47D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 10:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3941789350;
	Tue,  8 Oct 2019 08:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980189350
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kob+Alsvq9HWqO6A+XQ4e7yWqcPsSpFsHz9G0SAtugekmJlqm0pgpv6uZVOWfRdru9SFZxAKd8UqmBWu+fQh4F2p7oIybHH1WEHCOYMrQmDmuhe9eDHvdDJ4/+TvrluPo3jN7swRy4CARxeHlhLpF0RbKVuFfRCV3mmeqtCKjzKOXs4Cy8Y1cIhx3hcV/vNy2CWAsD+XTakEBI7WoSDSWfnmgsTba5KhNZBhM79yFeLNX2iSlj7GS76D3gMsoOCufHUgK+nMa6OOomcpLqUNJwO1NN8wE+oELsPVWCrW5NzccPoI+X8+v8JRmbfuBExyuuprZmgZ2VRHZ3teik/PxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPthsMPMd81Z06zABYxE1Q+JpA0q0Q63t7FE+9QLuu4=;
 b=Z/1lyTLNhJir3FKRoqjS0OHQFRiOO+9J0xk1/azLe/3/uyUT+TlNCEUsY2j/cdrAz34T8deLHsDBW8KeMB5UZZE+eUXSqpndWBMZMMiVDWXZYlMFcGu2E+iCGK+iVaNRiUckDGMSAi6/GkXpjeXElZFlmYDcw5oivdels0+A81z95kE6/0IGX9/Ig+cCbKhEmxk2G4iXRaEs8thryGoSDGgkK2vo1BNtdbUa3AetlU8Wa4rLAE4AVtM6Us4tpW5EnTNTz4zYNOiB8w2j1eNNb8yLiPfExEoC7j4lyrQ+RSusqrmOX4XzeEwMAqVZUTnvkCEUQr6lNdJUsuM0+ckKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1130.namprd12.prod.outlook.com (10.168.237.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 08:04:25 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.025; Tue, 8 Oct 2019
 08:04:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [pull] ttm drm-fixes-5.4
Thread-Topic: [pull] ttm drm-fixes-5.4
Thread-Index: AQHVfUmXvjZaF5zfJEekUt8X3OCS/KdQY2iA
Date: Tue, 8 Oct 2019 08:04:25 +0000
Message-ID: <eb4fe229-8f8d-baca-7bc5-93bcefa63ed1@amd.com>
References: <1eba1bc0-ba0c-b948-6a3d-51a98f4e5c27@gmail.com>
 <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
In-Reply-To: <CAPM=9tyivSLW_DUJuZo9XQ8-0DsdCuPxrzqLUC-1u9riihqLSg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0051.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::28) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ea38632-abc1-419b-6b1b-08d74bc622be
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1130:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB11301BC37750A3D09D0944C9839A0@DM5PR12MB1130.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(6436002)(102836004)(2616005)(8936002)(6306002)(58126008)(36756003)(11346002)(476003)(52116002)(54906003)(305945005)(486006)(5660300002)(6246003)(81166006)(81156014)(6486002)(46003)(8676002)(1411001)(31686004)(6916009)(99286004)(2906002)(6512007)(4326008)(446003)(256004)(25786009)(14444005)(66556008)(66476007)(65956001)(31696002)(71200400001)(386003)(86362001)(478600001)(6116002)(65806001)(66446008)(64756008)(186003)(14454004)(66946007)(229853002)(66574012)(7736002)(966005)(76176011)(71190400001)(6506007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1130;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8PoysF30ivmC4spCbTv3wdZhmqWT3a9BpEwZBvWfP7KJj/n694jlEFayHrJRjndexxdgDe49HdHlpx3YK6Hlf1aoE6V8yH2VsKtkv1IKEhRhpV3lCq7z8sJ4KZtqghwEAGYN5O0zIZfbCFUKFzi06OLDUaffNokmlY1b3oCcDS5p2XES/bUpEp2ZBbkV5UwPaG7Z0f/NrqAMZuy0GpQNxD1DVSCri6JUKDnL9HQrOyEx4/CRN5JcvTCYOGTTRuSFGXc8Vng/eud02gEvarWDbx173nMfojzK+p+HhsG94THIcKgE0VOBLjCUgHtr8HBBxasOrm3L7QQPZKaCS+FJkfGmBnXi+aZaAjE0u7IWeNmKpkCrOyFVkzCE0ZagkruZQF6WpQre9LSfWw8xxtTQn6bDIpRY+f/RfjTG3TBCZMC8bdLe7PpYI+2BIMBWPKO4Q9U9AXWBwq49Qm6WRfgOxQ==
Content-ID: <798E6E6374F4A54C8E275957D8D7BBA2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea38632-abc1-419b-6b1b-08d74bc622be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 08:04:25.7325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1rMoyDrrSSgQDZkRnNx1nAxfqK4fnEO9EosSkcoc5/+Nd5ozHu9Np0qw2SuH8Go
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPthsMPMd81Z06zABYxE1Q+JpA0q0Q63t7FE+9QLuu4=;
 b=uwYV8SPFnhQCy1w8lC62JRlxvc8omzXxIsxpjsvOtaTGg2Ou//purqAqag4bf7C5p+Fz20prNJO8fe6gEBHfVGLSqdgSz9qb8MCMN9dUAGwXOFTJ5tsWwt3PfGMQ/QfV4L2YhxnQdAJ51UymSFb6B55lgExYUbKsNXUZZ6rzT0s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TXkgZ2l0IHZlcnNpb24gc2hvdWxkIGJlIHJlbGF0aXZlIG5ldywgYnV0IEknbSB1c3VhbGx5IHVz
aW5nIHRodW5kZXJiaXJkIA0KdG8gc2VuZCBwdWxsIHJlcXVlc3RzIG5vdCBnaXQgaXRzZWxmIHNp
bmNlIEkgd2FudCB0byBlZGl0IHRoZSBtZXNzYWdlIA0KYmVmb3JlIHNlbmRpbmcuDQoNCkhvdyB3
b3VsZCBJIGRvIHRoaXMgaW4gYSB3YXkgcGF0Y2h3b3JrIGxpa2VzIGl0IHdpdGggZ2l0Pw0KDQpU
aGFua3MsDQpDaHJpc3RpYW4uDQoNCkFtIDA3LjEwLjE5IHVtIDIxOjU4IHNjaHJpZWIgRGF2ZSBB
aXJsaWU6DQo+IEZvciBzb21lIHJlYXNvbiB0aGlzIGRpZG4ndCBlbmQgdXAgaW4gcGF0Y2h3b3Jr
IHdoaWNoIG1ha2VzIGl0IGhhcmQNCj4gZm9yIG1lIHRvIHByb2Nlc3MuDQo+DQo+IFVzdWFsIHN1
c3BlY3RzIGFyZSB1c2luZyB0b28gb2xkIGEgZ2l0IHRvIHNlbmQgaXQgb3IgbWF5YmUgaXQgZ290
IGN0cmwtTXMgaW4gaXQuDQo+DQo+IERhdmUuDQo+DQo+IE9uIFRodSwgMyBPY3QgMjAxOSBhdCAw
MTo0NCwgQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5j
b20+IHdyb3RlOg0KPj4gSGkgRGF2ZSwgRGFuaWVsLA0KPj4NCj4+IHdlIGhhZCBzb21lIHByb2Js
ZW1zIHRoaXMgY3ljbGUgc2VuZGluZyBvdXQgVFRNIGZpeGVzIGJlY2F1c2Ugb2YgbGFjayBvZg0K
Pj4gdGltZSB0byByZWJhc2UgYW1kLXN0YWdpbmctZHJtLW5leHQuDQo+Pg0KPj4gQmVjYXVzZSBv
ZiB0aGlzIEFsZXggYW5kIEkgZGVjaWRlZCB0aGF0IEknbSBnb2luZyB0byBzZW5kIG91dCBUVE0g
cHVsbA0KPj4gcmVxdWVzdHMgc2VwYXJhdGVseSBub3cuIFNvIHRoaXMgaXMgdGhlIGZpcnN0IHNt
YWxsIGJ1bmNoIG9mIGZpeGVzIGZvciA1LjQuDQo+Pg0KPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCA1NGVjYjhmNzAyOGM1ZWIzZDc0MGJiODJiMGYxZDkwZjJkZjYzYzVjOg0K
Pj4NCj4+ICAgICBMaW51eCA1LjQtcmMxICgyMDE5LTA5LTMwIDEwOjM1OjQwIC0wNzAwKQ0KPj4N
Cj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4NCj4+ICAgICBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvY2tvZW5pZy9saW51eC1kcm0uZ2l0IGRybS10
dG0tZml4ZXMNCj4+DQo+PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gM2VlZmNmZTlh
NjQ0YmU0NDA5NjkxYjQ0YzNiMmQ2MjlkMTc3ZmI5YToNCj4+DQo+PiAgICAgZHJtL3R0bTogUmVz
dG9yZSB0dG0gcHJlZmF1bHRpbmcgKDIwMTktMTAtMDIgMTU6NTc6MzQgKzAyMDApDQo+Pg0KPj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPj4gQ2hyaXN0aWFuIEvDtm5pZyAoMSk6DQo+PiAgICAgICAgIGRybS90dG06IGZp
eCBidXN5IHJlZmVyZW5jZSBpbiB0dG1fbWVtX2V2aWN0X2ZpcnN0DQo+Pg0KPj4gVGhvbWFzIEhl
bGxzdHJvbSAoMSk6DQo+PiAgICAgICAgIGRybS90dG06IFJlc3RvcmUgdHRtIHByZWZhdWx0aW5n
DQo+Pg0KPj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICB8ICA0ICsrLS0NCj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAxNiArKysrKysrLS0tLS0tLS0t
DQo+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
