Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0879884E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161EA10E8B4;
	Fri,  8 Sep 2023 14:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8934E10E8B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 14:10:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 347121FEC0;
 Fri,  8 Sep 2023 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694182200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZrM6pSe0Pzx2scu6Slf/UHt//zNWcP+GOk3IAOwDL0=;
 b=vZepRN1ulcpeLvSETOLfhq2P7sWsuFJ6/ZsRUFJso61G7+tFlIPTPyW5NvjDa9aKkuacRr
 TviPsPcLIqeiPbRDYzkQJRw9cCBZriOrF28ow10NkScE+/xPnI1pzBaUqNog6rCPAKO5IY
 2k5TVeBs5v/cRLOW712FV/glQ4ilGXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694182200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZrM6pSe0Pzx2scu6Slf/UHt//zNWcP+GOk3IAOwDL0=;
 b=EsXKZmJGaL9sgYb3g059GjCtb0M2RnAsjNhgXgj+wGW6fcoQ45TO2mCEaMulC2RRQnggeG
 tuy9qWvMB/PomOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 054E9132F2;
 Fri,  8 Sep 2023 14:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V8xTADgr+2QRbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Sep 2023 14:10:00 +0000
Message-ID: <6339b885-59e8-4fb1-0538-3fd9b8dc1624@suse.de>
Date: Fri, 8 Sep 2023 16:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
 <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v4gWos700rVQzKmu5XCcM0WX"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v4gWos700rVQzKmu5XCcM0WX
Content-Type: multipart/mixed; boundary="------------kL4kniSjwmidpH0qO4B8ElFU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, ppaalanen@gmail.com,
 contact@emersion.fr, dri-devel@lists.freedesktop.org
Message-ID: <6339b885-59e8-4fb1-0538-3fd9b8dc1624@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <5ltuqgsepffvp6rjvmskqtvzyyhvk6phmixm3crfteznyejn4t@mtycsppney5x>
 <b135fdd1-afd9-bb65-19d7-3125504afb05@suse.de>
 <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ledg3hib.fsf@minerva.mail-host-address-is-not-set>

--------------kL4kniSjwmidpH0qO4B8ElFU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA4LjA5LjIzIHVtIDE1OjQ2IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IEhpIE1heGltZQ0KPj4N
Cj4+IEFtIDA4LjA5LjIzIHVtIDEyOjU4IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+PiBI
aSwNCj4+Pg0KPj4+IE9uIEZyaSwgU2VwIDA4LCAyMDIzIGF0IDExOjIxOjUxQU0gKzAyMDAs
IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBBbSAyNS4wOC4yMyB1bSAxNjowNCBz
Y2hyaWViIEpvY2VseW4gRmFsZW1wZToNCj4+Pj4gWy4uLl0NCj4+Pj4+ICsgKg0KPj4+Pj4g
KyAqICAgICBCdXQgdGhlcmUgYXJlIHR3byBleGNlcHRpb25zIG9ubHkgZm9yIGR1bWIgYnVm
ZmVyczoNCj4+Pj4+ICsgKiAgICAgKiBUbyBzdXBwb3J0IFhSR0I4ODg4IGlmIGl0J3Mgbm90
IHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUuDQo+Pj4+DQo+Pj4+DQo+Pj4+PiArICogICAg
ICogQW55IGRyaXZlciBpcyBmcmVlIHRvIG1vZGlmeSBpdHMgaW50ZXJuYWwgcmVwcmVzZW50
YXRpb24gb2YgdGhlIGZvcm1hdCwNCj4+Pj4+ICsgKiAgICAgICBhcyBsb25nIGFzIGl0IGRv
ZXNuJ3QgYWx0ZXIgdGhlIHZpc2libGUgY29udGVudCBpbiBhbnkgd2F5LCBhbmQgZG9lc24n
dA0KPj4+Pj4gKyAqICAgICAgIG1vZGlmeSB0aGUgdXNlci1wcm92aWRlZCBidWZmZXIuIEFu
IGV4YW1wbGUgd291bGQgYmUgdG8gZHJvcCB0aGUNCj4+Pj4+ICsgKiAgICAgICBwYWRkaW5n
IGNvbXBvbmVudCBmcm9tIGEgZm9ybWF0IHRvIHNhdmUgc29tZSBtZW1vcnkgYmFuZHdpZHRo
Lg0KPj4+Pg0KPj4+PiBJIGhhdmUgc3Ryb25nIG9iamVjdGlvbnMgdG8gdGhpcyBwb2ludCwg
X2VzcGVjaWFsbHlfIGFzIHlvdSdyZSBhcHBhcmVudGx5DQo+Pj4+IHRyeWluZyB0byBzbmVh
ayB0aGlzIGluIGFmdGVyIG91ciBkaXNjdXNzaW9uLg0KPj4+DQo+Pj4gSSB0aGluayBpdCdz
IGFuIHVuZmFpciBjaGFyYWN0ZXJpemF0aW9uLiBUaGlzIHdhcyBkaXNjdXNzZWQgb24NCj4+
PiAjZHJpLWRldmVsLCBhbmQgd2VudCB0aHJvdWdoIHNldmVyYWwgcm91bmRzIG92ZXIgdGhl
IG1haWxpbmcgbGlzdHMsIHdpdGgNCj4+PiB5b3UgaW4gQ2MgZm9yIGVhY2guIEhvdyBpcyB0
aGF0IHNuZWFraW5nIHNvbWV0aGluZyBpbj8NCj4+DQo+PiBBIGZldyBtb250aHMgYWdvLCB3
ZSBoYWQgYSBmbGFtZXdhcidpc2ggSVJDIGRpc2N1c3Npb24gb24gZm9ybWF0DQo+PiBjb252
ZXJzaW9uIHdpdGhpbiB0aGUga2VybmVsLiBUaGUgZ2VuZXJhbCBzZW50aW1lbnQgd2FzIHRo
YXQgdGhlIGtlcm5lbA0KPj4gZHJpdmVycyBzaG91bGQgdXNlIHdoYXQgZXZlciBpcyBwcm92
aWRlZCBieSB1c2Vyc3BhY2Ugd2l0aG91dCBmdXJ0aGVyDQo+PiBwcm9jZXNzaW5nLiBUaGUg
c2hvcnQgYXJndW1lbnQgd2FzICd1c2Vyc3BhY2Uga25vd3MgYmV0dGVyJy4gVGhlIG9ubHkN
Cj4+IGV4Y2VwdGlvbiBpcyBmb3Igc3VwcG9ydGluZyBYUkdCODg4OCBvbiBoYXJkd2FyZSB0
aGF0IHdvdWxkIG90aGVyd2lzZQ0KPj4gbm90IHN1cHBvcnQgaXQuIEFmdGVyIHNvbWUgY29u
c2lkZXJhdGlvbiwgSSBhZ3JlZSB3aXRoIGFsbCB0aGF0LiAoQmFjaw0KPj4gdGhlbiBJIGRp
ZG4ndC4pDQo+Pg0KPj4gQSBmZXcgd2Vla3MgYWdvIEkgcmVjZWl2ZWQgYSBwYXRjaCB0byBk
byBhbiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20NCj4+IFhSR0I4ODg4IHRvIFJHQjg4OCB3
aXRoaW4gbWdhZzIwMC4gWzFdIEkgZG9uJ3QgaGF2ZSBhIGxpbmsgdG8gdGhlDQo+PiBkaXNj
dXNzaW9uLCBidXQgSSBOQUsnZWQgdGhhdCBwYXRjaCBwcmV0dHkgaGFyZCBvbiBJUkMgYnkg
Zm9sbG93aW5nIHRoYXQNCj4+IG90aGVyIGRpc2N1c3Npb24uDQo+Pg0KPj4gQW5kIGtub3cg
SSBmaW5kIHRoYXQgdGhpcyBwYXRjaCAoZXZlbiBpbiBpdHMgdjEpIGNvbnRhaW5zIGxhbmd1
YWdlIHRoYXQNCj4+IHJldHJvYWN0aXZlbHkgbGVnaXRpbWl6ZXMgdGhlIG1nYWcyMDAgcGF0
Y2guIEkgd3JvdGUgJ2FwcGFyZW50bHknIEkgbXkNCj4+IHJlcGx5LCBhcyBJIGFzc3VtZSB0
aGF0IHRoZXJlJ3MgbW9yZSB0byBpdCwgYnV0IGhvdyBkb2VzIGl0IG5vdCBsb29rDQo+PiBs
aWtlIGFuIGF0dGVtcHQgdG8gc25lYWsgaW4gc29tZXRoaW5nIHRoYXQgaXMga25vd24gdG8g
YmUgY29udHJvdmVyc2lhbD8NCj4+DQo+IA0KPiBXaGlsZSBpcyB0cnVlIHRoYXQgdGhlIG1v
dGl2YXRpb24gZm9yIEpvY2VseW4ncyBwYXRjaCB3YXMgdG8gbWFrZSBleHBsaWNpdA0KPiB3
aGF0IGFyZSB0aGUgcnVsZXMgd2l0aCByZWdhcmQgdG8gZHJpdmVycyBlbXVsYXRpbmcgZm9y
bWF0cyAob3RoZXIgdGhhbg0KPiAid2UgaGFkIGEgZmxhbWV3YXIgb24gSVJDIGEgd2hpbGUg
YmFjayIgd2hpY2ggaXMgcXVpdGUgYW1iaWd1b3VzKSwgaXQgd2FzDQo+IG5vdCBhdHRlbXB0
IHRvIHNuZWFrIHNvbWV0aGluZyB0aGF0IGlzIGtub3duIHRvIGJlIGNvbnRyb3ZlcnNpYWwu
DQo+IA0KPiBJbiBmYWN0LCBpdCBpcyBhbiBhdHRlbXB0IHRvIGRpc3BlbCB0aGUgY29udHJv
dmVyc3kgYW5kIGRvY3VtZW50IHdoYXQgaXMNCj4gYWNjZXB0YWJsZSBhbmQgd2hhdCBpcyBu
b3QgZm9yIGEgZHJpdmVyLg0KPiANCj4+IEl0IG1pZ2h0IGhhdmUgYmVlbiBiZXR0ZXIgdG8g
ZGlzY3VzcyB0aGUgcXVlc3Rpb24gc2VwYXJhdGVseSBvbiB0aGUNCj4+IGRyaS1kZXZlbCBN
TC4gTWF5YmUgd2UgY2FuIGRvIHRoaXMgaGVyZS4NCj4+DQo+IA0KPiBUaGlzIHdhcyBkaXNj
dXNzZWQgaW4gdGhlICNkcmktZGV2ZWwgSVJDIGNoYW5uZWwsIEkgYmVsaWV2ZSB5b3Ugd2Vy
ZSBvbg0KPiBQVE8gYXQgdGhlIHRpbWUgYW5kIHByb2JhYmx5IHRoYXQncyB3aHkgeW91IG1p
c3NlZC4gSSBmb3VuZCB0aGUgbG9ncyBoZXJlOg0KPiANCj4gaHR0cHM6Ly9wZW9wbGUuZnJl
ZWRlc2t0b3Aub3JnL35jYnJpbGwvZHJpLWxvZy8/Y2hhbm5lbD1kcmktZGV2ZWwmZGF0ZT0y
MDIzLTA4LTA0DQo+IA0KPiBBcyB5b3UgY2FuIHNlZSB0aGVyZSwgbW9zdCBwZW9wbGUgYWdy
ZWVkIHRoYXQgd2hhdCBKb2NlbHluIHdyb3RlIGluIGhpcw0KPiBkb2MgcGF0Y2ggaXMgdGhl
IG1vc3QgcHJhZ21hdGljIGNvbXByb21pc2UuDQoNClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIg
dG8gdGhlIFVSTC4gUXVvdGluZyBEYW5pZWwgKHNpbWEpIGZyb20gdGhhdCANCmRpc2N1c3Np
b24uDQoNCiJpbW8ganVzdCBkb2N1bWVudCB0aGF0IGZvciBody9kcml2ZXJzIHdoZXJlIFhS
R0I4ODg4IGlzIG5vdCBzdXBwb3J0IG9yIA0KaGFzIGEgdmVyeSBiYWQgY29zdCBpbiB0ZXJt
cyBvZiB1cGxvYWQvc2Nhbm91dCBidyBpdCdzIG9rIHRvIGVtdWxhdGUgaXQgDQppbiB0aGUg
a2VybmVsIGRyaXZlciwgYnV0IF9vbmx5XyBmb3IgdGhhdCBmb3JtYXQgIg0KDQpUaGlzIHNl
ZW1zIHRoZSBvdmVyYWxsIHNlbnRpbWVudC4gSSBkaXNhZ3JlZSB3aXRoIHRoZSAiaGFzIHZl
cnkgYmFkIA0KY29zdCIgcGFydCwgdGhvdWdoLiBUaGUgY29zdC9iZW5lZml0IHJhdGlvIHNo
b3VsZCBiZSBkZXRlcm1pbmVkIGJ5IA0KdXNlcnNwYWNlIElNSE8uIFBsZWFzZSBzZWUgbXkg
cmVwbHkgdG8gUGVra2EgZm9yIHNvbWUgZGV0YWlscy4NCg0KSSBkb24ndCBoYXZlIGEgcG9p
bnRlciB0byB0aGF0IG90aGVyIElSQyBkaXNjdXNzaW9uLCBidXQgSUlSQyB0aGVyZSANCndo
ZXJlIHF1aXRlIGEgbG90IG1vcmUgcGVvcGxlIGludm9sdmVkLCBpbmNsdWRpbmcgZnJvbSB1
c2Vyc3BhY2UuIE1hbnkgDQpvZiB0aG9zZSBhcmUgYWJzZW50IGhlcmUuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJ
dm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJt
YW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------kL4kniSjwmidpH0qO4B8ElFU--

--------------v4gWos700rVQzKmu5XCcM0WX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT7KzcFAwAAAAAACgkQlh/E3EQov+BF
HxAAqPBng668BsfAJDjKr4TfHU2AtTvXYVgJmm9Xn3r8YY3+7E55zqv6l0QgMqbee2B2OnKiBKxv
Pai8OW2lLLU2lYVq6eBFnHl/V87OZiJMJAHOivaE5gS4z21kT10sAHZzg/Lcmh8Sz2weg3jeo159
RynyM4O5hJIgO1Ag3l9Pb3qR+a0yG6sFOxBuuDD+rKPeJ+992ww0laJevTHXnXwm+Xdchg1umzec
esJ6lpho5eBZOfd9S8F2M81rkJZCJpNKGs8Zng+70jmRg8sWC8bDIVFsDuUXWpV4enaTEd6YNViu
cF/pPKNkypOm2nIPuodjuG31PjXGCO1HlIFKXV7WKKrvIujQMTz1jZxdWpwq/GKUHMUDgUPq4c8u
XazGzfx9pucDFLlqE9SdJRyW8R54sM4TS7a9USdhdt2LE+Tli+N707yFA+KZ61sN6k0HF/CSNhhF
cZKo47S7s7tyX4t9F89QEZRElg38cIUpOowlvaJiURrDLbT9CYP4ROxleNoLmvJjPt6f+2wfRkJC
/uIKsXWlGorjO5GFYDgsU9uc8sZMa0MA+KGbt7ke17+WXdptLeDzWg5omp+rHBoM/kWLUocln1PF
HR2aXiFrKsau1r7eivb1nnZg9IrcrvpdvZ9w8N48thnmr24FNHjyUWHFCFoYksec798jP2xkRO67
OTs=
=Y9oz
-----END PGP SIGNATURE-----

--------------v4gWos700rVQzKmu5XCcM0WX--
