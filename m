Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23C7263E5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336210E01F;
	Wed,  7 Jun 2023 15:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DCA10E50E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:15:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80B4F21A0B;
 Wed,  7 Jun 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686150952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8vl5u8vRd8gmXacQqWuDyAXg2T++oslac8ZS8H/bk1s=;
 b=Jr86aCkGOEamH92bj1KwEgUt5B9I038hyWmHdRUJJzOcuT5V/MNQx3tsXhjmaQEPIfu9N2
 9L7W3NnLZXDC3U4g2U/qy6IRZuU8qGvioTk8OljhxqrQSnjcnzXpijneU8LMd0HPtavF/j
 3KG+UHPExtc3lZv5eaEVrn1nOhcS97Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686150952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8vl5u8vRd8gmXacQqWuDyAXg2T++oslac8ZS8H/bk1s=;
 b=zVx7yuZ/wNO9bkjC5SJXZsjOa+Z7l8O6UBJ9uT2DPoHSBj4Ov4Xcxb3cOaK/IC50QkwGpK
 3+BeNlBI3MTAX1AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 409141346D;
 Wed,  7 Jun 2023 15:15:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oZy/DiifgGT0JwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jun 2023 15:15:52 +0000
Message-ID: <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
Date: Wed, 7 Jun 2023 17:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M6rYvO9rIW03zBgN0h0bpi1s"
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M6rYvO9rIW03zBgN0h0bpi1s
Content-Type: multipart/mixed; boundary="------------ldQ1fhfowxh97luX777uhDg3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
Message-ID: <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>

--------------ldQ1fhfowxh97luX777uhDg3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDYuMjMgdW0gMTA6NDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9u
IE1vbiwgSnVuIDUsIDIwMjMgYXQgNDo0OOKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFkZCBLY29uZmlnIG9wdGlvbiBDT05GSUdf
RkJfREVWSUNFIGFuZCBtYWtlIHRoZSB2aXJ0dWFsIGZiZGV2DQo+PiBkZXZpY2Ugb3B0aW9u
YWwuIElmIHRoZSBuZXcgb3B0aW9uIGhhcyBub3QgYmVlbiBzZWxlY3RlZCwgZmJkZXYNCj4+
IGRvZXMgbm90IGNyZWF0ZSBhIGZpbGVzIGluIGRldmZzIG9yIHN5c2ZzLg0KPj4NCj4+IE1v
c3QgbW9kZXJuIExpbnV4IHN5c3RlbXMgcnVuIGEgRFJNLWJhc2VkIGdyYXBoaWNzIHN0YWNr
IHRoYXQgdXNlcw0KPj4gdGhlIGtlcm5lbCdzIGZyYW1lYnVmZmVyIGNvbnNvbGUsIGJ1dCBo
YXMgb3RoZXJ3aXNlIGRlcHJlY2F0ZWQgZmJkZXYNCj4+IHN1cHBvcnQuIFlldCBmYmRldiB1
c2Vyc3BhY2UgaW50ZXJmYWNlcyBhcmUgc3RpbGwgcHJlc2VudC4NCj4+DQo+PiBUaGUgb3B0
aW9uIG1ha2VzIGl0IHBvc3NpYmxlIHRvIHVzZSB0aGUgZmJkZXYgc3Vic3lzdGVtIGFzIGNv
bnNvbGUNCj4+IGltcGxlbWVudGF0aW9uIHdpdGhvdXQgc3VwcG9ydCBmb3IgdXNlcnNwYWNl
LiBUaGlzIGNsb3NlcyBwb3RlbnRpYWwNCj4+IGVudHJ5IHBvaW50cyB0byBtYW5pcHVsYXRl
IGtlcm5lbCBvciBJL08gbWVtb3J5IHZpYSBmcmFtZWJ1ZmZlcnMuIEl0DQo+IA0KPiBJJ2Qg
bGVhdmUgb3V0IHRoZSBwYXJ0IGFib3V0IG1hbmlwdWxhdGluZyBrZXJuZWwgbWVtb3J5LCBh
cyB0aGF0J3MgYQ0KPiBkcml2ZXIgYnVnLCBpZiBwb3NzaWJsZS4NCg0KVGhlIGRyaXZlci9j
b3JlIGRpc3RpbmN0aW9uIGlzIHNvbWV3aGF0IGZ1enp5OiB0aGUgcmVjZW50IGJ1ZyB3aXRo
IE9PQiANCmFjY2VzcyB3YXMgaW50cm9kdWNlZCBhY2NpZGVudGFsbHkgaW4gc2hhcmVkIGhl
bHBlciBjb2RlIHdpdGhpbiBEUk0uDQoNCkFuZCB3aGVuZXZlciBJIHdhbnQgdG8gbW9kaWZ5
IHRoZSBmYmRldiBjb2RlLCBJIGhhdmUgdG8gc3RhcnQgYnVnZml4aW5nIA0KZmlyc3QuIEp1
c3QgbG9vayBhdCB0aGlzIHBhdGNoc2V0LiBBIGdvb2QgbnVtYmVyIG9mIHRoZSBwYXRjaGVz
IGFyZSANCmJ1Z2ZpeGVzLiBEcml2ZXIgb3Igbm90LCBJIG5vIGxvbmdlciB0cnVzdCBhbnkg
b2YgdGhlIGZiZGV2IGNvZGUgdG8gZ2V0IA0KYW55dGhpbmcgcmlnaHQuDQoNCg0KPiANCj4+
IGFsc28gcHJldmVudHMgdGhlIGV4ZWN1dGlvbiBvZiBkcml2ZXIgY29kZSB2aWEgaW9jdGwg
b3Igc3lzZnMsIGJvdGgNCj4+IG9mIHdoaWNoIG1pZ2h0IGFsbG93IG1hbGljaW91cyBzb2Z0
d2FyZSB0byBleHBsb2l0IGJ1Z3MgaW4gdGhlIGZiZGV2DQo+PiBjb2RlLg0KPiANCj4gT2Yg
Y291cnNlIGRpc2FibGluZyBpb2N0bHMgcmVkdWNlcyB0aGUgYXR0YWNrIHN1cmZhY2UsIGFu
ZCB0aGlzIGlzIG5vdA0KPiBsaW1pdGVkIHRvIGZiZGV2Li4uIDstKQ0KDQpPdGhlciBzdWJz
eXN0ZW1zIHNob3VsZCBkbyB0aGUgc2FtZSB3aGVyZSBwb3NzaWJsZS4gVGhlIHNwZWNpZmlj
IHByb2JsZW0gDQp3aXRoIERSTS1wbHVzLWZiZGV2IGlzIHRoYXQgdGhlIGZiZGV2IGRldmlj
ZSBkb2Vzbid0IHByb3ZpZGUgYW55IA0KYWRkaXRpb25hbCB2YWx1ZS4gSXQncyB0b28gbGlt
aXRlZCBpbiBmdW5jdGlvbmFsaXR5IChldmVuIGJ5IGZiZGV2IA0Kc3RhbmRhcmRzKSwgYSBw
b3NzaWJsZSBzb3VyY2UgZm9yIGJ1Z3MsIGFuZCB0b2RheSdzIHVzZXJzcGFjZSB3YW50cyBE
Uk0gDQpmdW5jdGlvbmFsaXR5Lg0KDQoNCj4gDQo+IEknbSB3b25kZXJpbmcgaWYgaXQgd291
bGQgYmUgd29ydGh3aGlsZSB0byBvcHRpb25hbGx5IHByb3ZpZGUgYSBtb3JlDQo+IGxpbWl0
ZWQgdXNlcnNwYWNlIEFQSSBmb3IgcmVhbCBmYmRldiBkcml2ZXJzOg0KPiAgICAxLiBObyBh
Y2Nlc3MgdG8gTU1JTywgb25seSB0byB0aGUgbWFwcGVkIGZyYW1lIGJ1ZmZlciwNCj4gICAg
Mi4gTm8gZHJpdmVyLXNwZWNpZmljIGlvY3Rscywgb25seSB0aGUgc3RhbmRhcmQgb25lcy4N
Cg0KVGhhdCBpc3N1ZSBpcyBvbmx5IHJlbGV2YW50IHRvIGZiZGV2IGRyaXZlcnMgYW5kIHdv
dWxkIGJlIGEgc2VwYXJhdGUgDQpwYXRjaHNldC4gTXkgY29uY2VybiBsaWVzIHdpdGggdGhl
IGN1cnJlbnQgZGlzdHJpYnV0aW9ucywgd2hpY2ggZG9uJ3QgDQpuZWVkIHRoZSBmYmRldiBk
ZXZpY2UgYW5kIHNob3VsZG4ndCBwcm92aWRlIGl0IGZvciB0aGUgZ2l2ZW4gcmVhc29ucy4N
Cg0KDQo+IA0KPj4gQSBzbWFsbCBudW1iZXIgb2YgZmJkZXYgZHJpdmVycyByZXF1aXJlIHN0
cnVjdCBmYmluZm8uZGV2IHRvIGJlDQo+PiBpbml0aWFsaXplZCwgdXN1YWxseSBmb3IgdGhl
IHN1cHBvcnQgb2Ygc3lzZnMgaW50ZXJmYWNlLiBNYWtlIHRoZXNlDQo+PiBkcml2ZXJzIGRl
cGVuZCBvbiBGQl9ERVZJQ0UuIFRoZXkgY2FuIGxhdGVyIGJlIGZpeGVkIGlmIG5lY2Vzc2Fy
eS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCj4gDQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcN
Cj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPj4gQEAgLTU3LDYgKzU3
LDE1IEBAIGNvbmZpZyBGSVJNV0FSRV9FRElEDQo+PiAgICAgICAgICAgIGNvbWJpbmF0aW9u
IHdpdGggY2VydGFpbiBtb3RoZXJib2FyZHMgYW5kIG1vbml0b3JzIGFyZSBrbm93biB0bw0K
Pj4gICAgICAgICAgICBzdWZmZXIgZnJvbSB0aGlzIHByb2JsZW0uDQo+Pg0KPj4gK2NvbmZp
ZyBGQl9ERVZJQ0UNCj4+ICsgICAgICAgIGJvb2wgIlByb3ZpZGUgbGVnYWN5IC9kZXYvZmIq
IGRldmljZSINCj4gDQo+IFBlcmhhcHMgImRlZmF1bHQgeSBpZiAhRFJNIiwgYWx0aG91Z2gg
dGhhdCBkb2VzIG5vdCBoZWxwIGZvciBhDQo+IG1peGVkIGRybS9mYmRldiBrZXJuZWwgYnVp
bGQ/DQoNCldlIGNvdWxkIHNpbXBseSBzZXQgaXQgdG8gImRlZmF1bHQgeSIuICBCdXQgT1RP
SCBpcyBpdCB3b3J0aCBtYWtpbmcgaXQgYSANCmRlZmF1bHQ/IERpc3RyaWJ1dGlvbnMgd2ls
bCBzZXQgaXQgdG8gdGhlIHZhbHVlIHRoZXkgbmVlZC93YW50LiBUaGUgdmVyeSANCmZldyBw
ZW9wbGUgdGhhdCBidWlsZCB0aGVpciBvd24ga2VybmVscyB0byBnZXQgY2VydGFpbiBmYmRl
diBkcml2ZXJzIA0Kd2lsbCBjZXJ0YWlubHkgYmUgYWJsZSB0byBlbmFibGUgdGhlIG9wdGlv
biBieSBoYW5kIGFzIHdlbGwuDQoNCg0KPiANCj4gT3IgcmVzZXJ2ZSAiRkIiIGZvciByZWFs
IGZiZGV2IGRyaXZlcnMsIGFuZCBpbnRyb2R1Y2UgYSBuZXcgRkJfQ09SRSwNCj4gdG8gYmUg
c2VsZWN0ZWQgYnkgYm90aCBGQiBhbmQgRFJNX0ZCREVWX0VNVUxBVElPTj8NCj4gVGhlbiBG
Ql9ERVZJQ0UgY2FuIGRlcGVuZCBvbiBGQl9DT1JFLCBhbmQgZGVmYXVsdCB0byB5IGlmIEZC
Lg0KDQpUaGF0IHdvdWxkbid0IHdvcmsuIEluIFR1bWJsZXdlZWQsIHdlIHN0aWxsIGhhdmUg
ZWZpZmIgYW5kIHZlc2FmYiANCmVuYWJsZWQgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zOyBt
ZXJlbHkgZm9yIHRoZSBrZXJuZWwgY29uc29sZS4gV2UnZCANCmhhdmUgdG8gZW5hYmxlIENP
TkZJR19GQiwgd2hpY2ggd291bGQgYnJpbmcgYmFjayB0aGUgZGV2aWNlLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPj4gKyAgICAgICAgZGVwZW5kcyBvbiBGQg0KPj4gKyAg
ICAgICAgaGVscA0KPj4gKyAgICAgICAgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdGhlIGxl
Z2FjeSAvZGV2L2ZiKiBkZXZpY2UgZmlsZS4gSXQncw0KPj4gKyAgICAgICAgIG9ubHkgcmVx
dWlyZWQgaWYgeW91IGhhdmUgdXNlcnNwYWNlIHByb2dyYW1zIHRoYXQgZGVwZW5kIG9uDQo+
PiArICAgICAgICAgZmJkZXYgZm9yIGdyYXBoaWNzIG91dHB1dC4gVGhpcyBkb2VzIG5vdCBl
ZmZlY3QgdGhlIGZyYW1lYnVmZmVyDQo+IA0KPiBhZmZlY3QNCj4gDQo+PiArICAgICAgICAg
Y29uc29sZS4NCj4+ICsNCj4+ICAgY29uZmlnIEZCX0REQw0KPj4gICAgICAgICAgdHJpc3Rh
dGUNCj4+ICAgICAgICAgIGRlcGVuZHMgb24gRkINCj4gDQo+IEdye29ldGplLGVldGluZ31z
LA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEg
TnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJl
dyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykN
Cg==

--------------ldQ1fhfowxh97luX777uhDg3--

--------------M6rYvO9rIW03zBgN0h0bpi1s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSAnycFAwAAAAAACgkQlh/E3EQov+AA
RA/+O6OQaSWfIQF4ij57SxCcn92MCARiu8rooX7hgUe43bDKp36LMMgNLaJeADaVDM6Y9s/B3iZv
8dL7+pFJz8Ikx6RFeOGvpeS+yJMLNJ/cRTb3j3uNx9Xz32qJIwjQa46SnK2ERBf6D5jkZ9iH9KQd
QU4E4VUVVr0E4M8x0PWS6BSxAswTwRP2qibhrGV/ifY+Ym7/1gBYu5I5CYExGoDInt7Vfsrt09sP
gb5Aa4BvIOuONrcoCS00zm8auznjLFcLi8UG9pLiZ46hDwhR8fSz7rRIOEOT2GBwnPBn06KRxj0c
JkA4b1zWTwqr8hu1k+TtZpnChLs0+yCv1F5qL7JDdgksP4kHoJ03r9jLfy0wU7zGrBD8fIOdro6N
mzEUOXcBKA8XB5VymAHcH2z6BrlWNDuIMDB4yZDJI3RKRVGpxV3tK0vKCSESCOOf1h/Vbv+ZYHCi
t/EObl4IX2M+aoKIq/ChNeUtOm5A8K8LFxNWP2cdo5NCdQOfUJTtxXB72XYXOraQ26g7EDc/bxpF
nSOGxGCtEbBKRnyI1YqAfvbdIELAPVPfo7y5+YSldjub0s75jQVOlT3D/xT47zBVEc+JJOQ65+Wq
cG554/DAyGXIKIZAMrIBkkGU48jtJccDd9Dw3YLi7FaV8lyvFGkbgC0HO5BnCIkM9kkygJmEoVjM
Tlk=
=wozr
-----END PGP SIGNATURE-----

--------------M6rYvO9rIW03zBgN0h0bpi1s--
