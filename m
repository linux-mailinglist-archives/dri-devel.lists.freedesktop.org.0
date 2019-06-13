Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6859544DDA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 22:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C30892DC;
	Thu, 13 Jun 2019 20:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD6C892DC;
 Thu, 13 Jun 2019 20:52:18 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so160102eds.4;
 Thu, 13 Jun 2019 13:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JQooILMN62e6ZfE6O1gpMhnquF2sDNJUA9IUqndyEI=;
 b=A5wPvpQB+SFgLAfyFM/Imj3f6U6uQrrSKuKWo1dcvCfdV5JO4O8Gj+LdQFzuGc1Elh
 9L9PwImJYpdYlrnNtBKFO7Af9I2kEiAJ8Dt6EktFDJVgClzuoj32KjBYkB9LTNF50X7l
 UlJHJoHCnfuYaMJFJvz7hWy1w0Fi/kWrnIKj7zoahkoQsS03D6gcDD/dM+gal0niUmMx
 jR90L2LC94HZ5nvH8D+4zgtyRweNwppFCuE2lCeA/vuL+uN7x6PM4bKlCWfdNLN4QR61
 wV4Nr9HTUI+KmVhnizLdy6tQvG1oAmDIWHPaicmODLPI/EM4mdjJXLtj6bQjHxhlZN7P
 JStg==
X-Gm-Message-State: APjAAAXE6rRxCI8tu5JWxnIjQUxK95HlqlKOh3e5JqObK1jtDghE8KtG
 J9lL7UgJMI/Fp3HWmoxDNc1oH/LM/jzHPTqAwwhaX6BW
X-Google-Smtp-Source: APXvYqzbQdZRkovPhDsdiNleMXm5gNHLn+z5Wtm5IEkLA1jvTvsI7lrW3hycEFVSFILFs/VGZVISZAVQXT/VZlaFzB4=
X-Received: by 2002:a17:906:85d4:: with SMTP id
 i20mr64252469ejy.256.1560459137193; 
 Thu, 13 Jun 2019 13:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Jun 2019 13:52:02 -0700
Message-ID: <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To: Nathan Huckleberry <nhuck@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9JQooILMN62e6ZfE6O1gpMhnquF2sDNJUA9IUqndyEI=;
 b=broFdsXH6S+PdNpgtoULbYPp3SBEyZ2qlJYslXr0tJf39BLOF1yvLXuu1ylHEKdM8t
 ox1LmQx3DOdvi9lbUn0oC+nj8BIq4VHS/4EF87zE76bY5ChCoIQdXQLIGDFpvREqxLhq
 v9o0kya5Rj0Aobbdq9i2Le7OTQNOyyGes5jGnbgqOaP1Ybk2LqDPDx4fekDBLpj79aiy
 tGktJi6FVsZOiMOK528MLeRKL9Xy+0ok5qmNDHPnZZZlOqxzXt5K5n2pZST/3W+WzyFh
 fMqdCSrniOjNXNC2Jp0dD4G7+URfbl/pSJpMLOdUncuAqtsfUvJZfXfjsgk5m95EY8Jc
 xV/g==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux@googlegroups.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c28sIGZvciBkcHVfZm9ybWF0X21hcF90aWxlLCBJJ2QgbGlrZSB0byBkZWZpbmUgYSBmb3VyY2Mg
bW9kaWZpZXIgZm9yCnRpbGVkIGZvcm1hdHMgKHdlIGN1cnJlbnRseSBoYXZlIGEgd29ya2Fyb3Vu
ZCBpbiB1c2Vyc3BhY2Ugdy8gYQpwcml2YXRlIG1vZGlmaWVyIGluIHRoZSBnYWxsaXVtIGRyaXZl
cikuLiBJIHRoaW5rIHRoZSBwcm9ibGVtIGlzCmRlZmluaW5nIHRoZSBsYXlvdXQgb2YgdGhlIHRp
bGVkIGZvcm1hdChzKSAodGhlcmUgYXJlIGF0IGxlYXN0IHR3byBwZXIKZ2VuZXJhdGlvbiBhbmQg
SSBjYW4ndCBndWFyYW50ZWUgdGhleSBhcmUgdGhlIHNhbWUgYWNyb3NzIGFkcmVubwpnZW5lcmF0
aW9ucykuICBXZSd2ZSBtb3N0bHkgYXZvaWRlZCBuZWVkaW5nIHRvIGtub3cgdGhlIGV4YWN0IGxh
eW91dApieSB1c2luZyBncHUgYmxpdHMgdG8gZ28gZnJvbSB0aWxlZDwtPmxpbmVhciBzbyBmYXIu
CgpGb3IgdGhlIG90aGVycywgdGhvc2UgbG9vayBsaWtlIGZvcm1hdHMgd2UgaGF2ZW4ndCB3aXJl
ZCB1cCB5ZXQuCgpJJ2Qgc2F5IHRoZXkgYXJlIGFsbCB0aGluZ3Mgd2Ugd2FudCB0byBzdXBwb3J0
IGV2ZW50dWFsbHksIGFsdGhvdWdoCm5vdCBzdXJlIHdoYXQgdGhlIHRpbWVsaW5lIHdpbGwgYmUu
LiAgYnV0IEknZCBhc2sgaWYgeW91IHJlbW92ZSB0aGVtCnRoZW4gc3BsaXQgaW50byBhdCBsZWFz
dCBhIHNlcGFyYXRlIHBhdGNoIGZvciBkcHVfZm9ybWF0X21hcF90aWxlIHZzCm90aGVycywgc28g
d2UgY2FuIG1vcmUgZWFzaWx5IHJldmVydC9hbWVuZCB0byBicmluZyB0aGVtIGJhY2suCgpCUiwK
LVIKCk9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDE6MTMgUE0gTmF0aGFuIEh1Y2tsZWJlcnJ5IDxu
aHVja0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEhleSBhbGwsCj4KPiBJJ20gbG9va2luZyBpbnRv
IGNsZWFuaW5nIHVwIGlnbm9yZWQgd2FybmluZ3MgaW4gdGhlIGtlcm5lbCBzbyB3ZSBjYW4KPiBy
ZW1vdmUgY29tcGlsZXIgZmxhZ3MgdG8gaWdub3JlIHdhcm5pbmdzLgo+Cj4gVGhlcmUgYXJlIHNl
dmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9ybWF0cy5jCj4gKCdkcHVfZm9ybWF0X21h
cF90aWxlJywgJ2RwdV9mb3JtYXRfbWFwX3AwMTAnLAo+ICdkcHVfZm9ybWF0X21hcF9wMDEwX3Vi
d2MnLCAnZHB1X2Zvcm1hdF9tYXBfdHAxMF91YndjJykuCj4gVGhleSBsb29rIGxpa2UgbW9kaWZp
ZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1lbnRlZC4gSSdkIGxpa2UgdG8KPiByZW1vdmUgdGhl
c2UgdmFyaWFibGVzIGlmIHRoZXJlIGFyZSBubyBwbGFucyBtb3ZpbmcgZm9yd2FyZCB0bwo+IGlt
cGxlbWVudCB0aGVtLiBPdGhlcndpc2UgSSdsbCBqdXN0IGxlYXZlIHRoZW0uCj4KPiBodHRwczov
L2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81MjgKPgo+IFRoYW5rcywK
PiBOYXRoYW4gSHVja2xlYmVycnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
