Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FD4B1008
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D2E10E883;
	Thu, 10 Feb 2022 14:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B1910E883;
 Thu, 10 Feb 2022 14:16:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF01821114;
 Thu, 10 Feb 2022 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644502610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjcJ5peEEt+Af7cw8oxeC4Qs8pUp0W0Z0zdSpk9TUbY=;
 b=V1/clWQBNGDFhR4ai8R3mK0WCRSo4r/VHV0jFTrRTdWWk3CCkUFMS4iaf6AUG0CP6xkXjE
 6G+m70uo2SlOZRoUv1oVNGdcB8Z/OgM448OrOwzmM46pPJzoGydVbyK8SlmUlMpKaHqMma
 L+pm3yZHzJXRTBqdlCZbclxrpn7kbhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644502610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjcJ5peEEt+Af7cw8oxeC4Qs8pUp0W0Z0zdSpk9TUbY=;
 b=5s1ysWHDuCUH/RijNZGBLpobQm6t4s1wGRW6f8I7vkL3VX/U2GuA82STaRIXwrWqV9sDRA
 hnL9QlTTOaC0kbBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D0B713B9E;
 Thu, 10 Feb 2022 14:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LyJ+IVIeBWIIbAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 14:16:50 +0000
Message-ID: <37c0fa2d-1dfa-62b2-ec06-9f9be492d7aa@suse.de>
Date: Thu, 10 Feb 2022 15:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 11/19] fbcon: move more common code into fb_open()
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-12-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-12-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Uk2K5kaVlaVXO1Ntp3uVeaJ9"
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Uk2K5kaVlaVXO1Ntp3uVeaJ9
Content-Type: multipart/mixed; boundary="------------2mbA0DYcaM6h6xs9IaIW0P1X";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Claudio Suarez <cssk@net-c.es>, Du Cheng <ducheng2@gmail.com>
Message-ID: <37c0fa2d-1dfa-62b2-ec06-9f9be492d7aa@suse.de>
Subject: Re: [PATCH v2 11/19] fbcon: move more common code into fb_open()
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-12-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-12-daniel.vetter@ffwll.ch>

--------------2mbA0DYcaM6h6xs9IaIW0P1X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gTm8g
aWRlYSB3aHkgY29uMmZiX2FjcXVpcmVfbmV3aW5mbygpIGluaXRpYWxpemVzIG11Y2ggbGVz
cyB0aGFuDQo+IGZiY29uX3N0YXJ0dXAoKSwgYnV0IHNvIGJlIGl0LiBGcm9tIGEgcXVpY2sg
bG9vayBtb3N0IG9mIHRoZQ0KPiB1bi1pbml0aWFsaXplZCBzdHVmZiBzaG91bGQgYmUgZmFp
cmx5IGhhcm1sZXNzLCBidXQgd2hvIGtub3dzLg0KPiANCj4gTm90ZSB0aGF0IHRoZSBlcnJv
ciBoYW5kbGluZyBmb3IgdGhlIGNvbjJmYl9hY3F1aXJlX25ld2luZm8oKSBmYWlsdXJlDQo+
IGNhc2Ugd2FzIHZlcnkgc3RyYW5nZTogQ2FsbGVycyB1cGRhdGVkIGNvbjJmYl9tYXAgdG8g
dGhlIG5ldyB2YWx1ZQ0KPiBiZWZvcmUgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLCBidXQgdXBv
biBlcnJvciBjb24yZmJfYWNxdWlyZV9uZXdpbmZvDQo+IHJlc2V0IGl0IHRvIHRoZSBvbGQg
dmFsdWUuIFNpbmNlIEkgcmVtb3ZlZCB0aGUgY2FsbCB0byBmYmNvbl9yZWxlYXNlDQo+IGFu
eXdheSB0aGF0IHN0cmFuZ2UgZXJyb3IgcGF0aCB3YXMgc3RpY2tpbmcgb3V0IGxpa2UgYSBz
b3JlIHRodW1iLA0KPiBoZW5jZSBJIHJlbW92ZWQgaXQuIFdoaWNoIGFsc28gYWxsb3dzIHVz
IHRvIHJlbW92ZSB0aGUgb2xkaWR4DQo+IHBhcmFtZXRlciBmcm9tIHRoYXQgZnVuY3Rpb24u
DQo+IA0KPiB2MjogRXhwbGFpbiB3aGF0J3MgZ29pbmcgb24gd2l0aCBvbGRpZHggYW5kIGVy
cm9yIHBhdGhzIChTYW0pDQo+IA0KPiB2MzogRHJvcCB1bnVzZWQgdmFyaWFibGUgKDBkYXkp
DQo+IA0KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiAodjIp
DQo+IENjOiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBDYzogVGV0c3VvIEhhbmRhIDxw
ZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPg0KPiBDYzogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IENjOiBDbGF1ZGlvIFN1YXJleiA8Y3Nz
a0BuZXQtYy5lcz4NCj4gQ2M6IER1IENoZW5nIDxkdWNoZW5nMkBnbWFpbC5jb20+DQoNCkFj
a2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhh
dCdzIHRoZSBpbml0IGZ1bmN0aW9uIEkgd2FzIGxvb2tpbmcgZm9yLCBJIGd1ZXNzLg0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIHwgNzUgKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYw0KPiBpbmRleCBhNjA4OTEwMDVkNDQuLmYwMjEzYTBlMzg3MCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4gKysrIGIvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4gQEAgLTY4Miw4ICs2ODIsMTggQEAgc3Rh
dGljIGludCBmYmNvbl9pbnZhbGlkX2NoYXJjb3VudChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywg
dW5zaWduZWQgY2hhcmNvdW50KQ0KPiAgIA0KPiAgICNlbmRpZiAvKiBDT05GSUdfTUlTQ19U
SUxFQkxJVFRJTkcgKi8NCj4gICANCj4gK3N0YXRpYyB2b2lkIGZiY29uX3JlbGVhc2Uoc3Ry
dWN0IGZiX2luZm8gKmluZm8pDQo+ICt7DQo+ICsJaWYgKGluZm8tPmZib3BzLT5mYl9yZWxl
YXNlKQ0KPiArCQlpbmZvLT5mYm9wcy0+ZmJfcmVsZWFzZShpbmZvLCAwKTsNCj4gKw0KPiAr
CW1vZHVsZV9wdXQoaW5mby0+ZmJvcHMtPm93bmVyKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBpbnQgZmJjb25fb3BlbihzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7DQo+ICsJc3Ry
dWN0IGZiY29uX29wcyAqb3BzOw0KPiArDQo+ICAgCWlmICghdHJ5X21vZHVsZV9nZXQoaW5m
by0+ZmJvcHMtPm93bmVyKSkNCj4gICAJCXJldHVybiAtRU5PREVWOw0KPiAgIA0KPiBAQCAt
NjkzLDQ4ICs3MDMsMzEgQEAgc3RhdGljIGludCBmYmNvbl9vcGVuKHN0cnVjdCBmYl9pbmZv
ICppbmZvKQ0KPiAgIAkJcmV0dXJuIC1FTk9ERVY7DQo+ICAgCX0NCj4gICANCj4gLQlyZXR1
cm4gMDsNCj4gLX0NCj4gKwlvcHMgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZmJjb25fb3Bz
KSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFvcHMpIHsNCj4gKwkJZmJjb25fcmVsZWFzZShp
bmZvKTsNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsJfQ0KPiAgIA0KPiAtc3RhdGljIHZv
aWQgZmJjb25fcmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gLXsNCj4gLQlpZiAo
aW5mby0+ZmJvcHMtPmZiX3JlbGVhc2UpDQo+IC0JCWluZm8tPmZib3BzLT5mYl9yZWxlYXNl
KGluZm8sIDApOw0KPiArCUlOSVRfREVMQVlFRF9XT1JLKCZvcHMtPmN1cnNvcl93b3JrLCBm
Yl9mbGFzaGN1cnNvcik7DQo+ICsJb3BzLT5pbmZvID0gaW5mbzsNCj4gKwlpbmZvLT5mYmNv
bl9wYXIgPSBvcHM7DQo+ICsJb3BzLT5jdXJfYmxpbmtfamlmZmllcyA9IEhaIC8gNTsNCj4g
ICANCj4gLQltb2R1bGVfcHV0KGluZm8tPmZib3BzLT5vd25lcik7DQo+ICsJcmV0dXJuIDA7
DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgY29uMmZiX2FjcXVpcmVfbmV3aW5mbyhz
dHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAtCQkJCSAgaW50
IHVuaXQsIGludCBvbGRpZHgpDQo+ICsJCQkJICBpbnQgdW5pdCkNCj4gICB7DQo+IC0Jc3Ry
dWN0IGZiY29uX29wcyAqb3BzID0gTlVMTDsNCj4gICAJaW50IGVycjsNCj4gICANCj4gICAJ
ZXJyID0gZmJjb25fb3BlbihpbmZvKTsNCj4gICAJaWYgKGVycikNCj4gICAJCXJldHVybiBl
cnI7DQo+ICAgDQo+IC0JaWYgKCFlcnIpIHsNCj4gLQkJb3BzID0ga3phbGxvYyhzaXplb2Yo
c3RydWN0IGZiY29uX29wcyksIEdGUF9LRVJORUwpOw0KPiAtCQlpZiAoIW9wcykNCj4gLQkJ
CWVyciA9IC1FTk9NRU07DQo+IC0NCj4gLQkJSU5JVF9ERUxBWUVEX1dPUksoJm9wcy0+Y3Vy
c29yX3dvcmssIGZiX2ZsYXNoY3Vyc29yKTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAoIWVycikg
ew0KPiAtCQlvcHMtPmN1cl9ibGlua19qaWZmaWVzID0gSFogLyA1Ow0KPiAtCQlvcHMtPmlu
Zm8gPSBpbmZvOw0KPiAtCQlpbmZvLT5mYmNvbl9wYXIgPSBvcHM7DQo+IC0NCj4gLQkJaWYg
KHZjKQ0KPiAtCQkJc2V0X2JsaXR0aW5nX3R5cGUodmMsIGluZm8pOw0KPiAtCX0NCj4gLQ0K
PiAtCWlmIChlcnIpIHsNCj4gLQkJY29uMmZiX21hcFt1bml0XSA9IG9sZGlkeDsNCj4gLQkJ
ZmJjb25fcmVsZWFzZShpbmZvKTsNCj4gLQl9DQo+ICsJaWYgKHZjKQ0KPiArCQlzZXRfYmxp
dHRpbmdfdHlwZSh2YywgaW5mbyk7DQo+ICAgDQo+ICAgCXJldHVybiBlcnI7DQo+ICAgfQ0K
PiBAQCAtODQyLDkgKzgzNSwxMSBAQCBzdGF0aWMgaW50IHNldF9jb24yZmJfbWFwKGludCB1
bml0LCBpbnQgbmV3aWR4LCBpbnQgdXNlcikNCj4gICANCj4gICAJZm91bmQgPSBzZWFyY2hf
ZmJfaW5fbWFwKG5ld2lkeCk7DQo+ICAgDQo+IC0JY29uMmZiX21hcFt1bml0XSA9IG5ld2lk
eDsNCj4gLQlpZiAoIWVyciAmJiAhZm91bmQpDQo+IC0JCWVyciA9IGNvbjJmYl9hY3F1aXJl
X25ld2luZm8odmMsIGluZm8sIHVuaXQsIG9sZGlkeCk7DQo+ICsJaWYgKCFlcnIgJiYgIWZv
dW5kKSB7DQo+ICsJCWVyciA9IGNvbjJmYl9hY3F1aXJlX25ld2luZm8odmMsIGluZm8sIHVu
aXQpOw0KPiArCQlpZiAoIWVycikNCj4gKwkJCWNvbjJmYl9tYXBbdW5pdF0gPSBuZXdpZHg7
DQo+ICsJfQ0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBJZiBvbGQgZmIgaXMgbm90IG1hcHBl
ZCB0byBhbnkgb2YgdGhlIGNvbnNvbGVzLA0KPiBAQCAtOTQxLDIwICs5MzYsMTAgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmZiY29uX3N0YXJ0dXAodm9pZCkNCj4gICAJaWYgKGZiY29uX29w
ZW4oaW5mbykpDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gLQlvcHMgPSBremFsbG9j
KHNpemVvZihzdHJ1Y3QgZmJjb25fb3BzKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKCFvcHMp
IHsNCj4gLQkJZmJjb25fcmVsZWFzZShpbmZvKTsNCj4gLQkJcmV0dXJuIE5VTEw7DQo+IC0J
fQ0KPiAtDQo+IC0JSU5JVF9ERUxBWUVEX1dPUksoJm9wcy0+Y3Vyc29yX3dvcmssIGZiX2Zs
YXNoY3Vyc29yKTsNCj4gLQ0KPiArCW9wcyA9IGluZm8tPmZiY29uX3BhcjsNCj4gICAJb3Bz
LT5jdXJyY29uID0gLTE7DQo+ICAgCW9wcy0+Z3JhcGhpY3MgPSAxOw0KPiAgIAlvcHMtPmN1
cl9yb3RhdGUgPSAtMTsNCj4gLQlvcHMtPmN1cl9ibGlua19qaWZmaWVzID0gSFogLyA1Ow0K
PiAtCW9wcy0+aW5mbyA9IGluZm87DQo+IC0JaW5mby0+ZmJjb25fcGFyID0gb3BzOw0KPiAg
IA0KPiAgIAlwLT5jb25fcm90YXRlID0gaW5pdGlhbF9yb3RhdGlvbjsNCj4gICAJaWYgKHAt
PmNvbl9yb3RhdGUgPT0gLTEpDQo+IEBAIC0xMDI0LDcgKzEwMDksNyBAQCBzdGF0aWMgdm9p
ZCBmYmNvbl9pbml0KHN0cnVjdCB2Y19kYXRhICp2YywgaW50IGluaXQpDQo+ICAgCQlyZXR1
cm47DQo+ICAgDQo+ICAgCWlmICghaW5mby0+ZmJjb25fcGFyKQ0KPiAtCQljb24yZmJfYWNx
dWlyZV9uZXdpbmZvKHZjLCBpbmZvLCB2Yy0+dmNfbnVtLCAtMSk7DQo+ICsJCWNvbjJmYl9h
Y3F1aXJlX25ld2luZm8odmMsIGluZm8sIHZjLT52Y19udW0pOw0KPiAgIA0KPiAgIAkvKiBJ
ZiB3ZSBhcmUgbm90IHRoZSBmaXJzdCBjb25zb2xlIG9uIHRoaXMNCj4gICAJICAgZmIsIGNv
cHkgdGhlIGZvbnQgZnJvbSB0aGF0IGNvbnNvbGUgKi8NCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------2mbA0DYcaM6h6xs9IaIW0P1X--

--------------Uk2K5kaVlaVXO1Ntp3uVeaJ9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIFHlIFAwAAAAAACgkQlh/E3EQov+Bo
rQ/+I2hmlBmVZVorpZunjMBlvG7zE+jPDcmMpYVcuh2nhZxAd+Ltodij/NGMqwzv355p+sFV1ILB
Gv3+JSphIjTpP32qgutr3zUcJd+9+ObnfT5+/bqk/B6FtxzF9lZWdPaH05KU/k20iMqjZiW5bG2J
IXE/8aoEiOnAxuZM/WXTtfZLawTaGv2gXXxaR0u7Nbw0+OgteTqGvUP81gzp3v+XPsNwK2OKE0Zw
ImHYmG9H2guvSrP0vRrmv4JpNFISDIY6SyNdHncIHwTa3TPfIkaEn/+SyW/uzzmhWBSedOJH0z9K
k+nWZe3aLtONz0ClAusT4JYVb+5wGzZDmH6EQ+GZyqB4VVMZ/J13UGIkkw+3U6eO5EP8g3oZ0M6p
x++5okamKzSVV5t9dQ7SG1ws4dg1KeAnLhbdhk0XLt7KQQ/XjEY3QkL0QIIlsYt8ep3HTIXye5cf
64/VDw7m2U3BEYcU6IEF7GO9rpSP29v3j6o6v2kmxGWUPsx//73EqhqE4CxgHRj7SDEY4GLATEm/
7aSe99wY2bnIjNXvXXg4NemV9RtmynJtoveukqVbWA+km2PrLQHcqjfh5PAGW3QbYbnhl+wO9vv5
DSQFuf2totYLuz25FyCqO9g2zpu7oYuHtReiZa7MBvTxbQEdu3BcmvBg/u6sObIW6m3LvtcQ0+7s
6zI=
=0Z5/
-----END PGP SIGNATURE-----

--------------Uk2K5kaVlaVXO1Ntp3uVeaJ9--
