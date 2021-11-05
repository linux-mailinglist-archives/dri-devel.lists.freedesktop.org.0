Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78B4460D1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 09:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2A6E5CC;
	Fri,  5 Nov 2021 08:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E266E5BF;
 Fri,  5 Nov 2021 08:44:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2048A1FD36;
 Fri,  5 Nov 2021 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636101841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQvV0RpnV8EUYUIoohmo0C8M2wV3xBUo8DuodBf76C4=;
 b=eTlz+S0jycepgNsob78MKh4XqFhLNLCBkiIXR7cIQjUrRLttxjEV35SzM17aB7X/Aq8Q9g
 Rk8guvmEMZQRqwKh9VYHbXpzxvIlbKhWlvDHRUNFqDCPpToag3DU6D9Pt1xdAhvsPzF/fy
 RlM/dMl6+kLggHMJjWth6hZA3HwzvW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636101841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQvV0RpnV8EUYUIoohmo0C8M2wV3xBUo8DuodBf76C4=;
 b=m9PBG70y1HJQ3NdFv3Y52DwBrceLS2o02joRV4AN9NFw8O9DlICQhvumT7MryI9A/s/Fqq
 lUR+gRyGmDZsfmBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C2D213DFC;
 Fri,  5 Nov 2021 08:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mTUmJdDuhGHoTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 08:44:00 +0000
Message-ID: <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
Date: Fri, 5 Nov 2021 09:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Gnx82v0TLFu0h6IXui8hbh2N"
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Gnx82v0TLFu0h6IXui8hbh2N
Content-Type: multipart/mixed; boundary="------------S0Y95QrnJLrUy0Fvjfwzofm3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
In-Reply-To: <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>

--------------S0Y95QrnJLrUy0Fvjfwzofm3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMTEuMjEgdW0gMjE6MDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIEphbmksDQo+IA0KPiBPbiAxMS80LzIxIDIwOjU3LCBKYW5pIE5p
a3VsYSB3cm90ZToNCj4+IE9uIFRodSwgMDQgTm92IDIwMjEsIEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiArLyoqDQo+Pj4gKyAq
IGRybV9kcnZfZW5hYmxlZCAtIENoZWNrcyBpZiBhIERSTSBkcml2ZXIgY2FuIGJlIGVuYWJs
ZWQNCj4+PiArICogQGRyaXZlcjogRFJNIGRyaXZlciB0byBjaGVjaw0KPj4+ICsgKg0KPj4+
ICsgKiBDaGVja3Mgd2hldGhlciBhIERSTSBkcml2ZXIgY2FuIGJlIGVuYWJsZWQgb3Igbm90
LiBUaGlzIG1heSBiZSB0aGUgY2FzZQ0KPj4+ICsgKiBpZiB0aGUgIm5vbW9kZXNldCIga2Vy
bmVsIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIgaXMgdXNlZC4NCj4+PiArICoNCj4+PiArICog
UmV0dXJuOiAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1
cmUuDQo+Pj4gKyAqLw0KPj4+ICtpbnQgZHJtX2Rydl9lbmFibGVkKGNvbnN0IHN0cnVjdCBk
cm1fZHJpdmVyICpkcml2ZXIpDQoNCkphbmkgbWVudGlvbmVkIHRoYXQgaTkxNSBhYnNvbHV0
ZWx5IHdhbnRzIHRoaXMgdG8gcnVuIGZyb20gdGhlIA0KbW9kdWxlX2luaXQgZnVuY3Rpb24u
IEJlc3QgaXMgdG8gZHJvcCB0aGUgcGFyYW1ldGVyLg0KDQo+Pj4gK3sNCj4+PiArCWlmICh2
Z2Fjb25fdGV4dF9mb3JjZSgpKSB7DQo+Pj4gKwkJRFJNX0lORk8oIiVzIGRyaXZlciBpcyBk
aXNhYmxlZFxuIiwgZHJpdmVyLT5uYW1lKTsNCj4+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+
PiArCX0NCg0KSWYgd2UgcnVuIHRoaXMgZnJvbSB3aXRoaW4gYSBtb2R1bGVfaW5pdCBmdW5j
dGlvbiwgd2UnZCBnZXQgcGxlbnR5IG9mIA0KdGhlc2Ugd2FybmluZ3MgaWYgZHJpdmVycyBh
cmUgY29tcGlsZWQgaW50byB0aGUga2VybmVsLiBNYXliZSBzaW1wbHkgDQpyZW1vdmUgdGhl
IG1lc3NhZ2UuIFRoZXJlJ3MgYWxyZWFkeSBhIHdhcm5pbmcgcHJpbnRlZCBieSB0aGUgbm9t
b2Rlc2V0IA0KaGFuZGxlci4NCg0KPj4+ICsNCj4+PiArCXJldHVybiAwOw0KPj4+ICt9DQo+
Pj4gK0VYUE9SVF9TWU1CT0woZHJtX2Rydl9lbmFibGVkKTsNCj4+DQo+PiBUaGUgbmFtZSBp
bXBsaWVzIGEgYm9vbCByZXR1cm4sIGJ1dCBpdCdzIG5vdC4NCj4+DQo+PiAJaWYgKGRybV9k
cnZfZW5hYmxlZCguLi4pKSB7DQo+PiAJCS8qIHN1cnByaXNlLCBpdCdzIGRpc2FibGVkISAq
Lw0KPj4gCX0NCj4+DQo+IA0KPiBJdCB1c2VkIHRvIHJldHVybiBhIGJvb2wgaW4gdjIgYnV0
IFRob21hcyBzdWdnZXN0ZWQgYW4gaW50IGluc3RlYWQgdG8NCj4gaGF2ZSBjb25zaXN0ZW5j
eSBvbiB0aGUgZXJybm8gY29kZSB0aGF0IHdhcyByZXR1cm5lZCBieSB0aGUgY2FsbGVycy4N
Cj4gDQo+IEkgc2hvdWxkIHByb2JhYmx5IG5hbWUgdGhhdCBmdW5jdGlvbiBkaWZmZXJlbnRs
eSB0byBhdm9pZCBjb25mdXNpb24uDQoNClllcywgcGxlYXNlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBCdXQgSSB0aGluayB5b3UgYXJlIGNvcnJlY3QgYW5kIHRoaXMg
Y2hhbmdlIGlzIGNhdXNlZCB0b28gbXVjaCBjaHVybg0KPiBmb3Igbm90IHRoYXQgbXVjaCBi
ZW5lZml0LCBzcGVjaWFsbHkgc2luY2UgaXMgdW5jbGVhciB0aGF0IHRoZXJlIG1pZ2h0DQo+
IGJlIGFub3RoZXIgY29uZGl0aW9uIHRvIHByZXZlbnQgYSBEUk0gZHJpdmVyIHRvIGxvYWQg
YmVzaWRlcyBub21vZGVzZXQuDQo+IA0KPiBJJ2xsIGp1c3QgZHJvcCB0aGlzIHBhdGNoIGFu
ZCBwb3N0IG9ubHkgIzIgYnV0IG1ha2luZyBkcml2ZXJzIHRvIHRlc3QNCj4gdXNpbmcgdGhl
IGRybV9jaGVja19tb2Rlc2V0KCkgZnVuY3Rpb24gKHdoaWNoIGRvZXNuJ3QgaGF2ZSBhIG5h
bWUgdGhhdA0KPiBpbXBsaWVzIGEgYm9vbCByZXR1cm4pLg0KPiANCj4+DQo+PiBCUiwNCj4+
IEphbmkuDQo+Pg0KPj4NCj4+DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------S0Y95QrnJLrUy0Fvjfwzofm3--

--------------Gnx82v0TLFu0h6IXui8hbh2N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGE7tAFAwAAAAAACgkQlh/E3EQov+Dl
bg//cjmCiaEMPBZ1qlC4+qaeVbOgw8v0hjbuBm9Cg4XoweogzTTpY4npuFRLWWBrEY3Hcw8TPwAk
JCMZWbomGwXQA8tWC8c5Ayz/QZvtQVilB+XLkNsFqF9ITTv2E/y28kzePIZxkuf8C8nYIUyoaTRH
iQmuE3Ca7kW1tGzeb/8xSJLrdhcPv8kWw4WPg4IoIRF/C1azNP6Pf0dWLiW7eZ+Yy84P8Szr9/g7
vooHXvLMOR+qWYkO/461OWxfu1vS9H+N3lvBWfAq8yd7/GSPLZh0IOkJmdoZJ3bZNZFJWvbjGjRs
WsWjGk/Io2sxQADehobRX7tny2bxpYLrTGWClTU6L38A1RgkgvP9+SI7Wdv5PDdC0nMCcjgxLElp
CMBKsUwxrfjoSJi6wkn14r/WWns2JIaehUyZNCrCPa05IZE/4Ij5ewMqseDPJC9uLIZPFCPLxxRh
w99cKoTylarSKm4InhWCzj7xRTerGJ/6IQbZsb2B7SFdHfeSWpcCwz3KoUvY1WRWaNDZfrC9YRFH
Bhxgp9mZAltoDQjhWw5tpSwwLnFwsBEzK5ImsDXcJy+EYfWBWdkULkpdtte1J6i2R7q/+Zy4pViq
dxVWPB2anCkHMxF9hQGq67Dnsr7WMXX9/qCw1HRYB3dtS5r1UqjL7Ua8qpySVXUjBDQACd4gK+gY
FNc=
=a6ez
-----END PGP SIGNATURE-----

--------------Gnx82v0TLFu0h6IXui8hbh2N--
