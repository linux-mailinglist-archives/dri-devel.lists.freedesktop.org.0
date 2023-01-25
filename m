Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FCA67A99F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A321010E36F;
	Wed, 25 Jan 2023 04:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D610E36F;
 Wed, 25 Jan 2023 04:32:01 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so10489663otf.8; 
 Tue, 24 Jan 2023 20:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HZCOPHA0/p0Gbg3tDBBAk1F9iMjCBVQ4LhqzTjtLUlc=;
 b=PIGzX+Cn3rTHzBnT3XP8S1yiSzGHAUp/z6VrqRL6xmgM2SvAsDmO7SbuJRBZ3jphRL
 6Q1EM14mKr45ZLB1KzzUCaz8HEfe//VyfUhU/nljcLPchmq+5NY7qtKhZc9iblzBhnYP
 66bQKH08hFj+u/qxPPfdxvLpbY5BUChD0wj58icB0a5u8IWrXvv+iP4H3ITh3oAhIsVA
 RUx5nuQI1B3QQmWHbTTifd2cIi1bdSilW+2sCQm0zTZH9LGEGidud/qHLB0VZPYYUOs+
 xv0bc709P7FEg3crFeFVOeHaYl0EOTnVBxCHZGOrhoEsyp+irmy8BTUrLKV9BLyMLcLK
 /a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZCOPHA0/p0Gbg3tDBBAk1F9iMjCBVQ4LhqzTjtLUlc=;
 b=KnHFof6XswnMDmeZg3SU3bTZc8v5tm9VuCmqmC/IqVsSwHdCklb+tgOmVaprPeAaqt
 mpWul8/hj7xIRfoppV6aE+Oy6qvSYhW20ULCINRat/ATR7pNU9UijUdeGwAJrzX198CP
 GbC1wWUzq/xkX21qoPohGWU9DVDgOvEl60dqBO0cCWOcdC8nCvMFnoonO19rJw7PMWsC
 rT/H1Mz6JZbSTWmPMXb5xYt20fy/cZs2n2TrK2+L0FToigWMhOdds4Uj3a5ktG9NTSu6
 EXneb5acP0E/kHCw0MUGJx8kvnRxlf60SBe5WbfNljFhe4V4IDIUxnVe+jCPjtnevsMc
 0HTQ==
X-Gm-Message-State: AFqh2koPFPyRJEmlneNGNcrB1Alc02LluSqjPSuBU8794CqtsLud4V5I
 J9NvQtvEvPzy7qD7kpm0FSC8699wK3N4gM6kjxo=
X-Google-Smtp-Source: AMrXdXvluqehiZTX7OCAaPBmXMEQ0kJO/eyrrCev37lHlLGYry5SOIYOuUe0aRZeRjVD10hiBxNkKQGxw+x0vmlo2qo=
X-Received: by 2002:a9d:5c89:0:b0:686:60f4:b300 with SMTP id
 a9-20020a9d5c89000000b0068660f4b300mr1151897oti.328.1674621120883; Tue, 24
 Jan 2023 20:32:00 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230123153745epcas1p17e57cf83ed371e86258139473befc615@epcms1p1>
 <20230123153745.3185032-1-robdclark@gmail.com>
 <20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6@epcms1p1>
In-Reply-To: <20230125040403epcms1p1646e9668b87df3e9c344ad58d39b6eb6@epcms1p1>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Jan 2023 20:31:58 -0800
Message-ID: <CAF6AEGud-ESF=VgcaSFzKsWas0H5eSXZDdZGcnd8Ju=pr-W2EQ@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: Fix build issues with devfreq disabled
To: myungjoo.ham@samsung.com
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
Cc: Rob Clark <robdclark@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 8:04 PM MyungJoo Ham <myungjoo.ham@samsung.com> wrote:
>
> >Sender : Rob Clark <robdclark@gmail.com>
> >Date : 2023-01-24 00:37 (GMT+9)
> >Title : [PATCH] PM / devfreq: Fix build issues with devfreq disabled
> >
> >From: Rob Clark <robdclark@chromium.org>
> >
> >The existing no-op shims for when PM_DEVFREQ (or an individual governor)
> >only do half the job.  The governor specific config/tuning structs need
> >to be available to avoid compile errors in drivers using devfreq.
> >
> >Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> >Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Doesn't this imply that DRM_MSM should depend on PM_DEVFREQ ?
>
> It appears that gpu/drm/msm/DRM_MSM uses PM_DEVFREQ without actually
> declaring the dependency on PM_DEVFREQ.
> You cannot use SIMPLE_ONDEMAND without DEVFREQ.

Possibly that would resolve some issues, and that might have been my
mistake in assuming that depending on SIMPLE_ONDEMAND implied a
dependency on DEFREQ (which seems like a reasonable assumption, IMHO)

But AFAICT some kernel configs that could otherwise use DRM_MSM don't
support PM_DEVFREQ.. either way, lets solve this properly and remove
needless dependencies on devfreq.

BR,
-R


> Cheers,
> MyungJoo
>
> >---
> >Assuming this doesn't conflict with anything else landing via another
> >tree, an a-b to land this via drm/msm-next would let us un-break builds.
> >(And also start removing "select DEVFREQ_GOV_SIMPLE_ONDEMAND"s added in
> >various places to try to work around this issue.)
> >
> > include/linux/devfreq.h | 7 ++-----
> > 1 file changed, 2 insertions(+), 5 deletions(-)
> >
> >diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
> >index 4dc7cda4fd46..7fd704bb8f3d 100644
> >--- a/include/linux/devfreq.h
> >+++ b/include/linux/devfreq.h
> >@@ -273,8 +273,8 @@ void devm_devfreq_unregister_notifier(struct device *dev,
> > struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node);
> > struct devfreq *devfreq_get_devfreq_by_phandle(struct device *dev,
> >                                 const char *phandle_name, int index);
> >+#endif /* CONFIG_PM_DEVFREQ */
> >
> >-#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
> > /**
> >  * struct devfreq_simple_ondemand_data - ``void *data`` fed to struct devfreq
> >  *        and devfreq_add_device
> >@@ -292,9 +292,7 @@ struct devfreq_simple_ondemand_data {
> >         unsigned int upthreshold;
> >         unsigned int downdifferential;
> > };
> >-#endif
> >
> >-#if IS_ENABLED(CONFIG_DEVFREQ_GOV_PASSIVE)
> > enum devfreq_parent_dev_type {
> >         DEVFREQ_PARENT_DEV,
> >         CPUFREQ_PARENT_DEV,
> >@@ -337,9 +335,8 @@ struct devfreq_passive_data {
> >         struct notifier_block nb;
> >         struct list_head cpu_data_list;
> > };
> >-#endif
> >
> >-#else /* !CONFIG_PM_DEVFREQ */
> >+#if !defined(CONFIG_PM_DEVFREQ)
> > static inline struct devfreq *devfreq_add_device(struct device *dev,
> >                                         struct devfreq_dev_profile *profile,
> >                                         const char *governor_name,
> >--
> >2.38.1
> >
>
