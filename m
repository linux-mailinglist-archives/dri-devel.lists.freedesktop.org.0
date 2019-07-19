Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C446E137
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 08:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6F46E491;
	Fri, 19 Jul 2019 06:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18046E491;
 Fri, 19 Jul 2019 06:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9x2+GJjO7j+rKYBEb4xSzvuax9c1GWjPisrzAAGkmgrnVYgP04rHkHjw98rpjY6ZeLS7pcIkLsIGbJuWSaCt1qXPG8XOMiRv7EOZ84MK+kDJ0WKicgtnbk61RoVyCsBDXAu2X0lxdTwn9OzdQTp73JcTRA6IE8xye7NAwxnNT1dzzpjanTMqyVQOMd0eOgjhQ4ITgy6hxxU9bhsXrcZbFzKhFZD3cluMZI7cwtBC0mVwdvkUrIoXwIlIvA6k6RrPZ/75xBzrLnxFsFqwCt8I4VdJp5frDtBW+TvtMhghDhtL2iX8/wfvoG5em2orZ4DQ50UqrF0+E8ca80ZLWMcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhk+nIT65fF//Ls04nAYxki4vfS4MA9rvnAiIwIonoc=;
 b=U1OzvGLLDgnIJDqTEVQhzlAWwu0XFX+G8fydNxaZwTrA3rgoxjkLezqgwTm+Bs554cKfTanT/dR+HRNxcSPsunXO3CPon44/CD2nAva2lUWS2BlqGGej7dMYxBU0+D3hBtCL6enpudzXUbYUDsY/aL8ewO/fwxGC5+7fx7jGX6pVPtyOsdvnK3mUy8jkaaBX9kHvyzLXaOY4pYVz4oEKiKitsWRWbc5aFj4T4T16WdSazrlsT48ubgh/Zcjy+G5bemDz8obhkr+gVZgMFFmtpXNhTYcTUcgqj35kTFY7e1dUZzIIfgA+m9wndFpdaelMPjkpoRVCRiduOuAmXlGYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1579.namprd12.prod.outlook.com (10.172.38.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 06:54:26 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 06:54:26 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Thread-Topic: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Thread-Index: AQHVPYQGC1CUWl5tBEabUnuzJI4nDabQlbYAgADs0IA=
Date: Fri, 19 Jul 2019 06:54:25 +0000
Message-ID: <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
In-Reply-To: <156346840026.24728.936589728458336617@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31)
 To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2130c504-0d8f-467b-7ca7-08d70c15efcd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1579; 
x-ms-traffictypediagnostic: DM5PR12MB1579:
x-microsoft-antispam-prvs: <DM5PR12MB1579C8FA45995710FFDEA92283CB0@DM5PR12MB1579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(189003)(199004)(66946007)(6486002)(14454004)(6512007)(53936002)(5660300002)(6116002)(229853002)(478600001)(65956001)(2501003)(58126008)(86362001)(6246003)(68736007)(6436002)(256004)(36756003)(99286004)(2906002)(81166006)(46003)(186003)(71200400001)(64126003)(8936002)(25786009)(31686004)(446003)(11346002)(65826007)(7416002)(71190400001)(81156014)(8676002)(2616005)(486006)(6506007)(7736002)(110136005)(386003)(54906003)(65806001)(4326008)(66476007)(66446008)(66556008)(31696002)(64756008)(76176011)(52116002)(476003)(316002)(102836004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zI2EXEMpXPJXrlBcrNy3622k0Jdp8pmMUuW1ZZoWJLIVolPPAXqA61OOZAhqoVoTIjuo9S+ocCKBl2ZbOMTU772vizWgEorgzWkPuDSxiqXCAlwhBYlj6hfTFEKyLdtOVMwKmSy7gnXbva5kk+vCTcSfSnt7cc6BsVIXt0S3rKn9x9Mwl+M1fn9OPAJdZUzoQjS7ufn69XyxzmWsMC6qZqbTg39utwWFyecRLH/j+kD9QwC+WXkEpzvVQdF4ZaYOg/qFXvY+0r903R0K9snwWqG2RokwZKXNQeqYCSvJmQRKEzuYhf2jKtV+JEcNCyZU6xz6XODKTDG58RQPXFv/oLI+Y2HdvkAH4jO+HVhucpw2T8p9HQMvq71zM+JoM44f9VO4wi5fwSqfjjCnjh3rofv73OxOmXxKePSMuLWhW98=
Content-ID: <0F13428D29D0644B8089D84916AB9841@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2130c504-0d8f-467b-7ca7-08d70c15efcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 06:54:25.7325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhk+nIT65fF//Ls04nAYxki4vfS4MA9rvnAiIwIonoc=;
 b=ilyVoTZk5JK3eNTBfQKnsaiwNFkp5iUA/zIg5D/k2OLi4KvnmZA1okLfCvahm8Um8N4dfGR8D2M+1gzLIOMU/AczP55M7lXh9r/XWRGa3WAwBF3na35Qo1RkwSbh9bNx4Y9OZUbEO2IMVs8Bb38Mf2w4cXSI103yQBzprQfCSJs=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <treding@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDcuMTkgdW0gMTg6NDYgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgU2Ft
IFJhdm5ib3JnICgyMDE5LTA3LTE4IDE3OjE0OjU4KQ0KPj4gZHJtX3ByaW50LmggdXNlZCBEUk1f
TkFNRSAtIHRodXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBmcm9tDQo+PiBpbmNsdWRlL2RybS9kcm1f
cHJpbnQuaCA9PiB1YXBpL2RybS9kcm0uaA0KPj4NCj4+IEhhcmRjb2RlIHRoZSBuYW1lICJkcm0i
IHRvIGJyZWFrIHRoaXMgZGVwZW5kZW5jeS4NCj4+IFRoZSBpZGVhIGlzIHRoYXQgdGhlcmUgc2hh
bGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kNCj4+IGJldHdlZW4gaW5jbHVkZS9kcm0vKiBhbmQg
dWFwaS8qDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPg0KPj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+
PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pg0KPj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+DQo+PiBD
YzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+DQo+PiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPg0KPj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4NCj4+
IENjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4NCj4+IENjOiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+DQo+PiAtLS0NCj4+ICAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA0ICst
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUvZHJt
L2RybV9wcmludC5oDQo+PiBpbmRleCBhNWQ2ZjJmM2U0MzAuLjc2MGQxYmQwZWFmMSAxMDA2NDQN
Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9k
cm1fcHJpbnQuaA0KPj4gQEAgLTMyLDggKzMyLDYgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2Rl
dmljZS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPg0KPj4gICANCj4+IC0jaW5j
bHVkZSA8ZHJtL2RybS5oPg0KPj4gLQ0KPj4gICAvKioNCj4+ICAgICogRE9DOiBwcmludA0KPj4g
ICAgKg0KPj4gQEAgLTI4Nyw3ICsyODUsNyBAQCB2b2lkIGRybV9lcnIoY29uc3QgY2hhciAqZm9y
bWF0LCAuLi4pOw0KPj4gICAvKiBNYWNyb3MgdG8gbWFrZSBwcmludGsgZWFzaWVyICovDQo+PiAg
IA0KPj4gICAjZGVmaW5lIF9EUk1fUFJJTlRLKG9uY2UsIGxldmVsLCBmbXQsIC4uLikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4+IC0gICAgICAgcHJpbnRrIyNvbmNlKEtFUk5fIyNs
ZXZlbCAiWyIgRFJNX05BTUUgIl0gIiBmbXQsICMjX19WQV9BUkdTX18pDQo+PiArICAgICAgIHBy
aW50ayMjb25jZShLRVJOXyMjbGV2ZWwgIltkcm1dICIgZm10LCAjI19fVkFfQVJHU19fKQ0KPiBJ
IGd1ZXNzIEknbSB0aCBvbmx5IG9uZSB3aG8NCj4NCj4gI3VuZGVmIERSTV9OQU1FDQo+ICNkZWZp
bmUgRFJNX05BTUUgaTkxNQ0KPg0KPiBqdXN0IHNvIHRoYXQgSSBkaWRuJ3QgaGF2ZSBpbmFuZSBs
b2dzPw0KPg0KPiBPbmUgbWlnaHQgc3VnZ2VzdCB0aGF0IGluc3RlYWQgb2YgaGFyZGNvZGluZyBp
dCwgZm9sbG93IHRoZSBwcl9mbXQoKQ0KPiBwYXR0ZXJuIGFuZCBvbmx5IGFkZCAiW2RybV0iIGZv
ciB0aGUgZHJtIGNvcmUuDQo+DQo+IEV2ZW4gdGhlbiBpdCBzbyB1c2VsZXNzICh3aGljaCBkcm0g
ZHJpdmVyIGlzIHRoaXMgbWVzc2FnZSBmb3I/Pz8pIHRoYXQgSQ0KPiB3YW50IHRvIHJlbW92ZSB0
aGVtIGFsbCA6KA0KDQpZZWFoLCBhZ3JlZS4gSSBtZWFuIGl0IGlzIG5pY2UgaWYgdGhlIGNvcmUg
ZHJtIGZ1bmN0aW9ucyB1c2UgYSBwcmVmaXggDQpmb3IgZGVidWcgb3V0cHV0Lg0KDQpCdXQgSSBh
Y3R1YWxseSBkb24ndCBzZWUgdGhlIHBvaW50IGZvciBpbmRpdmlkdWFsIGRyaXZlcnMuDQoNCkNo
cmlzdGlhbi4NCg0KPiAtQ2hyaXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
