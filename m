Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49E4BB82C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034310EC0B;
	Fri, 18 Feb 2022 11:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E9510EC0B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:36:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28C461F37E;
 Fri, 18 Feb 2022 11:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645184171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtVRqY5mj+1ot6ask8ypWEFapCcKpgqxAJN0KSyFo0Q=;
 b=KPjfiGUuLLS6qB9u9JEdcyKuiCyidhQnmCyuPuS60KGQzD8Ky8pVwiX9mBSrMWWRQ5yZdM
 d5JspTCKqBgCtcSmIME3aObYf6WaG0nHdKS+UY+vhx23w60HOfXvLMiNHSjwEQrc9Ef7F3
 zW6cw+BUIznkjnLQRbUQ9j2kaPTL8Kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645184171;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtVRqY5mj+1ot6ask8ypWEFapCcKpgqxAJN0KSyFo0Q=;
 b=p8v97HL5hFor8+Q8KRm9ohou73TDGhO5SeRh809NQy17UVgEjwHp5LrmXTYvY2i7G4kWrZ
 CfMj/jrIH7kKY1Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4CA613C7A;
 Fri, 18 Feb 2022 11:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GTs1J6qED2J/LQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Feb 2022 11:36:10 +0000
Message-ID: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
Date: Fri, 18 Feb 2022 12:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] simplefb: Enable boot time VESA graphic mode selection.
Content-Language: en-US
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
 <20220218105138.5384-1-msuchanek@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220218105138.5384-1-msuchanek@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BwkCJlWNQzpiHXpoHWQCjojT"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Herrmann <dh.herrmann@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-video@atrey.karlin.mff.cuni.cz, Arnd Bergmann <arnd@arndb.de>,
 Simon Trimmer <simont@opensource.cirrus.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Martin Mares <mj@ucw.cz>, Sudeep Holla <sudeep.holla@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BwkCJlWNQzpiHXpoHWQCjojT
Content-Type: multipart/mixed; boundary="------------TJ5YGH0xpLn944Ddd26O6o90";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Cc: Martin Mares <mj@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Herrmann <dh.herrmann@gmail.com>,
 linux-video@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org
Message-ID: <a789e375-a23e-6988-33bc-1410eb5d974f@suse.de>
Subject: Re: [PATCH v2] simplefb: Enable boot time VESA graphic mode
 selection.
References: <14dd85f1-21b1-2ff7-3491-466c077210e6@suse.de>
 <20220218105138.5384-1-msuchanek@suse.de>
In-Reply-To: <20220218105138.5384-1-msuchanek@suse.de>

--------------TJ5YGH0xpLn944Ddd26O6o90
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDIuMjIgdW0gMTE6NTEgc2NocmllYiBNaWNoYWwgU3VjaGFuZWs6DQo+
IFNpbmNlIHN3aXRjaCB0byBzaW1wbGVmYi9zaW1wbGVkcm0gVkVTQSBncmFwaGljIG1vZGVz
IGFyZSBubyBsb25nZXINCj4gYXZhaWxhYmxlIHdpdGggbGVnYWN5IEJJT1MuDQo+IA0KPiBU
aGUgeDg2IHJlYWxtb2RlIGJvb3QgY29kZSBlbmFibGVzIHRoZSBWRVNBIGdyYXBoaWMgbW9k
ZXMgd2hlbiBvcHRpb24NCj4gRkJfQk9PVF9WRVNBX1NVUFBPUlQgaXMgZW5hYmxlZC4NCj4g
DQo+IFRvIGVuYWJsZSB1c2Ugb2YgVkVTQSBtb2RlcyB3aXRoIHNpbXBsZWRybSBpbiBsZWdh
Y3kgQklPUyBib290IG1vZGUgZHJvcA0KPiBkZXBlbmRlbmN5IG9mIEJPT1RfVkVTQV9TVVBQ
T1JUIG9uIEZCLCBhbHNvIGRyb3AgdGhlIEZCXyBwcmVmaXgsIGFuZA0KPiBzZWxlY3QgdGhl
IG9wdGlvbiB3aGVuIHNpbXBsZWRybSBpcyBidWlsdC1pbiBvbiB4ODYuDQo+IA0KPiBGaXhl
czogZTMyNjNhYjM4OWE3ICgieDg2OiBwcm92aWRlIHBsYXRmb3JtLWRldmljZXMgZm9yIGJv
b3QtZnJhbWVidWZmZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFN1Y2hhbmVrIDxt
c3VjaGFuZWtAc3VzZS5kZT4NCj4gLS0tDQo+IHYyOiBTZWxlY3QgQk9PVF9WRVNBX1NVUFBP
UlQgZnJvbSBzaW1wbGVmYiByYXRoZXIgdGhhbiBzaW1wbGVkcm0uIFRoZQ0KPiBzaW1wbGVk
cm0gZHJpdmVyIHVzZXMgdGhlIGZpcm13YXJlIHByb3ZpZGVkIHZpZGVvIG1vZGVzIG9ubHkg
aW5kaXJlY3RseQ0KPiB0aHJvdWdoIHNpbXBsZWZiLCBhbmQgYm90aCBjYW4gYmUgZW5hYmxl
ZCBpbmRlcGVuZGVudGx5Lg0KPiAtLS0NCj4gICBhcmNoL3g4Ni9ib290L3ZpZGVvLXZlc2Eu
YyAgfCA0ICsrLS0NCj4gICBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgfCAxICsNCj4g
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgfCA5ICsrKystLS0tLQ0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jIGIvYXJjaC94ODYvYm9vdC92
aWRlby12ZXNhLmMNCj4gaW5kZXggN2UxODU5NzdhOTg0Li5jMmM2ZDM1ZTNhNDMgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gveDg2L2Jvb3QvdmlkZW8tdmVzYS5jDQo+ICsrKyBiL2FyY2gveDg2
L2Jvb3QvdmlkZW8tdmVzYS5jDQo+IEBAIC04Myw3ICs4Myw3IEBAIHN0YXRpYyBpbnQgdmVz
YV9wcm9iZSh2b2lkKQ0KPiAgIAkJCSAgICh2bWluZm8ubWVtb3J5X2xheW91dCA9PSA0IHx8
DQo+ICAgCQkJICAgIHZtaW5mby5tZW1vcnlfbGF5b3V0ID09IDYpICYmDQo+ICAgCQkJICAg
dm1pbmZvLm1lbW9yeV9wbGFuZXMgPT0gMSkgew0KPiAtI2lmZGVmIENPTkZJR19GQl9CT09U
X1ZFU0FfU1VQUE9SVA0KPiArI2lmZGVmIENPTkZJR19CT09UX1ZFU0FfU1VQUE9SVA0KPiAg
IAkJCS8qIEdyYXBoaWNzIG1vZGUsIGNvbG9yLCBsaW5lYXIgZnJhbWUgYnVmZmVyDQo+ICAg
CQkJICAgc3VwcG9ydGVkLiAgT25seSByZWdpc3RlciB0aGUgbW9kZSBpZg0KPiAgIAkJCSAg
IGlmIGZyYW1lYnVmZmVyIGlzIGNvbmZpZ3VyZWQsIGhvd2V2ZXIsDQo+IEBAIC0xMjEsNyAr
MTIxLDcgQEAgc3RhdGljIGludCB2ZXNhX3NldF9tb2RlKHN0cnVjdCBtb2RlX2luZm8gKm1v
ZGUpDQo+ICAgCWlmICgodm1pbmZvLm1vZGVfYXR0ciAmIDB4MTUpID09IDB4MDUpIHsNCj4g
ICAJCS8qIEl0J3MgYSBzdXBwb3J0ZWQgdGV4dCBtb2RlICovDQo+ICAgCQlpc19ncmFwaGlj
ID0gMDsNCj4gLSNpZmRlZiBDT05GSUdfRkJfQk9PVF9WRVNBX1NVUFBPUlQNCj4gKyNpZmRl
ZiBDT05GSUdfQk9PVF9WRVNBX1NVUFBPUlQNCj4gICAJfSBlbHNlIGlmICgodm1pbmZvLm1v
ZGVfYXR0ciAmIDB4OTkpID09IDB4OTkpIHsNCj4gICAJCS8qIEl0J3MgYSBncmFwaGljcyBt
b2RlIHdpdGggbGluZWFyIGZyYW1lIGJ1ZmZlciAqLw0KPiAgIAkJaXNfZ3JhcGhpYyA9IDE7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgYi9kcml2ZXJzL2Zp
cm13YXJlL0tjb25maWcNCj4gaW5kZXggNzVjYjkxMDU1YzE3Li44MDUzYzc1Yjg2NDUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJz
L2Zpcm13YXJlL0tjb25maWcNCj4gQEAgLTIyNCw2ICsyMjQsNyBAQCBjb25maWcgU1lTRkIN
Cj4gICBjb25maWcgU1lTRkJfU0lNUExFRkINCj4gICAJYm9vbCAiTWFyayBWR0EvVkJFL0VG
SSBGQiBhcyBnZW5lcmljIHN5c3RlbSBmcmFtZWJ1ZmZlciINCj4gICAJZGVwZW5kcyBvbiBT
WVNGQg0KPiArCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9SVCBpZiBYODYNCj4gICAJaGVscA0K
PiAgIAkgIEZpcm13YXJlcyBvZnRlbiBwcm92aWRlIGluaXRpYWwgZ3JhcGhpY3MgZnJhbWVi
dWZmZXJzIHNvIHRoZSBCSU9TLA0KPiAgIAkgIGJvb3Rsb2FkZXIgb3Iga2VybmVsIGNhbiBz
aG93IGJhc2ljIHZpZGVvLW91dHB1dCBkdXJpbmcgYm9vdCBmb3INCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2Nv
bmZpZw0KPiBpbmRleCA2ZWQ1ZTYwOGRkMDQuLjRmM2JlOWI3YTUyMCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvS2NvbmZpZw0KPiBAQCAtNjYsOSArNjYsOCBAQCBjb25maWcgRkJfRERDDQo+ICAg
CXNlbGVjdCBJMkNfQUxHT0JJVA0KPiAgIAlzZWxlY3QgSTJDDQo+ICAgDQo+IC1jb25maWcg
RkJfQk9PVF9WRVNBX1NVUFBPUlQNCj4gK2NvbmZpZyBCT09UX1ZFU0FfU1VQUE9SVA0KPiAg
IAlib29sDQo+IC0JZGVwZW5kcyBvbiBGQg0KPiAgIAloZWxwDQo+ICAgCSAgSWYgdHJ1ZSwg
YXQgbGVhc3Qgb25lIHNlbGVjdGVkIGZyYW1lYnVmZmVyIGRyaXZlciBjYW4gdGFrZSBhZHZh
bnRhZ2UNCj4gICAJICBvZiBWRVNBIHZpZGVvIG1vZGVzIHNldCBhdCBhbiBlYXJseSBib290
IHN0YWdlIHZpYSB0aGUgdmdhPSBwYXJhbWV0ZXIuDQoNClRoaXMgaXNuJ3QgYW4gZmIgb3B0
aW9uIGFueSBsb25nZXIuIFNob3VsZCB3ZSBtb3ZlIHRoaXMgaW50byANCmFyY2gveDg2L0tj
b25maWcgPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IEBAIC02MjcsNyArNjI2LDcg
QEAgY29uZmlnIEZCX1ZFU0ENCj4gICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlz
ZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+ICAgCXNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+
IC0Jc2VsZWN0IEZCX0JPT1RfVkVTQV9TVVBQT1JUDQo+ICsJc2VsZWN0IEJPT1RfVkVTQV9T
VVBQT1JUDQo+ICAgCWhlbHANCj4gICAJICBUaGlzIGlzIHRoZSBmcmFtZSBidWZmZXIgZGV2
aWNlIGRyaXZlciBmb3IgZ2VuZXJpYyBWRVNBIDIuMA0KPiAgIAkgIGNvbXBsaWFudCBncmFw
aGljIGNhcmRzLiBUaGUgb2xkZXIgVkVTQSAxLjIgY2FyZHMgYXJlIG5vdCBzdXBwb3J0ZWQu
DQo+IEBAIC0xMDUxLDcgKzEwNTAsNyBAQCBjb25maWcgRkJfSU5URUwNCj4gICAJc2VsZWN0
IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+ICAgCXNl
bGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IC0Jc2VsZWN0IEZCX0JPT1RfVkVTQV9TVVBQT1JU
IGlmIEZCX0lOVEVMID0geQ0KPiArCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9SVCBpZiBGQl9J
TlRFTCA9IHkNCj4gICAJZGVwZW5kcyBvbiAhRFJNX0k5MTUNCj4gICAJaGVscA0KPiAgIAkg
IFRoaXMgZHJpdmVyIHN1cHBvcnRzIHRoZSBvbi1ib2FyZCBncmFwaGljcyBidWlsdCBpbiB0
byB0aGUgSW50ZWwNCj4gQEAgLTEzNzgsNyArMTM3Nyw3IEBAIGNvbmZpZyBGQl9TSVMNCj4g
ICAJc2VsZWN0IEZCX0NGQl9GSUxMUkVDVA0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVB
DQo+ICAgCXNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+IC0Jc2VsZWN0IEZCX0JPT1RfVkVT
QV9TVVBQT1JUIGlmIEZCX1NJUyA9IHkNCj4gKwlzZWxlY3QgQk9PVF9WRVNBX1NVUFBPUlQg
aWYgRkJfU0lTID0geQ0KPiAgIAlzZWxlY3QgRkJfU0lTXzMwMCBpZiAhRkJfU0lTXzMxNQ0K
PiAgIAloZWxwDQo+ICAgCSAgVGhpcyBpcyB0aGUgZnJhbWUgYnVmZmVyIGRldmljZSBkcml2
ZXIgZm9yIHRoZSBTaVMgMzAwLCAzMTUsIDMzMA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------TJ5YGH0xpLn944Ddd26O6o90--

--------------BwkCJlWNQzpiHXpoHWQCjojT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIPhKoFAwAAAAAACgkQlh/E3EQov+DS
ThAAonZ6Axq6Cit8sPLPVSbu37hyat9FxIRHCQPvN4kIlIpHxiBdwbGKZDzjgFsKl2MRTUfePnJp
0zdP0ZtPLyzJydpkO3aqrHZ6e3y8CLjMmOApjtlx+38kcB8N3lZRLbttwvvDJSEL6wd0GcWNl59R
wMjh01sekxt3Pmfo2cprNchSshsnemmHCYHwTiOtk8wTBlqQejcy7Zyp79uoAYwoCQutjTZ9L+OW
9lD7MAeJk7+OT4hqxGwtui5xgBI6ccH8EaxnVoexhUS5nJu0IBpB+ewZDLFfEeguwImROYqxAcGY
xIZBexNRaGB8GwtRS2HntXbiqbJ6HLoNIiR31wAM9ALiHe6WEKmbIDs6TnSEo7pIQMIUajUS7kW5
XPY14wjvIOSAz9qC3H3PuhBYQDcXNwLYO6mrBephph8iZVKql3W2vXrqSmA8rOoRBHcbJzGFajtk
fJE2qN/KB8s3nS+oRtl8oy/ZD+vnSpQO2uOpdFIr+u0yfe+BmVBNZKy2FYHuTawQcBn5WfLvKxaw
VLe0lGOc9jUePTrpTvhi2a5a0WssY/xC8BHuU5Z2wBRKFbxhBjvfirVH/z7neeSFLS/1rEHV/PRl
0zBx7IFm5RSayIybvqKery+6tFO+rf1ojKClF93/H6VY8jDJv8td7z8+H6rwl5CaiW7NGPnSKPM8
Zgg=
=4fyI
-----END PGP SIGNATURE-----

--------------BwkCJlWNQzpiHXpoHWQCjojT--
