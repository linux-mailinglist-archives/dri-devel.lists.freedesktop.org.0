Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED843141F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 12:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81776E85E;
	Mon, 18 Oct 2021 10:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8576E85E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 10:10:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA7381FD79;
 Mon, 18 Oct 2021 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634551835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUXz0uKHOrE5AWFWh9SLNdqsydOKzAN5gGwZnGLQehc=;
 b=GQnxmdt2oLz1VijfPkiF/ob3KQiHEIGKz3X/pYcWDPodtXwKTXMzrME9LPXm8L6Y7IEG1n
 RD1HrAnMy9d8YACZ6cKTlHPwH6smIhv8GoZp47Y/1MqMk2c7L2LCi0L81L8sFQPOijbHxi
 X3cHv3guhlQAZgPxzTjQ51Mv68kPeQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634551835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUXz0uKHOrE5AWFWh9SLNdqsydOKzAN5gGwZnGLQehc=;
 b=iYcDhzEEgslHhZjFRheXpsQoQWjLZ6udhUZ9DLSRRtjwuviIvKsG552V9MAB2NJKnIQ6fa
 jS8Ns0ZMRVtx0KAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 813A413CC9;
 Mon, 18 Oct 2021 10:10:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y0KQHhtIbWHXaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Oct 2021 10:10:35 +0000
Message-ID: <32c0eb54-46af-4cbd-34eb-c49e3d2505bc@suse.de>
Date: Mon, 18 Oct 2021 12:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] drm: vkms: Add fb information to `vkms_writeback_job`
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-5-igormtorrente@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211005201637.58563-5-igormtorrente@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0r7wSlOTZBCfDbw3J6EoXYBh"
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
--------------0r7wSlOTZBCfDbw3J6EoXYBh
Content-Type: multipart/mixed; boundary="------------fS04LRuF0s4j1jMW1ZFj0aRd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Message-ID: <32c0eb54-46af-4cbd-34eb-c49e3d2505bc@suse.de>
Subject: Re: [PATCH 4/6] drm: vkms: Add fb information to `vkms_writeback_job`
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-5-igormtorrente@gmail.com>
In-Reply-To: <20211005201637.58563-5-igormtorrente@gmail.com>

--------------fS04LRuF0s4j1jMW1ZFj0aRd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjEgdW0gMjI6MTYgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gVGhpcyBjb21taXQgaXMgdGhlIGdyb3VuZHdvcmsgdG8gaW50cm9k
dWNlIG5ldyBmb3JtYXRzIHRvIHRoZSBwbGFuZXMgYW5kDQo+IHdyaXRlYmFjayBidWZmZXIu
IEFzIHBhcnQgb2YgaXQsIGEgbmV3IGJ1ZmZlciBtZXRhZGF0YSBmaWVsZCBpcyBhZGRlZCB0
bw0KPiBgdmttc193cml0ZWJhY2tfam9iYCwgdGhpcyBtZXRhZGF0YSBpcyByZXByZXNlbnRl
ZCBieSB0aGUgYHZrbXNfY29tcG9zZXJgDQo+IHN0cnVjdC4NCj4gDQo+IFRoaXMgd2lsbCBh
bGxvdyB1cywgaW4gdGhlIGZ1dHVyZSwgdG8gaGF2ZSBkaWZmZXJlbnQgY29tcG9zaXRpbmcg
YW5kIHdiDQo+IGZvcm1hdCB0eXBlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IElnb3IgTWF0
aGV1cyBBbmRyYWRlIFRvcnJlbnRlIDxpZ29ybXRvcnJlbnRlQGdtYWlsLmNvbT4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaCAgICAgICB8IDEwICsrKysr
LS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jIHwgMTYg
KysrKysrKysrKysrKy0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaA0KPiBp
bmRleCA2NGU2Mjk5M2IwNmYuLmQ2MmY4ZWJkNDU0YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmtt
cy92a21zX2Rydi5oDQo+IEBAIC0yMCwxMSArMjAsNiBAQA0KPiAgICNkZWZpbmUgWFJFU19N
QVggIDgxOTINCj4gICAjZGVmaW5lIFlSRVNfTUFYICA4MTkyDQo+ICAgDQo+IC1zdHJ1Y3Qg
dmttc193cml0ZWJhY2tfam9iIHsNCj4gLQlzdHJ1Y3QgZG1hX2J1Zl9tYXAgbWFwW0RSTV9G
T1JNQVRfTUFYX1BMQU5FU107DQo+IC0Jc3RydWN0IGRtYV9idWZfbWFwIGRhdGFbRFJNX0ZP
Uk1BVF9NQVhfUExBTkVTXTsNCj4gLX07DQo+IC0NCj4gICBzdHJ1Y3Qgdmttc19jb21wb3Nl
ciB7DQo+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgZmI7DQo+ICAgCXN0cnVjdCBkcm1f
cmVjdCBzcmMsIGRzdDsNCj4gQEAgLTM0LDYgKzI5LDExIEBAIHN0cnVjdCB2a21zX2NvbXBv
c2VyIHsNCj4gICAJdW5zaWduZWQgaW50IGNwcDsNCj4gICB9Ow0KPiAgIA0KPiArc3RydWN0
IHZrbXNfd3JpdGViYWNrX2pvYiB7DQo+ICsJc3RydWN0IGRtYV9idWZfbWFwIGRhdGFbRFJN
X0ZPUk1BVF9NQVhfUExBTkVTXTsNCj4gKwlzdHJ1Y3Qgdmttc19jb21wb3NlciBjb21wb3Nl
cjsNCj4gK307DQo+ICsNCj4gICAvKioNCj4gICAgKiB2a21zX3BsYW5lX3N0YXRlIC0gRHJp
dmVyIHNwZWNpZmljIHBsYW5lIHN0YXRlDQo+ICAgICogQGJhc2U6IGJhc2UgcGxhbmUgc3Rh
dGUNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNr
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jDQo+IGluZGV4IDg2
OTQyMjdmNTU1Zi4uNWEzZTEyZjEwNWRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmttcy92a21zX3dyaXRlYmFjay5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfd3JpdGViYWNrLmMNCj4gQEAgLTc1LDcgKzc1LDcgQEAgc3RhdGljIGludCB2a21z
X3diX3ByZXBhcmVfam9iKHN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciAqd2JfY29u
bmVjdG9yLA0KPiAgIAlpZiAoIXZrbXNqb2IpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4g
ICANCj4gLQlyZXQgPSBkcm1fZ2VtX2ZiX3ZtYXAoam9iLT5mYiwgdmttc2pvYi0+bWFwLCB2
a21zam9iLT5kYXRhKTsNCj4gKwlyZXQgPSBkcm1fZ2VtX2ZiX3ZtYXAoam9iLT5mYiwgdmtt
c2pvYi0+Y29tcG9zZXIubWFwLCB2a21zam9iLT5kYXRhKTsNCj4gICAJaWYgKHJldCkgew0K
PiAgIAkJRFJNX0VSUk9SKCJ2bWFwIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+ICAgCQlnb3Rv
IGVycl9rZnJlZTsNCj4gQEAgLTk5LDcgKzk5LDcgQEAgc3RhdGljIHZvaWQgdmttc193Yl9j
bGVhbnVwX2pvYihzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKmNvbm5lY3RvciwN
Cj4gICAJaWYgKCFqb2ItPmZiKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0KPiAtCWRybV9nZW1f
ZmJfdnVubWFwKGpvYi0+ZmIsIHZrbXNqb2ItPm1hcCk7DQo+ICsJZHJtX2dlbV9mYl92dW5t
YXAoam9iLT5mYiwgdmttc2pvYi0+Y29tcG9zZXIubWFwKTsNCj4gICANCj4gICAJdmttc2Rl
diA9IGRybV9kZXZpY2VfdG9fdmttc19kZXZpY2Uoam9iLT5mYi0+ZGV2KTsNCj4gICAJdmtt
c19zZXRfY29tcG9zZXIoJnZrbXNkZXYtPm91dHB1dCwgZmFsc2UpOw0KPiBAQCAtMTE2LDE0
ICsxMTYsMjQgQEAgc3RhdGljIHZvaWQgdmttc193Yl9hdG9taWNfY29tbWl0KHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uLA0KPiAgIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0
b3IgKndiX2Nvbm4gPSAmb3V0cHV0LT53Yl9jb25uZWN0b3I7DQo+ICAgCXN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlID0gd2JfY29ubi0+YmFzZS5zdGF0ZTsNCj4g
ICAJc3RydWN0IHZrbXNfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSA9IG91dHB1dC0+Y29tcG9z
ZXJfc3RhdGU7DQo+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBjb25uZWN0b3Jf
c3RhdGUtPndyaXRlYmFja19qb2ItPmZiOw0KPiArCXN0cnVjdCB2a21zX3dyaXRlYmFja19q
b2IgKmFjdGl2ZV93YjsNCj4gKwlzdHJ1Y3Qgdmttc19jb21wb3NlciAqd2JfY29tcG9zZXI7
DQo+ICAgDQo+ICAgCWlmICghY29ubl9zdGF0ZSkNCj4gICAJCXJldHVybjsNCj4gICANCj4g
ICAJdmttc19zZXRfY29tcG9zZXIoJnZrbXNkZXYtPm91dHB1dCwgdHJ1ZSk7DQo+ICAgDQo+
ICsJYWN0aXZlX3diID0gY29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYi0+cHJpdjsNCj4gKwl3
Yl9jb21wb3NlciA9ICZhY3RpdmVfd2ItPmNvbXBvc2VyOw0KPiArDQo+ICAgCXNwaW5fbG9j
a19pcnEoJm91dHB1dC0+Y29tcG9zZXJfbG9jayk7DQo+IC0JY3J0Y19zdGF0ZS0+YWN0aXZl
X3dyaXRlYmFjayA9IGNvbm5fc3RhdGUtPndyaXRlYmFja19qb2ItPnByaXY7DQo+ICsJY3J0
Y19zdGF0ZS0+YWN0aXZlX3dyaXRlYmFjayA9IGFjdGl2ZV93YjsNCj4gKwltZW1jcHkoJndi
X2NvbXBvc2VyLT5mYiwgZmIsIHNpemVvZihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyKSk7DQo+
ICsJd2JfY29tcG9zZXItPm9mZnNldCA9IGZiLT5vZmZzZXRzWzBdOw0KPiArCXdiX2NvbXBv
c2VyLT5waXRjaCA9IGZiLT5waXRjaGVzWzBdOw0KPiArCXdiX2NvbXBvc2VyLT5jcHAgPSBm
Yi0+Zm9ybWF0LT5jcHBbMF07DQoNCkkgZG9uJ3Qga25vdyB0aGUgZXhhY3QgY2xlYW51cCBy
ZXF1aXJlbWVudHMgb2YgdGhlc2Ugc3RydWN0dXJlcywgYnV0IA0KY29weWluZyBmYiBpbnRv
IGNvbXBvc2VyIGxvb2tzIGxpa2UgaXQgYnJlYWtzIHJlZmVyZW5jZSBjb3VudGluZyBvZiB0
aGUgDQpmcmFtZWJ1ZmZlcidzIGdlbSBvYmplY3RzIGF0IGxlYXN0Lg0KDQpUaGlzIGF0b21p
Y19jb21taXQgaGVscGVyIHdvdWxkIGJldHRlciBhY3F1aXJlIHRoZSBjb3JyZWN0IHJlZmVy
ZW5jZXMgDQphbmQgaGFuZCB0aGVtIG92ZXIgdG8gdGhlIGNvbXBvc2l0b3IgdGhyZWFkLiBX
aHkgbm90IGhhdmUgYSByZWYtY291bnRlZCANCmNvbXBvc2VyIG9yIGdldCBhIHJlZmVyZW5j
ZSBvbiB0aGUgZnJhbWVidWZmZXIgaW5zdGVhZD8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KDQo+ICAgCWNydGNfc3RhdGUtPndiX3BlbmRpbmcgPSB0cnVlOw0KPiAgIAlzcGluX3Vu
bG9ja19pcnEoJm91dHB1dC0+Y29tcG9zZXJfbG9jayk7DQo+ICAgCWRybV93cml0ZWJhY2tf
cXVldWVfam9iKHdiX2Nvbm4sIGNvbm5lY3Rvcl9zdGF0ZSk7DQo+IA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------fS04LRuF0s4j1jMW1ZFj0aRd--

--------------0r7wSlOTZBCfDbw3J6EoXYBh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFtSBoFAwAAAAAACgkQlh/E3EQov+CB
AA/8CV9uZgGgQwwZLPvDs2NYZI7hEZJMR+rx1SISOg+n/L+qPD7d0f4vu9AJT6KObHGxLqu6ZOYg
FSzLqPMVHZv7ARqbydE+YoyWt301r9rALFTEkTbuB08lUdd4WN0k8nhMiF82qvtG9Gz9x5JqRCyj
bJw383sIo1lFE+V+EbhcIvMWnLrcvis0IPlmYN0yoRn8v6Was0YGMfD+4EJBKkAlGJCLqefDl9b3
fij2+VoBJF+y07iJQcWVFkb9nVdHMXBls/ohaisO4QKehlgXqujxS6YYyaIHDUqVidEgpqXyt9lG
Hloya8oP+jypZRld/GqOWHu1WrDngREv6fUqAOmCPhpLqCLmZqsGDm1DcLZhN/9muyI8wNFuWx4H
T3DSHneLZdHQaYHcms5gm/1bCARVT4yYInwf5A6Lsz/R4R0fg0SU5ilsTzp090V2zainzN+RU3Bh
Nh2y99L4FrQjioms1m2rOnw/lDLuuEeJm9i7aK7qBfVEWg5UTUtbgtDLxnUf9qNV478FFeFc+Aj5
OFFe6xFScTSqxyCn8d7YN802950qHtwmfqZdREoEek49L8HrwLjLvH0EwU3i0f2h2KA0VDOgZev2
6yrojtAE3HHEeUSAEhSv6/2sNEVPWjsvD1b9+OgegnNjpk6sbe4lYzsCOufzws3TnOV2DeD7udVR
WuE=
=FHln
-----END PGP SIGNATURE-----

--------------0r7wSlOTZBCfDbw3J6EoXYBh--
