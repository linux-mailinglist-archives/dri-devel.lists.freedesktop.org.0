Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC57176644
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E396E850;
	Mon,  2 Mar 2020 21:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345B46E851;
 Mon,  2 Mar 2020 21:44:08 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a141so702799wme.2;
 Mon, 02 Mar 2020 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrJTCSNcxXBv5AjgrAAq+GU2eRV/Oq/u5bkyvGbgT7U=;
 b=Uza2nYPbbtdkm1XtG1ZlBqbh88mGs/G7xD9vuJtoccvbx++YOkNhBGqCKV8A++aKQV
 hLGEH6OLPItsFT64YE4rS7+poMcjijIidwyFjAMqacAZU+NQP9MROhoRiHpCU0o335fx
 zkGf1gz5X2TnlAfBtnIfU3pRvt0l5F/kFZYq1BuQFY3MSHguZ4hBS+EaLHjOsqjFX6+S
 JwmuH/cyz9Sc2/+QhP1iYvJKo313SQf7lFiEd6cxRPrUD0vTXnouJpEcX+2OUKRoduoL
 JvfgucUgBp6931KQZq0DpIbwZiAt/Oj2DISndc180eioA2ui3/zTQuLbXCNHDettjGGX
 wDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrJTCSNcxXBv5AjgrAAq+GU2eRV/Oq/u5bkyvGbgT7U=;
 b=pbyXMUS1F+XCF+sFgfI9AAd3nOdAY5FDMQAs1GmHSCS+WtQ8IlPqDR1EtHIAzbC/BN
 QBD/fTxQUavzSbgnUJIFrk4xgG/R549vxmNi8lHmtFIB2r640fgsDpbp/DJQCi5SF/mX
 +eAyomOWeYVd67vssmbqfm9xgCWEoPnD/n5TPIdPhmjT/I8ky0lqBBqnyxce3my74dnu
 WYZp6FwM0dEqr2cn/JAlGjMv0DOEb+2Z6uwd7E7vWf7tgDdzopDG1KU3PGG6NRsVPshF
 EociACP9WlUWSt9uZtHIgMtx22qY05P1d9ilawcCOhnMmabm+mYBtx/9zlNTqA6igf1I
 aQUA==
X-Gm-Message-State: ANhLgQ2AoeGU+A4VnZD8d6KSTrk9JIPdve0TsBOX2SyzjIO/oYKyN7g+
 47AoBmJKN/npCph0Bq+vPCjojvPgIvSDt/4JB0M=
X-Google-Smtp-Source: ADFU+vvT51rjJfngvusWKrdls1cOVu9XWxKZKDAtSPfECTeXUgbny4fNyTDWDs/kmXhCTSmllFGCjj8ZN+ckXRcFUY4=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr409291wmj.70.1583185446850;
 Mon, 02 Mar 2020 13:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-9-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-9-pankaj.laxminarayan.bharadiya@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Mar 2020 16:43:55 -0500
Message-ID: <CADnq5_OhSObA9P3gYCRJX-tRAWR5MxeHqwp-6Q-uB4zN1cSt7Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/fb-helper: Remove drm_fb_helper add, add_all and
 remove connector functions
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 8:09 AM Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> drm_fb_helper_single_add_all_connectors(), drm_fb_helper_add_one_connector()
> and drm_fb_helper_remove_one_connector() doesn't keep an array of
> connectors anymore and are just dummy. Now we have no callers to these
> functions hence remove them.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  include/drm/drm_fb_helper.h | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 62e8dda6d1d1..208dbf87afa3 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -451,27 +451,6 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
>
>  #endif
>
> -/* TODO: There's a todo entry to remove these three */
> -static inline int
> -drm_fb_helper_single_add_all_connectors(struct drm_fb_helper *fb_helper)
> -{
> -       return 0;
> -}
> -
> -static inline int
> -drm_fb_helper_add_one_connector(struct drm_fb_helper *fb_helper,
> -                               struct drm_connector *connector)
> -{
> -       return 0;
> -}
> -
> -static inline int
> -drm_fb_helper_remove_one_connector(struct drm_fb_helper *fb_helper,
> -                                  struct drm_connector *connector)
> -{
> -       return 0;
> -}
> -
>  /**
>   * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
>   * @a: memory range, users of which are to be removed
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
