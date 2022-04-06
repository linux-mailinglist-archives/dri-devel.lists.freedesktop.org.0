Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02C4F6A4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201AF10E229;
	Wed,  6 Apr 2022 19:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E9C10E229
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:47:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB1531F38A;
 Wed,  6 Apr 2022 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649274440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KuESX8xPA5mh0wLMjmExV6j0g938GVtBbdm5s1TJ4k=;
 b=raf4IZFwqiW2nfU/4PklsJz7oGHOenGOWl29wVC99MixbDdEc/Mua4I5B/Zck3/WiTfYZO
 UcY4F1n2VUDuYe1Zj1fauX2DFkKZLA3VOGORYx44BYohpkDG8TxRFHCzI9bqhj+1d83MJc
 9JVcEXIO7Es/1J7oEzwbyfUPYIn9pfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649274440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KuESX8xPA5mh0wLMjmExV6j0g938GVtBbdm5s1TJ4k=;
 b=IHrHiNy0qWKmokyUML22sXd4Hy9sc7xZhGMcJcZWzJ3G38NLXhoLCW0OQxDykmLONVx4G8
 DjLrTm1XuJYEo7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AFBD13A8E;
 Wed,  6 Apr 2022 19:47:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HG/1HEjuTWI+HQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 19:47:20 +0000
Message-ID: <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de>
Date: Wed, 6 Apr 2022 21:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87wngbbue8.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eAJeCnZiaxLoj1r1M3eDkxXp"
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
--------------eAJeCnZiaxLoj1r1M3eDkxXp
Content-Type: multipart/mixed; boundary="------------k7Apij67aVsaIzkLbYizIrEZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Message-ID: <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de>
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
In-Reply-To: <87wngbbue8.fsf@intel.com>

--------------k7Apij67aVsaIzkLbYizIrEZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjIgdW0gMTI6MzUgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
VHVlLCAyMiBNYXIgMjAyMiwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmggYi9p
bmNsdWRlL2RybS9kcm1fZWRpZC5oDQo+PiBpbmRleCAxNDRjNDk1Yjk5YzQuLmU2ZTllNDU1
NzA2NyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgNCj4+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9lZGlkLmgNCj4+IEBAIC0zOTEsMzMgKzM5MSw2IEBAIGRybV9s
b2FkX2VkaWRfZmlybXdhcmUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4+
ICAgDQo+PiAgIGJvb2wgZHJtX2VkaWRfYXJlX2VxdWFsKGNvbnN0IHN0cnVjdCBlZGlkICpl
ZGlkMSwgY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQyKTsNCj4+ICAgDQo+PiAtaW50DQo+PiAt
ZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9kZShzdHJ1Y3QgaGRtaV9h
dmlfaW5mb2ZyYW1lICpmcmFtZSwNCj4+IC0JCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLA0KPj4gLQkJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICptb2RlKTsNCj4+IC1pbnQNCj4+IC1kcm1faGRtaV92ZW5kb3JfaW5mb2ZyYW1lX2Zy
b21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1pX3ZlbmRvcl9pbmZvZnJhbWUgKmZyYW1lLA0K
Pj4gLQkJCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+
PiAtCQkJCQkgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOw0KPj4g
LQ0KPj4gLXZvaWQNCj4+IC1kcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2NvbG9yaW1ldHJ5KHN0
cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1lLA0KPj4gLQkJCQkgICBjb25zdCBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSk7DQo+PiAtDQo+PiAtdm9pZA0K
Pj4gLWRybV9oZG1pX2F2aV9pbmZvZnJhbWVfYmFycyhzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSwNCj4+IC0JCQkgICAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3Rh
dGUgKmNvbm5fc3RhdGUpOw0KPj4gLQ0KPj4gLXZvaWQNCj4+IC1kcm1faGRtaV9hdmlfaW5m
b2ZyYW1lX3F1YW50X3JhbmdlKHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1lLA0K
Pj4gLQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPj4g
LQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwNCj4+IC0JCQkJ
ICAgZW51bSBoZG1pX3F1YW50aXphdGlvbl9yYW5nZSByZ2JfcXVhbnRfcmFuZ2UpOw0KPj4g
LQ0KPj4gLWludA0KPj4gLWRybV9oZG1pX2luZm9mcmFtZV9zZXRfaGRyX21ldGFkYXRhKHN0
cnVjdCBoZG1pX2RybV9pbmZvZnJhbWUgKmZyYW1lLA0KPj4gLQkJCQkgICAgY29uc3Qgc3Ry
dWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOw0KPj4gLQ0KPj4gICAvKioN
Cj4+ICAgICogZHJtX2VsZF9tbmwgLSBHZXQgRUxEIG1vbml0b3IgbmFtZSBsZW5ndGggaW4g
Ynl0ZXMuDQo+PiAgICAqIEBlbGQ6IHBvaW50ZXIgdG8gYW4gZWxkIG1lbW9yeSBzdHJ1Y3R1
cmUgd2l0aCBtbmwgc2V0DQo+PiBAQCAtNTg3LDYgKzU2MCwxMCBAQCB2b2lkIGRybV9lZGlk
X2dldF9tb25pdG9yX25hbWUoc3RydWN0IGVkaWQgKmVkaWQsIGNoYXIgKm5hbWUsDQo+PiAg
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1fbW9kZV9maW5kX2RtdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPj4gICAJCQkJCSAgIGludCBoc2l6ZSwgaW50IHZzaXplLCBpbnQg
ZnJlc2gsDQo+PiAgIAkJCQkJICAgYm9vbCByYik7DQo+PiArDQo+PiArdTggZHJtX21hdGNo
X2hkbWlfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqdG9fbWF0Y2gpOw0K
Pj4gK2VudW0gaGRtaV9waWN0dXJlX2FzcGVjdCBkcm1fZ2V0X2NlYV9hc3BlY3RfcmF0aW8o
Y29uc3QgdTggdmlkZW9fY29kZSk7DQo+PiArZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IGRy
bV9nZXRfaGRtaV9hc3BlY3RfcmF0aW8oY29uc3QgdTggdmlkZW9fY29kZSk7DQo+IA0KPiBJ
IHRoaW5rIHRoZXNlIHdlcmUgZmluZSBhcyBzdGF0aWMsIGJ1dCBub3QgcmVhbGx5IGdyZWF0
IGludGVyZmFjZXMgdG8NCj4gZXhwb3J0LiBUaGVyZSdzIHplcm8gaW5wdXQgY2hlY2tpbmcg
b24gdGhlIHZpYyBpbiB0aGUgbGF0dGVyLCBiZWNhdXNlDQo+IGludGVybmFsbHkgd2UgY291
bGQgYmUgc3VyZSB0aGV5IHdlcmUgZmluZS4NCg0KSSBzZWUuIElmIG5vdGhpbmcgZWxzZSwg
SERNSSBjb3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIHBhdGNoc2V0LiBPVE9IIA0KaGF2aW5n
IHRoZXNlIEhETUkgZnVuY3Rpb25zIGFzIHBhcnQgb2YgdGhlIGVkaWQgY29kZSBkb2Vzbid0
IHNlZW0gcmlnaHQgDQplaXRoZXIuDQoNCj4gDQo+IEkgYWxzbyB3aXNoIHdlIGNvdWxkIGxp
bWl0IHRoZSB1c2FnZSB0byB0aGUgbW9kdWxlIHlvdSdyZSBhZGRpbmc7IHRoaXMNCj4gaXMg
bm93IGF2YWlsYWJsZSB0byBhbGwgZHJpdmVycyB3aGljaCBzaG91bGQgYmUgZGlzY291cmFn
ZWQuDQoNCldoeSBpcyB0aGF0IGRpc2NvdXJhZ2VkPyBRdWl0ZSBhIGZldyBkcml2ZXJzIHVz
ZSB0aGVzZSBpbnRlcmZhY2VzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KPiANCj4gDQo+
IEJSLA0KPiBKYW5pLg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------k7Apij67aVsaIzkLbYizIrEZ--

--------------eAJeCnZiaxLoj1r1M3eDkxXp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJN7kcFAwAAAAAACgkQlh/E3EQov+B0
pA/8CV46XrWkpgaMBAgZlivlzWiASTNxkdA8f+gCLZVO3Gairutqt+sEOtVY8aA8rzXH7x7GOyfk
XOmFjZV8OvmnQ4e7UF4iMWI61PK77mQYZDH+DfFzHquABtfN8woY7IO4wD4D29McD0yAYKQYmYKi
zHOKHueJDp/op2mS1x6JuvZf0e0Oda/udTwN8Sxna6RlngICst8BbGsHH0oy01j0YKgmG8kapucW
F1xhbn4qk2oYr9X/nCuE0bBqTZPHR03tIqxXC6dhw8EOSsz21cd8b4CZ1Vvg/SMbiVMN6yPWgzYl
RoAyqqbKQGe+8suXYuNY+TfB2+IVoPgkBDVBdD7G1A+FhdN6AOQoORObHNhVn5CeeXcQs6AG80Cr
/5T6fXHUTpuwlwj5hRnTw29uu0eqy8f2dY4O1b8zg+X0lvw8LZ9Zf+DlDC7svl1dnPl3kTyuByf/
XDL/7tywX+q0m0gQnbGXdsx68Fv+NBBKwxWy5ZlXoGapJ8pL30M8KxiTZPXHR4SuGATVCKZ3YPpQ
tGEDPb0Hij5OfrshryXyRG2Lwxot22fy3LPeGV10ESnrqY2rdt7zumoYZUF+ImGHbqMuifuSXllU
AJ+ooDBUZoMs1AHHSmRj0Gw8XkPmSwJMIpU93POMdfPoxCsttxkPoXokOKV4n/9WB4Fi8+U/ni5O
cFQ=
=lOBN
-----END PGP SIGNATURE-----

--------------eAJeCnZiaxLoj1r1M3eDkxXp--
