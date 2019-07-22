Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3B70AEA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53A189F0A;
	Mon, 22 Jul 2019 20:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA6889F0A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:57:29 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q22so77083728iog.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjNVdtHkZg8It4YZUOH939LIztpaI1Zp3lcG00+nZjU=;
 b=ofjSikJ6QEoi9+RZ2hho0uBbhploW+crqGFw8DybjyEogAlKLo5MrhjZYr5jOIIDU1
 AUD9ZiU2TJsH6TW//PYvNqeXtlzgh9fMr6alnr5APPqB/C58XwKnFB9PvgYE5mn4jyux
 ALhwGDjTnvsL+LDFIJu1O3b3YX+peZZlUNK0TMPXP3k87iJ9LxYGzZRahdX5vRVfRnjh
 qvwWqOd6CaqGbh4HfZ+lm15Em6UhZ6mQ4BIuTSdlgc6YouDi6UBPwRGRbBWpgq499fsn
 JxyXcSQU//k72COYwySvzOU558lg1yyPxTk8OrfmimtHtRgf6YxKVflgzOD/m2rnRRa8
 5s1g==
X-Gm-Message-State: APjAAAUcFB6mEzET8mdvh8i6P4355IJZZPMNg9GPvapdZ37/lppddGr9
 mQgxnTO/HchZEHLD2sa9bSa7LvPwToU=
X-Google-Smtp-Source: APXvYqyHBQ8NXcs27OYYzEQE92BpsEfRDI9pmwtGjY0EWloxGLs2b9ZixHnzEBCeqeMnWtQGBZKwrQ==
X-Received: by 2002:a02:c646:: with SMTP id k6mr2368797jan.134.1563829048303; 
 Mon, 22 Jul 2019 13:57:28 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id s4sm52670463iop.25.2019.07.22.13.57.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 13:57:26 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id i10so77016659iol.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 13:57:26 -0700 (PDT)
X-Received: by 2002:a6b:5103:: with SMTP id f3mr62856397iob.142.1563829045931; 
 Mon, 22 Jul 2019 13:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190722181945.244395-1-mka@chromium.org>
 <20190722202426.GL104440@art_vandelay>
In-Reply-To: <20190722202426.GL104440@art_vandelay>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2019 13:57:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vk5V+gJhW8=6ZFfgV6LdN2U3-VkZvqn7QWDw-215-Z1Q@mail.gmail.com>
Message-ID: <CAD=FV=Vk5V+gJhW8=6ZFfgV6LdN2U3-VkZvqn7QWDw-215-Z1Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
To: Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kjNVdtHkZg8It4YZUOH939LIztpaI1Zp3lcG00+nZjU=;
 b=lbzR2JAR1Xj8v+LEHhuv9HHjJ4d7YIm5QqhsKkrwvOifG5eoDrfVRRllHmnKA/7Yzt
 GT2JF5v9TVpFuX926EjboYL5oSVmwjs2vMtLRG5M2AubrOtCPSaVg9JbP6cVUcJcOEgA
 55/inpf42lOPhWucflo/PmL7+VtgqwdmQAQiU=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxOjI0IFBNIFNlYW4gUGF1bCA8c2VhbkBwb29y
bHkucnVuPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDExOjE5OjQ1QU0gLTA3
MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gVGhlIEREQy9DSSBwcm90b2NvbCBpbnZv
bHZlcyBzZW5kaW5nIGEgbXVsdGktYnl0ZSByZXF1ZXN0IHRvIHRoZQo+ID4gZGlzcGxheSB2aWEg
STJDLCB3aGljaCBpcyB0eXBpY2FsbHkgZm9sbG93ZWQgYnkgYSBtdWx0aS1ieXRlCj4gPiByZXNw
b25zZS4gVGhlIGludGVybmFsIEkyQyBjb250cm9sbGVyIG9ubHkgYWxsb3dzIHNpbmdsZSBieXRl
Cj4gPiByZWFkcy93cml0ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5dGVzLCBoZW5jZSBE
REMvQ0kgaXMgbm90Cj4gPiBzdXBwb3J0ZWQgd2hlbiB0aGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xs
ZXIgaXMgdXNlZC4gVGhlIEkyQwo+Cj4gVGhpcyBpcyB2ZXJ5IGxpa2VseSBhIHN0dXBpZCBxdWVz
dGlvbiwgYnV0IEkgZGlkbid0IHNlZSBhbiBhbnN3ZXIgZm9yIGl0LCBzbwo+IEknbGwganVzdCBh
c2sgOikKPgo+IElmIHRoZSBjb250cm9sbGVyIHN1cHBvcnRzIHhmZXJzIG9mIDggYnl0ZXMgYW5k
IDEgYnl0ZXMsIGNvdWxkIHlvdSBqdXN0IHNwbGl0Cj4gdXAgYW55IG9mIHRoZXNlIHRyYW5zYWN0
aW9ucyBpbnRvIGxlbi84K2xlbiU4IHRyYW5zYWN0aW9ucz8KCkl0J3Mgbm90IHF1aXRlIHRoYXQg
ZWFzeSwgSSB0aGluay4gIFNwZWNpZmljYWxseSBhIDEtYnl0ZSB0cmFuc2Zlcgppc24ndCByZWFs
bHkgYSAxLWJ5dGUgdHJhbnNmZXIuCgpJdCBhbHdheXMgc3RpY2tzIHRoaXMgb24gdGhlIHdpcmUg
Zm9yIGEgMS1ieXRlIHdyaXRlOgoKU3RhcnQKU2xhdmUgYWRkcmVzcyAoNyBiaXRzKSArIHdyaXRl
ICgxIGJpdCkKKHdhaXQgYWNrKQpSZWdpc3RlciBhZGRyZXNzCjEgYnl0ZSBvZiBkYXRhCndhaXQg
Zm9yIGFjawpTdG9wCgouLi5vciBmb3IgYSAxLWJ5dGUgcmVhZDoKClN0YXJ0ClNsYXZlIGFkZHJl
c3MgKDcgYml0cykgKyB3cml0ZSAoMSBiaXQpCih3YWl0IGFjaykKUmVnaXN0ZXIgYWRkcmVzcwoo
d2FpdCBhY2spClJlcGVhdGVkIFN0YXJ0ICgxIGJpdCkKU2xhdmUgYWRkcmVzcyAoNyBiaXRzKSAr
IHJlYWQgKDEgYml0KQoocmVhZCAxIGJ5dGUgb2YgZGF0YSkKQWNrClN0b3AKClB1dHRpbmcgbW9y
ZSB0aGFuIG9uZSBvZiB0aG9zZSBpbiBhIHJvdyBpcyBub3QgdGhlIHNhbWUgdGhpbmcgYXMganVz
dApkb2luZyBhIHdob2xlIGJ1bmNoIG9mIHJlYWRzIG9yIGEgd2hvbGUgYnVuY2ggb2Ygd3JpdGVz
IHdpdGggbm8gInN0b3AiCmluIGJldHdlZW4uCgpBcyBmYXIgYXMgSSBjb3VsZCBmaW5kIG91dCBh
Ym91dCBEREMvQ0kgaXQncyBwYXJ0IG9mIHRoZSBzcGVjIHRvIF9ub3RfCnNlbmQgdGhlIHN0b3Ag
YmV0d2VlbiB0aGUgcmVhZHMgLyB3cml0ZXMuCgoKLURvdWcKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
