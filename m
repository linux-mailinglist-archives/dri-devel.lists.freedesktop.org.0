Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B249F66F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832F410EC66;
	Fri, 28 Jan 2022 09:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E9A10EDD4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 09:33:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6B141F391;
 Fri, 28 Jan 2022 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643362403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=19rdc9fC7OG7HfBbMoAIsFnL4L+cUkADDhTafKdET6c=;
 b=RInwmZvWbgVMLnMH51JHnANWAw7cXsX14o7/QhqaYzJtBsZmqn1COEyjtajDeH1jB+Qfkr
 ASLurfTbuxnySTrctt8jBG85QhmGfvc6V8dcjBZKFrTUWrCoPeOO7pnymfhsEiiNcFCNBq
 sx6BLjN726WH70hcxc5D26XBdhbX6ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643362403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=19rdc9fC7OG7HfBbMoAIsFnL4L+cUkADDhTafKdET6c=;
 b=81Tgjq/GP1E5NWyz96lCWDHgH4hU6RHCJurMJ1eGtjOEEfcWzWjF7vt5pZMH//9vzmXna8
 /PiPrDxck5wI5lBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3B4313A1E;
 Fri, 28 Jan 2022 09:33:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XfPfJmO482GFfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 09:33:23 +0000
Message-ID: <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
Date: Fri, 28 Jan 2022 10:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
Content-Language: en-US
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <164336121612.533872.1685181669511488706@Monstersaurus>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WcWEE0BvNATjTbVKE5mv0Sym"
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WcWEE0BvNATjTbVKE5mv0Sym
Content-Type: multipart/mixed; boundary="------------4SYgJhcNfw7DJI8TljF4abc5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <eb27fa44-2972-4a6e-465f-b9e4775820f4@suse.de>
Subject: Re: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset
 kernel parameter
References: <20211217003752.3946210-1-javierm@redhat.com>
 <20211217003752.3946210-32-javierm@redhat.com>
 <164336121612.533872.1685181669511488706@Monstersaurus>
In-Reply-To: <164336121612.533872.1685181669511488706@Monstersaurus>

--------------4SYgJhcNfw7DJI8TljF4abc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMTA6MTMgc2NocmllYiBLaWVyYW4gQmluZ2hhbToNCj4g
SGkgSmF2aWVyLA0KPiANCj4gUXVvdGluZyBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgKDIw
MjEtMTItMTcgMDA6Mzc6NDYpDQo+PiBBY2NvcmRpbmcgdG8gZGlzYWJsZSBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCwgdGhpcw0KPj4gcGFyYW1l
dGVyIGNhbiBiZSB1c2VkIHRvIGRpc2FibGUga2VybmVsIG1vZGVzZXR0aW5nLg0KPj4NCj4+
IERSTSBkcml2ZXJzIHdpbGwgbm90IHBlcmZvcm0gZGlzcGxheS1tb2RlIGNoYW5nZXMgb3Ig
YWNjZWxlcmF0ZWQgcmVuZGVyaW5nDQo+PiBhbmQgb25seSB0aGUgc3lzdGVtIGZyYW1lYnVm
ZmVyIHdpbGwgYmUgYXZhaWxhYmxlIGlmIGl0IHdhcyBzZXQtdXAuDQo+IA0KPiBXaGF0IGlz
IHRoZSAnc3lzdGVtIGZyYW1lYnVmZmVyJyBpbiB0aGlzIGluc3RhbmNlPyBSZWFkaW5nDQo+
IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0DQo+IGl0IHNvdW5kcyBsaWtlIHRoYXQgbWVhbnMgYW55
dGhpbmcgYWxyZWFkeSBzZXQgdXAgYnkgdGhlIGJvb3Rsb2FkZXIuDQoNCkV4YWN0bHkgdGhp
cy4NCg0KPiANCj4+IEJ1dCBvbmx5IGEgZmV3IERSTSBkcml2ZXJzIGN1cnJlbnRseSBjaGVj
ayBmb3Igbm9tb2Rlc2V0LCBtYWtlIHRoaXMgZHJpdmVyDQo+PiB0byBhbHNvIHN1cHBvcnQg
dGhlIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmF2
aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+PiAtLS0NCj4+
DQo+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkNCj4+DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfZHJ2LmMgfCAzICsrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfZHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Ry
di5jDQo+PiBpbmRleCA1YTgxMzFlZjgxZDUuLjk4MmU0NTAyMzNlZCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4+IEBAIC03MDEsNiArNzAx
LDkgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcmNhcl9kdV9wbGF0Zm9ybV9k
cml2ZXIgPSB7DQo+PiAgIA0KPj4gICBzdGF0aWMgaW50IF9faW5pdCByY2FyX2R1X2luaXQo
dm9pZCkNCj4+ICAgew0KPj4gKyAgICAgICBpZiAoZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25s
eSgpKQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gKw0KPiANCj4g
VGhpcyB3aWxsIGNvbXBsZXRlbHkgZGlzYWJsZSBhbGwgY29udHJvbCBvZiB0aGUgZGlzcGxh
eSBkZXZpY2Ugd2hlbg0KPiBub21vZGVzZXQgaXMgZW5hYmxlZC4NCj4gDQo+IElzIHRoZXJl
IGFueSByZXF1aXJlbWVudCBmb3IgdXMgdG8gc3VwcG9ydCBvdXRwdXR0aW5nIHRvIHRoZSBk
aXNwbGF5IGlmDQo+IGl0IHdhcyBwcmV2aW91c2x5IHNldCB1cD8gcHJlc3VtYWJseSB3aXRo
b3V0IHNldHRpbmcgb3IgY2hhbmdpbmcgYW55DQo+IG1vZGVzLCBidXQgc2ltcGx5IGFsbG93
aW5nIHRoZSBleGlzdGluZyBmcmFtZSB0byBiZSB1cGRhdGVkPw0KDQpUaGVyZSdzIG5vIHJl
cXVpcmVtZW50IGZvciB5b3VyIGRyaXZlci4gV2UganVzdCB3YW50IGEgcGFyYW1ldGVyIHdo
ZXJlIA0Kd2UgY2FuIGNvbnZlbmllbnRseSBkaXNhYmxlIG1vc3Qgb2YgRFJNJ3MgZHJpdmVy
cyBhbmQgcmVkdWNlIGl0IHRvIGEgDQptaW5pbXVtLiBIZWxwcyBkaXN0cmlidXRpb25zIHRv
IHByb3ZpZGUgYSBzaW1wbGUgZmFsbGJhY2sgbW9kZS4gIE1vc3QgDQpQQ0ktYmFzZWQgZHJp
dmVycyBhbHJlYWR5IHN1cHBvcnQgdGhhdC4gTm93IHdlJ3JlIGFkZGVkIGl0IHRvIHRoZSBv
dGhlciANCmRyaXZlcnMgYXMgd2VsbC4NCg0KPiANCj4gSSB0aGluayB0aGUgaW1wbGljYXRp
b24gaXMgdGhhdCAnZmlybXdhcmUgZHJpdmVycycgd291bGQgbWVhbiBhIGRpc3BsYXkNCj4g
Y291bGQgYmUgdXBkYXRlZCB0aHJvdWdoIHNvbWUgZmlybXdhcmUgaW50ZXJmYWNlLCB3aGlj
aCB3ZSB3b24ndCBoYXZlDQo+IC4uLiBzbyBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGFjY2Vw
dCB0aGF0IHRoaXMgd2hvbGUgZHJpdmVyIGNhbiBiZQ0KPiBkaXNhYmxlZCBpbiB0aGF0IGlu
c3RhbmNlLg0KDQpJdCBjYW5ub3QgYmUgJ21vZGUtc2V0dGVkJy4gV2UgZ2V0IGEgcHJlLWNv
bmZpZ3VyZWQgZnJhbWVidWZmZXIgZnJvbSB0aGUgDQpmaXJtd2FyZSBvciBib290bG9hZGVy
LiBXaGF0ZXZlciB3ZSBkcmF3IHRoZXJlIHNob3dzIHVwIG9uIHRoZSBzY3JlZW4uDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiANCj4gUmVhZGluZyB5b3VyIG1haWwgdGhhdCBi
cm91Z2h0IHRoaXMgdGhyZWFkIHVwIGluIG15IGluYm94LCBJIHRoaW5rDQo+IHlvdSd2ZSBh
bHJlYWR5IGhpdCBtZXJnZSBvbiB0aGlzLCBzbyBkb24ndCB3b3JyeSBhYm91dCBhZGRpbmcg
YSB0YWcgaW4NCj4gdGhhdCBpbnN0YW5jZSwgYnV0IEkgdGhpbmsgdGhpcyBpcyBvay4NCj4g
DQo+IFJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNh
c0BpZGVhc29uYm9hcmQuY29tPg0KPiANCj4+ICAgICAgICAgIHJjYXJfZHVfb2ZfaW5pdChy
Y2FyX2R1X29mX3RhYmxlKTsNCj4+ICAgDQo+PiAgICAgICAgICByZXR1cm4gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCZyY2FyX2R1X3BsYXRmb3JtX2RyaXZlcik7DQo+PiAtLSANCj4+
IDIuMzMuMQ0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------4SYgJhcNfw7DJI8TljF4abc5--

--------------WcWEE0BvNATjTbVKE5mv0Sym
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHzuGEFAwAAAAAACgkQlh/E3EQov+A4
XA/8CwTXIOXYE0E1nFFlvnPK4n1G3cjF6xnhl2TFVJMxDxl5ZHec2icG5D1t9aZDgqiCoy5GpMl4
rTapoY8GFWNOPksP0XOiOBD3/B8mmBE/saR6OlqtJgsFAVZ0P6WZVFJJiQCCosqFhH0tZqujQfGB
Fsc8UaqoFH7tsU3P4Ek78Mth9KSFJmQe+CRluLbnlsm9HWcWC9QKmB1EKj+QuK4DtWhfHiAx+qwl
AB7DGFopiYqh9CGYgy6PSRT14epSXS8vtaquuzGah0N+/BgxZSDwy72PG4QzQUp83UjcItoTPDAS
ifGqu1hYd2ncRvCFeUAUw7oF+J3p8QHPPPEecHZGplKfytSG1sioBmnXKqfa2D0abrkke2zsxSDj
LNznOpL7VKg3s3EYXawoHD/MZme3synLELw4Jxf0fEPRL6Zodw3oRHrkIg7heZ0+nzlD3A0ShTNO
5zA8tZwTGyYyxF+A7XaoEjW6m1531cN/nQKWpK8dCuCpP0OjjnUShHaDiL5RKCmgn8lrPaTfgpM1
A5BchoNba7m/HENyM0Qfr3nam3ZdB0T8IBN8ssHXD9EyFdBQ6Ts6D7nB0DhTM3aJeIVx6YDsM1oZ
l5whqDkq7/L7fVPWBfDawKByPMXATRluLgUlFY3i6CyHwnIEV7mdj3brv1zykdPde+Ne+W3+asWn
jz0=
=UR3B
-----END PGP SIGNATURE-----

--------------WcWEE0BvNATjTbVKE5mv0Sym--
