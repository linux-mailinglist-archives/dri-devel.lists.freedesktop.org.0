Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0474BD8AE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9562112C8A;
	Mon, 21 Feb 2022 09:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6898112C8A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:51:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B4441F391;
 Mon, 21 Feb 2022 09:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645437097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/PMymSyVH0HxRXV1mvRKK9d297pAWOZI368Y8VdA2s=;
 b=YWvtHoqSev5SgMiDUaQ8dJl01+oNgYuFH8iGbZWlnONiJurYAlcRijM/yvlFGFIvkf6GbR
 OaPjcBdrKPIrBzaa3E40QNeidKumhNNuIjztkDgM11MO8wfHedPxybU39N8iQ6wWC7iiSc
 oPO+iY+yTH9LCiEWdNqEKK0kVh484/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645437097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/PMymSyVH0HxRXV1mvRKK9d297pAWOZI368Y8VdA2s=;
 b=7KtOvq2a1W+AKcQ2Y5lk/iI2hZQ2Lb0z5BXzhXU6wM/R7XnsF/VFQdcmQ5gWtvfdiPELVV
 72JvH2Bk5rGIpzBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D36413A7C;
 Mon, 21 Feb 2022 09:51:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fBwyJahgE2I6EQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Feb 2022 09:51:36 +0000
Message-ID: <49f0642d-7078-8fba-c851-6e33658180ff@suse.de>
Date: Mon, 21 Feb 2022 10:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220218160436.23211-1-msuchanek@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5xfb4X1E04eL1T0HbmH8ZNDW"
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Simon Trimmer <simont@opensource.cirrus.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-video@atrey.karlin.mff.cuni.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5xfb4X1E04eL1T0HbmH8ZNDW
Content-Type: multipart/mixed; boundary="------------gbvBRMJcwjZf4Ny0jTJL01x9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Cc: David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>, Borislav Petkov
 <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Martin Mares <mj@ucw.cz>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-video@atrey.karlin.mff.cuni.cz
Message-ID: <49f0642d-7078-8fba-c851-6e33658180ff@suse.de>
Subject: Re: [PATCH v3] simplefb: Enable boot time VESA graphic mode
 selection.
References: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
 <20220218160436.23211-1-msuchanek@suse.de>
In-Reply-To: <20220218160436.23211-1-msuchanek@suse.de>

--------------gbvBRMJcwjZf4Ny0jTJL01x9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDIuMjIgdW0gMTc6MDQgc2NocmllYiBNaWNoYWwgU3VjaGFuZWs6DQo+
IFNpbmNlIHN3aXRjaCB0byBzaW1wbGVmYi9zaW1wbGVkcm0gVkVTQSBncmFwaGljIG1vZGVz
IGFyZSBubyBsb25nZXINCj4gYXZhaWxhYmxlIHdpdGggbGVnYWN5IEJJT1MuDQo+IA0KPiBU
aGUgeDg2IHJlYWxtb2RlIGJvb3QgY29kZSBlbmFibGVzIHRoZSBWRVNBIGdyYXBoaWMgbW9k
ZXMgd2hlbiBvcHRpb24NCj4gRkJfQk9PVF9WRVNBX1NVUFBPUlQgaXMgZW5hYmxlZC4NCj4g
DQo+IFRvIGVuYWJsZSB1c2Ugb2YgVkVTQSBtb2RlcyB3aXRoIHNpbXBsZWZiIGluIGxlZ2Fj
eSBCSU9TIGJvb3QgbW9kZSBkcm9wDQo+IGRlcGVuZGVuY3kgb2YgQk9PVF9WRVNBX1NVUFBP
UlQgb24gRkIsIGFsc28gZHJvcCB0aGUgRkJfIHByZWZpeCwgYW5kDQo+IHNlbGVjdCB0aGUg
b3B0aW9uIHdoZW4gc2ltcGxlZmIgZW5hYmxlZCBvbiB4ODYuDQo+IA0KPiBUaGUgQk9PVF9W
RVNBX1NVUFBPUlQgaXMgbm90IHNwZWNpZmljIHRvIGZyYW1lYnVmZmVyIGJ1dCByYXRoZXIg
dG8geDg2DQo+IHBsYXRmb3JtLCBtb3ZlIGl0IGZyb20gZmJkZXYgdG8geDg2IEtjb25maWcu
DQo+IA0KPiBGaXhlczogZTMyNjNhYjM4OWE3ICgieDg2OiBwcm92aWRlIHBsYXRmb3JtLWRl
dmljZXMgZm9yIGJvb3QtZnJhbWVidWZmZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFs
IFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4g
SSdsbCB3YWl0IGEgYml0IGZvciBhZGRpdGlvbmFsIHJldmlld3MgYmVmb3JlIA0KbWVyZ2lu
ZyBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4gdjI6IFNlbGVjdCBC
T09UX1ZFU0FfU1VQUE9SVCBmcm9tIHNpbXBsZWZiIHJhdGhlciB0aGFuIHNpbXBsZWRybS4g
VGhlDQo+IHNpbXBsZWRybSBkcml2ZXIgdXNlcyB0aGUgZmlybXdhcmUgcHJvdmlkZWQgdmlk
ZW8gbW9kZXMgb25seSBpbmRpcmVjdGx5DQo+IHRocm91Z2ggc2ltcGxlZmIsIGFuZCBib3Ro
IGNhbiBiZSBlbmFibGVkIGluZGVwZW5kZW50bHkuDQo+IHYzOiBNb3ZlIEJPT1RfVkVTQV9T
VVBQT1JUIGZyb20gZmJkZXYgdG8geDg2DQo+IC0tLQ0KPiAgIGFyY2gveDg2L0tjb25maWcg
ICAgICAgICAgICB8ICA2ICsrKysrKw0KPiAgIGFyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5j
ICB8ICA0ICsrLS0NCj4gICBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgfCAgMSArDQo+
ICAgZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIHwgMTMgKysrLS0tLS0tLS0tLQ0KPiAg
IDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcN
Cj4gaW5kZXggOWY1YmQ0MWJmNjYwLi5jY2ViMWFhYjA0ODYgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gveDg2L0tjb25maWcNCj4gKysrIGIvYXJjaC94ODYvS2NvbmZpZw0KPiBAQCAtOTQyLDYg
Kzk0MiwxMiBAQCBjb25maWcgR0FSVF9JT01NVQ0KPiAgIA0KPiAgIAkgIElmIHVuc3VyZSwg
c2F5IFkuDQo+ICAgDQo+ICtjb25maWcgQk9PVF9WRVNBX1NVUFBPUlQNCj4gKwlib29sDQo+
ICsJaGVscA0KPiArCSAgSWYgdHJ1ZSwgYXQgbGVhc3Qgb25lIHNlbGVjdGVkIGZyYW1lYnVm
ZmVyIGRyaXZlciBjYW4gdGFrZSBhZHZhbnRhZ2UNCj4gKwkgIG9mIFZFU0EgdmlkZW8gbW9k
ZXMgc2V0IGF0IGFuIGVhcmx5IGJvb3Qgc3RhZ2UgdmlhIHRoZSB2Z2E9IHBhcmFtZXRlci4N
Cj4gKw0KPiAgIGNvbmZpZyBNQVhTTVANCj4gICAJYm9vbCAiRW5hYmxlIE1heGltdW0gbnVt
YmVyIG9mIFNNUCBQcm9jZXNzb3JzIGFuZCBOVU1BIE5vZGVzIg0KPiAgIAlkZXBlbmRzIG9u
IFg4Nl82NCAmJiBTTVAgJiYgREVCVUdfS0VSTkVMDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9ib290L3ZpZGVvLXZlc2EuYyBiL2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jDQo+IGlu
ZGV4IDdlMTg1OTc3YTk4NC4uYzJjNmQzNWUzYTQzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4
Ni9ib290L3ZpZGVvLXZlc2EuYw0KPiArKysgYi9hcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2Eu
Yw0KPiBAQCAtODMsNyArODMsNyBAQCBzdGF0aWMgaW50IHZlc2FfcHJvYmUodm9pZCkNCj4g
ICAJCQkgICAodm1pbmZvLm1lbW9yeV9sYXlvdXQgPT0gNCB8fA0KPiAgIAkJCSAgICB2bWlu
Zm8ubWVtb3J5X2xheW91dCA9PSA2KSAmJg0KPiAgIAkJCSAgIHZtaW5mby5tZW1vcnlfcGxh
bmVzID09IDEpIHsNCj4gLSNpZmRlZiBDT05GSUdfRkJfQk9PVF9WRVNBX1NVUFBPUlQNCj4g
KyNpZmRlZiBDT05GSUdfQk9PVF9WRVNBX1NVUFBPUlQNCj4gICAJCQkvKiBHcmFwaGljcyBt
b2RlLCBjb2xvciwgbGluZWFyIGZyYW1lIGJ1ZmZlcg0KPiAgIAkJCSAgIHN1cHBvcnRlZC4g
IE9ubHkgcmVnaXN0ZXIgdGhlIG1vZGUgaWYNCj4gICAJCQkgICBpZiBmcmFtZWJ1ZmZlciBp
cyBjb25maWd1cmVkLCBob3dldmVyLA0KPiBAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyBp
bnQgdmVzYV9zZXRfbW9kZShzdHJ1Y3QgbW9kZV9pbmZvICptb2RlKQ0KPiAgIAlpZiAoKHZt
aW5mby5tb2RlX2F0dHIgJiAweDE1KSA9PSAweDA1KSB7DQo+ICAgCQkvKiBJdCdzIGEgc3Vw
cG9ydGVkIHRleHQgbW9kZSAqLw0KPiAgIAkJaXNfZ3JhcGhpYyA9IDA7DQo+IC0jaWZkZWYg
Q09ORklHX0ZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICsjaWZkZWYgQ09ORklHX0JPT1RfVkVT
QV9TVVBQT1JUDQo+ICAgCX0gZWxzZSBpZiAoKHZtaW5mby5tb2RlX2F0dHIgJiAweDk5KSA9
PSAweDk5KSB7DQo+ICAgCQkvKiBJdCdzIGEgZ3JhcGhpY3MgbW9kZSB3aXRoIGxpbmVhciBm
cmFtZSBidWZmZXIgKi8NCj4gICAJCWlzX2dyYXBoaWMgPSAxOw0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9maXJtd2FyZS9LY29uZmlnIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnDQo+
IGluZGV4IDc1Y2I5MTA1NWMxNy4uYWQ2NGYzYTZmNTRmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2Zpcm13YXJlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9LY29uZmln
DQo+IEBAIC0yMjQsNiArMjI0LDcgQEAgY29uZmlnIFNZU0ZCDQo+ICAgY29uZmlnIFNZU0ZC
X1NJTVBMRUZCDQo+ICAgCWJvb2wgIk1hcmsgVkdBL1ZCRS9FRkkgRkIgYXMgZ2VuZXJpYyBz
eXN0ZW0gZnJhbWVidWZmZXIiDQo+ICAgCWRlcGVuZHMgb24gU1lTRkINCj4gKwlzZWxlY3Qg
Qk9PVF9WRVNBX1NVUFBPUlQNCj4gICAJaGVscA0KPiAgIAkgIEZpcm13YXJlcyBvZnRlbiBw
cm92aWRlIGluaXRpYWwgZ3JhcGhpY3MgZnJhbWVidWZmZXJzIHNvIHRoZSBCSU9TLA0KPiAg
IAkgIGJvb3Rsb2FkZXIgb3Iga2VybmVsIGNhbiBzaG93IGJhc2ljIHZpZGVvLW91dHB1dCBk
dXJpbmcgYm9vdCBmb3INCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2Nv
bmZpZyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPiBpbmRleCA2ZWQ1ZTYwOGRk
MDQuLjViZGQzMDNiNTI2OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPiBAQCAtNjYs
MTMgKzY2LDYgQEAgY29uZmlnIEZCX0REQw0KPiAgIAlzZWxlY3QgSTJDX0FMR09CSVQNCj4g
ICAJc2VsZWN0IEkyQw0KPiAgIA0KPiAtY29uZmlnIEZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+
IC0JYm9vbA0KPiAtCWRlcGVuZHMgb24gRkINCj4gLQloZWxwDQo+IC0JICBJZiB0cnVlLCBh
dCBsZWFzdCBvbmUgc2VsZWN0ZWQgZnJhbWVidWZmZXIgZHJpdmVyIGNhbiB0YWtlIGFkdmFu
dGFnZQ0KPiAtCSAgb2YgVkVTQSB2aWRlbyBtb2RlcyBzZXQgYXQgYW4gZWFybHkgYm9vdCBz
dGFnZSB2aWEgdGhlIHZnYT0gcGFyYW1ldGVyLg0KPiAtDQo+ICAgY29uZmlnIEZCX0NGQl9G
SUxMUkVDVA0KPiAgIAl0cmlzdGF0ZQ0KPiAgIAlkZXBlbmRzIG9uIEZCDQo+IEBAIC02Mjcs
NyArNjIwLDcgQEAgY29uZmlnIEZCX1ZFU0ENCj4gICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVD
VA0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+ICAgCXNlbGVjdCBGQl9DRkJfSU1B
R0VCTElUDQo+IC0Jc2VsZWN0IEZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICsJc2VsZWN0IEJP
T1RfVkVTQV9TVVBQT1JUDQo+ICAgCWhlbHANCj4gICAJICBUaGlzIGlzIHRoZSBmcmFtZSBi
dWZmZXIgZGV2aWNlIGRyaXZlciBmb3IgZ2VuZXJpYyBWRVNBIDIuMA0KPiAgIAkgIGNvbXBs
aWFudCBncmFwaGljIGNhcmRzLiBUaGUgb2xkZXIgVkVTQSAxLjIgY2FyZHMgYXJlIG5vdCBz
dXBwb3J0ZWQuDQo+IEBAIC0xMDUxLDcgKzEwNDQsNyBAQCBjb25maWcgRkJfSU5URUwNCj4g
ICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVB
DQo+ICAgCXNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IC0Jc2VsZWN0IEZCX0JPT1RfVkVT
QV9TVVBQT1JUIGlmIEZCX0lOVEVMID0geQ0KPiArCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9S
VCBpZiBGQl9JTlRFTCA9IHkNCj4gICAJZGVwZW5kcyBvbiAhRFJNX0k5MTUNCj4gICAJaGVs
cA0KPiAgIAkgIFRoaXMgZHJpdmVyIHN1cHBvcnRzIHRoZSBvbi1ib2FyZCBncmFwaGljcyBi
dWlsdCBpbiB0byB0aGUgSW50ZWwNCj4gQEAgLTEzNzgsNyArMTM3MSw3IEBAIGNvbmZpZyBG
Ql9TSVMNCj4gICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlzZWxlY3QgRkJfQ0ZC
X0NPUFlBUkVBDQo+ICAgCXNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IC0Jc2VsZWN0IEZC
X0JPT1RfVkVTQV9TVVBQT1JUIGlmIEZCX1NJUyA9IHkNCj4gKwlzZWxlY3QgQk9PVF9WRVNB
X1NVUFBPUlQgaWYgRkJfU0lTID0geQ0KPiAgIAlzZWxlY3QgRkJfU0lTXzMwMCBpZiAhRkJf
U0lTXzMxNQ0KPiAgIAloZWxwDQo+ICAgCSAgVGhpcyBpcyB0aGUgZnJhbWUgYnVmZmVyIGRl
dmljZSBkcml2ZXIgZm9yIHRoZSBTaVMgMzAwLCAzMTUsIDMzMA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------gbvBRMJcwjZf4Ny0jTJL01x9--

--------------5xfb4X1E04eL1T0HbmH8ZNDW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmITYKcFAwAAAAAACgkQlh/E3EQov+Ak
2g/+JrapnWpG6tmMXT5Lc528f6S5HZNDWejUmaawkzf+90xzxJ0OAlGs7X4Dphmr/q/CCiaf8gkN
e53y6OatO0my+lC1jRdFkVXsOA8WZzcyzNaIXp3tfJk6/ETQcjMXoAx3E7ao2XYg/6l+wB4qfgzE
GOPitsJL21AyIlaDPmi311S7KVEKVk2wzsisGad/7MGZLpIYQfUD3rFoGZaAYMaPZHbwR1gVdDaI
7kEElHdWpw9zQNJoRgMrCfx/6sQOiCdMo2/iz47iHUPAE95aJjRCa1SzW/aZT3qRZGfM60wYgHDH
kx6Gf0/7Cd0DGbzdzpTQA1GcQUeAsBWVKtIg3umwaRywZ74cxavSmtezxA6cCmUVr5eGDnXpiE8T
ptYB6IXySHFS6zf+6q46LiIGK57RX2tOlXc4fMGfyuhstpKBLXSOiM8vQIgb9TgcjCJE/z1nn9fn
UVOxFmfFp4MXEmM9Webzcd/l+qMM+MRO9R473KSznk7ym9iiDPTvMFqfdfPrJl+NS7MbrXI8mbvQ
/pEZWJsTFK2yEjOxvqVhwBxS8jy+zR5A1E8WKRPNUdpwN/sCIcMnKCqK/xdimyzaRLHfhQNParwU
mnTuVMqjNyU7yJYrjZH+iP/9P7o88+ZEDsNTPCxhDbDLyJa5zW28JPjVlu13qIY2G3UQF32EitZF
vvM=
=KsP3
-----END PGP SIGNATURE-----

--------------5xfb4X1E04eL1T0HbmH8ZNDW--
