Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CF6750A4C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888B10E53A;
	Wed, 12 Jul 2023 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858D810E53A;
 Wed, 12 Jul 2023 14:01:23 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-564e4656fecso4371687eaf.0; 
 Wed, 12 Jul 2023 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689170482; x=1691762482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLsiJY8/ea7O7yxQWYP4ePh8E4N69Kqkk8kigk+qX6M=;
 b=FgMJpQ/pj6kNs5c+c1c2Aoew9MESIoDfn7VsaHwFNnCkWeL9ITu9C6cQXikR43hLwB
 5frncd2GabZBWeYbWOFh/ffCiy5zngdNCyIB+jVdOw6fJAgw0oI/Pv1Lwf/x1lIS5H13
 dzTeWPQ1pwSeFaH30v4Uzmd3os2Bqp4kKIkHIuh135YwvSrQQOJ4ypgiVDuOLIqRkFhI
 qdZV7dWL3P6l8j1fkjylu4jv8+hZJfsWrbm6J+fXZ6ehoJlbrXc9M8m+S7dBv0TzACJG
 MGzNiCTjDuJ/C1Swt406BDxagOH9HawRbvVpveLtnPN/w0oI/ea8LgZU4mi8/dZZWBJa
 q8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689170482; x=1691762482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLsiJY8/ea7O7yxQWYP4ePh8E4N69Kqkk8kigk+qX6M=;
 b=NtDRjJO1SacQz2Yq6Tga9lFZOFT2TvsZiYTcfiZw+tgQI6QbHvFEFf5OVV/m9My1m4
 QmaFpqaRUbYD5VLZIOx/vf1lMUuGbq5wzNITjrNLWCV5h03wwyxRlja9YqpQ83TJDGSX
 5bSyeSRLi30cWH+uxTabpNNtuvGBVcODSlhZO78cPm67IElDl+nXpVnLWVFkDIhTb4qr
 mNwJNxV1CnkZbMQQ04KambyODsJhvzdfqzkBIbQbXLWSTgUUDQQhkpBsagVgy2wKM+kx
 Oz84WNWxtklIszcRWx6kuY3/hJxTSCx1Vm18b2RKUzRPn565jnpkLaGrOtciT+V3Eg83
 Cclg==
X-Gm-Message-State: ABy/qLanbk3deAIQ+m88Mn5lHk9kggnOZCt3Hv0THeR2kpOivEFvdCYg
 9IYrQDeFBuwot+WeQnd7R4RINTuY6uiUqFm+PkE=
X-Google-Smtp-Source: APBJJlH6CZA350YNzNxZYIEobwacjGj4qVtyjqAlR8TRHYmxX+4F4sp0Q6BykIOS556IpkJ7Dzh0rd4ydTv/7vipWmA=
X-Received: by 2002:a4a:6243:0:b0:566:f51f:bbd3 with SMTP id
 y3-20020a4a6243000000b00566f51fbbd3mr691848oog.2.1689170482529; Wed, 12 Jul
 2023 07:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712022339.17902-1-rdunlap@infradead.org>
 <acee82a2-d5f9-9bf1-5138-44db14c079d1@amd.com>
In-Reply-To: <acee82a2-d5f9-9bf1-5138-44db14c079d1@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Jul 2023 10:01:10 -0400
Message-ID: <CADnq5_Pnqiz+KK6S_8rhm9K3RgMi3RLAt2u1jrM7m_ucSNvo8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: dc.h: eliminate kernel-doc warnings
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jul 12, 2023 at 9:58=E2=80=AFAM Harry Wentland <harry.wentland@amd.=
com> wrote:
>
> On 2023-07-11 22:23, Randy Dunlap wrote:
> > Quash 175 kernel-doc warnings in dc.h by unmarking 2 struct
> > comments as containing kernel-doc notation and by spelling one
> > struct field correctly in a kernel-doc comment.
> >
> > Fixes: 1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
> > Fixes: ea76895ffab1 ("drm/amd/display: Document pipe split policy")
> > Fixes: f6ae69f49fcf ("drm/amd/display: Include surface of unaffected st=
reams")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dc.h |    8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff -- a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/dis=
play/dc/dc.h
> > --- a/drivers/gpu/drm/amd/display/dc/dc.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> > @@ -506,7 +506,7 @@ enum dcn_zstate_support_state {
> >       DCN_ZSTATE_SUPPORT_DISALLOW,
> >  };
> >
> > -/**
> > +/*
> >   * struct dc_clocks - DC pipe clocks
> >   *
> >   * For any clocks that may differ per pipe only the max is stored in t=
his
> > @@ -728,7 +728,7 @@ struct resource_pool;
> >  struct dce_hwseq;
> >  struct link_service;
> >
> > -/**
> > +/*
> >   * struct dc_debug_options - DC debug struct
> >   *
> >   * This struct provides a simple mechanism for developers to change so=
me
> > @@ -756,7 +756,7 @@ struct dc_debug_options {
> >       bool use_max_lb;
> >       enum dcc_option disable_dcc;
> >
> > -     /**
> > +     /*
> >        * @pipe_split_policy: Define which pipe split policy is used by =
the
> >        * display core.
> >        */
> > @@ -1334,7 +1334,7 @@ struct dc_validation_set {
> >       struct dc_stream_state *stream;
> >
> >       /**
> > -      * @plane_state: Surface state
> > +      * @plane_states: Surface state
> >        */
> >       struct dc_plane_state *plane_states[MAX_SURFACES];
> >
>
