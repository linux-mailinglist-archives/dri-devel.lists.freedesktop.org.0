Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E494413FC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 08:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706E899D6;
	Mon,  1 Nov 2021 07:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B017899DC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 07:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8FDF21763;
 Mon,  1 Nov 2021 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635750462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcvVHAfyJBkP6ZCvonVa0YRtR9IWCVDd6tV0eFpEw7E=;
 b=AmB2NOFfQBccndu4nhD3UCxv7wzx4UXd9KN6TJujSYgsUNOXAM4MHKIs/yq1ALjOl5YtNL
 6X901B8F/N0TYvBPvIgTYSKkSgLhE6ujykmadp2qCL9rnPL0itFfV5gBxJf/xwYSJCYrPW
 IM8FgUu5WLej9ycUO2+iSk1cPoyG5Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635750462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DcvVHAfyJBkP6ZCvonVa0YRtR9IWCVDd6tV0eFpEw7E=;
 b=hvv+6GpWWmPxxjA66WqlQ3cYC2ZwECr36hy5+A722gGJMWEJ53zHZFENvV17eAs+DacGAe
 2acixYczemjpbEAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9289E132D4;
 Mon,  1 Nov 2021 07:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ABd7Ij6Sf2H5DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 07:07:42 +0000
Message-ID: <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
Date: Mon, 1 Nov 2021 08:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
Content-Language: en-US
To: Sven Schnelle <svens@stackframe.org>, parisc-linux@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
References: <20211031195347.13754-1-svens@stackframe.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211031195347.13754-1-svens@stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zkjflFVUVoYDgbjs9wZJaHWy"
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zkjflFVUVoYDgbjs9wZJaHWy
Content-Type: multipart/mixed; boundary="------------QjYCS6MQbqtMgTfl3rctFSNG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>, parisc-linux@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>
Message-ID: <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
In-Reply-To: <20211031195347.13754-1-svens@stackframe.org>

--------------QjYCS6MQbqtMgTfl3rctFSNG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBkcmktZGV2ZWwpDQoNCkhpDQoNCkFtIDMxLjEwLjIxIHVtIDIwOjUzIHNjaHJp
ZWIgU3ZlbiBTY2huZWxsZToNCj4gSGkgTGlzdChzKSwNCj4gDQo+IGkgd3JvdGUgYSBmYmRl
diBkcml2ZXIgZm9yIHRoZSBIUCBWaXN1YWxpemUgRlggY2FyZHMgdXNlZCBzb21lIG9mIHRo
ZQ0KPiBQQS1SSVNDIHdvcmtzdGF0aW9ucy4gSXQgdXRpbGl6ZXMgc29tZSBvZiB0aGUgMkQg
YWNjZWxlcmF0aW9uIGZlYXR1cmVzDQo+IHByZXNlbnQgaW4gdGhlIGNhcmQuDQo+IA0KPiBX
aGF0IGlzIHdvcmtpbmcgcmlnaHQgbm93Og0KPiANCj4gLSBtb2Rlc2V0dGluZyAodGVzdGVk
IGFsbCBWRVNBIG1vZGVzIGJldHdlZW4gNjQweDQ4MCAtIDE2MDB4MTIwMCkuDQo+IC0gaGFy
ZHdhcmUgY3Vyc29yDQo+IC0gMkQgYWNjZWxlcmF0aW9uIGxpa2UgaW1hZ2VibGl0IGFuZCBm
aWxscmVjdC4NCj4gDQo+IFdoYXQgaXMgbm90IChmdWxseSkgd29ya2luZzoNCj4gDQo+IC0g
WDExIHdpdGggZmJkZXYuIHhpbml0ICsgbXdtIGxvb2tzIGFsbW9zdCBvaywgZXhjZXB0IHNv
bWUgY29ycnVwdGlvbg0KPiB3aGVyZSB0aGUgdGV4dCBjdXJzb3Igd2FzIGRyYXduIHdoZW4g
aXQgaXMgbW92ZWQuDQo+IC0gbW9yZSBhZHZhbmNlZCBYMTEgcHJvZ3JhbXMuIHhmY2U0LXNl
c3Npb24gZG9lc24ndCByZWFsbHkgc2hvdyBtdWNoLg0KPiANCj4gSSB3b3VsZCBiZSBtb3N0
IGludGVyZXN0ZWQgaWYgcGVvcGxlIGNvdWxkIHRlc3QgdGhpcyBkcml2ZXIgd2l0aCB0aGVp
ciBGWA0KPiBjYXJkcyBhbmQgcmVwb3J0LiBJIGtub3cgdGhhdCBWaXN1YWxpemUgRlhlIGRv
ZXNuJ3Qgd29yayBiZWNhdXNlIGl0IHVzZXMNCj4gY29tcGxldGVseSBkaWZmZXJlbnQgcmVn
aXN0ZXIgYWRkcmVzc2VzLiBGb3IgRlgxMCBpIHdvdWxkIGhvcGUgdGhhdCB0aGV5DQo+IHNo
YXJlIHRoZSBzYW1lIHJlZ2lzdGVyIHNldCBhcyB0aGV5IGFyZSBiYXNlZCBvbiB0aGUgc2Ft
ZSBhcmNoaXRlY3R1cmUuDQo+IE5vdGUgdGhhdCB5b3UgaGF2ZSB0byBkaXNhYmxlIHRoZSBz
dGljb24gZHJpdmVyLCBvdGhlcndoaXNlIHRoYXQgb25lIHdvdWxkDQo+IGhvZyB0aGUgUENJ
IGNhcmQgYW5kIHZpc3VhbGl6ZWZ4IHdvdWxkIG5ldmVyIGJlIHByb2JlZC4NCj4gDQo+IE5v
dCBzdXJlIGFib3V0IEZYMi80LzYuIE1pZ2h0IGJlIGRpZmZlcmVudCwgbWlnaHQgYmUgbm90
Lg0KPiANCj4gSSBvYnRhaW5lZCBhbGwgdGhlIGtub3dsZWRnZSBhYm91dCB0aGUgcmVnaXN0
ZXJzIGJ5IHdhdGNoaW5nIHdoYXQgU1RJIGFuZCB0aGUgSFAtVVgNCj4gWCBTZXJ2ZXIgd3Jp
dGVzIGludG8gdGhlIGNhcmQuIFNvIHRoZSByZWdpc3RlciBuYW1lcyBtaWdodCBiZSBjYWxs
ZWQgZGlmZmVyZW50DQo+IGNvbXBhcmVkIHRvIHdoYXQgSFAgaGFzIHdyaXR0ZW4gaW4gdGhl
aXIgZGF0YSBib29rcy4NCg0KVGhhbmtzIGZvciBhbGwgdGhlIHdvcmsgeW91IHB1dCBpbnRv
IHRoaXMuIFdlIHdlbGNvbWUgZHJpdmVycyBldmVuIGZvciANCm9sZGVyIGhhcmR3YXJlLCBi
dXQgbm90IGZvciBmYmRldi4gRFJNIGlzIGFsbCB0aGUgcmFnZSBub3cgYW5kIGhhcyBiZWVu
IA0KZm9yIGEgd2hpbGUuIEknZCBsaWtlIHRvIGFzayB5b3UgdG8gY29udmVydCB0aGUgZHJp
dmVyIHRvIERSTSBhbmQgDQpyZXN1Ym1pdCB0byA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4uDQoNCkkgd2hpbGUgYWdvLCBJIG1hZGUgY29udmVyc2lvbiBoZWxwZXJzIGZv
ciB0aGlzLiBZb3UgY2FuIGxvb2sgYXQgWzFdIGZvciANCmEgdHJpdmlhbCBEUk0gZHJpdmVy
cyB0aGF0IHdyYXBzIGV4aXN0aW5nIGZiZGV2IGRyaXZlcnMgZm9yIHVzZSB3aXRoIA0KRFJN
LiBPbmNlIHlvdSBoYXZlIHRoYXQsIGl0IHR1cm5zIGludG8gYSByZWZhY3RvcmluZyBqb2Iu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy90emltbWVybWFubi9saW51eC8tL2NvbW1pdHMvZmJjb252LXBsdXMtZHJp
dmVycw0KDQo+IA0KPiBTdmVuLg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------QjYCS6MQbqtMgTfl3rctFSNG--

--------------zkjflFVUVoYDgbjs9wZJaHWy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF/kj0FAwAAAAAACgkQlh/E3EQov+Ck
YQ//aZ2b+IoUfxypjNq6qwe3qF+tc687jVsoHEQ8+oyxV5l+tdNoOYScOHLLrhd+peB6g4o/wa9j
/U+l5vOEB3NAW/HMAA4ZT/LXDstOPEY3apcdLvVl2hy8r+V0U3QRkyMvSFHf8jIka8LJmH5oR+Px
DuKjtgt4Km2Uki0VyJBD2BEdOa+Ffo6UtPRnauj/RvfJ/KqCNemmgsNAqOsuKStTwwN1MGjhLgsp
mBr1M7syWH2PE/O9oKpYc01HfHtITqSBAAGMXtOx6ZFnhxUI0jG0kryQc4hnYYHR8eZNMBiB8/Dz
S52f0bvSt95hlJ92IM0XTzoYMe4ItkRXZR8Z/WyAXoVl5yMxucAU7VuuPM1S5d5S9fkhRrwhkm1c
WN0SI5WQBLJ3oXA7+E5XBYUWLVaLqzoUDAgTJF9R5wVVFHWnnG35SP2BIKEMOK72bN1nGK40s7oo
Q5Jfvqn1IG8sMqwQluNOr9f8TrZj/0/uIvaIZ6z4fQgP6F187rVhIEO0O57LhD5Vz24xMekdPVh3
6c+Kl6Q4b/Z1NzNGXaFdplLRBlrKJqoUeilsLZWX0H70BIbcCSfqF/IYJUiFmEhRaprcV8NPQw8Y
bBWWBkDiihr4uXX1NkHYZjH/bq+SXeQdeF2FxxbOJvMDi3avGYqPB2glsW2g4sj7l9CIu5tTwECh
KnM=
=mWUa
-----END PGP SIGNATURE-----

--------------zkjflFVUVoYDgbjs9wZJaHWy--
