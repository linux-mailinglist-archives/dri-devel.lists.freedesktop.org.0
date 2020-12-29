Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053E2E71C1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 16:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2287D89126;
	Tue, 29 Dec 2020 15:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9E389126
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:22:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C6CD2220F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609255346;
 bh=EcbY3tBmE+XNiwSBNU+M0B9u9tbcrcx1W9ScTO00l2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pN72iZrV/xvNPE9aYrtkPkxRAjmk8J6P0ikMKuM++3r/XBlevoLkLJkIY5A0Uoaih
 bP4yR70tUaJT5C1TYeh3YjeSVT1z/BUkYSTLlnjQ/kNDOIH3e8EtWCYvC9dVUNIjXE
 AITK9OROC9mDtKWFXk1qTbznRPnz5q2QI1nzPcjwfuinP6omSIKaxKVDG4SlyWnsm7
 F9+WRBZpikYJ1wDwC41Z6MkFuJ3oXIs7nmnBdR+eqTXeIfbNIQKZtyrerILdpEpByj
 lmW+LNcFw6F8+xtMJhYHQxY+0zZmXKcgeDNMVzWZ3bWllZnnFSyra6390GHTiIeenB
 JwyJ9f7nFjcxA==
Received: by mail-wm1-f54.google.com with SMTP id y23so2509905wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 07:22:26 -0800 (PST)
X-Gm-Message-State: AOAM531+WqKWfOd4AfNaxGlJ9N6oMR3uxSwzb3gqxVHk51sQVRAv9bag
 r5O9uAWb6iuGJO050GuvBHpEvbQsTYZdeZdimA==
X-Google-Smtp-Source: ABdhPJw83mtFxW60YQI/HdgpPys5MV9pxy4kWjlMbFbA7Z1YOykYu4n+U3qMNGmaxcnU/lk60OcC5GVIqLCtncF4QkM=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr3975607wml.170.1609255345223; 
 Tue, 29 Dec 2020 07:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20201225082441.10412-1-jitao.shi@mediatek.com>
In-Reply-To: <20201225082441.10412-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 23:22:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8MFfGg_uZDZXDuhm+jO=bc8hiXx=09Nva5vyaUrVwmKQ@mail.gmail.com>
Message-ID: <CAAOTY_8MFfGg_uZDZXDuhm+jO=bc8hiXx=09Nva5vyaUrVwmKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq
 trigger type
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDEy5pyIMjXml6Ug6YCx5LqUIOS4i+WNiDQ6MzDlr6vpgZPvvJoKPgo+IFRoZSBpbnRlcnJ1cHQg
dHJpZ2dlciBpcyBhbHJlYWR5IHNldCBieSBPRi4gV2hlbiBkbyBkZXZtX3JlcXVlc3RfaXJxKCkK
PiBpbiBkcml2ZXIsIHBsZWFzZSB1c2UgSVJRRl9UUklHR0VSX05PTkUgYW5kIGRvbid0IHNwZWNp
ZnkgdHJpZ2dlciB0eXBlCj4gYWdhaW4uCj4KPiBDaGFuZ2UtSWQ6IEllNTlkN2JkOWE0NGExMzA0
MjA4OTBiMTY5Y2MyZTZmZWUzYWQ3NjMzCgpJIHJlbW92ZSBjaGFuZ2UtaWQgYW5kIGFwcGx5IHRo
aXMgcGF0Y2ggdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4
LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwo+IGluZGV4IDRhMTg4YTk0MmMzOC4uMWQ2MjQ4OTMwYmRmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTExMjgsOSArMTEyOCw4IEBAIHN0YXRpYyBp
bnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAg
ICAgICAgICBnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gICAgICAgICB9Cj4KPiAtICAgICAg
IGlycV9zZXRfc3RhdHVzX2ZsYWdzKGlycV9udW0sIElSUV9UWVBFX0xFVkVMX0xPVyk7Cj4gICAg
ICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycV9udW0sIG10a19kc2lf
aXJxLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUlFGX1RSSUdHRVJfTE9XLCBk
ZXZfbmFtZSgmcGRldi0+ZGV2KSwgZHNpKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSVJRRl9UUklHR0VSX05PTkUsIGRldl9uYW1lKCZwZGV2LT5kZXYpLCBkc2kpOwo+ICAgICAg
ICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWls
ZWQgdG8gcmVxdWVzdCBtZWRpYXRlayBkc2kgaXJxXG4iKTsKPiAgICAgICAgICAgICAgICAgZ290
byBlcnJfdW5yZWdpc3Rlcl9ob3N0Owo+IC0tCj4gMi4xMi41Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
