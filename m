Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 227AE1CE797
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 23:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4636E5A4;
	Mon, 11 May 2020 21:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072946E5A2;
 Mon, 11 May 2020 21:40:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 50so12327486wrc.11;
 Mon, 11 May 2020 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5X8EFCpZJBd5h5C0SmmApdosK9J40B8tFJDCu42fLm0=;
 b=p1eWOfAz4Y+0E99msj9lGfrdnuQxij1SNRHI75WOlswQF3ZvXEm8CmYt424g94JLjp
 j5fLYRORhOd8kySHVVYLnAtQuEPiuqF1oJtvRgRhVDfgnvVlgRPE+c/68Mvl0pXEyzZd
 Sp1MXB5LxoRkegDDCJpmAPCjdr1R2adZQNYqEVXxwnQIr8BHriEeCGObU1eMsvMqzPMT
 yNpB+dDJNbvN4J8KSeJnCloC5cQlf98wykdjPQtorYF+VJnNwUshof2llEsAZ/5qsKkl
 f1m0w1T3Uwu4NEYj8RKcrVNNEcD5Es/++82d7PPAq35MWNPgr271UifWTkLbV8qqnbWi
 X8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5X8EFCpZJBd5h5C0SmmApdosK9J40B8tFJDCu42fLm0=;
 b=BPFSneXcFL130O+Y/mXptteEQBouMa3Z+lebDxLwwjg3a6MkWvhZqSdBHbGtqZvp3W
 wWtOuaoZmEGsPLWrroT+GRYGkJukFJU2sz/XWr1OnzhgtMhgWnzcK+8NZW+tbRe+L8KT
 twJZfha5vh5eho1X1omL8jlO0JN4ZMa+ADEeSkZRYnBDROXxdrDFnTPMxeNoX+DVwHIN
 Dc38Mn7Z3XCT7XOaG4w4gkbpIF7AXpYx0faGidiPZwJiCYKSQrJR9pdSyv7jw36wqaJi
 u9yeACI1pTp02uGpTxX1NaoiiKyhtpx/HjGXt1bM80NDvgS5yApn5UoymeiL5BOfHwAM
 Ry1w==
X-Gm-Message-State: AGi0PuZpXXnYeyl88lNkt8ZZxwHzUWR7U2N0XIEUWDdTULWDG7v5AvKu
 jeADpppXoYG2eXjcHEz6g0RBHx9ZvBCJHvpMehs=
X-Google-Smtp-Source: APiQypJLuAuptFSaBs8Nd4XMm2iRcJ4ZOKS1lydP9mvLSkNanXsBJCdXf5ZUIyn0+FQu86Hv1bissqd4AK6IYc2CIBA=
X-Received: by 2002:adf:93a3:: with SMTP id 32mr9674255wrp.124.1589233226569; 
 Mon, 11 May 2020 14:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200509062959.42481-1-yanaijie@huawei.com>
In-Reply-To: <20200509062959.42481-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 May 2020 17:40:15 -0400
Message-ID: <CADnq5_NVPsQDsqQBPk2EB_LguN0R+NsSBnDcUtwFxZKqdYLa+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: remove defined but not used 'crtc_offsets'
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Hulk Robot <hulkci@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFNhdCwgTWF5IDksIDIwMjAgYXQgNTowNSBBTSBK
YXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gRml4IHRoZSBmb2xsb3dp
bmcgZ2NjIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5j
OjY1OjE4OiB3YXJuaW5nOiDigJhjcnRjX29mZnNldHPigJkKPiBkZWZpbmVkIGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3QgdTMyIGNydGNfb2Zm
c2V0c1s2XSA9Cj4gICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+Cj4KPiBSZXBvcnRlZC1i
eTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24g
WWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjZfMC5jIHwgMTEgLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192Nl8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jCj4gaW5kZXgg
YzFhNTMwZGJlMTYyLi5hNzVlNDcyYjRhODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y2XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192Nl8wLmMKPiBAQCAtNjEsMTcgKzYxLDYgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
c2k1OF9tYy5iaW4iKTsKPiAgI2RlZmluZSBNQ19TRVFfTUlTQzBfX01UX19IQk0gICAgMHg2MDAw
MDAwMAo+ICAjZGVmaW5lIE1DX1NFUV9NSVNDMF9fTVRfX0REUjMgICAweEIwMDAwMDAwCj4KPiAt
Cj4gLXN0YXRpYyBjb25zdCB1MzIgY3J0Y19vZmZzZXRzWzZdID0KPiAtewo+IC0gICAgICAgU0lf
Q1JUQzBfUkVHSVNURVJfT0ZGU0VULAo+IC0gICAgICAgU0lfQ1JUQzFfUkVHSVNURVJfT0ZGU0VU
LAo+IC0gICAgICAgU0lfQ1JUQzJfUkVHSVNURVJfT0ZGU0VULAo+IC0gICAgICAgU0lfQ1JUQzNf
UkVHSVNURVJfT0ZGU0VULAo+IC0gICAgICAgU0lfQ1JUQzRfUkVHSVNURVJfT0ZGU0VULAo+IC0g
ICAgICAgU0lfQ1JUQzVfUkVHSVNURVJfT0ZGU0VUCj4gLX07Cj4gLQo+ICBzdGF0aWMgdm9pZCBn
bWNfdjZfMF9tY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7Cj4gICAgICAg
ICB1MzIgYmxhY2tvdXQ7Cj4gLS0KPiAyLjIxLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
