Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B298D16435
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 15:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CA089F5B;
	Tue,  7 May 2019 13:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E98C89F45
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 13:07:29 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w24so8187190plp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVEShq2r+HH1dqUKjsY/tIvQnR4fC4lx62sAnv2cszQ=;
 b=ai220cwX64C1332rGJLx8AIkXq3fuHeH7ql5fl7AfZdoMnIXe7d9O6DKzzDhDbg5uA
 G7KlVjigho7hgknEWhTsry4R8QeNe9Q0/f8zYoA3ix8VfSRa3krR3Ln33qdsiIFAfrKV
 K5uHGrOCMDfyEa4L+PNeKURbLm1X7kYavyRbUk8JJHJ9hGx//1x8nvl/KMEmu4bP6Ua7
 wVoUUTpmRdKqTwC9CVImO8m3s1pGnSesMuaSBpIOXb8QfStMUr+qcrZ7T6KRDIQTrYii
 pAw2o/VUxnu7f7svWJ9UNoju6lUHWX9coq0BPiU8OuRqCYtvmUr1N/JckN2SJie4l14Z
 XjZg==
X-Gm-Message-State: APjAAAWX4cXpn8PTa+d6ufZA95cSxw7hqNZGvo+99WPZw8vMI1X6riwB
 IIZRuzkaSqzyyzN41O9xIOaVLA==
X-Google-Smtp-Source: APXvYqxTNLStKgWqhFuYnzLAEpQKZaTXrhsWJy7MmuW5PcblTQp6f4JovNxg5jyNfUeBBZ2VP2/bHQ==
X-Received: by 2002:a17:902:2a:: with SMTP id 39mr39639547pla.64.1557234449180; 
 Tue, 07 May 2019 06:07:29 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3682:cdb6:452:ecda:bdfa:452e])
 by smtp.gmail.com with ESMTPSA id w190sm21889823pfb.101.2019.05.07.06.07.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 06:07:28 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/3] dt-bindings: display: Document FriendlyELEC HD702E LCD
 panel
Date: Tue,  7 May 2019 18:37:06 +0530
Message-Id: <20190507130708.11255-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVEShq2r+HH1dqUKjsY/tIvQnR4fC4lx62sAnv2cszQ=;
 b=jm+TvJfNFt6JoZDpIcsdQYCpeFYqOblkOGI08ywsGy57x+8/bmkSF4Jiva803NbPKE
 s7m5WLd6gfL1+tbGQjSyYmf3uBgqOudNS4xmd/KNNKzha6oI95GWuIDU4syC1mQ+66W8
 lrUJaarBqXPhwdumssK7oXfiCQKiWLW3S0Kas=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEQ3MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4
MDB4MTI4MApyZXNvbHV0aW9uLiBJdCBoYXMgYnVpbHQgaW4gR29vZGl4LCBHVDkyNzEgY2FwdGl2
ZSB0b3VjaHNjcmVlbgp3aXRoIGJhY2tsaWdodCBhZGp1c3RhYmxlIHZpYSBQV00uCgpBZGQgZHQt
YmluZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgaXQuCkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJy
eS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpD
YzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoKLSBz
ZXBhcmF0ZSBiaW5kaW5nIHBhdGNoIGZyb20gZHJpdmVyCi0gQWRkIHNpbXBsZS1wYW5lbCBjb21w
YXRpYmxlIGFzIGZhbGxiYWNrCi0gQWRkIHRleHQgaW5mbyBhYm91dCBzaW1wbGUtcGFuZWwgYmlu
ZGluZ3MKCiAuLi4vZGlzcGxheS9wYW5lbC9mcmllbmRseWFybSxoZDcwMmUudHh0ICAgICAgfCAz
MiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL2ZyaWVuZGx5YXJtLGhkNzAyZS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9mcmllbmRseWFybSxoZDcwMmUu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZnJp
ZW5kbHlhcm0saGQ3MDJlLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjZjOTE1NmZjMzQ3OAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2ZyaWVuZGx5YXJtLGhkNzAyZS50eHQKQEAgLTAs
MCArMSwzMiBAQAorRnJpZW5kbHlFTEVDIEhENzAyRSA4MDB4MTI4MCBMQ0QgcGFuZWwKKworSEQ3
MDJFIGxjZCBpcyBGcmllbmRseUVMRUMgZGV2ZWxvcGVkIGVEUCBMQ0QgcGFuZWwgd2l0aCA4MDB4
MTI4MAorcmVzb2x1dGlvbi4gSXQgaGFzIGJ1aWx0IGluIEdvb2RpeCwgR1Q5MjcxIGNhcHRpdmUg
dG91Y2hzY3JlZW4KK3dpdGggYmFja2xpZ2h0IGFkanVzdGFibGUgdmlhIFBXTS4KKworUmVxdWly
ZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJmcmllbmRseWFybSxoZDcw
MmUiCistIHBvd2VyLXN1cHBseTogcmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIHN1cHBseSB2b2x0
YWdlCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUg
YmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKKworT3B0aW9uYWwgbm9kZXM6
CistIFZpZGVvIHBvcnQgZm9yIExDRCBwYW5lbCBpbnB1dC4KKworVGhpcyBiaW5kaW5nIGlzIGNv
bXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcsIHdoaWNoIGlzIHNwZWNpZmll
ZAoraW4gc2ltcGxlLXBhbmVsLnR4dCBpbiB0aGlzIGRpcmVjdG9yeS4KKworRXhhbXBsZToKKwor
CXBhbmVsIHsKKwkJY29tcGF0aWJsZSA9ImZyaWVuZGx5YXJtLGhkNzAyZSIsICJzaW1wbGUtcGFu
ZWwiOworCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisJCXBvd2VyLXN1cHBseSA9IDwmdmNj
M3YzX3N5cz47CisKKwkJcG9ydCB7CisJCQlwYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKKwkJCQly
ZW1vdGUtZW5kcG9pbnQgPSA8JmVkcF9vdXRfcGFuZWw+OworCQkJfTsKKwkJfTsKKwl9OwotLSAK
Mi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
