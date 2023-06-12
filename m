Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492072BEB6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CFD10E1EE;
	Mon, 12 Jun 2023 10:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0010E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:19:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98ED9201A7;
 Mon, 12 Jun 2023 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686565172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKaigxAjcVMigCtaY32+zB6ijm3ZRFsTcXTUJOnfdk4=;
 b=Gia7IiKr8S8uaig+yljGMJwpis/8IFEX+7ME4nKVwol0G9gyOCmPOBUnQ4g2eXzs1iyLeK
 eQyvim+OyA7KKrNugjyd5npiR7IWzYxbWHoR/QKr0PqPt96gCs7e72Y7nPRYIJyra0s4s0
 K1I/ivTqI3ZFESSvQGYOYk+1C6zSOBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686565172;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKaigxAjcVMigCtaY32+zB6ijm3ZRFsTcXTUJOnfdk4=;
 b=lGRol2uaQF6vcfHQh1eGAySPCDx5i+IQueMFs4aTS3GAd+CQw4gdw3M+6Py5DdeD8jpzdf
 W3YYsBsq+QnCR7Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55BC8138EC;
 Mon, 12 Jun 2023 10:19:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o0zaEzTxhmSoJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 10:19:32 +0000
Message-ID: <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
Date: Mon, 12 Jun 2023 12:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
 <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------csSjsyfV2npTgHsZh49PsLvP"
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------csSjsyfV2npTgHsZh49PsLvP
Content-Type: multipart/mixed; boundary="------------OfUYOQGIXGbmedLwVMsBWfxz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Message-ID: <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
 <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>

--------------OfUYOQGIXGbmedLwVMsBWfxz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA4LjA2LjIzIHVtIDAwOjIyIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IERldGVjdCByZWdpc3RlcmVkIGluc3RhbmNlcyBvZiBmYl9p
bmZvIGJ5IHJlYWRpbmcgdGhlIHJlZmVyZW5jZQ0KPj4gY291bnRlciBmcm9tIHN0cnVjdCBm
Yl9pbmZvLnJlYWQuIEF2b2lkcyBsb29raW5nIGF0IHRoZSBkZXYgZmllbGQNCj4+IGFuZCBw
cmVwYXJlcyBmYmRldiBmb3IgbWFraW5nIHN0cnVjdCBmYl9pbmZvLmRldiBvcHRpb25hbC4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+IENjOiBTdGV2ZSBHbGVuZGlubmluZyA8c3RldmUuZ2xlbmRpbm5pbmdA
c2hhd2VsbC5uZXQ+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9zbXNjdWZ4
LmMgfCA0ICsrLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9z
bXNjdWZ4LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Ntc2N1ZnguYw0KPj4gaW5kZXggMTdj
ZWM2MmNjNjVkLi5hZGIyYjFmZTgzODMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3Ntc2N1ZnguYw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zbXNjdWZ4
LmMNCj4+IEBAIC0xNDk2LDcgKzE0OTYsNyBAQCBzdGF0aWMgaW50IHVmeF9zZXR1cF9tb2Rl
cyhzdHJ1Y3QgdWZ4X2RhdGEgKmRldiwgc3RydWN0IGZiX2luZm8gKmluZm8sDQo+PiAgIAl1
OCAqZWRpZDsNCj4+ICAgCWludCBpLCByZXN1bHQgPSAwLCB0cmllcyA9IDM7DQo+PiAgIA0K
Pj4gLQlpZiAoaW5mby0+ZGV2KSAvKiBvbmx5IHVzZSBtdXRleCBpZiBpbmZvIGhhcyBiZWVu
IHJlZ2lzdGVyZWQgKi8NCj4+ICsJaWYgKHJlZmNvdW50X3JlYWQoJmluZm8tPmNvdW50KSkg
Lyogb25seSB1c2UgbXV0ZXggaWYgaW5mbyBoYXMgYmVlbiByZWdpc3RlcmVkICovDQo+IA0K
PiBUaGUgc3RydWN0IGZiX2luZm8gLmNvdW50IHJlZmNvdW50IGlzIHByb3RlY3RlZCBieSB0
aGUgcmVnaXN0cmF0aW9uX2xvY2sNCj4gbXV0ZXggaW4gcmVnaXN0ZXJfZnJhbWVidWZmZXIo
KS4gSSB0aGluayB0aGlzIG9wZXJhdGlvbiBpc24ndCB0aHJlYWQgc2FmZSA/DQoNCkl0J3Mg
YW4gYXRvbWljIHJlYWQuDQoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9yZWZjb3VudC5oI0wxNDcNCg0KQW5kIHRoYXQg
ZnVuY3Rpb24gaXMgb25seSBiZWluZyBjYWxsZWQgZnJvbSB0aGUgVVNCIHByb2JlIGNhbGxi
YWNrIA0KYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBmcmFtZWJ1ZmZlci4gSXQncyBub3QgY2xl
YXIgdG8gbWUgaG93IHRoZSB2YWx1ZSANCmNvdWxkIGJlIGFueXRoaW5nIGJ1dCB6ZXJvLiBJ
J2QgYmVzdCBsZWF2ZSBpdCBhcyBpcyB3aXRoIHRoZSByZWYgY291bnRlci4NCg0KaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3Ntc2N1ZnguYyNMMTcwNg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcy4NCg0KPiAN
Cj4gQnV0IHRoYXQgd2FzIGFsc28gdGhlIGNhc2UgZm9yIGluZm8tPmRldiBjaGVjaywgc28g
SSBndWVzcyBpcyBPSyBhbmQgdGhpcw0KPiBjaGFuZ2UgaXMgZm9yIGFuIG9sZCBmYmRldiBk
cml2ZXIgYW55d2F5cy4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------OfUYOQGIXGbmedLwVMsBWfxz--

--------------csSjsyfV2npTgHsZh49PsLvP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSG8TMFAwAAAAAACgkQlh/E3EQov+C+
ng//c4m1y7zw+XOBygWFfc+1akv0YaB8rhoyxTf49VXfeYdA9sIuRRBJ8LXL9nsw0KhVWwPKdIGT
zJ45ZwI6OsZ+V2e9/s21inJm/XNsoEqkCb1WIk2y8CJ8pV4PthZAE0X+j+kFAG+8iHD1naqiMJES
rJOPs7evuQesqIpbialNhiB57ockNUpcjt8+cN5v7MY42ZUl8bpb1oFrn1weh/HS84Kp3+7liKVY
oOBx8Pqk2CA8ZVN1e5k7QGuKg1eQZhoaCzSuWdsy8VCZFvQIVjTlbRYHaTjS8vAFQZ6GWGkHC8wD
+3xqI/ivJBDm7uHKlknmiumZomqCsFOVy+SyTkTxI125afoNHBhQCkrBekXK5mTemlTxH4QRMN0Z
thC6xdwj+cwPBRobfs6RzX0AkM+rJyWaC5kZTx1UWCRXZTTPhRLhvbqb9i6kxPUNPgeSAsplt/Ly
O5lposoYT/7uhrIB/Ul5FfBf+c/m67zIRDHKNcaWl3uALChhTr/ZV2b2OlihWNLiRiHHmIyUrfPi
hzUTGUhusl/SbjptOWJyPZc3W3WEGDNROl9Bw5eeICdndteL9yCMMlLSOmI49Hgwc65Kcdp9vWeY
zXfujLvU/fl1ev+edczQiMCioeG8IzZ3a3cjvAX/1Jkgzse1CwgQHMnlhcwLV9AzueabUrihFWlr
rrk=
=bGDX
-----END PGP SIGNATURE-----

--------------csSjsyfV2npTgHsZh49PsLvP--
