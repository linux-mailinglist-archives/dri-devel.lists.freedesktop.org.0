Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BC95142
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4796E457;
	Mon, 19 Aug 2019 23:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934656E445
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:30 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id x15so2033368pgg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i6m141WDgWo2fEqKOTQPkh65ch/WaZ2zC8BGag2kGAk=;
 b=oIbZGgFGO+vQg3xwqWY4Ny2v3z+gI1s7Hdb/RD9HaNXkrvsb5ENdg/JPA4lSuFYzoU
 xpnYHYOFsTdPc7rZqfoYojXag7hqql+9xWYKeIpKaRmGMhDSTJrxE2IGXtlhq3P+GQXH
 lN78o7xbyw522/Ot7AEsx4QRQ01/V2xNPU9uI8d5UsqQh+zNwgtiEXMSDuWoxXq3NYsQ
 AfTUZVMbFF78eLegIWfdL5ukmGt3HXlkD6cokYlQ0hA3rL0pO9Bpfyg2lh01YH5A5Y33
 xVpPkHTJogL7PDEI8d+9bSg7TIVNAklagAxHBqcqEhgs4l7rRcdhwm8mbIbcC0rKaYfa
 Dc1w==
X-Gm-Message-State: APjAAAXbTcj/SZsKmoyqMIEgNufW2631eiI3qxeX7ayrc8Sc3+fiFnsF
 O/zhSYjqp4CAmjBd5Dp+O+aHyg==
X-Google-Smtp-Source: APXvYqwG9W4CfZHOjBvxvQuucJnsWPQbrgBVAkuIl+wmQF01BSo9fnI1CCwcy8t95kgUzAi6UtR7Qg==
X-Received: by 2002:a62:35c6:: with SMTP id c189mr26730739pfa.96.1566255810038; 
 Mon, 19 Aug 2019 16:03:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:29 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/25] drm: kirin: Remove unreachable return
Date: Mon, 19 Aug 2019 23:02:59 +0000
Message-Id: <20190819230321.56480-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i6m141WDgWo2fEqKOTQPkh65ch/WaZ2zC8BGag2kGAk=;
 b=HuR2cIhjFWz+4JWrKq4LPu+TjN9IyLdmlpABHg6FpMPw8pF218Oqvf9YVNMUAgT+ZQ
 sLeCCgC3vmOwiPEZyMojK3wG0zhYyUADo4mCJA2OUb1yEg4s0eGV/cZUycvnm9GR8fJ0
 Ufk4ce6n6CJ4LTnq4ttEKktmGl4lTrix5wNVKAGKa8Xxg2a/HdfZwWSMn1XyHStyImMX
 ArMe/zCWSjcBwhVq+ymr85UBC2LsCmjEKOE/xpvezdW1xE0a1Jxv0cbmaUzMKEduL6Qr
 I+pUxL83x/pgtjfyBOIACYuCJkkSGW9Wk2kM8d3mX3/9HXqoVqz8XmocHRndfednTYCy
 VVzg==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICdyZXR1cm4gMCcgaW4ga2lyaW5fZHJtX3BsYXRmb3JtX3Byb2JlKCkgaXMgdW5yZWFjaGFi
bGUKY29kZSwgc28gcmVtb3ZlIGl0LgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFja2VkLWJ5OiBYaW5saWFu
ZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU3VnZ2VzdGVkIGJ5OiBYdSBZaVBpbmcgPHh1eWlwaW5n
QGhpc2lsaWNvbi5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2Rydi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwppbmRleCAyMDRjOTRj
MDFlM2QuLmZjZGQ2YjFlMTY3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9r
aXJpbi9raXJpbl9kcm1fZHJ2LmMKQEAgLTIwOCw4ICsyMDgsNiBAQCBzdGF0aWMgaW50IGtpcmlu
X2RybV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCW9mX25v
ZGVfcHV0KHJlbW90ZSk7CiAKIAlyZXR1cm4gY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRj
aChkZXYsICZraXJpbl9kcm1fb3BzLCBtYXRjaCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGlj
IGludCBraXJpbl9kcm1fcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
