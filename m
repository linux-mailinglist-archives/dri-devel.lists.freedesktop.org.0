Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964152328E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E14810E2E2;
	Wed, 11 May 2022 12:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6510E2E2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:05:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F4C021ADD;
 Wed, 11 May 2022 12:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652270758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgrSU0tZFmztoLEHo/ZRKSQ4FVmoOl/dpHBlRAkljd8=;
 b=tgEoYI3CqfgnnODHYSVMqqwX9ZdnbqqrIbeqesX5ChuuhkkEDdS+3YPWthnnVt4dYrybKn
 BkX5Sk0sQS7TPdXtVH0Q77j693u0uOLuj5qqrR8jMvVBI8T/rcW2aA6NEYfkRWYaZFJwIw
 vcIW0ksm+al8xH1My7x5jOyQII/QL/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652270758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgrSU0tZFmztoLEHo/ZRKSQ4FVmoOl/dpHBlRAkljd8=;
 b=GMhGe41vVt9i+AL5XDObmn93Sj5PS/1ACzt7xnNxzuTQYpjrb7u7k/6mo9RHSflOVOWjjo
 49hdvIhEU9LdVpDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EB1F13A76;
 Wed, 11 May 2022 12:05:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t7kWEqame2LaWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 12:05:58 +0000
Message-ID: <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
Date: Wed, 11 May 2022 14:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
 <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yi9RKNiGw8qpwJxtMsrgVOVY"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yi9RKNiGw8qpwJxtMsrgVOVY
Content-Type: multipart/mixed; boundary="------------F6GRmTVKCrXRCN9VM0lxyUrr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
 <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
In-Reply-To: <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>

--------------F6GRmTVKCrXRCN9VM0lxyUrr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDUuMjIgdW0gMTQ6MDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDUvMTEvMjIgMTM6NTQsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxMS4wNS4yMiB1bSAxMzoy
NCBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+PiBUaGVzZSBjYW4gYmUg
dXNlZCBieSBzdWJzeXN0ZW1zIHRvIHVucmVnaXN0ZXIgYSBwbGF0Zm9ybSBkZXZpY2UgcmVn
aXN0ZXJlZA0KPj4+IGJ5IHN5c2ZiIGFuZCBhbHNvIHRvIGRpc2FibGUgZnV0dXJlIHBsYXRm
b3JtIGRldmljZSByZWdpc3RyYXRpb24gaW4gc3lzZmIuDQo+Pj4NCj4+DQo+PiBJIGZpbmQg
aXQgdmVyeSBoYXJkIHRvIHJldmlldyB0aGVzZSBwYXRjaGVzLCBhcyByZWxhdGVkIHRoaW5n
cyBhcmUgcHV0DQo+PiBpbnRvIHNlcGFyYXRlIHBhdGNoZXMuDQo+Pg0KPj4gSSBzdWdnZXN0
IHRvIHB1dCB0aGUgc3lzZmJfZGlzYWJsZSgpIHN0dWZmIGludG8gcGF0Y2ggNSBhbmQgdGhl
IHJlc3QNCj4+IGludG8gcGF0Y2ggNC4NCj4+DQo+IA0KPiBPaywgeW91IHRoZW4gd2FudCBp
biB0aGUgc2FtZSBwYXRjaCB0byBoYXZlIGJvdGggdGhlIGhlbHBlciBkZWZpbml0aW9uDQo+
IGFuZCBmaXJzdCB1c2FnZS4NCj4gDQo+IE90aGVyIHN1YnN5c3RlbXMgYXNrIHlvdSB0byBk
byB0aGUgb3Bwb3NpdGUsIHRvIHNwbGl0IHRoZSBkZWZpbml0aW9uIGFuZA0KPiB1c2FnZSBp
biBzZXBhcmF0ZSBwYXRjaGVzLiBCdXQgSSdtIGZpbmUgd2l0aCBtZXJnaW5nIHRob3NlIGlm
IHlvdSBwcmVmZXIuDQoNClVzdWFsbHksIEkgaGF2ZSBubyBzdHJvbmcgb3BpbmlvbiBvbiB0
aGlzLiBCdXQgaW4gdGhlIGNhc2Ugb2YgdGhpcyANCnNwZWNpZmljIHBhdGNoc2V0LCBJIGhh
dmUgdGhlIGZlZWxpbmcgdGhhdCBJJ20gbWlzc2luZyBzb21lIGltcG9ydGFudCANCnBvaW50
IGJlY2F1c2UgY2FsbCBhbmQgaW1wbGVtZW50YXRpb24gYXJlIHNlcGFyYXRlLiAgU2VlIG15
IG90aGVyIA0KcmVwbGllcyBmb3IgdGhhdC4gIFB1dHRpbmcgdGhlbSBuZXh0IHRvIGVhY2gg
b3RoZXIgd2lsbCBob3BlZnVsbHkgaGVscC4gDQpTb3JyeSBmb3IgdGhlIGluY29udmVuaWVu
Y2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICANCj4+IEJlc3QgcmVnYXJkcw0K
Pj4gVGhvbWFzDQo+Pg0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------F6GRmTVKCrXRCN9VM0lxyUrr--

--------------yi9RKNiGw8qpwJxtMsrgVOVY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7pqUFAwAAAAAACgkQlh/E3EQov+Cx
OQ/9GfcQ0IlT3ZFMmaSEQGfENXCJdBpO2o02THzZKpg6aCWqlYX04BCE4uvqYWGxd+nYG5Gc7ZlJ
Rl66/qkl1UMGmIdPoRDa6A5QemFVvmO+BM9QYQXn3PwvWuqfeU2b8uLGDC+LIu+GQFu2Mg1w8d0J
3PzJ+cIYX6+kzxBG4boBue7ig/05yJZuYC/1bpMeZvLHb6JOJjLZaeXR3DqGp2H/8BNgZWqvE8aH
rihECk0D7MtozWdZ+nsqTpYsNCGtKyd6h2gwcypXnU7XseWEu5N2foUu1++5klJUH4hnuRXKOvx/
2HyKAXLuzLLBKIINMoxGWb6D8x0/+9cEnRoNtClik9YNdAWHT2pJCARi19DohqKGqXaVpjlxnNTH
kcA6FOjW5G0+hz1bvpvtoVOmL+V8SDBFHm6+/1QKyf69PxDwck5mho8WUMMsjqqa/uPFIUKj9o6m
Z6ho0/G2Qm0Qds9kkDW4Is0QZA83m4TAh3vr1w84ZgLd2g/6osduqbLmYXOU+85C1qVfE3zR0I6D
aYkYo1fHb5HpeDpLUZjkCJJKIHNaGRKtqYhkr32OgO/sAnAyvQ0+0JIVgQJ53a67ugq6668+zcsf
YqO0gt7DjfGqfnwBRRqH0NdS3TCYeM22MgWzQteoFYu1xoyalOFyWbNbTWMduYDdPYn30KJ0LKZE
/us=
=k680
-----END PGP SIGNATURE-----

--------------yi9RKNiGw8qpwJxtMsrgVOVY--
