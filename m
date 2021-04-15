Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3A360FB6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B586EA80;
	Thu, 15 Apr 2021 16:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F36EA80;
 Thu, 15 Apr 2021 16:04:22 +0000 (UTC)
IronPort-SDR: atsYxLonA2As92chYg2Q0c8F6mURYf9srqX9Iifg9g3zlNL3Prk16NVXTSxZs0b2P19yj1WW9f
 YaA8Bw+Gq/4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182377667"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="182377667"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:21 -0700
IronPort-SDR: /Nkezeg8iJwSkSSbNqJbTuRCiM4qS6jgpJFCzD3rff6j0MyM9c/UzUCMtnlOo9S8Uzc39qg15o
 TxlwTuEHtMRw==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="425231241"
Received: from nmarjano-mobl2.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.7.25])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 09:04:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/i915/uapi: hide kernel doc warnings
Date: Thu, 15 Apr 2021 16:59:55 +0100
Message-Id: <20210415155958.391624-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 mesa-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not properly formatted kernel doc, just nerf the warnings for now.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
---
 include/uapi/drm/i915_drm.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index ddc47bbf48b6..a50257cde9ff 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1054,12 +1054,12 @@ struct drm_i915_gem_exec_fence {
 	__u32 flags;
 };
 
-/**
+/*
  * See drm_i915_gem_execbuffer_ext_timeline_fences.
  */
 #define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
 
-/**
+/*
  * This structure describes an array of drm_syncobj and associated points for
  * timeline variants of drm_syncobj. It is invalid to append this structure to
  * the execbuf if I915_EXEC_FENCE_ARRAY is set.
@@ -1700,7 +1700,7 @@ struct drm_i915_gem_context_param {
 	__u64 value;
 };
 
-/**
+/*
  * Context SSEU programming
  *
  * It may be necessary for either functional or performance reason to configure
@@ -2067,7 +2067,7 @@ struct drm_i915_perf_open_param {
 	__u64 properties_ptr;
 };
 
-/**
+/*
  * Enable data capture for a stream that was either opened in a disabled state
  * via I915_PERF_FLAG_DISABLED or was later disabled via
  * I915_PERF_IOCTL_DISABLE.
@@ -2081,7 +2081,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_ENABLE	_IO('i', 0x0)
 
-/**
+/*
  * Disable data capture for a stream.
  *
  * It is an error to try and read a stream that is disabled.
@@ -2090,7 +2090,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_DISABLE	_IO('i', 0x1)
 
-/**
+/*
  * Change metrics_set captured by a stream.
  *
  * If the stream is bound to a specific context, the configuration change
@@ -2103,7 +2103,7 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
-/**
+/*
  * Common to all i915 perf records
  */
 struct drm_i915_perf_record_header {
@@ -2151,7 +2151,7 @@ enum drm_i915_perf_record_type {
 	DRM_I915_PERF_RECORD_MAX /* non-ABI */
 };
 
-/**
+/*
  * Structure to upload perf dynamic configuration into the kernel.
  */
 struct drm_i915_perf_oa_config {
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
