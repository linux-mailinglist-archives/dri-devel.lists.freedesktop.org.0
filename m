Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96533B493C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9675D6EB57;
	Tue, 17 Sep 2019 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740048.outbound.protection.outlook.com [40.107.74.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4A76EB55;
 Tue, 17 Sep 2019 08:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHyQCU0JlcGNGhXto8vP5A+LD+N+tXNQ86sKJusQ4asXjhJWfZb/Qc4TeGcPffUSDNbDunJ19sMp/Vvt77IO1a4nFxPa1BcKMCBfjXrY0KVH/l/h5+T7umpfoJHMGXe5hbwgtj5AtpV84uTIKtFmje/VVpC7IRfdfsmgZLLFgrTgflzil9tsUiq1bGbKNHuSUsMd3kDA4R28Oags/awzPPJIu4JYa4JBi5+U1k5qxA6FT2E+iX4XNrBYA9ezRMehy3AFoP/9OQix8qF8KJCuUTncXJxmuX8LO9Afj+kNJMLCg2k9MTB++cMKPQA3XK09nt5fCWJfZOWBztqx+dduhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHVy1nX+QLEq8aEjrtIylj0KXDfrtxVlKG8oA1GRuUo=;
 b=jFsRMpqx1YxQQ/lYh7AcMBqfIH7NXSdyg8d7+Tywgu5zvq4Dmtp+dqDp/YZ3b2Ft6JJ2Jdr+ceemEbyAzBJt0wA60B9BDyoKFYivdjEa31LkPcydXPnDPvX/o3u9VVmZQm7n/snIIDXuJoKL/p1w8vb0AtZIvRl0ZiKoZHP3S4D2w50EAYn0wNfQ1U6Nb1ICWtIJ+97rd9WAV7xP1UlfyV2ekIL3ViJRqTGrkT1heIdxFMYDlq3z1XtAJxYissDrDlwLJnAFtUQ1SP+CigeCXtESjhHb2qf2CU8P66YwVakvVUHxvB7K4Z7aOnWcNd6xuf580vNz6mjgsuXIKPDPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1932.namprd12.prod.outlook.com (10.175.89.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 08:23:17 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 08:23:17 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: add drm device name
Thread-Topic: [PATCH] drm: add drm device name
Thread-Index: AQHVbTBzXIRH0+L+eUK6in091d273acvh+kA
Date: Tue, 17 Sep 2019 08:23:17 +0000
Message-ID: <7540df63-e623-19b0-dde5-b89ff2b7fb89@amd.com>
References: <20190903214040.2386-1-sonny.jiang@amd.com>
 <CAAxE2A45N4gMYrcETDpznGKyxLztuwenFasL19a81QQmBkYiww@mail.gmail.com>
 <CAF6AEGvvUUOGujJC9P3t72N93AJuxiiVt0OAk8zf226Q8WmHvg@mail.gmail.com>
 <CAKMK7uHFNhdNY4Y9ZFMNuci7gssPWCT5f5y=e4npg8s5r_jBdQ@mail.gmail.com>
 <CAAxE2A6sESsKAi3K1etAZeCwAPgexn099G6g0aJQnavTkiH+mA@mail.gmail.com>
 <87woe7eanv.fsf@intel.com> <03d31464-3968-6923-5323-f63060d70f1f@gmail.com>
 <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
In-Reply-To: <CAKMK7uEj4FZ3YQqG-cCTa4EEaJoAk09Zaz398F9Hmo+mdXCKiw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::19) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831f013b-ff0d-4151-df48-08d73b484acb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1932; 
x-ms-traffictypediagnostic: DM5PR12MB1932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1932F9480ACD880CEE67130A838F0@DM5PR12MB1932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(199004)(189003)(86362001)(478600001)(305945005)(6246003)(256004)(6116002)(486006)(58126008)(7736002)(54906003)(6916009)(2906002)(316002)(65956001)(25786009)(31686004)(4326008)(476003)(186003)(14454004)(76176011)(102836004)(52116002)(36756003)(53546011)(6506007)(229853002)(64756008)(65806001)(386003)(2616005)(446003)(8936002)(66946007)(11346002)(5660300002)(81156014)(8676002)(31696002)(81166006)(71190400001)(66446008)(6512007)(6436002)(66556008)(46003)(6486002)(99286004)(71200400001)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eFhbrt6b99uSLESfjXsvHvTgPwwtvTYeGTZ06b7FuOBJvjqTLkddyisHp4DBVotuRdlFlvDK0H1FZ6i9FbVI4kOHOyC3aAue7GGE9GdQaqwyrJxgQSu9Q3IfOUo+nfDJfiyHiRDs5PLyOY92DmTJ1Ub7PbVaNh7OaFPtM94vuPLlrT2+g1aUiMkjfOhufcdtK7WmQhfeB988tCCfsIPyvgdVPcWnPgUgX15m3wTmoO0RNiEueSjf97O3NnoHXwhQ2gipVFYgGf0WCeTC3Zv9p/yQiqLKlzsu0b1Bw6PEMJGjUoahTVtwXr/PqMY+2KAHY6SvykJt2r4aWuZCjI/wHvPlgn3yXOU3/C0X6Bgm9ZGaNssH8mq3mszj5mjO80EzuLkkMUNI7rs3v3yIb1hKVRAf0o2ddu8l3zxRcR0NILk=
Content-ID: <628384EB7C10204CA594E3A629A3D2B3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831f013b-ff0d-4151-df48-08d73b484acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 08:23:17.7922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4AeFVWXQR/hexDq4uxbZkGt7v8iD8boUgxaZldksj+Zm2oO/FSKzcnKzsosoWe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHVy1nX+QLEq8aEjrtIylj0KXDfrtxVlKG8oA1GRuUo=;
 b=W91ErwlZXV2A4XJxUJVk/5PBFrI/h0BMnlX/hNgGTrajTlf1BeF9EmmQF+N1lT7f2bcdb2Hy9gD8H1eoNs4rMxc1UQjLYYlFDICC2YqXTb8IHz3QkHQRHXG0wTA4L+2F/OTYjSOM7oi9ezpmsh6+Z6xcJtwZ7SrxVM44mN8JKrA=
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
Cc: "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMTkgdW0gMTA6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUdWUsIFNl
cCAxNywgMjAxOSBhdCAxMDoxMiBBTSBDaHJpc3RpYW4gS8O2bmlnDQo+IDxja29lbmlnLmxlaWNo
dHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBBbSAxNy4wOS4xOSB1bSAwNzo0NyBzY2hy
aWViIEphbmkgTmlrdWxhOg0KPj4+IE9uIE1vbiwgMTYgU2VwIDIwMTksIE1hcmVrIE9sxaHDoWsg
PG1hcmFlb0BnbWFpbC5jb20+IHdyb3RlOg0KPj4+PiBUaGUgcHVycG9zZSBpcyB0byBnZXQgcmlk
IG9mIGFsbCBQQ0kgSUQgdGFibGVzIGZvciBhbGwgZHJpdmVycyBpbg0KPj4+PiB1c2Vyc3BhY2Uu
IChvciBhdCBsZWFzdCBzdG9wIHVwZGF0aW5nIHRoZW0pDQo+Pj4+DQo+Pj4+IE1lc2EgY29tbW9u
IGNvZGUgYW5kIG1vZGVzZXR0aW5nIHdpbGwgdXNlIHRoaXMuDQo+Pj4gSSdkIHRoaW5rIHRoaXMg
d291bGQgd2FycmFudCBhIGhpZ2ggbGV2ZWwgZGVzY3JpcHRpb24gb2Ygd2hhdCB5b3Ugd2FudA0K
Pj4+IHRvIGFjaGlldmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPj4gQW5kIG1heWJlIGV4cGxp
Y2l0bHkgY2FsbCBpdCB1YXBpX25hbWUgb3IgZXZlbiB1YXBpX2RyaXZlcl9uYW1lLg0KPiBJZiBp
dCdzIHVhcGlfbmFtZSwgdGhlbiB3aHkgZG8gd2UgbmVlZCBhIG5ldyBvbmUgZm9yIGV2ZXJ5IGdl
bmVyYXRpb24/DQo+IFVzZXJzcGFjZSBkcml2ZXJzIHRlbmQgdG8gc3BhbiBhIGxvdCBtb3JlIHRo
YW4ganVzdCAxIGdlbmVyYXRpb24uIEFuZA0KPiBpZiB5b3Ugd2FudCB0byBoYXZlIHBlci1nZW5l
cmF0aW9uIGRhdGEgZnJvbSB0aGUga2VybmVsIHRvIHVzZXJzcGFjZSwNCj4gdGhlbiBpbW8gdGhh
dCdzIG11Y2ggYmV0dGVyIHN1aXRlZCBpbiBzb21lIGFtZGdwdSBpb2N0bCwgaW5zdGVhZCBvZg0K
PiB0cnlpbmcgdG8gZW5jb2RlIHRoYXQgaW50byB0aGUgZHJpdmVyIG5hbWUuDQoNCldlbGwgd2Ug
YWxyZWFkeSBoYXZlIGFuIElPQ1RMIGZvciB0aGF0LCBidXQgSSB0aG91Z2h0IHRoZSBpbnRlbnRp
b24gaGVyZSANCndhcyB0byBnZXQgcmlkIG9mIHRoZSBQQ0ktSUQgdGFibGVzIGluIHVzZXJzcGFj
ZSB0byBmaWd1cmUgb3V0IHdoaWNoIA0KZHJpdmVyIHRvIGxvYWQuDQoNCkkgbWVhbiBpdCBjb3Vs
ZCBiZSBwZXJmZWN0bHkgdmFsaWQgdG8gbm90IG9ubHkgbWF0Y2ggdGhlIGtlcm5lbCwgYnV0IA0K
YWxzbyB0aGUgaGFyZHdhcmUgZ2VuZXJhdGlvbiBmb3IgdGhhdC4NCg0KQ2hyaXN0aWFuLg0KDQo+
IC1EYW5pZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
