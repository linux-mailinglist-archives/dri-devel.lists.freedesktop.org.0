Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F58D62FE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAD86E2B6;
	Mon, 14 Oct 2019 12:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432C389BD5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:50:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so19627698wrs.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rq1ZF1nsTPYlmvvsNxuE1omhCQpXv2Uc5EavmJCLVho=;
 b=SoFPQcqZSZWKYO9GMuFLc+D1jEP5cg8lbz/eW1zrWt3gp+Q/OpNjDtDauH0KBXdKxF
 3gv//Qb/nsVMLyzj1BaINijZdnlKpJBhvQ3evzFPM2o7A65/Vr5pSztCWk5csmv3VzjB
 dXtPVaAIljDEP5zuCwcq65tegHUIdmyLg5x9RGmtKXsw8ZGdiONQPJ6SKtUT8/Uz3BSl
 wjCgQZI+msW+zo0nkm9ruFOXgX1a33IbDkJjwlDVxli4srZkXfnkKHkOD9QIoeTa2zZI
 P2UVDw4vagl76ZcpMItd2/MgendpEr1gRnUdfES7UgxCJDanbNaEhmS7QwmPRbdjG+qO
 Ngpg==
X-Gm-Message-State: APjAAAXiTPz3I58zpma6A+iG5VdQ+gtPA0+yR348RDPR6w24zi0JVQev
 PveFN3Vz9N+CJfIY/kVCrFA=
X-Google-Smtp-Source: APXvYqyu8+tLAbFH3kbSjwHQedeUmmjLCm8Od7hF49MjagwlGdOGH44d2h92tCDjtljnP8K7vWmZDA==
X-Received: by 2002:adf:8296:: with SMTP id 22mr24599649wrc.255.1571057457725; 
 Mon, 14 Oct 2019 05:50:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y19sm16741436wmi.13.2019.10.14.05.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:50:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 03/14] gpu: host1x: Explicitly initialize host1x_info
 structures
Date: Mon, 14 Oct 2019 14:50:38 +0200
Message-Id: <20191014125049.425101-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rq1ZF1nsTPYlmvvsNxuE1omhCQpXv2Uc5EavmJCLVho=;
 b=roXeX3ZabUr/G5JLWSmiWtysvCekVmBgZnQSLwfNQbFZqAEaNWu58tWzTqYhBbXEpT
 xRsReujN/yxxI+N0AeMSh8rZ6OuN4RnNjyQgiWFP7ngOh8o1XJUH2Ma70CqFtA39oYyw
 bxrzDuSvZUdHCUbV/WBzyaaQck4UNiOCs5qqVPPJlptHX1DQCDbXrbgSqPrdw56vMh6B
 KvPOfm4c4RUk5FT7RL45hRBsUEoAnnKachEDbkk7HN+9pdiYg5Pk/8VcpevlSKfJNy1o
 acyPEUAAY6nGWoZwoQdq9GExxQC9XfYd6rqTY/WtOs9EsAJBrkZmiMMIucCx0BPR2vgJ
 VHcA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0J3MgdGVjaG5pY2Fs
bHkgbm90IHJlcXVpcmVkIHRvIGV4cGxpY2l0bHkgaW5pdGlhbGl6ZSB0aGUgZmllbGRzIHRoYXQK
d2lsbCBiZSB6ZXJvIGJ5IGRlZmF1bHQsIGJ1dCBpdCdzIGVhc2llciB0byByZWFkIHRoZXNlIHN0
cnVjdHVyZXMgaWYKdGhleSBhcmUgYWxsIGluaXRpYWxpemVkIHVuaWZvcm1seS4KClNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvaG9zdDF4L2Rldi5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyBiL2RyaXZl
cnMvZ3B1L2hvc3QxeC9kZXYuYwppbmRleCA1YTNmNzk3MjQwZDQuLmU4YWI0ZDBjNTA5MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2hvc3Qx
eC9kZXYuYwpAQCAtNzcsNiArNzcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhvc3QxeF9pbmZv
IGhvc3QxeDAxX2luZm8gPSB7CiAJLmluaXQgPSBob3N0MXgwMV9pbml0LAogCS5zeW5jX29mZnNl
dCA9IDB4MzAwMCwKIAkuZG1hX21hc2sgPSBETUFfQklUX01BU0soMzIpLAorCS5oYXNfaHlwZXJ2
aXNvciA9IGZhbHNlLAorCS5udW1fc2lkX2VudHJpZXMgPSAwLAorCS5zaWRfdGFibGUgPSBOVUxM
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBob3N0MXhfaW5mbyBob3N0MXgwMl9pbmZvID0g
ewpAQCAtODcsNiArOTAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhvc3QxeF9pbmZvIGhvc3Qx
eDAyX2luZm8gPSB7CiAJLmluaXQgPSBob3N0MXgwMl9pbml0LAogCS5zeW5jX29mZnNldCA9IDB4
MzAwMCwKIAkuZG1hX21hc2sgPSBETUFfQklUX01BU0soMzIpLAorCS5oYXNfaHlwZXJ2aXNvciA9
IGZhbHNlLAorCS5udW1fc2lkX2VudHJpZXMgPSAwLAorCS5zaWRfdGFibGUgPSBOVUxMLAogfTsK
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBob3N0MXhfaW5mbyBob3N0MXgwNF9pbmZvID0gewpAQCAt
OTcsNiArMTAzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBob3N0MXhfaW5mbyBob3N0MXgwNF9p
bmZvID0gewogCS5pbml0ID0gaG9zdDF4MDRfaW5pdCwKIAkuc3luY19vZmZzZXQgPSAweDIxMDAs
CiAJLmRtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDM0KSwKKwkuaGFzX2h5cGVydmlzb3IgPSBmYWxz
ZSwKKwkubnVtX3NpZF9lbnRyaWVzID0gMCwKKwkuc2lkX3RhYmxlID0gTlVMTCwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaG9zdDF4X2luZm8gaG9zdDF4MDVfaW5mbyA9IHsKQEAgLTEwNyw2
ICsxMTYsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhvc3QxeF9pbmZvIGhvc3QxeDA1X2luZm8g
PSB7CiAJLmluaXQgPSBob3N0MXgwNV9pbml0LAogCS5zeW5jX29mZnNldCA9IDB4MjEwMCwKIAku
ZG1hX21hc2sgPSBETUFfQklUX01BU0soMzQpLAorCS5oYXNfaHlwZXJ2aXNvciA9IGZhbHNlLAor
CS5udW1fc2lkX2VudHJpZXMgPSAwLAorCS5zaWRfdGFibGUgPSBOVUxMLAogfTsKIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBob3N0MXhfc2lkX2VudHJ5IHRlZ3JhMTg2X3NpZF90YWJsZVtdID0gewot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
