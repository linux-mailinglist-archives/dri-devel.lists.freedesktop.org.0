Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEBF6EB2D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 21:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AFD6E868;
	Fri, 19 Jul 2019 19:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B7C6E868
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 19:40:32 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c19so22508772lfm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 12:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=WANkkcuR4ZoTS+A1wCt4CCKlkbrfCtHWWLwhmW2vQrw=;
 b=V1S3AXCO5BPFBZhlziNEy7Tqi+djhYLr1MxenM7LVZF3nL1wU3xtT+eziYeO+YimhZ
 MJe7tqmpOlF7wp/s4oF4ioklAdOSI75bLmavxLAJHj3Ijwys5bWWnxrNg60TDE8l1ryl
 EoXx0LzznfOajpm3QqsK9qr4zsIxeWYRIahBtG8FHnGg6motT2k0zjTjHT4zNnvTmBwp
 vdwFMTBK5sdBGTTadwHv7M9xoxmoHRc8XMx1T2t/OMnV6hvvFdIF4SOodmySvnCpN0Rk
 BCbJjv+W870/hPlxqbVBP2hjJCTioE/alo7QkA0olDPZ22RkyLeTT98oq8FGnofD5aQV
 MxvQ==
X-Gm-Message-State: APjAAAVIT+Zq5YpEsJ7gIO+j21FZE5SPLsVgntQhrvfhIA66v+J5/Kwh
 BXr0AiWIb1SHl+IPDvcUawKHyJYyUG0=
X-Google-Smtp-Source: APXvYqyfYyvFICDO0uJ/wzSTuMwHJKnu8axrXOWC8eyHCtf3s+HApiykpml2Neqlt+PEnLPUJQUPfA==
X-Received: by 2002:a19:6e4d:: with SMTP id q13mr25171647lfk.6.1563565230613; 
 Fri, 19 Jul 2019 12:40:30 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id z85sm5862229ljb.101.2019.07.19.12.40.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 12:40:29 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id v18so31786560ljh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 12:40:29 -0700 (PDT)
X-Received: by 2002:a2e:b003:: with SMTP id y3mr28838104ljk.72.1563565228772; 
 Fri, 19 Jul 2019 12:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190719154207.GA9708@phenom.ffwll.local>
In-Reply-To: <20190719154207.GA9708@phenom.ffwll.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Jul 2019 12:40:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjEE4KGcyL0AJ6YxYvjPHUm9bn_7pZBCmqb-i3+j8p49Q@mail.gmail.com>
Message-ID: <CAHk-=wjEE4KGcyL0AJ6YxYvjPHUm9bn_7pZBCmqb-i3+j8p49Q@mail.gmail.com>
Subject: Re: [PULL] drm-next fixes for -rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=WANkkcuR4ZoTS+A1wCt4CCKlkbrfCtHWWLwhmW2vQrw=;
 b=gtJxWlEI7uO9qW78f87XOfMG4qMIrai67FUQzFrdXCIUmzxIaZCyJrTacXlGm51h6k
 fNny7Uy6wJpZ7fs9KnSU3ahxt+WmphTauguJ7gpnrZaBtX0bj8AKRW+BhYCqTSJTKDV0
 +LFO3yAzLgGDz9j/bQbLAbIv2OicuyZUpCBvY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgODo0MyBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IGRybSBmaXhlcyBmb3IgLXJjMToKPgo+IG5vdXZlYXU6
Cj4gLSBidWdmaXhlcyArIFRVMTE2IGVuYWJsaW5nIChtaW5vciBpdGVyYXRpb24pOncKCkFza2lu
ZyB0aGUgaW1wb3J0YW50IHF1ZXN0aW9uOgoKIC0gV1RIIGlzIHRoYXQgIjp3IiB0aGluZz8KCkkg
aGF2ZSBhIHRoZW9yeSB0aGF0IGl0J3MganVzdCBhICJJJ20gY29uZnVzZWQgYnkgJ3ZpJyIgbWFy
a2VyLiAgVmVyeQp1bmRlcnN0YW5kYWJsZS4KCkJ1dCBJJ20gYWxzbyBlbnRlcnRhaW5pbmcgdGhl
IHBvc3NpYmlsaXR5IHRoYXQgaXQncyBhIG5ldyAid2hpc3RsaW5nCmd1eSIgZW1vdGljb24uIE9y
IG1heWJlIGEgImh1bmdyeSBiYWJ5IGJpcmQgZmFjZSIgZW1vdGljb24uCgpBZG1pdHRlZGx5IG5v
dCBhIF9ncmVhdF8gbmV3IGFkZGl0aW9uIHRvIHRoZSBlbW90aWNvbnMgSSd2ZSBzZWVuLCBidXQK
aGV5LCBJJ20gbm90IGp1ZGdpbmcuIE11Y2guCgpJIGxlZnQgaXQgaW4gdGhlIG1lcmdlIG1lc3Nh
Z2UgZm9yIHBvc3Rlcml0eSwgcmVnYXJkbGVzcy4KCiAgICAgICAgICAgIExpbnVzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
