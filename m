Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6407B9C6A3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5538C6E145;
	Mon, 26 Aug 2019 00:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EE46EC7E;
 Fri, 23 Aug 2019 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net
 [184.191.162.253])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id A03713E9DE;
 Fri, 23 Aug 2019 12:16:52 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v7 2/7] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Fri, 23 Aug 2019 05:16:32 -0700
Message-Id: <20190823121637.5861-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566562613;
 bh=4YyZYA76P5MDItcjIt2IoThZdgLkDEejC3WE4+nxPyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BZeySUh54bYwDdYlkDcpRILJDeEHsM6TMTB4OAWbPLkjqWQxN+T1GryVHZ1Uln/iS
 0G2RjS2zrI+f6hBNarMq54gnoqLdN7QKTXZ/4yPTlZJgjC+WmgEa05ssSwOxXW8CKU
 y2ljlvQ9TlFlaP6JPsM2oh08r3UG2Fpu27qXLRj8=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2NjoKLSBsaW5rIHRvIGdtdS1zcmFtIGluIGV4YW1wbGUKLSBhZGQgcmFuZ2VzIHByb3BlcnR5
IHRvIG9jbWVtIGV4YW1wbGUgdG8gbWF0Y2ggYmluZGluZ3MKCkNoYW5nZXMgc2luY2UgdjU6Ci0g
cmVuYW1lIG9jbWVtIHByb3BlcnR5IHRvIHNyYW0gdG8gbWF0Y2ggd2hhdCBUSSBjdXJyZW50bHkg
aGFzLgoKQ2hhbmdlcyBzaW5jZSB2NDoKLSBOb25lCgpDaGFuZ2VzIHNpbmNlIHYzOgotIGNvcnJl
Y3QgbGluayB0byBxY29tLG9jbWVtLnlhbWwKCkNoYW5nZXMgc2luY2UgdjI6Ci0gQWRkIGEzeHgg
ZXhhbXBsZSB3aXRoIE9DTUVNCgpDaGFuZ2VzIHNpbmNlIHYxOgotIE5vbmUKCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0ICAgfCA1MSArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKaW5kZXggOTBh
ZjViMGE1NmE5Li5iZjljN2EyYTQ5NWMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0CkBAIC0zMSw2ICszMSwxMCBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBpb21tdXM6IHBoYW5kbGUgdG8gdGhlIGFkcmVubyBpb21t
dQogLSBvcGVyYXRpbmctcG9pbnRzLXYyOiBwaGFuZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBv
aW50cwogCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBzcmFtOiBwaGFuZGxlIHRvIHRoZSBPbiBD
aGlwIE1lbW9yeSAoT0NNRU0pIHRoYXQncyBwcmVzZW50IG9uIHNvbWUgU25hcGRyYWdvbgorICAg
ICAgICBTb0NzLiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNv
bSxvY21lbS55YW1sLgorCiBFeGFtcGxlOgogCiAvIHsKQEAgLTYzLDMgKzY3LDUwIEBAIEV4YW1w
bGU6CiAJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdtdV9vcHBfdGFibGU+OwogCX07CiB9Owor
CithM3h4IGV4YW1wbGUgd2l0aCBPQ01FTSBzdXBwb3J0OgorCisvIHsKKwkuLi4KKworCWdwdTog
YWRyZW5vQGZkYjAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJxY29tLGFkcmVuby0zMzAuMiIsCisJ
CSAgICAgICAgICAgICAicWNvbSxhZHJlbm8iOworCQlyZWcgPSA8MHhmZGIwMDAwMCAweDEwMDAw
PjsKKwkJcmVnLW5hbWVzID0gImtnc2xfM2QwX3JlZ19tZW1vcnkiOworCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgMzMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWludGVycnVwdC1uYW1lcyA9ICJr
Z3NsXzNkMF9pcnEiOworCQljbG9jay1uYW1lcyA9ICJjb3JlIiwKKwkJICAgICAgICAgICAgICAi
aWZhY2UiLAorCQkgICAgICAgICAgICAgICJtZW1faWZhY2UiOworCQljbG9ja3MgPSA8Jm1tY2Mg
T1hJTElfR0ZYM0RfQ0xLPiwKKwkJICAgICAgICAgPCZtbWNjIE9YSUxJQ1hfQUhCX0NMSz4sCisJ
CSAgICAgICAgIDwmbW1jYyBPWElMSUNYX0FYSV9DTEs+OworCQlzcmFtID0gPCZnbXVfc3JhbT47
CisJCXBvd2VyLWRvbWFpbnMgPSA8Jm1tY2MgT1hJTElDWF9HRFNDPjsKKwkJb3BlcmF0aW5nLXBv
aW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47CisJCWlvbW11cyA9IDwmZ3B1X2lvbW11IDA+Owor
CX07CisKKwlvY21lbUBmZGQwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAicWNvbSxtc204OTc0LW9j
bWVtIjsKKworCQlyZWcgPSA8MHhmZGQwMDAwMCAweDIwMDA+LAorCQkgICAgICA8MHhmZWMwMDAw
MCAweDE4MDAwMD47CisJCXJlZy1uYW1lcyA9ICJjdHJsIiwKKwkJICAgICAgICAgICAgICJtZW0i
OworCisJCWNsb2NrcyA9IDwmcnBtY2MgUlBNX1NNRF9PQ01FTUdYX0NMSz4sCisJCSAgICAgICAg
IDwmbW1jYyBPQ01FTUNYX09DTUVNTk9DX0NMSz47CisJCWNsb2NrLW5hbWVzID0gImNvcmUiLAor
CQkgICAgICAgICAgICAgICJpZmFjZSI7CisKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNz
aXplLWNlbGxzID0gPDE+OworCisJCWdtdV9zcmFtOiBnbXUtc3JhbUAwIHsKKwkJCXJlZyA9IDww
eDAgMHgxMDAwMDA+OworCQkJcmFuZ2VzID0gPDAgMCAweGZlYzAwMDAwIDB4MTAwMDAwPjsKKwkJ
fTsKKwl9OworfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
