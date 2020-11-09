Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05832AB4C9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BEC8982A;
	Mon,  9 Nov 2020 10:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4594D8982A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F072AAF39;
 Mon,  9 Nov 2020 10:26:17 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Create chip AST2600
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201109093812.161483-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fd2cdee4-3eb3-facd-5398-56d74fa7cf14@suse.de>
Date: Mon, 9 Nov 2020 11:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109093812.161483-1-kuohsiang_chou@aspeedtech.com>
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
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDA5LjExLjIwIHVtIDEwOjM4IHNjaHJpZWIgS3VvSHNpYW5nIENob3U6Cj4gW05ld10g
U3VwcG9ydCBBU1QyNjAwCgpBIHN0eWxlIGlzc3VlOiBiZXR0ZXIgd3JpdGUgYSBuaWNlIHNlbnRl
bmNlIHRoYW4gdGhlc2UgdGFncy4gIEZvciB0aGUKcGF0Y2ggYXQgaGFuZCwgSSdkIHByZWZlcnJl
ZCBzb21ldGhpbmcgbGlrZTogIk9ubHkgYWRkIGFuIGlkIGZvcgpzdXBwb3J0aW5nIEFTVDI2MDAu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBhcmUgcmVxdWlyZWQuIgoKSSBhc3N1bWUgdGhhdCB0aGVy
ZSBhcmVubyBmdXJ0aGVyIGNoYW5nZXMgcmVxdWlyZWQgZm9yIEFTVDI2MDAuCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEt1b0hzaWFuZyBDaG91IDxrdW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT4K
ClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KCkkn
bGwgYWRkIHRoZSBwYXRjaCB0byBkcm0tbWlzYy1uZXh0LiBUaGFua3MhCgpCZXN0IHJlZ2FyZHMK
VGhvbWFzCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIHwgNSArKysrLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5o
Cj4gaW5kZXggNDY3MDQ5Y2E4NDMwLi42YjllM2I5NGE3MTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9k
cnYuaAo+IEBAIC02Myw2ICs2Myw3IEBAIGVudW0gYXN0X2NoaXAgewo+ICAJQVNUMjMwMCwKPiAg
CUFTVDI0MDAsCj4gIAlBU1QyNTAwLAo+ICsJQVNUMjYwMCwKPiAgfTsKPiAKPiAgZW51bSBhc3Rf
dHhfY2hpcCB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+IGluZGV4IDc3MDY2YmNhODc5My4uNGVj
Njg4NGY2YzY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+IEBAIC0xNDMsNyArMTQzLDEw
IEBAIHN0YXRpYyBpbnQgYXN0X2RldGVjdF9jaGlwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJv
b2wgKm5lZWRfcG9zdCkKPiAgCWFzdF9kZXRlY3RfY29uZmlnX21vZGUoZGV2LCAmc2N1X3Jldik7
Cj4gCj4gIAkvKiBJZGVudGlmeSBjaGlwc2V0ICovCj4gLQlpZiAoZGV2LT5wZGV2LT5yZXZpc2lv
biA+PSAweDQwKSB7Cj4gKwlpZiAoZGV2LT5wZGV2LT5yZXZpc2lvbiA+PSAweDUwKSB7Cj4gKwkJ
YXN0LT5jaGlwID0gQVNUMjYwMDsKPiArCQlkcm1faW5mbyhkZXYsICJBU1QgMjYwMCBkZXRlY3Rl
ZFxuIik7Cj4gKwl9IGVsc2UgaWYgKGRldi0+cGRldi0+cmV2aXNpb24gPj0gMHg0MCkgewo+ICAJ
CWFzdC0+Y2hpcCA9IEFTVDI1MDA7Cj4gIAkJZHJtX2luZm8oZGV2LCAiQVNUIDI1MDAgZGV0ZWN0
ZWRcbiIpOwo+ICAJfSBlbHNlIGlmIChkZXYtPnBkZXYtPnJldmlzaW9uID49IDB4MzApIHsKPiAt
LQo+IDIuMTguNAo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpCkdlc2No
w6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
