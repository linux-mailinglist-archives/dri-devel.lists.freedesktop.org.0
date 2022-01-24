Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95919497DAE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 12:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215310E877;
	Mon, 24 Jan 2022 11:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BBE10E849
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:15:50 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id v5so4158289qto.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 03:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cUptRqDtEkkJPAHl0ynJV1wbRGCqMae2UeMqdj24E40=;
 b=ozD9KbWWkge+fKJkJPYI849+fGP9YlVD9EGKkwKfFJs7KuCKLN9oh6rahrLp7L2k5J
 KDSyAUzqF8GF2GW04tu1Hvym3Hcbje7xnixhm3IbxqsiOuHPeTY3EBrQgEjjvVmBG4HN
 10rduo9r8r6zECj4k1CJ6nkaadOR3z0eBv3goQO2moqdTj6ZM+CokAge1jxTsHrHYxxF
 NdiPGHlDNSjlb5sHkrvwHt/lUSkrpScorOogg0j6o/MTGoCLnlU5WzQVGmP8pNQtAxI1
 52jbapRmZNnsvTAgw9j5/k9xyKkLUcVUsPZ+MpkbPdqBOlG6EzbW7yjPvFI8J3k9VFp3
 R7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cUptRqDtEkkJPAHl0ynJV1wbRGCqMae2UeMqdj24E40=;
 b=dEyaCqKm55SZlDJotrQ8YooWfLtbRc/kUhIayNyXLM4e/nCSpTWxHTq0YAJhrjkE1D
 NN9duhO1fRd6rzNVcBoCvD0KBEwtAMurIuZgD8UEccj41TFu1ZCtxZIWsl46xndUIMl1
 /jG6HUINmRFgVW7Q9eaC/ukj4nHcEeNtNvd6r6a3DfFmnO8w9HM5u04HEZSDZas5mBJ2
 P3vxIZmAi+Mr2q5Xv0pr7VXBNweqOYOEBNW6mOxgSdhp729961xeFZMpHy4pu1kshmkW
 ML1ljUNNvj7IIh15f0KVDX6F40CGvF89XG7i30qwtl4ESz43lPQPh8AUg9kAD2vRang5
 8QKQ==
X-Gm-Message-State: AOAM532sBNVjXyLUAxgrwUImcy3DkgKyVTAMDd1CL6eH0+YlfRqIDXDA
 E3nW0AE6po+BOi+bBNXZttnOvVQrb6b61RvZFpBa5Q==
X-Google-Smtp-Source: ABdhPJwhOzuV07VQgBe5fQl8ymvUNqjpFobsJtXh++gWZGbvgvZckIMii1JjIezWZTFU2tWjY2riJOYrtiVV0UjUFbM=
X-Received: by 2002:a05:622a:241:: with SMTP id
 c1mr11853967qtx.295.1643022948878; 
 Mon, 24 Jan 2022 03:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
 <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
 <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
 <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
In-Reply-To: <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jan 2022 14:15:37 +0300
Message-ID: <CAA8EJprLvMhzN3DZ=JnV3C0TUmrE=3XPkf6dpuV-NQm-J3CeRg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022 at 23:44, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-20 23:37:45)
> > On Fri, 21 Jan 2022 at 07:30, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> > > > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > > > index 7b504617833a..5533c87c7158 100644
> > > > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > > > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> >
> > >
> > > > +       if (rc) {
> > > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> > > > +               return rc;
> > > > +       }
> > > > +
> > > > +       rc = of_clk_set_defaults(pdev->dev.of_node, false);
> > >
> > > Why is this needed?
> >
> > Both mdss and mdp devices use assigned-clocks properties, while not
> > being a clock provider (or a child of it).
> > So I assumed it should call the of_clk_set_defaults(node, false)
>
> A device node doesn't need to be a clk provider to call
> of_clk_set_defaults(). Does the call to of_clk_set_defaults() in
> drivers/base/platform.c cover this?

I'll check if it does.

>
> > Not to mention that this call exists in the msm_dss_parse_clock(),
> > which is being refactored/replaced.
> >
>
> Indeed it's already in the code.
>
> > >
> > > > +       if (rc) {
> > > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> > > > +               return rc;
> > > > +       }
> > > > +
> > > > +       *clocks = bulk;
> > > > +



-- 
With best wishes
Dmitry
