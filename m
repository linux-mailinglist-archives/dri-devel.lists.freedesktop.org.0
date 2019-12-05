Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E22114862
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 21:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB236F8F4;
	Thu,  5 Dec 2019 20:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EBE6F8F4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 20:50:42 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1icy57-0003HF-G6; Thu, 05 Dec 2019 21:50:37 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1icy55-00053i-66; Thu, 05 Dec 2019 21:50:35 +0100
Date: Thu, 5 Dec 2019 21:50:35 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: modeset with DRM_FBDEV_EMULATION after drm client exits
Message-ID: <20191205205035.7iu5qvccryzqwj4e@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpJIGhhdmUgYW4gaS5NWDYgKGkuZS4gZXRuYXZpdikgZGV2aWNlIGhlcmUgd2l0aCBh
IGxlZ2FjeSBxdDQgYXBwbGljYXRpb24KdGhhdCBJIGNhbm5vdCBkaXNjdXNzIGF3YXkgKHNvcnJ5
ISkgdGhhdCBuZWVkcyBmcmFtZWJ1ZmZlciBlbXVsYXRpb24uCkZvciB0aGlzIG1hY2hpbmUgSSB3
cm90ZSBhIHByb2dyYW0gdGhhdCBpcyBzdGFydGVkIGFzIHBpZDEsIHNob3dzIGEKc3BsYXNoIHNj
cmVlbiB1c2luZyBkcm0sIGZvcmtzIHRvIGtlZXAgdGhlIGRybSBkZXZpY2Ugb3BlbiwgYW5kIGV4
ZWNzCi9zYmluL2luaXQgaW4gdGhlIHBhcmVudC4KClRoZW4gdGhlIGFwcGxpY2F0aW9uIGluaXRp
YWxpemVzIC9kZXYvZmIwIGFuZCBraWxscyB0aGUgc3BsYXNoIHByb2Nlc3MsCnJlc3VsdGluZyBp
biBjbG9zaW5nIHRoZSBkcm0gZGV2aWNlIGFuZCB0aGUgZGlzcGxheSBmYWxscyBiYWNrIHRvIHNo
b3cKdGhlIGNvbnRlbnQgb2YgL2Rldi9mYjAuCgpUaGlzIGZhbGxiYWNrIGhvd2V2ZXIgY29tZXMg
d2l0aCBhIHNob3J0IGZsaWNrZXIgYmVjYXVzZSBpbiB0aGUga2VybmVsCmZpcnN0IHRoZSBkcm0g
ZGV2aWNlIGlzIGNvbXBsZXRlbHkgY2xvc2VkIChieSB0aGUgY2FsbCBvZgoKCWRybV9jbG9zZV9o
ZWxwZXIoZmlscCk7CgppbiBkcm1fcmVsZWFzZSgpKSBhbmQgb25seSB0aGVuIHRoZSBmcmFtZWJ1
ZmZlciB0YWtlcyBvdmVyIChieQpkcm1fbGFzdGNsb3NlKGRldikgLT4gZHJtX2NsaWVudF9kZXZf
cmVzdG9yZShkZXYpIGFsc28gaW4KZHJtX3JlbGVhc2UoKSkuCgpUaGUgZmxpY2tlcmluZyBnb2Vz
IGF3YXkgZm9yIG1lIGhlcmUgd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZToKCglkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUu
YwoJaW5kZXggZWEzNGJjOTkxODU4Li41Njc5ODNjMWQxMzcgMTAwNjQ0CgktLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZpbGUuYwoJKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKCUBA
IC00NDAsMTEgKzQ0MCwxMSBAQCBpbnQgZHJtX3JlbGVhc2Uoc3RydWN0IGlub2RlICppbm9kZSwg
c3RydWN0IGZpbGUgKmZpbHApCgkgCgkJRFJNX0RFQlVHKCJvcGVuX2NvdW50ID0gJWRcbiIsIGRl
di0+b3Blbl9jb3VudCk7CgkgCgktCWRybV9jbG9zZV9oZWxwZXIoZmlscCk7CgktCgkJaWYgKCEt
LWRldi0+b3Blbl9jb3VudCkKCQkJZHJtX2xhc3RjbG9zZShkZXYpOwoJIAoJKwlkcm1fY2xvc2Vf
aGVscGVyKGZpbHApOwoJKwoJCW11dGV4X3VubG9jaygmZHJtX2dsb2JhbF9tdXRleCk7CgkgCgkJ
ZHJtX21pbm9yX3JlbGVhc2UobWlub3IpOwoKLiBJIHdvbmRlciBpZiB0aGF0IGNvdWxkIGJlIGRv
bmUgaW4gZ2VuZXJhbCwgb3IgaWYgdGhpcyBvbmx5IHdvcmtzCmJlY2F1c2UgbXkgc2V0dXAgaXMg
c3BlY2lhbCAoc28gZm9yIGV4YW1wbGUgdGhlIGV0bmF2aXYgZHJpdmVyIGRvZXNuJ3QKaGF2ZSBh
IGxhc3RjbG9zZSBjYWxsYmFjayBhbmQgYWxzbyBEUklWRVJfTEVHQUNZIGlzbid0IGNvbXBsaWNh
dGluZwp0aGluZ3MgZm9yIG1lKS4KCklmIEknbSBub3QgbWlzdGFrZW4gdGhlIGZiZGV2IGVtdWxh
dGlvbiBpcyB0aGUgb25seSBkcml2ZXIgaW1wbGVtZW50aW5nCmEgcmVzdG9yZSBoYW5kbGVyLCBz
byBoZXJlIGFyZSBub3Qgc28gbWFueSBvcHRpb25zIHRoYXQgbXVzdCBiZSBjYXJlZApmb3IgYW5k
IHRlc3RlZC4KCldoYXQgZG8geW91IHRoaW5rPwoKQmVzdCByZWdhcmRzClV3ZQoKLS0gClBlbmd1
dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2bmln
ICAgICAgICAgICAgfApJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAg
fCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
