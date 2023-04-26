Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0906EEEBC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 09:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5D810E8D3;
	Wed, 26 Apr 2023 07:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0610E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:01:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC99C1FDCC;
 Wed, 26 Apr 2023 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682492496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nxb0XHQbYH91f8zHvg0TZ5RHh9Xjhuxa4OrpE14pZEs=;
 b=du7Iaqqv1pNpUyv7s0CiYVgMAd7xOXrwcY2PyeIxcczbRrs4Yda4QJgHBSSrVjJ3X6B/0J
 eFfeOr40yAIDxHGyvs2kgwWf88eZiyscnKvCSwEMLILpd3QMiJehDh89shCC79ebpP6TVG
 W9dX4cY0qWRCv6CfCvuQQBsJDAy5/yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682492496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nxb0XHQbYH91f8zHvg0TZ5RHh9Xjhuxa4OrpE14pZEs=;
 b=zOQhc1W6T5PQ8ZpdMLNVJOKNY7JuUd3D13tjNs4Dh+KpMkz0C0BdBqC+CMS+TBvP0IkPRU
 bAZdjvkXg1doJpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F1E4138F0;
 Wed, 26 Apr 2023 07:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7IXbIVDMSGTkaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 07:01:36 +0000
Message-ID: <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>
Date: Wed, 26 Apr 2023 09:01:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Content-Language: en-US
To: kernel@linuxace.com
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
 <20230425233952.5618-1-kernel@linuxace.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230425233952.5618-1-kernel@linuxace.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Gk2gZm9N4L3mzAbMdU6bNqTI"
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
Cc: jfalempe@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Gk2gZm9N4L3mzAbMdU6bNqTI
Content-Type: multipart/mixed; boundary="------------GcXh1nHNvGGT2DtxNqHIbP9s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel@linuxace.com
Cc: dri-devel@lists.freedesktop.org, jfalempe@redhat.com, sam@ravnborg.org
Message-ID: <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
 <20230425233952.5618-1-kernel@linuxace.com>
In-Reply-To: <20230425233952.5618-1-kernel@linuxace.com>

--------------GcXh1nHNvGGT2DtxNqHIbP9s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMDE6Mzkgc2NocmllYiBrZXJuZWxAbGludXhhY2UuY29t
Og0KPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpbmZvcm1hdGlvbiBpcyB1c2VmdWwsIGJ1dCB3
ZSBoYXZlIGZvdW5kIG9uZSBzeXN0ZW0gd2hpY2gNCj4gd29ya3Mgd2l0aCB0aGUgNi4xIGtl
cm5lbC4gIEkgZ3JhYmJlZCB0aGUgbHNwY2kgb3V0cHV0IGZyb20gYSB3b3JraW5nIGFuZA0K
PiBub24td29ya2luZyBzeXN0ZW0sIHBhc3RlZCBiZWxvdy4gIFNhbWUga2VybmVsIGFuZCBz
YW1lIGRpc3Ryby4NCj4gDQo+IEJBRCBEZWxsIFI4MTUgQU1EDQo+IDBhOjAzLjAgVkdBIGNv
bXBhdGlibGUgY29udHJvbGxlcjogTWF0cm94IEVsZWN0cm9uaWNzIFN5c3RlbXMgTHRkLiBN
R0EgRzIwMGVXDQoNClRoYW5rcyBmb3IgdGhpcyBpbmZvLiBUaGF0J3MgYSBHMjAwZVcsIHdo
aWNoIHVzZXMgc2xpZ2h0bHkgZGlmZmVyZW50IA0KY29kZSB3aXRoaW4gdGhlIGRyaXZlci4g
RnJvbSB0aGUgdGVzdGluZyB3ZSd2ZSBkb25lLCB3ZSBkaWRuJ3Qgc2VlIHRoZSANCmJ1ZyBl
aXRoZXIuIFNvIGl0J3MgcHJvYmFibHkgc29tZXRoaW5nIHZlcnkgc3BlY2lmaWMgdG8geW91
ciBtYWNoaW5lIG9yIA0KdGhlIEcyMDBFSCBtb2RlbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiAgICAgICAgICBXUENNNDUwIChyZXYgMGEpIChwcm9nLWlmIDAwIFtWR0EgY29u
dHJvbGxlcl0pDQo+ICAgICAgICAgRGV2aWNlTmFtZTogRW1iZWRkZWQgVmlkZW8NCj4gICAg
ICAgICBTdWJzeXN0ZW06IERlbGwgRGV2aWNlIDA0NDQNCj4gICAgICAgICBDb250cm9sOiBJ
L08rIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQYXJF
cnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQ0KPiAgICAgICAgIFN0YXR1
czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCKyBQYXJFcnItIERFVlNFTD1tZWRpdW0gPlRB
Ym9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQ0KPiAgICAgICAg
IExhdGVuY3k6IDMyICg0MDAwbnMgbWluLCA4MDAwbnMgbWF4KSwgQ2FjaGUgTGluZSBTaXpl
OiA2NCBieXRlcw0KPiAgICAgICAgIEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSA1
DQo+ICAgICAgICAgTlVNQSBub2RlOiAwDQo+ICAgICAgICAgSU9NTVUgZ3JvdXA6IDEwDQo+
ICAgICAgICAgUmVnaW9uIDA6IE1lbW9yeSBhdCBlYzgwMDAwMCAoMzItYml0LCBwcmVmZXRj
aGFibGUpIFtzaXplPThNXQ0KPiAgICAgICAgIFJlZ2lvbiAxOiBNZW1vcnkgYXQgZWY3ZmMw
MDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MTZLXQ0KPiAgICAgICAgIFJl
Z2lvbiAyOiBNZW1vcnkgYXQgZWU4MDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkg
W3NpemU9OE1dDQo+ICAgICAgICAgRXhwYW5zaW9uIFJPTSBhdCAwMDBjMDAwMCBbdmlydHVh
bF0gW2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQ0KPiAgICAgICAgIENhcGFiaWxpdGllczogW2Rj
XSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMQ0KPiAgICAgICAgICAgICAgICAgRmxhZ3M6
IFBNRUNsay0gRFNJKyBEMS0gRDItIEF1eEN1cnJlbnQ9MG1BIFBNRShEMC0sRDEtLEQyLSxE
M2hvdC0sRDNjb2xkLSkNCj4gICAgICAgICAgICAgICAgIFN0YXR1czogRDAgTm9Tb2Z0UnN0
LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQ0KPiAwMDogMmIgMTAgMzIgMDUg
MDcgMDAgOTAgMDIgMGEgMDAgMDAgMDMgMTAgMjAgMDAgMDANCj4gMTA6IDA4IDAwIDgwIGVj
IDAwIGMwIDdmIGVmIDAwIDAwIDgwIGVlIDAwIDAwIDAwIDAwDQo+IDIwOiAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAyOCAxMCA0NCAwNA0KPiAzMDogMDAgMDAgMDAg
MDAgZGMgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDUgMDEgMTAgMjANCj4gDQo+IEdPT0QgRGVs
bCBSNzEwIElOVEVMDQo+IDBhOjAzLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogTWF0
cm94IEVsZWN0cm9uaWNzIFN5c3RlbXMgTHRkLiBNR0EgRzIwMGVXDQo+ICAgICAgICAgIFdQ
Q000NTAgKHJldiAwYSkgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCj4gICAgICAg
ICBEZXZpY2VOYW1lOiBFbWJlZGRlZCBWaWRlbw0KPiAgICAgICAgIFN1YnN5c3RlbTogRGVs
bCBQb3dlckVkZ2UgUjcxMCBNR0EgRzIwMGVXIFdQQ000NTANCj4gICAgICAgICBDb250cm9s
OiBJL08rIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQ
YXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQ0KPiAgICAgICAgIFN0
YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCKyBQYXJFcnItIERFVlNFTD1tZWRpdW0g
PlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQ0KPiAgICAg
ICAgIExhdGVuY3k6IDMyICg0MDAwbnMgbWluLCA4MDAwbnMgbWF4KSwgQ2FjaGUgTGluZSBT
aXplOiA2NCBieXRlcw0KPiAgICAgICAgIEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElS
USAxMA0KPiAgICAgICAgIFJlZ2lvbiAwOiBNZW1vcnkgYXQgZDUwMDAwMDAgKDMyLWJpdCwg
cHJlZmV0Y2hhYmxlKSBbc2l6ZT04TV0NCj4gICAgICAgICBSZWdpb24gMTogTWVtb3J5IGF0
IGRlZmZjMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTE2S10NCj4gICAg
ICAgICBSZWdpb24gMjogTWVtb3J5IGF0IGRmMDAwMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRj
aGFibGUpIFtzaXplPThNXQ0KPiAgICAgICAgIEV4cGFuc2lvbiBST00gYXQgMDAwYzAwMDAg
W3ZpcnR1YWxdIFtkaXNhYmxlZF0gW3NpemU9MTI4S10NCj4gICAgICAgICBDYXBhYmlsaXRp
ZXM6IFtkY10gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDENCj4gICAgICAgICAgICAgICAg
IEZsYWdzOiBQTUVDbGstIERTSSsgRDEtIEQyLSBBdXhDdXJyZW50PTBtQSBQTUUoRDAtLEQx
LSxEMi0sRDNob3QtLEQzY29sZC0pDQo+ICAgICAgICAgICAgICAgICBTdGF0dXM6IEQwIE5v
U29mdFJzdC0gUE1FLUVuYWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0NCj4gMDA6IDJiIDEw
IDMyIDA1IDA3IDAwIDkwIDAyIDBhIDAwIDAwIDAzIDEwIDIwIDAwIDAwDQo+IDEwOiAwOCAw
MCAwMCBkNSAwMCBjMCBmZiBkZSAwMCAwMCAwMCBkZiAwMCAwMCAwMCAwMA0KPiAyMDogMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMjggMTAgMzUgMDINCj4gMzA6IDAw
IDAwIDAwIDAwIGRjIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDBhIDAxIDEwIDIwDQo+IA0KPiBQ
aGlsDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFz
c2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJl
dyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAo
QUcgTnVlcm5iZXJnKQ0K

--------------GcXh1nHNvGGT2DtxNqHIbP9s--

--------------Gk2gZm9N4L3mzAbMdU6bNqTI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRIzFAFAwAAAAAACgkQlh/E3EQov+C1
KBAAqAbQGf6cFqUqdQW2K5lvL+7YHRjQTDI0CgpZyecDAjfk1dY+G9y/SqRBbWHKHJTn5g6+7mCr
k4iIyKPaabDhVP5QlDmu3fNXbHMjE9u4HCi/NfWRFpkfQyJkzQ9FJiIbf4jrnqOELkXL7TzYE9AN
3JT76Gy6gQNrhmDkAC5kM1nntYnJSiAK2E46TfCvIEYibD8qf9vOqCfqnyUK8uh3hOlhZE4IuXE7
JxE3bZtkYY0VqF3tavyWQ8M6GqFuul9+44DeksxUXhgy/JquLR64HETrG3ePeftZJ0yaij8+SsbI
VUilU9FobZNY9YlM4liptYqqkXP0WKOV2Sxp8UWp219jqOGvY1zDPBPrgGDhbhC3cJ9C58uruKW1
E86vPwLz4zvVc7RaLBlKMXU9TO6Za+4YokjPtVk/OdL4dl+trSWao8h5iMlLxt9ChMQr+djTj7Zo
la+7Bhmwb+4YMlSu+J5hLJnrhcqvDfKYqBtI+Eox9B3Ag2BRzugEb4N63k82q+n8GmYunKNPYUfV
oV96HsfFzZhga8omSw4fkZHk2faYmSXelAM8GKrFU8BuiLIHhuJuDM7lRbSYOcRIiWwhzqRJWl2S
dVrA9MdgN4fjAgNSVkYdzbfsNOAlakmsCYJN45GcTyQk1h6dZM0b+NI8wIKMCOyDnr/VuVLjjl6O
S/M=
=gDPK
-----END PGP SIGNATURE-----

--------------Gk2gZm9N4L3mzAbMdU6bNqTI--
