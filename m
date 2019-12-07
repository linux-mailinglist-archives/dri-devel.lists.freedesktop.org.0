Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B4115EF8
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8206E25C;
	Sat,  7 Dec 2019 22:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46566E25C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:24:37 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A99D2467A;
 Sat,  7 Dec 2019 22:24:32 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 02/12] dt-bindings: mediatek: Add compatible for mt7623
Date: Sat,  7 Dec 2019 23:23:39 +0100
Message-Id: <20191207222349.23161-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575757477;
 bh=fQiHeTSkXa+q0MUHJbEeA+eMFm4vY8RORCB2PwtjnWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+jFxMOVR/Le+CyeFYT+Ny2XxmxO2U0qaZL/Aoa39NcnJnz9E7CyJ//4HpjjngsG5
 ap3WFeB76HRfSis+IWf8QafhdlI8yFQU7wR4svAj3i5wwSSEdKDqPHZbdYNofPFZKK
 GCJlxe7j4QUFU2uYTDOKCSHnT1WFT7ADNsL68wE8=
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
Cc: devicetree@vger.kernel.org, rdunlap@infradead.org, frank-w@public-files.de,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpNZWRpYVRlayBtdDc2
MjMgdXNlcyB0aGUgbXQyNzAxIGJpbmluZ3MgYXMgZmFsbGJhY2suCkRvY3VtZW50IHRoaXMgaW4g
dGhlIGJpbmRpbmcgZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2Vy
IDxtYnJ1Z2dlckBzdXNlLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0ICAgICAgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dApp
bmRleCBjNzFjOGE0YjczZmYuLmE3NDc4OTU1NzRmMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZGlzcC50eHQKQEAgLTQyLDYgKzQyLDggQEAgUmVxdWlyZWQgcHJvcGVydGllcyAo
YWxsIGZ1bmN0aW9uIGJsb2Nrcyk6CiAJIm1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIgkJLSBvdmVy
ZHJpdmUKIAkibWVkaWF0ZWssPGNoaXA+LW1tc3lzIiwgInN5c2NvbiIJLSBwcm92aWRlIGNsb2Nr
cyBhbmQgY29tcG9uZW50cyBtYW5hZ2VtZW50CiAgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10
MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMuCisgIEZvciBtdDc2MjMsIGNvbXBhdGlibGUgbXVzdCBi
ZToKKyAgICAgICAgIm1lZGlhdGVrLG10NzYyMy08Y29tcG9uZW50PiIgLCAibWVkaWF0ZWssbXQy
NzAxLTxjb21wb25lbnQ+IgogCiAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5n
dGggb2YgdGhlIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIHNwYWNlCiAtIGludGVycnVwdHM6IFRo
ZSBpbnRlcnJ1cHQgc2lnbmFsIGZyb20gdGhlIGZ1bmN0aW9uIGJsb2NrIChyZXF1aXJlZCwgZXhj
ZXB0IGZvcgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
