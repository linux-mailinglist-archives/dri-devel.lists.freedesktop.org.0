Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3822B63F444
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E6A10E628;
	Thu,  1 Dec 2022 15:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7D710E626;
 Thu,  1 Dec 2022 15:39:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id t1so1442739wmi.4;
 Thu, 01 Dec 2022 07:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7khnonYfy4kMw5YrLUdWciangWNF/Rcsht2NfCuP98=;
 b=JDHX2Ef/eGunqsAS2A/QsNSfTGzQ9HLN3nyTgk0TE4UPI4oNls73HDML6r/m9Vda/X
 ilej4uBBfLJ1H0X/pjnNPvUyTUwHo8YEcbvn8Z7uvvpsudk1v4Q9IO1ygbLkn71uHIEk
 8+q6Ecke1blGoEePDwxOhvM9fqUx8zUzqtEiCJPTy4TjGEBf18N1Hbys3jClLejEV+QD
 TeYkUBDxjnnoBov+qs5ZreYpk0OfznbTl9ntaJl3ia2ETbbmQHMYQbBcKklxr3SIttBU
 oe44XRPAuhNXi7XPi9RqcJOX0ZJ8zUwpZXJk8JifGgQ6Nf83MFkVlH27AnqQ62hMx+Hw
 JWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K7khnonYfy4kMw5YrLUdWciangWNF/Rcsht2NfCuP98=;
 b=bz0UJDSZwTA9X+HqCXvDNyS0Rj/G137Mtv6qxjGqQUob3nBsSWyJd+8QEHYF0kv+0r
 fOhKxSXfeeHCADC4hv6EJiN/4dpMflKDZGSMLwKIZsyT5sD6cpWytIcWHl9sdMb0oyo1
 uQOfvOAw2TVhhhHhA8KEzXOb3CSO8LcLJ1H2Ho3va/xp92ajA0gHEY6OrjH/TxcLkSCy
 mJOgOU/PQse+5WrzmPElkqNS9w8IKXnt1RKI6iBevIuN1H4puhWnmyl7qPBB+FPvSyRf
 3N+hYbu6Tt1fU9nGxPelwf8h3wPyLYvXgl3L36hu42Mk7nmqa7Tzp7/OtJyHyAJSkX3m
 slfg==
X-Gm-Message-State: ANoB5pkLg6zfs+K3FKkizuEypzL8RRW8EV3mU1c6ez4XKqoh94plGvm4
 uxOrxe1jTsUvZWUJvc+Nk/o=
X-Google-Smtp-Source: AA0mqf73XEGmHBsINcaGBgXVrgZEX+L3ujME2ZROjhfpOEDJGxp9qHMfj044jAOBJh9ZlwetXJO9YQ==
X-Received: by 2002:a05:600c:18a1:b0:3cf:a9d5:36c7 with SMTP id
 x33-20020a05600c18a100b003cfa9d536c7mr34763990wmp.13.1669909167060; 
 Thu, 01 Dec 2022 07:39:27 -0800 (PST)
Received: from wlan-cl-kit-cs-172-17-20-201.scc.kit.edu
 ([2a00:1398:9:fb03:6341:588f:5b6d:9173])
 by smtp.gmail.com with ESMTPSA id
 fn7-20020a05600c688700b003c6b70a4d69sm5523597wmb.42.2022.12.01.07.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 07:39:26 -0800 (PST)
From: Peter Maucher <bellosilicio@gmail.com>
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/amdgpu: mention RDNA support in docu
Date: Thu,  1 Dec 2022 16:38:24 +0100
Message-Id: <20221201153820.257570-4-bellosilicio@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201153820.257570-1-bellosilicio@gmail.com>
References: <20221201153820.257570-1-bellosilicio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maucher <bellosilicio@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu kernel module has supported RDNA for a while,
mention that in the module description.

Signed-off-by: Peter Maucher <bellosilicio@gmail.com>
---
 Documentation/gpu/amdgpu/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index a24e1cfa7407..bcc0f5c15f93 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -3,7 +3,7 @@
 ==========================
 
 The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics Core
-Next (GCN) architecture.
+Next (GCN) and Radeon DNA (RDNA) architectures.
 
 .. toctree::
 
-- 
2.38.1

