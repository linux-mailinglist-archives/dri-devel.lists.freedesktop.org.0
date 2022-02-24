Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00844C3597
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B361310E8A9;
	Thu, 24 Feb 2022 19:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8336E10E8A9;
 Thu, 24 Feb 2022 19:16:41 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j2so4345718oie.7;
 Thu, 24 Feb 2022 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvWS3oa5I3x2kAQ3Snct7Bstqa7gnrjNdhiuEziq/dU=;
 b=JkG9j4xtSW7YFux2DfQ1IWJkCHhW6PI9tpZ3Eolo5e3HTQjgG7/eJewkdn9n4nFLcJ
 LMv6iYPulUryfWvUfTDyp6uGHOFOvEWfPfY8a302Mstq7k4TVNT2OE5E3WybkWTZNDAM
 rPJVC5+IaLwafCUep7U8BUKAP/efw5JhRnbrMY0aD7jDXwkv4SBHfPdCaGVw+IkswTwt
 bUYNXfueXk0AlOKRAp4li5srTypoWsgWi+EjGN0erU6UrF7oN22gLb7B/7b6bd4flwGr
 +txPSk2EtRJjsDIMhBaZgBSmg2K/zmCNP3NEKZYfgV3ZP0xn8UGrIt6D9kCpUTU2eGGa
 rmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvWS3oa5I3x2kAQ3Snct7Bstqa7gnrjNdhiuEziq/dU=;
 b=JHEaCY/W4633rw08W9jtvkGTeusP0Xfwa6WY+2UxOBhw2U1R5MvBkoGHRy0To7YQZT
 8ucO6Wgy+6zqql63cVB0GWyJ2cu92dGY1KwdXv7NunAtKzh673NgSmmsQS4PFocZZbFJ
 xdxirn2QdgI0MjU/MhVXv8Suk4bXbN5FTVOREfg1u6ZYHWsghJppJSBf3OsEvTS88lt1
 7KyFyJN2htbITTJ5yuvc1pFsdUctSz8hk0x15U9ewV0yZqFheE+5NXn1dhFQE31eGHNG
 gpsWih8aWYU54ltbam5Oc2mMRoLIO+NEQEVBqA7T9w4ll5bCWMugFo4lnhqUWYy6xsks
 nkIg==
X-Gm-Message-State: AOAM531W+3SUX/P+9BhLTfqobBhC7MWmCMwO2Yit99San40Jvu4jht5L
 KPJdYX3iady5u9D6INWC4OM=
X-Google-Smtp-Source: ABdhPJwm/qYulK2RcECTOgOP4yxZGphxfccVIGc7Dihv+vNvytMvIjB30p9z1/iUQFqG7fhxa7wRhA==
X-Received: by 2002:aca:643:0:b0:2d3:fce2:d82e with SMTP id
 64-20020aca0643000000b002d3fce2d82emr7942829oig.209.1645730200760; 
 Thu, 24 Feb 2022 11:16:40 -0800 (PST)
Received: from localhost.localdomain (189-47-54-110.dsl.telesp.net.br.
 [189.47.54.110]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830110300b005af14392276sm79509otq.62.2022.02.24.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:40 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/4] drm/amd/display: Use NULL instead of 0
Date: Thu, 24 Feb 2022 16:15:50 -0300
Message-Id: <20220224191551.69103-4-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224191551.69103-1-magalilemes00@gmail.com>
References: <20220224191551.69103-1-magalilemes00@gmail.com>
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 maira.canal@usp.br, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Silence the following sparse warnings:

../drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:865:16:
sparse: warning: Using plain integer as NULL pointer

../drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:1588:84:
sparse: warning: Using plain integer as NULL pointer

../drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2725:84:
sparse: warning: Using plain integer as NULL pointer

../drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1919:16:
sparse: warning: Using plain integer as NULL pointer

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 +-
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c     | 4 +---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4367a6e0c224..cc8e60ec35c6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1924,7 +1924,7 @@ static struct audio *find_first_free_audio(
 			return pool->audios[i];
 		}
 	}
-	return 0;
+	return NULL;
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index ace04e2ed34e..8378b80e8517 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1585,7 +1585,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 			hws->funcs.enable_stream_timing(pipe_ctx, context, dc);
 	}
 
-	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != 0;
+	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != NULL;
 
 	pipe_ctx->stream->link->psr_settings.psr_feature_enabled = false;
 
@@ -2722,7 +2722,7 @@ static void dce110_program_front_end_for_pipe(
 
 	pipe_ctx->plane_res.xfm->funcs->transform_set_gamut_remap(pipe_ctx->plane_res.xfm, &adjust);
 
-	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != 0;
+	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->bottom_pipe != NULL;
 
 	program_scaler(dc, pipe_ctx);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
index ee55cda854bf..8104c0c67f78 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
@@ -858,11 +858,9 @@ static struct clock_source *find_matching_pll(
 		return pool->clock_sources[DCE112_CLK_SRC_PLL4];
 	case TRANSMITTER_UNIPHY_F:
 		return pool->clock_sources[DCE112_CLK_SRC_PLL5];
-	default:
-		return NULL;
 	}
 
-	return 0;
+	return NULL;
 }
 
 static enum dc_status build_mapped_resource(
-- 
2.25.1

