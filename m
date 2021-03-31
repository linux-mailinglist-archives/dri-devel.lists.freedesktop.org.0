Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFEA350AFB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 01:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455426EBAC;
	Wed, 31 Mar 2021 23:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D306EBAC
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 23:46:35 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id y2so247824qtw.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
 b=ctaBO5zR13LihBuEeHxc8Iu/QFRibysNpeKgX+kU2t+ibrAopqUh/O3Z5zJhzEYOLi
 WkpMisFcmDpdNyg8MIyTPoesZeAvkb7fNH+pnt2wcMh/PTFD+96gEIOvrHu7FMUWUjlK
 341Ow9vIocW+ba+vnYCmMKd3WL/8koWnxkGLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
 b=nTfSxnRbi19AF4ZeB9znkPkVmcQKAyph5+zsANKDZlqTC3WteIotHlYiHd3jIZGKEU
 9Fi7AHfAe5+msmIvTqlLPdIivhwt12xdQAGfZXzQrEge1734scSEK/TTcgUUKudI317t
 7j0SelKdwIURIKXgZ6rddupcPx5d9l85RKDnmBf7nBWw3jpEDe9Cbxh/jWvJ1pymYOWw
 FWRJNo71XdGw0fxm+HgeUSqpzBVFcp22V4WyNwm5s8UlTcnlf9SlUEeHvuuY2Jw6+uLB
 h7EtxEw0nhaIqr2P90Gw+vFldEzbY4l5sKS7MoyHu0RkCGiSj0eHcCIfHt6PNXphWLF9
 hMOw==
X-Gm-Message-State: AOAM530C1JuhEgDBdMsLfHGAYZf08sUVDN4BtY0dZpLFPGl6RreszUid
 3Ad72IooGXUtLVdP+JaMOBUohoTruvXiag==
X-Google-Smtp-Source: ABdhPJwh/Waytj21HEzGjLFhfeREXmMHlNBokCOiAmL5aYu2n/PHCCt0eJZFmQaTdkiC6XG+URtnQQ==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr4768969qte.301.1617234394458; 
 Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id g186sm2835106qke.0.2021.03.31.16.46.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id a143so23014893ybg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr8176109yba.276.1617234393416; 
 Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-2-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:46:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: Remove unused freed llist node
To: Rob Clark <robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Unused since c951a9b284b907604759628d273901064c60d09f

Not terribly important, but checkpatch always yells at me when I don't
reference commits by saying:

commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
