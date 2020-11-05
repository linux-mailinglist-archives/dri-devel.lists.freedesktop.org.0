Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 338222A88E6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E656EDE3;
	Thu,  5 Nov 2020 21:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B736EDE3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:24:26 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id i19so4714962ejx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/CmC9JRSxb82iC3NFWklCniKS4R8CJ6nnXYdYjWbKG4=;
 b=Gu7+TyJ688oibw+cHrS74PBGNS0GtLy+PisuwisCbxkYaseX4DZlsdutLz7W8K5SS2
 in4GFolf+Iy/yjdJ3fECM8Hm8BklJQrL0pME2i0mNXsmESjCW9YqRpfStnTGsvKMK9Rk
 2z85IrNT4fQH1hM8VBalwiVtlpvYXu2MYDHtvjoKL4txAqGIDPrTsgyJu100+Y1+kcv8
 PQfNaHkx5Fxr9CoQ1ZdGYyzZ1lJ/aEXSwP+AafRkrHzgvfhZI9LkI+SeYrCKYPHTr8Iq
 fwBUh6SIrR0GNB8g4ipjd3bFZ9WoStoUoszM3Np69V+PmgGrO6qU3Dyh3Eo2xb5Z2R+X
 e0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CmC9JRSxb82iC3NFWklCniKS4R8CJ6nnXYdYjWbKG4=;
 b=pqfQLJGFPPn+pQm4ARLLjX5HtGA89ApgS/IUq5p03Op6BJ5E+qJOAgEnXGv+nH8gSq
 GodXh/ZIBLE3epn3Psy7/CXfbHynOgyvtaT0AaSw7M36szERkAKQ0+pmklJ6tB80OtR7
 WqO50OG5WBzqwX2OEt0pnXKRyXj/gPTt7ggNFTN6FwL8ZUs5iWwHEMyL7jqWvgaRDilj
 J3FX3nXYGaweu3G8ExnG8j0e6rSwm9T+emJihjJW2xHsCSjbX93NwUrqhGIf8fTXCVG8
 psGpw+kzgdngRaY9GWjEPOvgAnjXKx+C14AG0vx0SRFXXZeqNmRnSUcspr6h9GcrePaU
 Ue1w==
X-Gm-Message-State: AOAM533ankyRVtID5QR+GbaGszA8esaeZngg7xB8j8mSQBKTlBxvbzQ+
 ZONpK8+iUfLRHgBcCSleVIE5oNyetp3r1k9GzvMvnA==
X-Google-Smtp-Source: ABdhPJx0DFrV0/mwAVfKrG+W1lq3sodrLoxq3Xxf3TvVGR/66t+GtgFx0Gvb8DhweojXV1j9SqxoNacoODMAJnEaCZc=
X-Received: by 2002:a17:906:c186:: with SMTP id
 g6mr4058283ejz.465.1604611465021; 
 Thu, 05 Nov 2020 13:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20201105202135.GA145111@localhost>
In-Reply-To: <20201105202135.GA145111@localhost>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 5 Nov 2020 13:24:14 -0800
Message-ID: <CADaigPXM8NAZFAydXwcZt7ie_aK1aO8C=jqssA375sCMgU_gHw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: replace idr_init() by idr_init_base()
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

On Thu, Nov 5, 2020 at 12:21 PM Deepak R Varma <mh12gx2825@gmail.com> wrote:
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
> Changes since v1:
>    - Change suggested by Eric Anholt
>      1. Use VC4_PERFMONID_MIN instead of magic number 1
>
>  drivers/gpu/drm/vc4/vc4_perfmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
> index f4aa75efd16b..18abc06335c1 100644
> --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> @@ -77,7 +77,7 @@ struct vc4_perfmon *vc4_perfmon_find(struct vc4_file *vc4file, int id)
>  void vc4_perfmon_open_file(struct vc4_file *vc4file)
>  {
>         mutex_init(&vc4file->perfmon.lock);
> -       idr_init(&vc4file->perfmon.idr);
> +       idr_init_base(&vc4file->perfmon.idr, VC4_PERFMONID_MIN);
>  }
>
>  static int vc4_perfmon_idr_del(int id, void *elem, void *data)
> --
> 2.25.1

Reviewed-by: Eric Anholt <eric@anholt.net>

hopefully Maxime can apply it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
