Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9CE4C1B63
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880DC10E375;
	Wed, 23 Feb 2022 19:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ED210E375
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:06:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC50921111;
 Wed, 23 Feb 2022 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645643200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GPLZZ9okgxjG91kbEFfA4V5kB1YoiST1htziSbSlLxw=;
 b=Vnh8DPok1Ac7DvCKwf3WdtKI1Z2WLxuoq+VsVLPz4YAp8bcoEdMIsqcBvp9Lqjkgp4xU/0
 NHuS0CnIHeY3ycrhswui8wBJnwvvXcgQ1Q/L6gif2F5QhVfDU7JLOoJ5zaPzMPuJQyFbJI
 LMks4rfU92a8mWVKtmooeiJKeYpd61A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645643200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GPLZZ9okgxjG91kbEFfA4V5kB1YoiST1htziSbSlLxw=;
 b=gtsiwiiVYnWhRB/NyzBWdzD0XDIeU9nf19Izu9Mm08JSeEuwDPabVrANdBdyK7I/0klh2i
 fw1/Xi2zyW6f8LCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9061D13C98;
 Wed, 23 Feb 2022 19:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y0ViIcCFFmKYRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:06:40 +0000
Message-ID: <f9768b09-90a7-1908-0f5b-6474bbb00208@suse.de>
Date: Wed, 23 Feb 2022 20:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220203093922.20754-1-tzimmermann@suse.de>
 <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
 <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
 <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lDM0znyJJhUJUE6V7sqi342b"
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lDM0znyJJhUJUE6V7sqi342b
Content-Type: multipart/mixed; boundary="------------3aKaSPBcptHyTGUjP8x0PKWx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Doug Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <f9768b09-90a7-1908-0f5b-6474bbb00208@suse.de>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
References: <20220203093922.20754-1-tzimmermann@suse.de>
 <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
 <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
 <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
In-Reply-To: <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>

--------------3aKaSPBcptHyTGUjP8x0PKWx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDIuMjIgdW0gMTc6MTEgc2NocmllYiBEb3VnIEFuZGVyc29uOg0KPiBI
aSwNCj4gDQo+IE9uIFR1ZSwgRmViIDIyLCAyMDIyIGF0IDE6MzEgQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+Pg0KPj4gT24gVHVlLCBG
ZWIgOCwgMjAyMiBhdCAxMDozOSBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiB3cm90ZToNCj4+PiBPbiBNb24sIEZlYiA3LCAyMDIyIGF0IDEyOjMxIFBN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4g
QXMgcmVwb3J0ZWQgaW4gWzFdLCBEUk1fUEFORUxfRURQIGRlcGVuZHMgb24gRFJNX0RQX0hF
TFBFUi4gU2VsZWN0DQo+Pj4+IHRoZSBvcHRpb24gdG8gZml4IHRoZSBidWlsZCBmYWlsdXJl
LiBUaGUgZXJyb3IgbWVzc2FnZSBpcyBzaG93bg0KPj4+PiBiZWxvdy4NCj4+Pj4NCj4+Pj4g
ICAgYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LWVkcC5vOiBpbiBmdW5jdGlvbg0KPj4+PiAgICAgIGBwYW5lbF9lZHBfcHJvYmUnOiBwYW5l
bC1lZHAuYzooLnRleHQrMHhiNzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+Pj4+ICAg
ICAgYGRybV9wYW5lbF9kcF9hdXhfYmFja2xpZ2h0Jw0KPj4+PiAgICBtYWtlWzFdOiAqKiog
Wy9idWlsZHMvbGludXgvTWFrZWZpbGU6MTIyMjogdm1saW51eF0gRXJyb3IgMQ0KPj4+Pg0K
Pj4+PiBUaGUgaXNzdWUgaGFzIGJlZW4gcmVwb3J0ZWQgYmVmb3JlLCB3aGVuIERpc3BsYXlQ
b3J0IGhlbHBlcnMgd2VyZQ0KPj4+PiBoaWRkZW4gYmVoaW5kIHRoZSBvcHRpb24gQ09ORklH
X0RSTV9LTVNfSEVMUEVSLiBbMl0NCj4+Pj4NCj4+Pj4gdjI6DQo+Pj4+ICAgICAgICAgICog
Zml4IGFuZCBleHBhbmQgY29tbWl0IGRlc2NyaXB0aW9uIChBcm5kKQ0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+Pg0KPj4+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4+Pg0KPj4+IFRoaXMgZml4ZXMg
dGhlIGJ1aWxkIGVycm9ycyBJJ20gc2VlaW5nLCBzbw0KPj4+IFRlc3RlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4+DQo+PiBJcyB0aGlz
IHBsYW5uZWQgdG8gYmUgcXVldWVkPyBUaGlzIGlzIHN0aWxsIGZhaWxpbmcgaW4gZHJtLW5l
eHQuDQo+PiBUaGFua3MhDQo+IA0KPiBMb29rcyBsaWtlIHRoaXMgaGFzIGJlZW4gaW4gZHJt
LW1pc2MtbmV4dCBzaW5jZSBGZWIgNDoNCj4gDQo+IC0tLQ0KPiANCj4gY29tbWl0IGVlYTg5
ZGZmNGMzOWExMDZmOThkMWNiNWU0ZDYyNmY4YzYzOTA4YjkNCj4gQXV0aG9yOiAgICAgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IEF1dGhvckRhdGU6IFRo
dSBGZWIgMyAxMDozOToyMiAyMDIyICswMTAwDQo+IENvbW1pdDogICAgIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDb21taXREYXRlOiBGcmkgRmViIDQg
MDk6Mzg6NDcgMjAyMiArMDEwMA0KPiANCj4gICAgICBkcm0vcGFuZWw6IFNlbGVjdCBEUk1f
RFBfSEVMUEVSIGZvciBEUk1fUEFORUxfRURQDQo+IA0KPiAtLS0NCj4gDQo+IE1heWJlIGl0
IG5lZWRlZCB0byBsYW5kIGVsc2V3aGVyZSwgdGhvdWdoPw0KDQpTb3JyeSBhYm91dCB0aGUg
bWVzcy4gV2UgaGFkIHNvbWUgY29uZnVzaW9uIHdpdGggdGhpcyBjeWNsZSdzIA0KZHJtLW1p
c2MtbmV4dCBwdWxsIHJlcXVlc3QsIHdoaWNoIGdvdCBkZWxheWVkIHNpZ25pZmljYW50bHku
IFRoZXJlJ3MgDQpiZWVuIGEgUFIgdG9kYXksIHdoaWNoIHNob3VsZCBiZSBtZXJnZWQgaW50
byBkcm0tbmV4dCBhbnkgdGltZSBub3cuIFRoZSANCnBhdGNoIHdpbGwgYmUgcGFydCBvZiB0
aGF0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAtRG91Zw0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------3aKaSPBcptHyTGUjP8x0PKWx--

--------------lDM0znyJJhUJUE6V7sqi342b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIWhb8FAwAAAAAACgkQlh/E3EQov+Ab
Wg/+NkEWjfPU2gua61yok27wa/KL8+Cu1aSdZXooShWEA6ALA9FMOm0RQeOnN6ZlEwZP8DKeOIyy
LWeh3IDM2HDFPqVacXxVWu87PN2HDdIbLzWRNkIu/WNSjFz+l/aImr4lOrVR4LtXiF7NH9UJProU
DOgJQpBdRoMK0LuYqW5sZBh2ZREtKaYcQr99Dv+Jmzppyx9NHx7FggbGMHBqwo8OMFpXZKdzHc6/
hGyn0NCAfeKO/V5zBZndacJHHsrur6IitUXYSbZk+930DB7C+nFssWFUkYwM3OZ0av6dTolpIOAW
3wTO5UCILtlGIqGT62Tn0xgLP58MX65crHoWJoaAUoS5nxVDx44+ENdOvwR7Db3A9LOjboNxBm/G
VHN5kmmWT2BmAJEMPo8KM2OybMTpkGVXudH3mipPIOcnpym93Jzn5GFAGD8J+KKuxz6rvCU8DtDO
DJlGX2OKU2BUtrnlfkCjSbkbixttTLtnqLbmohkVVppf07WCIspBf4YL+VszT46MrSw5VXjlYQZC
rQqZhB5tqRnuboj4nteMY+rE2WV0Kjds2UVh4Fd3jeFSsvmCS2GdncTFzcTnrfmFIP+RWrKxJDqm
SdTMmlV5iYi6U/P7YEXpvVR9LDIkFX+UDJz8FLNarJLR9C7A23klAqFDgXXgdakp0MVuM4L0x29O
Ao0=
=Jv/L
-----END PGP SIGNATURE-----

--------------lDM0znyJJhUJUE6V7sqi342b--
