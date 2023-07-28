Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FE76652A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BEA10E05B;
	Fri, 28 Jul 2023 07:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33810E662
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:21:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7FC01F8AB;
 Fri, 28 Jul 2023 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690528870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHkExYMR9b50snv/s4plBxP8IlHU4ZZxUReBFh9r11s=;
 b=0QMwO7+fy0g8LAy11y25cACQjggLT1R1uQR6oUyFkj4KdAjb8tJvQqJ8n2o1oPvOwPD4YJ
 0ZOC9ZE7uFKNXwh40suzmH13HtEzvYw9sthMZeSfW3gPXrgdJW2aM2SDHcugAqld8CQWuy
 rNahr3TiHXhrGO94vzV7TKuuBBP37c8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690528870;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHkExYMR9b50snv/s4plBxP8IlHU4ZZxUReBFh9r11s=;
 b=ZxpigOMMQzsIQdeTGwUyW30xxVdh53wQZpBlH+h6jr1jTuFicOvOn7TGKHMSD2KZVsAGCx
 XlTMjopwqUIhK3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F7FC13276;
 Fri, 28 Jul 2023 07:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ren4JWZsw2SxRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 07:21:10 +0000
Message-ID: <5870e604-1653-73a6-7911-422d82f6bb04@suse.de>
Date: Fri, 28 Jul 2023 09:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727182416.4485@revelation.broadband>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230727182416.4485@revelation.broadband>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F7psArRPeglxkLwe2J1a0Jmw"
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
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F7psArRPeglxkLwe2J1a0Jmw
Content-Type: multipart/mixed; boundary="------------kKbNrO6PP3AZ3wgd180L6KhO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <5870e604-1653-73a6-7911-422d82f6bb04@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727182416.4485@revelation.broadband>
In-Reply-To: <20230727182416.4485@revelation.broadband>

--------------kKbNrO6PP3AZ3wgd180L6KhO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDcuMjMgdW0gMTk6MjQgc2NocmllYiBSb2dlciBTZXdlbGw6DQo+IA0K
PiBUaG9tYXMsDQo+IA0KPj4gQ291bGQgeW91IHByb3ZpZGUgdXMgd2l0aCB0aGUgWG9yZyBs
b2dzIGZyb20gL3Zhci9sb2cvWG9yZy4wLmxvZyAsDQo+PiBwbGVhc2U/DQo+Pg0KPj4gU3Bl
Y2lmaWNhbGx5LCBJJ2QgYmUgaW50ZXJlc3RlZCBpbiBkaWZmZXJlbnQgbG9ncyBmcm9tIGNv
bWJpbmF0aW9ucyBvZg0KPj4gdGhlIG9sZCBhbmQgbmV3IGtlcm5lbCBhbmQgdGhlIG9sZCBh
bmQgbmV3IHVzZXJzcGFjZS4NCj4gDQo+IEkndmUgbWFuYWdlZCB0byBkbyBzaXggb2YgdGhl
IGVpZ2h0IHBvc3NpYmxlIGNvbWJpbmF0aW9ucyBvZiBrZXJuZWwsDQo+IG1nYWcyMDAgbW9k
dWxlLCBhbmQgdXNlcnNwYWNlLiBUaGUgYXR0YWNoZWQgYXJjaGl2ZSBjb250YWlucyBhbGwg
dGhlDQo+IGNvcnJlc3BvbmRpbmcgWG9yZyBsb2dzIGFzIHdlbGwgYXMgYSBkZXRhaWxlZCBu
b3RlcyBmaWxlLg0KPiANCj4gSSBjb3VsZG4ndCBkbyB0aGUgcmVtYWluaW5nIHR3byBjb21i
aW5hdGlvbnMgYmVjYXVzZSBJIGNvdWxkbid0IGdldCB0aGUNCj4gbmV3IG1nYWcyMDAgbW9k
dWxlIHRvIGNvbXBpbGUgZm9yIHRoZSBvbGQga2VybmVsLg0KPiANCj4gTXkgcHJldmlvdXMg
dGhlb3J5IHdhcyB3cm9uZywgYnV0IGhvcGVmdWxseSB0aGUgYXR0YWNoZWQgbG9ncyB3aWxs
IGhlbHANCj4geW91IHdvcmsgb3V0IHdoeSB0aGUgb2xkIGtlcm5lbCBwZXJtaXR0ZWQgdGhl
IGhpZ2ggYmFuZHdpZHRoIG1vZGUgSQ0KPiBhbHdheXMgdXNlIChkZXNwaXRlIHJldHVybmlu
ZyBNT0RFX0JBRCkgYW5kIHRoZSBuZXcga2VybmVsIGRvZXNuJ3QuDQoNClRoYW5rcyBmb3Ig
cHJvdmlkaW5nIGFsbCB0aGVzZSBsb2dzLg0KDQpCdXQgSSBjYW5ub3QgcmVhbGx5IGZpZ3Vy
ZSBvdXQgd2h5IHRoaXMgd29ya3MgaW4gdGhlIHVubW9kaWZpZWQgb2xkIA0Ka2VybmVsLiBJ
biBsb2cgOCwgSSBjYW4gc2VlIGFuIGVycm9yIGF0IHRpbWUgNzguNTA5LiAgVGhhdCdzIHRo
ZSBmYWlsZWQgDQptb2Rlc2V0IG9wZXJhdGlvbi4gV2l0aCB0aGUgbmV3IGRyaXZlciwgeW91
IGdldCBhIGxvd2VyIHJlc29sdXRpb24gdGhlbj8NCkl0J3Mgbm90IGNsZWFyIHRvIG1lIHdo
eSBYIGV2ZW4gdHJpZWQgMTQ0MHg5MDAgYXQgYWxsLiBJdCBzaG91bGQgbm90IGJlIA0KaW4g
dGhlIGxpc3Qgb2YgYXZhaWxhYmxlIG1vZGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiAoVGhlICJvbGQiIGtlcm5lbCBpcyA5LjEsIGkuZS4gNS4xNC4wLTE2Mi42LjEu
ZWw5XzEuMC4xLCBhbmQgIm5ldyINCj4ga2VybmVsIGlzIDkuMiwgaS5lLiA1LjE0LjAtMjg0
LjE4LjEuZWw5XzIgLikNCj4gDQo+IEJlc3Qgd2lzaGVzLA0KPiBSb2dlci4NCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------kKbNrO6PP3AZ3wgd180L6KhO--

--------------F7psArRPeglxkLwe2J1a0Jmw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTDbGUFAwAAAAAACgkQlh/E3EQov+D4
zw/7BmwNwRDc1QW3xizDmcWBLmLVosd9eG9sFZDWdhzhGUJAc/E7e519XwKyArO8HZvKc3s/Kpak
y7H5AcrXxhkVqm1Pqhh3ZuRbXNXAyhIYFtKW0l7F+ugBsbOJIg/fJf6tyes2f/JRpejfkrTKorAy
btLH5pG0F/msML0Oyx7JwPOxFrUYSwlEKcp5HMP9oE6WBkPg6TxEJqInIcH+nzsq9svxnWGoeCMu
4qejx4iji/38J6fwlVBfvTAFt7a8P6wSd1nbnNcPy4/jd7kxGPJoTTT+1ikICd4Ds1neaXx5lYGi
/o/SFeue8LgeNoBqnzhxqCCrut8VpKX4gbJUQjdiuPSiNhttmxjqq7KhqscLnaNjDixLuQ5VThxi
j0gbqGZ2E6my5oQ6wKtCB5V71SWPTQZkjd7I9VDBLkjMEc00GM/1j/sMv0B0escbs8yJjE67G/U6
4IsX2idbPLyOt0lr2UX3Vgn34kRl4LoN+z+ZSspOtJrPZref8w/jU1gARMGkgzwgsybzhZ74CTQR
qwB6guYFAf1IrnOuIEY0fQgVcCxPKkBrvEoKVLmjTRD4MJD+3/FHBEcPENK3STWY972UswffdVVx
yeZZy9LMJl8g52L09jnpBjsyYQ9NU6mCBurRO4T4J0fwV29LD4d25jhr7HWb31ts0M9C1Cfr/AD2
NiI=
=XE2L
-----END PGP SIGNATURE-----

--------------F7psArRPeglxkLwe2J1a0Jmw--
