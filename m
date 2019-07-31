Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA51F7D00F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 23:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB623898AF;
	Wed, 31 Jul 2019 21:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2E898A8;
 Wed, 31 Jul 2019 21:29:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so71348295wru.0;
 Wed, 31 Jul 2019 14:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HSy0rYG9uBcYIyqQPeUAuVNgUBcUeioyNQIFQ4wc9Y0=;
 b=jX95Fzh64hspKRTj36nq20rNw0rq+bsc9CjnPB+urTuJxSee4gQb87vbA8z2VRJdmd
 TEQpjKWNGIylPhLxQhpuT95is7cMkXqWjs2eXi1prx+56S796q64JL+RBKovNsZ+SV0E
 vyFLA0V4N2hqXv5eYQVwJDyb2sBOIMgh+438tY6BXi5WDq7wxe5hq0DCPNPvKmIPhq1H
 45QkJiw5SA35ZqBGQtpoe8HwRmay0YaQZfzw00A+vKW6qvCE6nfU6pKrs43UiCiVFLeJ
 4EqWDsfaj9s1KK6yEyqNebFTTCnFK6jLZhwo/iLnp78hOEzr8z2UhExI8lCZr98MnqwR
 y3jA==
X-Gm-Message-State: APjAAAV4lQsthMyYiq0k6T/+5oDSr06i/41OaxAFSzhjUzoNTMmLs3r+
 ZiR3fFNIKSiYWBwszcL8KIfWmMy0sWo=
X-Google-Smtp-Source: APXvYqy2qmxPhS419YEHPGSjTZUhKavfZZl3N9yADnTs1KK+yIiM7tL+ygD/Qz7NoWfHGWRKjGcTfQ==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr14372838wrw.64.1564608586309; 
 Wed, 31 Jul 2019 14:29:46 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id x16sm52168345wmj.4.2019.07.31.14.29.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 14:29:45 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] etnaviv: fix whitespace errors
Date: Wed, 31 Jul 2019 23:29:44 +0200
Message-Id: <20190731212944.3819-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HSy0rYG9uBcYIyqQPeUAuVNgUBcUeioyNQIFQ4wc9Y0=;
 b=UV/SW/sl6WXbaPbKzWMCL4T319HTMOJajUXMvvaTpxatXtykQSpF/iaOr9Is/1xsJw
 SA0iiIsk6PH8uhPyN6JDhOdF6mr1raeABH4dIBchNiJiuHVNiK1W69SgVR8bJv1Pc4zk
 TtHXKzL8LDzzTqaG/akuUlIKDwqP3VTkLU988S9Fs94KQKmydI5101a80v2puaCXcQny
 Bh0dZsL5D9tR4dEEG2apg8QeZZKinkLUibT+J33LzMQt1ulXHH7F6s5xuhvwljhMmaTa
 uT+aWSgY8fLItbYYSj0PjkkXArSuFvlMk4CPlERW51UA5Ws2+L2twkvpi5HX2mycvIMI
 HXqg==
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCmluZGV4IDQyMjdhNDAwNmMz
NC4uMDZlNmQzZWUxYzM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X3BlcmZtb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZt
b24uYwpAQCAtMTUsOCArMTUsOCBAQCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWwgewogCXUzMiBk
YXRhOwogCiAJdTMyICgqc2FtcGxlKShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKLQkgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tYWluLAotCSAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpOworCQkJCSAgY29u
c3Qgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluICpkb21haW4sCisJCQkJICBjb25zdCBzdHJ1Y3Qg
ZXRuYXZpdl9wbV9zaWduYWwgKnNpZ25hbCk7CiB9OwogCiBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21h
aW4gewotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
