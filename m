Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F434174D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7C86E9A1;
	Fri, 19 Mar 2021 08:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC16E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:38 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id k10so8283032ejg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=EqZNiy1vilBKzHtBB/JA2baYUg9hUlPSDynQji8XyUJLzXfdpYS5reLg/igob+jWCI
 LH/esZJEDeH4EU7JJ4uvVte/J9oV/Brhd8d/SdQK2fB/dtY92cwOlIkw3zOQ4916TEWt
 H//uHpkfb2QB6nv+2kOuphTzQFsUs6E+8mT3CSWv9IyWBqDqFx6P0xr7f6Asg/54qiDz
 DigoPJvjffhOCMZQs/+Ra/1xdQUpScFxG99mkGrbeU+815rokcxY368VMQOSVV2r5Yfz
 y0K7Qm27N33CBR2rO3wuuG60yUmB1Qhx7B7SNMEXwoAojnZBg70c9mWfDIT8iyovKtN+
 YW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=bd2Vw9mYKmJOUg3URRTZ1UjM98GgEbLV0LmmbxV5cvFSmMYolPWdpiRGrNue8bw9E9
 tRhlzlu6lKAv0+b230lhkdXByRcIPx6Si/gsvxaUTh9JZJ2gyuUToP3JwbnF4iV17Ur+
 9K5l47YTp/djX6G2Q+ZlO64czazuWkwt6nhx935tvL8YAjuLxpT2cVsZEEuuDF1ym/hz
 cdEEVlJlVIhqBad+w25oZPNLfyhKJ9xmqQC7Gehh4XhKbPLVLw9XBcTkyviBB7K+4Xli
 oPrRPmyBEFz536pk7pfi3KfSVBgXynPjWPoVNQY56KUM3up2TWHztpIxl0+yPdntjqo0
 aXfA==
X-Gm-Message-State: AOAM530Gv4tPMYHXoIe429yss4mGlJ+BGIxG2PtAn2IRirT6FnODXpZ7
 Pl+Bb+/ywjgoM1cpikiBCO2AxA==
X-Google-Smtp-Source: ABdhPJzVPbpEzcLADX3H3VYHMHwRrOKLnf+8GraJSURrb0v6CpwJkCcB1hblNG8Ck8PooHZlonj9PA==
X-Received: by 2002:a17:906:2b46:: with SMTP id
 b6mr2916032ejg.521.1616142276934; 
 Fri, 19 Mar 2021 01:24:36 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/19] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
 non-conformant kernel-doc headers
Date: Fri, 19 Mar 2021 08:24:14 +0000
Message-Id: <20210319082428.3294591-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
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
