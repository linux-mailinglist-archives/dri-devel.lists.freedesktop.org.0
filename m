Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7256318
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB886E2A6;
	Wed, 26 Jun 2019 07:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125696E2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:20:28 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E83478032F;
 Wed, 26 Jun 2019 09:20:22 +0200 (CEST)
Date: Wed, 26 Jun 2019 09:20:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 2/4] drm/panel: support for BOE tv101wum-nl6 wuxga dsi video
 mode panel
Message-ID: <20190626072021.GA14541@ravnborg.org>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
 <20190626025400.109567-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626025400.109567-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=9UlFsKL00uGSb65IiHYA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSml0YW8uCgpEcml2ZXIgbG9va3MgZ29vZCwgb25lIGRldGFpbC4KCj4gKwo+ICtzdHJ1Y3Qg
cGFuZWxfZGVzYyB7Cj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZXM7Cj4g
Kwl1bnNpZ25lZCBpbnQgYnBjOwo+ICsKPiArCS8qKgo+ICsJICogQHdpZHRoOiB3aWR0aCAoaW4g
bWlsbGltZXRlcnMpIG9mIHRoZSBwYW5lbCdzIGFjdGl2ZSBkaXNwbGF5IGFyZWEKPiArCSAqIEBo
ZWlnaHQ6IGhlaWdodCAoaW4gbWlsbGltZXRlcnMpIG9mIHRoZSBwYW5lbCdzIGFjdGl2ZSBkaXNw
bGF5IGFyZWEKPiArCSAqLwo+ICsJc3RydWN0IHsKPiArCQl1bnNpZ25lZCBpbnQgd2lkdGg7Cj4g
KwkJdW5zaWduZWQgaW50IGhlaWdodDsKPiArCX0gc2l6ZTsKTWF5YmUgbmFtZSB0aGVzZSB3aWR0
aF9tbSBhbmQgaGVpZ2h0X21tLgpUaGVuIHRoZXkgaGF2ZSB0aGUgc2FtZSBuYW1lIGFzIHdoZXJl
IHRoZXkgYXJlIGNvcGllZCB0bywKYW5kIGl0IGlzIGV4cGxpY2l0IGRvY3VtZW50ZWQgdGhhdCBp
dCBpcyBpbiBtbS4KClRoZSBleHRyYSBpbmRpcmVjdGlvbiB3aXRoIGEgc3RydWN0IGlzIG5vdCBu
ZWVkZWQgaW4gZGlzcGxheV9tb2RlLAptYXliZSBkcm9wIGl0IGhlcmUgdG9vPwo+ICsKPiArCXVu
c2lnbmVkIGxvbmcgbW9kZV9mbGFnczsKPiArCWVudW0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0IGZv
cm1hdDsKPiArCWNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCAqaW5pdF9jbWRzOwo+ICsJdW5z
aWduZWQgaW50IGxhbmVzOwo+ICt9Owo+ICsKLi4uCj4gK3N0YXRpYyBpbnQgYm9lX3BhbmVsX3Vu
cHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKPiArewo+ICsJc3RydWN0IGJvZV9wYW5l
bCAqYm9lID0gdG9fYm9lX3BhbmVsKHBhbmVsKTsKPiArCWludCByZXQ7Cj4gKwo+ICsJaWYgKCFi
b2UtPnByZXBhcmVkKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCXJldCA9IGJvZV9wYW5lbF9vZmYo
Ym9lKTsKPiArCWlmIChyZXQgPCAwKSB7Cj4gKwkJZGV2X2VycihwYW5lbC0+ZGV2LCAiZmFpbGVk
IHRvIHNldCBwYW5lbCBvZmY6ICVkXG4iLCByZXQpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4g
Kwo+ICsJbXNsZWVwKDE1MCk7Cj4gKwlpZiAoYm9lLT5lbmFibGVfZ3BpbykKPiArCQlncGlvZF9z
ZXRfdmFsdWUoYm9lLT5lbmFibGVfZ3BpbywgMCk7CkV2ZXJ5d2hlcmUgYm9lLT5lbmFibGVfZ3Bp
byBpcyB1c2VkIGl0IGlzIGNoZWNrZWQgbGlrZSBhYm92ZS4KQm90IGJvZS0+ZW5hYmxlX2dwaW8g
aW4gYSBtYW5kYXRvcnkgcHJvcGVydHkgc28gaXQgbXVzdCBiZSBwcmVzZW50LgpUaGUgZHJpdmVy
IGVycm9yIG91dCBpbiBwcm9iZSBpZiBub3QgcHJlc2VudCwgc28gdGhpcyBjaGVjayBzZWVtcwpy
ZWR1bmRhbmR0PwoKRXZlcnl0aGluZyBlbHNlIGxvb2tzIHJlYWxseSBnb29kLgoKV2l0aCB0aGUg
YWJvdmUgZml4ZWQgLyBjb25zaWRlcmVkOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
