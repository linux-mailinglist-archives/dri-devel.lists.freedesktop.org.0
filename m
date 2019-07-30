Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0837BA6C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B778C6E69E;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033216E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:31:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t28so62500755lje.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 08:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijf+IXMFVOGyvl/6lR3Dl4FHOPijwIT8zlA3D+mB5Zg=;
 b=mTXqUUH4abHv4RkUub7rn9rlx2Or/Lq/hxeK7PTGzp3a0/sYLHgDBXvgXK2VRR3L+i
 bbRCyfzbmOS7sSivrJLTF4PwK9QnikRJ5jFymDq6Yt2MkJ4neQdpOp5Po2gEtu6Bspmg
 aHJi/5vqOAYWqb5+rxVLV2kh1fr3nNR6cdmdd+8thjrpufRajGqFYvF136urs0pd3iiZ
 obOmuEJKVW2o6c+Thi/vvkhjvMrxuXhf3QOPH2bk+NRQBHPoc2bJDiMlYSqR1pAfzMBu
 7X8sRzYRtGBEJ8Sp3zMJbMQ5mlxJKpj//Vqjetu40b/M83LFz8vGesrsCoUef+IVXL+m
 1BcA==
X-Gm-Message-State: APjAAAWixahYpO85FkZUtTbETMz7QjYJQ0xF0bTYlQhKuMKsrgA/dYSN
 qfP3DxtmpBdAnmMyvZd16ClK5Q==
X-Google-Smtp-Source: APXvYqwn5yHeNh2SggjrocFklpCW7DMwZmxMpOfufxOmSHRUb0st7KBTDbw62b+nH+RnCHOuX2bDgg==
X-Received: by 2002:a05:651c:1b8:: with SMTP id
 c24mr63473072ljn.2.1564500671320; 
 Tue, 30 Jul 2019 08:31:11 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id l22sm13409494ljc.4.2019.07.30.08.31.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 08:31:10 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: malidp@foss.arm.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2] drm: mali-dp: Mark expected switch fall-through
Date: Tue, 30 Jul 2019 17:30:56 +0200
Message-Id: <20190730153056.3606-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ijf+IXMFVOGyvl/6lR3Dl4FHOPijwIT8zlA3D+mB5Zg=;
 b=ky12He8Kf8tUIMDwGJbIw/FAZCNoOYc2+0deJeoUMUYn71ibisQOQBx3k6VOLHsTuo
 B1dzMxoZdynUB6zjeAwIMLthlkJ+ZjykQ1XLvWnpUkORJ49J2i7rTLTrcxe5S5wVazgY
 sN4tUbFcMmf6azm9wd2Vt0HGmw8R3gjYK7q4u7dP3xcI6T0V84NL7ri6cxhfjiIWcTk8
 szRtTwondYA84H0RtHLJ59dTa0a8GMLmHcwNszu7oJaWMsbBkpH80NIHAuBR3faQ+lBp
 jC5V/LgKlFNaEWIBprf+MaSxhio7gITyAIw64IdCi+q4VVkTkoEPpDHFuEv0fQQHIDiz
 22OA==
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
Cc: Anders Roxell <anders.roxell@linaro.org>, gustavo@embeddedor.com,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCBpcyBwYXNzZWQgdG8gR0NDIGJ5IGRlZmF1
bHQsIHRoZQpmb2xsb3dpbmcgd2FybmluZ3Mgc2hvd3MgdXA6CgouLi9kcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9ody5jOiBJbiBmdW5jdGlvbiDigJhtYWxpZHBfZm9ybWF0X2dldF9icHDigJk6
Ci4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmM6Mzg3Ojg6IHdhcm5pbmc6IHRoaXMg
c3RhdGVtZW50IG1heSBmYWxsCiB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAg
IGJwcCA9IDMwOwogICAgfn5+fl5+fn4KLi4vZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcu
YzozODg6Mzogbm90ZTogaGVyZQogICBjYXNlIERSTV9GT1JNQVRfWVVWNDIwXzEwQklUOgogICBe
fn5+Ci4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmM6IEluIGZ1bmN0aW9uIOKAmG1h
bGlkcF9zZV9pcnHigJk6Ci4uL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmM6MTMxMTo0
OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbAogdGhyb3VnaCBbLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaD1dCiAgICBkcm1fd3JpdGViYWNrX3NpZ25hbF9jb21wbGV0aW9uKCZtYWxpZHAt
Pm13X2Nvbm5lY3RvciwgMCk7CiAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KLi4vZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcu
YzoxMzEzOjM6IG5vdGU6IGhlcmUKICAgY2FzZSBNV19TVEFSVDoKICAgXn5+fgoKUmV3b3JrIHRv
IGFkZCBhICdicmVhazsnIGluIGEgY2FzZSB0aGF0IGRpZG4ndCBoYXZlIGl0IHNvIHRoYXQKdGhl
IGNvbXBpbGVyIGRvZXNuJ3Qgd2FybiBhYm91dCBmYWxsLXRocm91Z2guCgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZyAjIHY1LjIrCkZpeGVzOiBiODIwNzU2MmFiZGQgKCJkcm0vYXJtL21hbGlk
cDogU3BlY2lmaWVkIHRoZSByb3RhdGlvbiBtZW1vcnkgcmVxdWlyZW1lbnRzIGZvciBBRkJDIFlV
ViBmb3JtYXRzIikKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9tYWxpZHBfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMK
aW5kZXggNTBhZjM5OWQ3ZjZmLi4zODBiZTY2ZDRjNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX2h3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcu
YwpAQCAtMzg1LDYgKzM4NSw3IEBAIGludCBtYWxpZHBfZm9ybWF0X2dldF9icHAodTMyIGZtdCkK
IAkJc3dpdGNoIChmbXQpIHsKIAkJY2FzZSBEUk1fRk9STUFUX1ZVWTEwMTAxMDoKIAkJCWJwcCA9
IDMwOworCQkJYnJlYWs7CiAJCWNhc2UgRFJNX0ZPUk1BVF9ZVVY0MjBfMTBCSVQ6CiAJCQlicHAg
PSAxNTsKIAkJCWJyZWFrOwpAQCAtMTMwOSw3ICsxMzEwLDcgQEAgc3RhdGljIGlycXJldHVybl90
IG1hbGlkcF9zZV9pcnEoaW50IGlycSwgdm9pZCAqYXJnKQogCQkJYnJlYWs7CiAJCWNhc2UgTVdf
UkVTVEFSVDoKIAkJCWRybV93cml0ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oJm1hbGlkcC0+bXdf
Y29ubmVjdG9yLCAwKTsKLQkJCS8qIGZhbGwgdGhyb3VnaCB0byBhIG5ldyBzdGFydCAqLworCQkJ
LyogZmFsbCB0aHJvdWdoIC0gdG8gYSBuZXcgc3RhcnQgKi8KIAkJY2FzZSBNV19TVEFSVDoKIAkJ
CS8qIHdyaXRlYmFjayBzdGFydGVkLCBuZWVkIHRvIGVtdWxhdGUgb25lLXNob3QgbW9kZSAqLwog
CQkJaHctPmRpc2FibGVfbWVtd3JpdGUoaHdkZXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
