Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F167CE21
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A3D10E90E;
	Thu, 26 Jan 2023 14:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06EF10E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:30:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4126D21E47;
 Thu, 26 Jan 2023 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674743432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UbFex8bqQGLNvfMgLpbZkeRVKBhXvClVrj84gUanCVw=;
 b=kJ/OhHQz1O8Q0In6t8YidtTjfVgbc3Z2w2oDsKHO2YXyT1nCw9kj7fwydUpB8oVi4XopU0
 WcBA2FzdoMeOu/FF8yo54x864MsX16bdAfFdQ6pCmnNoVfK4ZJWo8/PfkGxDrrOai99esh
 RUApmWfxtH50qVEYLORneEilhY9eQHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674743432;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UbFex8bqQGLNvfMgLpbZkeRVKBhXvClVrj84gUanCVw=;
 b=1C7zxkRl7YZKh/laKQTZ2xb9BbWxSN6GYbZ2NYX/KlNXmJ0HaOiTXHzm/WmlgPP72Ym81Q
 x1GzMwtn4nEuIqDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C12B13A09;
 Thu, 26 Jan 2023 14:30:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zxXyCYiO0mMtBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Jan 2023 14:30:32 +0000
Message-ID: <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
Date: Thu, 26 Jan 2023 15:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm/client: fix circular reference counting issue
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
References: <20230126102814.8722-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230126102814.8722-1-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Sq6ovmbqQpfjyd009mPvZsL"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Sq6ovmbqQpfjyd009mPvZsL
Content-Type: multipart/mixed; boundary="------------2x7mMTemwIkteetnxOqmI1uX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org
Message-ID: <0687b946-c542-6705-06c6-de3a8e9ff279@suse.de>
Subject: Re: [PATCH 1/2] drm/client: fix circular reference counting issue
References: <20230126102814.8722-1-christian.koenig@amd.com>
In-Reply-To: <20230126102814.8722-1-christian.koenig@amd.com>

--------------2x7mMTemwIkteetnxOqmI1uX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjMgdW0gMTE6Mjggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBXZSByZWZlcmVuY2UgZHVtcCBidWZmZXJzIGJvdGggYnkgdGhlaXIgaGFuZGxlIGFzIHdl
bGwgYXMgdGhlaXINCj4gb2JqZWN0LiBUaGUgcHJvYmxlbSBpcyBub3cgdGhhdCB3aGVuIGFu
eWJvZHkgaXRlcmF0ZXMgb3ZlciB0aGUgRFJNDQo+IGZyYW1lYnVmZmVycyBhbmQgZXhwb3J0
cyB0aGUgdW5kZXJseWluZyBHRU0gb2JqZWN0cyB0aHJvdWdoIERNQS1idWYNCj4gd2UgcnVu
IGludG8gYSBjaXJjdWxhciByZWZlcmVuY2UgY291bnQgc2l0dWF0aW9uLg0KPiANCj4gVGhl
IHJlc3VsdCBpcyB0aGF0IHRoZSBmYmRldiBoYW5kbGluZyBob2xkcyB0aGUgR0VNIGhhbmRs
ZSBwcmV2ZW50aW5nDQo+IHRoZSBETUEtYnVmIGluIHRoZSBHRU0gb2JqZWN0IHRvIGJlIHJl
bGVhc2VkLiBUaGlzIERNQS1idWYgaW4gdHVybg0KPiBob2xkcyBhIHJlZmVyZW5jZSB0byB0
aGUgZHJpdmVyIG1vZHVsZSB3aGljaCBvbiB1bmxvYWQgd291bGQgcmVsZWFzZQ0KPiB0aGUg
ZmJkZXYuDQo+IA0KPiBCcmVhayB0aGF0IGxvb3AgYnkgcmVsZWFzaW5nIHRoZSBoYW5kbGUg
YXMgc29vbiBhcyB0aGUgRFJNDQo+IGZyYW1lYnVmZmVyIG9iamVjdCBpcyBjcmVhdGVkLiBU
aGUgRFJNIGZyYW1lYnVmZmVyIGFuZCB0aGUgRFJNIGNsaWVudA0KPiBidWZmZXIgc3RydWN0
dXJlIHN0aWxsIGhvbGQgYSByZWZlcmVuY2UgdG8gdGhlIHVuZGVybHlpbmcgR0VNIG9iamVj
dA0KPiBwcmV2ZW50aW5nIGl0cyBkZXN0cnVjdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gRml4ZXM6
IGM3NmYwZjdjYjU0NiAoImRybTogQmVnaW4gYW4gQVBJIGZvciBpbi1rZXJuZWwgY2xpZW50
cyIpDQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4NCg0KSSB0ZXN0ZWQgd2l0aCBX
ZXN0b24gYW5kIEdub21lIGluIFgxMSBhbmQgV2F5bGFuZCBtb2RlIHVuZGVyIHNpbXBsZWRy
bSwgDQp3aGljaCBJIHN0YXJ0ZWQgc3RvcHBlZCBmcm9tIHRoZSBjb25zb2xlLiBObyBvYnZp
b3VzIHByb2JsZW1zLg0KDQpJIGhlYXJkIHRoYXQgc3dheS93bHJvb3RzIGhhcyBpc3N1ZXMg
d2l0aCBkcml2ZXJzIHRoYXQgZG9uJ3Qgc3VwcG9ydCANCmRtYS1idWYuIE1heWJlKCEpIHRo
YXQgY291bGQgYmUgYWZmZWN0ZWQgYnkgdGhpcyBwYXRjaC4NCg0KQW55d2F5LCB0YWtlIG15
IHItYiwgdC1iIHRhZ3MuDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NClRlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQoNClRoYW5rIHlvdSBmb3IgZml4aW5nIHRoaXMgYnVnLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gICBp
bmNsdWRlL2RybS9kcm1fY2xpZW50LmggICAgIHwgIDUgLS0tLS0NCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NsaWVudC5jDQo+IGluZGV4IDAwOWU3YjEwNDU1Yy4uZjYyOTJiYTBlNmZjIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4gQEAgLTI0MywyMSArMjQzLDE3IEBAIHZvaWQg
ZHJtX2NsaWVudF9kZXZfcmVzdG9yZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIGRybV9jbGllbnRfYnVmZmVyX2RlbGV0ZShzdHJ1Y3QgZHJtX2Ns
aWVudF9idWZmZXIgKmJ1ZmZlcikNCj4gICB7DQo+IC0Jc3RydWN0IGRybV9kZXZpY2UgKmRl
diA9IGJ1ZmZlci0+Y2xpZW50LT5kZXY7DQo+IC0NCj4gICAJaWYgKGJ1ZmZlci0+Z2VtKSB7
DQo+ICAgCQlkcm1fZ2VtX3Z1bm1hcF91bmxvY2tlZChidWZmZXItPmdlbSwgJmJ1ZmZlci0+
bWFwKTsNCj4gICAJCWRybV9nZW1fb2JqZWN0X3B1dChidWZmZXItPmdlbSk7DQo+ICAgCX0N
Cj4gICANCj4gLQlpZiAoYnVmZmVyLT5oYW5kbGUpDQo+IC0JCWRybV9tb2RlX2Rlc3Ryb3lf
ZHVtYihkZXYsIGJ1ZmZlci0+aGFuZGxlLCBidWZmZXItPmNsaWVudC0+ZmlsZSk7DQo+IC0N
Cj4gICAJa2ZyZWUoYnVmZmVyKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBk
cm1fY2xpZW50X2J1ZmZlciAqDQo+IC1kcm1fY2xpZW50X2J1ZmZlcl9jcmVhdGUoc3RydWN0
IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMyIGhlaWdodCwgdTMyIGZv
cm1hdCkNCj4gK2RybV9jbGllbnRfYnVmZmVyX2NyZWF0ZShzdHJ1Y3QgZHJtX2NsaWVudF9k
ZXYgKmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LA0KPiArCQkJIHUzMiBmb3JtYXQs
IHUzMiAqaGFuZGxlKQ0KPiAgIHsNCj4gICAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhmb3JtYXQpOw0KPiAgIAlzdHJ1Y3QgZHJtX21v
ZGVfY3JlYXRlX2R1bWIgZHVtYl9hcmdzID0geyB9Ow0KPiBAQCAtMjc5LDE2ICsyNzUsMTUg
QEAgZHJtX2NsaWVudF9idWZmZXJfY3JlYXRlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xp
ZW50LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUNCj4gICAJaWYgKHJldCkNCj4gICAJCWdv
dG8gZXJyX2RlbGV0ZTsNCj4gICANCj4gLQlidWZmZXItPmhhbmRsZSA9IGR1bWJfYXJncy5o
YW5kbGU7DQo+IC0JYnVmZmVyLT5waXRjaCA9IGR1bWJfYXJncy5waXRjaDsNCj4gLQ0KPiAg
IAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoY2xpZW50LT5maWxlLCBkdW1iX2FyZ3Mu
aGFuZGxlKTsNCj4gICAJaWYgKCFvYmopICB7DQo+ICAgCQlyZXQgPSAtRU5PRU5UOw0KPiAg
IAkJZ290byBlcnJfZGVsZXRlOw0KPiAgIAl9DQo+ICAgDQo+ICsJYnVmZmVyLT5waXRjaCA9
IGR1bWJfYXJncy5waXRjaDsNCj4gICAJYnVmZmVyLT5nZW0gPSBvYmo7DQo+ICsJKmhhbmRs
ZSA9IGR1bWJfYXJncy5oYW5kbGU7DQo+ICAgDQo+ICAgCXJldHVybiBidWZmZXI7DQo+ICAg
DQo+IEBAIC0zNzUsNyArMzcwLDggQEAgc3RhdGljIHZvaWQgZHJtX2NsaWVudF9idWZmZXJf
cm1mYihzdHJ1Y3QgZHJtX2NsaWVudF9idWZmZXIgKmJ1ZmZlcikNCj4gICB9DQo+ICAgDQo+
ICAgc3RhdGljIGludCBkcm1fY2xpZW50X2J1ZmZlcl9hZGRmYihzdHJ1Y3QgZHJtX2NsaWVu
dF9idWZmZXIgKmJ1ZmZlciwNCj4gLQkJCQkgICB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUz
MiBmb3JtYXQpDQo+ICsJCQkJICAgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgZm9ybWF0
LA0KPiArCQkJCSAgIHUzMiBoYW5kbGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2NsaWVu
dF9kZXYgKmNsaWVudCA9IGJ1ZmZlci0+Y2xpZW50Ow0KPiAgIAlzdHJ1Y3QgZHJtX21vZGVf
ZmJfY21kIGZiX3JlcSA9IHsgfTsNCj4gQEAgLTM4Nyw3ICszODMsNyBAQCBzdGF0aWMgaW50
IGRybV9jbGllbnRfYnVmZmVyX2FkZGZiKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVm
ZmVyLA0KPiAgIAlmYl9yZXEuZGVwdGggPSBpbmZvLT5kZXB0aDsNCj4gICAJZmJfcmVxLndp
ZHRoID0gd2lkdGg7DQo+ICAgCWZiX3JlcS5oZWlnaHQgPSBoZWlnaHQ7DQo+IC0JZmJfcmVx
LmhhbmRsZSA9IGJ1ZmZlci0+aGFuZGxlOw0KPiArCWZiX3JlcS5oYW5kbGUgPSBoYW5kbGU7
DQo+ICAgCWZiX3JlcS5waXRjaCA9IGJ1ZmZlci0+cGl0Y2g7DQo+ICAgDQo+ICAgCXJldCA9
IGRybV9tb2RlX2FkZGZiKGNsaWVudC0+ZGV2LCAmZmJfcmVxLCBjbGllbnQtPmZpbGUpOw0K
PiBAQCAtNDI0LDEzICs0MjAsMjQgQEAgc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICoNCj4g
ICBkcm1fY2xpZW50X2ZyYW1lYnVmZmVyX2NyZWF0ZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYg
KmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgZm9ybWF0KQ0KPiAgIHsNCj4g
ICAJc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXI7DQo+ICsJdTMyIGhhbmRsZTsN
Cj4gICAJaW50IHJldDsNCj4gICANCj4gLQlidWZmZXIgPSBkcm1fY2xpZW50X2J1ZmZlcl9j
cmVhdGUoY2xpZW50LCB3aWR0aCwgaGVpZ2h0LCBmb3JtYXQpOw0KPiArCWJ1ZmZlciA9IGRy
bV9jbGllbnRfYnVmZmVyX2NyZWF0ZShjbGllbnQsIHdpZHRoLCBoZWlnaHQsIGZvcm1hdCwN
Cj4gKwkJCQkJICAmaGFuZGxlKTsNCj4gICAJaWYgKElTX0VSUihidWZmZXIpKQ0KPiAgIAkJ
cmV0dXJuIGJ1ZmZlcjsNCj4gICANCj4gLQlyZXQgPSBkcm1fY2xpZW50X2J1ZmZlcl9hZGRm
YihidWZmZXIsIHdpZHRoLCBoZWlnaHQsIGZvcm1hdCk7DQo+ICsJcmV0ID0gZHJtX2NsaWVu
dF9idWZmZXJfYWRkZmIoYnVmZmVyLCB3aWR0aCwgaGVpZ2h0LCBmb3JtYXQsIGhhbmRsZSk7
DQo+ICsNCj4gKwkvKg0KPiArCSAqIFRoZSBoYW5kbGUgaXMgb25seSBuZWVkZWQgZm9yIGNy
ZWF0aW5nIHRoZSBmcmFtZWJ1ZmZlciwgZGVzdHJveSBpdA0KPiArCSAqIGFnYWluIHRvIHNv
bHZlIGEgY2lyY3VsYXIgZGVwZW5kZW5jeSBzaG91bGQgYW55Ym9keSBleHBvcnQgdGhlIEdF
TQ0KPiArCSAqIG9iamVjdCBhcyBETUEtYnVmLiBUaGUgZnJhbWVidWZmZXIgYW5kIG91ciBi
dWZmZXIgc3RydWN0dXJlIGFyZSBzdGlsbA0KPiArCSAqIGhvbGRpbmcgcmVmZXJlbmNlcyB0
byB0aGUgR0VNIG9iamVjdCB0byBwcmV2ZW50IGl0cyBkZXN0cnVjdGlvbi4NCj4gKwkgKi8N
Cj4gKwlkcm1fbW9kZV9kZXN0cm95X2R1bWIoY2xpZW50LT5kZXYsIGhhbmRsZSwgY2xpZW50
LT5maWxlKTsNCj4gKw0KPiAgIAlpZiAocmV0KSB7DQo+ICAgCQlkcm1fY2xpZW50X2J1ZmZl
cl9kZWxldGUoYnVmZmVyKTsNCj4gICAJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xp
ZW50LmgNCj4gaW5kZXggMzk0ODI1MjdhNzc1Li5iNWFjZGFiNzM3NjYgMTAwNjQ0DQo+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9jbGllbnQuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1f
Y2xpZW50LmgNCj4gQEAgLTEzNCwxMSArMTM0LDYgQEAgc3RydWN0IGRybV9jbGllbnRfYnVm
ZmVyIHsNCj4gICAJICovDQo+ICAgCXN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50Ow0K
PiAgIA0KPiAtCS8qKg0KPiAtCSAqIEBoYW5kbGU6IEJ1ZmZlciBoYW5kbGUNCj4gLQkgKi8N
Cj4gLQl1MzIgaGFuZGxlOw0KPiAtDQo+ICAgCS8qKg0KPiAgIAkgKiBAcGl0Y2g6IEJ1ZmZl
ciBwaXRjaA0KPiAgIAkgKi8NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------2x7mMTemwIkteetnxOqmI1uX--

--------------0Sq6ovmbqQpfjyd009mPvZsL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPSjocFAwAAAAAACgkQlh/E3EQov+A9
1hAAnuWiaDx+8RiTz6UJ4lE3KJHM9P/Y+MDy9BHLHFVuex5mKmsYFD49O3i0gBcOC9J2HVUlx9Ib
UErulMdLzNfSsd49CJLuI1SEQGG1lZnVdWx9P6nUa2uSJk0tawNJfXaGss+r2Lv7cEIHoapHv9wS
jHCQZsFrCaypS5bTPw6YklAXWNrjaE4mzvtjaxDTbsXB0TFHf6W6675EWSHjHz16wYvsFYAq7Wtd
kZHVDyMfGnRPRtyOhre6g7MZAZx49WoQFC1CAM2itzgK8dtCnxjBTvXsUbgpIalPySTCAFrll3Z0
z9NZGWekwpjhuRu8shb79oV970iWHvdgHj5ucShyt3OjwtNyetA3UQ2E7LZXrTbE7s3KPdVfEF5l
AVLXAuKfTj9Upd3LbWOhX1B7WRaK/QY0n5YL2iO4wH/y4d3w8oxjMG4JgnPLYAJ41YUL9ta/Rk+q
DpOryRrzh1Knax5rHsEuRhaKaCPY32ARXyKbFLgGqDLWi23fLGSXTEJMHw4b6MxvPad1dHQR1ZvN
XNDRwsPI8IMz7PL2bIZvPmdPdomEKnHae9blNhv8GT5icaS8vumi6pktC6amARb7rSUSbNXBVU+K
wpNVl8UuI+xAOkqXauxGWnlNfHaQYRoceRogrDByESTrzt1U+MeWSiKa1AuSbU7j04lDTPP6Xx4c
LTE=
=m+2p
-----END PGP SIGNATURE-----

--------------0Sq6ovmbqQpfjyd009mPvZsL--
