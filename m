Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD667B3D2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233C410E7BB;
	Wed, 25 Jan 2023 14:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99D10E7BA;
 Wed, 25 Jan 2023 14:04:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDE651F45F;
 Wed, 25 Jan 2023 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674655462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbSq8QpP5gKFCj9wRXhX+c2qWCGlcx8AVtCmLzhws7g=;
 b=b2N+klmsqa/8s7L7etOh/GF+KIr8CQWsepzhB1TUN5s20dtITMD++MlMECauuBzrBXx3CW
 xMPVajzZIlHkXfGwwKINj30SVh0/g8eMigw60zwNOOpQxD24TMT9EuUiHw1bOxB9vYKpR5
 NTal+rKexrC80op7nYH3MRVITk+O1YQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674655462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbSq8QpP5gKFCj9wRXhX+c2qWCGlcx8AVtCmLzhws7g=;
 b=XGawAPjoinARPFUEoLCQUzQiiQqB0pZ8GlJmmHy1nHYEw49D5DKIKU3kLzbJzjTxGAV8f8
 ZS0TKSus8Ju06gDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779B11358F;
 Wed, 25 Jan 2023 14:04:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EC48HOY20WMrPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 14:04:22 +0000
Message-ID: <54303476-8e1d-2a6e-0d8f-8d5c7b75f64c@suse.de>
Date: Wed, 25 Jan 2023 15:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] drm/client: Test for connectors before sending
 hotplug event
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-2-tzimmermann@suse.de>
 <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9Ic1E1tNJRTSvnT3QXPtHIyk"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9Ic1E1tNJRTSvnT3QXPtHIyk
Content-Type: multipart/mixed; boundary="------------m6sBL7sIhfc4J6AgPtm5C4Gn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <54303476-8e1d-2a6e-0d8f-8d5c7b75f64c@suse.de>
Subject: Re: [PATCH v2 01/10] drm/client: Test for connectors before sending
 hotplug event
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-2-tzimmermann@suse.de>
 <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>
In-Reply-To: <296bcff0-9d75-3d6b-e101-dddb26edadf1@redhat.com>

--------------m6sBL7sIhfc4J6AgPtm5C4Gn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjMgdW0gMDk6MzAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDEvMjQvMjMgMTQ6NDAsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gVGVzdCBmb3IgY29ubmVjdG9ycyBpbiB0aGUgY2xp
ZW50IGNvZGUgYW5kIHJlbW92ZSBhIHNpbWlsYXIgdGVzdA0KPj4gZnJvbSB0aGUgZ2VuZXJp
YyBmYmRldiBlbXVsYXRpb24uIERvIG5vdGhpbmcgaWYgdGhlIHRlc3QgZmFpbHMuDQo+PiBO
b3QgaGF2aW5nIGNvbm5lY3RvcnMgaW5kaWNhdGVzIGEgZHJpdmVyIGJ1Zy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+IC0tLQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8
amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4gYnV0IEkndmUgYSBxdWVzdGlvbiBiZWxvdy4N
Cj4gDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgICAgICAgIHwgNSArKysr
Kw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDUgLS0tLS0N
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+IA0KPiBbLi4uXQ0KPiANCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZf
Z2VuZXJpYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMu
Yw0KPj4gQEAgLTM4OSwxMSArMzg5LDYgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfY2xpZW50
X2hvdHBsdWcoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+PiAgIAlpZiAoZGV2
LT5mYl9oZWxwZXIpDQo+PiAgIAkJcmV0dXJuIGRybV9mYl9oZWxwZXJfaG90cGx1Z19ldmVu
dChkZXYtPmZiX2hlbHBlcik7DQo+PiAgIA0KPj4gLQlpZiAoIWRldi0+bW9kZV9jb25maWcu
bnVtX2Nvbm5lY3Rvcikgew0KPj4gLQkJZHJtX2RiZ19rbXMoZGV2LCAiTm8gY29ubmVjdG9y
cyBmb3VuZCwgd2lsbCBub3QgY3JlYXRlIGZyYW1lYnVmZmVyIVxuIik7DQo+PiAtCQlyZXR1
cm4gMDsNCj4+IC0JfQ0KPj4gLQ0KPiANCj4gV2hhdCBhYm91dCB0aGUgZm9sbG93aW5nIGNv
ZGUgc25pcHBldDoNCj4gDQo+IAlpZiAoIWRybV9kcnZfdXNlc19hdG9taWNfbW9kZXNldChk
ZXYpKQ0KPiAJCWRybV9oZWxwZXJfZGlzYWJsZV91bnVzZWRfZnVuY3Rpb25zKGRldik7DQo+
IA0KPiB0aGF0IHNlZW1zIHRvIGJlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBpbiB0aGUg
Y29yZSBjbGllbnQgZGV2IGhvdHBsdWcNCj4gYXMgd2VsbCwgc2luY2UgaXQgaXNuJ3Qgc3Bl
Y2lmaWMgdG8gdGhlIGZiZGV2IGVtdWxhdGlvbiBjbGllbnQgPw0KDQpUaGF0J3MgaW4gdGhl
IG1pZGRsZSBvZiB0aGUgaW5pdGlhbCBwcm9iaW5nIGNvZGUgYW5kIGRpc2FibGVzIHBpcGVs
aW5lIA0KZWxlbWVudHMgaW4gbm9uLWF0b21pYyBtb2Rlc2V0dGluZy4gVEJIIEkgZG9uJ3Qg
ZGFyZSB0byBtb3ZlIGl0IGFyb3VuZC4gDQpJZiB3ZSBldmVyIGhhdmUgb3RoZXIgY2xpZW50
cywgd2UgY2FuIGF0dGVtcHQgdGhlIHB1dCBpdCBpbnRvIHRoZSBjbGllbnQuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------m6sBL7sIhfc4J6AgPtm5C4Gn--

--------------9Ic1E1tNJRTSvnT3QXPtHIyk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPRNuUFAwAAAAAACgkQlh/E3EQov+Dv
9w//aauyhE9l7KTLTcYoGNHO0YopaFilxVY2jcD0liyFEF6TPeIi6PVYVUYKmVpwk5NI64DBN1jG
f9ZWmdrLE5dWsztIskHxKTdu6ccDxnCIvEhSLBAVp3PTVBb4otMtuuvqx6z+USCjAv0Vl8qaDMpF
T9yJ13yTSuqdo6IayPYJ8YiTkiHoru/m467tFleYKs269nPR21wvh4psCd/zO5RN7P4HHeIdyoE4
rRHEHDUw8plharM840CZonOdB/3cNyPZWPEafLpPSmC5d3t55bvEtm4tbMcajKz8FTLjBMXBk6of
S6SNT0CNVKxOBhbEtGHZkISEjjgPgh8t0CI4+y6vcbISvACFDgKK0jJwSmY4nb9jmYGSx+RYOgE1
yn+C7K5ml33IHxx1NhYBnyEvebEL2hDHjRaMM4+cv+LOYIYg2Wn04KZtFCSzot66UW/mZOciXCtB
rk0RkUvFV0zv0gBQnQ+ePbTidtPpnDo9SuAdZNU1mSABffukZ5UtvfasXTxvrf4sGcltpmmHCsOh
4Bco5tm3NJPZyFu829nGrRh4mTZ00PMAdD3gjdX6/PNYPmV0RlsAv4pv4DM3kz4Udtyg0wqOUids
V2ajZqe2CSsBs5eXWLZL1WUgE49MboIaMpoF4IiBYnM3tOF/A+MyTyot1kf32sE/YPPDKKXH0JiL
T9Y=
=5HPw
-----END PGP SIGNATURE-----

--------------9Ic1E1tNJRTSvnT3QXPtHIyk--
