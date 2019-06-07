Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CC3930C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 19:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E08789194;
	Fri,  7 Jun 2019 17:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E84689194
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 17:24:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id j24so2432991ljg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 10:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvs3ujD57naAfmKfNsIZ+NFc+doeqL+Vny0LiZy24zg=;
 b=YFjdUo5OJz/iFRYEIqPqJCeKCOa+C4sDpou1b8qKWDKPH7jxAOD+FH7kXAWPiZ0cc7
 U3RY6Aju3QI57VV3f5M8cXmvcB+c7YJemjwO/Nhakh78228yhVAz2dmUIl4Fs3K9SOO0
 lcCh7ySxIZw/55I/5a90Af/MKE6tu0StbCCGKWdDHqDsnu42IiixPha+qsluQ9TkB6ky
 YPBFUFtzrB6o8S+DFQOo7EgfMZbLnyUMu82zcFXVoPaRFMYVrkgo4qV/0n5BHEE5hpSU
 Tc99vpZf3yJtLPAKnoBoX8IFqBpseRN6K0Wv4HjS60f2sqew5rv2XV3gsMGZr582epdr
 y47g==
X-Gm-Message-State: APjAAAXVbgs6UL2N5MxNoVoOQbl1vxG0zb1eD8j4dcBfVSnn7PsfZPMf
 0Rb2QtQc6c1u16SU7OkdKpthh++B22w=
X-Google-Smtp-Source: APXvYqwDuw8R/2FguZSGOwEj+OC5PVIutMwI+Nat3nTIAzN4bYHubSpSIClKVeQ0oTZPVLRb26k3QA==
X-Received: by 2002:a2e:9d07:: with SMTP id t7mr21266822lji.43.1559928267225; 
 Fri, 07 Jun 2019 10:24:27 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id b11sm476023ljf.8.2019.06.07.10.24.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 10:24:26 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j29so2196923lfk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 10:24:26 -0700 (PDT)
X-Received: by 2002:ac2:4565:: with SMTP id k5mr23902691lfm.170.1559928265813; 
 Fri, 07 Jun 2019 10:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_2-ANvU3CsasrHkaJsyRV+NxP1AoM0ZSu8teht3FuEg@mail.gmail.com>
 <CAHk-=wgOGPPO6owAcRiBd0KJpmjH-C83-=_N6QeQzyiCW4kb0w@mail.gmail.com>
In-Reply-To: <CAHk-=wgOGPPO6owAcRiBd0KJpmjH-C83-=_N6QeQzyiCW4kb0w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Jun 2019 10:24:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipemA-iriz99pRYvoGszNjQn9cUHwzvV55HOrx-KEmWw@mail.gmail.com>
Message-ID: <CAHk-=wipemA-iriz99pRYvoGszNjQn9cUHwzvV55HOrx-KEmWw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for v5.2-rc4 (v2)
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rvs3ujD57naAfmKfNsIZ+NFc+doeqL+Vny0LiZy24zg=;
 b=HJLBkowV2olHeKEHPjimbZ4AIcfMLKHtIu0nL7BRIAel63MHnYXUHTX65sX00ikeCq
 Z6tHEUAlBObR3xwKed/8hqLdaXGObdkgGprO0NTrgJNl/pEIAUUDV8D/9pv0vUOJlBP8
 Frj3ERAz0q4FVPxu1SYZ53YyTGDvL3jzpjJLM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMDoyMCBBTSBMaW51cyBUb3J2YWxkcwo8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gVGhlIHNlY29uZCBvbmUgaGFzIHRoZSBz
dWJqZWN0LCBhbmQgbWVudGlvbnMgbm91dmVhdSwgYnV0IGRvZXNuJ3QKPiBhY3R1YWxseSBoYXZl
IHRoZSB0YWcgbmFtZSBvciB0aGUgZXhwZWN0ZWQgZGlmZnN0YXQgYW5kIHNob3J0bG9nLgoKSG1t
LiBJJ20gZ3Vlc3NpbmcgeW91IG1lYW50IGZvciBtZSB0byBwdWxsIHRoZQoKICAndGFncy9kcm0t
Zml4ZXMtMjAxOS0wNi0wNy0xJwoKdGhpbmcsIHdoaWNoIGxvb2tzIGxpa2VseSwgYnV0IEknZCBs
aWtlIHRvIGhhdmUgY29uZmlybWF0aW9uLgoKICAgICAgICAgICAgICAgICBMaW51cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
