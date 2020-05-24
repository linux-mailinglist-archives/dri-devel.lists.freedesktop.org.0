Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820C1E07CE
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091CA89D84;
	Mon, 25 May 2020 07:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B06589BF3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 19:17:05 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 29EA3240002;
 Sun, 24 May 2020 19:16:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Sun, 24 May 2020 21:16:58 +0200
Message-Id: <20200524191658.29742-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512082451.771212-1-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dcb351c03f2fa6a599de1061b174167e03ee312b
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

T24gVHVlLCAyMDIwLTA1LTEyIGF0IDA4OjI0OjUxIFVUQywgPT91dGYtOD9xPz1DMz04MWx2YXJv
X0Zlcm49QzM9QTFuZGV6X1JvamFzPz0gd3JvdGU6Cj4gVGhlIGN1cnJlbnQgY29kZSBjaGVja3Mg
dGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2VkLgo+IFRoaXMgaXMgYSBwcm9ibGVtIHdo
ZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CLCBzaW5jZSBpdCB3aWxs
Cj4gZmFpbCBkdWUgdG8gdGhlIHVzYWJsZSBPT0IgYnl0ZXMgbm90IGJlaW5nIDB4ZmYuCj4gQ29y
cmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFuZCBFQ0MgYnl0ZXMgYXJlbid0
IDB4ZmYuCj4gCj4gRml4ZXM6IDAyYjg4ZWVhOWY5YyAoIm10ZDogYnJjbW5hbmQ6IEFkZCBjaGVj
ayBmb3IgZXJhc2VkIHBhZ2UgYml0ZmxpcHMiKQo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVy
bsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9u
ZXh0LCB0aGFua3MuCgpNaXF1ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
