Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE294DCE93
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 20:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1764E10E6E5;
	Thu, 17 Mar 2022 19:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C670D10E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 19:15:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31BFD1F390;
 Thu, 17 Mar 2022 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647544539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDeEcfQa8T/19ItbfqOaukhDvu6WUI9dKPu0H5y/pEg=;
 b=QzLxskfx4lT27JWaRg5gaLrk/PiK+NxlsqrKJE9U0nV3ROcGS1Was11o7SlsZ/1I2IrlTM
 ZsMeEnk54hoy8kT+zUANz15fCWn8toAvgrfVBxoy8z5cKUwSCOy58EahVAeES8wX1UVpbZ
 idnconVW4xWKsziJ/BrfM20FDcs9Q9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647544539;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDeEcfQa8T/19ItbfqOaukhDvu6WUI9dKPu0H5y/pEg=;
 b=BIiS6nQysZYgRf2lnfQ0ld+tUBb8E3C1MM10w1WtmETUZzkuHkO9rghxTfoC16tlArmkAK
 tMzkO8OoMQJ5HYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B57F913BCA;
 Thu, 17 Mar 2022 19:15:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5dtWKtqIM2JpMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Mar 2022 19:15:38 +0000
Message-ID: <7082c67a-a336-54fc-dd32-81b9b8c0a64b@suse.de>
Date: Thu, 17 Mar 2022 20:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220316183708.1505846-1-arnd@kernel.org>
 <aaf204b2-e876-d271-3d4e-51cbcc70d690@suse.de>
 <1f6c4559-ee48-ca67-8ff1-f7f9d330bc12@suse.de>
 <CAK8P3a3ogV8sJshQJrzHe7hc2k1Opq-2hvXf6DU+HfhREk-DhQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAK8P3a3ogV8sJshQJrzHe7hc2k1Opq-2hvXf6DU+HfhREk-DhQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QqflseXbTVIupGsokgp12PoJ"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@linux.ie>,
 Dillon Min <dillon.minfei@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QqflseXbTVIupGsokgp12PoJ
Content-Type: multipart/mixed; boundary="------------Hwl5K59dH9RMcqui1rkhy0yf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Deepak Rawat <drawat.floss@gmail.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <7082c67a-a336-54fc-dd32-81b9b8c0a64b@suse.de>
Subject: Re: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
References: <20220316183708.1505846-1-arnd@kernel.org>
 <aaf204b2-e876-d271-3d4e-51cbcc70d690@suse.de>
 <1f6c4559-ee48-ca67-8ff1-f7f9d330bc12@suse.de>
 <CAK8P3a3ogV8sJshQJrzHe7hc2k1Opq-2hvXf6DU+HfhREk-DhQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3ogV8sJshQJrzHe7hc2k1Opq-2hvXf6DU+HfhREk-DhQ@mail.gmail.com>

--------------Hwl5K59dH9RMcqui1rkhy0yf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQXJuZA0KDQpBbSAxNi4wMy4yMiB1bSAyMTo1OSBzY2hyaWViIEFybmQgQmVyZ21hbm46
DQo+IE9uIFdlZCwgTWFyIDE2LCAyMDIyIGF0IDg6MzEgUE0gVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gQW0gMTYuMDMuMjIgdW0gMjA6MTIg
c2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+Pj4NCj4+Pj4gQWRkaW5nIGEgZGVwZW5k
ZW5jeSBpbiBhbGwgZHJpdmVycyB0aGF0IHNlbGVjdCBEUk1fTUlQSV9EQkkgYXZvaWRzDQo+
Pj4+IHRoZSBwcm9ibGVtIGZvciBub3csIGFkZGluZyB0aGUgZGVwZW5kZW5jeSBpbiBEUk1f
TUlQSV9EQkkgYXMgd2VsbA0KPj4+PiBzaG91bGQgaGVscCBtYWtlIGl0IGVhc2llciB0byBm
aWd1cmUgb3V0IHdoeSBpdCBicmVha3MgaWYgc29tZW9uZQ0KPj4+PiBmb3JnZXRzIHRoZSBk
ZXBlbmRlbmN5IHRoZSBuZXh0IHRpbWUuDQo+Pj4+DQo+Pj4+ICAgICAgICB0cmlzdGF0ZQ0K
Pj4+PiAtICAgIGRlcGVuZHMgb24gRFJNDQo+Pj4+ICsgICAgZGVwZW5kcyBvbiBEUk1fS01T
X0hFTFBFUg0KPj4+DQo+Pj4gVGhpcyBzeW1ib2wgY2Fubm90IGJlIHNlbGVjdGVkIGJ5IHVz
ZXJzLCBzbyBpdCdzIG1heWJlIG5vdCBhIGdvb2QgaWRlYQ0KPj4+IHRvIGRlcGVuZCBvbiBp
dC4gSW4gZmFjdCwgSSd2ZSBoYWQgdG8gcmVtb3ZlIHN1Y2ggYSBzdGF0ZW1lbnQgYmVjYXVz
ZSBpdA0KPj4+IGNyZWF0ZWQgYSBjeWNsaWMgZGVwZW5kZW5jeS4gWzFdDQo+IA0KPiBJIHRy
aWVkIHRvIGV4cGxhaW4gYWJvdmUgd2hhdCBJIHdhcyB0aGlua2luZyBoZXJlOiB0aGUgYWRk
ZWQgZGVwZW5kZW5jeQ0KPiBpcyBib3RoIGEgY29ycmVjdCBzdGF0ZW1lbnQgKERSTV9NSVBJ
X0RCSSBkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+IGJlY2F1c2UgaXQgY2Fubm90IGJl
IGJ1aWx0IHdpdGhvdXQgRFJNX0tNU19IRUxQRVIpIGFuZCBoZWxwZnVsIGFzDQo+IGFuIGlu
ZGljYXRpb24gd2hhdCB3ZW50IHdyb25nIGlmIHdlIHJ1biBpbnRvIHRoZSBzYW1lIHByb2Js
ZW0gd2l0aCBhIG5ldw0KPiBkcml2ZXIsIGluc3RlYWQgb2YgdGhlIGNyeXB0aWMgbGluayBm
YWlsdXJlIHlvdSBnZXQgc29tZXRoaW5nIGxpa2UNCj4gDQo+IFdBUk5JTkc6IHVubWV0IGRp
cmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIERSTV9NSVBJX0RCSQ0KPiAgICBEZXBl
bmRzIG9uIFttXTogSEFTX0lPTUVNIFs9eV0gJiYgRFJNX0tNU19IRUxQRVIgWz1tXQ0KPiAg
ICBTZWxlY3RlZCBieSBbeV06DQo+ICAgIC0gRFJNX1BBTkVMX1dJREVDSElQU19XUzI0MDEg
Wz15XSAmJiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAmJg0KPiBEUk1fUEFORUwgWz15
XSAmJiBTUEkgWz15XSAmJiBHUElPTElCIFs9eV0gJiYgQkFDS0xJR0hUX0NMQVNTX0RFVklD
RQ0KPiBbPXldDQo+ICAgIFNlbGVjdGVkIGJ5IFttXToNCj4gICAgLSBUSU5ZRFJNX0lMSTky
MjUgWz1tXSAmJiBIQVNfSU9NRU0gWz15XSAmJiBEUk0gWz15XSAmJiBTUEkgWz15XQ0KPiAN
Cj4+IFsxXQ0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjIwMzE1
MDg0NTU5LjIzNTEwLTEtdHppbW1lcm1hbm5Ac3VzZS5kZS8NCj4gDQo+IEkgd2FzIGdvaW5n
IGZvciAnZGVwZW5kcyBvbicgaW4gdGhlIHBhbmVsIGRyaXZlcnMgYmVjYXVzZSBJIHNhdyB0
aGUgc2FtZSBiZWluZw0KPiBkb25lIGZvciBvdGhlciBwYW5lbCBkcml2ZXJzLCBhbmQgbWl4
aW5nIHRoZSB0d28gbWV0aG9kcyBjYXVzZXMgZGVwZW5kZW5jeQ0KPiBsb29wcy4gSSBsb29r
ZWQgYWdhaW4gbm93LCBhbmQgZmluZCB0aGF0ICdzZWxlY3QgRFJNX0tNU19IRUxQRVInIGlz
IG1vcmUNCj4gY29tbW9uIGZvciBvdGhlciBkcml2ZXJzLCBhbmQgbWFrZXMgc2Vuc2UgaGVy
ZSBiZWNhdXNlIGl0IGlzIGdlbmVyYWxseQ0KPiBub3QgdXNlci1zZWxlY3RhYmxlLg0KPiAN
Cj4gVGhlIGVhc2llc3QgcmVwbGFjZW1lbnQgZm9yIG15IHBhdGNoIHdvdWxkIHRoZW4gYmUg
dG8ganVzdCB1c2UgJ3NlbGVjdA0KPiBEUk1fS01TX0hFTFBFUicgZnJvbSBDT05GSUdfRFJN
X01JUElfREJJLCB3aGljaCBtYWtlcyBpdA0KPiBzYWZlciBhbmQgbW9yZSBjb25zaXN0ZW50
IHdpdGggeW91ciBjaGFuZ2UuIElmIHlvdSBsaWtlLCBJJ2xsIHNlbmQgYW4gdXBkYXRlZA0K
PiB2ZXJzaW9uLg0KDQpNSVBJIERCSSBpcyBhbm90aGVyIGhlbHBlciBhbmQgc2VsZWN0IGlz
IG5vdCB0cmFuc2l0aXZlIElJUkMuIFNvIGRyaXZlcnMgDQp3b3VsZCBzdGlsbCBoYXZlIHRv
IHNlbGVjdCBLTVMgaGVscGVycyBhcyB3ZWxsLiAoPykNCg0KSSBqdXN0IGFkZGVkIG15IHBh
dGNoIHRvIGRybS1taXNjLWZpeGVzIHRvZGF5IGFuZCBpdCBzaG91bGQgc2hvdyB1cCBpbiAN
CnVwc3RyZWFtIHNvb24uIE1heWJlIGp1c3QgcmViYXNlIHlvdXIgcGF0Y2ggb24gdG9wIG9m
IGl0IGFuZCBpZiBub3RoaW5nIA0KYnJlYWtzIGxldCdzIG1lcmdlIGl0IGFzLWlzIGluY2x1
ZGluZyB0aGUgJ2RlcGVuZHMgb24nLiBZb3UgY2FuIGFkZA0KDQpBY2tlZC1ieTogVGhvbWFz
IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCmluIHRoaXMgY2FzZS4NCg0K
TW9yZSBnZW5lcmFsbHksIEkgdGhpbmsgeW91J3JlIHJpZ2h0IGFib3V0IG1ha2luZyBEUk0g
aGVscGVyIGxpYnJhcmllcyANCnVzaW5nICdkZXBlbmRzIG9uJyB0byBsaW5rIHRvIG90aGVy
IGxpYnJhcmllcy4gRHJpdmVycyB3b3VsZCBhdCBsZWFzdCANCmtub3cgd2hpY2ggY29uZmln
IHN5bWJvbHMgdG8gc2VsZWN0LiBBIG51bWJlciBvZiBjb25maWcgcnVsZXMgd291bGQgaGF2
ZSANCnRvIGJlIGFkYXB0ZWQgdG8gbWFrZSB0aGF0IGhhcHBlbiwgSSBndWVzcy4NCg0KT25l
IGlzc3VlIGlzIHRoYXQgZGlmZmVyZW50IHN1Ym1vZHVsZXMgb2YgRFJNIHNlZW0gdG8gdXNl
IGRpZmZlcmVudCANCmxvZ2ljIGZvciBleHByZXNzaW5nIHN1Y2ggY29uZmlnIGRlcGVuZGVu
Y2llcy4gVGhhdCdzIGJlZW4gYW4gZW5kbGVzcyANCnNvdXJjZSBvZiBwcm9ibGVtcyBzbyBm
YXIuDQoNCj4gDQo+IE9uZSB0aGluZyBJJ20gbm90IHN1cmUgYWJvdXQgaXMgd2hldGhlciB0
aGVyZSBpcyBzdGlsbCB1c2UgZm9yIGV2ZXIgaGF2aW5nDQo+IENPTkZJR19EUk0gd2l0aG91
dCBDT05GSUdfRFJNX0tNU19IRUxQRVIgaWYgaXQgZ2V0cyBzZWxlY3RlZA0KPiBieSBhbG1v
c3QgZXZlcnkgZHJpdmVyIGFueXdheS4gSXMgdGhpcyBhY3R1YWxseSBhIGNvbmZpZ3VyYXRp
b24gdGhhdA0KPiB1c2VycyByZWx5IG9uLCBvciBzaG91bGQgd2UganVzdCByZW1vdmUgdGhl
IHN5bWJvbCBjb21wbGV0ZWx5IGFuZA0KPiBidWlsZCB0aGUgS01TIGhlbHBlcnMgdW5jb25k
aXRpb25hbGx5Pw0KDQpCZXN0IGxlYXZlIGl0IGFzIGl0IGlzLiBpOTE1IGRvZXNuJ3QgdXNl
IGl0LiBBbmQgc2luY2UgaXQncyBhIGhlbHBlciwgaXQgDQpzaG91bGQgbm90IGJlIGx1bXBl
ZCB0b2dldGhlciB3aXRoIGNvcmUgRFJNIGNvZGUgc2ltcGx5IGZvciByZWFzb25zIG9mIA0K
ZGVzaWduLg0KDQpGb3IgRFJNX0tNU19IRUxQRVIgaXRzZWxmLCB0aGUgbWlkLXRlcm0gcGxh
biBpcyB0byBtb3ZlIHNvbWUgb2YgdGhlIGNvZGUgDQppbnRvIG90aGVyIG1vZHVsZXMuIEtN
UyBoZWxwZXJzIHVzZWQgdG8gY29udGFpbiBhbGwga2luZCBvZiBoZWxwZXJzLCBidXQgDQpy
ZWNlbnRseSB0aGVyZSdzIGludGVyZXN0IGluIHJlZHVjaW5nIHRoZSBtaW5pbXVtIHNpemUg
b2YgYSBidWlsdC1pbiBEUk0gDQp3aXRoIG1pbmltYWwgZHJpdmVyIHN1cHBvcnQuIFNvIHRo
ZSBub24tZXNzZW50aWFsIHN0dWZmIG5lZWRzIHRvIGdvIGludG8gDQptb2R1bGVzIGZvciB0
aGUgbW9yZS1zb3BoaXN0aWNhdGVkIERSTSBkcml2ZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiAgICAgICAgIEFybmQNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------Hwl5K59dH9RMcqui1rkhy0yf--

--------------QqflseXbTVIupGsokgp12PoJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIziNoFAwAAAAAACgkQlh/E3EQov+C7
1g/+MZ6MhZKF1Ppyy2/+BLcdpzVdFDrvXQzKesGjQ0epAUOV2q7V4+JMQ3igZrqPNOuE2pWbDqhO
6o6Yuh/CRnYkHoKPpYqkU/1zta7/tb5F9+GCaJgQmgKQOpMp6SgnTrPjE4sLPlOsc2Wp2Y86o0u/
TUaQARpqpmG1SRONzbuBQzPonEWUjEzZW9LJSzDYvWsRa4JHKqruwaE7G35RczVoLyuAsrVQi9bu
KH0bMJGtk+aBRW2V1eMAdICx6YcSSy2s4kgvtiAHvUDiVw3UC2o0aDkWCZ8S66/60ygt4XBbDRtQ
U7X/7YGeQQD+DpYNux/axFUlIfNELiPjgqYiGPHq0Sn4Bc93KSm7nqYI1b0NqgeObBHl8VUc22wt
V5Xg939JBVpsfIjCiUp3KasrBh20a80c9Wel0aR9qALdIvdJc4q7bam/NB5QNtw37SOsV/fr6jIg
D+m2Zo3RSNK4ipQe8XWC++FIhQQL9s1l12g4wH/+fFmB7HYc3YXHYyBiUT7Zz5b7e7KH1vpb8KsN
8PfARQ0wtX1mYqUHa1Cl/7RvzC1dOzT2yEEIV8tP1oYMSXhoMGLvSuL+tSJq6htxpu9H6p6AGFpf
TZ3pb6KkX27wSvMKwYOAMZJVKXBGjBvHFrvoied8IaxwUMJFVsDJrmSIk6ywFhLaH+y5xscVUsjy
tOU=
=OnWi
-----END PGP SIGNATURE-----

--------------QqflseXbTVIupGsokgp12PoJ--
