Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046F3A0A14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 20:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183289E2B;
	Wed, 28 Aug 2019 18:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A489E2B;
 Wed, 28 Aug 2019 18:57:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 11:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="197625932"
Received: from aborowie-mobl.ger.corp.intel.com (HELO [10.249.35.21])
 ([10.249.35.21])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2019 11:57:31 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <f187c28b-6279-2c4f-3e53-296ee899133b@linux.intel.com>
Date: Wed, 28 Aug 2019 20:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFudmV0LAoKZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjMsIGVuam95IQoKZHJt
LW1pc2MtZml4ZXMtMjAxOS0wOC0yODoKZHJtLW1pc2MtZml4ZXMgZm9yIHY1LjMgKHJjNz8pOgot
IE1ha2UgcXhsIHJlc2VydmVsIHRoZSB2Z2EgcG9ydHMgdXNpbmcgdmdhYXJnYiB0byBwcmV2ZW50
IHN3aXRjaGluZyB0byB2Z2EgY29tcGF0aWJpbGl0eSBtb2RlLgotIEZpeCBvbWFwIHBvcnQgbG9v
a3VwIGZvciBTREkgb3V0cHV0Ci0gVXNlIHZpcnRpb19tYXhfZG1hX3NpemUgdG8gZml4IGFuIGlz
c3VlIHdpdGggc3dpb3RsYi4KLSBDb21waWxlciBmaXhlcyB0byBrb21lZGEuCi0gQWRkIG1pc3Np
bmcgb2Zfbm9kZV9nZXQoKSBjYWxsIGluIGtvbWVkYS4KLSBSZW9yZGVyIHRoZSBrb21lZGEgZGUt
aW5pdCBmdW5jdGlvbnMuClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNjNkYWY0
ZTE2NjU0NTM2M2YzYjg3NWY1YjgxYWVjYjQ2ZTFlMWQxOToKCiAgZHJtL29tYXA6IGVuc3VyZSB3
ZSBoYXZlIGEgdmFsaWQgZG1hX21hc2sgKDIwMTktMDgtMTIgMTY6MTY6MzQgKzAzMDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJtLW1pc2MtZml4ZXMtMjAxOS0wOC0yOAoK
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDY5NzhiY2UwNTQyNDdlNGNmY2NkZjY4OWNl
MjYzZTA3NjQ5OWY5MDU6CgogIGRybS9rb21lZGE6IFJlb3JkZXJlZCB0aGUga29tZWRhJ3MgZGUt
aW5pdCBmdW5jdGlvbnMgKDIwMTktMDgtMjggMTc6NTU6NDAgKzAxMDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS1t
aXNjLWZpeGVzIGZvciB2NS4zIChyYzc/KToKLSBNYWtlIHF4bCByZXNlcnZlbCB0aGUgdmdhIHBv
cnRzIHVzaW5nIHZnYWFyZ2IgdG8gcHJldmVudCBzd2l0Y2hpbmcgdG8gdmdhIGNvbXBhdGliaWxp
dHkgbW9kZS4KLSBGaXggb21hcCBwb3J0IGxvb2t1cCBmb3IgU0RJIG91dHB1dAotIFVzZSB2aXJ0
aW9fbWF4X2RtYV9zaXplIHRvIGZpeCBhbiBpc3N1ZSB3aXRoIHN3aW90bGIuCi0gQ29tcGlsZXIg
Zml4ZXMgdG8ga29tZWRhLgotIEFkZCBtaXNzaW5nIG9mX25vZGVfZ2V0KCkgY2FsbCBpbiBrb21l
ZGEuCi0gUmVvcmRlciB0aGUga29tZWRhIGRlLWluaXQgZnVuY3Rpb25zLgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBeWFu
IEt1bWFyIEhhbGRlciAoMSk6CiAgICAgIGRybS9rb21lZGE6IFJlb3JkZXJlZCB0aGUga29tZWRh
J3MgZGUtaW5pdCBmdW5jdGlvbnMKCkdlcmQgSG9mZm1hbm4gKDIpOgogICAgICBkcm0vcXhsOiBn
ZXQgdmdhIGlvcG9ydHMKICAgICAgZHJtL3ZpcnRpbzogdXNlIHZpcnRpb19tYXhfZG1hX3NpemUK
CkxhdXJlbnQgUGluY2hhcnQgKDEpOgogICAgICBkcm0vb21hcDogRml4IHBvcnQgbG9va3VwIGZv
ciBTREkgb3V0cHV0CgpNaWhhaWwgQXRhbmFzc292ICgxKToKICAgICAgZHJtL2tvbWVkYTogQWRk
IG1pc3Npbmcgb2Zfbm9kZV9nZXQoKSBjYWxsCgpqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9s
b2d5IENoaW5hKSAoMyk6CiAgICAgIGRybS9rb21lZGE6IEZpeCBlcnJvcjogbm90IGFsbG9jYXRp
bmcgZW5vdWdoIGRhdGEgMTU5MiB2cyAxNTg0CiAgICAgIGRybS9rb21lZGE6IEZpeCB3YXJuaW5n
IC1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUKICAgICAgZHJtL2tvbWVkYTogQ2xlYW4gd2Fybmlu
ZyAna29tZWRhX2NvbXBvbmVudF9hZGQnIG1pZ2h0IGJlIGEgY2FuZGlkYXRlIGZvciAnZ251X3By
aW50ZicKCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAg
ICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyAgICB8IDI5ICsrKysrKysrKysrKystLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgIHwgIDEgKwogLi4uL2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vZHNzL291dHB1dC5jICAgICAgICAgICAgICAgfCAgNCArKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5jICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKyst
CiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgICAgICAgICAgICB8IDEw
ICsrKysrKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
