Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF329B814
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 23:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583A96ED3D;
	Fri, 23 Aug 2019 21:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6F6ED3D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 21:24:05 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 764302B2;
 Fri, 23 Aug 2019 23:24:03 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ingenic: Hardcode panel type to DPI
Date: Sat, 24 Aug 2019 00:23:53 +0300
Message-Id: <20190823212353.29369-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566595443;
 bh=QzwdrbR/rKkFWGsStFcMnyNotZ9xFIffms2XPFBdgo8=;
 h=From:To:Cc:Subject:Date:From;
 b=X5xp9Dl2MpS8LjOFMLY92iJnKaHouRjmTMnwXDgoV9aCzfJU8W6ptSLzqOaFeqKeE
 NQjVtNj4w+DGqdRvbkrFYPkqJlU7kZT40R3EJq1zqlr4EAuG77mvmGwQiWA3ZxXE7b
 AtMdAbDFzdSBv3GqTYZjSUQcXMHd5E9EaQTuTYsU=
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGluZ2VuaWMgZHJpdmVyIHN1cHBvcnRzIERQSSBwYW5lbHMgb25seSBhdCB0aGUgbW9tZW50
LCBzbyBoYXJkY29kZQp0aGVpciB0eXBlIHRvIERQSSBpbnN0ZWFkIG9mIFVua25vd24uCgpTaWdu
ZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Ci0tLQpQYXVsLCBhcyB0aGUgZHJpdmVyIGhhcyBiZWVuIG1lcmdlZCBpbiB2NS4zLXJj
MSwgdGhpcyBpcyBhIGNhbmRpZGF0ZSBmb3IKYSB2NS4zIGZpeC4gS2VlcGluZyB0aGUgY29ubmVj
dG9yIHR5cGUgYXMgdW5rbm93biBjb3VsZCBjYXVzZSBhCnVzZXJzcGFjZSBkZXBlbmRlbmN5IG9u
IGl0LCBwcmV2ZW50aW5nIGl0IGZyb20gYmVpbmcgY2hhbmdlZCBsYXRlci4KCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIGIvZHJpdmVycy9ncHUvZHJt
L2luZ2VuaWMvaW5nZW5pYy1kcm0uYwppbmRleCBjZTFmYWUzYTc4YTkuLjJlMmVkNjUzZTljNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCkBAIC02NzUsMTAgKzY3NSw5IEBA
IHN0YXRpYyBpbnQgaW5nZW5pY19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlpZiAocGFuZWwpIHsKKwlpZiAocGFuZWwpCiAJCWJy
aWRnZSA9IGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoZGV2LCBwYW5lbCwKLQkJCQkJCSAgIERS
TV9NT0RFX0NPTk5FQ1RPUl9Vbmtub3duKTsKLQl9CisJCQkJCQkgICBEUk1fTU9ERV9DT05ORUNU
T1JfRFBJKTsKIAogCXByaXYtPmRtYV9od2Rlc2MgPSBkbWFfYWxsb2NfY29oZXJlbnQoZGV2LCBz
aXplb2YoKnByaXYtPmRtYV9od2Rlc2MpLAogCQkJCQkgICAgICAmcHJpdi0+ZG1hX2h3ZGVzY19w
aHlzLAotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
