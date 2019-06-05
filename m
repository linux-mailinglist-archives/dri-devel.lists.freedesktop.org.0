Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56AC358ED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 10:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76788969E;
	Wed,  5 Jun 2019 08:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00BA8969E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:47:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so1368295wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 01:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rot6iK92B6TEwBliOivir2gNRQvaPz5fEeAyYY+Fv5U=;
 b=uiasSvstXe2r1LJgFoJc3L4052oCtiKVO26oeTnyOeR1DGWxlHtMpjkLLs7BgG8FFK
 Yt7Fjdd/RaT0B+Ep4KmH3VirrWTifR65q7YRJ8v6YsVs9O8Ub+69uGZGmWCXAlrpbPyY
 UJ/0+0Kv4NX5vg2UTL6OyfjNJ6UHvfClquIfva093OPNxfPIj6+CjIjDZXwSv9G1t7hd
 e2G4IrCoZzvfzxN47/t757T9fzA9drCdsZ3GPuldStNITxGNOxCJhSOm+qJzfbTsMRab
 /W/rro4YQsg/Qavs60YbScejX5iEGTq0QEiDOUoAl1YjFDTmLuHugbQeX9j4XzspT86e
 p93g==
X-Gm-Message-State: APjAAAVuYENQZzTjB60+O3cXiw/gVMuIwikyXIybDuw75Gfn920Z/kbI
 nsZO57h5XZvuplqdWaefsIw=
X-Google-Smtp-Source: APXvYqxHuBz8WlxFDs/6ggHdHm3eReJjTdN+uN/413q5Rx2HKmix6KmFDMnx6dSgorOpRMKI2dMouQ==
X-Received: by 2002:a1c:c74a:: with SMTP id x71mr21458623wmf.121.1559724438307; 
 Wed, 05 Jun 2019 01:47:18 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id u13sm5569575wrq.62.2019.06.05.01.47.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 01:47:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Do not link logical devices to DT nodes
Date: Wed,  5 Jun 2019 10:47:16 +0200
Message-Id: <20190605084716.12461-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rot6iK92B6TEwBliOivir2gNRQvaPz5fEeAyYY+Fv5U=;
 b=H6lYu/gqA4bVS+BSuV3Ewu/CQgV1E1fOiZZ7ZNviFIWlHbtG9Z/e11mAFVxaxB8hqv
 5OMPyTex2Tk4QqMJpnNf4NO5rykhHCDgVLBG5SpYrOI98R29Gmer3I0oCu0qBxB/XI1f
 nCFXwCD8FnAvWy3BeJkBWpWg4Cziw2Rn5UBMfP6+dn8tulS8Vw5nXBBIVivimHumqRBG
 wdLYtmzPvQQQCRX+pr1bF7VZmlGomMypPzQ9WxgJZMCN00z+ls2WX6PR1YJ2dHIuhLNo
 CWMwVNflughjadeT8FA5ZfG3eqUUFESzCGZf97Tu25z9aU3MBtdEEwEYi5qnLTOq+Y4s
 hQZA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkxvZ2ljYWwgZGV2aWNl
cyBjcmVhdGVkIGJ5IHRoZSBob3N0MXggYnVzIGluZnJhc3RydWN0dXJlIGRvbid0IG5lZWQgdG8K
YmUgYXNzb2NpYXRlZCB3aXRoIGEgZGV2aWNlIHRyZWUgbm9kZS4gRG9pbmcgc28gd2lsbCBjYXVz
ZSB0aGUgZHJpdmVyCmNvcmUgdG8gYXR0ZW1wdCB0byBob29rIHVwIElPTU1VIG9wZXJhdGlvbnMg
YW5kIGZhaWwgYmVjYXVzZSBpdCBpcyBub3QKYSByZWFsIGRldmljZS4KCkhvd2V2ZXIsIGZvciBi
YWNrd2FyZHMtY29tcGF0aWJpbGl0eSwgd2UgbmVlZCB0byBwcm92aWRlIHZhcmlvdXMgT0ZfKgp1
ZXZlbnQgdmFyaWFibGVzIHRoYXQgd2VyZSBwcmV2aW91c2x5IHByb3ZpZGVkIGJ5IG9mX2Rldmlj
ZV91ZXZlbnQoKSBhbmQKd2hpY2ggYXJlIHBhcnNlZCBieSBsaWJkcm0gaW4gdXNlcnNwYWNlIHdo
ZW4gcXVlcnlpbmcgdGhlIGF2YWlsYWJsZQpkZXZpY2VzLiBEbyB0aGlzIGJ5IGltcGxlbWVudGlu
ZyBhIHVldmVudCBjYWxsYmFjayBmb3IgdGhlIGhvc3QxeCBidXMuCgpTaWduZWQtb2ZmLWJ5OiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2hvc3Qx
eC9idXMuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2hvc3QxeC9idXMuYyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwppbmRleCA2Mzg3
MzAyYzEyNDUuLjc0MmFhOWZmMjFiOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2J1
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwpAQCAtMzA1LDYgKzMwNSwzNiBAQCBz
dGF0aWMgaW50IGhvc3QxeF9kZXZpY2VfbWF0Y2goc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZGV2aWNlX2RyaXZlciAqZHJ2KQogCXJldHVybiBzdHJjbXAoZGV2X25hbWUoZGV2KSwgZHJ2LT5u
YW1lKSA9PSAwOwogfQogCitzdGF0aWMgaW50IGhvc3QxeF9kZXZpY2VfdWV2ZW50KHN0cnVjdCBk
ZXZpY2UgKmRldiwKKwkJCQlzdHJ1Y3Qga29ial91ZXZlbnRfZW52ICplbnYpCit7CisJc3RydWN0
IGRldmljZV9ub2RlICpucCA9IGRldi0+cGFyZW50LT5vZl9ub2RlOworCXVuc2lnbmVkIGludCBj
b3VudCA9IDA7CisJc3RydWN0IHByb3BlcnR5ICpwOworCWNvbnN0IGNoYXIgKmNvbXBhdDsKKwor
CS8qCisJICogVGhpcyBkdXBsaWNhdGVzIG1vc3Qgb2Ygb2ZfZGV2aWNlX3VldmVudCgpLCBidXQg
dGhlIGxhdHRlciBjYW5ub3QKKwkgKiBiZSBjYWxsZWQgZnJvbSBtb2R1bGVzIGFuZCBvcGVyYXRl
cyBvbiBkZXYtPm9mX25vZGUsIHdoaWNoIGlzIG5vdAorCSAqIGF2YWlsYWJsZSBpbiB0aGlzIGNh
c2UuCisJICoKKwkgKiBOb3RlIHRoYXQgdGhpcyBpcyByZWFsbHkgb25seSBuZWVkZWQgZm9yIGJh
Y2t3YXJkcyBjb21wYXRpYmlsaXR5CisJICogd2l0aCBsaWJkcm0sIHdoaWNoIHBhcnNlcyB0aGlz
IGluZm9ybWF0aW9uIGZyb20gc3lzZnMgYW5kIHdpbGwKKwkgKiBmYWlsIGlmIGl0IGNhbid0IGZp
bmQgdGhlIE9GX0ZVTExOQU1FLCBzcGVjaWZpY2FsbHkuCisJICovCisJYWRkX3VldmVudF92YXIo
ZW52LCAiT0ZfTkFNRT0lcE9GbiIsIG5wKTsKKwlhZGRfdWV2ZW50X3ZhcihlbnYsICJPRl9GVUxM
TkFNRT0lcE9GIiwgbnApOworCisJb2ZfcHJvcGVydHlfZm9yX2VhY2hfc3RyaW5nKG5wLCAiY29t
cGF0aWJsZSIsIHAsIGNvbXBhdCkgeworCQlhZGRfdWV2ZW50X3ZhcihlbnYsICJPRl9DT01QQVRJ
QkxFXyV1PSVzIiwgY291bnQsIGNvbXBhdCk7CisJCWNvdW50Kys7CisJfQorCisJYWRkX3VldmVu
dF92YXIoZW52LCAiT0ZfQ09NUEFUSUJMRV9OPSV1IiwgY291bnQpOworCisJcmV0dXJuIDA7Cit9
CisKIHN0YXRpYyBpbnQgaG9zdDF4X2RtYV9jb25maWd1cmUoc3RydWN0IGRldmljZSAqZGV2KQog
ewogCXJldHVybiBvZl9kbWFfY29uZmlndXJlKGRldiwgZGV2LT5vZl9ub2RlLCB0cnVlKTsKQEAg
LTMyMiw2ICszNTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaG9zdDF4X2Rl
dmljZV9wbV9vcHMgPSB7CiBzdHJ1Y3QgYnVzX3R5cGUgaG9zdDF4X2J1c190eXBlID0gewogCS5u
YW1lID0gImhvc3QxeCIsCiAJLm1hdGNoID0gaG9zdDF4X2RldmljZV9tYXRjaCwKKwkudWV2ZW50
ID0gaG9zdDF4X2RldmljZV91ZXZlbnQsCiAJLmRtYV9jb25maWd1cmUgPSBob3N0MXhfZG1hX2Nv
bmZpZ3VyZSwKIAkucG0gPSAmaG9zdDF4X2RldmljZV9wbV9vcHMsCiB9OwpAQCAtNDA4LDcgKzQz
OSw2IEBAIHN0YXRpYyBpbnQgaG9zdDF4X2RldmljZV9hZGQoc3RydWN0IGhvc3QxeCAqaG9zdDF4
LAogCWRldmljZS0+ZGV2LmRtYV9tYXNrID0gJmRldmljZS0+ZGV2LmNvaGVyZW50X2RtYV9tYXNr
OwogCWRldl9zZXRfbmFtZSgmZGV2aWNlLT5kZXYsICIlcyIsIGRyaXZlci0+ZHJpdmVyLm5hbWUp
OwogCWRldmljZS0+ZGV2LnJlbGVhc2UgPSBob3N0MXhfZGV2aWNlX3JlbGVhc2U7Ci0JZGV2aWNl
LT5kZXYub2Zfbm9kZSA9IGhvc3QxeC0+ZGV2LT5vZl9ub2RlOwogCWRldmljZS0+ZGV2LmJ1cyA9
ICZob3N0MXhfYnVzX3R5cGU7CiAJZGV2aWNlLT5kZXYucGFyZW50ID0gaG9zdDF4LT5kZXY7CiAK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
