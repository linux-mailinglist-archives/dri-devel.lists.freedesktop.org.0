Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3113AD3B9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 22:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FD6EA9B;
	Fri, 18 Jun 2021 20:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798F6EA9B;
 Fri, 18 Jun 2021 20:39:02 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f3-20020a0568301c23b029044ce5da4794so4331740ote.11; 
 Fri, 18 Jun 2021 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nD7oBPgnsjHovc35dRV1EnwyKD64NWmMZBEUkjTpRAk=;
 b=bGHfYJiF4w7UHvnhqHzUBV+Ocgv62RTKy3BxvmluYs4zlE/oYdP/GZh0yLoAUPEWh1
 A6ZcK/H8jDWibtdxxdXdCkYiAlEShhADL9i2UuTxii+K77qGd67UpmhzRj3UxcAwwchW
 Q6k+Z/Gfa2zMpoaYir5dJd/i17pGQvvYrIKwpZ37T4jLyREwlDiQUkEY0KkBn1b9CtJj
 yx381egCru++BfsAG6YSUh9sgwhnS08kk0VeSOvSpnCyUhOg2W8qXXuSoe6xgcbpNVwr
 /Na7pmK4QRtt7mggyF9Zj4Mn6czrKIyiirzIIH97wQXuopVuLBBUepMk3e0pt3GlCuLt
 arOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nD7oBPgnsjHovc35dRV1EnwyKD64NWmMZBEUkjTpRAk=;
 b=Jx/imcECBJwbaZJIP4P8tOQlLGausOWMiuCXo73qJNfAAU7dK8jc8yyXNiosaAKLhn
 Vn1+XZpQXT+N+y3XhQwgdaJxB44OQ7ggxvidWOeg8XHVMaZI6zJ3rqxfAni7f8XPrVIl
 vvNrYkVibDpf8fVHUbp6QvGG5gvtWqTg8SrNrrK64JmEubUqPla0ZSzGIqnpOPhS4Kub
 8WepHW+IvVqYDkTaR2Qvbb7S/wi1qVPWyAIqmXYf1dg9LkMOTYkCdh+EYFxJAK/io+jo
 2gBTmh4KP9t5YY+BC0Tr/pZsWBn+4ZdvYK71yK3YI/vKGZ+nL7YxGz16W4F38Ufd9GiD
 vMjw==
X-Gm-Message-State: AOAM531VvpQReXu61TB+H+rO63LYUoQa0fJ1fIu6GvUJItGVI6xb/4Z5
 aOYry95Yw+OWGkDHAkKc+h0lFoafLo8nzGNIQDM=
X-Google-Smtp-Source: ABdhPJxwuxAhIXgJOKbxs/TF2vViARLkV53PxnduNs8KxpXsryq2O+j1c5KXo1dVlz0GX1vgCOd/a6t/8ZOOgIn2y6k=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr11039021otr.23.1624048741539; 
 Fri, 18 Jun 2021 13:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210616144027.27225-1-wanjiabing@vivo.com>
 <0c0c719e-d8fe-b548-80cd-c498642a6c3c@amd.com>
In-Reply-To: <0c0c719e-d8fe-b548-80cd-c498642a6c3c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 16:38:50 -0400
Message-ID: <CADnq5_M-i-NzvCm5DVaRGsM2G+cR_rRmbisPwbd-4ynM8O3mWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/display: Fix duplicated argument
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, Solomon Chiu <solomon.chiu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Jun 18, 2021 at 9:56 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2021-06-16 10:40 a.m., Wan Jiabing wrote:
> > Fix coccicheck warning:
> >
> > ./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c:
> > 55:12-42: duplicated argument to && or ||
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  .../gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c   | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> > index cb15525ddb49..dc8b3afef301 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> > @@ -52,7 +52,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 4;
> >               *BytePerPixelC = 0;
> > -     } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> > +     } else if (SourcePixelFormat == dm_444_16) {
> >               *BytePerPixelDETY = 2;
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 2;
> >
>
