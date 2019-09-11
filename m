Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB2B0941
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0F6EBD4;
	Thu, 12 Sep 2019 07:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8D76E222
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:35:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o12so26313273qtf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJD6iQtvN/UCjy4Ek8D93A8B4R/KlP3wDuq4/HX54Nk=;
 b=dPSkqM9OGUClhcGprDTNraqw8lTLHGxmEg/7toE8V5jsI7pZGvLM6F/XGpeDhG1LON
 KduIPps/XJCIckb27yw8zD2ITgzkdEvMQvyNEnaSQn2uG+k3Oc1qpS1Xja+vyPqV/BTy
 I9q9/GH8I+fSd8TVCfSL7KvI9WJmkFEJkwkVbEr9OLe+jDH521+QbCNYS2b44WfLDKxO
 A3lo3jGJY5NngfExeXlbM9h4JiBP+00J1bAOlz8c0Z8YegOBrzar7UGG1YRWlGEoqjvz
 Fz/qM3L3Bz0HpJi3Zae/3D5Ur9WQwYdnuOua9ZCEgxAQG445o+p1na98LjHiCjdZ4Eno
 0Q/Q==
X-Gm-Message-State: APjAAAUeMWPhapGwnRKjRlRgMf9XY1psnU+OkCz2QpGcz5q0C0QMunL0
 7LgbAu1N72rwAh3/etBBHk+WZA==
X-Google-Smtp-Source: APXvYqwcOywenx8LVLVD6JO3ednMqGYhwk73RQ5i92GZvWMV25FAZF2IFj/VjnedRzlUY75Dl91o7g==
X-Received: by 2002:aed:22cc:: with SMTP id q12mr37648607qtc.232.1568223320208; 
 Wed, 11 Sep 2019 10:35:20 -0700 (PDT)
Received: from ovpn-125-217.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id c204sm850853qkb.90.2019.09.11.10.35.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 10:35:19 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
Date: Wed, 11 Sep 2019 13:34:53 -0400
Message-Id: <20190911173453.958-1-cai@lca.pw>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJD6iQtvN/UCjy4Ek8D93A8B4R/KlP3wDuq4/HX54Nk=;
 b=ESsau/uU7KkgWzaER4y2/52TBwwEMzglevQZgPhz8mpsh/psDnnwjhgCfMZx2xn7RO
 pTQMc4weP+eRGMm7La/QZypjUcjwfXOSY31sJWbO9DllIrfBVvcSDUt15jbMJJ5IQnkr
 fNnSmRkOk62gX4p8GqROfsCMVJkvswWy3bjYmTudOEQNz3hvX2e1t+Df2R313l4H0CQ7
 xDhRgrN7QroVOiWA7CvNIccCpQ6PsgEbUr3mVULnSlr7MoIuZxR5jpA5CMZYoQMPR7xY
 CTfHGHAhQCmh+Th+AdcgeGVctHvcOXk7cadtaOtxfl2XVnRMAexGlG1idU8BFky60sgz
 u38g==
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, mripard@kernel.org,
 yamada.masahiro@socionext.com, Qian Cai <cai@lca.pw>,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbW1pdCBjMGUwOTIwMGRjMDggKCJkcm06IHJlb3JnYW5pc2UgZHJtIHRyZWUgdG8gYmUg
bW9yZSBmdXR1cmUKcHJvb2YuIikgY2hhbmdlZCB0aGUgYmVoYXZpb3IgZnJvbSBvbmx5IGNvbXBp
bGluZyBkcm0vIGlmIENPTkZJR19EUk09eQp0byBhbHdheXMgY29tcGlsaW5nIGRybS8uIFRoaXMg
cmVzdG9yZXMgdGhlIGJlaGF2aW9yLCBzbyBwZW9wbGUgZG9uJ3QKbmVlZCB0byB3YXN0ZSB0aW1l
IGNvbXBpbGluZyBzdHVmZiB0aGV5IGRvbid0IG5lZWQuCgpGaXhlczogYzBlMDkyMDBkYzA4ICgi
ZHJtOiByZW9yZ2FuaXNlIGRybSB0cmVlIHRvIGJlIG1vcmUgZnV0dXJlIHByb29mLiIpCi0tLQog
ZHJpdmVycy9ncHUvTWFrZWZpbGUgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L01ha2VmaWxlIGIv
ZHJpdmVycy9ncHUvTWFrZWZpbGUKaW5kZXggZjE3ZDAxZjA3NmM3Li5hNzkzYjlhY2UzNGIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1L01ha2VmaWxl
CkBAIC0zLDUgKzMsNiBAQAogIyB0YWtlbiB0byBpbml0aWFsaXplIHRoZW0gaW4gdGhlIGNvcnJl
Y3Qgb3JkZXIuIExpbmsgb3JkZXIgaXMgdGhlIG9ubHkgd2F5CiAjIHRvIGVuc3VyZSB0aGlzIGN1
cnJlbnRseS4KIG9iai0kKENPTkZJR19URUdSQV9IT1NUMVgpCSs9IGhvc3QxeC8KLW9iai15CQkJ
Kz0gZHJtLyB2Z2EvCitvYmotJChDT05GSUdfRFJNKQkJKz0gZHJtLworb2JqLXkJCQkJKz0gdmdh
Lwogb2JqLSQoQ09ORklHX0lNWF9JUFVWM19DT1JFKQkrPSBpcHUtdjMvCi0tIAoyLjIwLjEgKEFw
cGxlIEdpdC0xMTcpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
