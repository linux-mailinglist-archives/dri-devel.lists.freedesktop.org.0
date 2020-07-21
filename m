Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9937228605
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD136E18E;
	Tue, 21 Jul 2020 16:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753926E055
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:42:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j18so3482919wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NlNHMHfamoMPmJrUb8frNLzKxuzuwwYQiNIBCGNRN3Y=;
 b=LpGWutRNDDGbBfDluzeZmrFjdybeakSXXV6IzwT/bs2I8ayF22tzzT9Qy4UeMGsh+1
 sDN+M+xKUjurEqBlsNLJzpn/VCb0P4cPgwcmdRYkUPSMFfq1eHX0kPDcPDwmw9hQsJdz
 feF2XVv0JdW4gpsABcL2PM6LUgi6p3U+aEl0q+8nhtaZDzVPM2ODjwE70cDvHZXkgBST
 dgf8/0x0YbaehjZgzG21wmFt8cH6zoB5Fx27Im5NV5XPTm+mWSlX1+CbNmjQHX6zieO/
 6ubx2pyw92+bs3yhriJOZHhtIf/gTD4Q/U/J+Z+sCue/dzmf8nkSduhEYYd4dMZ6CaYo
 BpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NlNHMHfamoMPmJrUb8frNLzKxuzuwwYQiNIBCGNRN3Y=;
 b=ddAzDeGrx4qUCVFU7Nxs3G1zwtrE6MEXJGKs7w+dfovFrpL367Gecb887NB+VTJxMJ
 tsEGDgd0IL4rukuZSJIWEW5cZ61mBh9c8dGzj6CUH/MTm0aUWIoKdu19QYKS1wRN363A
 5v9PHgDuglP/UvDaej/Q2nZ2wnhNa5XsHfqmIZ/X+7laPUVxcq5DG855UhDUZA/9WbTa
 GN+w6vq5n+BLGTrexcm5/vz79YbFdUvMkp4OP0pb5ynQhp1vHVKrWhru1S1+nG72PztM
 BwAHyuhuX+Vr8Bc2sb/debQ+pFgn5ftQEzEZw1IOdFIMTBk71Vhrw98zWPigfagaGMwR
 1BAg==
X-Gm-Message-State: AOAM530WXQdPjwSjoZfXQpHCywFcvCZFbK+Ue1cOTB7YryaWDVzyfXdH
 1drm9hGw82MkwTYRYqv+M2LTAw==
X-Google-Smtp-Source: ABdhPJwHJOCPpMHirhA5AzA1uKZfGURLoMQ//Npq9re6B1i5CNE254w0YYLI3gaarCY06m7S3TvxKw==
X-Received: by 2002:a1c:6354:: with SMTP id x81mr4633604wmb.98.1595349745126; 
 Tue, 21 Jul 2020 09:42:25 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:42:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 20/40] scsi: lpfc: lpfc_sli: Remove unused variable 'pg_addr'
Date: Tue, 21 Jul 2020 17:41:28 +0100
Message-Id: <20200721164148.2617584-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721164148.2617584-1-lee.jones@linaro.org>
References: <20200721164148.2617584-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Smart <james.smart@broadcom.com>, linaro-mm-sig@lists.linaro.org,
 Lee Jones <lee.jones@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9zY3NpL2xwZmMvbHBmY19zbGkuYzogSW4gZnVuY3Rpb24g4oCYbHBmY193cV9jcmVhdGXigJk6
CiBkcml2ZXJzL3Njc2kvbHBmYy9scGZjX3NsaS5jOjE1ODEwOjE2OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhwZ19hZGRy4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCiAxNTgxMCB8IHVuc2lnbmVkIGxvbmcgcGdfYWRkcjsKIHwgXn5+fn5+fgoKQ2M6IEphbWVz
IFNtYXJ0IDxqYW1lcy5zbWFydEBicm9hZGNvbS5jb20+CkNjOiBEaWNrIEtlbm5lZHkgPGRpY2su
a2VubmVkeUBicm9hZGNvbS5jb20+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvc2NzaS9s
cGZjL2xwZmNfc2xpLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvbHBmYy9scGZjX3NsaS5jIGIv
ZHJpdmVycy9zY3NpL2xwZmMvbHBmY19zbGkuYwppbmRleCA5MmZjNjUyN2U3ZWU2Li44NmU1Zjhj
NzViYTRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvbHBmYy9scGZjX3NsaS5jCisrKyBiL2Ry
aXZlcnMvc2NzaS9scGZjL2xwZmNfc2xpLmMKQEAgLTE1OTk4LDkgKzE1OTk4LDkgQEAgbHBmY193
cV9jcmVhdGUoc3RydWN0IGxwZmNfaGJhICpwaGJhLCBzdHJ1Y3QgbHBmY19xdWV1ZSAqd3EsCiAJ
CQkJCXdxLT5xdWV1ZV9pZCwgcGNpX2JhcnNldCwgZGJfb2Zmc2V0LAogCQkJCQl3cS0+ZHBwX2lk
LCBkcHBfYmFyc2V0LCBkcHBfb2Zmc2V0KTsKIAorI2lmZGVmIENPTkZJR19YODYKIAkJCS8qIEVu
YWJsZSBjb21iaW5lZCB3cml0ZXMgZm9yIERQUCBhcGVydHVyZSAqLwogCQkJcGdfYWRkciA9ICh1
bnNpZ25lZCBsb25nKSh3cS0+ZHBwX3JlZ2FkZHIpICYgUEFHRV9NQVNLOwotI2lmZGVmIENPTkZJ
R19YODYKIAkJCXJjID0gc2V0X21lbW9yeV93YyhwZ19hZGRyLCAxKTsKIAkJCWlmIChyYykgewog
CQkJCWxwZmNfcHJpbnRmX2xvZyhwaGJhLCBLRVJOX0VSUiwgTE9HX0lOSVQsCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
