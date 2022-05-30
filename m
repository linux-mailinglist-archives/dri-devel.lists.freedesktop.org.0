Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8725375C2
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A8810EE0B;
	Mon, 30 May 2022 07:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390810EE0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:47:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A719D1FA2A;
 Mon, 30 May 2022 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653896834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yIcIkIr4fjw1SeGQuJx02soT3uwe1OXV7sZ6YAfnlw=;
 b=Qz2tZRj16uXI9Pk8JLdN6fg05lHxNs/W3504vD6I5wOrTaTZnKnsHLuMDhbdQSpSsqK/x/
 I7HNF4ydL5yr3MJXl1TRfJQ7W682z0BRNg5P17lvFSw08qb+Fn5WL0FNKbned1+X6onYA4
 t5Lq2ypmC559XO/kDNYm66NrkKl/Rv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653896834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yIcIkIr4fjw1SeGQuJx02soT3uwe1OXV7sZ6YAfnlw=;
 b=EQdrNELgc2JHwWdkWK0Zof3P+buwbCbo0E5kdNPZ09taASP+FLR3Ra8oeTEBDQP9394Ih+
 SXNtihq0A8IO22AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C5EA13A84;
 Mon, 30 May 2022 07:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id heRlFYJ2lGIBfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 May 2022 07:47:14 +0000
Message-ID: <8b79b40b-9786-9ddf-0dc9-89efbab38c7f@suse.de>
Date: Mon, 30 May 2022 09:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 09/15] drm/fbconv: Mode-setting pipeline enable /
 disable
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-10-tzimmermann@suse.de>
 <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jGgooILWJxkxh5lC2zmXM2W8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 michel@daenzer.net, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Malaterre <malat@debian.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jGgooILWJxkxh5lC2zmXM2W8
Content-Type: multipart/mixed; boundary="------------mNOplGHC6A0u0TDL4wP8UTID";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, ajax@redhat.com,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Mathieu Malaterre <malat@debian.org>, michel@daenzer.net,
 Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Message-ID: <8b79b40b-9786-9ddf-0dc9-89efbab38c7f@suse.de>
Subject: Re: [PATCH v2 09/15] drm/fbconv: Mode-setting pipeline enable /
 disable
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191014140416.28517-10-tzimmermann@suse.de>
 <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU9p7KUy3WEFox9KgZBHGZGNO2y5m8tLVbzGGVHu2iNYQ@mail.gmail.com>

--------------mNOplGHC6A0u0TDL4wP8UTID
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQsDQoNCmZpcnN0IG9mIGFsbCwgdGhhbmtzIGZvciBsb29raW5nIGF0IHRoZSBw
YXRjaC4NCg0KQW0gMjguMDUuMjIgdW0gMjI6MTcgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2
ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIE1vbiwgT2N0IDE0LCAyMDE5IGF0IDQ6MDUg
UE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4g
VGhlIGRpc3BsYXkgbW9kZSBpcyBzZXQgYnkgY29udmVydGluZyB0aGUgRFJNIGRpc3BsYXkg
bW9kZSB0byBhbg0KPj4gZmJfaW5mbyBzdGF0ZSBhbmQgaGFuZGxpbmcgaXQgdG8gdGhlIGZi
ZGV2IGRyaXZlcidzIGZiX3NldHZhcigpDQo+PiBmdW5jdGlvbi4gVGhpcyBhbHNvIHJlcXVp
cmVzIGEgY29sb3IgZGVwdGgsIHdoaWNoIHdlIHRha2UgZnJvbSB0aGUNCj4+IHZhbHVlIG9m
IHN0cnVjdCBkcm1fbW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmNvbnZfaGVscGVyLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJjb252X2hlbHBlci5jDQo+PiBAQCAtOTE5LDYgKzkx
OSwyNCBAQCBzdGF0aWMgaW50IGRybV9mYmNvbnZfdXBkYXRlX2ZiX3Zhcl9zY3JlZW5pbmZv
X2Zyb21fZnJhbWVidWZmZXIoDQo+PiAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgfQ0KPj4N
Cj4+ICtzdGF0aWMgaW50IGRybV9mYmNvbnZfdXBkYXRlX2ZiX3Zhcl9zY3JlZW5pbmZvX2Zy
b21fc2ltcGxlX2Rpc3BsYXlfcGlwZSgNCj4+ICsgICAgICAgc3RydWN0IGZiX3Zhcl9zY3Jl
ZW5pbmZvICpmYl92YXIsIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSkN
Cj4+ICt7DQo+PiArICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnByaW1hcnkgPSBwaXBlLT5j
cnRjLnByaW1hcnk7DQo+PiArICAgICAgIHN0cnVjdCBkcm1fZmJjb252X21vZGVzZXQgKm1v
ZGVzZXQgPSBkcm1fZmJjb252X21vZGVzZXRfb2ZfcGlwZShwaXBlKTsNCj4+ICsNCj4+ICsg
ICAgICAgaWYgKHByaW1hcnkgJiYgcHJpbWFyeS0+c3RhdGUgJiYgcHJpbWFyeS0+c3RhdGUt
PmZiKQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiBkcm1fZmJjb252X3VwZGF0ZV9mYl92
YXJfc2NyZWVuaW5mb19mcm9tX2ZyYW1lYnVmZmVyKA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZmJfdmFyLCBwcmltYXJ5LT5zdGF0ZS0+ZmIsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICBtb2Rlc2V0LT5mYl9pbmZvLT5maXguc21lbV9sZW4pOw0KPj4gKw0KPj4gKyAg
ICAgICBmYl92YXItPnhyZXNfdmlydHVhbCA9IGZiX3Zhci0+eHJlczsNCj4+ICsgICAgICAg
ZmJfdmFyLT55cmVzX3ZpcnR1YWwgPSBmYl92YXItPnlyZXM7DQo+PiArICAgICAgIGZiX3Zh
ci0+Yml0c19wZXJfcGl4ZWwgPSBtb2Rlc2V0LT5kZXYtPm1vZGVfY29uZmlnLnByZWZlcnJl
ZF9kZXB0aDsNCj4gDQo+IFRoaXMgbG9va3Mgd3JvbmcgdG8gbWU6IElNSE8gYml0c19wZXJf
cGl4ZWwgc2hvdWxkIGJlIGRlcml2ZWQgZnJvbQ0KPiB0aGUgZm91cmNjIGZvcm1hdCBvZiB0
aGUgX25ld18gbW9kZSB0byBiZSBzZXQuLi4NCg0KSW5kZWVkLCB0aGlzIGFwcGVhcnMgdG8g
YmUgd3JvbmcuDQoNCj4gDQo+PiArDQo+PiArICAgICAgIHJldHVybiAwOw0KPj4gK30NCj4+
ICsNCj4+ICAgLyoqDQo+PiAgICAqIGRybV9mYmNvbnZfc2ltcGxlX2Rpc3BsYXlfcGlwZV9t
b2RlX3ZhbGlkIC0gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBmb3INCj4+ICAgICogICAgIHN0
cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy5tb2RlX3ZhbGlkDQo+PiBAQCAt
OTUwLDYgKzk2OCwyOCBAQCBib29sIGRybV9mYmNvbnZfc2ltcGxlX2Rpc3BsYXlfcGlwZV9t
b2RlX2ZpeHVwKA0KPj4gICAgICAgICAgc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwNCj4+ICAgICAgICAgIHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQ0KPj4gICB7DQo+PiArICAgICAgIHN0cnVj
dCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSA9DQo+PiArICAgICAgICAgICAgICAg
Y29udGFpbmVyX29mKGNydGMsIHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSwgY3J0
Yyk7DQo+PiArICAgICAgIHN0cnVjdCBkcm1fZmJjb252X21vZGVzZXQgKm1vZGVzZXQgPSBk
cm1fZmJjb252X21vZGVzZXRfb2ZfcGlwZShwaXBlKTsNCj4+ICsgICAgICAgc3RydWN0IGZi
X3Zhcl9zY3JlZW5pbmZvIGZiX3ZhcjsNCj4+ICsgICAgICAgaW50IHJldDsNCj4+ICsNCj4+
ICsgICAgICAgaWYgKCFtb2Rlc2V0LT5mYl9pbmZvLT5mYm9wcy0+ZmJfY2hlY2tfdmFyKQ0K
Pj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKw0KPj4gKyAgICAgICBkcm1f
ZmJjb252X2luaXRfZmJfdmFyX3NjcmVlbmluZm9fZnJvbV9tb2RlKCZmYl92YXIsIG1vZGUp
Ow0KPj4gKw0KPj4gKyAgICAgICByZXQgPSBkcm1fZmJjb252X3VwZGF0ZV9mYl92YXJfc2Ny
ZWVuaW5mb19mcm9tX3NpbXBsZV9kaXNwbGF5X3BpcGUoDQo+PiArICAgICAgICAgICAgICAg
JmZiX3ZhciwgJm1vZGVzZXQtPnBpcGUpOw0KPj4gKyAgICAgICBpZiAocmV0KQ0KPj4gKyAg
ICAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKw0KPj4gKyAgICAgICByZXQgPSBtb2Rl
c2V0LT5mYl9pbmZvLT5mYm9wcy0+ZmJfY2hlY2tfdmFyKCZmYl92YXIsIG1vZGVzZXQtPmZi
X2luZm8pOw0KPiANCj4gLi4uIGhlbmNlIHRoaXMgZmFpbHMgaWYgdGhlIHJlcXVlc3RlZCBt
b2RlIGlzIHZhbGlkIHdpdGggdGhlIG5ldw0KPiBmb3VyY2MgZm9ybWF0LCBidXQgaW52YWxp
ZCB3aXRoIHRoZSBvbGQgKGJ1dCBwcmVmZXJyZWQpIGRlcHRoLg0KPiBFLmcuIGR1ZSB0byBi
YW5kd2lkdGggbGltaXRhdGlvbnMsIGEgaGlnaC1yZXNvbHV0aW9uIG1vZGUgaXMgdmFsaWQN
Cj4gd2l0aCBhIGxvdyBjb2xvciBkZXB0aCwgd2hpbGUgYSBoaWdoIGNvbG9yIGRlcHRoIGlz
IGxpbWl0ZWQgdG8gbG93ZXINCj4gcmVzb2x1dGlvbnMuDQoNCkkgdGVzdGVkIHRoZSBoZWxw
ZXJzIHdpdGggdmFyaW91cyBmYmRldiBkcml2ZXJzIGFuZCBtb2RpZmllZCB0aGVtIHVudGls
IA0KYWxsIG9mIHRoZXNlIGRyaXZlcnMgcHJvZHVjZWQgYXQgbGVhc3Qgc29tZSBvdXRwdXQu
IEknbSBub3Qgc3VycHJpc2VkIA0KdGhhdCB0aGVyZSBhcmUgc3RpbGwgYnVncy4NCg0KPiAN
Cj4gVW5mb3J0dW5hdGVseSB3ZSBkbyBub3Qga25vdyB0aGUgbmV3IGZvdXJjYyBmb3JtYXQg
aGVyZSwgYXMgYm90aA0KPiBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcy5tb2RlX3t2
YWxpZCxmaXh1cH0oKSBhcmUgcGFzc2VkDQo+IHRoZSBtb2RlIChmcm9tIGRybV9tb2RlX3Nl
dC5tb2RlKSwgYnV0IG5vdCB0aGUgbmV3IGZvcm1hdCAoZnJvbQ0KPiBkcm1fbW9kZV9zZXQu
ZmItPmZvcm1hdCkuDQo+IA0KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPyBJcyB0aGUgbmV3
IGZvcm1hdCBhdmFpbGFibGUgaW4gc29tZSBvdGhlciB3YXk/DQoNCldlIGNhbiBhbHdheXMg
Z2V0IHRoZSBmb3JtYXQgZnJvbSB0aGUgbmV3IHBsYW5lIHN0YXRlIG9mIA0KbW9kZXNldC0+
cGlwZS0+cGxhbmUuIFdlJ2QgaGF2ZSB0aGlzIGluIHRoZSBhdG9taWNfY2hlY2sgY2FsbC4g
QW5kIGl0IA0KYXBwZWFycyB0aGF0IGRybV9mYmNvbnZfc2ltcGxlX2Rpc3BsYXlfcGlwZV9j
aGVjaygpIGlzIGEgYmV0dGVyIHBsYWNlIA0KZm9yIHRoaXMgY29kZSBhbnl3YXkuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gVGhhbmtzIQ0KPiANCj4+ICsgICAgICAgaWYgKHJl
dCA8IDApDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gKw0KPj4gKyAg
ICAgICBkcm1fbW9kZV91cGRhdGVfZnJvbV9mYl92YXJfc2NyZWVuaW5mbyhhZGp1c3RlZF9t
b2RlLCAmZmJfdmFyKTsNCj4+ICsNCj4+ICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gICB9
DQo+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2ZiY29udl9zaW1wbGVfZGlzcGxheV9waXBlX21v
ZGVfZml4dXApOw0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------mNOplGHC6A0u0TDL4wP8UTID--

--------------jGgooILWJxkxh5lC2zmXM2W8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKUdoEFAwAAAAAACgkQlh/E3EQov+Ds
lQ/+O5exEwwVeNo28WT7CtoXChPp9oajWK8ucpmGiKGIYpdMqmCrWBGGBiKZ11Wb1HeVZt86bFjP
iVLSWIgWihVV4utpMzu59R0ibxaiccdnbknCHqIcqaoRbt464bOJjTjGLwGQjwOkocwXZZv87GT8
cxVdn5l5cygsHTNxrUZedhdasqsaecg9tJTq+4g/PjMgopQX0DFKGiwWJv8raaNlqKqnoDMVeQL0
5JMgRV2t6uh+1dy6K5lDl8KXt6Vun3+Oa+p8jAie5qEvqfgRfZ/67GJvdbi+HeZJKhlJviGDTkgQ
3V8e0TGLBwggIRm8QUsGmMu0YTsfr9HJ4zPmmaKS7payKaobtmNN5QCwYL+kBdprsKNqlO9qWMgl
7LHYY4nt88HKKdvA7ZLuZHJb0aPHI25OdLWqNmIAmebJ8e0RyBz1qHsIAMKq7+Wlcj+wG9lIE1eg
dTydyd8NfgyDMnV3ZNbAEvzA26PjARqHMVwaQxkkzHSSHJHaI/zNMHHWFNTWaFhOhaUHq5CfAC1e
dQ9IBP+tWwUfB5mmck2jxUmVV5KSoYzEKC7a3w4t5N7wviqCAZefTkaWzV+/vk5rb1aDyo/Y3mYf
ZSD607BQBTbv4hovmk4vCiieSdsZ+PNk323deFwSqGRc0jpX9QzJMSxXbqY9qes98xlILfR0QALY
tfU=
=L/Kq
-----END PGP SIGNATURE-----

--------------jGgooILWJxkxh5lC2zmXM2W8--
