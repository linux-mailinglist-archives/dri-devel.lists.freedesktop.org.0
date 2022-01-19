Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6464493D25
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A710E2E1;
	Wed, 19 Jan 2022 15:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50C910E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:31:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w26so5826332wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EEwszbL7JSaW2g9ncBScSaSCr2Cmm8pog96jqoGtWUU=;
 b=AvKGhaM2IE1rw4PUhZ9+6xqaFege0xTVTb1Vw41jAEodT/ztWFpLBR29Pn4i7DpzTC
 xlVlWYfTffSRHxmGl2Krh41GrdZmBlb4JomJPikj1katDlJvtMdqAy2zap3CKdnEt1VW
 lUF4Al55lPe6KDqF76HWPn6mevH6n9dtOJ79w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EEwszbL7JSaW2g9ncBScSaSCr2Cmm8pog96jqoGtWUU=;
 b=vk40B2bsCWsQG4v0STutBbWb5Skb8oGQeYBUXnpPWqwpECYWVoYq+ewp3GRYf5MoK5
 inswrKlsgRNKD4Zxn1uxHAndBLp6TdCva9symTrxqT5g0BejMcpK4/Yd3g7GE1x7cqw9
 x9/3i2BsDXzw33RaotUGFBOU9MJ1lP76P4KYyRcE5DQSAL6mslR5PnLgTCerJztBev5b
 cVLvn4iSNpdBULL8faA9cff0/5f0u3IS0/7IBhc2fRMWK26l/ZZfoNN1A+tOx0FkDYhR
 TCS6AXzrL8VWSIyabG7ZdFnuqXgrKbTPSsdLwzkLVGVDNo6crHr32wzy7E6S5trsywl1
 aLmw==
X-Gm-Message-State: AOAM533qviKQVLSTLYVjldVdGwKooXni//henHRUrc+rJz4wC/GE2gpT
 5jTz/4yWcLygY9f55NZZYhL1TQ==
X-Google-Smtp-Source: ABdhPJytSeK0nTa2OU28PzM7P+4b4R1+Yxc672QntbhSwADGiwocjVMhIYp3nDQRFrgdzWA0MOtsQw==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr29059404wrw.677.1642606268397; 
 Wed, 19 Jan 2022 07:31:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d6sm117015wrs.85.2022.01.19.07.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:31:07 -0800 (PST)
Date: Wed, 19 Jan 2022 16:31:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Raymond Jay Golo <rjgolo@gmail.com>
Subject: Re: [RESEND] drm: panel-orientation-quirks: Add quirk for the
 1Netbook OneXPlayer
Message-ID: <YeguukKExXYALEmv@phenom.ffwll.local>
Mail-Followup-To: Raymond Jay Golo <rjgolo@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20220113000619.90988-1-rjgolo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113000619.90988-1-rjgolo@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 08:06:20AM +0800, Raymond Jay Golo wrote:
> The 1Netbook OneXPlayer uses a panel which has been mounted
> 90 degrees rotated. Add a quirk for this.
> 
> Signed-off-by: Raymond Jay Golo <rjgolo@gmail.com>

Applied to drm-misc-next-fixes, should show pu in the merge window still
for -rc1.
-Daniel

> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 042bb80383c9..b910978d3e48 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -115,6 +115,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
> +	.width = 1600,
> +	.height = 2560,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct dmi_system_id orientation_data[] = {
>  	{	/* Acer One 10 (S1003) */
>  		.matches = {
> @@ -275,6 +281,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
>  		},
>  		.driver_data = (void *)&onegx1_pro,
> +	}, {	/* OneXPlayer */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
> +		},
> +		.driver_data = (void *)&lcd1600x2560_leftside_up,
>  	}, {	/* Samsung GalaxyBook 10.6 */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
