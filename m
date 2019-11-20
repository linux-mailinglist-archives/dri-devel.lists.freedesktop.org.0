Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CD104D03
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713C6EB6F;
	Thu, 21 Nov 2019 07:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1B36E784
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 17:10:45 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/3] dt-bindings: panel: Document Frida FRD350H54004 LCD panel
Date: Wed, 20 Nov 2019 18:10:26 +0100
Message-Id: <20191120171027.1102250-2-paul@crapouillou.net>
In-Reply-To: <20191120171027.1102250-1-paul@crapouillou.net>
References: <20191120171027.1102250-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574269836; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p087/TKJl58xmr/mCSc7t3gOix/8kRa6rUsT9WmaGBM=;
 b=I3GBVEvwvIQNliiFmT8oB4T//hCyBmlIDicuGsFWwhUWRivLfTvy2t4zpHbIUg4sjFOewl
 sptUJLsJ2nj7beoscoWDSbTNfyISQ5gqnL27m3Os+tN6scydL7wx6Q1hVysRX9qxRi0tEb
 DUL/srmrAKsORGnSDQNF9jcI5fYXWOg=
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
eGVscykgMjQtYml0ClRGVCBMQ0QgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9m
cmlkYSxmcmQzNTBoNTQwMDQudHh0ICAgIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2ZyaWRhLGZyZDM1MGg1NDAwNC50eHQKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9mcmlkYSxmcmQzNTBoNTQwMDQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvZnJpZGEsZnJkMzUwaDU0MDA0LnR4dApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjg0MjhmOGIwNWI5MwotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2ZyaWRhLGZy
ZDM1MGg1NDAwNC50eHQKQEAgLTAsMCArMSwxMiBAQAorRnJpZGEgMy41IiAoMzIweDI0MCBwaXhl
bHMpIDI0LWJpdCBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBh
dGlibGU6IHNob3VsZCBiZSAiZnJpZGEsZnJkMzUwaDU0MDA0IgorLSBwb3dlci1zdXBwbHk6IGFz
IHNwZWNpZmllZCBpbiB0aGUgYmFzZSBiaW5kaW5nCisKK09wdGlvbmFsIHByb3BlcnRpZXM6Cist
IGJhY2tsaWdodDogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRpbmcKKy0gZW5hYmxlLWdw
aW9zOiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZworCitUaGlzIGJpbmRpbmcgaXMg
Y29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lm
aWVkCitpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgotLSAKMi4yNC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
