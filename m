Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC461E83E
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 08:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEFA894EA;
	Wed, 15 May 2019 06:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014C894E3;
 Wed, 15 May 2019 06:23:25 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16559056-1500050 for multiple; Wed, 15 May 2019 07:23:12 +0100
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190515043753.9853-1-yamada.masahiro@socionext.com>
References: <20190515043753.9853-1-yamada.masahiro@socionext.com>
Message-ID: <155790139253.21839.18331243986827594086@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: drop unneeded -Wall addition
Date: Wed, 15 May 2019 07:23:12 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBNYXNhaGlybyBZYW1hZGEgKDIwMTktMDUtMTUgMDU6Mzc6NTMpCj4gVGhlIHRvcCBs
ZXZlbCBNYWtlZmlsZSBhZGRzIC1XYWxsIGdsb2JhbGx5Ogo+IAo+ICAgS0JVSUxEX0NGTEFHUyAg
IDo9IC1XYWxsIC1XdW5kZWYgLVdlcnJvcj1zdHJpY3QtcHJvdG90eXBlcyAtV25vLXRyaWdyYXBo
cyBcCj4gCj4gSSBzZWUgdHdvICItV2FsbCIgYWRkZWQgZm9yIGNvbXBpbGluZyB1bmRlciBkcml2
ZXJzL2dwdS9kcm0vaTkxNS8uCgpEb2VzIGl0IG1hdHRlcj8gSXMgdGhlIHN0YXRlbWVudCBpbiBp
OTE1L01ha2VmaWxlIG5vdCBtb3JlIGNvbXBsZXRlIGZvcgpzYXlpbmcgIi1XYWxsIC1XZXh0cmEg
LVdlcnJvciI/Cgo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+Cj4gLS0tCj4gCj4gQlRXLCBJIGhhdmUgYSBxdWVzdGlvbiBpbiB0
aGUgY29tbWVudDoKPiAKPiAgIk5vdGUgdGhlIGRhbmdlciBpbiB1c2luZyAtV2FsbCAtV2V4dHJh
IGlzIHRoYXQgd2hlbiBDSSB1cGRhdGVzIGdjYyB3ZQo+ICAgd2lsbCBtb3N0IGxpa2VseSBnZXQg
YSBzdWRkZW4gYnVpbGQgYnJlYWthZ2UuLi4gSG9wZWZ1bGx5IHdlIHdpbGwgZml4Cj4gICBuZXcg
d2FybmluZ3MgYmVmb3JlIENJIHVwZGF0ZXMhIgo+IAo+IEVuYWJsaW5nIHdoYXRldmVyIHdhcm5p
bmcgb3B0aW9ucyBkb2VzIG5vdCBjYXVzZSBidWlsZCBicmVha2FnZS4KPiAtV2Vycm9yIGRvZXMu
Cj4gCj4gU28sIEkgdGhpbmsgdGhlIGNvcnJlY3Qgc3RhdGVtZW50IGlzOgo+IAo+ICAiTm90ZSB0
aGUgZGFuZ2VyIGluIHVzaW5nIC1XZXJyb3IgaXMgdGhhdCB3aGVuIENJIHVwZGF0ZXMgZ2NjIHdl
IC4uLgoKTm8uIENJIGVuZm9yY2VzIC1XZXJyb3IgYW5kIHRoYXQgaXMgY29uc3RhbnQsIHNvIHRo
ZSB1bmNvbnRyb2xsZWQKdmFyaWFibGUsIHRoZSBkYW5nZXIsIGxpZXMgaW4gdXNpbmcgdGhlIHVu
cmVsaWFibGUgaGV1cmlzdGljcyBnY2MgbWF5CmFyYml0cmFyeSBlbmFibGUgYmV0d2VlbiB2ZXJz
aW9ucy4gVGhhdCB0aGUgc2V0IG9mIHdhcm5pbmdzIGNhdXNpbmcgYW4KZXJyb3IgbWF5IGJlIGRp
ZmZlcmVudCBiZXR3ZWVuIENJIGFuZCB0aGUgZGV2ZWxvcGVyLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
