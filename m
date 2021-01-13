Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0A2F4186
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 03:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA7089B29;
	Wed, 13 Jan 2021 02:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8CA89B29;
 Wed, 13 Jan 2021 02:13:14 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id q25so473444otn.10;
 Tue, 12 Jan 2021 18:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VUErmH4SeZXO4Kr8KDNU7modu5yLT0KfCdnqky8Jm9I=;
 b=FW8cX9veX+LBKIj5m27B315KkVZT+X9hG2Z45JLm+nZdocmYuMAaAvb0WkwDdZGZ9K
 1QLY7ifS5JBnKQPL3rYSSlbkkwqlLNBrcMF12D0MxCTS4zeWFA1L78g8mQJYXJ/9rZ+w
 tuUi8J2tgJdIPsWemgqUFc7bb7iiV2mxhod3tWUZ/VQZXnh52fOnA/Arsb/ADNCk7WvG
 aCvHCmLpMl3PGJ3SElu8xpyUGmh0ikW7XAnxm7wL2sxjmmkMuOUjwtYV6UKjhoWpRbXW
 r7YAeve6N82Ch5cwV/SAAE8JC6hLLpwMAu9LCsTzma1NrPvVCoyPnE1aQzf5e/hEU/RB
 A0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VUErmH4SeZXO4Kr8KDNU7modu5yLT0KfCdnqky8Jm9I=;
 b=mT0cLGmbsZJcXtbCtjBHXmCXPohYIbuIvzHwNj5ITSDdf8IxIdGyrjyfvp3Jgk9XlS
 ilzJQk1v88/FLaP1tT2rvZ1r8K15HjQh86u/QecyH3XYdX81LwYswtgNbWP4dlvoo7IW
 281UtQlcpuKd8mGlaeBZkSOvpIZHYII2OV0xbYp45hq+l/YcNqd2Kps2C3klUfh1RFc2
 HaM0v0NvBiPe/GvdLtktUkAWq9Fcs5OqNP2KzomvtXow5KEY0p6s3nyxNyYq6fpGjzTR
 yWkIj/7d+7kpvHaygUp65uliItueY8APzHpGenfO/JdXH1YeDGNTgJtWNgIhm/6jPj2e
 /+BA==
X-Gm-Message-State: AOAM531yTX9trop5jhieSvMU5lY4Z6i8Zb6p+WtPRXwP5K5ZreJmGbTI
 BuBw1UZN4/m645ViFBAJKPQWviKgW5GVoRjzuhA=
X-Google-Smtp-Source: ABdhPJx36T5OeO+AaMTA5m5RLolSfjCa11TSPHz/G8MAsXeyZ5DSaXrSiWbAE7+GkK7C/htsTmaIXDTTbAZcKtwkwGA=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr1515820otb.23.1610503993648; 
 Tue, 12 Jan 2021 18:13:13 -0800 (PST)
MIME-Version: 1.0
References: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
 <20210113011901.GA135176@hr-amd>
In-Reply-To: <20210113011901.GA135176@hr-amd>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 21:13:02 -0500
Message-ID: <CADnq5_NUaqHWW7A32M1BeQ+rHPS8WZ-0OnVXtD3m7pB3ZpHyYA@mail.gmail.com>
Subject: Re: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as
 static
To: Huang Rui <ray.huang@amd.com>
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
Cc: "Su, Jinzhou \(Joe\)" <Jinzhou.Su@amd.com>, "Du,
 Xiaojian" <Xiaojian.Du@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Hou,
 Xiaomeng \(Matthew\)" <Xiaomeng.Hou@amd.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 8:19 PM Huang Rui <ray.huang@amd.com> wrote:
>
> On Wed, Jan 13, 2021 at 03:57:22AM +0800, Souptick Joarder wrote:
> > kernel test robot throws below warnings ->
> >
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
> > [-Wmissing-prototypes]
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
> > [-Wmissing-prototypes]
> >
> > Mark vangogh_clk_dpm_is_enabled() as static.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > index 75ddcad..3ffe56e 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > @@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
> >       return 0;
> >  }
> >
> > -bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> > +static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> >                               enum smu_clk_type clk_type)
>
> Ah, I have another patch which will use this function in another file.
>

I can drop it if you plan to land those patches soon.

Alex


> Thanks,
> Ray
>
> >  {
> >       enum smu_feature_mask feature_id = 0;
> > --
> > 1.9.1
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
