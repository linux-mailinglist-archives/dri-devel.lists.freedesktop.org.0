Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018924CE9A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017AA6EAA2;
	Fri, 21 Aug 2020 07:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75986E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 07:52:45 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id v11so1367368ybm.22
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 00:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ZTZ7FeRGcuK/Hk+zj5oM9AwC2C+E4zSdizznNm3JGaw=;
 b=qDhQwNj/i9PSLJjNFzjvh270vkvMWiwNw4Xn4zB5msBMj/zonYxNr4zdkzs+kHxEKQ
 hsk4cTsctX3LU0jX3+aNU39vbHGAcgDW/7Kabwd7zA09xokQNLQT+l5OUTB18PY3jtc8
 3u1DD2f4zPraIZQBIOQgu9SC/UA+drjB87PyO+//YzeTsLTNXzTI13pixc0NmJ+t1Sig
 PSJynH6yZ+VT6N3palt7khJAXHuQF+GvVTeSVEFGUaZaKJmXq+GuZh7x882Oye0ACLPL
 isTCg2Gonbg6ZOLFRn+07HTT8f9TCbu/pBmgDuj3uzlMTq+fzWAWdRBL05rAShBbUOLe
 hRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZTZ7FeRGcuK/Hk+zj5oM9AwC2C+E4zSdizznNm3JGaw=;
 b=HQWg8Lb5diVrME0XFly18ADIH66OnwKThT0Lm8+ZqjmOomTFsHq+E3cUP09LgouWlF
 UltVzDrMEcKbdeE+1JM+ka5uBoB8s4HmgOT1nB6F7nmMJV0RpeGr+cqG8mgk9SnPddRn
 sZGiwiLCVugJYMAa/+3gP7goIyaIvLoLO/Cko0I53zPbuWGPr5dhbH+Tf57zNcib8Wtp
 gx2F1Q57rOWIaOZUMRnLdHd3QgyRu5vE6YE2tuzoxoISBQ2BOigTMtqY/WbsoDxSviUP
 lrIeGT3+ZzpVztMQjcAsW+COomXWzNjkDzOE1qmDxlNG11o/2/qoANe37C1D+WnjbJjA
 PfRg==
X-Gm-Message-State: AOAM530YmZ//3+aSLhjV8DzOKi29zIxrPiyfIllbdzCCTZoz6YIJ5AvJ
 FFOHCFZkLhjJwBFAHIPDjZqdnev4o+y6
X-Google-Smtp-Source: ABdhPJzAM44YvcI2eY5BDvZXP1CL91XTwHSk/ficRLHKynUx1ZaTtPmmgHpQyfkf4ayDeiiwEw2CVKu0Zo+Z
X-Received: from furquan.mtv.corp.google.com
 ([2620:15c:202:1:7220:84ff:fe09:13a4])
 (user=furquan job=sendgmr) by 2002:a5b:b45:: with SMTP id
 b5mr3114667ybr.294.1597909964605; 
 Thu, 20 Aug 2020 00:52:44 -0700 (PDT)
Date: Thu, 20 Aug 2020 00:52:41 -0700
In-Reply-To: <20200820052600.3069895-1-furquan@google.com>
Message-Id: <20200820075241.3160534-1-furquan@google.com>
Mime-Version: 1.0
References: <20200820052600.3069895-1-furquan@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2] drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps
 object to 0 in amdgpu_dm_update_backlight_caps
From: Furquan Shaikh <furquan@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Stylon Wang <stylon.wang@amd.com>, deepak.sharma@amd.com,
 Furquan Shaikh <furquan@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, adurbin@google.com,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In `amdgpu_dm_update_backlight_caps()`, there is a local
`amdgpu_dm_backlight_caps` object that is filled in by
`amdgpu_acpi_get_backlight_caps()`. However, this object is
uninitialized before the call and hence the subsequent check for
aux_support can fail since it is not initialized by
`amdgpu_acpi_get_backlight_caps()` as well. This change initializes
this local `amdgpu_dm_backlight_caps` object to 0.

Signed-off-by: Furquan Shaikh <furquan@google.com>
---
v2: Switched to using memset for initialization of object.

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e4b33c67b634..da072998ce48 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2855,6 +2855,8 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm)
 #if defined(CONFIG_ACPI)
 	struct amdgpu_dm_backlight_caps caps;
 
+	memset(&caps, 0, sizeof(caps));
+
 	if (dm->backlight_caps.caps_valid)
 		return;
 
-- 
2.28.0.297.g1956fa8f8d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
