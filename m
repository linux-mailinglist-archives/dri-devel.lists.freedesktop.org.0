Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA349A1A3DE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E5410E7EE;
	Thu, 23 Jan 2025 12:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gmaWbzD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A2D10E7EE
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:08:45 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54024aa9febso926218e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737634123; x=1738238923; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vTmEOgD3xfc+fwIttOduP71Ufl9BgBhivnCzDUxKm9A=;
 b=gmaWbzD3tseZzVhT5Kuc+4O5y6IuvNP/ford78eEtoyG0MYNgguN8f8sJo/9VQBd9D
 0ihWiiSPxuwnJVJK+etS41Mxj0OtuFhLFscZJkswZ39Ymv7x7Ngw4AlnxWYiU4y/fX36
 0xY9FEFoxYht3g0lyzqMr6ROHEYhX+Bya/iKbptm4Q+E/hhQw+O7YBbOdRcDnCPnhmMw
 H8gX17uuPgOTlaseLgNjtWXeyM6txNlxp9BeDXJ0/hYy/uRlfFJ4ZcKSTsVVhsNyapX1
 +JqlooaDdezzVnb+4tdukcLUllvkEnjDKnki5wxito9XBuwCkU/FOhlEyc3Q5My2axOJ
 igog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737634123; x=1738238923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTmEOgD3xfc+fwIttOduP71Ufl9BgBhivnCzDUxKm9A=;
 b=cdBk0Y2TbL8FfNs1LpQiri3eiOVU3plYcDl1u6KP+dwfjn+YXtBMyCNxfLB4OWiatp
 Ynr+lPv2r/nN6DZxf/nwqCSt6riDEJ9bqSsQ7gcNGFquDwNm4j6Huxnm9I3TM6AKoGCR
 8ndJ26BpN2wyfZ0RN4CkRQOnzU8uJ/Qkbh5LFl/3SJDkCAkhbkq2W18Kto7SZUpQDHBx
 ad60zH8OLyaBVTQznJpoFrgd+78Jirsffnmyw9WLLcpXqx7NWFLGpDI1VRQodPPuIzBO
 /HDkVQEoflP2z4Bp5R33q9s417lB4LvP14REogiO4u9V7GDGHxgEbQD31NZ0z7MhniI+
 QN/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhiJpv6n7E18XOTPhXBlpEFdGC7WQudlgiyfgugPKsWVdE3mYki5VIi1Vc2g43bfYFvExXsOiMiNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbNUVD2MdZEHTlWenx0OLqDYRpF7e7Ktkz8umKzyDLSfniwNMA
 vNXpKpfaMRjHTfJzS4MEA+fd0lSAd/Co5sXKpsx4PNlMupubyOQPLKvbGNBIsa4=
X-Gm-Gg: ASbGnctkjxPk0jcSB5382dQkyMOTV1jhR/4PjRB4RbX05PQOOIgP3i2XugT0t9IAcbc
 9im2nKq1fXtg+T79eCqex+Jg22P1+LKIxlUZn/zZCSkshnQH1m9mP2UGEFCZ74Bzhetv/x8vfNn
 b5lh3ff/ElXRfHso9L+uJJcRB2hVKYN8yofYSh/PhMiHeGY4CgD60YrHlm5v34CFg2oHsCiugiL
 jb5tW/ThgFO+I0ISDydlYEZi3uiAlqJfdN+XF0hRwMnwcQkUNWTQYiy37FQa7qoH4zTucjbQffw
 r52VGpL403TMzWzFv/f1tu8/Oa5sN0qT5dfm0zxwEFq1ftu/I57iWrBUUcwo
X-Google-Smtp-Source: AGHT+IFbOx6ctuTmmRLLNk/eHiWv/TSPLK7NEzKkr1HnoNXi9QhiZe7Adm2mXqrnq+teryB16WA3sQ==
X-Received: by 2002:a05:6512:e8c:b0:540:2223:9b0b with SMTP id
 2adb3069b0e04-5439c282cd8mr8971004e87.35.1737634123427; 
 Thu, 23 Jan 2025 04:08:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543bae0ba76sm786051e87.8.2025.01.23.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:08:42 -0800 (PST)
Date: Thu, 23 Jan 2025 14:08:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Message-ID: <bfuplxwielalawtozidaoj67smxlzqxatwjl7rza5o4gqgky6y@eika3dvihvk7>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
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

On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> > As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> > drm_atomic_helper_check() require the former function is rerun if the
> > driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> > drivers which failed to follow this requirement.
> 
> I'm concerned about the implications of this series. How does a driver
> upgrade from simple pageflip to full modeset if necessary? The solution in
> msm appears to be to run the related test before drm_atomic_helper_check().
> (Right?)
> 
> My corner case is in mgag200, which has to reprogram the PLL if the color
> mode changes. So it sets mode_changed to true in the primary plane's
> atomic_check. [1] This works in practice because the plane checks run before
> the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
> the PLL means to disable the display at some point. So it comes down to a
> full modeset.

After giving this a second thought, I see an obvious issue from the
generic code perspective. If you set new_crtc_state->mode_changed from
your atomic_check(), then it's already too late for
drm_atomic_helper_check_modeset() to add all affected (aka routed to the
CRTC) planes to the state. Their atomic_check() callback will be
skipped. So even if the end-result works in the MGAg200 case at this
moment, I think we should still disallow that.

Another option might be similar to what we had to do in the DPU driver:
check whether the mode_changed has to be set before calling
drm_atomic_helper_check(). Maybe we should consider adding new set of
callbacks to the drm_*_helper_funcs, which are executed at the beginning
of the drm_atomic_helper_check_modeset().

WDYT?

> You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> flips. Would it be possible to implement this instead within the helper?
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
> 
> > 
> > As suggested by Simona, implement generic code to verify that the
> > drivers abide to those requirement and rework MSM driver to follow that
> > restrictions.
> > 
> > There are no dependencies between core and MSM parts, so they can go
> > separately via corresponding trees.
> > 
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/atomic-helper: document drm_atomic_helper_check() restrictions
> >        drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
> >        drm/msm/dpu: don't use active in atomic_check()
> >        drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
> >        drm/msm/dpu: simplify dpu_encoder_get_topology() interface
> >        drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
> > 
> >   drivers/gpu/drm/drm_atomic.c                |  3 +
> >   drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++
> >   include/drm/drm_atomic.h                    | 10 ++++
> >   9 files changed, 192 insertions(+), 43 deletions(-)
> > ---
> > base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> > change-id: 20241222-drm-dirty-modeset-88079bd27ae6
> > 
> > Best regards,
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
With best wishes
Dmitry
