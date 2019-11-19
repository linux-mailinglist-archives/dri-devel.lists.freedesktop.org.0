Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE810302A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B656E9FD;
	Tue, 19 Nov 2019 23:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B66E311
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:28:20 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/6] dt-bindings: display/ingenic: Add compatible string for
 JZ4770
Date: Tue, 19 Nov 2019 15:17:31 +0100
Message-Id: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173064; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=GwQs/I34Gsxl3SkZJ9TndJzpKGHdtrRU8KhsXh5z6T4=;
 b=mrT2mpYFDmFwKTDD8Mwz02JbRJsC+rlA44Wx0jWx/ZCxD8LzKabuLh4MZBcahZ6u36KNDr
 4D8N75NLGhtHVfWL5A5y1HSHCs5e9xDnwNA5dc3fPzVd9ik5qVydB7ZlnN2fHX0NDF8rOJ
 fs9NcFPmUx1lWMwqSdeTyViKojNa8Lc=
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

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBMQ0QgY29udHJvbGxlciBmb3VuZCBpbiB0
aGUgSlo0NzcwIFNvQy4KClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2luZ2VuaWMsbGNkLnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW5n
ZW5pYyxsY2QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
aW5nZW5pYyxsY2QudHh0CmluZGV4IDdiNTM2YzhjNmRkZS4uMDFlMzI2MWRlZmI2IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbmdlbmljLGxj
ZC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvaW5n
ZW5pYyxsY2QudHh0CkBAIC00LDYgKzQsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBjb21w
YXRpYmxlOiBvbmUgb2Y6CiAgICogaW5nZW5pYyxqejQ3NDAtbGNkCiAgICogaW5nZW5pYyxqejQ3
MjViLWxjZAorICAqIGluZ2VuaWMsano0NzcwLWxjZAogLSByZWc6IExDRCByZWdpc3RlcnMgbG9j
YXRpb24gYW5kIGxlbmd0aAogLSBjbG9ja3M6IExDRCBwaXhjbG9jayBhbmQgZGV2aWNlIGNsb2Nr
IHNwZWNpZmllcnMuCiAJICAgVGhlIGRldmljZSBjbG9jayBpcyBvbmx5IHJlcXVpcmVkIG9uIHRo
ZSBKWjQ3NDAuCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
