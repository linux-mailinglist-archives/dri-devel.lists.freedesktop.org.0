Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A80A06355
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109110EC2D;
	Wed,  8 Jan 2025 17:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WjiXP2vs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184A910E1DF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:27:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so22426f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736357180; x=1736961980; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
 b=WjiXP2vsOQo23gE+hvSUFDZLpIOBbclw9tqghJ56MPIDsHo0i3g4vwO29T5rZG047b
 RYbdcO7FQz2qjj3zKUrv8WEbDVsCWw8iAzJzDC7Tg9S7QiEaCHu3IKxACp4AD2Ke9YdY
 5UR2t27WGrhOmc13Tk6HPdC6iUgxiLBhrZPoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736357180; x=1736961980;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
 b=SHP9KEbMp5EG3VTn67CExQs5/KgG/2W8z2CUixMJsm5cGOBwrIb9YpE0pQ+Oo+xUiL
 07s34gHXtjthZ83CEVPV4jwAAcsnrxw+Kgspc5TB0xdsfz1rfh7cIVPUdmPnPEigqR2l
 3SAv1P+Tp5+7waYa7ZjXFh26sMOz4BwfHC2DyWtP6+7qTwZj4VOIItkVNp6qajqXm2Bt
 kHBxgx91M/I0tXMqV3HOPmETWY/q7EpoBSGL06HJ0I+tShSu/FtawsSLOx+ghVgCkX4c
 z9bvYX0OCOHfv4IoUKUnTmzs2nXTgzCjXdrzN8IOusTEOVX3yrc1pYe9Fv9KV3h+488u
 CecA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOTtXfTPaLsX8/c8H9+4J2yg8/Tp1RsHr95rvHMgytOnEjbxXX8TtdbVDhyWhx9a4kDRCC69gI938=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0jRj27ShiB5GsRUn7xV0fuTqLaxDGkYl3e7qWDk1s5SBs3Cjb
 xaE3fVJUt9S7Z3RbxdD1Vvn0wtbUM+KiDrsjNQk9zxq8i0AIDzOd8betRXm/oHQ=
X-Gm-Gg: ASbGncvhKB00WOjymg7DlilgdmDJNiUDuJIc47q+zt+4NpmBbqpJNkgSOn7b5KVI/Dd
 DNvcLSPc2ecJOxXraTW4n+Ycx5ANmhoxNltyzbR8bArcShncqiM4jOa2JfOc9a2drLBHl2VTC+X
 iTOGuB+nvxe9SeguONCgaV5hS4YhVHqQYg5aeC2Pgv7gVyZ0xtuvhoEKYTSDq5hSkYb76bTsdEJ
 gTNXM7+E54afRlglVuSriJpRJN/ZgzkNRhAamo9Y5klEQX4YCjiX73Ev8IU/eTztC0I
X-Google-Smtp-Source: AGHT+IHIG8gIkIZLnGTj2vm2ov4/i2vQzdBqNMlxt0wme6qkxMsRJFFigfl4B+bpgLZ7xuYAvDMDEg==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id
 ffacd0b85a97d-38a872f6d09mr3033928f8f.12.1736357179644; 
 Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8334aasm53404544f8f.41.2025.01.08.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Date: Wed, 8 Jan 2025 18:26:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 1/6] drm/atomic-helper: document
 drm_atomic_helper_check() restrictions
Message-ID: <Z361OTdcwtPvN17P@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Sun, Dec 22, 2024 at 07:00:41AM +0200, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
> insternally. Document that corresponding restrictions also apply to the
> drivers that call the former function (as it's easy to miss the
> documentation for the latter function).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5186d2114a503701e228e382cc45180b0c578d0c..f26887c3fe8b194137200f9f2426653274c50fda 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1059,6 +1059,15 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>   * For example enable/disable of a cursor plane which have fixed zpos value
>   * would trigger all other enabled planes to be forced to the state change.
>   *
> + * IMPORTANT:
> + *
> + * As this function calls drm_atomic_helper_check_modeset() internally, its
> + * restrictions also apply:
> + * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
> + * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
> + * without a full modeset) _must_ call drm_atomic_helper_check_modeset()
> + * function again after that change.
> + *
>   * RETURNS:
>   * Zero for success or -errno
>   */
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
