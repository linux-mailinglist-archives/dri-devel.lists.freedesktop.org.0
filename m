Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5249F860
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0CA10EE62;
	Fri, 28 Jan 2022 11:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67BB10EE62
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:36:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5694F212BB;
 Fri, 28 Jan 2022 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643369783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jLIeXUq2QUP3jYaErDgBpJ/yttzf1TSjoJFEDFF+rw=;
 b=XtwqjTm0iLL+YP42gIs00qJF0qt5rFEKIh8UBXVMTqfIm96pTdf4U7RR+uRf0pDWM3kMM4
 iavlEWpS2iRMiiEdSjUikh6TfXbsDN6aPbKW9VzUwAE1VLF5qy2q1ob22d1Rqt/H9uWAlr
 S7TJpEFXBzQ/QbouWNc9qn8lKkhFx7g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643369783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jLIeXUq2QUP3jYaErDgBpJ/yttzf1TSjoJFEDFF+rw=;
 b=A52OuaNNEkUDvcC8uEgeIjS8a3A/sToK2qvaRPPm/3pkMpblxy+TFc6SFzLAc4iqViPBev
 Idfqpfqe5QIlJ9Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CE6D13A9C;
 Fri, 28 Jan 2022 11:36:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k0nUDTfV82GDPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 11:36:23 +0000
Message-ID: <79173ff0-5e86-9761-a7f3-6c93d4d8bc11@suse.de>
Date: Fri, 28 Jan 2022 12:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
 <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
 <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iHJNApRghFOy2bxYm2fDxAl7"
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iHJNApRghFOy2bxYm2fDxAl7
Content-Type: multipart/mixed; boundary="------------dCME4QcGbvZ6FHwklYrjuQfz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <79173ff0-5e86-9761-a7f3-6c93d4d8bc11@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
References: <20220127102621.30047-1-tzimmermann@suse.de>
 <YfKFP2DW/g6tXLQw@phenom.ffwll.local>
 <b3c508df-53ee-7fcd-2cdb-297d603a5f96@suse.de>
 <YfK0N21rJ69rclJE@phenom.ffwll.local>
 <b59ac6ae-f080-0a22-3ad6-e0de65ebf621@suse.de>
 <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>
In-Reply-To: <CAKMK7uFNXooNYnrJ6-_nRh5jrOQrAdocUe88eT_fVRPg=svMSg@mail.gmail.com>

--------------dCME4QcGbvZ6FHwklYrjuQfz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDEuMjIgdW0gMTI6MDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEphbiAyNywgMjAyMiBhdCA0OjE4IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDI3LjAxLjIy
IHVtIDE2OjAzIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4+PiBPbiBUaHUsIEphbiAyNywg
MjAyMiBhdCAxMjo1ODozMFBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+
Pj4gSGkNCj4+Pj4NCj4+Pj4gQW0gMjcuMDEuMjIgdW0gMTI6NDIgc2NocmllYiBEYW5pZWwg
VmV0dGVyOg0KPj4+Pj4gT24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgMTE6MjY6MjFBTSArMDEw
MCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+Pj4gTWFyayBzY3JlZW4gYnVmZmVy
cyBpbiBzeXN0ZW0gbWVtb3J5IHdpdGggRkJfVklSVEZCLiBPdGhlcndpc2UsIHRoZQ0KPj4+
Pj4+IGJ1ZmZlcnMgYXJlIG1tYXAnZWQgYXMgSS9PIG1lbW9yeSAoaS5lLiwgVk1fSU8pLiBG
b3Igc2hhZG93IGJ1ZmZlcnMsDQo+Pj4+Pj4gYWxzbyBzZXQgdGhlIEZCX1JFQURTX0ZBU1Qg
aGludC4NCj4+Pj4+DQo+Pj4+PiBNYXliZSBjbGFyaWZ5IHRoYXQgdGhpcyBvbmx5IGhvbGRz
IGZvciB0aGUgZGVmaW8gY2FzZSwgYW5kIHNpbmNlIHdlIGhhdmUNCj4+Pj4+IG91ciBvd24g
c2hhZG93IGNvcHkgZm9yIHRoYXQgYW55d2F5IGl0IHNob3VsZG4ndCBtYXR0ZXIuIEknbSBh
bHNvIG5vdCBzdXJlDQo+Pj4+PiBob3cgbXVjaCB0aGUgbWVtY3B5IGdhaW5zIHVzIGNvbXBh
cmVkIHRvIGp1c3QgcmVkcmF3aW5nIC4uLg0KPj4+Pj4NCj4+Pj4+IFdoYXQncyB0aGUgbW90
aXZhdGlvbiBoZXJlLCBvciBqdXN0IHNvbWV0aGluZyB5b3Ugc3BvdHRlZD8NCj4+Pj4NCj4+
Pj4gQ29ycmVjdG5lc3MgbW9zdGx5LiBmYmRldidzIGZiZGVmaW8gdGVzdHMgZm9yICh0aGUg
YWJzZW5jZSBvZikgdGhpcyBmbGFnIGFuZA0KPj4+PiBzZXRzIFZNX0lPIGFjY29yZGluZ2x5
Lg0KPj4+Pg0KPj4+PiBJdCdzIGFjdHVhbGx5IGZvciB1c2Vyc3BhY2UuIE1heWJlIHVzZXJz
cGFjZSB0ZXN0cyB0aGVzZSBmbGFncyBhcyB3ZWxsIGFuZA0KPj4+PiBjYW4gb3B0aW1pemUg
bWVtY3B5IHBhdHRlcm4gZm9yIGRpZmZlcmVudCB0eXBlcyBvZiBjYWNoaW5nLiBCdXQgSSB3
b3VsZG4ndA0KPj4+PiBleHBlY3QgaXQgVEJILg0KPj4+DQo+Pj4gSG0gSSB0aG91Z2h0IHNv
IHRvbywgYnV0IHRoZSAjZGVmaW5lIGlzIGluIHRoZSBpbnRlcm5hbCBoZWFkZXIsIG5vdCB0
aGUNCj4+PiB1YXBpIGhlYWRlci4gQW5kIEkgZG9uJ3Qgc2VlIGFueSBpb2N0bCBjb2RlIGlu
IGZibWVtLmMgdGhhdCB3b3VsZCBzaG92ZQ0KPj4+IGZiX2luZm8tPmZsYWdzIHRvIHVzZXJz
cGFjZS4gVGhhdCdzIHdoeSBJIHdvbmRlcmVkIHdoeSB5b3UgY2FyZSBhYm91dA0KPj4+IHRo
aXM/IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nIHNvbWV3aGVyZT8NCj4+DQo+PiBZb3UgZGlk
bid0LiAgSSBqdXN0IGdyZXBwZWQgaXQgbXlzZWxmIGFuZCB0aGUgb25seSB1c2VyIG9mIFZJ
UlRGQiBpcyB0aGUNCj4+IG1tYXAgY29kZSBpbiBmYl9kZWZlcmlvLmMsIHdoaWNoIChub3Qp
IHNldHMgVk1fSU8uIFJFQURTX0ZBU1QgaXMgdW51c2VkLg0KPj4gSSdkIHRoZW4gc2V0IHRo
ZSBmb3JtZXIsIGJ1dCBub3QgdGhlIGxhdHRlci4gT2s/DQo+IA0KPiBXZWxsIFJFQURTX0ZB
U1QgbWlnaHQgYmVjb21lIHVzZWQgYWdhaW4sIGlmL3doZW4gdGhlIGFjY2VsIGNvZGUgaXMN
Cg0KT2suDQoNCj4gYmFjay4gU28gSSdkIG1vcmUga2VlcCB0aGF0IHBhcnQsIGFuZCBsZWF2
ZSB0aGUgVklSVEZCIG9uZSBhbG9uZSwNCj4gc2luY2UgeW91IG5ldmVyIHNldCB0aGF0IGZv
ciB0aGUgZGVmaW8gY2FzZS4gSSdtIGFsc28gbm90IHN1cmUgaG93DQo+IHRoYXQgZXZlbiB3
b3Jrcywgc2luY2UgZGVmaW8gcmVsaWVzIG9uIHN0cnVjdCBwYWdlIGJlaW5nIHByZXNlbnQN
Cj4gdW5kZXJuZWF0aCwgYW5kIHlvdSBkZWZvIGRvbid0IGhhdmUgc3RydWN0IHBhZ2UgZm9y
IFZNX0lPIGNhc2VzLiBTbyBpdA0KPiBhbGwgbG9va3MgcmF0aGVyIGZpc2h5LiBPciBJJ20g
c3RpbGwgbWFzc2l2ZWx5IG1pc3VuZGVyc3RhbmRpbmcgaXQNCj4gYWxsPw0KDQpXZSBvbmx5
IHNldCB0aGUgVklSVEZCIGZsYWcgaWYgd2UgdXNlIG91ciBpbnRlcm5hbCBzaGFkb3cgYnVm
ZmVyLCB3aGljaCANCmlzIGFsbG9jYXRlIHZpYSB2emFsbG9jKCkgaW4gZHJtX2ZiX2hlbHBl
cl9nZW5lcmljX3Byb2JlKCkuIE9mIGNvdXJzZSwgDQp0aGUgc2hhZG93IGJ1ZmZlciBpcyBy
ZWd1bGFyIG1lbW9yeSBhbmQgbm90IGFuIEkvTyByYW5nZS4NCg0KVGhlIGZiZGVmaW8gb24g
dGhpcyBidWZmZXIgaXMgY29tcGxldGVseSBpbXBsZW1lbnRlZCBieSB0aGUgZmJkZXYgDQpz
dXNieXN0ZW0sIHdoaWNoIHVzZXMgcGFnZXMgKGkuZS4sIG5vIFZNX1BGTk1BUCBmbGFnKS4g
U2VlIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYyNMMTY1IA0KZm9yIHRoZSByZXNw
ZWN0aXZlIG1tYXAgY29kZS4gIE91ciBHRU0gY29kZSBuZXZlciBldmVuIGtub3dzIHRoYXQg
YW4gDQptbWFwIGNhbGwgaGFzIHRha2VuIHBsYWNlLiBJdCBqdXN0IHNlZXMgdGhlIG9jY2Fz
aW9uYWwgZGFtYWdlIHVwZGF0ZXMgDQp0aGF0IGZiZGV2aW8gZ2VuZXJhdGVzLiBTZXR0aW5n
IFZJUlRGQiBvbiB0aGUgc2hhZG93IGJ1ZmZlcidzIG1lbW9yeSBpcyANCnRoZSByaWdodCB0
aGluZyB0byBkbyBJTUhPLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gLURhbmll
bA0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiAtRGFuaWVs
DQo+Pj4NCj4+Pj4NCj4+Pj4gQmVzdCByZWdhcmRzDQo+Pj4+IFRob21hcw0KPj4+Pg0KPj4+
Pj4gLURhbmllbA0KPj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+
ICAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgOSArKysrKystLS0NCj4+
Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+Pj4+IGlu
ZGV4IGVkNDNiOTg3ZDMwNi4uZjE1MTI3YTMyZjdhIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4+Pj4gQEAgLTIzNDYsNiArMjM0Niw3IEBAIHN0
YXRpYyBpbnQgZHJtX2ZiX2hlbHBlcl9nZW5lcmljX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVs
cGVyICpmYl9oZWxwZXIsDQo+Pj4+Pj4gICAgICAgICAgICAgZmJpLT5mYm9wcyA9ICZkcm1f
ZmJkZXZfZmJfb3BzOw0KPj4+Pj4+ICAgICAgICAgICAgIGZiaS0+c2NyZWVuX3NpemUgPSBz
aXplcy0+c3VyZmFjZV9oZWlnaHQgKiBmYi0+cGl0Y2hlc1swXTsNCj4+Pj4+PiAgICAgICAg
ICAgICBmYmktPmZpeC5zbWVtX2xlbiA9IGZiaS0+c2NyZWVuX3NpemU7DQo+Pj4+Pj4gKyAg
ZmJpLT5mbGFncyA9IEZCSU5GT19ERUZBVUxUOw0KPj4+Pj4+ICAgICAgICAgICAgIGRybV9m
Yl9oZWxwZXJfZmlsbF9pbmZvKGZiaSwgZmJfaGVscGVyLCBzaXplcyk7DQo+Pj4+Pj4gQEAg
LTIzNTMsMTkgKzIzNTQsMjEgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNf
cHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgIGZiaS0+c2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2MoZmJpLT5zY3JlZW5f
c2l6ZSk7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBpZiAoIWZiaS0+c2NyZWVuX2J1
ZmZlcikNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07DQo+Pj4+Pj4gKyAgICAgICAgICBmYmktPmZsYWdzIHw9IEZCSU5GT19WSVJURkIgfCBG
QklORk9fUkVBRFNfRkFTVDsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgIGZiaS0+ZmJk
ZWZpbyA9ICZkcm1fZmJkZXZfZGVmaW87DQo+Pj4+Pj4gLQ0KPj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgZmJfZGVmZXJyZWRfaW9faW5pdChmYmkpOw0KPj4+Pj4+ICAgICAgICAgICAg
IH0gZWxzZSB7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAvKiBidWZmZXIgaXMgbWFw
cGVkIGZvciBIVyBmcmFtZWJ1ZmZlciAqLw0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gZHJtX2NsaWVudF9idWZmZXJfdm1hcChmYl9oZWxwZXItPmJ1ZmZlciwgJm1hcCk7
DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KPj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4+IC0gICAgICAgICAgaWYg
KG1hcC5pc19pb21lbSkNCj4+Pj4+PiArICAgICAgICAgIGlmIChtYXAuaXNfaW9tZW0pIHsN
Cj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmJpLT5zY3JlZW5fYmFzZSA9
IG1hcC52YWRkcl9pb21lbTsNCj4+Pj4+PiAtICAgICAgICAgIGVsc2UNCj4+Pj4+PiArICAg
ICAgICAgIH0gZWxzZSB7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZi
aS0+c2NyZWVuX2J1ZmZlciA9IG1hcC52YWRkcjsNCj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgZmJpLT5mbGFncyB8PSBGQklORk9fVklSVEZCOw0KPj4+Pj4+ICsgICAgICAgICAgfQ0K
Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgLyoNCj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAqIFNoYW1lbGVzc2x5IGxlYWsgdGhlIHBoeXNpY2FsIGFkZHJlc3MgdG8gdXNlci1z
cGFjZS4gQXMNCj4+Pj4+PiAtLQ0KPj4+Pj4+IDIuMzQuMQ0KPj4+Pj4+DQo+Pj4+Pg0KPj4+
Pg0KPj4+PiAtLQ0KPj4+PiBUaG9tYXMgWmltbWVybWFubg0KPj4+PiBHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQo+Pj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KPj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+Pj4g
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo+Pj4NCj4+Pg0KPj4+DQo+Pj4NCj4+DQo+PiAtLQ0KPj4gVGhvbWFzIFppbW1l
cm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------dCME4QcGbvZ6FHwklYrjuQfz--

--------------iHJNApRghFOy2bxYm2fDxAl7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHz1TYFAwAAAAAACgkQlh/E3EQov+Bx
iw//fB8SrkWkm0EBVcOqMvYwhRAoyAHvRKIleLnrmsjpILRlijVQ1wsRjgsFs/wVJnloh9mNpBSU
iDecjJXlfDT3Ud5MPn0KGxto6bQivnAlvoVauO26UoxT5sh8zn5Zr1wtb+OpcgU+2U9tjHb3RQJN
0RTA/x8DRGdOZuAqA9+aNMa8L5ZAiN5MS6amSg/weVVvmKVZzzAa3/+dGvS5SNQQ+Kf9KZ6Kz9xG
ET7DDiUbrccMWv3pacd765D3ikyTFmZHIGpHbw2BBYBSggKtYHhCJ7bToufXWzhyxvW39LbfiPTu
S4IN5fow2L4Fo7ZffTk5QdAz42soy6c/SI+U+YpjYMA4NH+XnRXfmuWxL45hY1Cezw3a1IOQHBGK
n7aJzCzssGBiA1dAeAxSlxouuM8oDHcGkiCrZCLuEbvvqby8LciiA+Yr3xeLpZwHg9/X4Cc8XPbx
cQZteXz8KReLXffX6K2tWk9TFMnj5tPf5mme7If9vHcVQPjSqGM8jozRgdlovgrp2+U/fNSgxN2V
vFdARzoQvbx7knrbJGyQUhTgA+aZE+aa2kCp0mtB4kDU7QLTt7x39Qd1a5VtMsEZGKJlH2OqqUxH
Jy2GHj/d/0ogDlJOWTCvlan88vJrAOweo6jvy6I170K5jPtPu7yYO5D2GmC+7gPoBZ4ynZxyBIh/
vCE=
=8wpR
-----END PGP SIGNATURE-----

--------------iHJNApRghFOy2bxYm2fDxAl7--
