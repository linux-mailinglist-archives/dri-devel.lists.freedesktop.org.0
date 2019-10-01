Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34BC4469
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 01:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19066E8CB;
	Tue,  1 Oct 2019 23:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED1F6E8CC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 23:39:50 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u8so52611961iom.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 16:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
 b=DAW09AFOaI7tYLrmlgPpj6eRWoONsbRe2krs++m1AvV3uHIANPh+Lrv8gRVtbcNKJw
 MHStbmCc1J4fkiU4bay6USbrlEm3zdon4HrEzvXmib5tPIlupaxI7FQf6BLHyQNTii09
 arfFtUigw9e8z4+9RHEbgynXW5C8CZV/GMC4tJQer5h4voTHu0/1PV3n/5SCvm9Oj1MD
 Hw2UlkgxX+D5jdBeozR8WTxSqDD7e5/0ehxsRLnwMxcOmhuWMrAjTdosnEw4IKUWpO82
 zzszLEWCDWAP0HdBsdtEI8s1Xwo7UOgYpCfUyKQIwuwI8EhQhaApy0pAbmIx8bzZdqLl
 5imA==
X-Gm-Message-State: APjAAAWPCiqNaJr1pU4sfytOq8zk/J5jHIRqdPn93IjF4hY74etDfcqo
 hNgVS8eatIZzUgW3gUkQT/e7LAOlDE0=
X-Google-Smtp-Source: APXvYqy4qifIuV3uXjVmLyj/P9fmIFx/f/pEw5vONAuRa7jHVpmKT9t9pDPuxlKh2izbbpKZGI5FbQ==
X-Received: by 2002:a92:1559:: with SMTP id v86mr820194ilk.130.1569973189265; 
 Tue, 01 Oct 2019 16:39:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 16:39:48 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Tue,  1 Oct 2019 18:39:23 -0500
Message-Id: <20191001233923.16514-6-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
 b=DNOUBVmVUAypCrPEcDm3GsIKmKDVicfDkI4NfruqmYi2MbnOdkXuQs2Hz45pZdKkXP
 tQ8LxfGcTS8aExdl0rNn7GFyd+jpdJ0HQkik2f14QyjgMJu4MWa7nZUeDWbS4HTnivc4
 mZGOByd/VTLmvEpH9QvFam1pMSxa0F3bFvzbBfk5lYVcOJwA2lz7vl0qxcwkIkW1Y58w
 OhmFkSTbCGXaUlfxXD5sPggnlSdIIsRuJCrbbcAVvIMb8p5RCFKEcxTpstSB54rK1NbJ
 yPq7hRfuuMWFF8lnjYYrApUgOMCcSjRLKS4O/IDjL9cXqDM8eB+mpJTU6YkzzHQgKDMy
 O7Xw==
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
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 adam.ford@logicpd.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgcGFuZWwtZHBpIGZyb20gdGhlIG9tYXAgZHJpdmVycywg
dGhlCkxDRCBubyBsb25nZXIgd29ya3MuICBUaGlzIHBhdGNoIHBvaW50cyB0aGUgZGV2aWNlIHRy
ZWUgdG8KYSBuZXdseSBjcmVhdGVkIHBhbmVsIG5hbWVkICJsb2dpY3BkLHR5cGUyOCIKCkZpeGVz
OiA4YmY0YjE2MjExNzggKCJkcm0vb21hcDogUmVtb3ZlIHBhbmVsLWRwaSBkcml2ZXIiKQoKU2ln
bmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+CkFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpWNDogIE5vIENoYW5nZQpWMzogIE5vIGNo
YW5nZQpWMjogIFJlbW92ZSBsZWdhY3kgJ2xhYmVsJyBmcm9tIGJpbmRpbmcKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzIGIv
YXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwppbmRl
eCAwN2FjOTliOWNkYTYuLmNkYjg5YjNlMmE5YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cworKysgYi9hcmNoL2FybS9ib290
L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzCkBAIC0xMSwyMiArMTEsNiBA
QAogI2luY2x1ZGUgImxvZ2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC5kdHMiCiAKICZsY2QwIHsK
LQotCWxhYmVsID0gIjI4IjsKLQotCXBhbmVsLXRpbWluZyB7Ci0JCWNsb2NrLWZyZXF1ZW5jeSA9
IDw5MDAwMDAwPjsKLQkJaGFjdGl2ZSA9IDw0ODA+OwotCQl2YWN0aXZlID0gPDI3Mj47Ci0JCWhm
cm9udC1wb3JjaCA9IDwzPjsKLQkJaGJhY2stcG9yY2ggPSA8Mj47Ci0JCWhzeW5jLWxlbiA9IDw0
Mj47Ci0JCXZiYWNrLXBvcmNoID0gPDM+OwotCQl2ZnJvbnQtcG9yY2ggPSA8Mj47Ci0JCXZzeW5j
LWxlbiA9IDwxMT47Ci0JCWhzeW5jLWFjdGl2ZSA9IDwxPjsKLQkJdnN5bmMtYWN0aXZlID0gPDE+
OwotCQlkZS1hY3RpdmUgPSA8MT47Ci0JCXBpeGVsY2xrLWFjdGl2ZSA9IDwwPjsKLQl9OworCS8q
IFRvIG1ha2UgaXQgd29yaywgc2V0IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTQg
Ki8KKwljb21wYXRpYmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKIH07Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
