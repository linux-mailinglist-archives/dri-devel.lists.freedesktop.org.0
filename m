Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB18BE61A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 16:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A884710F708;
	Tue,  7 May 2024 14:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HRESktVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A410FB86
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 14:36:24 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2e27277d2c1so42481231fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715092582; x=1715697382; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W46Kt5yvQlfhtjiIgYjggG1nDCwThUkmABq3UaihB1c=;
 b=HRESktVMreONeZ7BQxDPPGZZ6yet2DrmcxTN12PAOh/FJX/DS9whasfvX7NhrzkXMw
 XrCmHytD8GIBXM/FdgVR1bLQDgkDVKoPz1ABkXfKQaNTeqIL8bHnh1SKWudmSsaAMCaO
 Bz+h4SsELtkClanBct1MHHkt8WegOfVURtI7TMrsSZU39pGP+XPxBFpc8+JzKiVfMjJQ
 jdQ/hT2KtLsVmmPZTykwKyElnIMvxqSFBqzZPS/y+9puKDES9U1Jq55xRPsGaM9vBTt5
 fiCc6Xgr8HonKx3kT3xHxGUul+M8Mha+PAMvwv3xUTj1lDK5vxlfQwRk3ZNcnUvntjPc
 3OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715092582; x=1715697382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W46Kt5yvQlfhtjiIgYjggG1nDCwThUkmABq3UaihB1c=;
 b=E76r5hFkYLjSGd0dsQq8gfjRjUVygGAG56yuO+8KGiFvev784chdjBCJeXJwSHeHPm
 Eldy6IOLaXFUMVLfl3c8Hm+eDY5D2MIgnbfIOItAI3Mg9LgdIIggZoaa+4zGDU6EceYJ
 UhBhEidtJgD7SwT3N1ndnIN09XfFAQ5aCDIE1sN7Ts/rlBw4knmlfE93toLU1BttSe/h
 dVEb27sUD+22rQpCauDp0K9lKqQcOP1CwrAIV1pJzFpHLqfGG+DaY2eneragO5O2r8JD
 GVhKrKevFw1+l00GElrQn58BZadEX9S6TcYNb2DeOcBSJOEZjI7SUPwHuBZTPtHE1utQ
 Y0iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQuYHp4lSsvpFsCS5SzK/iuZMidHqetjo2DMJmD4+8wmg7sTl5cgQ883rQqj/1kUOxlYHGT8JucTZOvtOWTRVg0huNfZ8AbZYO4X4HSpb/
X-Gm-Message-State: AOJu0YwjblwM7B8b4N9M0lFiZDBxJdYqrS9iDutR6jdtyOO7ab73lN2z
 q1ur8k85JQ7mx8rYRxb8qgKeOAbyNf5bebz+pBRdPweBbwHB3xnUzHuVGtnLmn8=
X-Google-Smtp-Source: AGHT+IGKxhVmc5WDuZG7EwSJbTPcSCGzUEMYnRH99AthqRDNVlt54D+51cUwkFZpTtI1PoUNyGcm0w==
X-Received: by 2002:a2e:a555:0:b0:2de:3421:9edd with SMTP id
 e21-20020a2ea555000000b002de34219eddmr10229313ljn.33.1715092581990; 
 Tue, 07 May 2024 07:36:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a2eb614000000b002e0e3467465sm2053575ljn.12.2024.05.07.07.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 07:36:21 -0700 (PDT)
Date: Tue, 7 May 2024 17:36:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, 
 kyungmin.park@samsung.com, linux@armlinux.org.uk, krzk@kernel.org,
 alim.akhtar@samsung.com, 
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com, 
 jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 09/11] drm/msm: Use fbdev client helpers
Message-ID: <pkjjp5x3stoow7omrvawbsxe6tc63q7zrl2djtjnjrs3azdva4@qrdgdwz6cwjb>
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507120422.25492-10-tzimmermann@suse.de>
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

On Tue, May 07, 2024 at 01:58:30PM +0200, Thomas Zimmermann wrote:
> Implement struct drm_client_funcs with the respective helpers and
> remove the custom code from the emulation. The generic helpers are
> equivalent in functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 58 ++-------------------------------
>  1 file changed, 3 insertions(+), 55 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
