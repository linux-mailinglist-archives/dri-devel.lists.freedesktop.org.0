Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0B155C57
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000466E0D6;
	Fri,  7 Feb 2020 17:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4C336E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 23:06:55 +0000 (UTC)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id EB04229A99; Thu,  6 Feb 2020 18:06:52 -0500 (EST)
Message-Id: <cover.1581030073.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 0/3] Improve MIPS Magnum support
MIME-Version: 1.0
Date: Fri, 07 Feb 2020 10:01:13 +1100
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 linux-mips@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBmZXcgbWlub3IgcGF0Y2hlcyBhcmUgbmVlZGVkIHRvIG1vcmUgZWFzaWx5IGJvb3QgYSBNSVBT
IE1hZ251bSBidWlsZAp1bmRlciBRRU1VLiBUaGlzIHNlcmllcyBmaXhlcyBhIGJ1aWxkIGZhaWx1
cmUgaW4gdGhlIGczNjRmYiBkcml2ZXIgYW5kCm1vZGlmaWVzIGphenpfZGVmY29uZmlnIGZvciB1
c2Ugd2l0aCAncWVtdS1zeXN0ZW0tbWlwczY0ZWwgLU0gbWFnbnVtJy4KCk5vdGUgdGhhdCBRRU1V
J3MgZHA4MzkzeCBpbXBsZW1lbnRhdGlvbiBoYXMgYnVncywgb25lIG9mIHdoaWNoIHByZXZlbnRz
CnRoZSBMaW51eCBqYXp6c29uaWMgZHJpdmVyIGZyb20gcHJvYmluZyB0aGUgY2hpcC4gSSBoYXZl
IGZpeGVkIHRoZSBidWdzCnRoYXQgSSBrbm93IG9mIGluIGEgc2VyaWVzIG9mIHBhdGNoZXMgYXQs
Cmh0dHBzOi8vZ2l0aHViLmNvbS9mdGhhaW4vcWVtdS9jb21taXRzL3NvbmljCgpDaGFuZ2VkIHNp
bmNlIHYxOgogLSBBZGRlZCByZXZpZXdlZC1ieSBhbmQgdGVzdGVkLWJ5IHRhZ3MgZnJvbSBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqS4KIC0gUmViYXNlZC4KCgpGaW5uIFRoYWluICgzKToKICBmYmRl
di9nMzY0ZmI6IEZpeCBidWlsZCBmYWlsdXJlCiAgbWlwcy9qYXp6OiBSZW1vdmUgcmVkdW5kYW50
IHNldHRpbmdzIGFuZCBzaHJpbmsgamF6el9kZWZjb25maWcKICBtaXBzL2pheno6IFVwZGF0ZSBq
YXp6X2RlZmNvbmZpZyBmb3IgTUlQUyBNYWdudW0KCiBhcmNoL21pcHMvY29uZmlncy9qYXp6X2Rl
ZmNvbmZpZyB8IDI2NyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2czNjRmYi5jICAgICB8ICAyOSArLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDI4MSBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
