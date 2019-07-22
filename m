Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2270376
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 17:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADF689CA8;
	Mon, 22 Jul 2019 15:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7448189CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:18:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x1so24852330wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kJIZoXmnEJk2nuaDS1euaSfVjq7bZa7xFpx8vg18ues=;
 b=R0rOJo2jrnh4u0QkHgWWaVN95dlrk4n1va2HSxCxMWy3F6+f1UVVI65MfonLvwb9uw
 bpnZ0I5lbWJn55csQNECNqk4IOqlXukyT0uFj22MGJ70CSw19SYQbE+P2XI/ar6K/R2J
 7r6dYJY4sfIvmGVxh6Zwz3LviP+w+g11JCC765QOiIBvZYqmyt4s2p15uY/dNlIhYF/I
 6gWkKfzdXPKDWFVKBehJ4W8bEvPhWxSTMj88Q+S+aKZ2C7daKw/NkdUHgPHCc5N1Vsvx
 V/flpvGcvo4SH8QbZFxao82o5SFxj/SoVFMDtnBp2cpE7J6pkZdxkajksoN6CxWYHAXW
 c/lg==
X-Gm-Message-State: APjAAAUwe8tt10045Pg8gnkf6+3z4Tm5DwdX7na8kwD64N1/yHJUzTxn
 il6dCDB6aySGU0QkYJTGpYAB9A==
X-Google-Smtp-Source: APXvYqwzssx9bi+kpuqmBQK4Q0zcUFYDYs9ctyDAvKFt8l2MfJ1utjL2AT+NQh6yZBGaAgBoipYLhA==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr73952371wrq.333.1563808711047; 
 Mon, 22 Jul 2019 08:18:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id b5sm33232438wru.69.2019.07.22.08.18.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:18:30 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:18:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 4/7] backlight: gpio: remove unused fields from
 platform data
Message-ID: <20190722151828.sefbqj5vf5vtrik3@holly.lan>
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722150302.29526-5-brgl@bgdev.pl>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kJIZoXmnEJk2nuaDS1euaSfVjq7bZa7xFpx8vg18ues=;
 b=R8xbBrGPGLYEg+fbDVZlVqU0/MX8qvpSvYM5BRrRcMJmaQWlDvQBjOsDvzqzGXi2yL
 +F3P+mSXQKXvOQoHCKXasn3T1fKDwZI/8NRNHQH99OC/bjHPY5Brw9h3HzyBUF5fANth
 vzD6QvRsuvJayURHV5qrDxjdcVlQ4/klfZPoQrFYz1iOQnEp83H/9Gw+MJKr02S9/HzB
 OgkAX5D8NuBKqrR0L4PUno1eo72I0a9hBErXyVDYlP6Xbym+ED8A825MqdjJS7SglUvb
 bJiD5TdhG7qS+kInVSG4SBIJ4CShOp0/+WlLnNtiskli0KzGOT5v3fVRkSJV1LQHqL3d
 Xcng==
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDU6MDI6NTlQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5
bGlicmUuY29tPgo+IAo+IFJlbW92ZSB0aGUgcGxhdGZvcm0gZGF0YSBmaWVsZHMgdGhhdCBub2Jv
ZHkgdXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6
ZXdza2lAYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2Rh
dGEvZ3Bpb19iYWNrbGlnaHQuaCB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19i
YWNrbGlnaHQuaCBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9ncGlvX2JhY2tsaWdodC5o
Cj4gaW5kZXggMzQxNzlkNjAwMzYwLi4xYThiNWIxOTQ2ZmUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9wbGF0Zm9ybV9kYXRhL2dwaW9fYmFja2xpZ2h0LmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX2RhdGEvZ3Bpb19iYWNrbGlnaHQuaAo+IEBAIC05LDkgKzksNiBAQCBzdHJ1
Y3QgZGV2aWNlOwo+ICAKPiAgc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgewo+
ICAJc3RydWN0IGRldmljZSAqZmJkZXY7Cj4gLQlpbnQgZ3BpbzsKPiAtCWludCBkZWZfdmFsdWU7
Cj4gLQljb25zdCBjaGFyICpuYW1lOwo+ICB9Owo+ICAKPiAgI2VuZGlmCj4gLS0gCj4gMi4yMS4w
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
