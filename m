Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F767861A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115189CB5;
	Mon, 29 Jul 2019 07:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81826ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:27:47 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h28so36808588lfj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkrBq1SnQkOBmUfMH8XCY0QYWm6lQdUCAmJmwMI79D0=;
 b=paN4yWlcUcPz2n+IZPxnP2As70aH08wcBSNOBG+UnqRs3nnA2Ufj4t6JYUzgLJZzKu
 XOmKwl61OcnVtOtA7lHA/RYmTevPjptKMRSO10ZE7+EaMM6aqcY1kDD1rLn8j6ajirs3
 mWaLBLBTYEQkAQ6UJWVn6nAuzRetexaLNqX7yvRu1AEXhe57jSK75TuTwnKi/5giY30Z
 T3FHa90sJnMNTRWAoZ01KUCvMGsElR6ZWmpyjCxFLXxb+OJlPtU5DJsl/3mXyRKmBNTJ
 WjB25atf2KEa+3y+VjaKaOwpB9FtXCwNncs/Vc7QNyVkGPGm5jndwWPajSBqGFJ7dV00
 1Ijg==
X-Gm-Message-State: APjAAAX29wrtEeB/6NeDu6yVf2wt3xSGhMJ60jLqDTr/1H1jMZ9yE5/J
 2f0TfyE5Jq9wQkp993T3xM9UKg==
X-Google-Smtp-Source: APXvYqymqL8+0NGle9LgsNo7cZJpanm/SQJZbXSjQtqaniNF93z4a6wOvybY0QrHQE3O8e+4n1Fo6A==
X-Received: by 2002:ac2:5b09:: with SMTP id v9mr6868915lfn.22.1564140466048;
 Fri, 26 Jul 2019 04:27:46 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id u17sm8391919lfq.69.2019.07.26.04.27.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:27:45 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm: mali-dp: Mark expected switch fall-through
Date: Fri, 26 Jul 2019 13:27:41 +0200
Message-Id: <20190726112741.19360-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkrBq1SnQkOBmUfMH8XCY0QYWm6lQdUCAmJmwMI79D0=;
 b=M1iiTajuphNdCuVUNMETkotkLA2uwCvt8+fc0HhCeN8FY+jFkztC4vtaGleozZsjp0
 6RMNu1DG/drs0/txBSzX43RNK90A7jWVLQKj7569hfsTDoGateqOXe1wyVw2ycSt2flz
 WQE50mSYm5i94JOt4yAmI7YS+QcvOophZcWXbxWG5SMmo6KvALzHHE/IkQL/6c4yP81B
 RIPsLIdqUHaX33s/nJ46/ywpe+27JJ3KnbewYtlEdXxprzRmSC8RwalTuBTXMkecFgst
 ogj0phHtXMzsMPeheYDnkX5vAAIX2ZSvetV6x7plm+lhzWJymY3iXk8EpWfyRmHC/sI5
 JVRQ==
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
Cc: stable@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCwgY29tbWl0
IGQ5MzUxMmVmMGYwZQooIk1ha2VmaWxlOiBHbG9iYWxseSBlbmFibGUgZmFsbC10aHJvdWdoIHdh
cm5pbmciKSwgdGhlIGZvbGxvd2luZwp3YXJuaW5ncyB3YXMgc3RhcnRpbmcgdG8gc2hvdyB1cDoK
Ci4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmM6IEluIGZ1bmN0aW9uIOKAmG1hbGlk
cF9mb3JtYXRfZ2V0X2JwcOKAmToKLi4vZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYzoz
ODc6ODogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKIHRocm91Z2ggWy1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9XQogICAgYnBwID0gMzA7CiAgICB+fn5+Xn5+fgouLi9kcml2ZXJzL2dw
dS9kcm0vYXJtL21hbGlkcF9ody5jOjM4ODozOiBub3RlOiBoZXJlCiAgIGNhc2UgRFJNX0ZPUk1B
VF9ZVVY0MjBfMTBCSVQ6CiAgIF5+fn4KLi4vZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcu
YzogSW4gZnVuY3Rpb24g4oCYbWFsaWRwX3NlX2lyceKAmToKLi4vZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfaHcuYzoxMzExOjQ6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsCiB0
aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgIGRybV93cml0ZWJhY2tfc2lnbmFs
X2NvbXBsZXRpb24oJm1hbGlkcC0+bXdfY29ubmVjdG9yLCAwKTsKICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgouLi9kcml2ZXJzL2dw
dS9kcm0vYXJtL21hbGlkcF9ody5jOjEzMTM6Mzogbm90ZTogaGVyZQogICBjYXNlIE1XX1NUQVJU
OgogICBefn5+CgpSZXdvcmsgdG8gYWRkIGEgJ2JyZWFrOycgaW4gYSBjYXNlIHRoYXQgZGlkbid0
IGhhdmUgaXQgc28gdGhhdAp0aGUgY29tcGlsZXIgZG9lc24ndCB3YXJuIGFib3V0IGZhbGwtdGhy
b3VnaC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjQuOSsKRml4ZXM6IGI4MjA3NTYy
YWJkZCAoImRybS9hcm0vbWFsaWRwOiBTcGVjaWZpZWQgdGhlIHJvdGF0aW9uIG1lbW9yeSByZXF1
aXJlbWVudHMgZm9yIEFGQkMgWVVWIGZvcm1hdHMiKQpTaWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94
ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9t
YWxpZHBfaHcuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMKaW5kZXggNTBhZjM5OWQ3ZjZmLi5kYzVm
ZmY5YWYzMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYwpAQCAtMzg1LDYgKzM4NSw3IEBAIGlu
dCBtYWxpZHBfZm9ybWF0X2dldF9icHAodTMyIGZtdCkKIAkJc3dpdGNoIChmbXQpIHsKIAkJY2Fz
ZSBEUk1fRk9STUFUX1ZVWTEwMTAxMDoKIAkJCWJwcCA9IDMwOworCQkJYnJlYWs7CiAJCWNhc2Ug
RFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQ6CiAJCQlicHAgPSAxNTsKIAkJCWJyZWFrOwpAQCAtMTMw
OSw3ICsxMzEwLDcgQEAgc3RhdGljIGlycXJldHVybl90IG1hbGlkcF9zZV9pcnEoaW50IGlycSwg
dm9pZCAqYXJnKQogCQkJYnJlYWs7CiAJCWNhc2UgTVdfUkVTVEFSVDoKIAkJCWRybV93cml0ZWJh
Y2tfc2lnbmFsX2NvbXBsZXRpb24oJm1hbGlkcC0+bXdfY29ubmVjdG9yLCAwKTsKLQkJCS8qIGZh
bGwgdGhyb3VnaCB0byBhIG5ldyBzdGFydCAqLworCQkJLyogZmFsbCB0aHJvdWdoICovCiAJCWNh
c2UgTVdfU1RBUlQ6CiAJCQkvKiB3cml0ZWJhY2sgc3RhcnRlZCwgbmVlZCB0byBlbXVsYXRlIG9u
ZS1zaG90IG1vZGUgKi8KIAkJCWh3LT5kaXNhYmxlX21lbXdyaXRlKGh3ZGV2KTsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
