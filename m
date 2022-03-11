Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335094D59CB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036B710E2A8;
	Fri, 11 Mar 2022 04:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D292410E1A4;
 Fri, 11 Mar 2022 04:48:15 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id i1so5231975ila.7;
 Thu, 10 Mar 2022 20:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLJUfv+vtv2Xowd95rnmv6x57XGkiZ9Q0usZnZ/h/Fg=;
 b=BAdskuKI9VfM7g6MdIyYCX2934INAcfFZM/kOhzMVypR3K8e7NmjKtCM7hl7IYj5Kl
 EHeCr8unRoU01MBlC5kYDefRks2BQ1aUfmU96GgZYsl9bHnBJwvPZmXBF0TSKsqRBUpg
 C4RbYO3+IpyxYfjmmUpkMN4YzXG/4ZMp/8mTykqbL2hKdGvPsAFQTZZ6V6eOu0CnKrTg
 m3iT7oNE6t8/bpSlo7but+KoXGCgNFHgRkWb4tFZq2X73fyP88KLOV1ZUsTWe1dC41tO
 nsisO146qbke7GYP3PlH0YI7cu27QAqAGGVTyUj1jaemxEZNJTJCVP/ccw+syqddgWq0
 ef/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WLJUfv+vtv2Xowd95rnmv6x57XGkiZ9Q0usZnZ/h/Fg=;
 b=spID9xhLzyAhS9itjzdaS2qE4QwZpCvEehJqSSXrHeg65k6ymPF5/zmgzDsjcqVodv
 tXpYmGEYDH7zcDv/vBuQkyqe3H5IW9TGXjj42r4NtCu8WCSg8kFLt7AHgg+gnVyiMi2V
 4/iWPiTIZhDZhuZGE5E3CAUx4BOZy3L8M4yjSeXRxLbW+7zgRzhV5IOss72VcQHtDb1n
 GvjfL/xN9tlhiMFTV1BPi2aE2lqP96fD5yKV9t+nVgJOFrv5ka+589sRmPoczFaruP/T
 xhld2B5oAXywcJRp9LYjuE5ry2PH8kFzw6uPMccGnkUhNSIs+Fc4skozMlDiZsvmXWut
 TLmA==
X-Gm-Message-State: AOAM53370aE0nNKMrsedX0Sm1qLsHFfwol4HeOn3sWR2umLpXbSQSm6s
 bJEPcW/sU7PXx+F21XKZsIc=
X-Google-Smtp-Source: ABdhPJwLiyGCqptiiJ1W3yzIkkwWcID1+2qC+xRSz8O8HMrMBSJYhB88CICNm7rvIqvtvkU+lUdlog==
X-Received: by 2002:a05:6e02:1e02:b0:2c6:65a7:55fe with SMTP id
 g2-20020a056e021e0200b002c665a755femr6529739ila.269.1646974095002; 
 Thu, 10 Mar 2022 20:48:15 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] dyndbg add exclusive class support
Date: Thu, 10 Mar 2022 21:47:51 -0700
Message-Id: <20220311044756.425777-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg, Jason,

Please consider these for char/misc or linux-next/soon/mumble.

This patchset adds exclusive class support to dyndbg, allowing it to
directly represent drm's debug_category.

It is the dyndbg half of:
https://lore.kernel.org/lkml/20220217034829.64395-1-jim.cromie@gmail.com/

The DRM half of that patchset uses this support to reimplement
drm.debug on dyndbg, and uses its callsite patching to avoid the
runtime checking done by drm_debug_enabled().

Background:

In the past, various extensions to dyndbg/pr_debug have been proposed,
none seemed to gain any consensus.  This list is certainly incomplete.

https://lore.kernel.org/lkml/20200609104604.1594-1-stanimir.varbanov@linaro.org/

pr_levels was discussed around this patchset, in revs 3,4,5
This search helps:
	s:venus: s:dynamic f:stanimir.varbanov@linaro.org

IMO, pr_levels suffers from implied meaning between the levels: 2 > 1.
In contrast, DRM has logically disjoint categories, and is implemented
in an enum (despite its flag/mask values, a micro-optimization).

https://lore.kernel.org/lkml/20210813151734.1236324-1-jim.cromie@gmail.com/

That patchset used pr_debug in DRM, and prepended "drm:kms:" etc to
the format strings so each category was selectable; "format drm:kms:"
in the query.  This worked, but it made the format config-dependent,
and was hard to explain without undue "artifact".


So this patchset adds .class_id field (4-bits) to dynamic-debug
callsites, and 'class N' query/command support to select upon it.
Existing callsites and queries get .class_id=15, so 0-14 are available
for use by the client (DRM wants 0-10).

The DRM patchset then:
. renumbers drm_debug_category to fit into the 4-bit .class_id
  the new enumerations *are* the bit-positions in drm/parameters/debug.
. adapts the category-macro layer to use _CLS macros, mapping categories.
. adds macro layer under the category-macro layer
  which wraps drm_*dbg inside a dyndbg Factory macro
. uses DEFINE_DYNAMIC_DEBUG_CLASSBITS to tie to __drm_debug
  callbacks ref the var, so drm_debug_enabled(cat) just works.

Jim Cromie (5):

dyndbg: fix static_branch manipulation
  fixes a latent bug, before a 2nd "enable" flag exposes it.

dyndbg: add class_id field and query support
  will allow (with that drm patchset):
  #> # turn on DRM_ATOMIC in amdgpu
  #> echo module amdgpu class 4 +p > /proc/dynamic_debug/control
  #> # turn on DRM_CORE in drm
  #> echo module drm class 0 +p > /proc/dynamic_debug/control

dyndbg: add DEFINE_DYNAMIC_DEBUG_CLASSBITS macro
  adds macro & callbacks to support drm.debug bitmap
  #> echo 4 > /sys/module/drm/parameters/debug

dyndbg: drop EXPORTed dynamic_debug_exec_queries
  unused yet, obsoleted by 2,3

dyndbg: show both old and new in change-info
  minor debug improvement


 .../admin-guide/dynamic-debug-howto.rst       |   7 +
 include/linux/dynamic_debug.h                 | 111 ++++++++++---
 lib/dynamic_debug.c                           | 150 ++++++++++++++----
 3 files changed, 213 insertions(+), 55 deletions(-)

-- 
2.35.1

