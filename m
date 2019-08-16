Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB09074B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 19:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8426E38D;
	Fri, 16 Aug 2019 17:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76216E38D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:53:20 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w2so3490512pfi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qj+FqdPY7E+evYAajO1pGkO3Jxq482Q+PVPBi3aWl84=;
 b=nJO2JyxYkFHRO3yZJ5EBtKXUl5z/VpkEvq0nK9V/yQ5BdmvXjwTuLJL8zNpoIa2vnK
 bLMcEG3GYtMwPx/3YCUM318Ze2gAohBuguCvnU9s4C92Wgz24GafHpXoZEVlAJjosfO8
 kHjVIMt5Vz6MqVMfr04rdoKKKu+fzPq6DqpjeanCoBAJV2e6Lg0ghHj0oW/BaBHE2Zjd
 TGWKvM3u1cYHzOTZ1C3gavUG4txLVoFhxSO5Z8Rpch3akLjOaLTk65MkWmV/10XlA4oj
 TuUDDA12gmImfvabas1ZExJFVtWdzTbj2PQRJ1xXcWc8KvHeXqCSTD0kcokZDKg9E/VL
 3BJw==
X-Gm-Message-State: APjAAAW+ez7XLE59iJfgGsQW0J0ZFTxxtUnEWToT4ayeh4Zsv1XdZKUl
 se/0WZ0rYOhcs6rlnze8goMW0Q==
X-Google-Smtp-Source: APXvYqzTIq0zTOTZXmt8ILZwmsbuiDzRx2Ft09CbHR4OyhK8UqKzWfU17MizJnJeqdWUnX7nUxPe8Q==
X-Received: by 2002:a63:1046:: with SMTP id 6mr9033102pgq.111.1565978000238;
 Fri, 16 Aug 2019 10:53:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id g10sm7048716pfb.95.2019.08.16.10.53.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 10:53:19 -0700 (PDT)
Date: Fri, 16 Aug 2019 10:53:17 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190816175317.GU250418@google.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
 <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qj+FqdPY7E+evYAajO1pGkO3Jxq482Q+PVPBi3aWl84=;
 b=dzBCnLLWXkS4Ws52BWzTOeqaC5aRUz5q2pg8F0eAd5SdnxF3jZGdMmM4k7+pbM4cIy
 HFdX+vc2Ll7YBxNtOVC6nR4VfPlZbR1gPHuO2FCfrh49LSO6E+8jtbOv1VsY/io0Q/qF
 Tuh6jQsfKZuGDOeVmqR2t4wOkS67aa0Q91mLo=
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDQ6NTQ6MThQTSArMDEwMCwgRGFuaWVsIFRob21wc29u
IHdyb3RlOgo+IE9uIDA3LzA4LzIwMTkgMjE6MTUsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+
ID4gT24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MDVQTSAtMDcwMCwgTWF0dGhpYXMgS2Fl
aGxja2Ugd3JvdGU6Cj4gPiA+IEJhY2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBk
aWZmZXJlbnQgc2hhcGVzLiBUaGUgdHdvIG1haW4KPiA+ID4gdHlwZXMgYXJlIGxpbmVhciBhbmQg
bm9uLWxpbmVhciBjdXJ2ZXMuIFRoZSBodW1hbiBleWUgZG9lc24ndAo+ID4gPiBwZXJjZWl2ZSBs
aW5lYXJseSBpbmNyZWFzaW5nL2RlY3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+
ID4gPiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0
bmVzcyBvZiBMRUQKPiA+ID4gbGluZWFybHkgdG8gaHVtYW4gZXllIiksIGhlbmNlIG1hbnkgYmFj
a2xpZ2h0cyB1c2Ugbm9uLWxpbmVhciAob2Z0ZW4KPiA+ID4gbG9nYXJpdGhtaWMpIGJyaWdodG5l
c3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2ZSBjdXJyZW50bHkgaXMgb3BhcXVlCj4gPiA+IHRv
IHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHVzZXMgbW9yZSBvciBsZXNzIHJlbGlhYmxl
IGhldXJpc3RpY3MKPiA+ID4gKGxpa2UgdGhlIG51bWJlciBvZiBicmlnaHRuZXNzIGxldmVscykg
dG8gZGVjaWRlIHdoZXRoZXIgdG8gdHJlYXQgYQo+ID4gPiBiYWNrbGlnaHQgZGV2aWNlIGFzIGxp
bmVhciBvciBub24tbGluZWFyLgo+ID4gPiAKPiA+ID4gRXhwb3J0IHRoZSB0eXBlIG9mIHRoZSBi
cmlnaHRuZXNzIGN1cnZlIHZpYSB0aGUgbmV3IHN5c2ZzIGF0dHJpYnV0ZQo+ID4gPiAnc2NhbGUn
LiBUaGUgdmFsdWUgb2YgdGhlIGF0dHJpYnV0ZSBjYW4gYmUgJ2xpbmVhcicsICdub24tbGluZWFy
JyBvcgo+ID4gPiAndW5rbm93bicuIEZvciBkZXZpY2VzIHRoYXQgZG9uJ3QgcHJvdmlkZSBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgc2NhbGUKPiA+ID4gb2YgdGhlaXIgYnJpZ2h0bmVzcyBjdXJ2ZSB0
aGUgdmFsdWUgb2YgdGhlICdzY2FsZScgYXR0cmlidXRlIGlzICd1bmtub3duJy4KPiA+ID4gCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+
ID4gCj4gPiBEYW5pZWwgKGV0IGFsKTogZG8geW91IGhhdmUgYW55IG1vcmUgY29tbWVudHMgb24g
dGhpcyBwYXRjaC9zZXJpZXMgb3IKPiA+IGlzIGl0IHJlYWR5IHRvIGxhbmQ/Cj4gCj4gSSBkZWNp
ZGVkIHRvIGxlYXZlIGl0IGZvciBhIGxvbmcgd2hpbGUgZm9yIG90aGVycyB0byByZXZpZXcgc2lu
Y2UgSSdtIHN0aWxsCj4gYSB0aW55IGJpdCB1bmVhc3kgYWJvdXQgdGhlIGxpbmVhci9ub24tbGlu
ZWFyIHRlcm1pbm9sb2d5Lgo+IAo+IEhvd2V2ZXIgdGhhdCdzIG15IG9ubHkgY29uY2VybiwgaXRz
IGZhaXJseSBtaW5vciBhbmQgSSd2ZSBkcmFnZ2VkIGJ5IGZlZXQKPiBmb3IgbW9yZSB0aGVuIGxv
bmcgZW5vdWdoLCBzbzoKPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KClRoYW5rcyEKCklmIHlvdSBvciBzb21lb25lIGVsc2UgaGFzIGFu
b3RoZXIgc3VnZ2VzdGlvbiBmb3IgdGhlIHRlcm1pbm9sb2d5IHRoYXQKd2UgY2FuIGFsbCBhZ3Jl
ZSBvbiBJJ20gaGFwcHkgdG8gY2hhbmdlIGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
