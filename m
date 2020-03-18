Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEEF1895E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 07:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FAF6E866;
	Wed, 18 Mar 2020 06:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD13898CE;
 Wed, 18 Mar 2020 06:33:48 +0000 (UTC)
IronPort-SDR: /x+BofHbPQ9iKQhIzy+QqIzZXRyxis7OzcrfAN5BrL9FGTavu0O9g5GeLUqUYcfYSKhDmJoieO
 AqN4HHYBI6nQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 23:33:47 -0700
IronPort-SDR: K7+gMKtNA8TaW+AnPejz2F+zk2rlHLF7TssTAc6SFaE5DPArKsGihfoke2y6HdGMDPgSbe02T/
 B7hNlJpwVAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="417839757"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2020 23:33:47 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
Date: Tue, 17 Mar 2020 23:35:15 -0700
Message-Id: <20200318063517.3844-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFAgc2luayBkZXZpY2Ugc2V0cyB0aGUgSWdub3JlIE1TQSBiaXQgaW4gaXRzCkRQX0RPV05TVFJF
QU1fUE9SVF9DT1VOVCByZWdpc3RlciB0byBpbmRpY2F0ZSBpdHMgYWJpbGl0eSB0bwppZ25vcmUg
dGhlIE1TQSB2aWRlbyB0aW1pbmcgcGFyYW1hdGVycyBhbmQgaXRzIGFiaWxpdHkgdG8gc3VwcG9y
dApzZWFtbGVzcyB2aWRlbyB0aW1pbmcgY2hhbmdlIG92ZXIgYSByYW5nZSBvZiB0aW1pbmcgZXhw
b3NlZCBieQpEaXNwbGF5SUQgYW5kIEVESUQuClRoaXMgaXMgcmVxdWlyZWQgZm9yIHRoZSBzaW5r
IHRvIGluZGljYXRlIHRoYXQgaXQgaXMgQWRhcHRpdmUgc3luYwpjYXBhYmxlLgoKQ2M6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5
LndlbnRsYW5kQGFtZC5jb20+CkNjOiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXps
YXVza2FzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hbmFzaSBOYXZhcmUgPG1hbmFzaS5kLm5h
dmFyZUBpbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRl
eCBjNjExOWU0YzE2OWEuLmNjZDZlMmU5ODhiOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTMxNSw2
ICsxMzE1LDE0IEBAIGRybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcChjb25zdCB1
OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKIAkJCURQX0FMVEVSTkFURV9TQ1JBTUJMRVJf
UkVTRVRfQ0FQOwogfQogCisvKiBJZ25vcmUgTVNBIHRpbWluZyBmb3IgQWRhcHRpdmUgU3luYyBz
dXBwb3J0IG9uIERQIDEuNCAqLworc3RhdGljIGlubGluZSBib29sCitkcm1fZHBfc2lua19pc19j
YXBhYmxlX3dpdGhvdXRfdGltaW5nX21zYShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9T
SVpFXSkKK3sKKwlyZXR1cm4gZHBjZFtEUF9ET1dOX1NUUkVBTV9QT1JUX0NPVU5UXSAmCisJCURQ
X01TQV9USU1JTkdfUEFSX0lHTk9SRUQ7Cit9CisKIC8qCiAgKiBEaXNwbGF5UG9ydCBBVVggY2hh
bm5lbAogICovCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
