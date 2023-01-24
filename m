Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D5679695
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 12:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1C410E66F;
	Tue, 24 Jan 2023 11:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364B10E66B;
 Tue, 24 Jan 2023 11:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70B1C1FE1C;
 Tue, 24 Jan 2023 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674559675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKTcWvYfzarAx/J9sZK5jWG0nno1Hz0lr0ojPVSgZn4=;
 b=0PvqefILpzlTczOZVSPZ/aZZ5E19WzuQ+WK/ZV9PlTEn08cU9cgV394Lr2oZyyJwuR2/Ur
 cLbvafxhju4muRZyGJVMooA8p2hIcMVLc0R80jHh4ab4Kmjg9P4t3Gx0/liw/4yPPl8Y+m
 uE7WkzAzNBPCWUKivlchNE7F3x7S5EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674559675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKTcWvYfzarAx/J9sZK5jWG0nno1Hz0lr0ojPVSgZn4=;
 b=/aln6QAHc4U5BRIDYFhLmz/ah1AxM7WEEmVWUMoJ+TDSJt0rh620oL4pTR2Lm95pjZ9T4i
 7k88p/2tdWSCCaCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3988813487;
 Tue, 24 Jan 2023 11:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fs7TDLvAz2OFGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 11:27:55 +0000
Message-ID: <3f76ab52-a323-beeb-7653-7cae2e7090e0@suse.de>
Date: Tue, 24 Jan 2023 12:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to
 'info'
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230123100559.12351-1-tzimmermann@suse.de>
 <20230123100559.12351-11-tzimmermann@suse.de> <Y87zMk0sJc6EOG/6@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y87zMk0sJc6EOG/6@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N2fEP60NvUQVfwxyo66rF97p"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N2fEP60NvUQVfwxyo66rF97p
Content-Type: multipart/mixed; boundary="------------mc4XDdYDYqZ8YQuTWaL0vCeu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <3f76ab52-a323-beeb-7653-7cae2e7090e0@suse.de>
Subject: Re: [PATCH 10/10] drm/fbdev-generic: Rename struct fb_info 'fbi' to
 'info'
References: <20230123100559.12351-1-tzimmermann@suse.de>
 <20230123100559.12351-11-tzimmermann@suse.de> <Y87zMk0sJc6EOG/6@ravnborg.org>
In-Reply-To: <Y87zMk0sJc6EOG/6@ravnborg.org>

--------------mc4XDdYDYqZ8YQuTWaL0vCeu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjMgdW0gMjE6NTAgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IGEgcXVpY2sgZHJpdmUtYnkgY29tbWVudC4NCj4gDQo+IE9uIE1v
biwgSmFuIDIzLCAyMDIzIGF0IDExOjA1OjU5QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4gVGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIG5hbWVzIHZhcmlhYmxl
cyBvZiB0eXBlIHN0cnVjdCBmYl9pbmZvDQo+PiBib3RoICdmYmknIGFuZCAnaW5mbycuIFRo
ZSBsYXR0ZXIgc2VlbXMgdG8gYmUgbW9yZSBjb21tb24gaW4gZmJkZXYNCj4+IGNvZGUsIHNv
IG5hbWUgZmJpIGFjY29yZGluZ2x5Lg0KPj4NCj4+IEFsc28gcmVwbGFjZSB0aGUgZHVwbGlj
YXRlIHZhcmlhYmxlIGluIGRybV9mYmRldl9mYl9kZXN0cm95KCkuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCA0OSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9m
YmRldl9nZW5lcmljLmMNCj4+IGluZGV4IDQ5YTBiYmE4NmNlNy4uNzYzM2RhNWMxM2MzIDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+PiBAQCAtNDYs
MTcgKzQ2LDE2IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2ZiX3JlbGVhc2Uoc3RydWN0IGZi
X2luZm8gKmluZm8sIGludCB1c2VyKQ0KPj4gICBzdGF0aWMgdm9pZCBkcm1fZmJkZXZfZmJf
ZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4+ICAgew0KPj4gICAJc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmZiX2hlbHBlciA9IGluZm8tPnBhcjsNCj4+IC0Jc3RydWN0IGZiX2lu
Zm8gKmZiaSA9IGZiX2hlbHBlci0+aW5mbzsNCj4+ICAgCXZvaWQgKnNoYWRvdyA9IE5VTEw7
DQo+PiAgIA0KPj4gICAJaWYgKCFmYl9oZWxwZXItPmRldikNCj4+ICAgCQlyZXR1cm47DQo+
PiAgIA0KPj4gLQlpZiAoZmJpKSB7DQo+PiAtCQlpZiAoZmJpLT5mYmRlZmlvKQ0KPj4gLQkJ
CWZiX2RlZmVycmVkX2lvX2NsZWFudXAoZmJpKTsNCj4+ICsJaWYgKGluZm8pIHsNCj4gQXMg
aW5mbyBpcyBhbHJlYWR5IHVzZWQgYWJvdmUgdG8gZmluZCBmYl9oZWxwZXIsIHRoaXMgY2hl
Y2sgaXMNCj4gcmVkdW5kYW50Lg0KDQpPaCBpbmRlZWQ7IHdpbGwgZml4LiBUaGlzIGNoYW5n
ZSBiZWxvbmdzIHRvIHBhdGNoIDgsIHdoaWNoIHN0cmVhbWxpbmVzIA0KdGhlIGNsZWFudXAg
YSBiaXQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IAlTYW0NCj4gDQo+PiAr
CQlpZiAoaW5mby0+ZmJkZWZpbykNCj4+ICsJCQlmYl9kZWZlcnJlZF9pb19jbGVhbnVwKGlu
Zm8pOw0KPj4gICAJCWlmIChkcm1fZmJkZXZfdXNlX3NoYWRvd19mYihmYl9oZWxwZXIpKQ0K
Pj4gLQkJCXNoYWRvdyA9IGZiaS0+c2NyZWVuX2J1ZmZlcjsNCj4+ICsJCQlzaGFkb3cgPSBp
bmZvLT5zY3JlZW5fYnVmZmVyOw0KPj4gICAJfQ0KPj4gICANCj4+ICAgCWRybV9mYl9oZWxw
ZXJfZmluaShmYl9oZWxwZXIpOw0KPj4gQEAgLTE3Myw3ICsxNzIsNyBAQCBzdGF0aWMgaW50
IGRybV9mYmRldl9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0K
Pj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGZiX2hlbHBlci0+ZGV2Ow0KPj4gICAJ
c3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXI7DQo+PiAgIAlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYjsNCj4+IC0Jc3RydWN0IGZiX2luZm8gKmZiaTsNCj4+ICsJc3RydWN0
IGZiX2luZm8gKmluZm87DQo+PiAgIAl1MzIgZm9ybWF0Ow0KPj4gICAJc3RydWN0IGlvc3lz
X21hcCBtYXA7DQo+PiAgIAlpbnQgcmV0Ow0KPj4gQEAgLTE5MiwzNSArMTkxLDM1IEBAIHN0
YXRpYyBpbnQgZHJtX2ZiZGV2X2ZiX3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9o
ZWxwZXIsDQo+PiAgIAlmYl9oZWxwZXItPmZiID0gYnVmZmVyLT5mYjsNCj4+ICAgCWZiID0g
YnVmZmVyLT5mYjsNCj4+ICAgDQo+PiAtCWZiaSA9IGRybV9mYl9oZWxwZXJfYWxsb2NfaW5m
byhmYl9oZWxwZXIpOw0KPj4gLQlpZiAoSVNfRVJSKGZiaSkpDQo+PiAtCQlyZXR1cm4gUFRS
X0VSUihmYmkpOw0KPj4gKwlpbmZvID0gZHJtX2ZiX2hlbHBlcl9hbGxvY19pbmZvKGZiX2hl
bHBlcik7DQo+PiArCWlmIChJU19FUlIoaW5mbykpDQo+PiArCQlyZXR1cm4gUFRSX0VSUihp
bmZvKTsNCj4+ICAgDQo+PiAtCWZiaS0+ZmJvcHMgPSAmZHJtX2ZiZGV2X2ZiX29wczsNCj4+
IC0JZmJpLT5zY3JlZW5fc2l6ZSA9IHNpemVzLT5zdXJmYWNlX2hlaWdodCAqIGZiLT5waXRj
aGVzWzBdOw0KPj4gLQlmYmktPmZpeC5zbWVtX2xlbiA9IGZiaS0+c2NyZWVuX3NpemU7DQo+
PiAtCWZiaS0+ZmxhZ3MgPSBGQklORk9fREVGQVVMVDsNCj4+ICsJaW5mby0+ZmJvcHMgPSAm
ZHJtX2ZiZGV2X2ZiX29wczsNCj4+ICsJaW5mby0+c2NyZWVuX3NpemUgPSBzaXplcy0+c3Vy
ZmFjZV9oZWlnaHQgKiBmYi0+cGl0Y2hlc1swXTsNCj4+ICsJaW5mby0+Zml4LnNtZW1fbGVu
ID0gaW5mby0+c2NyZWVuX3NpemU7DQo+PiArCWluZm8tPmZsYWdzID0gRkJJTkZPX0RFRkFV
TFQ7DQo+PiAgIA0KPj4gLQlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhmYmksIGZiX2hlbHBl
ciwgc2l6ZXMpOw0KPj4gKwlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhpbmZvLCBmYl9oZWxw
ZXIsIHNpemVzKTsNCj4+ICAgDQo+PiAgIAlpZiAoZHJtX2ZiZGV2X3VzZV9zaGFkb3dfZmIo
ZmJfaGVscGVyKSkgew0KPj4gLQkJZmJpLT5zY3JlZW5fYnVmZmVyID0gdnphbGxvYyhmYmkt
PnNjcmVlbl9zaXplKTsNCj4+IC0JCWlmICghZmJpLT5zY3JlZW5fYnVmZmVyKQ0KPj4gKwkJ
aW5mby0+c2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2MoaW5mby0+c2NyZWVuX3NpemUpOw0KPj4g
KwkJaWYgKCFpbmZvLT5zY3JlZW5fYnVmZmVyKQ0KPj4gICAJCQlyZXR1cm4gLUVOT01FTTsN
Cj4+IC0JCWZiaS0+ZmxhZ3MgfD0gRkJJTkZPX1ZJUlRGQiB8IEZCSU5GT19SRUFEU19GQVNU
Ow0KPj4gKwkJaW5mby0+ZmxhZ3MgfD0gRkJJTkZPX1ZJUlRGQiB8IEZCSU5GT19SRUFEU19G
QVNUOw0KPj4gICANCj4+IC0JCWZiaS0+ZmJkZWZpbyA9ICZkcm1fZmJkZXZfZGVmaW87DQo+
PiAtCQlmYl9kZWZlcnJlZF9pb19pbml0KGZiaSk7DQo+PiArCQlpbmZvLT5mYmRlZmlvID0g
JmRybV9mYmRldl9kZWZpbzsNCj4+ICsJCWZiX2RlZmVycmVkX2lvX2luaXQoaW5mbyk7DQo+
PiAgIAl9IGVsc2Ugew0KPj4gICAJCS8qIGJ1ZmZlciBpcyBtYXBwZWQgZm9yIEhXIGZyYW1l
YnVmZmVyICovDQo+PiAgIAkJcmV0ID0gZHJtX2NsaWVudF9idWZmZXJfdm1hcChmYl9oZWxw
ZXItPmJ1ZmZlciwgJm1hcCk7DQo+PiAgIAkJaWYgKHJldCkNCj4+ICAgCQkJcmV0dXJuIHJl
dDsNCj4+ICAgCQlpZiAobWFwLmlzX2lvbWVtKSB7DQo+PiAtCQkJZmJpLT5zY3JlZW5fYmFz
ZSA9IG1hcC52YWRkcl9pb21lbTsNCj4+ICsJCQlpbmZvLT5zY3JlZW5fYmFzZSA9IG1hcC52
YWRkcl9pb21lbTsNCj4+ICAgCQl9IGVsc2Ugew0KPj4gLQkJCWZiaS0+c2NyZWVuX2J1ZmZl
ciA9IG1hcC52YWRkcjsNCj4+IC0JCQlmYmktPmZsYWdzIHw9IEZCSU5GT19WSVJURkI7DQo+
PiArCQkJaW5mby0+c2NyZWVuX2J1ZmZlciA9IG1hcC52YWRkcjsNCj4+ICsJCQlpbmZvLT5m
bGFncyB8PSBGQklORk9fVklSVEZCOw0KPj4gICAJCX0NCj4+ICAgDQo+PiAgIAkJLyoNCj4+
IEBAIC0yMjksMTAgKzIyOCwxMCBAQCBzdGF0aWMgaW50IGRybV9mYmRldl9mYl9wcm9iZShz
dHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0KPj4gICAJCSAqIGNhc2UuDQo+PiAg
IAkJICovDQo+PiAgICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fRkJERVZfTEVBS19QSFlT
X1NNRU0pDQo+PiAtCQlpZiAoZmJfaGVscGVyLT5oaW50X2xlYWtfc21lbV9zdGFydCAmJiBm
YmktPmZpeC5zbWVtX3N0YXJ0ID09IDAgJiYNCj4+ICsJCWlmIChmYl9oZWxwZXItPmhpbnRf
bGVha19zbWVtX3N0YXJ0ICYmIGluZm8tPmZpeC5zbWVtX3N0YXJ0ID09IDAgJiYNCj4+ICAg
CQkgICAgIWRybV9XQVJOX09OX09OQ0UoZGV2LCBtYXAuaXNfaW9tZW0pKQ0KPj4gLQkJCWZi
aS0+Zml4LnNtZW1fc3RhcnQgPQ0KPj4gLQkJCQlwYWdlX3RvX3BoeXModmlydF90b19wYWdl
KGZiaS0+c2NyZWVuX2J1ZmZlcikpOw0KPj4gKwkJCWluZm8tPmZpeC5zbWVtX3N0YXJ0ID0N
Cj4+ICsJCQkJcGFnZV90b19waHlzKHZpcnRfdG9fcGFnZShpbmZvLT5zY3JlZW5fYnVmZmVy
KSk7DQo+PiAgICNlbmRpZg0KPj4gICAJfQ0KPj4gICANCj4+IC0tIA0KPj4gMi4zOS4wDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------mc4XDdYDYqZ8YQuTWaL0vCeu--

--------------N2fEP60NvUQVfwxyo66rF97p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPPwLoFAwAAAAAACgkQlh/E3EQov+CL
pQ//Y3D+WYek+AENl77tB8/9us2T+1CxJrW6yldrweG9W43IzIRbNbpN8T/yWbLwSmBU/RSCTimg
S4/HP2u4UWDro/Oy2N87mgTSHZvj7kcKKPRFKY6EItXTF3GutzF/WJZefYvCgMvrzfgJItYxk41X
0M3okJ91nrxv8e7sJbR2PwzkJZiL+nWv//wjZFz3iCGgaLreZMsY7k2CSwv7RLjNmpTD3jp3Z2kS
ED+bn+UWKT8AZiDSStBe9aaciv4iop2vffyGjjwoUU7xDG3f4PxXwAawt4YQanLJRs7E02mjyJ2O
CYco7ZmYL02zxdB8YInHYhvSMB4H1PKT1+mGEsd0gMjDz2T8mZSj74Eqqscpqc2VIcpv/tB6/IfK
jrmv9g1lgmrSAQQH30kv9DWZqIBWdsjGHqRpthB/cn5q42jlbdFgcX5XL2g7j9WIAJSUiGQR9bir
VwAMr51uRJ7UKAsLXKSSVuRxEAaB0k40hbTTaYQiL4j/mfV3qW2r1SuobZM64chu6yIRQuknEPX8
ayfswasnXLeO3Iyz1yWBXB0J5S5Z3P1D2iNrGF8sjaQkDR6Tls3DuvBafHJQxJ/80bQHYXK1ES9v
pgiz4OAMqqF/TvI4ALjvhG+UfbEdhpT5kkCRcb4g6IEREJg/hlT3RI7JAmMijS7y6Oi4FeKxgiwJ
7ao=
=LhBW
-----END PGP SIGNATURE-----

--------------N2fEP60NvUQVfwxyo66rF97p--
