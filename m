Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2365677EE4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1210E4C1;
	Mon, 23 Jan 2023 15:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240510E4B5;
 Mon, 23 Jan 2023 15:13:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EAC6A1F385;
 Mon, 23 Jan 2023 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674486783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y7s2k4nVNeYZVfQtixF4ifDGsZIN+ioW8psQX99vQZg=;
 b=wSSaF37CvNUxCx4zqI+4pGb8EpNmhdrc9hikvBW5pPuCEgOO87WA63KSCJQr8hkn2PiOV+
 E6DGg+pSiQRO/Lt/eIf8F07Q87p+j+1NEw3dpZ5J11jx0c1HNDDArg7slxGRCIOt7cypm/
 9Is22il8o0kViJ8nyWrZR6Ms4IyxzZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674486783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y7s2k4nVNeYZVfQtixF4ifDGsZIN+ioW8psQX99vQZg=;
 b=ebf58eVw2E4KRO4im7ugdF+1g3t+j6gsvCzPOigl9KuSomPwKdvVh3ID+i9HFHS1+OnAjB
 emRqPuJa1QU+1nAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC05B1357F;
 Mon, 23 Jan 2023 15:13:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e4TVLP+jzmOVTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 15:13:03 +0000
Message-ID: <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
Date: Mon, 23 Jan 2023 16:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bmFixg2Fd3puNibEx0JtuBMA"
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
Cc: tvrtko.ursulin@linux.intel.com, dim-tools@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bmFixg2Fd3puNibEx0JtuBMA
Content-Type: multipart/mixed; boundary="------------nYVfY8g1R5sxzzbIFUoizS98";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: tvrtko.ursulin@linux.intel.com, dim-tools@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Message-ID: <43ed96bc-5a70-ba61-1959-fcb2fe86387e@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <Y8kDk5YX7Yz3eRhM@linux-uq9g>
 <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>
In-Reply-To: <0df23fe5-40cb-c5f3-33e1-da57a7b23808@physik.fu-berlin.de>

--------------nYVfY8g1R5sxzzbIFUoizS98
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjMgdW0gMTY6MDAgc2NocmllYiBKb2huIFBhdWwgQWRyaWFuIEds
YXViaXR6Og0KPiBIaSBUaG9tYXMhDQo+IA0KPj4gRHJpdmVyIENoYW5nZXM6DQo+Pg0KPj4g
wqAqIFJlbW92ZSBvYnNvbGV0ZSBkcml2ZXJzIGZvciB1c2Vyc3BhY2UgbW9kZXNldHRpbmcg
aTgxMCwgbWdhLCByMTI4LA0KPj4gwqDCoCBzYXZhZ2UsIHNpcywgdGRmeCwgdmlhDQo+IA0K
PiBJcyB0aGUgUmFnZSAxMjggR1BVIHN0aWxsIHN1cHBvcnRlZCB2aWEgdGhlIGdlbmVyaWMg
bW9kZXNldHRpbmcgZHJpdmVyPw0KPiANCj4gSSdtIGFza2luZyBiZWNhdXNlLCB3ZSdyZSBz
dGlsbCBzdXBwb3J0aW5nIFBvd2VyTWFjcyBpbiBEZWJpYW4gUG9ydHMgb2YgDQo+IHdoaWNo
DQo+IHNvbWUgb2YgdGhvc2UgYXJlIHNwb3J0aW5nIGEgUmFnZSAxMjggR1BVLiBTaW1pbGFy
IHF1ZXN0aW9uIGFwcGxpZXMgdG8gdGhlDQo+IGk4MTAgR1BVIHVzZWQgaW4gc29tZSBvbGQg
VGhpbmtQYWRzLCBmb3IgZXhhbXBsZS4NCg0KWWVzLCBhbGwgb2YgdGhvc2UgY2hpcHMgYXJl
IHN0aWxsIHN1cHBvcnRlZCBieSB0aGUgZ2VuZXJpYyBtb2Rlc2V0dGluZyANCmRyaXZlcnMg
YW5kIGV2ZW4gdGhlIG9sZCB1c2Vyc3BhY2UgWG9yZyBkcml2ZXJzLiBUaGUgb25seSB0aGlu
ZyB0aGF0IGlzIA0Kbm90IHN1cHBvcnRlZCBhbnkgbG9uZ2VyIGlzIGhhcmR3YXJlLWFjY2Vs
ZXJhdGVkIDNkIHJlbmRlcmluZy4gSG93ZXZlciwgDQp0aGlzIGhhcyBub3Qgd29ya2VkIGFu
eXdheSwgYXMgTWVzYSBoYXMgZHJvcHBlZCBzdXBwb3J0IGZvciB0aG9zZSBjaGlwcyANCmEg
bG9uZyB0aW1lIGFnby4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtz
LA0KPiBBZHJpYW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------nYVfY8g1R5sxzzbIFUoizS98--

--------------bmFixg2Fd3puNibEx0JtuBMA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPOo/8FAwAAAAAACgkQlh/E3EQov+AO
0A/+MMA6ljscgMoBsCtXdVeLO51P4Tcc6qNn0HkmDCh5h+3ZpTaLSPqwTQaysL1SuxjdrXJqm37g
RRQ44SmCrdfclK8lgqNnJThK7GwrSUmxBJTztVHoMFlD6qltblkNGujlAPvDqIglSioxTmYEQghk
2M4O3P0/NM1Zyxu1ApOk6B9xJmjo90jFpnf7zJdzq8m9DcyzPRzyemyd2TsCiqo2CGo2ZHUOXoQZ
uPawqWkEiQ0qIXPWTUyuztbfVjMEk8Rp1/gIc21Ty9LS/brXc06OSfS2ebGeNJpPNJizetF/J+vE
ttVGgaR/IsQBBlqTe6CqoS+ythcTSolzwbRgyiKIu4ZwAP9FOlADs87WU7zcoEjPZl5NS7XdLCUb
wJn2GSzNU51lX/0Jy7qKIK43WyYs/ARxvGz1MCKNhcBjo/WpkgNamycrwNx81kBNXjGHSt2IB3bD
olmEUcVNC6WrjZFNAePkEl3fWWkiDzfJWS/A0e0YHqfQtwxGG6oTAGct+kcPB5eqICQnQlazIaNU
xeoItRh71q+rExMC+lyEPyJsgO0HGwVhkbMjC+v3FW8vYenFFkSaOAGDjsu5InR6MXHY2ZD778s3
LDneOY4snyDkIZel6J4HLWKvVsDx9NZIZCANEIclA8+No9L3rTqeXD3TI2+nMIsAYilVJgW4U2Uz
I4k=
=zevA
-----END PGP SIGNATURE-----

--------------bmFixg2Fd3puNibEx0JtuBMA--
