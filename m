Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F486BD148
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 14:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577B10E1E3;
	Thu, 16 Mar 2023 13:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58310E1E3;
 Thu, 16 Mar 2023 13:48:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 925A721A2E;
 Thu, 16 Mar 2023 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678974523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZesJctOr5t0iJJAp9HYDBl70AgQHglftIazvKYhpsqo=;
 b=JuL7MFJtkU20yjK6sU8wQxJM0kCi2IexuyJVu/FX7GCWSYyzhRf9lsLRDhg85eAtDYHZJg
 rfpWESRHHODF5QQEHDe6/TMJ/eYYSIWieNZZftu8PLjyzNX15XyGCoV13OomWViCUp4EMr
 l6OyztM+l1y6l4MyLPKWi0gz4c6Syzw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A485133E0;
 Thu, 16 Mar 2023 13:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NJOzADseE2T9UgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Mar 2023 13:48:43 +0000
Message-ID: <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
Date: Thu, 16 Mar 2023 14:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------THkQSUoEFzHUj9ZPQACR3yGX"
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
Cc: Honglei Huang <honglei1.huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Chen Jiqian <Jiqian.Chen@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------THkQSUoEFzHUj9ZPQACR3yGX
Content-Type: multipart/mixed; boundary="------------hWJC2JClxN0ZunEMAIMDHxZa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alex Deucher <alexdeucher@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Honglei Huang <honglei1.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Message-ID: <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
In-Reply-To: <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>

--------------hWJC2JClxN0ZunEMAIMDHxZa
Content-Type: multipart/mixed; boundary="------------KMVO7dtr3In1qGOut4i6OgJL"

--------------KMVO7dtr3In1qGOut4i6OgJL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjMgMTQ6NDUsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gT24gVGh1LCBNYXIg
MTYsIDIwMjMgYXQgMzo1MOKAr0FNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMTYuMDMuMjAyMyAwMDoyNSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPj4+IE9uIFdlZCwgMTUgTWFyIDIwMjMsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+PiBPbiAxNS4wMy4yMDIzIDAxOjUyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+
Pj4+PiBPbiBNb24sIDEzIE1hciAyMDIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBP
biAxMi4wMy4yMDIzIDEzOjAxLCBIdWFuZyBSdWkgd3JvdGU6DQo+Pj4+Pj4+IFhlbiBQVkgg
aXMgdGhlIHBhcmF2aXJ0dWFsaXplZCBtb2RlIGFuZCB0YWtlcyBhZHZhbnRhZ2Ugb2YgaGFy
ZHdhcmUNCj4+Pj4+Pj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCB3aGVuIHBvc3NpYmxlLiBJ
dCB3aWxsIHVzaW5nIHRoZSBoYXJkd2FyZSBJT01NVQ0KPj4+Pj4+PiBzdXBwb3J0IGluc3Rl
YWQgb2YgeGVuLXN3aW90bGIsIHNvIGRpc2FibGUgc3dpb3RsYiBpZiBjdXJyZW50IGRvbWFp
biBpcw0KPj4+Pj4+PiBYZW4gUFZILg0KPj4+Pj4+DQo+Pj4+Pj4gQnV0IHRoZSBrZXJuZWwg
aGFzIG5vIHdheSAoeWV0KSB0byBkcml2ZSB0aGUgSU9NTVUsIHNvIGhvdyBjYW4gaXQgZ2V0
DQo+Pj4+Pj4gYXdheSB3aXRob3V0IHJlc29ydGluZyB0byBzd2lvdGxiIGluIGNlcnRhaW4g
Y2FzZXMgKGxpa2UgSS9PIHRvIGFuDQo+Pj4+Pj4gYWRkcmVzcy1yZXN0cmljdGVkIGRldmlj
ZSk/DQo+Pj4+Pg0KPj4+Pj4gSSB0aGluayBSYXkgbWVhbnQgdGhhdCwgdGhhbmtzIHRvIHRo
ZSBJT01NVSBzZXR1cCBieSBYZW4sIHRoZXJlIGlzIG5vDQo+Pj4+PiBuZWVkIGZvciBzd2lv
dGxiLXhlbiBpbiBEb20wLiBBZGRyZXNzIHRyYW5zbGF0aW9ucyBhcmUgZG9uZSBieSB0aGUg
SU9NTVUNCj4+Pj4+IHNvIHdlIGNhbiB1c2UgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzIGlu
c3RlYWQgb2YgbWFjaGluZSBhZGRyZXNzZXMgZm9yDQo+Pj4+PiBETUEuIFRoaXMgaXMgYSBz
aW1pbGFyIGNhc2UgdG8gRG9tMCBvbiBBUk0gd2hlbiB0aGUgSU9NTVUgaXMgYXZhaWxhYmxl
DQo+Pj4+PiAoc2VlIGluY2x1ZGUveGVuL2FybS9zd2lvdGxiLXhlbi5oOnhlbl9zd2lvdGxi
X2RldGVjdCwgdGhlIGNvcnJlc3BvbmRpbmcNCj4+Pj4+IGNhc2UgaXMgWEVORkVBVF9ub3Rf
ZGlyZWN0X21hcHBlZCkuDQo+Pj4+DQo+Pj4+IEJ1dCBob3cgZG9lcyBYZW4gdXNpbmcgYW4g
SU9NTVUgaGVscCB3aXRoLCBhcyBzYWlkLCBhZGRyZXNzLXJlc3RyaWN0ZWQNCj4+Pj4gZGV2
aWNlcz8gVGhleSBtYXkgc3RpbGwgbmVlZCBlLmcuIGEgMzItYml0IGFkZHJlc3MgdG8gYmUg
cHJvZ3JhbW1lZCBpbiwNCj4+Pj4gYW5kIGlmIHRoZSBrZXJuZWwgaGFzIG1lbW9yeSBiZXlv
bmQgdGhlIDRHIGJvdW5kYXJ5IG5vdCBhbGwgSS9PIGJ1ZmZlcnMNCj4+Pj4gbWF5IGZ1bGZp
bGwgdGhpcyByZXF1aXJlbWVudC4NCj4+Pg0KPj4+IEluIHNob3J0LCBpdCBpcyBnb2luZyB0
byB3b3JrIGFzIGxvbmcgYXMgTGludXggaGFzIGd1ZXN0IHBoeXNpY2FsDQo+Pj4gYWRkcmVz
c2VzIChub3QgbWFjaGluZSBhZGRyZXNzZXMsIHRob3NlIGNvdWxkIGJlIGFueXRoaW5nKSBs
b3dlciB0aGFuDQo+Pj4gNEdCLg0KPj4+DQo+Pj4gSWYgdGhlIGFkZHJlc3MtcmVzdHJpY3Rl
ZCBkZXZpY2UgZG9lcyBETUEgdmlhIGFuIElPTU1VLCB0aGVuIHRoZSBkZXZpY2UNCj4+PiBn
ZXRzIHByb2dyYW1tZWQgYnkgTGludXggdXNpbmcgaXRzIGd1ZXN0IHBoeXNpY2FsIGFkZHJl
c3NlcyAobm90IG1hY2hpbmUNCj4+PiBhZGRyZXNzZXMpLg0KPj4+DQo+Pj4gVGhlIDMyLWJp
dCByZXN0cmljdGlvbiB3b3VsZCBiZSBhcHBsaWVkIGJ5IExpbnV4IHRvIGl0cyBjaG9pY2Ug
b2YgZ3Vlc3QNCj4+PiBwaHlzaWNhbCBhZGRyZXNzIHRvIHVzZSB0byBwcm9ncmFtIHRoZSBk
ZXZpY2UsIHRoZSBzYW1lIHdheSBpdCBkb2VzIG9uDQo+Pj4gbmF0aXZlLiBUaGUgZGV2aWNl
IHdvdWxkIGJlIGZpbmUgYXMgaXQgYWx3YXlzIHVzZXMgTGludXgtcHJvdmlkZWQgPDRHQg0K
Pj4+IGFkZHJlc3Nlcy4gQWZ0ZXIgdGhlIElPTU1VIHRyYW5zbGF0aW9uIChwYWdldGFibGUg
c2V0dXAgYnkgWGVuKSwgd2UNCj4+PiBjb3VsZCBnZXQgYW55IGFkZHJlc3MsIGluY2x1ZGlu
ZyA+NEdCIGFkZHJlc3NlcywgYW5kIHRoYXQgaXMgZXhwZWN0ZWQgdG8NCj4+PiB3b3JrLg0K
Pj4NCj4+IEkgdW5kZXJzdGFuZCB0aGF0J3MgdGhlICJub3JtYWwiIHdheSBvZiB3b3JraW5n
LiBCdXQgd2hhdGV2ZXIgdGhlIHN3aW90bGINCj4+IGlzIHVzZWQgZm9yIGluIGJhcmVtZXRh
bCBMaW51eCwgdGhhdCB3b3VsZCBzaW1pbGFybHkgcmVxdWlyZSBpdHMgdXNlIGluDQo+PiBQ
VkggKG9yIEhWTSkgYWl1aS4gU28gdW5jb25kaXRpb25hbGx5IGRpc2FibGluZyBpdCBpbiBQ
Vkggd291bGQgbG9vayB0bw0KPj4gbWUgbGlrZSBhbiBpbmNvbXBsZXRlIGF0dGVtcHQgdG8g
ZGlzYWJsZSBpdHMgdXNlIGFsdG9nZXRoZXIgb24geDg2LiBXaGF0DQo+PiBkaWZmZXJlbmNl
IG9mIFBWSCB2cyBiYXJlbWV0YWwgYW0gSSBtaXNzaW5nIGhlcmU/DQo+IA0KPiBzd2lvdGxi
IGlzIG5vdCB1c2FibGUgZm9yIEdQVXMgZXZlbiBvbiBiYXJlIG1ldGFsLiAgVGhleSBvZnRl
biBoYXZlDQo+IGh1bmRyZWRzIG9yIG1lZ3Mgb3IgZXZlbiBnaWdzIG9mIG1lbW9yeSBtYXBw
ZWQgb24gdGhlIGRldmljZSBhdCBhbnkNCj4gZ2l2ZW4gdGltZS4gIEFsc28sIEFNRCBHUFVz
IHN1cHBvcnQgNDQtNDggYml0IERNQSBtYXNrcyAoZGVwZW5kaW5nIG9uDQo+IHRoZSBjaGlw
IGZhbWlseSkuDQoNCkJ1dCB0aGUgc3dpb3RsYiBpc24ndCBwZXIgZGV2aWNlLCBidXQgc3lz
dGVtIGdsb2JhbC4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------KMVO7dtr3In1qGOut4i6OgJL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------KMVO7dtr3In1qGOut4i6OgJL--

--------------hWJC2JClxN0ZunEMAIMDHxZa--

--------------THkQSUoEFzHUj9ZPQACR3yGX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQTHjoFAwAAAAAACgkQsN6d1ii/Ey+l
qAgAiU7MGNIJDQZ1NCH25BrbopgMIQIqOK1AK0KO+KCtwdpLbt0sPVmuH4lORRO5jdRgs7UrW+pb
7LlEOT0A9cgPYG8ILr66RxG4hAlFrLDdOpZkpsGF2EHhbWsRGqtcM5sBhSv8zUFskh4s1tXVzP8G
ZYFKKriI5RDM8iDy+YrmxEIS4Oud92CHE3NaU5k0lp+eVCGlljMrtxY7pxumzjY6cWjY7XAD32Uy
FYk1TFzY98/cvpwh2fF3cC3zbMUEKgQNoQFIdimzyB6OoMxK/6dbp5dXRrN3VZMMNxVeTEfjHoHx
QVAvSE+C8mPibCD51JSQkXz/EPJ7OwItm+9jwvHNkQ==
=5tHs
-----END PGP SIGNATURE-----

--------------THkQSUoEFzHUj9ZPQACR3yGX--
