Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B3DE98F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 12:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88B898C7;
	Mon, 21 Oct 2019 10:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADC5898C7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 10:35:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z9so13324434wrl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 03:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kCC2K+1Phv+hZCvepsAaxz4dYzO4ZQaseMmOK9Alp0E=;
 b=YF8y0Oa0X6pwfSQK0b9sLBvg18suoDjLRWT9sJRW+g+ALrq8LVauR14UbUd6Le4iCm
 8Vi5XQ3nEzCWhTJvYfzAS2FZfVpCRLyxjY0Gwuc7zitKY6MeAH0pbgNcUhY7AU38mZ+L
 Wwedc2aT1XA7oObsWLtXnjz5e2uyxbF4jH3VBDQcbRbNAEKNXIGkSP+dnG9x634bsMjL
 WvMjTAqyuNxFD6yOlodm2EVLlVvE+Dz/lIAH4qwaasx/uyrCrfl5opPZxPeu/O26GmzM
 Hqj73U2xIZdI1ShIN0ye546YA8T5woIMrv1D5w07dLciVTYLlTr+ruVMmq+inxedyCnI
 wblg==
X-Gm-Message-State: APjAAAXCAGQL2QG4tFRLbE5e853IC0WpkGtyyy8H+NRW3JDEGMKblVge
 wsFAAdK95gh/ChGzxVIttef1NovHX3vgAw==
X-Google-Smtp-Source: APXvYqwzq4W2hoqMGfXD+SnL4v4XRwsU52eKiLQU7E1OuYqmacWEauu7fUOpM3T6jtW1TY+PYeZ8Yw==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr18183433wrn.337.1571654139130; 
 Mon, 21 Oct 2019 03:35:39 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id c18sm13475121wrv.10.2019.10.21.03.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 03:35:38 -0700 (PDT)
Date: Mon, 21 Oct 2019 11:35:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v6 2/9] backlight: gpio: remove stray newline
Message-ID: <20191021103536.svhda5kmffhm5hjd@holly.lan>
References: <20191019083556.19466-1-brgl@bgdev.pl>
 <20191019083556.19466-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191019083556.19466-3-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kCC2K+1Phv+hZCvepsAaxz4dYzO4ZQaseMmOK9Alp0E=;
 b=t3cX8WuPKhyW/BpGMRXewuy78R7w/7zHRJAn8p3dQKQhukExp9KXRyiHQyZRTZgcFr
 0/pl5MrCraK5WBczSBLwEjUlqJTKVoS/g+6NITgaiFUHaA7IbHUBno7wgha+PhK8Ezmj
 5mJSHCJmisfZGWC1TVJG+/bomIXUOeCqAXrKt+0YDkAEWgYrCiIUXsZ8c30JsZpVc/uW
 2F25TYKY7ZnPOQ/WQe6pOp9mAEwYaNyQVo2o5NzhBoPbgVKO/CdBduSVc9MBnP5TSM6f
 VLUNnsx7qaQ2y3zEpnuF8EUCKoY7Wl+T/mPi5QVjgndd4zTXy2aXSO8Y1CRecvEAspBy
 D7kw==
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
Cc: Jacopo Mondi <jacopo@jmondi.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTksIDIwMTkgYXQgMTA6MzU6NDlBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFJlbW92ZSBhIGRvdWJsZSBuZXdsaW5lIGZyb20gdGhlIGRyaXZlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+Cgood293ISB0aGF0IG9uZSB3YXMgZWFzeSA7LSkgKQoKPiAtLS0KPiAgZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDEgLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYwo+IGluZGV4IDdlMTk5MDE5OWZhZS4uMzk1NWI1MTNmMmY4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCj4gQEAgLTkxLDcgKzkxLDYgQEAgc3Rh
dGljIGludCBncGlvX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2Jh
Y2tsaWdodCAqZ2JsKQo+ICAJcmV0dXJuIEZCX0JMQU5LX1VOQkxBTks7Cj4gIH0KPiAgCj4gLQo+
ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIHsKPiAgCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0
YSA9Cj4gLS0gCj4gMi4yMy4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
