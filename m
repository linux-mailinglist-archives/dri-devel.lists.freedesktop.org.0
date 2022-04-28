Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B385C512DB5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C2C10E515;
	Thu, 28 Apr 2022 08:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79210E515
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:05:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C11211F88A;
 Thu, 28 Apr 2022 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651133114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=98oHi700xFOE02Vfn35dIwzesf4K3FljW87BzHJLrQU=;
 b=fQhuQ2AbAnE1rRzJrjxkZfleHvwI0UivAXv2yhV069POMNFwFmtBgjvuOdpBKiYsiuAnFF
 e1JMUtswDgXIG0CMgfiYYgveoQJkji8AB7PYvMBGTtuNJuru8J2WQ5/ZFOB7MRQRZsR4ax
 DCvv6VLzFxlopelnT5PadpfxpS5sIjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651133114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=98oHi700xFOE02Vfn35dIwzesf4K3FljW87BzHJLrQU=;
 b=6FcnaTQlmCIMgFemIbEhNxQMu+kfVDrobPwD6SwNuojCE4QEpHcOwY1uK24q3E9zZQZuLX
 YvdXMN1mtXgKv+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F59D13AF8;
 Thu, 28 Apr 2022 08:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RpjOJbpKamJ2IgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 08:05:14 +0000
Message-ID: <7cccce3d-b154-0a9c-31bd-f41f998300da@suse.de>
Date: Thu, 28 Apr 2022 10:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
 <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mvVyOA8ZAtO3EHbb06WV8lLg"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mvVyOA8ZAtO3EHbb06WV8lLg
Content-Type: multipart/mixed; boundary="------------hYgqoZl4rysfPenpEgA0cNW2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <7cccce3d-b154-0a9c-31bd-f41f998300da@suse.de>
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
 <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
In-Reply-To: <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>

--------------hYgqoZl4rysfPenpEgA0cNW2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjIEphbmkgYW5kIEx5dWRlKQ0KDQpBbSAyOC4wNC4yMiB1bSAwOTo1MiBzY2hyaWViIEph
dmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4gT24gNC8yOC8yMiAwOTo0NSwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4+IFlvdSBjYW5ub3Qgc2Vs
ZWN0IERJU1BMQVlfRFBfSEVMUEVSIHdpdGhvdXQgRElTUExBWV9IRUxQRVIuDQo+Pj4+DQo+
Pj4NCj4+PiBUaGF0IHdhcyBteSBvcmlnaW5hbCB0aG91Z2h0IGFzIHdlbGwgYW5kIHdoYXQg
ZGlkIGluIHYxLCBidXQgdGhlbiBJIG5vdGljZWQNCj4+PiB0aGF0IGRvaW5nIHRoYXQgaXQg
d291bGQgZm9yY2UgRFJNX0RJU1BMQVlfSEVMUEVSIHRvIGJlIHNldCBhcyBidWlsdC1pbiBh
bmQNCj4+PiBub3QgYWxsb3cgdG8gYmUgYnVpbHQgYXMgYSBtb2R1bGUuDQo+Pg0KPj4gSXQg
d2FzIGEgcmhldG9yaWNhbCBvbmx5LiBJIGRpZG4ndCBtZWFuIHRvIGFjdHVhbGx5IHNldCBE
SVNQTEFZX0hFTFBFUi4NCj4+DQo+IA0KPiBBaCwgc29ycnkgZm9yIG1pc3VuZGVyc3RhbmRp
bmcuDQo+IA0KPj4+ICAgIA0KPj4+PiBDYW4ndCB5b3Ugc2ltcGx5IG1ha2UgaXQgZGVwZW5k
IG9uIERJU1BMQVlfRFBfSEVMUEVSLiAgVGhlIG1lbnUgZW50cnkNCj4+Pj4gd2lsbCBzaG93
IHVwIGFzIHNvb24gYXMgdGhlcmUncyBhIGRyaXZlciB0aGF0IHNlbGNldHMgRElTUExBWV9E
UF9IRUxQRVIuDQo+Pj4+DQo+Pj4NCj4+PiBJIGNvdWxkIGJ1dCB0aGVuIHRoYXQgbWVhbnMg
dGhhdCBvbmNlIHdvbid0IGJlIGFibGUgdG8gc2VsZWN0IHRoZXNlIHR3byBjb25maWcNCj4+
PiBvcHRpb25zIHVubGVzcyBzb21lIGVuYWJsZSBzeW1ib2wgc2VsZWN0cyBEUk1fRElTUExB
WV9EUF9IRUxQRVIuDQo+Pj4NCj4+PiBJbiBteSBvcGluaW9uLCBEUk1fRFBfQVVYX0NIQVJE
RVYgYW5kIERSTV9EUF9DRUMgYXJlIGRpZmZlcmVudCB0aGFuIGFsbCBvdGhlcg0KPj4+IG9w
dGlvbnMgdGhhdCBzZWxlY3QgRFJNX0RJU1BMQVlfRFBfSEVMUEVSLCBzaW5jZSB0aG9zZSBh
cmUgZHJpdmVycyBhbmQgd2FudCB0bw0KPj4+IGhhdmUgYm90aCBEUk1fRElTUExBWV9EUF9I
RUxQRVIgYW5kIERSTV9ESVNQTEFZX0hFTFBFUiBzZXQuDQo+Pj4NCj4+PiBCdXQgRFJNX0RQ
X0FVWF9DSEFSREVWIGFuZCBEUk1fRFBfQ0VDIGFyZSBqdXN0IGluY2x1ZGVkIGluIGRybV9k
aXNwbGF5X2hlbHBlci5vDQo+Pj4gaWYgZW5hYmxlZCwgYW5kIGRlcGVuZCBvbiBzeW1ib2xz
IHRoYXQgYXJlIHByZXNlbnQgaWYgQ09ORklHX0RSTV9ESVNQTEFZX0RQX0hFTFBFUg0KPj4+
IGlzIGVuYWJsZWQuIFNvIGp1c3QgbmVlZCB0aGUgbGF0dGVyLCBpZiBEUk1fRElTUExBWV9I
RUxQRVIgaXMgbm90IGVuYWJsZWQgdGhlbiBpdA0KPj4+IHdpbGwganVzdCBiZSBhIG5vLW9w
Lg0KPj4+DQo+Pj4gSGF2aW5nIHdyaXR0ZW4gdGhhdCB0aG91Z2ggSSBub3RpY2VkIHRoYXQg
YSAiZGVwZW5kcyBvbiBEUk1fRElTUExBWV9IRUxQRVIiIG1ha2VzDQo+Pj4gc2Vuc2UuIElm
IHlvdSBhZ3JlZSBJIGNhbiBhZGQgaXQgYW5kIHBvc3QgYSB2My4NCj4+DQo+PiBZZXMgcGxl
YXNlLiAgVGhlc2Ugb3B0aW9ucyBlbmFibGUgZmVhdHVyZXMgb2YgdGhlIERQIGNvZGUuIElm
IHRoZXJlJ3Mgbm8NCj4+IGRyaXZlciB3aXRoIERQLCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
dG8gYWxsb3cgdGhlbS4NCj4+DQo+PiBJIGtub3cgdGhhdCB0aGVyZSBjb3VsZCBiZSBhbiBv
ZGQgc2l0dWF0aW9uIHdoZXJlIHVzZXJzcGFjZSBtaWdodCBub3QNCj4+IGhhdmUgRFAsIGJ1
dCBzdGlsbCB3YW50cyB0aGUgY2hhcmRldiBmaWxlIG9mIGF1eCBidXMuICBCdXQgdGhhdA0K
Pj4gc2l0dWF0aW9uIGV4aXN0ZWQgYWxyZWFkeSB3aGVuIHRoZSBjb2RlIHdhcyBsb2NhdGVk
IHdpdGhpbiBLTVMgaGVscGVycy4NCj4+DQo+IA0KPiBBZ3JlZWQuDQo+IA0KPj4+DQo+Pj4g
Tm93LCBwb25kZXJpbmcgbW9yZSBhYm91dCB0aGlzIGlzc3VlLCBwcm9iYWJseSB0aGUgbW9z
dCBjb3JyZWN0IHRoaW5nIHRvIGRvIGlzIGZvcg0KPj4+IHRoZSBkcml2ZXJzIHRoYXQgbWFr
ZSB1c2Ugb2YgdGhlIHN5bWJvbHMgZXhwb3J0ZWQgYnkgRFJNX0RQX3tBVVhfQ0hBUkRFVixD
RUN9IHRvDQo+Pj4gc2VsZWN0IHRoZXNlLiBXaGF0IGRvIHlvdSB0aGluayA/DQo+Pg0KPj4g
VGhhdCdzIG5vdCBjb25zaWRlcmVkIGdvb2Qgc3R5bGUuIFNlbGVjdCBzaG91bGQgbm90IGJl
IHVzZWQgZm9yIGFueXRoaW5nDQo+PiB0aGF0IGlzIHVzZXItY29uZmlndXJhYmxlLiBbMV0N
Cj4+DQo+IA0KPiBSaWdodC4gU28gZ2l2aW5nIGV2ZW4gbW9yZSB0aG91Z2h0IHRvIHRoaXMs
IG5vdyBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIGp1c3QgaW5jbHVkZQ0KPiBkcm1fZHBfYXV4
X2Rldi5vLCBkcm1fZHBfY2VjLm8gKGFuZCBwcm9iYWJseSBkcm1fZHBfYXV4X2J1cy5vPykg
dW5jb25kaXRpb25hbGx5IHRvDQo+IGRybV9kaXNwbGF5X2hlbHBlci0kKENPTkZJR19EUk1f
RElTUExBWV9EUF9IRUxQRVIpLg0KPiANCj4gQWZ0ZXIgYWxsLCB0aGVzZSBhcmUgbm90IGJp
ZyBvYmplY3RzIGFuZCBkcm1fZGlzcGxheV9oZWxwZXIgY2FuIG5vdyBiZSBidWlsdCBhcyBt
b2R1bGUuDQo+IA0KPiBJIGRvbid0IHNlZSB0aGF0IG11Y2ggdmFsdWUgdG8gaGF2ZSBzZXBh
cmF0ZSB1c2VyLWNvbmZpZ3VyYWJsZSBjb25maWcgb3B0aW9ucy4uLg0KPiANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------hYgqoZl4rysfPenpEgA0cNW2--

--------------mvVyOA8ZAtO3EHbb06WV8lLg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqSroFAwAAAAAACgkQlh/E3EQov+CY
UA//f3AJes9k2c+Wi4Qj/QhKkmBa3dWRAxIUNk6V+4sRVBHdnFzHyVCybNuCj0zM+MWM1AOw9PiC
vPSjX0zA4IOM608gt6vyy8T9IBLey6CdidYEoHiJ0ASokLvRR29/Tw4TN6nbHvUo6+gBogCk7U5Y
5J6t/BUCz1EmXVRc+IT8dynf4bFaZiqn2SQA7Ca6xJeqimKTrXw8j+Fl9Rd6rtgW7cDjHeW6zj22
9shl1dIQ6kxgQhJXoiXxrtsxlfiLkfi/w0JSZhgUzF2n2BNYW6sZGsA3rpUVuUFZCfqb1hcxKH9R
+GQC4yUSTyXmiRz2cB9n9MBizBSkmF5020Zs+EjgAgp9/vaTu2lXHT7dnJZDfxlGIiuqojqnTG6d
upsM9lwpOIvl4K6nWqfpv+Oqs66w+xg3r8YI+BKJvikj148NaSHxgLr15NV/czs1Zg2eEAXJeDqa
OPnHXoJrbIR8gR3ROvWHKehzNAMn77ERQGKNlJr4XAhnd0yXMeR4A+5iYKVWz3oVlL5a9Vgv9R5W
SNkxT3jt1nUoFZn2uZt9KAnkNydj9226k3BtL93vDIswT+A2QggA/VDSQRcoIpeRVKI7KOulhKpB
UzKkq9m48k+lSOcyby4HSXjXdZbYD27iT3gnOuLgztSz+KvIZdulEPt8wyq0n9CjC1PH7mnXIQ65
j1Q=
=eWAz
-----END PGP SIGNATURE-----

--------------mvVyOA8ZAtO3EHbb06WV8lLg--
