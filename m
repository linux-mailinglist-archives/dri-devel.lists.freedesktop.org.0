Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016A706C20
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A6510E444;
	Wed, 17 May 2023 15:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690610E444
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:05:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C601E22326;
 Wed, 17 May 2023 15:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684335951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1CQ41ixeN2lCI6YEUo78oOOB3ssZOYerTAq/UhbIO6o=;
 b=ID03M4eGcZSMtvsnpcTNqKFquOeohwroO+yoQ4/VsBdsKoblAEuMQQUe8PDlJEjk9vkKG2
 RWHN0E5F11RF/UCirkDArPAoQfaPdiXymw6RYDtfBfOVLcXWpyUr9JlOmD8R/vo2p2YWma
 AT/6frLX1BV7kB2F26y3ATaueFx2pDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684335951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1CQ41ixeN2lCI6YEUo78oOOB3ssZOYerTAq/UhbIO6o=;
 b=QY3dQekxMp005Ui+hzGlEX2IaryAj0pI161/byoeTqvgOkXFoIBkz1KL3Lf7Bux6xrIIA2
 E/DV0wRnmv76dhCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A58913358;
 Wed, 17 May 2023 15:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KbAxDU/tZGSaeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 17 May 2023 15:05:51 +0000
Message-ID: <de2a6105-ab4d-3c1f-1564-f621d81e641d@suse.de>
Date: Wed, 17 May 2023 17:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230517145237.295461-1-abailon@baylibre.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ncrOiZi2JhHUm00qxwLJpfV"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ncrOiZi2JhHUm00qxwLJpfV
Content-Type: multipart/mixed; boundary="------------AbqRIMn4WI6qY8GL9obWCuXH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jstephan@baylibre.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, nbelin@baylibre.com,
 bero@baylibre.com
Message-ID: <de2a6105-ab4d-3c1f-1564-f621d81e641d@suse.de>
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
References: <20230517145237.295461-1-abailon@baylibre.com>
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>

--------------AbqRIMn4WI6qY8GL9obWCuXH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCml0IGxvb2tzIGxpa2UgdGhpcyBkcml2ZXIgYmVsb25ncyBpbnRvIGRyaXZlci9h
Y2NlbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KQW0gMTcuMDUuMjMgdW0gMTY6NTIg
c2NocmllYiBBbGV4YW5kcmUgQmFpbG9uOg0KPiBUaGlzIGFkZHMgYSBEUk0gZHJpdmVyIHRo
YXQgaW1wbGVtZW50cyBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIENQVSBhbmQgYW4NCj4g
QVBVLiBUaGUgZHJpdmVyIHRhcmdldCBlbWJlZGRlZCBkZXZpY2UgdGhhdCB1c3VhbGx5IHJ1
biBpbmZlcmVuY2UgdXNpbmcgc29tZQ0KPiBwcmVidWlsdCBtb2RlbHMuIFRoZSBnb2FsIGlz
IHRvIHByb3ZpZGUgY29tbW9uIGluZnJhc3RydWN0dXJlIHRoYXQgY291bGQgYmUNCj4gcmUt
dXNlZCB0byBzdXBwb3J0IG1hbnkgYWNjZWxlcmF0b3JzLiBCb3RoIGtlcm5lbCwgdXNlcnNw
YWNlIGFuZCBmaXJtd2FyZSB0cmllcw0KPiB0byB1c2Ugc3RhbmRhcmQgYW5kIGV4aXN0aW5n
IHRvIGxldmVyYWdlIHRoZSBkZXZlbG9wbWVudCBhbmQgbWFpbnRlbmFuY2UgZWZmb3J0Lg0K
PiBUaGUgc2VyaWVzIGltcGxlbWVudHMgdHdvIHBsYXRmb3JtIGRyaXZlcnMsIG9uZSBmb3Ig
c2ltdWxhdGlvbiBhbmQgYW5vdGhlciBvbmUgZm9yDQo+IHRoZSBtdDgxODMgKGNvbXBhdGli
bGUgd2l0aCBtdDgzNjUpLg0KPiANCj4gRm9yIHRoZSBwZW9wbGUgaW50ZXJlc3RlZCBieSB0
aGUgZmlybXdhcmUgb3IgdXNlcnNwYWNlIGxpYnJhcnksDQo+IHRoZSBzb3VyY2VzIGFyZSBh
dmFpbGFibGUgaGVyZToNCj4gaHR0cHM6Ly9naXRsYWIuYmF5bGlicmUuY29tL2JheWxpYnJl
L2xpYmFwdS9saWJhcHUNCj4gDQo+IFRoZSBzdXBwb3J0IG9mIEFQVSBoYXMgdG8gYmUgdXBz
dHJlYW1lZCB0byBsaWJkcm0uDQo+IFVudGlsIHRoaXMgaXMgZG9uZSwgeW91IGNvdWxkIGZp
bmQgdGhlIHNvdXJjZSBoZXJlOg0KPiBodHRwczovL2dpdGxhYi5iYXlsaWJyZS5jb20vYmF5
bGlicmUvbGliYXB1L2xpYmRybS8tL3RyZWUvYWJhaWxvbi9tYWluDQo+IA0KPiBUaGUgZHJp
dmVyIGZvciBtdDgxODMgZGVwZW5kcyBvbiB0aGlzIHNlcmllcyAod2hpY2ggaXMgY3VycmVu
dGx5IGJsb2NrZWQpOg0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtYXJtLWtlcm5lbC9saXN0Lz9zZXJpZXM9NjIwNDI5DQo+IA0KPiBBbGV4YW5kcmUg
QmFpbG9uICg1KToNCj4gICAgZHJtOiBBZGQgc3VwcG9ydCBvZiBBSSBQcm9jZXNzb3IgVW5p
dCAoQVBVKQ0KPiAgICBkcm0vYXB1OiBBZGQgbWVtb3J5IGFsbG9jYXRvcg0KPiAgICBkcm0v
YXB1OiBBZGQgc3VwcG9ydCBvZiByZXF1ZXN0cw0KPiAgICBkcm0vYXB1OiBBZGQgc3VwcG9y
dCBvZiBJT01NVQ0KPiAgICBkdC1iaW5kaW5nczogQWRkIGJpZGluZ3MgZm9yIG10ayxhcHUt
ZHJtDQo+IA0KPiBKdWxpZW4gU3RlcGhhbiAoMik6DQo+ICAgIGRybS9hcHU6IGFsbG93IHBs
YXRmb3JtIGRyaXZlciB0byBpbXBsZW1lbnQgdGhlaXIgb3duIG1tYXAgZnVuY3Rpb24NCj4g
ICAgZHJtL2FwdTogQWRkIHN1cHBvcnQgZm9yIGEgc2ltdWxhdGVkIEFQVQ0KPiANCj4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvbXRrLGFwdS1kcm0ueWFtbCAgfCAgMzggKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FwdS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgIHwgIDIyICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vYXB1L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgfCAgMTAgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hcHUvYXB1X2Rydi5j
ICAgICAgICAgICAgICAgICB8IDI4MiArKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0v
YXB1L2FwdV9nZW0uYyAgICAgICAgICAgICAgICAgfCAyMzAgKysrKysrKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hcHUvYXB1X2ludGVybmFsLmggICAgICAgICAgICB8IDIwNSArKysrKysN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYXB1L2FwdV9zY2hlZC5jICAgICAgICAgICAgICAgfCA1
OTIgKysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FwdS9zaW11X2Fw
dS5jICAgICAgICAgICAgICAgIHwgMzEzICsrKysrKysrKw0KPiAgIGluY2x1ZGUvdWFwaS9k
cm0vYXB1X2RybS5oICAgICAgICAgICAgICAgICAgICB8ICA4MSArKysNCj4gICAxMSBmaWxl
cyBjaGFuZ2VkLCAxNzc2IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9tdGssYXB1LWRybS55YW1s
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcHUvS2NvbmZpZw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYXB1L01ha2VmaWxlDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcHUvYXB1X2Rydi5jDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcHUvYXB1X2dlbS5jDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcHUvYXB1X2ludGVybmFs
LmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FwdS9hcHVfc2No
ZWQuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYXB1L3NpbXVf
YXB1LmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2RybS9hcHVfZHJt
LmgNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------AbqRIMn4WI6qY8GL9obWCuXH--

--------------3ncrOiZi2JhHUm00qxwLJpfV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRk7U4FAwAAAAAACgkQlh/E3EQov+Cb
tg/+Mw9nPevKsZrpAHKT2KpTKI72La7N9DWB82x51M59+Ye9js9hvSe02GYTaNNBMK8LnER4Pdxe
PK3BI3M8A9kHvtKLkx1QPpmZ9glA7tPIavl12oVw/mT52U8lLnqs6QQZbJM8lJK5LZZRKiN5x0ko
Z5D6D77HGWxune35pSwjh/Am73O0jITYWGiV+TYoBZ5XbVr9O53319rw/ZE54Qn+Bq5VNz917C6Z
eOF5CbTWEAa0Fk10OlEiOlftFL7L+bS2u/QIPM8qxyc0h4ysXorAAveHfpY8hMMNLlbvl3U3TJO2
zLPBLwzIOMqH3h2if0efzBnYX3HcXqyt54mrIlRLuKmSH+8CGlsZRNdl90WuGIiPk/CaoWwoME2h
oB0QIxDlpsF7FpaJUBUJ8R7w0b1tnCz7ASKSueK/oRZUNwOgPTBz5B9LIC8jFcfN0yOkf0ZCVjEQ
Revw5BYB2uNQxqZP8qcTQ18K4+xp8v7IQF66xLxshLEVvh9Z/R1B1pczNmeZAOPrXLPpLEkrYI9I
QeCgRzyVap8n6DOzeH8IJZng3aCw/AjrjRiVH3ZgNVGujFoJ3vXGMDmK1nz4PG2MNJa8LYpiyqLQ
7423fLxH/oL8gTSV7WL3P8gdPHQAaAUuE5erXzfDV/yujBpH47q/DsG1JN7W2sEqKTUk0DP57O77
0Fc=
=Xyw7
-----END PGP SIGNATURE-----

--------------3ncrOiZi2JhHUm00qxwLJpfV--
