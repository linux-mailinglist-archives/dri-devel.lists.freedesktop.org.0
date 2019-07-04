Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5F5F384
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6166E2B8;
	Thu,  4 Jul 2019 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF356E25A;
 Thu,  4 Jul 2019 05:52:52 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so4240311edo.5;
 Wed, 03 Jul 2019 22:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nxMo/C25wB83HiqtqBaJ+h1T1C9R56SSMfKIkNntuQI=;
 b=Ol+d4mE8lBgMK0a3n9mnsU0d5eI+fd5317rzTMA0cHa4HGg2d9KhaaNfXCxezhxf2f
 hmYaZYGJmwU0s9lQzsAg99TCgdlG6PvGABfDzJNorUARYApBCMnYSY2nzbINiLWoRdCX
 LdKTZpfMYc3uu46u+bvwV4NC/A2vvCGkCCQiz31r92oHuUM/guqvJNvWg5XQyE1fBlxT
 2OwVhe+TuPy49STc9IuPfOB2VyRQjn+PNIuf12JGANyq1hkbKD1e/KFUVgB8SVbUhwG8
 bncI3GR69oDcj5AuN7AGDUHidv4WgdX5SumwBF7GMkbGdzXikRUqy9+RuLGLVeJHEXxD
 BPyQ==
X-Gm-Message-State: APjAAAUJQFjidS4IpsMklitbGzqnnV01V1xqluDHq/qFmA6/eSqpFbbM
 i7tdRNnQkmMN5q2S38WXuY0=
X-Google-Smtp-Source: APXvYqzBi7OSwL7lr/m4iyTwfj6jyXpGc54w1FJdJua28+Xm3PLKgCoq/7MjNenqFHzRM1qatIcOiQ==
X-Received: by 2002:a50:f4dd:: with SMTP id v29mr46606079edm.246.1562219570715; 
 Wed, 03 Jul 2019 22:52:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:50 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 3/7] drm/amd/powerplay: Use proper enums in
 smu_adjust_power_state_dynamic
Date: Wed,  3 Jul 2019 22:52:14 -0700
Message-Id: <20190704055217.45860-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxMo/C25wB83HiqtqBaJ+h1T1C9R56SSMfKIkNntuQI=;
 b=jQATCgtOv2HJtkUCqDOPMinhGgPxktLL4vFCkiFilIKe4DwLFtLJLsuqwxtwTGEgug
 HV+Q7GToIpxKN9fX8pTqXyfzD9qZy067CiHz5gG25FLmcsKKrjmO4W3eaqyd6rqRaPYH
 kj4VKB5pYSSi9XEKcvl/4OhTAAwI3MdGgbCRAvft2gYSBqIcFCuYQoLYLaa4acpNp1w0
 q4O5vZRPtp9fNJkxfnAoHTBsszmoW+UxmbnE0UjdbKJxrWXgCJjaEKj5lAYy1ZpH+cNK
 8VWUEIo+M6B7WrGUGc+YSVYIDNJSlCtWX4a0/5vOqlU/A9UkZb5gLYokQBycB0icAxqO
 vCyw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvYW1k
Z3B1X3NtdS5jOjEzNzQ6MzA6IHdhcm5pbmc6CmltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVt
ZXJhdGlvbiB0eXBlICdlbnVtIHBwX2Nsb2NrX3R5cGUnIHRvCmRpZmZlcmVudCBlbnVtZXJhdGlv
biB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScgWy1XZW51bS1jb252ZXJzaW9uXQogICAgICAgICAg
ICAgICAgICAgICAgICBzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFBQX1NDTEssIDEgPDwgc2Ns
a19tYXNrKTsKICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYzoxMzc1OjMwOiB3YXJuaW5nOgppbXBsaWNpdCBjb252ZXJz
aW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnZW51bSBwcF9jbG9ja190eXBlJyB0bwpkaWZmZXJl
bnQgZW51bWVyYXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUnIFstV2VudW0tY29udmVyc2lv
bl0KICAgICAgICAgICAgICAgICAgICAgICAgc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBQUF9N
Q0xLLCAxIDw8IG1jbGtfbWFzayk7CiAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpUaGlzIGFwcGVhcnMgdG8g
YmUgYSBjb3B5IGFuZCBwYXN0ZSBmYWlsIGZyb20gd2hlbiB0aGlzIHdhcyBhIGNhbGwgdG8KdmVn
YTIwX2ZvcmNlX2Nsa19sZXZlbHMuCgpGaXhlczogYmMwZmNmZmQzNmJhICgiZHJtL2FtZC9wb3dl
cnBsYXk6IFVuaWZ5IHNtdSBoYW5kbGUgdGFzayBmdW5jdGlvbiAodjIpIikKTGluazogaHR0cHM6
Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvNTg0ClNpZ25lZC1vZmYt
Ynk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCAzMTE1MmQ0OTVmNjkuLmU4OTc0Njlm
NzQzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAt
MTM3MSw4ICsxMzcxLDggQEAgaW50IHNtdV9hZGp1c3RfcG93ZXJfc3RhdGVfZHluYW1pYyhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkJCQkgJnNvY19tYXNrKTsKIAkJCWlmIChyZXQpCiAJ
CQkJcmV0dXJuIHJldDsKLQkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgUFBfU0NMSywgMSA8
PCBzY2xrX21hc2spOwotCQkJc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBQUF9NQ0xLLCAxIDw8
IG1jbGtfbWFzayk7CisJCQlzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9TQ0xLLCAxIDw8
IHNjbGtfbWFzayk7CisJCQlzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9NQ0xLLCAxIDw8
IG1jbGtfbWFzayk7CiAJCQlicmVhazsKIAogCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX01B
TlVBTDoKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
