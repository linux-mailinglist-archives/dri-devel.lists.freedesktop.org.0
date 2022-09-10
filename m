Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CC5B47D7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 20:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5E810E22C;
	Sat, 10 Sep 2022 18:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45F310E22C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 18:06:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E766622839;
 Sat, 10 Sep 2022 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662833166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtpAflz75tk/7O+KpeoQcj1GmdcjzpJmIWDZSVDk+Ow=;
 b=koswIchFyH3Wehtp4xn+fsSP6FvOwrhSHoIXOBQLaKpmaQ96KSAmhPqydFMkX6l8DvGP0X
 dmUy1Rgjp9VI9dWCrlH7FKgVdhvYOOYjC7Z5Ivesyu46BFBgnRJeahlsvJdUa49nYHwpps
 ll35F2gTdi4omOUDnrZEFffGPRLLthk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662833166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jtpAflz75tk/7O+KpeoQcj1GmdcjzpJmIWDZSVDk+Ow=;
 b=36xh3YBWz3RWKuhjCp8Y2tQ2aY0y2B4rLrJ6Iu4KJ2/Jg0sB6LhjiGRYV83/WjE4OQ2KC7
 8cRs+Xq0RrfAPsCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE58613441;
 Sat, 10 Sep 2022 18:06:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oqm6KQ7SHGMzBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 10 Sep 2022 18:06:06 +0000
Message-ID: <88fab56a-f6e5-bae0-5ed7-1e01c070d136@suse.de>
Date: Sat, 10 Sep 2022 20:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/hyperv: Add ratelimit on error message
To: Saurabh Sengar <ssengar@linux.microsoft.com>, ssengar@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
References: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iOtIe2r2YKIBO2x8OPRRgA6D"
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
--------------iOtIe2r2YKIBO2x8OPRRgA6D
Content-Type: multipart/mixed; boundary="------------bGlCSrH7Zav1mUDFUYFaeVpp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, ssengar@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
Message-ID: <88fab56a-f6e5-bae0-5ed7-1e01c070d136@suse.de>
Subject: Re: [PATCH] drm/hyperv: Add ratelimit on error message
References: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1662736193-31379-1-git-send-email-ssengar@linux.microsoft.com>

--------------bGlCSrH7Zav1mUDFUYFaeVpp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDkuMjIgdW0gMTc6MDkgc2NocmllYiBTYXVyYWJoIFNlbmdhcjoNCj4g
RHVlIHRvIGEgZnVsbCByaW5nIGJ1ZmZlciwgdGhlIGRyaXZlciBtYXkgYmUgdW5hYmxlIHRv
IHNlbmQgdXBkYXRlcyB0bw0KPiB0aGUgSHlwZXItViBob3N0LiAgQnV0IG91dHB1dGluZyB0
aGUgZXJyb3IgbWVzc2FnZSBjYW4gbWFrZSB0aGUgcHJvYmxlbQ0KPiB3b3JzZSBiZWNhdXNl
IGNvbnNvbGUgb3V0cHV0IGlzIGFsc28gdHlwaWNhbGx5IHdyaXR0ZW4gdG8gdGhlIGZyYW1l
DQo+IGJ1ZmZlci4NCj4gUmF0ZSBsaW1pdGluZyB0aGUgZXJyb3IgbWVzc2FnZSwgYWxzbyBv
dXRwdXQgdGhlIGVycm9yIGNvZGUgZm9yIGFkZGl0aW9uYWwNCj4gZGlhZ25vc2FiaWxpdHku
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXVyYWJoIFNlbmdhciA8c3NlbmdhckBsaW51eC5t
aWNyb3NvZnQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVy
dl9kcm1fcHJvdG8uYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aHlwZXJ2L2h5cGVydl9kcm1fcHJvdG8uYyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlw
ZXJ2X2RybV9wcm90by5jDQo+IGluZGV4IDc2YTE4MmEuLjAxM2E3ODIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9wcm90by5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9wcm90by5jDQo+IEBAIC0yMDgs
NyArMjA4LDcgQEAgc3RhdGljIGlubGluZSBpbnQgaHlwZXJ2X3NlbmRwYWNrZXQoc3RydWN0
IGh2X2RldmljZSAqaGRldiwgc3RydWN0IHN5bnRodmlkX21zZw0KPiAgIAkJCSAgICAgICBW
TV9QS1RfREFUQV9JTkJBTkQsIDApOw0KPiAgIA0KPiAgIAlpZiAocmV0KQ0KPiAtCQlkcm1f
ZXJyKCZodi0+ZGV2LCAiVW5hYmxlIHRvIHNlbmQgcGFja2V0IHZpYSB2bWJ1c1xuIik7DQo+
ICsJCWRybV9lcnJfcmF0ZWxpbWl0ZWQoJmh2LT5kZXYsICJVbmFibGUgdG8gc2VuZCBwYWNr
ZXQgdmlhIHZtYnVzOyBlcnJvciAlZFxuIiwgcmV0KTsNCg0KSSBiZXR0ZXIgb3B0aW9uIHdv
dWxkIHByb2JhYmx5IGJlIGRybV9lcnJfb25jZSgpLiBUaGVuIHlvdSdkIGdldCB0aGUgDQpm
aXJzdCBlcnJvciBtZXNzYWdlIGFuZCBza2lwIGFsbCBvdGhlcnMuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gICANCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------bGlCSrH7Zav1mUDFUYFaeVpp--

--------------iOtIe2r2YKIBO2x8OPRRgA6D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMc0g0FAwAAAAAACgkQlh/E3EQov+CE
ww/+I+eQKR3NQNWcRRvlRQHTqbuedg7X/VJu/JG4zK2QtUxt3t52LnEPw5Xmz4YNsK1GQHV46liI
U4XrJ85doUxKsTSf3k06C39XQh+trdum4Re7IEi2feGnmtSRyvsCzTrHPBo4zD+3yCTRrmjYrOE6
GQPhxwDPx5Fje/NO1Rx93m3+sv1C3LPGCOnAzcwF+Uy4O+Ofk4a6XfurWDUFNTsdE8NkRFPZH9WU
5KwjO411+F8ASiBORSYevjPcJQbF3j44NlpUK9UZi817O5HCJGwH9v8wVoQpq1PWvJ1jWjwNUVGn
2IIHcpngD0rjF8Lkkg7d1L8q3n/fjEEkz1Ixe5bO9QqFrKdmDkdsaufbNjKoQI1oEkUJcHscVCXy
gH09MqmUR0/jQKvDqgke/FNiNzfN8pLo0mpA0gkizcxMWi2mqMHvZkxeEoo6t2chXgY/qudxMcez
EJd6SLdNleV+LuFL98clCS+yeXMhw+gCKhNxPZcVWGt+aAwuC1L6eQwUpOR7lsNn6cCdwiM6UBUV
77PMME6UTIhQHu4YgHTq/S4mDQtBthRAjPq4AKHtKbThmTJqZFqlHOBpWnX+AgDYV/q7kLDEMl1O
e+1fWuuOPtubNDqtWmmfhAHTMIWN/iU2POixlZQNdN4Cg52ey3i0aJ2GRK3h4CtydZqA32i8dnre
Bf8=
=gsbw
-----END PGP SIGNATURE-----

--------------iOtIe2r2YKIBO2x8OPRRgA6D--
