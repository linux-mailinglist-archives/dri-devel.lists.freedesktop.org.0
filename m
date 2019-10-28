Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B188E6E26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEF96E4B5;
	Mon, 28 Oct 2019 08:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D706E384;
 Mon, 28 Oct 2019 06:04:54 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p12so6160119pgn.6;
 Sun, 27 Oct 2019 23:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lW+AMEtlabITQrPIpkqEPcUL1c8hvMDtNJcO22Y71bs=;
 b=XLFsV3p4eLWe/NzPqy15ubnx9L/GRgzfB9L31JBlsmr+GbAc0itTqWFK79N/els9wi
 wAjtCgPEuUFn8zb8JgGSPyy9E2CpbOAmu1rjyPdIhMnPcv9v/ZITeTytcfI8iOnJqabA
 yzy8wYEuWkbCUcVvvPUpP/P9XZjNPUk5FU5vD3NRs+e9bpizTspoDIhXdfq4eJM8ef88
 sBbPZmmSiPz4LEbMD8g3cp8lVWCaQxqZ97cyapOb9RVSWT/aUZiB6ywWWlb3Vc1QHkWc
 VGEbSWp4aD3HXdD22vtDTV5FI4Q2d37fDwIpYav3yqwOVuM9ORgAM+jrOf2ZNcHu8mpZ
 FQSA==
X-Gm-Message-State: APjAAAVrvdpkgXzE6dByh/dgmvbpjeEPg5pxNOF5Ve8BHXENNRwfWUxh
 AgIZemSoSZM4a2ZEUKKflIs=
X-Google-Smtp-Source: APXvYqypO2kpkDNISVJ7fsyBWXgUnI5+CNeeFIO21EiBsPoZf30U5WuHHFkB6bbCN9JfOQOvi3YBew==
X-Received: by 2002:a62:1454:: with SMTP id 81mr18453438pfu.43.1572242693463; 
 Sun, 27 Oct 2019 23:04:53 -0700 (PDT)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:539:cf3b:393e:2dcf:24de:b4fb])
 by smtp.gmail.com with ESMTPSA id d25sm1008366pfq.70.2019.10.27.23.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 23:04:52 -0700 (PDT)
From: madhuparnabhowmik04@gmail.com
To: harry.wentland@amd.com,
	alexander.deucher@amd.com
Subject: [PATCH] Drivers: gpu: drm: amd: display: amdgpu_dm: amdgpu_dm.h:
 Fixed a documentation warning
Date: Mon, 28 Oct 2019 11:34:43 +0530
Message-Id: <20191028060443.14997-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lW+AMEtlabITQrPIpkqEPcUL1c8hvMDtNJcO22Y71bs=;
 b=fA1GFgr0M7qMTfbFv+f/Ka2HxjRPYS4lE5hTtV7aQ/+wsXdC92oDJdyfBV8WlQXp+9
 EgaWvx17CWE7JOG/QdpW7S8nJtT4Yf6W4E0NZgO9bzQQIuwl3D39yXc7bnnl3KJcIPaN
 EVBLmGLrza4ev6kL97i+ybUziWXmpK7hdBVIbwKr0XEibvi7rkLUUZzD80/ov+7myDXg
 mMoHsByScueJM0AcBxi6wW05VZplyaKf6EUG7aFJdA8ufZZOndv4vBD5WYqTHsLCSeBD
 lk/GQJgJgH758N9hVMj3fW1uIgW9evdI80GELTyi3O+MKyh4oW9OHHr8gRqWhWVCRXnI
 NdwA==
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
Cc: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazA0QGdtYWlsLmNvbT4K
ClRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyAgd2FybmluZzogSW5jb3JyZWN0IHVzZSBv
Zgoga2VybmVsLWRvYyBmb3JtYXQ6ICAgICAgICAgICogQGF0b21pY19vYmoKYnkgYWRkaW5nIGEg
Y29sb24gYWZ0ZXIgQGF0b21pY19vYmouCgpTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5hIEJob3dt
aWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCBjOGM1MjVhMmI1MDUuLjgwZDUz
ZDA5NTc3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5oCkBAIC0xMjgsNyArMTI4LDcgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgewogCXUxNiBkaXNwbGF5X2luZGV4ZXNfbnVtOwogCiAJLyoqCi0JICogQGF0b21pY19v
YmoKKwkgKiBAYXRvbWljX29iajoKIAkgKgogCSAqIEluIGNvbWJpbmF0aW9uIHdpdGggJmRtX2F0
b21pY19zdGF0ZSBpdCBoZWxwcyBtYW5hZ2UKIAkgKiBnbG9iYWwgYXRvbWljIHN0YXRlIHRoYXQg
ZG9lc24ndCBtYXAgY2xlYW5seSBpbnRvIGV4aXN0aW5nCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
