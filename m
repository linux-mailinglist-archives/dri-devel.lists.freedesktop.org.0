Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D01522CF7
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 09:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66810E61A;
	Wed, 11 May 2022 07:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EDC10E5ED;
 Wed, 11 May 2022 07:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F0EF1F8F7;
 Wed, 11 May 2022 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652253284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTes6ZfbbVGmiq5E89jqT1Mo6GT9OLPK+Q4K2DqyMrs=;
 b=lKItyfn9/GmmJOz2KjaokNN+sp4ZqzTVnU+Nhxc57J8he1X+B14BeocqL39AeA4L0Utv/5
 6KpmpbIknnyCM20Y0vBtR49Wj5qGsdl3+upNEbTG8cA2v87+Vx0XtX0kvy1aQhxos40xIr
 nKEp0P0z/1l70TnyhqCK54fhxK3Y8QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652253284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTes6ZfbbVGmiq5E89jqT1Mo6GT9OLPK+Q4K2DqyMrs=;
 b=UJu6tlDTlIGSSsTqbTspLeh+NiDYPlFCvnFNtduumsAbKfyDY54+TErZ/Lvc2wbpk9KRbP
 xa4IDibAy8ayEHAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64C2013A76;
 Wed, 11 May 2022 07:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vWC2F2Rie2LCSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 May 2022 07:14:44 +0000
Message-ID: <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
Date: Wed, 11 May 2022 09:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W2ExxOTgGkTiT5e0Ie6077H9"
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W2ExxOTgGkTiT5e0Ie6077H9
Content-Type: multipart/mixed; boundary="------------h06qE9PVfR9iUVX0FBBghGEo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Message-ID: <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
Subject: Re: [PATCH v2] drm/probe-helper: Default to 640x480 if no EDID
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>

--------------h06qE9PVfR9iUVX0FBBghGEo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjIgdW0gMjI6NTEgc2NocmllYiBEb3VnbGFzIEFuZGVyc29uOg0K
PiBJZiB3ZSdyZSB1bmFibGUgdG8gcmVhZCB0aGUgRURJRCBmb3IgYSBkaXNwbGF5IGJlY2F1
c2UgaXQncyBjb3JydXB0IC8NCj4gYm9ndXMgLyBpbnZhbGlkIHRoZW4gd2UnbGwgYWRkIGEg
c2V0IG9mIHN0YW5kYXJkIG1vZGVzIGZvciB0aGUNCj4gZGlzcGxheS4gV2hlbiB1c2Vyc3Bh
Y2UgbG9va3MgYXQgdGhlc2UgbW9kZXMgaXQgZG9lc24ndCByZWFsbHkgaGF2ZSBhDQo+IGdv
b2QgY29uY2VwdCBmb3Igd2hpY2ggbW9kZSB0byBwaWNrIGFuZCBpdCdsbCBsaWtlbHkgcGlj
ayB0aGUgaGlnaGVzdA0KPiByZXNvbHV0aW9uIG9uZSBieSBkZWZhdWx0LiBUaGF0J3MgcHJv
YmFibHkgbm90IGlkZWFsIGJlY2F1c2UgdGhlIG1vZGVzDQo+IHdlcmUgcHVyZWx5IGd1ZXNz
ZXMgb24gdGhlIHBhcnQgb2YgdGhlIExpbnV4IGtlcm5lbC4NCg0KSSdtIHNrZXB0aWNhbC4g
V2h5IGRvZXMgdGhlIGtlcm5lbCBkbyBhIGJldHRlciBqb2IgdGhhbiB1c2Vyc3BhY2UgaGVy
ZT8gDQpPbmx5IHRoZSBncmFwaGljcyBkcml2ZXIgY291bGQgcG9zc2libHkgbWFrZSBzdWNo
IGEgZGVjaXNpb24uDQoNCk5vdCBzZXR0aW5nIGFueSBwcmVmZXJyZWQgbW9kZSBhdCBsZWFz
dCBnaXZlcyBhIGNsZWFyIG1lc3NhZ2UgdG8gdXNlcnNwYWNlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KPiBMZXQncyBpbnN0ZWFkIHNldCA2NDB4NDgwIGFzIHRoZSAicHJl
ZmVycmVkIiBtb2RlIHdoZW4gd2UgaGF2ZSBubyBFRElELg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4g
Tm90ZSB0aGF0IHRoaXMgaXMgdGhlIHNlY29uZCBvZiB0d28gcmVsYXRlZCBhbmQgc2ltaWxh
ci1zb3VuZGluZyBidXQNCj4gZGlmZmVyZW50IHBhdGNoZXMuIFNlZSBhbHNvICgiZHJtL3By
b2JlLWhlbHBlcjogRm9yIERQLCBhZGQgNjQweDQ4MCBpZg0KPiBhbGwgb3RoZXIgbW9kZXMg
YXJlIGJhZCIpIFsxXS4gSSdtIGhvcGluZyB0byBsYW5kIF9ib3RoXyBvZiB0aGUNCj4gcGF0
Y2hlcyBzaW5jZSB0aGV5IGFkZHJlc3MgZGlmZmVyZW50IGlzc3Vlcy4gVGhpcyBwYXRjaCBh
ZGRyZXNzZXMgdGhlDQo+IGNhc2Ugb2YgYSBjb3JydXB0IEVESUQgYW5kIGhhdmluZyA2NDB4
NDgwIGJlIHRoZSBkZWZhdWx0IGluIHRoZQ0KPiAiZ3Vlc3NlZCIgbW9kZXMuIFRoZSBvdGhl
ciBwYXRjaCBoYW5kbGVzIHRoZSBjYXNlIHdoZXJlIHRoZSBFRElEDQo+IF9pc24ndF8gY29y
cnVwdCBidXQgYWxsIHRoZSBtb2RlcyBsaXN0ZWQgY2FuJ3QgYmUgbWFkZSB3aXRoIHRoZQ0K
PiBleGlzdGluZyBzaXR1YXRpb25zLiBUaGUgdHdvIHBhdGNoZXMgY2FuIGxhbmQgaW4gZWl0
aGVyIG9yZGVyLg0KPiANCj4gQWxzbyBub3RlIHRoYXQgSSBkaWRuJ3QgY2FycnkgYW55IFRl
c3RlZC1ieSAvIFJldmlld2VkLWJ5IHRhZ3Mgc2luY2UNCj4gdGhlIHBhdGNoIGlzIG5vdyBx
dWl0ZSBkaWZmZXJlbnQuDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIyMDUxMDEzMTMwOS52Mi4yLkk0YWM3ZjU1YWE0NDY2OTlmOGMyMDBhMjNjMTA0NjMyNTZm
NmY0MzlmQGNoYW5nZWlkDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIERvbid0IG1vZGlm
eSBkcm1fYWRkX21vZGVzX25vZWRpZCgpICdjYXVzZSB0aGF0J2xsIGJyZWFrIG90aGVycw0K
PiAtIFNldCA2NDB4NDgwIGFzIHByZWZlcnJlZCBpbiBkcm1faGVscGVyX3Byb2JlX3Npbmds
ZV9jb25uZWN0b3JfbW9kZXMoKQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2Jl
X2hlbHBlci5jIHwgMTEgKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2Jl
X2hlbHBlci5jDQo+IGluZGV4IDY4MjM1OTUxMjk5Ni4uMWZiYjlhOGMzMTVjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMNCj4gQEAgLTUxNiw4ICs1MTYsMTcg
QEAgaW50IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcyhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPiAgIAkJY291bnQgPSBkcm1fYWRkX292ZXJy
aWRlX2VkaWRfbW9kZXMoY29ubmVjdG9yKTsNCj4gICANCj4gICAJaWYgKGNvdW50ID09IDAg
JiYgKGNvbm5lY3Rvci0+c3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkIHx8
DQo+IC0JCQkgICBjb25uZWN0b3ItPnN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX3Vua25v
d24pKQ0KPiArCQkJICAgY29ubmVjdG9yLT5zdGF0dXMgPT0gY29ubmVjdG9yX3N0YXR1c191
bmtub3duKSkgew0KPiAgIAkJY291bnQgPSBkcm1fYWRkX21vZGVzX25vZWRpZChjb25uZWN0
b3IsIDEwMjQsIDc2OCk7DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogR2l2ZSB1c2Vyc3BhY2Ug
YSBoaW50IHRoYXQgd2UgZG9uJ3QgaGF2ZSBhIGxvdCBvZiBjb25maWRlbmNlDQo+ICsJCSAq
IGluIHRoZXNlIG1vZGVzICh3ZSB0b3RhbGx5IGd1ZXNzZWQpIGJ5IG1hcmtpbmcgNjQweDQ4
MCBhcw0KPiArCQkgKiBwcmVmZXJyZWQuIFRoaXMgaXMgbG93IGNsb2NrIHJhdGUgYW5kIGlu
Y3JlZGlibHkgY29tbW9uIGFzDQo+ICsJCSAqIGEgZmFpbHNhZmUgbW9kZS4NCj4gKwkJICov
DQo+ICsJCWRybV9zZXRfcHJlZmVycmVkX21vZGUoY29ubmVjdG9yLCA2NDAsIDQ4MCk7DQo+
ICsJfQ0KPiAgIAljb3VudCArPSBkcm1faGVscGVyX3Byb2JlX2FkZF9jbWRsaW5lX21vZGUo
Y29ubmVjdG9yKTsNCj4gICAJaWYgKGNvdW50ID09IDApDQo+ICAgCQlnb3RvIHBydW5lOw0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------h06qE9PVfR9iUVX0FBBghGEo--

--------------W2ExxOTgGkTiT5e0Ie6077H9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ7YmMFAwAAAAAACgkQlh/E3EQov+C4
yRAAn+dUKxN5Uwx5Krr+v1kvNtNkIbz8IjGZ+roavrQcgD+s3zK0OSOW7I9Va944Fx6HKTX11WEL
6T7s6qcIJH9hfBHNk0t7tmm45MLNX9XX6qJpqwM4IEM+ekbw9yru2YovsVsGEv85LQHhSdmqYY+F
Fv8baLaBbN/XTHBQz7SRpcORvM0kFfQErEU2reIQn5xAjelWIQrO06Bx52IQvk5V/vfSEWdmzmCH
2UXTZuYuIEPexNzqRCjcHQJtQcWmeNw9Dc9Wv6t3c+oR4H8502oKjte4UcRK+VKGQQ/h9gGU8Fda
XHtGSn8BX386RhGmdaQAlQlzn98N+ZgiR1yYzIN5hUYCqrxAgbDu0Kgajzn2O0i9468LyuBn8ACG
q+IRFW43Nto4gIg9SYAybyUln9JTcmuWt5Cj/9FuQxignf5cBS9QLRbx8Nvr1VnrCymJ7s3tKb/m
fn5CtKUQKyqRsc+g7XcmUWaoxJL7nmsa7tCfIocUo50uR8oXO+qHcN7hIt08GlY+9JmoFYz8Yeyh
YO3oH5LhE2jn8jifpBWXQ6/g1fsMKvH96RlVN1EVzI8y4BaoCaOGcRou2eLtZa0tns/q8gFbuyJp
vhy4nR0ImYLlDoiqBd1KBgfkLmSG1rtluVcNXrrAQBmTLcx17S90rwMneGBQrH2IoUogJoOEnFwc
v6g=
=rAeO
-----END PGP SIGNATURE-----

--------------W2ExxOTgGkTiT5e0Ie6077H9--
