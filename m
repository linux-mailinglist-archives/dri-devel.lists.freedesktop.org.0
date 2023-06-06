Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBB723ADF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011C410E211;
	Tue,  6 Jun 2023 08:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07EE10E211
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:01:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0FC01FD63;
 Tue,  6 Jun 2023 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686038497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/TE6zVCRq29HuGy5d7GIpLOa+ICFNR+J5+3C//QsCM=;
 b=uKJ5ggFn/WW+0FZko2JGOegGPip8/4GkaQfVv60LhMeW1sK7+o0Btz1YtdZ3lVDzwx/XJD
 kcSueOlXjeG1VGVgUH0Ck+T8mM0e+Q8tlyFYHsV9UMQKa5eP520r3MGDNNiM+hGzsz2sZ7
 ly3uXD5xfvk/rToqS1pD5pZSPf2GT1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686038497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/TE6zVCRq29HuGy5d7GIpLOa+ICFNR+J5+3C//QsCM=;
 b=V52dAcAoEB23yBsJMqOIxepI/ju/rhCEPGThjzkJYqo9a5V6Xh8FVVBlCsZEqg5n88WwGZ
 nauwrBDA7eAWgRBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B987313519;
 Tue,  6 Jun 2023 08:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kRRiLOHnfmRcIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 08:01:37 +0000
Message-ID: <6b0a12bf-a8d4-43df-860c-3aa271cfc624@suse.de>
Date: Tue, 6 Jun 2023 10:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/5] drm/ssd130x: A few enhancements and cleanups
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230605074753.562332-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230605074753.562332-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CyUiPeozYYacUyESNr435dOY"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CyUiPeozYYacUyESNr435dOY
Content-Type: multipart/mixed; boundary="------------GpYSlaN0KD7buWrEyk10G0FZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <6b0a12bf-a8d4-43df-860c-3aa271cfc624@suse.de>
Subject: Re: [PATCH 0/5] drm/ssd130x: A few enhancements and cleanups
References: <20230605074753.562332-1-javierm@redhat.com>
In-Reply-To: <20230605074753.562332-1-javierm@redhat.com>

--------------GpYSlaN0KD7buWrEyk10G0FZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVybSwNCg0KSSd2ZSByZWFkIHRocm91Z2ggdGhlIHBhdGNoZXMgYW5kIHRoZXkg
bG9vayBjb3JyZWN0IHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkJ1dCBJIGhhZCBvbmUgcXVlc3Rpb24gYWJvdXQg
dGhlIHBhZ2Ugc2l6ZS4gWW91IHJvdW5kIHVwIHRvIG11bHRpcGxlcyBvZiANCnBhZ2Vfc2l6
ZSBpbiBzZXZlcmFsIHBsYWNlcy4gVGhhdCBjb3VsZCBsZWFkIHRvIGFuIG91dC1vZi1ib3Vu
ZHMgYWNjZXNzLiANCkRvIHlvdSBuZWVkIHRvIGFsbG9jYXRlIEdFTSBidWZmZXJzIHRvIGJl
IG11bHRpcGxlcyBvZiBwYWdlX3NpemUgYXMgd2VsbD8NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KQW0gMDUuMDYuMjMgdW0gMDk6NDcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvLA0KPiANCj4gV2hpbGUgd29ya2luZyBvbiBhZGRpbmcgc3VwcG9y
dCBmb3IgdGhlIFNTRDEzMlggZmFtaWx5IG9mIDQtYml0IGdyYXlzY2FsZQ0KPiBTb2xvbW9u
IE9MRUQgcGFuZWwgY29udHJvbGxlcnMsIEkgbm90aWNlZCBhIGZldyB0aGluZ3MgaW4gdGhl
IGRyaXZlciB0aGF0DQo+IGNhbiBiZSBpbXByb3ZlZCBhbmQgbWFrZSBleHRlbmRpbmcgdG8g
c3VwcG9ydCBvdGhlciBjaGlwIGZhbWlsaWVzIGVhc2llci4NCj4gDQo+IEkndmUgc3BsaXQg
dGhlIHByZXBhcmF0b3J5IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYW5kIHdpbGwgcG9zdCB0
aGUgYWN0dWFsDQo+IFNTRDEzMlggc3VwcG9ydCBhcyBhIHNlcGFyYXRlIHBhdGNoLXNldCBv
bmNlIHRoaXMgb25lIGlzIG1lcmdlZC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gSmF2aWVy
DQo+IA0KPiANCj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzICg1KToNCj4gICAgZHJtL3Nz
ZDEzMHg6IE1ha2UgZGVmYXVsdCB3aWR0aCBhbmQgaGVpZ2h0IHRvIGJlIGNvbnRyb2xsZXIg
ZGVwZW5kZW50DQo+ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzc2QxMzA3ZmI6IFJlbW92
ZSBkZWZhdWx0IHdpZHRoIGFuZCBoZWlnaHQNCj4gICAgICB2YWx1ZXMNCj4gICAgZHJtL3Nz
ZDEzMHg6IFNldCB0aGUgcGFnZSBoZWlnaHQgdmFsdWUgaW4gdGhlIGRldmljZSBpbmZvIGRh
dGENCj4gICAgZHJtL3NzZDEzMHg6IERvbid0IGFsbG9jYXRlIGJ1ZmZlcnMgb24gZWFjaCBw
bGFuZSB1cGRhdGUNCj4gICAgZHJtL3NzZDEzMHg6IFJlbW92ZSBoYXJkY29kZWQgYml0cy1w
ZXItcGl4ZWwgaW4gc3NkMTMweF9idWZfYWxsb2MoKQ0KPiANCj4gICAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9zb2xvbW9uLHNzZDEzMDdmYi55YW1sICAgfCAgIDggKy0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgICAgICAgICAgICAgfCAxMjQgKysrKysrKysr
KysrLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5oICAgICAg
ICAgICAgIHwgICA2ICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKyks
IDQ1IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6
IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9l
cm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------GpYSlaN0KD7buWrEyk10G0FZ--

--------------CyUiPeozYYacUyESNr435dOY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR+5+AFAwAAAAAACgkQlh/E3EQov+Ax
uhAAnjqM2/S3q0LTwmr7+H3d22qxVMTSWB9v+d/XEEx+CAkmIb50OLBOrvv/47ZtpWudhd/fwgly
4FDp/DR/e3Kalv4RQB62THzPCvJ+m8LsyeHcB2mWTk+NsEL3GLqJp3orXqRdNnwhNTwqguVsLn9A
AXzA4q/O3i23OYEbvOezpQbBLaVcM9XLrrSUlktghzNsdJ7hAvnwYshrxcOqEvgwjESffe/IBCl6
1p72+TxUWQVsQrHeaDQvDw4o0d1pGd8+ckWVuZ2AlUPuGrgPzQ55rzF5P3NeNAj7+XvRN9BHmYnw
IHHnO4/dQ3tCLIAOXSSPaOJnE+RVlMDHf2AiQvU6jxeXW0191a7E3bLJJhJY7tXT2BW8GuegiFVg
5A/WUjQRSooiDkqMX7NnJwomjLEEAS2/pyHGkRpOhbQYGYKjEXMPvMjBsXvIlPF9iQYinP/3CryO
pW5ZRRX+/3pVm8YL7AWISyROfNtNE9UwRKEjiwjPaOWtDNHqLgT5/2lTG8xEyDMATQSX55ySy0wo
45PzUfMA9aOrAg6zsUkZCmeMvmJgzG6CTQ75ulHg9CkLxVmTumxWBcU7K+moXeWyIzNQxsomyuE7
SWBDQSMu8ZcnfgcjJj9UK3VWS3IpSImI4CxVWIWDBcBIBzqz5zqUPmL/aXGecLA05aIg6unA+vUk
x6w=
=0+0j
-----END PGP SIGNATURE-----

--------------CyUiPeozYYacUyESNr435dOY--
