Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7489BC7A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10C1123BA;
	Mon,  8 Apr 2024 09:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PkX/d4/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66481123BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:59:21 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d4515ec3aaso36587641fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712570360; x=1713175160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX6aDaiTDQQKwwQqDMi3cKuVKSE0XZ2PoAlIbyTQoEY=;
 b=PkX/d4/Q6bNuFLs5w40OEm/y0NP1+EjRKRtSdH/64xrF9UwJd/CnMkbUH6Lcah5XLr
 hleda1+nrk72hiv57nvAGnlZ0skXboSCcNP53fMYb2fz3Y+FPUmFn1+vdft/OMFTGjEV
 EW/tNWXsLmPBYfc0+GRpgYZ10qdlEBTiSBSvy1Sv2ETmZDq4aJEyvQE5A57rGpkvsvSs
 +aR9L9ExR1pqMbn86SDLLU+WHBK6Drhi70g+t4j8vGU9VpzGiWNO8NZvJZIM4AT5zLHd
 dPLFB53IDyg5b7PQgvS77LaLLWchg6Go24sgcNnNaM8sXlbRc5phv9fnmdSk/ftHOXFC
 pbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712570360; x=1713175160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX6aDaiTDQQKwwQqDMi3cKuVKSE0XZ2PoAlIbyTQoEY=;
 b=aIQ6LWbEStW73tJ0EARUvJpe5f0aiEq6pBHwFIxBdVf2AYVztWjuUFh+U6JZE0pCot
 ri3xJEu4prH1YCs4kwbMmWF6FXI1baSkDNAOvRSy61fHEQu/+/EqWclKwnjGeEL2zqTh
 6QDEm864a/wvBoSCkBCOEAeYEjNo2bXOEx9W66G8ePTTbRmuF1o/NN1HZ4BQvLYWjMK/
 6cmhbruemfX5xvykgE/rL8lKAODEwjreb5igndi7MepK22TIcJaHrGNDrzVV7S3W5QBP
 FgAtq7DGmaPauObEv6rIRYb0PVai1Aq2ipHjF4ilHkfGHEKmuZuutSHc3QhCkJbQoJ5Q
 E6Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg1fN/ffm85HLsgLJj8OxzXKxCoRrMEYvoiCeljCYqgilXLIbOO3rmrNgep/MZOA7MNltaOC6dGKGtq0REj7Bhfx1NV9udGT2f4sZbT8N9
X-Gm-Message-State: AOJu0YzMABUW4Zyi2SbkOSoWd+mZcWommMHLhhtzVvKdhOkwWf0ftKnY
 1UHFhWt/3uWnMJj8gfav7W/N8NKLgnupylxsmwfDy5U1h0TK6FtAQY18Xd/ULUM40elXbP1dsPt
 Mq29G7TBlRYxFwPIo+vAGPQjYIOS0MkW/ZUIDuw==
X-Google-Smtp-Source: AGHT+IHpETVzYi9e2vtA/Z+GVefLYWp8VsykEgivacn22jHDLXO0DnsTxWYCv5yeCFyTRv4rCSYQ6OxQVFNE84nksC0=
X-Received: by 2002:a2e:4942:0:b0:2d7:1805:1071 with SMTP id
 b2-20020a2e4942000000b002d718051071mr2997230ljd.14.1712570359813; Mon, 08 Apr
 2024 02:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
 <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
In-Reply-To: <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 8 Apr 2024 17:59:19 +0800
Message-ID: <CABymUCNW4zpP4H+gKw8+7NPR0D08jM2ze4AVG89+KSwZYoozkQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 18:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Support slice_per_pkt in msm driver.
> >
> > Note that the removed "pkt_per_line =3D slice_per_intf * slice_per_pkt"
> > comment is incorrect.
> >
> > Also trim the code to simplify the dsc reference.
> >
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++----------------=
-----
> >  1 file changed, 14 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index b0507a42ee6a..0c6f40dbd25c 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_=
host *msm_host, bool is_cmd_mod
> >         slice_per_intf =3D msm_dsc_get_slices_per_intf(dsc, hdisplay);
> >
> >         total_bytes_per_intf =3D dsc->slice_chunk_size * slice_per_intf=
;
> > -       bytes_per_pkt =3D dsc->slice_chunk_size; /* * slice_per_pkt; */
> > -
> > +       bytes_per_pkt =3D dsc->slice_chunk_size * dsc->slice_per_pkt;
>
> Please don't mix cleanup and functional changes.

OK. Will fix this.
