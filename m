Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FAECA84
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 22:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282036F885;
	Fri,  1 Nov 2019 21:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A25B6F885
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 21:49:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y39so14951418qty.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 14:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teI1DLghbkzO5wLL0GxrdEtPxcMPjOo+NKTZqVKi+SE=;
 b=tO7Iz+iDcHdjCh3GPIjPoXGu9fcic11FRyY7nHZgrMll9F2bITAjnzuK+kKwRsNuAK
 h8ydiCSrzBTJh2sx8h2hjqIl1vdMuEUSMqLs6r+sbkZL1oZNsVQVcKCrDpdQfbOCV0z+
 Qq6cw8xeG5maP+K2PWBmn9KN+CpQBwjA6p9bbHccbdiVZ8qK8i6qFFHj1S63QblrF/W3
 3sY7pnJL68U88jnBeX2ZRpEhgOshDXtd4wa4oJDbWcQ5Vj8nL+FoVUyUvfWHz1THPvok
 46NqSwYrXWUp8XX7XlKQ29sPobyFlxOrJRpdHMcYeS+JELOvVk5KIbRpeWMykzNB+tiM
 +t4w==
X-Gm-Message-State: APjAAAXxfuf4JJhlEjVwI55FgSalZhflibtWjuXBet3MiMxiK8SlQY9y
 cXo7XVCyomdBn7V7wLxbxYANF2RGPW8=
X-Google-Smtp-Source: APXvYqzxXFjy6vj9cmkGY99TAQKijOReHqrYWkUSrAM6xdplggLgFqSITuGi43RFl9fKXdkgFnlxPg==
X-Received: by 2002:aed:24c1:: with SMTP id u1mr1711622qtc.29.1572644941501;
 Fri, 01 Nov 2019 14:49:01 -0700 (PDT)
Received: from GBdebian.ic.unicamp.br (wifi-177-220-84-14.wifi.ic.unicamp.br.
 [177.220.84.14])
 by smtp.gmail.com with ESMTPSA id w24sm5482300qta.44.2019.11.01.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 14:49:00 -0700 (PDT)
From: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
To: outreachy-kernel@googlegroups.com, manasi.d.navare@intel.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 trivial@kernel.org
Subject: [PATCH v2 VKMS 1/2] drm/vkms: Fix typo and preposion in function
 documentation
Date: Fri,  1 Nov 2019 18:48:47 -0300
Message-Id: <20191101214848.7574-2-gabrielabittencourt00@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
References: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teI1DLghbkzO5wLL0GxrdEtPxcMPjOo+NKTZqVKi+SE=;
 b=gVxuR3zJe7/on/OD92OUcrkCSlejDtRr92hn2Dsdd4c/1Bh4pmhEr/n2988Emyt7Vq
 ZN5xaEPUenefaszAE2d11Li1/MDzl8yzFDrRc+/AoeuRbs951t/ZELIfMflUiR7dfurn
 ZZlw22wpXYFQfv+5DGNVYi8TP+WbKlnlvVSLReO/Sk9Lx3zyrnwmJfX81J42y/o45Yoz
 PqPbgg+NLRcpGtSbne1AIw+zC5+72NNAbF00+lrWE3ypqxM9EzyzG6S1rudd0gBnOSbH
 rN0ZJNrAcPyuoQnIBwN0sQcOe1kyoQtU+xdmCJ2OnXxyW22ZFqDlJPCOMJNkR8W8g5er
 yLbQ==
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
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHR5cG8gaW4gd29yZCAnYmxlbmQnIGFuZCBpbiB0aGUgd29yZCAnZGVzdGluYXRpb24nIGFu
ZCBjaGFuZ2UKcHJlcG9zaXRpb24gJ2F0JyB0byAnb2YnIGluIGZ1bmN0aW9uICdibGVuZCcgZG9j
dW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEdhYnJpZWxhIEJpdHRlbmNvdXJ0IDxnYWJyaWVs
YWJpdHRlbmNvdXJ0MDBAZ21haWwuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIEFkZCBmaXhp
bmcgdHlwbyBpbiB3b3JkICdkZXN0aW5hdGlvbicKLSBBZGQgY2hhbmdlIG9mIHRoZSBwcmVwb3Np
dGlvbgotIEluIHYxIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbiB3YXMgd3JvbmcsIGZpeCBpdCBp
biB0aGlzIHZlcnNpb24KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKaW5kZXggZDU1ODU2OTVjNjRkLi44
ODg5MGRkZmM0YmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9z
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NvbXBvc2VyLmMKQEAgLTQzLDE2
ICs0MywxNiBAQCBzdGF0aWMgdWludDMyX3QgY29tcHV0ZV9jcmModm9pZCAqdmFkZHJfb3V0LCBz
dHJ1Y3Qgdmttc19jb21wb3NlciAqY29tcG9zZXIpCiB9CiAKIC8qKgotICogYmxlbmQgLSBiZWxu
ZCB2YWx1ZSBhdCB2YWRkcl9zcmMgd2l0aCB2YWx1ZSBhdCB2YWRkcl9kc3QKKyAqIGJsZW5kIC0g
YmxlbmQgdmFsdWUgYXQgdmFkZHJfc3JjIHdpdGggdmFsdWUgYXQgdmFkZHJfZHN0CiAgKiBAdmFk
ZHJfZHN0OiBkZXN0aW5hdGlvbiBhZGRyZXNzCiAgKiBAdmFkZHJfc3JjOiBzb3VyY2UgYWRkcmVz
cwogICogQGRlc3RfY29tcG9zZXI6IGRlc3RpbmF0aW9uIGZyYW1lYnVmZmVyJ3MgbWV0YWRhdGEK
ICAqIEBzcmNfY29tcG9zZXI6IHNvdXJjZSBmcmFtZWJ1ZmZlcidzIG1ldGFkYXRhCiAgKgogICog
QmxlbmQgdmFsdWUgYXQgdmFkZHJfc3JjIHdpdGggdmFsdWUgYXQgdmFkZHJfZHN0LgotICogQ3Vy
cmVudGx5LCB0aGlzIGZ1bmN0aW9uIHdyaXRlIHZhbHVlIGF0IHZhZGRyX3NyYyBvbiB2YWx1ZQor
ICogQ3VycmVudGx5LCB0aGlzIGZ1bmN0aW9uIHdyaXRlIHZhbHVlIG9mIHZhZGRyX3NyYyBvbiB2
YWx1ZQogICogYXQgdmFkZHJfZHN0IHVzaW5nIGJ1ZmZlcidzIG1ldGFkYXRhIHRvIGxvY2F0ZSB0
aGUgbmV3IHZhbHVlcwotICogZnJvbSB2YWRkcl9zcmMgYW5kIHRoZWlyIGRpc3RlbmF0aW9uIGF0
IHZhZGRyX2RzdC4KKyAqIGZyb20gdmFkZHJfc3JjIGFuZCB0aGVpciBkZXN0aW5hdGlvbiBhdCB2
YWRkcl9kc3QuCiAgKgogICogVG9kbzogVXNlIHRoZSBhbHBoYSB2YWx1ZSB0byBibGVuZCB2YWRk
cl9zcmMgd2l0aCB2YWRkcl9kc3QKICAqCSBpbnN0ZWFkIG9mIG92ZXJ3cml0aW5nIGl0LgotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
