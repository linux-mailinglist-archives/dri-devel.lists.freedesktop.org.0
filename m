Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF26F3603
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CF210E252;
	Mon,  1 May 2023 18:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184B10E1DF;
 Mon,  1 May 2023 18:45:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-51b33c72686so1794416a12.1; 
 Mon, 01 May 2023 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966709; x=1685558709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xlQgRgGnpnzTcnGyVtUcqaEHfPcu6dc+i5pcShGQrxo=;
 b=kRsbc8tlfk/H/cv097InCtoRduh0Q2peT/+ICEGVsdCySxLpPGs6lZFcQW1isxOIYv
 DpToN+aOtwZamMBWgLnntS32ZADvrFqAyvGYF81UPuDErrqXkAno9sehM9HAx5baUPUf
 AOT+20t3+OTA5Ac/yr1GPsSGcAY0J0l++i6HzhDW5ddBC8m5v07Lz0GY/p1WDHBuf37Q
 +BvoNNvuotTtkrvhp2v3sFlXUjuvmHW76vC7FYpyNoETJzENXbXPVSQJDOyX6py19UdS
 RkeJ0wQ3O139P4qNytKjJJ0zFi1AKI2RO5bdE6ukPAaPgZEBOFJ/VTvmTeGd/WygQPwG
 k1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966709; x=1685558709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xlQgRgGnpnzTcnGyVtUcqaEHfPcu6dc+i5pcShGQrxo=;
 b=BA0JcemH/80bo99iYPMHAee28kzWKyEJCHzBH+GJji/JojZ+gpqI7/T2AzQXrVkv8G
 KTh5pE4zdubiNwBcE+J9YvKEMUyanQfTxqbtBc2MCg38jaEEi1g7z9f7o3Psh63pz+sj
 YLsNkxZ1vMlYQd7vipG9w0lmk0rc9c/Dco96fNAi+fqsMbNaGb0r+IHy6CQ//LBzt+MN
 7zI/FJGCaGixEsl3+1h/pCktq47cCD2HlarPypzJ6wIUXAFLMl0Mk+X9Fe5njw8QxpvB
 OY0tABQYXODQnM6zvCq932rU5zM6GAxL2oTs8mlCMWQVguKr1GsPt7/ySmBO8XBbbHGk
 7p7w==
X-Gm-Message-State: AC+VfDy9YYIMDN1+JYyxP7TZR+wvI8T/MY1HeTr9TqMQj9sBX2bQTCKH
 dKi4T2FqYo01lCFW3OFKYpaUKtBUAkw=
X-Google-Smtp-Source: ACHHUZ4b+PxnvHuPTzQ0/tFd2w6+1Uyn0n4UKDVf+1oB8hgnSSkutccemZUA4kOfxhR3khAf5A59ew==
X-Received: by 2002:a17:90b:954:b0:24d:fb2c:1ae0 with SMTP id
 dw20-20020a17090b095400b0024dfb2c1ae0mr4322102pjb.17.1682966709532; 
 Mon, 01 May 2023 11:45:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b0024decfb1ec2sm3032473pjb.30.2023.05.01.11.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:45:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/9] drm/docs: Fix usage stats typos
Date: Mon,  1 May 2023 11:44:47 -0700
Message-Id: <20230501184502.1620335-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501184502.1620335-1-robdclark@gmail.com>
References: <20230501184502.1620335-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fix a couple missing ':'s.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b46327356e80..72d069e5dacb 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -98,33 +98,33 @@ is not allowed.
 Each possible memory type which can be used to store buffer objects by the
 GPU in question shall be given a stable and unique name to be returned as the
 string here.
 
 Value shall reflect the amount of storage currently consumed by the buffer
 object belong to this client, in the respective memory region.
 
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
-- drm-cycles-<str> <uint>
+- drm-cycles-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the number of busy cycles for the given
 engine.
 
 Values are not required to be constantly monotonic if it makes the driver
 implementation easier, but are required to catch up with the previously reported
 larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
-- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
+- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the maximum frequency for the given
 engine.  Taken together with drm-cycles-<str>, this can be used to calculate
 percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
 Driver specific implementations
 ===============================
-- 
2.39.2

