Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7731DF650
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D496E1E6;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBB26E14D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:15:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w64so9580144wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
 b=W1EQgOzYXSJQprjQLjvwtwJslRvrFbEUVhfTY06l99jlCnYkt0QrECz4ixvFb+WzkF
 nI5KWI9hssaaSX0BF/ddFhWF+YZwDoqE/JvniLs6z4NRUltpgVrkVVzc6YGvwjHxjR61
 rsMhc5f3wyCCj08QWQq2x5BAoCTxbaaiKhZBVts4UiaobRd/E4UPwgStLYpEcyBRD8nz
 VAsZiCjCtQQOAgvPObvDR0Eq9uIbCLYVEU59KtTQLieH3H89HUjqITJhUO+SNIfYa1R4
 L7p5yIUoOLPyibrL1KFoerfbax7JzrmV9gDnkzxWCalRSO83m1yUuHpmvkEST4KltoWo
 bM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
 b=MVaT6K/HAXS1FB1at4IQgksMTC36Bcxa/uyJ9LPp8WlLizttlSa3/tdJM9+milXX6d
 HUjMi0PNS9qP5hZaiZ9a/ega3lNWJP7EC7VZY+Bacdx7TVH8EyDy7/UNvVc6yRhF+c5E
 0BaRNejGiIcue/um9+m3NiLqXwshZm/kUAZJ4vky68LBfUX+DewURL5LZkG/8TxCP6Gn
 EpVjUQuLjrx+BHonl4lJikCzmjaWHWOl0iC5XJbqkpyYeTOeD8ptY6jeK78btaFh9IVb
 RAQjMjoJSSYJkxxB03rHoG0vYSxcJcnco/lLv3gznMOJQkyHbjjPEWGGHLaIpjSjyv8i
 Rs1w==
X-Gm-Message-State: AOAM533sBAa+aEXRV5npOga0AfHN5YnUS7vBrpcSQ2BOGj7xqQrONROO
 5lTvMCsQ7iKvK8RzE3kCaHg=
X-Google-Smtp-Source: ABdhPJzx/3cvIYVr1YzP8V+5en8oMTO7gk7yIRawx1VQsZ5Waso3HWY83zQu4HfIjZirndiO+apE1Q==
X-Received: by 2002:a1c:3bc2:: with SMTP id
 i185mr12764224wma.157.1590149731455; 
 Fri, 22 May 2020 05:15:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Fri, 22 May 2020 14:15:23 +0200
Message-Id: <20200522121524.4161539-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
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
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6IG5vIGNoYW5nZXMuCiB2Mzogbm8gY2hhbmdlcy4KIHYy
OiBhZGQgbmV3IHBhdGNoLgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YnJjbSxicmNtbmFuZC50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNt
LGJyY21uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJj
bSxicmNtbmFuZC50eHQKaW5kZXggMDU2NTFhNjU0YzY2Li40NDMzNWE0ZjhiZmIgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21u
YW5kLnR4dApAQCAtMjAsNiArMjAsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAgICAgICAg
ICAgICAgICAgICAgImJyY20sYnJjbW5hbmQiIGFuZCBhbiBhcHByb3ByaWF0ZSB2ZXJzaW9uIGNv
bXBhdGliaWxpdHkKICAgICAgICAgICAgICAgICAgICAgIHN0cmluZywgbGlrZSAiYnJjbSxicmNt
bmFuZC12Ny4wIgogICAgICAgICAgICAgICAgICAgICAgUG9zc2libGUgdmFsdWVzOgorICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjIuMQorICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyY20sYnJjbW5hbmQtdjIuMgogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20s
YnJjbW5hbmQtdjQuMAogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjUu
MAogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjYuMAotLSAKMi4yNi4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
