Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8618B085
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21526E9CA;
	Thu, 19 Mar 2020 09:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FCD6E9CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 09:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2CD0D2934CB
Subject: Re: [PATCHv7 6/6] drm/rockchip: Add support for afbc
To: Sandy Huang <hjc@rock-chips.com>, Emil Velikov
 <emil.l.velikov@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-7-andrzej.p@collabora.com>
 <CACvgo51t=o2g8SENzqd+2EKbTgE++z5sna8ZFGRrCKfMW2bjyw@mail.gmail.com>
 <3d4f027e-8de3-ba7c-5654-31eda66a7681@rock-chips.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <d422f838-2c93-b356-c74d-d7da80000f8d@collabora.com>
Date: Thu, 19 Mar 2020 10:54:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3d4f027e-8de3-ba7c-5654-31eda66a7681@rock-chips.com>
Content-Language: en-US
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FuZHksCgoKVyBkbml1IDE5LjAzLjIwMjAgb8KgMDM6NTcsIFNhbmR5IEh1YW5nIHBpc3pl
Ogo+IEhpIEVtaWwsCj4gCgo8c25pcD4KCj4+PiAtLSAKPj4+IDIuMTcuMQo+PiBIZWlrbywgU2Fu
ZHksIGJlaW5nIHRoZSBtYWludGFpbmVycyBvZiB0aGUgUm9ja2NoaXAgZHJpdmVyLCBjYW4geW91
Cj4+IHJldmlldy9hY2sgdGhpcyBwYXRjaD8KPj4KPj4gSSBiZWxpZXZlIHRoZSBpbnRlbnRpb24g
aXMgdG8gbWVyZ2UgdGhlIHNlcmllcyB2aWEgZHJtLW1pc2MuIEFuZHJ6ZWoKPj4gYWxyZWFkeSBo
YXMgY29tbWl0IGFjY2Vzcy4KPj4KPj4gLUVtaWwKPj4KPj4KPiBUaGFua3MgZm9yIHlvdSBwYXRj
aCwgbWF5YmUgd2UgbmVlZCB0byBjb25zaWRlciB0aGUgY29tcGF0aWJpbGl0eSB3aXRoIHB4MzAg
Cj4gcGxhdGZvcm0gYWZiYyBmZWF0dXJlcyx0aGUgbWFpbiBkaWZmZXJlbmNlIGlzOgo+IAo+IDEu
wqAgcHgzMCBzdXBwb3J0IHggb2Zmc2V0IGFuZCB5IG9mZnNldCBkaXNwbGF5LCBhbmQgdGhlIHN0
YXRlLT5zcmMueDEgLyAKPiBzdGF0ZS0+c3JjLnkxwqAgc2hvdWxkIGJlIGFsaWJlZ25lZCBhcyAx
NnBpeGVsL2xpbmU7Cj4gCj4gMi5weDMwIG9ubHkgd2luMSBjYW4gc3VwcG9ydCBhZmJkYyBmb3Jt
YXQ7Cj4gCj4gCgpBY3R1YWxseSBJIHNlbnQgdGhlIHBhdGNoLCBFbWlsIGtpbmRseSBmb3J3YXJk
ZWQgaXQgdG8geW91LgoKVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgcHgzMCBoYXJkd2FyZSwg
c28gSSBjYW4ndCB0ZXN0LiBDYW4gd2UKbWVyZ2UgdGhlIHBhdGNoIGFzIGlzIChpZiB5b3UgYXJl
IG9rIHdpdGggdGhlIHdheSBpdCBpcyBub3cpIGFuZCB0aGVuCkkgd2lsbCBoZWxwIHJldmlld2lu
ZyB0aGUgcGF0Y2ggYWRkaW5nIHB4MzAgc3VwcG9ydCBvbiB0b3Agb2YgaXQ/CgpSZWdhcmRzLAoK
QW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
