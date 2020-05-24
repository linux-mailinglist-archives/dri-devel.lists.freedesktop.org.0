Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD41E07B6
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F6A89D64;
	Mon, 25 May 2020 07:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D59F89BF3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 19:17:14 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AA8A9FF803;
 Sun, 24 May 2020 19:17:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Sun, 24 May 2020 21:17:09 +0200
Message-Id: <20200524191709.29417-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512075733.745374-3-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d00358d7a1c50718232799e1ee10955bcd73795a
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTA1LTEyIGF0IDA3OjU3OjMzIFVUQywgPT91dGYtOD9xPz1DMz04MWx2YXJv
X0Zlcm49QzM9QTFuZGV6X1JvamFzPz0gd3JvdGU6Cj4gVGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0
ZXMgOCBvb2Igc2VjdGlvbnM6Cj4gUzEJMS01Cj4gRUNDCTYtOAo+IFMyCTktMTUKPiBTMwkxNi0y
MQo+IEVDQwkyMi0yNAo+IFM0CTI1LTMxCj4gUzUJMzItMzcKPiBFQ0MJMzgtNDAKPiBTNgk0MS00
Nwo+IFM3CTQ4LTUzCj4gRUNDCTU0LTU2Cj4gUzgJNTctNjMKPiAKPiBDaGFuZ2UgaXQgYnkgbWVy
Z2luZyBjb250aW51b3VzIHNlY3Rpb25zOgo+IFMxCTEtNQo+IEVDQwk2LTgKPiBTMgk5LTIxCj4g
RUNDCTIyLTI0Cj4gUzMJMjUtMzcKPiBFQ0MJMzgtNDAKPiBTNAk0MS01Mwo+IEVDQwk1NC01Ngo+
IFM1CTU3LTYzCj4gCj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxu
b2x0YXJpQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1p
cXVlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
