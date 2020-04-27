Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36491BADFF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 21:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D434C6E151;
	Mon, 27 Apr 2020 19:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8355F6E151;
 Mon, 27 Apr 2020 19:32:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 188so185123wmc.2;
 Mon, 27 Apr 2020 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4/npxxtH+H1OeXXMGzZZnqf+6zu3hCivzxJohpfCQF4=;
 b=n5DS4mi790uR4KR7jkR4G+Sa4b1EbK+SfC23Apm2Z+aCa5so6VCDig/MIh1Jf6cBP8
 n+8EqbD1Llns9FfaffKpvEtCTkf4srgM7b6luuSYYV37ANfVYbT6LXmVQPVdqaM4aTHz
 KLIiqTX7GaouFxw3sYQziltDN2ALBDdWsJSN56/exqCntOxbuQtzI7xfTzXEVf8bfGUx
 4DPHCU1dJVR/eXPBrseFSVmz6jtTJNrGlXsOq02zpSZ3h+geeEvDTvLEMZS9DZQPcG/F
 rn7yre0pMarF8QzdOsYlKRXnVOXanX2bAMhRuM2q7SI4TUj6m8kR4T2KSvjOmhg7Z8/S
 7Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4/npxxtH+H1OeXXMGzZZnqf+6zu3hCivzxJohpfCQF4=;
 b=NTnbTxSGSopqaEYu0/q0ed/Z6RO/D2S5IYWvWq5UHU6grt4iNoK7csrRxI9Y7pz1L1
 KZrHjBZ0oHILu6xnYJE4Cm6H/fkDsm9rFF7lsnGFMDsMupbtWe+/99qYfbMrPkSmadNV
 TptP5O6h4moMHKS0iainp3imQWNAu4wz5yFE57IDu2FvHShJZE+ku9Cky7WHI2ceR3pD
 gEtKeAzpiJYemQaLquiT0GXMRj9qTXuaTpdBEU8nOsKCj5yYRvOHAryhl6MI9flWhgs7
 c64y+mvaAAnKGXsaolX6bVxrRekDfA0lB7v0/8IAvBtOLp+NkGbD5V89k9QgpLhOH+uD
 ES5w==
X-Gm-Message-State: AGi0Pub/WKky+kZzVOA4jjnaMeHz9VJqJOzlQZwArh7nCEk9QyFTTKZE
 Y5KOPUuWZmY+zuF0bkyEWAsxlKDq0htfFQ+vsOA=
X-Google-Smtp-Source: APiQypJwGs92/0Duteoz2jJWYEITGhMBlH7Ezu6BITIsatXNYDTf+lZCUXwEqwNTqKgT/ilVjIO/lJ6ZE2N5pJMOCnY=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr242589wmh.39.1588015962213;
 Mon, 27 Apr 2020 12:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200427063715.21255-1-yanaijie@huawei.com>
 <ca33223e-efd8-cc26-1dec-c7975a5001ca@amd.com>
In-Reply-To: <ca33223e-efd8-cc26-1dec-c7975a5001ca@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Apr 2020 15:32:30 -0400
Message-ID: <CADnq5_P+U3Kz1r+ehHKZeHULYix5hzJfn0hrn80OtAKNzsZczw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove conversion to bool in dcn20_mpc.c
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jason Yan <yanaijie@huawei.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDQ6MDMgQU0g
Q2hyaXN0aWFuIEvDtm5pZwo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFt
IDI3LjA0LjIwIHVtIDA4OjM3IHNjaHJpZWIgSmFzb24gWWFuOgo+ID4gVGhlICc9PScgZXhwcmVz
c2lvbiBpdHNlbGYgaXMgYm9vbCwgbm8gbmVlZCB0byBjb252ZXJ0IGl0IHRvIGJvb2wgYWdhaW4u
Cj4gPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgo+ID4KPiA+
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9tcGMuYzo0NTU6NzAt
NzU6IFdBUk5JTkc6Cj4gPiBjb252ZXJzaW9uIHRvIGJvb2wgbm90IG5lZWRlZCBoZXJlCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+Cj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPgo+
ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9t
cGMuYyB8IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9tcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9tcGMuYwo+ID4gaW5kZXggZGU5Yzg1N2FiM2U5Li45ZDc0MzJmM2ZiMTYgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbXBj
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9t
cGMuYwo+ID4gQEAgLTQ1Miw3ICs0NTIsNyBAQCB2b2lkIG1wYzJfc2V0X291dHB1dF9nYW1tYSgK
PiA+ICAgICAgICAgICAgICAgbmV4dF9tb2RlID0gTFVUX1JBTV9BOwo+ID4KPiA+ICAgICAgIG1w
YzIwX3Bvd2VyX29uX29nYW1fbHV0KG1wYywgbXBjY19pZCwgdHJ1ZSk7Cj4gPiAtICAgICBtcGMy
MF9jb25maWd1cmVfb2dhbV9sdXQobXBjLCBtcGNjX2lkLCBuZXh0X21vZGUgPT0gTFVUX1JBTV9B
ID8gdHJ1ZTpmYWxzZSk7Cj4gPiArICAgICBtcGMyMF9jb25maWd1cmVfb2dhbV9sdXQobXBjLCBt
cGNjX2lkLCBuZXh0X21vZGUgPT0gTFVUX1JBTV9BKTsKPiA+Cj4gPiAgICAgICBpZiAobmV4dF9t
b2RlID09IExVVF9SQU1fQSkKPiA+ICAgICAgICAgICAgICAgbXBjMl9wcm9ncmFtX2x1dGEobXBj
LCBtcGNjX2lkLCBwYXJhbXMpOwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
