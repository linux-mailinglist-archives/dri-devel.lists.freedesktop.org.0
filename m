Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2A4A9FEF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8323310E874;
	Fri,  4 Feb 2022 19:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E1110E7E8;
 Fri,  4 Feb 2022 19:19:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 624A51F382;
 Fri,  4 Feb 2022 19:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644002377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtMJ3b/CDoNDE4PkdcWuGwLgfj1Wo8Xa9lODmUBy7fk=;
 b=Ez8DlGcH2v9DeqlzfdNN5stgrAYLB0H7lSvzwZu2TZyxisUH2JiiVuhYYVlrl0VnL3atQe
 vE+c7nKGXyplxZvfpI4KB/MNjQoSjXzpxHBcExk22R7lA+GZYjWrN3eLmO2zCScRis+wet
 rWoYq+4zx2XGL5LW5G3cdA5CocFsavE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644002377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtMJ3b/CDoNDE4PkdcWuGwLgfj1Wo8Xa9lODmUBy7fk=;
 b=1NtEF/xSZ7kV0wAOsKn5Ha0oLecoZeBZjjbNjhqc9kRXiQce56SHbLL/Gmyv1VSXQa4hbR
 HbDdHAh1iXy0HUAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 249CF13ADE;
 Fri,  4 Feb 2022 19:19:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rXLnB0l8/WG5BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 19:19:37 +0000
Message-ID: <2c91c0fa-bad6-2c57-5728-2c059404412f@suse.de>
Date: Fri, 4 Feb 2022 20:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/19] drm/i915/guc: Convert golden context init to
 iosys_map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-8-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220204174436.830121-8-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uT0KSQZjnuYF0nNHr0TsTzDN"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uT0KSQZjnuYF0nNHr0TsTzDN
Content-Type: multipart/mixed; boundary="------------FAnoxU0T89AgzTwdDJNuoPrX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <2c91c0fa-bad6-2c57-5728-2c059404412f@suse.de>
Subject: Re: [PATCH 07/19] drm/i915/guc: Convert golden context init to
 iosys_map
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-8-lucas.demarchi@intel.com>
In-Reply-To: <20220204174436.830121-8-lucas.demarchi@intel.com>

--------------FAnoxU0T89AgzTwdDJNuoPrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTg6NDQgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IE5vdyB0aGUgbWFwIGlzIHNhdmVkIGR1cmluZyBjcmVhdGlvbiwgc28gdXNlIGl0IHRvIGlu
aXRpYWxpemUgdGhlDQo+IGdvbGRlbiBjb250ZXh0LCByZWFkaW5nIGZyb20gc2htZW0gYW5k
IHdyaXRpbmcgdG8gZWl0aGVyIHN5c3RlbSBvciBJTw0KPiBtZW1vcnkuDQo+IA0KPiBDYzog
TWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IEpvaG4gSGFycmlzb24gPEpv
aG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4NCj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERl
IE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfYWRzLmMgfCAyNSArKysrKysrKysrKy0t
LS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L3VjL2ludGVsX2d1Y19hZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2d1Y19hZHMuYw0KPiBpbmRleCAzYTBhZmNlNzU2NGUuLmQzMmI0MDdhMmQyNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2Fkcy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMuYw0KPiBA
QCAtNDczLDE4ICs0NzMsMTcgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmZp
bmRfZW5naW5lX3N0YXRlKHN0cnVjdCBpbnRlbF9ndCAqZ3QsIHU4IGVuZ2luZV8NCj4gICAN
Cj4gICBzdGF0aWMgdm9pZCBndWNfaW5pdF9nb2xkZW5fY29udGV4dChzdHJ1Y3QgaW50ZWxf
Z3VjICpndWMpDQo+ICAgew0KPiAtCXN0cnVjdCBfX2d1Y19hZHNfYmxvYiAqYmxvYiA9IGd1
Yy0+YWRzX2Jsb2I7DQo+ICAgCXN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZTsNCj4g
ICAJc3RydWN0IGludGVsX2d0ICpndCA9IGd1Y190b19ndChndWMpOw0KPiArCXN0cnVjdCBp
b3N5c19tYXAgZ29sZGVuX2NvbnRleHRfbWFwOw0KPiAgIAl1MzIgYWRkcl9nZ3R0LCBvZmZz
ZXQ7DQo+ICAgCXUzMiB0b3RhbF9zaXplID0gMCwgYWxsb2Nfc2l6ZSwgcmVhbF9zaXplOw0K
PiAgIAl1OCBlbmdpbmVfY2xhc3MsIGd1Y19jbGFzczsNCj4gLQl1OCAqcHRyOw0KPiAgIA0K
PiAgIAlpZiAoIWludGVsX3VjX3VzZXNfZ3VjX3N1Ym1pc3Npb24oJmd0LT51YykpDQo+ICAg
CQlyZXR1cm47DQo+ICAgDQo+IC0JR0VNX0JVR19PTighYmxvYik7DQo+ICsJR0VNX0JVR19P
Tihpb3N5c19tYXBfaXNfbnVsbCgmZ3VjLT5hZHNfbWFwKSk7DQo+ICAgDQo+ICAgCS8qDQo+
ICAgCSAqIEdvIGJhY2sgYW5kIGZpbGwgaW4gdGhlIGdvbGRlbiBjb250ZXh0IGRhdGEgbm93
IHRoYXQgaXQgaXMNCj4gQEAgLTQ5MiwxNSArNDkxLDE1IEBAIHN0YXRpYyB2b2lkIGd1Y19p
bml0X2dvbGRlbl9jb250ZXh0KHN0cnVjdCBpbnRlbF9ndWMgKmd1YykNCj4gICAJICovDQo+
ICAgCW9mZnNldCA9IGd1Y19hZHNfZ29sZGVuX2N0eHRfb2Zmc2V0KGd1Yyk7DQo+ICAgCWFk
ZHJfZ2d0dCA9IGludGVsX2d1Y19nZ3R0X29mZnNldChndWMsIGd1Yy0+YWRzX3ZtYSkgKyBv
ZmZzZXQ7DQo+IC0JcHRyID0gKCh1OCAqKWJsb2IpICsgb2Zmc2V0Ow0KPiArDQo+ICsJZ29s
ZGVuX2NvbnRleHRfbWFwID0gSU9TWVNfTUFQX0lOSVRfT0ZGU0VUKCZndWMtPmFkc19tYXAs
IG9mZnNldCk7DQo+ICAgDQo+ICAgCWZvciAoZW5naW5lX2NsYXNzID0gMDsgZW5naW5lX2Ns
YXNzIDw9IE1BWF9FTkdJTkVfQ0xBU1M7ICsrZW5naW5lX2NsYXNzKSB7DQo+ICAgCQlpZiAo
ZW5naW5lX2NsYXNzID09IE9USEVSX0NMQVNTKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAgIA0K
PiAgIAkJZ3VjX2NsYXNzID0gZW5naW5lX2NsYXNzX3RvX2d1Y19jbGFzcyhlbmdpbmVfY2xh
c3MpOw0KPiAtDQo+IC0JCWlmICghYmxvYi0+c3lzdGVtX2luZm8uZW5naW5lX2VuYWJsZWRf
bWFza3NbZ3VjX2NsYXNzXSkNCj4gKwkJaWYgKCFhZHNfYmxvYl9yZWFkKGd1Yywgc3lzdGVt
X2luZm8uZW5naW5lX2VuYWJsZWRfbWFza3NbZ3VjX2NsYXNzXSkpDQo+ICAgCQkJY29udGlu
dWU7DQo+ICAgDQo+ICAgCQlyZWFsX3NpemUgPSBpbnRlbF9lbmdpbmVfY29udGV4dF9zaXpl
KGd0LCBlbmdpbmVfY2xhc3MpOw0KPiBAQCAtNTExLDE4ICs1MTAsMjAgQEAgc3RhdGljIHZv
aWQgZ3VjX2luaXRfZ29sZGVuX2NvbnRleHQoc3RydWN0IGludGVsX2d1YyAqZ3VjKQ0KPiAg
IAkJaWYgKCFlbmdpbmUpIHsNCj4gICAJCQlkcm1fZXJyKCZndC0+aTkxNS0+ZHJtLCAiTm8g
ZW5naW5lIHN0YXRlIHJlY29yZGVkIGZvciBjbGFzcyAlZCFcbiIsDQo+ICAgCQkJCWVuZ2lu
ZV9jbGFzcyk7DQo+IC0JCQlibG9iLT5hZHMuZW5nX3N0YXRlX3NpemVbZ3VjX2NsYXNzXSA9
IDA7DQo+IC0JCQlibG9iLT5hZHMuZ29sZGVuX2NvbnRleHRfbHJjYVtndWNfY2xhc3NdID0g
MDsNCj4gKwkJCWFkc19ibG9iX3dyaXRlKGd1YywgYWRzLmVuZ19zdGF0ZV9zaXplW2d1Y19j
bGFzc10sIDApOw0KPiArCQkJYWRzX2Jsb2Jfd3JpdGUoZ3VjLCBhZHMuZ29sZGVuX2NvbnRl
eHRfbHJjYVtndWNfY2xhc3NdLCAwKTsNCj4gICAJCQljb250aW51ZTsNCj4gICAJCX0NCj4g
ICANCj4gLQkJR0VNX0JVR19PTihibG9iLT5hZHMuZW5nX3N0YXRlX3NpemVbZ3VjX2NsYXNz
XSAhPQ0KPiArCQlHRU1fQlVHX09OKGFkc19ibG9iX3JlYWQoZ3VjLCBhZHMuZW5nX3N0YXRl
X3NpemVbZ3VjX2NsYXNzXSkgIT0NCj4gICAJCQkgICByZWFsX3NpemUgLSBMUkNfU0tJUF9T
SVpFKTsNCj4gLQkJR0VNX0JVR19PTihibG9iLT5hZHMuZ29sZGVuX2NvbnRleHRfbHJjYVtn
dWNfY2xhc3NdICE9IGFkZHJfZ2d0dCk7DQo+ICsJCUdFTV9CVUdfT04oYWRzX2Jsb2JfcmVh
ZChndWMsIGFkcy5nb2xkZW5fY29udGV4dF9scmNhW2d1Y19jbGFzc10pICE9IGFkZHJfZ2d0
dCk7DQo+ICsNCj4gICAJCWFkZHJfZ2d0dCArPSBhbGxvY19zaXplOw0KPiAgIA0KPiAtCQlz
aG1lbV9yZWFkKGVuZ2luZS0+ZGVmYXVsdF9zdGF0ZSwgMCwgcHRyLCByZWFsX3NpemUpOw0K
PiAtCQlwdHIgKz0gYWxsb2Nfc2l6ZTsNCj4gKwkJc2htZW1fcmVhZF90b19pb3N5c19tYXAo
ZW5naW5lLT5kZWZhdWx0X3N0YXRlLCAwLA0KPiArCQkJCQkmZ29sZGVuX2NvbnRleHRfbWFw
LCByZWFsX3NpemUpOw0KPiArCQlpb3N5c19tYXBfaW5jcigmZ29sZGVuX2NvbnRleHRfbWFw
LCBhbGxvY19zaXplKTsNCg0KVXNlIGFuIG9mZnNldCB0byBpbmRleCBpbnRvIGlvc3lzX21h
cC4gRXZlbiBpZiB0aGF0IG1lYW5zIHRvIGFkZCBhbm90aGVyIA0KcGFyYW1ldGVyIHRvIHNo
bWVtX3JlYWRfdG9faW9zeXNfbWFwKCkuIFRoaXMgd2lsbCBzYXZlIHlvdSANCklPU1lTX01B
UF9JTklUX09GRlNFVCgpIGFuZCBpb3N5c19tYXBfaW5jcigpLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+ICAgCX0NCj4gICANCj4gICAJR0VNX0JVR19PTihndWMtPmFkc19nb2xk
ZW5fY3R4dF9zaXplICE9IHRvdGFsX3NpemUpOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------FAnoxU0T89AgzTwdDJNuoPrX--

--------------uT0KSQZjnuYF0nNHr0TsTzDN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9fEgFAwAAAAAACgkQlh/E3EQov+Bp
hg/8DMGGVrr283eW/ZX0cGvOM0WvUkZrrjaAm5NhCasEyaVwDKfmuJtZg4tcQI5U1TxSO6UJxbRn
PZ+1rjQS9SdcnKJA0iDhMqcVap8YhAuf99JuX9yxMmXfi20osT1knNuh3egxeRp1ZKiLgkD1Vmam
+6qUlpELnL+LUbZnaKI24wpyi7h+U/eyRlEezl+N1trU0HenuAbKUlWH2EiGqRYKiEUn23YoXn5e
CPHtdrQyEv5St6Bz9GNh/5FSrvw77YRn/2ciijNkmpIIlI+5WLhPJ6M76yLCqtjmwHTT/CNZndct
6KMCsJ218Oi2rOcVEBlIHfO52p5ZrdizL7PlU3xhLRF7Wmj3+6WiykMCJaaL8QTRoFE7mfkN3NDf
wjV+PIq69qBka9CDO44ekghcrWDzZAMAzIs9yQULT9ilUGC0lmk5JJeVHkuclhq0LkEnmMEP+Zu3
OsNje+j8L4Pd7e6Pe5u919+4pdkauWibhTiJhFUxIZGdKWa7iXd4T0mVXrxcI2kouePGOOCUQVu4
XkdKGNOLHml8613CVaBZ2QZHs7mJKCvMGOLjZHKkdIF7BtalEUvDUW8ROZoLlwAIU3CllWrYAvyP
2wETrixPNlhjBObizFVbK0TjuLm+a6uxKey7gtSJl+fLLA6fnZ9MGJpuMW7K5HGZ6aMo0QSDg/j+
Lao=
=4DS/
-----END PGP SIGNATURE-----

--------------uT0KSQZjnuYF0nNHr0TsTzDN--
