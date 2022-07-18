Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DF577D81
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54925AD09E;
	Mon, 18 Jul 2022 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3975AD08C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:28:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 560D2372E2;
 Mon, 18 Jul 2022 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658132929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYUqMlXSc0+HtpcGgLgIKPUjhjivEczKuqL8hsSnIbk=;
 b=Zc2Fu+370hqiJqQ0lJm/B09zK+kSE5EpSm+ncaE48KR9VZklrAdQEiOZzy+Z8WzKCKfyQ5
 GgcaUzeHmkDpyLJns88UqizAgnV3MsUiNEXEHZYetPW0XGKiATNZZXA9WwDu5+qoUP2fx+
 qL2UR5OOGJsBRpwb81q5KDicVQgB6zQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658132929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYUqMlXSc0+HtpcGgLgIKPUjhjivEczKuqL8hsSnIbk=;
 b=QsVC1z4pT0wKH/StjFDvdvIxaYBgi/4qPJaX/RcuowkdzvqXD0xGDbCuzY39C7UaHnhO+y
 upQNLED+Y7J76LBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D3B113754;
 Mon, 18 Jul 2022 08:28:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4dViDcEZ1WIhEgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 08:28:49 +0000
Message-ID: <1784aeb3-d4da-9208-97c1-6ced2b678fbd@suse.de>
Date: Mon, 18 Jul 2022 10:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <YtUSNzVOvaQZ1+uS@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YtUSNzVOvaQZ1+uS@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nW4vNDWtpMLvqZqCWUiWdtZy"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nW4vNDWtpMLvqZqCWUiWdtZy
Content-Type: multipart/mixed; boundary="------------QrSD8kIdQB6oi1vqhs6LU3fc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <1784aeb3-d4da-9208-97c1-6ced2b678fbd@suse.de>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <YtUSNzVOvaQZ1+uS@ravnborg.org>
In-Reply-To: <YtUSNzVOvaQZ1+uS@ravnborg.org>

--------------QrSD8kIdQB6oi1vqhs6LU3fc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDE4LjA3LjIyIHVtIDA5OjU2IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIEp1bCAxOCwgMjAyMiBhdCAwODo1NjoxNkFN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTYu
MDcuMjIgdW0gMjA6MTcgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4gV2hpbGUgZGlzY3Vz
c2luZyB0aGUgd2F5IGZvcndhcmQgZm9yIHRoZSB2aWEgZHJpdmVyDQo+Pj4gSmF2aWVyIGNh
bWUgdXAgd2l0aCB0aGUgcHJvcG9zYWwgdG8gbW92ZSBhbGwgRFJJMSBkcml2ZXJzDQo+Pj4g
dG8gdGhlaXIgb3duIGZvbGRlci4NCj4+Pg0KPj4+IFRoZSBpZGVhIGlzIHRvIG1vdmUgdGhl
IG9sZCBEUkkxIGRyaXZlcnMgc28gb25lIGRvIG5vdA0KPj4+IGFjY2lkZW50YWxseSBjb25z
aWRlciB0aGVtIG1vZGVybiBkcml2ZXJzLg0KPj4+DQo+Pj4gVGhpcyBzZXQgb2YgcGF0Y2hl
cyBpbXBsZW1lbnRzIHRoaXMgaWRlYS4NCj4+Pg0KPj4+IFRvIHByZXBhcmUgdGhlIG1vdmUs
IERSSVZFUl9MRUdBQ1kgYW5kIENPTkZJR19EUk1fTEVHQUNZDQo+Pj4gYXJlIGJvdGggcmVu
YW1lZCB0byAqX0RSSTEuIFRoaXMgbWFrZXMgaXQgbW9yZSBvYnZpb3VzDQo+Pj4gdGhhdCB3
ZSBhcmUgZGVhbGluZyB3aXRoIERSSTEgZHJpdmVycywgYXMgd2UgaGF2ZQ0KPj4+IGEgbG90
IG9mIG90aGVyIGxlZ2FjeSBzdXBwb3J0Lg0KPj4+DQo+Pj4gVGhlIGRyaXZlcnMgY29udGlu
dWUgdG8gaGF2ZSB0aGVpciBvd24gc3ViLWRpcmVjdG9yeQ0KPj4+IHNvIHRoZSBkcml2ZXIg
ZmlsZXMgYXJlIG5vdCBtaXhlZCB3aXRoIHRoZSBjb3JlIGZpbGVzDQo+Pj4gd2hpY2ggYXJl
IGNvcGllZCBpbiB0aGUgbGFzdCBjb21taXQuDQo+Pj4NCj4+PiBUaGUgRFJJMSBzcGVjaWZp
YyBwYXJ0IG9mIGRybS9LY29uZmlnIGlzIGxpa2V3aXNlIHB1bGxlZA0KPj4+IG91dCBhbmQg
bG9jYXRlZCBpbiB0aGUgZHJpMS8gZm9sZGVyLg0KPj4+DQo+Pj4gRmVlZGJhY2sgd2VsY29t
ZSENCj4+DQo+PiBUbyBiZSBob25lc3QsIEkgc3RpbGwgZG9uJ3QgbGlrZSB0aGlzIHJlbmFt
ZS4gRXNwZWNpYWxseSBpbiB0aGUgY2FzZSBvZiB2aWEsDQo+PiB3aGljaCBoYXMgYSBLTVMg
ZHJpdmVyIGNvbWluZyB1cC4gSXQgd2lsbCBub3cgaGF2ZSBhbiBpbmNsdWRlIHN0YXRlbWVu
dCB0aGF0DQo+PiBjcm9zc2VzIHNldmVyYWwgbGV2ZWxzIGluIHRoZSBkaXJlY3RvcnkgaGll
cmFyY2h5LiBBbmQgd2hhdCBhYm91dCB0aGUgb3RoZXINCj4+IERSSTEgZHJpdmVycz8gSWYg
d2UgZXZlciBnZXQgS01TIGRyaXZlcnMgZm9yIHRob3NlLCBkbyB3ZSB3YW50IHRvIG1vdmUg
c29tZQ0KPj4gaGVhZGVyIGZpbGVzIGJhY2sgaW50byB0aGVpciBvcmlnaW5hbCBsb2NhdGlv
bnM/IFBhdGNoZXMgMSBhbmQgMiBsb29rDQo+PiByZWFzb25hYmxlIHRvIG1lLiBUaGUgb3Ro
ZXIgZHJpdmVyIHBhdGNoZXMgaGF2ZSBiYXNpY2FsbHkgemVybyB1cHNpZGUgSU1ITy4NCj4g
VW50aWwgdGhlcmUgYXJlIGNvbnNlbnN1cywgaWYgZXZlciwgSSB3aWxsIGRyb3AgdGhlIHBh
dGNoZXMgbW92aW5nIHRoZSBkcml2ZXJzLg0KPiBUaGVyZSBpcyBhIGZldyBEUklWRVJfTEVH
QUNZIGluIERvY3VtZW50YXRpb24vIHRoYXQgSSBtaXNzZWQsIHNvIHdpbGwNCj4gc2VuZCBh
IHYyIHdpdGggdGhlc2UuDQo+IA0KPj4gSW4gdGhlIGNhc2Ugb2YgbW92aW5nIHRoZSBjb3Jl
IGZpbGVzIGludG8gZHJpMS8sIHRoZSByZXN1bHRpbmcgTWFrZWZpbGUgcnVsZQ0KPj4gbG9v
a3MgcmVhbGx5IHVnbHkuIEknZCBzdWdnZXN0IHRvIG1vdmUgYWxsIGNvZGUgaW50byBhIHNl
cGFyYXRlIGZpbGUNCj4+IGRybV9kcmkxLmMgYW5kIGJlIGRvbmUgd2l0aCBpdC4gIEZvciBz
b21ldGhpbmcgbW9yZSBlbGFib3JhdGUsIHRoZXJlIGNvdWxkDQo+PiBieSBkcm1fZHJpMS5j
IGFuZCBkcm1fZHJpMV9oZWxwZXIuYywgd2hlcmUgdGhlIGxhdHRlciBjb250YWlucyBhbGwg
RFJJMSBjb2RlDQo+PiB0aGF0IGlzIG9ubHkgdXNlZCBieSB0aGUgZHJpdmVycy4NCj4gSWYg
d2UgZG8gbm90IG1vdmUgdGhlIGNvcmUgY29kZSwgdGhlbiB0aGlzIGlzIGEgZ29vZCB3YXkg
dG8gdGVsbCB0aGlzIGlzIGRyaTENCj4gc3BlY2lmaWMuIEkgbWF5IHRyeSB0byBnaXZlIGl0
IGEgc3BpbiAtIGJ1dCBqdXN0IGFzIGEgc2luZ2xlIGZpbGUgSSB0aGluay4NCg0KVGhhbmtz
IGEgbG90Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJU2FtDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------QrSD8kIdQB6oi1vqhs6LU3fc--

--------------nW4vNDWtpMLvqZqCWUiWdtZy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLVGcAFAwAAAAAACgkQlh/E3EQov+Da
oQ//V12dZlPRquTNrkB2jyWsEIl4Yv+pmt6aiRagxlmbsZ7c4dEolIX5zDvOehX2IgRp6aoZ7SP6
hC1x//T9hfXrnlBZvWB5eu60fphznH4k7uV4ZAY6hhJHAiXJTuAjXZ/lEVQSCGTqiAiS7QBLdOyI
Knovfjyibl/VlP5EniF8L4s5gNRB6iHc3GzKlUNdJJgPMmP2zzzW5o2ztUiHDnVVU+USVYs8ke/S
BCISuWKleR4y19hUinNx7vsNBxr+pQ5gGJhqHQQuFw4bpFSKrpDniHPDVsw9RqQIQHcjnf7azU2e
2Nhnpsjh8FUNf1OKtQonDGPXZNhtOxJ9RAhiJ0wSMOGiUEe1XKOq2IjkREboOAu4Yy/BuZAGzjuO
Y33ziMJnMje6x1BHArAMz8gUsIQ904Mf3XONKvvsfAI+bAySzN0r7a5C4dJ70k/hg1CXaGAlnfrO
mzIdkPMhCb2iHNdjX6FQLQJTqmjhVQY5w+1jY12L5vYI+ASmG5IgksAdWFVzD4O6OUabfkJiU18v
SSPpMQH6tcM/RVoqUSdLfML0n0g3EaUZIp30Jnf1jKE//+ZIqkfSboWzZBMYvl9EGGmQ0BaJZvVo
CZAlDV8lx2nIFDR3mv6oHjbFZgfacSYRB28HCZF5Fjfl2js+xeB064PxObZaAcSN+4mwP4+0Vdlq
pe0=
=6ugQ
-----END PGP SIGNATURE-----

--------------nW4vNDWtpMLvqZqCWUiWdtZy--
