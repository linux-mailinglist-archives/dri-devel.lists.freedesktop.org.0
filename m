Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8657EEC5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7536ED03;
	Fri,  2 Aug 2019 08:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A28156ECDC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:39:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151124"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:41 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 47DFA4007528;
 Fri,  2 Aug 2019 16:34:38 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas, swap-data
Date: Fri,  2 Aug 2019 08:33:59 +0100
Message-Id: <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ui1DYXIgRDMsIFItQ2FyIEUzLCBhbmQgUlovRzJFIHN1cHBvcnQgZHVhbC1saW5rIG1vZGUuCklu
IHN1Y2ggYSBtb2RlLCB0aGUgZmlyc3QgTFZEUyBlbmNvZGVyIGVtaXRzIGV2ZW4gZGF0YSwgYW5k
IHRoZQpzZWNvbmQgTFZEUyBlbmNvZGVyIGVtaXRzIG9kZCBkYXRhLiBUaGlzIHBhdGNoIGRvY3Vt
ZW50cyBwcm9wZXJ0eQpyZW5lc2FzLHN3YXAtZGF0YSwgdXNlZCB0byBzd2FwIGV2ZW4gYW5kIG9k
ZCBkYXRhIGFyb3VuZC4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8u
Y2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IHwgNSArKysrKwogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQK
aW5kZXggZGVjZTc5ZS4uODk4MDE3OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50
eHQKQEAgLTUyLDYgKzUyLDExIEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6CiAgIG1hbmRhdG9yeSBm
b3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9H
MkUgU29DcywKICAgYW5kIHNoYWxsIHBvaW50IHRvIHRoZSBzZWNvbmQgZW5jb2RlciB0byBiZSB1
c2VkIGFzIGEgY29tcGFuaW9uIGluIGR1YWwtbGluawogICBtb2RlLiBJdCBzaGFsbCBub3QgYmUg
c2V0IGZvciBhbnkgb3RoZXIgTFZEUyBlbmNvZGVyLgorLSByZW5lc2FzLHN3YXAtZGF0YSA6IHdo
ZW4gaW4gZHVhbC1saW5rIG1vZGUsIHRoZSBmaXJzdCBMVkRTIGVuY29kZXIgbm9ybWFsbHkKKyAg
ZW1pdHMgZXZlbiBkYXRhLCBhbmQgdGhlIHNlY29uZCBMVkRTIGVuY29kZXIgZW1pdHMgb2RkIGRh
dGEuIFdoZW4gcHJvcGVydHkKKyAgcmVuZXNhcyxzd2FwLWRhdGEgaXMgc3BlY2lmaWVkLCB0aGUg
ZGF0YSBlbWl0dGVkIGJ5IHRoZSB0d28gZW5jb2RlcnMgd2lsbCBiZQorICBzd2FwcGVkIGFyb3Vu
ZC4gVGhpcyBwcm9wZXJ0eSBjYW4gb25seSBiZSB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggcHJv
cGVydHkKKyAgcmVuZXNhcyxjb21wYW5pb24uCiAKIAogRXhhbXBsZToKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
