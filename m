Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3028D5648
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABA610E155;
	Thu, 30 May 2024 23:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RlEfhEa1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD04210E155
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:30:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b7b4812f3so1350538e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717111856; x=1717716656; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yy768pJR9cLFIdd6Yx5kMuhYcotmFOIkzIsvZV+Yils=;
 b=RlEfhEa1MGpzmbx4CJyYdETtWRJsDL7hCecj77imHdAPK/r7vLbN4BzbZ4FbRk4/1U
 qjVUi5T7avL0pMH3/RD8MzyFuv/Ho3JfdJmWfLbV4mMVEk8M1tp5PoLQ8x2AvGc6BmqV
 OEJUr00G3NO/sw2mCdxU2vuY9gcL1dpPE9y2KTONCYk2Cli0P4V31b0GG3EiMYLZ3ObS
 GO3NtLz4uKCU459W7gQovnDIfJCqMV52HSVsvMe74aZSiwzYoJc6qbFfsoE2AaHVAIAU
 QFRYQnEiWVaYw4tclLflQlnKGR04MGVxSfs4UOZsy+ycsf8LrsYas8oRHLpnDMcg7tnZ
 0v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717111856; x=1717716656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yy768pJR9cLFIdd6Yx5kMuhYcotmFOIkzIsvZV+Yils=;
 b=jTdl7vQhxt3s6WVu6j3OLnNjhxK93UIyp3b4zDm2IqTzb7Ts9H6y5rcfBxENk5zc/s
 x/dPKvZvdxnAEQatXmrnQWU9BKQJs+RT/awmzCPNz6Jyz4SXzwl/WSvkMscAPMQb1paB
 7Oe8qKQE9E+839NerzIAUpiNnRYBsHYH3oHUmPNbhRKAjVCxQyA4LWD/PjBlfa6b/71h
 WDZXF845KUOZsZOpZy16sSxrLPthUQ7QQHybpRHVKZTQOjh5gSZ4evjV3a9r6Hx27Y4+
 k5aiA4Yl6T4HJuHXHa8i4YRd4RnEUyAiCR2gaSgvKkhFaT7gvZZaoScxZGd2kGraZgHB
 y5eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgPUyqSMuHmTq7vo1JabK4ZP2i2uIPxDiBZQ5qj/0aKOH2M4289FLZhkeEJe5S/03XFoK9GPRkEJrlBBvM2fDlW0pbYMfocjvepDR57Z03
X-Gm-Message-State: AOJu0Yzy0NVbh754x4ZnQaoNSS0JQOndKGqHb6xLw0UPZCmMrTSibVsC
 xwZHy6NHd07XP00mOJJCae/qVJ9+6aaygT+3MlLKo3wvsoxk2mZIg+je8cTSka0=
X-Google-Smtp-Source: AGHT+IGsB/ugPpgy96+NIEx08Z2+CgvenCRumuYN/yJDk0qMmI250mrqJk9/efH0D//O6Mmos4Qqaw==
X-Received: by 2002:a19:5504:0:b0:52b:6a18:5b00 with SMTP id
 2adb3069b0e04-52b8878cc6bmr104632e87.34.1717111855617; 
 Thu, 30 May 2024 16:30:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75fa0sm123961e87.143.2024.05.30.16.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:30:55 -0700 (PDT)
Date: Fri, 31 May 2024 02:30:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>, Chris Healy <cphealy@gmail.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, sam@ravnborg.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, a-bhatia1@ti.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <qiu6rar4ebaxceufmy6rppxetjqi7goajc46c63aadd5o2uwjw@ctsfmqk5fdvb>
References: <20240530092930.434026-1-j-choudhary@ti.com>
 <20240530092930.434026-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530092930.434026-2-j-choudhary@ti.com>
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

On Thu, May 30, 2024 at 02:59:29PM +0530, Jayesh Choudhary wrote:
> Currently, mode_valid hook returns all mode as valid and it is
> defined only in drm_connector_helper_funcs. With the introduction of
> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
> bridge_attach call for cases when the encoder has this flag enabled.
> So move the mode_valid hook to drm_bridge_funcs with proper clock
> checks for maximum and minimum pixel clock supported by the bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Chris, you might be interested in testing this series.

-- 
With best wishes
Dmitry
