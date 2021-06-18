Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413883AD3AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361796EA97;
	Fri, 18 Jun 2021 20:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EB26EA95;
 Fri, 18 Jun 2021 20:36:14 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so10914624oth.9; 
 Fri, 18 Jun 2021 13:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwzvVbuJlgu6DBRUWFo9BEm/hzQ+wY0U0PlSZsQGHWY=;
 b=WdnhFyyu6n7P6JsoopbACwoe7AOK+QOg+3/Ko1PmYCVdMIS9EvhxqPe0fqh4xbv28G
 KQFDPBb7TRq7Fgk2W4R7099i+F1aW8MPrZwKy+1LSEYUzzEuodod0s6kK3yNfs8rlb3e
 sgPgI+EEWNOuaE/XLVE3Sb8oehkfPQxQuebacQnQ3s3wsVwZoFmR5/Kw+KU7zrADZyDK
 qeyEC4D8QyUHfcJsUtKp1JbWcaFW1YCI1HvXIDHw2gljF+Yd4flqBwhj8xsLMHYeXyTH
 IJbq8gN4BgMZVAqLoRwYa0/ZyR2pQLD7tiJ3Kn3cSE/E/0UYO3mTAZJsfM4Qyg22Zb69
 ioMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwzvVbuJlgu6DBRUWFo9BEm/hzQ+wY0U0PlSZsQGHWY=;
 b=IUwkVRn2I9fgAohV3zWBmaueQgJjkpwK1wsu8U1ZD5QeW8qb9SJ/jNZksgr7HVryH0
 if1Oe6wlhRAMInd8Rgl8xFMx97JbLHzXQ6MI47b+nk4UeYOHbG4uWBgPF6jx2Btwkntp
 I55Olhh8ffVD/vG22X74aRKss/gMT1ZENse7x0y3Nf30GGU4p0WX0QVEcskCbZ2YSjwI
 6ej8cEsgl/Dc6oFTW72pVZBEXOwaNKDj8ejogvYzqWzJ+qbp7HUxpRUHSiqoRJCkwAiS
 rrHy5lOnumlCK3O6h3dcnMuZLCJVXZoVyJIAPxc0bWh7Bq2IpscaD66+5FQ+6d3FuqJe
 mN9A==
X-Gm-Message-State: AOAM532GepSgeKeDRFieRmNszbXYMerg7381qRLWGHQ2FejF3A5kadKl
 lmrf3dcOoKmm21KjwOVtn34VWbwZkPque8ZuhX8=
X-Google-Smtp-Source: ABdhPJzF78KAFsqPc87SewWRBrPw3zNm1t0kg3ndekO4Ac022ElkbsuZKs6pwn6DG0+gmaEZzECQIoIb8XCyvEaP2MI=
X-Received: by 2002:a05:6830:33ef:: with SMTP id
 i15mr11036214otu.311.1624048573626; 
 Fri, 18 Jun 2021 13:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210616205206.GA17547@embeddedor>
 <3e68b60f-a9af-1f58-076d-1d348e3bf892@amd.com>
In-Reply-To: <3e68b60f-a9af-1f58-076d-1d348e3bf892@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 16:36:02 -0400
Message-ID: <CADnq5_MZ7vTxH6aB-rsZqSLGaffi6OwgVBDAFcT=16RRNw+UKA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix fall-through warning for Clang
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 17, 2021 at 3:20 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2021-06-16 4:52 p.m., Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix
> > the following warning by replacing a /* fall through */ comment
> > with the new pseudo-keyword macro fallthrough:
> >
> > rivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.c:672:4: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
> >                         case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
> >                         ^
> >
> > Notice that Clang doesn't recognize /* fall through */ comments as
> > implicit fall-through markings, so in order to globally enable
> > -Wimplicit-fallthrough for Clang, these comments need to be
> > replaced with fallthrough; in the whole codebase.
> >
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> > JFYI: We had thousands of these sorts of warnings and now we are down
> >       to just 15 in linux-next. This is one of those last remaining
> >       warnings.
> >
> >  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> > index 28631714f697..2fb88e54a4bf 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> > @@ -668,7 +668,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
> >                               /* polling_timeout_period is in us */
> >                               defer_time_in_ms += aux110->polling_timeout_period / 1000;
> >                               ++aux_defer_retries;
> > -                             /* fall through */
> > +                             fallthrough;
> >                       case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
> >                               retry_on_defer = true;
> >                               fallthrough;
> >
>
