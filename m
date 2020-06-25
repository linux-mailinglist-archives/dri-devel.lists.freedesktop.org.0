Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCB7209C37
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D56EA11;
	Thu, 25 Jun 2020 09:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130FF6EA11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:46:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so5246687wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vxl/tdv9kpWIOuN2YYNY6bKce9KEtpxUCz4B4fhlwMs=;
 b=E0CHlPpOfBqGZD74u+uo1w2hr2b1CGencolNHf1PknVTcOxLfkAyK0NwwnxeXTXuU0
 erbhuiFNXLPZwf1SAvTRASh2mqXkZ6aTB0SJCg80WaNjT0ezOSXNsgviYZTjcM8OEWmi
 sZi2QRcp/wO3FZSK3XqSW0FOB/fkmUZFzoG1824UAes7Ig//VM0qw6HVxGoqQNFcX3iS
 jd+jf4R1MrEAS00a7umB5+6Hy5isDM2yy7brQkbH8HIect9U6iorDx0D1413r8gJC0+n
 m+MUBrJP00jUMujNhu4sivLcL4lh/QUbL+cj4zhkfaAN0qF93X6bLZzJZmR7ZsS154gf
 Ov9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vxl/tdv9kpWIOuN2YYNY6bKce9KEtpxUCz4B4fhlwMs=;
 b=pDyWrQaNA2rX2h1bN9cd7khqHGKDht+j1rNf1KPED35g6HuSl7BQsyx9/lkBPNBl+F
 pj+QY8cZEJIATnz9ENCZJAP2i2KN4fJEzp6fimSHGpg1V8Rd5mVuZV3UBe1atqDvgE7b
 Wb9kY6lWC/UoXpqmVmVPi73Y4CWKBAQZpaxK01gU3QWD56MVQv35Vrn3EcLy4+cPvxYe
 5019kX/nsaqOI07fnOPkIrEfgrltdyEkUTIPb8B+EK3xtX1wuGNdkdiqENcj0nSfZrEU
 TXbb9ycAWFFUISTf7TaCO8royNpjzCKekcp4+NSGgWJfGWyaFtNdXSGHwK4AMaLDVVTy
 blgw==
X-Gm-Message-State: AOAM532D1pOn2sBBxRZNJzp1TJqwDt3/92pUv761o+l1TioyparXrUX7
 UkgoXZVEYr2gHPAWCqypQBpLPw==
X-Google-Smtp-Source: ABdhPJyJPSUnMWkYym/l/M3quKvkj6eev/Am+p1MkAozrU5ybki4gZEqiO8/NowLH+fVWnbtW2vWew==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr2445278wme.42.1593078374694; 
 Thu, 25 Jun 2020 02:46:14 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w2sm19962496wrs.77.2020.06.25.02.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 02:46:14 -0700 (PDT)
Date: Thu, 25 Jun 2020 10:46:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 8/8] backlight: qcom-wled: Remove unused configs for LED3
 and LED4
Message-ID: <20200625094612.fn3o5bd37t7vadsc@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624145721.2590327-9-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MjFQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IEZpeGVzIFc9MSB3YXJuaW5nczoKPiAKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNv
bS13bGVkLmM6MTI5NDozNDogd2FybmluZzog4oCYd2xlZDRfc3RyaW5nX2NmZ+KAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICAxMjk0IHwgc3RhdGlj
IGNvbnN0IHN0cnVjdCB3bGVkX3Zhcl9jZmcgd2xlZDRfc3RyaW5nX2NmZyA9IHsKPiAgfCBefn5+
fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jOjEyOTA6
MzQ6IHdhcm5pbmc6IOKAmHdsZWQzX3N0cmluZ19jZmfigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTI5MCB8IHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
d2xlZF92YXJfY2ZnIHdsZWQzX3N0cmluZ19jZmcgPSB7Cj4gIHwgXn5+fn5+fn5+fn5+fn5+fgo+
IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBDYzogQW5keSBHcm9zcyA8YWdyb3Nz
QGtlcm5lbC5vcmc+Cj4gQ2M6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFy
by5vcmc+Cj4gQ2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KPiBDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgfCA4IC0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9xY29tLXdsZWQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4g
aW5kZXggNGM4YzM0Yjk5NDQxNC4uYzI1YzMxMTk5OTUyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3Fjb20td2xlZC5jCj4gQEAgLTEyODcsMTQgKzEyODcsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHdsZWRfdmFyX2NmZyB3bGVkNF9zdHJpbmdfaV9saW1pdF9jZmcgPSB7Cj4gIAkuc2l6ZSA9
IEFSUkFZX1NJWkUod2xlZDRfc3RyaW5nX2lfbGltaXRfdmFsdWVzKSwKPiAgfTsKPiAgCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQzX3N0cmluZ19jZmcgPSB7Cj4gLQku
c2l6ZSA9IDgsCj4gLX07Cj4gLQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyB3
bGVkNF9zdHJpbmdfY2ZnID0gewo+IC0JLnNpemUgPSAxNiwKPiAtfTsKPiAtCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQ1X21vZF9zZWxfY2ZnID0gewo+ICAJLnNpemUg
PSAyLAo+ICB9Owo+IC0tIAo+IDIuMjUuMQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
