Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A378C3428C0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 23:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBE06EADF;
	Fri, 19 Mar 2021 22:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519E6EADF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 22:39:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7402231pjh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nUHSQDuv2nJRjl++0dYVykG+R6J43ojPD/DL6BK+Q=;
 b=CHGLBFyy7SkKsZBjNsxrP1ViIZYD1uCnhKrQNvCweYZrafdte9QLhKHBHK9Nfe3t7l
 CZhhhsWTvok/0zXY0tOfyX6/9js6DoESiZZJh4eIXPtHRf9qnT++gPYJYeFMGTv4iZp9
 ETWRETvZActaH8ogRbQIEB6FS1WWDk9jCSbXsPwNcT3SrkdxdUsmB6NYwUtPnL4VCV4M
 Dt4B5QPRLjL4zoj1FvYNz6vC9ARzBTQ2Mcxfc8upYmtE82pqD720ChuNJV5irAR2pUpm
 fZPTbCkd13/lCVfX4WUe76xVRPGdNlwt1cPS9igond8AJqbA/nZxTeM0Zbr8epLhhub+
 H5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4nUHSQDuv2nJRjl++0dYVykG+R6J43ojPD/DL6BK+Q=;
 b=ZyNf9bVo3cBWvrLaAy37HfXg1hB42vmv/XExKFVXqkemf1eCMmtzwIokLacuTs+sYq
 wSfFk2/ji0ovkFHZ+h9WD64R9slbWCbIN5UGc2YvS05asZ0wpp+nmX5kuKsikB5uIH0j
 vkY6Gbjso0rZ4OS81iGM5MvmAZEISCsX+Mk8CIXjWPMkrFgu7pMiOtPJ/8JBVEYUPVbS
 5JCeLsUN4qS8iVB+yYR2Ri2yc8hROyg+/s+g5hPDS5C7CGEze32+zt+TBHYBOBNUW8WI
 sCkRM17c9rEBn/+im4qLbVVJJXRJlkqmdaMheIcmJfia1BD3rSJWKqvl+tHb0MViIUFu
 SlOg==
X-Gm-Message-State: AOAM530AtJ1ccOo8rrqfGDAr35yo08jYQDk7UAH4+ctvu5lRlLPVhROD
 +YQ7ToRSFQLW3t3actpOWmK9ZJXC41hobA==
X-Google-Smtp-Source: ABdhPJwnQdRKd8jvQa2+zaX2oIUapI4sEkTdPzBRem7XT5mRyn7KzUaAaGNd6QAy1DTW++xWemKZAA==
X-Received: by 2002:a17:902:aa0a:b029:e4:c090:ad76 with SMTP id
 be10-20020a170902aa0ab02900e4c090ad76mr16676589plb.2.1616193540928; 
 Fri, 19 Mar 2021 15:39:00 -0700 (PDT)
Received: from omlet.com ([134.134.137.77])
 by smtp.gmail.com with ESMTPSA id a20sm6809206pfl.97.2021.03.19.15.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 15:39:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915: uAPI clean-ups part 2
Date: Fri, 19 Mar 2021 17:38:52 -0500
Message-Id: <20210319223856.2983244-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series is the second installment of my quest to clean up the
i915 uAPI.  The first three patches delete interfaces which have only ever
been used by i-g-t and never any real userspace.  In the case of NO_ZEROMAP,
it's unclear exactly how this happened.  There were userspace patches for
it back in the day, they just never landed.  For the others, there was
never any userspace beyond i-g-t and they never should have landed in the
first place.

The last patch moves the SINGLE_TIMELINE API to an emulation using syncobj
to help simplify some of our locking infrastructure.

Test-with: 20210319223233.2982842-1-jason@jlekstrand.net

Jason Ekstrand (4):
  drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
  drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
  drm/i915: Drop the CONTEXT_CLONE API
  drm/i915: Implement SINGLE_TIMELINE with a syncobj

 drivers/gpu/drm/i915/Makefile                 |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 372 ++----------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   9 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  23 +-
 drivers/gpu/drm/i915/gt/intel_context_param.c |  63 ---
 drivers/gpu/drm/i915/gt/intel_context_param.h |  14 -
 include/uapi/drm/i915_drm.h                   |  40 +-
 7 files changed, 55 insertions(+), 467 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.h

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
