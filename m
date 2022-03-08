Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6B4D21BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363BE10E45A;
	Tue,  8 Mar 2022 19:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114E210E47B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:40:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8050A1F380;
 Tue,  8 Mar 2022 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646768411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Vt6dIMZJcA7OS843NjbdzIss3He+UHsN+x8b426Opw=;
 b=KT3x8r69VnsqEzpq0cxLkWjW69qX0+Xj/E+uOjoN3hU0J3bmGPqJg7OK0INBIvtOhCmPB4
 FpmcnhDjAifEj0oz1CYMNQh2SZx4jCnDiweyTAMUld5WHL49nTMwXQRMMwrCdHWaOC60YT
 At1hRngDFqbMTu9lIuCyU1nmZlWHd4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646768411;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Vt6dIMZJcA7OS843NjbdzIss3He+UHsN+x8b426Opw=;
 b=JiYWSW/TVKMUjSnlPHQFjSlgU7V5CZ/qS/mGGKdDSx22wzf5oPrUiIc+6GUDUch+5g5pB8
 diNPaxuDFCgXx8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6191913CE9;
 Tue,  8 Mar 2022 19:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u5C5FhuxJ2JrDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:40:11 +0000
Message-ID: <18036dcd-c760-1842-ff93-db2f0a80a5c9@suse.de>
Date: Tue, 8 Mar 2022 20:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 06/10] drm/gma500: Move GTT resume logic out of
 psb_gtt_init()
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220306203619.22624-1-tzimmermann@suse.de>
 <20220306203619.22624-7-tzimmermann@suse.de> <YiZYAFdM28igTrC3@ravnborg.org>
 <CAMeQTsY9VRvy8t4=GTOa9rD9HFBnRqFj9NxQ2ofig1JVkiLfKw@mail.gmail.com>
 <f8706174-c85c-94a5-b475-8b537dba7c1c@suse.de>
 <CAMeQTsb7XheM-iEy8QKfaBU23LKu8mU_moy7qQw0iFAqLxVKcg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMeQTsb7XheM-iEy8QKfaBU23LKu8mU_moy7qQw0iFAqLxVKcg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fFTmosdGLGaBrAWh2fCMshbU"
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fFTmosdGLGaBrAWh2fCMshbU
Content-Type: multipart/mixed; boundary="------------Zj0snsiR36QbrkyTT6TS7bTd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <18036dcd-c760-1842-ff93-db2f0a80a5c9@suse.de>
Subject: Re: [PATCH 06/10] drm/gma500: Move GTT resume logic out of
 psb_gtt_init()
References: <20220306203619.22624-1-tzimmermann@suse.de>
 <20220306203619.22624-7-tzimmermann@suse.de> <YiZYAFdM28igTrC3@ravnborg.org>
 <CAMeQTsY9VRvy8t4=GTOa9rD9HFBnRqFj9NxQ2ofig1JVkiLfKw@mail.gmail.com>
 <f8706174-c85c-94a5-b475-8b537dba7c1c@suse.de>
 <CAMeQTsb7XheM-iEy8QKfaBU23LKu8mU_moy7qQw0iFAqLxVKcg@mail.gmail.com>
In-Reply-To: <CAMeQTsb7XheM-iEy8QKfaBU23LKu8mU_moy7qQw0iFAqLxVKcg@mail.gmail.com>

--------------Zj0snsiR36QbrkyTT6TS7bTd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMTM6MDcgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
PiBPbiBUdWUsIE1hciA4LCAyMDIyIGF0IDk6NDggQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpIFNhbSBhbmQgUGF0cmlrDQo+
Pg0KPj4gQW0gMDcuMDMuMjIgdW0gMjI6MDIgc2NocmllYiBQYXRyaWsgSmFrb2Jzc29uOg0K
Pj4+IE9uIE1vbiwgTWFyIDcsIDIwMjIgYXQgODowNyBQTSBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBUaG9tYXMsDQo+Pj4+DQo+Pj4+
IE9uZSBjb21tZW50IGJlbG93Lg0KPj4+Pg0KPj4+PiBPbiBTdW4sIE1hciAwNiwgMjAyMiBh
dCAwOTozNjoxNVBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4+IFRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHBzYl9ndHRfaW5pdCgpIGFsc28gZG9lcyBy
ZXN1bWUNCj4+Pj4+IGhhbmRsaW5nLiBNb3ZlIHRoZSByZXN1bWUgY29kZSBpbnRvIGl0cyBv
d24gaGVscGVyLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL2d0dC5jICAgICB8IDEyMiArKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tDQo+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2d0dC5oICAgICB8
ICAgMiArLQ0KPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgfCAg
IDIgKy0NCj4+Pj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9ndHQuYw0KPj4+Pj4g
aW5kZXggYWNkNTBlZTI2YjAzLi40M2FkM2VjMzhjODAgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL2d0dC5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZ21hNTAwL2d0dC5jDQo+Pj4+PiBAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyB2b2lk
IHBzYl9ndHRfcG9wdWxhdGVfcmVzb3VyY2VzKHN0cnVjdCBkcm1fcHNiX3ByaXZhdGUgKnBk
ZXYpDQo+Pj4+PiAgICAgICAgIGRybV9kYmcoZGV2LCAiUmVzdG9yZWQgJXUgb2YgJXUgZ3R0
IHJhbmdlcyAoJXUgS0IpIiwgcmVzdG9yZWQsIHRvdGFsLCAoc2l6ZSAvIDEwMjQpKTsNCj4+
Pj4+ICAgIH0NCj4+Pj4+DQo+Pj4+PiAtaW50IHBzYl9ndHRfaW5pdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBpbnQgcmVzdW1lKQ0KPj4+Pj4gK2ludCBwc2JfZ3R0X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikNCj4+Pj4+ICAgIHsNCj4+Pj4+ICAgICAgICAgc3RydWN0IGRy
bV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19kcm1fcHNiX3ByaXZhdGUoZGV2KTsNCj4+
Pj4+ICAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldi0+ZGV2
KTsNCj4+Pj4+IEBAIC0yMTgsMTAgKzIxOCw4IEBAIGludCBwc2JfZ3R0X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgaW50IHJlc3VtZSkNCj4+Pj4+ICAgICAgICAgc3RydWN0IHBz
Yl9ndHQgKnBnOw0KPj4+Pj4gICAgICAgICBpbnQgcmV0ID0gMDsNCj4+Pj4+DQo+Pj4+PiAt
ICAgICBpZiAoIXJlc3VtZSkgew0KPj4+Pj4gLSAgICAgICAgICAgICBtdXRleF9pbml0KCZk
ZXZfcHJpdi0+Z3R0X211dGV4KTsNCj4+Pj4+IC0gICAgICAgICAgICAgbXV0ZXhfaW5pdCgm
ZGV2X3ByaXYtPm1tYXBfbXV0ZXgpOw0KPj4+Pj4gLSAgICAgfQ0KPj4+Pj4gKyAgICAgbXV0
ZXhfaW5pdCgmZGV2X3ByaXYtPmd0dF9tdXRleCk7DQo+Pj4+PiArICAgICBtdXRleF9pbml0
KCZkZXZfcHJpdi0+bW1hcF9tdXRleCk7DQo+Pj4+Pg0KPj4+Pj4gICAgICAgICBwZyA9ICZk
ZXZfcHJpdi0+Z3R0Ow0KPj4+Pj4NCj4+Pj4+IEBAIC0yOTAsMTMgKzI4OCw2IEBAIGludCBw
c2JfZ3R0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IHJlc3VtZSkNCj4+Pj4+
ICAgICAgICAgZGV2X2RiZyhkZXYtPmRldiwgIlN0b2xlbiBtZW1vcnkgYmFzZSAweCV4LCBz
aXplICVsdUtcbiIsDQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfcHJpdi0+
c3RvbGVuX2Jhc2UsIHZyYW1fc3RvbGVuX3NpemUgLyAxMDI0KTsNCj4+Pj4+DQo+Pj4+PiAt
ICAgICBpZiAocmVzdW1lICYmIChndHRfcGFnZXMgIT0gcGctPmd0dF9wYWdlcykgJiYNCj4+
Pj4+IC0gICAgICAgICAoc3RvbGVuX3NpemUgIT0gcGctPnN0b2xlbl9zaXplKSkgew0KPj4+
Pj4gLSAgICAgICAgICAgICBkZXZfZXJyKGRldi0+ZGV2LCAiR1RUIHJlc3VtZSBlcnJvci5c
biIpOw0KPj4+Pj4gLSAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4+Pj4gLSAgICAg
ICAgICAgICBnb3RvIG91dF9lcnI7DQo+Pj4+PiAtICAgICB9DQo+Pj4+PiAtDQo+Pj4+PiAg
ICAgICAgIHBnLT5ndHRfcGFnZXMgPSBndHRfcGFnZXM7DQo+Pj4+PiAgICAgICAgIHBnLT5z
dG9sZW5fc2l6ZSA9IHN0b2xlbl9zaXplOw0KPj4+Pj4gICAgICAgICBkZXZfcHJpdi0+dnJh
bV9zdG9sZW5fc2l6ZSA9IHZyYW1fc3RvbGVuX3NpemU7DQo+Pj4+PiBAQCAtMzA0LDE5ICsy
OTUsMTQgQEAgaW50IHBzYl9ndHRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQg
cmVzdW1lKQ0KPj4+Pj4gICAgICAgICAvKg0KPj4+Pj4gICAgICAgICAgKiAgICAgIE1hcCB0
aGUgR1RUIGFuZCB0aGUgc3RvbGVuIG1lbW9yeSBhcmVhDQo+Pj4+PiAgICAgICAgICAqLw0K
Pj4+Pj4gLSAgICAgaWYgKCFyZXN1bWUpDQo+Pj4+PiAtICAgICAgICAgICAgIGRldl9wcml2
LT5ndHRfbWFwID0gaW9yZW1hcChwZy0+Z3R0X3BoeXNfc3RhcnQsDQo+Pj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3R0X3BhZ2VzIDw8IFBB
R0VfU0hJRlQpOw0KPj4+Pj4gKyAgICAgZGV2X3ByaXYtPmd0dF9tYXAgPSBpb3JlbWFwKHBn
LT5ndHRfcGh5c19zdGFydCwgZ3R0X3BhZ2VzIDw8IFBBR0VfU0hJRlQpOw0KPj4+Pj4gICAg
ICAgICBpZiAoIWRldl9wcml2LT5ndHRfbWFwKSB7DQo+Pj4+PiAgICAgICAgICAgICAgICAg
ZGV2X2VycihkZXYtPmRldiwgIkZhaWx1cmUgdG8gbWFwIGd0dC5cbiIpOw0KPj4+Pj4gICAg
ICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07DQo+Pj4+PiAgICAgICAgICAgICAgICAgZ290
byBvdXRfZXJyOw0KPj4+Pj4gICAgICAgICB9DQo+Pj4+Pg0KPj4+Pj4gLSAgICAgaWYgKCFy
ZXN1bWUpDQo+Pj4+PiAtICAgICAgICAgICAgIGRldl9wcml2LT52cmFtX2FkZHIgPSBpb3Jl
bWFwX3djKGRldl9wcml2LT5zdG9sZW5fYmFzZSwNCj4+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RvbGVuX3NpemUpOw0KPj4+Pj4gLQ0K
Pj4+Pj4gKyAgICAgZGV2X3ByaXYtPnZyYW1fYWRkciA9IGlvcmVtYXBfd2MoZGV2X3ByaXYt
PnN0b2xlbl9iYXNlLCBzdG9sZW5fc2l6ZSk7DQo+Pj4+PiAgICAgICAgIGlmICghZGV2X3By
aXYtPnZyYW1fYWRkcikgew0KPj4+Pj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LT5k
ZXYsICJGYWlsdXJlIHRvIG1hcCBzdG9sZW4gYmFzZS5cbiIpOw0KPj4+Pj4gICAgICAgICAg
ICAgICAgIHJldCA9IC1FTk9NRU07DQo+Pj4+PiBAQCAtMzMzLDExICszMTksMTA3IEBAIGlu
dCBwc2JfZ3R0X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IHJlc3VtZSkNCj4+
Pj4+ICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+ICAgIH0NCj4+Pj4+DQo+Pj4+IFRoZSBi
ZWxvdyBpcyBhIGxvdCBvZiBkdXBsaWNhdGVkIGNvbXBsZXggY29kZS4NCj4+Pj4gQ2FuIHlv
dSBhZGQgb25lIG1vcmUgaGVscGVyIGZvciB0aGlzPw0KPj4+DQo+Pg0KPj4gVGhhdCBtYWtl
cyBhIGxvdCBvZiBzZW5zZS4NCj4+DQo+Pj4gSSB3YXMgdGhpbmtpbmcgdGhlIHNhbWUgYnV0
IGZpZ3VyZWQgaXQgd291bGQgYmUgYW4gZWFzeSBmb2xsb3cgdXANCj4+PiBwYXRjaC4gQnV0
IHN1cmUsIHdoeSBub3QgZml4IGl0IGhlcmUgYWxyZWFkeS4NCj4+Pg0KPj4+IFdoaWxlIGF0
IGl0LCB0aGUgZ3R0IGVuYWJsZS9kaXNhYmxlIGNvZGUgY291bGQgYmUgcHV0IGluIGhlbHBl
cnMgYXMgd2VsbC4NCj4+DQo+PiBQYXRyaWssIGRvIHlvdSBrbm93IHdoeSB0aGUgY29kZSBy
ZS1yZWFkcyBhbGwgdGhlc2UgdmFsdWVzIGR1cmluZw0KPj4gcmVzdW1lPyBEbyB0aGUgdmFs
dWVzIGNoYW5nZT8gIFRoZSBkcml2ZXIgbmV2ZXIgc2VlbXMgdG8gZG8gYW55dGhpbmcNCj4+
IHdpdGggdGhlIHVwZGF0ZWQgdmFsdWVzLiBGb3IgZXhhbXBsZSwgaXQgZG9lc24ndCB1cGRh
dGUgdGhlIEdUVCBtYXBwaW5nDQo+PiBpZiBndHRfcGh5c19zdGFydCBjaGFuZ2VzLiAgQ2Fu
IHdlIHJlbW92ZSBhbGwgdGhhdCBjb2RlIGZyb20gdGhlIHJlc3VtZQ0KPj4gZnVuY3Rpb24/
DQo+IA0KPiBJbiB0aGVvcnkgdGhlc2UgdmFsdWVzIGNhbiBjaGFuZ2UgaWYgeW91IGhpYmVy
bmF0ZSwgbWFrZSBjaGFuZ2VzIGluDQo+IHRoZSBiaW9zIGFuZCB0aGVuIHJlc3VtZS4gSSB0
aGluayBJJ3ZlIHNlZW4gYmlvc2VzIHRoYXQgY2FuIGNoYW5nZSB0aGUNCj4gc3RvbGVuIHNp
emUgYW5kL29yIGFwZXJ0dXJlIHNpemUuIE5vdCBzdXJlIGlmIHRoYXQgd291bGQgYWxzbyBj
aGFuZ2UNCj4gdGhlIHZhbHVlIGluIGVnLiBwZ2VfY3RsIG9yIHRoZSBzaXplIG9mIHRoZSBn
dHQuIEkgd291bGQgaGF2ZSB0byBkbw0KPiBzb21lIHRlc3Rpbmcgb24gcmVhbCBoYXJkd2Fy
ZSB0byBmaWd1cmUgdGhpcyBvdXQuDQo+IEJ1dCBhcyB5b3Ugc2F5LCB0aGUgYWJvdmUgc2Nl
bmFyaW8gaXMgYWxyZWFkeSBicm9rZW4uIEZvciB0aGUgdGltZQ0KPiBiZWluZywgY2FuIHdl
IHBlcmhhcHMganVzdCBmYWlsIGdyYWNlZnVsbHk/DQoNCkFoLCB0aGFua3MgZm9yIHRoZSBl
eHBsYW5hdGlvbi4gSSdsbCBsZWF2ZSB0aGUgY3VycmVudCBsb2dpYyBhcy1pcy4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Zj0snsiR36QbrkyTT6TS7bTd--

--------------fFTmosdGLGaBrAWh2fCMshbU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmInsRoFAwAAAAAACgkQlh/E3EQov+Cw
bBAAq8V7EGdQTOwuY/fTXy0B48fmhq2myfdSvbyTlMOGnGhk6BmVwaddTXSxnNEv4Ig8u6B8+RM+
7S4paJ9yV3AyROJXKBh2IvEk9ito7sPRn9djXepSQkjmE63zggKZllGvcUbrcJuAgUoSLmc4wfI8
It5qx/v3lqzZ84nZOewuVUjgKsKkl74umsnF1V9/wzQhTbL8PbR10zjKns/r5nnq4JCXz/v9XK+b
9x2yTsU6HO7n+UNccodUu0pp3W6F0/gqUmxsKaPsUA0SmznsfLp3CpNr4FziLqS52CVn+fTjFjQM
XOs0NZYs4jM6trLdBrooy8zhnulFGNLzGGQxi6J01+86moWPfhWm1S2ObhUKXjTxNflxWFii9dxw
+GgKuRs1/HGBWX3xSPmOZeeWv9G2mUIT5jW0S8TwSddUplNKhrIPpZJ1QpIVxKyZMHC4W1IqFu90
MlTnIbd0HBStiijP2ZbeiCO8hpkQN432nscy1zJg/USPP1/YdqPRzicYWq2kflR43oNbRLyd2GI/
zX5+6XFb0YKpVFssuLFRVkKceJoLMCRy+UQbIIQvGT65CJm8fCyyIwYkqnIizeh0gUIIWgMEwDEv
1vtTOlobvhoCsk7rB4IpkCsXmOa/Do4V6qq7dMZ0ryg8RRfBBFwtIROvbDMPtP8Tp5Udru8lXH44
KWE=
=WK5B
-----END PGP SIGNATURE-----

--------------fFTmosdGLGaBrAWh2fCMshbU--
