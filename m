Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0C390E41
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 04:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973596E450;
	Wed, 26 May 2021 02:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB6D6E450;
 Wed, 26 May 2021 02:22:17 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so30592823otp.11; 
 Tue, 25 May 2021 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hvI7375sAkKcChvvslqREIoXOyYLnpK4a1vj3LvtRkc=;
 b=io5S6cEd5vYle/8rpiPzbpFcT4L14NSz4PRFcu2TQ6AGS10Yk1wDIbKz8VZE2DNYQq
 Taj6xAvsZYC/dBRA2M7kt2oqHy7OI5PaNxSI1sbIJiMfPJ4U9pD++plRG+pMXN7QZTTn
 2DgiAvaKwyKnuD/zSCvt68b1OblaKOKJtgyXMLlqRe1hTAkHLV2lcfLCN18ezZ52+wvp
 l/7m7nWBBYaj3AlO5paGEUQU1q8/jIdLs/Ho3SGyFenZMixonfW30FylQXr3o6/2yXrs
 Poz6QPMbPKHXng93z2FXNwl6ZMRBNHXTh3VuwZD+1afT//7yRRTXLl73cY+9vADN72GA
 pDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hvI7375sAkKcChvvslqREIoXOyYLnpK4a1vj3LvtRkc=;
 b=MWZ62DkQc37eBiODkDAEnY6EFnbPuhoRHZu7oonUiZSCo4zHFExriwx3v34WIppwh+
 mUfeFNGBAS8dr6d/9Vy1r9AvWuwJaov7hS0NSxeO/RybsRNPtWofhtuuUP2uVIVO+rkk
 DFDG+3splTweJD/wECJeocDsdY55V00g5h82UeWycP6FMT0Haw50xhUZE1ksn0BvKyDb
 lnSkOzaUSzU5KBGmP/oDgSbcphCynvy2Xdcd02U8wLCxiM7++yQTmxqNS5Soakeuh/Uz
 I4SgMPoOjU8tpjQTu4yzvH/2F6F1b5PWlp7gBre5lLF3LGwnroBHfm0KzC+vkyABQecb
 v7pw==
X-Gm-Message-State: AOAM5307xFqKXd1dsjCC+JTfgSj8dID5K4tuckw/paCDQCDL3Bo/K7Z6
 rG6yW9d2KTvB8Zrm90FvHzA4zL92jlDGpezajkc=
X-Google-Smtp-Source: ABdhPJzDoZzNrV06ItsrtLTJ8UfG4+xaYrv9sU57pNmivLMkQmdRu9xt1yRSWJBWh6adjFyKVlLHopVw+C6wmMxGR24=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr534117otl.132.1621995736638;
 Tue, 25 May 2021 19:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <1621939872-36834-1-git-send-email-zhangshaokun@hisilicon.com>
In-Reply-To: <1621939872-36834-1-git-send-email-zhangshaokun@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 22:22:05 -0400
Message-ID: <CADnq5_OSFosU9iSUg_Uuh0PnOQscXhEcyO9gdiF_t7S59VTvGA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove the repeated declaration
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 6:51 AM Shaokun Zhang
<zhangshaokun@hisilicon.com> wrote:
>
> Function 'dc_power_down_on_boot' is declared twice, remove the
> repeated declaration.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 100d434f7a03..d4d7996be171 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -1071,8 +1071,6 @@ bool dc_resource_is_dsc_encoding_supported(const struct dc *dc);
>   */
>  bool dc_commit_state(struct dc *dc, struct dc_state *context);
>
> -void dc_power_down_on_boot(struct dc *dc);
> -
>  struct dc_state *dc_create_state(struct dc *dc);
>  struct dc_state *dc_copy_state(struct dc_state *src_ctx);
>  void dc_retain_state(struct dc_state *context);
> --
> 2.7.4
>
