Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3759A23
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943EE6E8FB;
	Fri, 28 Jun 2019 12:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78336E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:12:39 +0000 (UTC)
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgpk3-0005BZ-Ab; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgpk0-0004zn-Ck; Fri, 28 Jun 2019 09:12:32 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 8/9] drm: fix a reference for a renamed file: fb/modedb.rst
Date: Fri, 28 Jun 2019 09:12:30 -0300
Message-Id: <987e1d181a3512b14ffb6702a6f1ad9a22ae8898.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xgArw+nVtTXG7oezfdfD4Z1XiVxNfU8kA8v4SVH+Er8=; b=ITumh1hpTD7+B/EVZ6n1CFKo08
 GNhFv/qVUqvbCJ19/XtqTJnqth9v62XTiYrepBljgdrmRc7+HFU5dBP5gx+Hfli6bxFuht1r0ng72
 /sUimSqZA8hTpjawzsXch+hPAzngWgViX2d4EZrfM7RQ9XV9y1ijq5zaSRhnESpyThpmGIXY+rTfP
 FEzKpW77yh6bBHQRebCxcOU0E/s6bUt8oLNG+/w4R0LCICmrYay1RcIeK1+9nySeyWoUtaIRr551o
 GlXKxxFscTw5LxxYUkI+qjzU+jXmQIYOxglnckumXrXx78cDnX+zTJChsCeyvdC8E9Qrux7fA4TZC
 E/KTlIaQ==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHVlIHRvIHR3byBwYXRjaGVzIGJlaW5nIGFwcGxpZWQgYWJvdXQgdGhlIHNhbWUgdGltZSwgdGhl
CnJlZmVyZW5jZSBmb3IgbW9kZWRiLnJzdCBmaWxlIGdvdCB3cm9uZzoKCglEb2N1bWVudGF0aW9u
L2ZiL21vZGVkYi50eHQgaXMgbm93IERvY3VtZW50YXRpb24vZmIvbW9kZWRiLnJzdC4KCkZpeGVz
OiAxYmY0ZTA5MjI3YzMgKCJkcm0vbW9kZXM6IEFsbG93IHRvIHNwZWNpZnkgcm90YXRpb24gYW5k
IHJlZmxlY3Rpb24gb24gdGhlIGNvbW1hbmRsaW5lIikKRml4ZXM6IGFiNDJiODE4OTU0YyAoImRv
Y3M6IGZiOiBjb252ZXJ0IGRvY3MgdG8gUmVTVCBhbmQgcmVuYW1lIHRvICoucnN0IikKU2lnbmVk
LW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKaW5kZXggNTdl
NjQwODI4OGM4Li40NjQ1YWY2ODFlZjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE2ODAsNyArMTY4
MCw3IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKGNoYXIgKnN0
ciwgc2l6ZV90IGxlbiwKICAqCiAgKiBBZGRpdGlvbmFscyBvcHRpb25zIGNhbiBiZSBwcm92aWRl
ZCBmb2xsb3dpbmcgdGhlIG1vZGUsIHVzaW5nIGEgY29tbWEgdG8KICAqIHNlcGFyYXRlIGVhY2gg
b3B0aW9uLiBWYWxpZCBvcHRpb25zIGNhbiBiZSBmb3VuZCBpbgotICogRG9jdW1lbnRhdGlvbi9m
Yi9tb2RlZGIudHh0LgorICogRG9jdW1lbnRhdGlvbi9mYi9tb2RlZGIucnN0LgogICoKICAqIFRo
ZSBpbnRlcm1lZGlhdGUgZHJtX2NtZGxpbmVfbW9kZSBzdHJ1Y3R1cmUgaXMgcmVxdWlyZWQgdG8g
c3RvcmUgYWRkaXRpb25hbAogICogb3B0aW9ucyBmcm9tIHRoZSBjb21tYW5kIGxpbmUgbW9kbGlu
ZSBsaWtlIHRoZSBmb3JjZS1lbmFibGUvZGlzYWJsZSBmbGFnLgotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
