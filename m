Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E6CCB34
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE44D6E397;
	Sat,  5 Oct 2019 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22436EC1C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:09:50 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82tdd3x2KJk="
X-RZG-CLASS-ID: mo00
Received: from groucho.site by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id i07086v94J9EcdY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Fri, 4 Oct 2019 21:09:14 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com
Subject: [PATCH v19 1/2] Documentation: bridge: Add documentation for ps8640
 DT properties
Date: Fri,  4 Oct 2019 21:09:07 +0200
Message-Id: <1570216148-22802-2-git-send-email-uli@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570216148-22802-1-git-send-email-uli@fpond.eu>
References: <1570216148-22802-1-git-send-email-uli@fpond.eu>
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570216188; 
 s=strato-dkim-0002; d=fpond.eu;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=e7Uk4dL2nxqLZgp4qDJcGqjX0Y1/EQyvkzzozndC2zk=;
 b=Mo5QRe8m3PQhXtkOXr9D44dxLZxQ4qCHwZdfB84BHn2QucBRA7QSfdiC17bj1rNfXd
 m11ByT4dxJxOsM6NP6qStAznIhbKWo97zQeUXgzbZc9vsPXkQ4SiTK0OgN9qQ9THQPFj
 DFBTEFnmy4w6TugtWzrWScSfFWGcz826XR6wLd2ZzVWHDyz8MLZ9+6eyVNJ1k6e1yXWo
 wERQVi80K96/SSFxnovF/f8ODD9GhQIQvPik6bOG0U/f/VWqMPmaoUmfTsAyjqAP44oY
 R/e2DbxmaPAsqjDjMU8HGOLMuT2Py/mbc/bhwK9htd1C/gZGFdqHNrZ0CneJ0bWX9IO3
 pTAQ==
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
Cc: mark.rutland@arm.com, Ulrich Hecht <uli@fpond.eu>, stonea168@163.com,
 ajaykumar.rs@samsung.com, architt@codeaurora.org, vpalatin@chromium.org,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, devicetree@vger.kernel.org,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 seanpaul@chromium.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com,
 rahul.sharma@samsung.com, kernel@pengutronix.de, galak@codeaurora.org,
 enric.balletbo@collabora.com, andy.yan@rock-chips.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgoKQWRkIGRvY3VtZW50YXRp
b24gZm9yIERUIHByb3BlcnRpZXMgc3VwcG9ydGVkIGJ5CnBzODY0MCBEU0ktZURQIGNvbnZlcnRl
ci4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KQWNr
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBQaGlsaXBw
IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBVbHJpY2ggSGVj
aHQgPHVsaUBmcG9uZC5ldT4KLS0tCgpDaGFuZ2VzIHNpbmNlIHYxODoKIC0gTm8gY2hhbmdlLgoK
Q2hhbmdlcyBzaW5jZSB2MTc6CiAtIE5vIGNoYW5nZS4KCkNoYW5nZXMgc2luY2UgdjE2OgogLSBO
byBjaGFuZ2UuCgpDaGFuZ2VzIHNpbmNlIHYxNToKIC0gTm8gY2hhbmdlLgoKQ2hhbmdlcyBzaW5j
ZSB2MTQ6CiAtIGNoYW5nZSBtb2RlLXNlbC1ncGlvcyBhcyBvcHRpb25hbC4KCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0ICB8IDQ0ICsrKysrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3BzODY0MC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjdiMTNmOTIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dApAQCAtMCwwICsxLDQ0
IEBACitwczg2NDAtYnJpZGdlIGJpbmRpbmdzCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisJLSBj
b21wYXRpYmxlOiAicGFyYWRlLHBzODY0MCIKKwktIHJlZzogZmlyc3QgcGFnZSBhZGRyZXNzIG9m
IHRoZSBicmlkZ2UuCisJLSBzbGVlcC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZp
Y2F0aW9uIGZvciBQRCBwaW4uCisJLSByZXNldC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBz
cGVjaWZpY2F0aW9uIGZvciByZXNldCBwaW4uCisJLSB2ZGQxMi1zdXBwbHk6IE9GIGRldmljZS10
cmVlIHJlZ3VsYXRvciBzcGVjaWZpY2F0aW9uIGZvciAxLjJWIHBvd2VyLgorCS0gdmRkMzMtc3Vw
cGx5OiBPRiBkZXZpY2UtdHJlZSByZWd1bGF0b3Igc3BlY2lmaWNhdGlvbiBmb3IgMy4zViBwb3dl
ci4KKwktIHBvcnRzOiBUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gdmlkZW8gaW50ZXJmYWNl
IHBvcnQgbm9kZXMgcGVyCisJCSB0aGUgdmlkZW8taW50ZXJmYWNlcyBiaW5kWzFdLiBGb3IgcG9y
dEAwLHNldCB0aGUgcmVnID0gPDA+IGFzCisJCSBwczg2NDAgZHNpIGluIGFuZCBwb3J0QDEsc2V0
IHRoZSByZWcgPSA8MT4gYXMgcHM4NjQwIGVEUCBvdXQuCisKK09wdGlvbmFsIHByb3BlcnRpZXM6
CisJLSBtb2RlLXNlbC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9uIGZv
ciBtb2RlLXNlbCBwaW4uCitbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAorCitFeGFtcGxlOgorCWVkcC1icmlkZ2VAMTggewor
CQljb21wYXRpYmxlID0gInBhcmFkZSxwczg2NDAiOworCQlyZWcgPSA8MHgxOD47CisJCXNsZWVw
LWdwaW9zID0gPCZwaW8gMTE2IEdQSU9fQUNUSVZFX0xPVz47CisJCXJlc2V0LWdwaW9zID0gPCZw
aW8gMTE1IEdQSU9fQUNUSVZFX0xPVz47CisJCW1vZGUtc2VsLWdwaW9zID0gPCZwaW8gOTIgR1BJ
T19BQ1RJVkVfSElHSD47CisJCXZkZDEyLXN1cHBseSA9IDwmcHM4NjQwX2ZpeGVkXzF2Mj47CisJ
CXZkZDMzLXN1cHBseSA9IDwmbXQ2Mzk3X3ZncDJfcmVnPjsKKworCQlwb3J0cyB7CisJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCQkJcG9ydEAwIHsKKwkJ
CQlyZWcgPSA8MD47CisJCQkJcHM4NjQwX2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmZHNpMF9vdXQ+OworCQkJCX07CisJCQl9OworCQkJcG9ydEAxIHsKKwkJCQlyZWcg
PSA8MT47CisJCQkJcHM4NjQwX291dDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JnBhbmVsX2luPjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
