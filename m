Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02D1DF653
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2956E1D2;
	Sat, 23 May 2020 09:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7906E99A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 07:25:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g12so7937335wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
 b=aSBx059HVjfRZfYYo4tcdNKvhRS60qhw9XTOESwG7HB/GkNu9mep0pZvm/YIhUT2tj
 WLLdW5JyDPTNRc0+tvgqXqnA+C3fJ61PNaVOMzpslIUUfbL2ckAqfqBCmEah9PkCwQGq
 EgvzT/KTrGaaybjAtO2Egrf4DjOkEOeF/NOm/TDSgd7tKCxIGt0/B1l8ZpISpUkUwNat
 BOAXjPUas3lzvtT41X/ZG/Ndy04BqemTVltecc75kPqOX2iR2E9VP3pQ3ufDWXruBhlF
 I2oADb+qEwxx7mg4qG9iw9lQoAX/QkuxDxpHoAtMvlThdtZL+oUzb/hhDsvGVjgKMQ/9
 oHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
 b=QyLAzGIw0mg1Zpmk/nh8SylkmWSvP3AZcn+WO5ilEuNuqghGIA+1EI81wgNXplQzAD
 CBbW6n3d6dNWwZsRFW3IkT0iBJxheaG/SrGIMDwAeOQZmhPPVKQCsCOQ04+u0KV0oSwQ
 bCrKw8mm10E+nmZ4E97s+j+w6R5zdtFg3p+vsFZ3g/XW6DzN2G30nGqIsSH+oUm7SLmp
 fuUN4qlexkey521pJv6ZQfOztDsWeRAVooFJxpt4/DfEwiqAXcZUrM6HbTnkzoSMyKz9
 6NZR6YZL5bFRgQ9BwA9ZeJfPvhVB8t8YvxoD0UZDp7E+IY1fScASYbkt+U0+Y6Vyu+kq
 zuNg==
X-Gm-Message-State: AOAM532lR6VGp84RQzCJr/rTHK+tG3ffLMv/IdwtajnnMVag58pt+EXt
 g512wK57DS4uRhZG2bdYdGA=
X-Google-Smtp-Source: ABdhPJzjAc5EN2K3mse8zYF53gQPuxy/iTC2y7LkytXy6k11JuJnEwAzwliXSlmQ81PWickoLvPEYw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr2349097wrt.249.1590132332654; 
 Fri, 22 May 2020 00:25:32 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:32 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Fri, 22 May 2020 09:25:24 +0200
Message-Id: <20200522072525.3919332-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIgYXMgcG9zc2li
bGUgY29tcGF0aWJsZQpzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMgdjIu
MSBhbmQgdjIuMi4KClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjM6IG5vIGNoYW5nZXMuCiB2MjogYWRkIG5ldyBwYXRjaC4K
CiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0Cmlu
ZGV4IDA1NjUxYTY1NGM2Ni4uNDQzMzVhNGY4YmZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKQEAgLTIwLDYg
KzIwLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgICAgICAgICAgICAgICAgICAgICJicmNt
LGJyY21uYW5kIiBhbmQgYW4gYXBwcm9wcmlhdGUgdmVyc2lvbiBjb21wYXRpYmlsaXR5CiAgICAg
ICAgICAgICAgICAgICAgICBzdHJpbmcsIGxpa2UgImJyY20sYnJjbW5hbmQtdjcuMCIKICAgICAg
ICAgICAgICAgICAgICAgIFBvc3NpYmxlIHZhbHVlczoKKyAgICAgICAgICAgICAgICAgICAgICAg
ICBicmNtLGJyY21uYW5kLXYyLjEKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21u
YW5kLXYyLjIKICAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY0LjAKICAg
ICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY1LjAKICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmNtLGJyY21uYW5kLXY2LjAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
