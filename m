Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1D97C43
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F556E3EF;
	Wed, 21 Aug 2019 14:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2886E3EF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:16:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so2204722wrr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 07:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cdtuJEJPiRHYBRkWLphaMlBKW6Qllc1jRrn7Evl95W0=;
 b=sIc+W4QULsIFzl18kDAIIkt4EZl8UeQuCzI7aMKb6LOsWsZEMYE1y7iC86Kgmc76ep
 0FIuCHv2bFCSyu9ejITJfPsGw2uTO6fpLF28ZgrVD3JUdkkHCwvZdN03GkqbcidI8HAg
 CZpMlud9kMD2PSnFzC5lCw5j3hV3+U2NB/QZTtn11OwGOxq+qHEz97D1QCIL7sDsdf6N
 TCHEgihsO7cWUa8feAoVmKgcdkVp7BMKwu2WAO6U0CY6kGr0S1jxqMKCfjIoMyzEPzw1
 Y/zqTjgEfMm3vizMp9dYHAT0ARFIhMXoq1/BnBlthLLNsUlUgIkLBuVqX6lk+BmoC8QY
 DGbw==
X-Gm-Message-State: APjAAAVURMZh+ezTmQxdRxoW0O68KURM2J9I1HpjnB+6KWRiEzqF2OeB
 HpbmbmcitUuch+y46ThIGU5JrQ==
X-Google-Smtp-Source: APXvYqyWXU+FCJwHRqtC9ZXeDqIM9kre79CXAhUyQKtWQkywMQ1AtsuSunZHdIngi7gFPJHEJ0plDw==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr38474896wrc.85.1566396980736; 
 Wed, 21 Aug 2019 07:16:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g7sm203936wmg.8.2019.08.21.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:16:19 -0700 (PDT)
Date: Wed, 21 Aug 2019 15:16:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190821141617.e5avfbyvooddixcd@holly.lan>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190816165148.7keg45fmlndr22fl@pengutronix.de>
 <20190816175157.GT250418@google.com>
 <20190816194754.ldzjqy2yjonfvaat@pengutronix.de>
 <20190816211051.GV250418@google.com>
 <20190819054628.asw3cxp46w3rpml7@pengutronix.de>
 <20190819095037.h3gig3quyhnzshm7@holly.lan>
 <CAKMK7uEJptKgoAwTO+OuN0HrBiMMG21w0QAdgD=pHBLoKLi38Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEJptKgoAwTO+OuN0HrBiMMG21w0QAdgD=pHBLoKLi38Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cdtuJEJPiRHYBRkWLphaMlBKW6Qllc1jRrn7Evl95W0=;
 b=jmZFwO7aPbSPs4T3u6HFT7/UzQEynyx3CLoy6cPRt8GFo+A0DNBZKk7hz3rjw22uVC
 uJadNeGBW0V5GinSEgjuPf3kwqOUTeenRZvKcchdVxltfYwFSCRv0tWFoYws6SLI5hUf
 RUzh2AMZp4k+OkvBYlRTcvH/evX96Zb20+IupWV+atHwY9RS5NoM0+/03tP7MYVjfIMo
 0Af1Xka7SljkMAGPasYem64gsOBd+9foTNIpBUu2Duybs1OqZAosGxlUqHumHbYp9C3E
 NMx3eiNgPewmBOVXvNhD4WWzws5NHWBEP4KY8S/GVTWk3DdNPq9yLsLk67u3Z/u7vQpE
 Bdow==
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
Cc: linux-pwm <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDQ6NDk6MjFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAxMTo1MCBBTSBEYW5pZWwgVGhvbXBzb24K
PiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMTks
IDIwMTkgYXQgMDc6NDY6MjhBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+
IEFuZCB0aGUgYmlnIHVwc2lkZSBpcyB0aGF0IGluIHRoZSBlbmQgKGkuZS4gd2hlbiBhbGwga2Vy
bmVsIGRyaXZlcnMgYW5kCj4gPiA+IHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgYXJlIGFkYXB0ZWQg
dG8gcHJvdmlkZS9jb25zdW1lIHRoZSAiY29ycmVjdCIKPiA+ID4gY3VydmUpIHRoZSByZXN1bHQg
aXMgc2ltcGxlci4KPiA+Cj4gPiBNeSB2aWV3IGlzIHRoYXQgdGhpcyBjb252ZXJnZW5jZSB3aWxs
IGV2ZW50dWFsbHkgYmUgYWNoaWV2ZWQgYnV0IGl0IHdpbGwKPiA+IGhhcHBlbiB0aHJvdWdoIHRo
ZSBvYnNvbGVzY2VuY2Ugb2YgdGhlIGJhY2tsaWdodCBzeXNmcyBpbnRlcmZhY2UuIFRoZQo+ID4g
c3lzZnMgaW50ZXJmYWNlIGhhcyBvdGhlciBmbGF3cywgaW4gcGFydGljdWxhciBubyBpbnRlZ3Jh
dGlvbiB3aXRoIHRoZQo+ID4gRFJNIGNvbm5lY3RvciBBUEkuCj4gPgo+ID4gVGh1cyBJIHdvdWxk
IGV4cGVjdCBhbiBhbHRlcm5hdGl2ZSBpbnRlcmZhY2UgdG8gZW1lcmdlLCBtb3N0IGxpa2VseSBh
cwo+ID4gcGFydCBvZiB0aGUgRFJNIGNvbm5lY3RvciBBUEkuIEknZCBleHBlY3Qgc3VjaCBhIG5l
dyBBUEkgdG8gYQo+ID4gcGVyY2VwdHVhbCBzY2FsZSBhbmQgdG8gaGF2ZSBhIGZpeGVkIG1heCBi
cmlnaHRuZXNzIHdpdGggZW5vdWdoCj4gPiBzdGVwcyB0byBzdXBwb3J0IGFuaW1hdGVkIGJhY2ts
aWdodCBlZmZlY3RzIChJSVJDIDAuLjEwMCBoYXMgYmVlbgo+ID4gcHJvcG9zZWQgaW4gdGhlIHBh
c3QpCj4gPgo+ID4gSW4gdGhlIG1lYW4gdGltZSBnZXR0aW5nIHRoZSBleGlzdGluZyBjb2xsZWN0
aW9uIG9mIGJhY2tsaWdodCBkcml2ZXJzCj4gPiBtYXJrZWQgdXAgYXMgbGluZWFyL2xvZ2FyaXRo
bWljL2V0YyB3aWxsIGVhc2UgdGhlIGludHJvZHVjdGlvbiBvZiB0aGF0Cj4gPiBBUEkgYmVjYXVz
ZSwgd2l0aGluIHRoZSBrZXJuZWwsIHdlIG1pZ2h0IGhhdmUgZ2F0aGVyZWQgZW5vdWdoIGtub3ds
ZWRnZQo+ID4gdG8gaGF2ZSBzb21lIGhvcGUgb2YgY29ycmVjdGx5IG1hcHBpbmcgZWFjaCBiYWNr
bGlnaHQgb250byBhCj4gPiBzdGFuZGFyZGl6ZWQgc2NhbGUuCj4gCj4gSW4gY2FzZSBwZW9wbGUg
d29uZGVyIHdoeSB0aGUgZHJtIGNvbm5lY3RvciBiYXNlZCBiYWNrbGlnaHQgaW50ZXJmYWNlCj4g
aGFzbid0IGhhcHBlbmVkIGFnZXMgYWdvLCBzb21lIG1vcmUgY29udGV4dDoKPiAKPiAtIHVzZXJz
cGFjZSAod2VsbCBsaWJiYWNrbGlnaHQpIHNlbGVjdHMgdGhlIHJpZ2h0IGJhY2tsaWdodCwgdXNp
bmcKPiBzb21lIHByaW9yaXR5IHNlYXJjaC4gUGx1cyBibGFja2xpc3RzIGluIGRyaXZlcnMgdG8g
bWFrZSBzdXJlIHRoZXkncmUKPiBub3Qgb3ZlcnJpZGluZyB0aGUgcmVhbCBiYWNrbGlnaHQgZHJp
dmVyIChlLmcuIGFjcGkgaGFzIGhpZ2hlcgo+IHByaW9yaXR5IGluIGxpYmJhY2tsaWdodCwgYnV0
IG9uIG1vZGVybiBzeXN0ZW0gaXQncyBub3QgdGhlIGJhY2tsaWdodAo+IGRyaXZlciB5b3Ugd2Fu
dC4gSWYgd2UgbW92ZSB0aGF0IGludG8gdGhlIGtlcm5lbCBpdCdzIGdvaW5nIHRvIGJlCj4gc29t
ZXdoYXQgYSBtZXNzLCBzaW5jZSBkZWZhY3RvIHlvdSBuZXZlciBrbm93IHdoZW4gbG9hZGluZyBp
cyBjb21wbGV0ZQo+IGFuZCB5b3UgYWN0dWFsbHkgaGF2ZSB0aGUgcmlnaHQgYmFja2xpZ2h0IGRy
aXZlci4KPiAKPiBUaGlzIGlzbid0IGEgcHJvYmxlbSBvbiBEVCBwbGF0Zm9ybXMsIGJ1dCByZWFs
bHkganVzdCBmb3IgeDg2L2FjcGkKPiBwbGF0Zm9ybXMuIEJ1dCBpZiB3ZSBkb24ndCBmaXggdGhl
bSwgdGhlbiB1c2Vyc3BhY2UgYWRvcHRpb24gb2YgdGhlc2UKPiBuZXcgaW50ZXJmYWNlcyB3aWxs
IGxpa2VseSBiZSB0b28gbG93IHRvIG1hdHRlci4KPiAKPiAtIHNlY29uZCBpc3N1ZSBpcyB0aGF0
IHJpZ2h0IG5vdyB0aGUga21zIGNsaWVudCBpcyBzdXBwb3NlZCB0byBoYW5kbGUKPiBiYWNrbGln
aHQgYXJvdW5kIG1vZGVzZXQsIGxpa2UgZmJkZXYgZG9lcyB0aHJvdWdoIHRoZSBmYiBub3RpZmll
ci4KPiBFeGNlcHQgZm9yIGRyaXZlcnMgd2hpY2ggZG8gaGFuZGxlIHRoZSBiYWNrbGlnaHQgYWNy
b3NzIG1vZGVzZXRzLCBidXQKPiBtYXliZSBub3QgdGhlIHJpZ2h0IGJhY2tsaWdodC4gSWYgd2Ug
bW92ZSB0aGUgYmFja2xpZ2h0IGludGVyZmFjZSB0bwo+IGRybSBjb25uZWN0b3JzIHRoZW4gdGhl
IHJpZ2h0IHRoaW5nIHdvdWxkIGJlIGZvciB0aGUgZHJtIGRyaXZlciB0bwo+IGhhbmRsZSBiYWNr
bGlnaHQgZW5hYmxlL2Rpc2FibGUgYWNyb3NzIG1vZGVzZXRzLiBCdXQgdG8gbWFrZSB0aGF0Cj4g
d29yaywgdXNlcnNwYWNlIG5lZWRzIHRvIHN0b3AgdG91Y2hpbmcgaXQgKG90aGVyd2lzZSB1c2Vy
c3BhY2UgZmlyc3QKPiBkaXNhYmxlcywgdGhlbiB0aGUga2VybmVsIGFuZCB0aGVuIG9uIHJlc3Rv
cmUgdGhlIHR3byBmaWdodCBhbmQKPiB1c3VhbGx5IGJsYWNrIHNjcmVlbiB3aW5zKSwgYW5kIHRo
YXQncyBhIGJpdCBhIHRyaWNreSB1YXBpIHByb2JsZW0gb2YKPiBub3QgYnJlYWtpbmcgZXhpc3Rp
bmcgdXNlcnNwYWNlLgo+IAo+IC0gZmluYWxseSB0aGVyZSdzIHNvbWUgdXNlcnNwYWNlIHdoaWNo
IGFzc3VtZXMgdGhlIGxvd2VzdCBiYWNrbGlnaHQKPiBzZXR0aW5nIGlzIGFjdHVhbGx5IG9mZiwg
YW5kIHVzZXMgdGhhdCB0byBkbyBmYXN0IG1vZGVzZXRzLiBUaGlzCj4gZG9lc24ndCB3b3JrIG9u
IG1vc3QgQUNQSSBiYWNrbGlnaHRzLCBzbyBJIHRoaW5rIHRoYXQgcHJvYmxlbSBpc24ndAo+IHdp
ZGVzcHJlYWQuCj4gCj4gQW55d2F5IGZyb20gd2F0Y2hpbmcgZnJvbSBhZmFyLCBJIHRoaW5rIHRo
aXMgY2xhcmlmaWNhdGlvbiBvbiB3aGF0IHRoZQo+IGJhY2tsaWdodCBzY2FsZSBtZWFucyBpbnRl
cm5hbGx5IHNob3VsZCBhdCBsZWFzdCBoZWxwIHVzIHNvbWV3aGF0IGluCj4gdGhlIGxvbmcgdGVy
bS4gQnV0IHRoZSBsb25nIHRlcm0gc29sdXRpb24gaXRzZWxmIG5lZWRzIHNvbWVvbmUgd2l0aAo+
IHdheSB0b28gbXVjaCB0aW1lIEkgZmVhciwgc28gbGV0cyBub3QgaG9sZCB1cCBhbnl0aGluZyBv
biB0aGF0LgoKVGhhbmtzIGZvciBzaGFyaW5nIHlvdXIgdmlld3Mgb24gdGhpcy4KCgpEYW5pZWwu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
