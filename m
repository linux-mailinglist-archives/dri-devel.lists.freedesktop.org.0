Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355B35D06
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8878993B;
	Wed,  5 Jun 2019 12:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3628993B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:40:17 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so2288054eds.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 05:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=19Zu+rAYo+G3lJ9CumK/W89DuTXy0hR8UhibNfpN+P4=;
 b=moBno/mxzMJVg6vHzpGQOCPrDrfGqUVVnREUo5N9XN6CK2vUFf5rY0v6cQtS3YdZEx
 4tHeWYABbHTAfbF8gHEHDZWE+nZesfnk4RdqhW7qua2lTj3Pi5HhGjyFb2oD6+EWnFbQ
 mWNPRl9w97vRZbTUnH5I2IoVMvQeO04+9l6lnWvlHdUNvyUsxXKhSzuCidiwZK0V+wwv
 beZNp5OJ1ZDl6C+m5+ZK/pugrbuPeYYhCWMiNe8XZONF+gHo+Mf0vCk/tPSfUtROsb45
 f2ZfE4+XYuyiKdH6sidBde9tRCE2VYdqLVDBHFNJlz+oEdEQTqxdAktKG7X8KAQoG8dz
 HBTA==
X-Gm-Message-State: APjAAAUj9M3gnE3+v3wPrXVU+nbye6D/N/9fMKtrSnDuacDc3CyguF4e
 efRjv/2QQttIGg47DLR+iR/fWA==
X-Google-Smtp-Source: APXvYqwtCdDy+7ckC3bq0JLPz1ETCd0W2/kqC6hte7TbeC809Dxf35J8hw0BPRDFWMWhdfcS7f/ZEQ==
X-Received: by 2002:a50:ca89:: with SMTP id x9mr41756654edh.164.1559738415815; 
 Wed, 05 Jun 2019 05:40:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z27sm832131ejk.20.2019.06.05.05.40.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 05:40:14 -0700 (PDT)
Date: Wed, 5 Jun 2019 14:40:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Message-ID: <20190605124012.GU21222@phenom.ffwll.local>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604153150.22265-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=19Zu+rAYo+G3lJ9CumK/W89DuTXy0hR8UhibNfpN+P4=;
 b=fE4SL0f4q/InjUL5sSgaTYrHEFfPwX9MhChobpROX88enEjOxXYKx8+1mdXozTcsI1
 G3z8q8zOfG6gwLa8W2F9+AFnBBMjzOmdN6ca2IkZdIfokFXR00CBOkYBzcGJvjnYRtzc
 Ga8ZX+6HMGPAmPpx2qIHOl+1N928Yo8fy+qzM=
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDU6MzE6NTBQTSArMDIwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBX
aGVuIGRlZmVycmluZyBwcm9iZSwgYXZvaWQgbG9nZ2luZyBhIGNvbmZ1c2luZyBlcnJvciBtZXNz
YWdlLiBXaGlsZSBhdAo+IGl0LCBtYWtlIHRoZSBlcnJvciBtZXNzYWdlIG1vcmUgaW5mb3JtYXRp
b25hbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9ob3N0MXgvZGV2LmMgfCA1ICsrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCj4g
aW5kZXggYzU1ZTJkNjM0ODg3Li41YTNmNzk3MjQwZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvaG9zdDF4L2Rldi5jCj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCj4gQEAgLTI0
Nyw4ICsyNDcsMTEgQEAgc3RhdGljIGludCBob3N0MXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgCj4gIAlob3N0LT5jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwg
TlVMTCk7Cj4gIAlpZiAoSVNfRVJSKGhvc3QtPmNsaykpIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKPiAgCQllcnIgPSBQVFJfRVJSKGhvc3QtPmNs
ayk7Cj4gKwo+ICsJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKPiArCQkJZGV2X2VycigmcGRl
di0+ZGV2LCAiZmFpbGVkIHRvIGdldCBjbG9jazogJWRcbiIsIGVycik7CgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gKwo+ICAJCXJldHVybiBl
cnI7Cj4gIAl9Cj4gIAo+IC0tIAo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
