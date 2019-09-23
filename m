Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE80BB554
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F796E90D;
	Mon, 23 Sep 2019 13:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1FDC6E90D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:32:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BB31000;
 Mon, 23 Sep 2019 06:32:57 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5409F3F694;
 Mon, 23 Sep 2019 06:32:56 -0700 (PDT)
Subject: Re: [PATCH v2 04/11] drm/shmem: drop VM_IO
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190917092404.9982-1-kraxel@redhat.com>
 <20190917092404.9982-5-kraxel@redhat.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <fc529a6d-5ece-72d5-f9ca-3d403585a476@arm.com>
Date: Mon, 23 Sep 2019 14:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917092404.9982-5-kraxel@redhat.com>
Content-Language: en-GB
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDkvMjAxOSAxMDoyMywgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiBWTV9JTyBpcyB3cm9u
ZyBoZXJlLCBzaG1lbSB1c2VzIG5vcm1hbCByYW0gbm90IGlvIG1lbW9yeS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBT
dGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jCj4gaW5kZXggNmVmZWRhYjE1MDE2Li4zYmM2OWIxZmZhN2QgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+IEBAIC01MzYsNyArNTM2LDcgQEAgaW50
IGRybV9nZW1fc2htZW1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpCj4gIAkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gLQl2bWEtPnZt
X2ZsYWdzIHw9IFZNX0lPIHwgVk1fTUlYRURNQVAgfCBWTV9ET05URVhQQU5EOwo+ICsJdm1hLT52
bV9mbGFncyB8PSBWTV9NSVhFRE1BUCB8IFZNX0RPTlRFWFBBTkQ7Cj4gIAl2bWEtPnZtX3BhZ2Vf
cHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdz
KSk7Cj4gIAl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQodm1hLT52bV9wYWdl
X3Byb3QpOwo+ICAJdm1hLT52bV9vcHMgPSAmZHJtX2dlbV9zaG1lbV92bV9vcHM7Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
