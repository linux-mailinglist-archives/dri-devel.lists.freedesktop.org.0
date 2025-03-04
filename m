Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870EA4EEBC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 21:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAF910E6B3;
	Tue,  4 Mar 2025 20:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hVmo3Do7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E410E15E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 20:48:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54965898051so2744367e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 12:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741121295; x=1741726095; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/oAPJle7igvkCOj9wNSaohLqS/9lmDq/1xSw1olJhfs=;
 b=hVmo3Do7udqhocPSMmLDDICMftfOPp/X+/rAuj05OdUQp7xZH6UoVB5YEyTivGBxHy
 QnoYFNboytNoqnyWxW93A7oe7/w6qnYyuBkj7PB6O2LcXdmtNElGbcP1+r1SJe6w7pR/
 umipDVKGwmwzn9N0twa3CG+pHYtwKY+Jh3tEk9IcKI0ZnAoKZNBCVPFEVd0wFEQ7PUOd
 02u/88jYxMjeJx++l009mU2+6cAqsSi/re+CynDQamr3JkcKITDodfC957nDBddPSv7b
 EZbr8XMwaUBxUVznZsWK1o/wESVbAMr17W2+pt648iQM1xSmqqyFWynEkfGLUFosDmeN
 FhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121295; x=1741726095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oAPJle7igvkCOj9wNSaohLqS/9lmDq/1xSw1olJhfs=;
 b=IeQKPRpUEK2RlofxHeYQAN34mvQ30xGp//Hvq5LsQvJRVSYun7mxCBo393Vhky5SBB
 gks1uxyKRsfVCUkkLbnctFs/ctgHWu8pAzJlYuitOrY0eRheJzMxVg9vzvwtqbmsYJeg
 Y0HmdGJy3SgBAOv/O6ZjT1s6wi95mlxB+GSskoVR+4dX6v7XT4G4qV95M0NAhFzrkxf1
 RIDwgsK8/d4te29zjeogGvY7c2MtUj8vXvvEmhsdWnV8tsuWBqYKPQHuWmkvv5+PaRPZ
 KLZzhrmtRdSCvWRkoI5Y/M2ALVh1zkA6P9EY8AcTZnAB0H6V16uqUkfd2rhxUzC/OdxE
 eL5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWbnZ0/ACYjaqH3BVq7UgR294vazxviwKkp54ACUw/vb+f1Bexbtf+3kY7H6fKYoDFl5+kiZc5i4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1L6nggzRrDWQ5DqSStYxFxPxSpH8h0GgxHjtnWbEvsx+TTSkE
 EyUxyKI3NX6799zJjNgCi192Hq8K7pntzwr6Pcnxw5xlCxU7Rk8SjbP4bt/J/jk=
X-Gm-Gg: ASbGncut+10gf5p8AQ2zWwX7vz5sVipt0nvSYQLuBG1EiuewhC7IceZAMzcKkD5kMvj
 ZrYJf9YX+R6jZOQi9OIlB1B+Vj/05SyK5p5qtJLERYalxDb+vQy+QviRczPuu8+IyC5qN7Rjn9r
 7RbmLyHROxaCAlV9gr56u8K9jeb+y6A56lpC+Lja7cN3xxOBCW+l4qpuulQZTIvT+f0RVsDlp0L
 ChXqIbPrunuV6fdYiKWE+szYSMTlipMXui/fj4HmNuBoC7GJuJmO0cOplk5nafy6Ve5Pc/4oJjC
 xZ9FwLqg9Leex60ImlFmdJRaIhyWHsf8LTOHMmo6EdvGZechOI9UNg2P587jrsJWb3A2eyssUfe
 IFI2+8wHQmTelJ4hfHY4tlDHV
X-Google-Smtp-Source: AGHT+IH5VMC586i36hYasuRbMAJ6daWnnollvxQ5ODQDmTBEMUXbbXzEafbSoZ2SOMQnxMX8oAh9Jg==
X-Received: by 2002:a05:6512:304e:b0:545:e19:ba24 with SMTP id
 2adb3069b0e04-5497d37e371mr237109e87.48.1741121294899; 
 Tue, 04 Mar 2025 12:48:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443be587sm1667436e87.177.2025.03.04.12.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:48:13 -0800 (PST)
Date: Tue, 4 Mar 2025 22:48:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <cqpqtuh2tztdhsg3nrvxnobxmsytsxthcd5wybiuzyefurkme2@hvv5zjiqczyb>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
 <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
 <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>
 <da6e2hygdv6ewdr5hqeks2ocsxwvfvozby4b53unk5ckyqvu7t@wh3y4jnucapl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da6e2hygdv6ewdr5hqeks2ocsxwvfvozby4b53unk5ckyqvu7t@wh3y4jnucapl>
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

On Tue, Mar 04, 2025 at 01:43:09AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 03, 2025 at 10:45:19AM -0800, Jessica Zhang wrote:
> > 
> > 
> > On 2/27/2025 7:07 AM, Dmitry Baryshkov wrote:
> > > On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > 
> > > > Up to now the driver has been using encoder to allocate hardware
> > > > resources. Switch it to use CRTC id in preparation for the next step.
> > > > 
> > > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > > Changes in v6:
> > > > - Drop duplicate cstate initialization code and unnecessary memset
> > > > Changes in v5:
> > > > - Reordered to prevent breaking CI and upon partial application
> > > > 
> > > > Changes in v4 (due to rebase):
> > > > - moved *_get_assigned_resources() changes for DSPP and LM from
> > > >    encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> > > > ---
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
> > > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
> > > >   5 files changed, 110 insertions(+), 126 deletions(-)
> > > 
> > > This commit breaks several tests in CI:
> > > - sc7180-trogdor-kingoftown:
> > >    - kms_cursor_crc@cursor-dpms
> > >    - kms_pipe_crc_basic@disable-crc-after-crtc
> > > - sc7180-trogdor-lazor-limozeen
> > >    - kms_cursor_crc@cursor-dpms
> > >    - kms_pipe_crc_basic@disable-crc-after-crtc
> > 
> > Hey Dmitry,
> > 
> > Thanks for catching this. Looks like this was exposed due to a recent IGT
> > uprev that included  dc2d7fb4f978 ("lib/igt_kms: move setting
> > DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback").
> > 
> > The issue itself is that when DPMS is toggled, it is possible for RM to
> > reserve new HW resources but skip the atomic_enable() due to the checks here
> > [1]. This means that the change in HW block reservation won't be propagated
> > to encoder if DPMS is set to off.
> 
> Could you possibly clarify this. What is the state change that causes
> the issue (describe CRTC / connectors / encoders and active / enabled
> state). Why does the issue manifest only after switching to the CRTC id
> for resource allocation (the tests run successfully before this patch,
> i.e. with the resource allocation being moved to CRTC, but using the
> encoder ID for allocation).
> 
> Note, the CRTC won't re-allocate resources if
> drm_atomic_crtc_needs_modeset() is not true. So I'm not sure how can we
> end up in a situation when the resources are reallocated _and_ we need
> to raise the mode_changed flag.

I'm going to apply the following fixup on top of your series (to the
previous patch), fixing the DPMS issue. It makes all SC7180 tests pass
in CI.

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ba5c60296e17..10653bd52885 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1373,7 +1373,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
-	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+	/* don't reallocate resources if only ACTIVE has beeen changed */
+	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
-- 
2.39.5


> 
> > I've posted a fix for this here [2].
> > 
> > Thanks,
> > 
> > Jessica Zhang
> > 
> > [1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1502
> > [2] https://patchwork.freedesktop.org/series/145735/
> > 
> > > 
> > > Corresponding pipeline is available at [1]
> > > 
> > > As I had to rebase your changes on top of msm-next, corresponding tree
> > > is available at [2]. It might be possible that the regression is
> > > introduced by my rebase.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165
> > > 
> > > [2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
