Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBB702FC3
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACCB10E1F4;
	Mon, 15 May 2023 14:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726E10E1F4;
 Mon, 15 May 2023 14:30:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aad5245571so88071495ad.1; 
 Mon, 15 May 2023 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684161048; x=1686753048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKiFi7cchV1/CNWFldN1e7tKyJWR1+z9tt8oV8Nq+So=;
 b=U7v8btQ5/QYmSL94U2iZQqrHenblyfkJ8OvgC5n+sjZ3Yta/A/713ZWWd8pOxSGWgm
 hkW4A6Mqqszo8a7liLUH4loXS6zDTc5SGqD08T8ai5OvB6dpEpWOI+15JII8cSgX2gin
 Q7HBknzSE2y1ohrsHJaj5tvtoCPDpx4nCyqIVVYyKJAPzJBGKcWR7Bezgz1+IBk35Uny
 OR6bCaqsF7szeXVgcJNCZQYU0Oeu977lzX6PidABEwVAPaKNvSvR5yMVrxQQLf9S2tE3
 DzBLIxUaRY/UoBZ/KLEELQQCumpVBy//COL1zL1x/rJ83RYi/aA+6ELUZ10zhChOCogd
 dsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161048; x=1686753048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKiFi7cchV1/CNWFldN1e7tKyJWR1+z9tt8oV8Nq+So=;
 b=flP36lXZkHyFTUaPxSdJmRGzMdKq0eEgQ5EJ9R0dM9fWNzWc2oGWiL2rVfMO7XllMO
 bob+Y06mr8+AjXA9rCuIyI+hWuceYJpuFkxyGOq/YqqvAaFe1ozbuWOvuyHi2LNcOFL1
 kk35eSz3tlw/cxqNUDnLAJQCpixP6ch548lx+3LdWuUwnZN5WQ9Bz3OQU9o84gBIkq7N
 NHr9pm3fw5K7+M2Z32WB90lP59N+oSDue/yNpZ7VYP9Fcd7y9x/KZWoqDFme29F/xxHh
 vL7s5KajW3bWRGcPf6MR/7mNTR/KM565TdLkarJp0bZpC0j8ukmSP49UFwEd5ojHYCmU
 Iw7w==
X-Gm-Message-State: AC+VfDzf7jkDoogI0jWPHjn9a8hanQR8QuweXwdRJbvZ6WQsegIEN9Cw
 VLDEh86NA0BHhJQw42f8ma6YDLww57A=
X-Google-Smtp-Source: ACHHUZ4Zknr855Fx+2gL1S41HQi7R9Q/SvWwDE1oi+z6Z/cwmI2uo6gUDx0idW2j3FpMiK58ZLMCjQ==
X-Received: by 2002:a17:902:7481:b0:1a9:7e26:d72 with SMTP id
 h1-20020a170902748100b001a97e260d72mr33925292pll.9.1684161048587; 
 Mon, 15 May 2023 07:30:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902704400b001aaf370b1c7sm13552475plt.278.2023.05.15.07.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:30:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/9] drm/docs: Fix usage stats typos
Date: Mon, 15 May 2023 07:30:08 -0700
Message-Id: <20230515143023.801167-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
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
2.40.1

