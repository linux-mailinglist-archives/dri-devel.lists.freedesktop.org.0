Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482733FA3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2172895EE;
	Tue,  4 Jun 2019 07:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12489298
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:31:30 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 1/3] dt-bindings: display: Add Sharp LS020B1DD01D panel
 documentation
Date: Mon,  3 Jun 2019 17:31:18 +0200
Message-Id: <20190603153120.23947-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559575888; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=uqw+loJDBYbFYQqYGaC7AgrbhaPx2dBiWAbskkMwnAE=;
 b=Lzo8h5Mhjx10SXMdCLjNrUNcc053z1k0maYS8iIXoJ3seRnpmhRxUY+5iSW4wJPV8bXZ/2
 BZ/OpzCFgMW4pwfuxESUaIl5AmyP8W0EAsVSQs1603t4x2VxvazF5PA7l5EprtsCay3TRg
 rQPL1KRXNNr8qwV+IprGND0syoFjZmU=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExTMDIwQjFERDAxRCBpcyBhIDIuMCIgMjQweDE2MCAxNi1iaXQgVEZUIExDRCBwYW5lbC4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgpSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCgpOb3RlczoKICAgIHYy
OiBOZXcgcGF0Y2gKICAgIAogICAgdjM6IEFkZCBSb2IncyBSZXZpZXdlZC1ieQogICAgCiAgICB2
NDogUmViYXNlIG9uIGRybS1taXNjLW5leHQgKGIyMzJkNGVkOTJlYSkKCiAuLi4vYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9zaGFycCxsczAyMGIxZGQwMWQudHh0ICAgIHwgMTIgKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxzMDIw
YjFkZDAxZC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9zaGFycCxsczAyMGIxZGQwMWQudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHMwMjBiMWRkMDFkLnR4dApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmU0NWVkYmM1NjVhMwotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3NoYXJwLGxzMDIwYjFkZDAxZC50eHQKQEAgLTAsMCArMSwxMiBAQAorU2hhcnAgMi4w
IiAoMjQweDE2MCBwaXhlbHMpIDE2LWJpdCBURlQgTENEIHBhbmVsCisKK1JlcXVpcmVkIHByb3Bl
cnRpZXM6CistIGNvbXBhdGlibGU6IHNob3VsZCBiZSAic2hhcnAsbHMwMjBiMWRkMDFkIgorLSBw
b3dlci1zdXBwbHk6IGFzIHNwZWNpZmllZCBpbiB0aGUgYmFzZSBiaW5kaW5nCisKK09wdGlvbmFs
IHByb3BlcnRpZXM6CistIGJhY2tsaWdodDogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNlIGJpbmRp
bmcKKy0gZW5hYmxlLWdwaW9zOiBhcyBzcGVjaWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZworCitU
aGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywg
d2hpY2ggaXMgc3BlY2lmaWVkCitpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5
LgotLSAKMi4yMS4wLjU5My5nNTExZWMzNDVlMTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
