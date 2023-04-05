Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D36D80C8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4E10E9E3;
	Wed,  5 Apr 2023 15:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00C10E9E3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:06:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9BC31F6E6;
 Wed,  5 Apr 2023 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680707190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2kIQPRlex0nBeqtH/l+Ef5eKiBPCXp3r54hsGVfuN0=;
 b=gKLAf8XdYZO8IPa/kzr0tvvo3maPgYwrdkMc792aoIqB6Q6hGJ9yhJSfF3gELw4BpRRTq+
 nlLONJhiQil6HjDrVSPzjNLPbGXCIJ5xNy13X88yyaCz3TfCi6tU8vC+n8TpD0Lc3V+SNj
 Xd31wSSLy9wnX2YOVr1nDyEpbXw3AQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680707190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2kIQPRlex0nBeqtH/l+Ef5eKiBPCXp3r54hsGVfuN0=;
 b=/KifHnPXi8LQr9zPDHbyxmwtIb3waXhsX+diHL9zExSJNxjQ3+jv19uObV0i6isqvGvyh3
 1VfKY7n2V5ubwQDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D31F13A10;
 Wed,  5 Apr 2023 15:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /uhoHXaOLWRGIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:30 +0000
Message-ID: <791521e1-1d2b-c0ff-7fe3-57d81af2bf2c@suse.de>
Date: Wed, 5 Apr 2023 17:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20230330083607.12834-1-tzimmermann@suse.de>
 <ZC2L69yI6l_2zPuG@orome>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZC2L69yI6l_2zPuG@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9503PDom9JUMyWMoESvL0rN7"
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
Cc: linux-tegra@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9503PDom9JUMyWMoESvL0rN7
Content-Type: multipart/mixed; boundary="------------onvAPL1A2w86BaLPub86GyYd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org
Message-ID: <791521e1-1d2b-c0ff-7fe3-57d81af2bf2c@suse.de>
Subject: Re: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
References: <20230330083607.12834-1-tzimmermann@suse.de>
 <ZC2L69yI6l_2zPuG@orome>
In-Reply-To: <ZC2L69yI6l_2zPuG@orome>

--------------onvAPL1A2w86BaLPub86GyYd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA1LjA0LjIzIHVtIDE2OjU1IHNjaHJpZWIgVGhpZXJyeSBSZWRpbmc6DQo+IE9u
IFRodSwgTWFyIDMwLCAyMDIzIGF0IDEwOjM2OjAwQU0gKzAyMDAsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4gQ29udmVydCB0ZWdyYSdzIGZiZGV2IGNvZGUgdG8gc3RydWN0IGRy
bV9jbGllbnQuIFJlcGxhY2VzIHRoZSBjdXJyZW50DQo+PiBhZC1ob2MgaW50ZWdyYXRpb24u
IFRoZSBjb252ZXJzaW9uIGluY2x1ZGVzIGEgbnVtYmVyIG9mIGNsZWFudXBzLiBBcw0KPj4g
d2l0aCBtb3N0IG90aGVyIGRyaXZlcnMnIGZiZGV2IGVtdWxhdGlvbiwgZmJkZXYgaW4gdGVn
cmEgaXMgbm93IGp1c3QNCj4+IGFub3RoZXIgRFJNIGNsaWVudCB0aGF0IHJ1bnMgYWZ0ZXIg
dGhlIERSTSBkZXZpY2UgaGFzIGJlZW4gcmVnaXN0ZXJlZC4NCj4+DQo+PiBPbmNlIGFsbCBk
cml2ZXJzJyBmYmRldiBlbXVsYXRpb24gaGFzIGJlZW4gY29udmVydGVkIHRvIHN0cnVjdCBk
cm1fY2xpZW50LA0KPj4gd2UgY2FuIGF0dGVtcHQgdG8gYWRkIGFkZGl0aW9uYWwgaW4ta2Vy
bmVsIGNsaWVudHMuIEEgRFJNLWJhc2VkIGRtZXNnDQo+PiBsb2cgb3IgYSBib290c3BsYXNo
IGFyZSBjb21tb25seSBtZW50aW9uZWQuIERSTSBjYW4gdGhlbiBzd2l0Y2ggZWFzaWx5DQo+
PiBhbW9uZyB0aGUgZXhpc3RpbmcgY2xpZW50cyBpZi93aGVuIHJlcXVpcmVkLg0KPj4NCj4+
IEkgZGlkIHRoZSBjb252ZXJzaW9uIGZyb20gc2ltaWxhciBleHBlcmllbmNlIHdpdGggb3Ro
ZXIgZHJpdmVycy4gQnV0IEkNCj4+IGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlIHRvIHRlc3Qg
dGhpcy4gQW55IHRlc3RpbmcgaXMgd2VsY29tZS4NCj4+DQo+PiBUaG9tYXMgWmltbWVybWFu
biAoNyk6DQo+PiAgICBkcm0vdGVncmE6IEluY2x1ZGUgPGxpbnV4L29mLmg+DQo+PiAgICBk
cm0vdGVncmE6IEluY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPj4gICAgZHJtL3RlZ3JhOiBSZW1v
dmVkIGZiIGZyb20gc3RydWN0IHRlZ3JhX2ZiZGV2DQo+PiAgICBkcm0vdGVncmE6IFJlbW92
ZSBzdHJ1Y3QgdGVncmFfZmJkZXYNCj4+ICAgIGRybS90ZWdyYTogSGlkZSBmYmRldiBzdXBw
b3J0IGJlaGluZCBjb25maWcgb3B0aW9uDQo+PiAgICBkcm0vdGVncmE6IEluaXRpYWxpemUg
ZmJkZXYgRFJNIGNsaWVudA0KPj4gICAgZHJtL3RlZ3JhOiBJbXBsZW1lbnQgZmJkZXYgZW11
bGF0aW9uIGFzIGluLWtlcm5lbCBjbGllbnQNCj4+DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9NYWtlZmlsZSB8ICAgMiArDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0u
YyAgICB8ICAyMyArLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAgICB8
ICAyNyArKy0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jICAgICB8IDI0MiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2ZiZGV2LmMgIHwgMjQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYyB8ICAgMyArDQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS9yZ2IuYyAgICB8ICAgMSArDQo+PiAgIDcgZmlsZXMgY2hh
bmdlZCwgMjY1IGluc2VydGlvbnMoKyksIDI3MyBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYmRldi5jDQo+IA0KPiBTZWVt
cyB0byBiZSB3b3JraW5nIGp1c3QgZmluZS4gQXBwbGllZCwgdGhhbmtzLg0KDQpUaGFua3Mg
YSBsb3QhDQoNCj4gDQo+IFRoaWVycnkNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------onvAPL1A2w86BaLPub86GyYd--

--------------9503PDom9JUMyWMoESvL0rN7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtjnYFAwAAAAAACgkQlh/E3EQov+Bk
mQ//addCkJXFsWKQGDPr5GiC1uGkp4Nzj0ss2WCYaKxtU5O51gM6LL4Yln01e+vZuFIEKtTZP1yG
seQJpIlntp1cobCBJPRgEMYVw7707yfbNWlhg3KfYRJKuha3W3ve04tt7rrHfsB0s9gfZ8qGijWi
m9XC5hgfqB99mtAJgS+ZDsCr7ePxjrnIWZ10OqX2KxO+9X5dW9XHHzDmMMBvK3OByvE0pLB4n5l7
0lKRfoDjA4Di3rYlt8gVok9MXH1mFvP7u4Yk+4cz+p6pkOgfF6/LPmf9ehY72sg3s3Y8N02j+HfJ
8TuxAtA4Vz/ho6FRfLXkKkDuC9QYX0GgvZYT7r1Lqgu74hHggJP3SumRonPvFmMkSBLX0AJ+LwuL
PoDKpLBsiFSxEFiJSa0kGqi7jBbMLAQTLeyYQ5pe1rbtNpsi3Eqngj+s4oBDHFiwhkd5sGuRbqcM
WryRvkf+lMxHHVrXZW+7w49LBCdamE4NUXXFS7Rn5pthRgn+Njs7XdbWv3pcXsxoym1EOG1CoXFL
oAuuA/LDhopKt0ZA2UtlGnTqUqEbAe6+0h11oeBQy0dP/2f6/lTIVjgFA8cssRDdpb5SYzWU8/2W
Wak9PmOdSPYNXaq5SBRl69iw0TSras3sGeHiWL/tgg/w0QDE1Tnzj7Zf6ldoqpp7CelYdvKQSZCm
FC4=
=KmDg
-----END PGP SIGNATURE-----

--------------9503PDom9JUMyWMoESvL0rN7--
