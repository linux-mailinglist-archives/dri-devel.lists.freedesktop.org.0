Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3DD4B9C3D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9651A10EAC4;
	Thu, 17 Feb 2022 09:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DCD10EAC4;
 Thu, 17 Feb 2022 09:41:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 028C61F37D;
 Thu, 17 Feb 2022 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645090899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VIvcIvC7mYpBKP1I/vHBxVjHVwfgu1TcpXXFXE5sFDU=;
 b=XUONyLDwncWCVDsuIZzCNtJUV0QXc+QaoH3U+41M7grP+JeeL+lS1m5sK17Q9ElxqIgmav
 GcPAGBO4VzgfxFx0U9WCYwSsTpgJfeRj+dCef1x1oLh9vKeRoX9Az5GfKeg57xxiRmBhwN
 Zip/bTQe4UDNSOIQjEbfRJjqViliEfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645090899;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VIvcIvC7mYpBKP1I/vHBxVjHVwfgu1TcpXXFXE5sFDU=;
 b=yqk7N+CBqISrvo9Lv3uaoJ9Rw60KmJA2sXEgMDWph2rDedw9ZoQmURlgS5MvpBDJpRc3bh
 i4oH9fWO7lTa0IBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C98D813BBF;
 Thu, 17 Feb 2022 09:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GN80MFIYDmIbKQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Feb 2022 09:41:38 +0000
Message-ID: <95cce34d-fa67-2da9-f065-a6dacfa980d6@suse.de>
Date: Thu, 17 Feb 2022 10:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
 <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
 <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YuhADYhmsOwshkWQOQFsb7QJ"
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YuhADYhmsOwshkWQOQFsb7QJ
Content-Type: multipart/mixed; boundary="------------pT3bPkC1ApmQhXoBnnjJcE4x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Message-ID: <95cce34d-fa67-2da9-f065-a6dacfa980d6@suse.de>
Subject: Re: [Intel-gfx] [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/solomon/ssd130x.c:451:18: error: incomplete definition of
 type 'struct dma_buf_map'
References: <202202171455.bclm1YBC-lkp@intel.com>
 <20220217063625.sm5ua5xf4jo2ekku@ldmartin-desk2>
 <79301ef2-03d4-ca96-3d7f-6f9b80f319e1@redhat.com>
 <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>
In-Reply-To: <20220217092545.4zpjnh344fmrcg26@ldmartin-desk2>

--------------pT3bPkC1ApmQhXoBnnjJcE4x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDIuMjIgdW0gMTA6MjUgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQpb
Li4uXQ0KPj4gJCBnaXQgZ3JlcCAiVE9ETzogVXNlIG1hcHBpbmcgYWJzdHJhY3Rpb24gcHJv
cGVybHkiIHwgd2MgLWwNCj4+IDE1DQo+Pg0KPj4gSWYgeW91IHBvaW50IG1lIHRoZSBwcm9w
ZXIgd2F5LCBJJ2xsIGJlIGhhcHB5IHRvIHBvc3QgYSBwYXRjaCB0byANCj4+IGNoYW5nZSBp
dC4NCj4gDQo+IEl0IGRlcGVuZHMgd2hhdCB5b3Ugd2FudCB0byBkbyB3aXRoIHRoZSBhZGRy
ZXNzLiBUaGVyZSBhcmUgQVBJcyB0byBjb3B5DQo+IGZyb20vdG8uIEkgYWxzbyBhZGRlZCBh
IGZldyB0byByZWFkL3dyaXRlIHRvIGFuIG9mZnNldC4gSXQgc2VlbXMgdGhlDQo+IHByb2Js
ZW0gaGVyZSBpcyB0aGF0IHlvdSBuZWVkIHRvIHBhc3MgdGhhdCB0byBhIGhlbHBlciwNCj4g
ZHJtX2ZiX3hyZ2I4ODg4X3RvX21vbm9fcmV2ZXJzZWQoKS4gSSB0aGluayB0aGUgcHJvcGVy
IHNvbHV0aW9uIHdvdWxkIGJlDQo+IHRvIGNoYW5nZSB0aGUgaGVscGVyIHRvIGFjY2VwdCBh
biBpb3N5c19tYXAqIGFzIGFyZ3VtZW50IHJhdGhlciB0aGFuIGENCj4gdm9pZCouDQoNClRo
ZXJlIGFyZSBzZXZlcmFsIG9mIHRoZXNlIFRPRE9zIGluIHRoZSBEUk0gY29kZSwgYmVjYXVz
ZSBvdXIgDQpmb3JtYXQtY29udmVyc2lvbiBoZWxwZXJzIGFyZSBzdGlsbCBmcm9tIHRoZSB0
aW1lIGJlZm9yZSANCmRtYV9idWZfbWFwL2lvc3lzX21hcC4gVGhlIGVhc2llc3Qgd29ya2Fy
b3VuZCBpcyB0byB0YWtlIHRoZSByYXcgcG9pbnRlciANCmFuZCBnaXZlIGl0IHRvIHRoZW0u
IE9uZSBkYXksIERSTSdzIHB1YmxpYyBibGl0IGFuZCBjb252ZXJzaW9uIA0KaW50ZXJmYWNl
cyB3aWxsIHRha2UgYW4gaW9zeXNfbWFwIGFuZCBoYW5kbGUgdGhlIGRpZmZlcmVudCBtZW1v
cnkgdHlwZXMgDQppbnRlcm5hbGx5Lg0KDQpKYXZpZXJtLCB0aGF0J3Mgd2hlbiB0aGUgaW50
ZXJuYWwgX2xpbmUoKSBoZWxwZXJzIHdpbGwgYmVjb21lIHVzZWZ1bC4gDQpUaGV5IGNhbiB1
c2Ugc3lzdGVtIG1lbW9yeSBkaXJlY3RseSwgYW5kIGZvciBJL08gbWVtb3J5IHRoZSANCmJs
aXQvY29udmVyc2lvbiBoZWxwZXJzIGFsbG9jYXRlIGFuIGludGVybmFsIHRlbXBvcmFyeSBw
ZXItbGluZSBidWZmZXIuIA0KVGhlIGNvZGUgeW91IG1hZGUgZm9yIHRoZSBuZXcgZHJpdmVy
IGhhcyB0aGlzIGRlc2lnbmVkIG91dGxpbmVkIGFscmVhZHkuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4+DQo+Pj4gTHVjYXMgRGUg
TWFyY2hpDQo+Pj4NCj4+DQo+PiBbMF0NCj4+IEZyb20gZjgyNjhlNWIxNWMzMjFiNTY4NjI5
MDQ2NjVmNWUzMTJiZjUwZDM5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4gRGF0
ZTogVGh1LCAxNyBGZWIgMjAyMiAwOTo1MjozNyArMDEwMA0KPj4gU3ViamVjdDogW1BBVENI
XSBkcm0vc29sb21vbjogUmVuYW1lIGRtYS1idWYtbWFwIHRvIGlvc3lzLW1hcA0KPj4NCj4+
IENvbW1pdCA3OTM4ZjQyMTgxNjggKCJkbWEtYnVmLW1hcDogUmVuYW1lIHRvIGlvc3lzLW1h
cCIpIHJlbmFtZWQgdGhlIA0KPj4gc3RydWN0DQo+PiBkbWFfYnVmX21hcCB0byBzdHJ1Y3Qg
aW9zeXNfbWFwLCBidXQgdGhpcyBjaGFuZ2Ugd2Fzbid0IHByZXNlbnQgaW4gDQo+PiBkcm0t
bWlzYw0KPj4gd2hlbiB0aGUgc3NkMTMweCBkcml2ZXIgd2FzIG1lcmdlZCwgYW5kIGl0IGNy
ZWF0ZWQgYSBtZXJnZSBjb25mbGljdC4NCj4+DQo+PiBGaXggdGhpcyBieSByZW5hbWluZyB0
aGUgZGF0YSBzdHJ1Y3R1cmUgdHlwZSBpbiB0aGUgc3NkMTMweCBkcml2ZXIuDQo+Pg0KPj4g
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4gU3Vn
Z2VzdGVkLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUBy
ZWRoYXQuY29tPg0KPj4gLS0tDQo+PiBkcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4
LmMgfCAyICstDQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3Nk
MTMweC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4+IGlu
ZGV4IDE5Njk3YzhjNWEyYy4uOTJjMTkwMmY1M2U0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c29sb21vbi9zc2QxMzB4LmMNCj4+IEBAIC00NDQsNyArNDQ0LDcgQEAgc3RhdGljIHZvaWQg
c3NkMTMweF9jbGVhcl9zY3JlZW4oc3RydWN0IA0KPj4gc3NkMTMweF9kZXZpY2UgKnNzZDEz
MHgpDQo+PiDCoMKgwqDCoGtmcmVlKGJ1Zik7DQo+PiB9DQo+Pg0KPj4gLXN0YXRpYyBpbnQg
c3NkMTMweF9mYl9ibGl0X3JlY3Qoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGNvbnN0
IA0KPj4gc3RydWN0IGRtYV9idWZfbWFwICptYXAsDQo+PiArc3RhdGljIGludCBzc2QxMzB4
X2ZiX2JsaXRfcmVjdChzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwgY29uc3QgDQo+PiBz
dHJ1Y3QgaW9zeXNfbWFwICptYXAsDQo+IA0KPiBJIGFkZGVkIHRoaXMgYXMgYSBmaXh1cCB0
byBkaW0sIHNvIGl0J3MgYXBwbGllZCBvbiB0aGUgbWVyZ2UgY29tbWl0LiBJDQo+IHRoaW5r
IGl0IHdvdWxkIGJlIHByZWZlcnJlZCB0byBoYXZlIHRoaXMgaW4gdGhlIG1lcmdlIHJlc29s
dXRpb24gd2hlbg0KPiBkcm0taW50ZWwgcHJvcGFnYXRlcyBhbGwgdGhlIHdheSBiYWNrIHRv
IGRybS1taXNjDQo+IA0KPiANCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZHJtX3JlY3QgKnJlY3QpDQo+PiB7DQo+PiDCoMKgwqDCoHN0cnVjdCBzc2QxMzB4
X2RldmljZSAqc3NkMTMweCA9IGRybV90b19zc2QxMzB4KGZiLT5kZXYpOw0KPj4gLS0gDQo+
PiAyLjM0LjENCj4+DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiAtLSANCj4+IEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcw0KPj4gTGludXggRW5naW5lZXJpbmcNCj4+IFJlZCBIYXQNCj4+DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------pT3bPkC1ApmQhXoBnnjJcE4x--

--------------YuhADYhmsOwshkWQOQFsb7QJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIOGFIFAwAAAAAACgkQlh/E3EQov+BW
4Q//XeiyvJJcoP45U1PBaRWcK8SZmeRP7eDASiIcs+d3jFk0QHsAuAeUFKKUjdFdBznbDfPLey95
nwUcWLv9ajgHbCVMlqnqyRqhWvAcb3Y8raQ34bKpxN4OzD9lPOwJ31RRtCe5grrMKUTjEwMbyPPv
+2bJFXARNoLGEMxzU/tdawQLpdkJCAk87P4RcBqvzrueRzLEOjCA+OQJLfwlEPZtQpPIEnfvKGwF
X8xWJ8VvIIRa97yO3k2jlMUBasp66p39Wwy83p1wnSrBZl0kL973C981HaDK7ldo8g9pifb7t0q6
45y+yneB3zBnZ8otE8AdhpIu9C8vM1D2sTXd0j/qAjzxXRAyGPCo/DjtnGalF91LRqHgO4eztysA
QUal6bEFQMf0vFbdrMcWGBha71NiAyo3o4c+aHAvVotGJe3f0Gw1TZlMAsybu+dnYEPr+SPK5zdz
nG3majXELGSBYLNUJMPm3rYSDCl00J689ETjHraKg2bOVlU5JsoZGWyzhFz/3GV7kleOMK2Jy3h5
0qnYuOTnsPVUkf8/ptzDR3b6902rveN32D4FfTjKysaUGOQ9dxCOVaoo9jODxiuJr4N3iIgw4Mc0
D+nvF5LyWel0K8H+zGDultDlZNwTYyTpmjQgRkemt26SheO4JeZAUQArkmrNA2cpvtuwHhhlFwY/
aSk=
=tSjT
-----END PGP SIGNATURE-----

--------------YuhADYhmsOwshkWQOQFsb7QJ--
