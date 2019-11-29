Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C022510D334
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FDD6E8A6;
	Fri, 29 Nov 2019 09:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D7E6E89E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:24:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so34195367wru.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7LhFAcjV7jdT90dH+pVWA1/5jK5ehW9ZZY7BlTD4CNw=;
 b=OJ9rpwyPWAsaeUjWkOp8wrNC3+57y6Doy4GDb9u5d6zcHbmqvOgU1dAQdG7eY0T/H5
 HQe9wDsTrXtVJD4dfw/wA04h47J3UvNQEOBcOXQH22lpyeNLEs8vpAuqpM6imLh5u9lv
 sYllRZP/2KFdSRv8vPQniQVC4rNo8wckm5jtc4I7H+I2+hZVSyoUKBO2uG36RBVEGDKQ
 lH/3Gh4lCsODXD/1PsItozQLTEQZtuAjB27DJQjhXqEvG5JNVwSxHGbpLJvV6a4737Ia
 W8ica2iOHz/SaFrf+uh522xohh2vk3LnK+0yt3STr5gjtBL8hqE908MsYRVlO1YWfIYS
 hJCw==
X-Gm-Message-State: APjAAAXJxFxRHwol+Skr5RdZ9tF3jzDXRmyiwqrbQbO5Tv4aqtEEt5p+
 XUvFCq5+zuo5MahL8zAGj5DB/g==
X-Google-Smtp-Source: APXvYqyU4d7rBqA+DeLWPtwWmoPW+jO/47z9caNHBTyOmd9L1u2p3EWNavS8mHT/Yfajj6tb1DrYsQ==
X-Received: by 2002:adf:83c7:: with SMTP id 65mr7607282wre.368.1575019451628; 
 Fri, 29 Nov 2019 01:24:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id h8sm9784763wrx.63.2019.11.29.01.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:24:11 -0800 (PST)
Date: Fri, 29 Nov 2019 10:24:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 9/9] drm/tegra: sor: Make the +5V HDMI supply optional
Message-ID: <20191129092409.GE624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-10-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-10-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7LhFAcjV7jdT90dH+pVWA1/5jK5ehW9ZZY7BlTD4CNw=;
 b=lwqIMEP9sKSqHwuHJ8ISzFRWN1kwGs6foGY5TXT+9rFVjKq8sYS98nCkpX+zljZaVo
 2crAvs4eFqLDMOpOyP2BmDE3HH+2O5d+9+8FmkH8AF27q6H1F+7T5q9KqREBUx+Q7dD/
 DaNvpt0UrHa/fFSbf4cT9WEYvKB+MUkW0/CcU=
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

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgMDQ6Mzc6NDFQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBU
aGUgU09SIHN1cHBvcnRzIG11bHRpcGxlIGRpc3BsYXkgbW9kZXMsIGJ1dCBvbmx5IHdoZW4gZHJp
dmluZyBhbiBIRE1JCj4gbW9uaXRvciBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gY29udHJvbCB0aGUg
KzVWIHBvd2VyIHN1cHBseS4gZURQIGFuZCBEUAo+IGRvbid0IG5lZWQgdGhpcywgc28gbWFrZSBp
dCBvcHRpb25hbC4KPiAKPiBUaGlzIGZpeGVzIGEgY3Jhc2ggb2JzZXJ2ZWQgZHVyaW5nIHN5c3Rl
bSBzdXNwZW5kL3Jlc3VtZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgfCAxOCArKysr
KysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+IGluZGV4IDIyMDBmNGNkMzk3YS4uYTY4ZDNi
MzZiOTcyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+IEBAIC0zOTcwLDE1ICszOTcwLDI5IEBAIHN0
YXRpYyBpbnQgdGVncmFfc29yX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAg
c3RhdGljIGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAg
CXN0cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICsJaW50IGVy
cjsKPiArCj4gKwlpZiAoc29yLT5oZG1pX3N1cHBseSkgewo+ICsJCWVyciA9IHJlZ3VsYXRvcl9k
aXNhYmxlKHNvci0+aGRtaV9zdXBwbHkpOwo+ICsJCWlmIChlcnIgPCAwKQo+ICsJCQlyZXR1cm4g
ZXJyOwo+ICsJfQo+ICAKPiAtCXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShzb3ItPmhkbWlfc3Vw
cGx5KTsKPiArCXJldHVybiAwOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCWludCBlcnI7Cj4gKwo+ICsJaWYgKHNvci0+aGRtaV9z
dXBwbHkpIHsKPiArCQllcnIgPSByZWd1bGF0b3JfZW5hYmxlKHNvci0+aGRtaV9zdXBwbHkpOwo+
ICsJCWlmIChlcnIgPCAwKQo+ICsJCQlyZXR1cm4gZXJyOwo+ICsJfQo+ICAKPiAtCXJldHVybiBy
ZWd1bGF0b3JfZW5hYmxlKHNvci0+aGRtaV9zdXBwbHkpOwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0ZWdyYV9zb3JfcG1fb3BzID0gewo+
IC0tIAo+IDIuMjMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
