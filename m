Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FF10688D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1A36F4FC;
	Fri, 22 Nov 2019 09:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2A6F4C9;
 Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id DE4013F246;
 Fri, 22 Nov 2019 01:26:56 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Subject: [PATCH v2 1/4] dt-bindings: drm/msm/gpu: document second interconnect
Date: Thu, 21 Nov 2019 20:26:42 -0500
Message-Id: <20191122012645.7430-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Nov 2019 09:00:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1574386017;
 bh=dL0lrpCjc1VI4yESYZZzGcFikG03Q6qUZMtCASVWS90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bDxbw8cG9jSpgDI8dpL9PIgZx7q9aZD6XkBpdFFha0G+xYU4wRVYjttV9N7jEj+UV
 Y4UAoPUyVdztg3QAZcyt2KaFjyTaD3ljifLzCKifmpB8MZYcS6BF3wImHOZQ5eTHjZ
 AQ+QHF8aa0y+q1gnT2zl53U0uqciskg5QUqhPLAw=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBhbGwgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lk
ZSB0aGUgR1BVIGNvcmUKYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0pIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuClRoZXJlJ3MgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3Qg
cGF0aCB0aGF0IG5lZWRzIHRvIGJlIHNldHVwIHRvIE9DTUVNLgpMZXQncyBkb2N1bWVudCB0aGlz
IHNlY29uZCBpbnRlcmNvbm5lY3QgcGF0aCB0aGF0J3MgYXZhaWxhYmxlLiBTaW5jZQp0aGVyZSdz
IG5vdyB0d28gYXZhaWxhYmxlIGludGVyY29ubmVjdHMsIGxldCdzIGFkZCB0aGUKaW50ZXJjb25u
ZWN0LW5hbWVzIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXNtL2dwdS50eHQgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9ncHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dwdS50eHQKaW5kZXggMmI4ZmQyNmM0M2IwLi4zZTZjZDNm
NjRhNzggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21zbS9ncHUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21zbS9ncHUudHh0CkBAIC0yMyw3ICsyMywxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogLSBpb21tdXM6IG9wdGlvbmFsIHBoYW5kbGUgdG8gYW4gYWRyZW5vIGlvbW11IGluc3RhbmNl
CiAtIG9wZXJhdGluZy1wb2ludHMtdjI6IG9wdGlvbmFsIHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVy
YXRpbmcgcG9pbnRzCiAtIGludGVyY29ubmVjdHM6IG9wdGlvbmFsIHBoYW5kbGUgdG8gYW4gaW50
ZXJjb25uZWN0IHByb3ZpZGVyLiAgU2VlCi0gIC4uL2ludGVyY29ubmVjdC9pbnRlcmNvbm5lY3Qu
dHh0IGZvciBkZXRhaWxzLgorICAuLi9pbnRlcmNvbm5lY3QvaW50ZXJjb25uZWN0LnR4dCBmb3Ig
ZGV0YWlscy4gU29tZSBBM3h4IGFuZCBhbGwgQTR4eCBwbGF0Zm9ybXMKKyAgd2lsbCBoYXZlIHR3
byBwYXRoczsgYWxsIG90aGVycyB3aWxsIGhhdmUgb25lIHBhdGguCistIGludGVyY29ubmVjdC1u
YW1lczogVGhlIG5hbWVzIG9mIHRoZSBpbnRlcmNvbm5lY3QgcGF0aHMgdGhhdCBjb3JyZXNwb25k
IHRvIHRoZQorICBpbnRlcmNvbm5lY3RzIHByb3BlcnR5LiBWYWx1ZXMgbXVzdCBiZSBnZngtbWVt
IGFuZCBvY21lbS4KIC0gcWNvbSxnbXU6IEZvciBHTVUgYXR0YWNoZWQgZGV2aWNlcyBhIHBoYW5k
bGUgdG8gdGhlIEdNVSBkZXZpY2UgdGhhdCB3aWxsCiAgIGNvbnRyb2wgdGhlIHBvd2VyIGZvciB0
aGUgR1BVLiBBcHBsaWNhYmxlIHRhcmdldHM6CiAgICAgLSBxY29tLGFkcmVuby02MzAuMgpAQCAt
NzYsNiArNzksNyBAQCBFeGFtcGxlIGE2eHggKHdpdGggR01VKToKIAkJb3BlcmF0aW5nLXBvaW50
cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CiAKIAkJaW50ZXJjb25uZWN0cyA9IDwmcnNjX2hsb3Mg
TUFTVEVSX0dGWDNEICZyc2NfaGxvcyBTTEFWRV9FQkkxPjsKKwkJaW50ZXJjb25uZWN0LW5hbWVz
ID0gImdmeC1tZW0iOwogCiAJCXFjb20sZ211ID0gPCZnbXU+OwogCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
