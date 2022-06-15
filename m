Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F254CA1D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71410ECDE;
	Wed, 15 Jun 2022 13:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F212D10ECDE;
 Wed, 15 Jun 2022 13:46:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F87521C5A;
 Wed, 15 Jun 2022 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655300799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iw2jPfqQLlQoX6LpWeZ9/tB9JNb7rzIb1MZz0AVsEEk=;
 b=JCegLWCPSVTLynsDQtvK8IxzjXkGE5OqKVZrJF/3a6IUIZ81WIkfgeiCkicuka3kRv2FTw
 1RgcCDku63qj7yMqlF7yEGl0F3xCzqMWo4STyxGQz+YIJTJM4lcGC3aPHvs2u7BKjxMJxH
 UGgY4eeRYa9wvUN0rFh8TRKg8FKCJ+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655300799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iw2jPfqQLlQoX6LpWeZ9/tB9JNb7rzIb1MZz0AVsEEk=;
 b=Vv/oRgxY3qp2fZqDIWLYhONZYJCScD1xArOZxb4ve7qhDavbd74xXEb0U/6jjmFKn5a8o8
 ipePg5kDnDtP3QDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6888313A35;
 Wed, 15 Jun 2022 13:46:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wahiGL/iqWJ/LAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jun 2022 13:46:39 +0000
Message-ID: <d2a0c8e3-4987-44e9-4abe-99c571738836@suse.de>
Date: Wed, 15 Jun 2022 15:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220609174213.2265938-1-robdclark@gmail.com>
 <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VRpy50pJeVxwM2suD9NUp0hG"
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VRpy50pJeVxwM2suD9NUp0hG
Content-Type: multipart/mixed; boundary="------------1S0aSUT3yvbPCdxnHl9OHuKO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Message-ID: <d2a0c8e3-4987-44e9-4abe-99c571738836@suse.de>
Subject: Re: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
References: <20220609174213.2265938-1-robdclark@gmail.com>
 <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>
In-Reply-To: <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>

--------------1S0aSUT3yvbPCdxnHl9OHuKO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE1LjA2LjIyIHVtIDE0OjQ1IHNjaHJpZWIgRG1pdHJ5IEJhcnlzaGtvdjoNCj4g
T24gMDkvMDYvMjAyMiAyMDo0MiwgUm9iIENsYXJrIHdyb3RlOg0KPj4gRnJvbTogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPg0KPj4NCj4+IFRoZSBERUZJTkVfRFJNX0dF
TV9GT1BTKCkgaGVscGVyIGlzIGEgYml0IGxpbWl0aW5nIGlmIGEgZHJpdmVyIHdhbnRzIHRv
DQo+PiBwcm92aWRlIGFkZGl0aW9uYWwgZmlsZSBvcHMsIGxpa2Ugc2hvd19mZGluZm8oKS4N
Cj4+DQo+PiB2MjogU3BsaXQgb3V0IERSTV9HRU1fRk9QUyBpbnN0ZWFkIG9mIG1ha2luZyBE
RUZJTkVfRFJNX0dFTV9GT1BTDQo+PiDCoMKgwqDCoCB2YXJhcmRpYw0KPj4gdjM6IG5pdHMN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5v
cmc+DQo+PiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+IA0KPiBJIHN1c3BlY3QgdGhhdCB3aXRoIFRvbWFzJ3MgYWNrIHdlIGNhbiBwaWNr
IHRoaXMgdGhyb3VnaCB0aGUgZHJtL21zbS4gSXMgDQo+IHRoaXMgY29ycmVjdD8gKEknbGwg
dGhlbiBwaWNrIGl0IGZvciB0aGUgbXNtLWx1bWFnKS4NCg0KU3VyZSwgZ28gYWhlYWQuDQoN
Cj4gDQo+PiAtLS0NCj4+IMKgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCB8IDI2ICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2dlbS5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oDQo+PiBpbmRleCA5ZDdjNjFhMTIy
ZGMuLjg3Y2ZmYzllZmE4NSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0u
aA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oDQo+PiBAQCAtMzE0LDYgKzMxNCwy
MyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qgew0KPj4gwqDCoMKgwqDCoCBjb25zdCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgKmZ1bmNzOw0KPj4gwqAgfTsNCj4+ICsvKioNCj4+
ICsgKiBEUk1fR0VNX0ZPUFMgLSBEZWZhdWx0IGRybSBHRU0gZmlsZSBvcGVyYXRpb25zDQo+
PiArICoNCj4+ICsgKiBUaGlzIG1hY3JvIHByb3ZpZGVzIGEgc2hvcnRoYW5kIGZvciBzZXR0
aW5nIHRoZSBHRU0gZmlsZSBvcHMgaW4gdGhlDQo+PiArICogJmZpbGVfb3BlcmF0aW9ucyBz
dHJ1Y3R1cmUuwqAgSWYgYWxsIHlvdSBuZWVkIGFyZSB0aGUgZGVmYXVsdCBvcHMsIHVzZQ0K
Pj4gKyAqIERFRklORV9EUk1fR0VNX0ZPUFMgaW5zdGVhZC4NCj4+ICsgKi8NCj4+ICsjZGVm
aW5lIERSTV9HRU1fRk9QUyBcDQo+PiArwqDCoMKgIC5vcGVuwqDCoMKgwqDCoMKgwqAgPSBk
cm1fb3BlbixcDQo+PiArwqDCoMKgIC5yZWxlYXNlwqDCoMKgID0gZHJtX3JlbGVhc2UsXA0K
Pj4gK8KgwqDCoCAudW5sb2NrZWRfaW9jdGzCoMKgwqAgPSBkcm1faW9jdGwsXA0KPj4gK8Kg
wqDCoCAuY29tcGF0X2lvY3RswqDCoMKgID0gZHJtX2NvbXBhdF9pb2N0bCxcDQo+PiArwqDC
oMKgIC5wb2xswqDCoMKgwqDCoMKgwqAgPSBkcm1fcG9sbCxcDQo+PiArwqDCoMKgIC5yZWFk
wqDCoMKgwqDCoMKgwqAgPSBkcm1fcmVhZCxcDQo+PiArwqDCoMKgIC5sbHNlZWvCoMKgwqDC
oMKgwqDCoCA9IG5vb3BfbGxzZWVrLFwNCj4+ICvCoMKgwqAgLm1tYXDCoMKgwqDCoMKgwqDC
oCA9IGRybV9nZW1fbW1hcA0KPj4gKw0KPj4gwqAgLyoqDQo+PiDCoMKgICogREVGSU5FX0RS
TV9HRU1fRk9QUygpIC0gbWFjcm8gdG8gZ2VuZXJhdGUgZmlsZSBvcGVyYXRpb25zIGZvciBH
RU0gDQo+PiBkcml2ZXJzDQo+PiDCoMKgICogQG5hbWU6IG5hbWUgZm9yIHRoZSBnZW5lcmF0
ZWQgc3RydWN0dXJlDQo+PiBAQCAtMzMwLDE0ICszNDcsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3Qgew0KPj4gwqAgI2RlZmluZSBERUZJTkVfRFJNX0dFTV9GT1BTKG5hbWUpIFwNCj4+
IMKgwqDCoMKgwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbmFtZSA9
IHtcDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLm93bmVywqDCoMKgwqDCoMKgwqAgPSBUSElT
X01PRFVMRSxcDQo+PiAtwqDCoMKgwqDCoMKgwqAgLm9wZW7CoMKgwqDCoMKgwqDCoCA9IGRy
bV9vcGVuLFwNCj4+IC3CoMKgwqDCoMKgwqDCoCAucmVsZWFzZcKgwqDCoCA9IGRybV9yZWxl
YXNlLFwNCj4+IC3CoMKgwqDCoMKgwqDCoCAudW5sb2NrZWRfaW9jdGzCoMKgwqAgPSBkcm1f
aW9jdGwsXA0KPj4gLcKgwqDCoMKgwqDCoMKgIC5jb21wYXRfaW9jdGzCoMKgwqAgPSBkcm1f
Y29tcGF0X2lvY3RsLFwNCj4+IC3CoMKgwqDCoMKgwqDCoCAucG9sbMKgwqDCoMKgwqDCoMKg
ID0gZHJtX3BvbGwsXA0KPj4gLcKgwqDCoMKgwqDCoMKgIC5yZWFkwqDCoMKgwqDCoMKgwqAg
PSBkcm1fcmVhZCxcDQo+PiAtwqDCoMKgwqDCoMKgwqAgLmxsc2Vla8KgwqDCoMKgwqDCoMKg
ID0gbm9vcF9sbHNlZWssXA0KPj4gLcKgwqDCoMKgwqDCoMKgIC5tbWFwwqDCoMKgwqDCoMKg
wqAgPSBkcm1fZ2VtX21tYXAsXA0KPj4gK8KgwqDCoMKgwqDCoMKgIERSTV9HRU1fRk9QUyxc
DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIHZvaWQgZHJtX2dlbV9vYmplY3RfcmVsZWFzZShz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------1S0aSUT3yvbPCdxnHl9OHuKO--

--------------VRpy50pJeVxwM2suD9NUp0hG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKp4roFAwAAAAAACgkQlh/E3EQov+B/
jw/9FbZQOVOHCHcSWZW4LrskKH/NSHemiJDUG+aQQYl5hcZyGPD95dolcsXOi19VHc+kw5lxdQxR
sjm5leaeDIhN8ZkE17VsceY5JkoplxvY6Eq59tDXDYMop6M4SpUfa1Di8VctTTJTn/MFQ+uKe11W
Lhc2FXhkmUQmUIu6SB9J9ABJX0xwCAysWXNG4l9pkhCJT46IYvusJHC5HXQ6USR7LGf/CFGOPWWQ
YW82VxcYyNTMMNWjG5b2fM3D+OFYtSdqEgeuHyGM1tIcgTBO1fomvwyqsoxIBuWAxsWlmBr0sT6c
SefFxAVFKJzXrTRIIRh0ho0lMuxx001LcZXSpUChMGvomvKDgvcmBBf7a7siNkZC6Km4Hsrg+5QL
uyr6SRt0m/eMszs3ZReiFBzHdXK01UbAzCoejhgBJzBcUSMimtcbL4rTUkih4prTjE2me9O1Mbvq
REX7ZXctE/e7EjZiMw9jxe/xk38LnK33lGFrvbNK+8ImiaUWft218l7rbtjLCbA6WBvZxnTLWspw
3TyjUOpOLFPMzW1oQCaiflw7T4WzUqADGVEP1GJuDqEqGd5ew9oaqX9jyg8/UiQa2ulSplsy/fSA
ftKiOyD6dPt8PBVdRAs6dGbCfG5T6i1u2+GQhb7ZCOt9ymPnbPl4eLXD3PJ49brvEgeZFTLC4SUf
lLE=
=4Wsv
-----END PGP SIGNATURE-----

--------------VRpy50pJeVxwM2suD9NUp0hG--
