Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D241A98B
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C12289AB3;
	Sat, 11 May 2019 21:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1989A32
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:36 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233C5587;
 Sat, 11 May 2019 23:07:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/10] dt-bindings: display: renesas: lvds: Add renesas,
 companion property
Date: Sun, 12 May 2019 00:06:56 +0300
Message-Id: <20190511210702.18394-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608853;
 bh=C42ViQQj+3BvDs8mfpAj5KQh4LmMJlp09KTfcFjJpSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iYPtkkeornhkS4/kPUi7ChxtpUmbrMP4Z/90A9MMX58sCGawnoyc7KAh/7P1Ykvwp
 YF2AjSb3pEiFxRuLfDJn+v2sctjWhB4cQvYmhc431wCO/5fktIqpS61Hjo5OOriaG4
 Zo+lW0JlSZpXXjRQMptw4mbxDk7jkYJ8Uo+ETu4U=
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IG9wdGlvbmFsIHJlbmVzYXMsY29tcGFuaW9uIHByb3BlcnR5IHRvIHBvaW50IHRv
IHRoZSBjb21wYW5pb24KTFZEUyBlbmNvZGVyLiBUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydCBkdWFs
LWxpbmsgb3BlcmF0aW9uIHdoZXJlIHRoZSBtYWluCkxWRFMgZW5jb2RlciBzcGxpdHMgZXZlbi1u
dW1iZXJlZCBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBiZXR3ZWVuIHRoZQp0d28gTFZEUyBlbmNv
ZGVycy4KClRoZSBuZXcgcHJvcGVydHkgZG9lc24ndCBjb250cm9sIHRoZSBtb2RlIG9mIG9wZXJh
dGlvbiwgaXQgb25seQpkZXNjcmliZXMgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBtYXN0
ZXIgYW5kIGNvbXBhbmlvbiBMVkRTCmVuY29kZXJzLgoKU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Ci0tLQpD
aGFuZ2VzIHNpbmNlIHYxOgoKLSBGaXhlZCB0eXBvCi0tLQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCAgICAgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50
eHQKaW5kZXggOTAwYTg4NGFkOWY1Li5mMmNjMDFkNTRjYmQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9y
ZW5lc2FzLGx2ZHMudHh0CkBAIC00NSw2ICs0NSwxMiBAQCBPRiBncmFwaCBiaW5kaW5ncyBzcGVj
aWZpZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KIAog
RWFjaCBwb3J0IHNoYWxsIGhhdmUgYSBzaW5nbGUgZW5kcG9pbnQuCiAKK09wdGlvbmFsIHByb3Bl
cnRpZXM6CisKKy0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFuZGxlIHRvIHRoZSBjb21wYW5pb24g
TFZEUyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCisgIHZhbGlkIGZvciB0aGUgZmlyc3QgTFZE
UyBlbmNvZGVyIG9uIEQzIGFuZCBFMyBTb0NzIG9ubHksIGFuZCBwb2ludHMgdG8gdGhlCisgIHNl
Y29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBjb21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUu
CisKIAogRXhhbXBsZToKIAotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
