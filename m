Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9351840
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C556B89CD3;
	Mon, 24 Jun 2019 16:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED6E89CD3;
 Mon, 24 Jun 2019 16:20:16 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b18so10160216qkc.9;
 Mon, 24 Jun 2019 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8G1ZU8aLmBB851d3XszgyNFlWq4phgeEtPxU6njY4Y=;
 b=BWprdv+VEh9nI6usbETctVSsqcZgvsTPiM0A77gFKl2yUkvV9f+nXL0hYQzb4pHb6P
 qx6tUMvLIoQh6+qZB9tq5b0QO8ytAFn71OrlNVrKKbyQ34uuewN+8SyB+DLrEEa4j08p
 TCTPy+xS6wSr4zkx+lRJcsoc/5mk0WqTHcDeaQmj5f+u3PLqQeopoHZ5HAdUhuUDdou4
 TaojLiIsa9zZvEAeYROlnqwQiHSWr/K9xDf3CcJOpNayYEVU8As4h8a4mGk9oGPCbF2w
 MTi9RaPES34+drmuf6DF9+C+yoBSTNCdOy9Z4wG786rsNx/Z2RSj4ceAKik/EXeThaqO
 PRfA==
X-Gm-Message-State: APjAAAW5ncUzus1yX/gZhLx6Z8scL/aY+JZCRi/gKptxvWaCjTcIeqKN
 hCz/SGUAHCdgkIpO6hTe0Z3Q3k/DC9s=
X-Google-Smtp-Source: APXvYqzE2RTS/1lKwqd40dzMd8XsVBX00jpPN0aKk3Yc2XPJlwzdJ9osP0igg2X2h1+Wlvfr5M+wAg==
X-Received: by 2002:a37:7cf:: with SMTP id 198mr18037508qkh.450.1561393215159; 
 Mon, 24 Jun 2019 09:20:15 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id r17sm5950946qtf.26.2019.06.24.09.20.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 09:20:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a3xx: remove TPL1 regs from snapshot
Date: Mon, 24 Jun 2019 09:19:54 -0700
Message-Id: <20190624162008.21744-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8G1ZU8aLmBB851d3XszgyNFlWq4phgeEtPxU6njY4Y=;
 b=gbt8OgtQzgv/jH0rf8KkXB0a5vX2itANSwBh6Ctlu/q6iJtAWGPd1Pqc5JYPCcbdPG
 ZHzNUK0dYLCS4na219eqKiIUa1NtAx0MqvC1FmBIFIZDQBdl5RPBfHB5VGA8s8GjUqPh
 +XB5Pgy4j2SMBcWiNQ011RuaJxwMYNcUWejXiqD+i/gsw+p4Mirz0Hgc8sK0ejLbqimb
 RF1OrUvx4RsQM85tLI0O+OrEu2M9PAxttIfI8PZPYDY/U9AhL+xRC7a9QN8Cxldl7aPO
 qNpWMHf/D8nHFrsYnSis6JMhcdg7o8yjaRTdJrkVl+YAn5af9MyBTv5OJt0x//Gd1/Z8
 hRAw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlc2UgcmVncyBhcmUg
d3JpdGUtb25seSwgYW5kIHRoZSBodyB0aHJvd3MgYSBoaXNzeS1maXQgKGllLiByZWJvb3RzKQp3
aGVuIHdlIHRyeSB0byByZWFkIHRoZW0gZm9yIEdQVSBzdGF0ZSBzbmFwc2hvdCwgaW4gcmVzcG9u
c2UgdG8gYSBHUFUKaGFuZy4gIEl0IGlzIHJhdGhlciBpbXBvbGl0ZSB3aGVuIEdQVSByZWNvdmVy
eSB0cmlnZ2VycyBhbiBpbnN0YS0KcmVib290LCBzbyBsZXRzIHJlbW92ZSB0aGUgVFBMMSByZWdp
c3RlcnMgZnJvbSB0aGUgc25hcHNob3QuCgpGaXhlczogNzE5OGU2YjAzMTU1IGRybS9tc206IGFk
ZCBhM3h4IGdwdSBzdXBwb3J0ClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNo
cm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jIHwg
MjQgKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTN4eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMK
aW5kZXggYzNiNGJjNmU0MTU1Li4xMzA3OGM0OTc1ZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTN4eF9ncHUuYwpAQCAtMzk1LDE5ICszOTUsMTcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVk
IGludCBhM3h4X3JlZ2lzdGVyc1tdID0gewogCTB4MjIwMCwgMHgyMjEyLCAweDIyMTQsIDB4MjIx
NywgMHgyMjFhLCAweDIyMWEsIDB4MjI0MCwgMHgyMjdlLAogCTB4MjI4MCwgMHgyMjhiLCAweDIy
YzAsIDB4MjJjMCwgMHgyMmM0LCAweDIyY2UsIDB4MjJkMCwgMHgyMmQ4LAogCTB4MjJkZiwgMHgy
MmU2LCAweDIyZTgsIDB4MjJlOSwgMHgyMmVjLCAweDIyZWMsIDB4MjJmMCwgMHgyMmY3LAotCTB4
MjJmZiwgMHgyMmZmLCAweDIzNDAsIDB4MjM0MywgMHgyMzQ4LCAweDIzNDksIDB4MjM1MCwgMHgy
MzU2LAotCTB4MjM2MCwgMHgyMzYwLCAweDI0NDAsIDB4MjQ0MCwgMHgyNDQ0LCAweDI0NDQsIDB4
MjQ0OCwgMHgyNDRkLAotCTB4MjQ2OCwgMHgyNDY5LCAweDI0NmMsIDB4MjQ2ZCwgMHgyNDcwLCAw
eDI0NzAsIDB4MjQ3MiwgMHgyNDcyLAotCTB4MjQ3NCwgMHgyNDc1LCAweDI0NzksIDB4MjQ3YSwg
MHgyNGMwLCAweDI0ZDMsIDB4MjRlNCwgMHgyNGVmLAotCTB4MjUwMCwgMHgyNTA5LCAweDI1MGMs
IDB4MjUwYywgMHgyNTBlLCAweDI1MGUsIDB4MjUxMCwgMHgyNTExLAotCTB4MjUxNCwgMHgyNTE1
LCAweDI1ZTQsIDB4MjVlNCwgMHgyNWVhLCAweDI1ZWEsIDB4MjVlYywgMHgyNWVkLAotCTB4MjVm
MCwgMHgyNWYwLCAweDI2MDAsIDB4MjYxMiwgMHgyNjE0LCAweDI2MTcsIDB4MjYxYSwgMHgyNjFh
LAotCTB4MjY0MCwgMHgyNjdlLCAweDI2ODAsIDB4MjY4YiwgMHgyNmMwLCAweDI2YzAsIDB4MjZj
NCwgMHgyNmNlLAotCTB4MjZkMCwgMHgyNmQ4LCAweDI2ZGYsIDB4MjZlNiwgMHgyNmU4LCAweDI2
ZTksIDB4MjZlYywgMHgyNmVjLAotCTB4MjZmMCwgMHgyNmY3LCAweDI2ZmYsIDB4MjZmZiwgMHgy
NzQwLCAweDI3NDMsIDB4Mjc0OCwgMHgyNzQ5LAotCTB4Mjc1MCwgMHgyNzU2LCAweDI3NjAsIDB4
Mjc2MCwgMHgzMDBjLCAweDMwMGUsIDB4MzAxYywgMHgzMDFkLAotCTB4MzAyYSwgMHgzMDJhLCAw
eDMwMmMsIDB4MzAyZCwgMHgzMDMwLCAweDMwMzEsIDB4MzAzNCwgMHgzMDM2LAotCTB4MzAzYywg
MHgzMDNjLCAweDMwNWUsIDB4MzA1ZiwKKwkweDIyZmYsIDB4MjJmZiwgMHgyMzQwLCAweDIzNDMs
IDB4MjQ0MCwgMHgyNDQwLCAweDI0NDQsIDB4MjQ0NCwKKwkweDI0NDgsIDB4MjQ0ZCwgMHgyNDY4
LCAweDI0NjksIDB4MjQ2YywgMHgyNDZkLCAweDI0NzAsIDB4MjQ3MCwKKwkweDI0NzIsIDB4MjQ3
MiwgMHgyNDc0LCAweDI0NzUsIDB4MjQ3OSwgMHgyNDdhLCAweDI0YzAsIDB4MjRkMywKKwkweDI0
ZTQsIDB4MjRlZiwgMHgyNTAwLCAweDI1MDksIDB4MjUwYywgMHgyNTBjLCAweDI1MGUsIDB4MjUw
ZSwKKwkweDI1MTAsIDB4MjUxMSwgMHgyNTE0LCAweDI1MTUsIDB4MjVlNCwgMHgyNWU0LCAweDI1
ZWEsIDB4MjVlYSwKKwkweDI1ZWMsIDB4MjVlZCwgMHgyNWYwLCAweDI1ZjAsIDB4MjYwMCwgMHgy
NjEyLCAweDI2MTQsIDB4MjYxNywKKwkweDI2MWEsIDB4MjYxYSwgMHgyNjQwLCAweDI2N2UsIDB4
MjY4MCwgMHgyNjhiLCAweDI2YzAsIDB4MjZjMCwKKwkweDI2YzQsIDB4MjZjZSwgMHgyNmQwLCAw
eDI2ZDgsIDB4MjZkZiwgMHgyNmU2LCAweDI2ZTgsIDB4MjZlOSwKKwkweDI2ZWMsIDB4MjZlYywg
MHgyNmYwLCAweDI2ZjcsIDB4MjZmZiwgMHgyNmZmLCAweDI3NDAsIDB4Mjc0MywKKwkweDMwMGMs
IDB4MzAwZSwgMHgzMDFjLCAweDMwMWQsIDB4MzAyYSwgMHgzMDJhLCAweDMwMmMsIDB4MzAyZCwK
KwkweDMwMzAsIDB4MzAzMSwgMHgzMDM0LCAweDMwMzYsIDB4MzAzYywgMHgzMDNjLCAweDMwNWUs
IDB4MzA1ZiwKIAl+MCAgIC8qIHNlbnRpbmVsICovCiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
