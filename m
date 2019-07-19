Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C837E6E84D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 17:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54F66E850;
	Fri, 19 Jul 2019 15:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D176E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 15:59:38 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55144
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hoVIG-0001bQ-3d; Fri, 19 Jul 2019 17:59:36 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/11] drm: Add SPI connector type
Date: Fri, 19 Jul 2019 17:59:06 +0200
Message-Id: <20190719155916.62465-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719155916.62465-1-noralf@tronnes.org>
References: <20190719155916.62465-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=nhmumVVvNh7BdjiMBwTZoalNEJ0FRPDcl6vMmzslpPA=; 
 b=OnVzqYYfJCz/hTf2g9o8Sk5a2fiCDsi2xabAUWmmcZNBaBoXFTtae0qAsVYToYJgtJfylUlq7v8g7POHBra82Izn8Y8ptEoMYWjnDuoX02A1QKHagptoJSlxtiFDAUCI3y96YUO5zFOabO0728bHnNRJS9DCiQnMA4NbfAdhidapODTnypOPaUWQcJwiK8EhBT5Pqwa0QE/IejrtjI59eLr7lZH4Mmny9Jjv3Ta2eseNd+gA8LOeHK/GUdv4UKL0YZmOJSLoBpiKyF1b0WXzq+PVH6JL93elnIxzQwVe6rXShVsoTUH/FOo6ZL7bhs80F7LThK9dg0pKE+vmQiAa7Q==;
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, sam@ravnborg.org,
 david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGlueWRybSBkcml2ZXJzIGFubm91bmNlIERSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMIGZvciBp
dHMgU1BJIGRyaXZlcnMuCkFkZCBhIFNQSSBjb25uZWN0b3IgdHlwZSB0byBtYXRjaCB0aGUgYWN0
dWFsIGNvbm5lY3Rvci4KClggd2lsbCBsaXN0IHRoZSBjb25uZWN0b3IgYXMgVW5rbm93bjoKClgu
T3JnIFggU2VydmVyIDEuMTkuMgpSZWxlYXNlIERhdGU6IDIwMTctMDMtMDIKPC4uLj4KWyA1MzUy
My45MDVdIChJSSkgbW9kZXNldCgwKTogT3V0cHV0IFVua25vd24xOS0xIGhhcyBubyBtb25pdG9y
IHNlY3Rpb24KWyA1MzUyMy45MDhdIChJSSkgbW9kZXNldCgwKTogRURJRCBmb3Igb3V0cHV0IFVu
a25vd24xOS0xClsgNTM1MjMuOTEwXSAoSUkpIG1vZGVzZXQoMCk6IFByaW50aW5nIHByb2JlZCBt
b2RlcyBmb3Igb3V0cHV0IFVua25vd24xOS0xClsgNTM1MjMuOTExXSAoSUkpIG1vZGVzZXQoMCk6
IE1vZGVsaW5lICIzMjB4MjQwIngwLjAgICAgMC4wMCAgMzIwIDMyMCAzMjAgMzIwICAyNDAgMjQw
IDI0MCAyNDAgKDAuMCBrSHogZVApClsgNTM1MjMuOTExXSAoSUkpIG1vZGVzZXQoMCk6IE91dHB1
dCBVbmtub3duMTktMSBjb25uZWN0ZWQKWyA1MzUyMy45MTJdIChJSSkgbW9kZXNldCgwKTogVXNp
bmcgZXhhY3Qgc2l6ZXMgZm9yIGluaXRpYWwgbW9kZXMKWyA1MzUyMy45MTJdIChJSSkgbW9kZXNl
dCgwKTogT3V0cHV0IFVua25vd24xOS0xIHVzaW5nIGluaXRpYWwgbW9kZSAzMjB4MjQwICswKzAK
ClRoZSB3ZXN0b24gc291cmNlIHNob3dzIHRoYXQgaXQgd2lsbCBiZSBsaXN0ZWQgYXMgVU5OQU1F
RC4KCnYyOiBTcGxpdCBwYXRjaCBpbiBjb3JlIGFuZCBkcml2ZXIgY2hhbmdlcywgZXhwYW5kIGNv
bW1pdCBtZXNzYWdlIChEYW5pZWwpCgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNr
ZWQtYnk6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgpTaWduZWQtb2ZmLWJ5
OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jIHwgMSArCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAg
IHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jCmluZGV4IDA2OGQ0YjA1ZjFiZS4uY2JiNTQ4YjM3MDhmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29u
bmVjdG9yLmMKQEAgLTkyLDYgKzkyLDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fY29ubl9wcm9wX2Vu
dW1fbGlzdCBkcm1fY29ubmVjdG9yX2VudW1fbGlzdFtdID0gewogCXsgRFJNX01PREVfQ09OTkVD
VE9SX0RTSSwgIkRTSSIgfSwKIAl7IERSTV9NT0RFX0NPTk5FQ1RPUl9EUEksICJEUEkiIH0sCiAJ
eyBEUk1fTU9ERV9DT05ORUNUT1JfV1JJVEVCQUNLLCAiV3JpdGViYWNrIiB9LAorCXsgRFJNX01P
REVfQ09OTkVDVE9SX1NQSSwgIlNQSSIgfSwKIH07CiAKIHZvaWQgZHJtX2Nvbm5lY3Rvcl9pZGFf
aW5pdCh2b2lkKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5j
bHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCmluZGV4IDVhYjMzMWU1ZGMyMy4uNzM1YzhjZmRhYWEx
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKKysrIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fbW9kZS5oCkBAIC0zNjEsNiArMzYxLDcgQEAgZW51bSBkcm1fbW9kZV9zdWJj
b25uZWN0b3IgewogI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfRFNJCQkxNgogI2RlZmluZSBE
Uk1fTU9ERV9DT05ORUNUT1JfRFBJCQkxNwogI2RlZmluZSBEUk1fTU9ERV9DT05ORUNUT1JfV1JJ
VEVCQUNLCTE4CisjZGVmaW5lIERSTV9NT0RFX0NPTk5FQ1RPUl9TUEkJCTE5CiAKIHN0cnVjdCBk
cm1fbW9kZV9nZXRfY29ubmVjdG9yIHsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
