Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3566215D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBCE10E38D;
	Mon,  9 Jan 2023 09:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A56110E38D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:22:54 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-4a263c4ddbaso105927007b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AHuKxKGiZd4+RCaj+Vge0k5qlq7ILtvQRLFdU3PXM68=;
 b=aqnQr+w/cnvm6qQo32nFgvHm7mAD/6PZy5zTDke2X1ThQrMX9Y71SRXB2PQuKOq+Ch
 D8tK4/K5uMrDOhsxsmQq9Ykhmm7vSGO7IS3LrW6vmQhk7x6uxcjhW2oU3xVytZaSIn3A
 Dzlkubi0szkiPWBi0hcsdqtT3LlCaQUKg03vdBrW66ucICrTJqHCTp2dqmqXSJx73La9
 mFkExzjXdwjAzR7lITTiNoyOiO942Y6QXub8sgnX18UKNufUE2TLTgfS4B5eChlxjnmG
 NjKfzWlWLdOPPAZigfNUQjqwHa9BkXEjkcwCUFFc5t07GWolYlakWBa9X9ypwGap44mf
 eSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AHuKxKGiZd4+RCaj+Vge0k5qlq7ILtvQRLFdU3PXM68=;
 b=gGOjPy2HVX3phlI0AP2R42HspF1efdwctq5UvS/mmA/DwGOhZBNTBIkGJ4+AjivrMZ
 iNJLpYFMnQImKGh9zq+r30qCetBC4zw0sUdicpdmC3bHhD02EkoOxtRT+eWyMzaUXoXK
 5cotmZRDQsABSMJNTZzIlSNytRHq8neFDlhhMB6NtUGcTI+Gak1VFgnd+2xotpjdaAyA
 n1w6wP8cL+bOuLSuZhYhA9oy1r393G9q+AKIxuanyeno6yEKAPAf9+hcUSoKjCtV+ikb
 wyqd6WBJrayoZje9or2YEdC51XJs4urWswXNIouH/v0L6NA+me1Z6ERGHmGp8BIfPV4X
 0aQQ==
X-Gm-Message-State: AFqh2ko1yJjT6RlYXfBL+WkJkN5cAIsKpNC4gSfTeWKdET02t7B3eU88
 /lm84hCtBTEo0Ihw5kOkz+7YlcttwDwbk6IZuLohYEbBWMez5g==
X-Google-Smtp-Source: AMrXdXt5UN1RutCZmrib8fF4cHaCArti0sLkNxLMJeoqmMJy3AztKyKrFV9yJgZB8ncMa7vxTjCN0W/DI7vHho/Hn6E=
X-Received: by 2002:a81:c56:0:b0:490:89c3:21b0 with SMTP id
 83-20020a810c56000000b0049089c321b0mr5440340ywm.132.1673256173194; Mon, 09
 Jan 2023 01:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
In-Reply-To: <20230109083417.5drdfllpm4ythy42@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Jan 2023 11:22:42 +0200
Message-ID: <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 10:34, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
> > Different entries into the catalog were added quite randomly. Enforce
> > the sorting order of some kind. It is not alphabetic to prevent the
> > patch from growing uncontrollably.
>
> Why not sort these chronologically based on DPU hardware revision in the
> match table at the end of this file?

If we keep the SoC name as part of the symbolic name, we will end up
in another semi-random order that is a pain to verify. Would you
remember that sm6350 comes between sm6115 and qcm2290? I would not :-(
And changing all names to dpu_6_5_0_lms would make it easy to add but
nearly impossible to follow.

> Regardless, this patch is going to
> make it hard to properly rebase DPU additions; see for example patch 4/8
> and 5/8 in my second round of DSC fixes.

Yes, quite unfortunate. As I wrote, it's already late to apply this patch :-(

>
> At the same time we should find a solution to the wishy-washy reuse of
> structs and defines, which may appear the same initially but become
> mismatched as more features are added (see how I had to split out
> multiple of these in the INTF TE enablement series).

It's a slightly different problem, but yes, I share the pain.

>
> > Thus SDM comes before SC and SM
> > platforms and QCM is kept as the last one. There are no functional
> > changes in this patch.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Yes, I hate such mass-moves too. However the entries in this file are
> > slowly becoming uncontrollable. Let's enforce some order now (while it's
> > late already, but not _that_ late).
>
> I agree that something should happen, contributing to this file is
> unnecessarily tough.

In the IRC conversation Rob suggested playing with includes, but I
don't see a good way to implement that.


--
With best wishes
Dmitry
