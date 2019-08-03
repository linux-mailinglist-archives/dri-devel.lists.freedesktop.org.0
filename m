Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1DD80599
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 11:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B626E467;
	Sat,  3 Aug 2019 09:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250266E467
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 09:52:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b17so54649790lff.7
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2019 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K594JGSknkAcZWf3euXiHTro/vk9tms/9rcP/e8gVDk=;
 b=ApuwJTnp6Z4TaJ86ph0qJIAIQztLVwVUdBCmm/ugmAYaCTfL9vvsO1NX6Iq1eDTcer
 l21csLpopgxFYEU7+M8dbquo6qe7SYN21FE9sh7NaBooyc89W/dCn/W9q2IPYff2B4y3
 0HxQ0mss3NeRiU/TTGELTmjQu0aUtLO5VcsXkTBhSkvDKdwyk9/z0rg++YmkGeWowZIl
 INu3k5wIrhitJqqYV2JseH7E17srilscSFTeIeRGG5L+xLPwlMIMRD78YGf9Uj7kFn+D
 NmsNF98fHdOAjZQ8lZt2JM0kJqeVEc+MwcvP3IS2Sr9Jxxef/rQrwvN9sXQh4/7A2TJU
 uRfg==
X-Gm-Message-State: APjAAAXT6GzHG8MDEoQjFLruMd6Zjo2wdhG8ntNZtNYue95djWWHTPqv
 ssWX1tK9N2MmA817UDXYHNhrwvJ2WQUdL5Gv/mmNNQ==
X-Google-Smtp-Source: APXvYqzvP5D4HG2MtagSK7Kt0YP7GwP6ea61hWlrYqCP0tfsH4AreuQRQ1Y+wbXqv39HPwj3Fxu+I6wxa3fBUP81u7Y=
X-Received: by 2002:a05:6512:205:: with SMTP id a5mr685384lfo.60.1564825930461; 
 Sat, 03 Aug 2019 02:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <1709073.y2qmsckc0Q@linux-e202.suse.de>
 <CACRpkdYAgLJ9asftN5EafeN5EVEyH_xHVdwjbecZqvgz-JJ98A@mail.gmail.com>
 <12154694.e2V3OH3Rcx@linux-e202.suse.de>
In-Reply-To: <12154694.e2V3OH3Rcx@linux-e202.suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Aug 2019 11:51:59 +0200
Message-ID: <CACRpkda-5xu2-X5yo=dXchSvuD=ZmZSpTbGNrkv6V+UKs27xWA@mail.gmail.com>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
To: Fabian Vogt <fabian@ritter-vogt.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=K594JGSknkAcZWf3euXiHTro/vk9tms/9rcP/e8gVDk=;
 b=K8U3VUiNeAnpQ/N3lR/RllAdNvL29fI0dUQ6kRi2aXYuMb0Ui24hdqf0f3v9KEFrgf
 ALYVnfWhdmdhUvE25D+23BrX7paKQeSd1FBY20o/174MuS94pnXlnBCmF1aEcu+H6x9k
 Ki0sBlMhq90RbCKn34BjW3U16Kck/phVFxxuWZSfwGlEzCugnLe9FK8bZoXLE485kxer
 dzrqitGrpTz0z7gO0JRjvuN3nrKVo46hCfocwGeJygcSEvktz56C6D/LpRyifeSQbQFF
 jScxqmTasC7oN0AWKki1NUPf6YsbX8Tp/n/qD9hIIFwl7af18QLTKGMsz7Uchjv+1mve
 ufmQ==
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
Cc: Daniel Tang <dt.tangr@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgOToyNiBQTSBGYWJpYW4gVm9ndCA8ZmFiaWFuQHJpdHRl
ci12b2d0LmRlPiB3cm90ZToKCj4gT24gYSByZWFsIENYIHRoZSBMQ0QgZGlzcGxheXMgc2hvd3Mg
Y29udGVudCB3aXRob3V0Cj4gYW55IG90aGVyIGNoYW5nZXMgdG8gdGhlIHNldCwgYnV0IGhhcyBh
IH4zSHogcHVsc2F0aW5nIGVmZmVjdCBzY3JvbGxpbmcgZnJvbQo+IHRoZSB0b3AgdG8gdGhlIGJv
dHRvbSBhbmQgdGhlIGdyYXkgdGV4dCBjaGFuZ2VzIGNvbG9yIHNsaWdodGx5LgoKU28geW91IG1l
YW4gc29tZXRoaW5nIG1lYW5pbmdmdWwgYXBwZWFycyBpbiB0aGUgTENECmJ1dCB0aGVyZSBhcmUg
dmlzdWFsIGRpc3R1cmJhbmNlcz8KCj4gV2l0aG91dCB0aGUgcGF0Y2hzZXQgYXBwbGllZCBldmVy
eXRoaW5nIGxvb2tzIHBlcmZlY3RseS4KPgo+IEkgdHJpZWQgc2V0dGluZyB2cmVmcmVzaCB0byAy
MCwgZmJfYnBwIHRvIDE2IGFuZCBmb3JjaW5nIGFuIGludmVydGVkIHBhbmVsCj4gY2xvY2ssIGJ1
dCB0aGUgcHVsc2luZyBkaWRuJ3QgY2hhbmdlLgo+Cj4gVXNpbmcgdGhlIGVtdWxhdGVkIENYIEkg
Y29tcGFyZWQgdGhlIGNvbnRlbnRzIG9mIHRoZSByZWdpc3RlcnMgYW5kIGZvdW5kCj4gdGhhdCBv
bmx5IHRoZSBJUEMgYml0ICh3aGljaCBJIHRyaWVkIHRvIHNldCwgc28gdGhhdCdzIGxpa2VseSBu
b3QgaXQpIGFuZAo+IHRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXJzIGhhdmUgYSBkaWZmZXJlbnQgY29u
dGVudC4KPgo+IEFueSBpZGVhPwoKSSB0aGluayBpdCdzIHRoZSBjbG9jayBzZXR0aW5ncyBpbiBw
YXRjaCAyLzMuCgpJIGp1c3Qgc2V0IHRoZW0gdG8gIjEwMDAiICgxTUh6IHNpbmNlIGl0cyBpbiBr
SHopIGJhc2VkIG9uIHNvbWUKZWR1Y2F0ZWQgZ3Vlc3Nlcy4KClRoZSBvbGQgZHJpdmVyIHNldCB0
aGUgY2xvY2sgdG8gIjEiIChrSHopIHNvIGp1c3QgdHJ5IHRoYXQgZmlyc3QsCm1heWJlIGl0IGlz
IHJlYWxseSB0aGF0IHNsb3cuCgpJdCdzIGp1c3QgdGhhdCB0aGUgb2xkIGRyaXZlciBhbHNvIHNl
dCByZWZyZXMgdG8gNjAgZnBzIHdoaWNoIGRvZXNuJ3QKYWRkIHVwLCBidXQgSSB0aGluayB0aGF0
IHNldHRpbmcgaXMgc2ltcGx5IGlnbm9yZWQgYW5kIHRoYXQgaXMgd2h5Cml0IHdvcmtzLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCllvdXJzLApMaW51cyBXYWxsZWlqCgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
