Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DBE57F47
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 11:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0D66E83F;
	Thu, 27 Jun 2019 09:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCCC6E83F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 09:24:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f15so1700212wrp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 02:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LDEo8sY3vpdehIJiLNOJb41+3SEg4OJB1McKdbsbLIA=;
 b=Ot2OqYGi+GADSi2XsFs92H+Lwwn2SsVs85kJpIOr+8IlSf4KvhSRTYLPmKDFfzhXkR
 T/4+ZYhrnz/VC31PqvGRb756ocm6urr0JdQrS2sl9vkVwklJpxWdZ4+xh7YYY5w9778i
 9Cpnk9PUXTVOGvu1sSVMwrpuhvWQgkFPYfITrv4+3X9MNIBFTfv5lVoH9OhZeco971aY
 oVJfMXM4JH4cABZ3ojcqk+UBoyGryYEbNeH+j9JnTRqxdRpa1Py4vXTvoi7IqJ+dN4se
 CuHbOwaAOzuXaaSlT967BwA+IdYI2Whl7t8Jjk7blhwCH7BsCZALp30zJ4n1ctjXuhAf
 uc8A==
X-Gm-Message-State: APjAAAX+QTIGY0Q5vKkDl0i30paicjT7ElMrvTQrR3RZ1yyUu7/uWehI
 KqVLaxcLWb+uVOugAs7rYpUgkA==
X-Google-Smtp-Source: APXvYqwlvlqQ9PBpwP6Ua8UBVUJ+rHq8wSy378IO2LZ07NL/lYMF4gUKV993A67XO9U+QjopyAUeqg==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr2224711wrj.47.1561627496119;
 Thu, 27 Jun 2019 02:24:56 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id h84sm5790048wmf.43.2019.06.27.02.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Jun 2019 02:24:55 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:24:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 3/4] backlight: pwm_bl: Set scale type for CIE 1931 curves
Message-ID: <20190627092453.GB2000@dell>
References: <20190613194326.180889-1-mka@chromium.org>
 <20190613194326.180889-4-mka@chromium.org>
 <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61ed137c-31bb-c695-4174-0484fe667d6c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=LDEo8sY3vpdehIJiLNOJb41+3SEg4OJB1McKdbsbLIA=;
 b=rxjj862CxQk8EcoCFKXxBXec7q2dUTnfV23dSWU3s6L44wRwVyzKQI9LaItmJJBCYr
 CCunUbf0DyHes+96gfl0uMFK7u1ofaigi6tzk8foroRtjW67UkxmOjGR6pS8kxcMHMQf
 gfDC+UhYjbyEUkiMyFnCXp19uDzY8x/EIFJkHM36kWk82KVh6kEh17ORV4Ap0dqDjQeP
 eodW+lpOR5ylkyFRmF441elJYxUkOm61ILlY1XXEY0Qjg+u0/dV1FxmGel1jFTcSljsA
 mWoLPSgxDbcZ1/DraVDtzbuYhHkXnZ+w/hbhz5oruBYDlQJrnauT9rMlNjkp6tmEGn5i
 i8sg==
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
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMSBKdW4gMjAxOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgoKPiBPbiAxMy8wNi8y
MDE5IDIwOjQzLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90ZToKPiA+IEZvciBiYWNrbGlnaHQgY3Vy
dmVzIGNhbGN1bGF0ZWQgd2l0aCB0aGUgQ0lFIDE5MzEgYWxnb3JpdGhtIHNldAo+ID4gdGhlIGJy
aWdodG5lc3Mgc2NhbGUgdHlwZSBwcm9wZXJ0eSBhY2NvcmRpbmdseS4gVGhpcyBtYWtlcyB0aGUK
PiA+IHNjYWxlIHR5cGUgYXZhaWxhYmxlIHRvIHVzZXJzcGFjZSB2aWEgdGhlICdzY2FsZScgc3lz
ZnMgYXR0cmlidXRlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4KPiAKPiBJJ2QgbGlrZSB0byBrZWVwIGRpc2N1c3Npb24gb24gcGF0
Y2ggMiBvcGVuIGEgYml0IGxvbmdlciAoaXQncyBub3QgcGFydCBvZgo+IHRoZSB0aHJlYWQgYmVs
b3cgcGF0Y2ggMiBidXQgUGF2ZWwgaGFkIGNvbmNlcm5zIGFib3V0IHRoZSBzeXNmcyBpbnRlcmZh
Y2UpCj4gc28gdGhpcyBhY2sgd29uJ3QgcmVhbGx5IHB1c2ggdGhpbmdzIGZvcndhcmQgYnV0IEZX
SVc6Cj4gCj4gQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFy
by5vcmc+CgpEb2VzIHRoaXMgZGVwZW5kIG9uIHBhdGNoIDIsIG9yIGlzIGl0IG9ydGhvZ29uYWw/
Cgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgNSArKysr
LQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gPiBpbmRleCBmYjQ1Zjg2NmI5MjMuLmYw
NjdmZTdhYTM1ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9i
bC5jCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+ID4gQEAgLTU1
Myw2ICs1NTMsOCBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+ICAgCQlnb3RvIGVycl9hbGxvYzsKPiA+ICAgCX0KPiA+ICsJ
bWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcykpOwo+
ID4gKwo+ID4gICAJaWYgKGRhdGEtPmxldmVscykgewo+ID4gICAJCS8qCj4gPiAgIAkJICogRm9y
IHRoZSBEVCBjYXNlLCBvbmx5IHdoZW4gYnJpZ2h0bmVzcyBsZXZlbHMgaXMgZGVmaW5lZAo+ID4g
QEAgLTU5MSw2ICs1OTMsOCBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgCQkJcGItPmxldmVscyA9IGRhdGEtPmxldmVs
czsKPiA+ICAgCQl9Cj4gPiArCj4gPiArCQlwcm9wcy5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9D
SUUxOTMxOwo+ID4gICAJfSBlbHNlIHsKPiA+ICAgCQkvKgo+ID4gICAJCSAqIFRoYXQgb25seSBo
YXBwZW5zIGZvciB0aGUgbm9uLURUIGNhc2UsIHdoZXJlIHBsYXRmb3JtIGRhdGEKPiA+IEBAIC02
MDEsNyArNjA1LDYgQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgIAlwYi0+bHRoX2JyaWdodG5lc3MgPSBkYXRhLT5sdGhf
YnJpZ2h0bmVzcyAqIChzdGF0ZS5wZXJpb2QgLyBwYi0+c2NhbGUpOwo+ID4gLQltZW1zZXQoJnBy
b3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzKSk7Cj4gPiAgIAlwcm9w
cy50eXBlID0gQkFDS0xJR0hUX1JBVzsKPiA+ICAgCXByb3BzLm1heF9icmlnaHRuZXNzID0gZGF0
YS0+bWF4X2JyaWdodG5lc3M7Cj4gPiAgIAlibCA9IGJhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIo
ZGV2X25hbWUoJnBkZXYtPmRldiksICZwZGV2LT5kZXYsIHBiLAo+ID4gCj4gCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFj
ZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
