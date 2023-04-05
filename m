Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC16D750B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7D10E849;
	Wed,  5 Apr 2023 07:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE82510E845;
 Wed,  5 Apr 2023 07:13:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F26FE204F8;
 Wed,  5 Apr 2023 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680678812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6nwM3LCDtVXMYz5k9qTAErXpLxm41nHq1feYI8c6PM=;
 b=i8MdvOj2wZonI8sutQRhQOmdbmjQrTOuiVXJ4f8oKXAVMOB+TNdb9+ylfzmWcSpjst2Z8M
 MU8HBHaG20Z1eb/jhPzOFq9R5WU2E4gj6kWhhqwc+B4L4iLdkdxYwj8GMWPh+oz5KoqheD
 m6MiBaC7RV5QHS8p3UDT+dCwye9jU6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680678812;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6nwM3LCDtVXMYz5k9qTAErXpLxm41nHq1feYI8c6PM=;
 b=LCDYewlS70zPGwZwmnEvlVRShMrFQGUcRZTjiTCGZHEjwcjjG+yenOnssu3LmhMvxWJd5n
 B+CguhbcnE8X03CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCF3D13A31;
 Wed,  5 Apr 2023 07:13:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8lM5LZsfLWR7GAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 07:13:31 +0000
Message-ID: <92ed4d8f-d233-2ecf-3330-7920fcd3b01b@suse.de>
Date: Wed, 5 Apr 2023 09:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EuP4jWJn1oMAEScGkWgZTmyl"
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EuP4jWJn1oMAEScGkWgZTmyl
Content-Type: multipart/mixed; boundary="------------9dH0JSXrR3e8BvAVls5aqKlt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <92ed4d8f-d233-2ecf-3330-7920fcd3b01b@suse.de>
Subject: Re: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
In-Reply-To: <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>

--------------9dH0JSXrR3e8BvAVls5aqKlt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjA0LjIzIHVtIDAzOjM1IHNjaHJpZWIgRG1pdHJ5IEJhcnlzaGtvdjoNCj4g
DQo+IE9uIE1vbiwgMDMgQXByIDIwMjMgMTQ6NDU6MzAgKzAyMDAsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4gQ29udmVydCBtc20nIGZiZGV2IGNvZGUgdG8gc3RydWN0IGRybV9j
bGllbnQuIFJlcGxhY2VzIHRoZSBjdXJyZW50DQo+PiBhZC1ob2MgaW50ZWdyYXRpb24uIFRo
ZSBjb252ZXJzaW9uIGluY2x1ZGVzIGEgbnVtYmVyIG9mIGNsZWFudXBzLiBBcw0KPj4gd2l0
aCBtb3N0IG90aGVyIGRyaXZlcnMnIGZiZGV2IGVtdWxhdGlvbiwgZmJkZXYgaW4gbXNtIGlz
IG5vdyBqdXN0DQo+PiBhbm90aGVyIERSTSBjbGllbnQgdGhhdCBydW5zIGFmdGVyIHRoZSBE
Uk0gZGV2aWNlIGhhcyBiZWVuIHJlZ2lzdGVyZWQuDQo+Pg0KPj4gT25jZSBhbGwgZHJpdmVy
cycgZmJkZXYgZW11bGF0aW9uIGhhcyBiZWVuIGNvbnZlcnRlZCB0byBzdHJ1Y3QgZHJtX2Ns
aWVudCwNCj4+IHdlIGNhbiBhdHRlbXB0IHRvIGFkZCBhZGRpdGlvbmFsIGluLWtlcm5lbCBj
bGllbnRzLiBBIERSTS1iYXNlZCBkbWVzZw0KPj4gbG9nIG9yIGEgYm9vdHNwbGFzaCBhcmUg
Y29tbW9ubHkgbWVudGlvbmVkLiBEUk0gY2FuIHRoZW4gc3dpdGNoIGVhc2lseQ0KPj4gYW1v
bmcgdGhlIGV4aXN0aW5nIGNsaWVudHMgaWYvd2hlbiByZXF1aXJlZC4NCj4+DQo+PiBbLi4u
XQ0KPiANCj4gQXBwbGllZCwgdGhhbmtzIQ0KDQpHcmVhdCwgdGhhbmtzIGEgbG90IQ0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBbMS84XSBkcm0vbXNtOiBJbmNsdWRlIDxs
aW51eC9pby5oPg0KPiAgICAgICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2x1
bWFnL21zbS8tL2NvbW1pdC82MmM1OGZmZTAxMWQNCj4gWzIvOF0gZHJtL21zbTogQ2xlYXIg
YXBlcnR1cmUgb3duZXJzaGlwIG91dHNpZGUgb2YgZmJkZXYgY29kZQ0KPiAgICAgICAgaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2x1bWFnL21zbS8tL2NvbW1pdC9mNGRlMTZk
YTViNDANCj4gWzMvOF0gZHJtL21zbTogUmVtb3ZlIGZiIGZyb20gc3RydWN0IG1zbV9mYmRl
dg0KPiAgICAgICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2x1bWFnL21zbS8t
L2NvbW1pdC9hNWRkYzBmMWE3YmMNCj4gWzQvOF0gZHJtL21zbTogUmVtb3ZlIHN0cnVjdCBt
c21fZmJkZXYNCj4gICAgICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9sdW1h
Zy9tc20vLS9jb21taXQvMDljYmRiYWZiZTlmDQo+IFs1LzhdIGRybS9tc206IFJlbW92ZSBm
YmRldiBmcm9tIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUNCj4gICAgICAgIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9sdW1hZy9tc20vLS9jb21taXQvMzdlOGJhZDNhZTVkDQo+
IFs2LzhdIGRybS9tc206IE1vdmUgbW9kdWxlIHBhcmFtZXRlciAnZmJkZXYnIHRvIGZiZGV2
IGNvZGUNCj4gICAgICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9sdW1hZy9t
c20vLS9jb21taXQvMmZhNDc0OGI1YWQ4DQo+IFs3LzhdIGRybS9tc206IEluaXRpYWxpemUg
ZmJkZXYgRFJNIGNsaWVudA0KPiAgICAgICAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2x1bWFnL21zbS8tL2NvbW1pdC83ZTU2MzUzOGQyMTANCj4gWzgvOF0gZHJtL21zbTog
SW1wbGVtZW50IGZiZGV2IGVtdWxhdGlvbiBhcyBpbi1rZXJuZWwgY2xpZW50DQo+ICAgICAg
ICBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbHVtYWcvbXNtLy0vY29tbWl0LzVi
YTViOTZkMzMyNw0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------9dH0JSXrR3e8BvAVls5aqKlt--

--------------EuP4jWJn1oMAEScGkWgZTmyl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtH5sFAwAAAAAACgkQlh/E3EQov+C6
0g/+Nwis7K+p8DZSr+yjQXWE20AZspXGhXK3eJgAKG/kxv65UXhdzhGb1PyLU56bQJUVhStQ98PO
KnE+KFriSajQxd5dX03KUQVpxMw/LuUiawK9EPaUAh1BLep+NEYfNe956C/6p2HtXZN8PPVy58fY
Vr8T82aU9x96EkYJi45XkrKb2XdaqnV8gX9mUXKJjZ9yaM0jsbL5DIrBZB5a8du6wuPXbE0J+pOx
SXMWXZ9TvPAJ+4BrYkJzKihg4VdlWFPaKQvxOqfYzHrxbt7LzoRbvQcNL4N9TXXX6vAa4pzYHfBL
+PNC9ddGt20GBhNrnWOU3REEEVWhHfpx4lI3kEbHM+Hc2V6BIq5IaZWZrzDKZ4OuuX7FSxFoqBtb
Gq9ID1JyY/ZKXtAPGfQ5o5m3JzaSRZEz7bmlPAbHTKCs6gN5T0nA63jt7MTPKju9shrLdGR6JEPJ
/cpM/ixPCmyAiGYxvnISTGsdtBITcKIjaHvycEQp5dcQmgKe9yM6aoPqto3WSfkeue9r44yRckLz
kBuzhqN5/0+AMVKlCipeuiBntrZGkhUxqKJ7LpP7tvpNEYFfUd1rQl6zmDSe4yzUlo4oXlZu6IFn
Aw4BhnWrNW8bVb/3nq2+9I3glskXobJkJ4rvG406o948SXQU6XYuLQ0/enItqmNZencFaRjgbsH5
lm4=
=RZZL
-----END PGP SIGNATURE-----

--------------EuP4jWJn1oMAEScGkWgZTmyl--
