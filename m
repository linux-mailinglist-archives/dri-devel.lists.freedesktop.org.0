Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F35652478
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AC710E0E7;
	Tue, 20 Dec 2022 16:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C6810E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:14:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B07AD76747;
 Tue, 20 Dec 2022 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ReqZqe9RHLFwjUQKIFVU9RESaXvc2/+pS7g2MXdWdQI=;
 b=dOSDzwvr3WGLxyNJyezQu+f1JmJM4FVZG+3Ke2yI8n2nWP+Y6Pk9EXKAQLD8twLlVhCgnI
 /Z7R1TAkR+Q3DwRXmKB4/3wY5SSY220xnjEwT2ThwEOzVMbOWNEa8Zdtgqq8V/GSS31BLl
 rk9I02BHSdar1rDFJOAbxqEqYb3RQos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ReqZqe9RHLFwjUQKIFVU9RESaXvc2/+pS7g2MXdWdQI=;
 b=MORkHgQFW66j7A8utv1Ow4/DRTf+129DWlTttIYDdm7xoepkqtl5t51FK2VCQOmvVVXb9M
 3xb/QPZq7w9YtcCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DEB81390E;
 Tue, 20 Dec 2022 16:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Xe0HULfoWMGZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:13:54 +0000
Message-ID: <5ffe297c-f2b6-c669-768a-3f367b15a9a8@suse.de>
Date: Tue, 20 Dec 2022 17:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/sprd: remove redundant error logging
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Y5XhPJ39ipMCcctq@qemulion> <Y6DPxKGmfRH5Bujn@qemulion>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y6DPxKGmfRH5Bujn@qemulion>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mlzTiaT9zYKqbOoepSx4xXnY"
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mlzTiaT9zYKqbOoepSx4xXnY
Content-Type: multipart/mixed; boundary="------------NaXIDhrKjegA7vAvMQvrMCta";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak R Varma <drv@mailo.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Message-ID: <5ffe297c-f2b6-c669-768a-3f367b15a9a8@suse.de>
Subject: Re: [PATCH] drm/sprd: remove redundant error logging
References: <Y5XhPJ39ipMCcctq@qemulion> <Y6DPxKGmfRH5Bujn@qemulion>
In-Reply-To: <Y6DPxKGmfRH5Bujn@qemulion>

--------------NaXIDhrKjegA7vAvMQvrMCta
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMTIuMjIgdW0gMjE6NTUgc2NocmllYiBEZWVwYWsgUiBWYXJtYToNCj4g
T24gU3VuLCBEZWMgMTEsIDIwMjIgYXQgMDc6MjU6MDhQTSArMDUzMCwgRGVlcGFrIFIgVmFy
bWEgd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gTWF5IEkgcGxlYXNlIHJlcXVlc3QgYSByZXZp
ZXcgYW5kIGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2ggcHJvcG9zYWw/DQoNCkFkZGVkIHRvIGRy
bS1taXNjLW5leHQuIFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBUaGFuayB5b3UsDQo+IC4vZHJ2DQo+IA0KPj4gQSBjYWxsIHRvIHBs
YXRmb3JtX2dldF9pcnEoKSBhbHJlYWR5IHByaW50cyBhbiBlcnJvciBvbiBmYWlsdXJlIHdp
dGhpbg0KPj4gaXRzIG93biBpbXBsZW1lbnRhdGlvbi4gU28gcHJpbnRpbmcgYW5vdGhlciBl
cnJvciBiYXNlZCBvbiBpdHMgcmV0dXJuDQo+PiB2YWx1ZSBpbiB0aGUgY2FsbGVyIGlzIHJl
ZHVuZGFudCBhbmQgc2hvdWxkIGJlIHJlbW92ZWQuIFRoZSBjbGVhbiB1cA0KPj4gYWxzbyBt
YWtlcyBpZiBjb25kaXRpb24gYmxvY2sgYnJhY2VzIHVubmVjZXNzYXJ5LiBSZW1vdmUgdGhh
dCBhcyB3ZWxsLg0KPj4NCj4+IElzc3VlIGlkZW50aWZpZWQgdXNpbmcgcGxhdGZvcm1fZ2V0
X2lycS5jb2NjaSBjb2NjaWNoZWNrIHNjcmlwdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBE
ZWVwYWsgUiBWYXJtYSA8ZHJ2QG1haWxvLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vc3ByZC9zcHJkX2RwdS5jIHwgNCArLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3Nw
cmRfZHB1LmMNCj4+IGluZGV4IDg4ZjQyNTk2ODBmMS4uZGIwYmNlYTFkOWY0IDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYw0KPj4gQEAgLTgwMywxMCArODAzLDggQEAg
c3RhdGljIGludCBzcHJkX2RwdV9jb250ZXh0X2luaXQoc3RydWN0IHNwcmRfZHB1ICpkcHUs
DQo+PiAgIAl9DQo+Pg0KPj4gICAJY3R4LT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOw0KPj4gLQlpZiAoY3R4LT5pcnEgPCAwKSB7DQo+PiAtCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBnZXQgZHB1IGlycVxuIik7DQo+PiArCWlmIChjdHgtPmlycSA8IDApDQo+PiAg
IAkJcmV0dXJuIGN0eC0+aXJxOw0KPj4gLQl9DQo+Pg0KPj4gICAJLyogZGlzYWJsZSBhbmQg
Y2xlYXIgaW50ZXJydXB0cyBiZWZvcmUgcmVnaXN0ZXIgZHB1IElSUS4gKi8NCj4+ICAgCXdy
aXRlbCgweDAwLCBjdHgtPmJhc2UgKyBSRUdfRFBVX0lOVF9FTik7DQo+PiAtLQ0KPj4gMi4z
NC4xDQo+Pg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------NaXIDhrKjegA7vAvMQvrMCta--

--------------mlzTiaT9zYKqbOoepSx4xXnY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOh30IFAwAAAAAACgkQlh/E3EQov+C5
2RAAsHgJfI0eY4pk+UtWQm0zGU81TXmuagZJ3wDkF7Z1T8shIXO3PWqmY6bRhclMVSSSBSyjAciz
+ykkGfaDTiUCGpY7JeOC9cWu0KywSzi4w3veuGL4srDITsoxxsPPp9MG4iXAmf0MbY2tP+d2+kZ0
cjRHNAYmWLf2SVcUQ9nn6+kiH+p61dgNJ45wLhE9b6pva3v+W4uSeZ4CFRU+NmcaZvf8PGeNR5AO
GqRD2QmatVR0b82hglKR8WRDLF/cmnzFkaoXM2cLo3dmJ8VVbjV6RVc4Qubt2vLjz3oZ1bouPzyY
Eq5i0nV2nTBl0Eu+P1qJc3MdFdJ5+ZieN5a/sXcNkDOUGKiUAQfatZ0zUG9Lj0e38Q9ZoTXYGwBH
joDgnyUULvxFMyJPnPw33Vbgqdr/fp6yPK5jxwuyoqievalVSkFRthbUQv0wxgf2q1CnLEjUELM0
81yAm00Of2F8ig2ZMtEkfe4w47dEP+IZL9zwCLBsBhZjj2kqhDJFJR8a7kyCVsI0sIFNwBlb7Crm
kvAAGWSUzOGgTXIPTTl2NKNXqqgTwQnmy60vON2J6pqEJoSHANZkzirlTv6LeOeAMPyr/t/cqGWk
Hoqj20GWByB/PpGrbMBI3TvqIBBZ76BcDYwUfA1F9jGjWV8GfCZLM7ueuInl+3yukIWzVrsAyeTV
ZuY=
=QUGT
-----END PGP SIGNATURE-----

--------------mlzTiaT9zYKqbOoepSx4xXnY--
