Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90933BE4CA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 20:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47F86EEFC;
	Wed, 25 Sep 2019 18:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531B6EEF2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 18:42:56 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id h144so1429906iof.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Nfx7JTVu0PRWrPasNmIdEHuXDgbsCjZv1S3XWQFYKYg=;
 b=YcP05peDRmKO1Wo6QfUxWGMZm08oQbfNawoystUTaqtWx41FDs5CPHLd80XGOfd0tc
 51nh96AWqOUKXuIGJaUVH9/gkvF3EcBX6pfBCJGKE7i4GB9YTXwnK2qV1nNSCLqm1CIQ
 VlPXDUNulDtsX3v+XYPdpbj7l4B1yUQP1cWMzwQbplIYVaQuDypquYMPzNrSy0TKsBqP
 JGFY50DNy1FRYWSy7XgewEoN67rQziOg+pW93rOp3bJ9WkeFQLMfvKLMYN2HyPu0xYre
 eI06D4NaiP6MfIP4KNWZQsu5KnI2UXxllituJEk2Uc+tq8T7SPRGZ89jIro/Od8I8nba
 MHtQ==
X-Gm-Message-State: APjAAAX3YEjMuqhv1tV3Az5B4R+AC3nCT26e8p5nBCP3yysHnkY167pC
 qI8ahwo5O0sxQVH11SpyO54wSYuvDY4=
X-Google-Smtp-Source: APXvYqw8uBxXc+QlppeT9+fI+zXI803fXFhEr3c58w/+SY0fM0bf5aP9ub5Nm77ENx5/dzszjPUriQ==
X-Received: by 2002:a05:6602:c9:: with SMTP id z9mr929490ioe.28.1569436974866; 
 Wed, 25 Sep 2019 11:42:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id q17sm337511ile.5.2019.09.25.11.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:42:54 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM
 panel
Date: Wed, 25 Sep 2019 13:42:38 -0500
Message-Id: <20190925184239.22330-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925184239.22330-1-aford173@gmail.com>
References: <20190925184239.22330-1-aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Nfx7JTVu0PRWrPasNmIdEHuXDgbsCjZv1S3XWQFYKYg=;
 b=Ne1IyYexGmWAl3Gmd6YygaFJ+CaOKP/8+69myulVINwwdcCJmpXrSiqxVSvcGnVipp
 8597xWEGPKa+zJsDNcrkMnaTDzaPLbKFHI2P4GTQcd3mQg2kHI1kfJ6hx7w13iI4MJEX
 y7JN6wCC7yW7DUksLkOc8lTnL7d3fnwa5lKQlIM0NoL6wqGFQntcjW7vebHkDGuO2scA
 QlJfBI6ABPucYHGzd+a/1qsfsFXNZdVWMp99RBkx/Q1VrPyOumAPN/uG7CG4EvseBlZX
 1lNkYO2e+gaRXWIla01vlV2Oe1vE6pjnfOYPsw4x77JICtQkoADXLXVcwnFqLMrrfpy2
 QBog==
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
 Adam Ford <aford173@gmail.com>
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
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQpWMzogIE5vIGNoYW5nZQpWMjogIFJlbW92
ZSBsZWdhY3kgJ2xhYmVsJyBmcm9tIGJpbmRpbmcKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwppbmRleCAwN2FjOTliOWNkYTYu
LmNkYjg5YjNlMmE5YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbG9naWNwZC10b3Jw
ZWRvLTM3eHgtZGV2a2l0LTI4LmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9sb2dpY3BkLXRv
cnBlZG8tMzd4eC1kZXZraXQtMjguZHRzCkBAIC0xMSwyMiArMTEsNiBAQAogI2luY2x1ZGUgImxv
Z2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC5kdHMiCiAKICZsY2QwIHsKLQotCWxhYmVsID0gIjI4
IjsKLQotCXBhbmVsLXRpbWluZyB7Ci0JCWNsb2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKLQkJ
aGFjdGl2ZSA9IDw0ODA+OwotCQl2YWN0aXZlID0gPDI3Mj47Ci0JCWhmcm9udC1wb3JjaCA9IDwz
PjsKLQkJaGJhY2stcG9yY2ggPSA8Mj47Ci0JCWhzeW5jLWxlbiA9IDw0Mj47Ci0JCXZiYWNrLXBv
cmNoID0gPDM+OwotCQl2ZnJvbnQtcG9yY2ggPSA8Mj47Ci0JCXZzeW5jLWxlbiA9IDwxMT47Ci0J
CWhzeW5jLWFjdGl2ZSA9IDwxPjsKLQkJdnN5bmMtYWN0aXZlID0gPDE+OwotCQlkZS1hY3RpdmUg
PSA8MT47Ci0JCXBpeGVsY2xrLWFjdGl2ZSA9IDwwPjsKLQl9OworCS8qIFRvIG1ha2UgaXQgd29y
aywgc2V0IENPTkZJR19PTUFQMl9EU1NfTUlOX0ZDS19QRVJfUENLPTQgKi8KKwljb21wYXRpYmxl
ID0gImxvZ2ljcGQsdHlwZTI4IjsKIH07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
