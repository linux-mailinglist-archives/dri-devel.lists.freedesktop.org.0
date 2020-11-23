Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9512C0D85
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9117089EB1;
	Mon, 23 Nov 2020 14:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2063789EB1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:32:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E3C720781
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141930;
 bh=ftNKqa+bYDhqF4CMFphNHzMCzHAOisKpwk67ZYS6ZgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z33v22hdW4YxiwW6UEgw0GvvELco7HO5D74BE8TiqvAF2YrPjUDKYmmLTSTjzEXzQ
 v6Qi2fTyU9w/KjIUEQPP7wzuYXaF7LpZ++7dBhNBNaz6XK+BswUidtVXm9Oslh+sSJ
 xFTJAgH+Rq7jFYAWobff4/qdOjMk7bGHLg9i3vfg=
Received: by mail-ed1-f47.google.com with SMTP id m16so17325735edr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:32:10 -0800 (PST)
X-Gm-Message-State: AOAM531ChaXCfLZ+7qjcvdpvmK7rKt6XVbnOEwYXjfhhSBQshca1SFR8
 AaX6l1jujjqJRSy9R1QFOSZ49pD/YtaVr5wvBw==
X-Google-Smtp-Source: ABdhPJyS2K7No/Iy7mVbNPsYoEYSje2gRGMO/P9wTkTu5AgIlPqa/VzyGgZFr00oj+Lye5y2SIpkBeoCVwE63Mb7TOk=
X-Received: by 2002:a50:f742:: with SMTP id j2mr39321499edn.72.1606141928430; 
 Mon, 23 Nov 2020 06:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-29-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-29-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:31:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Q39YMUGLtrBi0p+kedU5xSHv0dUKz2NA3ajR17Fe-4A@mail.gmail.com>
Message-ID: <CAAOTY__Q39YMUGLtrBi0p+kedU5xSHv0dUKz2NA3ajR17Fe-4A@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/mediatek/mtk_disp_color: Fix formatting and
 provide missing member description
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiK5Y2IMzowMeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2NvbG9yLmM6NDA6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2RkcF9jb21wJyBub3QgZGVzY3JpYmVkIGluICdtdGtfZGlzcF9jb2xvcicKPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmM6NDA6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNw
X2NvbG9yJwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYzo0MDog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGF0YScgbm90IGRlc2NyaWJl
ZCBpbiAnbXRrX2Rpc3BfY29sb3InCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFd
LCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3Iu
YyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
Y29sb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jCj4gaW5k
ZXggM2FlOWM4MTA4NDViYi4uYTc4OGZmOTVlZDZlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jCj4gQEAgLTMwLDggKzMwLDkgQEAgc3RydWN0IG10a19k
aXNwX2NvbG9yX2RhdGEgewo+Cj4gIC8qKgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3IgLSBE
SVNQX0NPTE9SIGRyaXZlciBzdHJ1Y3R1cmUKPiAtICogQGRkcF9jb21wIC0gc3RydWN0dXJlIGNv
bnRhaW5pbmcgdHlwZSBlbnVtIGFuZCBoYXJkd2FyZSByZXNvdXJjZXMKPiAtICogQGNydGMgLSBh
c3NvY2lhdGVkIGNydGMgdG8gcmVwb3J0IGlycSBldmVudHMgdG8KPiArICogQGRkcF9jb21wOiBz
dHJ1Y3R1cmUgY29udGFpbmluZyB0eXBlIGVudW0gYW5kIGhhcmR3YXJlIHJlc291cmNlcwo+ICsg
KiBAY3J0YzogYXNzb2NpYXRlZCBjcnRjIHRvIHJlcG9ydCBpcnEgZXZlbnRzIHRvCj4gKyAqIEBk
YXRhOiBwbGF0Zm9ybSBjb2xvdXIgZHJpdmVyIGRhdGEKPiAgICovCj4gIHN0cnVjdCBtdGtfZGlz
cF9jb2xvciB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wICAgICAgICAgICAgICAgICAg
ICAgZGRwX2NvbXA7Cj4gLS0KPiAyLjI1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
