Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8DAEFF8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 18:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A270D6E936;
	Tue, 10 Sep 2019 16:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52CFB6E935
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 16:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13301000;
 Tue, 10 Sep 2019 09:52:04 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D733F71F;
 Tue, 10 Sep 2019 09:52:00 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
To: Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <20190906214409.26677-2-robdclark@gmail.com>
 <20190910081415.GB3247@8bytes.org>
 <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4b5b59bb-39a4-0757-e2bb-0961cfc7e4c1@arm.com>
Date: Tue, 10 Sep 2019 17:51:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>, iommu@lists.linux-foundation.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDkvMjAxOSAxNjozNCwgUm9iIENsYXJrIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDEwLCAy
MDE5IGF0IDE6MTQgQU0gSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+IHdyb3RlOgo+Pgo+
PiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMjo0NDowMVBNIC0wNzAwLCBSb2IgQ2xhcmsgd3Jv
dGU6Cj4+PiBAQCAtNjc0LDcgKzY3NCw3IEBAIGludCBpb21tdV9ncm91cF9hZGRfZGV2aWNlKHN0
cnVjdCBpb21tdV9ncm91cCAqZ3JvdXAsIHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Cj4+PiAgICAg
ICAgbXV0ZXhfbG9jaygmZ3JvdXAtPm11dGV4KTsKPj4+ICAgICAgICBsaXN0X2FkZF90YWlsKCZk
ZXZpY2UtPmxpc3QsICZncm91cC0+ZGV2aWNlcyk7Cj4+PiAtICAgICBpZiAoZ3JvdXAtPmRvbWFp
bikKPj4+ICsgICAgIGlmIChncm91cC0+ZG9tYWluICYmICEoZGV2LT5kcml2ZXIgJiYgZGV2LT5k
cml2ZXItPmRyaXZlcl9tYW5hZ2VzX2lvbW11KSkKPj4KPj4gSG1tLCB0aGlzIGNvZGUgdXN1YWxs
eSBydW5zIGF0IGVudW1lcmF0aW9uIHRpbWUgd2hlbiBubyBkcml2ZXIgaXMKPj4gYXR0YWNoZWQg
dG8gdGhlIGRldmljZS4gQWN0dWFsbHkgaXQgd291bGQgYmUgcHJldHR5IGRhbmdlcm91cyB3aGVu
IHRoaXMKPj4gY29kZSBydW5zIHdoaWxlIGEgZHJpdmVyIGlzIGF0dGFjaGVkIHRvIHRoZSBkZXZp
Y2UuIEhvdyBkb2VzIHRoYXQgY2hhbmdlCj4+IG1ha2UgdGhpbmdzIHdvcmsgZm9yIHlvdT8KPj4K
PiAKPiBJIHdhcyBzZWVpbmcgdGhpcyBnZXQgY2FsbGVkIHZpYSB0aGUgcGF0aCBkcml2ZXJfcHJv
YmVfZGV2aWNlKCkgLT4KPiBwbGF0Zm9ybV9kbWFfY29uZmlndXJlKCkgLT4gb2ZfZG1hX2NvbmZp
Z3VyZSgpIC0+IG9mX2lvbW11X2NvbmZpZ3VyZSgpCj4gLT4gaW9tbXVfcHJvYmVfZGV2aWNlKCkg
LT4gLi4uCj4gCj4gVGhlIG9ubHkgY2FzZXMgSSB3YXMgc2VlaW5nIHdoZXJlIGRldi0+ZHJpdmVy
IGlzIE5VTEwgd2hlcmUgYSBmZXcKPiBwbGFjZXMgdGhhdCBkcml2ZXJzIGNhbGwgb2ZfZG1hX2Nv
bmZpZ3VyZSgpIG9uIHRoZWlyIG93biBzdWItZGV2aWNlcy4KPiBCdXQgbWF5YmUgdGhlcmUgYXJl
IHNvbWUgb3RoZXIgcGF0aHMgdGhhdCBJIGRpZCBub3Qgbm90aWNlPwoKRm9yIHRoZSBvZl9pb21t
dSBmbG93LCBpdCB2ZXJ5IG11Y2ggZGVwZW5kcyBvbiB5b3VyIERUIGxheW91dCBhbmQgZHJpdmVy
IApwcm9iZSBvcmRlciBhcyB0byB3aGV0aGVyIHlvdSBjYXRjaCB0aGUgInByb3BlciIgY2FsbCBm
cm9tIAppb21tdV9idXNfbm90aWZpZXIoKS9pb21tdV9idXNfaW5pdCgpIG9yIHRoZSBsYXRlICJy
ZXBsYXkiIGZyb20gCm9mX2lvbW11X2NvbmZpZ3VyZSgpLiBJIHdvdWxkbid0IG1ha2UgYW55IGFz
c3VtcHRpb25zIG9mIGNvbnNpc3RlbmN5LgoKUm9iaW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
