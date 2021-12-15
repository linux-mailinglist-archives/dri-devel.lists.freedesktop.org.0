Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554A4763DD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C16510E992;
	Wed, 15 Dec 2021 21:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318E310F8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:00:20 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id kl7so4615511qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
 b=a/2+RNh3pK+JrLvCLpck3va3w4anjHVD0+0YBAgFvx8f2pAlohe0DcYchXO9SeXduM
 ev1+igfhnC6x4YhWjDMGmuLh45hjB3t5WR7S5uNyqf/gp0/EVh6KIGTD0CENNM5jyJj8
 CV9es3d6MQ3P9Ln9sR+KpdMPQ7S0yAnsg+MkPDu1W9lj3HSyl2BEo+KGyZzHaDB5BNe2
 aiQCxXVql3d+TKeaQRVpGtf+vXsvSRDl9DWMyaxJl0/2AH7WXwA/izqqp3i9n+6q1ItK
 8Sc2AowhtYP0aQTBi2jSZeeVWqe0mt4/+BF1919vlm2R0SmdjDS4KQrO5GbgdSdkSRJc
 c6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Igym6TOcUBNiC180+8CB1mq81TOoAiCxf/Elmklo1Gw=;
 b=iCAi/bhzehBVfKcegfCMTY8dDZM7e4Askd0xKS+h3rsxneqqKdn1CnupRq//kvQyy4
 LZAmgpLhK9PgLQcqj7uqpXXxjNgW/AGKjJt/jvKmkuLwsdHX3IUj3NQ+88gQVWyZ106+
 qx5lI+BY39NJor30lSL+ElmYRkS+y3tMD+HaHgZz79ipxob1oE3zs6diwAVHbyjo+Hz5
 NUMFWiaUYKu9SS/yW8/X5OqHy4O7moiwjG13Gj6RWcuaSe9dhTkZ5WTa3xxwLPD4V4V1
 sn72d//GagkhGbhNjzpaxVy0xI3LplugZFd9BhY47JS6tBhyFJzFBe3RupTG/0QcZmkA
 OJ6A==
X-Gm-Message-State: AOAM532cJh/4ub1E1aNc8yPBfzhm77xd2i4s49T88YxGmnICZLlgS1at
 XjDDqyBUpri9F6fwxZv+AxvIMbcbjvoilofG3awH9Q==
X-Google-Smtp-Source: ABdhPJyDhI9R3Txh4WJoBPNSh6gRhD71ZHtF2dgljmcfj5zlKeDw7UcLIm7GxAe+s2Lh+pPgnrjAChNfcxXxo5CYtSQ=
X-Received: by 2002:a05:6214:83:: with SMTP id
 n3mr13069392qvr.122.1639602019162; 
 Wed, 15 Dec 2021 13:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-2-robdclark@gmail.com>
 <CAA8EJpri+3AjazR2saJaa3Uo05BhC_2gEsRXHJ5wJ81zs5AUTw@mail.gmail.com>
 <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsZmQR8FvAN5GrDT9psBsNwFL5mWRZq+i0rFcC8Zf09fQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Dec 2021 00:00:08 +0300
Message-ID: <CAA8EJpp-PurZt4_EEbZS3Xnqc9tZgBxW2p6j+k20ZUZ8NqZ2=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm/disp: Tweak display snapshot to match gpu
 snapshot
To: Rob Clark <robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Dec 15, 2021 at 11:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add UTS_RELEASE and show timestamp the same way for consistency.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 4 ++--
> > >  drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 9 ++++++---
> > >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > We should pull this out of disp/, it's no longer disp-specific.
>
> Or possibly just move dsi/etc into disp?  It is disp specific in the
> sense that dumping GPU state works quite differently..

Not sure about this.  dsi/hdmi/dp seem to be perfect top-level
entities. I see your point here, however I'd rather prefer to move
mdp4/mdp5/dpu1 out of disp subdir rather than pushing all non-GPU code
into disp/

When I tried to move dsi/phy to a separate phy driver, I reworked
msm_disp_snapshot by splitting some parts into lib/ code. But I can
not say that I completely liked what I did. Partially it was one of
the reasons for me not pushing the dsi/phy patchset past RFC.

-- 
With best wishes
Dmitry
