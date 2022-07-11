Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8E56F98A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FC411BD70;
	Mon, 11 Jul 2022 09:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571B311B808
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:03:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03FBB226B2;
 Mon, 11 Jul 2022 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657530219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YHFvpJ9HZGIrPeQPuzym79G8/kyQVIfu90WIp/40lrI=;
 b=r//wUZgrU9F6EXZ67R6ut5+bIdVZD/pOqxHq//7tgykvfDP5E2fL+fHSCGc0vRSGW037FD
 27Q0Ytov5xgQic1WjcJGyVGjmfNAlFlrCJN+XIN3/U1NSzFURJYDukaMHKne3MeM5utNNq
 YIwNALqqS4+CpqoDbeG040384kLHToU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657530219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YHFvpJ9HZGIrPeQPuzym79G8/kyQVIfu90WIp/40lrI=;
 b=8+nc45zwLuD3FGlEN42gW8xKvgVizWg0IaZuN3qR5/w0fyUEokB+d1JcFri1kqlZ/8l2IP
 ohLa3YzDe5Cf3qCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B717A13322;
 Mon, 11 Jul 2022 09:03:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +6aoK2rny2I+NQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 09:03:38 +0000
Message-ID: <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
Date: Mon, 11 Jul 2022 11:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i9HZ5JhPjq6YARR0Q2xTKKbe"
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i9HZ5JhPjq6YARR0Q2xTKKbe
Content-Type: multipart/mixed; boundary="------------0dPtI0BWIf6KarQZJXsRZvt7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named
 modes
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
In-Reply-To: <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>

--------------0dPtI0BWIf6KarQZJXsRZvt7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMDguMDcuMjIgdW0gMjA6MjEgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IFRoZSBtb2RlIHBhcnNpbmcgY29kZSByZWNvZ25pemVzIG5hbWVkIG1vZGVz
IG9ubHkgaWYgdGhleSBhcmUgZXhwbGljaXRseQ0KPiBsaXN0ZWQgaW4gdGhlIGludGVybmFs
IHdoaXRlbGlzdCwgd2hpY2ggaXMgY3VycmVudGx5IGxpbWl0ZWQgdG8gIk5UU0MiDQo+IGFu
ZCAiUEFMIi4NCj4gDQo+IFByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIGRyaXZlcnMgdG8gb3Zl
cnJpZGUgdGhpcyBsaXN0IHRvIHN1cHBvcnQgY3VzdG9tDQo+IG1vZGUgbmFtZXMuDQo+IA0K
PiBJZGVhbGx5LCB0aGlzIGxpc3Qgc2hvdWxkIGp1c3QgY29tZSBmcm9tIHRoZSBkcml2ZXIn
cyBhY3R1YWwgbGlzdCBvZg0KPiBtb2RlcywgYnV0IGNvbm5lY3Rvci0+cHJvYmVkX21vZGVz
IGlzIG5vdCB5ZXQgcG9wdWxhdGVkIGF0IHRoZSB0aW1lIG9mDQo+IHBhcnNpbmcuDQoNCkkn
dmUgbG9va2VkIGZvciBjb2RlIHRoYXQgdXNlcyB0aGVzZSBuYW1lcywgY291bGRuJ3QgZmlu
ZCBhbnkuIEhvdyBpcyANCnRoaXMgYmVpbmcgdXNlZCBpbiBwcmFjdGljZT8gRm9yIGV4YW1w
bGUsIGlmIEkgc2F5ICJQQUwiIG9uIHRoZSBjb21tYW5kIA0KbGluZSwgaXMgdGhlcmUgRFJN
IGNvZGUgdGhhdCBmaWxscyBpbiB0aGUgUEFMIG1vZGUgcGFyYW1ldGVycz8NCg0KQW5kIGFu
b3RoZXIgcXVlc3Rpb24gSSBoYXZlIGlzIHdoZXRoZXIgdGhpcyB3aGl0ZWxpc3QgYmVsb25n
cyBpbnRvIHRoZSANCmRyaXZlciBhdCBhbGwuIFN0YW5kYXJkIG1vZGVzIGV4aXN0IGluZGVw
ZW5kZW50IGZyb20gZHJpdmVycyBvciANCmhhcmR3YXJlLiBTaG91bGRuJ3QgdGhlcmUgc2lt
cGx5IGJlIGEgZ2xvYmFsIGxpc3Qgb2YgYWxsIHBvc3NpYmxlIG1vZGUgDQpuYW1lcz8gRHJp
dmVycyB3b3VsZCBmaWx0ZXIgb3V0IHRoZSB1bnN1cHBvcnRlZCBtb2RlcyBhbnl3YXkuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYyB8IDE1ICsrKysrKysrKysrLS0tLQ0KPiAgIGluY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaCB8IDEwICsrKysrKysrKysNCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jDQo+IGluZGV4IDljZTI3NWZiZGE1NjZiN2MuLjdhMDBlYjZkZjUwMmU5OTEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMNCj4gQEAgLTE3NDgsMjUgKzE3NDgsMzEgQEAgc3Rh
dGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMoY29uc3QgY2hhciAqc3Ry
LA0KPiAgIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZHJtX25hbWVkX21vZGVzX3doaXRl
bGlzdFtdID0gew0KPiAgIAkiTlRTQyIsDQo+ICAgCSJQQUwiLA0KPiArCU5VTEwNCj4gICB9
Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9uYW1lZF9t
b2RlKGNvbnN0IGNoYXIgKm5hbWUsDQo+ICAgCQkJCQkgICAgIHVuc2lnbmVkIGludCBsZW5n
dGgsDQo+ICAgCQkJCQkgICAgIGJvb2wgcmVmcmVzaCwNCj4gKwkJCQkJICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJCQkJICAgICBzdHJ1Y3Qg
ZHJtX2NtZGxpbmVfbW9kZSAqbW9kZSkNCj4gICB7DQo+ICsJY29uc3QgY2hhciAqIGNvbnN0
ICpuYW1lZF9tb2Rlc193aGl0ZWxpc3Q7DQo+ICAgCXVuc2lnbmVkIGludCBpOw0KPiAgIAlp
bnQgcmV0Ow0KPiAgIA0KPiAtCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGRybV9uYW1l
ZF9tb2Rlc193aGl0ZWxpc3QpOyBpKyspIHsNCj4gLQkJcmV0ID0gc3RyX2hhc19wcmVmaXgo
bmFtZSwgZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdFtpXSk7DQo+ICsJbmFtZWRfbW9kZXNf
d2hpdGVsaXN0ID0gY29ubmVjdG9yLT5uYW1lZF9tb2Rlc193aGl0ZWxpc3QgPyA6DQo+ICsJ
CQkJZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdDsNCj4gKw0KPiArCWZvciAoaSA9IDA7IG5h
bWVkX21vZGVzX3doaXRlbGlzdFtpXTsgaSsrKSB7DQo+ICsJCXJldCA9IHN0cl9oYXNfcHJl
Zml4KG5hbWUsIG5hbWVkX21vZGVzX3doaXRlbGlzdFtpXSk7DQo+ICAgCQlpZiAoIXJldCkN
Cj4gICAJCQljb250aW51ZTsNCj4gICANCj4gICAJCWlmIChyZWZyZXNoKQ0KPiAgIAkJCXJl
dHVybiAtRUlOVkFMOyAvKiBuYW1lZCArIHJlZnJlc2ggaXMgaW52YWxpZCAqLw0KPiAgIA0K
PiAtCQlzdHJjcHkobW9kZS0+bmFtZSwgZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdFtpXSk7
DQo+ICsJCXN0cmNweShtb2RlLT5uYW1lLCBuYW1lZF9tb2Rlc193aGl0ZWxpc3RbaV0pOw0K
PiAgIAkJbW9kZS0+c3BlY2lmaWVkID0gdHJ1ZTsNCj4gICAJCXJldHVybiAwOw0KPiAgIAl9
DQo+IEBAIC0xODUwLDcgKzE4NTYsOCBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRf
bGluZV9mb3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLA0KPiAgIAkvKiBG
aXJzdCBjaGVjayBmb3IgYSBuYW1lZCBtb2RlICovDQo+ICAgCWlmIChtb2RlX2VuZCkgew0K
PiAgIAkJcmV0ID0gZHJtX21vZGVfcGFyc2VfY21kbGluZV9uYW1lZF9tb2RlKG5hbWUsIG1v
ZGVfZW5kLA0KPiAtCQkJCQkJCXJlZnJlc2hfcHRyLCBtb2RlKTsNCj4gKwkJCQkJCQlyZWZy
ZXNoX3B0ciwgY29ubmVjdG9yLA0KPiArCQkJCQkJCW1vZGUpOw0KPiAgIAkJaWYgKHJldCkN
Cj4gICAJCQlyZXR1cm4gZmFsc2U7DQo+ICAgCX0NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiBp
bmRleCAzYWM0YmY4N2YyNTcxYzRjLi42MzYxZjhhNTk2YzAxMTA3IDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2Nvbm5lY3Rvci5oDQo+IEBAIC0xNjU5LDYgKzE2NTksMTYgQEAgc3RydWN0IGRybV9jb25u
ZWN0b3Igew0KPiAgIA0KPiAgIAkvKiogQGhkcl9zaW5rX21ldGFkYXRhOiBIRFIgTWV0YWRh
dGEgSW5mb3JtYXRpb24gcmVhZCBmcm9tIHNpbmsgKi8NCj4gICAJc3RydWN0IGhkcl9zaW5r
X21ldGFkYXRhIGhkcl9zaW5rX21ldGFkYXRhOw0KPiArDQo+ICsJLyoqDQo+ICsJICogQG5h
bWVkX21vZGVzX3doaXRlbGlzdDoNCj4gKwkgKg0KPiArCSAqIE9wdGlvbmFsIE5VTEwtdGVy
bWluYXRlZCBhcnJheSBvZiBuYW1lcyB0byBiZSBjb25zaWRlcmVkIHZhbGlkIG1vZGUNCj4g
KwkgKiBuYW1lcy4gIFRoaXMgbGV0cyB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBwYXJzZXIg
ZGlzdGluZ3Vpc2ggYmV0d2Vlbg0KPiArCSAqIG1vZGUgbmFtZXMgYW5kIGZyZWVzdGFuZGlu
ZyBleHRyYXMgYW5kL29yIG9wdGlvbnMuDQo+ICsJICogSWYgbm90IHNldCwgYSBzZXQgb2Yg
ZGVmYXVsdHMgd2lsbCBiZSB1c2VkLg0KPiArCSAqLw0KPiArCWNvbnN0IGNoYXIgKiBjb25z
dCAqbmFtZWRfbW9kZXNfd2hpdGVsaXN0Ow0KPiAgIH07DQo+ICAgDQo+ICAgI2RlZmluZSBv
YmpfdG9fY29ubmVjdG9yKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciwgYmFzZSkNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0dPtI0BWIf6KarQZJXsRZvt7--

--------------i9HZ5JhPjq6YARR0Q2xTKKbe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL52oFAwAAAAAACgkQlh/E3EQov+AL
yQ//T1sdtC7YTRKogLLqelJAozXBm8YVBGwx46Tx0OM3fS4AJRH5a7VxaAu4VY/koVsNhXomDocb
PfWfy+mixDOSpxyBv4j6b9rn/nuG2wrHvBFvqzJTA8WthwGQtKImAG1b+QUdG7DAQQs5ILRtQZRi
TO0dK1pzJ5DLsclz9wgMxBiaZ0ikzNdHx05ok9CIRbqpWb+dzM7RncMVM+i+kPY/J+DFKOzFdnUr
imDnX5Y/XM4K/arrJGSeSTQiWCvlqO5SysRAfKYQcv9e7JN388N3qyDZQEMpqUbjSmvK0/zh5NO/
CMXzSIoOC9ClBCjsrqM9JzsFJFJ87o6ExIP3qzxdtc8Jq+gR8YKt710e83kaDJDSGIl6ssjYFI/8
4/PZkAjYbrZVqc45/gJgRIwcegw6MXoGl1gAQX45jQj4OSCECnbSwxAdQ9cD0bc2FSC4yz+Q861W
4bQkXLctnKFsOE1rDfTF1QKLZm3hh8jzFhmL5LE0f0OYXl5P12Tcmx/0gw3Xg54GvacB4ctCFzbZ
hd103iaGPvPaqIJkkuIRcmAeOcSG4vIM8OBIUMPrO2mVCxq7c6cferG8UTkVx6m2OlCoGHWftB4v
pdGujCckewx7fo90JDfC4+97UejVfwLHMGrjv79HrVgod1wM01kJHXa2i1XWuHo+cuL1d/aKGA1J
A/k=
=YsXd
-----END PGP SIGNATURE-----

--------------i9HZ5JhPjq6YARR0Q2xTKKbe--
