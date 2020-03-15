Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE964185CF1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 14:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADC66E0A1;
	Sun, 15 Mar 2020 13:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308E36E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 13:45:02 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so15632186ljh.5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qN/9TVll9OnjC2lIp1h0DvEoxIN84PT8tMaUxK86Nu0=;
 b=pjGBsm8jINEB8YBz2M8v8kWuZJJGJ1/X56U09V6uBb6EcdGyxWjpbfILIGnEPGuM7h
 rRYHkWxaqkowItY3LbShkGPDh89SVXTucFDCpuOdUuhrHX3L0Mk7DXQuvyZcrTrIwRd5
 l6i46gHlGF/EWHDnHS9bhmP39Rd87Qm6NuL7eirKQlCapTr8xJpC/Cdc7Q4iHv3DrptH
 HHy3sd52FkB+8jykczWG2uDxQFKwsNpkEi/geRkH2PDTRRCQLNIaQJG8+pXsipTnjgjS
 sYaVP3WYkDc1Q6JQCmT5e55RJ3w1gZU4SvyiKmRooqnwSQfv9SIvk53drlp93RH53xw2
 p9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qN/9TVll9OnjC2lIp1h0DvEoxIN84PT8tMaUxK86Nu0=;
 b=FbrWHlyejNMMfzJe62Kuyj90HsBO2bS7YwG9Avd8fXXC3sdRuTstgODHqrsb5RIbMt
 sqHaygEeQU1S0yR+XIsumsHlxKfKOnVahaXhfY5/1vqLs/89SMFqMj0rk+7wL0XPnfZe
 6YPRWF99hlc85cA1wJYGiR1l5M0Mvo57cSxKXiXgLs+CnLUpYCcrxTjyyTRyMb8IvMpW
 3mnZVjhT1IyuQgr2dz264HbcBTMzw0oxSf8f0vtAPiYn/gIgHGyAi60oKEgG8k6kSL1S
 cA+psOFelUTkme9WI0TPcACtJwtakN+CsnJibmN0FQq9W6eImxxgAgYc4imPOuEW7hK/
 DLoA==
X-Gm-Message-State: ANhLgQ3J3BFHRRMUJ1nIceoj5x7AgO22XMSe2z5DyQT0heVb0rELzKlA
 ob3bvXzEN8qymvMg8FgCtNCFmtXqXyM=
X-Google-Smtp-Source: ADFU+vuiHyiDdXgdytvRxo7AC/xDdcYCpzOFgj091tqpF80M/Pq616xfbTWH0emRYXfcg/fT+l9JWQ==
X-Received: by 2002:a2e:9852:: with SMTP id e18mr10716837ljj.249.1584279900063; 
 Sun, 15 Mar 2020 06:45:00 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 a9sm23025212lfb.21.2020.03.15.06.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 06:44:59 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v1 15/36] dt-bindings: display: convert simple lg panels to DT
 Schema
Date: Sun, 15 Mar 2020 14:43:55 +0100
Message-Id: <20200315134416.16527-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 Guido Gunther <agx@sigxcpu.org>, Mark Brown <broonie@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBsZyBwYW5lbHMgdGhhdCBtYXRjaGVzIHRoZSBwYW5lbC1zaW1wbGUgYmluZGluZyB0
bwpwYW5lbC1zaW1wbGUueWFtbAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgpDYzogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+CkNj
OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KQ2M6IFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sZyxhY3g0
Njdha20tNy50eHQgICB8IDcgLS0tLS0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9sZyxsZDA3MHd4My1zbDAxLnR4dCB8IDcgLS0tLS0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9sZyxsaDUwMHd4MS1zZDAzLnR4dCB8IDcgLS0tLS0tLQog
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAg
ICB8IDYgKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvbGcsYWN4NDY3YWttLTcudHh0CiBkZWxldGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsbGQwNzB3
eDMtc2wwMS50eHQKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9sZyxsaDUwMHd4MS1zZDAzLnR4dAoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xnLGFjeDQ2
N2FrbS03LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2xnLGFjeDQ2N2FrbS03LnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZmMx
ZTFiMzI1ZTQ5Li4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsYWN4NDY3YWttLTcudHh0CisrKyAvZGV2L251bGwKQEAg
LTEsNyArMCwwIEBACi1MRyBBQ1g0NjdBS00tNyA0Ljk1IiAxMDgww5cxOTIwIExDRCBQYW5lbAot
Ci1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiBtdXN0IGJlICJsZyxhY3g0Njdh
a20tNyIKLQotVGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVs
IGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmllZAotaW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlz
IGRpcmVjdG9yeS4KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2xnLGxkMDcwd3gzLXNsMDEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsbGQwNzB3eDMtc2wwMS50eHQKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVlNjQ5Y2I5YWExYS4uMDAwMDAwMDAwMDAwCi0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xnLGxkMDcw
d3gzLXNsMDEudHh0CisrKyAvZGV2L251bGwKQEAgLTEsNyArMCwwIEBACi1MRyBDb3Jwb3JhdGlv
biA3IiBXWEdBIFRGVCBMQ0QgcGFuZWwKLQotUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0
aWJsZTogc2hvdWxkIGJlICJsZyxsZDA3MHd4My1zbDAxIgotCi1UaGlzIGJpbmRpbmcgaXMgY29t
cGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVk
Ci1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5LgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsbGg1MDB3eDEt
c2QwMy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9sZyxsaDUwMHd4MS1zZDAzLnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTA0
ZmQyYjJlNzNkLi4wMDAwMDAwMDAwMDAKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbGcsbGg1MDB3eDEtc2QwMy50eHQKKysrIC9kZXYvbnVsbApA
QCAtMSw3ICswLDAgQEAKLUxHIENvcnBvcmF0aW9uIDUiIEhEIFRGVCBMQ0QgcGFuZWwKLQotUmVx
dWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJsZyxsaDUwMHd4MS1z
ZDAzIgotCi1UaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwg
YmluZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCi1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMg
ZGlyZWN0b3J5LgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbAppbmRleCA1MDg4ZmU4
MWQwMjUuLmIxYjhkMGVkYWRlZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwK
QEAgLTE1NSw4ICsxNTUsMTQgQEAgcHJvcGVydGllczoKICAgICAgIC0ga3lvLHRjZzEyMXhnbHAK
ICAgICAgICAgIyBMZU1ha2VyIEJMMDM1LVJHQi0wMDIgMy41IiBRVkdBIFRGVCBMQ0QgcGFuZWwK
ICAgICAgIC0gbGVtYWtlcixibDAzNS1yZ2ItMDAyCisgICAgICAgICMgTEcgQUNYNDY3QUtNLTcg
NC45NSIgMTA4MMOXMTkyMCBMQ0QgUGFuZWwKKyAgICAgIC0gbGcsYWN4NDY3YWttLTcKICAgICAg
ICAgIyBMRyA3IiAoODAweDQ4MCBwaXhlbHMpIFRGVCBMQ0QgcGFuZWwKICAgICAgIC0gbGcsbGIw
NzB3djgKKyAgICAgICAgIyBMRyBDb3Jwb3JhdGlvbiA3IiBXWEdBIFRGVCBMQ0QgcGFuZWwKKyAg
ICAgIC0gbGcsbGQwNzB3eDMtc2wwMQorICAgICAgICAjIExHIENvcnBvcmF0aW9uIDUiIEhEIFRG
VCBMQ0QgcGFuZWwKKyAgICAgIC0gbGcsbGg1MDB3eDEtc2QwMwogICAgICAgICAjIExHIExQMDc5
UVgxLVNQMFYgNy45IiAoMTUzNngyMDQ4IHBpeGVscykgVEZUIExDRCBwYW5lbAogICAgICAgLSBs
ZyxscDA3OXF4MS1zcDB2CiAgICAgICAgICMgTEcgOS43IiAoMjA0OHgxNTM2IHBpeGVscykgVEZU
IExDRCBwYW5lbAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
