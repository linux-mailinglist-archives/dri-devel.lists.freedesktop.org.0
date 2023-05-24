Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C470FB1E
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0AC10E67D;
	Wed, 24 May 2023 16:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6E610E67B;
 Wed, 24 May 2023 16:00:12 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ae615d5018so3401005ad.1; 
 Wed, 24 May 2023 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944011; x=1687536011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSswnMLwwEGQnN2xlrnUru6iM+0TXo2/wbtbw8wTOo0=;
 b=B+Bsw1NUnpKejAiuRxs86EcWG/xC9B2nB98H9nqq+mvMU2qeXTEIzfpT40bDW4kzZI
 u3GG4tS+dL+RvZBM46eFDEu6To+siU2UEFVnq9Bujpx92iJe+n+uA/IY45jlFjMtjE6H
 UJsf9+3XGmpuM4rFzC8REjnC2Umj4okDLEFBYelLZObja7FuoIUCEpkvIz2DAppfXZa3
 68gdUsJhcWKUZ30KLvw5you3T0dIt93E+bVv2hac/q3ga0plJP1eEcYYuBHzwl5Ag3/q
 kSZZCx3wv+YvGhO+3p/S8wzKUK9RlU8Io1cwT+nP3Ss7IGdLZjNCXIQi5Tb+hoOk5u9P
 7mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944011; x=1687536011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSswnMLwwEGQnN2xlrnUru6iM+0TXo2/wbtbw8wTOo0=;
 b=INrW1raPCfwMoh/7LalYiinf59S9oOyQJWKOhermpU5V5LY3S02ZhrG09SmaGoB5wT
 VMFPaXe1icS1m3ycLUpZLSmTWbE/jgpK/8+LwHHWa6Wcnw40oLpk1Ldu+7HOLci8OT7n
 mKAmOalUvog4fTm3Ee+fMF7UWu8vrdLoK/HDCcMLC9JQz2d5pkminKSXsMYHUHQ/SPxF
 T26U0wT1w1kcTf2xPH4OkRsk/w9JgF+jflRWsoH52ujJqPWegW+FPrx7zRimOoZv6yDT
 d+85Jkwd3ipjCn56KIkraq8FCgvrD6OeZncDcynDY29JxBWQbJEwCk/+PiZ8OohXhg5n
 zeVA==
X-Gm-Message-State: AC+VfDyPV7nILsP56BzrDKzLBYyVTZQ5c8tG4qWXeh/1LVrklQbHa/ki
 O2MawTwXRrEhmjJfdCabHSdUnQ7w1lY=
X-Google-Smtp-Source: ACHHUZ4B7uPtJ7sN4k/tvRDpTXNjWvoZAnRI7XqCVYOuMgRJiNLAZbt9+ZqdTUOnaHPAUA2M6EXipQ==
X-Received: by 2002:a17:902:c402:b0:1ac:b259:87ea with SMTP id
 k2-20020a170902c40200b001acb25987eamr25487162plk.0.1684944011561; 
 Wed, 24 May 2023 09:00:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jk17-20020a170903331100b001ab1d23c44bsm8979421plb.181.2023.05.24.09.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/7] drm/docs: Fix usage stats typos
Date: Wed, 24 May 2023 08:59:31 -0700
Message-Id: <20230524155956.382440-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155956.382440-1-robdclark@gmail.com>
References: <20230524155956.382440-1-robdclark@gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fix a couple missing ':'s.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Dave Airlie <airlied@redhat.com>
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
2.40.1

