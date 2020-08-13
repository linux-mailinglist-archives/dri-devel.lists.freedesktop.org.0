Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288C243485
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8698C6E478;
	Thu, 13 Aug 2020 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14D96E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 06:31:19 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 087A61177;
 Thu, 13 Aug 2020 14:31:17 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P28892T140683746662144S1597300276100784_; 
 Thu, 13 Aug 2020 14:31:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <649d06a57454f0e656e289273e1861b8>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v2] drm/of: Consider the state in which the ep is disabled
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>
References: <20200707112526.18438-1-hjc@rock-chips.com>
 <3361390.LkKjKlf5PX@phil>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <12d1b648-81d1-df48-4435-b7b88dd72b30@rock-chips.com>
Date: Thu, 13 Aug 2020 14:31:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3361390.LkKjKlf5PX@phil>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
 David Airlie <airlied@linux.ie>, kever.yang@rock-chips.com,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLgoK1NogMjAyMC83LzIzIDM6MDEsIEhlaWtvIFN0qLlibmVyINC0tcA6Cj4gQW0gRGll
bnN0YWcsIDcuIEp1bGkgMjAyMCwgMTM6MjU6MjYgQ0VTVCBzY2hyaWViIFNhbmR5IEh1YW5nOgo+
PiBkb24ndCBtYXNrIHBvc3NpYmxlX2NydGNzIGlmIHJlbW90ZS1wb2ludCBpcyBkaXNhYmxlZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4KPiBS
ZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+IGNoYW5nZXMg
aW4gdjI6Cj4gLSBkcm9wIGFkZGl0aW9uYWwgb2Zfbm9kZV9wdXQsIGFzIGVwIHdpbGwgYmUgcHV0
IHdpdGggdGhlIG5leHQKPiAgICBpdGVyYXRpb24gb2YgZm9yX2VhY2hfZW5kcG9pbnRfb2Zfbm9k
ZSgpCj4KPgo+IEFzIHRoaXMgdG91Y2hlcyBhIHByZXR0eSBjZW50cmFsIGZ1bmN0aW9uIGlzIHRo
ZXJlIHNvbWV0aGluZwo+IHRvIGtlZXAgaW4gbWluZCBpbiByZWdhcmRzIHRvIG90aGVyIERSTSBk
cml2ZXJzPwo+IFtxdWVzdGlvbiBmb3IgdGhlIGJyb2FkZXIgYXVkaWVuY2UgOy0pIF0KPgo+IEhl
aWtvCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9vZi5jIHwgMyArKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX29mLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKPj4gaW5kZXggZmRi
MDVmYmY3MmEwLi41NjVmMDVmNWYxMWIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fb2YuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX29mLmMKPj4gQEAgLTY2LDYgKzY2
LDkgQEAgdWludDMyX3QgZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3Moc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKPj4gICAJdWludDMyX3QgcG9zc2libGVfY3J0Y3MgPSAwOwo+PiAgIAo+PiAgIAlm
b3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKHBvcnQsIGVwKSB7Cj4+ICsJCWlmICghb2ZfZGV2aWNl
X2lzX2F2YWlsYWJsZShlcCkpCj4+ICsJCQljb250aW51ZTsKPj4gKwo+PiAgIAkJcmVtb3RlX3Bv
cnQgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnQoZXApOwo+PiAgIAkJaWYgKCFyZW1vdGVfcG9y
dCkgewo+PiAgIAkJCW9mX25vZGVfcHV0KGVwKTsKPj4KPgo+Cj4KPgo+Ci0tIApCZXN0IFJlZ2Fy
ZAoKu8a80u7OClNhbmR5IEh1YW5nCkFkZHI6ILij1t3K0LnEwqXH+M2txczCt8jtvP6087XAODm6
xbij1t3I7bz+1LBBx/gyMbrFwqUoMzUwMDAzKQogICAgICAgTm8uIDIxIEJ1aWxkaW5nLCBBIERp
c3RyaWN0LCBOby44OSxzb2Z0d2FyZSBCb3VsZXZhcmQgRnV6aG91LEZ1amlhbixQUkMKVGVso7or
ODYgMDU5MS04Nzg4NDkxOSAgODY5MApFLW1haWyjumhqY0Byb2NrLWNoaXBzLmNvbQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
