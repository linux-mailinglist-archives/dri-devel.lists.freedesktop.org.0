Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601002204E
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 00:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7F89565;
	Fri, 17 May 2019 22:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FED89533
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 22:31:49 +0000 (UTC)
Received: from localhost.localdomain
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93C662F3;
 Sat, 18 May 2019 00:31:47 +0200 (CEST)
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/3] VSP1/DU atomic interface changes
Date: Fri, 17 May 2019 23:31:40 +0100
Message-Id: <20190517223143.26251-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1558132307;
 bh=hrreR5uYRWGRqx1xcaMBEKSzGe5SPNniPH+7l05moZs=;
 h=From:To:Cc:Subject:Date:From;
 b=wLL0CDjSV5zlGtmCmdhx0gsq2nAtHTLeLiJ7TuMCBa5hajNudX6zKUHrI3NmPxzpM
 Emb/JIqvh/cX/b8S7wLsM27dLdwtUx5TikD5JE+JZiGY9nn8q/NCc9RsCQBZORwJpJ
 fj6F33WyiXOZF0/VqRxoPWhEmS6kk7svwleZOkl4=
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgcGFydCBvZiB0aGUgb25nb2luZyBEVSBncm91cCByZWZhY3RvcmluZyBpdCBiZWNhbWUgYXBw
YXJlbnQgdGhhdCB3ZSBuZWVkIHRvCnNwbGl0IHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBWU1Ag
dG8gYWxsb3cgZmluZSBncmFpbiBjb250cm9sIG9mIHNldHRpbmcgdGhlClZTUDEgbW9kZSBjb25m
aWd1cmF0aW9uIGFuZCBlbmFibGluZy9kaXNhYmxpbmcgb2YgdGhlIHBpcGVsaW5lLgoKVG8gc3Bs
aXQgdGhlIG1vZGUgY29uZmlndXJhdGlvbiBhbmQgdGhlIHBpcGVsaW5lIGVuYWJsZW1lbnQsIHdl
IGFkZCB0aHJlZSBuZXcKY2FsbHM6CgogLSB2c3AxX2R1X2F0b21pY19tb2Rlc2V0KCkKIC0gdnNw
MV9kdV9hdG9taWNfZW5hYmxlKCkKIC0gdnNwMV9kdV9hdG9taWNfZGlzYWJsZSgpCgpUbyBzdXBw
b3J0IHRoZSBjcm9zcy1jb21wb25lbnQgQVBJLCB0aGUgbmV3IGludGVyZmFjZSBpcyBhZGRlZCBp
biBbcGF0Y2ggMS8zXSwKaW5jbHVkaW5nIGFuIGltcGxlbWVudGF0aW9uIG9mIHZzcDFfZHVfc2V0
dXBfbGlmKCkgdG8gc3VwcG9ydCB0aGUgdHJhbnNpdGlvbi4KClRoZSBEUk0gdXNhZ2UgaXMgYWRh
cHRlZCBpbiBbcGF0Y2ggMi8zXSwgYmVmb3JlIHRoZSBjYWxsIGlzIHJlbW92ZWQgZW50aXJlbHkg
aW4KW3BhdGNoIDMvM10KCldoaWxzdCB0aGVzZSBwYXRjaGVzIGFyZSBpbmRlcGVuZGVudCBhbmQg
Y291bGQgYmUgcmV2aWV3ZWQgc2VwYXJhdGVseSwgdGhleSBhcmUKbm90IGV4cGVjdGVkIHRvIGJl
IGludGVncmF0ZWQgdW50aWwgdGhlIGFzc29jaWF0ZWQgZ3JvdXAgcmV3b3JrIGlzIGNvbXBsZXRl
ZC4KCktpZXJhbiBCaW5naGFtICgzKToKICBtZWRpYTogdnNwMTogZHJtOiBTcGxpdCB2c3AxX2R1
X3NldHVwX2xpZigpCiAgZHJtOiByY2FyLWR1OiBDb252ZXJ0IHRvIHRoZSBuZXcgVlNQIGF0b21p
YyBBUEkKICBtZWRpYTogdnNwMTogZHJtOiBSZW1vdmUgdnNwMV9kdV9zZXR1cF9saWYoKQoKIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jIHwgICA0ICstCiBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X3ZzcC5jICB8ICAyMSArKy0KIGRyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfdnNwLmggIHwgICAyICsKIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNw
MS92c3AxX2RybS5jIHwgMTg4ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIGluY2x1ZGUvbWVk
aWEvdnNwMS5oICAgICAgICAgICAgICAgICAgIHwgIDI2ICsrLS0KIDUgZmlsZXMgY2hhbmdlZCwg
MTU5IGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
