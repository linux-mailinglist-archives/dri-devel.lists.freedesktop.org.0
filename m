Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AAF2A9F24
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E2E6EB1B;
	Fri,  6 Nov 2020 21:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB1A6EB1B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:37:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w24so138175wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=IyOOm4YcLu9epqYYgxHeyW701rsjmtWIg0P/DKB/8Q6IPcQ/t6MO1R6yd0fJQntORL
 BDMp5hef0aEIh7KkNlZRjMDPR/LMbrm2WiyYP1Y64OpSOX8OfWqHC7XCKtwCXRJ59xd8
 3A/YJPWDUiuHL6MrobUBvhafqHh21djh09wT76h1G9LAgFrUGneAdBxgvV275Real/sp
 mYTid3SjqWCnTfW7H40GyyfREXgKr6MBwPcS3WQ92MKaFJdbDa3MX5MrKY+DIB9UvRI7
 VEftWw5YuIZMb3MYgoIr3osQRBXO+NcAHvQDY5J9mpspRUZuT7z7IlQNnxz+YJWxBKYm
 O0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEqBSYfgnwhk/ZNzzzB95lzeseOVAaohNofEs1LOZBI=;
 b=KR+VKOEyzM/6LYOs3UoRiSVvsHgIe/q0eXWCWPhDrAnq4JdK1kyFadhWeEcdaJhbBJ
 w6jfQJ9kComAYhnWxCkj0bPEXq0xAsgGWqkwU++dy9bFoG0FwL1YznCyyguOMJLpTo/F
 juauf7mXSe/vDm0E3VhJHZrMTMFAbBcrUmjNm/8AIfYLCiMRPMRgrxNYa3Jko7CU+8yG
 yYfrbjxfil7ekuyON7QReN/GVkm9BU6yzDcOUzA51bW4GE2PevJkEtAl4zM1NOPmlgXV
 MYTvwzv+1+hr+SmnAMpn2dxRnDpvw5DLfqn0eRaJ8wISN6/pW5gRous9c/wMBapRF+f4
 MYiA==
X-Gm-Message-State: AOAM532HtRyKGHygbe0hu81DSoibIQWHW3UKqP9LTcznmcAAntcT97PJ
 E5zoy4wuQjgBCD3uEv2Es6cyzQ==
X-Google-Smtp-Source: ABdhPJyI/kQHXmPF4Z5CgPRI1VUuTI0/V4ur2ouYJtT6Jh5hdOLOZyTcKKjzaUGMQ1xe1j6Go+iccA==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr1511403wmc.173.1604698629494; 
 Fri, 06 Nov 2020 13:37:09 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote
 non-conformant kernel-doc
Date: Fri,  6 Nov 2020 21:36:39 +0000
Message-Id: <20201106213655.1838861-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jOjMyODogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbnAnIG5vdCBkZXNjcmliZWQgaW4gJ2hpc2lfc3BpX25v
cl9yZWdpc3RlcicKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYzoz
Mjg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNj
cmliZWQgaW4gJ2hpc2lfc3BpX25vcl9yZWdpc3RlcicKCkNjOiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+CkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVmlnbmVzaCBSYWdo
YXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgotLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJv
bGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMu
YwppbmRleCA5NWM1MDIxNzNjYmRhLi43YzI2ZjhmNTY1Y2JhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2hpc2ktc2ZjLmMKKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jCkBAIC0zMjAsNyArMzIwLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzIGhpc2lfY29udHJvbGxlcl9vcHMgPSB7
CiAJLndyaXRlID0gaGlzaV9zcGlfbm9yX3dyaXRlLAogfTsKIAotLyoqCisvKgogICogR2V0IHNw
aSBmbGFzaCBkZXZpY2UgaW5mb3JtYXRpb24gYW5kIHJlZ2lzdGVyIGl0IGFzIGEgbXRkIGRldmlj
ZS4KICAqLwogc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRldmljZV9u
b2RlICpucCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
