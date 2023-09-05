Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45239792C81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880610E197;
	Tue,  5 Sep 2023 17:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C7010E0C6;
 Tue,  5 Sep 2023 17:34:38 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1cd327d7cc1so2160844fac.3; 
 Tue, 05 Sep 2023 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935278; x=1694540078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+G3WP3YwMsu76Cet1Bxz2RfkxbGHzyW+58lMB5e2zd8=;
 b=fk7n9phTV4iM8e0dJqfRy0tf364yLon/cPsq16e38P01OpvKys0pTAeS5JoM8dQExY
 RAYYysYVsuO41icjOmHhFvoSFXO2vde6UUXY8I/AJ2j7HK2vxYspldGM19FEQU4aS7QV
 Jc7fw3tQniUTVR+CfqOTF5Uvn6TDck+qjz3H2QW5XY7yVNA3WajHzEkG0klJJzXd/OIE
 dFcPA0mDg29WhAyahLIkwni8WVj8e3b5wssE7veBtrT59aDEtzRsNrgMDuQDqLjBj8U0
 fu4NLA8fj0op0+d4OROo+0CcsnxaeBOts7gLXwFh/K2wPh8HCiV+2IavmrvL7kOmBM01
 gFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935278; x=1694540078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+G3WP3YwMsu76Cet1Bxz2RfkxbGHzyW+58lMB5e2zd8=;
 b=SjtQPfyrbdp06WdCt+DCFsGlypURTCp2fIPAWeP01sxIC3QqQdd3G7Gv4L5fDwiL0Y
 wfHWFVfAo57GhhbOIVB40ww0FVVW0o5Euafody5N6a9HnZkSvHshpJ13cMvy6oocrP3E
 +4efCCx51xKTsH0zPSTl2XxdyvVN27dFlRlwZutBMdbxMCXZYKj0TeIrTk9fxkWgtVvp
 RsZQS7sVviovg4x3TOyIv6Kb+WvGS9wloOqZQ4A+CumHQdv63gc0HYrxhIUz5lFa2b+v
 jeP6jyazEhThS23iCggr1TLxxq4NgdZ0zFqBcXHNwHVSxPHXFRN3X+o7APMol0mbLAci
 a3qQ==
X-Gm-Message-State: AOJu0Yz7vIg4hO3De3aov+cjtYRIqzAOUIxgKHzw+wF6hJMP4caVyrRu
 Yyuzato8GZIpcR6aD7UgI0X/D2JJQEWE5fxY610=
X-Google-Smtp-Source: AGHT+IHecd024T1nCg53+h5Nw6+5wkM5lcLiVKJmYeAT3ciRMXuJIv9C2BSCL0YfARRctZoAH9w9tTNF7KG382+qQ+I=
X-Received: by 2002:a05:6870:472a:b0:1be:f720:bb7b with SMTP id
 b42-20020a056870472a00b001bef720bb7bmr17836496oaq.16.1693935277843; Tue, 05
 Sep 2023 10:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230901005226.42307-1-yang.lee@linux.alibaba.com>
 <20230901005226.42307-3-yang.lee@linux.alibaba.com>
In-Reply-To: <20230901005226.42307-3-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:34:26 -0400
Message-ID: <CADnq5_Mgw7YvCUjiGnmOe-SbryZwq7pwNaR5kySOh=M0BMY3KA@mail.gmail.com>
Subject: Re: [PATCH -next 3/4] drm/amd/display: Remove duplicated include in
 dcn35_hwseq.c
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
> ./drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c: clk_mgr.h is includ=
ed more than once.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c b/drivers=
/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
> index cacb557a3014..666e2809d9dc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
> @@ -31,7 +31,6 @@
>  #include "clk_mgr.h"
>  #include "reg_helper.h"
>  #include "abm.h"
> -#include "clk_mgr.h"
>  #include "hubp.h"
>  #include "dchubbub.h"
>  #include "timing_generator.h"
> --
> 2.20.1.7.g153144c
>
