Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE278E7B5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E1010E146;
	Thu, 31 Aug 2023 08:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768C10E146
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB2F71F45E;
 Thu, 31 Aug 2023 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693469724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhMY2Zsvpbf+QUGLyWy57YKkixRuQXmp7K4/zxBhXWU=;
 b=wiVcmm68EtFRQK3FOH8STO6wdKUqtC8NICM9ysdE/A4n67Al+ay/ii66rD9HwGe3AsH3My
 +vLm+07pJqukdKtAsZHrxmsuIuc5+F9MNg5HA95ggTJiK6PNRfDFx7tpak70t2ShQKP0gz
 Fo4K7w9G5GhK6U3dls/psCgRtLpHG9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693469724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhMY2Zsvpbf+QUGLyWy57YKkixRuQXmp7K4/zxBhXWU=;
 b=YqaJYQuSv9drHysdEwD5hQWt3H+Vu3W8wujVRgQjhdGetm4niBrWsGDd9D5xW105agLyKO
 daAM+EA45sKsYeCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B072F13587;
 Thu, 31 Aug 2023 08:15:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OlgzKhxM8GRibwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 31 Aug 2023 08:15:24 +0000
Message-ID: <619a8ad9-724c-16d0-482f-dc7cb75a44f6@suse.de>
Date: Thu, 31 Aug 2023 10:15:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/8] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Stone <daniel@fooishbar.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
 <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
 <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Oe887Gj3QpjjMtlK0cIyTz9L"
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
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Oe887Gj3QpjjMtlK0cIyTz9L
Content-Type: multipart/mixed; boundary="------------iqt7v30HAC093lPnlAfEQwGk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Stone <daniel@fooishbar.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <619a8ad9-724c-16d0-482f-dc7cb75a44f6@suse.de>
Subject: Re: [PATCH v2 5/8] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
References: <cover.1692888745.git.geert@linux-m68k.org>
 <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
 <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
 <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
In-Reply-To: <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>

--------------iqt7v30HAC093lPnlAfEQwGk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDguMjMgdW0gMTc6MjIgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIERhbmllbCwNCj4gDQo+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0IDU6MTLigK9Q
TSBEYW5pZWwgU3RvbmUgPGRhbmllbEBmb29pc2hiYXIub3JnPiB3cm90ZToNCj4+IE9uIFRo
dSwgMjQgQXVnIDIwMjMgYXQgMTY6MDksIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+IHdyb3RlOg0KPj4+ICAgICAgICAgIHN0cnVjdCBkcm1fY2xpZW50X2Rl
diAqY2xpZW50ID0gYnVmZmVyLT5jbGllbnQ7DQo+Pj4gLSAgICAgICBzdHJ1Y3QgZHJtX21v
ZGVfZmJfY21kIGZiX3JlcSA9IHsgfTsNCj4+PiAtICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
Zm9ybWF0X2luZm8gKmluZm87DQo+Pj4gKyAgICAgICBzdHJ1Y3QgZHJtX21vZGVfZmJfY21k
MiBmYl9yZXEgPSB7IH07DQo+Pj4gICAgICAgICAgaW50IHJldDsNCj4+Pg0KPj4+IC0gICAg
ICAgaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhmb3JtYXQpOw0KPj4+IC0gICAgICAgZmJfcmVx
LmJwcCA9IGRybV9mb3JtYXRfaW5mb19icHAoaW5mbywgMCk7DQo+Pj4gLSAgICAgICBmYl9y
ZXEuZGVwdGggPSBpbmZvLT5kZXB0aDsNCj4+PiAgICAgICAgICBmYl9yZXEud2lkdGggPSB3
aWR0aDsNCj4+PiAgICAgICAgICBmYl9yZXEuaGVpZ2h0ID0gaGVpZ2h0Ow0KPj4+IC0gICAg
ICAgZmJfcmVxLmhhbmRsZSA9IGhhbmRsZTsNCj4+PiAtICAgICAgIGZiX3JlcS5waXRjaCA9
IGJ1ZmZlci0+cGl0Y2g7DQo+Pj4gKyAgICAgICBmYl9yZXEucGl4ZWxfZm9ybWF0ID0gZm9y
bWF0Ow0KPj4+ICsgICAgICAgZmJfcmVxLmhhbmRsZXNbMF0gPSBoYW5kbGU7DQo+Pj4gKyAg
ICAgICBmYl9yZXEucGl0Y2hlc1swXSA9IGJ1ZmZlci0+cGl0Y2g7DQo+Pj4NCj4+PiAtICAg
ICAgIHJldCA9IGRybV9tb2RlX2FkZGZiKGNsaWVudC0+ZGV2LCAmZmJfcmVxLCBjbGllbnQt
PmZpbGUpOw0KPj4+ICsgICAgICAgcmV0ID0gZHJtX21vZGVfYWRkZmIyKGNsaWVudC0+ZGV2
LCAmZmJfcmVxLCBjbGllbnQtPmZpbGUpOw0KPj4+ICAgICAgICAgIGlmIChyZXQpDQo+Pj4g
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4NCj4+IFRoaXMgc2hvdWxkIGV4cGxp
Y2l0bHkgc2V0IHRoZSBMSU5FQVIgbW9kaWZpZXIgKGFuZCB0aGUgbW9kaWZpZXIgZmxhZykN
Cj4+IGlmIHRoZSBkcml2ZXIgc3VwcG9ydHMgbW9kaWZpZXJzLg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIGNvbW1lbnQhDQo+IA0KPiBJIGhhdmUgbm8gaWRlYSBob3cgdG8gZG8gdGhhdCwg
YW5kIEkgZG8gbm90IGtub3cgd2hhdCB0aGUgaW1wYWN0DQo+IHdvdWxkIGJlLiAgQWxsIEkg
a25vdyBpcyB0aGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mDQo+IGRybV9jbGll
bnRfYnVmZmVyX2FkZGZiKCkgZG9lcyBub3QgZG8gdGhhdCwgc28gY2hhbmdpbmcgdGhhdCBp
biB0aGlzDQo+IHBhdGNoIHdvdWxkIG1lYW4gdGhhdCB0aGlzIHdvdWxkIG5vIGxvbmdlciBi
ZSBhIHRyaXZpYWwgY29udmVyc2lvbi4NCg0KSSBhZ3JlZS4gVGhhdCBjaGFuZ2UgaXMgdG9v
IGxhcmdlIGFuZCBpbnZhc2l2ZSBmb3IgdGhpcyBwYXRjaHNldC4gUmF0aGVyIA0KYWRkIGEg
Y29tbWVudCBvciBUT0RPIGl0ZW0uDQoNClRoZSBjb3JyZWN0IHdheSBmb3IgYWRkaW5nIHRo
ZSBtb2RpZmllciBpcyB0byBleHRlbmQgdGhlIA0KZHJtX2NsaWVudF9idWZmZXJfYWRkZmIo
KSBhbmQgcGFzcyBpbiB0aGUgaW5mb3JtYXRpb24gZnJvbSB0aGUgY2FsbGVyLiANClRoYXQg
Y2FsbGVyIGlzIGZiZGV2IGNvZGUuIFdlIGN1cnJlbnRseSBkZXRlY3QgdGhlIGZvcm1hdCBm
cm9tIChicHAsIA0KZGVwdGgpIHZhbHVlcyBhbmQgZm9yd2FyZCB0aGUgZm9ybWF0IHRvIF9h
ZGRmYigpLiBbMV0gSGVyZSB3ZSdkIGhhdmUgdG8gDQpjaGVjayB0aGUgZHJpdmVyIGZvciBh
IG1vZGlmaWVyIGFzIHdlbGwgYW5kIGZvcndhcmQgaXQgdG8gX2FkZGZiKCkNCg0KWzFdIA0K
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMjTDg4DQoNClRoZSBwYWlyIG9mIChicHAsIGRl
cHRoKSB2YWx1ZXMgY29tZXMgZnJvbSBfX2RybV9mYl9oZWxwZXJfZmluZF9zaXplcywgDQpb
Ml0gd2hpY2ggbG9va3MgdGhyb3VnaCB0aGUgcGxhbmVzJyBmb3JtYXRzIGFuZCB0cmllcyB0
byBmaW5kIHNvbWV0aGluZyANCnRoYXQgZml0cyB0aGUgdXNlcidzIHJlcXVlc3RlZCBjb2xv
ciBtb2RlLiBJdCB3b3VsZCBoYXZlIHRvIGxvb2sgZm9yIA0KbW9kaWZpZXJzIGFzIHdlbGwu
IEF0IHNvbWUgcG9pbnQsIEkgd2FudCB0aGUgaGVscGVyIHRvIHJldHVybiBmb3JtYXRzIA0K
ZGlyZWN0bHksIGJ1dCB0aGF0J3Mgc3RpbGwgYSBiaXQgYXdheS4NCg0KWzJdIA0KaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS9zb3VyY2UvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyNMMTUwNA0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------iqt7v30HAC093lPnlAfEQwGk--

--------------Oe887Gj3QpjjMtlK0cIyTz9L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTwTBsFAwAAAAAACgkQlh/E3EQov+DI
JA//S8P7H+Rp74pwZrhoX0D843Pj5WGuH/6h1ul8A3dAd4kiAbs/UnWoB1DyCGSBpBorY2mmyi77
QZ287oHpHa61hV6kHSXa7gBt5xgEwUWhXL9GXs2xUkc98CiQ8Rjvze/x1A0NhimRb95LspiMvRle
DLv6nqGbpAhQDNl0VFS4PMW+vNiPsC16QCsZaRUdxtlbS8VfUddP1FJlQ5rEtH593OmOZPnAVif6
thyhfudIAqKaqcky1BTuVygoM0+4XX5jqH6I3vTvB/7Ql3aLH0YWlFj7hWHladBvDfzILsw/Di6a
Qq8KxhtteRKMWHBb6SaYcUQ54XN7RdzOGcIwMDmjuR7/F57ISTjQEbIcfJrEBqh8SkK0e5fHu4VN
2PdBWdguuTJl3cOndCs+3LjQPMLP43Yxiehi0mcDJFwQmZ+dh8DnGO9ABHNHyBtJ0mk/prtfFkAu
Lm//LkkNfmpQRbuRuWsDXjGnwUQikY0u7SGcrcMw1y243uaii5cCaS4WPGXtX+EVjporM3oBqqxH
kyEPRUGvVCkf79wVTk51HNV3hKiczrwtAiwxfktwlXEtNaqlHKvLTZfV31NmaUd48Gm2cETA+LGP
Czrgwms0HtyM0Mdzc/Jx6wEihjM41Q6IsKIxg2qILLQcnPKwF90cl3py0XvFN5Wdem1JmBb/Z6lM
kTc=
=opIP
-----END PGP SIGNATURE-----

--------------Oe887Gj3QpjjMtlK0cIyTz9L--
