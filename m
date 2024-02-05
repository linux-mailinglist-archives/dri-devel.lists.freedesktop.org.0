Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8C84954B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B09010E02E;
	Mon,  5 Feb 2024 08:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ehUtPJF7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fNxkP+tY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ehUtPJF7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fNxkP+tY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D1E10E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:24:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47E5B2228D;
 Mon,  5 Feb 2024 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9hRGehTdnYgiVQ3wMzsmLr8nuA1ev97YGV4GDczl2Po=;
 b=ehUtPJF7KGaPxrY4mj+vwgq054vLvWvCbpKgWMLxdI+QhZhPk7BuEXDxUgx+nKmak8ALCb
 a+n4JO3Sb369s8v8IiYu3P2A6PUXVeLP7qRxgL/qJuSBlTINUUSd9TzheCRn7XEB2LeYKk
 z7LoigtVdZv1Cz9zQpcWZ6ynnVUHO+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121470;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9hRGehTdnYgiVQ3wMzsmLr8nuA1ev97YGV4GDczl2Po=;
 b=fNxkP+tYslZj4CfzZM1l2qqazJ2NTSDXf0mb350kSRESddz4KlG83b4BO0MdM3503tbjOd
 c1Os7CyyTU26biDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9hRGehTdnYgiVQ3wMzsmLr8nuA1ev97YGV4GDczl2Po=;
 b=ehUtPJF7KGaPxrY4mj+vwgq054vLvWvCbpKgWMLxdI+QhZhPk7BuEXDxUgx+nKmak8ALCb
 a+n4JO3Sb369s8v8IiYu3P2A6PUXVeLP7qRxgL/qJuSBlTINUUSd9TzheCRn7XEB2LeYKk
 z7LoigtVdZv1Cz9zQpcWZ6ynnVUHO+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121470;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9hRGehTdnYgiVQ3wMzsmLr8nuA1ev97YGV4GDczl2Po=;
 b=fNxkP+tYslZj4CfzZM1l2qqazJ2NTSDXf0mb350kSRESddz4KlG83b4BO0MdM3503tbjOd
 c1Os7CyyTU26biDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09333132DD;
 Mon,  5 Feb 2024 08:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ylu5AD6bwGXxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 08:24:30 +0000
Message-ID: <d429ddb0-4132-4476-b751-b59accaf0e8d@suse.de>
Date: Mon, 5 Feb 2024 09:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,3/8] firmware/sysfb: Set firmware-framebuffer parent device
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-4-tzimmermann@suse.de>
 <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>
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
In-Reply-To: <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x7UoA60dGmVg1yC0iMfWF0Ti"
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ehUtPJF7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fNxkP+tY
X-Spamd-Result: default: False [-7.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[];
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
X-Rspamd-Queue-Id: 47E5B2228D
X-Spam-Level: 
X-Spam-Score: -7.80
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
--------------x7UoA60dGmVg1yC0iMfWF0Ti
Content-Type: multipart/mixed; boundary="------------wKuFT9Oe6mlSwSqVmRbeawT0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <d429ddb0-4132-4476-b751-b59accaf0e8d@suse.de>
Subject: Re: [v2,3/8] firmware/sysfb: Set firmware-framebuffer parent device
References: <20240202120140.3517-4-tzimmermann@suse.de>
 <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>
In-Reply-To: <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>

--------------wKuFT9Oe6mlSwSqVmRbeawT0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDIuMjQgdW0gMTY6MjMgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gDQo+IE9uIDIwMjQvMi8yIDE5OjU4LCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4+IFNldCB0aGUgZmlybXdhcmUgZnJhbWVidWZmZXIncyBwYXJlbnQgZGV2aWNlLCB3
aGljaCB1c3VhbGx5IGlzIHRoZQ0KPj4gZ3JhcGhpY3MgaGFyZHdhcmUncyBwaHlzaWNhbCBk
ZXZpY2UuIEludGVncmF0ZXMgdGhlIGZyYW1lYnVmZmVyIGluDQo+PiB0aGUgTGludXggZGV2
aWNlIGhpZXJhcmNoeSBhbmQgbGV0cyBMaW51eCBoYW5kbGUgZGVwZW5kZW5jaWVzIGFtb25n
DQo+PiBkZXZpY2VzLiBGb3IgZXhhbXBsZSwgdGhlIGdyYXBoaWNzIGhhcmR3YXJlIHdvbid0
IGJlIHN1c3BlbmRlZCB3aGlsZQ0KPj4gdGhlIGZpcm13YXJlIGRldmljZSBpcyBzdGlsbCBh
Y3RpdmUuDQo+IA0KPiBUaGlzIGlzIGEgdmVyeSBuaWNlIGJlbmVmaXQsIEkgY2FuJ3QgYWdy
ZWUgbW9yZSENCj4gDQo+IEJlY2F1c2UgdGhlIGJhY2tpbmcgbWVtb3J5IG9mIHRoZSBmaXJt
d2FyZSBmcmFtZWJ1ZmZlciBvY2N1cGllZA0KPiBiZWxvbmdzIHRvIHRoZSBncmFwaGljcyBo
YXJkd2FyZSBpdHNlbGYuIEZvciBQQ0llIGRldmljZSwgdGhlDQo+IGJhY2tpbmcgbWVtb3J5
IGlzIHR5cGljYWxseSB0aGUgZGVkaWNhdGVkIFZSQU0gb2YgdGhlIFBDSWUgR1BVLg0KPiBC
dXQgdGhlcmUgYXJlIHNvbWUgZXhjZXB0aW9ucywgZm9yIGV4YW1wbGUsIHRoZSBnbWE1MDAu
IEJ1dCBJDQo+IHRoaW5rIHRoaXMgY2FuIGJlIGZpeGVkIGluIHRoZSBmdXR1cmUsIGFzIG1h
am9yaXR5KD45OS45JSkgUENJZQ0KPiBHUFUgaGFzIHRoZSBhIGRlZGljYXRlZCBWUkFNLg0K
PiANCj4gDQo+IEZvciBBUk0gYW5kIEFSTTY0IHBsYXRmb3JtIGRldmljZSwgdGhlIGJhY2tp
bmcgbWVtb3J5IG9mIHRoZQ0KPiBmaXJtd2FyZSBmcmFtZWJ1ZmZlciBtYXkgbG9jYXRlZCBh
dCB0aGUgc3lzdGVtIFJBTS4gSXQncyBjb21tb24NCj4gdGhhdCB0aGUgZGlzcGxheSBjb250
cm9sbGVyIGlzIGEgcGxhdGZvcm0gZGV2aWNlIGluIHRoZSBlbWJlZGRlZA0KPiB3b3JsZC4g
U28gSSB0aGluayB0aGUgc3lzZmJfcGFyZW50X2RldigpIGZ1bmN0aW9uIGNhbiBiZSBleHRl
bmRlZA0KPiB0byBiZSBhYmxlIHRvIHdvcmtzIGZvciBwbGF0Zm9ybSBkZXZpY2UgaW4gdGhl
IGZ1dHVyZS4NCg0KVGhlIGN1cnJlbnQgYXBwcm9hY2ggaGFzIGJlZW4gdGFrZW4gZnJvbSBl
ZmlmYi4gSXQgd291bGQgYWxyZWFkeSBub3QgDQp3b3JrIHJlbGlhYmx5IHdpdGggZ21hNTAw
IG9yIEFSTSBTb0NzLiBTbyB0aGVyZSdzIG5vIGltbWVkaWF0ZSBsb3NzIG9mIA0KZnVuY3Rp
b25hbGl0eSBBRkFJQ1QuIEJ1dCB3aXRoIHRoZSBwYXRjaHNldCBub3cgaGF2ZSBhIGNvcnJl
Y3QgZGV2aWNlIA0KaGllcmFyY2h5IGFuZCBQTSBmb3Igc2ltcGxlZHJtLCB2ZXNhZmIgZXQg
YWwuDQoNCkluIHRoZSBsb25nIHRlcm0sIEkgd2FudCB0byBlbXBsb3kgc29tZSBvZiB0aGUg
bG9naWMgaW4gdmdhYXJiIHRoYXQgDQpkZXRlY3RzIHRoZSBmaXJtd2FyZSBkZWZhdWx0IGRl
dmljZS4gVGhhdCBuZWVkcyBhZGRpdGlvbmFsIHdvcmssIHRob3VnaC4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------wKuFT9Oe6mlSwSqVmRbeawT0--

--------------x7UoA60dGmVg1yC0iMfWF0Ti
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXAmz0FAwAAAAAACgkQlh/E3EQov+Br
Xg//V2dAK6Qs0isIOALXG76E1e5yEdKBoGH3GHGaZyU6xfCsXhOnJqmDwl5XE8qwPxGLc4f30tjD
66Mz1N+iDMcJ8OCuHner291fpFMwZ1gWBTQeq0j5cF3VOAVtkPlEQmWQN3CeUnaAgQ6/pLz/iMnf
Ll9POIEQ4g5WhhH0cvF+ZsIdjV6/HqtVPr9qLj5uK0Du4Fz4xPKH9JYTsHnP+aCQC08qj00JukX9
9sAIFSTzhfuCZBNonDZVPHLewIZFdR/7mHCtClGleSOgP1BZBJsKefA2yujRLLzinwlHg3arEFXg
GK+LgwUoTVVuwfQMOK0jzk98RS+6o+jHgH2ZRotU/H1HcQm7hRpYYsBTFQ4BLOvgaXZIviaP5al4
Ry2CyxxiO1CvC9+FaN68b8cMg7vU7MvwwpK01IZQqubwcyQtZ4MXDGQMgh99HRj3cTpZdqvEmliA
TEV8iorZBpIS4LYkhL8r5IJFekLy6x+WrVW2qMHk7vbcH7VzSTRXXuUlgFmd8IM4oZeOmlnGflzU
o95m8UBl/WwmPaiU0N7hupNaAApQbSizvYwUNf7Zw9JYoKGwsje3sy9iTII76G4lCjIiqJq9E/Gp
IRdHQTqIdMcCQtv+Pn3UWOM/3xr1f15UuPVXNXaTDYcZkTIZmP9yPOZLXRoeMTzMGiIhxYowwVPL
EpY=
=QqqP
-----END PGP SIGNATURE-----

--------------x7UoA60dGmVg1yC0iMfWF0Ti--
