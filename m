Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6B528574
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC81122E1;
	Mon, 16 May 2022 13:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65D1122E1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:34:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A23D31FB29;
 Mon, 16 May 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAnKlOahqjLoeimqyGZrSm6eUpQ97Wa3QkRgL/jc4j0=;
 b=EDhGGjtsWtYplEGO4/6fPmnT35Jnf23ShKL0wDNGrspgP4Fol74D2+nYxGBMwTMhNivQRW
 QWkDaD2y9/uwXVAhUeXyBw38H5cW52NNkxHoDqdXyH3mfjc+CXbIbIp9rhy7hN6ac3LA9U
 CGp9HiX0w0WCAwkMLYXViEgNzJxChXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAnKlOahqjLoeimqyGZrSm6eUpQ97Wa3QkRgL/jc4j0=;
 b=eNJHFG7+X8PXlWrHEdbwc1rIartaNeRv+CDLahGTuaAlKw2U9XRxYf2gL9cWtUDpX97lm3
 V7DF0EGRSecZOQBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B7D213ADC;
 Mon, 16 May 2022 13:34:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wI5mGQBTgmIzfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:34:56 +0000
Message-ID: <4299c9d1-4c9e-4b0b-51f0-33a768c2fba3@suse.de>
Date: Mon, 16 May 2022 15:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 7/7] drm/mgag200: Split up connector's mode_valid helper
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20220509103554.11996-1-tzimmermann@suse.de>
 <20220509103554.11996-8-tzimmermann@suse.de>
 <b4c13e79-207d-1e19-4743-29fb8ee93e08@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b4c13e79-207d-1e19-4743-29fb8ee93e08@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fh3TAIOhkKzvvEd7gMfog50M"
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
--------------Fh3TAIOhkKzvvEd7gMfog50M
Content-Type: multipart/mixed; boundary="------------dXXhzWjq2b6PFzEczs4If1bk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4299c9d1-4c9e-4b0b-51f0-33a768c2fba3@suse.de>
Subject: Re: [PATCH 7/7] drm/mgag200: Split up connector's mode_valid helper
References: <20220509103554.11996-1-tzimmermann@suse.de>
 <20220509103554.11996-8-tzimmermann@suse.de>
 <b4c13e79-207d-1e19-4743-29fb8ee93e08@redhat.com>
In-Reply-To: <b4c13e79-207d-1e19-4743-29fb8ee93e08@redhat.com>

--------------dXXhzWjq2b6PFzEczs4If1bk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDUuMjIgdW0gMTI6Mzggc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQou
Li4NCj4gDQo+IE9uZSBzdWdnZXN0aW9uIHRvIGF2b2lkIHRvbyBtdWNoIHJlcGV0aXRpb246
DQo+IA0KPiBzdGF0aWMgaW50IG1nYWcyMDBfZ2V0X2JhbmR3aWR0aF9rYnBzKG1kZXYpIHsN
Cj4gDQo+ICDCoMKgwqDCoGlmIChJU19HMjAwX1NFKG1kZXYpKSB7DQo+ICDCoMKgwqDCoMKg
wqDCoCB1MzIgdW5pcXVlX3Jldl9pZCA9IG1kZXYtPm1vZGVsLmcyMDBzZS51bmlxdWVfcmV2
X2lkOw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIGlmICh1bmlxdWVfcmV2X2lkID09IDB4MDEp
IHsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDI0NDAwOw0KPiAgwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIGlmICh1bmlxdWVfcmV2X2lkID09IDB4MDIpIHsNCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDMwMTAwOw0KPiAgwqDCoMKgwqAuLi4NCj4gDQo+
ICDCoMKgwqDCoH0gZWxzZSBpZiAobWRldi0+dHlwZSA9PSBHMjAwX0VSKSB7DQo+ICDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gNTUwMDA7DQo+ICDCoMKgwqDCoH0NCj4gIMKgwqDCoMKgLyog
Tm8gYmFuZHdpZHRoIGRlZmluZWQgKi8NCj4gIMKgwqDCoMKgcmV0dXJuIDA7DQo+IH0NCj4g
DQo+IHRoZW4gaW4gbWdhZzIwMF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkKCkNCj4gDQo+IGlu
dCBnMjAwX2JhbmR3aWR0aCA9IG1nYWcyMDBfZ2V0X2JhbmR3aWR0aF9rYnBzKG1kZXYpOw0K
PiANCj4gaWYgKGcyMDBfYmFuZHdpZHRoICYmIG1nYWcyMDBfY2FsY3VsYXRlX21vZGVfYmFu
ZHdpZHRoKG1vZGUsIG1heF9icHAgKiANCj4gOCkgPiBnMjAwX2JhbmR3aWR0aCAqIDEwMjQp
DQo+ICDCoMKgwqDCoHJldHVybiBNT0RFX0JBRDsNCj4gDQoNCkZZSSB0aGF0IGNvZGUgd2ls
bCBzb29uIGJlIHBhcmFtZXRlcml6ZWQgdmlhIG1vZGVsLXNwZWNpZmljIGNvbnN0YW50cy4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQo+IEkndmUgYWxzbyB0ZXN0ZWQg
dGhpcyBwYXRjaHNldCwgYW5kIGhhdmUgc2VlbiBubyByZWdyZXNzaW9uLg0KPiANCj4geW91
IGNhbiBhZGQNCj4gDQo+IFJldmlld2VkLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBl
QHJlZGhhdC5jb20+DQo+IFRlc3RlZC1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KPiANCj4gZm9yIHRoZSB3aG9sZSBzZXJpZXMuDQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------dXXhzWjq2b6PFzEczs4If1bk--

--------------Fh3TAIOhkKzvvEd7gMfog50M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKCUwAFAwAAAAAACgkQlh/E3EQov+Di
hQ/9Hpvl5UpKxWcIqNftjUXMsc5qiwvda2gyjm0u/KRhkzWUof9TbQKX8zQ1qsetRKD4PkMltAVm
gzNW+nbUqvV1773aIc1KunOf0bUx1rYASllhR2StXIg1Y+j2wIQBK5sm852i+Ta/GgXhXk4lbh9p
1wjeoMSuLq1u5grpbxIQNWSWhCsI0PrBfE5wdo4fzV6cK12PfZWYrgK3QJdrEhlNODzqXPUfNfvW
wRwwIlk9w5XuOi4rew/lsrlkr745EZ9GRhzF7QVs2p0e8+myyQfIEGL1pmLcjTvqFzJh1aHhFJo7
Ilg5twB9efJH74Jc11xqaM2j54FoV6/2y4KWC6rDmQwMzDW73UdMOtCsHTVmjvFZMyB1JMmKD6+N
7wJ6/ceFzNIWDIVO54sUy8srqpKY4d3JBa5NT7k2fd6oe5g5ff+Z9ZrM0aEhgshm4X4A2bhcqGiA
IZZ06Fm/f+p/iHnZC+QVXD9o7sGGC+g2PEFl9PKMnQs9LHIbkvFiqTsJ2m/OBXzf4ou+GX1C0XU6
FxJpNq03r58EKTTlFAy8FgzWNomFYMCn3TTHunH0Y6Q8en/5CcqGLpUfK8mXvtK29oz3DxPsEntG
ibaGrHG0ZgYwrR5BOrNBbP5uBlIAD/2yVW3cVq+0hRUO6JN46ANiYEL60SOClVoSIvBfb5PpBHBu
C00=
=PZD/
-----END PGP SIGNATURE-----

--------------Fh3TAIOhkKzvvEd7gMfog50M--
