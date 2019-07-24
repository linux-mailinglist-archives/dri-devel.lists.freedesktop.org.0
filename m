Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A172ED5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6298E6E526;
	Wed, 24 Jul 2019 12:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1164F6E526
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:28:20 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z28so44396497ljn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 05:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnFRrjn0TKFSO53Z4vw5L2TAuqXiorYRBuE8sMRWfRc=;
 b=AogQxmfLaypKdEFBsQJFkhdm2FYpqhoVpdlR3V5+vL7BEmJ/oSCAd8bgHRXmWo/UrZ
 WZZZc0hQTOQCYskbUoOw0BYVK4pgLKwLTy3cbRmhav6/4yfdmOZcMwq+hzi0el1ETq1R
 EngqfryxSrP3/9AyvnYLwNugbNAPSw2S5w9p0x08QoR7e3twYgpgdC0pesHEDxysfsmn
 wKbQQxHcbG0hhN3kTcjyub4Ma5cYqP9ghtGjAR7m1TZdOnP8O3JXTh/Rkur4kKAudfu6
 Vd6KdCl97Fc823FsseGCw9Urfj5raWs6CJH/p4/0SW1wR3J6jW2BfumkyyV18uLyepeH
 koRg==
X-Gm-Message-State: APjAAAVJkDEPPMxwxT8Ht8m5BdkIvlJ3Rnn2PI58b8T0TvNArn7Y/7z7
 wzc8nLebdQOSk//0OKggrKNM/3kaIPMwBYlWTJ9PaA==
X-Google-Smtp-Source: APXvYqwgYv0otgZCIbaqMZFgnB3JNi+nA7vgHZwlC7+GD84dSkFGvlOnFbX3ZXcy9cs9mHfTo/Z6ts0cyasDYsiH7Dg=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr27443493ljh.69.1563971297717; 
 Wed, 24 Jul 2019 05:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723181000.GA24663@ravnborg.org>
In-Reply-To: <20190723181000.GA24663@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Jul 2019 14:28:06 +0200
Message-ID: <CACRpkdZhYy6o9xMD42pQm-MCZUi0EpXs1uwQg6D-B4NXpyMHWw@mail.gmail.com>
Subject: Re: [PATCH 0/3] RFT: PL111 DRM conversion of nspire
To: Sam Ravnborg <sam@ravnborg.org>, Pawel Moll <pawel.moll@arm.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tnFRrjn0TKFSO53Z4vw5L2TAuqXiorYRBuE8sMRWfRc=;
 b=TQPjESYCo3MbNGijnGd1b5vdpAmQQmfLi3tbmCpwa9zhVfWhyFq71XIjmX5jSIJniL
 r7TO4O442i4tvsLiQGE35z29/+CbwtrIufkXlo+Jtuppi7gb5T3zpizpGGWFn5+IWHkD
 NYPNsrigYSRfc+CQsneh0OlcrFWuoTZcnm3wPp94Uk0nvfeE0IXJv5kxRAxNJVrafLDp
 XxUoCRbL8/8XqfgMNXYUNVBklshm+RuaA3/ygIxN9q1HxJBn7lRfg0cS03yXZilovLjO
 ruZLAwdSRt7SuOZQu7yn2aVFJ4gWHjta6GlzOWSON47Mvpd2uGXKE8RQl4APQhIaiCBs
 pnnw==
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgODoxMCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0IDAzOjM3OjUyUE0gKzAyMDAs
IExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBTbyB0aGlzIGlzIGEgY29sZC1jb2RlZCBhdHRlbXB0
IHRvIG1vdmUgdGhlIFRJIG5zcGlyZSBvdmVyIHRvCj4gPiB1c2luZyBEUk0uIEl0IGlzIG1vcmUg
b3IgbGVzcyB0aGUgbGFzdCB1c2VyIG9mIHRoZSBvbGQgZmJkZXYKPiA+IGRyaXZlciBzbyBpdCBp
cyBhIG5vYmxlIGNhdXNlIGFuZCBpbnRlcmVzdGluZyB1c2VjYXNlLgo+Cj4gRG8gd2UgbmVlZCB0
byBzdXBwb3J0IGFybSxwbDExeCx0ZnQtcjBnMGIwLXBhZHMgYmVmb3JlCj4gd2UgY2FuIG9ic29s
ZXRlIGZiZGV2IHN0dWZmPwoKTm8gSSBkb24ndCB0aGluayBzbywgdGhlIG9ubHkgaW4tdHJlZSBw
bGF0Zm9ybSB0aGF0IHdhcyB1c2luZyBpdCB3YXMKdGhlIE5vbWFkaWsgYW5kIGFsbCBpdCBkaWQg
d2FzIHRvIHN3aXRjaCBSR0IgdG8gQkdSIGFuZApJIGFscmVhZHkgaGFuZGxlIHRoYXQgaW4gdGhl
IGRyaXZlciB1c2luZyB0aGUgaGFyZHdhcmUKZmVhdHVyZSB0byBzd2l0Y2ggUkdCIGFuZCBCR1Ig
YXJvdW5kIGluc3RlYWQuCgpSaWdodCBub3cgSSBqdXN0IGNoZWNrIHRoYXQgdGhlIHBhZHMgYXJl
IHRoZXJlLCBJIG1pZ2h0IGp1c3QKcmVtb3ZlIHRoZSBjaGVjay4KCkhvd2V2ZXIgUGF3ZWwgYWRk
ZWQgdGhpcyBiaW5kaW5nIGFuZCBtaWdodCBiZSBhYmxlIHRvIHRlbGwKc29tZXRoaW5nIGFib3V0
IGlmIHRoZXJlIGFyZSBwbGF0Zm9ybXMgb3V0IHRoZXJlIHRoYXQgcmVhbGx5Cm5lZWRzIHRoaXMu
IFBvc3NpYmx5IExpdml1IGtub3dzIG1vcmUuCgo+IExvb2tlZCB0aHJvdWdoIHRoZSBwYXRjaGVz
Lgo+IDEgYW5kIDMgYXJlOgo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CgpUaGFua3MhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
