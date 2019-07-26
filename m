Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4476713
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21126ED4A;
	Fri, 26 Jul 2019 13:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9168E6ED4A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:15:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B04337;
 Fri, 26 Jul 2019 06:15:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 359573F694;
 Fri, 26 Jul 2019 06:15:34 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id E0CB4680121; Fri, 26 Jul 2019 14:15:32 +0100 (BST)
Date: Fri, 26 Jul 2019 14:15:32 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Initialize and enable output polling on Komeda
Message-ID: <20190726131532.GP15612@e110455-lin.cambridge.arm.com>
References: <1564128018-22921-1-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564128018-22921-1-git-send-email-lowry.li@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDg6MDA6MjlBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBJbml0aWFsaXplIGFuZCBlbmFibGUgb3V0cHV0IHBv
bGxpbmcgb24gS29tZWRhLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuYwo+IGluZGV4IDE0NjJiYWMuLjI2ZjI5MTkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC0x
NSw2ICsxNSw3IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFu
ay5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAgCj4gICNpbmNsdWRl
ICJrb21lZGFfZGV2LmgiCj4gICNpbmNsdWRlICJrb21lZGFfZnJhbWVidWZmZXIuaCIKPiBAQCAt
MzMxLDYgKzMzMiw4IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2go
c3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gdW5pbnN0YWxs
X2lycTsKPiAgCj4gKwlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKCk1vc3Qgb2YgdGhl
IGRyaXZlcnMgY2FsbCB0aGlzIGJlZm9yZSByZWdpc3RlcmluZyB0aGUgZHJpdmVyLiBCdXQgdGhp
cyBpcyBhbGwKbW9vdCBiZWNhdXNlIEkgY2FuJ3QgYXBwbHkgdGhlIHBhdGNoIG9uIHRvcCBvZiBk
cm0tbWlzYy1uZXh0LCBzbyBub3QgaGF2aW5nCmZ1bGwgY29udGV4dCBvZiB3aGF0IGtvbWVkYV9r
bXNfYXR0YWNoIGxvb2tzIGxpa2UgaW4geW91ciB0cmVlLgoKQmVzdCByZWdhcmRzLApMaXZpdQoK
PiArCj4gIAlyZXR1cm4ga21zOwo+ICAKPiAgdW5pbnN0YWxsX2lycToKPiBAQCAtMzQ4LDYgKzM1
MSw3IEBAIHZvaWQga29tZWRhX2ttc19kZXRhY2goc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMp
Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJmttcy0+YmFzZTsKPiAgCXN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2ID0gZHJtLT5kZXZfcHJpdmF0ZTsKPiAgCj4gKwlkcm1fa21zX2hlbHBlcl9w
b2xsX2ZpbmkoZHJtKTsKPiAgCW1kZXYtPmZ1bmNzLT5kaXNhYmxlX2lycShtZGV2KTsKPiAgCWRy
bV9kZXZfdW5yZWdpc3Rlcihkcm0pOwo+ICAJZHJtX2lycV91bmluc3RhbGwoZHJtKTsKPiAtLSAK
PiAxLjkuMQo+IAoKLS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwK
fCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAg
IHwKIFwgc291cmNlIGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8Kv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
