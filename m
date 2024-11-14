Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E379C9421
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 22:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5717310E37C;
	Thu, 14 Nov 2024 21:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B+JvYEtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF6410E37B;
 Thu, 14 Nov 2024 21:21:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ea073e4533so130032a91.2; 
 Thu, 14 Nov 2024 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731619271; x=1732224071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehv9+ANQ0CX7cBCrQKPwSvObASpaH6zmEsFRtLhvwIU=;
 b=B+JvYEtB/20BOOWfWlc1IvGpfcEeg4Iir+nxu/LflWvRh7ZXWjMkfLnG2VS3Ml5YSK
 jCD0sGDEC/h0rnu9DZh9hsN/6eRKrkuc2PwvPacfOHnnvT23kpqB3rNYEFOy3o26apUp
 Lc40dqxAmSs/ZWr4NYTmk9kceJw1Vo53+2+Uk+VQM3PhFIxnoiyzIPlqROtw6g8ahhut
 kmRQUhBTB8qFIwu8hON2Lu9+bOFgyXOvIm9JC+GZ5jdX6Yt3dgbOleFZ/3wFFmLq8Yan
 9rv+PRDGZwmehpvI5AUMovl7XKkYFIxY3pdBjN8DyoNMW4l3kt4cZanFU0HTiVC4K8TM
 f4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731619271; x=1732224071;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehv9+ANQ0CX7cBCrQKPwSvObASpaH6zmEsFRtLhvwIU=;
 b=FjlHR6zAYFlr4kfn8pZ6xVAgX6Ka/Y5Paebo2XplG6w0vGvtAGqCgKOjx1H7HrYAEH
 j7H6YvILSdfoVnS9G2Ac3Tss7SalWFrnmm99HzPvuRCfaL9KEIopbmqPHWX3R3iqTPy8
 zfH644QYpp1ttBUYKq1nmrVe31gI3XLFb1+agJt1UKg3HowPFqhyKE0JMCgorTpjz+Jm
 weenR68bToiyZIJZ53LCdUhqcePyWsqcMLiAgJTNMX1Tn0jSp7jj7wg5LhFTG87Rm9SO
 HKFl1uv6sXX+p4gToUOVA3lOQBL6/P4Bc7BsaRCaB6NI1EZbnQBTq/96ihd2o/bnZw3y
 6LLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJK/AHNFFVkMMEZaarPb7FKPzMAOndgIOHPtqpznKupwR4WoUAtFd4q8XaGkQo3zRi78K/8DCmLu6x@lists.freedesktop.org,
 AJvYcCXR58Vis+khiGYuOY8O/w8LTfLSQe652r7i4Hj2UqTcmqNXsniqWGqaewamfBNnVCuoD9a8RK5n@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh6crjlxQVst6Giznf9YRUkCdgju5vYbFmi+HKEAV4u9h6thgS
 Fas9alClDdDOSvluD4qoaKVjjqrpxGw0JrMLtgwHGCPmVtYj5PjUtcIYU2bsqj96nErFwZIoMmX
 wFUTFeDVB/u9JxScffK5BFhE0n3A=
X-Google-Smtp-Source: AGHT+IHDIpTlD9Hg0BD/QZgrCLws+o4es7hQuErrVlLnU6RrTSYgLmuXZPYuQ2EJoVeAT7M0UfqpLaHszXenEXyI9f0=
X-Received: by 2002:a17:90b:17c2:b0:2db:60b:eec with SMTP id
 98e67ed59e1d1-2ea15591de6mr185724a91.7.1731619270954; Thu, 14 Nov 2024
 13:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
 <20241114151150.19576-2-bhavin.sharma@siliconsignals.io>
 <511539bb-bc1d-459e-bfd1-10ad8e9d1435@amd.com>
In-Reply-To: <511539bb-bc1d-459e-bfd1-10ad8e9d1435@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Nov 2024 16:20:59 -0500
Message-ID: <CADnq5_MXiOYYLKii4UiziDoKhefiPFy28++NxY5Ss_jp9ob9BA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/amd/display: remove redundant is_dsc_possible
 check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>, alexander.deucher@amd.com,
 alex.hung@amd.com, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Wenjing Liu <wenjing.liu@amd.com>, Chris Park <chris.park@amd.com>,
 Roman Li <roman.li@amd.com>, 
 Leo Ma <hanghong.ma@amd.com>, Ryan Seto <ryanseto@amd.com>, 
 Jose Fernandez <josef@netflix.com>, Ilya Bakoulin <ilya.bakoulin@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 14, 2024 at 10:21=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 14.11.24 um 16:11 schrieb Bhavin Sharma:
> > Since is_dsc_possible is already checked just above, there's no need to
> > check it again before filling out the DSC settings.
> >
> > Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 13 +++++--------
> >   1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/=
drm/amd/display/dc/dsc/dc_dsc.c
> > index ebd5df1a36e8..85f6f8e43947 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> > @@ -1093,14 +1093,11 @@ static bool setup_dsc_config(
> >       if (!is_dsc_possible)
> >               goto done;
> >
> > -     // Final decission: can we do DSC or not?
> > -     if (is_dsc_possible) {
> > -             // Fill out the rest of DSC settings
> > -             dsc_cfg->block_pred_enable =3D dsc_common_caps.is_block_p=
red_supported;
> > -             dsc_cfg->linebuf_depth =3D dsc_common_caps.lb_bit_depth;
> > -             dsc_cfg->version_minor =3D (dsc_common_caps.dsc_version &=
 0xf0) >> 4;
> > -             dsc_cfg->is_dp =3D dsc_sink_caps->is_dp;
> > -     }
> > +     // Fill out the rest of DSC settings
>
> While at it you should probably replace the // style comment with /* */.
>
> Apart from that looks good to me.

Fixed up locally and applied.

Thanks,

Alex

>
> Christian.
>
> > +     dsc_cfg->block_pred_enable =3D dsc_common_caps.is_block_pred_supp=
orted;
> > +     dsc_cfg->linebuf_depth =3D dsc_common_caps.lb_bit_depth;
> > +     dsc_cfg->version_minor =3D (dsc_common_caps.dsc_version & 0xf0) >=
> 4;
> > +     dsc_cfg->is_dp =3D dsc_sink_caps->is_dp;
> >
> >   done:
> >       if (!is_dsc_possible)
>
