Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259C368A16
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 02:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAA96E04A;
	Fri, 23 Apr 2021 00:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114BD6E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 00:58:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u25so15668357ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 17:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N+jXaR0SB+8fxvvMVeDeNfESYRDFwrHiFdNeachsM6Q=;
 b=pYJyKgcMm7jhXAw5yMF2RJTsBTmNftz7BoC6GSRljtvEGlST/ngMHac1C3rDYDmlU2
 DOC8RM6zDBLQwuzOBjqErj+9DEPsf4WjQnthj3xjdeE2LgoZ6uiWfi0dSrLpJiY5yq+6
 OZCXUB0opoMUtqo9Hw/fJpnPzILw6j+tw7d/T3ePlrmZQnZPwEWjl85/+1xGDt3aELtB
 FTC5D0oJWbtd7K0owLKKNYNb1cfwvX2Nofg/NtgZXoutgyj6Vny3WX3tcCQlo2b/5zhu
 UNMjR8Bk892Y2v1da3uIgugWZUhrK4mZw0cIjxNmLYObVXvRON5ix87Avp8shyVzu8zf
 DDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N+jXaR0SB+8fxvvMVeDeNfESYRDFwrHiFdNeachsM6Q=;
 b=ol+uk0EvP7qRfSWsuLxC9f7fFPZRNDTloaVa4byaLoMZeqdF7+zuVkh9qjvL7bBh1l
 GZgX0em1//DbuhRgkBqG7zYne4bcMYq1T2nm+VL9DJgh4ahMAPU5VGQeGuu9zwYCwdwz
 vsyAZbXL+kuqpbJ+EW8dl6JkiAuYfIRKtdV9kCURsxo03JpWadlFpOqCR42Txmy4mLKl
 ugtrS4Zxf8WiOll7OediRUWNg+do9kRfKTkuHoZg+gAbjHQasn65YPSWiXuEIVLZYvKv
 XTC8gygQ2lp1STK1uFgd3l7zYpk78IDd6/nBOZKXtn+eYbou9eYf5ZdGDXgKWgoSEz/z
 XOJg==
X-Gm-Message-State: AOAM532TmM12+bW1rHgLYGQt42HTw05hyC20fTaAe1hcoSVJj9Kcv0BU
 EBZCadSaox6MqUaA1cD7wzr+6LHhyb7EQXYPD4I=
X-Google-Smtp-Source: ABdhPJz5Sq2Kl8285SJaqMSuRC+6FB8sKME1fMLn2LVa8SctzGoFZqjKCE5hJjtd4qYhXcU1sB5mCy0wwuI/TPqkV2E=
X-Received: by 2002:a05:651c:10f:: with SMTP id
 a15mr1038547ljb.153.1619139529165; 
 Thu, 22 Apr 2021 17:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
 <20210419072229.GA4869@dell> <20210419072317.GB4869@dell>
 <20210419072403.GC4869@dell>
 <CADiBU38bMuH00Bcx5hJas2=yAon00ffcGokT4u89vX-LJYuxNA@mail.gmail.com>
In-Reply-To: <CADiBU38bMuH00Bcx5hJas2=yAon00ffcGokT4u89vX-LJYuxNA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 23 Apr 2021 08:58:37 +0800
Message-ID: <CADiBU39F4nHC5U+G+fJJemAJgeYxDimi0cXYkm25+YC8qO5yDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIExlZToKCkNoaVl1YW4gSHVhbmcgPHUwMDg0NTAwQGdtYWlsLmNvbT4g5pa8IDIwMjHlubQ0
5pyIMTnml6Ug6YCx5LiAIOS4i+WNiDU6NTXlr6vpgZPvvJoKPgo+IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+IOaWvCAyMDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjI05a+r
6YGT77yaCj4gPgo+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4K
PiA+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPgo+ID4gPiA+
IE9uIE1vbiwgMTkgQXByIDIwMjEsIENoaVl1YW4gSHVhbmcgd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiA+IEhpLCBMaW51eCBtZmQgcmV2aWV3ZXJzOgo+ID4gPiA+ID4gICAgSXQncyBiZWVuIHRocmVl
IHdlZWtzIG5vdCB0byBnZXQgYW55IHJlc3BvbnNlIGZyb20geW91Lgo+ID4gPiA+ID4gSXMgdGhl
cmUgc29tZXRoaW5nIHdyb25nIGFib3V0IHRoaXMgbWZkIHBhdGNoPwo+ID4gPiA+ID4gSWYgeWVz
LCBwbGVhc2UgZmVlbCBmcmVlIHRvIGxldCBtZSBrbm93Lgo+ID4gPiA+Cj4gPiA+ID4gQ291cGxl
IG9mIHRoaW5nczoKPiA+ID4gPgo+ID4gPiA+IEZpcnN0LCBpZiB5b3UgdGhpbmsgYSBwYXRjaCBo
YWQgZmFsbGVuIHRocm91Z2ggdGhlIGdhcHMsIHdoaWNoIGRvZXMKPiA+ID4gPiBoYXBwZW4gc29t
ZXRpbWVzLCBpdCBpcyBnZW5lcmFsbHkgY29uc2lkZXJlZCBhY2NlcHRhYmxlIHRvIHN1Ym1pdCBh
Cj4gPiA+ID4gW1JFU0VORF0gfjIgd2Vla3MgYWZ0ZXIgdGhlIGluaXRpYWwgc3VibWlzc2lvbi4g
IEZZSTogVGhpcyB3YXMgc3VjaCBhCj4gPiA+ID4gcGF0Y2guICBJdCB3YXMgbm90IG9uLCBvciBo
YWQgZmFsbGVuIG9mZiBvZiBteSByYWRhciBmb3Igc29tZSByZWFzb24uCj4gPiA+ID4KPiA+ID4g
PiBTZWNvbmRseSwgd2UgYXJlIHJlYWxseSBsYXRlIGluIHRoZSByZWxlYXNlIGN5Y2xlLiAgLXJj
OCBoYXMganVzdCBiZWVuCj4gPiA+ID4gcmVsZWFzZWQuICBRdWl0ZSBhIGZldyBtYWludGFpbmVy
cyBzbG93IGRvd24gYXQgfi1yYzYuICBQYXJ0aWN1bGFybHkKPiA+ID4gPiBmb3IgbmV3IGRyaXZl
cnMuCj4gPiA+ID4KPiA+ID4gPiBObyBuZWVkIHRvIHJlc3VibWl0IHRoaXMgZHJpdmVyIHRoaXMg
dGltZS4gIEl0IGlzIG5vdyBvbiBteSB0by1yZXZpZXcKPiA+ID4gPiBsaXN0IGFuZCBJIHdpbGwg
dGVuZCB0byBpdCBzaG9ydGx5Lgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGll
bmNlLgo+ID4gPgo+ID4gPiBBbHNvIHlvdSBhcmUgbWlzc2luZyBhIERUIHJldmlldyBvbiBwYXRj
aCA0Lgo+ID4KPiA+IC4uLiBsb29rcyBsaWtlIHlvdSBmb3Jnb3QgdG8gQ2MgdGhlbSEKPiA+Cj4g
WWFwLCByZWFsbHkuIEknJ2xsIHJlc2VuZCBwYXRjaCA0IGFuZCBjYyB0aGVtLiBUaHguCgpTaG91
bGQgSSByZXNlbmQgdGhlIHBhdGNoIGFuZCBsb29wIERUIHJldmlld2Vycz8KPiA+IC0tCj4gPiBM
ZWUgSm9uZXMgW+adjueQvOaWr10KPiA+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwo+ID4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCj4gPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
