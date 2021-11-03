Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 842B644421D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 14:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EDB6EA4D;
	Wed,  3 Nov 2021 13:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178F46EA30;
 Wed,  3 Nov 2021 13:02:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 852261F782;
 Wed,  3 Nov 2021 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635944518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMU4O279Z10wVhWG7ere31FR2v1n4UkGIxK2VXMDmvk=;
 b=uRL8++YwZOFaSnpmncFTkimRxMwEcesvZFLYYYxQCGjiqBYGU1bokSDrqkA6Ht2Nz2w83J
 qjNvhvf5akOafRqKlAGlq2/yblV+jtLeDrSR0ade7JV+1CfffA6TqHUjOiL1fJ6Fd5b4sq
 6Rd9dFnTVskyu/etbAX+ypE+xBUCQHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635944518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMU4O279Z10wVhWG7ere31FR2v1n4UkGIxK2VXMDmvk=;
 b=I5hR8vqQoqkq/Xd5ebI+lANga9HeTYWK8PKs0S9boLFjTFgcDUxfN4mYQTWoXjgJ5b++0t
 /oH3wgSDgSYneCAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB85913E03;
 Wed,  3 Nov 2021 13:01:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nE2SNEWIgmHLZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Nov 2021 13:01:57 +0000
Message-ID: <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
Date: Wed, 3 Nov 2021 14:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RESEND PATCH 0/5] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211103122809.1040754-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bVlFqC8A7AGyAxb3T60UWzGg"
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bVlFqC8A7AGyAxb3T60UWzGg
Content-Type: multipart/mixed; boundary="------------ok1AXfyISINrrjET9V0shOJL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Neal Gompa <ngompa13@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <e02d23be-1a1c-570d-e76f-dbea76b6dd55@suse.de>
Subject: Re: [RESEND PATCH 0/5] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211103122809.1040754-1-javierm@redhat.com>
In-Reply-To: <20211103122809.1040754-1-javierm@redhat.com>

--------------ok1AXfyISINrrjET9V0shOJL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMTEuMjEgdW0gMTM6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFsgcmVzZW5kIHdpdGggYWxsIHJlbGV2YW50IHBlb3BsZSBhcyBDYyBub3cs
IHNvcnJ5IHRvIG90aGVycyBmb3IgdGhlIHNwYW0gXQ0KPiANCj4gVGhlcmUgaXMgYSBsb3Qg
b2YgaGlzdG9yaWNhbCBiYWdnYWdlIG9uIHRoaXMgcGFyYW1ldGVyLiBJdCdzIGRlZmluZWQg
aW4NCj4gdGhlIHZnYWNvbiBkcml2ZXIgYXMgYSAibm9tb2Rlc2V0IiBwYXJhbWV0ZXIsIGJ1
dCBpdCdzIGhhbmRsZXIgZnVuY3Rpb24gaXMNCj4gY2FsbGVkIHRleHRfbW9kZSgpIHRoYXQg
c2V0cyBhIHZhcmlhYmxlIG5hbWVkIHZnYWNvbl90ZXh0X21vZGVfZm9yY2Ugd2hvc2UNCj4g
dmFsdWUgaXMgcXVlcmllZCB3aXRoIGEgZnVuY3Rpb24gbmFtZWQgdmdhY29uX3RleHRfZm9y
Y2UoKS4NCj4gDQo+IEFsbCB0aGlzIGltcGxpZXMgdGhhdCBpdCdzIGFib3V0IGZvcmNpbmcg
dGV4dCBtb2RlIGZvciBWR0EsIHlldCBpdCBpcyBub3QNCj4gdXNlZCBpbiBuZWl0aGVyIHZn
YWNvbiBub3Igb3RoZXIgY29uc29sZSBkcml2ZXIuIFRoZSBvbmx5IHVzZXJzIGZvciB0aGVz
ZQ0KPiBhcmUgRFJNIGRyaXZlcnMsIHRoYXQgY2hlY2sgZm9yIHRoZSB2Z2Fjb25fdGV4dF9m
b3JjZSgpIHJldHVybiB2YWx1ZSB0bw0KPiBkZXRlcm1pbmUgd2hldGhlciB0aGUgZHJpdmVy
IGNvdWxkIGJlIGxvYWRlZCBvciBub3QuDQo+IA0KPiBUaGF0IG1ha2VzIGl0IHF1aXRlIGNv
bmZ1c2luZyB0byByZWFkIHRoZSBjb2RlLCBiZWNhdXNlIHRoZSB2YXJpYWJsZXMgYW5kDQo+
IGZ1bmN0aW9uIG5hbWVzIGRvbid0IHJlZmxlY3Qgd2hhdCB0aGV5IGFjdHVhbGx5IGRvIGFu
ZCBhbHNvIGFyZSBub3QgaW4gdGhlDQo+IHNhbWUgc3Vic3lzdGVtIGFzIHRoZSBkcml2ZXJz
IHRoYXQgbWFrZSB1c2Ugb2YgdGhlbS4NCj4gDQo+IFRoaXMgcGF0Y2gtc2V0IGF0dGVtcHRz
IHRvIGNsZWFudXAgdGhlIGNvZGUgYnkgbW92aW5nIHRoZSBub21vZHNlc2V0IHBhcmFtDQo+
IHRvIHRoZSBEUk0gc3Vic3lzdGVtIGFuZCBkbyBzb21lIHJlbmFtaW5nIHRvIG1ha2UgdGhl
aXIgaW50ZW50aW9uIGNsZWFyZXIuDQo+IA0KPiBUaGVyZSBpcyBhbHNvIGFub3RoZXIgYXNw
ZWN0IHRoYXQgY291bGQgYmUgaW1wcm92ZWQsIGFuZCBpcyB0aGUgZmFjdCB0aGF0DQo+IGRy
aXZlcnMgYXJlIGNoZWNraW5nIGZvciB0aGUgbm9tb2Rlc2V0IGJlaW5nIHNldCBhcyBhbiBp
bmRpY2F0aW9uIGlmIGhhdmUNCj4gdG8gYmUgbG9hZGVkLg0KPiANCj4gQnV0IHRoZXJlIG1h
eSBiZSBvdGhlciByZWFzb25zIHdoeSB0aGlzIGNvdWxkIGJlIHRoZSBjYXNlLCBzbyBpdCBp
cyBiZXR0ZXINCj4gdG8gZW5jYXBzdWxhdGUgdGhlIGxvZ2ljIGluIGEgc2VwYXJhdGUgZnVu
Y3Rpb24gdG8gbWFrZSBjbGVhciB3aGF0J3MgYWJvdXQuDQo+IA0KPiBQYXRjaCAjMSBpcyBq
dXN0IGEgdHJpdmlhbCBmaXggZm9yIGEgY29tbWVudCB0aGF0IGlzbid0IHJlZmVycmluZyB0
byB0aGUNCj4gY29ycmVjdCBrZXJuZWwgcGFyYW1ldGVyLg0KPiANCj4gUGF0Y2ggIzIgbW92
ZXMgdGhlIG5vbW9kZXNldCBsb2dpYyB0byB0aGUgRFJNIHN1YnN5c3RlbS4NCj4gDQo+IFBh
dGNoICMzIHJlbmFtZXMgdGhlIHZnYWNvbl90ZXh0X2ZvcmNlKCkgZnVuY3Rpb24gYW5kIGFj
Y29tcGFuaW5nIGxvZ2ljIGFzDQo+IGRybV9tb2Rlc2V0X2Rpc2FibGVkKCksIHdoaWNoIGlz
IHdoYXQgdGhpcyBmdW5jdGlvbiBpcyByZWFsbHkgYWJvdXQuDQo+IA0KPiBQYXRjaCAjNCBh
ZGRzIGEgZHJtX2Rydl9lbmFibGVkKCkgZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSB1c2VkIGJ5
IGRyaXZlcnMNCj4gdG8gY2hlY2sgaWYgY291bGQgYmUgZW5hYmxlZC4NCj4gDQo+IFBhdGNo
ICM1IHVzZXMgdGhlIGRybV9kcnZfZW5hYmxlZCgpIGZ1bmN0aW9uIHRvIGNoZWNrIHRoaXMg
aW5zdGVhZCBvZiBqdXN0DQo+IGNoZWNraW5nIGlmIG5vbW9kZXNldCBoYXMgYmVlbiBzZXQu
DQo+IA0KPiANCj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzICg1KToNCj4gICAgZHJtL2k5
MTU6IEZpeCBjb21tZW50IGFib3V0IG1vZGVzZXQgcGFyYW1ldGVycw0KPiAgICBkcm06IE1v
dmUgbm9tb2Rlc2V0IGtlcm5lbCBwYXJhbWV0ZXIgaGFuZGxlciB0byB0aGUgRFJNIHN1YnN5
c3RlbQ0KPiAgICBkcm06IFJlbmFtZSB2Z2Fjb25fdGV4dF9mb3JjZSgpIGZ1bmN0aW9uIHRv
IGRybV9tb2Rlc2V0X2Rpc2FibGVkKCkNCj4gICAgZHJtOiBBZGQgYSBkcm1fZHJ2X2VuYWJs
ZWQoKSBoZWxwZXIgZnVuY3Rpb24NCj4gICAgZHJtOiBVc2UgZHJtX2Rydl9lbmFibGVkKCkg
aW5zdGVhZCBvZiBkcm1fbW9kZXNldF9kaXNhYmxlZCgpDQoNClRoZXJlJ3MgdG9vIG11Y2gg
Y2h1cm4gaGVyZSBJTUhPLiBQbGVhc2UgbWVyZ2UgcGF0Y2hlcyAyKzMgYW5kIDQrNS4gQW5k
IA0KSSdkIHB1dCBwYXRjaCAoNCs1KSBmaXJzdCwgc28geW91IGhhdmUgdGhlIGRyaXZlcnMg
b3V0IG9mIHRoZSB3YXkuIEFmdGVyIA0KdGhhdCBwYXRjaCAoMiszKSBzaG91bGQgb25seSBt
b2RpZnkgZHJtX2Rydl9lbmFibGVkKCkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+ICAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDIgKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAgNSArKy0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICAgICAgICAgICB8ICAzICst
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICAgICB8IDIxICsr
KysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQu
YyAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfbW9kdWxlLmMgICAgICB8IDEwICsrKysrLS0tLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyAgICAgICAgICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5jICAgICAgICAgICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyAgICAgICAgICAgfCAgMyArLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfZHJ2LmMgICAgfCAgNSArLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyAgICB8ICAzICstLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICB8ICAzICstLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYyAgICAgICAgICB8IDIxIC0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2Rydi5oICAgICAgICAgICAgICAg
ICAgIHwgIDEgKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICAgICAg
ICB8ICA2ICsrKysrKw0KPiAgIGluY2x1ZGUvbGludXgvY29uc29sZS5oICAgICAgICAgICAg
ICAgICB8ICA2IC0tLS0tLQ0KPiAgIDE5IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMo
KyksIDU3IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vZHJtX25vbW9kZXNldC5jDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------ok1AXfyISINrrjET9V0shOJL--

--------------bVlFqC8A7AGyAxb3T60UWzGg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGCiEUFAwAAAAAACgkQlh/E3EQov+Bb
aRAAmqLzPWgo3W8UMaTkUsRuetzv9PbcupeXZmojS0Wf8UTJ6P3v6LX4l7S8CHmsi03HAHUb4hIW
K5eXj9hJtQgD6KiNX/ELV9c+8suNSMQDyNeEHKiEJm3f/ZnwrHRcHIvsnb/ib9ExtCYeHE1iY7Gr
t4dZRP/Umv5DOII4VSNfisnAJUb03r8u7q7aw+iBntqIRYlX4WyvGbPbEfdOJHepdxbBIaia4yJZ
yZuwIZJXOmiYJcpTBF/TDr89vwJD5n6IW9p3MYfkEXcjcndp9zUq+RxRA64PLgoFvq0jxddHV7Ia
k9smKLvPQQ8Wrrgdl0xP/xC2UQGRtkNVlLjxIAa605i7PjIvrYWC9+wCb2uZH5gjqlwZSEAYwhB7
44RoQwdilj8Zp7N/IFncVpB6vSQYPYJt7NbnDyQayU3j5ovjybJ1800fHLeX6DBeMesvB8KEqZE2
B4uEAOVosXJY712Zq6avKPDkhjk0JAS+7kwn3Z4bOQUgPcnBvyCYe+mG8Wa6Sn4gQEUWx9MMCeQ+
y0s4ACTyx4iYiDmipvwPkRDgTHBQw310Y0L3xfVrxKPFLvejz4JeiRRyMCnw7Yn3MPTkUPwYO+al
ZxELeM/tYheA0gn92n8NGYcYZMwK8h3SJJlvt90gfQnRG4zOpwW/zCA9OOR0v8+p40b7hK8w1oLT
5Uk=
=bE1F
-----END PGP SIGNATURE-----

--------------bVlFqC8A7AGyAxb3T60UWzGg--
