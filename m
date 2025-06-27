Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C32AEC2B6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6B710E0D1;
	Fri, 27 Jun 2025 22:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BIc5jGuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D910E9E4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:01:13 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-235ea292956so22036365ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751025673; x=1751630473; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lMm0f1YmbF8p/DacuZnlM8/zlr0CWYSCJDnnq1mmyww=;
 b=BIc5jGuKAz7vme4NKPPuWRDS/tliid/Ekvx9EPlkDeo9Nhhmaa4Vbadbm1KlyaIpnc
 7i7KyRg4Q5hIxm3IWHLRrPBP7Fl4CvfLnsg4j0QbSvxxn1trcgwfmbhbi+9qznPYJtdV
 fpXd7zvvdvrTO3mEbDGDynAylIfoLoj6RRF7UvOUgu+PXhyTBJTKXRZjk7AuxWygJznk
 JxlnBDp4CftyToxeVoXZ83NK6ZGa2csUQG9IGI3q1hvF+oYLk2C0s0KGoc6tpoPYrPXd
 4UM5sASQEMQx8sDRf3wEjbjg/3Y9ktQbfGYhQQ5ACO5+p6bQPrQ+YgHdIyhIH7z+hlKF
 cAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751025673; x=1751630473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lMm0f1YmbF8p/DacuZnlM8/zlr0CWYSCJDnnq1mmyww=;
 b=o5uKf8INWGOdCto92CdiSUxFyiX+XLNCIfPEqe7xk/qT5YBSsppcoarH65v+c+MUJ9
 fZdUBoedwIoxLhhSNc92TGyMJKhddfYebBHVAe1a3BzF5FragbVUdCq0YY5xHefA9vP9
 TIpiZY29Bo2LZ9ZBIHXZD6IOKjuhG7kW92W7HGKr2mydU8kUy71I3dnEIIujukmKQJt7
 n4TaHxCINozKxtQqdb1ohU6iTO3Bx8JAJ0w1zRrrvrvO4z4fwrTakSNJ3SwfD6BnztLi
 BPpo7iQIEDW1pmdW/OWRJp5SIXAAr+5adk5xxJvRZhQlTkgre3p5KSmAJOS9DAPoqWc3
 wVGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwoZ0xZ3se3Q7qgJ4MJFNOqJEaNJdm7ojlfRdLDf92L735bHIhfW5schlXsRTRiBc1uMevPPlY/bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvmlyzvTT8mUFNJnVTFbcbWL2fhSxZb4Po9N6moYJF2yjCaCMB
 aDTZTEJpQeM2pEGVSyoS6TVc9lBpKw85uJpty3CdbIuDd5EmRKRvJ1Nj
X-Gm-Gg: ASbGncsG8N3t6BC56Ti/XG4XvV0KhcP//rbh4RrIOatZfhNeoXhRAMC7kwJa/k7wUAz
 z6aarNY/L691aiocskRRhUEN0eJ6XOKbQjdMqXSKoCTt4yEm7QcvkbVcG73w7d1uzmSzqttnHay
 tkyGjLZdi7zoP8ovbBW4DDe8f82JDJrDwn9SdHeAWQQ8Qf1NIlSqna+464RZLY2KOXpSyZD3d+B
 IX3DsSb0dpIJsAAaCLNROaffffXIedaTFSTDFztkS2/JCrNpcGsLefaLxILdNE6czHgUb44NVsv
 /z+XMYx386L/qIdZiqDXlIdcHc34oqZn7ChtkQyOxVwcUntC3BjhfMtkMa7i6xoFGugbb6no24d
 KXC70p1w=
X-Google-Smtp-Source: AGHT+IEFON4jPah/zgdrDesiC9nxTOgYF3/CFQOwYad3x3aR0NDjxOCJA2cEtxdL58xlsqxaUtKPFw==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id
 d9443c01a7336-23ac48b6862mr44612935ad.53.1751025673095; 
 Fri, 27 Jun 2025 05:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b8easm14451815ad.96.2025.06.27.05.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 05:01:12 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kevinpaul468@gmail.com
Subject: [PATCH v2] workaround for Sphinx false positive preventing indexing
Date: Fri, 27 Jun 2025 17:27:18 +0530
Message-Id: <20250627115718.17673-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Jun 2025 22:43:17 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name 
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions

This is a bug of Sphinx >=3.1, first reported by Mauro in September 2020
Link: https://github.com/sphinx-doc/sphinx/issues/8241

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 4 ++++
 Documentation/gpu/drm-uapi.rst | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..b18a99869b6d 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,8 +357,10 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
+.. c:namespace-pop::
 
 .. _kms_dumb_buffer_objects:
 
@@ -473,8 +475,10 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
+.. c:namespace-pop::
 
 KMS Properties
 ==============
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..e9d7b7282a19 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
+.. c:namespace-pop::
 
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
-- 
2.39.5

