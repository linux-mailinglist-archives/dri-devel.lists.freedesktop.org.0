Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7624EBD9B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43DD10F5E9;
	Wed, 30 Mar 2022 09:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7364D10F5DB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:25:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 131CB210FC;
 Wed, 30 Mar 2022 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648632300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XWo4ahY2kap/6+U2mNoGG/9qzo0buio3a9SnfMZhL0Q=;
 b=zjoLfwNyEdfVt7XkMAP5CaWVsv/s8+syUi3BexRvlzVxGt9shMLsyiX9bszaA709BOWoOT
 tTQAzLfb+tvHvpOy2F7T3KiLVfvNTGWN2zNdjFmOA55eoJ1R4AXreSigATIlAa+ld5hq6i
 2AYZZIJTHeIifjyCR3Wiedrq99HjP2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648632300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XWo4ahY2kap/6+U2mNoGG/9qzo0buio3a9SnfMZhL0Q=;
 b=l3O4U6AWpmtVMDnpI2EVjTozyQpPeMxWNmyB5GNh0qievqLc3BcR2x7Rf0jE8PZ+Cnd3iF
 xdfomkwJ1vgwJEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D61DF13A60;
 Wed, 30 Mar 2022 09:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PDRzMushRGKuWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Mar 2022 09:24:59 +0000
Message-ID: <dfa9af78-5b2e-4d1d-1587-0899443cec10@suse.de>
Date: Wed, 30 Mar 2022 11:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/8] drm: Rename dp/ to display/
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-3-tzimmermann@suse.de>
 <53cbae54-be1a-bd36-b587-d4491a7ece5d@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <53cbae54-be1a-bd36-b587-d4491a7ece5d@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uKur0JMqgN6QpvhR1GvLvoap"
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
--------------uKur0JMqgN6QpvhR1GvLvoap
Content-Type: multipart/mixed; boundary="------------GdbQSVCMDb0a0IRuPLxfJqyp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <dfa9af78-5b2e-4d1d-1587-0899443cec10@suse.de>
Subject: Re: [PATCH 2/8] drm: Rename dp/ to display/
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-3-tzimmermann@suse.de>
 <53cbae54-be1a-bd36-b587-d4491a7ece5d@redhat.com>
In-Reply-To: <53cbae54-be1a-bd36-b587-d4491a7ece5d@redhat.com>

--------------GdbQSVCMDb0a0IRuPLxfJqyp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjIgdW0gMTE6MDQgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMjIvMjIgMjA6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gUmVuYW1lIGRwLyB0byBkaXNwbGF5LyB0byBhY2NvdW50IGZvciBhZGRpdGlvbmFsIGRp
c3BsYXktcmVsYXRlZA0KPj4gaGVscGVycywgc3VjaCBhcyBIRE1JLiBVcGRhdGUgYWxsIHJl
bGF0ZWQgaW5jbHVkZSBzdGF0ZW1lbnRzLiBObw0KPj4gZnVuY3Rpb25hbCBjaGFuZ2VzLg0K
Pj4NCj4+IFZhcmlvdXMgZHJpdmVycywgc3VjaCBhcyBpOTE1IGFuZCBhbWRncHUsIHVzZSBz
aW1pbGFyIG5hbWluZyBzY2hlbWUNCj4+IGJ5IHB1dHRpbmcgY29kZSBmb3IgdmlkZW8tb3V0
cHV0IHN0YW5kYXJkcyBpbnRvIGEgbG9jYWwgZGlzcGxheS8NCj4+IGRpcmVjdG9yeS4gVGhl
IG5ldyBkaXJlY3RvcnkncyBuYW1lIGlzIGFsaWduZWQgd2l0aCB0aGF0IHBvbGljeS4NCj4+
DQo+IA0KPiBJdCBpcyByZWFsbHkgYSBwb2xpY3kgb3IganVzdCBhIGNvbnZlbnRpb24gPw0K
DQpDb252ZW50aW9uLCBJIHRoaW5rLiBJJ2xsIHVwZGF0ZSB0aGUgd29yZGluZy4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+DQo+IA0KPiBSZXZp
ZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------GdbQSVCMDb0a0IRuPLxfJqyp--

--------------uKur0JMqgN6QpvhR1GvLvoap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJEIesFAwAAAAAACgkQlh/E3EQov+Cc
DQ/6Al9ttzuu3q8j5XDIZkwOOCCvoAon4+Dos07ONBSujhSVaoEKj3olbDjrLFIR1sf1V0JoAvvi
ItMj47FivXZnIseoJ+rINVyuJIutmiUfdLUzmKf7H5x1Yo5y9pLNyRHMCKWocTIgHdyllQgNcz0U
CYJabWtQEMMJAgtxcSo+nOHnadtaOkZDDWFVT2fOxPKF2QdkeK52SxzaJ3F8BCmwI5TcFA3Ae0Sr
K/0YW0Lua1jcTD+WW7PV3j9n//xUwQ03U3JpAOr2H/Sv7HIeO0yvzK1ZTPVScZm2CbhfmDMePTte
MHljr8gu5ncFjLFng6rvI7WmuPfEQxnsfrKkzw/Kn3J+q/sYctTq8vUmswfsKm0bEhemYubIqeQQ
mAAEJPwlmOo7xhJBnWEmqbAB/BpmqZYT+tFRip6seOA7Cu/Eu5Jy8N1iPcWBLuorqFuwRN1tG+pf
PQsFxNuDiLj835lpvAdoKHJfT+tYH+DzV6sX/sFmXX9zhogpkfnNINJTmZZTvmSpJ02kIBwc4wvb
+AshP1P50EGjD9zrTfHF3p6RRV980NqhJ2N0Hau41L7rnMJc4ndlQHQKfYSgjm7QDfO77WggGj8e
hT6v5g7f7ISqOeKS3RafCa4Gub2vXzUw1YTuTyW4xQKMxN6Din7pgCZdQ24zyOd5A8YuNRi++88u
hB0=
=TA2R
-----END PGP SIGNATURE-----

--------------uKur0JMqgN6QpvhR1GvLvoap--
