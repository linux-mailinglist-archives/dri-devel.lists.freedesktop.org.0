Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E16B3F7C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 13:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6901410E047;
	Fri, 10 Mar 2023 12:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434B110E047
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 12:38:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA63D20653;
 Fri, 10 Mar 2023 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678451904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujKUkJwD3Bm3VDruOg3YHWuIqSPbuc5jKnK23W/EaaU=;
 b=XZn9M5s454wZBL0N0wna1hHfAPWyHrSC/4jtc5bcSQtqkUiVsOWOSmCnBz6J3NFhR1buH+
 tfbEyVQfMh/ppclyEYV3t0QLB+dAWlzppbwvxGyHfmRa7pND2BlPjCFcx8oVRx4mqBeBZ4
 g8eK19TNZcEj6H5oFm/spbtbfEH4/yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678451904;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujKUkJwD3Bm3VDruOg3YHWuIqSPbuc5jKnK23W/EaaU=;
 b=iS7Qp7rjtxuVZuevyWM/++iP0BXEEJsaLmvNvKa3GBfA2WeG+8GB9guI+Mv0dpfka3FjtZ
 bMO4M9Z9bvT+tqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F4CE13592;
 Fri, 10 Mar 2023 12:38:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kg4GHsAkC2QxJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Mar 2023 12:38:24 +0000
Message-ID: <194d943e-e840-2941-22b9-f6a1a096c539@suse.de>
Date: Fri, 10 Mar 2023 13:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 001/101] lib: Add option iterator
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <20230309160201.5163-2-tzimmermann@suse.de>
 <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AqNUDgsqy188VHGOhHJAe8Cu"
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
Cc: linux-fbdev@vger.kernel.org, thomas@winischhofer.net, adaplas@gmail.com,
 timur@kernel.org, corbet@lwn.net, deller@gmx.de, rdunlap@infradead.org,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AqNUDgsqy188VHGOhHJAe8Cu
Content-Type: multipart/mixed; boundary="------------k0Yitxx90GOTCouwkKR1MZvW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: deller@gmx.de, timur@kernel.org, rdunlap@infradead.org, paulus@samba.org,
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@hansenpartnership.com, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, corbet@lwn.net, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <194d943e-e840-2941-22b9-f6a1a096c539@suse.de>
Subject: Re: [PATCH v2 001/101] lib: Add option iterator
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <20230309160201.5163-2-tzimmermann@suse.de>
 <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>
In-Reply-To: <CAMuHMdXsj9RrqUkwLjoxF2rXKcy9UK4Rwv1RcB0cnJXMXJU97g@mail.gmail.com>

--------------k0Yitxx90GOTCouwkKR1MZvW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDMuMjMgdW0gMDk6MjEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgTWFyIDksIDIwMjMgYXQgNTowMuKAr1BN
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+IEFk
ZCBzdHJ1Y3Qgb3B0aW9uX2l0ZXIgYW5kIGhlbHBlcnMgdGhhdCB3YWxrIG92ZXIgaW5kaXZp
ZHVhbCBvcHRpb25zDQo+PiBvZiBhbiBvcHRpb24gc3RyaW5nLiBBZGQgZG9jdW1lbnRhdGlv
bi4NCj4+DQo+PiBLZXJuZWwgcGFyYW1ldGVycyBvZnRlbiBoYXZlIHRoZSBmb3JtYXQgb2YN
Cj4+DQo+PiAgICBwYXJhbT1vcHQxLG9wdDI6dmFsLG9wdDMNCj4+DQo+PiB3aGVyZSB0aGUg
b3B0aW9uIHN0cmluZyBjb250YWlucyBhIG51bWJlciBvZiBjb21tYS1zZXBhcmF0ZWQgb3B0
aW9ucy4NCj4+IERyaXZlcnMgdXN1YWxseSB1c2Ugc3Ryc2VwKCkgaW4gYSBsb29wIHRvIGV4
dHJhY3QgaW5kaXZpZHVhbCBvcHRpb25zDQo+PiBmcm9tIHRoZSBzdHJpbmcuIEVhY2ggY2Fs
bCB0byBzdHJzZXAoKSBtb2RpZmllcyB0aGUgZ2l2ZW4gc3RyaW5nLCBzbw0KPj4gY2FsbGVy
cyBoYXZlIHRvIGR1cGxpY2F0ZSBrZXJuZWwgcGFyYW1ldGVycyB0aGF0IGFyZSB0byBiZSBw
YXJzZWQNCj4+IG11bHRpcGxlIHRpbWVzLg0KPj4NCj4+IFRoZSBuZXcgc3RydWN0IG9wdGlv
bl9pdGVyIGFuZCBpdHMgaGVscGVycyB3cmFwIHRoaXMgY29kZSBiZWhpbmQgYQ0KPj4gY2xl
YW4gaW50ZXJmYWNlLiBEcml2ZXJzIGNhbiBpdGVyYXRlIG92ZXIgdGhlIG9wdGlvbnMgd2l0
aG91dCBoYXZpbmcNCj4+IHRvIGtub3cgdGhlIGRldGFpbHMgb2YgdGhlIG9wdGlvbi1zdHJp
bmcgZm9ybWF0LiBUaGUgaXRlcmF0b3IgaGFuZGxlcw0KPj4gc3RyaW5nIG1lbW9yeSBpbnRl
cm5hbGx5IHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBvcmlnaW5hbCBvcHRpb25zLg0KPj4NCj4+
IHYyOg0KPj4gICAgICAgICAgKiBpbXByb3ZlIGRvY3VtZW50YXRpb24gKFJhbmR5KQ0KPj4g
ICAgICAgICAgKiBpbXBsZW1lbnQgb3B0aW9uX2l0ZXJfbmV4dCgpIGFzIGZ1bmN0aW9uDQo+
PiAgICAgICAgICAqIGFsbG93IG1vZGlmaWNhdGlvbiBvZiB0aGUgcmV0dXJuZWQgb3B0aW9u
cw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gST4gLS0t
DQo+PiAgIERvY3VtZW50YXRpb24vY29yZS1hcGkva2VybmVsLWFwaS5yc3QgfCAgIDkgKysr
DQo+PiAgIGluY2x1ZGUvbGludXgvY21kbGluZS5oICAgICAgICAgICAgICAgfCAgMzYgKysr
KysrKysrDQo+PiAgIGxpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0NCj4+ICAgbGliL2NtZGxpbmVfaXRlci5jICAgICAgICAgICAgICAgICAgICB8IDEw
OSArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDE1
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L2NtZGxpbmUuaA0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbGli
L2NtZGxpbmVfaXRlci5jDQo+IA0KPiBKdXN0IHdvbmRlcmluZywgaXMgdGhlcmUgYW55IGNv
ZGUgdGhhdCBjYW4gYmUgc2hhcmVkIHdpdGgvcmV1c2VkIGZyb20NCj4gdGhlIGV4aXN0aW5n
IGxpYi9jbWRsaW5lLmM/DQoNCkFGQUlVLCBjbWRsaW5lLm8gaXMgbGlua2VkIGludG8gZWFy
bHktYm9vdCBjb2RlLCB3aGljaCBwcmV2ZW50cyBpdCBmcm9tIA0KdXNpbmcgZHluYW1pYyBt
ZW1vcnkgYWxsb2NhdGlvbiwgc3VjaCBhcyBrc3RyZHVwKCkgYW5kIGtmcmVlKCkuIFRoZSAN
CmxpbmtlciB3YXJucyBhYm91dCB0aGlzOg0KDQogICBMRCAgICAgIGFyY2gveDg2L2Jvb3Qv
Y29tcHJlc3NlZC92bWxpbnV4DQogICBsZDogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2th
c2xyLm86IGluIGZ1bmN0aW9uIGBnZXRfb3B0aW9uJzoNCiAgIGthc2xyLmM6KC50ZXh0KzB4
NTMyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBga3N0cmR1cCcNCiAgIGxkOiBhcmNoL3g4
Ni9ib290L2NvbXByZXNzZWQvdm1saW51eDogaGlkZGVuIHN5bWJvbCBga3N0cmR1cCcgaXNu
J3QNCglkZWZpbmVkDQogICBsZDogZmluYWwgbGluayBmYWlsZWQ6IGJhZCB2YWx1ZQ0KDQpT
byB0aGUgaXRlcmF0b3IgaXMgaW4gYSBzZXBhcmF0ZSBzb3VyY2UgZmlsZS4NCg0KVGhlIGNv
ZGUgaW4gY21kbGluZS5jIG1vc3RseSBkZWFscyB3aXRoIHBhcnNpbmcgaW5kaXZpZHVhbCB2
YWx1ZXMgb3IgDQprZXktdmFsdWUgcGFpcnMuIE5vdGhpbmcgbW92ZXMgb3ZlciB0aGUgY29t
cGxldGUgc3RyaW5nIGFuZCByZXR1cm5zIA0Kb3B0aW9ucyBvbmUgYnkgb25lLiBUaGVyZSdz
IG5vdCBtdWNoIHRvIHNoYXJlIEFGQUlDVC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------k0Yitxx90GOTCouwkKR1MZvW--

--------------AqNUDgsqy188VHGOhHJAe8Cu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQLJMAFAwAAAAAACgkQlh/E3EQov+D/
vRAAwq/ccQ6aJpdwMqsYUBHd6tAhX8cP2y2ncgKP3088XJZMUDvFh8UlWA9cO0Ay5W5/86gzQKtN
8zUxLLkmxH+z6kDa3Y0kjTC0BiALi44G5y4nSwk5WJNsEfT6PlxYNVDj5GlcrGIron2VOHVE9e07
rVtuEY9y4a5GZFggolS/yN0NwMjphIt2JSHBsXfil+ACeRTfWeY9uyZ2IUCAevABHZG61hA4AMZw
bwbHEpy4RzRz0ThXCUGs6GPlKfyY3eWlSqCS09X9aH9gBUIznTZhLKdlv/qLj5ulRqL/iw7gaYiM
/PL7XtuSavDvVu0KLKwmkbe92Fz9Yo0AbiQyf28cXGFp7hkFChhH2tRvrF8EJq4RnidkvGMu9b+O
iGxYlH3cSVJduFiHpDUQqZpZrCkTUYeL9SN1QV5oVUzXvi9B1TWlT+D0EcgnQD5n/2gZoyeoWPAS
/CqUjzr6KZR7lInNB6Xseya5LLLuV+hyP8qutAwhYwBru3YLZ6BkyeK5HKICz+e0S1k3KELmXPg+
pmSeFQLrPODTBtpu195q4WjouiHPVro7hCpCN8S2JTNJ44b7VjsRm7XBnoiH5aPsA2V1aZ92tUa4
9oPUS6frujAA+7O2ZlG1ZoIwxjqQNTCJv8fOoTe2nFd+skbp/LwrTw15LjZqg96HEhFNZd3gR05b
/S0=
=300t
-----END PGP SIGNATURE-----

--------------AqNUDgsqy188VHGOhHJAe8Cu--
