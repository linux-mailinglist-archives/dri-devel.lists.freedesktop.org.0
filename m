Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF606F0B97
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1085910EBA6;
	Thu, 27 Apr 2023 17:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061B410EBA6;
 Thu, 27 Apr 2023 17:54:09 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b67a26069so10979573b3a.0; 
 Thu, 27 Apr 2023 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618049; x=1685210049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5X8ws8C9Uya1bH1qvM3ByEZiUSzSNNSQCvKC0+MH6tc=;
 b=FJmULW49+UMYCVzDkpdb7BszKylFpQ8Go8QKjSNPi9p1Epfy9Abj+ptulI1LZsNXYO
 Drur1lnhr+2tDX7fQ5TKZA6bWEIgZuH6kNGI3k3r76j0lFiQ2B3/ufbtNACKCxcYD3PD
 2oiXG504lUTQJI8Ol1FBvV0twNshzJFLFJNj5v2Y/ze2zM7gaXKXVrQkJDZKFLRqg1HA
 aQ8ArDm80oS8vDG+z7RNtaF5HamxWhVFBKj8cE/bG2KcuxlKFD0q6pBs2kxDH/FJBDIS
 9mMTob0B48PC8gzJcc/I4A2EMUcHUJj0GYAPsFe5i6yUQQGY7w7y8ITx7QFUaSsqOMRy
 rQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618049; x=1685210049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5X8ws8C9Uya1bH1qvM3ByEZiUSzSNNSQCvKC0+MH6tc=;
 b=PszJBpdaCAGX6FCJDrSehW3cE4NVXIsRhciWQGDBbcobotwj2j82fsZFvvWFFm55JP
 EPBlSweJ16UbBeEHIXG0d7357yc8v6cwoN6N+qoiDB3WaaJx/DEHxIC3Ojskb9yipXOz
 wLzVq8fBRq0YLSusV1RRWF/SpqYKDNSjntXyghsU//jRTwZh+TykKCqrmLRJLtrHDr7+
 ElFOlUy0FAf6O9GOvBRR4o0uXL6khc9xhRsBJIVvkkrBluTDyQhJjpnVwFJe49KmDzrp
 7sa41uHtCzY3vlOYErmp5/UE7bSnl1dWgYnU8bkv/g3Veu5pkP5J/SMcFZzJIfW1YVeV
 orJQ==
X-Gm-Message-State: AC+VfDz7cCm2uvMGvheHBG2jE4hGh8DGXkGyzfGhZBGGIRjGKXCPJgYo
 2nMNKDmaryreViPS2mABi66Opi4aXic=
X-Google-Smtp-Source: ACHHUZ4MKuwKrDINV0TTla8lJWfaf+1NN+A7s4Fg1UjvkclS6fQTdlIEtFpva4hScU7H2HtK4HrNrQ==
X-Received: by 2002:a05:6a00:807:b0:63f:244d:cd07 with SMTP id
 m7-20020a056a00080700b0063f244dcd07mr3256742pfk.31.1682618048750; 
 Thu, 27 Apr 2023 10:54:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a63e809000000b00476d1385265sm11680207pgh.25.2023.04.27.10.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:54:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/doc: Relax fdinfo string constraints
Date: Thu, 27 Apr 2023 10:53:31 -0700
Message-Id: <20230427175340.1280952-8-robdclark@gmail.com>
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
index bfc14150452c..58dc0d3f8c58 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -24,7 +24,7 @@ File format specification
 - All keys shall be prefixed with `drm-`.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
-- Neither keys or values are allowed to contain whitespace characters.
+- Keys are not allowed to contain whitespace characters.
 - Numerical key value pairs can end with optional unit string.
 - Data type of the value is fixed as defined in the specification.
 
@@ -39,12 +39,13 @@ Data types
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
@@ -75,10 +76,10 @@ the above described criteria in order to associate data to individual clients.
 Utilization
 ^^^^^^^^^^^
 
-- drm-engine-<str>: <uint> ns
+- drm-engine-<keystr>: <uint> ns
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
-and unique name (str), with possible values documented in the driver specific
+and unique name (keystr), with possible values documented in the driver specific
 documentation.
 
 Value shall be in specified time units which the respective GPU engine spent
@@ -90,19 +91,19 @@ larger value within a reasonable period. Upon observing a value lower than what
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
@@ -111,12 +112,12 @@ larger value within a reasonable period. Upon observing a value lower than what
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
 
-- 
2.39.2

