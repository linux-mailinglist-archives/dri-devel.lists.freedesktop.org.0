Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56050DB36
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A0A10E0CC;
	Mon, 25 Apr 2022 08:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959B10E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:30:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74EF7210E6;
 Mon, 25 Apr 2022 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650875458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gF1fG0XQxOOkdIyApPTKzTRCqEL+ZVEX9uEtSX+XoNg=;
 b=zz8Exod4b/tXP6oWhRY71mNTgTvw1ldbPF/edilih7xLz4wjtWZymuRZHpuZzG8RO/Cp7F
 j7FPFigFkgAO5+9IQnCFov3OQUW9DpaDRZ7NXZRc9SbI+G1lQXzyd9r9xcNvXVjJkUIFjU
 ugv9d6mDEuLtD/ORg3z2jGE5MuiNV80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650875458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gF1fG0XQxOOkdIyApPTKzTRCqEL+ZVEX9uEtSX+XoNg=;
 b=0j7m63Smy7wAWVPXaezgrUrtejI4+Kh3y7qavoZmkz2Z2ClYhSAL3mp+ATd/sqE1cFB4T6
 NnE0HszdCjXB7JAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 277BE13AED;
 Mon, 25 Apr 2022 08:30:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /D3BCEJcZmINfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 08:30:58 +0000
Message-ID: <2eddfc04-938d-440b-e517-2d667114978e@suse.de>
Date: Mon, 25 Apr 2022 10:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/5] fbdev: Fix some race conditions between fbmem and
 sysfb
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-5-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220420085303.100654-5-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i7h1u7DR2S9WN89W9KykXJ8K"
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 Yizhuo Zhai <yzhai003@ucr.edu>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i7h1u7DR2S9WN89W9KykXJ8K
Content-Type: multipart/mixed; boundary="------------hTRD5kHZx8vsiDfvfIsRihZq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Daniel Vetter
 <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Yizhuo Zhai <yzhai003@ucr.edu>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-fbdev@vger.kernel.org
Message-ID: <2eddfc04-938d-440b-e517-2d667114978e@suse.de>
Subject: Re: [PATCH v3 4/5] fbdev: Fix some race conditions between fbmem and
 sysfb
References: <20220420085303.100654-1-javierm@redhat.com>
 <20220420085303.100654-5-javierm@redhat.com>
In-Reply-To: <20220420085303.100654-5-javierm@redhat.com>

--------------hTRD5kHZx8vsiDfvfIsRihZq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjIgdW0gMTA6NTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBwbGF0Zm9ybSBkZXZpY2VzIHJlZ2lzdGVyZWQgaW4gc3lzZmIgbWF0
Y2ggd2l0aCBhIGZpcm13YXJlLWJhc2VkIGZiZGV2DQo+IG9yIERSTSBkcml2ZXIsIHRoYXQg
YXJlIHVzZWQgdG8gaGF2ZSBlYXJseSBncmFwaGljcyB1c2luZyBmcmFtZWJ1ZmZlcnMgc2V0
DQo+IHVwIGJ5IHRoZSBzeXN0ZW0gZmlybXdhcmUuDQo+IA0KPiBSZWFsIERSTSBkcml2ZXJz
IGxhdGVyIGFyZSBwcm9iZWQgYW5kIHJlbW92ZSBhbGwgY29uZmxpY3RpbmcgZnJhbWVidWZm
ZXJzLA0KPiBsZWFkaW5nIHRvIHRoZXNlIHBsYXRmb3JtIGRldmljZXMgZm9yIGdlbmVyaWMg
ZHJpdmVycyB0byBiZSB1bnJlZ2lzdGVyZWQuDQo+IA0KPiBCdXQgdGhlIGN1cnJlbnQgc29s
dXRpb24gaGFzIHR3byBpc3N1ZXMgdGhhdCB0aGlzIHBhdGNoIGZpeGVzOg0KPiANCj4gMSkg
SXQgaXMgYSBsYXllcmluZyB2aW9sYXRpb24gZm9yIHRoZSBmYmRldiBjb3JlIHRvIHVucmVn
aXN0ZXIgYSBkZXZpY2UNCj4gICAgIHRoYXQgd2FzIHJlZ2lzdGVyZWQgYnkgc3lzZmIuDQoN
CldoeT8gV2UgZG8gdGhpcyBlbHNld2hlcmUgYW5kIGl0IHdvcmtzIG5pY2VseS4NCg0KPiAN
Cj4gICAgIEluc3RlYWQsIHRoZSBzeXNmYl90cnlfdW5yZWdpc3RlcigpIGhlbHBlciBmdW5j
dGlvbiBjYW4gYmUgY2FsbGVkIGZvcg0KPiAgICAgc3lzZmIgdG8gYXR0ZW1wdCB1bnJlZ2lz
dGVyaW5nIHRoZSBkZXZpY2UgaWYgaXMgdGhlIG9uZSByZWdpc3RlcmVkLg0KDQpBbmQgc3lz
ZmJfdHJ5X3VucmVnaXN0ZXIoKSBpcyByZWFsbHkganVzdCBhIGdsb3JpZmllZCB2ZXJzaW9u
IG9mIA0KcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoKSBJTUhPLg0KDQo+IA0KPiAyKSBU
aGUgc3lzZmJfaW5pdCgpIGZ1bmN0aW9uIGNvdWxkIGJlIGNhbGxlZCBhZnRlciBhIERSTSBk
cml2ZXIgaXMgcHJvYmVkDQo+ICAgICBhbmQgcmVxdWVzdGVkIHRvIHVucmVnaXN0ZXIgZGV2
aWNlcyBmb3IgZHJpdmVycyB3aXRoIGEgY29uZmxpY3RpbmcgZmIuDQo+IA0KPiAgICAgVG8g
cHJldmVudCB0aGlzLCBkaXNhYmxlIGFueSBmdXR1cmUgc3lzZmIgcGxhdGZvcm0gZGV2aWNl
IHJlZ2lzdHJhdGlvbg0KPiAgICAgYnkgY2FsbGluZyBzeXNmYl9kaXNhYmxlKCksIGlmIGEg
ZHJpdmVyIHJlcXVlc3RlZCB0byByZW1vdmUgY29uZmxpY3RpbmcNCj4gICAgIGZyYW1lYnVm
ZmVycyB3aXRoIHJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoKS4NCg0KQXMgSSBt
ZW50aW9uZWQgaW4gYW5vdGhlciBjb21tZW50LCBhcyBzb29uIGFzIHRoZXJlJ3MgYW55dGhp
bmcgZWxzZSB0aGFuIA0KRUZJL1ZFU0EgdXNpbmcgdGhlIHN5c2ZiIGNvZGUgdGhlIHVucmVn
aXN0ZXJpbmcgc3RlcCBpcyBsaWtlbHkgdG8gYnJlYWsgDQppbiBzb21lIHdheS4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhlcmUgYXJlIHZpZGVvIGRyaXZlcnMgKGUu
ZzogdmdhMTZmYikgdGhhdCByZWdpc3RlciB0aGVpciBvd24gZGV2aWNlIGFuZA0KPiBkb24n
dCB1c2UgdGhlIHN5c2ZiIGluZnJhc3RydWN0dXJlIGZvciB0aGF0LCBzbyBhbiB1bnJlZ2lz
dHJhdGlvbiBoYXMgdG8NCj4gYmUgZm9yY2VkIGJ5IGZibWVtIGlmIHN5c2ZiX3RyeV91bnJl
Z2lzdGVyKCkgZmFpbHMgdG8gZG8gdGhlIHVucmVnaXN0ZXIuDQo+IA0KPiBTdWdnZXN0ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+IFNpZ25lZC1v
ZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cj4gLS0tDQo+IA0KPiAobm8gY2hhbmdlcyBzaW5jZSB2MikNCj4gDQo+IENoYW5nZXMgaW4g
djI6DQo+IC0gRXhwbGFpbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBmYm1lbSBoYXMg
dG8gdW5yZWdpc3RlciB0aGUgZGV2aWNlDQo+ICAgIGFzIGZhbGxiYWNrIGlmIGEgZHJpdmVy
IHJlZ2lzdGVyZWQgdGhlIGRldmljZSBpdHNlbGYgKERhbmllbCBWZXR0ZXIpLg0KPiAtIEFs
c28gZXhwbGFpbiB0aGF0IGZhbGxiYWNrIGluIGEgY29tbWVudCBpbiB0aGUgY29kZSAoRGFu
aWVsIFZldHRlcikuDQo+IC0gRG9uJ3QgZW5jb2RlIGluIGZibWVtIHRoZSBhc3N1bXB0aW9u
IHRoYXQgc3lzZmIgd2lsbCBhbHdheXMgcmVnaXN0ZXINCj4gICAgcGxhdGZvcm0gZGV2aWNl
cyAoRGFuaWVsIFZldHRlcikuDQo+IC0gQWRkIGEgRklYTUUgY29tbWVudCBhYm91dCBkcml2
ZXJzIHJlZ2lzdGVyaW5nIGRldmljZXMgKERhbmllbCBWZXR0ZXIpLg0KPiANCj4gICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDQyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBpbmRl
eCAwYmI0NTkyNThkZjMuLjgwOTgzMDU4NzlmOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZibWVtLmMNCj4gQEAgLTE5LDYgKzE5LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21ham9yLmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3NsYWIuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zeXNmYi5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9tbS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tbWFuLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3Z0Lmg+DQo+IEBAIC0xNTg1LDE4ICsxNTg2LDM4IEBAIHN0YXRpYyB2
b2lkIGRvX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoc3RydWN0IGFwZXJ0dXJl
c19zdHJ1Y3QgKmEsDQo+ICAgCQkJaWYgKCFkZXZpY2UpIHsNCj4gICAJCQkJcHJfd2Fybigi
ZmIlZDogbm8gZGV2aWNlIHNldFxuIiwgaSk7DQo+ICAgCQkJCWRvX3VucmVnaXN0ZXJfZnJh
bWVidWZmZXIocmVnaXN0ZXJlZF9mYltpXSk7DQo+IC0JCQl9IGVsc2UgaWYgKGRldl9pc19w
bGF0Zm9ybShkZXZpY2UpKSB7DQo+ICsJCQl9IGVsc2Ugew0KPiAgIAkJCQkvKg0KPiAgIAkJ
CQkgKiBEcm9wIHRoZSBsb2NrIGJlY2F1c2UgaWYgdGhlIGRldmljZSBpcyB1bnJlZ2lzdGVy
ZWQsIGl0cw0KPiAgIAkJCQkgKiBkcml2ZXIgd2lsbCBjYWxsIHRvIHVucmVnaXN0ZXJfZnJh
bWVidWZmZXIoKSwgdGhhdCB0YWtlcw0KPiAgIAkJCQkgKiB0aGlzIGxvY2suDQo+ICAgCQkJ
CSAqLw0KPiAgIAkJCQltdXRleF91bmxvY2soJnJlZ2lzdHJhdGlvbl9sb2NrKTsNCj4gLQkJ
CQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0b19wbGF0Zm9ybV9kZXZpY2UoZGV2aWNl
KSk7DQo+ICsJCQkJLyoNCj4gKwkJCQkgKiBGaXJzdCBhdHRlbXB0IHRoZSBkZXZpY2UgdG8g
YmUgdW5yZWdpc3RlcmVkIGJ5IHN5c2ZiLg0KPiArCQkJCSAqLw0KPiArCQkJCWlmICghc3lz
ZmJfdHJ5X3VucmVnaXN0ZXIoZGV2aWNlKSkgew0KPiArCQkJCQlpZiAoZGV2X2lzX3BsYXRm
b3JtKGRldmljZSkpIHsNCj4gKwkJCQkJCS8qDQo+ICsJCQkJCQkgKiBGSVhNRTogc3lzZmIg
ZGlkbid0IHJlZ2lzdGVyIHRoaXMgZGV2aWNlLCBpcyBhIHBsYXRmb3JtDQo+ICsJCQkJCQkg
KiBkZXZpY2UgcmVnaXN0ZXJlZCBieSBhIHZpZGVvIGRyaXZlciAoZS5nOiB2Z2ExNmZiKSwg
c28NCj4gKwkJCQkJCSAqIGZvcmNlIGl0cyB1bnJlZ2lzdHJhdGlvbiBoZXJlLiBBIHByb3Bl
ciBmaXggd291bGQgYmUgdG8NCj4gKwkJCQkJCSAqIG1vdmUgYWxsIGRldmljZSByZWdpc3Ry
YXRpb24gdG8gdGhlIHN5c2ZiIGluZnJhc3RydWN0dXJlDQo+ICsJCQkJCQkgKiBvciBwbGF0
Zm9ybSBjb2RlLg0KPiArCQkJCQkJICovDQo+ICsJCQkJCQlwbGF0Zm9ybV9kZXZpY2VfdW5y
ZWdpc3Rlcih0b19wbGF0Zm9ybV9kZXZpY2UoZGV2aWNlKSk7DQo+ICsJCQkJCX0gZWxzZSB7
DQo+ICsJCQkJCQkvKg0KPiArCQkJCQkJICogSWYgaXMgbm90IGEgcGxhdGZvcm0gZGV2aWNl
LCBhdCBsZWFzdCBwcmludCBhIHdhcm5pbmcuIEENCj4gKwkJCQkJCSAqIGZpeCB3b3VsZCBh
ZGQgdG8gbWFrZSB0aGUgY29kZSB0aGF0IHJlZ2lzdGVyZWQgdGhlIGRldmljZQ0KPiArCQkJ
CQkJICogdG8gYWxzbyB1bnJlZ2lzdGVyIGl0Lg0KPiArCQkJCQkJICovDQo+ICsJCQkJCQlw
cl93YXJuKCJmYiVkOiBjYW5ub3QgcmVtb3ZlIGRldmljZVxuIiwgaSk7DQo+ICsJCQkJCQkv
KiBjYWxsIHVucmVnaXN0ZXJfZnJhbWVidWZmZXIoKSBzaW5jZSB0aGUgbG9jayB3YXMgZHJv
cHBlZCAqLw0KPiArCQkJCQkJdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihyZWdpc3RlcmVkX2Zi
W2ldKTsNCj4gKwkJCQkJfQ0KPiArCQkJCX0NCj4gICAJCQkJbXV0ZXhfbG9jaygmcmVnaXN0
cmF0aW9uX2xvY2spOw0KPiAtCQkJfSBlbHNlIHsNCj4gLQkJCQlwcl93YXJuKCJmYiVkOiBj
YW5ub3QgcmVtb3ZlIGRldmljZVxuIiwgaSk7DQo+IC0JCQkJZG9fdW5yZWdpc3Rlcl9mcmFt
ZWJ1ZmZlcihyZWdpc3RlcmVkX2ZiW2ldKTsNCj4gICAJCQl9DQo+ICAgCQkJLyoNCj4gICAJ
CQkgKiBSZXN0YXJ0IHRoZSByZW1vdmFsIGxvb3Agbm93IHRoYXQgdGhlIGRldmljZSBoYXMg
YmVlbg0KPiBAQCAtMTc2Miw2ICsxNzgzLDE3IEBAIGludCByZW1vdmVfY29uZmxpY3Rpbmdf
ZnJhbWVidWZmZXJzKHN0cnVjdCBhcGVydHVyZXNfc3RydWN0ICphLA0KPiAgIAkJZG9fZnJl
ZSA9IHRydWU7DQo+ICAgCX0NCj4gICANCj4gKwkvKg0KPiArCSAqIElmIGEgZHJpdmVyIGFz
a2VkIHRvIHVucmVnaXN0ZXIgYSBwbGF0Zm9ybSBkZXZpY2UgcmVnaXN0ZXJlZCBieQ0KPiAr
CSAqIHN5c2ZiLCB0aGVuIGNhbiBiZSBhc3N1bWVkIHRoYXQgdGhpcyBpcyBhIGRyaXZlciBm
b3IgYSBkaXNwbGF5DQo+ICsJICogdGhhdCBpcyBzZXQgdXAgYnkgdGhlIHN5c3RlbSBmaXJt
d2FyZSBhbmQgaGFzIGEgZ2VuZXJpYyBkcml2ZXIuDQo+ICsJICoNCj4gKwkgKiBEcml2ZXJz
IGZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgaGF2ZSBhIGdlbmVyaWMgZHJpdmVyIHdpbGwgbmV2
ZXINCj4gKwkgKiBhc2sgZm9yIHRoaXMsIHNvIGxldCdzIGFzc3VtZSB0aGF0IGEgcmVhbCBk
cml2ZXIgZm9yIHRoZSBkaXNwbGF5DQo+ICsJICogd2FzIGFscmVhZHkgcHJvYmVkIGFuZCBw
cmV2ZW50IHN5c2ZiIHRvIHJlZ2lzdGVyIGRldmljZXMgbGF0ZXIuDQo+ICsJICovDQo+ICsJ
c3lzZmJfZGlzYWJsZSgpOw0KPiArDQo+ICAgCW11dGV4X2xvY2soJnJlZ2lzdHJhdGlvbl9s
b2NrKTsNCj4gICAJZG9fcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhhLCBuYW1l
LCBwcmltYXJ5KTsNCj4gICAJbXV0ZXhfdW5sb2NrKCZyZWdpc3RyYXRpb25fbG9jayk7DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------hTRD5kHZx8vsiDfvfIsRihZq--

--------------i7h1u7DR2S9WN89W9KykXJ8K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJmXDwFAwAAAAAACgkQlh/E3EQov+AW
jhAAn0O6LxBuAaEEdPFZ2bzRQrIO2PSm9jHbxexdYjmx1PErO0mbFW1Y2us7HlHQ/gWLIQrAbg4+
o6f+dSa+NUD/yODFqb3kqbKP9Y5kpHPg7oVB61kyS17Z2mmzDGP9GxKOL2ABlCcUpglg9n+ipsH/
KHqoW3wjhU7poiWGu8W9qZ9u9+CRuyig2GOdEjxC7lpvoSGkj/zhcZzww/XSyalukxFDJPVNFEUN
ZFxAD6FLBNfsO/BUwyU5mDI0uEpZ6my134vxA2BymAm71FDopyLIeXg57va2xAFG9fs0zxRPM0Yk
mW245JH0Rqq0ant89bO0O0lE0YgVHkeQizm5V88fRqJAEKTZA15D9QmWUWeENqaVE++7SEe17W0n
LxMMWiOz0bLoFkKA2pcJdfw7Np2PKhp0hINuiXIiNMKD/E+/r46r5nZIKArbKubIi3R1MIdM6Yw5
LQzVAg8n9p9UWn/QlbBYFDRhWLkSOU5QNEhVly9Q+39JFvEQnQcRTobsjM0WAUZ2FnFoBSBXRJIQ
DvyqIhGYBiiaGgR3J1SsBnhKZzzJ7vzSSROPo9lBqmVyluGGZ8Kjd6jyJE4GGT2otFLzR8waR74h
AEji5DmPNwTrgIztR/tvUDoAIKaZNr5bbIqueJKduhol9VqqGtb4Y9X2WQxmYbnPgBx8g3gk6sha
tPw=
=dWj+
-----END PGP SIGNATURE-----

--------------i7h1u7DR2S9WN89W9KykXJ8K--
