Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF50B1A991
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1A289BAB;
	Sat, 11 May 2019 21:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C619489A32
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:34 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16EB9529;
 Sat, 11 May 2019 23:07:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-link operation
Date: Sun, 12 May 2019 00:06:54 +0300
Message-Id: <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608852;
 bh=Vy6ECXUHgTnstWUXdhj+axgJ3SeJtey0vjQ8XV95J84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NHbBWE3nFg0brkDS5AqeO6ris9pXWZPrvmblVr9+22uVqvdqYTMwA8NatQB+a2mEI
 9EPmRJQLkIu5A5cwrZXQeBEbDMrNDqOTICfGbuQT8OUjAjRoeDjW83T5LMvT4G5WXr
 WGGh6NLx1+IIy4a3JYASe4EtgmjHI+oj7bRX6CkE=
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
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFRIQzYzTFZEMTAyNCBMVkRTIGRlY29kZXIgY2FuIG9wZXJhdGUgaW4gdHdvIG1vZGVzLCBz
aW5nbGUtbGluayBvcgpkdWFsLWxpbmsuIEluIGR1YWwtbGluayBtb2RlIGJvdGggaW5wdXQgcG9y
dHMgYXJlIHVzZWQgdG8gY2FycnkgZXZlbi0KYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgc2VwYXJh
dGVseS4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgRFQgYmluZGluZ3MsCmFsb25nIHdpdGggdGhlIHJl
bGF0ZWQgcnVsZXMgZ292ZXJuaW5nIHBvcnQgYW5kIHVzYWdlLgoKU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
ClJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0t
LQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkMTAyNC50eHQgICAg
ICAgICAgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aGluZSx0aGM2M2x2ZDEwMjQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkMTAyNC50eHQKaW5kZXggMzdmMGMwNGQ1YTI4
Li5kMTdkMWU1ODIwZDcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEwMjQudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEw
MjQudHh0CkBAIC0yOCw2ICsyOCwxMiBAQCBPcHRpb25hbCB2aWRlbyBwb3J0IG5vZGVzOgogLSBw
b3J0QDE6IFNlY29uZCBMVkRTIGlucHV0IHBvcnQKIC0gcG9ydEAzOiBTZWNvbmQgZGlnaXRhbCBD
TU9TL1RUTCBwYXJhbGxlbCBvdXRwdXQKIAorVGhlIGRldmljZSBjYW4gb3BlcmF0ZSBpbiBzaW5n
bGUtbGluayBtb2RlIG9yIGR1YWwtbGluayBtb2RlLiBJbiBzaW5nbGUtbGluaworbW9kZSwgYWxs
IHBpeGVscyBhcmUgcmVjZWl2ZWQgb24gcG9ydEAwLCBhbmQgcG9ydEAxIHNoYWxsIG5vdCBjb250
YWluIGFueQorZW5kcG9pbnQuIEluIGR1YWwtbGluayBtb2RlLCBldmVuLW51bWJlcmVkIHBpeGVs
cyBhcmUgcmVjZWl2ZWQgb24gcG9ydEAwIGFuZAorb2RkLW51bWJlcmVkIHBpeGVscyBvbiBwb3J0
QDEsIGFuZCBib3RoIHBvcnRAMCBhbmQgcG9ydEAxIHNoYWxsIGNvbnRhaW4KK2VuZHBvaW50cy4K
KwogRXhhbXBsZToKIC0tLS0tLS0tCiAKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
