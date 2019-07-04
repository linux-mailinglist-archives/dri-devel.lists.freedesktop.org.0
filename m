Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B75F381
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032416E281;
	Thu,  4 Jul 2019 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8576E25B;
 Thu,  4 Jul 2019 05:52:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so4231913edv.6;
 Wed, 03 Jul 2019 22:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmo/DU9O/dE2Ko7+mstCaxZb9Z4EJlYbcBOkNgkpK1k=;
 b=NWxK16sSKEjSxWSKTE44XhQP3k9RKmuIjMHKqMWC1TehHMO8y9u5AHOa0NpsQZXl4U
 SoreBt/UhIJzBoX4jd2Y8rkKVAhbQPuxmEa9ZzOKBf/UeCGInjwefWJVfGAEQi7HpNkI
 uMlPTITown6YbUx/+vy3X5Q+xJll2T8hCiuxplWzMwE9CJa6CBnsI10O/koNx5MJCTWC
 CkQMfJEWwEcB7e5vSmjIelxNRHJ0w6F4U3a1IBk+uxOD+gohrU1q30HTfpExW09GyAz6
 oYzNv/eHCgQlv6Hi2R/E+YmEJVJ7yW+mOM1DSTd2t+KLRwkYirFRisUO6GiSvEOPRPDr
 vltw==
X-Gm-Message-State: APjAAAVR/a6uHlSsMjfErtZwyLsu3lrOjj9zBtEEMVHH7pj3LgySS3dw
 2i8kYcoQoyeHExkE/SYk+3I=
X-Google-Smtp-Source: APXvYqwLymzXqhyTyIpMejt6YiRteUU5daBG+29a56wz496qKMJIhAQ/F0d1eJQEct7PYQ3sWdYE9Q==
X-Received: by 2002:a05:6402:12d2:: with SMTP id
 k18mr46093602edx.197.1562219574837; 
 Wed, 03 Jul 2019 22:52:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j30sm1343532edb.8.2019.07.03.22.52.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 22:52:54 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [PATCH 5/7] drm/amd/display: Use proper enum conversion functions
Date: Wed,  3 Jul 2019 22:52:16 -0700
Message-Id: <20190704055217.45860-6-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704055217.45860-1-natechancellor@gmail.com>
References: <20190704055217.45860-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmo/DU9O/dE2Ko7+mstCaxZb9Z4EJlYbcBOkNgkpK1k=;
 b=h4pPML7bpwzuyJMgCJJPLfaCa1fcpe2uwIemczJvh0g5BTf8HA7EEUrIOPplYLMn2s
 5GcqKLwtmMJfn4TrJEAtylyNk/mCSNS+eeR1bCXKwQUrjlheeZFdAnAT+GDa8ixxcVht
 qAa8Hn5WmQWS5V2oEz7Yac6nj/+qu0ik70lcyRS3fieiHAJO0g53xPtRb9bNgsAfTCrZ
 08rntxyq37gI3RE4TzGKUuP7X8gWfSIh8jKVyb9PMVOCVX03T1/SBkgN+VvSb+sTxso3
 5HZaTwoSos6OVm14j4fNu6+Dz219kOPNpvSBM6QZTNzPQQeDrKwtWUWR/KCVbjifQ8u3
 gZnw==
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

Y2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fcHBfc211LmM6MzM2Ojg6Cndhcm5pbmc6IGltcGxpY2l0IGNvbnZlcnNp
b24gZnJvbSBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlwZScKdG8gZGlmZmVyZW50
IGVudW1lcmF0aW9uIHR5cGUgJ2VudW0gYW1kX3BwX2Nsb2NrX3R5cGUnClstV2VudW0tY29udmVy
c2lvbl0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRjX3RvX3NtdV9j
bG9ja190eXBlKGNsa190eXBlKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jOjQyMToxNDoKd2Fy
bmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5cGUgJ2VudW0KYW1k
X3BwX2Nsb2NrX3R5cGUnIHRvIGRpZmZlcmVudCBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9j
bGtfdHlwZScKWy1XZW51bS1jb252ZXJzaW9uXQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGNfdG9fcHBfY2xvY2tfdHlwZShjbGtfdHlwZSksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
ClRoZXJlIGFyZSBmdW5jdGlvbnMgdG8gcHJvcGVybHkgY29udmVydCBiZXR3ZWVuIGFsbCBvZiB0
aGVzZSB0eXBlcywgdXNlCnRoZW0gc28gdGhlcmUgYXJlIG5vIGxvbmdlciBhbnkgd2FybmluZ3Mu
CgpGaXhlczogYTQzOTEzZWE1MGE1ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBn
ZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVuY3kgZm9yIG5hdmkxMCIpCkZpeGVzOiBlNWU0ZTIy
MzkxYzIgKCJkcm0vYW1kL3Bvd2VycGxheTogYWRkIGludGVyZmFjZSB0byBnZXQgY2xvY2sgYnkg
dHlwZSB3aXRoIGxhdGVuY3kgZm9yIGRpc3BsYXkgKHYyKSIpCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzU4NgpTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3Nt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBf
c211LmMKaW5kZXggZWFjMDliZmUzYmUyLi4wZjc2Y2ZmZjlkOWIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5j
CkBAIC0zMzMsNyArMzMzLDcgQEAgYm9vbCBkbV9wcF9nZXRfY2xvY2tfbGV2ZWxzX2J5X3R5cGUo
CiAJCX0KIAl9IGVsc2UgaWYgKGFkZXYtPnNtdS5mdW5jcyAmJiBhZGV2LT5zbXUuZnVuY3MtPmdl
dF9jbG9ja19ieV90eXBlKSB7CiAJCWlmIChzbXVfZ2V0X2Nsb2NrX2J5X3R5cGUoJmFkZXYtPnNt
dSwKLQkJCQkJICBkY190b19zbXVfY2xvY2tfdHlwZShjbGtfdHlwZSksCisJCQkJCSAgZGNfdG9f
cHBfY2xvY2tfdHlwZShjbGtfdHlwZSksCiAJCQkJCSAgJnBwX2Nsa3MpKSB7CiAJCQlnZXRfZGVm
YXVsdF9jbG9ja19sZXZlbHMoY2xrX3R5cGUsIGRjX2Nsa3MpOwogCQkJcmV0dXJuIHRydWU7CkBA
IC00MTgsNyArNDE4LDcgQEAgYm9vbCBkbV9wcF9nZXRfY2xvY2tfbGV2ZWxzX2J5X3R5cGVfd2l0
aF9sYXRlbmN5KAogCQkJcmV0dXJuIGZhbHNlOwogCX0gZWxzZSBpZiAoYWRldi0+c211LnBwdF9m
dW5jcyAmJiBhZGV2LT5zbXUucHB0X2Z1bmNzLT5nZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVu
Y3kpIHsKIAkJaWYgKHNtdV9nZXRfY2xvY2tfYnlfdHlwZV93aXRoX2xhdGVuY3koJmFkZXYtPnNt
dSwKLQkJCQkJCSAgICAgICBkY190b19wcF9jbG9ja190eXBlKGNsa190eXBlKSwKKwkJCQkJCSAg
ICAgICBkY190b19zbXVfY2xvY2tfdHlwZShjbGtfdHlwZSksCiAJCQkJCQkgICAgICAgJnBwX2Ns
a3MpKQogCQkJcmV0dXJuIGZhbHNlOwogCX0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
