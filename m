Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37329F1FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373E6E8D7;
	Thu, 29 Oct 2020 16:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43856E8BC;
 Thu, 29 Oct 2020 16:44:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22839285-1500050 
 for multiple; Thu, 29 Oct 2020 16:44:20 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Quieten [zero] EDID carping
Date: Thu, 29 Oct 2020 16:44:17 +0000
Message-Id: <20201029164417.14487-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029110030.9959-1-chris@chris-wilson.co.uk>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSBhIGZldyBkaXNwbGF5cyBpbiBDSSB0aGF0IGFsd2F5cyByZXBvcnQgdGhlaXIgRURJ
RCBhcyBhIGJ1bmNoIG9mCnplcm9lcy4gVGhpcyBpcyBjb25zaXN0ZW50IGJlaGF2aW91ciwgc28g
b25lIGFzc3VtZXMgaW50ZW50aW9uYWwKaW5kaWNhdGlvbiBvZiBhbiAiYWJzZW50IiBFRElELiBG
bGFnZ2luZyB0aGVzZSBjb25zaXN0ZW50IHdhcm5pbmdzCmRldHJhY3RzIGZyb20gQ0kuCgpPbmUg
b3B0aW9uIHdvdWxkIGJlIHRvIGlnbm9yZSB0aGUgemVybyBFRElEcyBhcyBpbnRlbnRpb25hbCBi
ZWhhdmlvdXIsCmJ1dCBWaWxsZSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIGluZm9ybWF0aW9uIGF2
YWlsYWJsZSBmb3IgZGVidWdnaW5nLgpUaGUgc2ltcGxlIGFsdGVybmF0aXZlIHRoZW4gaXMgdG8g
cmVkdWNlIHRoZSBsb2dsZXZlbCBmb3IgYWxsIHRoZSBFRElECmR1bXBpbmcgZnJvbSBXQVJOIHRv
IERFQlVHIHNvIHRoZSBpbmZvcm1hdGlvbiBpcyBwcmVzZW50IGJ1dCBub3QgYW5ub3kKQ0kuIE5v
dGUgdGhhdCB0aGUgYmFkIEVESUQgZHVtcGluZyBpcyBhbHJlYWR5IG9ubHkgc2hvd24gaWYKZHJt
LmRlYnVnPUtNUywgaXQncyBqdXN0IHRoZSBsb2dsZXZlbCBjaG9zZW4gd2FzIHNldCB0byBiZSBj
YXVnaHQgYnkgQ0kKaWYgaXQgZXZlciBvY2N1cnJlZCBhcyBpdCB3YXMgZXhwZWN0ZWQgdG8gYmUg
YW4gaW50ZXJuYWwgZXJyb3Igbm90CmV4dGVybmFsLgoKQ2xvc2VzOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzIyMDMKU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggNjMxMTI1YjQ2ZTA0Li5jNzM2M2FmNzMxYjQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCkBAIC0xODQ0LDcgKzE4NDQsNyBAQCBzdGF0aWMgdm9pZCBjb25uZWN0b3Jf
YmFkX2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlpZiAoY29ubmVjdG9y
LT5iYWRfZWRpZF9jb3VudGVyKysgJiYgIWRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9LTVMpKQog
CQlyZXR1cm47CiAKLQlkcm1fd2Fybihjb25uZWN0b3ItPmRldiwgIiVzOiBFRElEIGlzIGludmFs
aWQ6XG4iLCBjb25uZWN0b3ItPm5hbWUpOworCWRybV9kYmdfa21zKGNvbm5lY3Rvci0+ZGV2LCAi
JXM6IEVESUQgaXMgaW52YWxpZDpcbiIsIGNvbm5lY3Rvci0+bmFtZSk7CiAJZm9yIChpID0gMDsg
aSA8IG51bV9ibG9ja3M7IGkrKykgewogCQl1OCAqYmxvY2sgPSBlZGlkICsgaSAqIEVESURfTEVO
R1RIOwogCQljaGFyIHByZWZpeFsyMF07CkBAIC0xODU2LDcgKzE4NTYsNyBAQCBzdGF0aWMgdm9p
ZCBjb25uZWN0b3JfYmFkX2VkaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJ
ZWxzZQogCQkJc3ByaW50ZihwcmVmaXgsICJcdFslMDJ4XSBHT09EICIsIGkpOwogCi0JCXByaW50
X2hleF9kdW1wKEtFUk5fV0FSTklORywKKwkJcHJpbnRfaGV4X2R1bXAoS0VSTl9ERUJVRywKIAkJ
CSAgICAgICBwcmVmaXgsIERVTVBfUFJFRklYX05PTkUsIDE2LCAxLAogCQkJICAgICAgIGJsb2Nr
LCBFRElEX0xFTkdUSCwgZmFsc2UpOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
