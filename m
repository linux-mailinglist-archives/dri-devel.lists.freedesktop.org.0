Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC0295CBE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723ED6F5C9;
	Thu, 22 Oct 2020 10:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6116F5C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 10:34:52 +0000 (UTC)
Date: Thu, 22 Oct 2020 10:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603362890;
 bh=lbyJ7jg1JK+DITUUKTq4KsQfoukWUJ3ahftLFI7WZzI=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=M6VU3pXFVzJLCxBM7QNjJar9PIa+mWQpv1Is2Q0OGZH97i1h4z9usxdEoWLNMEsnv
 kX2YYG5MDC5z0u99R7gdwb2NpIhXLhOGEA2O9CKt5EF4nUb4/oIpxnWRTKEfPes00y
 tlhANvBSt/Ed0qfdjOvXN3kG5JQrxg4Iz4s97cqdLhzj56S7o2XrKtLiU7satAgFMh
 s5nqAszX0UJVb7FisMTUmKa3kKJovE6aNoIP1E1TZom6mJjv/nwpEf+1ztWYv9iAI5
 33pFh5lQ0o968aYmtW+D+TttjE0nXvIlcAsnwte7mc1Bpc3pcBlAYPkp2WNKOQ10N8
 B4SBL+UdGMDsg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document that user-space should avoid parsing EDIDs
Message-ID: <V_APW3gKRhljvcmT28tGV3JkP7qW9Z7h45I-s2wiJvYhaaveCpYpg3tztZPsZVV2KV1NC7rUx08IUUgCJXzdRrWCsEGB0czq4ZozpdyVFLs=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlci1zcGFjZSBzaG91bGQgYXZvaWQgcGFyc2luZyBFRElEcyBmb3IgbWV0YWRhdGEgYWxyZWFk
eSBleHBvc2VkIHZpYQpvdGhlciBLTVMgaW50ZXJmYWNlcyBhbmQgcHJvcGVydGllcy4gRm9yIGlu
c3RhbmNlLCB1c2VyLXNwYWNlIHNob3VsZCBub3QKdHJ5IHRvIGV4dHJhY3QgYSBsaXN0IG9mIG1v
ZGVzIGZyb20gdGhlIEVESUQ6IHRoZSBrZXJuZWwgbWlnaHQgbXV0YXRlCnRoZSBtb2RlIGxpc3Qg
KGJlY2F1c2Ugb2YgbGluayBjYXBhYmlsaXRpZXMgb3IgcXVpcmtzIGZvciBpbnN0YW5jZSkuCgpP
dGhlciBtZXRhZGF0YSBub3QgZXhwb3NlZCBieSBLTVMgY2FuIGJlIHBhcnNlZCBieSB1c2VyLXNw
YWNlLiBUaGlzCmluY2x1ZGVzIGZvciBpbnN0YW5jZSBtb25pdG9yIGlkZW50aWZpY2F0aW9uICht
YWtlL21vZGVsL3NlcmlhbCkgYW5kCnN1cHBvcnRlZCBjb2xvci1zcGFjZXMuCgp2MjogYWRkIHNo
b3J0IGV4cGxhbmF0aW9uIHdoeSB1c2VyLXNwYWNlIHNob3VsZG4ndCBkbyB0aGlzIChCcmlhbikK
ClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KU3VnZ2VzdGVk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkFja2VkLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtr
YS5wYWFsYW5lbkBjb2xsYWJvcmEuY28udWs+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBh
cm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA1ICsrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKaW5k
ZXggNzE3YzRlNzI3MWIwLi4xOTEzZDhiNGUxNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpA
QCAtOTYwLDYgKzk2MCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlz
dCBkcF9jb2xvcnNwYWNlc1tdID0gewogICogCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJv
cGVydHkoKSwgdXN1YWxseSBhZnRlciBoYXZpbmcgcGFyc2VkCiAgKiAJdGhlIEVESUQgdXNpbmcg
ZHJtX2FkZF9lZGlkX21vZGVzKCkuIFVzZXJzcGFjZSBjYW5ub3QgY2hhbmdlIHRoaXMKICAqIAlw
cm9wZXJ0eS4KKyAqCisgKiAJVXNlci1zcGFjZSBzaG91bGQgbm90IHBhcnNlIHRoZSBFRElEIHRv
IG9idGFpbiBpbmZvcm1hdGlvbiBleHBvc2VkIHZpYQorICogCW90aGVyIEtNUyBwcm9wZXJ0aWVz
IChiZWNhdXNlIHRoZSBrZXJuZWwgbWlnaHQgYXBwbHkgbGltaXRzLCBxdWlya3Mgb3IKKyAqIAlm
aXh1cHMgdG8gdGhlIEVESUQpLiBGb3IgaW5zdGFuY2UsIHVzZXItc3BhY2Ugc2hvdWxkIG5vdCB0
cnkgdG8gcGFyc2UKKyAqIAltb2RlIGxpc3RzIGZyb20gdGhlIEVESUQuCiAgKiBEUE1TOgogICog
CUxlZ2FjeSBwcm9wZXJ0eSBmb3Igc2V0dGluZyB0aGUgcG93ZXIgc3RhdGUgb2YgdGhlIGNvbm5l
Y3Rvci4gRm9yIGF0b21pYwogICogCWRyaXZlcnMgdGhpcyBpcyBvbmx5IHByb3ZpZGVkIGZvciBi
YWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nCi0tIAoyLjI4LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
