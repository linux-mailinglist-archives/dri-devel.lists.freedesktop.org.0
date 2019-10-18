Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA25DCE69
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE2F6EBC4;
	Fri, 18 Oct 2019 18:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D70C6E139
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 16:20:31 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id u1so6031077ilq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9uIYAnyPMezy1SrLVChvjUvSTT25CSaPRKsdjVZO6n8=;
 b=NijN5t58Ulc81uCWKP2gjrZSSQcZHns1sCy2e3Ru/VJZzBs2TV6LFRZvhNpwSfKBVb
 De5OEoHNdxEvFT10yPmNG+XXy8yAdaIvT/hajEEfg3xo+YoGx0Y079PT6UEXLVI/fPhV
 MlDCbi3d78jsdCstNwMYYh8WxJVmACoeQYN2zNr8ccb6UwXzYKhMMuuGG6zzSHQFZftQ
 CBBG3mYJpqcX9/R0dSwVKN1LfhFR8ciZKJbhKzZUe48zCwyD+9wWUWfJkYuGzOiKzykM
 Ydwnzv9r5c002DFC6pOsJ9MUxsnCMMLmKhdVjCna7a8Evv0y86DHAsaqn50OMw6tF7zT
 PQjw==
X-Gm-Message-State: APjAAAVHxHGhNdtr57MlnDg/JMVRu4crlQpf2nNf+nSZq6alYQmOQhPF
 baKB1NSpkj4/IugCAL0WYu+0oHSqwG7FktQ9tUMLDA==
X-Google-Smtp-Source: APXvYqw2YK1lwgF/TFTkt9RSwtJ17zC9sjmAtKYD5ZCcsqeN2ggjp9zo5LRHoqTvo6xjx+0AuXbxZHCiRDt5708hL+c=
X-Received: by 2002:a92:410c:: with SMTP id o12mr11498464ila.287.1571415630625; 
 Fri, 18 Oct 2019 09:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191007033200.13443-1-brgl@bgdev.pl> <20191014081220.GK4545@dell>
 <CACRpkda9Kco-bVPw1OA6FMpQ1L8dZ4WFJ227wTCM9rh5JE7-+A@mail.gmail.com>
 <20191016130536.222vsi5whkoy6vzo@uno.localdomain> <20191017072550.GK4365@dell>
 <20191018150426.7w5q55nhkiqbqhuk@uno.localdomain>
In-Reply-To: <20191018150426.7w5q55nhkiqbqhuk@uno.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 18 Oct 2019 18:20:19 +0200
Message-ID: <CAMRc=Mc0-c_Cnbbh981pXQHW70GW1kh5hYioxJQM6JrOnCe4NQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] backlight: gpio: simplify the driver
To: Jacopo Mondi <jacopo@jmondi.org>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9uIYAnyPMezy1SrLVChvjUvSTT25CSaPRKsdjVZO6n8=;
 b=RsS1qicPZcnkl76YmnbfWfB4DsiuiCLUqloFqkV4cKo1n8DFJo7UEQSSDFodJSbKB/
 aBWZqVCPZgMDcLDXyYzENWxYIXywuatRXqle5E7LpooPoQQUBy7bYET/lR3hCkblPVpQ
 lRCxDCweDqgN5VH3+jmycEAt4tkhNiTGcj63IOj6HoqYIOC+FHhzbw0j2Z6Q6PcheRlq
 V05ZlaVDqncElnNNeR/8BJBUr0rrldkoPBjEym9DYsl1rkcPeHcDWbU59h32Cz6ffBHn
 hRdElR9UrqvDGkKzkyMvLFvQ1KF9n7QBf9pfXR5M4kaxLzPEox6QLi5JDuA66WL4yGC9
 X2Jg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHQuLCAxOCBwYcW6IDIwMTkgbyAxNzowMiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3Jn
PiBuYXBpc2HFgihhKToKPgo+IEhpLAo+Cj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6MjU6
NTBBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gV2VkLCAxNiBPY3QgMjAxOSwgSmFj
b3BvIE1vbmRpIHdyb3RlOgo+ID4KPiA+ID4gSGksIHNvcnJ5IGZvciBub3QgaGF2aW5nIHJlcGxp
ZWQgZWFybGllcgo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCAwMjo1Njo1N1BN
ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDE5
IGF0IDEwOjEyIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gPiA+ICBhcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgICAg
ICAgICB8ICAzMyArKysrLS0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGd1ZXNzIHdlJ3JlIGp1c3Qg
d2FpdGluZyBmb3IgdGhlIFNIIEFja3Mgbm93Pwo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9uZSBtYWlu
dGFpbmVyIHdpdGggdGhpcyBib2FyZCBpcyBwcm9iYWJseSBvdmVybG9hZGVkLgo+ID4gPiA+Cj4g
PiA+ID4gSSB3b3VsZCBzYXkganVzdCBhcHBseSBpdCwgaXQgY2FuJ3QgaG9sZCBiYWNrIHRoZSBl
bnRpcmUgc2VyaWVzLgo+ID4gPgo+ID4gPiBJJ3ZlIGJlZW4gYWJsZSB0byByZXN1cmVjdCB0aGUg
RWNvdmVjLCBhbmQgSSd2ZSBhbHNvIGJlZW4gZ2l2ZW4gYSBjb3B5Cj4gPiA+IG9mIGl0cyBzY2hl
bWF0aWNzIGZpbGUgYSBmZXcgd2Vla3MgYWdvLgo+ID4gPgo+ID4gPiBJdCdzIGluIG15IFRPRE8g
bGlzdCB0byB0ZXN0IHRoaXMgc2VyaWVzIGJ1dCBJIGRpZG4ndCBtYW5hZ2UgdG8gZmluZAo+ID4g
PiB0aW1lLiBJZiBJIHBpbmt5IHByb21pc2UgSSBnZXQgYmFjayB0byB5b3UgYmVmb3JlIGVuZCBv
ZiB0aGUgd2VlaywKPiA+ID4gY291bGQgeW91IHdhaXQgZm9yIG1lID8gOikKPgo+IEZpbmFsbHkg
aGFkIHNvbWUgdGltZSB0byBzcGVuZCBvbiB0aGlzLgo+Cj4gQXMgSSd2ZSByZXBvcnRlZCB0byBC
YXJ0b3N6LCB0aGlzIHZlcnNpb24gZG9lcyBub3Qgd29yayBvbiBFY292ZWMgb3V0Cj4gb2YgdGhl
IGJveCwgYXMgdGhlIEdQSU8gbGluZSBjb25uZWN0ZWQgdG8gdGhlIGJhY2tsaWdodCBuZWVkcyB0
byBiZQo+IGNvbmZpZ3VyZWQgdG8gd29yayBpbiBvdXRwdXQgbW9kZSBiZWZvcmUgcmVnaXN0ZXJp
bmcgdGhlIGJhY2tsaWdodAo+IGRldmljZS4KPgo+IFdpdGggdGhpcyBzaW1wbGUgY2hhbmdlOgo+
Cj4gJCBnaXQgZGlmZgo+IGRpZmYgLS1naXQgYS9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0
L3NldHVwLmMgYi9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMKPiBpbmRleCBk
ZDQyN2JhYzVjZGUuLmVlYzZlODA1YzNlZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3NoL2JvYXJkcy9t
YWNoLWVjb3ZlYzI0L3NldHVwLmMKPiArKysgYi9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0
L3NldHVwLmMKPiBAQCAtMTQ3Myw2ICsxNDczLDcgQEAgc3RhdGljIGludCBfX2luaXQgYXJjaF9z
ZXR1cCh2b2lkKQo+ICAjZW5kaWYKPiAgI2VuZGlmCj4KPiArICAgICAgIGdwaW9fZGlyZWN0aW9u
X291dHB1dChHUElPX1BUUjEsIDEpOwoKVGhpcyBpcyBhIGhhY2sgYWN0dWFsbHkuIFRoZSBwcm9i
bGVtIGxpZXMgd2l0aCB0aGUgZ3BpbyBiYWNrbGlnaHQKZHJpdmVyIC0gaXQgc2hvdWxkIHJlYWxs
eSBzZXQgdGhlIG1vZGUgdG8gb3V0cHV0LCBub3QgbGVhdmUgaXQgYXMgaXMuCklmIHRoZXJlJ3Mg
bm8gZ29vZCByZWFzb24gdG8ga2VlcCBpdCBhcyBpdCBpcyBub3csIEknbGwgYWRkIGFub3RoZXIK
cGF0Y2ggdG8gdGhlIHNlcmllcyB0aGF0IG1vdmVzIHRoZSBjYWxsIHRvIGRldm1fZ3Bpb2RfZ2V0
KCkgdG8gd2hlcmUKd2UndmUgYWxyZWFkeSBkZXRlcm1pbmVkIHRoZSBpbml0aWFsIHZhbHVlIGlu
IHByb2JlKCkgYW5kIHBhc3MgYW4KYXBwcm9wcmlhdGUgR1BJT0RfT1VUX0hJR0gvTE9XIGZsYWcu
CgpCYXJ0Cgo+ICAgICAgICAgZ3Bpb2RfYWRkX2xvb2t1cF90YWJsZSgmZ3Bpb19iYWNrbGlnaHRf
bG9va3VwKTsKPiAgICAgICAgIGdwaW9fYmFja2xpZ2h0X2RldmljZSA9IHBsYXRmb3JtX2Rldmlj
ZV9yZWdpc3Rlcl9mdWxsKAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZ3Bpb19iYWNrbGlnaHRfZGV2aWNlX2luZm8pOwo+Cj4gSSBjYW4gbm93IGNvbnRyb2wgdGhl
IGdwaW8gdGhyb3VnaCB0aGUgYmFja2xpZ2h0IGludGVyZmFjZS4KPgo+IFNvIHBsZWFzZSBhZGQg
dGhpcyBiaXQgb24gdG9wIG9mIG5leHQgaXRlcmF0aW9uIGFuZCBhZGQgbXk6Cj4gVGVzdGVkLWJ5
OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4KPiBUaGFua3MgYW5k
IHNvcnJ5IGZvciB0aGUgbG9uZyB0aW1lIGl0IHRvb2shCj4KPiA+Cj4gPiBZZXMsIG5vIHByb2Js
ZW0uCj4gPgo+ID4gLS0KPiA+IExlZSBKb25lcyBb5p2O55C85pavXQo+ID4gTGluYXJvIFNlcnZp
Y2VzIFRlY2huaWNhbCBMZWFkCj4gPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKPiA+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
