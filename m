Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFA2AB74
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 19:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACBA8982F;
	Sun, 26 May 2019 17:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F4894FF;
 Sun, 26 May 2019 17:35:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m15so12667604ljg.13;
 Sun, 26 May 2019 10:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ov3YiOQUhcSdLV9EpPx++/P7FQBeylt5HUv2IEfDl3I=;
 b=VcJdkianebGpHqIx3H9FWvzX8rv5AxiE8bVMNgwVkwYZ3iC4b0TM8TCereisM73HX/
 0GpTo+ZxJdWVJNbD/8oAZLuP05QqOlBSYEYLHxCjUEyOgpEErnbfw+GTD7jAUHiqBkDJ
 ffwQsa+7pESghHLVlXFhdvNbjwg/+YKLkE2YUT6KYxeBY+9JEmTSjtDkiVZwsVeuamld
 ZrxANEVuT94ZlDEbmRoWMtiQI/xvkKQ12K7XmceefC1+DRp45fwjwSUwQMFL76jEYJLM
 b7emK2jbCCZMXY7u/oP62KNzqOzILV55VBhyLgvIQFsLAYRACCtzm6j7ePtRCmj3wFqY
 fcag==
X-Gm-Message-State: APjAAAVJuchk2WOkuBXHWuSPmIvaz/Rz/8LIOcSg6YwSXIPSR8Lth13U
 A2RMOt/MBOd0I/WNvW1QJ3a09njm
X-Google-Smtp-Source: APXvYqzOwA2vDK7F7Wv4ls8Od5RV3yhBr6kvCIUYp//mg2R6nJ7YiqBKDo7XAcGjKV/+dAjLPZt+Pg==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr32861627lji.136.1558892148571; 
 Sun, 26 May 2019 10:35:48 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n9sm1774489ljj.10.2019.05.26.10.35.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 10:35:48 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm: make drm_legacy.h self-contained
Date: Sun, 26 May 2019 19:35:33 +0200
Message-Id: <20190526173535.32701-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190526173535.32701-1-sam@ravnborg.org>
References: <20190526173535.32701-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ov3YiOQUhcSdLV9EpPx++/P7FQBeylt5HUv2IEfDl3I=;
 b=hK3MuhpcKP+OCq+P70VK4t/oOpIYnXSBejUPIWG3GSwLptx+2hikymYfYv/1eqQARQ
 GAV9PMeKBU4QQwqwATZpLbW/pkpGqChCoK1bJ7RsXAw9hjm4Oob+cyHBf3Acqqf/h861
 jZ2jDcYxcMnzN4Q+bQb72Z3ylefJBq/1/pkRqSaL2k5WU6WI9HNxwAjG3xCRqKCpLN9S
 rlPIj+L6fVrauIssPXIiRBr3bJIirWL9+GaKFc79XEjOlMwlNgxklezvTXbtB9MRtYSw
 nepZcEoCfqcNmjVaUBLgc81jl1jspAZ2qRMTE2zI7kYA9B4OCZDO937UGIXWIaRVwmkG
 No/Q==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG8gbm90IHJlcXVpcmUgdXNlcnMgb2YgZHJtX2xlZ2FjeS5oIHRvIGluY2x1ZGUgb3RoZXIKZmls
ZXMganVzdCB0byBsZXQgaXQgYnVpbGQKClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9sZWdhY3kuaCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5oCmluZGV4IDAxM2NjZGZkOTBiZS4uMWJlM2Vh
MzIwNDc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlZ2FjeS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbGVnYWN5LmgKQEAgLTI5LDExICsyOSwxNSBAQAogICogZHJpdmVy
cyB1c2UgdGhlbSwgYW5kIHJlbW92aW5nIHRoZW0gYXJlIEFQSSBicmVha3MuCiAgKi8KICNpbmNs
dWRlIDxsaW51eC9saXN0Lmg+CisKKyNpbmNsdWRlIDxkcm0vZHJtLmg+CisjaW5jbHVkZSA8ZHJt
L2RybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2xlZ2FjeS5oPgogCiBzdHJ1Y3QgYWdw
X21lbW9yeTsKIHN0cnVjdCBkcm1fZGV2aWNlOwogc3RydWN0IGRybV9maWxlOworc3RydWN0IGRy
bV9idWZfZGVzYzsKIAogLyoKICAqIEdlbmVyaWMgRFJNIENvbnRleHRzCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
