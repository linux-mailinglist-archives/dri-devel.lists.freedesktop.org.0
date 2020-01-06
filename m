Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B89130EE0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 09:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9264F89D63;
	Mon,  6 Jan 2020 08:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3854689D5F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 08:45:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so48743770wru.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 00:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=E+ZsR7Z6Or+Q9BNSYlv8m9k1i0fDEt4sNmLSr2qVLrE=;
 b=b6EoJUPx4omgCfCytDHI5M/8GKVGW1pS/Q0ukuUb7HkffVkKyEWFhHUwnA4PXQB1m5
 qAUBj9pMGqUSqG4+z/oaABcxhRaKjqTHoqlJkl1X/pWm++WDEUh6zRHoz2qPVNU28txW
 kyvLH3wU019LV43vRa1wHHGDYaMIpm0Xt2B1Z2u7WT0FnwzkeDDFea6m2Az5EuZ73VaY
 iHoRWNHfEGFXf3eWklrzVDg4SX4+I2OI74ZuTK4H7grXGv0dj19Pds60dYhLIqIQme9E
 zaIZfiYyscy0y1Y3a5N8RLfshXOorElBxVojEvb9ruo0GAXpDWGysJDhxOx6hInEaopG
 ZPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=E+ZsR7Z6Or+Q9BNSYlv8m9k1i0fDEt4sNmLSr2qVLrE=;
 b=Ov1SqbgX8qqBgL+Y3Nd5zzLqlrTltTWDKLjUGx4e4cRqs3dz5DBRIfxkK/blbWGqC5
 5R5+Dnu4za8mx07ouidAxjg3fq9Q/ZD483nCOJjKSz4Z5CORFQQbmlFqVum5qx90BgGz
 Lnr5t5r4at0uVRBVKqRZVN1hr0gegymmUoO2Jt9Z6/JOtaf/sg4YSVgNytzHlG8nT77n
 Pv5teWd3Ja4x/YFr2JSq9iwwrbbOZzA4QUkTLm+BjhWr6IuP2tk1Y2EOb1ZMH98GPoth
 FwfLFG0vO9l81gWzcHsglGbu0E3kLcWXmSSoLKDmBPRFQ2FIxFjn1w1/v/d2aDCGN9kX
 H9Vg==
X-Gm-Message-State: APjAAAVxvIQVwOR11JT86h4q2qID93NKVMLbdVhQ+47b989bzM7/U3KC
 vz6O/492p0c6FAtQtwBSFiq9mw==
X-Google-Smtp-Source: APXvYqwxcQQlcWtECdQoOFeMi0PnZaRKIl/UK7OQlM3noxtNGd+dNEVLfF5LUtq5jrb7KMBL2hK+Yg==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr100885486wrx.39.1578300334744; 
 Mon, 06 Jan 2020 00:45:34 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id q6sm76176240wrx.72.2020.01.06.00.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 00:45:34 -0800 (PST)
Date: Mon, 6 Jan 2020 08:45:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: LED backlight on Droid 4 and others
Message-ID: <20200106084549.GA14821@dell>
References: <20200105183202.GA17784@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200105183202.GA17784@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, tony@atomide.com,
 jingoohan1@gmail.com, merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com, jjhiblot@ti.com,
 linux-omap@vger.kernel.org, agx@sigxcpu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAwNSBKYW4gMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiBJdCB3
b3VsZCBiZSBnb29kIHRvIGdldCBMRUQgYmFja2xpZ2h0IHRvIHdvcmsgaW4gY2xlYW4gd2F5IGZv
ciA1LjYKPiBrZXJuZWwuCj4gCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgdGhlc2UgYXJlIG5lY2Nl
c3NhcnkgKGJ1dCBub3QgZW5vdWdoOyBpdCBkb2VzIG5vdAo+IHdvcmsgZm9yIG1lKTogbG0zNTMy
IGNoYW5nZXMgdG8gcmVnaXN0ZXIgTEVEIHdpdGggb2Ygbm9kZSwgcGx1cyBkZXZpY2UKPiB0cmVl
IGNoYW5nZXMgZm9yIGRyb2lkIDQsIGFuZCB0aGVzZSBnZW5lcmljIGNoYW5nZXM6Cj4gCj4gY29t
bWl0IGQ0NTdkMGM5N2Q2ZDU1ZmUzZTYyNjMzNzkxYWMwNWQyODlhMzdkMmUKPiBBdXRob3I6IFRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4gRGF0ZTogICBUaHUgT2N0IDMg
MTA6Mjg6MTIgMjAxOSArMDIwMAo+IAo+ICAgICBiYWNrbGlnaHQ6IGFkZCBsZWQtYmFja2xpZ2h0
IGRyaXZlcgo+ICAgICAKPiAgICAgVGhpcyBwYXRjaCBhZGRzIGEgbGVkLWJhY2tsaWdodCBkcml2
ZXIgKGxlZF9ibCksIHdoaWNoIGlzIHNpbWlsYXIgdG8KPiAgICAgcHdtX2JsIGV4Y2VwdCB0aGUg
ZHJpdmVyIHVzZXMgYSBMRUQgY2xhc3MgZHJpdmVyIHRvIGFkanVzdCB0aGUKPiAgICAgYnJpZ2h0
bmVzcyBpbiB0aGUgSFcuIE11bHRpcGxlIExFRHMgY2FuIGJlIHVzZWQgZm9yIGEgc2luZ2xlIGJh
Y2tsaWdodC4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJs
b3QgPGpqaGlibG90QHRpLmNvbT4KPiAgICAgQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxA
dWN3LmN6Pgo+ICAgICBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBz
b25AbGluYXJvLm9yZz4KPiAKPiBjb21taXQgNDRiN2FkYmYwYjA3OTA0ZTQxOThhZTFkMGE3NjM5
MTdkMWM2OGEyMwo+IEF1dGhvcjogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29t
Pgo+IERhdGU6ICAgVGh1IE9jdCAzIDEwOjI4OjEwIDIwMTkgKzAyMDAKPiAKPiAgICAgbGVkczog
QWRkIG1hbmFnZWQgQVBJIHRvIGdldCBhIExFRCBmcm9tIGEgZGV2aWNlIGRyaXZlcgo+ICAgICAK
PiAgICAgSWYgdGhlIExFRCBpcyBhY3F1aXJlZCBieSBhIGNvbnN1bWVyIGRldmljZSB3aXRoIGRl
dm1fbGVkX2dldCgpLCBpdCBpcwo+ICAgICBhdXRvbWF0aWNhbGx5IHJlbGVhc2VkIHdoZW4gdGhl
IGRldmljZSBpcyBkZXRhY2hlZC4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6IEplYW4tSmFj
cXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KPiAgICAgQWNrZWQtYnk6IFBhdmVsIE1hY2hl
ayA8cGF2ZWxAdWN3LmN6Pgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBQYXZlbCA8cGF2ZWxAdWN3LmN6
Pgo+IAo+IGNvbW1pdCA5M2I5OGM1NzBkN2Y4OTgwNjNhYjYyMDRlMWIzOTUwYTMzMzVkZDEyCj4g
QXV0aG9yOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+IERhdGU6ICAg
VGh1IE9jdCAzIDEwOjI4OjA5IDIwMTkgKzAyMDAKPiAKPiAgICAgbGVkczogQWRkIG9mX2xlZF9n
ZXQoKSBhbmQgbGVkX3B1dCgpCj4gICAgIAo+ICAgICBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgc3Vw
cG9ydCBmb3IgYSBrZXJuZWwgZHJpdmVyIHRvIGdldCBhIExFRCBkZXZpY2UuCj4gICAgIFRoaXMg
d2lsbCBiZSB1c2VkIGJ5IHRoZSBsZWQtYmFja2xpZ2h0IGRyaXZlci4KPiAgICAgCj4gICAgIE9u
bHkgT0YgdmVyc2lvbiBpcyBpbXBsZW1lbnRlZCBmb3Igbm93LCBhbmQgdGhlIGJlaGF2aW9yIGlz
IHNpbWlsYXIgdG8KPiAgICAgUFdNJ3Mgb2ZfcHdtX2dldCgpIGFuZCBwd21fcHV0KCkuCj4gICAg
IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0
aS5jb20+Cj4gICAgIEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiAgICAg
U2lnbmVkLW9mZi1ieTogUGF2ZWwgPHBhdmVsQHVjdy5jej4KPiAKPiBbSWYgeW91IGhhdmUgYW4g
aWRlYSB3aGF0IGVsc2UgaXMgbmVlZGVkLCBpdCB3b3VsZCBiZSB3ZWxjb21lOyBpdAo+IHdvcmtz
IGZvciBtZSBpbiBkZXZlbG9wbWVudCB0cmVlIGJ1dCBub3QgaW4gdHJlZSBJJ2QgbGlrZSB0bwo+
IHVwc3RyZWFtLl0KPiAKPiBMZWUsIHdvdWxkIHlvdSBiZSB3aWxsaW5nIHRvIHRha2UgImJhY2ts
aWdodDogYWRkIGxlZC1iYWNrbGlnaHQKPiBkcml2ZXIiPyBXb3VsZCBpdCBoZWxwIGlmIEkgZ290
ICJsZWRzOiBBZGQgbWFuYWdlZCBBUEkgdG8gZ2V0IGEgTEVECj4gZnJvbSBhIGRldmljZSBkcml2
ZXIiIGFuZCAibGVkczogQWRkIG9mX2xlZF9nZXQoKSBhbmQgbGVkX3B1dCgpIiBpbnRvCj4gZm9y
X25leHQgdHJlZSBvZiB0aGUgTEVEIHN1YnN5c3RlbT8KCkl0IGxvb2tzIGxpa2UgeW91IGhhdmUg
YW4gb3BlbiBxdWVzdGlvbiBmcm9tIFRvbnkgb24gdjEwLgoKSXMgdGhhdCBwYXRjaCBvcnRob2dv
bmFsLCBvciBhcmUgdGhlcmUgZGVwZW5ke2FudHMsZW5jaWVzfT8KCj4gSXQgaXMga2luZCBvZiBp
bXBvcnRhbnQgYXMsIHdlbGwsIHBob25lIHdpdGhvdXQgc2NyZWVuIGxvb2tzIHByZXR0eQo+IG11
Y2ggZGVhZCwgYW5kIHNhbWUgaXNzdWUgaGl0cyBEcm9pZCA0IGFuZCBMaWJyZW0gNSBwaG9uZXMg
YXQgbGVhc3QuLi4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCQkJCQkJCQkJUGF2ZWwKCgoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
