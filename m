Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4B5130E5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 12:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE3B10E3E2;
	Thu, 28 Apr 2022 10:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809710F85E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 10:08:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F7AA210EE;
 Thu, 28 Apr 2022 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651140511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPhQ9klGx6OXQcyHH++ox158u/dhEZFevQQQymkhiCU=;
 b=Ym6VC7H3RPWMfI7wOqHL2LB4NPwcYdMfs4Na82GI9xPjilmB8buUv3ZDjX0COhMAa7BfnN
 5Dkd2AuKhQeT9xpePHozEDtOa4+jKZk20NuyNWI00yomAM0swS1zFKn+QRRjIKzIVkNo9J
 wQ6fXcSRsp5xwdHRbS0KlFfMMbOyuXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651140511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPhQ9klGx6OXQcyHH++ox158u/dhEZFevQQQymkhiCU=;
 b=Ezs4WKmOdZSNacGoz1EgH9mfoYj33xs2N8KrQYRgCTnL7mL320OILjFPGnsq+6IQFeTEn3
 7rCMRole0Z1VXxBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7003013AF8;
 Thu, 28 Apr 2022 10:08:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lTF0Gp9namJKYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 10:08:31 +0000
Message-ID: <b2baaad5-3488-1931-3a00-5ebbea419ec6@suse.de>
Date: Thu, 28 Apr 2022 12:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220428082244.390859-1-javierm@redhat.com>
 <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
 <8181a700-4955-cbdb-553f-311d790c603f@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8181a700-4955-cbdb-553f-311d790c603f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3bSk7Pw8FtPoOEM7cSAU6RAG"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3bSk7Pw8FtPoOEM7cSAU6RAG
Content-Type: multipart/mixed; boundary="------------2xigl1Jhe7HWOfK48T0UqTc7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <b2baaad5-3488-1931-3a00-5ebbea419ec6@suse.de>
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220428082244.390859-1-javierm@redhat.com>
 <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
 <8181a700-4955-cbdb-553f-311d790c603f@redhat.com>
In-Reply-To: <8181a700-4955-cbdb-553f-311d790c603f@redhat.com>

--------------2xigl1Jhe7HWOfK48T0UqTc7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjIgdW0gMTE6MTEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDQvMjgvMjIgMTA6NDIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+IA0KPiBbc25pcF0NCj4gDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2Rp
c3BsYXkvS2NvbmZpZyB8IDYgKysrKy0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkv
S2NvbmZpZw0KPj4+IGluZGV4IGY4NGYxYjBjZDIzZi4uMWI2ZTZhZjM3NTQ2IDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L0tjb25maWcNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29uZmlnDQo+Pj4gQEAgLTMxLDcgKzMxLDggQEAg
Y29uZmlnIERSTV9ESVNQTEFZX0hETUlfSEVMUEVSDQo+Pj4gICAgDQo+Pj4gICAgY29uZmln
IERSTV9EUF9BVVhfQ0hBUkRFVg0KPj4+ICAgIAlib29sICJEUk0gRFAgQVVYIEludGVyZmFj
ZSINCj4+PiAtCWRlcGVuZHMgb24gRFJNDQo+Pj4gKwlkZXBlbmRzIG9uIERSTSAmJiBEUk1f
RElTUExBWV9IRUxQRVINCj4+PiArCXNlbGVjdCBEUk1fRElTUExBWV9EUF9IRUxQRVINCj4+
DQo+IA0KPiBNeSByYXRpb25hbGUgd2FzIHRoYXQgc2luY2UgRFJNX0RJU1BMQVlfRFBfSEVM
UEVSIGlzIG5vdCBhIHVzZXItdmlzaWJsZQ0KPiBzeW1ib2wgYnV0IERSTV9EUF97QVVYX0NI
QVJERVYsQ0VDfSBhcmUsIHRoZSBsYXR0ZXIgc2hvdWxkIGJlIGFibGUgdG8NCj4gYmUgZW5h
YmxlZCBieSB0aGUgdXNlciB3aXRob3V0IHJlbHlpbmcgb24gb3RoZXIgZHJpdmVycyB0byBz
ZWxlY3QgdGhlDQo+IHJlcXVpcmVkIHN5bWJvbHMgKEkgd291bGQgYXJndWUgdGhhdCBldmVu
IHNob3VsZCBzZWxlY3QgRFBfSEVMUEVSIGJ1dA0KPiB0aGF0IGNhbid0IGJlIGRvbmUgb3Ig
b3RoZXJ3aXNlIHRoZSBoZWxwZXIgY291bGRuJ3QgYmUgYnVpbHQgYXMgbW9kdWxlKS4NCj4g
DQo+IEluIG90aGVyIHdvcmRzLCBlaXRoZXIgRFJNX0RQX3tBVVhfQ0hBUkRFVixDRUN9IGNh
biBiZSB1c2VyIHNlbGVjdGFibGUNCj4gYXMgYSBzdGFuZGFsb25lIHN5bWJvbCBvciBjYW4n
dCBhbmQgd2lsbCBvbmx5IGJlIHZpc2libGUgaWYgb3RoZXIgZHJpdmVyDQo+IHNlbGVjdHMg
dGhlaXIgcmVxdWlyZWQgc3ltYm9scy4NCj4gDQo+IEluIHdoaWNoIGNhc2UsIHdoeSBub3Qg
anVzdCBkbyB0aGlzIG5vbi11c2VyIHZpc2libGUgYW5kIGp1c3QgbWFrZSB0aGUNCj4gZHJp
dmVycyB1c2luZyB0aGVpciBoZWxwZXJzIHRvIHNlbGVjdCBpdCBkaXJlY3RseT8gVGhhdCBp
cyBvbmUgb2YgdGhlDQo+IG9wdGlvbnMgSSBwcm9wb3NlZCBiZWZvcmUuDQo+IA0KPiBTbyBJ
IGJlbGlldmUgdGhpcyBpcyB0aGUgbGVzcyBpbnRydXNpdmUgY2hhbmdlIHRoYXQgd2lsbCBw
cmVzZXJ2ZSB0aGUNCj4gY3VycmVudCBiZWhhdmlvdXIgYXMgbXVjaCBhcyBwb3NzaWJsZS4N
Cg0KTWFrZXMgc2Vuc2UuDQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCg0KTWF5YmUgd2FpdCBhIGJpdCBiZWZvcmUgbGFuZGluZywgc28g
dGhhdCB0aGUgYWN0dWFsIG1haW50YWluZXJzIGhhdmUgYSANCmNoYW5jZSB0byBjb21tZW50
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBJIGRvbid0IGhhdmUgYSBzdHJv
bmcgb3BpbmlvbiB0aG91Z2ggYW5kIGlmIHlvdSBwcmVmZXIgSSBjYW4gY2hhbmdlIHRvDQo+
IGJlIGEgZGVwZW5kcyBpbnN0ZWFkLg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------2xigl1Jhe7HWOfK48T0UqTc7--

--------------3bSk7Pw8FtPoOEM7cSAU6RAG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqZ58FAwAAAAAACgkQlh/E3EQov+CG
PxAAjTCmifmzJ9KgKanEqtWx3rr3kLYyd68XLQkuFl1yLxrutQtTH/pGz+tCshdfr49pkXIKwvnV
LlqodDQ3ChI2C1aJYAPl5+Nw2jfPxL3iS5Ihji/oRq8IK50hpEIeSWLP8BXBSyOzA/jRRTMMiDoX
IGft3ReyBWyE+PtTzhIYeAOc9s4BhIedKN+pzwEPH/X1yn8VmQXizgLlZUCrCw9HXemXr6BM4ri5
GhnMTweKnu3zNbE52LTJrdG7P6S+tGYMVynv5TsQVEosdwtAJn91hPNYy4kp331qSE9iKIwHzUqW
FGjRDm+4fkm9pc8FS83DAsaK6DQckVw83KRkSkTLCZgk6q6OUxWlGmhLu2zXlTLUJzIbeMZxnErs
qyhnqdc2TadqQlhcCUgejpkuzmXf1ESiFvFmL9NgLeE/7H3FcSxrHSSuT1pWM6Sm7XlRfn8DinFZ
8dT+aEet09ksTSchPu65Zjx2I2uTnUwwbx6fMxZ81EsXLXjAUEyiKuQ+WZm5ISiIuMuwgW48NJd0
cj5AmgzEOm2jUbKjLk2dVJn0Vsky8oDPuvWhHYw8A1KsZJ885jaWKNZw0ZfkM6XbDpmNicxqoraR
b5hVymy26r6MbaJ1aEvqE1N4wWqk7qR/TliS8wF2OLdSrABejRT46VGF9TPf6p5FlE8Cqk42KL6V
f/s=
=cmSt
-----END PGP SIGNATURE-----

--------------3bSk7Pw8FtPoOEM7cSAU6RAG--
