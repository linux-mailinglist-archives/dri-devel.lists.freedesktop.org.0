Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E064B0CB6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9C10E819;
	Thu, 10 Feb 2022 11:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8921810E819;
 Thu, 10 Feb 2022 11:46:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35ED81F37B;
 Thu, 10 Feb 2022 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644493593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/SEQf8J0d9YrgKYuJ/yV3wG4vJFHcMI+DGM+EPR/tY=;
 b=IQvgflaep40KnNEGr+QPkQ+hR5ophWSLa0XIWyyilk3K/6PjhgZXwHPpwbagb2tq3768P6
 yxrKhEU4MZPK4BH8BHlbegbxgittjjEe9UtcXBGebFc/Az6xIRzNYO6Bvmczxlz4HemyEh
 H6NZY7G8ed6e+G6Fe+/YAccmGEIQins=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644493593;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/SEQf8J0d9YrgKYuJ/yV3wG4vJFHcMI+DGM+EPR/tY=;
 b=69K2OfEKRMBHZfILNj5Qyh9rJvndbhEW/qQP6V/f3DMElgzCBXHq3SzGsvs4pgY6jImaXR
 WJNfsTuPoWgM3wCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EDE3413B71;
 Thu, 10 Feb 2022 11:46:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BBL2OBj7BGLvGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:46:32 +0000
Message-ID: <0879a2ff-37df-a9ae-0ce1-2bfcb2d1b322@suse.de>
Date: Thu, 10 Feb 2022 12:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/19] fbcon: Extract fbcon_open/release helpers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-10-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-10-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RkY0IrZQ3WkKljA7QxQi90Px"
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RkY0IrZQ3WkKljA7QxQi90Px
Content-Type: multipart/mixed; boundary="------------Ccrl9Q40nCGG0sIoEhWD8XPt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <0879a2ff-37df-a9ae-0ce1-2bfcb2d1b322@suse.de>
Subject: Re: [PATCH v2 09/19] fbcon: Extract fbcon_open/release helpers
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-10-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-10-daniel.vetter@ffwll.ch>

--------------Ccrl9Q40nCGG0sIoEhWD8XPt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDIuMjIgdW0gMjI6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBU
aGVyZSdzIHR3byBtaW5vciBiZWhhdmlvdXIgY2hhbmdlcyBpbiBoZXJlOg0KPiAtIGluIGVy
cm9yIHBhdGhzIHdlIG5vdyBjb25zaXN0ZW50bHkgY2FsbCBmYl9vcHMtPmZiX3JlbGVhc2UN
Cj4gLSBmYl9yZWxlYXNlIHJlYWxseSBjYW4ndCBmYWlsIChmYm1lbS5jIGlnbm9yZXMgaXQg
dG9vKSBhbmQgdGhlcmUncyBubw0KPiAgICByZWFzb25hYmxlIGNsZWFudXAgd2UgY2FuIGRv
IGFueXdheS4NCj4gDQo+IE5vdGUgdGhhdCBldmVyeXRoaW5nIGluIGZiY29uLmMgaXMgcHJv
dGVjdGVkIGJ5IHRoZSBiaWcgY29uc29sZV9sb2NrKCkNCj4gbG9jayAoZXNwZWNpYWxseSBh
bGwgdGhlIGdsb2JhbCB2YXJpYWJsZXMpLCBzbyB0aGUgbWlub3IgY2hhbmdlcyBpbg0KPiBv
cmRlcmluZyBvZiBzZXR1cC9jbGVhbnVwIGRvIG5vdCBtYXR0ZXIuDQo+IA0KPiB2MjogRXhw
bGFpbiBhIGJpdCBiZXR0ZXIgd2h5IHRoaXMgaXMgYWxsIGNvcnJlY3QgKFNhbSkNCj4gDQo+
IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogQ2xhdWRpbyBTdWFyZXog
PGNzc2tAbmV0LWMuZXM+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPg0KPiBDYzogVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5lbEBJ
LWxvdmUuU0FLVVJBLm5lLmpwPg0KPiBDYzogRHUgQ2hlbmcgPGR1Y2hlbmcyQGdtYWlsLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMgfCAxMDcg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1
MyBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYmNvbi5jDQo+IGluZGV4IDA1OGU4ODVkMjRmNi4uM2UxYTNlN2JmNTI3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiArKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPiBAQCAtNjgyLDE5ICs2ODIsMzcg
QEAgc3RhdGljIGludCBmYmNvbl9pbnZhbGlkX2NoYXJjb3VudChzdHJ1Y3QgZmJfaW5mbyAq
aW5mbywgdW5zaWduZWQgY2hhcmNvdW50KQ0KPiAgIA0KPiAgICNlbmRpZiAvKiBDT05GSUdf
TUlTQ19USUxFQkxJVFRJTkcgKi8NCj4gICANCj4gK3N0YXRpYyBpbnQgZmJjb25fb3Blbihz
dHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gK3sNCj4gKwlpZiAoIXRyeV9tb2R1bGVfZ2V0KGlu
Zm8tPmZib3BzLT5vd25lcikpDQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArDQo+ICsJaWYg
KGluZm8tPmZib3BzLT5mYl9vcGVuICYmDQo+ICsJICAgIGluZm8tPmZib3BzLT5mYl9vcGVu
KGluZm8sIDApKSB7DQo+ICsJCW1vZHVsZV9wdXQoaW5mby0+ZmJvcHMtPm93bmVyKTsNCj4g
KwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyB2b2lkIGZiY29uX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8p
DQo+ICt7DQo+ICsJaWYgKGluZm8tPmZib3BzLT5mYl9yZWxlYXNlKQ0KPiArCQlpbmZvLT5m
Ym9wcy0+ZmJfcmVsZWFzZShpbmZvLCAwKTsNCj4gKw0KPiArCW1vZHVsZV9wdXQoaW5mby0+
ZmJvcHMtPm93bmVyKTsNCj4gK30NCj4gICANCj4gICBzdGF0aWMgaW50IGNvbjJmYl9hY3F1
aXJlX25ld2luZm8oc3RydWN0IHZjX2RhdGEgKnZjLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbywN
Cj4gICAJCQkJICBpbnQgdW5pdCwgaW50IG9sZGlkeCkNCj4gICB7DQo+ICAgCXN0cnVjdCBm
YmNvbl9vcHMgKm9wcyA9IE5VTEw7DQo+IC0JaW50IGVyciA9IDA7DQo+IC0NCj4gLQlpZiAo
IXRyeV9tb2R1bGVfZ2V0KGluZm8tPmZib3BzLT5vd25lcikpDQo+IC0JCWVyciA9IC1FTk9E
RVY7DQo+ICsJaW50IGVycjsNCj4gICANCj4gLQlpZiAoIWVyciAmJiBpbmZvLT5mYm9wcy0+
ZmJfb3BlbiAmJg0KPiAtCSAgICBpbmZvLT5mYm9wcy0+ZmJfb3BlbihpbmZvLCAwKSkNCj4g
LQkJZXJyID0gLUVOT0RFVjsNCj4gKwllcnIgPSBmYmNvbl9vcGVuKGluZm8pOw0KPiArCWlm
IChlcnIpDQo+ICsJCXJldHVybiBlcnI7DQo+ICAgDQo+ICAgCWlmICghZXJyKSB7DQo+ICAg
CQlvcHMgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZmJjb25fb3BzKSwgR0ZQX0tFUk5FTCk7
DQo+IEBAIC03MTUsNyArNzMzLDcgQEAgc3RhdGljIGludCBjb24yZmJfYWNxdWlyZV9uZXdp
bmZvKHN0cnVjdCB2Y19kYXRhICp2Yywgc3RydWN0IGZiX2luZm8gKmluZm8sDQo+ICAgDQo+
ICAgCWlmIChlcnIpIHsNCj4gICAJCWNvbjJmYl9tYXBbdW5pdF0gPSBvbGRpZHg7DQo+IC0J
CW1vZHVsZV9wdXQoaW5mby0+ZmJvcHMtPm93bmVyKTsNCj4gKwkJZmJjb25fcmVsZWFzZShp
bmZvKTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR1cm4gZXJyOw0KPiBAQCAtNzI2LDQ1ICs3
NDQsMzQgQEAgc3RhdGljIGludCBjb24yZmJfcmVsZWFzZV9vbGRpbmZvKHN0cnVjdCB2Y19k
YXRhICp2Yywgc3RydWN0IGZiX2luZm8gKm9sZGluZm8sDQo+ICAgCQkJCSAgaW50IG9sZGlk
eCwgaW50IGZvdW5kKQ0KPiAgIHsNCj4gICAJc3RydWN0IGZiY29uX29wcyAqb3BzID0gb2xk
aW5mby0+ZmJjb25fcGFyOw0KPiAtCWludCBlcnIgPSAwLCByZXQ7DQo+ICsJaW50IHJldDsN
Cj4gICANCj4gLQlpZiAob2xkaW5mby0+ZmJvcHMtPmZiX3JlbGVhc2UgJiYNCj4gLQkgICAg
b2xkaW5mby0+ZmJvcHMtPmZiX3JlbGVhc2Uob2xkaW5mbywgMCkpIHsNCj4gLQkJY29uMmZi
X21hcFt1bml0XSA9IG9sZGlkeDsNCg0KV2UgZG9uJ3QgbmVlZCBvbGRpZHggYW55IGxvbmdl
cj8NCg0KVGhlcmUncyBzb21lIGxvZ2ljIHdydCB0byB0aGUgcGFyYW1ldGVyICdmb3VuZCcg
aGVyZSBhbmQgaW4gDQpzZXRfY29uMmZiX21hcCgpIHRoYXQgYXBwZWFycyB0byBiZSByZWxl
dmFudC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IC0JCWlmICghZm91bmQgJiYg
bmV3aW5mby0+ZmJvcHMtPmZiX3JlbGVhc2UpDQo+IC0JCQluZXdpbmZvLT5mYm9wcy0+ZmJf
cmVsZWFzZShuZXdpbmZvLCAwKTsNCj4gLQkJaWYgKCFmb3VuZCkNCj4gLQkJCW1vZHVsZV9w
dXQobmV3aW5mby0+ZmJvcHMtPm93bmVyKTsNCj4gLQkJZXJyID0gLUVOT0RFVjsNCj4gLQl9
DQo+ICsJZmJjb25fcmVsZWFzZShvbGRpbmZvKTsNCj4gICANCj4gLQlpZiAoIWVycikgew0K
PiAtCQlmYmNvbl9kZWxfY3Vyc29yX3dvcmsob2xkaW5mbyk7DQo+IC0JCWtmcmVlKG9wcy0+
Y3Vyc29yX3N0YXRlLm1hc2spOw0KPiAtCQlrZnJlZShvcHMtPmN1cnNvcl9kYXRhKTsNCj4g
LQkJa2ZyZWUob3BzLT5jdXJzb3Jfc3JjKTsNCj4gLQkJa2ZyZWUob3BzLT5mb250YnVmZmVy
KTsNCj4gLQkJa2ZyZWUob2xkaW5mby0+ZmJjb25fcGFyKTsNCj4gLQkJb2xkaW5mby0+ZmJj
b25fcGFyID0gTlVMTDsNCj4gLQkJbW9kdWxlX3B1dChvbGRpbmZvLT5mYm9wcy0+b3duZXIp
Ow0KPiAtCQkvKg0KPiAtCQkgIElmIG9sZGluZm8gYW5kIG5ld2luZm8gYXJlIGRyaXZpbmcg
dGhlIHNhbWUgaGFyZHdhcmUsDQo+IC0JCSAgdGhlIGZiX3JlbGVhc2UoKSBtZXRob2Qgb2Yg
b2xkaW5mbyBtYXkgYXR0ZW1wdCB0bw0KPiAtCQkgIHJlc3RvcmUgdGhlIGhhcmR3YXJlIHN0
YXRlLiAgVGhpcyB3aWxsIGxlYXZlIHRoZQ0KPiAtCQkgIG5ld2luZm8gaW4gYW4gdW5kZWZp
bmVkIHN0YXRlLiBUaHVzLCBhIGNhbGwgdG8NCj4gLQkJICBmYl9zZXRfcGFyKCkgbWF5IGJl
IG5lZWRlZCBmb3IgdGhlIG5ld2luZm8uDQo+IC0JCSovDQo+IC0JCWlmIChuZXdpbmZvICYm
IG5ld2luZm8tPmZib3BzLT5mYl9zZXRfcGFyKSB7DQo+IC0JCQlyZXQgPSBuZXdpbmZvLT5m
Ym9wcy0+ZmJfc2V0X3BhcihuZXdpbmZvKTsNCj4gKwlmYmNvbl9kZWxfY3Vyc29yX3dvcmso
b2xkaW5mbyk7DQo+ICsJa2ZyZWUob3BzLT5jdXJzb3Jfc3RhdGUubWFzayk7DQo+ICsJa2Zy
ZWUob3BzLT5jdXJzb3JfZGF0YSk7DQo+ICsJa2ZyZWUob3BzLT5jdXJzb3Jfc3JjKTsNCj4g
KwlrZnJlZShvcHMtPmZvbnRidWZmZXIpOw0KPiArCWtmcmVlKG9sZGluZm8tPmZiY29uX3Bh
cik7DQo+ICsJb2xkaW5mby0+ZmJjb25fcGFyID0gTlVMTDsNCj4gKwkvKg0KPiArCSAgSWYg
b2xkaW5mbyBhbmQgbmV3aW5mbyBhcmUgZHJpdmluZyB0aGUgc2FtZSBoYXJkd2FyZSwNCj4g
KwkgIHRoZSBmYl9yZWxlYXNlKCkgbWV0aG9kIG9mIG9sZGluZm8gbWF5IGF0dGVtcHQgdG8N
Cj4gKwkgIHJlc3RvcmUgdGhlIGhhcmR3YXJlIHN0YXRlLiAgVGhpcyB3aWxsIGxlYXZlIHRo
ZQ0KPiArCSAgbmV3aW5mbyBpbiBhbiB1bmRlZmluZWQgc3RhdGUuIFRodXMsIGEgY2FsbCB0
bw0KPiArCSAgZmJfc2V0X3BhcigpIG1heSBiZSBuZWVkZWQgZm9yIHRoZSBuZXdpbmZvLg0K
PiArCSovDQo+ICsJaWYgKG5ld2luZm8gJiYgbmV3aW5mby0+ZmJvcHMtPmZiX3NldF9wYXIp
IHsNCj4gKwkJcmV0ID0gbmV3aW5mby0+ZmJvcHMtPmZiX3NldF9wYXIobmV3aW5mbyk7DQo+
ICAgDQo+IC0JCQlpZiAocmV0KQ0KPiAtCQkJCXByaW50ayhLRVJOX0VSUiAiY29uMmZiX3Jl
bGVhc2Vfb2xkaW5mbzogIg0KPiAtCQkJCQkiZGV0ZWN0ZWQgdW5oYW5kbGVkIGZiX3NldF9w
YXIgZXJyb3IsICINCj4gLQkJCQkJImVycm9yIGNvZGUgJWRcbiIsIHJldCk7DQo+IC0JCX0N
Cj4gKwkJaWYgKHJldCkNCj4gKwkJCXByaW50ayhLRVJOX0VSUiAiY29uMmZiX3JlbGVhc2Vf
b2xkaW5mbzogIg0KPiArCQkJCSJkZXRlY3RlZCB1bmhhbmRsZWQgZmJfc2V0X3BhciBlcnJv
ciwgIg0KPiArCQkJCSJlcnJvciBjb2RlICVkXG4iLCByZXQpOw0KPiAgIAl9DQo+ICAgDQo+
IC0JcmV0dXJuIGVycjsNCj4gKwlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGlj
IHZvaWQgY29uMmZiX2luaXRfZGlzcGxheShzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBm
Yl9pbmZvICppbmZvLA0KPiBAQCAtOTE5LDcgKzkyNiw2IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICpmYmNvbl9zdGFydHVwKHZvaWQpDQo+ICAgCXN0cnVjdCBmYmNvbl9kaXNwbGF5ICpwID0g
JmZiX2Rpc3BsYXlbZmdfY29uc29sZV07DQo+ICAgCXN0cnVjdCB2Y19kYXRhICp2YyA9IHZj
X2NvbnNbZmdfY29uc29sZV0uZDsNCj4gICAJY29uc3Qgc3RydWN0IGZvbnRfZGVzYyAqZm9u
dCA9IE5VTEw7DQo+IC0Jc3RydWN0IG1vZHVsZSAqb3duZXI7DQo+ICAgCXN0cnVjdCBmYl9p
bmZvICppbmZvID0gTlVMTDsNCj4gICAJc3RydWN0IGZiY29uX29wcyAqb3BzOw0KPiAgIAlp
bnQgcm93cywgY29sczsNCj4gQEAgLTkzOCwxNyArOTQ0LDEyIEBAIHN0YXRpYyBjb25zdCBj
aGFyICpmYmNvbl9zdGFydHVwKHZvaWQpDQo+ICAgCWlmICghaW5mbykNCj4gICAJCXJldHVy
biBOVUxMOw0KPiAgIAkNCj4gLQlvd25lciA9IGluZm8tPmZib3BzLT5vd25lcjsNCj4gLQlp
ZiAoIXRyeV9tb2R1bGVfZ2V0KG93bmVyKSkNCj4gKwlpZiAoZmJjb25fb3BlbihpbmZvKSkN
Cj4gICAJCXJldHVybiBOVUxMOw0KPiAtCWlmIChpbmZvLT5mYm9wcy0+ZmJfb3BlbiAmJiBp
bmZvLT5mYm9wcy0+ZmJfb3BlbihpbmZvLCAwKSkgew0KPiAtCQltb2R1bGVfcHV0KG93bmVy
KTsNCj4gLQkJcmV0dXJuIE5VTEw7DQo+IC0JfQ0KPiAgIA0KPiAgIAlvcHMgPSBremFsbG9j
KHNpemVvZihzdHJ1Y3QgZmJjb25fb3BzKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghb3Bz
KSB7DQo+IC0JCW1vZHVsZV9wdXQob3duZXIpOw0KPiArCQlmYmNvbl9yZWxlYXNlKGluZm8p
Ow0KPiAgIAkJcmV0dXJuIE5VTEw7DQo+ICAgCX0NCj4gICANCj4gQEAgLTMzMTQsMTAgKzMz
MTUsNiBAQCBzdGF0aWMgdm9pZCBmYmNvbl9leGl0KHZvaWQpDQo+ICAgCQl9DQo+ICAgDQo+
ICAgCQlpZiAobWFwcGVkKSB7DQo+IC0JCQlpZiAoaW5mby0+ZmJvcHMtPmZiX3JlbGVhc2Up
DQo+IC0JCQkJaW5mby0+ZmJvcHMtPmZiX3JlbGVhc2UoaW5mbywgMCk7DQo+IC0JCQltb2R1
bGVfcHV0KGluZm8tPmZib3BzLT5vd25lcik7DQo+IC0NCj4gICAJCQlpZiAoaW5mby0+ZmJj
b25fcGFyKSB7DQo+ICAgCQkJCXN0cnVjdCBmYmNvbl9vcHMgKm9wcyA9IGluZm8tPmZiY29u
X3BhcjsNCj4gICANCj4gQEAgLTMzMjcsNiArMzMyNCw4IEBAIHN0YXRpYyB2b2lkIGZiY29u
X2V4aXQodm9pZCkNCj4gICAJCQkJa2ZyZWUoaW5mby0+ZmJjb25fcGFyKTsNCj4gICAJCQkJ
aW5mby0+ZmJjb25fcGFyID0gTlVMTDsNCj4gICAJCQl9DQo+ICsNCj4gKwkJCWZiY29uX3Jl
bGVhc2UoaW5mbyk7DQo+ICAgCQl9DQo+ICAgCX0NCj4gICB9DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------Ccrl9Q40nCGG0sIoEhWD8XPt--

--------------RkY0IrZQ3WkKljA7QxQi90Px
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE+xgFAwAAAAAACgkQlh/E3EQov+Dl
lQ//ew0vHDNrFJ7f1u7x7/P1BPZELT8Unw/ixa2NBm8PmnBDqLoqgdBWq1B69chdDAkWrXpJ0daA
rYa2fvLYFb1pA5pw9TgdFNgYUAP2fWgIMZntmPXXGCnrYVvtH24fxvnBrgGNY80oyarzAYxG0Qne
yp6mlTXyNlZWL1hr++C7WvlepB2sqLnN8k+J7wlPaIzZ7GxkxlOCzWQeCHWwXhflIL6PFH7n+U5f
Nata8mppbuVFeYC2vzkGRirK1IJAe8y9TU41rovH70oL79tp5pjMqCXOMXQELM5WRHtZ3iEaT32Q
8PCXzybJjDrMRfjlGcpieephzT5IQa9WlBQRCDp7lDcIrwp9nbcu+cJw+mSxLrnpLDlpNfq7Ny3A
G8727FevorIEYdJB+CfhSEs+M7KJO0eTfeYIY4T3PckE7EuSxjc+ktkarSnqDJ1L5gAFxcmKF5Ek
5+USz/muT1OjomuEPvbcaubG3pckxkPBufhf5iDbY/j7HyNdwfaCnZq8VJeyPr3RbhXISHDOZn6Q
zijZbpwS1SSp4sBE4wHqx17kUUqE3AMsaWUAxt1Nmzrat5/LjidW65WSJBCipfSTtTlaJBx/Z1Lj
RuMQcL33R1STxjQAr8Er4F9fLUGKxMCT6ckqb3rVtOKFs+0d9vRBdGweG2aF+hG0AxEjQFksvLNu
x08=
=zdZR
-----END PGP SIGNATURE-----

--------------RkY0IrZQ3WkKljA7QxQi90Px--
