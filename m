Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA35FD0C9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 23:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F36EF3D;
	Thu, 14 Nov 2019 22:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5F6EF3D;
 Thu, 14 Nov 2019 22:14:18 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id g18so3037457qvp.8;
 Thu, 14 Nov 2019 14:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnZBadinQ3UhurvnL2SkVvFYPRiGX0his5jUfJRkwJU=;
 b=olnAaMS/YXX6aiJB0O9++gPDaAXHCmlk23NuphN4JJZcUBE2EYIMPCu2FO8FphMrB1
 +inizx017i90cfWA0n98nsQkcFCGxYZyMOeh2PowqZlW6H1fsxD/cINX7s3FgApcxDLO
 H1AM+Rg2d7tTE6n4m20KzkFE9zPypLhH8+jz6T7ovDknlZIQo0YdbLEyWnW3ZrpKlGxi
 z6RPR7t79z28pTCYA49u+tRfUVUlH6oZTxJ/EbocFxW5bUHSHy0LaRaTHFz4oLMxcb++
 m0MIeQIWg7P1+PjMbiQ5BZ9MRuJ7QWKk9a3NUckpTrgCQQhvSdwxvhjP/s2MVHJ42B6d
 XoFA==
X-Gm-Message-State: APjAAAV5iJcn5lqCsLw1OHkks5x3lBh8gbhh/sqwmLpBjDWb5xHxcJKJ
 FU/h8SmYOuk2+iw9t6F15fR7uu+8
X-Google-Smtp-Source: APXvYqyKu+gF8PN5WrTaiHqpxPM4hKaIgEvUUt3+Z24hbtvXoxrdG/PJZmNKFUJICW57pVH4zDIVzQ==
X-Received: by 2002:a0c:e80d:: with SMTP id y13mr613698qvn.234.1573769657384; 
 Thu, 14 Nov 2019 14:14:17 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id l93sm3837243qtd.86.2019.11.14.14.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 14:14:16 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.4
Date: Thu, 14 Nov 2019 17:13:54 -0500
Message-Id: <20191114221354.3914-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnZBadinQ3UhurvnL2SkVvFYPRiGX0his5jUfJRkwJU=;
 b=dmt8EKLy1lvS0vKz2avuyxI5Dsp1X/+D7S5oqRAZPjgmAM551ALQChoKyxcuqjCn2U
 SDbSq35tSfa8qIlQ0rJaK51PxsdDr6De/QBERlJfH3z8Pc1o83N6OjT+wfim9Snv5SKd
 OfwP3O8oReewqISenoOdvNyatikB/ZDmwX+gGVnpJPgJtC5Zfq1sEEoggRu6DFBf6k3r
 8/YfqKDhDv2ONWlG+KypqxRetF/5xWDr43Q23iEycnh8WJmotI1EymZ/qdZ18pawNHFn
 qdC/W5guoMO/ATy07l3t5U5IRUAuGRSfMbkJn5SyyL0eqeiRPvXR+2clixTALWfTuCq7
 PSYA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLAoKSnVzdCBvbmUgZml4IGZvciA1LjQuCgpUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IDMxZjRmNWI0OTVhNjJjOWE4YjE1YjFjMzU4MWFjZDVlZmViOWFm
OGM6CgogIExpbnV4IDUuNC1yYzcgKDIwMTktMTEtMTAgMTY6MTc6MTUgLTA4MDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNr
dG9wLm9yZy9+YWdkNWYvbGludXggdGFncy9kcm0tZml4ZXMtNS40LTIwMTktMTEtMTQKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhODRmZGRiMTZkOWJkY2IyZTQwYjI2YWE1M2E0ZTQ3
MDM4MzkyOThhOgoKICBkcm0vYW1kZ3B1OiBmaXggbnVsbCBwb2ludGVyIGRlcmVmIGluIGZpcm13
YXJlIGhlYWRlciBwcmludGluZyAoMjAxOS0xMS0xNCAxNjo1MzoxOSAtMDUwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZHJtLWZpeGVzLTUuNC0yMDE5LTExLTE0OgoKYW1kZ3B1OgotIEZpeCBhIHBvdGVudGlhbCBjcmFz
aCBpbiBmaXJtd2FyZSBwYXJzaW5nCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClhpYW9qaWUgWXVhbiAoMSk6CiAgICAgIGRy
bS9hbWRncHU6IGZpeCBudWxsIHBvaW50ZXIgZGVyZWYgaW4gZmlybXdhcmUgaGVhZGVyIHByaW50
aW5nCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgMzggKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMjIgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
