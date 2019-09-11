Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1398B093D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BF26EBC8;
	Thu, 12 Sep 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651206EA48
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 07:52:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r12so13183484pfh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q4c1ESOOpjE2P/uFd/KkrtGxclO2zKfVzjnW7aP5b5c=;
 b=aWjqvQrn5t50SHRInHR4amK1AtMjIxtH9F3lMgpR1IPybzo8D6Wj/cZXUUWtaqYF4l
 oFzw5CGpCm87I4qZ6LdN3E2IoJXyj3LRYLL/QHmFCYVp4VvhYAPgeSHqCmUNdaAlXp1K
 i3rQIcbglVfLVRv1G9EMIyQKTohA3ICD0Cxbc8nv8duHhuL7BmWDJHVbnvh8Q3xeZ57Q
 YBl7RwH6boHCgyy0Er+okRNlQyEsHpWeSmjvBspXgYA0kK6AJtKzLutMcRBDK72z5/Kj
 m4K2Fr8tam2e6kKwTQiv/V8pOs/LfBOM56zPu+DxFASxvuOg68qqdmfxVYWv+XfKMJ2x
 lPsg==
X-Gm-Message-State: APjAAAXWsrgP0SsRRiVB+gPT1Ivf1XPWblSvgtI7GBgIZqcqQtkNN9CE
 KYpgg5IHbpAc8hvkPVKqDe8=
X-Google-Smtp-Source: APXvYqyrkl1nQUV0tQy2ao6Qp1atdp6sVcb56rA8O+j9Av28pZKjTEmBQuuMIwaP++GyQIODri9+7A==
X-Received: by 2002:a62:ee0a:: with SMTP id e10mr41430645pfi.197.1568188339617; 
 Wed, 11 Sep 2019 00:52:19 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 00:52:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/11] Add support for software nodes to gpiolib
Date: Wed, 11 Sep 2019 00:52:04 -0700
Message-Id: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q4c1ESOOpjE2P/uFd/KkrtGxclO2zKfVzjnW7aP5b5c=;
 b=icWt7W0/ZGxLPm02+gnA/J9j34su+UEYXiIxB1YxkdgQeerLuWIogY5w8f411VOCOq
 SgN3HpCyUKKt0AHKyEgPID2BBTF3u4+NAuk3B9QNNX/KsAULVe9vssToPV0QF4zjzvr0
 KKcBVuk0hI5R1cs9G7wNbXYDTEXe4mDCRGFBMbrNiIb2Z+MPOKB/5nd+zOlxhG7ImCxG
 bQPZ2M+gW9iF9Aikn4j/ghPrWXFh5X+F6gpMOK/20erVWKwkcBiH7ran3LtCKIHxFUnF
 4jUTN0gHJNHvc/00+XZPU9eLUehHBeQae0yLzl5aTDWL/DklS1NCHKX2o3qv5IO278+C
 /jmQ==
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYXR0ZW1wdHMgdG8gYWRkIHN1cHBvcnQgZm9yIHNvZnR3YXJlIG5vZGVzIHRv
IGdwaW9saWIsIHVzaW5nCnNvZnR3YXJlIG5vZGUgcmVmZXJlbmNlcyB0aGF0IHdlcmUgaW50cm9k
dWNlZCByZWNlbnRseS4gVGhpcyBhbGxvd3MgdXMKdG8gY29udmVydCBtb3JlIGRyaXZlcnMgdG8g
dGhlIGdlbmVyaWMgZGV2aWNlIHByb3BlcnRpZXMgYW5kIGRyb3AKc3VwcG9ydCBmb3IgY3VzdG9t
IHBsYXRmb3JtIGRhdGE6CgpzdGF0aWMgY29uc3Qgc3RydWN0IHNvZnR3YXJlX25vZGUgZ3Bpb19i
YW5rX2Jfbm9kZSA9IHsKfC0tLS0tLS0ubmFtZSA9ICJCIiwKfTsKCnN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHJvcGVydHlfZW50cnkgc2ltb25lX2tleV9lbnRlcl9wcm9wc1tdID0gewp8LS0tLS0tLVBS
T1BFUlRZX0VOVFJZX1UzMigibGludXgsY29kZSIsIEtFWV9FTlRFUiksCnwtLS0tLS0tUFJPUEVS
VFlfRU5UUllfU1RSSU5HKCJsYWJlbCIsICJlbnRlciIpLAp8LS0tLS0tLVBST1BFUlRZX0VOVFJZ
X1JFRigiZ3Bpb3MiLCAmZ3Bpb19iYW5rX2Jfbm9kZSwgMTIzLCBHUElPX0FDVElWRV9MT1cpLAp8
LS0tLS0tLXsgfQp9OwoKSWYgd2UgYWdyZWUgaW4gcHJpbmNpcGxlLCBJIHdvdWxkIGxpa2UgdG8g
aGF2ZSB0aGUgdmVyeSBmaXJzdCAzIHBhdGNoZXMKaW4gYW4gaW1tdXRhYmxlIGJyYW5jaCBvZmYg
bWF5YmUgLXJjOCBzbyB0aGF0IGl0IGNhbiBiZSBwdWxsZWQgaW50bwppbmRpdmlkdWFsIHN1YnN5
c3RlbXMgc28gdGhhdCBwYXRjaGVzIHN3aXRjaGluZyB2YXJpb3VzIGRyaXZlcnMgdG8KZndub2Rl
X2dwaW9kX2dldF9pbmRleCgpIGNvdWxkIGJlIGFwcGxpZWQuCgpUaGFua3MsCkRtaXRyeQoKRG1p
dHJ5IFRvcm9raG92ICgxMSk6CiAgZ3Bpb2xpYjogb2Y6IGFkZCBhIGZhbGxiYWNrIGZvciB3bGYs
cmVzZXQgR1BJTyBuYW1lCiAgZ3Bpb2xpYjogaW50cm9kdWNlIGRldm1fZndub2RlX2dwaW9kX2dl
dF9pbmRleCgpCiAgZ3Bpb2xpYjogaW50cm9kdWNlIGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQog
IG5ldDogcGh5bGluazogc3dpdGNoIHRvIHVzaW5nIGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQog
IG5ldDogbWRpbzogc3dpdGNoIHRvIHVzaW5nIGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQogIGRy
bS9icmlkZ2U6IHRpLXRmcDQxMDogc3dpdGNoIHRvIHVzaW5nIGZ3bm9kZV9ncGlvZF9nZXRfaW5k
ZXgoKQogIGdwbGlvbGliOiBtYWtlIGZ3bm9kZV9nZXRfbmFtZWRfZ3Bpb2QoKSBzdGF0aWMKICBn
cGlvbGliOiBvZjogdGVhc2UgYXBhcnQgb2ZfZmluZF9ncGlvKCkKICBncGlvbGliOiBvZjogdGVh
c2UgYXBhcnQgYWNwaV9maW5kX2dwaW8oKQogIGdwaW9saWI6IGNvbnNvbGlkYXRlIGZ3bm9kZSBH
UElPIGxvb2t1cHMKICBncGlvbGliOiBhZGQgc3VwcG9ydCBmb3Igc29mdHdhcmUgbm9kZXMKCiBk
cml2ZXJzL2dwaW8vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3Bpby9n
cGlvbGliLWFjcGkuYyAgICAgICAgfCAxNTMgKysrKysrKysrKysrKystLS0tLS0tLS0tCiBkcml2
ZXJzL2dwaW8vZ3Bpb2xpYi1hY3BpLmggICAgICAgIHwgIDIxICsrLS0KIGRyaXZlcnMvZ3Bpby9n
cGlvbGliLWRldnJlcy5jICAgICAgfCAgMzMgKystLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1v
Zi5jICAgICAgICAgIHwgMTU5ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3Bp
by9ncGlvbGliLW9mLmggICAgICAgICAgfCAgMjYgKystLQogZHJpdmVycy9ncGlvL2dwaW9saWIt
c3dub2RlLmMgICAgICB8ICA5MiArKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3Bpby9ncGlvbGli
LXN3bm9kZS5oICAgICAgfCAgMTMgKysKIGRyaXZlcnMvZ3Bpby9ncGlvbGliLmMgICAgICAgICAg
ICAgfCAxODQgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGktdGZwNDEwLmMgfCAgIDQgKy0KIGRyaXZlcnMvbmV0L3BoeS9tZGlvX2J1cy5jICAg
ICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvbmV0L3BoeS9waHlsaW5rLmMgICAgICAgICAgfCAgIDQg
Ky0KIGluY2x1ZGUvbGludXgvZ3Bpby9jb25zdW1lci5oICAgICAgfCAgNTMgKysrKysrLS0tCiAx
MyBmaWxlcyBjaGFuZ2VkLCA0NzEgaW5zZXJ0aW9ucygrKSwgMjc2IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3Bpby9ncGlvbGliLXN3bm9kZS5jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncGlvL2dwaW9saWItc3dub2RlLmgKCi0tIAoyLjIzLjAuMTYyLmcw
YjlmYmIzNzM0LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
