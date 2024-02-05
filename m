Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E1849532
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC4611243C;
	Mon,  5 Feb 2024 08:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="V7ta0dJR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b8S5fhUd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V7ta0dJR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b8S5fhUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EA811243C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:17:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0689822284;
 Mon,  5 Feb 2024 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y5qGR8FPWkjL0uRcd/VMixC2aQrA0UF6AAndAJgPRWU=;
 b=V7ta0dJRGTNm2tu5Rr2bIg9SYleG1yD5S2zs2ll595ZSHBU79jx3vVcHfR8lC8K9dsj2Tr
 ea+jx3b471gHuDlVuMT3rXGd3p/EcGDjLGj6wHOGzEM505ONubQUVijVrRLxA/7khU/5K5
 1ewu/pY0osXqZlaMNH73G2ovSxBn1gE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121049;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y5qGR8FPWkjL0uRcd/VMixC2aQrA0UF6AAndAJgPRWU=;
 b=b8S5fhUdAcKg0LhEb/LclZbpEaLbiSXxqPksbgjRDy9uYAH4GbBMeFA+LPnrVNUL432Vnd
 NRkfHsX6MGzu0FDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y5qGR8FPWkjL0uRcd/VMixC2aQrA0UF6AAndAJgPRWU=;
 b=V7ta0dJRGTNm2tu5Rr2bIg9SYleG1yD5S2zs2ll595ZSHBU79jx3vVcHfR8lC8K9dsj2Tr
 ea+jx3b471gHuDlVuMT3rXGd3p/EcGDjLGj6wHOGzEM505ONubQUVijVrRLxA/7khU/5K5
 1ewu/pY0osXqZlaMNH73G2ovSxBn1gE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121049;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y5qGR8FPWkjL0uRcd/VMixC2aQrA0UF6AAndAJgPRWU=;
 b=b8S5fhUdAcKg0LhEb/LclZbpEaLbiSXxqPksbgjRDy9uYAH4GbBMeFA+LPnrVNUL432Vnd
 NRkfHsX6MGzu0FDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4855136F5;
 Mon,  5 Feb 2024 08:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OMSMLpiZwGUpCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 08:17:28 +0000
Message-ID: <0293822c-b261-4725-8cca-3b6dd8e2991d@suse.de>
Date: Mon, 5 Feb 2024 09:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
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
In-Reply-To: <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8w97J6XK01xpGrEE4g8M3vmM"
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V7ta0dJR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=b8S5fhUd
X-Spamd-Result: default: False [-8.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0689822284
X-Spam-Level: 
X-Spam-Score: -8.80
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8w97J6XK01xpGrEE4g8M3vmM
Content-Type: multipart/mixed; boundary="------------2bbfgnJIYxOniB1X2J7FsYwC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <0293822c-b261-4725-8cca-3b6dd8e2991d@suse.de>
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
In-Reply-To: <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>

--------------2bbfgnJIYxOniB1X2J7FsYwC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjQgdW0gMTg6MDMgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjQvMi8yIDE5OjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+ICsNCj4+ICsvKioNCj4+ICsgKiBzY3JlZW5faW5mb19wY2lfZGV2KCkgLSBSZXR1
cm4gUENJIHBhcmVudCBkZXZpY2UgdGhhdCBjb250YWlucyANCj4+IHNjcmVlbl9pbmZvJ3Mg
ZnJhbWVidWZmZXINCj4+ICsgKiBAc2k6IHRoZSBzY3JlZW5faW5mbw0KPj4gKyAqDQo+PiAr
ICogUmV0dXJuczoNCj4+ICsgKiBUaGUgc2NyZWVuX2luZm8ncyBwYXJlbnQgZGV2aWNlIG9u
IHN1Y2Nlc3MsIG9yIE5VTEwgb3RoZXJ3aXNlLg0KPj4gKyAqLw0KPj4gK3N0cnVjdCBwY2lf
ZGV2ICpzY3JlZW5faW5mb19wY2lfZGV2KGNvbnN0IHN0cnVjdCBzY3JlZW5faW5mbyAqc2kp
DQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3QgcmVzb3VyY2UgcmVzW1NDUkVFTl9JTkZPX01B
WF9SRVNPVVJDRVNdOw0KPj4gK8KgwqDCoCBzc2l6ZV90IGksIG51bXJlczsNCj4+ICsNCj4+
ICvCoMKgwqAgbnVtcmVzID0gc2NyZWVuX2luZm9fcmVzb3VyY2VzKHNpLCByZXMsIEFSUkFZ
X1NJWkUocmVzKSk7DQo+PiArwqDCoMKgIGlmIChudW1yZXMgPCAwKQ0KPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBFUlJfUFRSKG51bXJlcyk7DQo+IA0KPiANCj4gUGxlYXNlIHJldHVy
biBOVUxMIGF0IGhlcmUsIG90aGVyd2lzZSB3ZSBoYXZlIHRvIHVzZSB0aGUgSVNfRVJSIG9y
IA0KPiBJU19FUlJfT1JfTlVMTCgpDQo+IGluIHRoZSBjYWxsZXIgZnVuY3Rpb24gdG8gY2hl
Y2sgdGhlIHJldHVybmVkIHZhbHVlLiBNZWFud2hpbGUsIEkgbm90aWNlZCANCj4gdGhhdCB5
b3UNCj4gZGlkbid0IGFjdHVhbGx5IGNhbGwgSVNfRVJSKCkgaW4gdGhlIHN5c2ZiX3BhcmVu
dF9kZXYoKSBmdW5jdGlvbiANCj4gKGludHJvZHVjZWQgYnkgdGhlDQo+IDMvOCBwYXRjaCks
IHNvIEkgdGhpbmsgd2UgcHJvYmFibHkgc2hvdWxkIHJldHVybiBOVUxMIGF0IGhlcmUuDQo+
IA0KPiBQbGVhc2UgYWxzbyBjb25zaWRlciB0aGF0IHRoZSBjb21tZW50cyBvZiB0aGlzIGZ1
bmN0aW9uIHNheXMgdGhhdCBpdCANCj4gcmV0dXJuIE5VTEwgb24NCj4gdGhlIG90aGVyd2lz
ZSBjYXNlcy4NCg0KUmlnaHQuIFRoZSBpZGVhIGlzIHRvIHJldHVybiBOVUxMIGlzIHRoZXJl
IGlzIG5vIHBhcmVudCBkZXZpY2UuIFRoZSANCmVycm5vIHBvaW50ZXIgaXMgZm9yIGFjdHVh
bCBydW50aW1lIHByb2JsZW1zLiBUaGUgZG9jIGNvbW1lbnQgaXMgc3RpbGwgDQppbmNvcnJl
Y3QgYW5kIEkgdGhpbmsgSSBuZWVkIHRvIHJldmlldyB0aGUgY2FsbGVycyBvZiB0aGlzIGZ1
bmN0aW9uLiANClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IA0KPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnVtcmVz
OyArK2kpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IF9f
c2NyZWVuX2luZm9fcGNpX2RldigmcmVzW2ldKTsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAocGRldikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBwZGV2Ow0K
Pj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiBOVUxMOw0KPj4gK30NCj4+
ICtFWFBPUlRfU1lNQk9MKHNjcmVlbl9pbmZvX3BjaV9kZXYpOw0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5i
ZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0Rv
bmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------2bbfgnJIYxOniB1X2J7FsYwC--

--------------8w97J6XK01xpGrEE4g8M3vmM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXAmZgFAwAAAAAACgkQlh/E3EQov+BE
Fg/+Puy5ZJ727OEWiHqpktd9zPynh4IBLIRqBjoQVFmxl2r6TG1Ehc20fa3fclNwcHea3VKy1TZZ
SeDtrOO0LrGErm3eYNeeLSfVmFp7dSvnb+Q+U4+Opieh1XZLNY5xxdiXvQTVl/g/DtYDcB26kp+W
hiFF+ChK7HhfPmxKaqLzY49QQXsITu7Sdh05Fh3BxP8FkvRdyj7GO3PpcDG8/YmkAXVAI4ohkXY+
tb+yYGW3AotTYI+czfRgN0olDlVedVE+zrjwQihulLLbaKda0aJMqHiXdPA6KaVTAN6/fvyoLOGH
jWdLcgzk44eA1ZJiyskuGDr1q065UzrqdkCvjysXqIZnLR0+x6+/GUQmXV+BfTbw9kwoIpRS4qPP
icI9LQKFWUCN6t6A3t0RrBDBdrXveP3u3rtXFYagROsGlsHtsBPQWVlEH8TYgHcw4UZdlS5qkdhm
xlYXwv3qI4x40zSIKKrtwxDgJNcbVflgpIFzH1Pmh4pAms/szsqqZIZi1yXrLyFNbbBuu8VYMK4k
4EFZ14/KVEST1hE5MOXlS74pN1rFAx3S1BiYGdWEvBpyeEFJGgmwiXtqIXstOwun4j3Rw6viTVuS
evLqXUCe6q4EtcTfjKUgezafMPUaTrmzporla0teK6ktRTJLV9kPHHAyEaO9FqOW4/oOFs/UG7T8
PMM=
=nfZO
-----END PGP SIGNATURE-----

--------------8w97J6XK01xpGrEE4g8M3vmM--
