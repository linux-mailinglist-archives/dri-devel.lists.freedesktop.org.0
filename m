Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F0365275
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3B6E13F;
	Thu, 11 Jul 2019 07:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CB26E11E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 18:11:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id k8so1621976plt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 11:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tkiQUH7jKLkTwFwCHjeNvDKd8Do7Dj+FovhMf1Vuvic=;
 b=KeU3W8BMQ5XZ4QEJ7bHqollhXaaqBRa8eJxDxoGepFP8FZZ128ST/6dBd0R4WLXEiD
 RUlcU8Dcxzg3C0QcePRxkYsW9ROz7gtYOuIgGgx7PB3uxKfCSqA34U4isnCQx8IMWKUS
 Wj6NTNTsYTRRjsgnc2Fxl+Bwnf2Z3smsr/VsqpllO1PPMTkBNEvnlavh6rlXfiUGFBZy
 RtaQxU+uNGf+lYuu7n8pMb7xSwolLX5sM9/VskH+D4yxCdyZ1v4F5HK07Uw0DZFa18hc
 ei2Ns06nSynEdREopspu/qcM8sERdLfdOBicaLJW7v7ZyLOUSm87Uu6IlhFj1UsUJsGs
 hIAg==
X-Gm-Message-State: APjAAAU9YAwHCth3A6KzrpK33slymgE6TqqLACUht2f4fWyACsgMpyKd
 fDkfFkLIKiPnda4mpwsn4WM=
X-Google-Smtp-Source: APXvYqyIm7dBPHQaeOhsZwKT4qMnmJ4MiYO6k+j5Dggp01zUoz5MZTRxBxhAwOD7Z0Ja+Sa3bMGAqw==
X-Received: by 2002:a17:902:9a95:: with SMTP id
 w21mr40075670plp.126.1562782262024; 
 Wed, 10 Jul 2019 11:11:02 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.16.82])
 by smtp.gmail.com with ESMTPSA id s193sm8046179pgc.32.2019.07.10.11.10.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 10 Jul 2019 11:11:01 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: adaplas@gmail.com,
	b.zolnierkie@samsung.com
Subject: [PATCH] video: fbdev: nvidia: Remove dead code
Date: Wed, 10 Jul 2019 23:46:26 +0530
Message-Id: <1562782586-3994-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tkiQUH7jKLkTwFwCHjeNvDKd8Do7Dj+FovhMf1Vuvic=;
 b=eHNzvQHZfuEWGmRvlZNBGGtTB7xHUpJw6zdvQOKaJTkoQY/Ik8OyEfgE6TapG82OLm
 CXlSWeNtwDVj7Sty7PQnddjjMsvJN61sj1IcUgQYBTl/ieHiZTORfxjM9CX7lL2dv9mE
 0kXrYzOhVqovdKceYEl2el/h8Ewk3HnuBW6VS6xhJQxy9TErXviuRpRFXKOgzT9sLeTy
 ww3ONk/P1aC69XA5pmvE6JtKQugquHjEA3rwwuqh6JEmRp2ajpvAGJ4SNldP54Xs9chQ
 WeGZh3TnRh3LXF935EacLaoNy1PcnmHntbjCf+VSXBTFPRxpu5gcia+ETnAh+78bTMAe
 9UqQ==
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sabyasachi.linux@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBkZWFkIGNvZGUgc2luY2UgMy4xNS4gSWYgdGhlcmUgaXMgbm8gcGxhbiB0byB1c2Ug
aXQKZnVydGhlciwgdGhpcyBjYW4gYmUgcmVtb3ZlZCBmb3JldmVyLgoKU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9mYmRldi9udmlkaWEvbnZfc2V0dXAuYyB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDI0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvbnZpZGlhL252X3NldHVwLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L252aWRpYS9u
dl9zZXR1cC5jCmluZGV4IGIxN2FjZDIuLjJmYTY4NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvbnZpZGlhL252X3NldHVwLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9udmlk
aWEvbnZfc2V0dXAuYwpAQCAtMTE5LDM0ICsxMTksMTAgQEAgdTggTlZSZWFkTWlzY091dChzdHJ1
Y3QgbnZpZGlhX3BhciAqcGFyKQogewogCXJldHVybiAoVkdBX1JEMDgocGFyLT5QVklPLCBWR0Ff
TUlTX1IpKTsKIH0KLSNpZiAwCi12b2lkIE5WRW5hYmxlUGFsZXR0ZShzdHJ1Y3QgbnZpZGlhX3Bh
ciAqcGFyKQotewotCXZvbGF0aWxlIHU4IHRtcDsKLQotCXRtcCA9IFZHQV9SRDA4KHBhci0+UENJ
TywgcGFyLT5JT0Jhc2UgKyAweDBhKTsKLQlWR0FfV1IwOChwYXItPlBDSU8sIFZHQV9BVFRfSVcs
IDB4MDApOwotCXBhci0+cGFsZXR0ZUVuYWJsZWQgPSAxOwotfQotdm9pZCBOVkRpc2FibGVQYWxl
dHRlKHN0cnVjdCBudmlkaWFfcGFyICpwYXIpCi17Ci0Jdm9sYXRpbGUgdTggdG1wOwotCi0JdG1w
ID0gVkdBX1JEMDgocGFyLT5QQ0lPLCBwYXItPklPQmFzZSArIDB4MGEpOwotCVZHQV9XUjA4KHBh
ci0+UENJTywgVkdBX0FUVF9JVywgMHgyMCk7Ci0JcGFyLT5wYWxldHRlRW5hYmxlZCA9IDA7Ci19
Ci0jZW5kaWYgIC8qICAwICAqLwogdm9pZCBOVldyaXRlRGFjTWFzayhzdHJ1Y3QgbnZpZGlhX3Bh
ciAqcGFyLCB1OCB2YWx1ZSkKIHsKIAlWR0FfV1IwOChwYXItPlBESU8sIFZHQV9QRUxfTVNLLCB2
YWx1ZSk7CiB9Ci0jaWYgMAotdTggTlZSZWFkRGFjTWFzayhzdHJ1Y3QgbnZpZGlhX3BhciAqcGFy
KQotewotCXJldHVybiAoVkdBX1JEMDgocGFyLT5QRElPLCBWR0FfUEVMX01TSykpOwotfQotI2Vu
ZGlmICAvKiAgMCAgKi8KIHZvaWQgTlZXcml0ZURhY1JlYWRBZGRyKHN0cnVjdCBudmlkaWFfcGFy
ICpwYXIsIHU4IHZhbHVlKQogewogCVZHQV9XUjA4KHBhci0+UERJTywgVkdBX1BFTF9JUiwgdmFs
dWUpOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
