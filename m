Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED923F3D5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 22:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80EA6EA35;
	Fri,  7 Aug 2020 20:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD0E6EA35
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 20:36:46 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x24so2627186otp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QDKUPc9KK+Di4AVR2WDmmIwJOaZ7BjfkjtSJpkgJehg=;
 b=Jf+REAaMi9PywAKuMRa5//YCM4hOnR8Z7/J9CoVjJllb8p3goedz6Wzoc5lG/J6JRs
 wZ9x9rtEdCzHbeLkweq5F52qcqLwdfrbtlanZU0Uz07hv8HsrYWNsBkb+GiYgZwnfCLj
 tuqqtXi4UP1DGBKLHqxuvlVFBFGT+psKVbyhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QDKUPc9KK+Di4AVR2WDmmIwJOaZ7BjfkjtSJpkgJehg=;
 b=A4K40KYKJT8oMw8WU174ml69l0O+jPNRqFdhevRTnL4rTbho8H2EEMxDARE2t+H9pY
 D7/2lxVCoS8GHmzHT1sesl1PzK/jEtMDbFp/sQAc44L8MjXMxu7lVehSJUHK0cjaNuKQ
 vtq9BgglYMjupaPtUY6ZzlnvzFsL1xie+Qj2Hu3OfZRvGPdLcT0EAki+wbMD8ZWUbzPZ
 JTJgPNwysgUQfxvMF6Lv2GjANKOFqJOOb/ayYVCJQolaykDRh7Lvo/TIEuDPAm+l+Nck
 rMi1sjTfHr8dmQ79zXb4AX1hJFOfCCHcP9CxZjIUBs6GOoBgCcEAkJ05LqkDWnU9rg9t
 vq6g==
X-Gm-Message-State: AOAM531kInS+Hn9IhRnj68fYJQ9+EEw1ACj7ocMnIL9YJF0t5geKiEmf
 TDaO8aym3gl1daX5/4KZPXiWlzoVexN8PvgQ+Pxo0A==
X-Google-Smtp-Source: ABdhPJxz3aiS1lZHTyk6ogMVKlWeyaWoZfhwKwypRo+Vk27ucW95c+OASOCZS/7kRW2SvH+gilydFskAD8ypPQC7IXk=
X-Received: by 2002:a9d:7283:: with SMTP id t3mr12720220otj.303.1596832605925; 
 Fri, 07 Aug 2020 13:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200807180547.GA923146@ravnborg.org>
In-Reply-To: <20200807180547.GA923146@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 7 Aug 2020 22:36:34 +0200
Message-ID: <CAKMK7uHb7HEgnYVF45C9UA3CRPN8k6pDj8mZ4dhYcgTHi-kT8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: fix build on alpha arch
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgNywgMjAyMCBhdCA4OjA1IFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cj4KPiBXaGVuIGJ1aWxkaW5nIGltZ2FnMjAwIGZvciB0aGUgYWxwaGEgYXJj
aGl0ZWN0dXJlIGl0IGZhaWxzIGxpa2UgdGhpczoKPiBtZ2FnMjAwX2Rydi5jOjIzMzo5OiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdm1hbGxvY+KAmQo+ICAgMjMz
IHwgIGJpb3MgPSB2bWFsbG9jKHNpemUpOwo+ICAgICAgIHwgICAgICAgICBefn5+fn5+Cj4gICAg
ICAgfCAgICAgICAgIGttYWxsb2MKPgo+IFdoZW4gYnVpbGRpbmcgZm9yIG90aGVyIGFyY2hpdGVj
dHVyZXMgdm1hbGxvYy5oIGlzIHB1bGxlZCBpbiB2aWEgc29tZQo+IG90aGVyIGhlYWRlciBmaWxl
IC0gZm9yIGV4YW1wbGUgYXNtLWdlbmVyaWMvaW8uaC4KPiBVc2UgYW4gZXhwbGljaXQgaW5jbHVk
ZSBvZiB2bWFsbG9jLmggdG8gZml4IHRoZSBidWlsZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBGaXhlczogZTIwZGZkMjdmN2FhICgiZHJtL21n
YWcyMDA6IEFkZCBzdXBwb3J0IGZvciBHMjAwIGRlc2t0b3AgY2FyZHMiKQo+IENjOiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogRWdiZXJ0IEVpY2ggPGVpY2hA
c3VzZS5jb20+Cj4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KPiBDYzogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAtLS0KPiBJIGhhdmUgbG9zdCB0cmFjayBpZiB0aGUg
b2ZmZW5kaW5nIGNvbW1pdCBpcyBvbiB0aGUgd2F5IHRvIHVwc3RyZWFtIG9yCj4gaXQgaXMganVz
dCBpbiBkcm0tbWlzYy1uZXh0LiBCdXQgSSB0aGluayBpdCBpcyB0aGUgbGF0dGVyIHNvIHdlIGNh
bgo+IGFwcGx5IHRoaXMgdG8gZHJtLW1pc2MtbmV4dC4KCiQgZGltIHN0YXR1cyAjIGZldGNoZXMg
YWxsIHRoZSB0cmVlcwokIGRpbSB0YWctY29udGFpbnMgZTIwZGZkMjdmN2FhCmRybS1taXNjL2Ry
bS1taXNjLW5leHQKCllvdSBndWVzcyBjb3JyZWN0bHkgOi0pCgpSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPgo+ICAgICAgICAgU2FtCj4KPiAgZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwo+
IGluZGV4IDA5MTcwZDQ2YWE1My4uYjI4MmIwZTQyYzJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX2Rydi5jCj4gQEAgLTksNiArOSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9j
b25zb2xlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3BjaS5oPgo+ICsjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+Cj4gICNpbmNsdWRlIDxkcm0v
ZHJtX2Rydi5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4gLS0KPiAyLjI1LjEKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
