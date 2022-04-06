Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FDA4F56DC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F044E10F42B;
	Wed,  6 Apr 2022 07:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702E710F42B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:40:04 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y10so1731851pfa.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QYq8NuVe9FN1D3vwLDp5oNe5+OPIXHbOpbj0ZnKIIo=;
 b=I0WUDB/A3XT+HHA+8xdWDIxHNPYG1oNh9YCaF3Z6OGT7ASDzbHM55p2/UUQDrZEgQa
 EMani0C9pII6a6RDj7NeJT9y/yuOtT/8kLbCKQHHwGqfbiAF073eLiaBiHjtaVfN0x5q
 bNvRDkc9MUhQb1nl+7JnuQZvAJU/fjiPy3ZEgPk2QaQg8cEPBfcT9k5yWjJ3imKGPJrR
 yFL50pYQzWgkfTIm4DEN5nVsrvoTtqwKJhAgODeDLyCdd2zzb/o5bLgbK89e2IdVjnnT
 HLIAI1TtCXYJMp7K8PxT8KQhoRtzpDtreaYfYLMEbhuMxg3Jq0K2MffRYK+F4ZCWNV7i
 eZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QYq8NuVe9FN1D3vwLDp5oNe5+OPIXHbOpbj0ZnKIIo=;
 b=UDw+gYw9+rhtvaIidlnih5TXRlYEDxUiWlZv38ttwPyuW0JgFqPA0JbiaHS+pI+dhP
 pnV7jTA3pIW+N6/8sgu8ObSBXLMQ7Q0+hKajrIVUhOMzwFBl68mByzEg2xLfDMnpf7FA
 HddHjbHCzdY6bhEXBvSIzLK4ZLYSkdWFnqCGgTCCfm9TJDjo4bE4+2lTjsx8hnbZf5ms
 SP6qaBX13pmN0RHCXr+bnn6ufr3NakE1cqOaPKRx65nbQ9CHc2vaw3mk4BTXZm4ntqMH
 NGM28g0cMjikKG9ncLyJ6NrpTwBTUYbGqx1Bo2b4FpPHz7/YGDLxr7e+VxG4gP/Ri5ip
 wxZA==
X-Gm-Message-State: AOAM5336DJR7mjzEnAY1J+N0ycVdERUxJzyPKYLz6+4G1OcMi9KWYl1Z
 OuNqlHB/nF97eatLpeCdFwq8RW5ZvgmOo9Lqv+U=
X-Google-Smtp-Source: ABdhPJyCF7VtDld/Bk1zsR0RI1ioU48r8W3y5GNMOO89Tl7mj4ykPWLwgQlMOtVnjrpXkiRt/uw7CM0Ijf43uSZoHFs=
X-Received: by 2002:a63:4f46:0:b0:382:56b2:f8 with SMTP id
 p6-20020a634f46000000b0038256b200f8mr6098889pgl.90.1649230803905; 
 Wed, 06 Apr 2022 00:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220401115018.9335-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220401115018.9335-1-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 6 Apr 2022 09:39:52 +0200
Message-ID: <CAMeQTsaPve23sNNm0Xkg9=8kqeN0SQp056Xyiva4pe2B7K37RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: fix a missing break in psb_intel_crtc_mode_set
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 1:50 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete.
> when found the entry, add a break after the switch statement.
>
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Thanks for the patch
Applied to drm-misc-next

> ---
>  drivers/gpu/drm/gma500/psb_intel_display.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
> index dc467996cce4..9a5ea06a1a8e 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_display.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_display.c
> @@ -135,6 +135,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
>                         is_tv = true;
>                         break;
>                 }
> +
> +               break;
>         }
>         drm_connector_list_iter_end(&conn_iter);
>
> --
> 2.17.1
>
