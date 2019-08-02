Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B475F7F5F7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 13:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907446EDC9;
	Fri,  2 Aug 2019 11:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0E26EDC7;
 Fri,  2 Aug 2019 11:26:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so67624694wma.1;
 Fri, 02 Aug 2019 04:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7n+j9PV3yNEVVXnrTHgo0gp1z4gFIR0wDN8QEOsA5E=;
 b=M1T9HEKV9E+aBUO6JlKL5iI3L55th2IFQko8khp64hWhJo/YI5UGB+F+2g0pR8HO0I
 f5bhCVLF6AQ3e6tk1Ng5i+V1+tsnfyFeq0iRiUq7C5Fl5YW4rUmX4DD7Q677+5jLUnFx
 sxJlDj7sWv0S/l4rrLwAYEzv0Ase9VhbVsN83J3H3026eWb9TyOq2FKrNDBHuk3PmSvH
 Gbhs01iV/suW+EeDoCnSlyzpntAF+u6TWjyl8SAyPtcchPvutLtKEcv9jJvGCsTRMR7T
 ghirypy8AaUAK6MtmXZhoV1EvZo3UUgFhGkNqaOTAkm74pPAjgukrtZH9jGpipHXMskJ
 4BHA==
X-Gm-Message-State: APjAAAU1iCBSgxBACUdKnaP266OmXKOkqp0+Mch5uYXz5A773a392QUb
 zlhYomvMgzuhOyyG+mLfeikSuSLu36w=
X-Google-Smtp-Source: APXvYqzHV+DZh6nzX14ym4NXSKN4PbuaDnUxI0+nfzwUkfM0QZW6KF+czZAReS9+b0OoVeszoCGqlA==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr4243056wmm.96.1564745216260; 
 Fri, 02 Aug 2019 04:26:56 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id g11sm75437165wru.24.2019.08.02.04.26.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:26:55 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] etnaviv: fix whitespace errors
Date: Fri,  2 Aug 2019 13:26:56 +0200
Message-Id: <20190802112656.15280-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7n+j9PV3yNEVVXnrTHgo0gp1z4gFIR0wDN8QEOsA5E=;
 b=bpLIT4iE1A5eFRQ+mnNPfIQKFEwKCOvSIc3PuYSaW58wGwTkPJs7BC17+UBD0vgAEH
 0O0PkbEWaCgeQgjXKDrh6RaoePHJA21TsKHhE8ZWVbJvN+3clKMY53HLqqVnxN3+tVyj
 9PQquweLOIlFSPhP2nAMxN1ZS896vjaTFIGmPJvqHCavDABfUDnK+EdPgaSxLIWG3pGI
 sFi86Qf+mA0Hgz1KrUs2bTSEmse6spIgkRsbsidetndV0hC+TUJqSPSMqGTZ71ZD9/rg
 VBqpY9wA1ROjaPpkW/EuEQP76x3pQOZYjBbcl3KBykUjY0PrkdTyXYnD/g0sm0VHN0ar
 4uLA==
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

Q2hhbmdlcyBpbiBWMjoKIC0gdXNlIGluZGVudGF0aW9uIGFzIHN1Z2dlc3RlZCBieSBQaGlsaXBw
IFphYmVsLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVp
bmVyQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZt
b24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZt
b24uYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCmluZGV4IDQy
MjdhNDAwNmMzNC4uZWYyNGEwOGE1OGIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X3BlcmZtb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X3BlcmZtb24uYwpAQCAtMTUsOCArMTUsOCBAQCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWwg
ewogCXUzMiBkYXRhOwogCiAJdTMyICgqc2FtcGxlKShzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwK
LQkgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tYWluLAot
CSAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpOwor
CQkgICAgICBjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRvbWFpbiwKKwkJICAgICAg
Y29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpOwogfTsKIAogc3RydWN0IGV0
bmF2aXZfcG1fZG9tYWluIHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
