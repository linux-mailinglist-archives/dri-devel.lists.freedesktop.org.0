Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E62C873
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6589E43;
	Tue, 28 May 2019 14:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842589E43
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 344FEFA6;
 Tue, 28 May 2019 16:13:13 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add renesas,
 companion property
Date: Tue, 28 May 2019 17:12:28 +0300
Message-Id: <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052800;
 bh=FZ8tKX+2q1d7L1Zf9S1cHwyrJV63lrUPbAQjyzA0qCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aNM9B/r3o8jlujv6PAOrZvBaBXBTZ8opUqlV39Ib12AX0LOO1LHAxLOu/Z7Hsto+g
 4E6rljwJSYmIHP2WqiY5hfMbs6flW402kSN8r2+JJXgW1rNLbuYoV8bp7nLl/JesDJ
 4ys2tgvHOXKGJtbZ0nIXpFg/KaP+0+FTitmI9fXs=
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
 Jacopo Mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
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
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+ClJldmll
d2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3JnPgpUZXN0ZWQtYnk6IEphY29w
byBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCkNoYW5nZXMgc2luY2UgdjI6
CgotIENsYXJpZnkgd2hlbiB0aGUgY29tcGFuaW9uIHByb3BlcnR5IGlzIHJlcXVpcmVkIG9yIG5v
dCBhbGxvd2VkCgpDaGFuZ2VzIHNpbmNlIHYxOgoKLSBGaXhlZCB0eXBvCi0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCAgICB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Jl
bmVzYXMsbHZkcy50eHQKaW5kZXggOTAwYTg4NGFkOWY1Li4yZDI0YmQ4Y2JlYzUgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5l
c2FzLGx2ZHMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0CkBAIC00NSw2ICs0NSwxMyBAQCBPRiBncmFwaCBi
aW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dy
YXBoLnR4dC4KIAogRWFjaCBwb3J0IHNoYWxsIGhhdmUgYSBzaW5nbGUgZW5kcG9pbnQuCiAKK09w
dGlvbmFsIHByb3BlcnRpZXM6CisKKy0gcmVuZXNhcyxjb21wYW5pb24gOiBwaGFuZGxlIHRvIHRo
ZSBjb21wYW5pb24gTFZEUyBlbmNvZGVyLiBUaGlzIHByb3BlcnR5IGlzCisgIG1hbmRhdG9yeSBm
b3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMgU29DcywgYW5kIHNoYWxsIHBv
aW50IHRvCisgIHRoZSBzZWNvbmQgZW5jb2RlciB0byBiZSB1c2VkIGFzIGEgY29tcGFuaW9uIGlu
IGR1YWwtbGluayBtb2RlLiBJdCBzaGFsbCBub3QKKyAgYmUgc2V0IGZvciBhbnkgb3RoZXIgTFZE
UyBlbmNvZGVyLgorCiAKIEV4YW1wbGU6CiAKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
