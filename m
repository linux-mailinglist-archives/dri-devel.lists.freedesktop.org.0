Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A116F88D2
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BC10E085;
	Fri,  5 May 2023 18:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3E10E085
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:46:07 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-3ef3887e3c0so9718851cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1683312366; x=1685904366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EhmbhDCRzak/t11wXpwMu2NOC9pgAHH93PKpbCf1qtA=;
 b=G4QDfdGTzO4rSstvF9JULH2agg39wZYGm0nZVPkuB63FSC18U3tIHgh/MgE122WMBH
 p/twjplPNfl+1E0E9Z1UrteFrIythH94J7d/AWSuxJLPTHdli5pkwaMD/wXE7UdE+Q1Q
 FyT1xfPSDRgD7KkOR2w802JXOiQ5nSwAJiRS45fHgz+GyOap8dVYLryiN2EE+zTNsRIR
 CIrD9UQljXXNAqfHwziSmDhh7++2JjQzEsexVdaeS9WoZhSCE+HfHEaANeIIKYv75fFz
 jfHGxvzY3fnhKhdycwH/5pNZHbyPZkutgwzSDevR80rIETpfhoeIdtjwzgD9sagW7LSp
 s9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683312366; x=1685904366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhmbhDCRzak/t11wXpwMu2NOC9pgAHH93PKpbCf1qtA=;
 b=H1iWpkYh2ip1oI41vOSHgX0k7tjT0wxjsaoFYFkPb2jryV2Tqw16SIhdSaWEBJXiUA
 I9J6f3XU1KjqcGkECf9u00XSgJ/vtsan719zUsipJBMSiCAwbsE2XH2nrVvGuRhpo+G1
 H0JI3boJGKIRICEFbzDkXDwTTY/Z+AzW/B9zBXJJ5NXNjzD1m7bH6dsm113DEgY0VDuT
 9hLbh/NWWMcPttkc61cKcVfgeBf3oaHenX6P2bMmqVqjy9lxVmGLkZkJCO3VLufhWbtf
 pVqjzxs7fHUsxzIM9H3F3w/4ccoltOzQVShU3DaU6fibIzR7pqWyABfB80ClcEBLYI7Y
 UIOg==
X-Gm-Message-State: AC+VfDyWaSDCt1/WzLVxszdTvjhq3O++DnJx7otp25wmigFOEiTPFQ59
 zUpVAelFYVvfr6ZBhHT4kxyJfQ==
X-Google-Smtp-Source: ACHHUZ6vlZe98aEMf6s3/JGq7Iyk2iDwsx/lw9OyEks9Uh1D/pOw8Gb/P9wzyi0pSNjwmIgQGhKOKg==
X-Received: by 2002:a05:622a:1999:b0:3e6:4fab:478e with SMTP id
 u25-20020a05622a199900b003e64fab478emr4806484qtc.33.1683312365928; 
 Fri, 05 May 2023 11:46:05 -0700 (PDT)
Received: from localhost (164.146.150.34.bc.googleusercontent.com.
 [34.150.146.164]) by smtp.gmail.com with ESMTPSA id
 i2-20020ac80042000000b003ef28a76a11sm59598qtg.68.2023.05.05.11.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 11:46:04 -0700 (PDT)
Date: Fri, 5 May 2023 18:46:04 +0000
From: Sean Paul <sean@poorly.run>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Message-ID: <ZFVO7LAroGNZuCxu@art_vandelay>
References: <20230109171809.v3.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109171809.v3.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 05:18:16PM -0800, Brian Norris wrote:
> The self-refresh helper framework overloads "disable" to sometimes mean
> "go into self-refresh mode," and this mode activates automatically
> (e.g., after some period of unchanging display output). In such cases,
> the display pipe is still considered "on", and user-space is not aware
> that we went into self-refresh mode. Thus, users may expect that
> vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
> properly.
> 
> However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
> vblank enabled.
> 
> Add a different expectation: that CRTCs *should* leave vblank enabled
> when going into self-refresh.
> 
> This patch is preparation for another patch -- "drm/rockchip: vop: Leave
> vblank enabled in self-refresh" -- which resolves conflicts between the
> above self-refresh behavior and the API tests in IGT's kms_vblank test
> module.
> 
> == Some alternatives discussed: ==
> 
> It's likely that on many display controllers, vblank interrupts will
> turn off when the CRTC is disabled, and so in some cases, self-refresh
> may not support vblank. To support such cases, we might consider
> additions to the generic helpers such that we fire vblank events based
> on a timer.
> 
> However, there is currently only one driver using the common
> self-refresh helpers (i.e., rockchip), and at least as of commit
> bed030a49f3e ("drm/rockchip: Don't fully disable vop on self refresh"),
> the CRTC hardware is powered enough to continue to generate vblank
> interrupts.
> 
> So we chose the simpler option of leaving vblank interrupts enabled. We
> can reevaluate this decision and perhaps augment the helpers if/when we
> gain a second driver that has different requirements.
> 
> v3:
>  * include discussion summary
> 
> v2:
>  * add 'ret != 0' warning case for self-refresh
>  * describe failing test case and relation to drm/rockchip patch better
> 
> Cc: <stable@vger.kernel.org> # dependency for "drm/rockchip: vop: Leave
>                              # vblank enabled in self-refresh"
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Pushed both patches to drm-misc-next, thanks Brian

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d579fd8f7cb8..a22485e3e924 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1209,7 +1209,16 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  			continue;
>  
>  		ret = drm_crtc_vblank_get(crtc);
> -		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");
> +		/*
> +		 * Self-refresh is not a true "disable"; ensure vblank remains
> +		 * enabled.
> +		 */
> +		if (new_crtc_state->self_refresh_active)
> +			WARN_ONCE(ret != 0,
> +				  "driver disabled vblank in self-refresh\n");
> +		else
> +			WARN_ONCE(ret != -EINVAL,
> +				  "driver forgot to call drm_crtc_vblank_off()\n");
>  		if (ret == 0)
>  			drm_crtc_vblank_put(crtc);
>  	}
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
