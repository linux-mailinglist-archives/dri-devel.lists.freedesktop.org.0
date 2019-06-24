Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21551D9A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 23:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA05089E19;
	Mon, 24 Jun 2019 21:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4D889E19
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:59:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e3so556820ioc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfDOCB2rzGjSjqpQ2I0Ij8EWWsXmK+v4TaSJDZJlQ7s=;
 b=ddkcdeyZjO3xz2/i9e5ODPAd8gK6UUEbpodLHi+HOaSl1gTKCUn6TfbkkBtXoprz1/
 H1nS+M4IwvjA7cAuWB1K6vdNUkShIRAxsiC9nLgpWIay0eLXBBY+Nuwre2Jpqctt62en
 Reyeu3GOH+5c7R/NhuY0tDaNzGRiUsXkYHzejO/7HgqwEfFFDqEWb35+00eMsTOArkGz
 iFHhNO/FQf3W+ZwMKwQAZNy+AW51ewLaw6HclqTAY3YMUEHMzWY/3TQh9B9jvHR5RmE2
 x7UEk2Q7FK39iz1a2gvUfgx/irHSnfGOUthLtMZdNeINzb2NEUzV0zt3E2pEJ8vdsZbd
 VEqA==
X-Gm-Message-State: APjAAAWed76IbCqBmg27eFCIh+OCtdR3WfaLCLpj0eXDQnK3F6D4R/oz
 O6sDnFW7dtetYH2uOwQjx2K6oNE=
X-Google-Smtp-Source: APXvYqxQu62ixrC8OgFI1/RgunflqfM7g1MuGaK+YHtYE+Vaj05i8aSEnxMGPMRNuNjvjr8+/gcZjQ==
X-Received: by 2002:a6b:8f93:: with SMTP id
 r141mr70657931iod.145.1561413545939; 
 Mon, 24 Jun 2019 14:59:05 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.247])
 by smtp.googlemail.com with ESMTPSA id l5sm14717301ioq.83.2019.06.24.14.59.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 14:59:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 09/15] dt-bindings: display: Convert tfc,
 s9700rtwv43tr-01b panel to DT schema
Date: Mon, 24 Jun 2019 15:56:43 -0600
Message-Id: <20190624215649.8939-10-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624215649.8939-1-robh@kernel.org>
References: <20190624215649.8939-1-robh@kernel.org>
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
 Sam Ravnborg <sam@ravnborg.org>, Heiko Stuebner <heiko.stuebner@bq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0aGUgdGZjLHM5NzAwcnR3djQzdHItMDFiIHBhbmVsIGJpbmRpbmcgdG8gRFQgc2No
ZW1hLgoKQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckBicS5jb20+CkNjOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC90ZmMs
czk3MDBydHd2NDN0ci0wMWIudHh0ICAgfCAxNSAtLS0tLS0tLS0tCiAuLi4vZGlzcGxheS9wYW5l
bC90ZmMsczk3MDBydHd2NDN0ci0wMWIueWFtbCAgfCAzMCArKysrKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3RmYyxzOTcwMHJ0d3Y0M3RyLTAxYi50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90ZmMsczk3MDBydHd2NDN0
ci0wMWIueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0M3RyLTAxYi50eHQgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90ZmMsczk3MDBydHd2NDN0ci0wMWIu
dHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkZmI1NzJmMDg1ZWIuLjAwMDAwMDAw
MDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC90ZmMsczk3MDBydHd2NDN0ci0wMWIudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMTUgKzAsMCBA
QAotVEZDIFM5NzAwUlRXVjQzVFItMDFCIDciIFRocmVlIEZpdmUgQ29ycCA4MDB4NDgwIExDRCBw
YW5lbCB3aXRoCi1yZXNpc3RpdmUgdG91Y2gKLQotVGhlIHBhbmVsIGlzIGZvdW5kIG9uIFRJIEFN
MzM1eC1ldm0uCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0tIGNvbXBhdGlibGU6IHNob3VsZCBi
ZSAidGZjLHM5NzAwcnR3djQzdHItMDFiIgotLSBwb3dlci1zdXBwbHk6IFNlZSBwYW5lbC1jb21t
b24udHh0Ci0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0tIGVuYWJsZS1ncGlvczogR1BJTyBwaW4g
dG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHBhbmVsLCBpZiB0aGVyZSBpcyBvbmUKLS0gYmFja2xp
Z2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5l
bAotCi1UaGlzIGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmlu
ZGluZywgd2hpY2ggaXMgc3BlY2lmaWVkCi1pbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGly
ZWN0b3J5LgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvdGZjLHM5NzAwcnR3djQzdHItMDFiLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC90ZmMsczk3MDBydHd2NDN0ci0wMWIueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjYxNGY0YThkODQwMwot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3RmYyxzOTcwMHJ0d3Y0M3RyLTAxYi55YW1sCkBAIC0wLDAgKzEsMzAgQEAKKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvdGZjLHM5NzAwcnR3djQz
dHItMDFiLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKKwordGl0bGU6IFRGQyBTOTcwMFJUV1Y0M1RSLTAxQiA3IiBUaHJlZSBGaXZl
IENvcnAgODAweDQ4MCBMQ0QgcGFuZWwgd2l0aCByZXNpc3RpdmUgdG91Y2gKKworbWFpbnRhaW5l
cnM6CisgIC0gSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KKyAgLSBUaGllcnJ5IFJlZGluZyA8
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgorCitkZXNjcmlwdGlvbjogfCsKKyAgVGhlIHBhbmVs
IGlzIGZvdW5kIG9uIFRJIEFNMzM1eC1ldm0uCisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNv
bW1vbi55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiB0ZmMs
czk3MDBydHd2NDN0ci0wMWIKKworICBlbmFibGUtZ3Bpb3M6IHRydWUKKyAgYmFja2xpZ2h0OiB0
cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBwb3dlci1zdXBwbHkKKworLi4u
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
