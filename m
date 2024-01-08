Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B394682781F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 20:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC610E2BA;
	Mon,  8 Jan 2024 19:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B1A10E2BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 19:08:03 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-dbdd013c68bso1258942276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 11:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704740882; x=1705345682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SM3aC6olapTfRcKgxOoQ7CTMu8MLMwnZq6KcPmvWqC0=;
 b=pn1twkdyd030BTdlsbYXqwdiP6maZ9uKmQarxbtjXpMLPjHiSA/5jaD78AWJ1UDA3r
 Ms1wh6noa0YyF1iWCOQTdmgKtLQ6E/0iprIeCUSfCz0LMONAV/kc9tm02whJVixVFavh
 w9zj3KawbZhtSywZxSYhstdN6ZlJocuLB78cNPdVJ9EbFQXhNbijPDoWmEoquCjapjp/
 l+sR758+MJzylJWUPKGZnhvpI/bntDrzr04HyDAsAgSTQPz9nWw/tNXtuYOnl4FhwAhK
 B9Wf3cxus45nj9WoXh7c9fHkMc6rSiwb4gzLiD6G6zo0qY+4NtG/9cFQKdd2EWHGZ6ZQ
 3dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704740882; x=1705345682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SM3aC6olapTfRcKgxOoQ7CTMu8MLMwnZq6KcPmvWqC0=;
 b=RhBWnlgDhJya9P2qptntZkZMYkbqjO0kGD7PZQfZp4lco7xJhEaUIVxyJJLRnEGYVV
 TP6yrkRAJQO0TAZwQetpSfMJ3eIU/TUV55TeoJWAWs1JHgRzP0mY+2i9CsUeTvoHn4ct
 gAxuBjIbh4XQX99N+/H8Ms/CE/4gYP/nVjqZotL/N8HbVyG9VUriqmQUlyQNfMIBIOv7
 N86/9zbmcl5SKV1XWfq82GBuhQmpnDY5iCa9B+0sPqtbiFK5l+C7cNb1p53HwMrua3av
 xAl1258BwU4+Sdixf2kXOVWP4edbH7S7fgFJ1zuETZ6+D+irB+WTjhQ4Km30btb0ioep
 nJPA==
X-Gm-Message-State: AOJu0Yy04aPcgUEVq2/VaaeSxXfOWETR1Uo2gGlAk3D37VdDWjQf2Zk9
 Uve9YI8C5Kh87aIiF1WdC9P61KqvLKcPohiTwRzFjUkAbXxu9A==
X-Google-Smtp-Source: AGHT+IFUDrKtN6+cLggfKBa01OY/UJnyibyg/gt78qguBxgUpnHsr3JF10cBom9sAGfl7XW03Vr81pUVakoZkhwEwFk=
X-Received: by 2002:a25:ce10:0:b0:dbd:d4ea:7b7 with SMTP id
 x16-20020a25ce10000000b00dbdd4ea07b7mr1916063ybe.60.1704740882574; Mon, 08
 Jan 2024 11:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org>
 <c8d6769b-eb28-337c-fa55-4dae86611da5@quicinc.com>
 <CAA8EJpoF3uKobGzjHbLMKYvcQbdqYzur7Mn1cNDPyc+wiiZ+SQ@mail.gmail.com>
 <9807bb4a-98d9-8f4b-b24d-0134f42f6cd3@quicinc.com>
In-Reply-To: <9807bb4a-98d9-8f4b-b24d-0134f42f6cd3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Jan 2024 21:07:51 +0200
Message-ID: <CAA8EJpqmkzOaewrW8tqSV5wz+0zovZx-kpMdVWp_nW_g1KrRzA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
To: Carl Vanderlip <quic_carlv@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Jan 2024 at 19:57, Carl Vanderlip <quic_carlv@quicinc.com> wrote:
>
>
>
> On 1/5/2024 4:38 PM, Dmitry Baryshkov wrote:
> > On Sat, 6 Jan 2024 at 02:04, Carl Vanderlip <quic_carlv@quicinc.com> wrote:
> >>
> >>
> >> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> >>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >>> index 50b65ffc24b1..ef57586fbeca 100644
> >>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>> @@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
> >>>        return 0;
> >>>    }
> >>>
> >>> +#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
> >>> +bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
> >>> +{
> >>> +     /* If just a single driver is enabled, use it no matter what */
> >>> +     return true;
> >>> +}
> >>
> >> This will cause both MDP/DPU probes to return -ENODEV, rather than
> >> select the enabled one.
> >
> > No. The code (e.g. for DPU) is:
> >
> >         if (!msm_disp_drv_should_bind(&pdev->dev, true))
> >                  return -ENODEV;
> >
> > So the driver returns -ENODEV if msm_disp_drv_should_bind() returns
> > false. Which is logical from the function name point of view.
> >
>
> but msm_disp_drv_should_bind() is returning true in the #if !REACHABLE()
> case?
>
> at minimum the comment is incorrect since returning true causes the
> driver to NOT be used.

No. Returning _false_ causes the driver to not be used.

-- 
With best wishes
Dmitry
