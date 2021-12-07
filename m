Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C339C46B68D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 10:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30080ABA94;
	Tue,  7 Dec 2021 09:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E43ABA87
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 09:03:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0850A212C5;
 Tue,  7 Dec 2021 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638867829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjWIJytTlHcha5Qm4NacN1RpSmZSQ9jLIS41iAp4aww=;
 b=WkFeEPIcMVRLyK+QC/PCeNyKwzek9jUyExMvSUfe6pIHE66ZMsRbE5vlX8QpIppZhXGWd7
 fj0MhA0CHobdSeUOUCeFGsSBLkk7mMzLJlGWmrg5c8O778u2yV5T8mP5554Vanid5dOBEe
 ypMASqNLjKHtwjKdWruyu8wgkOUPtf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638867829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjWIJytTlHcha5Qm4NacN1RpSmZSQ9jLIS41iAp4aww=;
 b=oUe1YhK4FnkPFk9HnLOH7U2jwFNGX6osMaCyF2r5sfZTmAeLb9+VmGyaQLQ2VzJB20jZPx
 EfBktiqT10wP2yBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7808613513;
 Tue,  7 Dec 2021 09:03:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wQusFnMjr2GvRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 09:03:47 +0000
Message-ID: <011d10c1-9c2c-8b4f-ede1-987ac678701b@suse.de>
Date: Tue, 7 Dec 2021 10:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
 <353db677-0060-f673-28ef-72401dd5b84b@suse.de>
In-Reply-To: <353db677-0060-f673-28ef-72401dd5b84b@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RHJtxcQWMYsdr70wiWRRBcKM"
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
Cc: dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RHJtxcQWMYsdr70wiWRRBcKM
Content-Type: multipart/mixed; boundary="------------V0c0gQA4mzB8t89fxQ2JmaXx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <011d10c1-9c2c-8b4f-ede1-987ac678701b@suse.de>
Subject: Re: [PATCH v2 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
References: <20211207072943.121961-1-marcan@marcan.st>
 <20211207072943.121961-2-marcan@marcan.st>
 <353db677-0060-f673-28ef-72401dd5b84b@suse.de>
In-Reply-To: <353db677-0060-f673-28ef-72401dd5b84b@suse.de>

--------------V0c0gQA4mzB8t89fxQ2JmaXx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA3LjEyLjIxIHVtIDEwOjAyIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAwNy4xMi4yMSB1bSAwODoyOSBzY2hyaWViIEhlY3RvciBNYXJ0aW46
DQo+PiBUaGlzIGNvZGUgaXMgcmVxdWlyZWQgZm9yIGJvdGggc2ltcGxlZmIgYW5kIHNpbXBs
ZWRybSwgc28gbGV0J3MgbW92ZSBpdA0KPj4gaW50byB0aGUgT0YgY29yZSBpbnN0ZWFkIG9m
IGhhdmluZyBpdCBhcyBhbiBhZC1ob2MgaW5pdGNhbGwgaW4gdGhlDQo+PiBkcml2ZXJzLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBtYXJjYW4uc3Q+
DQo+IA0KPiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCldlbGwsIHBsZWFzZSBkb24ndCB0YWtlIHRoaXMgYXMgYSByZXZpZXcuIDopDQoN
Cj4gDQo+IFRoaXMgbG9va3MgbXVjaCBiZXR0ZXIgdGhhbiBiZWZvcmUuIFRoYW5rIHlvdS4N
Cj4gDQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvb2YvcGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNSArKysrKw0KPj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVmYi5j
IHwgMjEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvb2YvcGxhdGZvcm0uYyBiL2RyaXZlcnMvb2YvcGxhdGZvcm0uYw0KPj4gaW5kZXgg
YjNmYWY4OTc0NGFhLi5lMDk3ZjQwYjAzYzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL29m
L3BsYXRmb3JtLmMNCj4+ICsrKyBiL2RyaXZlcnMvb2YvcGxhdGZvcm0uYw0KPj4gQEAgLTU0
MCw2ICs1NDAsMTEgQEAgc3RhdGljIGludCBfX2luaXQgDQo+PiBvZl9wbGF0Zm9ybV9kZWZh
dWx0X3BvcHVsYXRlX2luaXQodm9pZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9ub2Rl
X3B1dChub2RlKTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCBmb3JfZWFjaF9jaGls
ZF9vZl9ub2RlKG9mX2Nob3Nlbiwgbm9kZSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChv
Zl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAic2ltcGxlLWZyYW1lYnVmZmVyIikpDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKG5v
ZGUsIE5VTEwsIE5VTEwpOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiDCoMKgwqDCoMKgIC8q
IFBvcHVsYXRlIGV2ZXJ5dGhpbmcgZWxzZS4gKi8NCj4+IMKgwqDCoMKgwqAgb2ZfcGxhdGZv
cm1fZGVmYXVsdF9wb3B1bGF0ZShOVUxMLCBOVUxMLCBOVUxMKTsNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMgDQo+PiBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc2ltcGxlZmIuYw0KPj4gaW5kZXggYjYzMDc0ZmQ4OTJlLi41NzU0MTg4NzE4OGIg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMNCj4+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2ltcGxlZmIuYw0KPj4gQEAgLTU0MSwyNiArNTQx
LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc2ltcGxlZmJfZHJpdmVyID0g
ew0KPj4gwqDCoMKgwqDCoCAucmVtb3ZlID0gc2ltcGxlZmJfcmVtb3ZlLA0KPj4gwqAgfTsN
Cj4+IC1zdGF0aWMgaW50IF9faW5pdCBzaW1wbGVmYl9pbml0KHZvaWQpDQo+PiAtew0KPj4g
LcKgwqDCoCBpbnQgcmV0Ow0KPj4gLcKgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0K
Pj4gLQ0KPj4gLcKgwqDCoCByZXQgPSBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJnNpbXBs
ZWZiX2RyaXZlcik7DQo+PiAtwqDCoMKgIGlmIChyZXQpDQo+PiAtwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsNCj4+IC0NCj4+IC3CoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX09G
X0FERFJFU1MpICYmIG9mX2Nob3Nlbikgew0KPj4gLcKgwqDCoMKgwqDCoMKgIGZvcl9lYWNo
X2NoaWxkX29mX25vZGUob2ZfY2hvc2VuLCBucCkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAic2ltcGxlLWZyYW1lYnVm
ZmVyIikpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9mX3BsYXRmb3Jt
X2RldmljZV9jcmVhdGUobnAsIE5VTEwsIE5VTEwpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIH0N
Cj4+IC3CoMKgwqAgfQ0KPj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4gMDsNCj4+IC19DQo+PiAt
DQo+PiAtZnNfaW5pdGNhbGwoc2ltcGxlZmJfaW5pdCk7DQo+PiArbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihzaW1wbGVmYl9kcml2ZXIpOw0KPj4gwqAgTU9EVUxFX0FVVEhPUigiU3RlcGhl
biBXYXJyZW4gPHN3YXJyZW5Ad3d3ZG90b3JnLm9yZz4iKTsNCj4+IMKgIE1PRFVMRV9ERVND
UklQVElPTigiU2ltcGxlIGZyYW1lYnVmZmVyIGRyaXZlciIpOw0KPj4NCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------V0c0gQA4mzB8t89fxQ2JmaXx--

--------------RHJtxcQWMYsdr70wiWRRBcKM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvI3IFAwAAAAAACgkQlh/E3EQov+Al
GhAAteQyCINKz2HcwpxRXwrFhFVajrYr9N7Tf6YWcpzS3leVWJzx7MjLw0QfmniIz522D4HBunDp
LJTXjXv2FWbRjZP9KKwNDPp69WRSWTNQ0WjEtDhq133gC6KPTA5q7VWGNx6DZj7xe5tOJji3MW9P
uVCvXHAmYqTmSsbHVq4Ft0ZNzMoap37uAf03ofIyfh3Bpek3wS3CGvPQIihllhI+T2ZhTDnL3Ljf
z5f/rRUbTt/85aR8t4zvAS909orRociaKQGQ301IkAGWXqF4LglQ4AoKKnPg4rbLucvtptzTqe4A
bLNXW6lRsLR/aFisLH4KTMcSKdK/ErGlhl5YSEgHJgki0BToHESKyI2QaRNob1pt9m1hlzoQhdoI
583iazxOehrKAmiDmW0yhDxsazM7IRn5V8mzQFCq1dplUNrGcS9LNGC9Ed72TjAo+WuJROFCWykK
+RPX1YJjxedhlAB2B+a32MWLB22VhBNMjM3qGN4BCAu46PO7DmFQeGSoQdQQufUfxcMX0piLZTDW
DO/OQ7F/3QgMrTC27VBZ+dh+qa6xV5uiQK72Xm8fBrMc0b9Zy2eT+d1Hzb9OB133/7Ezu6qSMVwz
kBVJ9WsZCllG1e/WvcmJqlrDhbid/GRyITQegRN5TCWeFHIoUBHE3cpSlUbNvB2VX+2z3JNsWjFU
HEU=
=/PVW
-----END PGP SIGNATURE-----

--------------RHJtxcQWMYsdr70wiWRRBcKM--
