Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAA8314F7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1443F10E0E7;
	Thu, 18 Jan 2024 08:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDCA10E179
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 08:41:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03336220C2;
 Thu, 18 Jan 2024 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705567295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXznHUNnjA7E9cTJbOSlDbHn3SVpaaAeDRTPzoVAPHE=;
 b=2YmzeGixT+yPVJBM8MqvVkN1w8AbfknLKAgRjCc9Ed09TPYZZ8ad734uXdju2WCDWLKSP2
 rg165FUFIbm95hMLovePqLsxPUqMNzbKaHvY57zrS1Gzao+zHlGRgqVU3sv9ylGhPx1tji
 vDcKdMsE683G6MSd3T7IkTDSYscmaXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705567295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXznHUNnjA7E9cTJbOSlDbHn3SVpaaAeDRTPzoVAPHE=;
 b=7xTaX/MWrnCVntLPZB/FgTvSjriuXHFsO/AVUbDWAGPqBYZAON51TEr0PpOt5GekmIor2E
 lOmnflruCWJCQLBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705567295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXznHUNnjA7E9cTJbOSlDbHn3SVpaaAeDRTPzoVAPHE=;
 b=2YmzeGixT+yPVJBM8MqvVkN1w8AbfknLKAgRjCc9Ed09TPYZZ8ad734uXdju2WCDWLKSP2
 rg165FUFIbm95hMLovePqLsxPUqMNzbKaHvY57zrS1Gzao+zHlGRgqVU3sv9ylGhPx1tji
 vDcKdMsE683G6MSd3T7IkTDSYscmaXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705567295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WXznHUNnjA7E9cTJbOSlDbHn3SVpaaAeDRTPzoVAPHE=;
 b=7xTaX/MWrnCVntLPZB/FgTvSjriuXHFsO/AVUbDWAGPqBYZAON51TEr0PpOt5GekmIor2E
 lOmnflruCWJCQLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEEB8136F5;
 Thu, 18 Jan 2024 08:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uT+FLT7kqGVeKgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 08:41:34 +0000
Message-ID: <4ae60e8c-6a86-4895-b8fe-48de5b64b6c8@suse.de>
Date: Thu, 18 Jan 2024 09:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/45] tty: vt: use VESA blanking constants
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-32-jirislaby@kernel.org>
 <39622a13-3999-4bf6-b8fc-f7a70c8cd5da@suse.de>
 <4976e06c-dffd-4b93-a828-34f998f2472a@kernel.org>
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
In-Reply-To: <4976e06c-dffd-4b93-a828-34f998f2472a@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------loYU98uSvn7axArMuY6K9YWs"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.83
X-Spamd-Result: default: False [-1.83 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; BAYES_HAM(-1.04)[87.55%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[9]; SIGNED_PGP(-2.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 FREEMAIL_CC(0.00)[vger.kernel.org,gmx.de,lists.freedesktop.org,HansenPartnership.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------loYU98uSvn7axArMuY6K9YWs
Content-Type: multipart/mixed; boundary="------------X0jWnYPUl0BYtxXwiZkCSoDE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jiri Slaby <jirislaby@kernel.org>, gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-serial@vger.kernel.org
Message-ID: <4ae60e8c-6a86-4895-b8fe-48de5b64b6c8@suse.de>
Subject: Re: [PATCH 31/45] tty: vt: use VESA blanking constants
References: <20240118075756.10541-1-jirislaby@kernel.org>
 <20240118075756.10541-32-jirislaby@kernel.org>
 <39622a13-3999-4bf6-b8fc-f7a70c8cd5da@suse.de>
 <4976e06c-dffd-4b93-a828-34f998f2472a@kernel.org>
In-Reply-To: <4976e06c-dffd-4b93-a828-34f998f2472a@kernel.org>

--------------X0jWnYPUl0BYtxXwiZkCSoDE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjQgdW0gMDk6MzIgc2NocmllYiBKaXJpIFNsYWJ5Og0KPiBPbiAx
OC4gMDEuIDI0LCA5OjMwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDE4LjAx
LjI0IHVtIDA4OjU3IHNjaHJpZWIgSmlyaSBTbGFieSAoU1VTRSk6DQo+Pj4gVGhlcmUgYXJl
IFZFU0EgYmxhbmtpbmcgY29uc3RhbnRzIGRlZmluZWQgaW4gY29uc29sZS5oIGFscmVhZHku
IFNvIHVzZQ0KPj4+IHRoZW0gaW4gdGhlIGNvbnNvbGUgY29kZSBpbnN0ZWFkIG9mIGNvbnN0
YW50IHZhbHVlcy4NCj4+DQo+PiBUaGVzZSBjb25zdGFudHMgYWxzbyBleGlzdCBpbiBpbmNs
dWRlL3VhcGkvbGludXgvZmIuaC4gSXQgd291bGQgYmUgDQo+PiBuaWNlIHRvIGZpbmQgYSBj
b21tb24gaGVhZGVyIHdoZXJlIHRoZXkgY2FuIGJlIHNoYXJlZC4NCj4gDQo+IEhpLA0KPiAN
Cj4gc2VlIDMyLzQ1Lg0KPiANCj4gSSBhY3R1YWxseSBkb24ndCBrbm93IGhvdyB0byBmaXgg
dGhhdCBuaWNlbHkgd2hpbGUga2VlcGluZyB1YXBpIGhhcHB5Lg0KDQpJcyBpdCBoYXJkIHRv
IGdldCBhIG5ldyBVQVBJIGhlYWRlciBhY2NlcHRlZCAoaG9uZXN0IHF1ZXN0aW9uKT8gVGhl
cmUgDQphcmUgYSBmZXcgdGhpbmdzIEknZCBsaWtlIHRvIHNwbGl0IG9mZiBmcm9tIGZiZGV2
LiBCdXQgdGhhdCB3b3VsZCANCnJlcXVpcmUgVUFQSSBoZWFkZXJzLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
CkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZv
IFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFu
DQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------X0jWnYPUl0BYtxXwiZkCSoDE--

--------------loYU98uSvn7axArMuY6K9YWs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWo5D4FAwAAAAAACgkQlh/E3EQov+AK
YRAAwNY7Jyl75Qhbbmt3C/dTqKfAJAFsUDZmrNavvFGMixePlEbziUui1bavhXeLSScqseOTkH24
E5EI5hSicdFOP7mO1m629XOw1WDg4o+yx9d3loIQpdLbMsnsrk9BaRmMiP9yls4lwQlykQuO0ueg
JHtfcs3Gyaik3t7ZAzSfVqTmCGbXBBoC4WjfMPNL54FNL5mjbX9KulM8mN5MAY1bagluPZKpIkkq
LzdQzwVE+TwAZHnNcu/n+HtwEfk0Li9kcrbf9k1OvgsdF/trlteWVJL5ZhPBBGZeS0XFvA392V0Z
skNK8ilm/nVnxNg+rFTfIjLOj5dZTsg0lguBqTXPjXrB+D6UBOD8+WfCfyNez1105YT5JlIR6JFb
192u8OQVqTtakINb4cdWChJGaiAWz6to37R10e8t55jxssKiXHdAlljPULoqtgZXvamcl19tcd5J
Qxd/37BJYc1hlaWR+0ANu+/qXAkn6ZZCp+8iTm7G0FslMsLqe6KQY9CmircoxTVqjRa0fzobhBv6
szJurAr59jXzhbddS8DCYemKjNBY4ljl1JXT6jB2VvHlOSG366H2FR1lRXsIlq7QEbElDWdUnDQr
SqnMJ3VRk9ZKPT/M7b6CnQk9e4HnYUz4IrOQYNWU7fOPaWSzls2iSpf8CdbdoXp5i1CuQIgxHIsh
6Zw=
=rnib
-----END PGP SIGNATURE-----

--------------loYU98uSvn7axArMuY6K9YWs--
