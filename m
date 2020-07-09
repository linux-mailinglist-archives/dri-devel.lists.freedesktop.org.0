Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA0219BE1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 11:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3F36EA35;
	Thu,  9 Jul 2020 09:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78BD6EA04
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 09:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 411ABADE5;
 Thu,  9 Jul 2020 09:17:45 +0000 (UTC)
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
Message-ID: <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
Date: Thu, 9 Jul 2020 11:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
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
Cc: Peter Jones <pjones@redhat.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjguMDYuMjAgMTA6NTAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gUGluZz8KPiAKPiBPbiAx
MC4wNi4yMCAxNjoxMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gZWZpZmJfcHJvYmUoKSB3aWxs
IGlzc3VlIGFuIGVycm9yIG1lc3NhZ2UgaW4gY2FzZSB0aGUga2VybmVsIGlzIGJvb3RlZAo+PiBh
cyBYZW4gZG9tMCBmcm9tIFVFRkkgYXMgRUZJX01FTU1BUCB3b24ndCBiZSBzZXQgaW4gdGhpcyBj
YXNlLiBBdm9pZAo+PiB0aGF0IG1lc3NhZ2UgYnkgY2FsbGluZyBlZmlfbWVtX2Rlc2NfbG9va3Vw
KCkgb25seSBpZiBFRklfUEFSQVZJUlQKPj4gaXNuJ3Qgc2V0Lgo+Pgo+PiBGaXhlczogMzhhYzAy
ODdiN2Y0ICgiZmJkZXYvZWZpZmI6IEhvbm91ciBVRUZJIG1lbW9yeSBtYXAgYXR0cmlidXRlcyAK
Pj4gd2hlbiBtYXBwaW5nIHRoZSBGQiIpCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIu
YyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKPj4gaW5kZXggNjU0OTFhZTc0ODA4Li5mNWVjY2QxMzcz
ZTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYwo+PiArKysgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2VmaWZiLmMKPj4gQEAgLTQ1Myw3ICs0NTMsNyBAQCBzdGF0aWMg
aW50IGVmaWZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKPj4gwqDCoMKgwqDC
oCBpbmZvLT5hcGVydHVyZXMtPnJhbmdlc1swXS5iYXNlID0gZWZpZmJfZml4LnNtZW1fc3RhcnQ7
Cj4+IMKgwqDCoMKgwqAgaW5mby0+YXBlcnR1cmVzLT5yYW5nZXNbMF0uc2l6ZSA9IHNpemVfcmVt
YXA7Cj4+IC3CoMKgwqAgaWYgKGVmaV9lbmFibGVkKEVGSV9CT09UKSAmJgo+PiArwqDCoMKgIGlm
IChlZmlfZW5hYmxlZChFRklfQk9PVCkgJiYgIWVmaV9lbmFibGVkKEVGSV9QQVJBVklSVCkgJiYK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICFlZmlfbWVtX2Rlc2NfbG9va3VwKGVmaWZiX2ZpeC5zbWVt
X3N0YXJ0LCAmbWQpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKGVmaWZiX2ZpeC5zbWVt
X3N0YXJ0ICsgZWZpZmJfZml4LnNtZW1fbGVuKSA+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIChtZC5waHlzX2FkZHIgKyAobWQubnVtX3BhZ2VzIDw8IEVGSV9QQUdFX1NISUZUKSkpIHsK
Pj4KPiAKCkluIGNhc2UgSSBzZWUgbm8gcmVhY3Rpb24gZnJvbSB0aGUgbWFpbnRhaW5lciBmb3Ig
YW5vdGhlciB3ZWVrIEknbGwgdGFrZQp0aGlzIHBhdGNoIHRocm91Z2ggdGhlIFhlbiB0cmVlLgoK
Ckp1ZXJnZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
