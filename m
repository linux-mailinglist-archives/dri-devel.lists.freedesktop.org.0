Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F5449C31
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 20:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338B6E863;
	Mon,  8 Nov 2021 19:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098996E863
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 19:08:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75B621FD50;
 Mon,  8 Nov 2021 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636398532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qVuAg7Gh9+kI2g0cQ666O75AVqd75h9og5ITQemKwY0=;
 b=cx5gDsLlKIec3alRqoLYIrEjH2tQJf89WdMeV7qjWotGKsJPu+SF3yNf4yIad6nRcJTY65
 91ArPzLukxNdKYfp/8EkyDSILuS0SpMvvVLUdqjenIGNs5b29vXlXjqG4EMr0Izf3spZ5N
 S9O0pFWH307OGtQYGd5ctkNF2k9MkNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636398532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qVuAg7Gh9+kI2g0cQ666O75AVqd75h9og5ITQemKwY0=;
 b=JwpPDHaJ9s5uSAGqZm8yiryZ3QpYg41KQ4xUYTLfdfj5HvOG5Bg2/HMtI/1ynUtn3Eg+hZ
 WN/6oXFpnxZhBrDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E2C013BCF;
 Mon,  8 Nov 2021 19:08:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2hVQEcR1iWEqLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 19:08:52 +0000
Message-ID: <0b89a992-2a4a-4e39-93af-0690fec64912@suse.de>
Date: Mon, 8 Nov 2021 20:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
Content-Language: en-US
To: Sven Schnelle <svens@stackframe.org>
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
 <87o86x80am.fsf@x1.stackframe.org>
 <312d6427-67ff-67c5-b662-23127bb76d12@suse.de>
 <87ee7qvcc7.fsf@x1.stackframe.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87ee7qvcc7.fsf@x1.stackframe.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nSC7F8s2WhW04Awu3Ry3PfFT"
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nSC7F8s2WhW04Awu3Ry3PfFT
Content-Type: multipart/mixed; boundary="------------5lxa5fsFJBTcaFZTy2mmm4tq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sven Schnelle <svens@stackframe.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
Message-ID: <0b89a992-2a4a-4e39-93af-0690fec64912@suse.de>
Subject: Re: [PATCH/RFT] fbdev driver for HP Visualize FX cards
References: <20211031195347.13754-1-svens@stackframe.org>
 <cd0f90d9-7dba-af33-f88b-289fc6f80b51@suse.de>
 <87r1c0s1bt.fsf@x1.stackframe.org>
 <e21cdf83-2178-7c59-2585-a6012f861f68@suse.de>
 <87o86x80am.fsf@x1.stackframe.org>
 <312d6427-67ff-67c5-b662-23127bb76d12@suse.de>
 <87ee7qvcc7.fsf@x1.stackframe.org>
In-Reply-To: <87ee7qvcc7.fsf@x1.stackframe.org>

--------------5lxa5fsFJBTcaFZTy2mmm4tq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTc6MzEgc2NocmllYiBTdmVuIFNjaG5lbGxlOg0KPiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JpdGVzOg0KPiANCj4+
IEhpDQo+Pg0KPj4gQW0gMDYuMTEuMjEgdW0gMjI6MDIgc2NocmllYiBTdmVuIFNjaG5lbGxl
Og0KPj4+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0ZXM6
DQo+Pj4NCj4+Pj4gSGkNCj4+Pj4NCj4+Pj4gQW0gMDEuMTEuMjEgdW0gMDk6NTQgc2Nocmll
YiBTdmVuIFNjaG5lbGxlOg0KPj4+Pj4gSGkgVGhvbWFzLA0KPj4+Pj4gVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyaXRlczoNCj4+Pj4+IFRoYW5rcywgaSB3
YXNuJ3QgYXdhcmUgYXMgaSBub3JtYWxseSBkb24ndCBkbyBhbnkgZ3JhcGhpY3MgcmVsYXRl
ZA0KPj4+Pj4gZGV2ZWxvcG1lbnQuIEkgdGFrZSBhIGxvb2sgYXQgZHJpIGFuZCBwb3J0IHRo
ZSBkcml2ZXIsIHdoaWNoIGlzDQo+Pj4+PiBob3BlZnVsbHkgbm90IHRvbyBoYXJkLg0KPj4+
Pg0KPj4+PiBTb3VuZHMgZ29vZC4NCj4+Pj4NCj4+Pj4gVGhlIG9uZSBiaWcgZGlmZmVyZW5j
ZSB3aGVuIGNvbnZlcnRpbmcgaXMgdGhhdCBEUk0gcmVhbGx5IHdhbnRzDQo+Pj4+IGRyaXZl
cnMgdG8gc3VwcG9ydCAzMi1iaXQgWFJHQiBjb2xvcnMuIEl0J3Mgbm90IGEgRFJNIGxpbWl0
YXRpb24gcGVyDQo+Pj4+IHNlLCBidXQgYSByZXF1aXJlbWVudCBvZiB0b2RheSdzIHVzZXJz
cGFjZSBwcm9ncmFtcy4gQUZBSUNTIHlvdXIgZmJkZXYNCj4+Pj4gZHJpdmVyIHVzZXMgYSAy
NTYtY29sb3IgcGFsZXR0ZSBmb3JtYXQuIFNvIHRoZSBEUk0gZHJpdmVyIHdvdWxkIGhhdmUN
Cj4+Pj4gdG8gY29udmVydA0KPj4+PiBYUkdCODg4OCB0byA4LWJpdCBSR0IzMzIgYW5kIGlu
c3RhbGwgYSBjb3JyZXNwb25kaW5nIHBhbGV0dGUuIERvbid0DQo+Pj4+IHdvcnJ5LCBpdCdz
IGVhc3kuIFRha2UgYSBsb29rIGF0IHRoZSBjaXJydXMgZHJpdmVyIGZvciBhIHNpbXBsZSBE
Uk0NCj4+Pj4gZHJpdmVyLiBbMV0NCj4+PiBJIGhhdmUgY29udmVydGVkIHRoZSBkcml2ZXIs
DQo+Pg0KPj4gQ29vbCENCj4+DQo+Pj4gYnV0IGFtIHVzaW5nIEZPUk1BVF9DOCBiZWNhdXNl
IGkgaGF2ZW4ndA0KPj4+IGZpZ3VyZWQgb3V0IHlldCBob3cgdG8gc3dpdGNoIHRoZSBjYXJk
IHRvIFhSR0I4ODg4LiBUaGF0J3Mgc3RpbGwgb24gdGhlDQo+Pj4gVE9ETyBsaXN0Lg0KPj4N
Cj4+IERvbid0IHdvcnJ5LiBBcyBJIG91dGxpbmVkICwgeW91IGNhbiBzdGlsbCBjb252ZXJ0
IGFueSBpbWFnZSBmcm9tDQo+PiBYUkdCODg4IHRvIFJHQjMzMiBhbmQgZGlzcGxheSB0aGlz
IGluc3RlYWQuDQo+Pg0KPj4+IE9uZSBxdWVzdGlvbiBhYm91dCBodyBibGl0dGluZzogd2l0
aCB0aGUgb2xkIGZiZGV2IGZyYW1ld29yayBvbmUNCj4+PiBjb3VsZA0KPj4+IHJlcGxhY2Ug
dGhlIGZiX2ltYWdlYmxpdCBmdW5jdGlvbi4gRm9yIG5vcm1hbCBjb25zb2xlIHRleHQsIHRo
aXMNCj4+PiBmdW5jdGlvbiBnZXRzIGNhbGxlZCB3aXRoIGEgbW9ub2Nocm9tZSBiaXRtYXAs
IGFuZCBhbiBmZy9iZyBjb2xvciB2YWx1ZS4NCj4+PiBUaGlzIG1ha2VzIGl0IGVhc3kgdG8g
dXNlIEhXIGFjY2VsZXJhdGVkIGJsaXR0aW5nIGZvciB0ZXh0LiBJbiB0aGUNCj4+PiBncHUv
ZHJtIGRyaXZlcnMgaSB0aGluayBpIGZvdW5kIG9ubHkgb25lIGRyaXZlciAobm91dmVhdSkg
ZG9pbmcgdGhpcyBhbmQNCj4+PiB0aGF0IHdhcyB2aWEgdGhlIGRybSBmYmRldiBsYXllci4N
Cj4+PiBJcyB0aGF0IHN0aWxsIHRoZSB3YXkgdG8gZ28sIG9yIGlzIHRoZXJlIGEgYmV0dGVy
IHdheSB0byBkbyBIVw0KPj4+IGFjY2VsZXJhdGVkDQo+Pj4gdGV4dCBibGl0dGluZz8NCj4+
DQo+PiBTaW1wbHkgY2FsbCBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpIGFmdGVyIHJlZ2lz
dGVyaW5nIHRoZQ0KPj4gZGV2aWNlLiBUaGlzIHNob3VsZCBnaXZlIHlvdSBhIGNvbnNvbGUu
DQo+IA0KPiBZZXMsIHRoYXQncyB3aGF0IGkgaGF2ZSwgYW5kIGl0IHdvcmtzLiANCg0KTmlj
ZSA6KQ0KDQo+IFRoZSBvbmx5IHRoaW5nIHRoYXQgaXMgb2RkIChhbmQgaSdtDQo+IG5vdCBz
dXJlIHdoZXRoZXIgdGhhdCdzIGEgYnVnIG9yIG5vdCksIGlzIHRoYXQgZmJzZXQgY2hhbmdl
cyB0aGUNCj4gcmVzb2x1dGlvbiBvZiB0aGUgZnJhbWVidWZmZXIsIGJ1dCBkb2Vzbid0IHJl
cHJvZ3JhbSB0aGUgaGFyZHdhcmUgdG8gdGhlDQo+IG5ldyByZXNvbHV0aW9uLiBUaGF0IG1l
YW5zIGlmIGkgYm9vdCB3aXRoIDE5MjB4MTA4MCByZXNvbHV0aW9uLCBhbmQgZG8gYQ0KPiBm
YnNldCAtYSA2NDB4NDgwLTYwLCBvbmx5IGEgc21hbGwgcGFydCBvZiB0aGUgc2NyZWVuIGlz
IHVzZWQgbm93LCBidXQNCj4gdGhlIHBoeXNpY2FsIHJlc29sdXRpb24gc3RheXMgYXQgMTky
MHgxMDgwLiBJIGZpcnN0IHRob3VnaHQgdGhhdCdzIGEgYnVnDQo+IGluIG15IGRyaXZlciwg
YnV0IG15IHg4NiBUaGlua3BhZCBYMSB3aXRoIG5vdXZlYXUgYmVoYXZlcyB0aGUgc2FtZS4N
Cg0KSSdtIHN1cnByaXNlZCB0aGF0IGFueXRoaW5nIGhhcHBlbnMgYXQgYWxsLiBXZSBkb24n
dCBldmVuIHN1cHBvcnQgDQpjaGFuZ2luZyB0aGUgcmVzb2x1dGlvbiB2aWEgZmJkZXYgaW50
ZXJmYWNlcy4gSSBndWVzcyB0aGF0IGl0IGNoYW5nZXMgDQppbnRlcm5hbCBzdGF0ZSBzdWNo
IHRoYXQgdGhlIGNvbnNvbGUgb25seSByZW5kZXJzIDY0MHg0ODAuIEJ1dCBJIGNhbiBzYXkg
DQpmb3Igc3VyZSB3aXRob3V0IGludmVzdGlnYXRpbmcuDQoNClRoZXJlJ3MgZmJkZXYgbW9k
ZXNldHRpbmcgY29kZSBpbiBEUk0ncyB2bXdnZnggZHJpdmVyLiBJIHRob3VnaHQgYWJvdXQg
DQpwb3J0aW5nIGl0IHRvIHRoZSBnZW5lcmljIGhlbHBlcnMsIGJ1dCBpdCdzIG5vdCByZWFs
bHkgaW1wb3J0YW50IEFUTS4NCg0KPiANCj4+IERvbid0IGJvdGhlciBhYm91dCBIVy1hY2Nl
bGVyYXRlZCBibGl0dGluZy4gRnJvbSB3aGF0IEkndmUgaGVhcmQsIGl0DQo+PiBiYXJlbHkg
bWFrZXMgYSBkaWZmZXJlbmNlIG5vd2FkYXlzLiBBbmQgb3VyIGdlbmVyaWMgaGVscGVycyBo
YXZlDQo+PiBwbGVudHkgb2YgZmVhdHVyZXMuIE5vdCB1c2luZyB0aGVtIHRvIGdldCBhIHNt
YWxsIGJlbmVmaXQgZnJvbSBIVw0KPj4gYmxpdHRpbmcgaXNuJ3Qgd29ydGggaXQuDQo+IA0K
PiBOb3Qgc3VyZS4gV2l0aCBteSBmaXJzdCBkcml2ZXIgKHRoZSBmYmRldi9mYmNvbiBvbmUg
d2l0aG91dCBkcm0pLCB0aGF0DQo+IG1hZGUgYSBiaWcgZGlmZmVyZW5jZSB3aGVuIHNjcm9s
bGluZyBvciB0aGUgd2hvbGUgc2NyZWVuIHdhcyB1cGRhdGVkLiBJDQo+IG5ldmVyIG1lYXN1
cmVkIGl0LCBidXQgaSB3b3VsZCB0aGluayBpdCB3YXMgYSAxOjEwIHJhdGlvLg0KDQpUaGF0
J3MgaW50ZXJlc3RpbmcuIERpZCB5b3UgbWFwIHRoZSBkZXZpY2UncyBmcmFtZWJ1ZmZlciBt
ZW1vcnkgd2l0aCANCndyaXRlIGNvbWJpbmluZyBlbmFibGVkPyBNb3N0IEhXIGRvZXMgc3Vw
cG9ydCBXQyBtYXBwaW5ncyBhbmQgaXQgcmVhbGx5IA0KbWFrZXMgYSBkaWZmZXJlbmNlLg0K
DQpXaGF0IEkgaGVhcmQgd2FzIGFib3V0IGk5MTUuIEknZCBndWVzcyB0aGF0IGV2ZW4gMTox
MCBpcyBzdGlsbCBhIGhhcmQgDQpzZWxsIGluIERSTSBsYW5kLiBFc3BlY2lhbGx5IHNpbmNl
IGZiZGV2IGlzIG9uIGl0cyB3YXkgb3V0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBSZWdhcmRzDQo+IFN2ZW4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------5lxa5fsFJBTcaFZTy2mmm4tq--

--------------nSC7F8s2WhW04Awu3Ry3PfFT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJdcMFAwAAAAAACgkQlh/E3EQov+Du
sA//Ylo+Ujhgun6TxZhcXBdqJykqOWHCG/DJwJIElZxJrTigdrGpfbXhnTIz9M9Oj2ycUAWGg0fm
YjDgr3C/OhAGcXeyh3Q7pAqbTx9cz8rxXEzj4fUL1eza7SmYD1dmGy8wZI/uWmyIK79+3r/TI4NR
bJexdKXY9rTaO7W131P7xt/vNRZfhYHq+xErHn3m21hDOCoSFAeGHLepw5wdE05jdTi21BxH90JY
o7jfYdbhl9un4JaGEZUBzivX/Xfj6nOPoqNVbMkJ3b9lNPpQoohR7lADOiBrnRTwSI5cbfVqom+c
QJ7kjhRWivfdY4kKcghHOfctsgeqleNwYFfHY6c6/lyFzF/yaUFop5OgBC4Bsz+XJMHUsc0Wh1m9
6Lte5m7xXB+k4AsJZHMRgMKATc6/I6av3nGkIWcLRks74y0D0i/DDikfHcztwYeO54y5ae0LMGg9
9XAN9LTGLNBgOuHn9/d/W/pWSiZcIVSQRsLZh932rarZxjgJ429dv4//9hCEhiItov1HAnbnK6SY
fJE7tfv1Gqm2tSjWcyjtGz5lAwmZ9RPegoWJgIT6h1B7HpbTs3884v81FwTdqRfVt9lDr4PGbpoO
xkCF6h4ir23suNKLhN3zFWbJMqi1D1Gx04mvM/7jyQgz1diipswHZBRfrdFqDHHSBcImfjXUBj0M
0f4=
=mGb4
-----END PGP SIGNATURE-----

--------------nSC7F8s2WhW04Awu3Ry3PfFT--
