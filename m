Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BDC10AB6D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA646E1F8;
	Wed, 27 Nov 2019 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C1589D40
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:13:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b11so2511388wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 02:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=el/FpqOcsaC4sI4snGd/4tXRjMT6hnOv5XPSv5sNfp0=;
 b=abivWBrjw//LqPFH5KnU5oz1V1n+khbgAKnfuk6Mb7l70Vjv5/fWZ3Xonmr4ZjgyVW
 4MPYvI53Sj78EkkKXWw9KVDlOqA65Nz27loAN9i7vmuNPv8ommyV7zerCMlAHOWCJA55
 vfvlRy1RByRk5iyPmgX1xqLJfjm5iI1cqjwZID6g2JcfeYCO3ht65N+uPyUgdRRcGWQx
 /p8PdHruldjXe1pVU972X7iSGoYM7HqTGt2aAjGT639CzM1tauyOcblUERXow1PXBZgB
 t8i0D+nz6/O+U/F5yaMSM/dZwf+gj0NkV3rtvnY1jl2rr+BbQrLfJ0cjMNXOTf2QFJzI
 NguQ==
X-Gm-Message-State: APjAAAUvjnYiTwO0Qm2184W53iYpqUdgveJyyEPh7LX2GF1+3Pp/CZfI
 IpALku9nsVkFyoc/msElqQ==
X-Google-Smtp-Source: APXvYqx+juliVqLJsGm3ametfniK+SlcdPqQueJDWTqi7mBCn6dDn+3hojDZoVjKS6gogY/tip54Lw==
X-Received: by 2002:a05:600c:2103:: with SMTP id
 u3mr3659033wml.150.1574763210066; 
 Tue, 26 Nov 2019 02:13:30 -0800 (PST)
Received: from ninjahub.lan (host-2-102-12-67.as13285.net. [2.102.12.67])
 by smtp.googlemail.com with ESMTPSA id o7sm14826392wrv.63.2019.11.26.02.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 02:13:29 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: christian.koenig@amd.com
Subject: [PATCH] gpu: ttm: add __releases function
Date: Tue, 26 Nov 2019 10:13:19 +0000
Message-Id: <20191126101319.79476-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=el/FpqOcsaC4sI4snGd/4tXRjMT6hnOv5XPSv5sNfp0=;
 b=lPdg/Xxu9EwouEmwc85ZRdEJslPJ6/BKDm6vXCfiAcsnQmvRztK76oNfhREHlGw7BJ
 MMwJubWE7O47MXdINJT/JdD1vZuTIvh7ovxaDKpTKJ+0SRlJ4EpQYzRoxBJRNYAFRJWF
 Tj3VLe1KU8XndPPuYu7pPsqRlHXP9RTN/rsyg7fsgISYftikABD5ZrehErdmU38rYhme
 xhMTboA5C8YEODiIw79Sa2YbMtXHKXd/KOA9i5+sXIfAu3VvGQcb6kHZ2FC1xutJWoSt
 fN34/94zexhA/QUoPkKPVEa6LdIAMf3TVrT/OHz0KNPrbuaDSveVxVQjnI1k0AnfJCua
 ccJg==
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
Cc: Jules Irenge <jbi.octave@gmail.com>, airlied@linux.ie,
 Andrea.Parri@microsoft.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ray.huang@amd.com, Boqun.Feng@microsoft.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHJlbGVhc2VzKCkgZnVuY3Rpb24gdG8gZml4IGNvbnRleHQgaW1iYWxhbmNlLgogSXNzdWUg
ZGV0ZWN0ZWQgYnkgc3BhcnNlIHRvb2wuCndhcm5pbmc6IGNvbnRleHQgaW1iYWxhbmNlIGluIHR0
bV9ib19jbGVhbnVwX3JlZnMgLSB1bmV4cGVjdGVkIHVubG9jawoKU2lnbmVkLW9mZi1ieTogSnVs
ZXMgSXJlbmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggOTg4MTk0NjJmMDI1Li5jODc0ODFkNjY3YTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtNTQ0LDcgKzU0NCw3IEBAIHN0YXRpYyB2b2lkIHR0bV9i
b19jbGVhbnVwX3JlZnNfb3JfcXVldWUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIAog
c3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAJCQkgICAgICAgYm9vbCBpbnRlcnJ1cHRpYmxlLCBib29sIG5vX3dhaXRfZ3B1LAotCQkJ
ICAgICAgIGJvb2wgdW5sb2NrX3Jlc3YpCisJCQkgICAgICAgYm9vbCB1bmxvY2tfcmVzdikgX19y
ZWxlYXNlcygmZ2xvYi0+bHJ1X2xvY2spCiB7CiAJc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2Ig
PSBiby0+YmRldi0+Z2xvYjsKIAlzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3Y7Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
