Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A8113752
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 22:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AD96E960;
	Wed,  4 Dec 2019 21:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5D6E960
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 21:58:12 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c14so1033430wrn.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 13:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIOYqKmmmpvYBf3JvRvJwW76NwBUzC3d92a7ZQ9APOc=;
 b=nWA8ZFNLrzTbnM5PPx5UjievBSPtzrZK97PZDebg+GZMQgunmPIMDG8++uhVAnwngr
 jBYnkXI8/ABBCwLHykkTG04roBbHukvB/8P+zutlOV3sFL/Nr+4KKGdm6z5aZHNHRMnN
 hXyu4hLUJG67VkJoAjxkIwso0xYq9iqb+xotegWDZaeQJsNwo2afcAxksO9J5s2iVUjC
 7L1FFJd7fZlYADMJUyIT5VAQHpkwZx2OyLBzgb2H1SesjinoBxdabZMTP+UUI8+UU+LH
 aMViV/FsnhgmoBvvAUWSYs76S8u7GEdTgDG3zGE/M6+9CF3eJupYBwTDzWtxie80TyCc
 wzRw==
X-Gm-Message-State: APjAAAU3EjU24kzIWArEX3JRlabiMzvQHO/SjWguMU02Y4Uqv3uwNHOS
 xR4gJ1CLxL+EzO4D94HuLj/VDjTls63oYnE7BrM=
X-Google-Smtp-Source: APXvYqz34tHD22JxN7p2KuRnBVNDtkFtDP+Bu7c/rRmS0sUMVBdKkzgud+fUiVEBi/ytgoRY/psrGk4bpGfX3XNxdM0=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6651016wrq.206.1575496691523; 
 Wed, 04 Dec 2019 13:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Dec 2019 16:57:59 -0500
Message-ID: <CADnq5_O8V7N9jV1ZDCuL3WWCW2CwNSjXnx70Z1fDQpm9ObBWwA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hIOYqKmmmpvYBf3JvRvJwW76NwBUzC3d92a7ZQ9APOc=;
 b=DjbgCmOZGCpbB1cVT/DWIysPtavfNH7OPlRt9M1OK0t7lYlqzl9B/SanQzAd9xvedV
 JAIh6f1/TeSiY9N0ECD5BqwGm7EXnJ6W/o7O0XvH0u/ruih0hWw4HEiU7TBfsy+zK0Og
 hzEnu9N8QQNwlyqEP26IoCuiiKF6mPcYu03nwMNDVKOm17XY3KzpBTrvQJVsxbRCrnTu
 Yd0guLnCm7HNXBd8X+0iKTX5DOIBQcoX/NBaxtYBeGG9AUV8uGjswsQNx5B/HhV/rbkb
 be+GIrzT24KwOhNbWhKDY7BgSCQc3TNTegqAN/lq3S1otn1zKfwW7xcCRhlca9Yn13lU
 yCdA==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgNCwgMjAxOSBhdCA0OjUxIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gSSd2ZSBzcGVudCBhIGJpdCB0b28gbXVjaCB0aW1lIHJl
dmlld2luZyBhbGwga2luZHMgb2YgdXNlcnMgYWxsIG92ZXIKPiB0aGUga2VybmVsIGZvciB0aGlz
IGJ1ZmZlciBzaGFyaW5nIGluZnJhc3RydWN0dXJlLiBBbmQgc29tZSBvZiBpdCBpcwo+IGF0IGxl
YXN0IHF1ZXN0aW9uYWJsZS4KPgo+IE1ha2Ugc3VyZSB3ZSBhdCBsZWFzdCBzZWUgd2hlbiB0aGlz
IHN0dWZmIGZsaWVzIGJ5Lgo+Cj4gQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzog
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiBDYzog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwoKQWNrZWQtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCj4gLS0tCj4gIE1BSU5UQUlORVJT
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCAzNzVkYmVhOGJjODguLmMxZTNkYTJj
MTk0NyAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTQ5NDEsNiArNDk0MSw3IEBAIEY6ICAgICAgICBpbmNsdWRlL2xpbnV4L2RtYS1idWYqCj4gIEY6
ICAgICBpbmNsdWRlL2xpbnV4L3Jlc2VydmF0aW9uLmgKPiAgRjogICAgIGluY2x1ZGUvbGludXgv
KmZlbmNlLmgKPiAgRjogICAgIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+
ICtLOiAgICAgZG1hXyhidWZ8ZmVuY2V8cmVzdikKPiAgVDogICAgIGdpdCBnaXQ6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MKPgo+ICBETUEgR0VORVJJQyBPRkZMT0FEIEVO
R0lORSBTVUJTWVNURU0KPiAtLQo+IDIuMjQuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
