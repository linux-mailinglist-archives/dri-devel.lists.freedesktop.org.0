Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E811F7C7E43
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968F10E5BC;
	Fri, 13 Oct 2023 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3021F10E5B8;
 Fri, 13 Oct 2023 06:57:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C19AA210DD;
 Fri, 13 Oct 2023 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697180254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rrDa9a7AVtxQJVEoyeqYJjwc23rjqHNO4K3Aj/8eCL4=;
 b=IyOlKK7oDhKn7KcQNweYGqvIw+vbs39k/qytaALlxamfcwglytV24TvVTF2phi4vKZzurN
 NL/mv4X6oBt3m5c39WJV5UCjYWIfZ3JDDe2Rhf7jU68U4uvTxs7mxamX9LX28g2yp7x0sD
 xHYAYYsykl6iOxvEIHv3zgNUmJ6NMp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697180254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rrDa9a7AVtxQJVEoyeqYJjwc23rjqHNO4K3Aj/8eCL4=;
 b=EUKJpQ52rEng0s3KY+UnpirV8Qtqajz8qYX+zCoC1ve3eFRsEUCsLW8RS2ml9nHAtkhUkC
 y5k5QtjfqqNU+6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89C731358F;
 Fri, 13 Oct 2023 06:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IIjjHl7qKGULRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Oct 2023 06:57:34 +0000
Message-ID: <0de116ae-fccb-4c76-8648-2e01c7f980c7@suse.de>
Date: Fri, 13 Oct 2023 08:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 asm-generic tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>
References: <20231013114602.4cea19d1@canb.auug.org.au>
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
In-Reply-To: <20231013114602.4cea19d1@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jj4M8tvJgL4lMCz8VmHJKfaM"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -12.00
X-Spamd-Result: default: False [-12.00 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-2.91)[99.62%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8]; NEURAL_HAM_SHORT(-1.00)[-1.000];
 SIGNED_PGP(-2.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Jj4M8tvJgL4lMCz8VmHJKfaM
Content-Type: multipart/mixed; boundary="------------MNAZkslsIWrk6OO6dNrfId7Q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <0de116ae-fccb-4c76-8648-2e01c7f980c7@suse.de>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 asm-generic tree
References: <20231013114602.4cea19d1@canb.auug.org.au>
In-Reply-To: <20231013114602.4cea19d1@canb.auug.org.au>

--------------MNAZkslsIWrk6OO6dNrfId7Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBbSAxMy4xMC4yMyB1bSAwMjo0NiBzY2hyaWViIFN0ZXBoZW4gUm90aHdlbGw6DQo+IEhp
IGFsbCwNCj4gDQo+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0aGUgZHJtLW1pc2Mg
dHJlZSBnb3QgYSBjb25mbGljdCBpbjoNCj4gDQo+ICAgIGFyY2gvaWE2NC9pbmNsdWRlL2Fz
bS9mYi5oDQo+IA0KPiBiZXR3ZWVuIGNvbW1pdDoNCj4gDQo+ICAgIGNmOGU4NjU4MTAwZCAo
ImFyY2g6IFJlbW92ZSBJdGFuaXVtIChJQS02NCkgYXJjaGl0ZWN0dXJlIikNCj4gDQo+IGZy
b20gdGhlIGFzbS1nZW5lcmljIHRyZWUgYW5kIGNvbW1pdDoNCj4gDQo+ICAgIDA1MmRkZjdi
ODZkMiAoImZiZGV2OiBSZXBsYWNlIGZiX3BncHJvdGVjdCgpIHdpdGggcGdwcm90X2ZyYW1l
YnVmZmVyKCkiKQ0KPiANCj4gZnJvbSB0aGUgZHJtLW1pc2MgdHJlZS4NCj4gDQo+IEkgZml4
ZWQgaXQgdXAgKEkganVzdCByZW1vdmVkIHRoZSBmaWxlKSBhbmQgY2FuIGNhcnJ5IHRoZSBm
aXggYXMNCg0KVGhhbmtzLg0KDQo+IG5lY2Vzc2FyeS4gVGhpcyBpcyBub3cgZml4ZWQgYXMg
ZmFyIGFzIGxpbnV4LW5leHQgaXMgY29uY2VybmVkLCBidXQgYW55DQo+IG5vbiB0cml2aWFs
IGNvbmZsaWN0cyBzaG91bGQgYmUgbWVudGlvbmVkIHRvIHlvdXIgdXBzdHJlYW0gbWFpbnRh
aW5lcg0KPiB3aGVuIHlvdXIgdHJlZSBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdpbmcuICBZb3Ug
bWF5IGFsc28gd2FudCB0byBjb25zaWRlcg0KPiBjb29wZXJhdGluZyB3aXRoIHRoZSBtYWlu
dGFpbmVyIG9mIHRoZSBjb25mbGljdGluZyB0cmVlIHRvIG1pbmltaXNlIGFueQ0KPiBwYXJ0
aWN1bGFybHkgY29tcGxleCBjb25mbGljdHMuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------MNAZkslsIWrk6OO6dNrfId7Q--

--------------Jj4M8tvJgL4lMCz8VmHJKfaM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUo6l4FAwAAAAAACgkQlh/E3EQov+AS
LRAAkxbHhK8TjDFMp856xrwGzIl1tHo//U4jej2LzxbwHgnpf+xagld/1jvxSzgpr1GDnXtzJKEA
v3YtY9eAIuuJypN+CjQ/ddG2mnojabe7cTpNSPWQ6UFkSLMnmtdg5wZ7gI9xUCeQ3JXckZvYiEeD
5Hzlw2RQWl6XuHB/TpTLt6j0q3Fbrf45PBj4BzmWjlbhjsz5m9nAQQFpNyQpVA6p5GUxqVeJKy7B
dLZ7sXYNhLoV+gW4HWSpkA/Ipxlgy8rOsdqk5WHGD/HGibBoOX1D8YIixyIHH+DXPgCtkvexaf2t
9yyMn3ucld32ADNDm//zLj+nxPwc+WgERG/LleSDcHQTZ/TiqigAh9TK1TSSvCSvBzAqvX7MGGLa
RJ9kWZ5Z/7oa76ySRCEJZj2Krl34zCgThTGRtrMuLGYBLKDXGbFv9mWYtx1h/S2buh5u+JhVHyUX
9tAqhMa8SUk7bBzAUIQlB4inDemK2ZOqIj1F3uas1yUbCLeMFtdw67ernrCRjT7SJQjZ6Il0N4K6
6ke9vykQfLem8sTmZdNCHINA3tinLeASg2kflEt9xhYOTV27L/J3LVS7pfE59GF+Vkf7zvy5WDZL
sy0Kh8TOWHSK/H2e7N+ERF6Thw8HSWYjHKid5EXHIAkMolsFXsg5tZt8o4iw7+Rqp2QCx/Ww2qYF
NUI=
=vB2k
-----END PGP SIGNATURE-----

--------------Jj4M8tvJgL4lMCz8VmHJKfaM--
