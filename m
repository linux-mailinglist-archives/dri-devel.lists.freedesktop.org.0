Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885578F368
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765010E6C6;
	Thu, 31 Aug 2023 19:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54D10E111;
 Thu, 31 Aug 2023 19:36:27 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6bdcbde9676so978800a34.3; 
 Thu, 31 Aug 2023 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693510587; x=1694115387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCiPgoXQWEUQbwvtwHdYNndBee5s7p9DuINjKcE7kL8=;
 b=FrTG55DyAZaTZdcS+jxy9GhaD7VeQmFbIs6lS/sVaDdra6/iE9HVxHrKphlFGckQ2Q
 7Wak3ZfY21P2HJaBEVwnrqmJneFVdO/cS9bceSugs3/7wJ8BFfMtwv3zTCP3WLQfwZLf
 NJKjcrheAHzQVDuQObYdKkaCcmqZBvpkgZCmlEdHn/uufs5Hn5VQD7PlkSqfveg0BTuH
 LWE4t1XqMU4vvAV1ayTqjPL7k9hqnWo3ZlsQ8JwsjEcVoj8ttkJIL4FycNAGsjPREkBh
 hA6A8/o8DlABiHAphGRN1GJ1tR6q4rSIJAbzOeDUVP38vOV71M/BepOhmfyj8GyR+KMQ
 EgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693510587; x=1694115387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCiPgoXQWEUQbwvtwHdYNndBee5s7p9DuINjKcE7kL8=;
 b=A5kwJxy7Wvmhl3wHY+5HLwH5FPVxDythEt+eUS0ErM0/EQDgMiKW5IP7C2oweatCEp
 BZuuWN7jFWfxNxUlPpI0eBnFaU+lKzDqTrDwzSV6GhVPohB/fX/qMIqFAcmmE3FsvAL7
 wGEJI6qMS2o7PlCSVbUR0j4fnMPRd5joSLSQcZVSwfgkOdx6oUPY0OZ9/6a55iTbdDDW
 Qcx6v6fO8srYVtaGJRCI0fjvFLTeUI9GKTIpUDu76efAKhj/WqC+IgutwQ80lypf/FRD
 w4LO1sPThlYgJYQq09QJkD3JeOpP8AQTFBMovtPDTUj0BNphhzqd7qMwEidQSvdZFkwk
 Xzrw==
X-Gm-Message-State: AOJu0Yx00l+WPho4KTY96FfanElWzhqDOS0TVfClfEk9t60ykO+V39Pk
 1VByWpFLBi5ls2M9d4PABzpR+iGzA7CgAY0zUck=
X-Google-Smtp-Source: AGHT+IHwy/eGATABWvMti7NtZTgzOtSNMp1UCCaV2bdNv13/dXZgs47g5hDqQNvAQFDKIgI9B6TB+j7Lfty+7VJeYeg=
X-Received: by 2002:a05:6870:8288:b0:1bf:7e94:bbb5 with SMTP id
 q8-20020a056870828800b001bf7e94bbb5mr472364oae.7.1693510586972; Thu, 31 Aug
 2023 12:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230830140103.311752-1-dii@itb.spb.ru>
 <3ba3a7da-77d7-4a13-899c-e7a1f5b68a42@amd.com>
In-Reply-To: <3ba3a7da-77d7-4a13-899c-e7a1f5b68a42@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Aug 2023 15:36:15 -0400
Message-ID: <CADnq5_NvD3CC=awhR4jqSb3GNYQfdFZDk3XX7pVyJfeU06kqiQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove useless check in
 should_enable_fbc()
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Dembskiy Igor <dii@itb.spb.ru>, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hersen wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 31, 2023 at 2:48=E2=80=AFPM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> On 2023-08-30 10:01, Dembskiy Igor wrote:
> > It does not make sense to compare a pointer to array element with NULL.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 65d38262b3e8 ("drm/amd/display: fbc state could not reach while =
enable fbc")
> > Signed-off-by: Dembskiy Igor <dii@itb.spb.ru>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.=
c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > index 6966420dfbac..e87cf54ec658 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> > @@ -1992,9 +1992,6 @@ static bool should_enable_fbc(struct dc *dc,
> >
> >                       pipe_ctx =3D &res_ctx->pipe_ctx[i];
> >
> > -                     if (!pipe_ctx)
> > -                             continue;
> > -
> >                       /* fbc not applicable on underlay pipe */
> >                       if (pipe_ctx->pipe_idx !=3D underlay_idx) {
> >                               *pipe_idx =3D i;
>
