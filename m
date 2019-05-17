Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34C21A80
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 17:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12818991E;
	Fri, 17 May 2019 15:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0788991E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:26:20 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w9so3632040oic.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 08:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xu5A8L7ffk/VuZGGKLFuV6FJUYoNh1BlyhIBaFYJKc8=;
 b=HuvX1MkyqWWJb/b8UfRjaedvYM8H7SgBzM69UY/3nMlXhnx0YzrhV11wGWQ08MsKF/
 nJMm479BeWeQPGe9nLJXy4W1VOuMNBPfbAWt0sBWzpI1Hg8AbspzxAJ5ucOoR8m9wDaf
 g0ALGBmYzzxN+PueAhfC9Cbu+IgM91EiabG+QERnHrm5jCNCvocdVBbgajezwwvb8WdJ
 HkDm3xIom4MSnGPNXAmAbmPU9rHR4Z7oWc2Tglpvpkn1s3Dx3oGP76aHov9GsS0wQkkC
 ZBqRgt0oHcGFoyHs29CGYFIqKjY0d4RKdPvSkg9jSgEdcqggyIqmta0HnPXL4b6xb2Vg
 RCVA==
X-Gm-Message-State: APjAAAXkjv31yM7coGZjaWxDofQeiMKmyhzzQZTwpe2CI0F2/rj1klnA
 8pbX89eACqko2W3lV59arlSRVO5gvTfDgdB2iUo=
X-Google-Smtp-Source: APXvYqwYlZSL66GeSU4TZbz+0EZuctc8xlZi5TZE8nl8m8iVOM29zqacKrtT9w5oMHvLig9tG04NA6RK4P6OxABQH90=
X-Received: by 2002:aca:38d4:: with SMTP id f203mr5209080oia.88.1558106779678; 
 Fri, 17 May 2019 08:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de> <20190517072738.deohh5fly4jxms7k@flea>
 <20190517101353.3e86d696@blackhole.lan> <20190517090845.oujs33nplbaxcyun@flea>
 <20190517094708.GA16858@lst.de>
In-Reply-To: <20190517094708.GA16858@lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 17 May 2019 08:25:53 -0700
Message-ID: <CA+E=qVcpMeFfC0EEZRpp3Hc_yBGFMv6cGKGSQENpUTw_ZH7UwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xu5A8L7ffk/VuZGGKLFuV6FJUYoNh1BlyhIBaFYJKc8=;
 b=fnGDVA/CPKgszzyvVNGPqdLlo3j4aBFjTJaRyaTzUsUqqtk3Ma/fdvvR6u0jV1QpnS
 ODbWVtFHuGlSkV64ydsIhDYXqWgNvxd9hUKbNVi5azAzpVFWM1JIDuYaGNdd8Pf7kLvX
 gOWTKjEWmmd5+7p/9sWiB9SWvYBGUPrXCEKwk5+wh97ypDgkeA/yPNjXzolAz6em//4Y
 QpgLVf7kpkbMl5b/Ilzqoh78hJdNKJDZRf2yAEaDS8wriC7brnX2Mbko/37I/M5hGoS6
 H4iTDp7tO94GqQ+BaRhwoGNj18Nk/9lxuceTbcsD1wfLtP0skneXJODVFpDmJzqZhHFJ
 vlyg==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMjo0NyBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDExOjA4OjQ1QU0gKzAyMDAsIE1h
eGltZSBSaXBhcmQgd3JvdGU6Cj4gPiA+Cj4gPiA+IFNvIGZvciBhbGwgY3VycmVudCBwcmFjdGlj
YWwgcHVycG9zZXMsIHdlIGNhbiBhc3N1bWUgdGhlIFRlcmVzLUkgcGFuZWwKPiA+ID4gdG8gYmUg
cG93ZXJlZCBwcm9wZXJseSBhbmQgcHJvdmlkaW5nIHZhbGlkIEVESUQ7IG5vdGhpbmcgdG8gd29y
cnkgYWJvdXQKPiA+ID4gaW4gc29mdHdhcmUuCj4gPgo+ID4gWW91J3JlIGNyZWF0aW5nIGEgZ2Vu
ZXJpYyBiaW5kaW5nIGZvciBhbGwgdGhlIHVzZXJzIG9mIHRoYXQgYnJpZGdlLAo+ID4gd2hpbGUg
Y29uc2lkZXJpbmcgb25seSB0aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGUgVGVyZXMtSS4KPgo+IEFs
bCBJJ20gc2F5aW5nIGlzIHRoYXQgX3RoaXNfIHVzYWdlIGlzIGFsc28gdmFsaWQuIE5vdGhpbmcg
a2VlcHMgb3RoZXIKPiB1c2VycyBmcm9tIGRlZmluaW5nIHRoZSBvdXRwdXQgcGFuZWw7IG9uIHRo
ZSBjb250cmFyeTogdGhlIGRyaXZlciBhdCBoYW5kCj4gYWxyZWFkeSBjb25zaWRlcnMgYW4gX29w
dGlvbmFsXyBwYW5lbCBhbmQgaGFuZGxlcyBpdCwgY29uZGl0aW9uYWxseS4gU28KPiBkcml2ZXIg
YW5kIGJpbmRpbmcgc3BlYyBhcmUgMTAwJSBpbiBzeW5jIGhlcmUuCgpXZWxsLCBlbmRwb2ludCBp
cyBub3QgbmVjZXNzYXJpbHkgYSBwYW5lbC4gSXQgY2FuIGJlIGFub3RoZXIgYnJpZGdlIG9yCmNv
bm5lY3RvciAtIHRoYXQncyB3aHkgcGFuZWwgY2FuIGJlIG9wdGlvbmFsIGluIGRyaXZlci4gQnV0
IGl0IGRvbid0CnRoaW5rIHRoYXQgeW91IGNhbiBqdXN0IG9taXQgYW4gZW5kcG9pbnQuCgo+IFRo
aXMgaXMgbXVjaCBtb3JlIHN0cmFpZ2h0Zm9yd2FyZCB0aGFuIHJlcXVpcmluZyBhbiBvdXRwdXQg
YW5kIG1ha2luZyB1cAo+IHNvbWUgZHVtbXkgY29kZSBhbmQgcGFyYW1zIGJlY2F1c2UgaXQgY2Fu
bm90IHJlYXNvbmFibHkgYmUgaGFuZGxlZC4KPiAoUmVtZW1iZXIsIGlmIHRoZXJlIGlzIGFuIG91
dHB1dCwgdGhlIGRyaXZlciB3aWxsIG1ha2UgY2FsbHMgdG8gdGhlCj4gImF0dGFjaGVkIGRldmlj
ZSIgZHJpdmVyLikKClRoZXkgYXJlbid0IGR1bW15LiBNb3Jlb3ZlciB5b3UgaGF2ZSB0byBhdHRh
Y2ggYmFja2xpZ2h0IHNvbWV3aGVyZSAodG8KcGFuZWwpIHNvIGl0IGNhbiBiZSBkaXNhYmxlZCB3
aGVuIG91dHB1dCBpcyBkaXNhYmxlZC4KClRyeSAneHJhbmRyIC0tb3V0cHV0IGVEUC0xIC0tb2Zm
JyBvbiB0ZXJlcyB3aXRoIHlvdXIgY3VycmVudCBjb2RlIGFuZApzZWUgdGhhdCBiYWNrbGlnaHQg
c3RheXMgb24uCgo+Cj4gICAgICAgICBUb3JzdGVuCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
