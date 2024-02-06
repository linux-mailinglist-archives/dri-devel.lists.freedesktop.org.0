Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78284B773
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E14D10EDA8;
	Tue,  6 Feb 2024 14:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iNK0it2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924F7112C2C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:07:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40fcc74a0a0so6647605e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707228470; x=1707833270; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1gqKbrdMKClB14wVNpQ5OKPuBM61QPkInnTCOhZv5o=;
 b=iNK0it2gWy3NNNnUdMQPySbgr9F+rWEqxqDDzWVKtv1CmZWjg5CMQhjL03Bb62qw0w
 qhvl/wElzGXO1mKJpCUfqGDfU3l3371C58jUH/9eQQNWZ/sCz177r0Vbcm9eumFqYUu4
 735jmFeLU/SkcjT/ICF3p6RHBAbROlnvY11uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707228470; x=1707833270;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1gqKbrdMKClB14wVNpQ5OKPuBM61QPkInnTCOhZv5o=;
 b=QJJFAqp/IR/C6hnqgVxxEdAZX9TXDwLys4wahQHhg6v6cYCye/hheCFgH0f92cgHEJ
 yea1RHmtjBlIBPVLOuLxsDkzLWeOXThgO6YXLAxaAK30hLhBWe1Woz8//mg+PXQc8YbK
 GQrIdg3NVa0APQ00e0LchSk7jIDmSmowCY5ctaX4NcAC0FVPiQD7722OYPdxF1LxKCr1
 xEO7eRZmRuZ9btJ2vlNtxYqJpUCsApKFVYxcYj7Fln3T21C98pGWaDWUvmbnlSjaaU5M
 DMETQlOF3r/B0wnIEhwR34ZMAt/5QjkUVE3s5ppgXW5mJk7zN0pYsW+GIPsDUU9pVX/L
 nTOA==
X-Gm-Message-State: AOJu0YxzyxobCrZcJUE28s2GNCzXD8LPrIM8RsPWHAuA20s9OFQlFDeN
 Xuic20v5O4S93+MgWMMF6PcMFOI/1oOt29DLI0BocKDkx0W2g3xBiavDJ9IhxpU=
X-Google-Smtp-Source: AGHT+IGR5gmK7GC8W8owBNRVlDTBYHa1luXfBu78BnnpSpxj/e6u63mzSwNdt7oU1vbFwIfaoQCkTA==
X-Received: by 2002:a05:600c:4f54:b0:40f:c996:29ff with SMTP id
 m20-20020a05600c4f5400b0040fc99629ffmr2198868wmq.4.1707228470234; 
 Tue, 06 Feb 2024 06:07:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUbYshYJsVAEPk8DPV1AW0TbvMg76IMKE50qV4agoiOMS1+0aRHlAIjbVqBrtVDxZ3Z+S+X0Ot8wetq7i/y0fauGz64b8xkI58Q6yf2gpN1rHYL8XlKwv1O7GZ5c4KOqigTby+YrVNiX7GmJ/ztIBMV45Qjp+7BvvKi0GYnXo1tjAQXn8X9qhe++1I5pBOX12rlzqdA8jk+qZ4Rlt47YhH6Ycu6R6JGi5phxjDTGqyqgj4yuxg3mKya0N8vvrLbmRIpQXB9Fhqgu23U40cTPi7q1RIasYajwedzXmZM9SQ0/tSWhAArC06FxMGpBLn5i6Plq2EVfDvZhDI=
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a05600010ca00b0033b422356fbsm2187245wrx.80.2024.02.06.06.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 06:07:49 -0800 (PST)
Date: Tue, 6 Feb 2024 15:07:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [PATCH v4 0/2] drm: Check polling initialized before
Message-ID: <ZcI9Mw-MclTtkbwe@phenom.ffwll.local>
Mail-Followup-To: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
References: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-Mailman-Approved-At: Tue, 06 Feb 2024 14:09:11 +0000
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

On Thu, Feb 01, 2024 at 10:42:56PM -0800, Shradha Gupta wrote:
> This patchset consists of sanity checks before enabling/disabling
> output polling to make sure we do not call polling enable and disable
> functions when polling for the device is not initialized or is now
> uninitialized(by drm_kms_helper_poll_fini() function)
> 
> The first patch consists of these checks in
> drm_kms_helper_poll_disable() and drm_kms_helper_poll_enable() calls.
> It further flags a warning if a caller violates this. It also adds
> these checks in drm_mode_config_helper_resume() and
> drm_mode_config_helper_suspend() calls to avoid this warning.
> 
> The second patch adds a similar missing check in
> drm_helper_probe_single_connector_modes() function that is exposed by
> the new warning introduced in the first patch.
> 
> Shradha Gupta (2):
>   drm: Check output polling initialized before disabling
>   drm: Check polling initialized before enabling in
>     drm_helper_probe_single_connector_modes

On the series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
>  drivers/gpu/drm/drm_modeset_helper.c | 19 ++++++++++++++++---
>  drivers/gpu/drm/drm_probe_helper.c   | 21 +++++++++++++++++----
>  2 files changed, 33 insertions(+), 7 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
