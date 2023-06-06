Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4F7238EB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4610E12C;
	Tue,  6 Jun 2023 07:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A5110E294
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 07:24:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5BFC218B5;
 Tue,  6 Jun 2023 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686036291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5SCb/oYucC6QlBE32qYQ71fXz63nTIlLduJZz1gjR4=;
 b=h5xeeuKeHoEVsnxDVZCiG7JRVt3x1DOUXSWskgYHnKXt5WvMpg1SPA/9wWnaOWOsOw2UGQ
 fq+9rwDO/owvpVtFrWs+GG+y3yo9NiP8sWvtjQLDSIb4mJHuRRP6Z6cn7d9lsOeNQKYCs9
 F7xe//HcwEm/t6y1A28MV9VgQUkbUCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686036291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5SCb/oYucC6QlBE32qYQ71fXz63nTIlLduJZz1gjR4=;
 b=K37GjmjBQVc91lGOF6/K9PhltXno4bNTKicq6JldixN/2V8aOc92WKOgZg1+zAKrhr/fwR
 nOlzjf00lye+LhCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2627713519;
 Tue,  6 Jun 2023 07:24:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fnv2AkLffmRtCwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 07:24:50 +0000
Message-ID: <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>
Date: Tue, 6 Jun 2023 09:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "lee@kernel.org" <lee@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kexGFT0rhicXNSd80q93tDPl"
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kexGFT0rhicXNSd80q93tDPl
Content-Type: multipart/mixed; boundary="------------wYz2oZQmcUevf310fkVd0Nat";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "lee@kernel.org" <lee@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Message-ID: <7d4e340c-e20a-5824-4d59-b93bc1ba4153@suse.de>
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>

--------------wYz2oZQmcUevf310fkVd0Nat
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDYuMjMgdW0gMjI6MTkgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6DQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPj4g
VGhvbWFzIFppbW1lcm1hbm4NCj4+IFNlbnQ6IE1vbmRheSwgSnVuZSA1LCAyMDIzIDEwOjQ4
IEFNDQo+PiBUbzogZGFuaWVsQGZmd2xsLmNoOyBqYXZpZXJtQHJlZGhhdC5jb207IHNhbUBy
YXZuYm9yZy5vcmc7DQo+PiBkZWxsZXJAZ214LmRlOyBnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZTsgbGVlQGtlcm5lbC5vcmc7DQo+PiBkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZzsgamlu
Z29vaGFuMUBnbWFpbC5jb20NCj4+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmc7
IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+OyBsaW51eC0NCj4+IHNoQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5kZXY7IGRyaS0NCj4+IGRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVGhvbWFzIFppbW1lcm1hbm4NCj4+IDx0emltbWVy
bWFubkBzdXNlLmRlPjsgSm9obiBQYXVsIEFkcmlhbiBHbGF1Yml0eiA8Z2xhdWJpdHpAcGh5
c2lrLmZ1LQ0KPj4gYmVybGluLmRlPjsgbGludXgtb21hcEB2Z2VyLmtlcm5lbC5vcmcNCj4+
IFN1YmplY3Q6IFtQQVRDSCAwMi8zMF0gYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0OiBDb21w
YXJlIGFnYWluc3Qgc3RydWN0DQo+PiBmYl9pbmZvLmRldmljZQ0KPj4NCj4+IFN0cnVjdCBn
cGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhIHJlZmVycyB0byBhIHBsYXRmb3JtIGRldmlj
ZSB3aXRoaW4NCj4+IHRoZSBMaW51eCBkZXZpY2UgaGllcmFyY2h5LiBUaGUgdGVzdCBpbiBn
cGlvX2JhY2tsaWdodF9jaGVja19mYigpDQo+PiBjb21wYXJlcyBpdCBhZ2FpbnN0IHRoZSBm
YmRldiBkZXZpY2UgaW4gc3RydWN0IGZiX2luZm8uZGV2LCB3aGljaA0KPj4gaXMgZGlmZmVy
ZW50LiBGaXggdGhlIHRlc3QgYnkgY29tcGFyaW5nIHRvIHN0cnVjdCBmYl9pbmZvLmRldmlj
ZS4NCj4+DQo+PiBGaXhlcyBhIGJ1ZyBpbiB0aGUgYmFja2xpZ2h0IGRyaXZlciBhbmQgcHJl
cGFyZXMgZmJkZXYgZm9yIG1ha2luZw0KPj4gc3RydWN0IGZiX2luZm8uZGV2IG9wdGlvbmFs
Lg0KPiANCj4gSSBvbmx5IHNlZSBhIHJlbmFtZSBmcm9tIGZiZGV2ICB0byBkZXYuLi4NCj4g
DQo+IElzIHRoZXJlIG1pc3NpbmcgY29kZT8NCg0KQXMgU2FtIHNhaWQsIHRoZSBjb21wYXJl
IG9wZXJhdGlvbiB1c2VkIHRoZSB3cm9uZyBkZXZpY2UgZnJvbSBmYl9pbmZvLg0KDQpJIGFs
c28gY2hhbmdlZCB0aGUgbmFtaW5nIG9mIGEgZmV3IGZpZWxkcyBpbiB0aGVzZSBiYWNrbGln
aHQgZHJpdmVycy4gSSANCmNvdWxkIG1vdmUgdGhlc2UgcmVuYW1lcyBpbnRvIGEgc2VwYXJh
dGUgcGF0Y2ggaWYgdGhhdCBtYWtlcyB0aGluZ3MgDQplYXNpZXIgZm9yIHJldmlld2Vycy4N
Cg0KPiANCj4gV291bGQgIGEgZml4ZXM6IGJlIHVzZWZ1bD8NCg0KVGhhdCB3b3VsZCBiZSBj
b21taXQgOGI3NzBlM2M5ODI0ICgiYmFja2xpZ2h0OiBBZGQgR1BJTy1iYXNlZCBiYWNrbGln
aHQgDQpkcml2ZXIiKSBmcm9tIDIwMTMuIE1heWJlIGEgYml0IG9sZCBhbHJlYWR5LCBidXQg
SSBjYW4gc3VyZWx5IGFkZCBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4g
TQ0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPj4gQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+DQo+PiBD
YzogSm9obiBQYXVsIEFkcmlhbiBHbGF1Yml0eiA8Z2xhdWJpdHpAcGh5c2lrLmZ1LWJlcmxp
bi5kZT4NCj4+IENjOiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPg0KPj4gQ2M6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+DQo+PiBDYzogSmluZ29v
IEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+DQo+PiBDYzogbGludXgtc2hAdmdlci5rZXJu
ZWwub3JnDQo+PiAtLS0NCj4+IGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAu
YyAgICAgICAgIHwgMiArLQ0KPj4gZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYyAgICAgfCA2ICsrKy0tLQ0KPj4gaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRh
L2dwaW9fYmFja2xpZ2h0LmggfCAyICstDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC0NCj4+
IGVjb3ZlYzI0L3NldHVwLmMNCj4+IGluZGV4IDY3NGRhN2ViZDhiNy4uMzEwNTEzNjQ2Yzli
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5j
DQo+PiArKysgYi9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMNCj4+IEBA
IC0zODYsNyArMzg2LDcgQEAgc3RhdGljIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBncGlvX2Jh
Y2tsaWdodF9wcm9wc1tdID0gew0KPj4gfTsNCj4+DQo+PiBzdGF0aWMgc3RydWN0IGdwaW9f
YmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgZ3Bpb19iYWNrbGlnaHRfZGF0YSA9IHsNCj4+IC0J
LmZiZGV2ID0gJmxjZGNfZGV2aWNlLmRldiwNCj4+ICsJLmRldiA9ICZsY2RjX2RldmljZS5k
ZXYsDQo+PiB9Ow0KPj4NCj4+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
X2luZm8gZ3Bpb19iYWNrbGlnaHRfZGV2aWNlX2luZm8gPSB7DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYw0KPj4gYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jDQo+PiBpbmRleCA2Zjc4ZDkyOGYw
NTQuLmQzYmVhNDI0MDdmMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2dwaW9fYmFja2xpZ2h0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2dwaW9fYmFja2xpZ2h0LmMNCj4+IEBAIC0xNyw3ICsxNyw3IEBADQo+PiAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPj4NCj4+IHN0cnVjdCBncGlvX2JhY2tsaWdodCB7DQo+PiAtCXN0
cnVjdCBkZXZpY2UgKmZiZGV2Ow0KPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+PiAJc3Ry
dWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7DQo+PiB9Ow0KPj4NCj4+IEBAIC0zNSw3ICszNSw3IEBA
IHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfY2hlY2tfZmIoc3RydWN0DQo+PiBiYWNrbGln
aHRfZGV2aWNlICpibCwNCj4+IHsNCj4+IAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCA9
IGJsX2dldF9kYXRhKGJsKTsNCj4+DQo+PiAtCXJldHVybiBnYmwtPmZiZGV2ID09IE5VTEwg
fHwgZ2JsLT5mYmRldiA9PSBpbmZvLT5kZXY7DQo+PiArCXJldHVybiAhZ2JsLT5kZXYgfHwg
Z2JsLT5kZXYgPT0gaW5mby0+ZGV2aWNlOw0KPj4gfQ0KPj4NCj4+IHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYmFja2xpZ2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMgPSB7DQo+PiBAQCAtNTks
NyArNTksNyBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UNCj4+ICpwZGV2KQ0KPj4gCQlyZXR1cm4gLUVOT01FTTsNCj4+DQo+PiAJ
aWYgKHBkYXRhKQ0KPj4gLQkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsNCj4+ICsJCWdi
bC0+ZGV2ID0gcGRhdGEtPmRldjsNCj4+DQo+PiAJZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7DQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oDQo+PiBiL2lu
Y2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oDQo+PiBpbmRleCAx
YThiNWIxOTQ2ZmUuLjMyM2ZiZjVmNzYxMyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5oDQo+PiArKysgYi9pbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaA0KPj4gQEAgLTgsNyArOCw3IEBA
DQo+PiBzdHJ1Y3QgZGV2aWNlOw0KPj4NCj4+IHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0
Zm9ybV9kYXRhIHsNCj4+IC0Jc3RydWN0IGRldmljZSAqZmJkZXY7DQo+PiArCXN0cnVjdCBk
ZXZpY2UgKmRldjsNCj4+IH07DQo+Pg0KPj4gI2VuZGlmDQo+PiAtLQ0KPj4gMi40MC4xDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------wYz2oZQmcUevf310fkVd0Nat--

--------------kexGFT0rhicXNSd80q93tDPl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR+30AFAwAAAAAACgkQlh/E3EQov+Bg
+BAAi3FmK5SYmQ5jtSn+2vWqx1iKMKJZdzfS+AfP8r8/WLxE7OwdiFV7GExSM2APHkZa6+ct4m5e
rY4+82oO9+MiOUuNVha9toyKblBgpj6qqw9WEbgzvEZtWVOvet3IlG9InXakEHLDHgYrw7Kq546s
n/Lc5OXrx0SuZALwwv6TD8uFYuJ6vp6R836kvVPr7Zy4drRu74YD8hyy+sPdvX3VFccFHaWyQShY
WtVKlrzjfM02+TiumohtlP/duPUdIOwYuZbEHIJu3jO86FBRRsBHceId9H++2PdHXBP1q+FKowoN
1lrn1mETaHn5V1SY5vhmiXcDfcMlhBPCBZUbxQx2TlsjDPAfmRHeZic8jzQknm9aVxXG/1CGiWIE
Kpgaq9O6gHV6hUhQhKvxHTgmyUsO4Uh8b2zcRMSVzKMKXjKzvCI4JYJamUxHHBXYs8jOpoYcth1A
zIIF+I9TqULs6fWGfaaSXwgUOoPDpeRXOh5TnSfRSw3WT0r2LQ+RITm8b/h4sdKoKdtMtRw1lSme
UtPp5Ob/7VLpnwfip/84KELFkONvXlvS00eeBfjda/swKneGHnKsALIg1TxABxN06H4wU4rOiJjo
Jfw0RQaqdo2YH4o2aqjHkq8115tKd9Qe/5NLzhlHaNCuBu86QzAXhuXSWCnqa0nxv35E2w6zSyFX
Jgc=
=tSw9
-----END PGP SIGNATURE-----

--------------kexGFT0rhicXNSd80q93tDPl--
