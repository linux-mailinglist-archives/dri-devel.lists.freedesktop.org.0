Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD731E8E4
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6476F8958E;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA189292
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 04:39:01 +0000 (UTC)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x4F4c7cJ027504;
 Wed, 15 May 2019 13:38:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x4F4c7cJ027504
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: drop unneeded -Wall addition
Date: Wed, 15 May 2019 13:37:53 +0900
Message-Id: <20190515043753.9853-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1557895089;
 bh=iE+vnhBUmohMYwyQNvfDgRKTtO/iv446MrZ818sQrfg=;
 h=From:To:Cc:Subject:Date:From;
 b=R0deHWNCr8I/DXB/MhqjIvColCojk6Y7goEygOJC5ejAgxWyLBiiPJOm//+HtBCl1
 TjVp4QFaqbx0jr0j8pdIpfN10N1/XiIo4+rQOcgPEZlhuB6ScN0FWtKWmCGfODSMoB
 gZUg7rz2k0/wDpxuUF9Ucwj0+uo1jc7NunXGXLr55iAaYqVIbnbLbG8wuGXq2pEIe8
 6Bn1EJIrazZmarw8BcPdSQhJD0EYinFIQZ1S8rH+g3nSImYLnspcC7I+8HlvDXsQHW
 oLolUTueapGrO3nEa+E/Ha1/M4EjRrGgDSeN4u8Yxpmec/vqseQ60PMsbvukstYryd
 Y8m+89dOpKZUg==
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
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHRvcCBsZXZlbCBNYWtlZmlsZSBhZGRzIC1XYWxsIGdsb2JhbGx5OgoKICBLQlVJTERfQ0ZM
QUdTICAgOj0gLVdhbGwgLVd1bmRlZiAtV2Vycm9yPXN0cmljdC1wcm90b3R5cGVzIC1Xbm8tdHJp
Z3JhcGhzIFwKCkkgc2VlIHR3byAiLVdhbGwiIGFkZGVkIGZvciBjb21waWxpbmcgdW5kZXIgZHJp
dmVycy9ncHUvZHJtL2k5MTUvLgoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1h
ZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KLS0tCgpCVFcsIEkgaGF2ZSBhIHF1ZXN0aW9uIGlu
IHRoZSBjb21tZW50OgoKICJOb3RlIHRoZSBkYW5nZXIgaW4gdXNpbmcgLVdhbGwgLVdleHRyYSBp
cyB0aGF0IHdoZW4gQ0kgdXBkYXRlcyBnY2Mgd2UKICB3aWxsIG1vc3QgbGlrZWx5IGdldCBhIHN1
ZGRlbiBidWlsZCBicmVha2FnZS4uLiBIb3BlZnVsbHkgd2Ugd2lsbCBmaXgKICBuZXcgd2Fybmlu
Z3MgYmVmb3JlIENJIHVwZGF0ZXMhIgoKRW5hYmxpbmcgd2hhdGV2ZXIgd2FybmluZyBvcHRpb25z
IGRvZXMgbm90IGNhdXNlIGJ1aWxkIGJyZWFrYWdlLgotV2Vycm9yIGRvZXMuCgpTbywgSSB0aGlu
ayB0aGUgY29ycmVjdCBzdGF0ZW1lbnQgaXM6CgogIk5vdGUgdGhlIGRhbmdlciBpbiB1c2luZyAt
V2Vycm9yIGlzIHRoYXQgd2hlbiBDSSB1cGRhdGVzIGdjYyB3ZSAuLi4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXl5eXl5eXgoKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUKaW5kZXggZmJjYjA5MDRmNGE4Li40YTRmNjBjN2VkZmMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L01ha2VmaWxlCkBAIC0xMiw3ICsxMiw3IEBACiAjIE5vdGUgdGhlIGRhbmdlciBpbiB1c2luZyAt
V2FsbCAtV2V4dHJhIGlzIHRoYXQgd2hlbiBDSSB1cGRhdGVzIGdjYyB3ZQogIyB3aWxsIG1vc3Qg
bGlrZWx5IGdldCBhIHN1ZGRlbiBidWlsZCBicmVha2FnZS4uLiBIb3BlZnVsbHkgd2Ugd2lsbCBm
aXgKICMgbmV3IHdhcm5pbmdzIGJlZm9yZSBDSSB1cGRhdGVzIQotc3ViZGlyLWNjZmxhZ3MteSA6
PSAtV2FsbCAtV2V4dHJhCitzdWJkaXItY2NmbGFncy15IDo9IC1XZXh0cmEKIHN1YmRpci1jY2Zs
YWdzLXkgKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgdW51c2VkLXBhcmFtZXRlcikKIHN1
YmRpci1jY2ZsYWdzLXkgKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgdHlwZS1saW1pdHMp
CiBzdWJkaXItY2NmbGFncy15ICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIG1pc3Npbmct
ZmllbGQtaW5pdGlhbGl6ZXJzKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
