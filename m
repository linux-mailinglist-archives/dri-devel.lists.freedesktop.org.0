Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD9951D9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73F46E49E;
	Mon, 19 Aug 2019 23:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A6D6E497
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:48:49 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id m3so2078244pgv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lQDNdRIDsrfByKdWclsgiLu5o6EPo6fOoPt7hg1xhn8=;
 b=VpwaoYgPHooKAxJqPJ6rLP68f5MdGFA4qaEX9x+TXH5J/WCry91IXZHIfVu9f8cktz
 1OTN/p7eHJnn3UZr5S5Y7YNaqQrI/bSunY85um9YzDc7upsSMkLewd15bWyELdAdq9gs
 u/a0TtMllFjuBRTWWrw2Ivbfohcjxl4obuHDjekVmEOOsTTl9U7Lw141hsQHMaZ73GEl
 ibcMvizZgHcoAGO4m607WwIAVh9Fgbg2u6QGHJ8dlXriHB1Jna3zMek14qytUkQe1s9g
 iOkAHb8IBiJatWO0Qxeoo4Y53mvprc02heI7h6xh1btQjneYjQMEQ/Y88BfpQzOZRpuk
 7KWw==
X-Gm-Message-State: APjAAAVFFYQE4Nz7/UuPW9byLI9tGIVLj8lrPft997qhSJU7sqd/XC2c
 4sH3YndQrP28b5je6DEOHj/sPw==
X-Google-Smtp-Source: APXvYqyG2bGpvXD+cv5Riz6fGjbJ4+cU+bFTeZSKQxqoj5uquFux67PipWDb9QA2yJsp6eP5B6hVMg==
X-Received: by 2002:a63:f907:: with SMTP id h7mr16006795pgi.418.1566258529203; 
 Mon, 19 Aug 2019 16:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 185sm18769681pfa.170.2019.08.19.16.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:48:48 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: reset: hisilicon: Update compatible
 documentation
Date: Mon, 19 Aug 2019 23:48:39 +0000
Message-Id: <20190819234840.37786-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819234840.37786-1-john.stultz@linaro.org>
References: <20190819234840.37786-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lQDNdRIDsrfByKdWclsgiLu5o6EPo6fOoPt7hg1xhn8=;
 b=j+8970ObdyCKHy/+UoDrc+05m+hWvJNJG2qzOu88xTMa17yHAD64/pAdmkJoG3rUlq
 lh/kv8j6ql1G22DuIZWnIM2eEWBn9VNfepRJOjanpvwSXTEOCn68OaF/2zRyN+vXR/9i
 HHCy05NmdvzHJGDjT8nincGyBmkNrLgCWhAd4Jmf9Erzong/0UMNYo6utGEeFpk8cYJq
 uNIoijtzeu9wivPWDLWS86e0eYb64Af+T7A4ri/rxlXge0LO+FMZ5NmppKrv//vGeyeX
 J5Yn2OQdoscv+nvZX7oi7zZ1/VQVX9QC/Eh0qSY3nx7vbYritd+hiTXsqqktqOD8TtCH
 sMFg==
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

RnJvbTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgoKVGhlIHJlc2V0
IGRyaXZlciBub3cgc3VwcG9ydHMgdGhlIGFvIHJlc2V0IGNvbnRyb2xsZXIsIHNvIHVwZGF0ZSB0
aGUKZG9jdW1lbnRhdGlvbiB0byBtYXRjaC4KCkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZwpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1i
eTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZXNldC9oaXNpbGljb24saGk2MjIwLXJlc2V0LnR4dCAgICAgICAgIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvaGlzaWxpY29uLGhpNjIyMC1yZXNldC50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvaGlzaWxpY29uLGhpNjIy
MC1yZXNldC50eHQKaW5kZXggYzI1ZGEzOWRmNzA3Li5lYTBhNmE5NzM0YzEgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9oaXNpbGljb24saGk2MjIw
LXJlc2V0LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQv
aGlzaWxpY29uLGhpNjIyMC1yZXNldC50eHQKQEAgLTExLDYgKzExLDcgQEAgUmVxdWlyZWQgcHJv
cGVydGllczoKIC0gY29tcGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nOgog
ICAtICJoaXNpbGljb24saGk2MjIwLXN5c2N0cmwiLCAic3lzY29uIiA6IEZvciBwZXJpcGhlcmFs
IHJlc2V0IGNvbnRyb2xsZXIuCiAgIC0gImhpc2lsaWNvbixoaTYyMjAtbWVkaWFjdHJsIiwgInN5
c2NvbiIgOiBGb3IgbWVkaWEgcmVzZXQgY29udHJvbGxlci4KKyAgLSAiaGlzaWxpY29uLGhpNjIy
MC1hb2N0cmwiLCAic3lzY29uIiA6IEZvciBhbyByZXNldCBjb250cm9sbGVyLgogLSByZWc6IHNo
b3VsZCBiZSByZWdpc3RlciBiYXNlIGFuZCBsZW5ndGggYXMgZG9jdW1lbnRlZCBpbiB0aGUKICAg
ZGF0YXNoZWV0CiAtICNyZXNldC1jZWxsczogMSwgc2VlIGJlbG93Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
