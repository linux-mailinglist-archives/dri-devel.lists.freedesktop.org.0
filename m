Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61E44AABF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42D6E9F7;
	Tue,  9 Nov 2021 09:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395B26E9F7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:43:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BEEC1FDBC;
 Tue,  9 Nov 2021 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636451031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkO8suy91VMsWgOuXntIZ0eo2j3AtZpHbodFMZDGZsk=;
 b=klQ5kkOkR5aOT+oSFD6lC9blTnc2xgfaw6cjpQBE647ny3STzO/xs7Y1cJEm1DEksiGxVt
 AMJZtIW6Cy+2PHUa7Z5fyDIVK+fyFPgfWJgEhiYXvMmsFhG6Px3RFM4+ERZA6XdliyuiOi
 aTi/jd4W33GkQ/CiRhm1XYrCwUKk6G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636451031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkO8suy91VMsWgOuXntIZ0eo2j3AtZpHbodFMZDGZsk=;
 b=w4HesHWPSArehmNHkN+wlPvRYOgLQwMriw/bwmo7KF+Z9D/3oH4WPAsNmwTwqjrEheUvUp
 HpCXBctwMAk/frAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26C14133D1;
 Tue,  9 Nov 2021 09:43:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VuBWCNdCimGPXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 09:43:51 +0000
Message-ID: <177b124b-96bb-a05f-a22b-90e238209187@suse.de>
Date: Tue, 9 Nov 2021 10:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <6cf78eae-796d-f5a2-e93f-624599af4944@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6cf78eae-796d-f5a2-e93f-624599af4944@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8Td6BTjPtgBf1LhNbqnK9FJ0"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8Td6BTjPtgBf1LhNbqnK9FJ0
Content-Type: multipart/mixed; boundary="------------xkfP5i0dyBRy3d1JPgqq1E6s";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <177b124b-96bb-a05f-a22b-90e238209187@suse.de>
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <6cf78eae-796d-f5a2-e93f-624599af4944@tronnes.org>
In-Reply-To: <6cf78eae-796d-f5a2-e93f-624599af4944@tronnes.org>

--------------xkfP5i0dyBRy3d1JPgqq1E6s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTk6NTcgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDAxLjExLjIwMjEgMTUuMTUsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gRW5hYmxlIHRoZSBGQl9EQU1BR0VfQ0xJUFMgcHJvcGVydHkgdG8gcmVkdWNlIGRp
c3BsYXktdXBkYXRlDQo+PiBvdmVyaGVhZC4gQWxzbyBmaXhlcyBhIHdhcm5pbmcgaW4gdGhl
IGtlcm5lbCBsb2cuDQo+Pg0KPj4gICAgc2ltcGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFt
ZWJ1ZmZlci4wOiBbZHJtXSBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpIG5v
dCBjYWxsZWQNCj4+DQo+PiBGaXggdGhlIGNvbXB1dGF0aW9uIG9mIHRoZSBibGl0IHJlY3Rh
bmdsZS4gVGhpcyB3YXNuJ3QgYW4gaXNzdWUgc28NCj4+IGZhciwgYXMgc2ltcGxlZHJtIGFs
d2F5cyBibGl0dGVkIHRoZSBmdWxsIGZyYW1lYnVmZmVyLiBUaGUgY29kZSBub3cNCj4+IHN1
cHBvcnRzIGRhbWFnZSBjbGlwcGluZyBhbmQgdmlydHVhbCBzY3JlZW4gc2l6ZXMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAz
MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDIyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvc2ltcGxlZHJtLmMNCj4+IGluZGV4IDU3MWY3MTZmZjQyNy4uZTg3MjEyMWU5ZmIwIDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBAQCAtNjQyLDcgKzY0
Miw3IEBAIHNpbXBsZWRybV9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+PiAgIAl2b2lkICp2bWFwID0gc2hhZG93
X3BsYW5lX3N0YXRlLT5kYXRhWzBdLnZhZGRyOyAvKiBUT0RPOiBVc2UgbWFwcGluZyBhYnN0
cmFjdGlvbiAqLw0KPj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZzZGV2LT5kZXY7
DQo+PiAgIAl2b2lkIF9faW9tZW0gKmRzdCA9IHNkZXYtPnNjcmVlbl9iYXNlOw0KPj4gLQlz
dHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4+ICsJc3RydWN0IGRybV9yZWN0IHNyY19jbGlwLCBk
c3RfY2xpcDsNCj4+ICAgCWludCBpZHg7DQo+PiAgIA0KPj4gICAJaWYgKCFmYikNCj4+IEBA
IC02NTEsMTAgKzY1MSwxNCBAQCBzaW1wbGVkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFi
bGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPj4gICAJaWYgKCFk
cm1fZGV2X2VudGVyKGRldiwgJmlkeCkpDQo+PiAgIAkJcmV0dXJuOw0KPj4gICANCj4+IC0J
ZHJtX3JlY3RfaW5pdCgmY2xpcCwgMCwgMCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0KTsNCj4+
ICsJZHJtX3JlY3RfZnBfdG9faW50KCZzcmNfY2xpcCwgJnBsYW5lX3N0YXRlLT5zcmMpOw0K
Pj4gICANCj4+IC0JZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rl
di0+Zm9ybWF0LCAmY2xpcCk7DQo+PiAtCWRybV9mYl9ibGl0X3RvaW8oZHN0LCBzZGV2LT5w
aXRjaCwgc2Rldi0+Zm9ybWF0LT5mb3JtYXQsIHZtYXAsIGZiLCAmY2xpcCk7DQo+PiArCWRz
dF9jbGlwID0gcGxhbmVfc3RhdGUtPmRzdDsNCj4+ICsJaWYgKCFkcm1fcmVjdF9pbnRlcnNl
Y3QoJmRzdF9jbGlwLCAmc3JjX2NsaXApKQ0KPj4gKwkJcmV0dXJuOw0KPiANCj4gWW91J3Jl
IGluc2lkZSBkcm1fZGV2X2VudGVyIGhlcmUgc28gY2FuJ3QganVzdCByZXR1cm4uIE1vdmUN
Cj4gZHJtX2Rldl9lbnRlciBhZnRlciB0aGlzIGxpa2UgeW91IGRvIGluIHVwZGF0ZSgpLg0K
DQpSaWdodC4gV2lsbCBiZSBmaXhlZC4NCg0KPiANCj4+ICsNCj4+ICsJZHN0ICs9IGRybV9m
Yl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmZHN0X2NsaXApOw0K
Pj4gKwlkcm1fZmJfYmxpdF90b2lvKGRzdCwgc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+
Zm9ybWF0LCB2bWFwLCBmYiwgJnNyY19jbGlwKTsNCj4+ICAgDQo+PiAgIAlkcm1fZGV2X2V4
aXQoaWR4KTsNCj4+ICAgfQ0KPj4gQEAgLTY4NiwyMCArNjkwLDI4IEBAIHNpbXBsZWRybV9z
aW1wbGVfZGlzcGxheV9waXBlX3VwZGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3Bp
cGUgKnBpcGUsDQo+PiAgIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0
YXRlLT5mYjsNCj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmc2Rldi0+ZGV2Ow0K
Pj4gICAJdm9pZCBfX2lvbWVtICpkc3QgPSBzZGV2LT5zY3JlZW5fYmFzZTsNCj4+IC0Jc3Ry
dWN0IGRybV9yZWN0IGNsaXA7DQo+PiArCXN0cnVjdCBkcm1fcmVjdCBkYW1hZ2VfY2xpcCwg
c3JjX2NsaXAsIGRzdF9jbGlwOw0KPj4gICAJaW50IGlkeDsNCj4+ICAgDQo+PiAgIAlpZiAo
IWZiKQ0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+PiAtCWlmICghZHJtX2F0b21pY19oZWxw
ZXJfZGFtYWdlX21lcmdlZChvbGRfcGxhbmVfc3RhdGUsIHBsYW5lX3N0YXRlLCAmY2xpcCkp
DQo+PiArCWlmICghZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZChvbGRfcGxhbmVf
c3RhdGUsIHBsYW5lX3N0YXRlLCAmZGFtYWdlX2NsaXApKQ0KPj4gKwkJcmV0dXJuOw0KPj4g
Kw0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGVjaywgaXNuJ3QgdGhhdCB0aGUgc2FtZSBjaGVj
ayB0aGF0IGhhcyBqdXN0IGhhcHBlbmVkIGluDQo+IGRybV9hdG9taWNfaGVscGVyX2RhbWFn
ZV9pdGVyX25leHQoKT8NCg0KT2gsIGluZGVlZC4gSXQgdGFrZXMgdGhlIHBsYW5lJ3Mgc3Jj
IHJlY3RhbmdsZSBbMV0gYW5kIGNsaXBzIGFnYWluc3QgaXQuIA0KWzJdIFRoZSBib3VuZGlu
ZyBib3ggb2YgYWxsIGRhbWFnZSBjbGlwcyBpcyB0aGUgZmluYWwgcmVjdGFuZ2xlLiBbM10g
SXQgDQpjYW4gbmV2ZXIgYnkgb3V0c2lkZSBvZiBwbGFuZV9zdGF0ZS0+c3JjLiBTbyB0aGUg
ZXh0cmEgdGVzdCBoZXJlIGFuZCB0aGUgDQpkYW1hZ2VfY2xpcCB2YXJpYWJsZSBjYW4gYmUg
cmVtb3ZlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RhbWFnZV9oZWxwZXIuYyNMMjM1DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBl
ci5jI0wyODANClszXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMjTDMyMA0KDQo+
IA0KPiBOb3JhbGYuDQo+IA0KPj4gKwlkcm1fcmVjdF9mcF90b19pbnQoJnNyY19jbGlwLCAm
cGxhbmVfc3RhdGUtPnNyYyk7DQo+PiArCWlmICghZHJtX3JlY3RfaW50ZXJzZWN0KCZzcmNf
Y2xpcCwgJmRhbWFnZV9jbGlwKSkNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJZHN0X2Ns
aXAgPSBwbGFuZV9zdGF0ZS0+ZHN0Ow0KPj4gKwlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgm
ZHN0X2NsaXAsICZzcmNfY2xpcCkpDQo+PiAgIAkJcmV0dXJuOw0KPj4gICANCj4+ICAgCWlm
ICghZHJtX2Rldl9lbnRlcihkZXYsICZpZHgpKQ0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+
PiAtCWRzdCArPSBkcm1fZmJfY2xpcF9vZmZzZXQoc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1h
dCwgJmNsaXApOw0KPj4gLQlkcm1fZmJfYmxpdF90b2lvKGRzdCwgc2Rldi0+cGl0Y2gsIHNk
ZXYtPmZvcm1hdC0+Zm9ybWF0LCB2bWFwLCBmYiwgJmNsaXApOw0KPj4gKwlkc3QgKz0gZHJt
X2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQsICZkc3RfY2xpcCk7
DQo+PiArCWRybV9mYl9ibGl0X3RvaW8oZHN0LCBzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0
LT5mb3JtYXQsIHZtYXAsIGZiLCAmc3JjX2NsaXApOw0KPj4gICANCj4+ICAgCWRybV9kZXZf
ZXhpdChpZHgpOw0KPj4gICB9DQo+PiBAQCAtNzk0LDYgKzgwNiw4IEBAIHN0YXRpYyBpbnQg
c2ltcGxlZHJtX2RldmljZV9pbml0X21vZGVzZXQoc3RydWN0IHNpbXBsZWRybV9kZXZpY2Ug
KnNkZXYpDQo+PiAgIAlpZiAocmV0KQ0KPj4gICAJCXJldHVybiByZXQ7DQo+PiAgIA0KPj4g
Kwlkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygmcGlwZS0+cGxhbmUpOw0KPj4g
Kw0KPj4gICAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRldik7DQo+PiAgIA0KPj4gICAJcmV0
dXJuIDA7DQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------xkfP5i0dyBRy3d1JPgqq1E6s--

--------------8Td6BTjPtgBf1LhNbqnK9FJ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKQtYFAwAAAAAACgkQlh/E3EQov+DZ
1BAAil0Xie3HM12JGCItD1OpZyDEfYJvUgAaEhupvkTPARRTLEOAM61rXFY5ywuhWIAR5qyMUSyq
KgLOvSiDsDC9M3Z1NrA99chtuvX4xmwHkg9WcuarcTvfFa5TYfwDmV+POpzVgzXhCHT9z/Ozwfta
mWcn0nOTKL29Ca2aZeozGQ9BrwRXA4mEXJ6LiCEZj7BtvjlK5Hn/rJgRs5cMMpw8hVkCkXv6Tbqh
MfpTx2mUgXZ2xaWPhT9cg4B2aNFec5pVsjFa8iJ3gHqhjjR9M4JEOTNpAX9ldmXOssp5FlMEVtIv
3oQNNQoPnE1lz8GCCW8xpRgmePBmgPZLqFaDAsy4UZ+HJJ2CmdQwcFxZA+/jQRiXuoe6CRUIF4KY
MZjN8tcWqF38+PX9NyWwEFqUPSHQHfvSw4KTtHD8Y+93Z3E2b80fXUvcTKJjl4n9I+tBM+VirqRz
ltVAvqv8zpKxloOyjtb6meUP152IEREAg7OiRjfQNb5mMTfyKqVcaAUnBeKtNZdIr76hMuF2wH8s
KnH2RF26dEsHTWbiNP+W7s2IYDMnG8ycqI2QLCpDtgudifaZnkoKytYpy0I7jZv3wXXh51SfeAW3
qU8dqzstDezqxwgP3HbaGrIFJZ+zW0O7tOI9VZa4Gz1AzJtTPUp4QbTBDzsV8Z6AXSHug+YdwEWX
L1k=
=BNkc
-----END PGP SIGNATURE-----

--------------8Td6BTjPtgBf1LhNbqnK9FJ0--
