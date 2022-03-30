Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F84EBC4C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C1010F657;
	Wed, 30 Mar 2022 08:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D682810F654
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:05:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5DE05210E5;
 Wed, 30 Mar 2022 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648627507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/h7LdlHVbEAhhTBggji9dpEX43Lbv9jR0Dq/0HkJNE=;
 b=CpPhJjxZ8bQ9tHGzaHhkwBp8eY9unqDKV40QCT8EuqPjdkFiRBrhOjSOmQeUe9vNSd1Avd
 auAIlJE1aSItUqOTMuqVSccviFSPa5+QonKiOa7L0b3zrygyoMNRXEjP1Ls/KH7vQKBIgs
 RO89NmJPIocLxs4+w1XB7OOni0pIcAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648627507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/h7LdlHVbEAhhTBggji9dpEX43Lbv9jR0Dq/0HkJNE=;
 b=ercZXyLf+5S5wc8VtCrJbE4OOHS4TRFWVX9c86EPoxS/VVZRUu3ag3yloP5WBoHaUOYZ1u
 DoO/N3b0pDH4UuCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3093C13AF3;
 Wed, 30 Mar 2022 08:05:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /DkSCjMPRGI4NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Mar 2022 08:05:07 +0000
Message-ID: <ec67e289-2cc9-8ecc-efad-bfad4f6f619c@suse.de>
Date: Wed, 30 Mar 2022 10:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 6/8] drm/display: Move HDCP helpers into display-helper
 module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-7-tzimmermann@suse.de> <87lewrdicz.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87lewrdicz.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rXW3XyhskKvyGL6m5qCVSBM2"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rXW3XyhskKvyGL6m5qCVSBM2
Content-Type: multipart/mixed; boundary="------------ner6P4h88BkrMHiixBBbdnKT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ec67e289-2cc9-8ecc-efad-bfad4f6f619c@suse.de>
Subject: Re: [PATCH 6/8] drm/display: Move HDCP helpers into display-helper
 module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-7-tzimmermann@suse.de> <87lewrdicz.fsf@intel.com>
In-Reply-To: <87lewrdicz.fsf@intel.com>

--------------ner6P4h88BkrMHiixBBbdnKT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFuaQ0KDQpBbSAzMC4wMy4yMiB1bSAwOToxMiBzY2hyaWViIEphbmkgTmlrdWxhOg0K
PiBPbiBUdWUsIDIyIE1hciAyMDIyLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4gd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbng3NjI1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FueDc2MjUuYw0KPj4gaW5kZXggMjFmMTYzOTQwMTJmLi4wYWQ3OGM3M2FmN2MgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCj4+
IEBAIC0yMywxMSArMjMsMTEgQEANCj4+ICAgDQo+PiAgICNpbmNsdWRlIDxkcm0vZGlzcGxh
eS9kcm1fZHBfYXV4X2J1cy5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2Rpc3BsYXkvZHJtX2Rw
X2hlbHBlci5oPg0KPj4gKyNpbmNsdWRlIDxkcm0vZGlzcGxheS9kcm1faGRjcF9oZWxwZXJf
aGVscGVyLmg+DQo+IA0KPiBUaGlzIGhlbHBlciBoZWxwZXIgY3JlcHQgaW4gYSBmZXcgcGxh
Y2VzLg0KDQpUaGFua3MgZm9yIHJlcG9ydGluZy4gSSdsbCB0cnkgdG8gZW5hYmxlIG1vcmUg
ZHJpdmVycyBmb3IgdGhlIHBhdGNoZXMnIA0KbmV4dCBpdGVyYXRpb24gaW4gb3JkZXIgdG8g
ZmluZCBzdWNoIGlzc3Vlcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQlIs
DQo+IEphbmkuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ner6P4h88BkrMHiixBBbdnKT--

--------------rXW3XyhskKvyGL6m5qCVSBM2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJEDzIFAwAAAAAACgkQlh/E3EQov+Ct
tw/+KVDSd7fZWcUK9RoNwG34LoJha3+S8wk/MtEZoksrXD67iCOBt0LBE2mCESUJMgLTWCWoySew
nQ40+UFc4gwy/0+v9DL2Hk8I3AHNeX0XWkHx4eORmvTaaAJ514fMwb5b52iIdckgoGwd2mFceQqb
8rZ5VLwo24tUGSm0VR32EaFKRxZXvkn6FyUzhqEoDiKF9paWAU/jQ5Qr+mq4uDD9i6W+grW2fpft
wTpj03F1nFegx9kGr2+LnkhFyP9bgeuxBumafV0z/f9WRQ4YIx4Avy/Ec2R8ny/6K1Lai0mhxZ6o
GUsujzJwiAuQRlWvbn97CRrB2aiYDY3l1Z3xQeeUGvzHfNz4VXLhtJHgDPsEQVau5pKgLs7ZvM0M
/jvPCk/gn0OYoamTRgdnPn6aerXosTm6NialFduu+7mnDlhgMsZVGC+SICL9nSizc9YUul0lPh5u
zmoV/BRGoWLWXCcfWXEkTzHdv90G4/bXtDKCsj8phQ1nSkC6rcwv7Nkw/LZ92iNHLQn5wWPcFK0F
nus0jsVYMib2rFnNFHgbbkuik6Ai2dBBqzY+pkJOfGmxeoqsiP3Qvt+kClyqeI+hfzD4hRUbxExL
JpvJgclkeln0sgvkvZU7oXZF1XQHraaMdHTtNRSJYsfPbzSZAOImGOlw6UM+HGD+4rzi92izLloY
Jcg=
=rwSI
-----END PGP SIGNATURE-----

--------------rXW3XyhskKvyGL6m5qCVSBM2--
