Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07E24C87A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFC46E19B;
	Thu, 20 Aug 2020 23:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27B6E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:23:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C36C720738
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597965822;
 bh=bdKBK2uOPKO413Z0iX2NJvBT7lzP8LgAKIxVU9ocXyw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KLLu9WjZQkSJfZ95kIb7q9gMoregri4wHkrkaYg6DER7LjANfLyLhwgW0SWwymYij
 CkNzyxCvpvzX025rioWD9TSShWnjGlBZhxQ4l0Fkt7k2FVXTDyLDNG28+PT10M1XuT
 LmwvziwbM4Jw2B/ZrqyrT2P4wviCvlpt4PenfN0c=
Received: by mail-ed1-f54.google.com with SMTP id ba10so2989992edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:23:41 -0700 (PDT)
X-Gm-Message-State: AOAM5309lNDmkYB9xiqql5oY/ugSUEnhP+EZdczd+FMR13CENtBv3KJp
 hhH7iY9NQe7X60DtIzy4q0L0JCCadtccyqLxUQ==
X-Google-Smtp-Source: ABdhPJxdccf74kgFcrZ/UdWvxCfzmoCcixKQh8r0jcPn1sNOj1J2tB6qrHBNGNgYsoCMJ/EVSE/dUxdjnOVE9JgYNwQ=
X-Received: by 2002:a50:d9c6:: with SMTP id x6mr126778edj.271.1597965820452;
 Thu, 20 Aug 2020 16:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200819025829.57545-1-wanghai38@huawei.com>
In-Reply-To: <20200819025829.57545-1-wanghai38@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:23:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
Message-ID: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: remove duplicate include
To: Wang Hai <wanghai38@huawei.com>
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

SGksIFdhbmcgSGFpOgoKV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPiDmlrwgMjAyMOW5
tDjmnIgxOeaXpSDpgLHkuIkg5LiK5Y2IMTE6MDDlr6vpgZPvvJoKPgo+IFJlbW92ZSBtdGtfZHJt
X2RkcC5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlCj4KClJldmlld2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4gUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSGFpIDx3
YW5naGFpMzhAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggMDQwYThmMzkzZmUyLi5h
MzRmZDgwNWNlNmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+
IEBAIC0yNyw3ICsyNyw2IEBACj4KPiAgI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+ICAjaW5j
bHVkZSAibXRrX2RybV9kZHAuaCIKPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwLmgiCj4gICNpbmNs
dWRlICJtdGtfZHJtX2RkcF9jb21wLmgiCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIgo+ICAj
aW5jbHVkZSAibXRrX2RybV9nZW0uaCIKPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
