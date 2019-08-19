Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF0951DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AE16E499;
	Mon, 19 Aug 2019 23:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6139B6E499
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:48:51 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w2so2145370pfi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jxj+2KZBWtI0JOpMk5ZJCeu1tAsbbFil+Y5lPkm52H0=;
 b=ZuMSzt0T8SQ5BoaMPyy6l6QpV63RdQeGF79ueD/IoUSWaaOjLQ9lNziz+Omx2wL5Sr
 Q9ATiOUic35/kscpvE0b80dk9B/qAXtWIu+Vr39+yH/LLyx59n7EibwmH5OCd4//sdcn
 b7OIwHIdYIu3UpHeSewpjeetyHnlYb0JtS6e5OAi5ZBv6byIgIwvfvT6Brj7oQkcS8Ra
 DYcsT3X8DtHx4rbiWzv9z+ptayCFWECD3ZVPrUyIrggBO6IjBQ/xFKooGlJd2+ZdIfua
 Hc7MkJ/HPYy7Izfa1an6dTvt8N9v02Ip45EXWsCAzuifrC7Dcpfxn/ZlAok50rkRM9Zg
 haWg==
X-Gm-Message-State: APjAAAWZNDiiZW0ZSM0XOzWUd+2CsA3ogQQIF7aQmuuDsQcM+YLjW5nC
 6clqdKXZCe4XKBebjQRRQHQrKw==
X-Google-Smtp-Source: APXvYqxDZJWpa+rGG7aHYapq5x9JNeNVXRKzvW0GVlc0jWWCMSrxU1NQ4LMuf5Vx7sh6EKVz9sl47Q==
X-Received: by 2002:a65:68cd:: with SMTP id k13mr22123663pgt.411.1566258530724; 
 Mon, 19 Aug 2019 16:48:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 185sm18769681pfa.170.2019.08.19.16.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:48:50 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: reset: hisilicon: Add ao reset controller
Date: Mon, 19 Aug 2019 23:48:40 +0000
Message-Id: <20190819234840.37786-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819234840.37786-1-john.stultz@linaro.org>
References: <20190819234840.37786-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jxj+2KZBWtI0JOpMk5ZJCeu1tAsbbFil+Y5lPkm52H0=;
 b=IQ80pFZQbJTfI6qmkgm+X+z7T8DmQFSexAjS798jPAeYmmSZvKqg06wlrUWHjTqetS
 pHe2HzyMwsb87YS2RnHuQkyNUaEAfCUbelgxXpsrVrA4jVavbmh5+RqRvrKSUL2gDSBq
 HNzka37Lk81sHpP1Y4riaLwTV71A38hbWVOZCBafoKC78lXSVf3bVUbYMOA6VZQ6LYA8
 rwcLSCBDQ2AeHiQpblEGOT+1ZHQuzRIDHmtEbrbzPypjmYgkvsqHYNRWlHow0JAT8DDm
 mokqDCa9u+jye8pLY5XmDAMyT0QgAhT4ezy4EmbVCCydamwAQ+lDBzjVIWGOgd4AYvla
 GRFQ==
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgoKVGhpcyBpcyBy
ZXF1aXJlZCB0byBicmluZyBNYWxpNDUwIGdwdSBvdXQgb2YgcmVzZXQuCgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KQ2M6IE1hcmsgUnV0bGFuZCA8
bWFyay5ydXRsYW5kQGFybS5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJv
bml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+ClNpZ25lZC1vZmYtYnk6IFBldGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9y
Zz4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0t
LQogaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9oaXNpLGhpNjIyMC1yZXNldHMuaCB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHQtYmluZGluZ3MvcmVzZXQvaGlzaSxoaTYyMjAtcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJp
bmRpbmdzL3Jlc2V0L2hpc2ksaGk2MjIwLXJlc2V0cy5oCmluZGV4IGU3YzM2MmE4MWE5Ny4uNjNh
ZmY3ZDhhYTQ1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2hpc2ksaGk2
MjIwLXJlc2V0cy5oCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvaGlzaSxoaTYyMjAt
cmVzZXRzLmgKQEAgLTczLDQgKzczLDExIEBACiAjZGVmaW5lIE1FRElBX01NVSAgICAgICAgICAg
ICAgICAgICAgICAgNgogI2RlZmluZSBNRURJQV9YRzJSQU0xICAgICAgICAgICAgICAgICAgIDcK
IAorI2RlZmluZSBBT19HM0QgICAgICAgICAgICAgICAgICAgICAgICAgIDEKKyNkZWZpbmUgQU9f
Q09ERUNJU1AgICAgICAgICAgICAgICAgICAgICAyCisjZGVmaW5lIEFPX01DUFUgICAgICAgICAg
ICAgICAgICAgICAgICAgNAorI2RlZmluZSBBT19CQlBIQVJRTUVNICAgICAgICAgICAgICAgICAg
IDUKKyNkZWZpbmUgQU9fSElGSSAgICAgICAgICAgICAgICAgICAgICAgICA4CisjZGVmaW5lIEFP
X0FDUFVTQ1VMMkMgICAgICAgICAgICAgICAgICAgMTIKKwogI2VuZGlmIC8qX0RUX0JJTkRJTkdT
X1JFU0VUX0NPTlRST0xMRVJfSEk2MjIwKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
