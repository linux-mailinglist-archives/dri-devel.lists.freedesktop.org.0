Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F022D1B01DE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395C6E198;
	Mon, 20 Apr 2020 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1F6E125;
 Mon, 20 Apr 2020 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=vhnFieS2DQnGN6TESglLxrHz7BldvvIr3s8kVhH8mgg=; b=Xiz9K1o7pteziuUf0Hn94u/uw6
 2qpmOw96SmBjDytNSbdH1wYW62/aaf7qv9h3goNdQ8gE5FE9cez+8kK1Fv1QsYH32eu7fvxxZauhn
 LxTPi3RA9LBAg7X6bVZcQ8YsvSLvma6acFZrTRGdHyJZQqC86AhyanNu+4EuLec4AWTIuYUniwZ6u
 oEbQ73lGhx8BSmg3eUMzlsdofz3kxIoDb5or4iNd00uWId4lwYfip0Lvv8/fpJTrOnYNA/O/c20yk
 UizDD3UYf61AarCBMEpSy4neXdxp8UUj8UeToEQpzfGFNjILNZxFPYYnnrn/kreAvVIZ8grkEZ0Hx
 mLXBPBEQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQLZi-0002EU-Ni; Mon, 20 Apr 2020 01:50:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: amdgpu: fix kernel-doc struct warning
Date: Sun, 19 Apr 2020 18:50:15 -0700
Message-Id: <20200420015015.27991-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200420015015.27991-1-rdunlap@infradead.org>
References: <20200420015015.27991-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: "Signed-off-by : Alex Sierra" <alex.sierra@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IGEga2VybmVsLWRvYyB3YXJuaW5nIG9mIG1pc3Npbmcgc3RydWN0IGZpZWxkIGRlc3JpcHRp
b246CgouLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYzo5Mjogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm0nIG5vdCBkZXNjcmliZWQgaW4gJ2Ft
ZGdwdV92bV9ldmljdGlvbl9sb2NrJwoKRml4ZXM6IGEyNjllNDQ5ODlmMyAoImRybS9hbWRncHU6
IEF2b2lkIHJlY2xhaW0gZnMgd2hpbGUgZXZpY3Rpb24gbG9jayIpClNpZ25lZC1vZmYtYnk6IFJh
bmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogU2lnbmVkLW9mZi1ieTogQWxl
eCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+CkNjOiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT4KQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCi0tLSBsbngtNTctcmMyLm9yaWcvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmMKKysrIGxueC01Ny1yYzIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMKQEAgLTgyLDcgKzgyLDcgQEAgc3RydWN0IGFtZGdwdV9wcnRfY2IgewogCXN0cnVj
dCBkbWFfZmVuY2VfY2IgY2I7CiB9OwogCi0vKioKKy8qCiAgKiB2bSBldmljdGlvbl9sb2NrIGNh
biBiZSB0YWtlbiBpbiBNTVUgbm90aWZpZXJzLiBNYWtlIHN1cmUgbm8gcmVjbGFpbS1GUwogICog
aGFwcGVucyB3aGlsZSBob2xkaW5nIHRoaXMgbG9jayBhbnl3aGVyZSB0byBwcmV2ZW50IGRlYWRs
b2NrcyB3aGVuCiAgKiBhbiBNTVUgbm90aWZpZXIgcnVucyBpbiByZWNsYWltLUZTIGNvbnRleHQu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
