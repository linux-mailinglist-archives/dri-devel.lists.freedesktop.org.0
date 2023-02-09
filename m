Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8C690BC1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0210EB06;
	Thu,  9 Feb 2023 14:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5C210EB03;
 Thu,  9 Feb 2023 14:30:39 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1685cf2003aso2672104fac.12; 
 Thu, 09 Feb 2023 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=chp1QLTcxBkTY4TOrgE4Wi5O1rzO5OCYMKuxrfK4j68=;
 b=KNzH3CVAWGBGlv02T5KfmPqSWwO7h1UluFuofcAgn10PE3n/U1bbqOvsVle1x7k9rV
 VBVUp56CSkXO/8bpa4WQ81GmMxywPDVOGfEHMWYB2XCjcI1rX3O4J66ALFMcUzYyuDab
 JbNBJpTangtVEFzLI/gZniRel+0gH2xQgAwbAoKble+ZkU1XxPD8D7erln07QJViF0q3
 zdydHL0uCPq5QkPWlrRAq56K5Qd5GUbkeoalyK26KbjX3bEWcMTkHgnWsFVMIhQcfGsf
 B406GaCQkUoPkhlqlf0LbLj/20CG9T+aNF7z+6rVW4TcRKUmgpdWXfz4y2FZCYKfNM2O
 RYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=chp1QLTcxBkTY4TOrgE4Wi5O1rzO5OCYMKuxrfK4j68=;
 b=irtAfTH5gW6L9vr6mixuK7KFVuh2b0vDWbngAoWu4sNQTpbd5KKZnNeqNv2MDhGmNO
 rdqWWbCEwtTpLzMn02WOPAICWGZFl9uK+ma7Yrah02s+LeFU4wfQHWkyc6iL4XlymEup
 TqkeiEf7xkylJ1l6VuE1U+TVwOpS8yRgKH2XCZAONDSFwW7JgslNhx9RhjSMeUD+z8A2
 m2o6ofsffH6kze+M1lPAzYhfMDyqPDGynRWPp0yLqt2REMrXsrHmBYI79HV1Qn0EnoFe
 4uBFcq//E0Ixr7xzSYg1V+EQa/Tp2/q/DncXuVzujWELugRqSf7oCeFNxoD2U35xku+k
 X2Og==
X-Gm-Message-State: AO0yUKXF6gMjfjDL+jLSkXzhXHMlFi+7sKhwKFytUQcSUFj9yPaJjq+2
 dnEgamGyW2sVYxQFldBw0Hoq7IzR8YYGQFkGV2c=
X-Google-Smtp-Source: AK7set+vS39LPKDgruUd/z+73JEkh3t78Mgwy0EAHKWoE/WoO3LHHU9ATlmJ3FF5Bh4+XR4xzAXPfIXnILGdHIZVsJk=
X-Received: by 2002:a05:6871:29c:b0:163:8cc6:86a with SMTP id
 i28-20020a056871029c00b001638cc6086amr1083190oae.46.1675953038825; Thu, 09
 Feb 2023 06:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20230209134049.2000865-1-trix@redhat.com>
In-Reply-To: <20230209134049.2000865-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Feb 2023 09:30:27 -0500
Message-ID: <CADnq5_PnkVTYR87AWLBU1K6m4vVgp7vamVETO1DdRTXd9nUWfA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: set should_disable_otg
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
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
Cc: Charlene.Liu@amd.com, sunpeng.li@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 meenakshikumar.somasundaram@amd.com, Dmytro.Laktyushkin@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 9, 2023 at 8:41 AM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c:90:6:
>   warning: symbol 'should_disable_otg' was not declared. Should it be static?
>
> should_disable_otg() is only used in dcn315_clk_mgr.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> index 8c368bcc8e7e..a737782b2840 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> @@ -87,7 +87,7 @@ static int dcn315_get_active_display_cnt_wa(
>         return display_count;
>  }
>
> -bool should_disable_otg(struct pipe_ctx *pipe)
> +static bool should_disable_otg(struct pipe_ctx *pipe)
>  {
>         bool ret = true;
>
> --
> 2.26.3
>
