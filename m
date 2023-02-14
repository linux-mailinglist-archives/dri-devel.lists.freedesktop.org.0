Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49386696BF5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD310E252;
	Tue, 14 Feb 2023 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DE710E252;
 Tue, 14 Feb 2023 17:45:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x26-20020a056830115a00b0068bbc0ee3eeso4893589otq.0; 
 Tue, 14 Feb 2023 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xhjva7kHXsMMZOkv4jYRk8m+RADN+sn0dUwsGg9Pc1I=;
 b=HluUJm33cdWC8751VaQaKOHvMC+ewG/W/EVYAEUAWQLQNTYinbZ9lY3ClZ3TxLJJuo
 N+Y4cGPqxQU/5ogDX9O0ZXrw/qr6xQIREDPM5M/XK0aR+abIavRM4tjd6LEHRD73fuq4
 ALBPuLmPkehEM1zMtwCo6nFD+sdM9piXZVeZtLN83ARxTgXzVfxyrhVTqb1XOQX9IxFM
 uIXI+AObjYcOrb8E+2aa1aAUqrzsyWPMpxCCN7f3L7lxakLhF4lNdkLu8fSnWpQMOFGm
 NnmqhSEj+GC+KlE286wkLML1k3iLPeU89iOV2J+EjEgd+JdmJKayYbUH94Yaj69gUyZg
 RLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xhjva7kHXsMMZOkv4jYRk8m+RADN+sn0dUwsGg9Pc1I=;
 b=YRIYFSnt9Jd4ppp9eCShK54KEtQFt57HYp1kSnWOjOY4RqR4VezvZZkG4fVppI4UwI
 4ZdgfUo00D7rlXMYKHmyEbATI/rSaM+qVwHRj0SQsdtIp1510tVXZglmNKuZmPAAqnP0
 nNAOEeLd6hNptnOL3zuE3ZxpDm2VnYkRo72niPUzQHZUhHENnthH8EG8FTC7r1VvbH1L
 fzFg/lmqmtHkRcPcdOzFtudLSrpy3y8UbellpsF8NDnbQINfzml717JJNThTRmqF8yx7
 fOpUZKp9XSM76aSTzwBr7eJjzxvRvxvZ/9ljNaYnpmw96HxBDi8ViA7FXwVviwwjfUH5
 KXtw==
X-Gm-Message-State: AO0yUKWf9Qzqzzl3MqDwIKvosZfXrNPUCCeDxDqSWnu/f6DrmACG4qLM
 foglCHM4Yt05pfD56ZtJQAkmvSlZ3tuCjsffKR0=
X-Google-Smtp-Source: AK7set9mqLy7+DZYXVXZ/ZcnOXVxAaO/d3+iRmVW0GsvvMP19B/lMKvqoaz9zXBflP7nl2i8eAHCxQi0gsTrsqLKg5Q=
X-Received: by 2002:a05:6830:902:b0:688:d1d6:202d with SMTP id
 v2-20020a056830090200b00688d1d6202dmr10644ott.6.1676396711423; Tue, 14 Feb
 2023 09:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-5-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-5-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:45:00 -0500
Message-ID: <CADnq5_PBFNyvCEtn_jWqn-VV963iSdVj-0re=8YhT3s3kRNiWA@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/amd/display: Add previously missing includes
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Feb 13, 2023 at 3:50 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Add includes that were previously missing to reduce the number of
> -Wmissing-prototypes warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c               | 1 +
>  drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> index 330d7cbc7398..3069af3684c6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> @@ -30,6 +30,7 @@
>  #include "dcn30/dcn30_hwseq.h"
>  #include "dcn31/dcn31_hwseq.h"
>  #include "dcn32_hwseq.h"
> +#include "dcn32_init.h"
>
>  static const struct hw_sequencer_funcs dcn32_funcs = {
>         .program_gamut_remap = dcn10_program_gamut_remap,
> diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
> index 04838a31e513..257f4fc065a5 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
> @@ -24,6 +24,7 @@
>   */
>  #include "dc_link.h"
>  #include "link_dp_trace.h"
> +#include "link.h"
>
>  void dp_trace_init(struct dc_link *link)
>  {
> --
> 2.39.1
>
