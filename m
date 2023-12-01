Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D241B8006D0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D910E0BB;
	Fri,  1 Dec 2023 09:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B080210E0BB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:26:22 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE8C01FD63;
 Fri,  1 Dec 2023 09:26:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9556B13928;
 Fri,  1 Dec 2023 09:26:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mZAXI7ymaWWvZQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Dec 2023 09:26:20 +0000
Message-ID: <cf8d6ea2-e725-4794-a40c-206e53785a29@suse.de>
Date: Fri, 1 Dec 2023 10:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] fbdev/efifb: Use screen_info pointer from device
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 pjones@redhat.com
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-3-tzimmermann@suse.de>
 <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WFQQryQFMgqxUihN6DLvn8Ow"
X-Spamd-Bar: ++++++++++++
X-Spam-Score: 12.30
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: BE8C01FD63
X-Spam-Flag: NO
X-Spam-Level: ************
X-Spamd-Result: default: False [12.30 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 R_SPF_SOFTFAIL(4.60)[~all:c]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; MIME_BASE64_TEXT(0.10)[];
 SIGNED_PGP(-2.00)[]; FREEMAIL_TO(0.00)[redhat.com,gmx.de];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-0.00)[32.79%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_SPAM_SHORT(3.00)[1.000]; NEURAL_SPAM_LONG(3.50)[1.000];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WFQQryQFMgqxUihN6DLvn8Ow
Content-Type: multipart/mixed; boundary="------------4twTXFBuHkqFb2FrGxbdWcKQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 pjones@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <cf8d6ea2-e725-4794-a40c-206e53785a29@suse.de>
Subject: Re: [PATCH 2/4] fbdev/efifb: Use screen_info pointer from device
References: <20231129155218.3475-1-tzimmermann@suse.de>
 <20231129155218.3475-3-tzimmermann@suse.de>
 <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87v89il2vj.fsf@minerva.mail-host-address-is-not-set>

--------------4twTXFBuHkqFb2FrGxbdWcKQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDAxLjEyLjIzIHVtIDA5OjU0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IFVzZSB0aGUgc2NyZWVuX2luZm8gaW5zdGFuY2UgZnJvbSB0
aGUgZGV2aWNlIGluc3RlYWQgb2YgZGVyZWZlcmVuY2luZw0KPj4gdGhlIGdsb2JhbCBzY3Jl
ZW5faW5mbyBzdGF0ZS4gRGVjb3VwbGVzIHRoZSBkcml2ZXIgZnJvbSBwZXItYXJjaGl0ZWN0
dXJlDQo+PiBjb2RlLiBEdXBsaWNhdGVkIHRoZSBzY3JlZW5faW5mbyBkYXRhLCBzbyB0aGF0
IGVmaWZiIGNhbiBtb2RpZnkgaXQgYXQNCj4+IHdpbGwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4g
DQo+IFsuLi5dDQo+IA0KPj4gKwlzaSA9IGRldl9nZXRfcGxhdGRhdGEoJmRldi0+ZGV2KTsN
Cj4+ICsJaWYgKCFzaSkNCj4gDQo+IEkgd291bGQgYWRkIGEgY29tbWVudCB0aGF0IHRoaXMg
cGxhdGZvcm0gZGF0YSBpcyBzZXQgd2hlbiB0aGUgZGV2aWNlIGlzDQo+IHJlZ2lzdGVyZWQg
Ynkgc3lzZmIuDQo+IA0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArCXNpID0gZGV2bV9r
bWVtZHVwKCZkZXYtPmRldiwgc2ksIHNpemVvZigqc2kpLCBHRlBfS0VSTkVMKTsNCj4+ICsJ
aWYgKCFzaSkNCj4+ICsJCXJldHVybiAtRU5PTUVNOw0KPj4gKw0KPiANCj4gV2h5IGEgY29w
eT8gSW4gYW55IGNhc2UgbWF5YmUgdGhlIGdsb2JhbCBzY3JlZW5faW5mbyBzaG91bGQgYmUg
ZHVwbGljYXRlZA0KPiB3aGVuIGlzIHNldCBhcyB0aGUgZGV2aWNlIHBsYXRmb3JtIGRhdGEg
aW4gc3lzZmJfaW5pdCgpID8NCg0KV2UgZ2V0IG91ciBvd24gY29weSBvZiB0aGUgZ2xvYmFs
IHNjcmVlbl9pbmZvIGFzIHBsYXRmb3JtLWRldmljZSBkYXRhLiANCkVmaWZiIG1vZGlmaWVz
IHNvbWUgb2YgdGhlIHZhbHVlcyBpbiBvdXIgY29weSBpbiBlZmlmYl9zZXR1cCgpLiBJZiAN
CnByb2JpbmcgYWZ0ZXJ3YXJkcyBmYWlscywgdGhlIGtlcm5lbCBtaWdodCB0cnkgYSBkaWZm
ZXJlbnQgZHJpdmVyLCB3aGljaCANCndvdWxkIHRoZW4gb3BlcmF0ZSBvbiB0aGUgdmFsdWVz
IG1vZGlmaWVkIGJ5IGVmaWZiLiBIZW5jZSwgdGhlcmUncyB0aGlzIA0KaW50ZXJuYWwgY29w
eS4gVGhlIHNpdHVhdGlvbiB3aXRoIHZlc2FmYiBpcyBzaW1pbGFyLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBJIGFncmVlIHdpdGggdGhlIGRpcmVjdGlvbiBvZiB0aGUg
cGF0Y2ggdGhvdWdoLCBzbyB3aGF0ZXZlciB5b3UgZGVjaWRlOg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------4twTXFBuHkqFb2FrGxbdWcKQ--

--------------WFQQryQFMgqxUihN6DLvn8Ow
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVpprwFAwAAAAAACgkQlh/E3EQov+Cb
kRAAsrfMi+qEC105L2birLEU5AzxhREt4c5mr77JZ9Ur9TJybSlHfoiEkhMFRpUm918HvvlJ4J1G
yJKedsSCvgzkmcRjlntf3nWFvfV5DvBgebecFHlc8G5YG++MCTpIF+tM95NJ/UJokkupvf5s02Zy
Y+om0aJffo4la2p8L68mp6CRIWZHFuX4G37LSzu/LG7T4aPWqCKJQb43ZFZ/tTxL6BOgxRxHjfIs
l/rDTiJXOVQXm0zYaO6o2kJwTdN8j456y5GBh4knPG1rrLblWH/XsAN4objt309q+q9GHwp8WbkX
VCCZ8QG5SVBSB6JXZccSJTuZNwYUR2mFI2gjnE/1cFPYeAr6mYuomvq4uUBAfRoCXXp4a6V7GirH
8ltCLCgaS48xGS3xlJ1I9HK8vndIEFpSZpeB4rfyCSr9fCGvWzxweHEFY7GvHlqtIZspK8330NEa
OnD2/x8bASEv36B2hFmkpxnLcTwkGLhlgYre3hIlf1BSKc8+LRWhLvxP9GC8zR3qrkR/kJWi+iJb
NsnCug0ADG0/ZwpBOIXy8Gh2sxapESuwbtxxq3Q1vE0FDL2K7aoq6xyhJCWYcydPoK0oVHm307ez
bXNdh0r5IZ2OvZrciFcwXEcpTKgPMRY5IxcydZdqWaiJLVJC6cDQuqftAb3q+xUInwZ8xEqn88FI
fpw=
=KtVt
-----END PGP SIGNATURE-----

--------------WFQQryQFMgqxUihN6DLvn8Ow--
