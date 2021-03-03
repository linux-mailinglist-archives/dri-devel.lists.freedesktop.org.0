Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648932B81E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C616E8DD;
	Wed,  3 Mar 2021 13:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD8F6E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u16so5731919wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=N3q181yJisryPIByDaizfjLwDLbgVp2sSUSlV1VTGiJIerqGb19KH2SBPvAKguZifR
 I/iBsFNFweL2WQUEyLnk4hzJijHleRbyOOxWWFxboGtV6plw4vkLLVhRVDF0qymFFDqh
 w8gomQnPFF0fUFn87WrNRwqG9HWCghz9iplUle3MXnVjy2mHL6Y3m3Ae4i+B2jY23gZp
 zpMdZFt4R3rikBkgzyz/bOQklHbTOzqFE8FKqLCfx6LT7FdVi9UQS0PBAAmWEXMQr+cv
 hdTuBN3aQssflEmx5QR+Wmnna7UAkSRvdCRqviYtZRMjwHvmJrflxvVf/+lNtZxIyDrY
 ZlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=Xl/5yKkQqI5giAekRYsxrGGrmDsCLGGlLq+1OO7aNIAUU814/ZuCf85pyTIxwUw9xP
 U/PKrmlSxWWC6KMW3ZVFCIcSW3EFVxvpWJVTziMzJMIQ1Qt/pf3VAd773/W+/4uKVjfn
 Au5C0tQqgkjY3+0sCWG0PVDabreM7o7ojnA4tOSQ4J5CBa3PMquBWH4aX13Gi5L/uDHQ
 +5heehBD8aYPeUAkZ5lFESK8bPzsNxX/kc9WoJ8vL10ZpQtfHiQcxmZZheI6/LW43R+8
 ToND33NgDyvJbVvheSXuvL1gSmr05cRZ7WViXbOEeAOPqYHaedJB9F1AGH6jVhrwoTm4
 hrSA==
X-Gm-Message-State: AOAM530P7/WepgOowk6EWwDIflXhvfk8drw8vgi3r81dy8A5z/Fcg7Xh
 SPCvChcdOfJpdsg4SFPw6qcakQ==
X-Google-Smtp-Source: ABdhPJwi4JvCkBousamcRU/iub7Snug2xhsNyhh47wRAiEEVp0mD51d0zPloNpxfNF3p6PXkuyD4wg==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr22817085wrp.106.1614779015699; 
 Wed, 03 Mar 2021 05:43:35 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/53] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
 non-conformant kernel-doc headers
Date: Wed,  3 Mar 2021 13:42:32 +0000
Message-Id: <20210303134319.3160762-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
index 8c2faa9645111..ccac88da88648 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
@@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
 	/* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
 };
 
-/**
+/*
  * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
  */
 static inline int
@@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
 	return mv;
 }
 
-/**
+/*
  * cvb_t_mv =
  * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
  * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
