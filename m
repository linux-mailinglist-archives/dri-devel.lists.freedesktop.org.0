Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E947A7E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8189186;
	Mon, 17 Jun 2019 07:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.daemonic.se (mail.daemonic.se [IPv6:2607:f740:d:20::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F9F891AF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 14:03:32 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45RbfW4m3yz3kkc;
 Sun, 16 Jun 2019 14:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id sSCyFI8PqReD; Sun, 16 Jun 2019 14:03:30 +0000 (UTC)
Received: from vivi.daemonic.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45RbfV33Tvz3c7W;
 Sun, 16 Jun 2019 14:03:30 +0000 (UTC)
Subject: Re: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-4-emil.l.velikov@gmail.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <0ad5147c-e110-3ea0-fa10-622492cfa084@daemonic.se>
Date: Sun, 16 Jun 2019 16:03:30 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616132343.26370-4-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Jun 2019 07:13:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1560693810; bh=KA6Mv2xrVXtl5Fro7kFfvVFh
 /SBPdDWW2aZ5lYGtYsk=; b=v9nE9+3xv9YkA+YzKcswbPemGvhfsvcE2gCJOAWe
 yA1hrB0wcc6auuDOalDCXQgZsB2AEtBje2BxJKN/zFRWHhiG07gxJ+pvPnZEaD1V
 dbmzxIZxPbhCEo5Vn0TAqQah1a+/K4y6cxncTDtrH1P0tIhBqmo0CTltIZ1f7oMx
 VDM=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNiAxNToyMywgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IE5pY2xhcyBa
ZWlzaW5nIDx6ZWlzaW5nQGRhZW1vbmljLnNlPgo+IAo+IEZyZWVCU0QgcmVxdWlyZXMgc3lzL3R5
cGVzLmggZm9yIHN5cy9zeXNjdGwuaCwgYWRkIGl0IGFzIHBhcnQgb2YgdGhlCj4gaW5jbHVkZXMg
d2hlbiBjaGVja2luZyBmb3IgaGVhZGVycy4KPiBJbnN0ZWFkIG9mIHNwbGl0dGluZyBvdXQgdGhl
IGNoZWNrIGZvciBzeXMvc3lzY3RsLmggZnJvbSB0aGUgb3RoZXIKPiBoZWFkZXIgY2hlY2tzLCBq
dXN0IGFkZCBzeXMvdHlwZXMuaCB0byBhbGwgaGVhZGVyIGNoZWNrcy4KPiAKPiB2MiBbRW1pbF0K
PiAgIC0gYWRkIGlubGluZSBjb21tZW50Cj4gICAtIGRyb3AgYmFzaC9zaCBodW5rCj4gCj4gU2ln
bmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+CgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNsYXMgWmVpc2luZyA8emVpc2luZ0BkYWVtb25pYy5zZT4KCj4gLS0tCj4g
ICBtZXNvbi5idWlsZCB8IDUgKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5i
dWlsZAo+IGluZGV4IGVkNDA3MDA5Li4xNGY4MmIxZiAxMDA2NDQKPiAtLS0gYS9tZXNvbi5idWls
ZAo+ICsrKyBiL21lc29uLmJ1aWxkCj4gQEAgLTE3OSw5ICsxNzksMTIgQEAgZWxzZQo+ICAgICBk
ZXBfcnQgPSBbXQo+ICAgZW5kaWYKPiAgIGRlcF9tID0gY2MuZmluZF9saWJyYXJ5KCdtJywgcmVx
dWlyZWQgOiBmYWxzZSkKPiArIyBGcm9tIE5pY2xhcyBaZWlzaW5nOgo+ICsjIEZyZWVCU0QgcmVx
dWlyZXMgc3lzL3R5cGVzLmggZm9yIHN5cy9zeXNjdGwuaCwgYWRkIGl0IGFzIHBhcnQgb2YgdGhl
Cj4gKyMgaW5jbHVkZXMgd2hlbiBjaGVja2luZyBmb3IgaGVhZGVycy4KPiAgIGZvcmVhY2ggaGVh
ZGVyIDogWydzeXMvc3lzY3RsLmgnLCAnc3lzL3NlbGVjdC5oJywgJ2FsbG9jYS5oJ10KPiAgICAg
Y29uZmlnLnNldCgnSEFWRV8nICsgaGVhZGVyLnVuZGVyc2NvcmlmeSgpLnRvX3VwcGVyKCksCj4g
LSAgICBjYy5jb21waWxlcygnI2luY2x1ZGUgPEAwQD4nLmZvcm1hdChoZWFkZXIpLCBuYW1lIDog
J0AwQCB3b3JrcycuZm9ybWF0KGhlYWRlcikpKQo+ICsgICAgY2MuY29tcGlsZXMoJyNpbmNsdWRl
IDxzeXMvdHlwZXMuaD5cbiNpbmNsdWRlIDxAMEA+Jy5mb3JtYXQoaGVhZGVyKSwgbmFtZSA6ICdA
MEAgd29ya3MnLmZvcm1hdChoZWFkZXIpKSkKPiAgIGVuZGZvcmVhY2gKPiAgIGlmIGNjLmhhc19o
ZWFkZXJfc3ltYm9sKCdzeXMvc3lzbWFjcm9zLmgnLCAnbWFqb3InKQo+ICAgICBjb25maWcuc2V0
MTAoJ01BSk9SX0lOX1NZU01BQ1JPUycsIHRydWUpCj4gCgoKLS0gCk5pY2xhcyBaZWlzaW5nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
