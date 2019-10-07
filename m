Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC03CF3C4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884EC6E1F5;
	Tue,  8 Oct 2019 07:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DA06E4C4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 08:23:14 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82Ncd3IXOg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id i07086v978MZfth
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Mon, 7 Oct 2019 10:22:35 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com
Subject: [PATCH v20 1/2] Documentation: bridge: Add documentation for ps8640
 DT properties
Date: Mon,  7 Oct 2019 10:22:28 +0200
Message-Id: <1570436549-8694-2-git-send-email-uli@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570436549-8694-1-git-send-email-uli@fpond.eu>
References: <1570436549-8694-1-git-send-email-uli@fpond.eu>
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570436593; 
 s=strato-dkim-0002; d=fpond.eu;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=YexszvWfT0YfoC5A4JusxCJ6TgneeRSUsJyagrjGFfw=;
 b=CyJBJ/ZWDprfK5qB4TL0Iv2TRsYpd8nH0BBYNyxWOjZPNi9L3KDt1XzqiRJyoYMhgO
 /KNbVons8XFezfkS7fo/LsXGlm4XPj+I5XJzoyHkcdFh3lc+QaicV1/1fB+2SsXFEif0
 yKIDmkw2nZBAenJSL7HbBJ1UgboD5FzOQYibFQGlfhHK/BP2sjPXq3IqQxN/q2czW0kQ
 Fhs8dLCy5Ju1rklIFe35yFu+3gduOwMvdpWorG45cgvNxpS3CWGvOSO/tFZj2z5OnhHV
 Q27VA2TvuCYRt4XwGFQZyDTnthscmFjVQR1lpNwZly+V/UDh4BfWWog+DsckpaHJJMxb
 UzGQ==
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
aHQgPHVsaUBmcG9uZC5ldT4KLS0tCgpDaGFuZ2VzIHNpbmNlIHYxNToKIC0gTm8gY2hhbmdlLgoK
Q2hhbmdlcyBzaW5jZSB2MTQ6CiAtIGNoYW5nZSBtb2RlLXNlbC1ncGlvcyBhcyBvcHRpb25hbC4K
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0ICB8IDQ0
ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3BzODY0MC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9wczg2NDAudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjdiMTNmOTIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcHM4NjQwLnR4dApA
QCAtMCwwICsxLDQ0IEBACitwczg2NDAtYnJpZGdlIGJpbmRpbmdzCisKK1JlcXVpcmVkIHByb3Bl
cnRpZXM6CisJLSBjb21wYXRpYmxlOiAicGFyYWRlLHBzODY0MCIKKwktIHJlZzogZmlyc3QgcGFn
ZSBhZGRyZXNzIG9mIHRoZSBicmlkZ2UuCisJLSBzbGVlcC1ncGlvczogT0YgZGV2aWNlLXRyZWUg
Z3BpbyBzcGVjaWZpY2F0aW9uIGZvciBQRCBwaW4uCisJLSByZXNldC1ncGlvczogT0YgZGV2aWNl
LXRyZWUgZ3BpbyBzcGVjaWZpY2F0aW9uIGZvciByZXNldCBwaW4uCisJLSB2ZGQxMi1zdXBwbHk6
IE9GIGRldmljZS10cmVlIHJlZ3VsYXRvciBzcGVjaWZpY2F0aW9uIGZvciAxLjJWIHBvd2VyLgor
CS0gdmRkMzMtc3VwcGx5OiBPRiBkZXZpY2UtdHJlZSByZWd1bGF0b3Igc3BlY2lmaWNhdGlvbiBm
b3IgMy4zViBwb3dlci4KKwktIHBvcnRzOiBUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gdmlk
ZW8gaW50ZXJmYWNlIHBvcnQgbm9kZXMgcGVyCisJCSB0aGUgdmlkZW8taW50ZXJmYWNlcyBiaW5k
WzFdLiBGb3IgcG9ydEAwLHNldCB0aGUgcmVnID0gPDA+IGFzCisJCSBwczg2NDAgZHNpIGluIGFu
ZCBwb3J0QDEsc2V0IHRoZSByZWcgPSA8MT4gYXMgcHM4NjQwIGVEUCBvdXQuCisKK09wdGlvbmFs
IHByb3BlcnRpZXM6CisJLSBtb2RlLXNlbC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3BpbyBzcGVj
aWZpY2F0aW9uIGZvciBtb2RlLXNlbCBwaW4uCitbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAorCitFeGFtcGxlOgorCWVkcC1i
cmlkZ2VAMTggeworCQljb21wYXRpYmxlID0gInBhcmFkZSxwczg2NDAiOworCQlyZWcgPSA8MHgx
OD47CisJCXNsZWVwLWdwaW9zID0gPCZwaW8gMTE2IEdQSU9fQUNUSVZFX0xPVz47CisJCXJlc2V0
LWdwaW9zID0gPCZwaW8gMTE1IEdQSU9fQUNUSVZFX0xPVz47CisJCW1vZGUtc2VsLWdwaW9zID0g
PCZwaW8gOTIgR1BJT19BQ1RJVkVfSElHSD47CisJCXZkZDEyLXN1cHBseSA9IDwmcHM4NjQwX2Zp
eGVkXzF2Mj47CisJCXZkZDMzLXN1cHBseSA9IDwmbXQ2Mzk3X3ZncDJfcmVnPjsKKworCQlwb3J0
cyB7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCQkJ
cG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJcHM4NjQwX2luOiBlbmRwb2ludCB7CisJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpMF9vdXQ+OworCQkJCX07CisJCQl9OworCQkJcG9ydEAx
IHsKKwkJCQlyZWcgPSA8MT47CisJCQkJcHM4NjQwX291dDogZW5kcG9pbnQgeworCQkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luPjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKwl9OwotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
