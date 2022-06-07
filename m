Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280854051C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7799510F068;
	Tue,  7 Jun 2022 17:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA1E10F05E;
 Tue,  7 Jun 2022 17:22:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2F271F9C5;
 Tue,  7 Jun 2022 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654622559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqrHo72t/egh4eNcpx8eoTFgHBdSO5h/73dIvIbUMoc=;
 b=i31KyvkjR3ttXiDZKKYNnfh7FMxbcNejOIkF2dskvohB7fOjjF6KD3Z7ILHJVnDLoCem5R
 F4A4LoqqV2jbiXNFzkAU7NShq64dkkv8TQ0GxqAjAifXWYPm4jcIVTlx5/C7Jm3zzXTFNF
 2+W3Wpm2xzma+DeB3Ue1kx55XnWNZ0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654622559;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqrHo72t/egh4eNcpx8eoTFgHBdSO5h/73dIvIbUMoc=;
 b=LTSsckAlefo3halfg034rdzHNz567wacaNmmndzCRH8VGBHFPJbOdRLeLNqDBv+NxkDV5/
 V+XCH1MOG7BRgCCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C055013A88;
 Tue,  7 Jun 2022 17:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y2u+LV6Jn2LqEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 17:22:38 +0000
Message-ID: <26a6ed05-264a-eef6-a0ee-527d6968f8a8@suse.de>
Date: Tue, 7 Jun 2022 19:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
 <CAF6AEGuikc8Qh2ixEvJoeN0hQ+VLJNk_jBQm8fqYQAJ=ihpo1g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAF6AEGuikc8Qh2ixEvJoeN0hQ+VLJNk_jBQm8fqYQAJ=ihpo1g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------89GWd80acGp6EW6OVodnIp0z"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------89GWd80acGp6EW6OVodnIp0z
Content-Type: multipart/mixed; boundary="------------5RHAoO43WMHEge7jXP9WGHn3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Message-ID: <26a6ed05-264a-eef6-a0ee-527d6968f8a8@suse.de>
Subject: Re: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
 <CAF6AEGuikc8Qh2ixEvJoeN0hQ+VLJNk_jBQm8fqYQAJ=ihpo1g@mail.gmail.com>
In-Reply-To: <CAF6AEGuikc8Qh2ixEvJoeN0hQ+VLJNk_jBQm8fqYQAJ=ihpo1g@mail.gmail.com>

--------------5RHAoO43WMHEge7jXP9WGHn3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDYuMjIgdW0gMTY6NTggc2NocmllYiBSb2IgQ2xhcms6DQo+IE9uIE1v
biwgSnVuIDYsIDIwMjIgYXQgMTE6NTYgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMDYuMDYuMjIgdW0g
MjE6NTQgc2NocmllYiBSb2IgQ2xhcms6DQo+Pj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xh
cmtAY2hyb21pdW0ub3JnPg0KPj4+DQo+Pj4gVGhlIERFRklORV9EUk1fR0VNX0ZPUFMoKSBo
ZWxwZXIgaXMgYSBiaXQgbGltaXRpbmcgaWYgYSBkcml2ZXIgd2FudHMgdG8NCj4+PiBwcm92
aWRlIGFkZGl0aW9uYWwgZmlsZSBvcHMsIGxpa2Ugc2hvd19mZGluZm8oKS4NCj4+Pg0KPj4+
IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4+
PiAtLS0NCj4+PiAgICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggfCAyNiArKysrKysrKysrKysr
KysrKystLS0tLS0tLQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPj4+IGluZGV4IDlkN2M2MWExMjJk
Yy4uZGM4OGQ0YTJjZGY2IDEwMDY0NA0KPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0u
aA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPj4+IEBAIC0zMTQsNiArMzE0
LDIzIEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCB7DQo+Pj4gICAgICAgIGNvbnN0IHN0cnVj
dCBkcm1fZ2VtX29iamVjdF9mdW5jcyAqZnVuY3M7DQo+Pj4gICAgfTsNCj4+Pg0KPj4+ICsv
KioNCj4+PiArICogRFJNX0dFTV9GT1BTIC0gRGVmYXVsdCBkcm0gR0VNIGZpbGUgb3BlcmF0
aW9ucw0KPj4+ICsgKg0KPj4+ICsgKiBUaGlzIG1hY3JvIHByb3ZpZGVzIGEgc2hvcnRoYW5k
IGZvciBzZXR0aW5nIHRoZSBHRU0gZmlsZSBvcHMgaW4gdGhlDQo+Pj4gKyAqICZmaWxlX29w
ZXJhdGlvbnMgc3RydWN0dXJlLg0KPj4NCj4+IEkgd291bGQgYXBwcmVjaWF0ZSBhIHJlZmVy
ZW5jZSB0byBERUZJTkVfRFJNX0dFTV9GT1BTLiBTb21ldGhpbmcgYWxvbmcNCj4+IHRoZSBs
aW5lcyBvZiAnaWYgYWxsIHlvdSBuZWVkIGFyZSB0aGUgZGVmYXVsdCBvcHMsIHVzZSBERUZJ
TkVfRFJNX0dFTV9GT1BTJy4NCj4+DQo+Pj4gKyAqLw0KPj4+ICsjZGVmaW5lIERSTV9HRU1f
Rk9QUyBcDQo+Pj4gKyAgICAgLm9wZW4gICAgICAgICAgID0gZHJtX29wZW4sXA0KPj4+ICsg
ICAgIC5yZWxlYXNlICAgICAgICA9IGRybV9yZWxlYXNlLFwNCj4+PiArICAgICAudW5sb2Nr
ZWRfaW9jdGwgPSBkcm1faW9jdGwsXA0KPj4+ICsgICAgIC5jb21wYXRfaW9jdGwgICA9IGRy
bV9jb21wYXRfaW9jdGwsXA0KPj4+ICsgICAgIC5wb2xsICAgICAgICAgICA9IGRybV9wb2xs
LFwNCj4+PiArICAgICAucmVhZCAgICAgICAgICAgPSBkcm1fcmVhZCxcDQo+Pj4gKyAgICAg
Lmxsc2VlayAgICAgICAgID0gbm9vcF9sbHNlZWssXA0KPj4+ICsgICAgIC5tbWFwICAgICAg
ICAgICA9IGRybV9nZW1fbW1hcA0KPj4+ICsNCj4+PiArDQo+Pg0KPj4gT25seSBvbmUgZW1w
dHkgbGluZSBwbGVhc2UuDQo+Pg0KPj4+ICAgIC8qKg0KPj4+ICAgICAqIERFRklORV9EUk1f
R0VNX0ZPUFMoKSAtIG1hY3JvIHRvIGdlbmVyYXRlIGZpbGUgb3BlcmF0aW9ucyBmb3IgR0VN
IGRyaXZlcnMNCj4+PiAgICAgKiBAbmFtZTogbmFtZSBmb3IgdGhlIGdlbmVyYXRlZCBzdHJ1
Y3R1cmUNCj4+PiBAQCAtMzMwLDE0ICszNDcsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
ew0KPj4+ICAgICNkZWZpbmUgREVGSU5FX0RSTV9HRU1fRk9QUyhuYW1lKSBcDQo+Pj4gICAg
ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG5hbWUgPSB7XA0KPj4+
ICAgICAgICAgICAgICAgIC5vd25lciAgICAgICAgICA9IFRISVNfTU9EVUxFLFwNCj4+DQo+
PiBJcyB0aGVyZSBhIHNwZWNpZmljIHJlYXNvbiB3aHkgLm93bmVyIGlzIHN0aWxsIHNldCBo
ZXJlPyBJIHN1c3BlY3QgdGhhdA0KPj4gRFJNX0dFTV9GT1BTIGlzIHN0cmljdGx5IGZvciBj
YWxsYmFjayBmdW5jdGlvbnM/DQo+IA0KPiBJIHdhcyBvbiB0aGUgZmVuY2UgYWJvdXQgdGhh
dCBvbmUsIGJ1dCBpdCBzZWVtZWQgYmV0dGVyIHRvIG5vdCBtaXgNCj4gIm1hZ2ljIiBhbmQg
dGhlIGNhbGxiYWNrcy4uIGJ1dCBJIGNvdWxkIGJlIGNvbnZpbmNlZCBpbiBlaXRoZXINCj4g
ZGlyZWN0aW9uDQoNCkkgdGhpbmsgeW91IG1hZGUgdGhlIHJpZ2h0IGNob2ljZS4gSXQncyBj
bGVhbmVyIGFuZCBtb3N0IGRyaXZlcnMgd2lsbCANCndhbnQgdG8gdXNlIERFRklORV9EUk1f
R0VNX0ZPUFMsIHdoaWNoIGluY2x1ZGVzIHRoZSBtYWdpYy4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4+IEluIGFueSBjYXNlDQo+Pg0KPj4gQWNrZWQtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gdGh4LCBJJ2xsIGZpeHVw
IHRoZSBvdGhlciBuaXRzIGluIHYzLg0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRo
b21hcw0KPj4NCj4+PiAtICAgICAgICAgICAgIC5vcGVuICAgICAgICAgICA9IGRybV9vcGVu
LFwNCj4+PiAtICAgICAgICAgICAgIC5yZWxlYXNlICAgICAgICA9IGRybV9yZWxlYXNlLFwN
Cj4+PiAtICAgICAgICAgICAgIC51bmxvY2tlZF9pb2N0bCA9IGRybV9pb2N0bCxcDQo+Pj4g
LSAgICAgICAgICAgICAuY29tcGF0X2lvY3RsICAgPSBkcm1fY29tcGF0X2lvY3RsLFwNCj4+
PiAtICAgICAgICAgICAgIC5wb2xsICAgICAgICAgICA9IGRybV9wb2xsLFwNCj4+PiAtICAg
ICAgICAgICAgIC5yZWFkICAgICAgICAgICA9IGRybV9yZWFkLFwNCj4+PiAtICAgICAgICAg
ICAgIC5sbHNlZWsgICAgICAgICA9IG5vb3BfbGxzZWVrLFwNCj4+PiAtICAgICAgICAgICAg
IC5tbWFwICAgICAgICAgICA9IGRybV9nZW1fbW1hcCxcDQo+Pj4gKyAgICAgICAgICAgICBE
Uk1fR0VNX0ZPUFMsXA0KPj4+ICAgICAgICB9DQo+Pj4NCj4+PiAgICB2b2lkIGRybV9nZW1f
b2JqZWN0X3JlbGVhc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPj4NCj4+IC0t
DQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------5RHAoO43WMHEge7jXP9WGHn3--

--------------89GWd80acGp6EW6OVodnIp0z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKfiV4FAwAAAAAACgkQlh/E3EQov+DQ
uQ/+KnvET6HMvJUhfdKhlai2pSkrzSbKSF2Pb+b1D3obDj4/rK/d2B+cC/pl+fqz8bu0ViMTnRQL
IKKuUABF02sxx1VdHHvFxXZKlk7Nw2CzW7PFd2uoPMpY50gboPp8bR8mOMVqhHsZhOHAVacOtZsB
YmVClM+TODlUgzky+wC5/sQtULVNgOdmZHn1M5EpxTAvThMPotan+BTJF5JgO39TQG13REF5g+Y6
J/KWvQlYWjN4YZBDsCLFlC7sqHJLDFtAsdCPsOH86Wqx3w9z9UGVH4D5eDbMmNftbY5lR4aBnVaw
46nfs/Z6shV07FmZwTduGDNRLGyjDnR+2OoDVVp6jl89+W3/HGZEqkmhQHRHljo+3LrClRECSoPk
YR5IaXgud6ANeiuRWPI1W4ogxrhlZNjDNiJ8wBlQQjQ4llBm3YvVFjBDP+CzkdCVDuhACQd338DW
71lvJaWeuoWlms97Saolua/DED2AnC5nH83gC2so+vxyC6a+IvuRiegKW3XrLRKN1fUdIjCiZYSO
OHlsV9HLvGKuMcZrfe1KY4NrTM5YKkXvt5Ng1lUgKRxrjIeukOuHaxJWgtVSzZObIFxgRlcM0SO9
CWiCI4BnT/e6lZDNtExIvobeAofZLUBsvUzDYjO3z4bxVqXJIcpmO/2zMBcpCdhTBTTMfuKKG7GH
DJM=
=5OZi
-----END PGP SIGNATURE-----

--------------89GWd80acGp6EW6OVodnIp0z--
