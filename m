Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9682AE187
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7389CAF;
	Tue, 10 Nov 2020 21:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8194889CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:21:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z21so110174lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+1qiY4oDPj4QZfL6qghq1haCSVhCeVDAqKZGD+qkbx8=;
 b=f1Wqn9BWhlV9TqBzVqcA8K3vSYZ8z/sDMTRNOMC7AqV4HUbCE2abDcOdUls8wIHqNy
 eQrYCCd2SFjle35FbcRiiYTm0Y1PP2B3U0AlJVSEXUjrhyg+vceiwUomjjZYyUbQM3nw
 7LIppNWnObnIw+GgAZoRFZ6qxX28Xw5dsd12B+qDqsHpebCW0cp9V5JBqmOqD0mBBKb7
 8UD7HXinQ7T+n5ZiH9KoG4qeWUQxH3W+uHefFVhjxqQ0JD6Wj1aBXXk0ZdvRA/uNHfeA
 d76iPm6NrzDUyRavySFTn770WrvScPbvWQhsD+KcCTZX8j0eF/OWeO5drdQMhEnmV4U1
 IMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+1qiY4oDPj4QZfL6qghq1haCSVhCeVDAqKZGD+qkbx8=;
 b=NJ8Ql91lxhBOXuh/j62wqzRHgU5N8u4HYqpWUh+uGgF22xHmFZTz8m4EbUePkBsA9S
 dyD9nyM3omKhgFQ6jKQVXp3qRQ01PUv42ffyCRnu6UKGy22oOw1sAmEUhRXCS4W5vT2E
 0qIQPhtPaeNK7A4+R38tWbqce+AkD9MupqeoF6eJgdpzG0ZeKKJu6Il7XH9AB63zkYHQ
 T0YWgxb68WlLO5jhdaxw4aNt7Xv4DPz/8mj2mh6+VuUthO3yMy3Nc7QBj09h60Ht9UGz
 YY9TKU+UlKoPPLCCED5lz0Nvju6CPP/Gt1r4nubK8vIZTEuim17Bg4cw9FdVa754V2Kl
 eVJw==
X-Gm-Message-State: AOAM530HW3o2xA2OtY9NieMHFzCvKlIgrFe8Zn+ITOsLAhcNW4h8UD5e
 a0lauTxgZZCUosaeziP7ki5Bx8jcmudU59/RfGE4pQqG
X-Google-Smtp-Source: ABdhPJwSPi/XzPxpWkWfc667bn3+KfiQNfQ/1d5NUGazQbQobwLyMKIUuc+OEeitOW6AtDYIuvFhcWe6S0QSmLXW+0I=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27585519wrn.124.1605042776045; 
 Tue, 10 Nov 2020 13:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-7-lee.jones@linaro.org>
In-Reply-To: <20201105144517.1826692-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 16:12:44 -0500
Message-ID: <CADnq5_Nv_5dbeeBfWN_Kfzt5ZJUDQR9icH_QL10o5v6AW=9qVw@mail.gmail.com>
Subject: Re: [PATCH 06/19] gpu: drm: scheduler: sched_main: Provide missing
 description for 'sched' paramter
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNSwgMjAyMCBhdCA5OjUyIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6NzQ6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3NjaGVkJyBub3QgZGVzY3Jp
YmVkIGluICdkcm1fc2NoZWRfcnFfaW5pdCcKPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3Vt
aXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Ywo+IGluZGV4IDlhMGQ3N2E2ODAxODAuLmRhMjRjNGU4YjlmYjMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IEBAIC02NSw2ICs2NSw3IEBAIHN0YXRpYyB2b2lk
IGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2Zl
bmNlX2NiICpjYik7Cj4gIC8qKgo+ICAgKiBkcm1fc2NoZWRfcnFfaW5pdCAtIGluaXRpYWxpemUg
YSBnaXZlbiBydW4gcXVldWUgc3RydWN0Cj4gICAqCj4gKyAqIEBzY2hlZDogc2NoZWR1bGVyIGlu
c3RhbmNlIHRvIGFzc29jaWF0ZSB3aXRoIHRoaXMgcnVuIHF1ZXVlCj4gICAqIEBycTogc2NoZWR1
bGVyIHJ1biBxdWV1ZQo+ICAgKgo+ICAgKiBJbml0aWFsaXplcyBhIHNjaGVkdWxlciBydW5xdWV1
ZS4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
