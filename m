Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EA77F7DB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3F10E46D;
	Thu, 17 Aug 2023 13:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3226910E46D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:38:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D31E31F37E;
 Thu, 17 Aug 2023 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692279498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WxeGfEKP7k5DtlvEj0Is/FM3UJz92sE6rDepFaUyGX8=;
 b=lwRCzrl+xoPFDh7GZPPs0yclQ26ZBtASEtmESPv85T4MsYDCrf8BxdTf5DsdMDmBQ/Exc1
 9dJskjl1LUVVd/cpCcOHLgPQ2aA0+xNMViHl/gVxPtVGhXnencEMY9aFKz5A9sitBEfHrc
 SZgM0ZJ7oROcdkUkUT3k3CyFY2vvV80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692279498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WxeGfEKP7k5DtlvEj0Is/FM3UJz92sE6rDepFaUyGX8=;
 b=z7bg/Mf0SuX6XO3mDTNTcxxu8VnhmgdUCkHnWJQ1al8cGuwhGx5Sma4YMt30KXTLlhbPBX
 Qc5/cJHlJt8zCKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D44B1358B;
 Thu, 17 Aug 2023 13:38:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id auAPFcoi3mR1BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Aug 2023 13:38:18 +0000
Message-ID: <dcff3281-9d38-a244-4844-1633039a9076@suse.de>
Date: Thu, 17 Aug 2023 15:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PULL for v6.6] drm-misc-next
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@gmail.com>
References: <389b-64db6700-1-3dc04b80@31442286>
 <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
 <CAKMK7uF1hv3S--=jsmFWG_tkOKavgMBOkWQt6VOSV0d1U7C0VA@mail.gmail.com>
 <1b9ea227-b068-9d91-1036-28a4161b1744@suse.de>
 <CAF6AEGsr+2xaCeExm9wPmK=nU+jxevLcd8RDWTSFrwKR-yCvZg@mail.gmail.com>
 <CAPM=9tx16UoYoOw4hBChVNPcj57ox1XsybPPTGZn=r2DDQBJmw@mail.gmail.com>
 <CAF6AEGu8mRB_wiFeWx17Z12Eu+NnP6VLFBr5sypcnxjQyj7_sQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAF6AEGu8mRB_wiFeWx17Z12Eu+NnP6VLFBr5sypcnxjQyj7_sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TlIK8OwTrOaxUBL1tEguO0z9"
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
Cc: daniels@collabora.com, robdclark@google.com, david.heidelberg@collabora.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 robclark@freedesktop.org, gustavo.padovan@collabora.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, anholt@google.com,
 dri-devel@lists.freedesktop.org, emma@anholt.net, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TlIK8OwTrOaxUBL1tEguO0z9
Content-Type: multipart/mixed; boundary="------------DBTRdJq1R4rSVpITJ0YfCoY9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, daniels@collabora.com,
 robdclark@google.com, gustavo.padovan@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, robclark@freedesktop.org,
 david.heidelberg@collabora.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, anholt@google.com,
 dri-devel@lists.freedesktop.org, emma@anholt.net, airlied@redhat.com
Message-ID: <dcff3281-9d38-a244-4844-1633039a9076@suse.de>
Subject: Re: [PULL for v6.6] drm-misc-next
References: <389b-64db6700-1-3dc04b80@31442286>
 <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
 <CAKMK7uF1hv3S--=jsmFWG_tkOKavgMBOkWQt6VOSV0d1U7C0VA@mail.gmail.com>
 <1b9ea227-b068-9d91-1036-28a4161b1744@suse.de>
 <CAF6AEGsr+2xaCeExm9wPmK=nU+jxevLcd8RDWTSFrwKR-yCvZg@mail.gmail.com>
 <CAPM=9tx16UoYoOw4hBChVNPcj57ox1XsybPPTGZn=r2DDQBJmw@mail.gmail.com>
 <CAF6AEGu8mRB_wiFeWx17Z12Eu+NnP6VLFBr5sypcnxjQyj7_sQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu8mRB_wiFeWx17Z12Eu+NnP6VLFBr5sypcnxjQyj7_sQ@mail.gmail.com>

--------------DBTRdJq1R4rSVpITJ0YfCoY9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDguMjMgdW0gMjE6NTkgc2NocmllYiBSb2IgQ2xhcms6DQo+IE9uIFR1
ZSwgQXVnIDE1LCAyMDIzIGF0IDEyOjIz4oCvUE0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToNCj4+DQo+Pj4+IE90aGVyd2lzZSwgdGhlcmUgc2hvdWxkIGJlIHNv
bWV0aGluZyBsaWtlIGEgZHJtLWNpIHRyZWUsIGZyb20gd2hpY2ggeW91DQo+Pj4+IGNhbiBm
ZXRjaCB0aGUgY2hhbmdlcyBkaXJlY3RseS4NCj4+Pg0KPj4+IEkgYXNrZWQgZm9yIGEgcHVs
bCByZXF1ZXN0IHNvIHRoYXQgSSBjb3VsZCBhbHNvIG1lcmdlIGl0IHRvIG1zbS1uZXh0DQo+
Pj4gc28gdGhhdCBJIGNhbiBkbyBDSSB0aGlzIGN5Y2xlLiAgKFVubGlrZSB0aGUgZWFybGll
ciBvdXQtb2YtdHJlZQ0KPj4+IHZlcnNpb24gb2YgdGhlIGRybS9jaSB5bWwsIHRoaXMgdmVy
c2lvbiBuZWVkcyB0byBiZSBpbiB0aGUgYnJhbmNoIHRoYXQNCj4+PiBDSSBydW5zIG9uLCBz
byBJIGNhbid0IHVzZSB0aGUgd29ya2Fyb3VuZCB0aGF0IEkgaGFkIGluIHByZXZpb3VzDQo+
Pj4gY3ljbGVzLikNCj4+Pg0KPj4+IFBlcmhhcHMgaXQgc2hvdWxkIGJlIGEgcHVsbCByZXF1
ZXN0IHRhcmdldGluZyBkcm0tbmV4dCBpbnN0ZWFkIG9mIGRybS1taXNjLW5leHQuDQo+Pj4N
Cj4+PiBXZSB3ZXJlIGdvaW5nIHRvIGRvIHRoaXMgb25lLW9mZiBmb3IgdGhpcyBjeWNsZSBh
bmQgdGhlbiBldmFsdWF0ZQ0KPj4+IGdvaW5nIGZvcndhcmQgd2hldGhlciBhIGRybS1jaS1u
ZXh0IHRyZWUgaXMgbmVlZGVkLiAgQnV0IHBlcmhhcHMgaXQgaXMNCj4+PiBhIGdvb2QgaWRl
YS4NCj4+DQo+Pg0KPj4gSSdtIHN0aWxsIG5vdCAxMDAlIHN1cmUgaG93IHRoaXMgaXMgZ29p
bmcgZG93biwgYW5kIEknbSBtZWFudCB0byBiZSBvZmYgdG9kYXksDQo+Pg0KPj4gRG9uJ3Qg
c2VuZCB0aGlzIGFzIHBhdGNoZXMgdG8gZHJtLW1pc2MtbmV4dCwgYnV0IEkgdGhpbmsgd2Un
ZCB3YW50DQo+PiB0aGlzIGluIGRybS1uZXh0IGZvciBhIGN5Y2xlIGJlZm9yZSBzZW5kaW5n
IGl0IHRvIExpbnVzLCBidXQgbWF5YmUNCj4+IGl0J3Mgbm90IGRpcmVjdGx5IGludGVyZmVy
aW5nIHdpdGggdGhlIGtlcm5lbCBzbyBpdCdzIGZpbmUNCj4+DQo+PiBJZGVhbGx5IHdoZW4g
dGhlIHJlYWwgbWVyZ2Ugd2luZG93IG9wZW5zIGFuZCBkcm0tbmV4dCBpcyBtZXJnZWQgSSdk
DQo+PiB3YW50IHRvIGhhdmUgYSBicmFuY2ggKyBQUiB3cml0dGVuIGZvciB0aGlzIGFnYWlu
c3QgZHJtLW5leHQgdGhhdCBJDQo+PiBjYW4gc2VuZCB0byBMaW51cyBzZXBhcmF0ZWx5IGFu
ZCBzZWUgaG93IGl0IGdvZXMuDQo+IA0KPiBUaGUgdHJpY2t5IHRoaW5nIGlzIHdlIG5lZWQg
dGhpcyBwYXRjaCBpbi10cmVlIHRvIHJ1biBDSSBpbiB0aGUgZmlyc3QNCj4gcGxhY2UuLiBz
byBzb2FrIHRpbWUgaW4gZHJtLW5leHQgb24gaXQncyBvd24gaXNuJ3QgaHVnZWx5IHVzZWZ1
bC4gIChPcg0KPiBhdCBsZWFzdCBJJ2QgbmVlZCB0byBtb3ZlIG1zbS1uZXh0IGZvcndhcmQg
dG8gZHJtLW5leHQgZm9yIGl0IHRvIGJlDQo+IHVzZWZ1bC4pDQo+IA0KPiBJIGd1ZXNzIHRo
YXQgaXMgYSBiaXQgb2YgYW4gYWR2YW50YWdlIHRvIHRoZSBlYXJsaWVyIGFwcHJvYWNoIHRo
YXQNCj4ga2VwdCBldmVyeXRoaW5nIGJ1dCB0aGUgZXhwZWN0YXRpb24gZmlsZXMgaW4gYSBk
aWZmZXJlbnQgZ2l0IHRyZWUuLg0KDQpJIHNhdyB0aGF0IHRoaXMgcGF0Y2hzZXQgaGFzIGJl
ZW4gcmV2aWV3ZWQgb24gZHJpLWRldmVsLiBJZiB5b3UgZG9uJ3QgDQp3YW50IGl0IHRvIGdv
IHRocm91Z2ggRFJNIG1pc2MsIEkgZ3Vlc3MgaXQgc2hvdWxkIHJlYWxseSBiZSBwdWxsZWQg
aW50byANCmRybS1uZXh0IGRpcmVjdGx5Lg0KDQpEbyB5b3UgcGxhbiB0byBzZXQgdXAgYXV0
by1DSSBmb3IgRFJNIG1pc2MgYnJhbmNoZXM/IChTb3JyeSBpZiB0aGlzIA0KcXVlc3Rpb24g
aGFzIGJlZW4gYW5zd2VyZWQgYmVmb3JlLikNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gQlIsDQo+IC1SDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------DBTRdJq1R4rSVpITJ0YfCoY9--

--------------TlIK8OwTrOaxUBL1tEguO0z9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTeIskFAwAAAAAACgkQlh/E3EQov+DC
vw//c63YOLo2tM4Ncjrea7TJMtHtK1RjrK0iBKsI9ZcOzCz1g3uw7Z2UpM68Z2DntPZ3OCMGzu1b
0y44zsrNblvgLrQ3/j0FfWNfI8DwCB0XzdzlSPblLYHTqVRTXy+nGNZcDXxMsIwVvyG+x8SCnHT2
6YdTv9fVNAe34rtVlZT0rMqtU/8HwAXVHzwH2St3tHGx7jXxm5NqHiGZcP0yShr8om2+wCc0wyWJ
Y1u7pKvSq+0emUoLX+yuxinDBqU9TXa2kR1vemOfJJhUyIlLj/1VFENRRLB1TVC34FFCU5I1Biji
5jxp6KAEKo2SOQ6eXSH7sWmO8lLWBbqyh7gOS56jk7/MnuPFQGtpR595yuXCBKS6xWW2iqE/XlLe
lppxzjsz0QrBqmO6t8Tmp52guUqbjIc4u2GYxmwhVFc9wclfc56qE4albNCc7cpyufZLJGPnRvg7
ER2L1+lU4shF2EwCUtNxFiwK2FET8Mt4D3nTijjPILhbsTqmmdFFGH5ObSBqu9BpZAN7FybBwzKq
Yzc1wEDF+TWYeD8eNjm09aZgWX3wUia0AyVPs4h3ZSHN3gt1K9vX/aw3wpl/v5DqgiLUaLwQpUgQ
QdzvO4p9DC9Va57B7WdE20DO1NCNPCptr7zBDxIdlV2GxAqr+oS8h9oJCKBP4WwYbxLyxUdnnxgV
RpA=
=+PnC
-----END PGP SIGNATURE-----

--------------TlIK8OwTrOaxUBL1tEguO0z9--
