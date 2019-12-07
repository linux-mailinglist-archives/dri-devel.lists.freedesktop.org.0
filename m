Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BA115EF3
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 23:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3746E25B;
	Sat,  7 Dec 2019 22:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6246E25B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 22:24:32 +0000 (UTC)
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A9622467B;
 Sat,  7 Dec 2019 22:24:27 +0000 (UTC)
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [PATCH v6 01/12] dt-bindings: display: mediatek: Add mmsys binding
 description
Date: Sat,  7 Dec 2019 23:23:38 +0100
Message-Id: <20191207222349.23161-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1575757472;
 bh=yS94gpuqS6tiHsqCJmY/O8oa8kDut8tm51xSNkTZ76A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E88N+dHr4B9LMmu2YL5b4Ufwkb7SxzGaIEKT07wumDn+KHCXw47y38Y0PM5Dst7Ux
 TncGVS8eTiDlA6u47fYhj+JunvHahIwg9D6V/xDbhs+AZs1xDOjJGJMcmTswxeF/fq
 krvJEijvc6e6lNxuHKxt3P/eTdyhfWOIgr9Zm83c=
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

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpUaGUgTWVkaWFUZWsg
RFJNIGhhcyBhIGJsb2NrIGNhbGxlZCBtbXN5cywgd2hpY2ggc2V0cwp0aGUgcm91dGluZyBhbmQg
ZW5hbGJlcyB0aGUgZGlmZmVyZW50IGJsb2Nrcy4KVGhpcyBwYXRjaCBhZGRzIG9uZSBsaW5lIGZv
ciB0aGUgbW1zeXMgYmluZGluZ3MgZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlh
cyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KLS0tCiAuLi4vZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dCAgICAgICAgfCAyOCArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssZGlzcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAppbmRleCA4NDY5ZGU1MTAwMDEuLmM3MWM4YTRiNzNm
ZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKQEAgLTI3LDIwICsy
NywyMiBAQCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkcGkudHh0LgogCiBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24g
YmxvY2tzKToKIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kaXNwLTxmdW5jdGlvbj4i
LCBvbmUgb2YKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsIiAgIC0gb3ZlcmxheSAoNCBsYXll
cnMsIGJsZW5kaW5nLCBjc2MpCi0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXJkbWEiICAtIHJlYWQg
RE1BIC8gbGluZSBidWZmZXIKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3Atd2RtYSIgIC0gd3JpdGUg
RE1BCi0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLWNvbG9yIiAtIGNvbG9yIHByb2Nlc3NvcgotCSJt
ZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgLSBhZGFwdGl2ZSBhbWJpZW50IGxpZ2h0IGNvbnRy
b2xsZXIKLQkibWVkaWF0ZWssPGNoaXA+LWRpc3AtZ2FtbWEiIC0gZ2FtbWEgY29ycmVjdGlvbgot
CSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tZXJnZSIgLSBtZXJnZSBzdHJlYW1zIGZyb20gdHdvIFJE
TUEgc291cmNlcwotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1zcGxpdCIgLSBzcGxpdCBzdHJlYW0g
dG8gdHdvIGVuY29kZXJzCi0JIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXVmb2UiICAtIGRhdGEgY29t
cHJlc3Npb24gZW5naW5lCi0JIm1lZGlhdGVrLDxjaGlwPi1kc2kiICAgICAgICAtIERTSSBjb250
cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHNpLnR4dAotCSJtZWRpYXRlayw8Y2hpcD4tZHBpIiAgICAg
ICAgLSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKLQkibWVkaWF0ZWssPGNo
aXA+LWRpc3AtbXV0ZXgiIC0gZGlzcGxheSBtdXRleAotCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1v
ZCIgICAgLSBvdmVyZHJpdmUKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atb3ZsIgkJLSBvdmVybGF5
ICg0IGxheWVycywgYmxlbmRpbmcsIGNzYykKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSIJ
CS0gcmVhZCBETUEgLyBsaW5lIGJ1ZmZlcgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIgkJ
LSB3cml0ZSBETUEKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtY29sb3IiCQktIGNvbG9yIHByb2Nl
c3NvcgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiCQktIGFkYXB0aXZlIGFtYmllbnQgbGln
aHQgY29udHJvbGxlcgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1nYW1tYSIJCS0gZ2FtbWEgY29y
cmVjdGlvbgorCSJtZWRpYXRlayw8Y2hpcD4tZGlzcC1tZXJnZSIJCS0gbWVyZ2Ugc3RyZWFtcyBm
cm9tIHR3byBSRE1BIHNvdXJjZXMKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiCQktIHNw
bGl0IHN0cmVhbSB0byB0d28gZW5jb2RlcnMKKwkibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIJ
CS0gZGF0YSBjb21wcmVzc2lvbiBlbmdpbmUKKwkibWVkaWF0ZWssPGNoaXA+LWRzaSIJCQktIERT
SSBjb250cm9sbGVyLCBzZWUgbWVkaWF0ZWssZHNpLnR4dAorCSJtZWRpYXRlayw8Y2hpcD4tZHBp
IgkJCS0gRFBJIGNvbnRyb2xsZXIsIHNlZSBtZWRpYXRlayxkcGkudHh0CisJIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLW11dGV4IgkJLSBkaXNwbGF5IG11dGV4CisJIm1lZGlhdGVrLDxjaGlwPi1kaXNw
LW9kIgkJLSBvdmVyZHJpdmUKKwkibWVkaWF0ZWssPGNoaXA+LW1tc3lzIiwgInN5c2NvbiIJLSBw
cm92aWRlIGNsb2NrcyBhbmQgY29tcG9uZW50cyBtYW5hZ2VtZW50CiAgIHRoZSBzdXBwb3J0ZWQg
Y2hpcHMgYXJlIG10MjcwMSwgbXQyNzEyIGFuZCBtdDgxNzMuCisKIC0gcmVnOiBQaHlzaWNhbCBi
YXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3Bh
Y2UKIC0gaW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24g
YmxvY2sgKHJlcXVpcmVkLCBleGNlcHQgZm9yCiAgIG1lcmdlIGFuZCBzcGxpdCBmdW5jdGlvbiBi
bG9ja3MpLgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
