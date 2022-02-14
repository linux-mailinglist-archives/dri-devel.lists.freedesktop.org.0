Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA294B50B9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC6810E202;
	Mon, 14 Feb 2022 12:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662010E202
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:55:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6AA02210F0;
 Mon, 14 Feb 2022 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644843300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlVbDpb4UAk3s2/ZjzwvY3fRbiu4X9pfplI3Qbvdyx8=;
 b=VsL601XHvmXkMP7IG2AcgzJrCHSTnGrWK6Dng8z5Io/oGvpec7nfQ4SlPMKSsf0QjjLY8d
 BYLhVvG/pSRxv/8UR8aSksemvKQ7pz2s42YPUMmCvOzVMwmItVhsTgP2is5bbcjtIUdX7Z
 5RNEURTky8s7m+QZv4gbzxsoTSE+NBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644843300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZlVbDpb4UAk3s2/ZjzwvY3fRbiu4X9pfplI3Qbvdyx8=;
 b=+6IqdAOqyKqNm11u35tE0vyUB2oCL5Lohkdr3tFp6Czu6cMLMHgiROAOZdCq1co38TwSPF
 HY+dMSNZHm0DC5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 188AC13AD7;
 Mon, 14 Feb 2022 12:55:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1HYIBSRRCmKuFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Feb 2022 12:55:00 +0000
Message-ID: <65010c63-ef8a-4fff-00e4-73a9b6fd05b8@suse.de>
Date: Mon, 14 Feb 2022 13:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
 <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de> <YgpPR/lObRWwkjNN@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YgpPR/lObRWwkjNN@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KxPSs1DXV5etRzs3O9RYLumj"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KxPSs1DXV5etRzs3O9RYLumj
Content-Type: multipart/mixed; boundary="------------ytU1F3Y59OwWkz03koI2N7eh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <65010c63-ef8a-4fff-00e4-73a9b6fd05b8@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
References: <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de> <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
 <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de> <YgpPR/lObRWwkjNN@intel.com>
In-Reply-To: <YgpPR/lObRWwkjNN@intel.com>

--------------ytU1F3Y59OwWkz03koI2N7eh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDIuMjIgdW0gMTM6NDcgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDAxOjEyOjQ4UE0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxNC4wMi4yMiB1bSAxMTozOCBzY2hy
aWViIEFuZHkgU2hldmNoZW5rbzoNCj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAxMDow
Mzo1M0FNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gQW0gMTEuMDIu
MjIgdW0gMTY6NDEgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+Pj4NCj4+PiAuLi4NCj4+
Pg0KPj4+Pj4+IElNTyAqYWx3YXlzKiBwcmVmZXIgYSBmb3IgbG9vcCBvdmVyIHdoaWxlIG9y
IGRvLXdoaWxlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIGZvciAoaSA9IDA7IGkgPCBOOyBpKysp
IGlzIHN1Y2ggYSBzdHJvbmcgcGFyYWRpZ20gaW4gQy4gWW91DQo+Pj4+Pj4gaW5zdGFudGx5
IGtub3cgaG93IG1hbnkgdGltZXMgeW91J3JlIGdvaW5nIHRvIGxvb3AsIGF0IGEgZ2xhbmNl
LiBOb3Qgc28NCj4+Pj4+PiB3aXRoIHdpdGggdGhlIGFsdGVybmF0aXZlcywgd2hpY2ggc2hv
dWxkIGJlIHVzZWQgc3BhcmluZ2x5Lg0KPj4+Pj4NCj4+Pj4+IHdoaWxlICgpIHt9ICBfaXNf
IGEgcGFyYWRpZ20sIGZvci1sb29wIGlzIHN5bnRheCBzdWdhciBvbiB0b3Agb2YgaXQuDQo+
Pj4+DQo+Pj4+IE5hdywgdGhhdCdzIG5vdCB0cnVlLg0KPj4+DQo+Pj4gSW4gdGhlIHNlY3Rp
b24gMy41ICJMb29wcyAtIFdoaWxlIGFuZCBGb3IiIGluICJUaGUgQyBQcm9ncmFtbWluZw0K
Pj4+IExhbmd1YWdlIiAybmQgYnkgSyZSLCB0aGUgYXV0aG9ycyBzYWlkOg0KPj4NCj4+IFll
YXIgb2YgcHVibGljYXRpb246IDE5ODggLiBJdCdzIG5vdCB0aGUgbW9zdCB1cC10by1kYXRl
IHJlZmVyZW5jZSBmb3IgQw0KPj4gcHJvZ3JhbW1pbmcuDQo+Pg0KPj4+DQo+Pj4gCVRoZSBm
b3Igc3RhdGVtZW50IC4uLiBpcyBlcXVpdmFsZW50IHRvIC4uLiB3aGlsZS4uLiINCj4+Pg0K
Pj4+IFRoZXkgc2FpZCB0aGF0IGZvciBpcyBlcXVpdmFsZW50IHRvIHdoaWxlLCBhbmQgbm90
IG90aGVyd2lzZS4NCj4+DQo+PiBFdmVuIGxlYXZpbmcgcmVhZGFiaWxpdHkgYXNpZGUsIGl0
J3Mgbm90IGVxdWl2YWxlbnQuIFlvdSBjYW4gZGVjbGFyZQ0KPj4gdmFyaWFibGVzIGFzIHBh
cnQgb2YgdGhlIGZvciBzdGF0ZW1lbnQuIChJIGtub3cgaXQncyBub3QgdGhlIGtlcm5lbCdz
DQo+PiBzdHlsZS4pIEFsc28sICdjb250aW51ZScgc3RhdGVtZW50cyBhcmUgbm90IHdlbGwt
c3VpdGVkIGluIGZvciBsb29wcywNCj4+IGJlY2F1c2UgaXQncyBub24tb2J2aW91cyBpZiB0
aGUgbG9vcCdzIHVwZGF0ZSBzdGF0ZW1lbnQgaXMgYmVpbmcNCj4+IGV4ZWN1dGVkLiAoSXQg
aXNuJ3QuKQ0KPiANCj4gSXQgaXMuDQo+IA0KPiAnY29udGludWUnIGlzIGp1c3Qgc2hvcnRo
YW5kIGZvciAnZ290byBlbmRfb2ZfbG9vcF9ib2R5Jy4NCg0KV2VsbCwgaW5kZWVkLiBsb2wN
Cg0KRnVuIGZhY3Q6IEkgYWN0dWFsbHkgaGFkIHRvIGxvb2sgdGhpcyB1cCBhbmQgc3RpbGwg
Z290IGl0IHdyb25nLiBMZXQgbWUgDQpqdXN0IGNvdW50IGl0IHVuZGVyIHByb3ZpbmctbXkt
cG9pbnQ6IGNvbnRpbnVlIGluIGEgZm9yIHN0YXRlbWVudCBpcyBhIA0KYmFkIGlkZWEgYW5k
IGZvciBpc24ndCBlcXVpdmFsZW50IHRvIHdoaWxlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ytU1F3Y59OwWkz03koI2N7eh--

--------------KxPSs1DXV5etRzs3O9RYLumj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIKUSMFAwAAAAAACgkQlh/E3EQov+CQ
KxAAtxeK6IGcVuJKS5tzCPW9MmKiafDVxPNkLQ4duXQhtENn2hAlSHOfUAWH504rKepCPOnTlHqU
5qgBbCHMHIIUTmqb/CybnzihhyJp5ucSeQjCSAjkufM78DsYUhcH8VBIgN9xOJmVu96aWOlo8ufG
Pw/2sPdvaFMeiGvneuatffID/lL8OuIp+LUpdf/wKC9JAuaN/t/Glj2KJ70zERnMiKsqYaZaWHqX
2Ce20emYOzp5E4pCKc6a5bQZzrRa2PJTnFOiXdUjPhSamISw25AEU4suu/2coOqMCWBIQG10Xhw+
emTzVvdj49DYbNR1xnXrl2Pbt0J5gM52124cMX0U5h8NNfMloC7srCj3TkTsBWKqMx2wQuolhHZ8
PG5fl8a32hz11aDeOa9+X4NkM9ET3042xvj+v0EBCsHZr+Ior1DeitkrDG4j8mNKpBzsFxGExNXm
txE2FPWCTveLtKaVSiOgEB+QsxFLVpmyCq6wle9jjj4w4mNXVqoeowfSlbP/pXJfVfiMdb0Hrv92
tPzvxLzuqQdAVlfTr26K9k15Rp+kzMQyOJs2O2lc17wTVqdhWY2gk5vE+ChYTaurHAt2FZ1e3bu0
3OKRUuXVtS0EQaWYTp8JLsOoNY4Dpn5lk+JPk201jeJW/3DL7iqQfwg2g/QOUxXM1/YiKocFvH2Q
7h0=
=NHmC
-----END PGP SIGNATURE-----

--------------KxPSs1DXV5etRzs3O9RYLumj--
