Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7AD91BA75
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171BC10E0D1;
	Fri, 28 Jun 2024 08:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YXq2fv+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313D910E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:54:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so482819e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719564852; x=1720169652; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AaJi8lobpDZ15rKLMH+5gj+EZZrwx8Hw9p0AsMuaLy4=;
 b=YXq2fv+24Nyeh9hafehgjdAYUNH7zQ/trWb3Dh53Q34+jWH91FLo1WNw4UR5w6yYWF
 T2B/NkTtMkPSwf6kWWMROvUixFgWMLJwoQP40mpkz3KpzSMCz4HGMOMlhWNLdxoi4mbp
 Jj2ggdhu8/VQBDif2dNheOYTiyPK118rbFPHBDlb1W9G15V9ox2M5duCQiYCSG0NZush
 t4FalNgxzTRaFiFv6YMWwxvGDZ+3jyj4qF423zDSzYLKLiezaGGKEn3dqaG3npi/ohG2
 zV7bCLU33sRveIulFPItNNaV8aqsUUBvl8zKw3V9YpNrki4T1DIMm6IrflR4VBqfJeOt
 o/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719564852; x=1720169652;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AaJi8lobpDZ15rKLMH+5gj+EZZrwx8Hw9p0AsMuaLy4=;
 b=LaI/WJgDPRXQdsTgPfXZExnsFCb1HZyeh3c05/gwm77JwIDJNkM3+Cs1LdxR/BkzXR
 fd+0yBIm0iDe1+An6u84mD0Vk9JoJcPXw0qe0jxwwxZpotdJlc0WLACeDWbmbSv3qAsH
 UBbTa7HDqLZnNkp6b89ZicLl88tmzKQJ0zA+rYJmmaM/4h0ZXc0jZgqa58p4tC2H8Ufc
 BC/lpTZquPuED6PWpJZXnbBv1u9t+iYb7uwVxe+wia/F0t0iI1k7HXiSK9uGofM1kB2q
 mT1pBPEIGunK+hgCyA+g94grQvmBx/by2VFt/jkzQxm0pIVRJdNq377Y94MAJvs8Ly9U
 q4cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW90j6/wVrAifxpQ2MQ7/jxMzMhITfLPCwDZDB4bZfsEUI1EA7LPhb9X4qpH+Fq1nEt+9O4vQL6YPoU0cf05mud7WmtCaUZiS9S6BX/vZXS
X-Gm-Message-State: AOJu0Yz8o/pRC2s21OFp0rG9YGLmpz7X7zRwtdGMcVbCmWrbVvKsanPs
 G1PX6/hpSmQb7juoVeRt377Fp4WtZ25qJFLt2W6w4zWKPod+kcbaRTR793IVHlU=
X-Google-Smtp-Source: AGHT+IHlmw/dqzJzuaIfeQfm1rex/i5EFPOP5m0UGG+Ut3HohIAWJDzzep+nA6IHvA8Xv5A5cuvzkA==
X-Received: by 2002:a19:4351:0:b0:52c:ccb4:ec70 with SMTP id
 2adb3069b0e04-52ce061a292mr11034201e87.22.1719564852195; 
 Fri, 28 Jun 2024 01:54:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b42bsm214706e87.286.2024.06.28.01.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 01:54:11 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
Message-ID: <je4acmn744pwhdgwek2cgd22reoanogofcqm43vl2sxoyhb2dr@wxst2ffxistw>
References: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
 <87bk3md9ms.fsf@intel.com> <8734oyckdw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734oyckdw.fsf@intel.com>
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

On Thu, Jun 27, 2024 at 09:26:19PM GMT, Jani Nikula wrote:
> On Thu, 27 Jun 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Wed, 26 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> In order to improve testing of drm/msm branches, add drm-msm trees to
> >> the list of the trees to be merged into drm-tip.
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > It also helps in avoiding conflicts!
> >
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> Oh, this is with the assumption that you'll also maintain the branches
> with dim. I realized this was not spelled out, but I'm hoping it is the
> case.

No, we use gitlab MRs in order to be able to pre-test patches. But it
doesn't stop anybody from running dim ub && dim push after merging an
MR.

> 
> BR,
> Jani.
> 
> 
> >
> >> ---
> >>  nightly.conf | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/nightly.conf b/nightly.conf
> >> index 49abf3fb2a72..f2e181aa29e2 100644
> >> --- a/nightly.conf
> >> +++ b/nightly.conf
> >> @@ -47,6 +47,11 @@ git://anongit.freedesktop.org/drm-intel
> >>  https://anongit.freedesktop.org/git/drm/drm-intel
> >>  https://anongit.freedesktop.org/git/drm/drm-intel.git
> >>  "
> >> +drm_tip_repos[drm-msm]="
> >> +git@gitlab.freedesktop.org:drm/msm.git
> >> +https://gitlab.freedesktop.org/drm/msm.git
> >> +ssh://git@gitlab.freedesktop.org/drm/msm.git
> >> +"
> >>  drm_tip_repos[drm-misc]="
> >>  git@gitlab.freedesktop.org:drm/misc/kernel.git
> >>  https://gitlab.freedesktop.org/drm/misc/kernel.git
> >> @@ -91,16 +96,19 @@ drm_tip_config=(
> >>  	"drm-misc		drm-misc-fixes"
> >>  	"drm-intel		drm-intel-fixes"
> >>  	"drm-xe			drm-xe-fixes"
> >> +	"drm-msm		msm-fixes"
> >>  
> >>  	"drm			drm-next"
> >>  	"drm-misc		drm-misc-next-fixes"
> >>  	"drm-intel		drm-intel-next-fixes"
> >>  	"drm-xe			drm-xe-next-fixes"
> >> +	#no msm-next-fixes in drm-msm
> >>  
> >>  	"drm-misc		drm-misc-next"
> >>  	"drm-intel		drm-intel-next"
> >>  	"drm-intel		drm-intel-gt-next"
> >>  	"drm-xe			drm-xe-next"
> >> +	"drm-msm		msm-next"
> >>  
> >>  	"drm-intel		topic/core-for-CI"
> >>  	"drm-xe			topic/xe-for-CI"
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
