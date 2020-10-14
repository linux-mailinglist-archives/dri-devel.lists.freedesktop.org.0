Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D777828DA38
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF776EA11;
	Wed, 14 Oct 2020 07:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Wed, 14 Oct 2020 01:55:46 UTC
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFBE6E027
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 01:55:46 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id B1D83161
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 09:49:03 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.182])
 by regular2.263xmail.com (Postfix) with ESMTP id 7BF9F43E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 09:49:00 +0800 (CST)
Received: from localhost (unknown [192.168.167.8])
 by regular1.263xmail.com (Postfix) with ESMTP id E9648975;
 Wed, 14 Oct 2020 09:48:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.60.65] (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P2456T140206579640064S1602640125644670_; 
 Wed, 14 Oct 2020 09:48:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c249e46a4078a52f82170955db998a8c>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
To: Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200707112526.18438-1-hjc@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <5c0cdb9d-8e35-fa0c-35b3-adfa7770fb30@rock-chips.com>
Date: Wed, 14 Oct 2020 09:48:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707112526.18438-1-hjc@rock-chips.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: huangtao@rock-chips.com, andy.yan@rock-chips.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWFpbnRhaW5lcnMsCgogwqDCoMKgIERvZXMgdGhpcyBwYXRjaCByZWFkeSB0byBtZXJnZT8K
Ck9uIDIwMjAvNy83IOS4i+WNiDc6MjUsIFNhbmR5IEh1YW5nIHdyb3RlOgo+IGRvbid0IG1hc2sg
cG9zc2libGVfY3J0Y3MgaWYgcmVtb3RlLXBvaW50IGlzIGRpc2FibGVkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fb2YuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9vZi5jCj4gaW5kZXggZmRiMDVmYmY3MmEwLi41NjVmMDVmNWYxMWIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9vZi5jCj4gQEAgLTY2LDYgKzY2LDkgQEAgdWludDMyX3QgZHJtX29mX2ZpbmRfcG9zc2li
bGVfY3J0Y3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgIAl1aW50MzJfdCBwb3NzaWJsZV9j
cnRjcyA9IDA7Cj4gICAKPiAgIAlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKHBvcnQsIGVwKSB7
Cj4gKwkJaWYgKCFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKGVwKSkKPiArCQkJY29udGludWU7Cj4g
Kwo+ICAgCQlyZW1vdGVfcG9ydCA9IG9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydChlcCk7Cj4gICAJ
CWlmICghcmVtb3RlX3BvcnQpIHsKPiAgIAkJCW9mX25vZGVfcHV0KGVwKTsKCkxvb2tzIGdvb2Qg
dG8gbWUuCgoKUmV2aWV3ZWQtYnk6IEtldmVyIFlhbmcgPGtldmVyLnlhbmdAcm9jay1jaGlwcy5j
b20+CgpUaGFua3MsCi0gS2V2ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
