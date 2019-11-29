Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E120210D6B2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A96E911;
	Fri, 29 Nov 2019 14:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 913D86E911
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:11:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76BEA1FB;
 Fri, 29 Nov 2019 06:11:24 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4793F52E;
 Fri, 29 Nov 2019 06:11:23 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/sched: don't try to construct error code from
 NULL ptr
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20191129132643.7828-1-l.stach@pengutronix.de>
From: Steven Price <steven.price@arm.com>
Message-ID: <50ba5e88-1144-1197-7224-9a29430d2edd@arm.com>
Date: Fri, 29 Nov 2019 14:11:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191129132643.7828-1-l.stach@pengutronix.de>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMTEvMjAxOSAxMzoyNiwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gSWYgdGhlIGpvYiBzdWJt
aXNzaW9uIGZhaWxzIHdpdGggYSBOVUxMIGZlbmNlIHJldHVybmVkIGluc3RlYWQgb2YgYW4KPiBl
cnJvciBwb2ludGVyIHdlIG11c3Qgbm90IHRyeSB0byBjb252ZXJ0IHRoaXMgaW50byBhbiBlcnJv
ci4gVGhlIGVycm9yCj4gY29kZSBpbiB0aGlzIGNhc2Ugd2lsbCBiZSAwLCB3aGljaCBjYXVzZXMg
YSB3YXJuaW5nIHNwbGF0IGZyb20KPiBkbWFfZmVuY2Vfc2V0X2Vycm9yKCkuCj4gCj4gQWxzbyBt
b3N0IGRyaXZlcnMgcmV0dXJuIE5VTEwgZnJvbSB0aGUgcnVuX2pvYiBjYWxsYmFjayBpZiB0aGUg
ZmVuY2UKPiBhbHJlYWR5IGhhcyB0aGUgZXJyb3Igc3RhdGUgc2V0LCBzbyB0cnlpbmcgdG8gc2V0
IGEgMCBlcnJvciBjb2RlCj4gYWN0aXZlbHkgZGVzdHJveXMgdGhlIHZhbGlkIGVycm9yIGNvZGUg
b24gdGhlIGZlbmNlLgo+IAo+IEZpeGVzOiAxNjdiZjk2MDE0YTAgKGRybS9zY2hlZDogU2V0IGVy
cm9yIHRvIHNfZmVuY2UgaWYgSFcgam9iCj4gICAgICAgIHN1Ym1pc3Npb24gZmFpbGVkLikKPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KClRoaXMg
d2FzIGFscmVhZHkgcmVwb3J0ZWQgYW5kIGEgcGF0Y2ggZml4aW5nIGl0IHBvc3RlZFsxXSAoYWx0
aG91Z2ggeW91cgpjb21taXQgbWVzc2FnZSBpcyBzaWduaWZpY2FudGx5IG1vcmUgaW5mb3JtYXRp
dmUpLiBUaGF0IHBhdGNoIGFsc28gZml4ZXMKdGhlIG90aGVyIGNhc2UgaW4gZHJtX3NjaGVkX21h
aW4oKS4KClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjE4Mzk5LwoK
U3RldmUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+IGluZGV4IGYzOWI5N2VkNGFk
ZS4uNTk2YTI4ZDkwZTVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPiBAQCAtNDk1LDcgKzQ5NSw3IEBAIHZvaWQgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkKPiAgCQlkbWFfZmVuY2VfcHV0KHNfam9iLT5z
X2ZlbmNlLT5wYXJlbnQpOwo+ICAJCWZlbmNlID0gc2NoZWQtPm9wcy0+cnVuX2pvYihzX2pvYik7
Cj4gIAo+IC0JCWlmIChJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsKPiArCQlpZiAoSVNfRVJSKGZl
bmNlKSkgewo+ICAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsKPiAgCQkJZG1hX2Zl
bmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2UpKTsKPiAgCQl9
IGVsc2Ugewo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
