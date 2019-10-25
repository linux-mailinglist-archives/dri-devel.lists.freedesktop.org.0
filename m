Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E82DE56A5
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 00:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240B46EBBE;
	Fri, 25 Oct 2019 22:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADDA6EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 22:50:17 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u23so2518709pgo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 15:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/QsSnbqT/vxBzyqQX0KdepymXuDj6dGQtXlO9dbOSkk=;
 b=FE+uI6mhp8ao02xEnYnjEAOzzVzP3OW7QlHUwAIkABlm/djuHEH4gQDqqQK6iLD+zi
 0GD8gYknkDeWvuCMgfnbnNRbxP03MEunCuKNGThp0HeBrtPPo0RWZzcpiQwqFg2k9ngQ
 6eRk/2E5Xta6rwmGLZh09tjTg9aqC1pXXE2yBMjolsqYdIsJUncx5oreGBMrFPOQby5N
 HA8RjhXEuHRuWF5kOtx0bGRGVKP0cCei3lhoXGxYw7MT8v/6/UHUqZIIjR2v2vrzVRlB
 9z8fH8gsHlcYoS+EPL+9+UnMqmaxyNOKWGE4PRNiCne+7mQH2+py0UeXDFLIcU2yx4/z
 BDyA==
X-Gm-Message-State: APjAAAXHnQ32fjFUMEBj3bLQ7B3JW0q5qngLUQEaRPcDhh/bplgH7FXx
 phGNDV9L8q9rg3ErNMLWM/eM6A==
X-Google-Smtp-Source: APXvYqziC/rX8OG0ZvE60odRUgM4+OMxyzH9YT1VE6orCRtoxz0Nkzr2UbFad4Lx05yIE7lyxETSEw==
X-Received: by 2002:a63:5c21:: with SMTP id q33mr7104380pgb.78.1572043817153; 
 Fri, 25 Oct 2019 15:50:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 o15sm2758018pjs.14.2019.10.25.15.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 15:50:16 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 1/3] dt-bindings: dma-buf: heaps: Describe CMA regions to
 be added to dmabuf heaps interface.
Date: Fri, 25 Oct 2019 22:50:07 +0000
Message-Id: <20191025225009.50305-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191025225009.50305-1-john.stultz@linaro.org>
References: <20191025225009.50305-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/QsSnbqT/vxBzyqQX0KdepymXuDj6dGQtXlO9dbOSkk=;
 b=QuTmYOTqrurVmJ/xuipLBhM7GLFY5pGr1iJX3QKVdcKK/H8I/5AdYHQwYMY2NUiqXc
 AxSegHg7VxQ7X/0azpl7Q8w46j+KDFXLJrEkkWcH6302yTkS51/vcbuJFQHzVwUgBWj6
 JzKzOF5iC3EH7xZqAoCQULcCl2yXADIIzruVCenqNO7lW51zLg2HmLfFuT1VYsYAmSL3
 3hnxUHcxN+1kHcPwaaGoAQ+jv/eXxBlLQUSk4/h9aGt3i0AK0wdV7K8dTsU2mZ3h+46J
 Faj4npHwJnvDE245x+lkyKBoXHWzL1LDqC/pK//cfEiAkdcXSCixwBIguLUCDpUHNjem
 amjg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBiaW5kaW5nIHNwZWNpZmllcyB3aGljaCBDTUEgcmVnaW9ucyBzaG91bGQgYmUgYWRkZWQg
dG8gdGhlCmRtYWJ1ZiBoZWFwcyBpbnRlcmZhY2UuCgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4KQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBM
YXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+CkNjOiBQ
cmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1cm9yYS5vcmc+CkNjOiBCcmlhbiBTdGFya2V5IDxC
cmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBBbmRyZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+CkNj
OiBDaGVuYm8gRmVuZyA8ZmVuZ2NAZ29vZ2xlLmNvbT4KQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxh
c3RyYWNoYW5AZ29vZ2xlLmNvbT4KQ2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNv
bT4KQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgpDYzogZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogLi4u
L2JpbmRpbmdzL2RtYS9kbWFidWYtaGVhcC1jbWEudHh0ICAgICAgICAgIHwgMzEgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2RtYWJ1Zi1oZWFw
LWNtYS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5iZGU3YjFmMWMyNjkKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2RtYWJ1Zi1oZWFwLWNtYS50eHQKQEAgLTAsMCArMSwz
MSBAQAorKiBETUEtQlVGIENNQSBIZWFwCisKK1NwZWNpZmllcyBhIENNQSByZWdpb24gdGhhdCBz
aG91bGQgYmUgYWRkZWQgdG8gdGhlIGRtYS1idWYgaGVhcHMKK2ludGVyZmFjZS4KKworUmVxdWly
ZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogTXVzdCBiZSAiZG1hYnVmLWhlYXAtY21hIgor
LSBtZW1vcnktcmVnaW9uOiBwaGFuZGxlIHRvIGEgQ01BIHJlc2VydmVkIG1lbW9yeSBub2RlCisK
K0V4YW1wbGU6CitUaGlzIGV4YW1wbGUgaGFzIGEgY2FtZXJhIENNQSBub2RlIGluIHJlc2VydmVk
IG1lbW9yeSwgd2hpY2ggaXMgdGhlbgorcmVmZXJlbmNlZCBieSB0aGUgZG1hYnVmLWhlYXAtY21h
IG5vZGUuCisKKworCXJlc2VydmVkLW1lbW9yeSB7CisJCSNhZGRyZXNzLWNlbGxzID0gPDI+Owor
CQkjc2l6ZS1jZWxscyA9IDwyPjsKKwkJcmFuZ2VzOworCQkuLi4KKwkJY21hX2NhbWVyYTogY21h
LWNhbWVyYSB7CisJCQljb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CisJCQlyZWcgPSA8
MHgwIDB4MjRDMDAwMDAgMHgwIDB4NDAwMDAwMD47CisJCQlyZXVzYWJsZTsKKwkJfTsKKwkJLi4u
CisJfTsKKworICAgICAgIGNtYV9oZWFwIHsKKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
ZG1hYnVmLWhlYXAtY21hIjsKKyAgICAgICAgICAgICAgIG1lbW9yeS1yZWdpb24gPSA8JmNtYV9j
YW1lcmE+OworICAgICAgICB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
