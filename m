Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B423F26E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 20:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6376E160;
	Fri,  7 Aug 2020 18:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27156E160
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 18:05:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 05A9C80562;
 Fri,  7 Aug 2020 20:05:48 +0200 (CEST)
Date: Fri, 7 Aug 2020 20:05:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/mgag200: fix build on alpha arch
Message-ID: <20200807180547.GA923146@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=iox4zFpeAAAA:8 a=20KFwNOVAAAA:8
 a=Aw8h9_w_h_JpQ7wKU3UA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=WzC6qhA0u3u7Ye7llzcV:22
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyBpbWdhZzIwMCBmb3IgdGhlIGFscGhhIGFyY2hpdGVjdHVyZSBpdCBmYWls
cyBsaWtlIHRoaXM6Cm1nYWcyMDBfZHJ2LmM6MjMzOjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJh2bWFsbG9j4oCZCiAgMjMzIHwgIGJpb3MgPSB2bWFsbG9jKHNp
emUpOwogICAgICB8ICAgICAgICAgXn5+fn5+fgogICAgICB8ICAgICAgICAga21hbGxvYwoKV2hl
biBidWlsZGluZyBmb3Igb3RoZXIgYXJjaGl0ZWN0dXJlcyB2bWFsbG9jLmggaXMgcHVsbGVkIGlu
IHZpYSBzb21lCm90aGVyIGhlYWRlciBmaWxlIC0gZm9yIGV4YW1wbGUgYXNtLWdlbmVyaWMvaW8u
aC4KVXNlIGFuIGV4cGxpY2l0IGluY2x1ZGUgb2Ygdm1hbGxvYy5oIHRvIGZpeCB0aGUgYnVpbGQu
CgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkZpeGVzOiBl
MjBkZmQyN2Y3YWEgKCJkcm0vbWdhZzIwMDogQWRkIHN1cHBvcnQgZm9yIEcyMDAgZGVza3RvcCBj
YXJkcyIpCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEVn
YmVydCBFaWNoIDxlaWNoQHN1c2UuY29tPgpDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRl
PgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCkkgaGF2ZSBsb3N0IHRyYWNr
IGlmIHRoZSBvZmZlbmRpbmcgY29tbWl0IGlzIG9uIHRoZSB3YXkgdG8gdXBzdHJlYW0gb3IKaXQg
aXMganVzdCBpbiBkcm0tbWlzYy1uZXh0LiBCdXQgSSB0aGluayBpdCBpcyB0aGUgbGF0dGVyIHNv
IHdlIGNhbgphcHBseSB0aGlzIHRvIGRybS1taXNjLW5leHQuCgoJU2FtCgogZHJpdmVycy9ncHUv
ZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKaW5kZXggMDkxNzBkNDZh
YTUzLi5iMjgyYjBlNDJjMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwpA
QCAtOSw2ICs5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+CiAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGNpLmg+CisjaW5jbHVkZSA8bGludXgvdm1h
bGxvYy5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Zp
bGUuaD4KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
