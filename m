Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7056B55D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCB410F265;
	Fri,  8 Jul 2022 09:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73710F263
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:27:06 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id j65so3451202vsc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gi1JwXC3MIMG9U5AHqGo950+JqSX7ck4/tnvnorOAjA=;
 b=DqIP6KD9aC3pp2l2VCWpMeso4JObp3kU2qTCde5vyWKFZD64h1hb7SWKVnq1/xjRSG
 2GM8J1Oe6SME6ZiHLey/GBB++h5/WjNLQKRqFmRH890Dvb5Ic/hLtdCokIKfcMjq6gT7
 Mimb6T7foHgNkZkHgyA0+hw5QiZPRboO6JZsIcvhPZTBfi8FCf/JfRuPByhbWFuX1X+K
 VcmVBHBNE2n1Jc54FJVtrVOIOYFDvIJNDleBoTP8Wyvm02u/y7yOiBzYxkcZMiypASij
 urvJYMrCudMt9K2UoqiI22G2cCU8aV87sbcdabPf07CGdfXADJWy0h4ETOUMDM5W1cf1
 vTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gi1JwXC3MIMG9U5AHqGo950+JqSX7ck4/tnvnorOAjA=;
 b=B3Z/1KixDxCZYwHBUihXMAliJkOktfJM565IjsEGESj780aeX5kFBaUFLO/3tOqeCq
 uoftdyEEooAsKLuWNp5bmd4/5s4zDopFklI53+THK48kTwctc3i0oRKWFSvAhNIgxr1q
 Ebr/CvA2TQ/fy4wXKB5bC0VQ22/HxbKzsnpH7HjUMp2yYJ9sYTDXt75AdkitLWMPYEwS
 UrIz1DjXdB3YwKUISIHaAGdazu3AZNgLgvAeWHgGVSCzL/eFZ7d2kSjwjUOTotzRqMJD
 5T1YWQjjcJw9g76I3jmnAUtlHPeNHX2sXNevYz44mG5tm2Nt6nToh24abgT4Uw5IjFNo
 hclw==
X-Gm-Message-State: AJIora/mJke0GefVJvQoosFQpwx/NjM5iXMmggnIvU4xrEXJl8ykca+i
 Vkb6PYk/0xVf3oWLlSvXxs3Ujf+JawBb2z49TLc=
X-Google-Smtp-Source: AGRyM1s14/cFsPuXiRK3hQj9XWflQtW5Z4wvDdpSJMHJ4JxJzLze9zuZ5K10aiLoMTcySd/KGM3Jer2SsSL4QAopKD4=
X-Received: by 2002:a05:6102:38c7:b0:356:4e2f:ae5b with SMTP id
 k7-20020a05610238c700b003564e2fae5bmr907667vst.71.1657272365781; Fri, 08 Jul
 2022 02:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707025035.307733-1-windhl@126.com>
In-Reply-To: <20220707025035.307733-1-windhl@126.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 8 Jul 2022 17:25:28 +0800
Message-ID: <CAAfSe-siw2Ekzj_OckFJGOG1LD=ZXjhaK0cGO+hW0AizKUo1Zw@mail.gmail.com>
Subject: Re: [PATCH] drm/sprd: Remove of_node_put() in sprd_crtc_init()
To: Liang He <windhl@126.com>, tang pengchuan <kevin3.tang@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Kevin

On Thu, 7 Jul 2022 at 11:25, Liang He <windhl@126.com> wrote:
>
> As the new reference created in 'dpu->base.port' will be escaped out,
> we need not to call of_node_put() again.
>
> Fixes: b07bcf34b6c9 ("drm/sprd: add Unisoc's drm display controller driver")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index 1637203ea103..e1b70f989da5 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -741,7 +741,6 @@ static struct sprd_dpu *sprd_crtc_init(struct drm_device *drm,
>                 return ERR_PTR(-EINVAL);
>         }
>         dpu->base.port = port;
> -       of_node_put(port);
>
>         return dpu;
>  }
> --
> 2.25.1
>
