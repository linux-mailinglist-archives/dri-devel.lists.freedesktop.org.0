Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21076F0B7F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121BB10E2E3;
	Thu, 27 Apr 2023 17:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DDF10E0C7;
 Thu, 27 Apr 2023 17:53:55 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b62d2f729so6871507b3a.1; 
 Thu, 27 Apr 2023 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618034; x=1685210034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGjGxmlouVGhi3M6MRZkXvcAVwGS3ye2TGK3XrM7dRI=;
 b=DskqNrsRREOOo5+tJopmLlCj6+GWPbnQOa2+AYvaPYS7fcpG66CcxTCQrmwYXBL3WQ
 +BkdoMC1ullgLuxY+Ds8+4wtsgzFGje4bjzDVek19jcDHjSS1Iwi3kiHP/PPZLRehB5a
 Zp9LmrhckNG6ETFh/+OolV51Jh7+GIC9C2SO6R5FS8jYo9CNKgW9yAbalvrpaQyX2EPq
 eWT+EyJF3gEjxMScpTDYWjmkLghh0ytfAuhZhmGQIQODAZandBUchj8+1gQFeECBQGq8
 REtNK/WAXbsVAO/yv/vqGiymb8vtB7zd/Ta6RHuHWOSSGCwY+wkETaKIIS/jwqU+/MpU
 8Qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618034; x=1685210034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGjGxmlouVGhi3M6MRZkXvcAVwGS3ye2TGK3XrM7dRI=;
 b=hxOJTTOGzs0nmWFhxGd1h2SgQwA/zuT1Cs7nj0tRZyUny5ZJwdNbcG1gPuemzmr+DN
 ynQf6JgBcXSNDLhorf20Y8ziZf24Un3pY9ZQEC5jfyS2wI6VkkDY/Hr+n4oeNCEb0ISY
 Tt7eajyWAJhh9V98OjwKpJ2VFAO8woZlHIxHhTSiiU8ivlRG6DwqLVSM+vjhsf3b0iVX
 cJlDrVIUgOKu2Ki0VI73VcyOTtVRBEHOB7A6TctE1Z7mO2DVl2p4/+9ddcvv1k7f9PLg
 DANqb4ttnng80yuZNQSMyrIi5gYrfacJ9SFmcDjgUIp5QVNmu/SiMU8SJp21jinYEqA0
 RYFw==
X-Gm-Message-State: AC+VfDxmrnZjtNCZtvakMqzvUgWNQzoUHNECsgdNV9Ujrb9Sa/2Uopm8
 ZsDcdg8KgtuY8eQSU7f9TrHnB9CFlqs=
X-Google-Smtp-Source: ACHHUZ6B+aak2ZkUYsB+1ZMUHj9b32Ns03yuVkuacD2JU5/1vQBVbzhVWx7Q599OyF6uLhjfXVdnNQ==
X-Received: by 2002:a05:6a20:7f97:b0:f3:67da:9db5 with SMTP id
 d23-20020a056a207f9700b000f367da9db5mr3076695pzj.38.1682618034603; 
 Thu, 27 Apr 2023 10:53:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a630f1b000000b00502e7115cbdsm3662034pgl.51.2023.04.27.10.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:53:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/docs: Fix usage stats typos
Date: Thu, 27 Apr 2023 10:53:25 -0700
Message-Id: <20230427175340.1280952-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
@@ -105,7 +105,7 @@ object belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
-- drm-cycles-<str> <uint>
+- drm-cycles-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the number of busy cycles for the given
@@ -117,7 +117,7 @@ larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
-- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
+- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the maximum frequency for the given
-- 
2.39.2

