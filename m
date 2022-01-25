Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C149AE04
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FFD10EE94;
	Tue, 25 Jan 2022 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4F410EE95
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:31:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B10F1F380;
 Tue, 25 Jan 2022 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643099486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfVK7j54k90L4VD6qbJ3q0DWRxxP9JSVzAdqDk/VJS4=;
 b=1ucbavA6/D71O62TITrZ6hR8JqmGWpDK/fZuaXrumkYD2uy96gm0HBw0J9P8zQWrqZGHXQ
 wvY7jpehXEgfTwOaRZAsv0tx7z7wHCf+j682CazVr6VMXwUKZ4yfENQZ/xoGZY8vGPPQgr
 ParJfmsFD7aGF3cHUR2DKv4z2gQjAYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643099486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfVK7j54k90L4VD6qbJ3q0DWRxxP9JSVzAdqDk/VJS4=;
 b=AECzlQAlKZ2/5TPIXh4/YTXMFpDI5ZoUpdsUqv//i5HMTu0dxQ9CX+SeqyjSS6Nh0rKgYu
 UOFYDcRCGU8WbCDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 125B113D91;
 Tue, 25 Jan 2022 08:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q+o4A16172F3KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jan 2022 08:31:26 +0000
Message-ID: <5573dbce-9aba-87b2-c8e0-9fe43d41211e@suse.de>
Date: Tue, 25 Jan 2022 09:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm/simpledrm: Request memory region in driver
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, zackr@vmware.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-4-tzimmermann@suse.de>
 <bede759f-23c2-a87e-abde-108196e36fde@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <bede759f-23c2-a87e-abde-108196e36fde@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FYKVwp7amLCNSkDihGROHNJE"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FYKVwp7amLCNSkDihGROHNJE
Content-Type: multipart/mixed; boundary="------------VCEOoT6OOllbJOzXqOIAL3ZT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, zackr@vmware.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <5573dbce-9aba-87b2-c8e0-9fe43d41211e@suse.de>
Subject: Re: [PATCH 3/5] drm/simpledrm: Request memory region in driver
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-4-tzimmermann@suse.de>
 <bede759f-23c2-a87e-abde-108196e36fde@redhat.com>
In-Reply-To: <bede759f-23c2-a87e-abde-108196e36fde@redhat.com>

--------------VCEOoT6OOllbJOzXqOIAL3ZT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMTU6MjMgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDI0LzAxLzIwMjIgMTM6MzYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVx
dWVzdGluZyB0aGUgZnJhbWVidWZmZXIgbWVtb3J5IGluIHNpbXBsZWRybSBtYXJrcyB0aGUg
bWVtb3J5DQo+PiByYW5nZSBhcyBidXN5LiBUaGlzIHVzZWQgdG8gYmUgZG9uZSBieSB0aGUg
ZmlybXdhcmUgc3lzZmIgY29kZSwNCj4+IGJ1dCB0aGUgZHJpdmVyIGlzIHRoZSBjb3JyZWN0
IHBsYWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdGlueS9z
aW1wbGVkcm0uYyB8IDIwICsrKysrKysrKysrKysrKy0tLS0tDQo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgDQo+PiBiL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBpbmRleCAwNDE0NmRhMmQxZDguLmY3MmI3
MTUxMWE2NSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4gQEAg
LTUyNiwyMSArNTI2LDMxIEBAIHN0YXRpYyBpbnQgc2ltcGxlZHJtX2RldmljZV9pbml0X21t
KHN0cnVjdCANCj4+IHNpbXBsZWRybV9kZXZpY2UgKnNkZXYpDQo+PiDCoCB7DQo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmc2Rldi0+ZGV2Ow0KPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gc2Rldi0+cGRldjsNCj4+IC3C
oMKgwqAgc3RydWN0IHJlc291cmNlICptZW07DQo+PiArwqDCoMKgIHN0cnVjdCByZXNvdXJj
ZSAqcmVzLCAqbWVtOw0KPj4gwqDCoMKgwqDCoCB2b2lkIF9faW9tZW0gKnNjcmVlbl9iYXNl
Ow0KPj4gwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4gLcKgwqDCoCBtZW0gPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPj4gLcKgwqDCoCBpZiAo
IW1lbSkNCj4+ICvCoMKgwqAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElP
UkVTT1VSQ0VfTUVNLCAwKTsNCj4+ICvCoMKgwqAgaWYgKCFyZXMpDQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+PiAtwqDCoMKgIHJldCA9IGRldm1fYXBlcnR1
cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRldiwgbWVtLT5zdGFydCwgDQo+PiByZXNvdXJj
ZV9zaXplKG1lbSkpOw0KPj4gK8KgwqDCoCByZXQgPSBkZXZtX2FwZXJ0dXJlX2FjcXVpcmVf
ZnJvbV9maXJtd2FyZShkZXYsIHJlcy0+c3RhcnQsIA0KPj4gcmVzb3VyY2Vfc2l6ZShyZXMp
KTsNCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRy
bV9lcnIoZGV2LCAiY291bGQgbm90IGFjcXVpcmUgbWVtb3J5IHJhbmdlICVwcjogZXJyb3Ig
JWRcbiIsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW0sIHJldCk7DQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXMsIHJldCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCBtZW0gPSBkZXZtX3Jl
cXVlc3RfbWVtX3JlZ2lvbigmcGRldi0+ZGV2LCByZXMtPnN0YXJ0LCANCj4+IHJlc291cmNl
X3NpemUocmVzKSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2Rldi0+ZGV2LmRyaXZlci0+bmFtZSk7DQo+PiArwqDCoMKgIGlmICghbWVtKSB7
DQo+PiArwqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogV2UgY2Fu
bm90IG1ha2UgdGhpcyBmYXRhbC4gU29tZXRpbWVzIHRoaXMgY29tZXMgZnJvbSBtYWdpYw0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBzcGFjZXMgb3VyIHJlc291cmNlIGhhbmRsZXJzIHNp
bXBseSBkb24ndCBrbm93IGFib3V0DQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8Kg
wqDCoMKgwqDCoMKgIGRybV93YXJuKGRldiwgImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSBy
ZWdpb24gJXByXG4iLCByZXMpOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiDCoMKgwqDCoMKg
IHNjcmVlbl9iYXNlID0gZGV2bV9pb3JlbWFwX3djKCZwZGV2LT5kZXYsIG1lbS0+c3RhcnQs
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
c291cmNlX3NpemUobWVtKSk7DQo+IA0KPiBpZiBtZW0gaXMgTlVMTCwgYWNjZXNzaW5nIG1l
bS0+c3RhcnQgd2lsbCBzZWdmYXVsdCBhZnRlciB0aGUgd2FybmluZy4NCj4gSSB0aGluayB5
b3UgcmVuYW1lZCAibWVtIiB0byAicmVzIiBzbyBwcm9iYWJseSBpdCBzaG91bGQgYmUgcmVu
YW1lZCBoZXJlIA0KPiB0b28gPw0KDQpUaGFua3MgZm9yIHJldmlld2luZy4gV2lsbCBiZSBm
aXhlZCBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGF0IGNvZGUgdXNlZCANCnRvIGZhaWwgYW5k
IGkgY2hhbmdlZCBpdCB0byBhIHdhcm5pbmcgYWZ0ZXIgc3luYydpbmcgd2l0aCB0aGUgc2lt
cGxlZmIgDQpkcml2ZXIuIDovDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiDC
oMKgwqDCoMKgIGlmICghc2NyZWVuX2Jhc2UpDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------VCEOoT6OOllbJOzXqOIAL3ZT--

--------------FYKVwp7amLCNSkDihGROHNJE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHvtV0FAwAAAAAACgkQlh/E3EQov+Cl
xA//ccKw19qdKf9oj9gdzIMI0lDSosThYBpkXxtl+D3uAbaxPfcbyIrwV/LXw9T/kP0rkx46UJjk
eLWozo2aIZl0Nu+bRyBQN1XDWpBfn4lLla08Ys+GN+9Zx+cOmP4wtEdOcWqASbyOAjtGcebs3s4q
ZmOxRndOwsFSKuQJMKJSNRclC8xrFlIIc25v3atNo7xnolEQr7ShYJbHkwjiocBlqpWf2ab+B4JO
I3DxwCVC0KcwYPZ4+0x8KVA2tSv5B9xCVe3z9FOvTjB+ACvYEUPHLCQseL9v01qAO7+3l0ymnA+U
ZsttDGPdBC+3SN5pTix6AjSviDnE2jKA6kGOmntoEPsyecHWT99QckLOfBPCS1yY75mCxbiik82I
ftKfNfQrOW0iqyPhOrp2aHy3LUXaK5RmTvixEtQGV4Pi7eFp/Cfy6bvV3eCTUOURdNcj84J4+Tlt
m6gkEBn31ZGhdx0zSrb4g8a8Jrx3p1DmhAuMa8kOUBVIF1uFcRyMG5N5qMgsepxzjNqTpDoobFMK
b4XB4X2ocLKtIWVLOvLfir75PIpSqw7G/BdnmbaPTSBDiomUE/Js320Gxqt5R8hQJzTgOrod18F0
od8tNq6BM7BAG1cqw+CeVYVcU/PFPCX72JxwMFvkH7cXxsQJuFIDmjulPtJSkQ02zLY16rjkQV0j
Z3w=
=xj+2
-----END PGP SIGNATURE-----

--------------FYKVwp7amLCNSkDihGROHNJE--
