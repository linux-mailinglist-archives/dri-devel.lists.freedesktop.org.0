Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091C8C1DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 22:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB236E149;
	Tue, 13 Aug 2019 20:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B936E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 20:11:13 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FCB255F;
 Tue, 13 Aug 2019 22:11:09 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/9] dt-bindings: Add legacy 'toppoly' vendor prefix
Date: Tue, 13 Aug 2019 23:10:54 +0300
Message-Id: <20190813201101.30980-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813201101.30980-1-laurent.pinchart@ideasonboard.com>
References: <20190813201101.30980-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565727069;
 bh=V4ozzh1hioS73xagv+aI8iIBf0fGrvZG9dPJDFZDRxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U1H2stOiDR3pBETZxQ9cw11OEBA7aGoh31Si1ZmnQO6kUmIQs0FYe+PVLx04R5l8W
 j0nmYBhbWy7qY1+kSrcgHt0lNfifRnuXcnGiFhAthSfpdgetwlWuIGDCKkDinGZmVf
 KCMugB0kAjEMknUlD+gC/rAuDeNoo2B9i0pVt2DQ=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICd0b3Bwb2x5JyB2ZW5kb3IgcHJlZml4IGlzIGluIHVzZSBhbmQgcmVmZXJzIHRvIFRQTywg
d2hvc2UgRFQgdmVuZG9yCnByZWZpeCBpcyBhbHJlYWR5IGRlZmluZWQgYXMgJ3RwbycuIEFkZCAn
dG9wcG9seScgYXMgYW4gYWx0ZXJuYXRpdmUgYW5kCmRvY3VtZW50IGl0IGFzIGxlZ2FjeS4KClNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQpD
aGFuZ2VzIHNpbmNlIHYxOgoKLSBNYXJrIHRoZSBwcmVmaXggYXMgZGVwcmVjYXRlZAotLS0KIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCmluZGV4IDVl
ZmRkYmZmMjQzMC4uMjlkY2M2ZjhhNjRhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCkBAIC05MzUsNiArOTM1LDkg
QEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgZGVzY3JpcHRpb246IFRlY29uIE1pY3JvcHJvY2Vz
c29yIFRlY2hub2xvZ2llcywgTExDLgogICAiXnRvcGVldCwuKiI6CiAgICAgZGVzY3JpcHRpb246
IFRvcGVldAorICAiXnRvcHBvbHksLioiOgorICAgIGRlc2NyaXB0aW9uOiBUUE8gKGRlcHJlY2F0
ZWQsIHVzZSB0cG8pCisgICAgZGVwcmVjYXRlZDogdHJ1ZQogICAiXnRvcmFkZXgsLioiOgogICAg
IGRlc2NyaXB0aW9uOiBUb3JhZGV4IEFHCiAgICJedG9zaGliYSwuKiI6Ci0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
