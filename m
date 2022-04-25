Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB750EB59
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BA210E117;
	Mon, 25 Apr 2022 21:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3145010E117;
 Mon, 25 Apr 2022 21:55:49 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 m22-20020a056820051600b0033a41079257so3049063ooj.4; 
 Mon, 25 Apr 2022 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VRxcdf2w/jvgBn/u4RdkEXeiNvH19TSLvJDSRvR1heQ=;
 b=JmheJvyryMJtpqVWc5yk3qs+kDpkw5/AYBwMAAJ9S/yHT7qWf0WgTM5yH157BCuqqz
 ABnLL4htcJOjrRMHGRMc0eEg5K2G2FmWdA78ERk4N6OdcIVCDKjVMmbdbSviBlS856Wh
 5BrKL7kdyoG2wunDb0si928fF0y/g784bnByLh1ogTWakYahSOIqlRa2nzX62hShABDS
 WMIasoWg1V+K+1wex8bvsNtfzwf0McLxCG8HFL6Zv8fgstAKPaJzHBGvZmqJrtcxi1Tx
 nX5msTlvEb6cEkHd+meuTJrm69i2LeU5v9S0wjVeJMlDfVsyKoSwzXy0yyI3onsZj/b3
 T1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VRxcdf2w/jvgBn/u4RdkEXeiNvH19TSLvJDSRvR1heQ=;
 b=zaiozFPCv/Ua7uEMNz62+GiRd9kV5zOTjn/0kTVhk6t42vRJtMXOsjNqNyQERgpaDZ
 CSaq+twwEKXE7Z6zsFkF46mCW5cIn6p7ij3XYf0IwAnPydJgaugCZu1tXXUW9aqVvBnI
 f20EGbBEqxXchtMSYElzJ7JafkXyJnCm2f/jQbSW2Fo5kBluq77ZMRg65/aH2rNGbhoT
 aPdGeF/rb3Oa8Wl1drqy5QpVwTs4ocl4aYeYLRssN9rvMtALU+v0YM9J0/yOTxywmvZy
 qWlSSYHpXWOJHy3/a4N6qQVfoVFmOnZC9GDCaXhctT4CfOwD6rUgsCDM28Vm36B4zp3H
 Tyiw==
X-Gm-Message-State: AOAM533jbpA8pX58T5R00jpWZ8thMTUAo+26Yf8myTmfbBPWmZP9meG2
 CVA4eJHWvYizgUdsCqXX7PJ6uOgL2VwNJnzApBnrlKyM
X-Google-Smtp-Source: ABdhPJypMLKCwtGwU1ckiXgvI+GUpxa1h4lksUtuDOxtEZKqiuuAe7eWGYfwxzWaugWHVmzsmFt4IKY8MNzzKv28hVU=
X-Received: by 2002:a4a:5257:0:b0:33a:48e1:8e75 with SMTP id
 d84-20020a4a5257000000b0033a48e18e75mr7125313oob.68.1650923748478; Mon, 25
 Apr 2022 14:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220424090640.1865-1-guozhengkui@vivo.com>
 <DM4PR12MB52143C2204F820E49D377A519EF99@DM4PR12MB5214.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB52143C2204F820E49D377A519EF99@DM4PR12MB5214.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Apr 2022 17:55:35 -0400
Message-ID: <CADnq5_O5-PFqrvfL6y9q_KY2i9pLfjf2_ro-+iXr4HV3ki9Zqw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix if == else warning
To: "Liu, Zhan" <Zhan.Liu@amd.com>
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "zhengkui_guo@outlook.com" <zhengkui_guo@outlook.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, "Lei,
 Jun" <Jun.Lei@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Apr 24, 2022 at 4:15 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> > -----Original Message-----
> > From: Guo Zhengkui <guozhengkui@vivo.com>
> > Sent: 2022/April/24, Sunday 5:06 AM
> > To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo)
> > <Sunpeng.Li@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;
> > Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Air=
lie
> > <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Liu, Charlene
> > <Charlene.Liu@amd.com>; Lei, Jun <Jun.Lei@amd.com>; Guo Zhengkui
> > <guozhengkui@vivo.com>; Liu, Zhan <Zhan.Liu@amd.com>; Jos=C3=A9 Exp=C3=
=B3sito
> > <jose.exposito89@gmail.com>; open list:AMD DISPLAY CORE <amd-
> > gfx@lists.freedesktop.org>; open list:DRM DRIVERS <dri-
> > devel@lists.freedesktop.org>; open list <linux-kernel@vger.kernel.org>
> > Cc: zhengkui_guo@outlook.com
> > Subject: [PATCH] drm/amd/display: fix if =3D=3D else warning
> >
> > Fix the following coccicheck warning:
> >
> > drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c:98:8-10:
> > WARNING: possible condition with no effect (if =3D=3D else)
> >
> > Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
>
> Thanks a lot for fixing this warning.
>
> Reviewed-by: Zhan Liu <zhan.liu@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> > b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> > index fe22530242d2..05b3fba9ccce 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> > @@ -95,8 +95,6 @@ static void gpu_addr_to_uma(struct dce_hwseq *hwseq,
> >       } else if (hwseq->fb_offset.quad_part <=3D addr->quad_part &&
> >                       addr->quad_part <=3D hwseq->uma_top.quad_part) {
> >               is_in_uma =3D true;
> > -     } else if (addr->quad_part =3D=3D 0) {
> > -             is_in_uma =3D false;
> >       } else {
> >               is_in_uma =3D false;
> >       }
> > --
> > 2.20.1
>
