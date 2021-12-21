Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FE47B661
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 01:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738410E9F4;
	Tue, 21 Dec 2021 00:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3C10E9B7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 00:01:23 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso14530484ots.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 16:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PRRlE08tRQGUC/ML6AzImHY04yPHs+qeigbIK6/ghCA=;
 b=WTin9bf+zQCthKwRftbe7mXH1Hwkj0/++A2ImlNyEdbKrQyYcw7vxaOSmoo3yhQTYB
 8xus/V01oDtDh/8outB78i7WyWUyy2yHdZAahe1edvGG7m/Pm69awBYMJboaizx89H3H
 TySg4EtqKrNEYuEE4Q4R0OqqygxISuJbOAKbu80bTIDm7yKlpB/HMYXa1z94jjfhHSk7
 DfdTZ/CV+1TIYTyrPNVOAAGiqu207MBdjUqyhP3wWXVU8NaOfYZFdsI77fTCVihYsS9b
 ZslrJ3NsLR1SnC6wfdADYXanvW/E7ZUcqEbmT9QSZ8HX9kWfqZYoAtFQuRmEA5A11uId
 gdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PRRlE08tRQGUC/ML6AzImHY04yPHs+qeigbIK6/ghCA=;
 b=Fgt9CYg/j25Cw9zwUs22JSAJfODjn93z3Le6PaN5cJUwmVRhkkMrp+iefGQ/ysdxHq
 DMc4jLISboDQA/5FOFAmdI9Nr+Y+adKNXMc5j5YUHIRkKHZeBZmzIP/ywJkeT+vrs9P8
 U4AcLG6zCfbIw3/TmIFzBiHh8ocLfuNHaEXFS6BmP4NbSJ9tJCiwLJpW14ZvqDqSmaJz
 JH5l6gsjHYxCI00SJeBrtfAoFgMPHtJvEvYQGh9MOL4u7TdT9Y4lqxXIu3lMwnfQiOUN
 gxGMbh8LnDrYhVOaN6UawdH2ZHFrRXRqMtuNAaU6/b0utDFAOcY6SdzOjheUJyyz+vxv
 hCrQ==
X-Gm-Message-State: AOAM531qtTj7RzWzEaxm5JOswhlECOfbxjvwUnIzIMi/ImlMJ/Wf49WI
 IfP+u8cs6ntnOYKchQgIQNe80Q==
X-Google-Smtp-Source: ABdhPJxLH6ATKCV5pwDXNkHsZfhkl8m3cSUMOoFFfS0pKDKjPYh+aUzBCxMsy2pZgtNiipr6geA0jQ==
X-Received: by 2002:a05:6830:8:: with SMTP id c8mr407528otp.115.1640044881961; 
 Mon, 20 Dec 2021 16:01:21 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x16sm2181504otq.47.2021.12.20.16.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 16:01:21 -0800 (PST)
Date: Mon, 20 Dec 2021 16:02:30 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dp: Only create debugfs for PRIMARY minor
Message-ID: <YcEZljENYJQAk9We@ripper>
References: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
 <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 20 Dec 15:53 PST 2021, Dmitry Baryshkov wrote:

> On Fri, 17 Dec 2021 at 03:19, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> > of the files created are unrelated to the minor, so there's no reason to
> > present them per minor.
> > The exception to this is the DisplayPort code, which ends up invoking
> > dp_debug_get() for each minor, each time associate the allocated object
> > with dp->debug.
> >
> > As such dp_debug will create debugfs files in both the PRIMARY and the
> > RENDER minor's debugfs directory, but only the last reference will be
> > remembered.
> >
> > The only use of this reference today is in the cleanup path in
> > dp_display_deinit_sub_modules() and the dp_debug_private object does
> > outlive the debugfs entries in either case, so there doesn't seem to be
> > any adverse effects of this, but per the code the current behavior is
> > unexpected, so change it to only create debugfs files for the PRIMARY
> > minor.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()
> >
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 2ee70072a1b4..a54f7d373f14 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> >         if (!p)
> >                 return -EINVAL;
> >
> > +       /* Only create one set of debugfs per DP instance */
> 
> The comment is misleading. Could you please fix it?
> 

I agree, and as Abhinav pointed out I didn't update $subject fully
either.

Will resubmit.

Regards,
Bjorn

> > +       if (minor->type != DRM_MINOR_PRIMARY)
> > +               return 0;
> > +
> >         dev = dpu_kms->dev;
> >         priv = dev->dev_private;
> >
> > --
> > 2.33.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
