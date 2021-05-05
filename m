Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA53736E4
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE86E0D0;
	Wed,  5 May 2021 09:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A706E0D0;
 Wed,  5 May 2021 09:17:30 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so493344pjv.1; 
 Wed, 05 May 2021 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+hdlGV1cUN6NljB1f2reBcd8Q4DpmutRMc4/6Gf8iqI=;
 b=P3sG7lnDmSPXT3uYXXvYoTUTIKUqeGvsiITgKApsDfTuVzIVm8UEBQD8XQlsDSaVJv
 Dg9KdKkliWDCbFd65g7X8Ydef+UkFU6tmG1mWrWLcQeVc6S8m8w8cwJ+7FuMJZOFNgBl
 fd4Jevni6iNb9Px7sdZeI0scw3ANCqwZherMQgYkzIboGvj0w4Zi8ulD3NZN3hX1utDu
 gFNO2WIQF16Q/N9dqdI3v0QwnjyjGLqRH8o3nZrQziSrC55YHahuVYbwv4OllmEMHVGI
 Ihkr8GyXoZqa3MXLnWsA1b0pg+liRKsaHpwyWpKUyelxPhpEEKqaHMe5A1mnsOAvrLlk
 gy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+hdlGV1cUN6NljB1f2reBcd8Q4DpmutRMc4/6Gf8iqI=;
 b=SYW1Aw/GdEfMMclsYTi1hDxEXd2CgXAb21waipywuLz0r4U44/GQ7n3svebTm03/8B
 TC84rAJP83oznc0t3Vo9N1FXhnBv1onNucKL16jp6OOHEXEBNJNuQDa1dTYkpLXBg1Ae
 dWsalglBPr0DL9AXSqOsLd3Yc5H9mRJBcQuY5SxClzvQJpeEglYlJuOE2qLCUQ3VQZm+
 Lm2YaEDkEVmi3f1aP7R7a7YHYiUIKS1zIWo2r+Bk48aS4SEj+BJVlbnsVTUrY6NEsCNu
 5K7g7WY3ppjZTrGSTD7p6f+G/+yDIqhvpIr0tWF/KWKVcCPgFKu5/cL1faVF7Z0BXHbU
 AFXg==
X-Gm-Message-State: AOAM531UJDuvGg28dPgR8/FsZ8ehw5hf/bFWcMztW/bEVvGzaESP9bnS
 ZQrMb6j4UhpQugX4xj1aDRmPRQSgK71VXqKGkXk=
X-Google-Smtp-Source: ABdhPJxrjEyuzY1Uv6PT4uCbsCv1WEw2n5HqFzucR460BX9AZAaLE6eEDP9sSAIcg1VcepGwk/mWxNQ6/srQ85SDJXY=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr30516458plc.0.1620206250236; Wed, 05 May
 2021 02:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
In-Reply-To: <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 May 2021 12:17:14 +0300
Message-ID: <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgNSwgMjAyMSBhdCAxMjowNyBQTSBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPiB3cm90ZToKPiBPbiA1LzQvMjEgOTo1MiBBTSwgQW5keSBTaGV2Y2hlbmtvIHdy
b3RlOgo+ID4gT24gTW9uZGF5LCBNYXkgMywgMjAyMSwgSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbSA8bWFpbHRvOmhkZWdvZWRlQHJlZGhhdC5jb20+PiB3cm90ZToKCi4uLgoKPiA+
ICAgICArICAgICAgICAgICAgICAgZndub2RlID0gZGV2aWNlX2dldF9uZXh0X2NoaWxkX25vZGUo
a2RldiwgZndub2RlKTsKCj4gPiBXaG8gaXMgZHJvcHBpbmcgcmVmZXJlbmNlIGNvdW50aW5nIG9u
IGZ3bm9kZSA/Cj4KPiBXZSBhcmUgZGVhbGluZyB3aXRoIEFDUEkgZndub2RlLXMgaGVyZSBhbmQg
dGhvc2UgYXJlIG5vdCByZWYtY291bnRlZCwgdGhleQo+IGFyZSBlbWJlZGRlZCBpbnNpZGUgYSBz
dHJ1Y3QgYWNwaV9kZXZpY2UgYW5kIHRoZWlyIGxpZmV0aW1lIGlzIHRpZWQgdG8KPiB0aGF0IHN0
cnVjdC4gVGhleSBzaG91bGQgcHJvYmFibHkgc3RpbGwgYmUgcmVmLWNvdW50ZWQgKHdpdGggdGhl
IGNvdW50Cj4gbmV2ZXIgZHJvcHBpbmcgdG8gMCkgc28gdGhhdCB0aGUgZ2VuZXJpYyBmd25vZGUg
ZnVuY3Rpb25zIGJlaGF2ZSB0aGUgc2FtZQo+IGFueXdoZXJlIGJ1dCBhdG0gdGhlIEFDUEkgbm9k
ZXMgYXJlIG5vdCByZWZjb3VudGVkLCBzZWU6IGFjcGlfZ2V0X25leHRfc3Vibm9kZSgpCj4gaW4g
ZHJpdmVycy9hY3BpL3Byb3BlcnR5LmMgd2hpY2ggaXMgdGhlIGdldF9uZXh0X2NoaWxkX25vZGUo
KSBpbXBsZW1lbnRhdGlvbgo+IGZvciBBQ1BJIGZ3bm9kZS1zLgoKWWVzLCBBQ1BJIGN1cnJlbnRs
eSBpcyBleGNlcHRpb25hbCwgYnV0IGZ3bm9kZSBBUEkgaXMgbm90LgpJZiB5b3UgbWF5IGd1YXJh
bnRlZSB0aGF0IHRoaXMgY2FzZSB3b24ndCBldmVyIGJlIG91dHNpZGUgb2YgQUNQSSBhbmQKZXZl
biB0aG91Z2ggaWYgQUNQSSB3b24ndCBldmVyIGdhaW4gYSByZWZlcmVuY2UgY291bnRpbmcgZm9y
IGZ3bm9kZXMsCndlIGNhbiBsZWF2ZSBpdCBhcyBpcy4KCj4gPiBJ4oCZbSBpbiB0aGUgbWlkZGxl
IG9mIGEgcGlsZSBvZiBmaXhlcyBmb3IgZndub2RlIHJlZmNvdW50aW5nIHdoZW4gZm9yX2VhY2hf
Y2hpbGQgb3IgZ2V0X25leHRfY2hpbGQgaXMgdXNlZC4gU28sIHBsZWFzZSBkb3VibGUgY2hlY2sg
eW91IGRyb3AgYSByZWZlcmVuY2UuCj4KPiBUaGUga2RvYyBjb21tZW50cyBvbiBkZXZpY2VfZ2V0
X25leHRfY2hpbGRfbm9kZSgpIC8gZndub2RlX2dldF9uZXh0X2NoaWxkX25vZGUoKQo+IGRvIG5v
dCBtZW50aW9uIGFueXRoaW5nIGFib3V0IHRoZXNlIGZ1bmN0aW9ucyByZXR1cm5pbmcgYSByZWZl
cmVuY2UuCgpJdCdzIHBvc3NpYmxlLiBJIGR1bm5vIGlmIGl0IGhhZCB0byBiZSBkb25lIGVhcmxp
ZXIuIFNha2FyaT8KCj4gU28gSSB0aGluayB3ZSBuZWVkIHRvIGZpcnN0IG1ha2UgdXAgb3VyIG1p
bmQgaGVyZSBob3cgd2Ugd2FudCB0aGlzIGFsbCB0bwo+IHdvcmsgYW5kIHRoZW4gZml4IHRoZSBh
Y3R1YWwgaW1wbGVtZW50YXRpb24gYW5kIGRvY3MgYmVmb3JlIGZpeGluZyBjYWxsZXJzLgoKV2Ug
aGF2ZSBhbHJlYWR5IGlzc3Vlcywgc28gSSBwcmVmZXIgbm90IHRvIHdhaXQgZm9yIGEgZG9jdW1l
bnRhdGlvbgp1cGRhdGUsIGJlY2F1c2UgZm9yIG9sZCBrZXJuZWxzIGl0IHdpbGwgc3RpbGwgYmUg
YW4gaXNzdWUuCgpJbiBhbnkgY2FzZSBtb3N0IG9mIG15IGZpeGVzIGFyZSBhZ2FpbnN0IExFRCBz
dWJzeXN0ZW0gKGRyaXZlcnMpIGFuZAp0aGV5IGFyZSB2YWxpZCBkdWUgdG8gdXNlIGluIHRoZSBP
RiBlbnZpcm9ubWVudC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
