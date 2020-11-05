Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAA2A870B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0C6EDE1;
	Thu,  5 Nov 2020 19:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A106EDE1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:25:23 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o23so3319154ejn.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OwZ2JsmCSkMKjAN1GFjRMTzrmgufxcuqIpH+OrOIOI=;
 b=0W65vgENvrNSGrqthq2T7Ype2HAJWjbYFQSGwd3qd71+udUCou0GWfY3/4Uq3OroVo
 /n03vB0eGQoDmgnjQavMzz/bvXNvDsYOZw4QP0A/mTrdN+eSZVKkuiO9hfliZxr46bKn
 J8wI5ax2F+9MuJpgGwBWCtHWT21XQxj1WfnsOtAKBjaBBKO/71Tyo01mYi6hB9JqPtVp
 CrzN5A0dUtcVYXZ60FQNEgFPH/sWupNADoX4WcGmBuoYowZn81BynWLpJ1l14pzTskEC
 BWm2CVU9tsUUuCMeJRAx6aQ9CTni8TcIZkhrM+GuRn1r1KigyTrCBSdKXwG+vIWA3zHv
 RXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OwZ2JsmCSkMKjAN1GFjRMTzrmgufxcuqIpH+OrOIOI=;
 b=cCByzDx1tzw15lV/dBG6YicUcNDFreUYi13V9U2SZM1uYQOucp+0oUW+6tBjX0Lq5Q
 Yu/dicRaDYPVm18lxO5tpt6MNBxuMbP2VAPMmqwW3FH7QQL8eEkcv7z/U3VU4JAvNLpD
 cy5qLTSoxe90zF1ugEvMdDSMI0JW48k7AUSwV8Ve8NK1sxC9rBH1z8EhEIR9jCHjkCmv
 1TnsJVu9evbv6RNHRNeG85Yg5Vt+WUvayziU9HdZlMX+kw8NzQF+h1wnhnvMR0DnHPrT
 AWLDF1UfrXpQeRWyd5kAh/ITrD4MNeAOMqawvaCRgFpaBppvscRCNZnhNcRY46sfvb9K
 TqUQ==
X-Gm-Message-State: AOAM531POWfHKE/CpAJV1PkRe+IReUQbcpHTzVDftCn6q47+y6fz6Kal
 HCcHbx4ysTS6WdfJnW4OGjk4IGTBJKuWsrk05LevQA==
X-Google-Smtp-Source: ABdhPJzSFC7kYLWoVFEIQkU3bshpXWTc39sJVr22lchV4Hz+pC/99bCAaKFgEDSQe1h1j9QNs6Ruix54aAhWhfIC5z4=
X-Received: by 2002:a17:906:1a0b:: with SMTP id
 i11mr4041808ejf.404.1604604322422; 
 Thu, 05 Nov 2020 11:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105181613.GA42968@localhost>
In-Reply-To: <20201105181613.GA42968@localhost>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 5 Nov 2020 11:25:11 -0800
Message-ID: <CADaigPWV+x=6x_vso1Eb7ZEdmevpjgdGWO-epq-S6gJ3J1-sSA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: replace idr_init() by idr_init_base()
To: Deepak R Varma <mh12gx2825@gmail.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 5, 2020 at 10:25 AM Deepak R Varma <mh12gx2825@gmail.com> wrote:
>
> idr_init() uses base 0 which is an invalid identifier for this driver.
> The idr_alloc for this driver uses VC4_PERFMONID_MIN as start value for
> ID range and it is #defined to 1. The new function idr_init_base allows
> IDR to set the ID lookup from base 1. This avoids all lookups that
> otherwise starts from 0 since 0 is always unused / available.
>
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
>
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> index f4aa75efd16b..7d40f421d922 100644
> --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> @@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
>  void vc4_perfmon_open_file(struct vc4_file *vc4file)
>  {
>         mutex_init(&vc4file->perfmon.lock);
> -       idr_init(&vc4file->perfmon.idr);
> +       idr_init_base(&vc4file->perfmon.idr, 1);
>  }

Sounds like you should use VC4_PERFMONID_MIN instead of a magic 1 here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
