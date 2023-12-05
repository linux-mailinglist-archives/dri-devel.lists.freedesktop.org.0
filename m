Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974480538E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 12:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6110E4F9;
	Tue,  5 Dec 2023 11:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5DB10E4F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 11:54:49 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-db5311eab29so3761698276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701777288; x=1702382088; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vsA5gKrCxzLqx2Z8rQ+ATME7jYK1uxeVjWJRCZRRKX0=;
 b=PxfW5LFgLk9V5BpBu7CQX/iH3O0wNP9UZ6D6MAZrTA9GM0hhP0p/0iIfHkb8WBWhzC
 BTlolFwam2KGXJyL0+vd/xFkF8riI2JZviI1H0v/bIMUMeKtbelEFqgR6iegM71UqJND
 CeMtUoKiV/Tko3/5KMlFbox+HazFoR7cEb2oS9ep26iQ/s6pLeapHp3r1HftTPukQuvA
 it8eQnQ/vj5CuwsEvgEZ5xohpwarGT3qHlcmzkAnUcNfMPs/bwZg2En+qhrtNOHcEG+F
 ePB47dTb4Y4L5pAEGMalhr4CbYhXYOCqEfQAD2LW0lcceuTnLxG5CI5sCGr8YYxqc1sG
 b0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701777288; x=1702382088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vsA5gKrCxzLqx2Z8rQ+ATME7jYK1uxeVjWJRCZRRKX0=;
 b=CCp0wuSSqDsj83A0bHy/Tmq3cKGv0hEM07SyR09+waqPsUCbnRxPJJkDoAffuv34Jy
 URxtMVQF8RhObEnLno26YkbckvjBjoW5OQ0Cc4YA3Nsxh8SnAvwiH8B7YMMi10qebVUJ
 xuwpXRohMcveqQOM7/9NjiHChnUECZ7y3qto1stlccWr93iuvWo0Bt71CvnjoSlVvz1F
 HWKwIVoeiInuazGLiiYT5aJXOEf1u6/8EblBOimR6OVJkxOrlIECtNLYAWiTxOJYRuk7
 3QnfwNvM+iw93stLyLPlURbqvIodSxf16SxBPj9QVx8adkOEij5vXdXv9YYmQLsz4LPZ
 DLag==
X-Gm-Message-State: AOJu0YzabupCP/uAgOofYShOMLWJi2tco34FIqhdD3uTAwmDC80cIhZr
 AgwVMI4wnioZtDfDqSNNFb/rJv3FpmjVxXpRTPdFZw==
X-Google-Smtp-Source: AGHT+IFMwAe9miKrOxVD6uAUhCfufm0lCJxdcuUgHbE3FCiC5QxQrneRoqm3VDEwKO56zsgD+hw9MVkSQgry6YlCdjU=
X-Received: by 2002:a5b:a52:0:b0:db5:d88:d463 with SMTP id
 z18-20020a5b0a52000000b00db50d88d463mr3881570ybq.51.1701777288460; 
 Tue, 05 Dec 2023 03:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
 <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
 <ff89354d-c9d1-486a-982b-0bb976f6b699@linaro.org>
 <hfvttbhsztcbagsimvhoeqadwtcrxhcs5gt7ssjipszndqzxeg@co2jxo3smli6>
In-Reply-To: <hfvttbhsztcbagsimvhoeqadwtcrxhcs5gt7ssjipszndqzxeg@co2jxo3smli6>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 13:54:37 +0200
Message-ID: <CAA8EJpoAGN+8smPEWAAGaD80JoCC5RwPEqQYvNa9aSQ355KCwA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 13:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 05, 2023 at 03:37:15AM +0200, Dmitry Baryshkov wrote:
> > On 04/12/2023 10:38, Maxime Ripard wrote:
> > > On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
> > > > The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> > > > encoder for anything other than getting the drm_device instance. The
> > > > function's description talks about checking the writeback connector
> > > > state, not the encoder state. Moreover, there is no such thing as an
> > > > encoder state, encoders generally do not have a state on their own.
> > > >
> > > > Drop the first argument and rename the function to
> > > > drm_atomic_helper_check_wb_connector_state().
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >
> > > > Resending, no reaction for two months
> > > >
> > > > ---
> > > >   drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
> > > >   drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
> > > >   include/drm/drm_atomic_helper.h       |  3 +--
> > > >   3 files changed, 6 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > index 2444fc33dd7c..d69591381f00 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> > > >   EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > > >   /**
> > > > - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
> > > > - * @encoder: encoder state to check
> > > > + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
> > > >    * @conn_state: connector state to check
> > > >    *
> > > >    * Checks if the writeback connector state is valid, and returns an error if it
> > > > @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> > > >    * Zero for success or -errno
> > > >    */
> > > >   int
> > > > -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> > > > -                                  struct drm_connector_state *conn_state)
> > > > +drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
> > >
> > > AFAIK, all the helpers take the object as first argument, so I'm fine
> > > with the name change but it should take a drm_connector too. And ideally
> > > a drm_atomic_state pointer instead of drm_connector_state too.
> >
> > I think we then might take even further step and pass
> > drm_writeback_connector to this function. I'll send this as a part of v2.
>
> ... Which is still not the usual function prototype for atomic_check
> helpers.

On one hand, you are correct. On the other hand, don't we want to
emphasise that this function is to be called only for
drm_writeback_connector objects?




-- 
With best wishes
Dmitry
