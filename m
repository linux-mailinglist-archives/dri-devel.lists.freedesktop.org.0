Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B885B46
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB606E78D;
	Thu,  8 Aug 2019 07:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710071.outbound.protection.outlook.com [40.107.71.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138ED6E788;
 Thu,  8 Aug 2019 07:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY/dpH+U0IU0T8EqR83+Ljb1HIQrY9po8VZPrmK0oWnmw7prs9uw6x1X7fJcj4WZ/8broQ2OFdk5lIMER1TnwXHfv4PWizu1tmeeItTuUKszVVcB7GAM4Pp+tMpuO4nDkbcWV58ibGjH2zXCEB22zGIkqbayFIVW6+0WyD70yCHeRSqJv1T5Dit82cw/Sbt96UwuJ4g+YbzQkM9j44Ty3GH1gPIBcfqSQwyHNptm6QFUZg50Aq5UvWdmTvj9K1AACu/G7KbcuG8WXaxmLEXcOyZbHEGDePU1sDhYOf+3g5tMmlXm6v3pWUiV7PdyB+WUSdg4E0D2WhLs035t7OLhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er7pjb0n41k6u4klh6hGjv9HhtjFYy7ywjAl83nVZbk=;
 b=Y+XroFx9ZByi7/klqt5s+DohTNsRNntYznMlErbkrJHxn8PD+RQQrZSPSERU6ZsxpGFzoUpKrrc//hheU7EfaR59lplk8P5TUpq+7KwAHTKsnbiiQSrNJFf6Sg5XcssoXXnYu522P3kE9suzLHwR+xLDvWPMRLHE8dvkBqfWKn1WPYdQQwcr94YzMTrUpV0k+/3Rly+RpxA+EtwsFsiBYdUWLCekSnVntnXSNkavXgr2FpAJyjHnVV8YkSm2jIviSknk9I48A580iZ/MellQYSsYTweiv+yXjEWo/rj6vLtOM2maVwc9p3yfXgMctQOW8w+n0vZcbEj8Uv21rpnzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1659.namprd12.prod.outlook.com (10.172.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 07:09:54 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:09:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: =?utf-8?B?UmU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHNlcmllcyBzdGFydGlu?=
 =?utf-8?B?ZyB3aXRoIFsxLzZdIGRtYS1idWY6IGFkZCBkeW5hbWljIERNQS1idWYgaGFu?=
 =?utf-8?Q?dling_v13?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdp?=
 =?utf-8?B?dGggWzEvNl0gZG1hLWJ1ZjogYWRkIGR5bmFtaWMgRE1BLWJ1ZiBoYW5kbGlu?=
 =?utf-8?Q?g_v13?=
Thread-Index: AQHVR32oPI9Y+501fUybpHgYLyDLD6bwPI8AgACk+gA=
Date: Thu, 8 Aug 2019 07:09:53 +0000
Message-ID: <429e8c1a-55af-8e94-8e5d-0545c35f0beb@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
 <20190626133225.9081.7676@emeril.freedesktop.org>
 <41eab2c2-0592-1308-41a9-c76c887a6113@gmail.com>
 <20190731085502.GH7444@phenom.ffwll.local>
 <20190807211918.GJ7444@phenom.ffwll.local>
In-Reply-To: <20190807211918.GJ7444@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::14) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 714d1195-5dc5-438c-16f1-08d71bcf68de
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1659; 
x-ms-traffictypediagnostic: DM5PR12MB1659:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1659323E02C3F9F81A34863D83D70@DM5PR12MB1659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(65806001)(476003)(65956001)(316002)(11346002)(14454004)(2616005)(486006)(446003)(46003)(2906002)(71200400001)(186003)(7736002)(81156014)(305945005)(81166006)(65826007)(102836004)(6506007)(386003)(966005)(86362001)(52116002)(5660300002)(64126003)(66574012)(31696002)(76176011)(54906003)(58126008)(31686004)(36756003)(99286004)(66946007)(66476007)(66556008)(64756008)(66446008)(6486002)(4326008)(6916009)(6306002)(256004)(6512007)(6116002)(14444005)(5024004)(8936002)(6436002)(71190400001)(229853002)(25786009)(53936002)(6246003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1659;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /ulFdbyjExWdcjaUEIpL+vgPfVueNzlUNf1v3z7vYIQPuND2y9ZZmwE4n+nirMW1nV3hu1tKRhmMPKzx2naQz7Y5Xly48Y1w9fhRY6wpyngBA8l9U3dKpHKZR+pfVWEKyTY/QLKju/8nREI4oogBoU48JzB+YqQQyADOI1USA7LlOK/TntvB+1oRhLy4B7dKoNWl/e87CTK+ne1E8mbrUJb2xITJTUrBM8XzWy98TKj7ywZSwNMEgli/MZL9nOtZGw8X1cRx03p86l+IgDOC920F/zlm02hsA34PADGjRsEp38e/U5/M3l0BOP2hH2YLKpa0wEzfbQW1TIYPqPGJhSSlSp7YFnbjEQVubBcN7AqeiJqmyCC0rohq+08e14dXgS3NBRLteTmM5G08JCW8PcYHkn3TXl8n4TjX0V6qSKA=
x-ms-exchange-transport-forked: True
Content-ID: <A9BB0B9791ACA748813F726560422CAB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714d1195-5dc5-438c-16f1-08d71bcf68de
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:09:53.0748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JooQn9oFllv77kuSPbzvkHuq+5vh54pwlouEIr6+52YXdf2IivlB/riFu38hudc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er7pjb0n41k6u4klh6hGjv9HhtjFYy7ywjAl83nVZbk=;
 b=HZoBElTjp+InwdZXgSYclx7QCqO0ur4YgNwNJBM6N93za6WsFje27PI9DtNgT8hEeQSRPSEWp10XUxhKQ+G7iCtg65LIlyZeIbS3uLpT+S6IWKfVqVy5QHRPFdJYPhYelMz70A5pb/uXxVfUUcSM+QYLGKQC0EEzbLFsfCSKaZQ=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDguMTkgdW0gMjM6MTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIEp1
bCAzMSwgMjAxOSBhdCAxMDo1NTowMkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4g
T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDk6Mjg6MTFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToNCj4+PiBIaSBEYW5pZWwsDQo+Pj4NCj4+PiB0aG9zZSBmYWlscyBsb29rIGxpa2Ug
c29tZXRoaW5nIHJhbmRvbSB0byBtZSBhbmQgbm90IHJlbGF0ZWQgdG8gbXkgcGF0Y2gNCj4+PiBz
ZXQuIENvcnJlY3Q/DQo+PiBGaXJzdCBvbmUgSSBsb29rZWQgYXQgaGFzIHRoZSByZXNlcnZhdGlv
bl9vYmogYWxsIG92ZXI6DQo+Pg0KPj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9QYXRjaHdvcmtfMTM0MzgvZmktY21sLXUvaWd0QGdlbV9leGVjX2ZlbmNlQGJhc2lj
LWJ1c3ktZGVmYXVsdC5odG1sDQo+Pg0KPj4gU28gNSBzZWNvbmQgZ3VlZXMgaXMgLi4uIHByb2Jh
Ymx5IHJlYWw/DQo+Pg0KPj4gTm90ZSB0aGF0IHdpdGggdGhlIGVudGlyZSBsbWVtIHN0dWZmIGdv
aW5nIG9uIHJpZ2h0IG5vdyB0aGVyZSdzIG1hc3NpdmUNCj4+IGRpc2N1c3Npb25zIGFib3V0IGhv
dyB3ZSdyZSBkb2luZyByZXN2X29iaiB2cyBvYmotPm1tLmxvY2sgdGhlIHdyb25nIHdheQ0KPj4g
cm91bmQgaW4gaTkxNSwgc28gSSdtIG5vdCBzdXJwcmlzZWQgYXQgYWxsIHRoYXQgeW91IG1hbmFn
ZWQgdG8gdHJpcCB0aGlzLg0KPj4NCj4+IFRoZSB3YXkgSSBzZWUgaXQgcmlnaHQgbm93IGlzIHRo
YXQgb2JqLT5tbS5sb2NrIG5lZWRzIHRvIGJlIGxpbWl0ZWQgdG8NCj4+IGRlYWxpbmcgd2l0aCB0
aGUgaTkxNSBzaHJpbmtlciBpbnRlcmFjdGlvbnMgb25seSwgYW5kIG9ubHkgZm9yIGk5MTUgbmF0
aXZlDQo+PiBvYmplY3RzLiBBbmQgZm9yIGRtYS1idWZzIHdlIG5lZWQgdG8gbWFrZSBzdXJlIGl0
J3Mgbm90IGFueXdoZXJlIGluIHRoZQ0KPj4gY2FsbGNoYWluLiBVbmZvcnR1bmF0ZWx5IHRoYXQn
cyBhIG1hc3NpdmUgcmVmYWN0b3IgSSBndWVzcyAuLi4NCj4gVGhvdWdodCBhYm91dCB0aGlzIHNv
bWUgbW9yZSwgYXNpZGUgZnJvbSBqdXN0IGJyZWFraW5nIGk5MTUgb3Igd2FpdGluZw0KPiB1bnRp
bCBpdCdzIHJlZmFjdG9yZWQgKEJvdGggbm90IGF3ZXNvbWUpIEkgdGhpbmsgdGhlIG9ubHkgb3B0
aW9uIGlzIGdldA0KPiBiYWNrIHRvIHRoZSBvcmlnaW5hbCBjYWNoaW5nLiBBbmQgZmlndXJlIG91
dCB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRvDQo+IHRha2UgdGhlIGRpcmVjdGlvbiBpbnRvIGFj
Y291bnQgZm9yIHRoYXQsIG9yIHdoZXRoZXIgdXBncmFkaW5nIHRvDQo+IGJpZGlyZWN0aW9uYWwg
dW5jb25kaXRpb25hbGx5IHdvbid0IGJlIG9rLiBJIHRoaW5rIHRoZXJlJ3Mgb25seSByZWFsbHkg
dHdvDQo+IGNhc2VzIHdoZXJlIHRoaXMgbWF0dGVyczoNCj4NCj4gLSBkaXNwbGF5IGRyaXZlcnMg
dXNpbmcgdGhlIGNtYS9kbWFfYWxsb2MgaGVscGVycy4gRXZlcnl0aGluZyBpcyBhbGxvY2F0ZWQN
Cj4gICAgZnVsbHkgY29oZXJlbnQsIGNwdSBzaWRlIHdjLCBubyBmbHVzaGluZy4NCj4NCj4gLSBF
dmVyeW9uZSBlbHNlIChvbiBwbGF0Zm9ybXMgd2hlcmUgdGhlcmUncyBhY3R1YWxseSBzb21lIGZs
dXNoaW5nIGdvaW5nDQo+ICAgIG9uKSBpcyBmb3IgcmVuZGVyaW5nIGdwdXMsIGFuZCB0aG9zZSBh
bHdheXMgbWFwIGJpZGlyZWN0aW9uYWwgYW5kIHdhbnQNCj4gICAgdGhlIG1hcHBpbmcgY2FjaGVk
IGZvciBhcyBsb25nIGFzIHBvc3NpYmxlLg0KPg0KPiBXaXRoIHRoYXQgd2UgY291bGQgZ28gYmFj
ayB0byBjcmVhdGluZyB0aGUgY2FjaGVkIG1hcHBpbmcgYXQgYXR0YWNoIHRpbWUNCj4gYW5kIGF2
b2lkIGluZmxpY3RpbmcgdGhlIHJlc2VydmF0aW9uIG9iamVjdCBsb2NrIHRvIHBsYWNlcyB0aGF0
IHdvdWxkIGtlZWwNCj4gb3Zlci4NCj4NCj4gVGhvdWdodHM/DQoNCkFjdHVhbGx5IHdlIGhhZCBh
IG5vdCBzbyBuaWNlIGludGVybmFsIG1haWwgdGhyZWFkIHdpdGggb3VyIGhhcmR3YXJlIA0KZ3V5
cyBhbmQgaXQgbG9va3MgbGlrZSB3ZSBoYXZlIHRvbnMgb2YgaGFyZHdhcmUgYnVncy9leGNlcHRp
b25zIHRoYXQgDQpzb21ldGltZXMgUENJZSBCQVJzIGFyZSBvbmx5IHJlYWRhYmxlIG9yIG9ubHkg
d3JpdGFibGUuIFNvIGl0IHR1cm5lZCBvdXQgDQp0aGF0IGFsd2F5cyBjYWNoaW5nIHdpdGggYmlk
aXJlY3Rpb25hbCB3b24ndCB3b3JrIGZvciB1cyBlaXRoZXIuDQoNCkFkZGl0aW9uYWwgdG8gdGhh
dCBJJ20gbm90IHN1cmUgaG93IGk5MTUgYWN0dWFsbHkgdHJpZ2dlcmVkIHRoZSBpc3N1ZSwgDQpj
YXVzZSB3aXRoIHRoZSBjdXJyZW50IGNvZGUgdGhhdCBzaG91bGRuJ3QgYmUgcG9zc2libGUuDQoN
CkJ1dCBpbmRlcGVuZGVudCBvZiB0aGF0IEkgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IHdl
IGZpcnN0IG5lZWQgdG8gDQpnZXQgdG8gYSBjb21tb24gdmlldyBvZiB3aGF0IHRoZSBmZW5jZXMg
aW4gdGhlIHJlc2VydmF0aW9uIG1lYW4gb3IgDQpvdGhlcndpc2UgdGhlIHdob2xlIHN0dWZmIGhl
cmUgaXNuJ3QgZ29pbmcgdG8gd29yayBzbW9vdGggZWl0aGVyLg0KDQpTbyB3b3JraW5nIG9uIHRo
YXQgZm9yIG5vdyBhbmQgd2hlbiB0aGF0J3MgZmluaXNoZWQgSSB3aWxsIGNvbWUgYmFjayB0byAN
CnRoaXMgcHJvYmxlbSBoZXJlIGFnYWluLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQoNCj4g
LURhbmllbA0KPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
