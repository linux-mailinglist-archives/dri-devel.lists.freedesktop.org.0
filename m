Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7494E7503
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 15:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AA910E670;
	Fri, 25 Mar 2022 14:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392610E670
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 14:24:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77F91210FC;
 Fri, 25 Mar 2022 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648218263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyz5saSw0CsZ/Q6GSap0jIvJDQeU4K9KHJzo+c2p1Ag=;
 b=T8TkxaHsCPdESNf6kWt8MEMtumB2cIigBCltAw5vKAlsHI1gMnX2iHqdDH2zTSNxVR7WSl
 vicysR/PwCB51WEYUXhy0qxOGwQ5JFjJE0QAR4TJ17jSmIqGeO/S+N+wIE3CXyn1oSnC26
 7ccOSBQjmUyG9lNS1QuAaQi+385PtRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648218263;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyz5saSw0CsZ/Q6GSap0jIvJDQeU4K9KHJzo+c2p1Ag=;
 b=hXhQn8H+ZitoGWeM5KEDMDeNUbxQypbmyqOyMLO/uzdF/GXHW88x0bnierWI2fAiBQDgjJ
 1mKs6sUVnr0FbDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 541AA132E9;
 Fri, 25 Mar 2022 14:24:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gkpoE5fQPWLJEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Mar 2022 14:24:23 +0000
Message-ID: <6e22bec0-1b5e-75ee-aed6-f8498ace9170@suse.de>
Date: Fri, 25 Mar 2022 15:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [git pull] drm fixes for 5.18-rc1
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CPD0GbfeTnHOZlmQ1ZjShMvm"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CPD0GbfeTnHOZlmQ1ZjShMvm
Content-Type: multipart/mixed; boundary="------------i0FpPL70sJeryGxOgUfx4Uv4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <6e22bec0-1b5e-75ee-aed6-f8498ace9170@suse.de>
Subject: Re: [git pull] drm fixes for 5.18-rc1
References: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
In-Reply-To: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>

--------------i0FpPL70sJeryGxOgUfx4Uv4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDMuMjIgdW0gMDM6MTMgc2NocmllYiBEYXZlIEFpcmxpZToNCj4gSGkg
TGludXMsDQo+IA0KPiBTb21lIGZpeGVzIHdlcmUgcXVldWVkIHVwIGluIGFuZCBpbiBsaWdo
dCBvZiB0aGUgZmJkZXYgcmVncmVzc2lvbnMsDQo+IEkndmUgcHVsbGVkIHRob3NlIGluIGFz
IHdlbGwsDQo+IEkgdGhpbmsgdGhlIG1lZGlhdGVrIG9uZSBpcyBnb2luZyB0byBiZSBhIGJp
dCBtb3JlIHBhaW5mdWwsIHNpbmNlIG5vdw0KPiB5b3UgaGF2ZSBhIG1lcmdlIGFuZCBJIG5l
ZWQgdG8gaGF2ZSB0aGUgbWVkaWF0ZWsgc3R1ZmYgZ2V0IHJlYmFzZWQgYW5kDQo+IHJldGVz
dGVkIG9udG8gdGhhdCBtZXJnZSBwb2ludCwgYnV0IEknbGwgbWFrZSBzdXJlIHRoZXkgZ2V0
IHRvIHlvdQ0KPiBBU0FQLg0KPiANCj4gVGhvbWFzLCBjYydlZCwgSSBwdWxsZWQgeW91ciBm
YmRldiBmaXhlcyBmcm9tIHBhdGNod29yaywgc2luY2UgdGhleQ0KPiB3ZXJlIGEgY2xlYXIg
cmVncmVzc2lvbiBmaXgsIGRvbid0IGJvdGhlciBxdWV1ZWluZyB0aGVtIHVwIGluIG91cg0K
PiB0cmVlcyBub3cuDQoNCkkgYWRkZWQgdGhlbSB0byBkcm0tbWlzYy1uZXh0IGEgd2hpbGUg
YWdvLCBidXQgSSBndWVzcyB0aGV5IG1pc3NlZCBvdXIgDQotcmM2IGRlYWRsaW5lLiBUaGFu
a3MgZm9yIHRha2luZyBjYXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBE
YXZlLg0KPiANCj4gZHJtLW5leHQtMjAyMi0wMy0yNToNCj4gZHJtIGZpeGVzIGZvciA1LjE4
LXJjMQ0KPiANCj4gY29yZToNCj4gLSBNYWtlIGF1ZGlvIGFuZCBjb2xvciBwbGFuZSBzdXBw
b3J0IGNoZWNraW5nIG9ubHkgaGFwcGVuDQo+ICAgIHdoZW4gYSBDRUEgZXh0ZW5zaW9uIGJs
b2NrIGlzIGZvdW5kLg0KPiAtIFNtYWxsIHNlbGZ0ZXN0IGZpeC4NCj4gDQo+IGZiZGV2Og0K
PiAtIHR3byByZWdyZXNzaW9ucyBmaXhlcyBmcm9tIHNwZWVkdXAgcGF0Y2hlcy4NCj4gDQo+
IHR0bToNCj4gLSBGaXggYSBzbWFsbCByZWdyZXNzaW9uIGZyb20gdHRtX3Jlc291cmNlX2Zp
bmkoKQ0KPiANCj4gaTkxNToNCj4gLSBSZWplY3QgdW5zdXBwb3J0ZWQgVE1EUyByYXRlcyBv
biBJQ0wrDQo+IC0gVHJlYXQgU0FHViBibG9jayB0aW1lIDAgYXMgU0FHViBkaXNhYmxlZA0K
PiAtIEZpeCBQU0YgR1YgcG9pbnQgbWFzayB3aGVuIFNBR1YgaXMgbm90IHBvc3NpYmxlDQo+
IC0gRml4IHJlbmFtZWQgSU5URUxfSU5GTy0+bWVkaWEuYXJjaC92ZXIgZmllbGQNCj4gVGhl
IGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjNmU5MGExYzY2MDg3NDczNmJkMDlj
MWZlYzYzMTJiNGI0YzJmZjdiOg0KPiANCj4gICAgTWVyZ2UgdGFnICdhbWQtZHJtLW5leHQt
NS4xOC0yMDIyLTAzLTE4JyBvZg0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
YWdkNWYvbGludXggaW50byBkcm0tbmV4dCAoMjAyMi0wMy0yMQ0KPiAxMzo0ODoyMCArMTAw
MCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiAN
Cj4gICAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybSB0YWdzL2RybS1u
ZXh0LTIwMjItMDMtMjUNCj4gDQo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAy
YTgxZGJhNGI1NzcwOTk3MTdjZWE4NmQ0MjlmMDUzZTg1ZTc0ZDk2Og0KPiANCj4gICAgZmJk
ZXY6IEZpeCBjZmJfaW1hZ2VibGl0KCkgZm9yIGFyYml0cmFyeSBpbWFnZSB3aWR0aHMgKDIw
MjItMDMtMjUNCj4gMDk6NTU6NTQgKzEwMDApDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IGRybSBm
aXhlcyBmb3IgNS4xOC1yYzENCj4gDQo+IGNvcmU6DQo+IC0gTWFrZSBhdWRpbyBhbmQgY29s
b3IgcGxhbmUgc3VwcG9ydCBjaGVja2luZyBvbmx5IGhhcHBlbg0KPiAgICB3aGVuIGEgQ0VB
IGV4dGVuc2lvbiBibG9jayBpcyBmb3VuZC4NCj4gLSBTbWFsbCBzZWxmdGVzdCBmaXguDQo+
IA0KPiBmYmRldjoNCj4gLSB0d28gcmVncmVzc2lvbnMgZml4ZXMgZnJvbSBzcGVlZHVwIHBh
dGNoZXMuDQo+IA0KPiB0dG06DQo+IC0gRml4IGEgc21hbGwgcmVncmVzc2lvbiBmcm9tIHR0
bV9yZXNvdXJjZV9maW5pKCkNCj4gDQo+IGk5MTU6DQo+IC0gUmVqZWN0IHVuc3VwcG9ydGVk
IFRNRFMgcmF0ZXMgb24gSUNMKw0KPiAtIFRyZWF0IFNBR1YgYmxvY2sgdGltZSAwIGFzIFNB
R1YgZGlzYWJsZWQNCj4gLSBGaXggUFNGIEdWIHBvaW50IG1hc2sgd2hlbiBTQUdWIGlzIG5v
dCBwb3NzaWJsZQ0KPiAtIEZpeCByZW5hbWVkIElOVEVMX0lORk8tPm1lZGlhLmFyY2gvdmVy
IGZpZWxkDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IENvb3BlciBDaGlvdSAoMSk6DQo+ICAgICAg
ICBkcm0vZWRpZDogY2hlY2sgYmFzaWMgYXVkaW8gc3VwcG9ydCBvbiBDRUEgZXh0ZW5zaW9u
IGJsb2NrDQo+IA0KPiBEYXZlIEFpcmxpZSAoMik6DQo+ICAgICAgICBNZXJnZSB0YWcgJ2Ry
bS1pbnRlbC1uZXh0LWZpeGVzLTIwMjItMDMtMjQnIG9mDQo+IGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgaW50byBkcm0tbmV4dA0KPiAgICAgICAgTWVy
Z2UgdGFnICdkcm0tbWlzYy1uZXh0LWZpeGVzLTIwMjItMDMtMjQtMScgb2YNCj4gZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIGludG8gZHJtLW5leHQNCj4g
DQo+IEphbmkgTmlrdWxhICgxKToNCj4gICAgICAgIGRybS9lZGlkOiBmaXggQ0VBIGV4dGVu
c2lvbiBieXRlICMzIHBhcnNpbmcNCj4gDQo+IEx1Y2FzIERlIE1hcmNoaSAoMSk6DQo+ICAg
ICAgICBkcm0vaTkxNTogRml4IHJlbmFtZWQgc3RydWN0IGZpZWxkDQo+IA0KPiBOYXRoYW4g
Q2hhbmNlbGxvciAoMSk6DQo+ICAgICAgICBkcm0vc2VsZnRlc3Q6IHBsYW5lX2hlbHBlcjog
UHV0IHRlc3Qgc3RydWN0dXJlcyBpbiBzdGF0aWMgc3RvcmFnZQ0KPiANCj4gVGhvbWFzIFpp
bW1lcm1hbm4gKDIpOg0KPiAgICAgICAgZmJkZXY6IEZpeCBzeXNfaW1hZ2VibGl0KCkgZm9y
IGFyYml0cmFyeSBpbWFnZSB3aWR0aHMNCj4gICAgICAgIGZiZGV2OiBGaXggY2ZiX2ltYWdl
YmxpdCgpIGZvciBhcmJpdHJhcnkgaW1hZ2Ugd2lkdGhzDQo+IA0KPiBWaWxsZSBTeXJqw6Rs
w6QgKDMpOg0KPiAgICAgICAgZHJtL2k5MTU6IFJlamVjdCB1bnN1cHBvcnRlZCBUTURTIHJh
dGVzIG9uIElDTCsNCj4gICAgICAgIGRybS9pOTE1OiBUcmVhdCBTQUdWIGJsb2NrIHRpbWUg
MCBhcyBTQUdWIGRpc2FibGVkDQo+ICAgICAgICBkcm0vaTkxNTogRml4IFBTRiBHViBwb2lu
dCBtYXNrIHdoZW4gU0FHViBpcyBub3QgcG9zc2libGUNCj4gDQo+IFphY2sgUnVzaW4gKDEp
Og0KPiAgICAgICAgZHJtL3R0bTogRml4IGEga2VybmVsIG9vcHMgZHVlIHRvIGFuIGludmFs
aWQgcmVhZA0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTUgKysrKysrKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9idy5jICAgICAgICAgICB8ICAzICsrLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICAgICAgfCAgOSArKysrKysr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAgICAgICAgICAg
ICB8ICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYyAgICAgICAg
ICAgICAgICAgICB8IDEwICsrKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0
cy90ZXN0LWRybV9wbGFuZV9oZWxwZXIuYyB8ICA4ICsrKy0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9yYW5nZV9tYW5hZ2VyLmMgICAgICAgICAgIHwgIDIgKy0NCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvY2ZiaW1nYmx0LmMgICAgICAgICAgICAgIHwgMjgg
KysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9z
eXNpbWdibHQuYyAgICAgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrLS0tLQ0K
PiAgIDkgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------i0FpPL70sJeryGxOgUfx4Uv4--

--------------CPD0GbfeTnHOZlmQ1ZjShMvm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmI90JYFAwAAAAAACgkQlh/E3EQov+Cy
4g//Xiqtu/bDjfEYBeb3/VR7jWImgPM1kUG6PLyUJ1dgbZlx9/YZsq+7z7NXRMPSdREX5H9oT9HB
lPaguHdWT+quX9bKaid/4cPXd3ymx7K0p4eYZOrSbryat+OhhtLsMJoxFhMNXXfKVYvkk8FwnsNW
hgNsC9vhYb6Od1s+/WxsL27Uz6I0JCLZa2HzitlrAnV6MRq3EL1rG+3pkp4PJB0m1F+f9cmQdADm
yVDqfDYngFpI1914Oq7HwxQFPCKED1dJGo+FFy0ZMqrMfR+X2s3/+yy/vEhsUGUbsuxSLn3CMLW4
E9sMmMb7MDh19hM2Zyv6bJtDzHVQCYbhZ02r9Klpk1Q7uLqtzafDqneQzGpw/qge/h/J8aNgV/tQ
Ajm/aXUT0EFOg+V7idSKylHEHSOXXgLgSeeDmqMLEDuiDTUFfVtFreeOMekMUPeg4TEADbCL55tK
gisvduLzLNKRYIZazNz7N5Xu6pzK/xS9keE6cfvLRsBdkNC/R5ZKpjrFMRCbOjPPcuo8bp02xB5y
i/TiFINoX9A8MzdQqHkkFL0WY7iKP53Oo9Qj1KQkyoG9MZxnXRs3AhfE0FVuIdZd+WJ5t3apA0pf
fbZ2FM9ojejXjxP6EBiLYZBEsgYjdCQfXrsqALMG80I7QAYsevW+0BsuWH2Lh5gPsgPwojW+aDmE
458=
=LQAN
-----END PGP SIGNATURE-----

--------------CPD0GbfeTnHOZlmQ1ZjShMvm--
