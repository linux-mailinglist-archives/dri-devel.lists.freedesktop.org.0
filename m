Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D786FE0160
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712306E50D;
	Tue, 22 Oct 2019 10:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855D16E50B;
 Tue, 22 Oct 2019 10:01:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="196388699"
Received: from sharmash-desk1.iind.intel.com ([10.99.66.206])
 by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2019 03:01:14 -0700
From: Shashank Sharma <shashank.sharma@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] Add scaling filters in DRM layer
Date: Tue, 22 Oct 2019 15:29:43 +0530
Message-Id: <20191022095946.29354-1-shashank.sharma@intel.com>
X-Mailer: git-send-email 2.17.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qmx1cnJ5IG91dHB1dHMgZHVyaW5nIHVwc2NhbGluZyB0aGUgdmlkZW8gYnVmZmVyLCBpcyBhIGdl
bmVyaWMgcHJvYmxlbQpvZiBncmFwaGljcyBpbmR1c3RyeS4gT25lIG9mIHRoZSBtYWpvciByZWFz
b24gYmVoaW5kIHRoaXMgYmx1cnJpbmVzcyBpcwp0aGUgaW50ZXJwb2xhdGlvbiBvZiBwaXhlbCB2
YWx1ZXMgdXNlZCBieSBtb3N0IG9mIHRoZSB1cHNjYWxpbmcgaGFyZHdhcmVzLgoKTmVhcmVzdC1u
ZWlnaGJvciBpcyBhIHNjYWxpbmcgbW9kZSwgd2hpY2ggd29ya3MgYnkgZmlsbGluZyBpbiB0aGUg
bWlzc2luZwpjb2xvciB2YWx1ZXMgaW4gdGhlIHVwc2NhbGVkIGltYWdlIHdpdGggdGhhdCBvZiB0
aGUgY29vcmRpbmF0ZS1tYXBwZWQKbmVhcmVzdCBzb3VyY2UgcGl4ZWwgdmFsdWUuCgpOZWFyZXN0
LW5laWdoYm9yIGNhbiBwcm9kdWNlIChhbG1vc3QpIG5vbi1ibHVycnkgc2NhbGluZyBvdXRwdXRz
IHdoZW4KdGhlIHNjYWxpbmcgcmF0aW8gaXMgY29tcGxldGUgaW50ZWdlci4gRm9yIGV4YW1wbGU6
Ci0gaW5wdXQgYnVmZmVyIHJlc29sdXRpb246IDEyODB4NzIwKEhEKQotIG91dHB1dCBidWZmZXIg
cmVzb2x1dGlvbjogMzg0MHgyMTYwKFVIRC80SykKLSBzY2FsaW5nIHJhdGlvIChoKSA9IDM4NDAv
MTI4MCA9IDMgIAotIHNjYWxpbmcgcmF0aW8gKHYpID0gMjE2MC83MjAgPSAzCgpJbiBzdWNoIHNj
ZW5hcmlvcywgd2Ugc2hvdWxkIHRyeSB0byBwaWNrIE5lYXJlc3QtbmVpZ2hib3IgYXMgc2NhbGlu
ZwptZXRob2Qgd2hlbiBwb3NzaWJsZS4KCk1hbnkgZ2FtaW5nIGNvbW11bml0aWVzIGhhdmUgYmVl
biBhc2tpbmcgZm9yIGludGVnZXItbW9kZSBzY2FsaW5nCnN1cHBvcnQsIHNvbWUgbGlua3MgYW5k
IGJhY2tncm91bmQ6Cmh0dHBzOi8vc29mdHdhcmUuaW50ZWwuY29tL2VuLXVzL2FydGljbGVzL2lu
dGVnZXItc2NhbGluZy1zdXBwb3J0LW9uLWludGVsLWdyYXBoaWNzCmh0dHA6Ly90YW5hbGluLmNv
bS9lbi9hcnRpY2xlcy9sb3NzbGVzcy1zY2FsaW5nLwpodHRwczovL2NvbW11bml0eS5hbWQuY29t
L3RocmVhZC8yMDkxMDcKaHR0cHM6Ly93d3cubnZpZGlhLmNvbS9lbi11cy9nZWZvcmNlL2ZvcnVt
cy9nYW1lLXJlYWR5LWRyaXZlcnMvMTMvMTAwMi9mZWF0dXJlLXJlcXVlc3Qtbm9uYmx1cnJ5LXVw
c2NhbGluZy1hdC1pbnRlZ2VyLXJhdC8KClRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgcHJvZ3JhbW1hYmxlIHNjYWxpbmcgZmlsdGVycywgd2hpY2gKY2FuIGhlbHAgYSB1c2VyIHRv
IHBpY2sgYW5kIGVuYWJsZXMgTk4gc2NhbGluZyBvbiBJbnRlbCBkaXNwbGF5IGhhcmR3YXJlCihJ
Q0wgb253YXJkcykuIFRoZXJlIGlzIGFsc28gb25lIG9wdGlvbiB0byBwaWNrIE5OIG9ubHkgd2hl
biB0aGUgc2NhbGluZwpyYXRpb3MgYXJlIGludGVnZXIsIHRvIGFjaGlldmUgSW50ZWdlciBzY2Fs
aW5nLCB3aXRob3V0KGFsc21vc3QpIGFueSBzaWRlIGVmZmV0cy4KCnRoZXJlIHdhcyBhbiBSRkMg
c2VyaWVzIHB1Ymxpc2hlZCBmb3IgdGhlIHNhbWUsIHdoaWNoIGNhbiBiZSBzZWVuIGhlcmU6IApo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY2MTc1LyAKClNoYXNoYW5r
IFNoYXJtYSAoMyk6CiAgZHJtOiBJbnRyb2R1Y2Ugc2NhbGluZyBmaWx0ZXIgbW9kZSBwcm9wZXJ0
eQogIGRybS9pOTE1OiBBZGQgc3VwcG9ydCBmb3Igc2NhbGluZyBmaWx0ZXJzCiAgZHJtL2k5MTU6
IEhhbmRsZSBuZWFyZXN0LW5laWdoYm9yIHNjYWxpbmcgZmlsdGVyCgogZHJpdmVycy9ncHUvZHJt
L2RybV9hdG9taWNfdWFwaS5jICAgICAgICAgICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jICB8IDE2MSArKysrKysrKysrKysrKysrKy0KIC4u
Li9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8ICAgMyArCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oICAgICAgICAgICAgICAgfCAgMzEgKysrKwogaW5j
bHVkZS9kcm0vZHJtX2NydGMuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDI2ICsrKwogaW5j
bHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmggICAgICAgICAgICAgICAgIHwgICA2ICsKIDYgZmls
ZXMgY2hhbmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
