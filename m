Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79889D318F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 21:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DD76E3E1;
	Thu, 10 Oct 2019 19:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6EB6E3E1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 19:44:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 3CFF828FC8E
From: Ezequiel Garcia <ezequiel@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/3] dt-bindings: display: rockchip: document VOP gamma LUT
 address
Date: Thu, 10 Oct 2019 16:43:49 -0300
Message-Id: <20191010194351.17940-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010194351.17940-1-ezequiel@collabora.com>
References: <20191010194351.17940-1-ezequiel@collabora.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSByZWdpc3RlciBzcGVjaWZpZXIgZGVzY3JpcHRpb24gZm9yIGFuCm9wdGlvbmFsIGdh
bW1hIExVVCBhZGRyZXNzLgoKU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lhIDxlemVxdWll
bEBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
LS0tCkNoYW5nZXMgZnJvbSB2NDoKKiBOb25lLgpDaGFuZ2VzIGZyb20gdjM6CiogTm9uZS4KQ2hh
bmdlcyBmcm9tIHYyOgoqIE5vbmUuCkNoYW5nZXMgZnJvbSB2MToKKiBEcm9wIHJlZy1uYW1lcywg
c3VnZ2VzdGVkIGJ5IERvdWcuCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9y
b2NrY2hpcC9yb2NrY2hpcC12b3AudHh0ICAgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hp
cC12b3AudHh0CmluZGV4IDRmNThjNWEyZDE5NS4uOGIzYTVmNTE0MjA1IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hp
cC12b3AudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JvY2tjaGlwL3JvY2tjaGlwLXZvcC50eHQKQEAgLTIwLDYgKzIwLDEwIEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6CiAJCSJyb2NrY2hpcCxyazMyMjgtdm9wIjsKIAkJInJvY2tjaGlwLHJrMzMyOC12
b3AiOwogCistIHJlZzogTXVzdCBjb250YWluIG9uZSBlbnRyeSBjb3JyZXNwb25kaW5nIHRvIHRo
ZSBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aAorCW9mIHRoZSByZWdpc3RlciBzcGFjZS4gQ2FuIG9w
dGlvbmFsbHkgY29udGFpbiBhIHNlY29uZCBlbnRyeQorCWNvcnJlc3BvbmRpbmcgdG8gdGhlIENS
VEMgZ2FtbWEgTFVUIGFkZHJlc3MuCisKIC0gaW50ZXJydXB0czogc2hvdWxkIGNvbnRhaW4gYSBs
aXN0IG9mIGFsbCBWT1AgSVAgYmxvY2sgaW50ZXJydXB0cyBpbiB0aGUKIAkJIG9yZGVyOiBWU1lO
QywgTENEX1NZU1RFTS4gVGhlIGludGVycnVwdCBzcGVjaWZpZXIKIAkJIGZvcm1hdCBkZXBlbmRz
IG9uIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciB1c2VkLgpAQCAtNDgsNyArNTIsNyBAQCBFeGFt
cGxlOgogU29DIHNwZWNpZmljIERUIGVudHJ5OgogCXZvcGI6IHZvcGJAZmY5MzAwMDAgewogCQlj
b21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzI4OC12b3AiOwotCQlyZWcgPSA8MHhmZjkzMDAwMCAw
eDE5Yz47CisJCXJlZyA9IDwweDAgMHhmZjkzMDAwMCAweDAgMHgxOWM+LCA8MHgwIDB4ZmY5MzEw
MDAgMHgwIDB4MTAwMD47CiAJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNSBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKIAkJY2xvY2tzID0gPCZjcnUgQUNMS19WT1AwPiwgPCZjcnUgRENMS19WT1AwPiwg
PCZjcnUgSENMS19WT1AwPjsKIAkJY2xvY2stbmFtZXMgPSAiYWNsa192b3AiLCAiZGNsa192b3Ai
LCAiaGNsa192b3AiOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
