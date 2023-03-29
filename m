Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773E6CF1AD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 20:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E5F10EBE7;
	Wed, 29 Mar 2023 18:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007CD10EBE7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 18:05:44 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-17aeb49429eso17086338fac.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 11:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1680113144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6gvT2+hYG9YTsl59VNP7YaGR4GU2t1ElrBSXIbGw5O0=;
 b=kum9hvQcJhQxvpZnLYfOsayFZbt/VJU/E8QmI/FIu3qMvXugcvzTrzukVbwWYZru4/
 C+0mvS9A67oTlla//Huq7cuFre670IMG6AFC2RtylU9iDiTK6WLRYLMekcoVvginbNWc
 PHjukN1WGzYslWrF2Q168ZlsNpt42XRqpaBvxEZQRi3q4YuQu/HeFyCivAgpw9ROsT+t
 zVxuBem744WeDhCdq598jerLE4uVCRltzfF5QNfoVbdc86ewcvrebF9Dffju+Lm+3uo9
 XjVTfXTOSFSc0Q0HrgqTfZbR2rCCNvvRrCbHBz6e3OCMj+GtCo9qf8OUVa103E/i/vwe
 3mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680113144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6gvT2+hYG9YTsl59VNP7YaGR4GU2t1ElrBSXIbGw5O0=;
 b=6RwTwHmCuZ9FUsNmgVtIEcnBHfCJfKWyNbwxhKPF6r/WKpla/Zm7oDImK+vMfOzyo1
 5Rjh3vY+Iq1rPYcVrT6j0hu+dQHNB9YTnJbkRHpWnWWlwm/VKwlqMGQguKsJnkh4oY/O
 9tzII7nsZdx9OsT3lvC0aEl7jAscpxFzxiCIp9jU9wLUKd9cJONW1N38o9kiLYvzWwLP
 ZObR4jDvj47OLfctZFFwpaZYiveBqQik67AwHUnstdHW6Hdo+SLGr9rRrFZAn1LdEv7m
 i6US+Le5zebKVe4RI73cS9VsJFucPjnyb275kijUVxb6h6cVYmNvmtyD49ovsgMG3YpK
 C/Fg==
X-Gm-Message-State: AAQBX9d77YWJ02G/Y8vQxNr0Oj66/BY+J1tGnCOApQJHsIgK/yzrGXI9
 IX01ca+4JH/wQx6Ep/Qa5BFT8Q==
X-Google-Smtp-Source: AKy350YNgr/qkdBS4RnMoR+3Rtoz5LaA3HHitm3EVEE3vqnDKuJ6lb1ITT2IwvnEMsF0rJG2pjwNwQ==
X-Received: by 2002:a05:6870:9592:b0:17c:ae2:85af with SMTP id
 k18-20020a056870959200b0017c0ae285afmr12600042oao.34.1680113143872; 
 Wed, 29 Mar 2023 11:05:43 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 yo7-20020a05687c018700b001777244e3f9sm12098767oab.8.2023.03.29.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 11:05:43 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/amd/display: Remove a unused variable and mark a
 function as static
Date: Wed, 29 Mar 2023 15:05:32 -0300
Message-Id: <20230329180534.99151-1-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Deepak R Varma <drv@mailo.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Caio Novais <caionovais@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset removes one unused variable and mark a function as static.

Caio Novais (2):
  drm/amd/display: Remove unused variable 'scl_enable'
  drm/amd/display: Mark function
    'optc3_wait_drr_doublebuffer_pending_clear' as static

 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c               | 2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.40.0

