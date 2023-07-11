Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34C74EB00
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D5F10E364;
	Tue, 11 Jul 2023 09:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9210E354
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:43:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90CEF227C1;
 Tue, 11 Jul 2023 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689068612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vl9A2MqEq0vqlBLCwOQqgDDlXlmHSQMZukFQKnZgdPI=;
 b=i1hGd7i7hf1dyuAW5eX+hPQEiNLMTE8rH0cshFeEK1cNKQTZtzsF2GlTTwDnJNPTBKVvK+
 zqFlpjxhz5jhcMg3vAzD9bDii/hXhkTlCCZKhIXVgXB7DfYNMpD6CfwiKrbG8Fv8nRhL4m
 e2pftXYDdALDD2lDuobQOdkr01j6NuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689068612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vl9A2MqEq0vqlBLCwOQqgDDlXlmHSQMZukFQKnZgdPI=;
 b=1+gg7NBOlvuJ+tza0bTpEm/iQ/Pq+R4AndEtgaNCcDWq2zI69wZ0nvtmtz9+KZASVPUljA
 wZ0nPt6RBcgK76DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 697861391C;
 Tue, 11 Jul 2023 09:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zR3RGEQkrWSKYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jul 2023 09:43:32 +0000
Message-ID: <caf5165a-86a7-afb6-991f-db7b6493001f@suse.de>
Date: Tue, 11 Jul 2023 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm/client: Fix memory leak in
 drm_client_modeset_probe
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, yizhan@redhat.com
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-3-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230711092203.68157-3-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wurWGJivFCvBp8AiVhUdh00s"
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wurWGJivFCvBp8AiVhUdh00s
Content-Type: multipart/mixed; boundary="------------F9lflctnNhYz5MewY0VuPiU3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 javierm@redhat.com, yizhan@redhat.com
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Message-ID: <caf5165a-86a7-afb6-991f-db7b6493001f@suse.de>
Subject: Re: [PATCH 2/2] drm/client: Fix memory leak in
 drm_client_modeset_probe
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-3-jfalempe@redhat.com>
In-Reply-To: <20230711092203.68157-3-jfalempe@redhat.com>

--------------F9lflctnNhYz5MewY0VuPiU3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA3LjIzIHVtIDExOjIwIHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBX
aGVuIGEgbmV3IG1vZGUgaXMgc2V0IHRvIG1vZGVzZXQtPm1vZGUsIHRoZSBwcmV2aW91cyBt
b2RlIHNob3VsZCBiZSBmcmVlZC4NCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGttZW1s
ZWFrIHJlcG9ydDoNCj4gDQo+IGRybV9tb2RlX2R1cGxpY2F0ZSsweDQ1LzB4MjIwIFtkcm1d
DQo+IGRybV9jbGllbnRfbW9kZXNldF9wcm9iZSsweDk0NC8weGY1MCBbZHJtXQ0KPiBfX2Ry
bV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWdfYW5kX3VubG9jaysweGI0LzB4MmMwIFtkcm1f
a21zX2hlbHBlcl0NCj4gZHJtX2ZiZGV2X2NsaWVudF9ob3RwbHVnKzB4MmJjLzB4NGQwIFtk
cm1fa21zX2hlbHBlcl0NCj4gZHJtX2NsaWVudF9yZWdpc3RlcisweDE2OS8weDI0MCBbZHJt
XQ0KPiBhc3RfcGNpX3Byb2JlKzB4MTQyLzB4MTkwIFthc3RdDQo+IGxvY2FsX3BjaV9wcm9i
ZSsweGRjLzB4MTgwDQo+IHdvcmtfZm9yX2NwdV9mbisweDRlLzB4YTANCj4gcHJvY2Vzc19v
bmVfd29yaysweDhiNy8weDE1NDANCj4gd29ya2VyX3RocmVhZCsweDcwYS8weGVkMA0KPiBr
dGhyZWFkKzB4MjlmLzB4MzQwDQo+IHJldF9mcm9tX2ZvcmsrMHgxZi8weDMwDQo+IA0KPiBj
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+IFJlcG9ydGVkLWJ5OiBaaGFuZyBZaSA8
eWl6aGFuQHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8
amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jIHwgMyArKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRf
bW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jDQo+IGlu
ZGV4IGE0YTYyYWE5OTk4NC4uNWQ0NzAzYjQ2NDhhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnRfbW9kZXNldC5jDQo+IEBAIC04NjcsNiArODY3LDkgQEAgaW50IGRybV9j
bGllbnRfbW9kZXNldF9wcm9iZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgdW5z
aWduZWQgaW50IHdpZHRoLA0KPiAgIAkJCQlicmVhazsNCj4gICAJCQl9DQo+ICAgDQo+ICsJ
CQlpZiAobW9kZXNldC0+bW9kZSkNCj4gKwkJCQlrZnJlZShtb2Rlc2V0LT5tb2RlKTsNCg0K
a2ZyZWUoKSBkb2VzIGEgTlVMTC1wb2ludGVyIHRlc3QuIFNvIGl0IGNhbiBiZSByZW1vdmVk
IGhlcmUuIFdpdGggdGhhdCANCmNoYW5nZWQ6DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiArCQkJCQ0KPiAgIAkJCW1vZGVz
ZXQtPm1vZGUgPSBkcm1fbW9kZV9kdXBsaWNhdGUoZGV2LCBtb2RlKTsNCj4gICAJCQlkcm1f
Y29ubmVjdG9yX2dldChjb25uZWN0b3IpOw0KPiAgIAkJCW1vZGVzZXQtPmNvbm5lY3RvcnNb
bW9kZXNldC0+bnVtX2Nvbm5lY3RvcnMrK10gPSBjb25uZWN0b3I7DQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------F9lflctnNhYz5MewY0VuPiU3--

--------------wurWGJivFCvBp8AiVhUdh00s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmStJEMFAwAAAAAACgkQlh/E3EQov+Cn
JQ/+PvnmGcqow5xK1AYGnI5vRBNPUernzQOe1b+gE5XP6YmgUvhBbZuUA93L1YIG8TApu4DFijSU
awXC4JF35Ji7JuUlNX4lNcitSzHF+dbknGkf8yk4ClXRA/YvGSNqYAcxx7okhfVz5M5u4C5Hgh2R
YQtkXSbSx4hXh1cP27Fk6TpXSOYetThB4Mac19RjvItZQwU89r2KljhUf/FGiHEbC5ejt/dJNlW2
agWua8Hcbr2o47+P00gFBedNGYjWoybaL4+mxgRYk/U8jYhNVRUaZAZXT5g8nAu87PDkNpW8dTfj
XvcAp1/mi6b4cq4hJv73/XDrZi1ryIFTn+HM85BEtKOlXdCCZ3ZjzNRIAj8wrrmhqIMIq8YaUybU
I0iRX/QVXcjfL4BM5Oybu8yeoTtkkScZmToM1k4BkNM7Ju0m0tXkrW0o6wrqkDD88oXESICn27+/
5qo0R2Vev1KWRbWUSjepgg5dRtBbDRtA+eRcGkrgSlS+GPHLFDk7Rxo7Ivx5Ps7b+Bb9fC4bYg8K
UNQfRuIf2Yw7o85Nil2Pw0sgDzV1y8VE5PCy7gwOj3NuT5HquY75DZy0w2+DQWPckntLUwsLqnfb
7Pk3C6AcPFWU4KPkcLIidrxTqtQ4GUCqsdwSs51WShpqWw24uF/kjifU7UGaBow49In0zQcW9EIO
P/Q=
=NBQl
-----END PGP SIGNATURE-----

--------------wurWGJivFCvBp8AiVhUdh00s--
