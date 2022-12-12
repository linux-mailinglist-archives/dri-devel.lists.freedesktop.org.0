Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A164A60C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 18:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFB610E23A;
	Mon, 12 Dec 2022 17:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BFD10E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 17:38:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id fc4so29906100ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcdNmWKMi71LBRaud9q/o/bZWLEKyYYBvqlc/diEFNs=;
 b=CFlU48dw67kqOQTeufUnYzKtSTB0H74QSn0TYjFPvHQVl4YJBsmHkGRQDAI6zNDv3I
 RkR1Si17/0r1sQHqTjAuYm9dOh0FkzO7LQE5tXeobUm4RhK0JdIr3Yh+2BpYVZnnrU9Q
 XIbzDz137Uy8GfxHi1dsX1QHnAVLVkzc/W4qI7lxezAjS18kTGGev5sKS5vwMn/ot6nE
 8py8DVjAIigXtc8KfPwB/CP19pK9tsMiBglXwRHD3C3fxipXt4dqy19OFC7swfO2wR0Z
 Rv/zgggDDoBPnfHrKL4a+xVsVh1QqERro4wl5Bq420Nthk/gEFjFITDQPTUnXJ4qoOAZ
 PXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YcdNmWKMi71LBRaud9q/o/bZWLEKyYYBvqlc/diEFNs=;
 b=eDBFNuCvMYf1Wva89MXX9FeqG6OHTnHo5S2sQfwIDcv1J4PMboCds5V3qatbAV0z4k
 FlUA1MQEaRhB6c2oiETpECJOpRGLbFGuxMg3UPtwdZGyUpNLrIgxpijevW7nDBo0fGm6
 4AR1YudwaetjTMYr2GvhQoq9XwVgXOAPPzBYYWkWbH/TzPGqphYqz6e4H50Avtb+dngT
 DobumgC3/NpnPtSb2v+m3VPkymc/JzquD8/7/o/qfPT2cqfkJ5wVTk4i29FVtltUxG6I
 nEO5URzaNXr1lbxK+qrBGRY/LI7BFrBqE+hAroPUMaeaywdvVBDF1uWwLxzv5kxWjEMu
 NxwA==
X-Gm-Message-State: ANoB5pl39qwTCynJ7b262ZzIteqK1dwK9i9d9RcAGt723gqguF+xZZNw
 mlDXI97S5Qi6Fa0hvqtvUdO1Kw==
X-Google-Smtp-Source: AA0mqf7eAYOzNNtDyIH9U+8RhtYLWZLE8SG1Uk7kpSZvPrlPGb103MUPjA97hA1AnXbiT+fG+kvpZw==
X-Received: by 2002:a17:906:7243:b0:78d:f455:b609 with SMTP id
 n3-20020a170906724300b0078df455b609mr13453972ejk.73.1670866712662; 
 Mon, 12 Dec 2022 09:38:32 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:ff97:7d8d:1f2e:ffaa])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05640217ca00b0045c47b2a800sm4031103edy.67.2022.12.12.09.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:38:31 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: keep last configure timing
Date: Mon, 12 Dec 2022 18:38:26 +0100
Message-Id: <167086668975.3073151.13627360175077600685.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209030418.713935-1-xji@analogixsemi.com>
References: <20221209030418.713935-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-kernel@vger.kernel.org, bliang@analogixsemi.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Dec 2022 11:04:18 +0800, Xin Ji wrote:
> Sometimes kernel may resume back quickly after suspend,
> and DRM not call .mode_set() to re-config
> display timing before calling .atomic_enable(), bridge
> driver with this patch to keep last configure timing.
> 
> 

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[1/1] drm/bridge: anx7625: keep last configure timing
      commit: 38c8389011e06f16b365799f2cd958536befc2e9



rob

