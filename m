Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BA416FE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 23:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9903891E3;
	Tue, 11 Jun 2019 21:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA7D891E3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 21:38:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id cl9so5653020plb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c/V5azhQK0NKG3CgTrOQr2YdB5nv03TCL7KtVGmmTnE=;
 b=CVktRz0agMOmYuWgEGHLzfzCCdhoAqco6h5lcat6RJgrpMqotQGWM4s0BZv8R3EXV9
 CZr3wXcDQxS6F5mDUMllBJo3TFdlkF7/04xsxFszQJD2cB/2VtHKYAi3HLkLPlFHRZpx
 8wiHJkhMRx5MHrVSfPOy6HXGlpEWBJsGdih/EQvK1Cia565me4ZF8vxRGoNsaL4qfRyD
 Pb9ty9FynV3pnq7xgDsZFjtYKe27UfJVyXtbKmBW6F+JEWZmDl1JLRsONNGi7C931iOz
 P/w3BMFgSQPXEdbyNffxASKufXrEc4zXQfSH73WU/OdeNJdt2tWiM2RobVBhFqM0VuUc
 xAiA==
X-Gm-Message-State: APjAAAVMfT+mSmY6Bh1MTQwbR+ooP7hIzzoOwhfUN9jRfTYAhcYu8vrI
 kL3uuLELidW91r8N+9rhTpLxbg==
X-Google-Smtp-Source: APXvYqw7YuxbYKqsmcBwdCJJBrsNVyyiE8CmkHa4T0LQVEl29ePKAtTry61J448brFzrtjCg2vAB6Q==
X-Received: by 2002:a17:902:d695:: with SMTP id
 v21mr62285877ply.342.1560289084363; 
 Tue, 11 Jun 2019 14:38:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id b128sm15771434pfa.165.2019.06.11.14.38.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:38:03 -0700 (PDT)
Date: Tue, 11 Jun 2019 14:38:01 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm-backlight: Add 'max-brightness'
 property
Message-ID: <20190611213801.GE137143@google.com>
References: <20190610233739.29477-1-mka@chromium.org>
 <20190611102851.GA16611@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611102851.GA16611@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c/V5azhQK0NKG3CgTrOQr2YdB5nv03TCL7KtVGmmTnE=;
 b=oIUVz20NxztwZIHdK3k65o0Fojj8X3TmNQgvsbpNbh+NJFEE9FTzcALPGexsN2u0lV
 R4N/0/VHL69lIgdJo/Mavd44QxzYFnGkGyNM5SqP5YDejiSLqcxh4/bWKonb2Q9Rk44g
 4lfQgqfTvNf3GlM1jKlbf4K51OOFbRZUH6njQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-pwm@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhpZXJyeSwKCk9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDEyOjI4OjUxUE0gKzAyMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDA0OjM3OjM4UE0g
LTA3MDAsIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gQWRkIGFuIG9wdGlvbmFsICdtYXgt
YnJpZ2h0bmVzcycgcHJvcGVydHksIHdoaWNoIGlzIHVzZWQgdG8gc3BlY2lmeQo+ID4gdGhlIG51
bWJlciBvZiBicmlnaHRuZXNzIGxldmVscyAobWF4LWJyaWdodG5lc3MgKyAxKSB3aGVuIHRoZSBu
b2RlCj4gPiBoYXMgbm8gJ2JyaWdodG5lc3MtbGV2ZWxzJyB0YWJsZS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xpZ2h0LnR4
dCAgICAgICB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0Cj4gPiBpbmRleCA2NGZhMmZi
ZDk4YzkuLjk4ZjRiYTYyNjA1NCAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xpZ2h0LnR4dAo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNr
bGlnaHQudHh0Cj4gPiBAQCAtMjcsNiArMjcsOSBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXNvbHV0aW9uIHB3bSBkdXR5IGN5Y2xlIGNh
biBiZSB1c2VkIHdpdGhvdXQKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGF2aW5n
IHRvIGxpc3Qgb3V0IGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIGluIHRoZQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmlnaHRuZXNzLWxldmVsIGFycmF5Lgo+ID4gKyAgLSBtYXgtYnJp
Z2h0bmVzczogTWF4aW11bSBicmlnaHRuZXNzIHZhbHVlLiBVc2VkIHRvIHNwZWNpZnkgdGhlIG51
bWJlciBvZgo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJpZ2h0bmVzcyBsZXZlbHMgKG1heC1i
cmlnaHRuZXNzICsgMSkgd2hlbiB0aGUgbm9kZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaGFz
IG5vICdicmlnaHRuZXNzLWxldmVscycgdGFibGUuCj4gCj4gQmFjayBhdCB0aGUgdGltZSB3aGVu
IHRoZXNlIGJpbmRpbmdzIHdlcmUgZGVmaW5lZCB3ZSBzcGVjaWZpY2FsbHkgZGlkbid0Cj4gYWRk
IHRoaXMgYmVjYXVzZSBpdCB3YXMgZGVlbWVkIGltcHJhY3RpY2FsLiBUaGF0IGlzLCBubyByZWFs
IGhhcmR3YXJlIGlzCj4gYWN0dWFsbHkgY2FwYWJsZSBvZiBhY2hpZXZpbmcgdXNlZnVsIHJlc3Vs
dHMgd2l0aCBhIHNpbXBsaWZpZWQKPiBkZXNjcmlwdGlvbiBsaWtlIHRoaXMuCj4gCj4gQmVzaWRl
cywgd2UgYWxyZWFkeSBoYXZlIHRoZSBudW0taW50ZXJwb2xhdGVkLXN0ZXBzIHByb3BlcnR5IHdo
aWNoCj4gc2hvdWxkIGFsbG93IHlvdSB0byBhY2hpZXZlIHRoZSBzYW1lIHRoaW5nOgo+IAo+IAli
cmlnaHRuZXNzLWxldmVscyA9IDwwIDI1NT47Cj4gCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9
IDwxPjsKPiAJbnVtLWludGVycG9sYXRlZC1zdGVwcyA9IDwyNTU+OwoKSXQgZG9lc24ndCBhY2hp
ZXZlIHRoZSBzYW1lLiBXaXRoIHRoaXMgY29uZmlndXJhdGlvbiB0aGUgZGV2aWNlIHdvdWxkCmhh
dmUgYSB0YWJsZSB3aXRoIDI1NiBsaW5lYXJseSBpbmNyZWFzaW5nIHZhbHVlcywgdGhlIGludGVu
ZGVkIHVzZSBvZgp0aGUgcHJvcGVydHkgaXMgdG8gcHJvdmlkZSB0aGUgbnVtYmVyIG9mIGJyaWdo
dG5lc3MgbGV2ZWxzIHRvIGJlIHVzZWQKYnkgdGhlIENJRSAxOTMxIGFsZ29yaXRobSB0byBjb21w
dXRlIGEgYnJpZ2h0bmVzcyBzY2FsZSB0aGF0IGlzCnBlcmNlaXZlZCBhcyBsaW5lYXIgYnkgdGhl
IGh1bWFuIGV5ZS4gV2UgY291bGQgcG9zc2libHkgdHJlYXQgYQonYnJpZ2h0bmVzcy1sZXZlbHMn
IHRhYmxlIHdpdGggb25seSB0d28gbGV2ZWxzIGFzIHNwZWNpYWwgY2FzZSBhbmQKZ2V0IHRoZSBu
dW1iZXIgb2YgbGV2ZWxzIGZyb20gaXQuCgpJbiBhbnkgY2FzZSBmcm9tIHRoZSBkaXNjdXNzaW9u
IG9uICJiYWNrbGlnaHQ6IHB3bV9ibDogR2V0IG51bWJlciBvZgpicmlnaHRuZXNzIGxldmVscyBm
b3IgQ0lFIDE5MzEgZnJvbSB0aGUgZGV2aWNlIHRyZWUiIGl0IG1pZ2h0IG5vdCBiZQpuZWNlc3Nh
cnkgdG8gc3BlY2lmeSB0aGUgbnVtYmVyIG9mIGxldmVscyBpbiB0aGUgRFQuCgo+IFRob3VnaCBn
aXZlbiB0aGUgb3JpZ2luYWwgZGlzY3Vzc2lvbiB0aGF0IHdlIGhhZCBhcm91bmQgaG93IGJhY2ts
aWdodAo+IGhhcmR3YXJlIGJlaGF2ZXMsIHRoYXQgZG9lc24ndCBzZWVtIGxpa2UgYSBnb29kIGNo
b2ljZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
