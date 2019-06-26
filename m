Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C009564E3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2A86E338;
	Wed, 26 Jun 2019 08:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BFF6E32D;
 Wed, 26 Jun 2019 08:48:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 01:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; d="scan'208";a="313363954"
Received: from ccrisan-mobl.ger.corp.intel.com (HELO [10.249.33.85])
 ([10.249.33.85])
 by orsmga004.jf.intel.com with ESMTP; 26 Jun 2019 01:48:42 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PULL] topic/remove-fbcon-notifiers for v5.3, fixes
Message-ID: <7dd06ccb-7f8d-943b-bbc0-f4e58e041a23@linux.intel.com>
Date: Wed, 26 Jun 2019 10:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgZm9sbG93dXAgcHVsbCByZXF1ZXN0IGZvciB0aGUgcmVtb3Zl
LWZiY29uLW5vdGlmaWVycyB0b3BpYyBicmFuY2guCk5vIG1ham9yIGNoYW5nZXMsIGp1c3QgYSBm
ZXcgY29tcGlsZSBmaXhlcy4KClRoaXMgd2lsbCBiZSBwdWxsZWQgaW50byBkcm0tbWlzYy1uZXh0
LCBidXQgaXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0aGUgZmJkZXYgYW5kIGJhY2tsaWdodCB0cmVl
cyB0b28uCgpDaGVlcnMsCk1hYXJ0ZW4KCnRvcGljL3JlbW92ZS1mYmNvbi1ub3RpZmllcnMtMjAx
OS0wNi0yNjoKLSBFeHBvcnQgZmJjb25fdXBkYXRlX3ZjcyB0byBmaXggc2hfbW9iaWxlX2xjZGNm
Yi5jIGNvbXBpbGF0aW9uLgotIFJlbHkgb24gZmJjb24gYmVpbmcgYnVpbHRpbiB3aGVuIHZnYXN3
aXRjaGVyb28gaXMgYnVpbHRpbi4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAx
ZGNmZjRhZTY1MTg1ZThjMDMwMDk3MmY2ZDhkMzlkOWE5ZGIyYmRhOgoKICBiYWNrbGlnaHQ6IHNp
bXBsaWZ5IGxjZCBub3RpZmllciAoMjAxOS0wNS0yOCAxMTowMzowNCArMDIwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vZHJtLW1pc2MgdGFncy90b3BpYy9yZW1vdmUtZmJjb24tbm90aWZpZXJzLTIw
MTktMDYtMjYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2MTE2Yjg5MmJkNGZkMGRk
YzVmMzA1NjZhNTU2MjE4YmIyZTFhOWI2OgoKICB2Z2Ffc3dpdGNoZXJvbzogRGVwZW5kIHVwb24g
ZmJjb24gYmVpbmcgYnVpbHQtaW4sIGlmIGVuYWJsZWQgKDIwMTktMDYtMjYgMTA6MzY6NDkgKzAy
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCnRvcGljL3JlbW92ZS1mYmNvbi1ub3RpZmllcnM6Ci0gRXhwb3J0IGZiY29u
X3VwZGF0ZV92Y3MgdG8gZml4IHNoX21vYmlsZV9sY2RjZmIuYyBjb21waWxhdGlvbi4KLSBSZWx5
IG9uIGZiY29uIGJlaW5nIGJ1aWx0aW4gd2hlbiB2Z2Fzd2l0Y2hlcm9vIGlzIGJ1aWx0aW4uCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkRhbmllbCBWZXR0ZXIgKDIpOgogICAgICBmYmNvbjogRXhwb3J0IGZiY29uX3VwZGF0
ZV92Y3MKICAgICAgdmdhX3N3aXRjaGVyb286IERlcGVuZCB1cG9uIGZiY29uIGJlaW5nIGJ1aWx0
LWluLCBpZiBlbmFibGVkCgogZHJpdmVycy9ncHUvdmdhL0tjb25maWcgICAgICAgICAgfCAxICsK
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
