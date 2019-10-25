Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61440E471E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 11:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B40C6E941;
	Fri, 25 Oct 2019 09:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403C6E938
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 09:28:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C74CB159;
 Fri, 25 Oct 2019 09:28:02 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	noralf@tronnes.org
Subject: [PATCH 2/2] drm/todo: Clarify situation around fbdev and defio
Date: Fri, 25 Oct 2019 11:27:59 +0200
Message-Id: <20191025092759.13069-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025092759.13069-1-tzimmermann@suse.de>
References: <20191025092759.13069-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFRPRE8gaXRlbSBpcyBtaXNsZWFkaW5nIGFuZCBtYWtlcyBpdCBzZWVtIHRoYXQgZmJkZXYg
ZW11bGF0aW9uCmNhbm5vdCBiZSB1c2VkIHdpdGggU0hNRU0uIFJlcGhyYXNlIHRoZSB0ZXh0IHRv
IGRlc2NyaWJlIHRoZSBjdXJyZW50CnNpdHVhdGlvbiBtb3JlIGNvcnJlY3RseS4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIERvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4IDczYzUxYjVhMDk5
Ny4uNjc5MmZhOWI2YjZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtMjA2LDEwICsyMDYsMTAgQEAgR2Vu
ZXJpYyBmYmRldiBkZWZpbyBzdXBwb3J0CiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAog
VGhlIGRlZmlvIHN1cHBvcnQgY29kZSBpbiB0aGUgZmJkZXYgY29yZSBoYXMgc29tZSB2ZXJ5IHNw
ZWNpZmljIHJlcXVpcmVtZW50cywKLXdoaWNoIG1lYW5zIGRyaXZlcnMgbmVlZCB0byBoYXZlIGEg
c3BlY2lhbCBmcmFtZWJ1ZmZlciBmb3IgZmJkZXYuIFdoaWNoIHByZXZlbnRzCi11cyBmcm9tIHVz
aW5nIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBjb2RlIGV2ZXJ5d2hlcmUuIFRoZSBtYWlu
IGlzc3VlIGlzCi10aGF0IGl0IHVzZXMgc29tZSBmaWVsZHMgaW4gc3RydWN0IHBhZ2UgaXRzZWxm
LCB3aGljaCBicmVha3Mgc2htZW0gZ2VtIG9iamVjdHMKLShhbmQgb3RoZXIgdGhpbmdzKS4KK3do
aWNoIG1lYW5zIGRyaXZlcnMgbmVlZCB0byBoYXZlIGEgc3BlY2lhbCBmcmFtZWJ1ZmZlciBmb3Ig
ZmJkZXYuIFRoZSBtYWluCitpc3N1ZSBpcyB0aGF0IGl0IHVzZXMgc29tZSBmaWVsZHMgaW4gc3Ry
dWN0IHBhZ2UgaXRzZWxmLCB3aGljaCBicmVha3Mgc2htZW0KK2dlbSBvYmplY3RzIChhbmQgb3Ro
ZXIgdGhpbmdzKS4gVG8gc3VwcG9ydCBkZWZpbywgYWZmZWN0ZWQgZHJpdmVycyByZXF1aXJlCit0
aGUgdXNlIG9mIGEgc2hhZG93IGJ1ZmZlciwgd2hpY2ggbWF5IGFkZCBDUFUgYW5kIG1lbW9yeSBv
dmVyaGVhZC4KIAogUG9zc2libGUgc29sdXRpb24gd291bGQgYmUgdG8gd3JpdGUgb3VyIG93biBk
ZWZpbyBtbWFwIGNvZGUgaW4gdGhlIGRybSBmYmRldgogZW11bGF0aW9uLiBJdCB3b3VsZCBuZWVk
IHRvIGZ1bGx5IHdyYXAgdGhlIGV4aXN0aW5nIG1tYXAgb3BzLCBmb3J3YXJkaW5nCi0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
