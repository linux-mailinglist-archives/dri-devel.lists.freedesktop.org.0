Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3460A72
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 18:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFB66E509;
	Fri,  5 Jul 2019 16:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C616E50C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 16:42:34 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u19so20326746ior.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 09:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIBJ9DoW85CJmy6TrFg2SdCJgMlWzD7A88ZcXqMgYx0=;
 b=nNWUS9rcNbXvKOoqDnw6NlkoIRTzj2cVa6kZmmLAtvmqUJ7Pkch009dlqfTRZanWzz
 oJxYpawu2fbtr5QxDTpW515QiKlLW4lNVD2BBY8dlCXaTJvWVBtC19lfYPGWYR0yO4GC
 lJc+R2C6QXVB0cvPBcY+SdLydTcZqbA2H1+zq5Z6JRnGrdyw9xGlcbkoISc0n/GL1c52
 HzTL0Km1tRPah0mQFpU+TOLJn/1cua6Otn49MnrGrIsP4hBoWLVmIKQY8bnTgLVjjdMX
 URFjWKphoOk3DkzlQToCA2NeOyZTMjxD15X25AFTPqyvEcuM8xXUD96doxf49LrpMK3X
 zrQw==
X-Gm-Message-State: APjAAAWs0gKYtkA5VkxPaQ2StEmGTGwot5dhV2RO8J+Ce2kjbTyHz05g
 FdaO43NmwLpfAXMYnMUC5a7ek14=
X-Google-Smtp-Source: APXvYqwnniP5BuOD3/e6DU5248zgPFcWecSBjHhu+FwaR6iSC72bYwlQhYmqx6lESF1YMKpSp2Isyw==
X-Received: by 2002:a6b:691d:: with SMTP id e29mr4865968ioc.96.1562344952759; 
 Fri, 05 Jul 2019 09:42:32 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id b8sm6878104ioj.16.2019.07.05.09.42.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:42:31 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 05/13] dt-bindings: display: Convert dlc,
 dlc0700yzg-1 panel to DT schema
Date: Fri,  5 Jul 2019 10:42:13 -0600
Message-Id: <20190705164221.4462-6-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705164221.4462-1-robh@kernel.org>
References: <20190705164221.4462-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgZGxjLGRsYzA3MDB5emctMSBwYW5lbCBiaW5kaW5nIHRvIERUIHNjaGVtYS4K
CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogVGhpZXJyeSBS
ZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKUmV2aWV3ZWQt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2Rpc3BsYXkvcGFuZWwv
ZGxjLGRsYzA3MDB5emctMS50eHQgICAgICAgIHwgMTMgLS0tLS0tLS0KIC4uLi9kaXNwbGF5L3Bh
bmVsL2RsYyxkbGMwNzAweXpnLTEueWFtbCAgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvZGxjLGRsYzA3MDB5emctMS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlh
bWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2RsYyxkbGMwNzAweXpnLTEudHh0CmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBiZjA2YmIwMjViMDguLjAwMDAwMDAwMDAwMAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0x
LnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDEzICswLDAgQEAKLURMQyBEaXNwbGF5IENvLiBETEMw
NzAwWVpHLTEgNy4wIiBXU1ZHQSBURlQgTENEIHBhbmVsCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6
Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiZGxjLGRsYzA3MDB5emctMSIKLS0gcG93ZXItc3Vw
cGx5OiBTZWUgc2ltcGxlLXBhbmVsLnR4dAotCi1PcHRpb25hbCBwcm9wZXJ0aWVzOgotLSByZXNl
dC1ncGlvczogU2VlIHBhbmVsLWNvbW1vbi50eHQKLS0gZW5hYmxlLWdwaW9zOiBTZWUgc2ltcGxl
LXBhbmVsLnR4dAotLSBiYWNrbGlnaHQ6IFNlZSBzaW1wbGUtcGFuZWwudHh0Ci0KLVRoaXMgYmlu
ZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBp
cyBzcGVjaWZpZWQKLWluIHNpbXBsZS1wYW5lbC50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9k
bGMsZGxjMDcwMHl6Zy0xLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi4yODdlMmZlYjY1MzMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6
Zy0xLnlhbWwKQEAgLTAsMCArMSwzMSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMAorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
ZGlzcGxheS9wYW5lbC9kbGMsZGxjMDcwMHl6Zy0xLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IERMQyBEaXNwbGF5
IENvLiBETEMwNzAwWVpHLTEgNy4wIiBXU1ZHQSBURlQgTENEIHBhbmVsCisKK21haW50YWluZXJz
OgorICAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CisgIC0gVGhpZXJy
eSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KKworYWxsT2Y6CisgIC0gJHJlZjog
cGFuZWwtY29tbW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29u
c3Q6IGRsYyxkbGMwNzAweXpnLTEKKworICByZXNldC1ncGlvczogdHJ1ZQorICBlbmFibGUtZ3Bp
b3M6IHRydWUKKyAgYmFja2xpZ2h0OiB0cnVlCisgIHBvcnQ6IHRydWUKKworYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBwb3dlci1z
dXBwbHkKKworLi4uCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
