Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B28E6CD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD46E8FB;
	Thu, 15 Aug 2019 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6856E591
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:52:19 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 16so3059102oiq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFvHPaEBpVtDvsWsYTlc9ktuYlykq2Vr8qmG0BvJYjQ=;
 b=ObyStTY3p41M3+hLl3AiJR1Rx2y+FHZ4jITtezBuDG1nghEMha+Ne5ZHWomtJxD02U
 F6X8Atw2UafyONPn+rx+XDQviloS/98qdUyQUtAzvNSiheUrXZL4X9tPuOLUjAfZC8yi
 pMBsiOr7KgOk+qVc6h1Ni+xjGbtzGTAtVjggR1YfK7K7Jhf9QOJs4R9DZaMdb7W4rh8M
 zAw+7NbUYaEWutf6em6Nr3vii5B5VWR/MbgIYk2uvkRsMcwC4SZSNgE6Pz7dOWafpbZl
 op1OLzZ4hKNJlMGzbR6s1o0kyNmMi+cDphyn6OCz1g0y3oDulRQp3giCQb9q9lB+l8bD
 +Azg==
X-Gm-Message-State: APjAAAUPiHuZci2PhSnGsDA7Ibp8KWG57H3PW4GNtjyb3kZUYErWOoev
 LZum+BYG1f5ZJIr/4qbTtKCEZoUjrLT+phKCAZJ0EA==
X-Google-Smtp-Source: APXvYqy9mUtI5PPGciU9JdBXtN+uZK4N0zN7cuSjarKrVdkZREuIQs1m8ssHSkm+3oY9x9IO0S8JUsNE8p8fudmw790=
X-Received: by 2002:a02:a88e:: with SMTP id l14mr2649335jam.105.1565779938039; 
 Wed, 14 Aug 2019 03:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-5-darekm@google.com>
 <20190813112014.GE13294@shell.armlinux.org.uk>
In-Reply-To: <20190813112014.GE13294@shell.armlinux.org.uk>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Wed, 14 Aug 2019 12:52:06 +0200
Message-ID: <CALFZZQGXrQh-RnuMihfpTPxhpVohRFnrkQ0V_fJo00SAM16yTg@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drm: tda998x: use cec_notifier_conn_(un)register
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BFvHPaEBpVtDvsWsYTlc9ktuYlykq2Vr8qmG0BvJYjQ=;
 b=nZvbfydpf2sDd0yKC1kYDe7pbTYf0RoRnG/RwmCKjN4PumO0LUNsXhUwuGjilZjqI1
 nYaRqSAEFEqavuSSKxdcN6kkX0m9c+6ArZfhoviiE37qwBpKRFUYF1jWToMixOQkSFJA
 qjm9yWN0hOS0n1/MvltJKRhnYLeknjuIHfB2FapfoPmgfnZwA7iW8k1TPD/LjKXYhe9N
 LlJ/dFJnU5Cp3WbO2Hsls6hry/vs4ggNY6JdYejq6jRP16HM2bLhWwe+CfZ+ncYIWh/W
 aKRjnNGCAknT7MYibajbR+rmDfl110as88QeipfeOBKHgbL5EXpAQ/t1FmK+vXzStbvi
 GnuA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8uCgpPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAxOjIwIFBNIFJ1c3NlbGwgS2luZyAtIEFS
TSBMaW51eCBhZG1pbgo8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IFRoaXMgYWxz
byBkb2Vzbid0IG1ha2Ugc2Vuc2U6IHRkYTk5OHhfZGVzdHJveSgpIGlzIHRoZSBvcHBvc2l0ZSBv
Zgo+IHRkYTk5OHhfY3JlYXRlKCkuICBIb3dldmVyLCB0ZGE5OTh4X2Nvbm5lY3Rvcl9kZXN0cm95
KCkgaXMgdGhlCj4gb3Bwb3NpdGUgb2YgdGRhOTk4eF9jb25uZWN0b3JfY3JlYXRlKCkuCj4KPiBC
eSBtb3ZpbmcgdGhlIENFQyBjcmVhdGlvbiBjb2RlIGludG8gdGRhOTk4eF9jb25uZWN0b3JfY3Jl
YXRlKCksIHlvdQo+IGFyZSBjcmVhdGluZyB0aGUgcG9zc2liaWxpdHkgZm9yIHRoZSBmb2xsb3dp
bmcgc2VxdWVuY2UgdG8gbWVzcyB1cAo+IENFQyBhbmQgbGVhazoKPgo+ICAgICAgICAgdGRhOTk4
eF9jcmVhdGUoKQo+ICAgICAgICAgdGRhOTk4eF9jb25uZWN0b3JfY3JlYXRlKCkKPiAgICAgICAg
IHRkYTk5OHhfY29ubmVjdG9yX2Rlc3Ryb3koKQo+ICAgICAgICAgdGRhOTk4eF9jb25uZWN0b3Jf
Y3JlYXRlKCkKPiAgICAgICAgIHRkYTk5OHhfY29ubmVjdG9yX2Rlc3Ryb3koKQo+ICAgICAgICAg
dGRhOTk4eF9kZXN0cm95KCkKPgo+IEFueXRoaW5nIHlvdSBjcmVhdGUgaW4gdGRhOTk4eF9jb25u
ZWN0b3JfY3JlYXRlKCkgbXVzdCBiZSBjbGVhbmVkIHVwCj4gYnkgdGRhOTk4eF9jb25uZWN0b3Jf
ZGVzdHJveSgpLgo+ClRoYW5rIHlvdS4KCkkndmUganVzdCBzZW50IG91dCBhbm90aGVyIHJldmlz
aW9uIG9mIHRoZSBwYXRjaCwgd2hlcmUgcmVnaXN0cmF0aW9uCmFuZCBkZXJlZ2lzdHJhdGlvbiBp
cyBzeW1tZXRyaWMuIFBsZWFzZSB0YWtlIGEgbG9vay4KCkJlc3QgcmVnYXJkcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
