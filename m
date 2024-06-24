Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D41915091
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7B10E48B;
	Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q8sEKT5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54C10E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdd03d6aaso2274747e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240435; x=1719845235; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
 b=q8sEKT5U/CMqlkxSdbj3aEOok4ZIDQgjQm82+63Iitk13PsWCCJcZjB2vTH1u2lP7R
 a0rFiQVt4VI1seJVs87egIhPYWEFLrvkMchth2WUxCqC+SzQn4zu5bK7oknVDCbgHfZs
 KtAz7YpJxPFQeF5NRTyS/vMo1E66IZcT8ly8TY2Ru2AixYAbCJofM19c6xk+kRHxq/Y9
 8ryn0mkLzjs3TfpYj3Zg2tBHKHy3HuH+7YKb886nOV/7vTOSKIjrIOxOt7z7EWuaMwvJ
 G4G8FA4QIawwWgndaBaxBGFtvV7xoS8KZ7WnzoflSh7yIIqBNctehgumtSi1qCXgwyO5
 FR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240435; x=1719845235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
 b=ZXWUWMzpEpRCKhGmuGKmqrOwLplRZI9bk47zDrTchwzmpmGdGntxHYup3RxHPdZ7BT
 hVQlCURPYroWMEfsxbUyhqJ4N0L2wv4FE4WLb9JfKW94S4ufXH/8neH5jLZmHScN2tK3
 kd3fxzEj8bPbQ3WBn2fQr9qeakYSPeDV8XBCHo9PVliZByNpAumMad0WLwPh/YnxdZrd
 OTif02upffVzhIO4YV6GYXtwnIDwAFiS3ypbGuLGzHUblIHGoTjtzLd/MPRBhc56FT9K
 I2rqYOFHIetk63bWsLy9tKYdrFpVnhdCWprj8cDCZ1ghzKKtlyJnEzBhdlIvepLQSYvm
 uaUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOIjKTw5Ov+o9IUwugWYHKILpc0Gv1oxGIQdLTtUnh77I81kVz7igvwq8vDSoa8MGJOUMcgXzIaU0PXB40V6RaVwoaXzaptO59t8tXMKbo
X-Gm-Message-State: AOJu0YzVAyHx3EL1S0wXQ9lhoxaTP3qEGWzjefBeJwhhmCYsxv6673Nw
 owUZ++jpAG7snJHWd+gKbEuShuMV4iIj1LRzbmeArFcWU+qUlcLhcOBsfCcEXPQ=
X-Google-Smtp-Source: AGHT+IGR6c9ZmdfMXtWz3IjqPg4XkHqNQRscHzayqBpLuf0iLJj+JC5OfMgRfjVGlG5LupzTQ9MqUA==
X-Received: by 2002:a05:6512:118e:b0:52c:ab83:d783 with SMTP id
 2adb3069b0e04-52ce063d63emr3920439e87.6.1719240434879; 
 Mon, 24 Jun 2024 07:47:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:07 +0300
Subject: [PATCH v4 01/16] drm/msm/dpu: cleanup FB if
 dpu_format_populate_layout fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-1-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CRnQPNrk6tMn0RWlkSywOwQLtsZdvuYbpLeYPQfOvOQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbu+jggU2r5wb55W+ZbzfufMt2fcPzor3sSw
 rUcv0Se2GiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7gAKCRCLPIo+Aiko
 1aqlB/9g7BBBZ26cS0eSgzqsLSSvrm6ZAuiCyVP1eUlsUiDQA5gCvnvZGreQjEHhTAjrEAQGkc8
 FtKaWDgY7btLUi+DYxZ3zJiPOMy/Tqt9NaRV4HF77sS2baOrKIW41AvZk1dR7rYGACfbP3hqnlR
 diczBoF49Hp8YVnNuaQUs2TEFv+3SLVK6SjarADQiA0ZaLksy+0sJVIPviT8rK9l2hs3s/Pp0yE
 SIcj8k9POpjtz5+pSJQVF5uA4z0pjBoqLuhziHsxvOWmbXHc2oVXEe1u+nvB0Vb9vuPGHIH9N93
 kRnUG9P6t6m5amGJvwOuwK2jW9XDFSKNlXZPEHbIgv4PsJ91
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the dpu_format_populate_layout() fails, then FB is prepared, but not
cleaned up. This ends up leaking the pin_count on the GEM object and
causes a splat during DRM file closure:

msm_obj->pin_count
WARNING: CPU: 2 PID: 569 at drivers/gpu/drm/msm/msm_gem.c:121 update_lru_locked+0xc4/0xcc
[...]
Call trace:
 update_lru_locked+0xc4/0xcc
 put_pages+0xac/0x100
 msm_gem_free_object+0x138/0x180
 drm_gem_object_free+0x1c/0x30
 drm_gem_object_handle_put_unlocked+0x108/0x10c
 drm_gem_object_release_handle+0x58/0x70
 idr_for_each+0x68/0xec
 drm_gem_release+0x28/0x40
 drm_file_free+0x174/0x234
 drm_release+0xb0/0x160
 __fput+0xc0/0x2c8
 __fput_sync+0x50/0x5c
 __arm64_sys_close+0x38/0x7c
 invoke_syscall+0x48/0x118
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x4c/0x120
 el0t_64_sync_handler+0x100/0x12c
 el0t_64_sync+0x190/0x194
irq event stamp: 129818
hardirqs last  enabled at (129817): [<ffffa5f6d953fcc0>] console_unlock+0x118/0x124
hardirqs last disabled at (129818): [<ffffa5f6da7dcf04>] el1_dbg+0x24/0x8c
softirqs last  enabled at (129808): [<ffffa5f6d94afc18>] handle_softirqs+0x4c8/0x4e8
softirqs last disabled at (129785): [<ffffa5f6d94105e4>] __do_softirq+0x14/0x20

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..eabc4813c649 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -680,6 +680,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 			new_state->fb, &layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
 		return ret;
 	}
 

-- 
2.39.2

