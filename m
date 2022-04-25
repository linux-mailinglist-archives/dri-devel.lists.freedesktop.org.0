Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDC50DB0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9EE10E02F;
	Mon, 25 Apr 2022 08:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A0510E02F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:24:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C6CF210F3;
 Mon, 25 Apr 2022 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650875064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Nfpj6dMjdB1M7OrX0AWqEYhTntRuBmklomVZqIjUXA=;
 b=0A3O0RG53VQaV4yF7dYUmGj8cK+gDzN2lrdEpY67oukRgpJcTzduo+0mxliqkabk2EcXNc
 c9wuFtgZRh6oS16N/X45YBDeVdCq1Cg77+zqU0VRuCDiIR4+fbJ6QXf3uUwgDkNU5uMWNm
 aNvPK6dTeI/Adg9TibP5u+iyalAA7aw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650875064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Nfpj6dMjdB1M7OrX0AWqEYhTntRuBmklomVZqIjUXA=;
 b=YVC0BP8CyTEbc1hsk26mrlqtbA6TvmndWdDDNunIoWBK5m9hTFd2FSFVVidwe/UBOibrFB
 JVFxZnt1Yr5XTIAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B6A913AED;
 Mon, 25 Apr 2022 08:24:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AyN7CbhaZmK8egAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 08:24:24 +0000
Message-ID: <7a512b4f-2327-b0c3-2f3c-60dc5be3c443@suse.de>
Date: Mon, 25 Apr 2022 10:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/5] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220420085303.100654-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dAmYUUsnRwZquvA0wVwM70BA"
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dAmYUUsnRwZquvA0wVwM70BA
Content-Type: multipart/mixed; boundary="------------tEYQknzzFLtW3cE9x7X7G2Xn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Borislav Petkov <bp@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Message-ID: <7a512b4f-2327-b0c3-2f3c-60dc5be3c443@suse.de>
Subject: Re: [PATCH v3 2/5] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-3-javierm@redhat.com>
In-Reply-To: <20220420085303.100654-3-javierm@redhat.com>

--------------tEYQknzzFLtW3cE9x7X7G2Xn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTA6NTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZXNlIGNhbiBiZSB1c2VkIGJ5IHN1YnN5c3RlbXMgdG8gdW5yZWdpc3Rl
ciBhIHBsYXRmb3JtIGRldmljZSByZWdpc3RlcmVkDQo+IGJ5IHN5c2ZiIGFuZCBhbHNvIHRv
IGRpc2FibGUgZnV0dXJlIHBsYXRmb3JtIGRldmljZSByZWdpc3RyYXRpb24gaW4gc3lzZmIu
DQo+IA0KPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2
aWVybUByZWRoYXQuY29tPg0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD4NCj4gLS0tDQo+IA0KPiAobm8gY2hhbmdlcyBzaW5jZSB2MikN
Cj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRkIGtlcm5lbC1kb2MgY29tbWVudHMgYW5k
IGluY2x1ZGUgaW4gb3RoZXJfaW50ZXJmYWNlcy5yc3QgKERhbmllbCBWZXR0ZXIpLg0KPiAN
Cj4gICAuLi4vZHJpdmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2VzLnJzdCAgfCAg
NiArKw0KPiAgIGRyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyAgICAgICAgICAgICAgICAgICAg
ICB8IDczICsrKysrKysrKysrKysrKysrLS0NCj4gICBpbmNsdWRlL2xpbnV4L3N5c2ZiLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgOTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZmlybXdhcmUvb3RoZXJfaW50ZXJmYWNlcy5y
c3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZmlybXdhcmUvb3RoZXJfaW50ZXJmYWNl
cy5yc3QNCj4gaW5kZXggYjgxNzk0ZTBjZmJiLi4wNmFjODlhZGFhZmIgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9maXJtd2FyZS9vdGhlcl9pbnRlcmZhY2Vz
LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZmlybXdhcmUvb3RoZXJf
aW50ZXJmYWNlcy5yc3QNCj4gQEAgLTEzLDYgKzEzLDEyIEBAIEVERCBJbnRlcmZhY2VzDQo+
ICAgLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZmlybXdhcmUvZWRkLmMNCj4gICAgICA6aW50
ZXJuYWw6DQo+ICAgDQo+ICtHZW5lcmljIFN5c3RlbSBGcmFtZWJ1ZmZlcnMgSW50ZXJmYWNl
DQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gKy4u
IGtlcm5lbC1kb2M6OiBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMNCj4gKyAgIDpleHBvcnQ6
DQo+ICsNCj4gICBJbnRlbCBTdHJhdGl4MTAgU29DIFNlcnZpY2UgTGF5ZXINCj4gICAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBTb21lIGZlYXR1cmVzIG9mIHRo
ZSBJbnRlbCBTdHJhdGl4MTAgU29DIHJlcXVpcmUgYSBsZXZlbCBvZiBwcml2aWxlZ2UNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyBiL2RyaXZlcnMvZmlybXdh
cmUvc3lzZmIuYw0KPiBpbmRleCBiMDMyZjQwYTkyZGUuLmE1MGQyODU4Y2U0ZCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+ICsrKyBiL2RyaXZlcnMvZmly
bXdhcmUvc3lzZmIuYw0KPiBAQCAtMzQsMjEgKzM0LDc4IEBADQo+ICAgI2luY2x1ZGUgPGxp
bnV4L3NjcmVlbl9pbmZvLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N5c2ZiLmg+DQo+ICAg
DQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQ7DQoNCllvdSBjb3VsZCBo
YXZlIG11bHRpcGxlIGluc3RhbmNlcyBvZiBzaW1wbGUtZnJhbWVidWZmZXIgYmVjYXVzZSB5
b3UgDQpkb24ndCBrbm93IHdoYXQgdGhlIGZpcm13YXJlIHNldCB1cC4gSXQgb3JpZ2luYXRl
ZCBmcm9tIERUIGFuZCBFRkkvVkVTQSANCmlzIHJlYWxseSBqdXN0IGFuIGFmdGVydGhvdWdo
dC4gSWYgdGhlcmUgaXMgbW9yZSB0aGFuIDEgaW5zdGFuY2UsIHlvdXIgDQplbnRpcmUgdW5y
ZWdpc3RlcmluZyBicmVha3MgZG93bi4NCg0KKEkndmUgYmVlbiB0b2xkIHRoYXQgc3VjaCBt
dWx0aS1vdXRwdXQgY2FzZXMgZXhpc3QgaW4gdGhlIGNvbnRleHQgb2YgT0YgDQpmcmFtZWJ1
ZmZlcnMuIFNvbWV0aGluZyBzaW1pbGFyIGNvdWxkIGV4aXN0IGZvciBzaW1wbGUtZnJhbWJ1
ZmZlciBhcyB3ZWxsLikNCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiArc3RhdGljIERF
RklORV9NVVRFWChsb2FkX2xvY2spOw0KPiArc3RhdGljIGJvb2wgZGlzYWJsZWQ7DQo+ICsN
Cj4gKy8qKg0KPiArICogc3lzZmJfZGlzYWJsZSgpIC0gZGlzYWJsZSB0aGUgR2VuZXJpYyBT
eXN0ZW0gRnJhbWVidWZmZXJzIHN1cHBvcnQNCj4gKyAqDQo+ICsgKiBUaGlzIGRpc2FibGVz
IHRoZSByZWdpc3RyYXRpb24gb2Ygc3lzdGVtIGZyYW1lYnVmZmVyIGRldmljZXMgdGhhdCBt
YXRjaCB0aGUNCj4gKyAqIGdlbmVyaWMgZHJpdmVycyB0aGF0IG1ha2UgdXNlIG9mIHRoZSBz
eXN0ZW0gZnJhbWVidWZmZXIgc2V0IHVwIGJ5IGZpcm13YXJlLg0KPiArICoNCj4gKyAqIENv
bnRleHQ6IFRoZSBmdW5jdGlvbiBjYW4gc2xlZXAuIEEgQGxvYWRfbG9jayBtdXRleCBpcyBh
Y3F1aXJlZCB0byBzZXJpYWxpemUNCj4gKyAqICAgICAgICAgIGFnYWluc3Qgc3lzZmJfaW5p
dCgpLCB0aGF0IHJlZ2lzdGVycyBhIHN5c3RlbSBmcmFtZWJ1ZmZlciBkZXZpY2UgYW5kDQo+
ICsgKiAgICAgICAgICBzeXNmYl90cnlfdW5yZWdpc3RlcigpLCB0aGF0IHRyaWVzIHRvIHVu
cmVnaXN0ZXIgZnJhbWVidWZmZXIgZGV2aWNlcy4NCj4gKyAqLw0KPiArdm9pZCBzeXNmYl9k
aXNhYmxlKHZvaWQpDQo+ICt7DQo+ICsJbXV0ZXhfbG9jaygmbG9hZF9sb2NrKTsNCj4gKwlk
aXNhYmxlZCA9IHRydWU7DQo+ICsJbXV0ZXhfdW5sb2NrKCZsb2FkX2xvY2spOw0KPiArfQ0K
PiArRVhQT1JUX1NZTUJPTF9HUEwoc3lzZmJfZGlzYWJsZSk7DQo+ICsNCj4gKy8qKg0KPiAr
ICogc3lzZmJfdHJ5X3VucmVnaXN0ZXIoKSAtIGF0dGVtcHQgdG8gdW5yZWdpc3RlciBhIHN5
c3RlbSBmcmFtZWJ1ZmZlciBkZXZpY2UNCj4gKyAqIEBkZXY6IGRldmljZSB0byB1bnJlZ2lz
dGVyDQo+ICsgKg0KPiArICogVGhpcyB0cmllcyB0byB1bnJlZ2lzdGVyIGEgc3lzdGVtIGZy
YW1lYnVmZmVyIGRldmljZSBpZiB0aGlzIHdhcyByZWdpc3RlcmVkDQo+ICsgKiBieSB0aGUg
R2VuZXJpYyBTeXN0ZW0gRnJhbWVidWZmZXJzLiBUaGUgZGV2aWNlIHdpbGwgb25seSBiZSB1
bnJlZ2lzdGVyZWQgaWYNCj4gKyAqIGl0IHdhcyByZWdpc3RlcmVkIGJ5IHN5c2ZiX2luaXQo
KSwgb3RoZXJ3aXNlIGl0IHdpbGwgbm90IGJlIHVucmVnaXN0ZXJlZC4NCj4gKyAqDQo+ICsg
KiBDb250ZXh0OiBUaGUgZnVuY3Rpb24gY2FuIHNsZWVwLiBhIEBsb2FkX2xvY2sgbXV0ZXgg
aXMgYWNxdWlyZWQgdG8gc2VyaWFsaXplDQo+ICsgKiAgICAgICAgICBhZ2FpbnN0IHN5c2Zi
X2luaXQoKSwgdGhhdCByZWdpc3RlcnMgYSBzaW1wbGUgZnJhbWVidWZmZXIgZGV2aWNlIGFu
ZA0KPiArICogICAgICAgICAgc3lzZmJfZGlzYWJsZSgpLCB0aGF0IGRpc2FibGVzIHRoZSBH
ZW5lcmljIFN5c3RlbSBGcmFtZWJ1ZmZlcnMgc3VwcG9ydC4NCj4gKyAqDQo+ICsgKiBSZXR1
cm46DQo+ICsgKiAqIHRydWUgICAgICAgICAgLSB0aGUgZGV2aWNlIHdhcyB1bnJlZ2lzdGVy
ZWQgc3VjY2Vzc2Z1bGx5DQo+ICsgKiAqIGZhbHNlICAgICAgICAgLSB0aGUgZGV2aWNlIHdh
cyBub3QgdW5yZWdpc3RlcmVkDQo+ICsgKi8NCj4gK2Jvb2wgc3lzZmJfdHJ5X3VucmVnaXN0
ZXIoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCWJvb2wgcmV0ID0gdHJ1ZTsNCj4g
Kw0KPiArCW11dGV4X2xvY2soJmxvYWRfbG9jayk7DQo+ICsJaWYgKCFwZCB8fCBwZCAhPSB0
b19wbGF0Zm9ybV9kZXZpY2UoZGV2KSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJ
cGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOw0K
PiArCXBkID0gTlVMTDsNCj4gKwltdXRleF91bmxvY2soJmxvYWRfbG9jayk7DQo+ICsNCj4g
KwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwoc3lzZmJfdHJ5X3Vu
cmVnaXN0ZXIpOw0KPiArDQo+ICAgc3RhdGljIF9faW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lk
KQ0KPiAgIHsNCj4gICAJc3RydWN0IHNjcmVlbl9pbmZvICpzaSA9ICZzY3JlZW5faW5mbzsN
Cj4gICAJc3RydWN0IHNpbXBsZWZiX3BsYXRmb3JtX2RhdGEgbW9kZTsNCj4gLQlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZDsNCj4gICAJY29uc3QgY2hhciAqbmFtZTsNCj4gICAJYm9v
bCBjb21wYXRpYmxlOw0KPiAtCWludCByZXQ7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZsb2FkX2xvY2spOw0KPiArCWlmIChkaXNhYmxlZCkNCj4gKwkJZ290
byB1bmxvY2tfbXV0ZXg7DQo+ICAgDQo+ICAgCS8qIHRyeSB0byBjcmVhdGUgYSBzaW1wbGUt
ZnJhbWVidWZmZXIgZGV2aWNlICovDQo+ICAgCWNvbXBhdGlibGUgPSBzeXNmYl9wYXJzZV9t
b2RlKHNpLCAmbW9kZSk7DQo+ICAgCWlmIChjb21wYXRpYmxlKSB7DQo+ICAgCQlwZCA9IHN5
c2ZiX2NyZWF0ZV9zaW1wbGVmYihzaSwgJm1vZGUpOw0KPiAgIAkJaWYgKCFJU19FUlIocGQp
KQ0KPiAtCQkJcmV0dXJuIDA7DQo+ICsJCQlnb3RvIHVubG9ja19tdXRleDsNCj4gICAJfQ0K
PiAgIA0KPiAgIAkvKiBpZiB0aGUgRkIgaXMgaW5jb21wYXRpYmxlLCBjcmVhdGUgYSBsZWdh
Y3kgZnJhbWVidWZmZXIgZGV2aWNlICovDQo+IEBAIC02MCw4ICsxMTcsMTAgQEAgc3RhdGlj
IF9faW5pdCBpbnQgc3lzZmJfaW5pdCh2b2lkKQ0KPiAgIAkJbmFtZSA9ICJwbGF0Zm9ybS1m
cmFtZWJ1ZmZlciI7DQo+ICAgDQo+ICAgCXBkID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9jKG5h
bWUsIDApOw0KPiAtCWlmICghcGQpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiArCWlmICgh
cGQpIHsNCj4gKwkJcmV0ID0gLUVOT01FTTsNCj4gKwkJZ290byB1bmxvY2tfbXV0ZXg7DQo+
ICsJfQ0KPiAgIA0KPiAgIAlzeXNmYl9hcHBseV9lZmlfcXVpcmtzKHBkKTsNCj4gICANCj4g
QEAgLTczLDkgKzEzMiwxMSBAQCBzdGF0aWMgX19pbml0IGludCBzeXNmYl9pbml0KHZvaWQp
DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlnb3RvIGVycjsNCj4gICANCj4gLQlyZXR1cm4gMDsN
Cj4gKwlnb3RvIHVubG9ja19tdXRleDsNCj4gICBlcnI6DQo+ICAgCXBsYXRmb3JtX2Rldmlj
ZV9wdXQocGQpOw0KPiArdW5sb2NrX211dGV4Og0KPiArCW11dGV4X3VubG9jaygmbG9hZF9s
b2NrKTsNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3N5c2ZiLmggYi9pbmNsdWRlL2xpbnV4L3N5c2ZiLmgNCj4gaW5kZXgg
NzA4MTUyZTkwMzdiLi5lOGMwMzEzZmFjOGYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvc3lzZmIuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L3N5c2ZiLmgNCj4gQEAgLTU1LDYg
KzU1LDI1IEBAIHN0cnVjdCBlZmlmYl9kbWlfaW5mbyB7DQo+ICAgCWludCBmbGFnczsNCj4g
ICB9Ow0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19TWVNGQg0KPiArDQo+ICt2b2lkIHN5c2Zi
X2Rpc2FibGUodm9pZCk7DQo+ICtib29sIHN5c2ZiX3RyeV91bnJlZ2lzdGVyKHN0cnVjdCBk
ZXZpY2UgKmRldik7DQo+ICsNCj4gKyNlbHNlIC8qIENPTkZJR19TWVNGQiAqLw0KPiArDQo+
ICtzdGF0aWMgaW5saW5lIHZvaWQgc3lzZmJfZGlzYWJsZSh2b2lkKQ0KPiArew0KPiArDQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBzeXNmYl90cnlfdW5yZWdpc3Rlcihz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiAr
DQo+ICsjZW5kaWYgLyogQ09ORklHX1NZU0ZCICovDQo+ICsNCj4gICAjaWZkZWYgQ09ORklH
X0VGSQ0KPiAgIA0KPiAgIGV4dGVybiBzdHJ1Y3QgZWZpZmJfZG1pX2luZm8gZWZpZmJfZG1p
X2xpc3RbXTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------tEYQknzzFLtW3cE9x7X7G2Xn--

--------------dAmYUUsnRwZquvA0wVwM70BA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmWrcFAwAAAAAACgkQlh/E3EQov+Df
7Q//exZ9IFTepiQuHFLhIlwx6mMbVEPooKpaNH1/uDdQBpUVfsspUxDF7kux/PPodMqGAuAHDKGc
Ns4cjVMgyAkw0fNEHnUEUnUx8T0m2SoUd7ia5+obak5ntmEvwYVW2sNB2l7eLHwb0bfNBqx4Sf39
++lBgtLtXR6XRM7T78y60SRn65bmqlf8MEEeoqhqUCWQrw6OKx1IsiDVsbqzA3uTj63z0mJ5xRyw
uVjMUsmgvuey7IhFds+ZkMFahVua2PRaoOGMhiPFmVW+r5R0shba8JhfhuvTGW5mqnTZircax42N
CyhjoIPVOIS5DflwqLwalnji8TcGhDGmc/TqqPXInD8nzqMB4tXh/Kal1iD1Lb0AhdBcKbXmOFY9
C368XGgEUGmnWxL9q2Y3dRBE/A7hDn2UErxU21Mgb0FRgDyKGImXD6l9h2GY9JUh6Ap4P2jKyPTP
AqroRxo879qyEXRj7SR5B9QAN+ClTnVd1R8yF6IPMzhm6Og/eLPIKIPQQUIv6R7Rq3gzPPZ7wZpB
JvYy5aV1en1CEONOAappeXQ74rUJ81YXylMIHFd8k8mg97XdDEQp8mlMjF8uhw0W4YFlBYaqZExZ
5DYeZONkJGts2qZdjgnBb9BIpHFIoh/DAWwufQyObuSBSMfiw76m2qzcaRfOsEEyRQ0UeV9fH+SI
Cp0=
=S2dx
-----END PGP SIGNATURE-----

--------------dAmYUUsnRwZquvA0wVwM70BA--
