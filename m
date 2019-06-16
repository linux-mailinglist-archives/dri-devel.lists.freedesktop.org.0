Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79347514
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFF4892DE;
	Sun, 16 Jun 2019 14:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8528917E;
 Sun, 16 Jun 2019 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 74C163EA08;
 Sun, 16 Jun 2019 13:29:46 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
 sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Sun, 16 Jun 2019 09:29:26 -0400
Message-Id: <20190616132930.6942-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560691786;
 bh=9la9rGA+VNucWpe2JoLlGvFG3lx2LubbW/TmbFF+fH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VU+cpI9z+k+iSfXw3RgNYJ3yBU9flQoNiqpnn/h4j8WT9/myas6AvUvMr9XovJtvX
 sYUrXdS8e1UwLv1w8Zl9VJockEuMLCI964F/PYRJd9Yz/fcfgixS9pCqkQl5PLXZQg
 6d+vi9MagZ0qsRSZrIaCRslvPSHJGFIxTH/6NMAA=
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0IHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAppbmRleCA5MGFmNWIwYTU2YTku
LmM3NDZiOTVlOTVkNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbXNtL2dtdS50eHQKQEAgLTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXM6CiAtIGlvbW11czogcGhhbmRsZSB0byB0aGUgYWRyZW5vIGlvbW11CiAtIG9wZXJh
dGluZy1wb2ludHMtdjI6IHBoYW5kbGUgdG8gdGhlIE9QUCBvcGVyYXRpbmcgcG9pbnRzCiAKK09w
dGlvbmFsIHByb3BlcnRpZXM6CistIG9jbWVtOiBwaGFuZGxlIHRvIHRoZSBPbiBDaGlwIE1lbW9y
eSAoT0NNRU0pIHRoYXQncyBwcmVzZW50IG9uIHNvbWUgU25hcGRyYWdvbgorICAgICAgICAgU29D
cy4gU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9j
bWVtLnlhbWwuCisKIEV4YW1wbGU6CiAKIC8gewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
