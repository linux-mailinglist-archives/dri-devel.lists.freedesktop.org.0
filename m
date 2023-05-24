Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB770FB2C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AC810E68F;
	Wed, 24 May 2023 16:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890D110E691;
 Wed, 24 May 2023 16:00:40 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d293746e0so1202501b3a.2; 
 Wed, 24 May 2023 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944039; x=1687536039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ex5RgcOGAy76xADxIoHPP5AhCcNedegsTMiHxYneYvA=;
 b=AESaB1MjaCZtF0RCoh9e77N5vnrWapnBypJL1aCtjHEnEZb14XPLFFeEJGplihdCB9
 xcEovBnrNPwzC7actG2PNYtsxUMNUvPyjKjRRUrpLAdhSU5qs/L1njJWvayRfHp6l+gz
 DqdY/B8iS7/N4Cz3Mh8phN8N4jdj1+hGp50cUv08D3FxbcIRaj092Fo6DNoRQFZ2kjEG
 FdlR6Vkl83wdnxOKU0/1vIWWJhcfMA+VF0M9QMBpwhVsYaADIYuYWXvuGLJxUk/v3JW0
 4nYEjVSCl7hMOEonBURtneMlQ5nePBIVU79XIPcNi5N5riSozrlNxKYUZdorCfnJ7/CW
 cgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944039; x=1687536039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ex5RgcOGAy76xADxIoHPP5AhCcNedegsTMiHxYneYvA=;
 b=bR6SkpRw8j9rR1hNENzceBzp8NMOImSAO2PuEcY+7W2vNI9V/e6eeFk9JJDmGChoC3
 H+atFznC2OpwbS0WdYTh64cMnUaaYba2Jciev3oDYuzGS+8kpgGvce8iBNsfXtP+hOy6
 JkWQC0GU6CRehXR8Q0bPxFZGeNu5rImM+aoex1Lz36e5zlmYjVHK6rm4aPNST0wNlNgM
 OnNGbi9wuYJjhRA7v1eNR9OomBY+hZGwfRBYCSaTPRcpIT6+S1m62dpPixUOCMEaRnco
 sK+RDDCskVOr5zIpNCqsqizMEsN38H+YrHGaNkyuXRTTh2iO/HWt0FqbyNHBZIcMDFWC
 aFfg==
X-Gm-Message-State: AC+VfDx9+FlHGYkdkmoT7g7CQvmUiphw688Y/LAakrDAigQMzGdZvyfV
 tpcK6X5dPOuygVismzlqrqEXtz5iWnE=
X-Google-Smtp-Source: ACHHUZ7onA/29uMKwZvh+T+iC1Z1taVKK6Wncz/arA/4C9WyRm6daOgouT46veHHvrkbpt6hDF5Vwg==
X-Received: by 2002:a17:902:748c:b0:1a9:21bc:65f8 with SMTP id
 h12-20020a170902748c00b001a921bc65f8mr16308136pll.11.1684944039060; 
 Wed, 24 May 2023 09:00:39 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a17090301d000b001afccb29d69sm3698533plh.303.2023.05.24.09.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 7/7] drm/doc: Relax fdinfo string constraints
Date: Wed, 24 May 2023 08:59:37 -0700
Message-Id: <20230524155956.382440-8-robdclark@gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
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
Acked-by: Dave Airlie <airlied@redhat.com>
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
2.40.1

