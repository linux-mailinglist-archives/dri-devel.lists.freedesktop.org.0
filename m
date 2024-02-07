Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237384C7EB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CE01131BE;
	Wed,  7 Feb 2024 09:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PXv1HeZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F021131C1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:51:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so58310566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707299464; x=1707904264; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOZ1gmjHdXVne2CtZC4WeZa3sHOyHndgFhlCtylBA28=;
 b=PXv1HeZ2m2AinuhzLaJs608rGZ0pb13Y/i5uN9npciFRXczBJLesJPo6EoA+A07105
 +RGY0kkPKVkySyuKBAJ6fybOiKGGOQpbPAFbk64fmF0v+JUqPIkuL7IqkeucvmQwoy6i
 /8SogDx7JSwSPEorxcSYzCqoSWJtUa0MG0ExwNDQmIjXZ+owxxwclbhtfNi2Ki1pvV4Z
 8pJsMqEATZ0ZOT+hhPIanDUBGcOaoLPvE899o+mAjfJHv04RYfylk5MQscETUWziwjso
 Ck4397FDn0ULV7e+QzKDb1VqfhaPhaZjqjQWeluaP2Rzavmh8VjRgSMgXDKdOJ6gznvI
 Sq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707299464; x=1707904264;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOZ1gmjHdXVne2CtZC4WeZa3sHOyHndgFhlCtylBA28=;
 b=RUNyJyvwAjaYTWqksN0Pjy3llDuPDJ5ggGin08tIP0kBFjeGn7NkNH9pj6YMv+7emR
 mvhftugd3Zbkwv8HHuT2SW8gR93uE3EL3dPFprvT7ZpOqbJ8TcTYV+8ePQsMih0jpWKv
 WQY+XNwG4JTbe+Gh+lTMzmDGUBr1H7cej8rPMLcn7G1qqFisNCGCNvhb9aQ9bU160Ug8
 BtWawCxy6ZLf+BRuPL1FTepskNNzp9OZSEM9+9HVsMtT34EJA0WS9mX02F0lOuuXRj+m
 jnlo8DUDZDgUY1m5kuauGTSacDYzhHVuL3XSGrKxJr92gRYqX8Ml6dQQHO5cDx/aSxZg
 19IQ==
X-Gm-Message-State: AOJu0YwXnhmeTIow/dsbSKV/enhRsyVmd/P630HT2a4nlHtnmSJPMGY2
 CwA9VqJpqh/bwEF60WE2y1fgYWBw9VIWipZvLk1f1bk8v4RDYymeSVfJXtAAd2eB/McK4XQ/sDt
 8
X-Google-Smtp-Source: AGHT+IGHXFgMGaqQ1kfmTgdQ+FMII13jYuuHsqy/Fi/0138icgU2vTfoCsKatkjXKlSXHmbEQ7PHiA==
X-Received: by 2002:a17:906:1f4c:b0:a36:3bab:98c0 with SMTP id
 d12-20020a1709061f4c00b00a363bab98c0mr4215178ejk.34.1707299464485; 
 Wed, 07 Feb 2024 01:51:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVRbWKZvBG3myVOsESL1EjXGEWQVYgZW1Ytpt8PR7NIRPqSKVsOgfumk6ph+hFxKKrb/0j0Rz8hrQeHDvGnWsZ5Sr1t2/fHaXg=
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 a20-20020a1709066d5400b00a38346432a4sm554321ejt.113.2024.02.07.01.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:51:03 -0800 (PST)
Date: Wed, 7 Feb 2024 12:51:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: l.stach@pengutronix.de
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/bridge: imx: add driver for HDMI TX Parallel Video
 Interface
Message-ID: <71ff320f-2735-442e-909f-c0739017392e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Lucas Stach,

This is a semi-automatic email about new static checker warnings.

    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:81 imx8mp_hdmi_pvi_bridge_enable()
    warn: variable dereferenced before check 'bridge_state' (see line 54)

drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
    53	{
    54		struct drm_atomic_state *state = bridge_state->base.state;
                                                 ^^^^^^^^^^^^^^
bridge_state is dereferenced here.

    55		struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
    56		struct drm_connector_state *conn_state;
    57		const struct drm_display_mode *mode;
    58		struct drm_crtc_state *crtc_state;
    59		struct drm_connector *connector;
    60		u32 bus_flags, val;
    61	
    62		connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
    63		conn_state = drm_atomic_get_new_connector_state(state, connector);
    64		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
    65	
    66		if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
    67			return;
    68	
    69		mode = &crtc_state->adjusted_mode;
    70	
    71		val = FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI_CTRL_EN;
    72	
    73		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
    74			val |= PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
    75	
    76		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
    77			val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
    78	
    79		if (pvi->next_bridge->timings)
    80			bus_flags = pvi->next_bridge->timings->input_bus_flags;
    81		else if (bridge_state)
                         ^^^^^^^^^^^^
This check for NULL is too late.  Hopefully it can it be removed?

    82			bus_flags = bridge_state->input_bus_cfg.flags;
    83	

regards,
dan carpenter
