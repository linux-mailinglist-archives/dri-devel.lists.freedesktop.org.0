Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21674F64CC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2062410E070;
	Wed,  6 Apr 2022 16:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B198110E070;
 Wed,  6 Apr 2022 16:23:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q19so4023568wrc.6;
 Wed, 06 Apr 2022 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9a2BqBVokvTsgXQbtymYfO3sWscM/hLjb0STJ5+gfo=;
 b=ZLBha3ufL0jqhFoZzUzSgpHsnHd6DM/HSKIHl7RHPuuFY1C1cWUqC0PfmMqS7DfunJ
 Dky80ByJLgonPzNihsl2DXLyMlG2HbrxCQsQtCbp92JDX62+0uWXZ/XEN2OUXX5L8okT
 l+3ZdiwM34ISMZtglwh0Nr/0cU6YMcyjlAOt1fK307cGVY5BMZwtRE/R3iw6kGLLhlYm
 qSxsiaAwSPmtRYrHmrhSi3H7OUENgEptGKC9vdm2kyX8NrGkbQIIS+4IwvDduTDGpdoQ
 DigItKzsvp5rE9c8Y9TXEe0Y/CHcbfPrSzNP3deLbKRmbTIW88KJDJJTXX10Ss517V8d
 iw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9a2BqBVokvTsgXQbtymYfO3sWscM/hLjb0STJ5+gfo=;
 b=YfGExkj1wR+QFfL0KKn2e7mLXLfm/WxAD2yo1lh4PLIFeDj50g/u+ZcPnzNUveWoiL
 iHKGo8efEL4DE+UfZh5FNgDFeLUddsLFqB/IaaqVydPkBRtZc99ABhg550Q9PiBjpSEg
 GsruKXKTQD7ZqrRF6v9yzgTJDG3qOCAw1VKGj5j66tQtqvahBgxSHpYeg4BUW3jXLdmv
 Ys9kpJAVN6WXmn4PSPAHytFaZ+mn5ZFZT7P3vMz59H/erRXyIR1Ef6qQ/vks0nUb31yz
 /QNoz/+rTEqCbKVj76laRw7TMp12R1iClASdR673nLaTHealYrr1iIBk+82CVi+nArcs
 Bfhg==
X-Gm-Message-State: AOAM530V4a6AdTlxfAVfPoYdBR+8TXjxCfw9nwAcqVC0bib9xGpZjInr
 xp5Npz0Ol0RthXSL35l5whVNh4ronnrMiKZGN2A=
X-Google-Smtp-Source: ABdhPJxXoRbU0Fimgs0YJrKVL8vfK3EP/15SjU89Ap7jwE5IFgghAQow9fzCF+kzSvUWRMEQeGazbnjQquNqIPBJoxo=
X-Received: by 2002:adf:9111:0:b0:206:c9b:ce0d with SMTP id
 j17-20020adf9111000000b002060c9bce0dmr7345582wrj.418.1649262207917; Wed, 06
 Apr 2022 09:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
In-Reply-To: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Apr 2022 09:24:22 -0700
Message-ID: <CAF6AEGu+Sg79Sn=t=-3b9ZbDanN7KeSzUX+-rchd8SY+b+sUsg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: check the return of kzalloc()
To: xkernel.wang@foxmail.com
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 1:37 AM <xkernel.wang@foxmail.com> wrote:
>
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
>
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check it to
> prevent potential wrong memory access.
>
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69af..5f914cc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -90,15 +90,18 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>                 __drm_atomic_helper_plane_destroy_state(plane->state);
>
>         kfree(to_mdp5_plane_state(plane->state));
> -       mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +       plane->state = NULL;

At this point, you could just:

    if (!mdp5_state)
       return;

BR,
-R

>
> -       if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> -               mdp5_state->base.zpos = STAGE_BASE;
> -       else
> -               mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
> -       mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
> +       mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +       if (mdp5_state) {
> +               if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +                       mdp5_state->base.zpos = STAGE_BASE;
> +               else
> +                       mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
> +               mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
>
> -       __drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
> +               __drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
> +       }
>  }
>
>  static struct drm_plane_state *
> --
