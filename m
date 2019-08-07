Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D798B85461
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 22:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17A9899EA;
	Wed,  7 Aug 2019 20:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A69899EA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 20:15:33 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so42387824plr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RU+mCl+d15cBnmP6BMoJqIyEACy478kUYuCNnNZJiqw=;
 b=Qe9GOs+Qx1Rp1/FrhTSvaY8RvKh3BMp3Qy4QfQ2s0jvx7Dx/HhYyfxua+cf+3tU3SW
 EedIX5qG71gsfJ6I3uUdvlz0H46hI0g6Ubwms8ezut+Dn2wwtErjv+NJJsgHNKTvPIg9
 mfLuB8DQtX8+lww/Ep/G4cRtGXBorn4dkLk4CZScKIBt28dQtpXaws72QfoH7DgQOy9I
 Qb7P/iC1zdEG0aV/K4Ay9Y/2o6Ppz5AdyLqXzJiuk5jliHtIHM5Baj+BZObvOe1mjna8
 FaCpflqRGxifUGfGzvwMZJ23VtpjVUV5j2NGZCVhf15mrQxKECMkNZ7UaeeJcT1cFlQI
 GsbQ==
X-Gm-Message-State: APjAAAXyPvx4OFhIsrouYUMDLl0POCszuTmmddum7gn+fAJv/W+nI549
 Dj1mhCjPwwS6L4NeN2hj1C/Htg==
X-Google-Smtp-Source: APXvYqzcVZwYo5rrOlwBwZoU659GCbZRYFCC2aSl+NJNpuqYHhxbX896kG9fN1cjA8EAoMnQE6+lFQ==
X-Received: by 2002:a17:902:b582:: with SMTP id
 a2mr10103527pls.128.1565208933200; 
 Wed, 07 Aug 2019 13:15:33 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id w197sm116457813pfd.41.2019.08.07.13.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 13:15:32 -0700 (PDT)
Date: Wed, 7 Aug 2019 13:15:28 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190807201528.GO250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709190007.91260-3-mka@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RU+mCl+d15cBnmP6BMoJqIyEACy478kUYuCNnNZJiqw=;
 b=RwoY0vyVibrSFxjnucYfjp+aWRh2NgUEtgqFYjY8w08e7aiLVLcxKn9RCWHq4b7SJk
 8FUeg3lCxv6f5agtWIgt/tatmSYIRk7tQRv0RZf4BH0NKtCUnT5xLuQvXFDvXqH0W8Ui
 PKtctk6GL5/3C3yNzZ90bt706+jZtcmRS4NJw=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDVQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxj
a2Ugd3JvdGU6Cj4gQmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVu
dCBzaGFwZXMuIFRoZSB0d28gbWFpbgo+IHR5cGVzIGFyZSBsaW5lYXIgYW5kIG5vbi1saW5lYXIg
Y3VydmVzLiBUaGUgaHVtYW4gZXllIGRvZXNuJ3QKPiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFz
aW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+IGFsc28gODhiYTk1YmVk
Yjc5ICJiYWNrbGlnaHQ6IHB3bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRAo+IGxpbmVh
cmx5IHRvIGh1bWFuIGV5ZSIpLCBoZW5jZSBtYW55IGJhY2tsaWdodHMgdXNlIG5vbi1saW5lYXIg
KG9mdGVuCj4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2
ZSBjdXJyZW50bHkgaXMgb3BhcXVlCj4gdG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4g
dXNlcyBtb3JlIG9yIGxlc3MgcmVsaWFibGUgaGV1cmlzdGljcwo+IChsaWtlIHRoZSBudW1iZXIg
b2YgYnJpZ2h0bmVzcyBsZXZlbHMpIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHRyZWF0IGEKPiBiYWNr
bGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+IAo+IEV4cG9ydCB0aGUgdHlw
ZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2aWEgdGhlIG5ldyBzeXNmcyBhdHRyaWJ1dGUKPiAn
c2NhbGUnLiBUaGUgdmFsdWUgb2YgdGhlIGF0dHJpYnV0ZSBjYW4gYmUgJ2xpbmVhcicsICdub24t
bGluZWFyJyBvcgo+ICd1bmtub3duJy4gRm9yIGRldmljZXMgdGhhdCBkb24ndCBwcm92aWRlIGlu
Zm9ybWF0aW9uIGFib3V0IHRoZSBzY2FsZQo+IG9mIHRoZWlyIGJyaWdodG5lc3MgY3VydmUgdGhl
IHZhbHVlIG9mIHRoZSAnc2NhbGUnIGF0dHJpYnV0ZSBpcyAndW5rbm93bicuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+CgpEYW5pZWwgKGV0
IGFsKTogZG8geW91IGhhdmUgYW55IG1vcmUgY29tbWVudHMgb24gdGhpcyBwYXRjaC9zZXJpZXMg
b3IKaXMgaXQgcmVhZHkgdG8gbGFuZD8KClRoYW5rcwoKTWF0dGhpYXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
