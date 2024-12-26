Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB9A9FCAFD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 13:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB8E10E00C;
	Thu, 26 Dec 2024 12:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ybqDJ5xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB4010E032
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 12:46:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso45754385e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735217176; x=1735821976; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
 b=ybqDJ5xgC3o0tlbsoHZmSBJh4vFFyX2ftyV+w9EZQwLMwGmPNHyhsdu9x1a4A/dZ5D
 feMDUMPsqFVNvPXobYG2FhjLDnC/CJC8UWIXOY01sf7SnYQPfphJyoLefY+EY1DBrpFK
 LlXoD+QZlx/zm+4HTxzfdvtfxhxNQqm6IE1ldKt1sq6F3AaDVBzFnqojeHl2m3VnW2OC
 2uIg2uuLxauL1U8IQx/royh3W3D0lLQpHOrcCT/wqno08idI/2iclLteSG9Mq9nL6bVT
 5QE0OKA9EaCicb2FagKUfzACErfLPQR2SUaQWXSFfoaLbewH2dmMYZEu4u4R1hkBDg/K
 gjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735217176; x=1735821976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
 b=CXa9S7hgvhdedggwwnMUSmDjWgA8lBbH5NugGf6jb6uEDCegHsfef8jJ1eow0h66MQ
 Iorcf17vFf4zqZMH5hfIIVcAondlbcUvWa/XWIe3OxjoqhrpoGCujTJIXovdeTWqUa6b
 329JjypmibMpg6Ck0Pfpb4nIdNLvP1IO0earKRXnBlJGglQybN42sfMWgq/ltIJver2Z
 BFxV5gs44xeJRr0XUhWg0rcq6S1IJ/rgH1UkND7m2NX1gJV/Nmtx7JAR+qfITShOpMsG
 HZZhh4QcHX+8fFg7fYfaGrPglEzxQfI5ZrEG7tjdxJ6mp2ObksLRrhizuBpD9BEoNVLn
 d88g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlN4J+2pMA331PLPM4TCZHrx3Q+DHnnxVDup8MX0o83fy6EY6qIeuLF9AX0dkeHhwXQMlTQ66hahM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3sOnb9MVDhb91RUZ22JVYAdABwcPTl4AvDGbR59j6NGlNPRpU
 QTDj4CfXEBt3b6udUSU/5YqQM3MAU+KPKQpC9nr5R2SoD1mLUWs6UNiQlarQCsk=
X-Gm-Gg: ASbGncvhlh9XF/XW2hQsMtDtCURu+UO4IDRT1jvfEbDG29waT8x6SvGJyjyAs2hufws
 tCxOpsOo6jODWgDx+i5WKR2qpwPpeMGejhKEDuG4kg6ISjEKbhOLOLQqzTtuy+WRS3iGYp7UaON
 X/OiYlZEIRExs/cf+PrV1ZZydMAQlBdOGyl6lvoUtoMkSDdTvc/c7vMq760YSpq71br4+yhj6E8
 THnpi64jlaFc+Nme9QrKT+q6tCvHpJQoX0tuUuvpgQS3Z0knbTBmf4=
X-Google-Smtp-Source: AGHT+IFdoO/zxiQ3FIpGhucTVIgGS2pedJeFOAxfk444aPe9ZZVT8fXnThIsGtTdQljhl+HRLuLbag==
X-Received: by 2002:a05:600c:1c1a:b0:436:1b81:b65c with SMTP id
 5b1f17b1804b1-43668646aebmr214219565e9.15.1735217176112; 
 Thu, 26 Dec 2024 04:46:16 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea40csm231612665e9.1.2024.12.26.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 04:46:14 -0800 (PST)
Date: Thu, 26 Dec 2024 14:46:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z21QFPYDfFOR905L@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
 <Z1moNToiIIB9auSl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1moNToiIIB9auSl@hovoldconsulting.com>
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

On 24-12-11 15:56:53, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:15PM +0200, Abel Vesa wrote:
>  
> > +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> > +{
> > +	int lttpr_count;
> > +
> > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > +					  dp->lttpr_caps))
> > +		return;
> > +
> > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> 
> I was gonna say shouldn't you handle errors here, but that explains the
> non-negative check I commented on the first patch in the series.

So lttpr_count is a bit weird. It's either between 0 and 8, or -ERANGE
if more than 8 LTTPRs are found, or -EINVAL if for some reason the
DP_PHY_REPEATER_CNT register contains an invalid value.
(see drm_dp_lttpr_count())

Now, I think I should just drop the lttr_count local variable here entirely.

> 
> This looks error prone, but I think you should at least update the
> kernel doc comment to drm_dp_lttpr_init() in the first patch so that
> it's clear that you pass in the number of LTTPRs *or* an errno.

Yes, I'll do that. Will mention all possible values and what they mean.
And will probably point to the drm_dp_lttpr_count() as well, just to be
safe.

> 
> > +
> > +	drm_dp_lttpr_init(dp->aux, lttpr_count);
> > +}
> > +
> >  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  {
> >  	struct drm_connector *connector = dp->msm_dp_display.connector;
> >  	const struct drm_display_info *info = &connector->display_info;
> >  	int rc = 0;
> >  
> > +	msm_dp_display_lttpr_init(dp);
> 
> It looks like you ignore errors on purpose so I guess that's fine.

Maybe I should at least throw an error, just like the i915 does.
Will do that.

> 
> > +
> >  	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> >  	if (rc)
> >  		goto end;
> 
> Either way, this is needed for external display on my x1e80100 machines,
> while not breaking the X13s:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing,
Abel
