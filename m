Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D865867AE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 12:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFF910EB4A;
	Mon,  1 Aug 2022 10:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93F10EB4A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 10:27:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFCE34D9AB;
 Mon,  1 Aug 2022 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659349661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rn5huHOH16quOeORG7eIzTIvt1vz6KF42r/yYC7bKbI=;
 b=cGvwg2ypDeqJIGzKJIzx5f3BH2sXzvOOcTY5fUdAOGeSOsxhdlTMyoETXOK7tBPS+RBVCq
 WVDUzrhxJC0bo2J5+Tmcj9ZVgmD+cKoLjlMdXZSrAHkcwqbws6In8/T5HE+Llf4FoQgOmc
 3pLeJFlK379BsqRJ2TtRHUU0AnMINO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659349661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rn5huHOH16quOeORG7eIzTIvt1vz6KF42r/yYC7bKbI=;
 b=Jbxz2qxjD3y3bN52O6hPHe9ayidDdEYgO8B689z/CshRaMvk3HdlhGy7YwGG91u+cRWDqX
 FISnD7vdXloxKFAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74B0513A72;
 Mon,  1 Aug 2022 10:27:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K528Gp2q52LGZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 10:27:41 +0000
Message-ID: <7434f77d-b5ab-444c-d8e3-9fcb0cf50527@suse.de>
Date: Mon, 1 Aug 2022 12:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
Content-Language: en-US
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 Zeng Jingxiang <zengjx95@gmail.com>,
 "edmund.j.dea@intel.com" <edmund.j.dea@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
References: <20220729030711.2117849-1-zengjx95@gmail.com>
 <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
 <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
 <BY5PR11MB41828228EF0D27174703431B8C999@BY5PR11MB4182.namprd11.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <BY5PR11MB41828228EF0D27174703431B8C999@BY5PR11MB4182.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Yzuce7vHg1gmHPmG0f383nr2"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Yzuce7vHg1gmHPmG0f383nr2
Content-Type: multipart/mixed; boundary="------------62zp05A6aR4NpX1MupwYCTqe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 Zeng Jingxiang <zengjx95@gmail.com>,
 "edmund.j.dea@intel.com" <edmund.j.dea@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: Zeng Jingxiang <linuszeng@tencent.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <7434f77d-b5ab-444c-d8e3-9fcb0cf50527@suse.de>
Subject: Re: [PATCH] drm/kmb: fix dereference before NULL check in
 kmb_plane_atomic_update()
References: <20220729030711.2117849-1-zengjx95@gmail.com>
 <a68022f4-28d0-7743-27fe-6df652082184@suse.de>
 <fef74b28-80f1-9184-efa5-25f3343ace40@suse.de>
 <BY5PR11MB41828228EF0D27174703431B8C999@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB41828228EF0D27174703431B8C999@BY5PR11MB4182.namprd11.prod.outlook.com>

--------------62zp05A6aR4NpX1MupwYCTqe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDcuMjIgdW0gMTg6NDAgc2NocmllYiBDaHJpc2FudGh1cywgQW5pdGhh
Og0KPiBBZ3JlZSB3aXRoIFRob21hcywgZHJtX2F0b21pY19jb21taXQoKSB3aWxsIG5vdCBj
YWxsIGttYl9hdG9taWNfdXBkYXRlKCkgd2l0aCBhIE5VTEwgcGxhbmUuIFRoaXMgaXMgbm90
IGFuIGFjdHVhbCBidWcuDQoNCkluZGVlZCwgaXQncyB0aGUgYXRvbWljX3VwZGF0ZSBmdW5j
dGlvbi4gSSBkaWRuJ3Qgbm90aWNlIGF0IGZpcnN0Lg0KDQo+IA0KPiBUaGFua3MsDQo+IEFu
aXRoYQ0KPiANCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFNlbnQ6IEZyaWRheSwg
SnVseSAyOSwgMjAyMiA3OjI2IEFNDQo+PiBUbzogWmVuZyBKaW5neGlhbmcgPHplbmdqeDk1
QGdtYWlsLmNvbT47IENocmlzYW50aHVzLCBBbml0aGENCj4+IDxhbml0aGEuY2hyaXNhbnRo
dXNAaW50ZWwuY29tPjsgZWRtdW5kLmouZGVhQGludGVsLmNvbTsgYWlybGllZEBsaW51eC5p
ZTsNCj4+IGRhbmllbEBmZndsbC5jaDsgbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tOyBtYXhpbWVAY2Vybm8udGVjaDsNCj4+IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tDQo+PiBDYzogWmVuZyBKaW5neGlhbmcgPGxpbnVzemVuZ0B0ZW5jZW50LmNvbT47IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0va21iOiBmaXggZGVyZWZl
cmVuY2UgYmVmb3JlIE5VTEwgY2hlY2sgaW4NCj4+IGttYl9wbGFuZV9hdG9taWNfdXBkYXRl
KCkNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDI5LjA3LjIyIHVtIDE2OjIzIHNjaHJpZWIgVGhv
bWFzIFppbW1lcm1hbm46DQo+Pj4gSGkNCj4+Pg0KPj4+IEFtIDI5LjA3LjIyIHVtIDA1OjA3
IHNjaHJpZWIgWmVuZyBKaW5neGlhbmc6DQo+Pj4+IEZyb206IFplbmcgSmluZ3hpYW5nIDxs
aW51c3plbmdAdGVuY2VudC5jb20+DQo+Pj4+DQo+Pj4+IFRoZSAicGxhbmUiIHBvaW50ZXIg
d2FzIGFjY2VzcyBiZWZvcmUgY2hlY2tpbmcgaWYgaXQgd2FzIE5VTEwuDQo+Pj4+DQo+Pj4+
IFRoZSBkcm1fYXRvbWljX2dldF9vbGRfcGxhbmVfc3RhdGUoKSBmdW5jdGlvbiB3aWxsIGRl
cmVmZXJlbmNlDQo+Pj4+IHRoZSBwb2ludGVyICJwbGFuZSIuDQo+Pj4+IDM0NcKgwqDCoCBz
dHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUgPQ0KPj4+PiAgwqDCoMKg
wqDCoMKgwqAgZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7
DQo+Pj4+IDM0NsKgwqDCoCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3Rh
dGUgPQ0KPj4+PiAgwqDCoMKgwqDCoMKgwqAgZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0
YXRlKHN0YXRlLCBwbGFuZSk7DQo+Pj4+DQo+Pj4+IEEgTlVMTCBjaGVjayBmb3IgInBsYW5l
IiBpbmRpY2F0ZXMgdGhhdCBpdCBtYXkgYmUgTlVMTA0KPj4+PiAzNjPCoMKgwqAgaWYgKCFw
bGFuZSB8fCAhbmV3X3BsYW5lX3N0YXRlIHx8ICFvbGRfcGxhbmVfc3RhdGUpDQo+Pj4NCj4+
PiBJcyB0aGlzIGFuIGFjdHVhbCBidWcgdGhhdCBoYXBwZW5zPw0KPj4+DQo+Pj4gQWxsIHBs
YW5lcyBzaG91bGQgYWx3YXlzIGhhdmUgYSBzdGF0ZS4gVGhlcmVmb3JlIHRoZSB0ZXN0cyBm
b3INCj4+PiAhbmV3X3BsYW5lX3N0YXRlIGFuZCAhb2xkX3BsYW5lX3N0YXRlIGNhbiBiZSBy
ZW1vdmVkLCBJJ2Qgc2F5Lg0KPj4NCj4+IEp1c3QgdG8gY2xhcmlmeTogbW92aW5nIHRoZSB0
ZXN0IGZvciAhcGxhbmUgYmVmb3JlIHVzaW5nIG9uZSBvZiB0aGUNCj4+IGdldF9wbGFuZV9z
dGF0ZSBmdW5jdGlvbnMgaXMgYSBjb3JyZWN0IGJ1Z2ZpeC4NCj4+DQo+PiBCZXN0IHJlZ2Fy
ZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IEJlc3QgcmVnYXJkcw0KPj4+IFRob21hcw0K
Pj4+DQo+Pj4+DQo+Pj4+IEZpeGVzOiA5Nzc2OTdlMjBiM2QgKCJkcm0vYXRvbWljOiBQYXNz
IHRoZSBmdWxsIHN0YXRlIHRvIHBsYW5lcyBhdG9taWMNCj4+Pj4gZGlzYWJsZSBhbmQgdXBk
YXRlIikNCj4+Pj4gRml4ZXM6IDM3NDE4YmYxNGMxMyAoImRybTogVXNlIHN0YXRlIGhlbHBl
ciBpbnN0ZWFkIG9mIHRoZSBwbGFuZSBzdGF0ZQ0KPj4+PiBwb2ludGVyIikNCj4+Pj4gU2ln
bmVkLW9mZi1ieTogWmVuZyBKaW5neGlhbmcgPGxpbnVzemVuZ0B0ZW5jZW50LmNvbT4NCj4+
Pj4gLS0tDQo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5jIHwgMTMg
KysrKysrKystLS0tLQ0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9rbWIva21iX3BsYW5lLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9w
bGFuZS5jDQo+Pj4+IGluZGV4IDI3MzViOGViMzUzNy4uZDJiYzk5OGI2NWNlIDEwMDY0NA0K
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0va21iL2ttYl9wbGFuZS5jDQo+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9rbWIva21iX3BsYW5lLmMNCj4+Pj4gQEAgLTM0MiwxMCArMzQy
LDcgQEAgc3RhdGljIHZvaWQga21iX3BsYW5lX3NldF9hbHBoYShzdHJ1Y3QNCj4+Pj4ga21i
X2RybV9wcml2YXRlICprbWIsDQo+Pj4+ICDCoCBzdGF0aWMgdm9pZCBrbWJfcGxhbmVfYXRv
bWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUpDQo+Pj4+ICDCoCB7DQo+Pj4+IC3CoMKgwqAgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqb2xkX3BsYW5lX3N0YXRlID0NCj4+Pj4gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5l
X3N0YXRlKHN0YXRlLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGxhbmUp
Ow0KPj4+PiAtwqDCoMKgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0
ZSA9DQo+Pj4+IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0ZSwNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYW5lKTsNCj4+Pj4gK8KgwqDCoCBzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRfcGxhbmVfc3RhdGUsICpuZXdfcGxhbmVfc3RhdGU7
DQo+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOw0KPj4+PiAg
wqDCoMKgwqDCoCBzdHJ1Y3Qga21iX2RybV9wcml2YXRlICprbWI7DQo+Pj4+ICDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCB3aWR0aDsNCj4+Pj4gQEAgLTM2MCw3ICszNTcsMTMgQEAgc3Rh
dGljIHZvaWQga21iX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0DQo+Pj4+IGRybV9wbGFu
ZSAqcGxhbmUsDQo+Pj4+ICDCoMKgwqDCoMKgIHN0YXRpYyBkbWFfYWRkcl90IGFkZHJbTUFY
X1NVQl9QTEFORVNdOw0KPj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgZGlzcF9jZmcgKmluaXRf
ZGlzcF9jZmc7DQo+Pj4+IC3CoMKgwqAgaWYgKCFwbGFuZSB8fCAhbmV3X3BsYW5lX3N0YXRl
IHx8ICFvbGRfcGxhbmVfc3RhdGUpDQo+Pj4+ICvCoMKgwqAgaWYgKCFwbGFuZSkNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIG9sZF9wbGFu
ZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUp
Ow0KPj4+PiArwqDCoMKgIG5ld19wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19w
bGFuZV9zdGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgaWYgKCFu
ZXdfcGxhbmVfc3RhdGUgfHwgIW9sZF9wbGFuZV9zdGF0ZSkNCg0KVG8gYWRkIHRvIG15IHBy
ZXZpb3VzIHJlcGx5LCBub25lIG9mIHRoZXNlIHZhcmlhYmxlcyBjYW4gbGVnYWxseSBiZSBO
VUxMIA0KaGVyZS4gSWYgcGxhbmUgaWYgTlVMTCwgRFJNIGhlbHBlcnMgd291bGQgcnVuIGF0
b21pY19kaXNhYmxlIGluc3RlYWQuDQoNCklmIHlvdSB3YW50IHRvIGZpeCBhbnl0aGluZywg
anVzdCByZW1vdmUgdGhlIHRlc3RzIGVudGlyZWx5IGFuZCBzYXZlIGEgDQpmZXcgQ1BVIGN5
Y2xlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybjsNCj4+Pj4gIMKgwqDCoMKgwqAgZmIgPSBuZXdfcGxhbmVfc3RhdGUtPmZi
Ow0KPj4+DQo+Pg0KPj4gLS0NCj4+IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------62zp05A6aR4NpX1MupwYCTqe--

--------------Yzuce7vHg1gmHPmG0f383nr2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLnqpwFAwAAAAAACgkQlh/E3EQov+Bi
SA/+O9RxOAMRLrMf9K4urzfov/wT3mYjbLe1CfFj3l1CD+JYzAaON6JK3suaylx1XtRy6Td1IM1k
WhbEUk1LLoe1yvCBu6Zd8PsaY/S4FtQnkzYDcQKTUOSMRT+F+LQFSj0o00fckrZPiuFP+ITD0R3p
yMWBVJxrJvOQPK1sgRagS0SuQEqn++wIT/Pwh0B+qbTuE5iFKlnjFF/bpScSDeRmi31sNH9fScuy
qQnpbbt4wz5GYmIMlRUampngPHX72q+NEdmADh0aD+PU4RUKjaH68e6+npclXNrndO164T9Tg92n
hZf245fSz/sHSgNfrV30DLnPT/ZRS+zQdgvTVyHpGjsGfRPzMnihc/H8IUhFCgUqtoGRVwktZpOi
5HaJ30gUHgyWArLJ60YQhVHT7cWg+VQZSCeullDhDUDVI2MF9p83bYE8dyNrYfUx5ftVfsQNpH75
+kdum23490DtS9UWT+TWOS8NhJpD3kzSy80+JFOwaR9YfNXrl1TMt2idSV/K1xYsc6WwWSF9kc2v
x7e02856Kmwp6fAoOmKSdxPlZqV9KWaIOk9G5Yb+Ol/pwBycbYvKx+BHb0+hmo3U0eQk4eBcvZYS
ALuL5Z4edfwWNchPoEMvqdkWLRUfuP2/Ad3fMJfDdG8Mh6ZMsdVlTbjVH6JO0qCDILvYhmHrgTDh
GN8=
=YGC8
-----END PGP SIGNATURE-----

--------------Yzuce7vHg1gmHPmG0f383nr2--
