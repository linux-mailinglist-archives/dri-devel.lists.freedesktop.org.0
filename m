Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38911D7CC3
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 17:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585F589B70;
	Mon, 18 May 2020 15:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B04F89B70
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:23:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B6F4207E8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589815404;
 bh=yxtbYhqiBpX0vaCKJ8nincWDlOttWPQGQYeL0KqTH88=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rejD3Cq3JkMBTzUozSEQ/NMDN4wNabDl16h10hnxRO/FeHWgmHuBR1gpptZvSLEmk
 MerhXjFPxqumyVcS4pDPVo779TNtQyQiVWYUsMSyf/WgUSilWfXZfG2UVY6cyEzsRH
 qEihdwS5ax4XJoPtGyu0LU44g3M2x4HNHH/cZuEo=
Received: by mail-ej1-f45.google.com with SMTP id e2so9091341eje.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:23:24 -0700 (PDT)
X-Gm-Message-State: AOAM531a/DIkNuggHjVihd0SEysKWHRQNbEf8CBb9hAPKHDfUVTRW1W7
 daKBuOTZyIAIugP7dokgeLGRiZ+VMUBm2KY56Q==
X-Google-Smtp-Source: ABdhPJx1xmRv1Gbqt6X2HaH4typf9wcXv81hsB28v44g5GQNU5bFmryX50AtKCXktDvePVh8ZZJSpwAS+KTHOyiTrIE=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr10734314ejx.360.1589815402680; 
 Mon, 18 May 2020 08:23:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200518112254.23692-1-matthias.bgg@kernel.org>
In-Reply-To: <20200518112254.23692-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2020 23:23:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-kBsnBk3RRUb_ks96c1Cf6hJ+SeSE4T52Djoqjzxk3jA@mail.gmail.com>
Message-ID: <CAAOTY_-kBsnBk3RRUb_ks96c1Cf6hJ+SeSE4T52Djoqjzxk3jA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
To: matthias.bgg@kernel.org
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzoyM+Wvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBkcml2ZXIgd2lsbCBiZSBsb2FkZWQg
YnkgdmlhIGEgcGxhdGZvcm0gZGV2aWNlLiBTbyB3ZQo+IHdpbGwgbmVlZCB0byBnZXQgdGhlIGRl
dmljZV9ub2RlIGZyb20gdGhlIHBhcmVudCBkZXZpY2UuCj4gRGVwZW5kaW5nIG9uIHRoaXMgd2Ug
d2lsbCBzZXQgdGhlIGRyaXZlciBkYXRhLgo+IEFzIGFsbCB0aGlzIGlzIGRvbmUgbGF0ZXIgYWxy
ZWFkeSwganVzdCBkZWxldGUgdGhlIGNhbGwgdG8KPiBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEu
Cj4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCj4gaW5kZXggZTJiYjBkMTllZjk5Li42M2VjOTJiYTBlOTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00NDcsNyArNDQ3LDYg
QEAgc3RhdGljIGludCBtdGtfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAgICAgICBpZiAoIXByaXZhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+Cj4gLSAgICAgICBwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7Cj4gICAgICAgICBwcml2YXRlLT5tbXN5c19kZXYgPSBkZXYtPnBhcmVudDsKPiAgICAgICAg
IGlmICghcHJpdmF0ZS0+bW1zeXNfZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGdldCBNTVNZUyBkZXZpY2VcbiIpOwo+IC0tCj4gMi4yNi4yCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
