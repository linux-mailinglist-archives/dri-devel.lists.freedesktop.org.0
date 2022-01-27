Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339149DDAB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E4E10EF23;
	Thu, 27 Jan 2022 09:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAE110EF23
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:18:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A60071F76E;
 Thu, 27 Jan 2022 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643275109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6W7t61QRyEyhzyVHKUw0QNwmIWHa/l/1xTWkd5q/qcg=;
 b=r/FEfn8b1KQ1IvDE5tpA8SCjC+LIkJDu0i1ZJgX6vm7f5+BNWjmK8WaqDtajtYpU49BAlB
 NleNMyx8UyYKSqPNWMqls6xDD9z2fFV1enGRJep3GWBimKXB6fwf6bXymWu3gTiS3pww/E
 St3+pJj4cT+W6JVvyQGlRAL+HTB/GTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643275109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6W7t61QRyEyhzyVHKUw0QNwmIWHa/l/1xTWkd5q/qcg=;
 b=yMSfnMTN1XWoO9zAZUkHePN2wqTSmgGVcK368bp4514SuuMkmO/LP3qIJmEmfN7n4EJdzH
 w/PEAtIxRmaDAfDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61A2613CFB;
 Thu, 27 Jan 2022 09:18:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aIp/FmVj8mEyHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 09:18:29 +0000
Message-ID: <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
Date: Thu, 27 Jan 2022 10:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220127082058.434421-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220127082058.434421-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2ezGz5HvJ4Oa2La6dLfwNVvT"
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2ezGz5HvJ4Oa2La6dLfwNVvT
Content-Type: multipart/mixed; boundary="------------OFM0Z9Njajkj0EiJ3vAOi5sp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Message-ID: <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
References: <20220127082058.434421-1-javierm@redhat.com>
In-Reply-To: <20220127082058.434421-1-javierm@redhat.com>

--------------OFM0Z9Njajkj0EiJ3vAOi5sp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyLA0KDQp0aGFua3MgZm9yIHRoaXMgcGF0Y2guDQoNCkFja2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KRmluZCBzb21lIGlkZWFz
IGZvciBjb25zaWRlcmF0aW9uIGJlbG93Lg0KDQpBbSAyNy4wMS4yMiB1bSAwOToyMCBzY2hy
aWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4gVGhlIExpbnV4IERSTSBzdWJzeXN0
ZW0gc3VwcG9ydHMgY29tcGxleCBncmFwaGljcyBkZXZpY2VzIGFuZCBpdCBjb3VsZCBiZQ0K
PiBxdWl0ZSBvdmVyd2hlbG1pbmcgZm9yIG5ld2NvbWVycyB0byBsZWFybiBhYm91dCB0aGUg
c3Vic3lzdGVtJ3MgaW50ZXJuYWxzLg0KPiANCj4gVGhlcmUgYXJlIGxvdHMgb2YgdXNlZnVs
IHRhbGtzLCBzbGlkZXMgYW5kIGFydGljbGVzIGF2YWlsYWJsZSB0aGF0IGNhbiBiZQ0KPiB1
c2VkIHRvIGdldCBmYW1pbGlhciB3aXRoIHRoZSBuZWVkZWQgY29uY2VwdHMgYW5kIGVhc2Ug
dGhlIGxlYXJuaW5nIGN1cnZlLg0KPiANCj4gQWRkIGEgc2VjdGlvbiB0byB0aGUgaW50cm8g
dGhhdCBjb250YWlucyB0aGVzZSBEUk0gaW50cm9kdWN0b3J5IG1hdGVyaWFscy4NCj4gDQo+
IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJl
ZGhhdC5jb20+DQo+IC0tLQ0KPiANCj4gICBEb2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rp
b24ucnN0IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9k
dWN0aW9uLnJzdA0KPiBpbmRleCAyNWE1NmU5YzBjZmQuLjM1OTg2Nzg0ZjkxNiAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvaW50cm9kdWN0aW9uLnJzdA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2dwdS9pbnRyb2R1Y3Rpb24ucnN0DQo+IEBAIC0xMTIsMyArMTEyLDM5
IEBAIFBsZWFzZSBjb25kdWN0IHlvdXJzZWxmIGluIGEgcmVzcGVjdGZ1bCBhbmQgY2l2aWxp
c2VkIG1hbm5lciB3aGVuDQo+ICAgaW50ZXJhY3Rpbmcgd2l0aCBjb21tdW5pdHkgbWVtYmVy
cyBvbiBtYWlsaW5nIGxpc3RzLCBJUkMsIG9yIGJ1Zw0KPiAgIHRyYWNrZXJzLiBUaGUgY29t
bXVuaXR5IHJlcHJlc2VudHMgdGhlIHByb2plY3QgYXMgYSB3aG9sZSwgYW5kIGFidXNpdmUN
Cj4gICBvciBidWxseWluZyBiZWhhdmlvdXIgaXMgbm90IHRvbGVyYXRlZCBieSB0aGUgcHJv
amVjdC4NCj4gKw0KPiArTGVhcm5pbmcgbWF0ZXJpYWwNCj4gKz09PT09PT09PT09PT09PT09
DQoNCk1heWJlICdFeHRlcm5hbCBSZWZlcmVuY2VzJy4NCg0KPiArDQo+ICtTaW5jZSB0aGUg
TGludXggRFJNIGxheWVyIHN1cHBvcnRzIGNvbXBsZXggZ3JhcGhpY3MgZGV2aWNlcywgaXQg
Y2FuIGJlIHF1aXRlDQo+ICtvdmVyd2hlbG1pbmcgZm9yIG5ld2NvbWVycyB0byBnZXQgZmFt
aWxpYXIgd2l0aCBhbGwgdGhlIG5lZWRlZCBjb25jZXB0cyBhbmQNCj4gK2xlYXJuIHRoZSBz
dWJzeXN0ZW0ncyBpbnRlcm5hbHMuDQoNCkl0IHNvdW5kcyBhIGJpdCBpbnRpbWRhdGluZyB0
byBtZS4gQ2FuIHdlIGdpdmUgaXQgYSBwb3NpdGl2ZSBzcGluPw0KDQpJTUhPIHdlIGNvdWxk
IGFkZCBhIHNlcGFyYXRlIHNlY3Rpb24gdGhhdCB0YWxrcyBhYm91dCBjb21wbGV4aXR5IGFu
ZCANCnByb3ZpZGVzIGd1aWRlbGluZXMgYWJvdXQgaG93IHRvIGRlYWwgd2l0aCBpdDogIHRy
aXZpYWwgSFc/IHVzZSBzaW1wbGUgDQpwaXBlOyAgZGVkaWNhdGVkIFZSQU0/IHRyeSBUVE07
ICBhd2t3YXJkIGNvbG9yIGZvcm1hdHM/ICBzZWUgDQpkcm1fZm9ybWF0X2hlbHBlci5jDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKw0KPiArVG8gc2hhbGxvdyB0aGUgbGVhcm5p
bmcgY3VydmUsIHRoaXMgc2VjdGlvbiBjb250YWlucyBhIGxpc3Qgb2YgcHJlc2VudGF0aW9u
cw0KPiArYW5kIGRvY3VtZW50cyB0aGF0IGNhbiBiZSB1c2VkIHRvIGxlYXJuIGFib3V0IERS
TS9LTVMgYW5kIGdyYXBoaWNzIGluIGdlbmVyYWwuDQo+ICsNCj4gK1RoZSBsaXN0IGlzIHNv
cnRlZCBpbiByZXZlcnNlIGNocm9ub2xvZ2ljYWwgb3JkZXIsIHRvIGtlZXAgdGhlIG1vc3Qg
dXAtdG8tZGF0ZQ0KPiArbWF0ZXJpYWwgYXQgdGhlIHRvcC4gQnV0IGFsbCBvZiB0aGVtIGNv
bnRhaW4gdXNlZnVsIGluZm9ybWF0aW9uLCBhbmQgaXQgY2FuIGJlDQo+ICt2YWx1YWJsZSB0
byBnbyB0aHJvdWdoIG9sZGVyIG1hdGVyaWFsIHRvIHVuZGVyc3RhbmQgdGhlIHJhdGlvbmFs
ZSBhbmQgY29udGV4dA0KPiAraW4gd2hpY2ggdGhlIHJlY2VudCBjaGFuZ2VzIHRvIHRoZSBE
Uk0gc3Vic3lzdGVtIHdlcmUgbWFkZS4NCj4gKw0KPiArVGFsa3MNCj4gKy0tLS0tDQo+ICsN
Cj4gKyogYEFuIE92ZXJ2aWV3IG9mIHRoZSBMaW51eCBhbmQgVXNlcnNwYWNlIEdyYXBoaWNz
IFN0YWNrIDxodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PXdqQUptcXdnNDdrPmBf
IC0gUGF1bCBLb2NpYWxrb3dza2kgKDIwMjApDQo+ICsqIGBHZXR0aW5nIHBpeGVscyBvbiBz
Y3JlZW4gb24gTGludXg6IGludHJvZHVjdGlvbiB0byBLZXJuZWwgTW9kZSBTZXR0aW5nIDxo
dHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PWhhZXM0X1huYzVRPmBfIC0gU2ltb24g
U2VyICgyMDIwKQ0KPiArKiBgQW4gaW50cm9kdWN0aW9uIHRvIHRoZSBMaW51eCBEUk0gc3Vi
c3lzdGVtIDxodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PUxiRE9DSmNEUm9vPmBf
IC0gTWF4aW1lIFJpcGFyZCAoMjAxNykNCj4gKyogYEVtYnJhY2UgdGhlIEF0b21pYyAoRGlz
cGxheSkgQWdlIDxodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PUxqaUJfSmVEbjJN
PmBfIC0gRGFuaWVsIFZldHRlciAoMjAxNikNCj4gKyogYEFuYXRvbXkgb2YgYW4gQXRvbWlj
IEtNUyBEcml2ZXIgPGh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9bGlocVI5c0VO
cGM+YF8gLSBMYXVyZW50IFBpbmNoYXJ0ICgyMDE1KQ0KPiArKiBgQXRvbWljIE1vZGVzZXR0
aW5nIGZvciBEcml2ZXJzIDxodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PWtsOXN1
RmdiVGM4PmBfIC0gRGFuaWVsIFZldHRlciAoMjAxNSkNCj4gKyogYEFuYXRvbXkgb2YgYW4g
RW1iZWRkZWQgS01TIERyaXZlciA8aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1K
YThmTTdyVGFlND5gXyAtIExhdXJlbnQgUGluY2hhcnQgKDIwMTMNCj4gKw0KPiArU2xpZGVz
IGFuZCBhcnRpY2xlcw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICsqIGBVbmRl
cnN0YW5kaW5nIHRoZSBMaW51eCBHcmFwaGljcyBTdGFjayA8aHR0cHM6Ly9ib290bGluLmNv
bS9kb2MvdHJhaW5pbmcvZ3JhcGhpY3MvZ3JhcGhpY3Mtc2xpZGVzLnBkZj5gXyAtIEJvb3Rs
aW4gKDIwMjIpDQo+ICsqIGBEUk0gS01TIG92ZXJ2aWV3IDxodHRwczovL3dpa2kuc3QuY29t
L3N0bTMybXB1L3dpa2kvRFJNX0tNU19vdmVydmlldz5gXyAtIFNUTWljcm9lbGVjdHJvbmlj
cyAoMjAyMSkNCj4gKyogYExpbnV4IGdyYXBoaWMgc3RhY2sgPGh0dHBzOi8vc3R1ZGlvcGl4
bC5jb20vMjAxNy0wNS0xMy9saW51eC1ncmFwaGljLXN0YWNrLWFuLW92ZXJ2aWV3PmBfIC0g
TmF0aGFuIEdhdcOrciAoMjAxNykNCj4gKyogYFRoZSBEUk0vS01TIHN1YnN5c3RlbSBmcm9t
IGEgbmV3Ymll4oCZcyBwb2ludCBvZiB2aWV3IDxodHRwczovL2Jvb3RsaW4uY29tL3B1Yi9j
b25mZXJlbmNlcy8yMDE0L2VsY2UvYnJlemlsbG9uLWRybS1rbXMvYnJlemlsbG9uLWRybS1r
bXMucGRmPmBfIC0gQm9yaXMgQnJlemlsbG9uICgyMDE0KQ0KPiArKiBgQSBicmllZiBpbnRy
b2R1Y3Rpb24gdG8gdGhlIExpbnV4IGdyYXBoaWNzIHN0YWNrIDxodHRwczovL2Jsb2dzLmln
YWxpYS5jb20vaXRvcmFsLzIwMTQvMDcvMjkvYS1icmllZi1pbnRyb2R1Y3Rpb24tdG8tdGhl
LWxpbnV4LWdyYXBoaWNzLXN0YWNrLz5gXyAtIElhZ28gVG9yYWwgKDIwMTQpDQo+ICsqIGBU
aGUgTGludXggR3JhcGhpY3MgU3RhY2sgPGh0dHBzOi8vYmxvZy5tZWNoZXllLm5ldC8yMDEy
LzA2L3RoZS1saW51eC1ncmFwaGljcy1zdGFjay8+YF8gLSBKYXNwZXIgU3QuIFBpZXJyZSAo
MjAxMikNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------OFM0Z9Njajkj0EiJ3vAOi5sp--

--------------2ezGz5HvJ4Oa2La6dLfwNVvT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyY2QFAwAAAAAACgkQlh/E3EQov+B7
mRAAuZQTmYf8C5O2uYTfCjtibkbbDNcbYaOPATwj3L7m3DQ7kPIrs+grLvcRiE3eUJ29TZyiCPOw
HGnKGLZx96XnA7xH20Mf/cY8AIRfq0l7UVjZdM71M7D1RoUqD8nBl5EkHh6JV1BmLVJDuxwARYpe
ipx6WQHspx4AQoe4xzp8J46TnBR+KZqroo5+gAh3dUX6j0+XkjPgIQXvI6IvF0NrtOKLI7KpOo21
w9BMfc+fxTfwZVcs6G+JTsK42fmSTYxptD9nv/MYC3jzlc46I0g6S9j4Ilbgqw70JNK9FL3urSXy
k9Jhn1prif8pG58vEgOnrqXIwV/z4VjQa/jHgwY0RlmlKktfRBf+1gYkayB0EjIRSIv6DBTyUvQw
vO2qEwlPLhHzSbaO3dAVlKhfx8wRaMlCFy+bqKyvNhqwvlEuDe/RbQyl8mByeEMuVqC/+pNC0/oL
/EUUf8EHKXJe97svMboJO9jzmkic+fkmXK7zy0tc2wnHwSSpg0I4El2uNZ842CZoBPQKPP5LTcCe
eKkOZR5TGrZw0EOvZkmCfBln0YosTmk2JoHx/dDlhFdgvguzBbO91+F6jof/ZoS9RxS+9lNHTmRQ
EP6bHvM7AkYCp+XAazV6Qt85OAllc53LAPvuxtTapOrxGo71B7Gd8Gj+Ol4fd6sLhyDcsmQLueS1
JO4=
=TliH
-----END PGP SIGNATURE-----

--------------2ezGz5HvJ4Oa2La6dLfwNVvT--
