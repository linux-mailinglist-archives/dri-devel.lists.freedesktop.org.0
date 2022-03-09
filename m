Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE44D2A8E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F3F10E255;
	Wed,  9 Mar 2022 08:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0010E255
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:22:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D55221F381;
 Wed,  9 Mar 2022 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646814153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aEaYFH85UolYbbkxSr0Hj155forrLAIzdAZuh7EIJsw=;
 b=EJ0cfo7i++M+iPoDx8GBe3cACpjAzIVuN9UfH51EzzsYhI6F1sy5QDHAZKRuCdLrhZdIMd
 JRKNUTdB3g99QmfSb2JLNl3j8kdPHKUoEgU6AWTC+9K5jng95rTiLNMEydS28FXwZFZzsp
 EoU7JJ9JqNIjh8AcCi8nCfx+Dskt0tQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646814153;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aEaYFH85UolYbbkxSr0Hj155forrLAIzdAZuh7EIJsw=;
 b=HyoT0T/4ulanTHjSd7aV/Wu7n/Lg++SEa307m0J8tlmjudEUYcu0OHbuyLZh2RtrozQcEb
 s7Fsj+12ZijViLCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95BCE13D79;
 Wed,  9 Mar 2022 08:22:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KFaWIsljKGIAAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 08:22:33 +0000
Message-ID: <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
Date: Wed, 9 Mar 2022 09:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>, daniel@ffwll.ch,
 deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org, sam@ravnborg.org,
 kraxel@redhat.com, ppaalanen@gmail.com
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mKUX4ovKS9DPxXn241Zx9NTr"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mKUX4ovKS9DPxXn241Zx9NTr
Content-Type: multipart/mixed; boundary="------------ic8b9Bunxi1kJc30sg0g5OrI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, daniel@ffwll.ch,
 deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org, sam@ravnborg.org,
 kraxel@redhat.com, ppaalanen@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <a7c8ee6c-185e-916c-c92a-d3b3f4fd9135@suse.de>
Subject: Re: [v3,4/5] fbdev: Improve performance of cfb_imageblit()
References: <20220223193804.18636-5-tzimmermann@suse.de>
 <CGME20220308225225eucas1p12fcdd6e5dc83308b19d51ad7b2a13141@eucas1p1.samsung.com>
 <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>
In-Reply-To: <21110de8-d52a-e55e-8853-1f073c4ab969@samsung.com>

--------------ic8b9Bunxi1kJc30sg0g5OrI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMjM6NTIgc2NocmllYiBNYXJlayBTenlwcm93c2tpOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiAyMy4wMi4yMDIyIDIwOjM4LCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEltcHJvdmUgdGhlIHBlcmZvcm1hbmNlIG9mIGNmYl9pbWFnZWJs
aXQoKSBieSBtYW51YWxseSB1bnJvbGxpbmcNCj4+IHRoZSBpbm5lciBibGl0dGluZyBsb29w
IGFuZCBtb3Zpbmcgc29tZSBpbnZhcmlhbnRzIG91dC4gVGhlIGNvbXBpbGVyDQo+PiBmYWls
ZWQgdG8gZG8gdGhpcyBhdXRvbWF0aWNhbGx5LiBUaGlzIGNoYW5nZSBrZWVwcyBjZmJfaW1h
Z2VibGl0KCkNCj4+IGluIHN5bmMgd2l0aCBzeXNfaW1hZ2ViaXQoKS4NCj4+DQo+PiBBIG1p
Y3JvYmVuY2htYXJrIG1lYXN1cmVzIHRoZSBhdmVyYWdlIG51bWJlciBvZiBDUFUgY3ljbGVz
DQo+PiBmb3IgY2ZiX2ltYWdlYmxpdCgpIGFmdGVyIGEgc3RhYmlsaXppbmcgcGVyaW9kIG9m
IGEgZmV3IG1pbnV0ZXMNCj4+IChpNy00NzkwLCBGdWxsSEQsIHNpbXBsZWRybSwga2VybmVs
IHdpdGggZGVidWdnaW5nKS4NCj4+DQo+PiBjZmJfaW1hZ2VibGl0KCksIG5ldzogMTU3MjQg
Y3ljbGVzDQo+PiBjZmJfaW1hZ2VibGl0KCk6IG9sZDogMzA1NjYgY3ljbGVzDQo+Pg0KPj4g
SW4gdGhlIG9wdGltaXplZCBjYXNlLCBjZmJfaW1hZ2VibGl0KCkgaXMgbm93IH4yeCBmYXN0
ZXIgdGhhbiBiZWZvcmUuDQo+Pg0KPj4gdjM6DQo+PiAJKiBmaXggY29tbWl0IGRlc2NyaXB0
aW9uIChQZWtrYSkNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+DQo+PiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IFRoaXMgcGF0Y2ggbGFuZGVkIHJlY2VudGx5IGlu
IGxpbnV4IG5leHQtMjAyMjAzMDggYXMgY29tbWl0IDBkMDMwMTE4OTRkMg0KPiAoImZiZGV2
OiBJbXByb3ZlIHBlcmZvcm1hbmNlIG9mIGNmYl9pbWFnZWJsaXQoKSIpLiBTYWRseSBpdCBj
YXVzZXMgYQ0KPiBmcmVlemUgYWZ0ZXIgRFJNIGFuZCBlbXVsYXRlZCBmYmRldiBpbml0aWFs
aXphdGlvbiBvbiB2YXJpb3VzIFNhbXN1bmcNCj4gRXh5bm9zIEFSTSAzMmJpdCBiYXNlZCBi
b2FyZHMuIFRoaXMgaGFwcGVucyB3aGVuIGtlcm5lbCBpcyBjb21waWxlZCBmcm9tDQo+IGV4
eW5vc19kZWZjb25maWcuIFN1cnByaXNpbmdseSB3aGVuIGtlcm5lbCBpcyBjb21waWxlZCBm
cm9tDQo+IG11bHRpX3Y3X2RlZmNvbmZpZyBhbGwgdGhvc2UgYm9hcmRzIGJvb3QgZmluZSwg
c28gdGhpcyBpcyBhIG1hdHRlciBvZg0KPiBvbmUgb2YgdGhlIGRlYnVnZ2luZyBvcHRpb25z
IGVuYWJsZWQgaW4gdGhlIGV4eW5vc19kZWZjb25maWcuIEkgd2lsbCB0cnkNCj4gdG8gYW5h
bHl6ZSB0aGlzIGZ1cnRoZXIgYW5kIHNoYXJlIHRoZSByZXN1bHRzLiBSZXZlcnRpbmcgJHN1
YmplY3Qgb24gdG9wDQo+IG9mIG5leHQtMjAyMjAzMDggZml4ZXMgdGhlIGJvb3QgaXNzdWUu
DQoNClRoYW5rcyBmb3IgcmVwb3J0aW5nLiBJIGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlIHRv
IHJlcHJvZHVjZSBpdCBhbmQgDQp0aGVyZSdzIG5vIG9idmlvdXMgZGlmZmVyZW5jZSB0byB0
aGUgb3JpZ2luYWwgdmVyc2lvbi4gSXQncyBzdXBwb3NlZCB0byANCmJlIHRoZSBzYW1lIGFs
Z29yaXRobSB3aXRoIGEgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uLiBVbmxlc3MgeW91IGNh
biANCmZpZ3VyZSBvdXQgdGhlIGlzc3VlLCB3ZSBjYW4gYWxzbyByZXZlcnQgdGhlIHBhdGNo
IGVhc2lseS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPj4gLS0tDQo+PiAgICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvY2ZiaW1nYmx0LmMgfCA1MSArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRl
di9jb3JlL2NmYmltZ2JsdC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2NmYmltZ2Js
dC5jDQo+PiBpbmRleCAwMWIwMWEyNzk2ODEuLjczNjFjZmFiZGQ4NSAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9jZmJpbWdibHQuYw0KPj4gKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2NmYmltZ2JsdC5jDQo+PiBAQCAtMjE4LDIzICsyMTgs
MjkgQEAgc3RhdGljIGlubGluZSB2b2lkIGZhc3RfaW1hZ2VibGl0KGNvbnN0IHN0cnVjdCBm
Yl9pbWFnZSAqaW1hZ2UsIHN0cnVjdCBmYl9pbmZvICoNCj4+ICAgIHsNCj4+ICAgIAl1MzIg
Zmd4ID0gZmdjb2xvciwgYmd4ID0gYmdjb2xvciwgYnBwID0gcC0+dmFyLmJpdHNfcGVyX3Bp
eGVsOw0KPj4gICAgCXUzMiBwcHcgPSAzMi9icHAsIHNwaXRjaCA9IChpbWFnZS0+d2lkdGgg
KyA3KS84Ow0KPj4gLQl1MzIgYml0X21hc2ssIGVuZF9tYXNrLCBlb3J4LCBzaGlmdDsNCj4+
ICsJdTMyIGJpdF9tYXNrLCBlb3J4Ow0KPj4gICAgCWNvbnN0IGNoYXIgKnMgPSBpbWFnZS0+
ZGF0YSwgKnNyYzsNCj4+ICAgIAl1MzIgX19pb21lbSAqZHN0Ow0KPj4gICAgCWNvbnN0IHUz
MiAqdGFiID0gTlVMTDsNCj4+ICsJc2l6ZV90IHRhYmxlbjsNCj4+ICsJdTMyIGNvbG9ydGFi
WzE2XTsNCj4+ICAgIAlpbnQgaSwgaiwgazsNCj4+ICAgIA0KPj4gICAgCXN3aXRjaCAoYnBw
KSB7DQo+PiAgICAJY2FzZSA4Og0KPj4gICAgCQl0YWIgPSBmYl9iZV9tYXRoKHApID8gY2Zi
X3RhYjhfYmUgOiBjZmJfdGFiOF9sZTsNCj4+ICsJCXRhYmxlbiA9IDE2Ow0KPj4gICAgCQli
cmVhazsNCj4+ICAgIAljYXNlIDE2Og0KPj4gICAgCQl0YWIgPSBmYl9iZV9tYXRoKHApID8g
Y2ZiX3RhYjE2X2JlIDogY2ZiX3RhYjE2X2xlOw0KPj4gKwkJdGFibGVuID0gNDsNCj4+ICAg
IAkJYnJlYWs7DQo+PiAgICAJY2FzZSAzMjoNCj4+IC0JZGVmYXVsdDoNCj4+ICAgIAkJdGFi
ID0gY2ZiX3RhYjMyOw0KPj4gKwkJdGFibGVuID0gMjsNCj4+ICAgIAkJYnJlYWs7DQo+PiAr
CWRlZmF1bHQ6DQo+PiArCQlyZXR1cm47DQo+PiAgICAJfQ0KPj4gICAgDQo+PiAgICAJZm9y
IChpID0gcHB3LTE7IGktLTsgKSB7DQo+PiBAQCAtMjQ4LDE1ICsyNTQsNDIgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGZhc3RfaW1hZ2VibGl0KGNvbnN0IHN0cnVjdCBmYl9pbWFnZSAqaW1h
Z2UsIHN0cnVjdCBmYl9pbmZvICoNCj4+ICAgIAllb3J4ID0gZmd4IF4gYmd4Ow0KPj4gICAg
CWsgPSBpbWFnZS0+d2lkdGgvcHB3Ow0KPj4gICAgDQo+PiAtCWZvciAoaSA9IGltYWdlLT5o
ZWlnaHQ7IGktLTsgKSB7DQo+PiAtCQlkc3QgPSAodTMyIF9faW9tZW0gKikgZHN0MSwgc2hp
ZnQgPSA4OyBzcmMgPSBzOw0KPj4gKwlmb3IgKGkgPSAwOyBpIDwgdGFibGVuOyArK2kpDQo+
PiArCQljb2xvcnRhYltpXSA9ICh0YWJbaV0gJiBlb3J4KSBeIGJneDsNCj4+ICAgIA0KPj4g
LQkJZm9yIChqID0gazsgai0tOyApIHsNCj4+IC0JCQlzaGlmdCAtPSBwcHc7DQo+PiAtCQkJ
ZW5kX21hc2sgPSB0YWJbKCpzcmMgPj4gc2hpZnQpICYgYml0X21hc2tdOw0KPj4gLQkJCUZC
X1dSSVRFTCgoZW5kX21hc2sgJiBlb3J4KV5iZ3gsIGRzdCsrKTsNCj4+IC0JCQlpZiAoIXNo
aWZ0KSB7IHNoaWZ0ID0gODsgc3JjKys7IH0NCj4+ICsJZm9yIChpID0gaW1hZ2UtPmhlaWdo
dDsgaS0tOyApIHsNCj4+ICsJCWRzdCA9ICh1MzIgX19pb21lbSAqKWRzdDE7DQo+PiArCQlz
cmMgPSBzOw0KPj4gKw0KPj4gKwkJc3dpdGNoIChwcHcpIHsNCj4+ICsJCWNhc2UgNDogLyog
OCBicHAgKi8NCj4+ICsJCQlmb3IgKGogPSBrOyBqOyBqIC09IDIsICsrc3JjKSB7DQo+PiAr
CQkJCUZCX1dSSVRFTChjb2xvcnRhYlsoKnNyYyA+PiA0KSAmIGJpdF9tYXNrXSwgZHN0Kysp
Ow0KPj4gKwkJCQlGQl9XUklURUwoY29sb3J0YWJbKCpzcmMgPj4gMCkgJiBiaXRfbWFza10s
IGRzdCsrKTsNCj4+ICsJCQl9DQo+PiArCQkJYnJlYWs7DQo+PiArCQljYXNlIDI6IC8qIDE2
IGJwcCAqLw0KPj4gKwkJCWZvciAoaiA9IGs7IGo7IGogLT0gNCwgKytzcmMpIHsNCj4+ICsJ
CQkJRkJfV1JJVEVMKGNvbG9ydGFiWygqc3JjID4+IDYpICYgYml0X21hc2tdLCBkc3QrKyk7
DQo+PiArCQkJCUZCX1dSSVRFTChjb2xvcnRhYlsoKnNyYyA+PiA0KSAmIGJpdF9tYXNrXSwg
ZHN0KyspOw0KPj4gKwkJCQlGQl9XUklURUwoY29sb3J0YWJbKCpzcmMgPj4gMikgJiBiaXRf
bWFza10sIGRzdCsrKTsNCj4+ICsJCQkJRkJfV1JJVEVMKGNvbG9ydGFiWygqc3JjID4+IDAp
ICYgYml0X21hc2tdLCBkc3QrKyk7DQo+PiArCQkJfQ0KPj4gKwkJCWJyZWFrOw0KPj4gKwkJ
Y2FzZSAxOiAvKiAzMiBicHAgKi8NCj4+ICsJCQlmb3IgKGogPSBrOyBqOyBqIC09IDgsICsr
c3JjKSB7DQo+PiArCQkJCUZCX1dSSVRFTChjb2xvcnRhYlsoKnNyYyA+PiA3KSAmIGJpdF9t
YXNrXSwgZHN0KyspOw0KPj4gKwkJCQlGQl9XUklURUwoY29sb3J0YWJbKCpzcmMgPj4gNikg
JiBiaXRfbWFza10sIGRzdCsrKTsNCj4+ICsJCQkJRkJfV1JJVEVMKGNvbG9ydGFiWygqc3Jj
ID4+IDUpICYgYml0X21hc2tdLCBkc3QrKyk7DQo+PiArCQkJCUZCX1dSSVRFTChjb2xvcnRh
YlsoKnNyYyA+PiA0KSAmIGJpdF9tYXNrXSwgZHN0KyspOw0KPj4gKwkJCQlGQl9XUklURUwo
Y29sb3J0YWJbKCpzcmMgPj4gMykgJiBiaXRfbWFza10sIGRzdCsrKTsNCj4+ICsJCQkJRkJf
V1JJVEVMKGNvbG9ydGFiWygqc3JjID4+IDIpICYgYml0X21hc2tdLCBkc3QrKyk7DQo+PiAr
CQkJCUZCX1dSSVRFTChjb2xvcnRhYlsoKnNyYyA+PiAxKSAmIGJpdF9tYXNrXSwgZHN0Kysp
Ow0KPj4gKwkJCQlGQl9XUklURUwoY29sb3J0YWJbKCpzcmMgPj4gMCkgJiBiaXRfbWFza10s
IGRzdCsrKTsNCj4+ICsJCQl9DQo+PiArCQkJYnJlYWs7DQo+PiAgICAJCX0NCj4+ICsNCj4+
ICAgIAkJZHN0MSArPSBwLT5maXgubGluZV9sZW5ndGg7DQo+PiAgICAJCXMgKz0gc3BpdGNo
Ow0KPj4gICAgCX0NCj4gDQo+IEJlc3QgcmVnYXJkcw0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------ic8b9Bunxi1kJc30sg0g5OrI--

--------------mKUX4ovKS9DPxXn241Zx9NTr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIoY8gFAwAAAAAACgkQlh/E3EQov+A+
8hAAxafeGH0dvwbW1ajTVUkTB9qCymmnr9Bk6j3E0oeWlsO+fxg3raWY3xQstv8b0xp89syMc8g/
njzdxx4BwXUvZZT5HsCPwGBvupKLOv2ckRovBmmYi3S1iU3hpHSCA/qWPO+xpCHaMztSKxI6P0TH
QZNv6uT8gRPvSVtj+bd40KvRuBqB1Rd+MCCnWFqQZ/GF4HyxSsZfdU/E7jU9GvO6XCCNz9Dcm/Yi
rfeBoJx7Aqdl89Rs/JYkIMyU4gDUq0pJrgv7hZDfTjyxr3uEsWMwixbBx536yYv/h4+jHvUt6VN1
skJS8395kTivu4AmAvDlWK/fJIY0jeNKcjE5r0cnkHeMMAkk9KNDtZtoKqyUS1v6IAOgrenlqMvL
hureYMATDRpkWynQVYtTKdWI4j+A9UdON6aqNptDUkxponIbYaLHeLvUJg+vgkkE/lOxKEYVAlPp
OvmBv1YzIat8TsRErsQwlEueUyTxMgQkrRl4Gx5g2Q0Wyny0VzQvimY0ooFpFvQIxfMQAjag8oun
a0bW7VVLARDuVtujGSI+OmBjJ/FRJqX+FlFOsIHCvIbnD99XXRTrIGQIJRiPKUHeXydjlfLFqBSx
ZTFmMQxSoNazjKcj1062vk8RtewRDFUiCGzsCrOihq1Gc1ozq8Pgf5SNBZS7LlSh52lYLYRAGhnn
Eco=
=vEMn
-----END PGP SIGNATURE-----

--------------mKUX4ovKS9DPxXn241Zx9NTr--
