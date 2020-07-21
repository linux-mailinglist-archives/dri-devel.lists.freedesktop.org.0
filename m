Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6D22860C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F826E1C4;
	Tue, 21 Jul 2020 16:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24526E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:42:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f2so21821035wrp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/h8ORy4DNqghX0fGvMFmOJAYmeG6EwmneD/txrpUKQ=;
 b=DygfAM0wilefsTFOLpkZloWhTbf1EjyFmvDb+uUwHVdhb0JFLov56x6AGdJpgFX3Qq
 dnFsLI1nMQl9gdysBDPjcyfA3NNUBp459/12QspUG+ePKZdUPn0RWRZXgg5qSv4nlmIS
 1Iq//z1b94Z1uw44379UTuKg/hIxd4Fg9fSuUzpK3w9u4wz4tMdCb5uPIRKdO46WsLEE
 yAh8ehw3AD2Q0Ds2E3XKQlXaJZCxqhhhWWhqcguQjf+alrX4Y85xO+pI3ravneTqbNL/
 2zrBozj/Yy4DG5DejE006yWRnaWi4tGuoSw0MHF8wZ3bF4micjw2euoSWwoJGE8BBPsx
 P8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/h8ORy4DNqghX0fGvMFmOJAYmeG6EwmneD/txrpUKQ=;
 b=P5gIK8dX2iwD5v53o82LF/2k3GeERExtuzEYu6cy1nwC2K2PyR/E6QhhHfIgfEgcVX
 QNEhS0vFx2v+2AWy9SHtD0Hhs9af6wm8GY23IEmqcxWK8//4JLfu7XyY4Uz8gjLV4519
 Vj05GYZgpOOx2q2IxLOgQ195ssqt66J1RJIjxYm8hEtAcmCxIFYQe3X2yylts3JtJaOo
 kW70paQFw+DGyAQ9fAKRiXelP4fF9sARc6atVwdU2187K9FU5KNsulsndACq3wHb4fvx
 T19GjBS/40avrSXaBWBjd+vLGyeLscTmL509Jt2uC3eCaZ0u6hISs/eFec1hPKB8VB9A
 7eMg==
X-Gm-Message-State: AOAM530kLHBlv7x70eezswHZkm3r/5I+ejsgw4YHzYHchwqf64XyYZLB
 /CsXC47ACoz0lt6VSnK66qNAsA==
X-Google-Smtp-Source: ABdhPJxKB+7toSm5UJGRFj6carCJ7zVGoIyBp8xuFw6t1mguDmz17idpSKI4JkNaKCdk85+OV0RD8w==
X-Received: by 2002:adf:f842:: with SMTP id d2mr29696845wrq.55.1595349756699; 
 Tue, 21 Jul 2020 09:42:36 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id m4sm3933524wmi.48.2020.07.21.09.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:42:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 28/40] scsi: lpfc: lpfc_mem: Provide description for
 lpfc_mem_alloc()'s 'align' param
Date: Tue, 21 Jul 2020 17:41:36 +0100
Message-Id: <20200721164148.2617584-29-lee.jones@linaro.org>
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
cy9zY3NpL2xwZmMvbHBmY19tZW0uYzo4NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnYWxpZ24nIG5vdCBkZXNjcmliZWQgaW4gJ2xwZmNfbWVtX2FsbG9jJwoKQ2M6IEph
bWVzIFNtYXJ0IDxqYW1lcy5zbWFydEBicm9hZGNvbS5jb20+CkNjOiBEaWNrIEtlbm5lZHkgPGRp
Y2sua2VubmVkeUBicm9hZGNvbS5jb20+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBs
aW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvc2Nz
aS9scGZjL2xwZmNfbWVtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS9scGZjL2xwZmNfbWVtLmMgYi9kcml2ZXJzL3Njc2kv
bHBmYy9scGZjX21lbS5jCmluZGV4IGU4YzAwNjZlYjRhYWYuLjI3ZmY2N2U5ZWRhZTcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc2NzaS9scGZjL2xwZmNfbWVtLmMKKysrIGIvZHJpdmVycy9zY3NpL2xw
ZmMvbHBmY19tZW0uYwpAQCAtNjgsNiArNjgsNyBAQCBscGZjX21lbV9hbGxvY19hY3RpdmVfcnJx
X3Bvb2xfczQoc3RydWN0IGxwZmNfaGJhICpwaGJhKSB7CiAvKioKICAqIGxwZmNfbWVtX2FsbG9j
IC0gY3JlYXRlIGFuZCBhbGxvY2F0ZSBhbGwgUENJIGFuZCBtZW1vcnkgcG9vbHMKICAqIEBwaGJh
OiBIQkEgdG8gYWxsb2NhdGUgcG9vbHMgZm9yCisgKiBAYWxpZ246IGFsaWdubWVudCByZXF1aXJl
bWVudCBmb3IgYmxvY2tzOyBtdXN0IGJlIGEgcG93ZXIgb2YgdHdvCiAgKgogICogRGVzY3JpcHRp
b246IENyZWF0ZXMgYW5kIGFsbG9jYXRlcyBQQ0kgcG9vbHMgbHBmY19tYnVmX3Bvb2wsCiAgKiBs
cGZjX2hyYl9wb29sLiAgQ3JlYXRlcyBhbmQgYWxsb2NhdGVzIGttYWxsb2MtYmFja2VkIG1lbXBv
b2xzCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
