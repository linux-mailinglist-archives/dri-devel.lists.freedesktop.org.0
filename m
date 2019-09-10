Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5AAE56C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 10:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31A6E05A;
	Tue, 10 Sep 2019 08:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2019 08:22:00 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D932E6E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 08:22:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4DC20386; Tue, 10 Sep 2019 10:14:17 +0200 (CEST)
Date: Tue, 10 Sep 2019 10:14:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190910081415.GB3247@8bytes.org>
References: <20190906214409.26677-1-robdclark@gmail.com>
 <20190906214409.26677-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906214409.26677-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Sudeep Holla <sudeep.holla@arm.com>, iommu@lists.linux-foundation.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDI6NDQ6MDFQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEBAIC02NzQsNyArNjc0LDcgQEAgaW50IGlvbW11X2dyb3VwX2FkZF9kZXZpY2Uoc3RydWN0
IGlvbW11X2dyb3VwICpncm91cCwgc3RydWN0IGRldmljZSAqZGV2KQo+ICAKPiAgCW11dGV4X2xv
Y2soJmdyb3VwLT5tdXRleCk7Cj4gIAlsaXN0X2FkZF90YWlsKCZkZXZpY2UtPmxpc3QsICZncm91
cC0+ZGV2aWNlcyk7Cj4gLQlpZiAoZ3JvdXAtPmRvbWFpbikKPiArCWlmIChncm91cC0+ZG9tYWlu
ICYmICEoZGV2LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXItPmRyaXZlcl9tYW5hZ2VzX2lvbW11KSkK
CkhtbSwgdGhpcyBjb2RlIHVzdWFsbHkgcnVucyBhdCBlbnVtZXJhdGlvbiB0aW1lIHdoZW4gbm8g
ZHJpdmVyIGlzCmF0dGFjaGVkIHRvIHRoZSBkZXZpY2UuIEFjdHVhbGx5IGl0IHdvdWxkIGJlIHBy
ZXR0eSBkYW5nZXJvdXMgd2hlbiB0aGlzCmNvZGUgcnVucyB3aGlsZSBhIGRyaXZlciBpcyBhdHRh
Y2hlZCB0byB0aGUgZGV2aWNlLiBIb3cgZG9lcyB0aGF0IGNoYW5nZQptYWtlIHRoaW5ncyB3b3Jr
IGZvciB5b3U/CgpSZWdhcmRzLAoKCUpvZXJnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
