Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613A41655D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 20:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B436EDA0;
	Thu, 23 Sep 2021 18:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A096EDA0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 18:49:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so9826464otb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEVSoED89L+93fTFB4h7M+aIra9UfcQ1QZ1HXQO6E3s=;
 b=hyY3N+qsYVzHDnPQ/Y6IH421rMhPttp4IvG7pRJtsykMx1jisj7cT2OEncYw98fPsW
 6a4/dYyF8nlWA1tDC4fBZ/5IQ8CceIaGbJkf+GO+0F5zae0mDVHplEySt17h+ZvuOLxN
 SqYNlvF7l3CcquELwRzXjh7gcfhdaw/rVu8iwnJhOPVtktPtR83KdbIGsU3LVKGZNWYX
 4xImzNo7c+xeKcTEHRTq99LjQUf1DmEu7hUE3lfZSA2vx7uNsPg/wE91RuSiY+oqZ7qd
 tQitUvWzRMJmR+JnrFG83M5deJKoKectth5BpgNavYIqa1pY2VT/s+qDlED2tP9HD/SN
 eFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEVSoED89L+93fTFB4h7M+aIra9UfcQ1QZ1HXQO6E3s=;
 b=W97pDFDR5236lYN9dUl3heNTv7CrUDIorGd3N+D/uk3Z63POpDCsubUiOhVwqfZUfs
 4SGYJIiJ319Gozvdyapj19ygaDB0BLCUYUoDUyy5IwtSMYsj1SPEZ7MPdH5VqCoAiW1Y
 CA/W2zXOUjb5RPT8o0Z1fea+mJ9UU/s5LP8TuUlhduRlRRJ6rjzFTnBYiPAhlZ8EGZu1
 AQ6KcKZNVoURfF5bbPRuiWq3zt7LUbyRLibquZ50g7Cl2vFHcbz65Atory4an21VhBzw
 Cx7lyFpSvxzIOJGn8KgXY1SP7GaoL0XmVzNILuOsVZrekUNY/XfCW2iS3wdEyH9Xvu+B
 4o2w==
X-Gm-Message-State: AOAM531btgZrdgVxRE6n2iNhRRqnws5n9ZSTPIs5TQtOOi3g63aqCwpP
 99RLIl9S+E9lW0kgIfsvUVf5r5NHQrbxGZiXdMM=
X-Google-Smtp-Source: ABdhPJz5HmIauqj/z1/iNILqdzOJEuuCFY4lqleb+h5oGW94d+sdxyzGS0sq9xVC3x4Wdv4NY1r2jEy687pviT/20hM=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr165983otu.299.1632422983502; 
 Thu, 23 Sep 2021 11:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <YUhseVXMsTJKAqF6@legolas.home.lovergine.com>
In-Reply-To: <YUhseVXMsTJKAqF6@legolas.home.lovergine.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Sep 2021 14:49:32 -0400
Message-ID: <CADnq5_NUyyVEMNdzKkjeV8mg4rRiODE6=EJ4iY_qkGZJe+J3dw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: This patch fixes colour banding caused by wrong
 information passed by the Lenovo Thinkpad L540 panel.
To: Francesco Paolo Lovergine <frankie@debian.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 23, 2021 at 2:15 PM Francesco Paolo Lovergine
<frankie@debian.org> wrote:
>
> Hi,

The patch title is a little long.  How about something like:

drm: fix colour banding on Lenovo Thinkpad L540 panel

>
> there is an issue with Lenovo Thinkpad L540 very similar to those described here:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1749420 or here:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1788308
> that is a bad looking color banding with dark colors mainly.
> It happens with any kernel starting from 4.8 up to the current.

Bugs should be referenced like:
Bug: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1749420
Bug: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1788308

Otherwise looks good to me.

Alex

>
> Signed-off-by: Francesco Paolo Lovergine <frankie@debian.org>
> ---
>  drivers/gpu/drm/drm_edid.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..48e06cc33e4d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -141,6 +141,9 @@ static const struct edid_quirk {
>         /* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
>         { "LGD", 764, EDID_QUIRK_FORCE_10BPC },
>
> +       /* LGD panel of Lenovo L540 reports 8 bpc, but is a 6 bpc panel */
> +       { "LGD", 0x038e, EDID_QUIRK_FORCE_6BPC },
> +
>         /* LG Philips LCD LP154W01-A5 */
>         { "LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
>         { "LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
> --
> 2.30.2
>
>
> --
> Francesco P. Lovergine
