Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76C3A1EB8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29CD6E3D6;
	Wed,  9 Jun 2021 21:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CCF6E23B;
 Wed,  9 Jun 2021 21:15:16 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 q5-20020a9d66450000b02903f18d65089fso9154312otm.11; 
 Wed, 09 Jun 2021 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dY+o+I9YjgbuQFjtJhzXCirY8XIoJgc7jb+LLRGuVWA=;
 b=lEOrWAPpo2TsONLfsPjgQPQC9Tu4QsDNPlsEUKIXEz4YxGJVCpHENODUaM6m7OviLq
 Bnj0yTT8MvCdR19LCH0siDvvsVYXKAETz9RGDZ0XxWe6jeyi9R1haz65c0sJFHeuQOwu
 9MhJSdT6f4eqlLrtkcNSC4zKZhqFNp5DqALmMsll4yKvg5u7VFRJNdwfact5oEv2vXPQ
 +XOORacSrKvKSkOM8NbvTMClS460eOZg13G11KBrJmsL8JiMaAr0LIZWthji5jXXLHEm
 t7G1DUGGNoPd/sbF9devLtX1SOhixREe5XufyrcwxAs6KFbdMPWs4zjP+6AzWsSaEcDy
 MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dY+o+I9YjgbuQFjtJhzXCirY8XIoJgc7jb+LLRGuVWA=;
 b=jb/JMn6KcQ07TiYh0bUXbQJLQgP3BRVsokQ82bZ/TWLsqSuuAYMcVrEH4W2Ag0Hdz5
 0iP4gufYdQ28yPoCwNPxiwYQvLhYzCO46bvsxiWXiL91SX3Ad+JXKgdJmsM5WshuadZi
 wsaYcWJpMIW+ydC5bw8LaBDv8Le72ZP45Rmiw3MNydo0B34EMnZ9m+JiYBYEz0HPA8Rb
 SL/GHO+h5IcOmq3lerOV4O52IOvocIOZzJXFmgYMlF64TFzuaVi1oBMAKycIrvYriD6a
 UurpkQimjzZfumGkZBrWuYjOMdDsPIgfXlkcnv4TgJE7nI+xUb2aLj5S6gwC0jhPriqp
 ovFg==
X-Gm-Message-State: AOAM532GXfKW2v0FtuA3Jt0sHbXfx0qmReoLHGu7EZZZOrUcF/rPo/X2
 BKf7bk0hJdklghWgNxY1py3azhOyNHU3GCGPITZtgoWs
X-Google-Smtp-Source: ABdhPJw8Yyop7qFQOPrXtKB6YTNlg7AEsfSxxuZALWB8KJBhbngOYLJMNMfXSMkgU5D05gk41DvORh3q41sGtOPxNpM=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr1157634otr.23.1623273315719; 
 Wed, 09 Jun 2021 14:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210609030202.113368-1-wanjiabing@vivo.com>
 <20210609184756.rewxv73j2jj4bfys@outlook.office365.com>
In-Reply-To: <20210609184756.rewxv73j2jj4bfys@outlook.office365.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 17:15:04 -0400
Message-ID: <CADnq5_P_npH90e6Vjr2qjsYbx2fF3MnerjJy=SzVM5ANR+EQcw@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Remove duplicated argument in dcn31
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Chris Park <Chris.Park@amd.com>,
 Anson Jacob <anson.jacob@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Colin Ian King <colin.king@canonical.com>, Leo Li <sunpeng.li@amd.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jun 9, 2021 at 2:48 PM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 06/09, Wan Jiabing wrote:
> > Fix the following coccicheck warning:
> > ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
> > 3539:12-42: duplicated argument to && or ||
> > ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
> > 5677:87-123: duplicated argument to && or ||
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > ---
> >  .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> > index d655655baaba..06fac59a3d40 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> > @@ -3536,7 +3536,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 4;
> >               *BytePerPixelC = 0;
> > -     } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> > +     } else if (SourcePixelFormat == dm_444_16) {
> >               *BytePerPixelDETY = 2;
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 2;
> > @@ -5674,7 +5674,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
> >       for (k = 0; k < v->NumberOfActivePlanes; k++) {
> >               if (v->ViewportWidth[k] > v->SurfaceWidthY[k] || v->ViewportHeight[k] > v->SurfaceHeightY[k]) {
> >                       ViewportExceedsSurface = true;
> > -                     if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16
> > +                     if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32
> >                                       && v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_444_8
> >                                       && v->SourcePixelFormat[k] != dm_rgbe) {
> >                               if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k]
> > --
> > 2.20.1
> >
>
> + Anson
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
