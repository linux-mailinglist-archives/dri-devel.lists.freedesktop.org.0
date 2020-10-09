Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6D2885E6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 11:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4B6EC88;
	Fri,  9 Oct 2020 09:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A76EC88
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 09:24:14 +0000 (UTC)
Date: Fri, 09 Oct 2020 09:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1602235452;
 bh=hhjjM31bBIHSfRUZVh8gonhy1p0JGEjI5nhzcZfRsIE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=UqJCJYAkK5wqY8/rdyg9NgSkMxXQmKNye8joAjiTuRopEqTX65dovpnll8VdeUmmu
 zQlHqTj25ysUPgs9q/3nhPX6FzgKh9dr0vudBrbMIXkMc7qbAPSSFSic1C16MMqU0y
 WwItYHom9o31b5hk7DVCkPGfbx8juqPFXmHWArd7FQhJNkqphsqbEdVh477kuVz60k
 +N36QWvLYwdM6pWekvc01uXfVbVJnStD6pLrR4eydxvOfYOSm7yWgy80MB4CK04HYa
 jNC5dY3Z1JkbbQHliWACBL26ApnjRgHwsxvooY+h83SREUwj6gx9ZDu0epLGa56fFn
 qJaYkhr3EKJow==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
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
YWtlL21vZGVsL3NlcmlhbCkgYW5kCnN1cHBvcnRlZCBjb2xvci1zcGFjZXMuCgpTaWduZWQtb2Zm
LWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+ClN1Z2dlc3RlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBj
b2xsYWJvcmEuY28udWs+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpp
bmRleCA3MTdjNGU3MjcxYjAuLjAwZTU4ZmQyZDI5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5j
CkBAIC05NjAsNiArOTYwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9s
aXN0IGRwX2NvbG9yc3BhY2VzW10gPSB7CiAgKiAJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9w
cm9wZXJ0eSgpLCB1c3VhbGx5IGFmdGVyIGhhdmluZyBwYXJzZWQKICAqIAl0aGUgRURJRCB1c2lu
ZyBkcm1fYWRkX2VkaWRfbW9kZXMoKS4gVXNlcnNwYWNlIGNhbm5vdCBjaGFuZ2UgdGhpcwogICog
CXByb3BlcnR5LgorICoKKyAqIAlVc2VyLXNwYWNlIHNob3VsZCBub3QgcGFyc2UgdGhlIEVESUQg
dG8gb2J0YWluIGluZm9ybWF0aW9uIGV4cG9zZWQgdmlhCisgKiAJb3RoZXIgS01TIHByb3BlcnRp
ZXMuIEZvciBpbnN0YW5jZSwgdXNlci1zcGFjZSBzaG91bGQgbm90IHRyeSB0byBwYXJzZQorICog
CW1vZGUgbGlzdHMgZnJvbSB0aGUgRURJRC4KICAqIERQTVM6CiAgKiAJTGVnYWN5IHByb3BlcnR5
IGZvciBzZXR0aW5nIHRoZSBwb3dlciBzdGF0ZSBvZiB0aGUgY29ubmVjdG9yLiBGb3IgYXRvbWlj
CiAgKiAJZHJpdmVycyB0aGlzIGlzIG9ubHkgcHJvdmlkZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IHdpdGggZXhpc3RpbmcKLS0gCjIuMjguMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
