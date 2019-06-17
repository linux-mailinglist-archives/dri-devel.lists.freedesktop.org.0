Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B895E499F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C527C6E0E5;
	Tue, 18 Jun 2019 07:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3419D8919B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 09:59:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CDE344;
 Mon, 17 Jun 2019 02:59:09 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015A23F246;
 Mon, 17 Jun 2019 03:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
To: wsa@the-dreams.de
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
 <20190614203144.GB7991@kunai>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
Date: Mon, 17 Jun 2019 10:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614203144.GB7991@kunai>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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
Cc: andrew@lunn.ch, thor.thayer@linux.intel.com, rafael@kernel.org,
 airlied@linux.ie, linux-fpga@vger.kernel.org, ulf.hansson@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, srinivas.kandagatla@linaro.org,
 linux-i2c@vger.kernel.org, lee.jones@linaro.org, f.fainelli@gmail.com,
 peda@axentia.se, frowand.list@gmail.com, jonathanh@nvidia.com,
 maxime.ripard@bootlin.com, jslaby@suse.com, devicetree@vger.kernel.org,
 atull@kernel.org, broonie@kernel.org, mdf@kernel.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 linux-spi@vger.kernel.org, robh+dt@kernel.org, joe@perches.com,
 davem@davemloft.net, hkallweit1@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDE0LzA2LzIwMTkgMjE6MzEsIFdvbGZyYW0gU2FuZyB3cm90ZToKPj4gKwo+PiAraW50
IGRldmljZV9tYXRjaF9vZl9ub2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgdm9pZCAqbnAp
Cj4+ICt7Cj4+ICsJcmV0dXJuIGRldi0+b2Zfbm9kZSA9PSBucDsKPj4gK30KPj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGRldmljZV9tYXRjaF9vZl9ub2RlKTsKPiAKPiBJcyBpdCBhbiBvcHRpb24gdG8g
J3N0YXRpYyBpbmxpbmUnIHRoaXMgc2ltcGxlIGZ1bmN0aW9uIGluIHRoZSBoZWFkZXIsCj4gc2F2
aW5nIHRoZSBFWFBPUlQ/Cj4gCgpOby4gVGhpcyBpcyBzdXBwb3NlZCB0byBiZSBwYXNzZWQgb24g
YXMgYSBjYWxsIGJhY2sgZnVuY3Rpb24gcG9pbnRlcgpmb3IgdGhlIEFQSXMuIEhhdmluZyBpdCBh
cyBhIHN0YXRpYyBpbmxpbmUsIHdvdWxkIHNpbXBseSByZXBsaWNhdGUKdGhlIHNhbWUgZnVuY3Rp
b24gdGhyb3VnaCB0aGUgZHJpdmVyIHN1YnN5c3RlbXMsIHdoaWNoIGlzIG9uZSBvZiB0aGUKaXNz
dWVzIHRoYXQgc2VyaWVzIGlzIHRyeWluZyB0byBzb2x2ZS4gQWxzbywgYnkgaGF2aW5nIHRoZW0g
ZXhwb3J0ZWQsCndlIGNhbiBjb252ZXJ0IHRoZSBuZXcgc3BlY2lhbGl6ZWQgZGV2aWNlIGxvb2t1
cCBmdW5jdGlvbnMsCipfZmluZF9kZXZpY2VfYnlfPHByb3BlcnR5PiB0byBiZSBzdGF0aWMgaW5s
aW5lcy4KClN1enVraQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
