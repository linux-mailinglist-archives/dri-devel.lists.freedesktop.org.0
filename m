Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FF165C9F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3176E8C0;
	Thu, 20 Feb 2020 11:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A346E8C0;
 Thu, 20 Feb 2020 11:20:17 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 7so2397692vsr.10;
 Thu, 20 Feb 2020 03:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=swab1ZDqFn3orZ1qK4MWOi3W0t7vuqtBo3QjNvIfb80=;
 b=uNhSdcIA1CjnLH8xBTqjdwF/jnXAzBCcrn/2n+FuUptwqWikAGsHoTHfktHYUHrH2S
 lk9ur7812XQwZH9K2NR3dG0810SHTuteOpi13CQPphtIQIlF2RhqEspaz9lpFudRgRgX
 LAa7Z6iriNSYj5v8zskR0AU2mxHVlTB6ec86IkBTccgCM+0+xa9UcdbNGTS1cr+yn9lr
 XwmTVBEwSA92PguS78c65kRDWXBukItHGfuoGIMg3YdQcGD6v4J6eWrw9Ml6FvwPRBLO
 7iPe5GZpznFJktwPYr5MpAUhnDHRQFJ95nSGGZT6u3qMqluiOJEoqujBBI3Cu+TLf+H3
 LHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=swab1ZDqFn3orZ1qK4MWOi3W0t7vuqtBo3QjNvIfb80=;
 b=JbV0ypfEEtXzsTy2Wlv7yXxZe730/hU4Yiw9Q4QH2oOO3lBhP/L/IrPojMvMP5Zyfn
 NgL2w26ndCHxfafFBp8Za6V4djKwM4qMqWmsi5zh2MyNjCegn3TfP3aHOzdP2hLbod9r
 y2ANm8uVVKQiSHIpvGq5+L1rxztXPpvrilH2Egjbtx+cjUxvfeyh0z+DZg5BLtodZ3xP
 AJXBtUdcYGQ4N5QDmiPxAVBtGIgjdU4FMTpQ43QfFuGUDpqHXPxpROzJAjlM1mJhv+bo
 osJagsmi8f7aRztmNnveYQORR86JVrCYoVSlupuBtsM2AoEEB4Yjr7bkr7HPSlUs9fcz
 PvRA==
X-Gm-Message-State: APjAAAXHiqTknh/D4o1siXEJqAT650WPIKi9tyn1UXG6OmuN/JE9Fv3k
 fkNSfevUtFMaJv3IZi7LPWfGlCWWdYh3wn9lVtPUDW9k
X-Google-Smtp-Source: APXvYqzWK6Yu7CHHAmXyNXFloJxWFjfldTbZwdsKmROBCHRg29O3/IxOID6wzhpqS22idYeSIw56yRZW9ZLnv6ZLgvU=
X-Received: by 2002:a05:6102:7a4:: with SMTP id
 x4mr16019947vsg.85.1582197616477; 
 Thu, 20 Feb 2020 03:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20191107151725.10507-1-ville.syrjala@linux.intel.com>
 <20191107151725.10507-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20191107151725.10507-5-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 11:20:05 +0000
Message-ID: <CACvgo53oWVf2=DGCopMrk0kjqZ+5ULXApEfj99xWZxD8vSUyMA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 04/12] drm/i915: Add i9xx_lut_8()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA3IE5vdiAyMDE5IGF0IDE1OjE3LCBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gV2UgaGF2ZSBhIG5pY2UgbGl0dGxlIGhlbHBl
ciB0byBjb21wdXRlIGEgc2luZ2xlIExVVCBlbnRyeQo+IGZvciBldmVyeXRoaW5nIGV4Y2VwdCB0
aGUgOGJwYyBsZWdhY3kgZ2FtbWEgbW9kZS4gTGV0J3MKPiBjb21wbGV0ZSB0aGUgc2V0Lgo+CkF0
IGEgbGF0ZXIgc3RhZ2Ugb25lIGNvdWxkIHJlbmFtZSB0aGlzICYgdGhlIDEwYml0IG9uZSwgbW92
aW5nIHRoZW0gdG8KaW5jbHVkZS9kcm0vLgpUaGVyZSBhcmUgb3RoZXIgZHJpdmVycyBkb2luZyB0
aGUgc2FtZSB0aGluZy4uLiBub3Qgc3VyZSBpZiB0aGF0J3MKd29ydGggaXQgdGhvdWdoLgoKUmV2
aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgotRW1p
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
