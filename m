Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B610F979
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1E6E415;
	Tue,  3 Dec 2019 08:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515DF6E21B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 15:41:46 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/3] dt-bindings: panel: Document Frida FRD350H54004 LCD
 panel
Date: Mon,  2 Dec 2019 16:41:22 +0100
Message-Id: <20191202154123.64139-2-paul@crapouillou.net>
In-Reply-To: <20191202154123.64139-1-paul@crapouillou.net>
References: <20191202154123.64139-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1575301296; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsu8btJZj2fyl7PzBZMzpf5zydLm0yevNz9rkKTMgk8=;
 b=D/3RqVEaQZA1jrix+fzbJ6s9davLxy+oJAZHT52DagrWjdIrA90czYOKKCZ/EdvHRN8tXt
 yTXMJRe8UbjFc6ZqUiCY6BuSed6xoYtO0YlC5ZeeAt2BF+TNiU9afgqtz+YTbFwwxJ55eQ
 KbsVwashSaYHn9dtinwGw2T/d8AKWXQ=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBGcmlkYSAzLjUiICgzMjB4MjQwIHBp
eGVscykgMjQtYml0ClRGVCBMQ0QgcGFuZWwuCgp2MjogU3dpdGNoIGRvY3VtZW50YXRpb24gZnJv
bSBwbGFpbiB0ZXh0IHRvIFlBTUwKClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxA
Y3JhcG91aWxsb3UubmV0PgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2ZyaWRhLGZyZDM1MGg1NDAw
NC55YW1sICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJpZGEsZnJkMzUwaDU0MDA0LnlhbWwKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmlk
YSxmcmQzNTBoNTQwMDQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2ZyaWRhLGZyZDM1MGg1NDAwNC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uYTI5YzNkYWYwYzc4Ci0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJpZGEsZnJkMzUw
aDU0MDA0LnlhbWwKQEAgLTAsMCArMSwzMSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvZGlzcGxheS9wYW5lbC9mcmlkYSxmcmQzNTBoNTQwMDQueWFtbCMKKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogRnJpZGEg
My41IiAoMzIweDI0MCBwaXhlbHMpIDI0LWJpdCBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJz
OgorICAtIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgorICAtIFRoaWVycnkg
UmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBh
bmVsLWNvbW1vbi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0
OiBmcmlkYSxmcmQzNTBoNTQwMDQKKworICBwb3dlci1zdXBwbHk6IHRydWUKKyAgYmFja2xpZ2h0
OiB0cnVlCisgIGVuYWJsZS1ncGlvczogdHJ1ZQorICBwb3J0OiB0cnVlCisKK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93ZXIt
c3VwcGx5CisKKy4uLgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
