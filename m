Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C72C0D78
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2F89EB1;
	Mon, 23 Nov 2020 14:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613489EB1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:29:59 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D74EF208FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141799;
 bh=0PG9sY/7kjLC2BEUJJD7uXQqxRjzgGOvNgsyi7FCsBU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hbbz43XKlcQvVplsZFIcT5hsKkYI9fWwgORdTxxV+osw6Lxxzw5u+ktlCJ8wjrK2/
 Z5zSxlmHaMmWfbqFe+HZSIXBuGT6FUYg6EYpEmx2ut11nzTVKI1ETPw6z/uCleGzLo
 zyZk80qz1TpskOwQ8hsOulxq6GA8K//3cFqNdlWw=
Received: by mail-ed1-f43.google.com with SMTP id y4so17290381edy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:29:58 -0800 (PST)
X-Gm-Message-State: AOAM530rbpGyqR608HEMIrpi7Be5s5bi2athRTV6vWX02BuQ0JofPyaU
 2Ka1vecBRyZ5sgMR45yAF3KryAv0RLUh+ZvxTg==
X-Google-Smtp-Source: ABdhPJwHSc8rFuh9ehjBm9YKuZooHOGW+0h0xXZqHkKhXMPDEqgmgVdpEM6Eg0UZfQjSb1pTx0AQWx+IJMvN12Wrf+Q=
X-Received: by 2002:a50:f1d2:: with SMTP id y18mr13451389edl.166.1606141797356; 
 Mon, 23 Nov 2020 06:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-31-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-31-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:29:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-hTb_yur9QVynKggdY69-E2vJ2-qj3i7+LPzsBJkdy1g@mail.gmail.com>
Message-ID: <CAAOTY_-hTb_yur9QVynKggdY69-E2vJ2-qj3i7+LPzsBJkdy1g@mail.gmail.com>
Subject: Re: [PATCH 30/30] drm/mediatek/mtk_disp_ovl: Fix formatting and
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
dGVrL210a19kaXNwX292bC5jOjc1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVt
YmVyICdkZHBfY29tcCcgbm90IGRlc2NyaWJlZCBpbiAnbXRrX2Rpc3Bfb3ZsJwo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmM6NzU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX292bCcK
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jOjc1OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkYXRhJyBub3QgZGVzY3JpYmVkIGluICdtdGtf
ZGlzcF9vdmwnCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFu
Zy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBD
YzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA1ICsrKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gaW5kZXggMjg2NTFiYzU3OWJjOS4u
NzRlZjZmYzA1MjhiNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMKPiBAQCAtNjUsOCArNjUsOSBAQCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgewo+Cj4gIC8q
Kgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsIC0gRElTUF9PVkwgZHJpdmVyIHN0cnVjdHVyZQo+
IC0gKiBAZGRwX2NvbXAgLSBzdHJ1Y3R1cmUgY29udGFpbmluZyB0eXBlIGVudW0gYW5kIGhhcmR3
YXJlIHJlc291cmNlcwo+IC0gKiBAY3J0YyAtIGFzc29jaWF0ZWQgY3J0YyB0byByZXBvcnQgdmJs
YW5rIGV2ZW50cyB0bwo+ICsgKiBAZGRwX2NvbXA6IHN0cnVjdHVyZSBjb250YWluaW5nIHR5cGUg
ZW51bSBhbmQgaGFyZHdhcmUgcmVzb3VyY2VzCj4gKyAqIEBjcnRjOiBhc3NvY2lhdGVkIGNydGMg
dG8gcmVwb3J0IHZibGFuayBldmVudHMgdG8KPiArICogQGRhdGE6IHBsYXRmb3JtIGRhdGEKPiAg
ICovCj4gIHN0cnVjdCBtdGtfZGlzcF9vdmwgewo+ICAgICAgICAgc3RydWN0IG10a19kZHBfY29t
cCAgICAgICAgICAgICBkZHBfY29tcDsKPiAtLQo+IDIuMjUuMQo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
