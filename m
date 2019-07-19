Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF66DA14
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 05:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B5C6E4CE;
	Fri, 19 Jul 2019 03:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56376E4CE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 03:59:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FB2821873;
 Fri, 19 Jul 2019 03:59:50 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 091/171] dt-bindings: backlight: lm3630a: correct
 schema validation
Date: Thu, 18 Jul 2019 23:55:22 -0400
Message-Id: <20190719035643.14300-91-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508791;
 bh=QvlXDSoxkqqz4+28wmL0GcIAtj5yQiD+NHM8MahlxRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CCZs4gazG2xpUNZXFdBEnZ5NQqzsQujhxKlDFnYJqkQ6tf77soCEFL6glgN0ioP/y
 aCVRLjfrMMvEmwsfeggVlhBiWJxHyfIpMy/fjZP5LsXI7leCLAb6K+Gvvisqy8vi+l
 VOigOYrapNJdjpHGEcUs1gduX4QghWKWWWZy99Dc=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+CgpbIFVwc3RyZWFtIGNv
bW1pdCBlZjRkYjI4YzFmNDVjZGE2OTg5YmM4YThlNDUyOTQ4OTQ3ODZkOTQ3IF0KClRoZSAnI2Fk
ZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnIHByb3BlcnRpZXMgd2VyZSBub3QgZGVmaW5l
ZCBpbgp0aGUgbG0zNjMwYSBiaW5kaW5ncyBhbmQgd291bGQgY2F1c2UgdGhlIGZvbGxvd2luZyBl
cnJvciB3aGVuCmF0dGVtcHRpbmcgdG8gdmFsaWRhdGUgdGhlIGV4YW1wbGVzIGFnYWluc3QgdGhl
IHNjaGVtYToKCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6CicjYWRkcmVzcy1jZWxscycsICcj
c2l6ZS1jZWxscycgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczoKJ15sZWRAWzAxXSQn
LCAncGluY3RybC1bMC05XSsnCgpDb3JyZWN0IHRoaXMgYnkgYWRkaW5nIHRob3NlIHR3byBwcm9w
ZXJ0aWVzLgoKV2hpbGUgd2UncmUgaGVyZSwgbW92ZSB0aGUgdGksbGluZWFyLW1hcHBpbmctbW9k
ZSBwcm9wZXJ0eSB0byB0aGUKbGVkQFswMV0gY2hpbGQgbm9kZXMgdG8gY29ycmVjdCB0aGUgZm9s
bG93aW5nIHZhbGlkYXRpb24gZXJyb3I6CgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQuZXhhbXBsZS5kdC55YW1sOgpsZWRA
MDogJ3RpLGxpbmVhci1tYXBwaW5nLW1vZGUnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVn
ZXhlczoKJ3BpbmN0cmwtWzAtOV0rJwoKRml4ZXM6IDMyZmNiNzVjNjZhMCAoImR0LWJpbmRpbmdz
OiBiYWNrbGlnaHQ6IEFkZCBsbTM2MzBhIGJpbmRpbmdzIikKU2lnbmVkLW9mZi1ieTogQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClJlcG9ydGVkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4KQWNrZWQtYnk6IERhbiBNdXJwaHkgPGRtdXJwaHlAdGkuY29tPgpb
cm9iaDogYWxzbyBkcm9wIG1heEl0ZW1zIGZyb20gY2hpbGQgcmVnXQpTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8
c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xp
Z2h0LnlhbWwgICAgIHwgMjEgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0z
NjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCA0ZDYxZmUwYTk4YTQuLmRjMTI5ZDlhMzI5ZSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKQEAgLTIzLDE2ICsy
MywxNyBAQCBwcm9wZXJ0aWVzOgogICByZWc6CiAgICAgbWF4SXRlbXM6IDEKIAotICB0aSxsaW5l
YXItbWFwcGluZy1tb2RlOgotICAgIGRlc2NyaXB0aW9uOiB8Ci0gICAgICBFbmFibGUgbGluZWFy
IG1hcHBpbmcgbW9kZS4gSWYgZGlzYWJsZWQsIHRoZW4gaXQgd2lsbCB1c2UgZXhwb25lbnRpYWwK
LSAgICAgIG1hcHBpbmcgbW9kZSBpbiB3aGljaCB0aGUgcmFtcCB1cC9kb3duIGFwcGVhcnMgdG8g
aGF2ZSBhIG1vcmUgdW5pZm9ybQotICAgICAgdHJhbnNpdGlvbiB0byB0aGUgaHVtYW4gZXllLgot
ICAgIHR5cGU6IGJvb2xlYW4KKyAgJyNhZGRyZXNzLWNlbGxzJzoKKyAgICBjb25zdDogMQorCisg
ICcjc2l6ZS1jZWxscyc6CisgICAgY29uc3Q6IDAKIAogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJs
ZQogICAtIHJlZworICAtICcjYWRkcmVzcy1jZWxscycKKyAgLSAnI3NpemUtY2VsbHMnCiAKIHBh
dHRlcm5Qcm9wZXJ0aWVzOgogICAiXmxlZEBbMDFdJCI6CkBAIC00OCw3ICs0OSw2IEBAIHBhdHRl
cm5Qcm9wZXJ0aWVzOgogICAgICAgICAgIGluIHRoaXMgcHJvcGVydHkuIFRoZSB0d28gY3VycmVu
dCBzaW5rcyBjYW4gYmUgY29udHJvbGxlZAogICAgICAgICAgIGluZGVwZW5kZW50bHkgd2l0aCBi
b3RoIGJhbmtzLCBvciBiYW5rIEEgY2FuIGJlIGNvbmZpZ3VyZWQgdG8gY29udHJvbAogICAgICAg
ICAgIGJvdGggc2lua3Mgd2l0aCB0aGUgbGVkLXNvdXJjZXMgcHJvcGVydHkuCi0gICAgICAgIG1h
eEl0ZW1zOiAxCiAgICAgICAgIG1pbmltdW06IDAKICAgICAgICAgbWF4aW11bTogMQogCkBAIC03
Myw2ICs3MywxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgbWluaW11bTogMAogICAg
ICAgICBtYXhpbXVtOiAyNTUKIAorICAgICAgdGksbGluZWFyLW1hcHBpbmctbW9kZToKKyAgICAg
ICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICBFbmFibGUgbGluZWFyIG1hcHBpbmcgbW9kZS4g
SWYgZGlzYWJsZWQsIHRoZW4gaXQgd2lsbCB1c2UgZXhwb25lbnRpYWwKKyAgICAgICAgICBtYXBw
aW5nIG1vZGUgaW4gd2hpY2ggdGhlIHJhbXAgdXAvZG93biBhcHBlYXJzIHRvIGhhdmUgYSBtb3Jl
IHVuaWZvcm0KKyAgICAgICAgICB0cmFuc2l0aW9uIHRvIHRoZSBodW1hbiBleWUuCisgICAgICAg
IHR5cGU6IGJvb2xlYW4KKwogICAgIHJlcXVpcmVkOgogICAgICAgLSByZWcKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
