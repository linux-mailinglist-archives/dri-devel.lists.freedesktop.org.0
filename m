Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE12F8384
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F422F6E4B1;
	Fri, 15 Jan 2021 18:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75B26E499
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k10so8213238wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hkjVIWYW/KwOeSMeepZX/DgNoniQl+ISNQgSsOehQ7w=;
 b=e8cdNWXBmpQJjHdYaGaiiOV72MbqMOAfosJeSNF2+rOWE8iWHIL8KpTY/GJYgidnKE
 jj7e8KOn3o+IrhJJErokkJ6Nh7YalhwnOrzgXCHFsVgT7ZvATMqt5GiH/eQqypt57fof
 bHVB12h2oBpCsG8i6tABHi6sPliAU29Q5rjklZHnZYgGvYrdAT5kIJA/vjOp86Tq8GMo
 0PLTSpVqJsDh3evacDad2VliCH+v9s2Qwy6smrPGG46xrBI1yWNnhtVFBfjDa++xLgcA
 F5X7jbVQWJMHPG9tx8gotkTh8xa8ikP9QThNviQpccrExUvz+tq/kf+AYixxBEzTfBBv
 6vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkjVIWYW/KwOeSMeepZX/DgNoniQl+ISNQgSsOehQ7w=;
 b=L5VIHC30B1VotV3rsE1YMJWG1RIPzhZm1fwhgtThLbxGcoNwurqcn4rxdn5L2vq1Ei
 wxIXfM2Y18S0ywzebtWM06fH2kqdQ+NSniAcQdj4LLazb6SeEjuT7dSFkR4eQR8VoNit
 W2hOy20BSfvWsEbGvVtbfw5as6y8sXrU+e6/YxIU1fNlob9Zy27GHnr26IwB5UvqV9yh
 yZBD621XET6VV+Jdqlbf5cqZYZmP4jsKp/9pmiVPbVkMVC8MMobC5zl+Gwll/q4HtIUD
 iUEf3O399BW+GWTHCYAbuTiZzkKyAzo7SRPqeyhpvnlVOYOrxjsLlJSzBgEbAE1612od
 oWsA==
X-Gm-Message-State: AOAM532nkXoVPi/IPQAepF2rYDlielx6tuhd6i6wmYc3T4mx1y+WnTVj
 oygAc2Iqau5TA04t/beEqPc77Q==
X-Google-Smtp-Source: ABdhPJxFzNsNFSsSnvoi1hcE7mQAkrSmJha8bR1Hw+CmHAFQ6ayTeWQ9uEK39Q3r/nueb1EHW6SMwA==
X-Received: by 2002:a1c:df85:: with SMTP id
 w127mr10178071wmg.166.1610734435308; 
 Fri, 15 Jan 2021 10:13:55 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/gma500/psb_intel_display: Demote kernel-doc
 formatting abuse
Date: Fri, 15 Jan 2021 18:12:57 +0000
Message-Id: <20210115181313.3431493-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/psb_intel_display.c:79: warning: Function parameter or member 'dev' not described in 'psb_intel_panel_fitter_pipe'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/psb_intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 531c5485be172..9c3cb1b80bbdb 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -71,7 +71,7 @@ static void psb_intel_clock(int refclk, struct gma_clock_t *clock)
 	clock->dot = clock->vco / clock->p;
 }
 
-/**
+/*
  * Return the pipe currently connected to the panel fitter,
  * or -1 if the panel fitter is not present or not in use
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
