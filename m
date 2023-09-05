Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBBA792C6E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6F410E082;
	Tue,  5 Sep 2023 17:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8C610E082;
 Tue,  5 Sep 2023 17:33:14 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5739972accdso32601eaf.1; 
 Tue, 05 Sep 2023 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935194; x=1694539994; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uuXglKdu7wBMuQLUcGT0g8zly354Keok7+si1kDoTlQ=;
 b=H4+CDEbbTIOwqnXkQGN2cxRT62vUMbCTma8fJGc86HyEQOYm58jpt0SMK3VnvgKccN
 C4d1dJjH8lKdHCUOVWWFLfg1Vfrq0gP4f/LsEvMOwCoRrGe6uqZcRIEgAtxtFIOg8SA4
 HLFGL9iuqFiFhpKHEEkpuB2OQF0lATa+lI4dsBvqohV1zTvMo1Jg+w56nftIPPCTX4Sz
 uPH/tPImYABdL7eV7iCqzGG3hgU2xHIXcUsEveLXKsMZcNe7pZZy4IjMvDRuAGRM2At3
 4qzbdWZAAIXnwRz2DP2G8YKas0smEKJ2QgDMZYF/P9lo0BseytiPJiTSpNusilp0RqWu
 nY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935194; x=1694539994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uuXglKdu7wBMuQLUcGT0g8zly354Keok7+si1kDoTlQ=;
 b=Udlplkk6FKqIzGva1PEq9bfxrwEtbwtysBDTi59mmjO0SdjQA8XM0HiaPs77ghoRf3
 ecH3T0l8I046ZfArBY8DQ19TUc83zoBU1f+y8bUsc83LZVrcg51NvT5Biz5GlwuqKmNa
 GuvNys1rBV9P4ThGDePHUUwFrZn9nP/yqzk3U4t7/BB0nRRtqSGdD3F8oySOgtb82frf
 TxVR9PGgN1aE7+8HjzQr35r1mt4c9rNbRZvXzJzZGUtLmF6KHtssTJAfD3hfNT5tNdqH
 6Blac4/Uu4I38eCj1yCamtB3rytMvyOWgRhoq2poLqFfJRx7sZG8cVY6ngcnoLww5xC7
 PA0A==
X-Gm-Message-State: AOJu0Yy8V6ePeycf7ree5xDdd5OFFPMp/e+Y7wnC9dCAWn6++XQRdv2S
 gDEvL0oBOCmD+BYlOlD/RZkCBP75vhwRR7rymwE=
X-Google-Smtp-Source: AGHT+IE8mJ8YaZ6KXqCsBWWGTxxwhRNQchkpzsOzcqR5Z7DYGx6GABgbBlbFBKQSaRYouW9mV6YBeOuxEQn0TKgcML0=
X-Received: by 2002:a05:6808:128e:b0:3a4:316f:7d06 with SMTP id
 a14-20020a056808128e00b003a4316f7d06mr8158062oiw.27.1693935193870; Tue, 05
 Sep 2023 10:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230901005226.42307-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230901005226.42307-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:33:02 -0400
Message-ID: <CADnq5_Pb_NvK9mqak5n31ud0GhkH09ohrdPBOGD=uOjhGj+9-g@mail.gmail.com>
Subject: Re: [PATCH -next 1/4] drm/amd/display: Remove duplicated include in
 dcn35_resource.c
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 31, 2023 at 8:52=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c: dcn31/dcn31_dio_=
link_encoder.h is included more than once.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c b/driv=
ers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> index 0386b8fb270d..7f059fc2fc75 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_resource.c
> @@ -61,7 +61,6 @@
>  #include "dcn32/dcn32_hpo_dp_link_encoder.h"
>  #include "link.h"
>  #include "dcn31/dcn31_apg.h"
> -#include "dcn31/dcn31_dio_link_encoder.h"
>  #include "dcn32/dcn32_dio_link_encoder.h"
>  #include "dcn31/dcn31_vpg.h"
>  #include "dcn31/dcn31_afmt.h"
> --
> 2.20.1.7.g153144c
>
