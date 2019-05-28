Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7102C87E
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4989FDB;
	Tue, 28 May 2019 14:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F03C89E69
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 864F0D85;
 Tue, 28 May 2019 16:13:27 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its
 companion LVDS1
Date: Tue, 28 May 2019 17:12:32 +0300
Message-Id: <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052808;
 bh=/wU7lbmDipkoxcZKpe+dYn6kGSHkpaEPfCDQ9qFEtMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXkb5x6ePcSyfj5NCHmDLiNENWMM/DXHjqR3dh2ZvSQTl/QdxQGLp7VXusdbJ/lGO
 S9ZsR0XNEC+ILPukzhi9VfNXwTp7rl57ws/+yAjrFdUy++mS0wy7Z7KaupytQ8d2DO
 Ut4GQ0QQuoOcKobeRzVsBDs4lBaqYL1Ec8ilVHoo=
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
Cc: linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBuZXcgcmVuZXNhcyxjb21wYW5pb24gcHJvcGVydHkgdG8gdGhlIExWRFMwIG5vZGUg
dG8gcG9pbnQgdG8gdGhlCmNvbXBhbmlvbiBMVkRTIGVuY29kZXIgTFZEUzEuCgpTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJv
YXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRp
Lm9yZz4KVGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+
Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgfCAyICsrCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaSB8IDIgKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc5OTAuZHRzaQppbmRleCA1NmNiNTY2ZmZhMDkuLjdjZjU5NjNlYjNiYSAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kKKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLmR0c2kKQEAgLTE4MDEsNiArMTgwMSw4IEBACiAJ
CQlyZXNldHMgPSA8JmNwZyA3Mjc+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAorCQkJcmVu
ZXNhcyxjb21wYW5pb24gPSA8Jmx2ZHMxPjsKKwogCQkJcG9ydHMgewogCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDA+OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5OTUuZHRzaQppbmRleCA1YmYzYWYyNDZlMTQuLjk0YjUxNzdlYjE1MiAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kKKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTk1LmR0c2kKQEAgLTEwMzgsNiArMTAz
OCw4IEBACiAJCQlyZXNldHMgPSA8JmNwZyA3Mjc+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAorCQkJcmVuZXNhcyxjb21wYW5pb24gPSA8Jmx2ZHMxPjsKKwogCQkJcG9ydHMgewogCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCSNzaXplLWNlbGxzID0gPDA+OwotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
