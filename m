Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A28A6F3612
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B410E447;
	Mon,  1 May 2023 18:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636EA10E43C;
 Mon,  1 May 2023 18:45:24 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-642f5394651so387439b3a.3; 
 Mon, 01 May 2023 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682966723; x=1685558723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPMqzx0tM4YAjR4KEyZrtVllL0FOx+3j3GjXG2bjHSo=;
 b=m0yeF5XDnoSNCwWz8zb/15XvdP85Wq9Wty2g5oK1tWp5bpWl6MJt8GhEaD0cX25F2Q
 3Gv7A//1uVPQKKu7iWp7bPWX61K+M8YbK5pvQ0pg6Ob3cSw7XYdxYhlIVfJDHRmLqdt0
 /J5UV81E9BNJUaJd3HxTFbZTBn4GxMw3zLsWaEqt3uq9dPR4awpWlaH1Q1lSFa539lWT
 msGRv/uFpr9s1XT8zRwVdIAlMSQsbHtogIwLIEdQnhF8j26m2KvK9vKRiA/lUrVWujQt
 L4S0z5C3av2GWfYb2zS8bmVHtoPDPY8vsluNOZltL4W1BQxZxjaUlq545p/UzpUjSOgb
 PcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966723; x=1685558723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPMqzx0tM4YAjR4KEyZrtVllL0FOx+3j3GjXG2bjHSo=;
 b=SefXFy5z3S93rUY9pg8Wxvv2drV2ltB7CkKdfGLwdl8rGSrYtrZODb4XEEpaNw8/W9
 tmurLd6ZZGJ4E2E8OjWioS39o3DBdADkuHKcf7oLjnUL1gXclaE3t1AS53FoFl4FqlrY
 BXUx9iVmVxsSa1cHtm1zG0KGRzNUhMolbt9iFX8IpfAAgw1q5iXRADgs5rkClV4wP2WR
 4TuL8addp7BUIvWymJB27fy49Jlo0Og37HlTt1E1I5PNyvoSodRFCbVr/zhG3ktcVeYi
 o6hJoW0BFLUze/uLbU203cBCUc+Y0aJP86fCUWpDyaznCXr0HvvHB/rw5eWeH0j/bs8W
 HVyg==
X-Gm-Message-State: AC+VfDzo8pHqss5FJLQgH8uQ6b9G4jJcES/jHLPeuM1cUAf0HJ/RjFZ7
 AVRdGo45DL7u8jzXK07ckXsD+Y1aL/s=
X-Google-Smtp-Source: ACHHUZ5kWDPbyXZ8IAVsgL324BEDoAigBDLexRlapPgQoDaPBV8uSYJRoanU3EsEU9ZHORHXg+btAA==
X-Received: by 2002:a05:6a00:2d24:b0:63b:2102:a1d4 with SMTP id
 fa36-20020a056a002d2400b0063b2102a1d4mr22975654pfb.13.1682966723259; 
 Mon, 01 May 2023 11:45:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm20201846pfb.104.2023.05.01.11.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:45:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/9] drm/doc: Relax fdinfo string constraints
Date: Mon,  1 May 2023 11:44:53 -0700
Message-Id: <20230501184502.1620335-8-robdclark@gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The restriction about no whitespace, etc, really only applies to the
usage of strings in keys.  Values can contain anything (other than
newline).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index d012eb56885e..fe35a291ff3e 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -17,41 +17,42 @@ wherever possible effort should still be made to standardise as much as
 possible.
 
 File format specification
 =========================
 
 - File shall contain one key value pair per one line of text.
 - Colon character (`:`) must be used to delimit keys and values.
 - All keys shall be prefixed with `drm-`.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
-- Neither keys or values are allowed to contain whitespace characters.
+- Keys are not allowed to contain whitespace characters.
 - Numerical key value pairs can end with optional unit string.
 - Data type of the value is fixed as defined in the specification.
 
 Key types
 ---------
 
 1. Mandatory, fully standardised.
 2. Optional, fully standardised.
 3. Driver specific.
 
 Data types
 ----------
 
 - <uint> - Unsigned integer without defining the maximum value.
-- <str> - String excluding any above defined reserved characters or whitespace.
+- <keystr> - String excluding any above defined reserved characters or whitespace.
+- <valstr> - String.
 
 Mandatory fully standardised keys
 ---------------------------------
 
-- drm-driver: <str>
+- drm-driver: <valstr>
 
 String shall contain the name this driver registered as via the respective
 `struct drm_driver` data structure.
 
 Optional fully standardised keys
 --------------------------------
 
 Identification
 ^^^^^^^^^^^^^^
 
@@ -68,62 +69,62 @@ to the in kernel representation of `struct drm_file` instances.
 
 Uniqueness of the value shall be either globally unique, or unique within the
 scope of each device, in which case `drm-pdev` shall be present as well.
 
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
 Utilization
 ^^^^^^^^^^^
 
-- drm-engine-<str>: <uint> ns
+- drm-engine-<keystr>: <uint> ns
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
-and unique name (str), with possible values documented in the driver specific
+and unique name (keystr), with possible values documented in the driver specific
 documentation.
 
 Value shall be in specified time units which the respective GPU engine spent
 busy executing workloads belonging to this client.
 
 Values are not required to be constantly monotonic if it makes the driver
 implementation easier, but are required to catch up with the previously reported
 larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
-- drm-engine-capacity-<str>: <uint>
+- drm-engine-capacity-<keystr>: <uint>
 
 Engine identifier string must be the same as the one specified in the
-drm-engine-<str> tag and shall contain a greater than zero number in case the
+drm-engine-<keystr> tag and shall contain a greater than zero number in case the
 exported engine corresponds to a group of identical hardware engines.
 
 In the absence of this tag parser shall assume capacity of one. Zero capacity
 is not allowed.
 
-- drm-cycles-<str>: <uint>
+- drm-cycles-<keystr>: <uint>
 
 Engine identifier string must be the same as the one specified in the
-drm-engine-<str> tag and shall contain the number of busy cycles for the given
+drm-engine-<keystr> tag and shall contain the number of busy cycles for the given
 engine.
 
 Values are not required to be constantly monotonic if it makes the driver
 implementation easier, but are required to catch up with the previously reported
 larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
-- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
+- drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
-drm-engine-<str> tag and shall contain the maximum frequency for the given
-engine.  Taken together with drm-cycles-<str>, this can be used to calculate
-percentage utilization of the engine, whereas drm-engine-<str> only reflects
+drm-engine-<keystr> tag and shall contain the maximum frequency for the given
+engine.  Taken together with drm-cycles-<keystr>, this can be used to calculate
+percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
 Memory
 ^^^^^^
 
 - drm-memory-<region>: <uint> [KiB|MiB]
 
 Each possible memory type which can be used to store buffer objects by the
 GPU in question shall be given a stable and unique name to be returned as the
-- 
2.39.2

