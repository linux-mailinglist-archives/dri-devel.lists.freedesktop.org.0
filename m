Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786E6F06E7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 15:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483F10E284;
	Thu, 27 Apr 2023 13:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32E510E284
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 13:54:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1570321A4E;
 Thu, 27 Apr 2023 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682603674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZ5CXx61DlIwnory3L9+QYP6+SkR5bSvBqmjWzUPpJc=;
 b=BOfFSIDyQXWnW6DSjZ/+t4HzKjtGqOoVWeGnNzl07CZqO2FJvGGZA4fIuQmqoasU0lbvGY
 KkiUm/vHvFVAjxIXM4J7c49JdRIYKPrph81heoKz5rzzOLmfyCTjHa+kCFbiAG9krwkRJP
 QrpsrOKZ8BM+fjHZZZ68GHjheBAQfCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682603674;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZ5CXx61DlIwnory3L9+QYP6+SkR5bSvBqmjWzUPpJc=;
 b=84QEalb8HiJ31bHdApYvMREU6FVrr33PK+K10HBKfCC6HPNjHGkKPc2x70y/D9fVOpmA88
 C1EdPmhu4wrNL8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB49B138F9;
 Thu, 27 Apr 2023 13:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S80eMJl+SmS+BQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Apr 2023 13:54:33 +0000
Message-ID: <a579ef4b-2183-0456-0aeb-379abf216a3d@suse.de>
Date: Thu, 27 Apr 2023 15:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/6] fbdev: Validate info->screen_{base, buffer} in fb_ops
 implementations
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-5-tzimmermann@suse.de>
 <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PXdOtrP30q7JG6OOhMDyo9Ud"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PXdOtrP30q7JG6OOhMDyo9Ud
Content-Type: multipart/mixed; boundary="------------plRhPPhYgITRq5CDLVqcy4qF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <a579ef4b-2183-0456-0aeb-379abf216a3d@suse.de>
Subject: Re: [PATCH 4/6] fbdev: Validate info->screen_{base,buffer} in fb_ops
 implementations
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-5-tzimmermann@suse.de>
 <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>
In-Reply-To: <CAMuHMdX8A_5Kd_D4qQfmYLbECekLWHFzrcK-xMTeyBaz=T_a-A@mail.gmail.com>

--------------plRhPPhYgITRq5CDLVqcy4qF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTY6NTYgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IA0KPiBPbiBUdWUsIEFwciAyNSwgMjAyMyBhdCA0OjI4
4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0K
Pj4gUHVzaCB0aGUgdGVzdCBmb3IgaW5mby0+c2NyZWVuX2Jhc2UgZnJvbSBmYl9yZWFkKCkg
YW5kIGZiX3dyaXRlKCkgaW50bw0KPj4gdGhlIGltcGxlbWVudGF0aW9ucyBvZiBzdHJ1Y3Qg
ZmJfb3BzLntmYl9yZWFkLGZiX3dyaXRlfS4gSW4gY2FzZXMgd2hlcmUNCj4+IHRoZSBkcml2
ZXIgb3BlcmF0ZXMgb24gaW5mby0+c2NyZWVuX2J1ZmZlciwgdGVzdCB0aGlzIGZpZWxkIGlu
c3RlYWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IFlvdSBm
b3Jnb3QgdG8gbWVudGlvbiB3aHkgaXQgaXMgYSBnb29kIGlkZWEgdG8gZHVwbGljYXRlIHRo
aXMgaW4gYWxsDQo+IHRoZSBpbXBsZW1lbnRhdGlvbnMsIGluc3RlYWQgb2YgZG9pbmcgaXQg
b25jZSBpbiB0aGUgY29yZT8NCj4gDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29iYWx0
X2xjZGZiLmMgICAgIHwgIDYgKysrKysrDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYl9zeXNfZm9wcy5jIHwgIDYgKysrKysrDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5jICAgICAgIHwgMTAgKysrKysrKystLQ0KPj4gICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L3NtNzEyZmIuYyAgICAgICAgICB8ICA0ICsrLS0NCj4+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gQXJlbid0IHRo
ZXJlIG1vcmUgZmJkZXYgZHJpdmVycyB0byBmaXgsIGJlZm9yZSB5b3UgY2FuIG1vdmUgdGhl
IGNoZWNrcw0KPiBpbiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYz8NCg0KSSd2
ZSBmb3VuZCBhIGZldy4gQW5kIEkndmUgYWxzbyBmb3VuZCBxdWl0ZSBhIG51bWJlciBvZiBk
cml2ZXJzIHRoYXQgdXNlIA0Kc2NyZWVuX2Jhc2Ugd2hlbiB0aGV5IHNob3VsZCB1c2Ugc2Ny
ZWVuX2J1ZmZlciBpbnN0ZWFkLiBJJ2xsIGZpeCB0aGVtIGFzIA0Kd2VsbC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdl
cm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBC
b3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------plRhPPhYgITRq5CDLVqcy4qF--

--------------PXdOtrP30q7JG6OOhMDyo9Ud
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRKfpkFAwAAAAAACgkQlh/E3EQov+Dc
+A/+LFpIMFm2aGDGSMuIrNjfMrYxv3fMZFZjHJxFy0H10uosDMAHyb6KDAy0vn0Z+fjQfeni0Aas
n3H/fEjo1XIm8mn/KU+2OIDpwDVbHplAN6WmWg3B+qCHwZmSKCBcF221HY6mRCAM7N6v8Q1HADLs
OmHx/k/4vAq5oaAxBrxpPS4Y/rPXbnnKq+kWYPF3fYaicdIRGkrioxMCnlFrGnzgSgtZh6eJp2fJ
2AzggGEIG+do4fwiZlAh99n673+oc+MWUdsPDWegXkv+e12gx9OCz0R5ueGM2Q/nG1Nu933s9hK0
CYJlYrJAUpshK1avEVsrelTDgp2Bf0Y5/SUNjGrsJ9dZ3bp2QONGdTxeB5XpN3aB6WXdCFHL9pEc
JhK/45TrGnn+qUFkMcX1gPjUMVQFOPjp1QBmzNVktXs13iadxosivrkhp6HI3MAemMLORxRUDvI9
9MIiW8+ZdBl4+ZwSXnzPEhG13RX9tBRT2USSEMsG3f9uacKHpJW4DKu3g+Jgu3g25DZShiYUgBxh
aXKBWU/J8VvlwZk6NHbO89rSZzij07qG1g5jVviK/Qrb85WjryLwjCEZ6OQAx8eYSjYFIbUrRN4s
2Nc4v8ShUNkCrjy+uLxLovB+fDZVmVUkJhx4B1oM/k4i7jFcyhfnACNR5fMXpN6DUw6aQN4SKMRW
nkc=
=XiIQ
-----END PGP SIGNATURE-----

--------------PXdOtrP30q7JG6OOhMDyo9Ud--
