Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDA544AF9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 13:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A211B62A;
	Thu,  9 Jun 2022 11:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302E711B62A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 11:49:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0D8821E5B;
 Thu,  9 Jun 2022 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654775385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zbRtkE6dAO1ZfKxMLV0aLoDrahVJhhxRZHHv+/+QQo=;
 b=WjL8N9ziPcndNW76Xkkh/1HnbwzX6liqZ4tr5FjqW2UJh6/0XnSRiOJgWqPBogCZicpWqW
 Y2JNgeDWmXhpWX+R+AAOcLE2gMwtiLPyksATXion1YP5Y/rtM67H1pxLu01JZTZVCwtdxS
 3gzxwYlqRndhiY7iexWVZdAYK7rrIFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654775385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zbRtkE6dAO1ZfKxMLV0aLoDrahVJhhxRZHHv+/+QQo=;
 b=o/YXtQPpkC/4TWvchhCPjfhw9uEv+Y0wW4xcg/7fDnnxHD2/NTS7KNRlyNHwUXqUut9paw
 V5A2emynYGcupFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A00613456;
 Thu,  9 Jun 2022 11:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B3ncGFneoWL/KgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Jun 2022 11:49:45 +0000
Message-ID: <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
Date: Thu, 9 Jun 2022 13:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 5/5] fbdev: Make registered_fb[] private to fbmem.c
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-6-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220607182338.344270-6-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h30n2Gk0k6j807HynOJysoNe"
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 kvm@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Nettleton <jon.nettleton@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Jens Frederich <jfrederich@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Matthew Wilcox <willy@infradead.org>, Laszlo Ersek <lersek@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h30n2Gk0k6j807HynOJysoNe
Content-Type: multipart/mixed; boundary="------------b0PKtb0polToSaY7LNTtKx9u";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, kvm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, kernel test robot <lkp@intel.com>,
 Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, linux-staging@lists.linux.dev,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Matthew Wilcox <willy@infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, linux-fbdev@vger.kernel.org,
 Zheyu Ma <zheyuma97@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
Subject: Re: [PATCH v6 5/5] fbdev: Make registered_fb[] private to fbmem.c
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-6-javierm@redhat.com>
In-Reply-To: <20220607182338.344270-6-javierm@redhat.com>

--------------b0PKtb0polToSaY7LNTtKx9u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA3LjA2LjIyIHVtIDIwOjIzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPg0KPiANCj4gV2VsbCBleGNlcHQgd2hlbiB0aGUgb2xwYyBkY29uIGZiZGV2IGRy
aXZlciBpcyBlbmFibGVkLCB0aGF0IHRoaW5nDQo+IGRpZ3MgYXJvdW5kIGluIHRoZXJlIGlu
IHJhdGhlciB1bmZpeGFibGUgd2F5cy4NCg0KVGhlcmUgaXMgZmJfY2xpZW50X3JlZ2lzdGVy
KCkgdG8gc2V0IHVwIGEgJ2NsaWVudCcgb24gdG9wIG9mIGFuIGZiZGV2LiANClRoZSBjbGll
bnQgd291bGQgdGhlbiBnZXQgbWVzc2FnZXMgYWJvdXQgbW9kZXNldHRpbmcsIGJsYW5rcywg
cmVtb3ZhbHMsIA0KZXRjLiBCdXQgeW91J2QgcHJvYmFibHkgbmVlZCBhbiBPTFBDIHRvIGNv
bnZlcnQgZGNvbiwgYW5kIHRoZSBtZWNoYW5pc20gDQppdHNlbGYgaXMgc29tZXdoYXQgdW5s
b3ZlZCB0aGVzZSBkYXlzLg0KDQpZb3VyIHBhdGNoIGNvbXBsaWNhdGVzIHRoZSBmYmRldiBj
b2RlIEFGQUlDVC4gU28gSSdkIGVpdGhlciBkcm9wIGl0IG9yLCANCmV2ZW4gYmV0dGVyLCBi
dWlsZCBhIG5pY2VyIGludGVyZmFjZSBmb3IgZGNvbi4NCg0KVGhlIGRjb24gZHJpdmVyIGFw
cGVhcnMgdG8gbG9vayBvbmx5IGF0IHRoZSBmaXJzdCBlbnRyeS4gTWF5YmUgYWRkIA0KZmJf
aW5mb19nZXRfYnlfaW5kZXgoKSBhbmQgZmJfaW5mb19wdXQoKSBhbmQgZXhwb3J0IHRob3Nl
LiBUaGV5IHdvdWxkIGJlIA0KdHJpdmlhbCB3cmFwcGVycyBzb21ld2hlcmUgaW4gZmJtZW0u
YzoNCg0KI2lmIElTX0VOQUJMRUQoQ09ORklHX0ZCX09MUENfRENPTikNCnN0cnVjdCBmYl9p
bmZvICpmYl9pbmZvX2dldF9ieV9pbmRleCh1bnNpZ25lZCBpbnQgaW5kZXgpDQp7DQoJcmV0
dXJuIGdldF9mYl9pbmZvKGluZGV4KTsNCn0NCkVYUE9SVF9TWU1CT0woKQ0Kdm9pZCBmYl9p
bmZvX3B1dChzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykNCnsNCglwdXRfZmJfaW5mbyhmYl9p
bmZvKTsNCn0NCkVYUE9SVF9TWU1CT0woKQ0KI2VuZGlmDQoNCkluIGRjb24gaXRzZWxmLCB1
c2luZyB0aGUgbmV3IGludGVyZmFjZXMgd2lsbCBhY3R1YWxseSBhY3F1aXJlIGEgDQpyZWZl
cmVuY2UgdG8ga2VlcCB0aGUgZGlzcGxheSBhbGl2ZS4gVGhlIGNvZGUgYXQgWzFdIGNvdWxk
IGJlIHJlcGxhY2VkLiANCkFuZCBhIGNhbGwgdG8gZmJfaW5mb19wdXQoKSBuZWVkcyB0byBn
byBpbnRvIGRjb25fcmVtb3ZlKCkuIFsyXQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpb
MV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOC4yL3NvdXJjZS9k
cml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jI0w2MDUNClsyXSANCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LjIvc291cmNlL2RyaXZlcnMvc3Rh
Z2luZy9vbHBjX2Rjb24vb2xwY19kY29uLmMjTDY4OA0KDQo+IA0KPiBDYyBvbGRjX2Rjb24g
bWFpbnRhaW5lcnMgYXMgZnlpLg0KPiANCj4gdjI6IEkgdHlwb2VkIHRoZSBjb25maWcgbmFt
ZSAoMGRheSkNCj4gDQo+IENjOiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4N
Cj4gQ2M6IEplbnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNoQGdtYWlsLmNvbT4NCj4gQ2M6IEpv
biBOZXR0bGV0b24gPGpvbi5uZXR0bGV0b25AZ21haWwuY29tPg0KPiBDYzogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LXN0
YWdpbmdAbGlzdHMubGludXguZGV2DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1h
cnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IENjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXgu
ZGU+DQo+IENjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gQ2M6IFRldHN1byBIYW5kYSA8
cGVuZ3Vpbi1rZXJuZWxAaS1sb3ZlLnNha3VyYS5uZS5qcD4NCj4gQ2M6IFpoZW4gTGVpIDx0
aHVuZGVyLmxlaXpoZW5AaHVhd2VpLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFhpeXUgWWFuZyA8eGl5dXlhbmcxOUBmdWRh
bi5lZHUuY24+DQo+IENjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFpo
ZXl1IE1hIDx6aGV5dW1hOTdAZ21haWwuY29tPg0KPiBDYzogR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiAobm8gY2hhbmdlcyBz
aW5jZSB2MSkNCj4gDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgfCA4
ICsrKysrKy0tDQo+ICAgaW5jbHVkZS9saW51eC9mYi5oICAgICAgICAgICAgICAgfCA3ICsr
Ky0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
ZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+IGluZGV4IGUwNzIw
ZmVmMGVlNi4uYmRiMDhiNjY1YjQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
ZW0uYw0KPiBAQCAtNTAsMTAgKzUwLDE0IEBADQo+ICAgc3RhdGljIERFRklORV9NVVRFWChy
ZWdpc3RyYXRpb25fbG9jayk7DQo+ICAgDQo+ICAgc3RydWN0IGZiX2luZm8gKnJlZ2lzdGVy
ZWRfZmJbRkJfTUFYXSBfX3JlYWRfbW9zdGx5Ow0KPiAtRVhQT1JUX1NZTUJPTChyZWdpc3Rl
cmVkX2ZiKTsNCj4gLQ0KPiAgIGludCBudW1fcmVnaXN0ZXJlZF9mYiBfX3JlYWRfbW9zdGx5
Ow0KPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0ZCX09MUENfRENPTikNCj4gK0VYUE9SVF9T
WU1CT0wocmVnaXN0ZXJlZF9mYik7DQo+ICAgRVhQT1JUX1NZTUJPTChudW1fcmVnaXN0ZXJl
ZF9mYik7DQo+ICsjZW5kaWYNCj4gKyNkZWZpbmUgZm9yX2VhY2hfcmVnaXN0ZXJlZF9mYihp
KQkJXA0KPiArCWZvciAoaSA9IDA7IGkgPCBGQl9NQVg7IGkrKykJCVwNCj4gKwkJaWYgKCFy
ZWdpc3RlcmVkX2ZiW2ldKSB7fSBlbHNlDQo+ICAgDQo+ICAgYm9vbCBmYl9jZW50ZXJfbG9n
byBfX3JlYWRfbW9zdGx5Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9m
Yi5oIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IGluZGV4IGJiZTFlNDU3MTg5OS4uYzU2M2Uy
NGI2MjkzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gKysrIGIvaW5j
bHVkZS9saW51eC9mYi5oDQo+IEBAIC02MzIsMTYgKzYzMiwxNSBAQCBleHRlcm4gaW50IGZi
X2dldF9jb2xvcl9kZXB0aChzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhciwNCj4gICBl
eHRlcm4gaW50IGZiX2dldF9vcHRpb25zKGNvbnN0IGNoYXIgKm5hbWUsIGNoYXIgKipvcHRp
b24pOw0KPiAgIGV4dGVybiBpbnQgZmJfbmV3X21vZGVsaXN0KHN0cnVjdCBmYl9pbmZvICpp
bmZvKTsNCj4gICANCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19GQl9PTFBDX0RDT04pDQo+
ICAgZXh0ZXJuIHN0cnVjdCBmYl9pbmZvICpyZWdpc3RlcmVkX2ZiW0ZCX01BWF07DQo+ICsN
Cj4gICBleHRlcm4gaW50IG51bV9yZWdpc3RlcmVkX2ZiOw0KPiArI2VuZGlmDQo+ICAgZXh0
ZXJuIGJvb2wgZmJfY2VudGVyX2xvZ287DQo+ICAgZXh0ZXJuIGludCBmYl9sb2dvX2NvdW50
Ow0KPiAgIGV4dGVybiBzdHJ1Y3QgY2xhc3MgKmZiX2NsYXNzOw0KPiAgIA0KPiAtI2RlZmlu
ZSBmb3JfZWFjaF9yZWdpc3RlcmVkX2ZiKGkpCQlcDQo+IC0JZm9yIChpID0gMDsgaSA8IEZC
X01BWDsgaSsrKQkJXA0KPiAtCQlpZiAoIXJlZ2lzdGVyZWRfZmJbaV0pIHt9IGVsc2UNCj4g
LQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NrX2ZiX2luZm8oc3RydWN0IGZiX2luZm8g
KmluZm8pDQo+ICAgew0KPiAgIAltdXRleF9sb2NrKCZpbmZvLT5sb2NrKTsNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------b0PKtb0polToSaY7LNTtKx9u--

--------------h30n2Gk0k6j807HynOJysoNe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKh3lkFAwAAAAAACgkQlh/E3EQov+CH
Cg/+LG8G+Sqre6B/3IxpugSeLVF+deiH3nTqW8e52kdjrArS2PqvV9mNkGPArjXn303q3qGYufIs
qMAdCHdKada5GSTeVIeTeI/ax7o3bzTA34LNAxqawfLzZociPYfqrOWMcmNdHkXwUgw5WLd0kV6A
O1bldekvYeVaK5E9/9UTft4UsS7AEsY73uzZ6VLuPh2q0tWe5R3wJ8yCAsq+iizxAlKa/esvqmdQ
K/l9KnKlWoCfqZ451mLSpt3NmIsmlBK+WVjAUVDvB1PQZbV9lMKbl9Jqz3CALnrGh3d8MONsaPna
0MYf/aoNZAlN3aumxxztbs0/2VRUYiyyHgSv/xK+jAdTIJWUtdMQSpwQ8bKNIoTzZJLOPF4g14v2
lxhINJFdKyZgMZAAUJkxXpHYk1Ts9QFuYVmAr/SjjM5nshpdVpKS5HpGO9oKCCvvurx8MtnkbiTZ
Z7QdAXetm9wWPq0DXrEC1CUX/dQmVRIWdNPxGl95hBjyFjBAnIK4KXQb0VO6J9rCLMtJvZsv9kVP
IzG2E7SBfZHrc/hEb+UKDP+1Dl+QK8amMyqLBwuL3oCteGe8YKM3Tv8w6LMaTCP61x1iwYUu35bL
qlVHDWSwHCqL0/IPO6Swcvm87UYCNb6UDlAa+pFc4H9BSNnrSchuVfW8PJ932mROIvkQqcvbFzsD
H40=
=NKus
-----END PGP SIGNATURE-----

--------------h30n2Gk0k6j807HynOJysoNe--
