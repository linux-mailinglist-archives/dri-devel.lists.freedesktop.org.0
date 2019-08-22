Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4559A118
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FC16EAD1;
	Thu, 22 Aug 2019 20:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211D26EAD1;
 Thu, 22 Aug 2019 20:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8738FA381A5;
 Thu, 22 Aug 2019 20:32:14 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 038216CE6B;
 Thu, 22 Aug 2019 20:32:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915: Enable CONFIG_DMA_API_DEBUG_SG for intel-ci
Date: Thu, 22 Aug 2019 16:31:27 -0400
Message-Id: <20190822203127.24648-2-lyude@redhat.com>
In-Reply-To: <20190822203127.24648-1-lyude@redhat.com>
References: <20190822203127.24648-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 22 Aug 2019 20:32:14 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2UndmUgZml4ZWQgaTkxNSBzbyB0aGF0IGl0IHNldHMgYSBtYXggU0cgc2VnbWVu
dCBsZW5ndGggYW5kCmdvdHRlbiByaWQgb2YgdGhlIHJlbGV2YW50IHdhcm5pbmdzLCBsZXQncyBl
bmFibGUKQ09ORklHX0RNQV9BUElfREVCVUdfU0cgZm9yIGludGVsLWNpIHNvIHRoYXQgd2UgY2Fu
IGNhdGNoIGlzc3VlcyBsaWtlCnRoaXMgaW4gdGhlIGZ1dHVyZSBhcyB3ZWxsLgoKU2lnbmVkLW9m
Zi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcu
ZGVidWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcuZGVidWcgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9LY29uZmlnLmRlYnVnCmluZGV4IDAwNzg2YTE0MmZmMC4uYWQ4ZDNjZDYzYzlmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L0tjb25maWcuZGVidWcKQEAgLTMyLDYgKzMyLDcgQEAgY29uZmlnIERSTV9JOTE1
X0RFQlVHCiAJc2VsZWN0IERSTV9ERUJVR19TRUxGVEVTVAogCXNlbGVjdCBETUFCVUZfU0VMRlRF
U1RTCiAJc2VsZWN0IFNXX1NZTkMgIyBzaWduYWxpbmcgdmFsaWRhdGlvbiBmcmFtZXdvcmsgKGln
dC9zeW5jb2JqKikKKyAgICAgICAgc2VsZWN0IERNQV9BUElfREVCVUdfU0cKIAlzZWxlY3QgRFJN
X0k5MTVfU1dfRkVOQ0VfREVCVUdfT0JKRUNUUwogCXNlbGVjdCBEUk1fSTkxNV9TRUxGVEVTVAog
CXNlbGVjdCBEUk1fSTkxNV9ERUJVR19SVU5USU1FX1BNCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
