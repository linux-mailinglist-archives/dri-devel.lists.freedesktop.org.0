Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E934265FF
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01ED89B69;
	Wed, 22 May 2019 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124158925C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 23:50:15 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 4/6] dt-bindings: display: hdmi-connector: Support DDC bus
 enable
Date: Tue, 21 May 2019 01:50:07 +0200
Message-Id: <20190520235009.16734-5-megous@megous.com>
In-Reply-To: <20190520235009.16734-1-megous@megous.com>
References: <20190520235009.16734-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558396213; bh=YFp7iMAT2SUi48E3lCp5Rb+wby06G1ktJEOG3j6izbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pDlKtgV3gowwb66fp7eLoyeuRKnsWrlXZequAZFW3Ab4/pDqG7UhNsbKMQEzRzxFf
 3cyYV77hezdzWb0n5471o0qbWoSP5qpx/n5vH3L5mJkH6rdekZhoz6x4dxPUKcbOMi
 pMRrd0iWvkbn8ODVX6x2FGfptjfm64Ls7gcAp68w=
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
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpTb21lIEFsbHdpbm5lciBT
b0MgdXNpbmcgYm9hcmRzIChPcmFuZ2UgUGkgMyBmb3IgZXhhbXBsZSkgbmVlZCB0byBlbmFibGUK
b24tYm9hcmQgdm9sdGFnZSBzaGlmdGluZyBsb2dpYyBmb3IgdGhlIEREQyBidXMgdXNpbmcgYSBn
cGlvIHRvIGJlIGFibGUKdG8gYWNjZXNzIEREQyBidXMuIFVzZSBkZGMtZW4tZ3Bpb3MgcHJvcGVy
dHkgb24gdGhlIGhkbWktY29ubmVjdG9yIHRvCm1vZGVsIHRoaXMuCgpBZGQgYmluZGluZyBkb2N1
bWVudGF0aW9uIGZvciBvcHRpb25hbCBkZGMtZW4tZ3Bpb3MgcHJvcGVydHkuCgpTaWduZWQtb2Zm
LWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5lY3Rvci50eHQgICAgIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3Iu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9y
L2hkbWktY29ubmVjdG9yLnR4dAppbmRleCA1MDhhZWU0NjFlMGQuLmFlYjA3YzRiZDcwMyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVj
dG9yL2hkbWktY29ubmVjdG9yLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0CkBAIC05LDYgKzksNyBA
QCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogLSBsYWJlbDogYSBzeW1ib2xpYyBuYW1lIGZvciB0aGUg
Y29ubmVjdG9yCiAtIGhwZC1ncGlvczogSFBEIEdQSU8gbnVtYmVyCiAtIGRkYy1pMmMtYnVzOiBw
aGFuZGxlIGxpbmsgdG8gdGhlIEkyQyBjb250cm9sbGVyIHVzZWQgZm9yIEREQyBFRElEIHByb2Jp
bmcKKy0gZGRjLWVuLWdwaW9zOiBzaWduYWwgdG8gZW5hYmxlIEREQyBidXMKIAogUmVxdWlyZWQg
bm9kZXM6CiAtIFZpZGVvIHBvcnQgZm9yIEhETUkgaW5wdXQKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
