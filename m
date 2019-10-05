Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA5CDC05
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D474B6E45D;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF426E3D6;
 Sat,  5 Oct 2019 18:10:27 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGoVb-0003D7-Nf; Sat, 05 Oct 2019 18:10:23 +0000
Subject: Re: [PATCH] drm/amdkfd: add missing void argument to function
 kgd2kfd_init
To: Colin King <colin.king@canonical.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20191005175808.32018-1-colin.king@canonical.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7677a8bc-cc5a-eb03-c7d4-b1a27330126f@infradead.org>
Date: Sat, 5 Oct 2019 11:10:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191005175808.32018-1-colin.king@canonical.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iECkkIlT8M1PJMXLE502uRX54JzfnDVnuF93zxzrqHo=; b=VfqqIhLrX4wkAqqvMmh9WatRA
 sAYUsIqVxNfEvTdRNWh7xAvKnD/APEQy6P1XVhV2Y2uoJaZEfhUiHrHf6OLGYvVbQ+R2lzgDJnjRr
 fkm/w7JEF7+Z0gdlkpYcsFL48YJiyAPIOAmOCsmgM+3dgevcgau/qyx8XEPA5qeTSUjZhDGmxNPUJ
 oIPyAKADYjjHEWf/LBuzjCpfL3RwwK2noOhzIq07OrarTtKIzCU1Y0VYCBB88Zu4h5T3NwdI8yUVW
 aaGjNK1jfRm5l6AJD3+wj3bHSjc15WpK1+ttFiRN6NjeHTgVMSFtAmTXg4pP2OP78E3+PUVAUsTqa
 AyyT4yCng==;
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNS8xOSAxMDo1OCBBTSwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+IAo+IEZ1bmN0aW9uIGtnZDJrZmRfaW5p
dCBpcyBtaXNzaW5nIGEgdm9pZCBhcmd1bWVudCwgYWRkIGl0Cj4gdG8gY2xlYW4gdXAgdGhlIG5v
bi1BTlNJIGZ1bmN0aW9uIGRlY2xhcmF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpBY2tlZC1ieTogUmFuZHkgRHVubGFw
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CgpzcGFyc2UgcmVwb3J0cyAyIHN1Y2ggd2FybmluZ3Mg
aW4gYW1kZ3B1OgoKLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9t
b2R1bGUuYzo4NToxODogd2FybmluZzogbm9uLUFOU0kgZnVuY3Rpb24gZGVjbGFyYXRpb24gb2Yg
ZnVuY3Rpb24gJ2tnZDJrZmRfaW5pdCcKLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9nZnhfdjEwLmM6MTY4OjYwOiB3YXJuaW5nOiBub24tQU5TSSBmdW5jdGlvbiBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnYW1kZ3B1X2FtZGtmZF9nZnhfMTBfMF9nZXRfZnVuY3Rp
b25zJwoKVGhhbmtzLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21v
ZHVsZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21v
ZHVsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jCj4gaW5kZXgg
OTg2ZmY1MmQ1NzUwLi5mNGI3ZjdlNmM0MGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX21vZHVsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX21vZHVsZS5jCj4gQEAgLTgyLDcgKzgyLDcgQEAgc3RhdGljIHZvaWQga2ZkX2V4aXQo
dm9pZCkKPiAgCWtmZF9jaGFyZGV2X2V4aXQoKTsKPiAgfQo+ICAKPiAtaW50IGtnZDJrZmRfaW5p
dCgpCj4gK2ludCBrZ2Qya2ZkX2luaXQodm9pZCkKPiAgewo+ICAJcmV0dXJuIGtmZF9pbml0KCk7
Cj4gIH0KPiAKCgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
