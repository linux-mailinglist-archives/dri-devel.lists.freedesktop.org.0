Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF032AEC50
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 09:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7F989F53;
	Wed, 11 Nov 2020 08:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B916089F31;
 Wed, 11 Nov 2020 08:51:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A83AAC75;
 Wed, 11 Nov 2020 08:51:08 +0000 (UTC)
Subject: Re: [PATCH 0/5] add KERN_LEVEL to printk
To: Bernard Zhao <bernard@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jcrouse@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Brian Masney <masneyb@onstation.org>, Shawn Guo <shawn.guo@linaro.org>,
 Eric Anholt <eric@anholt.net>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>, Jonathan Marek
 <jonathan@marek.ca>, Dave Airlie <airlied@redhat.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201111083131.39817-1-bernard@vivo.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f704e453-944e-2da8-4f0c-3c9a5c370691@suse.de>
Date: Wed, 11 Nov 2020 09:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111083131.39817-1-bernard@vivo.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDExLjExLjIwIHVtIDA5OjMxIHNjaHJpZWIgQmVybmFyZCBaaGFvOgo+IEhpOgo+IAo+
IFdoZW4gY2FsbCBwcmludGssIHNldCB0aGUgS0VSTl9MRVZFTCBpcyBzdWdnZXN0ZWQgYnkgdGhl
IGNvbW11bml0eS4KPiBUaGlzIHBhdGNoIHNlcmVpZXMgYWRkIEtFUk5fKiBsZXZlbCB0byBwcmlu
dGsgd2hpY2ggZG8gbm90IHNldAo+IHRoaXMgbGV2ZWwuCgpJIGhhdmUgbm8gc2F5IG9uIHRoZSBt
c20gZHJpdmVyLCBidXQgSU1ITyBhIG11Y2ggYmV0dGVyIGNoYW5nZSB3b3VsZCBiZQphIGNvbnZl
cnNpb24gdG8gZHJtX2RiZygpLCBkcm1fZXJyKCksIGV0Yy4KCkJlc3QgcmVnYXJkcwpUaG9tYXMK
Cj4gCj4gQmVybmFyZCBaaGFvICg1KToKPiAgIGFkcmVuby9hMnh4X2dwdS5jOiBhZGQgS0VSTl9M
RVZFTCB0byBwcmludGsKPiAgIGFkcmVuby9hM3h4X2dwdS5jOiBhZGQgS0VSTl9MRVZFTCB0byBw
cmludGsKPiAgIGFkcmVuby9hNHh4X2dwdS5jOiBhZGQgS0VSTl9MRVZFTCB0byBwcmludGsKPiAg
IGFkcmVuby9hNXh4X2dwdS5jOiBhZGQgS0VSTl9MRVZFTCB0byBwcmludGsKPiAgIGFkcmVuby9h
ZHJlbm9fZ3B1LmM6IGFkZCBLRVJOX0xFVkVMIHRvIHByaW50awo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hMnh4X2dwdS5jICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2EzeHhfZ3B1LmMgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTR4eF9ncHUuYyAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRy
ZW5vL2E1eHhfZ3B1LmMgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2Fk
cmVub19ncHUuYyB8IDEyICsrKysrKy0tLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
