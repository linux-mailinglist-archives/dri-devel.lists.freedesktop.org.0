Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFC3955FC
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05BF6E872;
	Mon, 31 May 2021 07:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42396E098
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:21:54 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so9043061otc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI9B1gx0W03n8PLDC9G8zeAEdsEL0CbeKjjZ2M6qgts=;
 b=WrwOcK6P9NUsgVUeMJw8YVISqod/siONeyb4uajOqk3X9B6X/2Eo4IAvfuziK0oG5t
 wIuG0mm6m8xAUP+hyadCAMVry0CwJDdr+U17wNA4X4HZAu6H7Dd+IJgRb7g/xVkMRCvZ
 SyZJlrVsUlLXnZMD7xIiHEF4LTkrE/FJtDj2tuM/EeRR5ZEKUfFfshODFr1+IT3WB/o4
 VuPsnbCJT3UOOKTuwM/OMFA54rHgsCe7avrwpoPVCIxrlM9r+E09vp7SgzG0sUTyKndF
 7faWcAuy9NrKYhl324dRMCAF1P+QYmh7eMJaY8aYhXEaH1Z/09Gsa0tBwAqNnF3Fj2LO
 7KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI9B1gx0W03n8PLDC9G8zeAEdsEL0CbeKjjZ2M6qgts=;
 b=s86VAbN7TT9QerignCJE80NNCZ78jADrZusnUwpH6NO2s9Y8sI8RMTx6TqV0/D86yl
 EfnNGBW9k0B0yaR0ExiqWCZlwN436gSrLEF/2dVltFrITijbUnlfFAR4w+nSvXrjG9uV
 W0WbJrQKd8vmsnbyb11AVSDDqfnDWsqoYBImn24OA6ZBBtouhEXUEZxlrCBSo99HwIUE
 P4QDVwnkIu1NW7XvYysGot19xBkJMdHqkNCJD+ZtYP0NeK2iYmVoggj6YC0rLh0Qquh4
 x9oTj6qmzjYyodk3l2y263ckmcgybAP7e/xvTMy4D3/3t/b2RLTwep7fGlzUWYPBr6u3
 VMxw==
X-Gm-Message-State: AOAM530X7lCbaPEQ5u1QWQxV1otO3kfjY3SgnFG8VxECg7Rti0B+V9oL
 a9l72g1eicWZnObIlntAQSShkDwnW+VZ7g==
X-Google-Smtp-Source: ABdhPJx6Y/weTcJWiJF5P1KkJ2wgg/CpIcbPyoryl6SobX0JB16XKdjfIj0Rl4zPWvFFNtNp9tyxjA==
X-Received: by 2002:a9d:75d2:: with SMTP id c18mr14507164otl.219.1622402513784; 
 Sun, 30 May 2021 12:21:53 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a18sm2418076oiy.24.2021.05.30.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:21:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/4] use DYNAMIC_DEBUG in drm/print
Date: Sun, 30 May 2021 13:21:42 -0600
Message-Id: <20210530192146.393761-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 May 2021 07:23:08 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi everyone,

this patchset reworks the drm.debug controlled debug categories,
and remaps them to use dynamic_debug_exec_queries().

To do this "smoothly", DRM_UT_* is converted from an enum to a
class-prefix string, which is prepended## to the real format string.
This lets us use:

 $> echo module drm\* format ^drm:kms: +p > /proc/dynamic_debug/control

3rd patch fixes a conflict while rebasing to rc3. I kept the fixup
separate for more visibility.

commit c5261e93758a6b36f4292403027af383ec9da129
Author: Lyude Paul <lyude@redhat.com>
Date:   Fri Mar 26 16:37:54 2021 -0400

    drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
    
    Since we're about to move drm_dp_helper.c over to drm_dbg_*(), we'll want
    to make sure that we can also add ratelimited versions of these macros in
    order to retain some of the previous debugging output behavior we had.

I can see I havent been paying attention.
Are plans laid out where I can catch up quickly ?

Separately, but related, I have an RFC patchset on LKML to reduce
DYNAMIC_DEBUG's memory overhead.  Patch 34 hints that rate-limiting
can be done dynamically, on demand, for any prdbg known to
dynamic_debug.

https://lore.kernel.org/lkml/20210529200029.205306-1-jim.cromie@gmail.com/T/#ma5052696fe9171649b93b3e1f482de90314a9b61

Jim Cromie (4):
  drm: fixup comment spelling
  drm: RFC add choice to use dynamic debug in drm-debug
  drm: fixup DRM_DEBUG_KMS_RATELIMITED merge punt
  i915: map gvt pr_debug categories to bits in parameters/debug_gvt

 drivers/gpu/drm/Kconfig            |  13 ++++
 drivers/gpu/drm/drm_print.c        |  75 ++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/Makefile  |   4 +
 drivers/gpu/drm/i915/i915_params.c |  76 +++++++++++++++++++
 include/drm/drm_print.h            | 116 ++++++++++++++++++++---------
 5 files changed, 243 insertions(+), 41 deletions(-)

-- 
2.31.1

