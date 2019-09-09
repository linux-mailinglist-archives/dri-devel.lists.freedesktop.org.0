Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71104AE422
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60B6E825;
	Tue, 10 Sep 2019 06:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850C89B3B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:25:27 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id f12so27319964iog.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2019 03:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iih+uQUiA9izQUGr4jy/Sqv8n1Gdl/kNYnNhnb/eS84=;
 b=f46KxPfKpPWgzftiCel+znVXDr9e8K8DYD4zrP2ikjgq4IxC4WNiFrSjA0sJy3K5lJ
 uTzbW3PWRgpKWHPgKx3GgBtGGug6XhQD5JRI3j7W8FgcuXg8r96ADwFO/i6xQmuyPcVM
 xxSpu2o5ZDCej3MCAHJg5DJoAhq9/7I6eaO/nEYAjm3clAr05GslCTYu9XTt+hIueRNc
 0lHcdex5CQTmoT2ecmLTkvFEI37BoHrUs1SxXKtrtQok2+CzC9kQUS+sVnHb9ClCeAmt
 LFcoUWHYjxNk3E9C2XNS/RrCTaL5Op5K9hFg1r8E3mJiq7Xg6FlNP0RyQMrEpQ01av/T
 o0Wg==
X-Gm-Message-State: APjAAAUr6VoFD428zQ8ekN8O1EMAavFaSq/9MJS6Lui9pMlzek9YRenG
 b2wNOGAwXal4UQ6K7MYWa7XPChRCCGY+bBzguYU=
X-Google-Smtp-Source: APXvYqwcEAG1JfqbQemeVAXvvAIlgTBhC6sqluMv7Q1nZgjEYLOd/AxmByYzgLyU3PLNhD2AQMMbQOen/2LF49mG7PI=
X-Received: by 2002:a5e:8e0c:: with SMTP id a12mr19710141ion.22.1568024726318; 
 Mon, 09 Sep 2019 03:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
 <20190908141307.GA7115@pc-sasha.localdomain>
 <20190909201159.778590a0@canb.auug.org.au>
 <20190909202128.0c420ddd@canb.auug.org.au>
In-Reply-To: <20190909202128.0c420ddd@canb.auug.org.au>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 9 Sep 2019 13:24:49 +0300
Message-ID: <CAJ1xhMXKNRfOm1Xj3B_cgLByBfDP03P+DBEbRpWc+tU6kdxtBw@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Iih+uQUiA9izQUGr4jy/Sqv8n1Gdl/kNYnNhnb/eS84=;
 b=blcu5F/m6M4e8lmPcljb3wQamY08n3LcD5Dz+Ie6fi0ZvtPexZLKYWO8dNDqhQyJZL
 6IOgDT+Bxx+K2S5qdmPOUCkbR2Fif4zO0W1AoY7yZTmuQcsg576fe/MwS0uK0UoV79TP
 nndu91jPG2ZIn5mVQ2pWMF0QUeFB2GIFibXC8PMJUHBcZZJwpUwb6bmkXrSIKdbxjOxw
 9z0wbc1CIlHSn/CficejXP59A85PdGcS11C5ZLMZf7+pVuWCcIojfGFVMlI0tOP/Ge34
 octtCcspkXOiWDLZvFT9Vw/AJxcEtwZpgkUNYCLRs4Ff0L06gUcrHuBwHiUzjI8YTpEl
 xmBg==
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
Cc: airlied@linux.ie, linux-kernel <linux-kernel@vger.kernel.org>,
 mripard@kernel.org, Linux-Next <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgOSwgMjAxOSBhdCAxOjIxIFBNIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5i
LmF1dWcub3JnLmF1PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gTW9uLCA5IFNlcCAyMDE5IDIwOjEx
OjU5ICsxMDAwIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToK
PiA+Cj4gPiBJZiB5b3UgYXJlIGJpc2VjdGluZyBsaW51eC1uZXh0LCBJIHdpbGwgc3VnZ2VzdCBi
aXNlY3RpbmcgYmV0d2VlbiB0aGUKPiA+IHN0YWJsZSBicmFuY2ggb24gbGludXgtbmV4dCAod2hp
Y2ggaXMganVzdCBMaW51cycgdHJlZSB3aGVuIEkgc3RhcnRlZAo+ID4gdGhhdCBkYXkpIGFuZCB0
aGUgdG9wIG9mIHRoZSBmaXJzdCBsaW51eC1uZXh0IHRoYXQgZmFpbHMuICAoQXNzdW1pbmcKPiA+
IHRoYXQgdGhlIHN0YWJsZSBicmFuY2ggaXMgZ29vZCkuCj4KPiBBY3R1YWxseSAoc2luY2UgeW91
IHdvbid0IGJlIGJpc2VjdGluZyB0aGUgbGF0ZXN0IGxpbnV4LW5leHQpLCB5b3UKPiBwcm9iYWJs
eSB3YW50IHRvIHVzZQo+Cj4gZ2l0IG1lcmdlLWJhc2Ugc3RhYmxlIG5leHQtMjAxOTA5MDMKPiAg
ICAgICAgIChvciB3aGF0ZXZlciBsaW51eC1uZXh0IHlvdSBhcmUgYmlzZWN0aW5nKQo+Cj4gYXMg
eW91ciBmaXJzdCBnb29kIGNvbW1pdCAoYXNzdW1pbmcgaXQgaWQgZ29vZCA6LSkpLgo+Cj4gLS0K
PiBDaGVlcnMsCj4gU3RlcGhlbiBSb3Rod2VsbAoKSGkgU3RlcGhlbiwKClRoYW5rcyB2ZXJ5IG11
Y2ggZm9yIHRoZSB0aXBzLgpJJ2xsIGdvIGFoZWFkIGFuZCBnaXZlIHRob3NlIGEgdHJ5LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
