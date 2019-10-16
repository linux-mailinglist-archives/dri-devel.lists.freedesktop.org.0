Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751BD8D64
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D6C6E91B;
	Wed, 16 Oct 2019 10:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 69519 seconds by postgrey-1.36 at gabe;
 Wed, 16 Oct 2019 08:54:53 UTC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D676E903
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:54:53 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 87D0224000E;
 Wed, 16 Oct 2019 08:54:48 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v6 0/8] drm: rcar-du: Add Color Management Module (CMM)
Date: Wed, 16 Oct 2019 10:55:40 +0200
Message-Id: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 10:11:37 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWluaW1hbCBpbmNyZW1lbnQgdG8gdGhlIENNTSBzZXJpZXMsIHRoaXMgdGltZSBzaG91bGQgcmVh
bGx5IGJlIHRoZSBsYXN0IG9uZS4KCkp1c3QgbWlzc2luZyBSb2IncyBhY2sgb24gWzEvOF0gYW5k
IExhdXJlbnQncyBvbmUgb24gWzUvOF0uCgpDaGFuZ2Vsb2cgaXMgbWluaW1hbDoKQ01NCi0gUmVt
b3ZlIHRoZSBjbW1fY29uZmlnLmVuYWJsZSBmbGFnLiBUaGUgY21tX2NvbmZpZy50YWJsZSBmaWVs
ZCB2YWxpZGl0eSBpcwogIHVzZWQgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIExVVCBvcGVyYXRpb25z
Ci0gRXhwYW5kIGNvbW1lbnRzIGFzIHN1Z2dlc3RlZCBieSBMYXVyZW50CgpDUlRDCi0gdXNlIGRy
bV9jb2xvcl9sdXRfc2l6ZSgpIHRvIGNoZWNrIHRoZSBMVVQgdGFibGUgc2l6ZQotIElubGluZSBj
YWxscyB0byByY2FyX2NtbV9lbmFibGUoKS9kaXNhYmxlKCkKLSBBZGQgVE9ETyBlbnRyaWVzIGFz
IHN1Z2dlc3RlZCBieSBMYXVyZW50CgpGb3IgdGhlIHJlY29yZCwgdGhlIGZ1bGwgc2VyaWVzIGNo
YW5nZWxvZyBpcyBhdmFpbGFibGUgYXQ6Cmh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMTA3NDI3
LwoKdjUgZnJvbSB5ZXN0ZXJkYXkgd2l0aCBpbmZvcm1hdGlvbnMgb24gdGVzdGluZyBpcyBhdmFp
bGFibGUgYXQ6Cmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzE1LzMzNwoKR2VlcnQgd2ls
bCB5b3UgY29sbGVjdCBmb3IgRFRTIHBhdGNoZXMgZm9yIHRoZSBuZXh0IHJlbGVhc2U/CkkgYXNz
dW1lIHRoZSBEVSBjaGFuZ2VzIGdvIHRocm91Z2ggTGF1cmVudCBpbnN0ZWFkID8KClRoYW5rcwog
ICBqCgpKYWNvcG8gTW9uZGkgKDgpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzLGNt
bTogQWRkIFItQ2FyIENNTSBkb2N1bWVudGF0aW9uCiAgZHQtYmluZGluZ3M6IGRpc3BsYXksIHJl
bmVzYXMsZHU6IERvY3VtZW50IGNtbXMgcHJvcGVydHkKICBkcm06IHJjYXItZHU6IEFkZCBzdXBw
b3J0IGZvciBDTU0KICBkcm06IHJjYXItZHU6IGttczogSW5pdGlhbGl6ZSBDTU0gaW5zdGFuY2Vz
CiAgZHJtOiByY2FyLWR1OiBjcnRjOiBDb250cm9sIENNTSBvcGVyYXRpb25zCiAgZHJtOiByY2Fy
LWR1OiBjcnRjOiBSZWdpc3RlciBHQU1NQV9MVVQgcHJvcGVydGllcwogIGFybTY0OiBkdHM6IHJl
bmVzYXM6IEFkZCBDTU0gdW5pdHMgdG8gR2VuMyBTb0NzCiAgZHJtOiByY2FyLWR1OiBrbXM6IEV4
cGFuZCBjb21tZW50IGluIHZzcHMgcGFyc2luZyByb3V0aW5lCgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvcmVuZXNhcyxjbW0ueWFtbCAgICAgICAgIHwgIDY3ICsrKysrKwogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxkdS50eHQgICAgICAgICAgIHwgICA1ICsKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kgICAgICB8ICAzOSArKysrCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNpICAgICAgfCAgMzEgKystCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRzaSAgICAgfCAgMzEgKystCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSAgICAgfCAgMjEgKysKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpICAgICB8ICAyMSArKwogZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2NtbS5jICAgICAgICAgICAgfCAyMTIgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2NtbS5oICAgICAgICAgICAgfCAgNTggKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jICAgICAgICB8ICA2NSArKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5oICAgICAgICB8ICAgMiArCiBkcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oICAgICAgICAgfCAgIDIgKwogZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jICAgICAgIHwgIDEwICsKIGRyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuaCAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jICAgICAgICAgfCAgODIgKysrKysrLQogZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmggICAgICAgIHwgICA1ICsKIDE4IGZpbGVz
IGNoYW5nZWQsIDY1OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
Y21tLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2Fy
X2NtbS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9j
bW0uaAoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
