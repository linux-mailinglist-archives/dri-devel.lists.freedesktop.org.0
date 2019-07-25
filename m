Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFD7626D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1F76ECDC;
	Fri, 26 Jul 2019 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E14916E794
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 16:28:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E80174E;
 Thu, 25 Jul 2019 09:28:10 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126093F71A;
 Thu, 25 Jul 2019 09:28:08 -0700 (PDT)
Subject: Re: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap
 allocations
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com> <20190725161344.GA2950@kevin>
From: Steven Price <steven.price@arm.com>
Message-ID: <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
Date: Thu, 25 Jul 2019 17:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725161344.GA2950@kevin>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <Robin.Murphy@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAxNzoxMywgQWx5c3NhIFJvc2VuendlaWcgd3JvdGU6Cj4+IEVpdGhlciB3
ZSBzaG91bGQgcHJldmVudCBtYXBwaW5nIG9mIEhFQVAgb2JqZWN0cwo+IAo+IEknbSBnb29kIHdp
dGggdGhhdC4gQUZBSUssIEhFQVAgb2JqZWN0cyBzaG91bGRuJ3QgYmUgKENQVSkgbW1hcHBlZAo+
IGFueXdheSBpbiBub3JtYWwgdXNlOyBpZiB5b3UgbmVlZCB0aGVtIG1hcHBlZCAoZm9yIGRlYnVn
Z2luZyBldGMpLCBpdCdzCj4gbm8gYmlnIGRlYWwgdG8ganVzdC4uIG5vdCBzZXQgdGhlIEhFQVAg
ZmxhZyBpbiBkZWJ1ZyBidWlsZHMuCj4gCj4gT3IgZG8geW91IG1lYW4gR1BVIG1hcHBpbmc/CgpT
b3JyeSwgSSB3YXMgYmVpbmcgc2xvcHB5IGFnYWluIVsxXSBJIG1lYW50IENQVSBtbWFwcGVkLiBJ
IGFncmVlIHRoZXJlCmlzbid0IGEgc3Ryb25nIHVzZSBjYXNlIGZvciBpdC4KCkkndmUgYmVlbiBp
bnZlc3RpZ2F0aW5nL3Rlc3RpbmcgUGFuZnJvc3Qga2VybmVsIHdpdGggdGhlIEFybSBNYWxpIGJs
b2IuCkFwcGFyZW50bHkgdGhlIGJsb2IgaW4gc29tZSBjYXNlcyBjcmVhdGVzIGEgU0FNRV9WQSBH
Uk9XX09OX0dQRiBidWZmZXIgLQpzaW5jZSBTQU1FX1ZBIG1lYW5zIHBlcm1hbmVudGx5IG1hcHBl
ZCBvbiB0aGUgQ1BVIHRoaXMgdHJhbnNsYXRlZCB0bwptbWFwcGluZyBhIEhFQVAgb2JqZWN0LiBX
aHkgaXQgZG9lcyB0aGlzIEkndmUgbm8gaWRlYS4KClNvIEkndmUgZ290IGFuIGludGVyZXN0IGlu
IHRyeWluZyB0byBtYWludGFpbiBjb21wYXRpYmlsaXR5LiBrYmFzZQpwbGFjZXMgbm8gcmVzdHJp
Y3Rpb24gb24gbW1hcHBpbmcgYnVmZmVycy4gVGhlIG1haW4gdXNlIGluIHRoZSBibG9iIGZvcgp0
aGlzIGlzIGJlaW5nIGFibGUgdG8gZHVtcCBidWZmZXJzIHdoZW4gZGVidWdnaW5nIChpLmUuIGR1
bXAgYnVmZmVycwpiZWZvcmUvYWZ0ZXIgZXZlcnkgR1BVIGpvYikuIElkZWFsbHkgeW91IGFsc28g
bmVlZCBhIHdheSBvZiBxdWVyeWluZwp3aGljaCBwYWdlcyBoYXZlIGJlZW4gYmFja2VkIGJ5IGZh
dWx0cyAobXVjaCBlYXNpZXIgd2l0aCBrYmFzZSB3aGVyZQp0aGF0J3MgYWx3YXlzIGp1c3QgdGhl
IG51bWJlciBvZiBwYWdlcykuCgpTdGV2ZQoKWzFdIGtiYXNlK3RoZSBibG9iIGhhdmUgZGlmZmVy
ZW50IHRlcm1pbm9sb2d5IGhlcmUgdG8gUGFuZnJvc3QsIEkgZG8Kc29tZXRpbWVzIHN0cnVnZ2xl
IHdpdGggdGhlIGlkZWEgb2YgIm5vdCBtYXBwZWQgb24gdGhlIEdQVSIgLSBpdCdzIG5vdApyZWFs
bHkgYSBjb25jZXB0IGluIGtiYXNlLiBBbGwgYnVmZmVycyBhcmUgIm1hcHBlZCIgLSB0aGV5IGp1
c3QgbWlnaHQgYmUKImdyb3dhYmxlIiBhbmQgbm90IHlldCBmdWxsIHNpemUuLi4gOikgSGVuY2Ug
Im1hcHBlZCIgcmVmZXJzIHRvIHRoZSBDUFUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
