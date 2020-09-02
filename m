Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA025BDD5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9896E828;
	Thu,  3 Sep 2020 08:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3C289CA0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:56:08 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 85710F1D;
 Wed,  2 Sep 2020 19:56:03 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22908T140609325295360S1599047762080218_; 
 Wed, 02 Sep 2020 19:56:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a9124768c8cbdf58211f153dc645d451>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
From: Huang Jiachai <hjc@rock-chips.com>
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>
References: <20200707112526.18438-1-hjc@rock-chips.com>
 <3361390.LkKjKlf5PX@phil>
 <12d1b648-81d1-df48-4435-b7b88dd72b30@rock-chips.com>
Message-ID: <fc4aab7b-c1e5-4469-8ccd-4529055e05a1@rock-chips.com>
Date: Wed, 2 Sep 2020 19:56:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <12d1b648-81d1-df48-4435-b7b88dd72b30@rock-chips.com>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: huangtao@rock-chips.com, Thomas Zimmermann <tzimmermann@suse.de>,
 kever.yang@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 andy.yan@rock-chips.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQgQWlybGll77yMCgogwqDCoMKgIFBsZWFzZSBoZWxwIHRvIGNvbmZpcm0gd2hldGhl
ciB0aGlzIG1vZGlmaWNhdGlvbiBpcyByZWFzb25hYmxlIHdoZW4gCnlvdSBhcmUgZnJlZSwgdGhh
bmtzLgoKCuWcqCAyMDIwLzgvMTMgMTQ6MzEsIEh1YW5nIEppYWNoYWkg5YaZ6YGTOgo+IHBpbmcu
Li4KPgo+IOWcqCAyMDIwLzcvMjMgMzowMSwgSGVpa28gU3TDvGJuZXIg5YaZ6YGTOgo+PiBBbSBE
aWVuc3RhZywgNy4gSnVsaSAyMDIwLCAxMzoyNToyNiBDRVNUIHNjaHJpZWIgU2FuZHkgSHVhbmc6
Cj4+PiBkb24ndCBtYXNrIHBvc3NpYmxlX2NydGNzIGlmIHJlbW90ZS1wb2ludCBpcyBkaXNhYmxl
ZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29t
Pgo+PiBSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPj4KPj4g
Y2hhbmdlcyBpbiB2MjoKPj4gLSBkcm9wIGFkZGl0aW9uYWwgb2Zfbm9kZV9wdXQsIGFzIGVwIHdp
bGwgYmUgcHV0IHdpdGggdGhlIG5leHQKPj4gwqDCoCBpdGVyYXRpb24gb2YgZm9yX2VhY2hfZW5k
cG9pbnRfb2Zfbm9kZSgpCj4+Cj4+Cj4+IEFzIHRoaXMgdG91Y2hlcyBhIHByZXR0eSBjZW50cmFs
IGZ1bmN0aW9uIGlzIHRoZXJlIHNvbWV0aGluZwo+PiB0byBrZWVwIGluIG1pbmQgaW4gcmVnYXJk
cyB0byBvdGhlciBEUk0gZHJpdmVycz8KPj4gW3F1ZXN0aW9uIGZvciB0aGUgYnJvYWRlciBhdWRp
ZW5jZSA7LSkgXQo+Pgo+PiBIZWlrbwo+Pgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
ZHJtX29mLmMgfCAzICsrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX29mLmMKPj4+IGluZGV4IGZkYjA1ZmJmNzJhMC4uNTY1ZjA1ZjVmMTFiIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX29mLmMKPj4+IEBAIC02Niw2ICs2Niw5IEBAIHVpbnQzMl90IGRybV9vZl9maW5k
X3Bvc3NpYmxlX2NydGNzKHN0cnVjdCAKPj4+IGRybV9kZXZpY2UgKmRldiwKPj4+IMKgwqDCoMKg
wqAgdWludDMyX3QgcG9zc2libGVfY3J0Y3MgPSAwOwo+Pj4gwqAgwqDCoMKgwqDCoCBmb3JfZWFj
aF9lbmRwb2ludF9vZl9ub2RlKHBvcnQsIGVwKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFv
Zl9kZXZpY2VfaXNfYXZhaWxhYmxlKGVwKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRpbnVlOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZV9wb3J0ID0gb2ZfZ3Jh
cGhfZ2V0X3JlbW90ZV9wb3J0KGVwKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXJlbW90
ZV9wb3J0KSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9ub2RlX3B1dChlcCk7
Cj4+Pgo+Pgo+Pgo+Pgo+Pgo+PgotLSAKQmVzdCBSZWdhcmQKCum7hOWutumSlwpTYW5keSBIdWFu
ZwpBZGRyOiDnpo/lt57luILpvJPmpbzljLrpk5znm5jot6/ova/ku7blpKfpgZM4OeWPt+emj+W3
nui9r+S7tuWbrUHljLoyMeWPt+alvCgzNTAwMDMpCiAgICAgICBOby4gMjEgQnVpbGRpbmcsIEEg
RGlzdHJpY3QsIE5vLjg5LHNvZnR3YXJlIEJvdWxldmFyZCBGdXpob3UsRnVqaWFuLFBSQwpUZWzv
vJorODYgMDU5MS04Nzg4NDkxOSAgODY5MApFLW1haWzvvJpoamNAcm9jay1jaGlwcy5jb20KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
