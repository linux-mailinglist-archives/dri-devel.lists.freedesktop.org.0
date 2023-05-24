Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F770FEBE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4F10E4D8;
	Wed, 24 May 2023 19:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E68110E095;
 Wed, 24 May 2023 19:50:39 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-55564892accso699463eaf.2; 
 Wed, 24 May 2023 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684957838; x=1687549838;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FltIaokl6US61SmteGHT2ZHdFzbBsYCMluzlsNH7Eo0=;
 b=AP1ELHPauM/XYUZc5qS9ndLT4WMva+aBaHm1pYtsTx1VEfCnRozy3iF4efGEjOeoFK
 w+57cNa7WZ7or57mRibrY9sqtjXQfEPCyon9DJS+I4tfwnbcjo93c2ojBKiSLYQU/QDF
 Qfpg13BJ7MAu8urcumV8LwA7WFyIxvD0/knPiqXeuwTGPGziOqAY/MN4xzJ7gvLVTsBf
 jE/FI6h87EbZNay1qjO8QRNfrBG7JWvFvT1ixYy1no1JNutkUhKcwvc9veHcfeqXp+bW
 kHbDtf1XjAOWjGhkB/soxOR1fiuGnGExdjmOgLlZzQ2JSDpJY3SYy//WL0WCRUkVVyjF
 W7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684957838; x=1687549838;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FltIaokl6US61SmteGHT2ZHdFzbBsYCMluzlsNH7Eo0=;
 b=jay/xvfsiupYkIfRASCb+YHMUrVnPcPe3giO7NdOoCP+Zijhp9lfAjpz2a9C+Put2Z
 UBYvBSkA8R6BD3Bm2pU5kBbBW8fmP4IKgb/EWHdlAl+W2vkvelo2FTthkfYNmIlgqQQX
 MaQwmrjegrBeG7HxNHl7FO+gMvnyvbVqUZ8HzYti3tjqIU0WlD5/Mo3U09tbKtW0DRcH
 z7OzOwDo7rdJbdAPh9+7D+UBkAQKBo9fcK8b5jWCwv6feAe+z/kdyuVNnQFqvfFEUEdL
 8LqTgroXQXd97RirzGw1VE4W0GxOgzajRDVWImPQkPHdPisNHDTE1iIm5B3aDtvoqdki
 +S6Q==
X-Gm-Message-State: AC+VfDz+2XEJZKXhYEbMtGzwoqvxcFEuOGvRMyOayE7umzdWkWv1sQKX
 zO56F4pmwvJ3s9UNYTbaWoWcQTLLW/01XjnEo38=
X-Google-Smtp-Source: ACHHUZ5phGsstqTL/HGb4xw/DFAIglHfkZRy/nFUcrYNP92cyOgPNC1xID5jsm5zX9Yc/biCl0nfqoak7gA2iDavfZQ=
X-Received: by 2002:a4a:6107:0:b0:54c:8991:5f8b with SMTP id
 n7-20020a4a6107000000b0054c89915f8bmr8782798ooc.5.1684957837694; Wed, 24 May
 2023 12:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230524191955.252212-1-hamza.mahfooz@amd.com>
 <CADnq5_Mz6aPFYGnr8J8C8UeTpbo7JDg+uvjqAxo7o4vmTGej2A@mail.gmail.com>
 <DM6PR12MB3996C4248CBC968A7B08341583419@DM6PR12MB3996.namprd12.prod.outlook.com>
 <BL1PR12MB589849F37FBE98A3A06A316185419@BL1PR12MB5898.namprd12.prod.outlook.com>
 <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
In-Reply-To: <3fefc712-913a-a391-bc7b-c0c75eff1c3d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 May 2023 15:50:26 -0400
Message-ID: <CADnq5_OdWbg6zKjPrRwd2QSDnHgFuThF+OQHM=tVWj-2ySCu_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: enable more strict compile checks
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Ho, Kenny" <Kenny.Ho@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Russell,
 Kent" <Kent.Russell@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 3:46=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com> wrote:
>
> Sure, I think we tried enabling warnings as errors before and had to
> revert it because of weird compiler quirks or the variety of compiler
> versions that need to be supported.
>
> Alex, are you planning to upstream this, or is this only to enforce more
> internal discipline about not ignoring warnings?

I'd like to upstream it.  Upstream already has CONFIG_WERROR as a
config option, but it's been problematic to enable in CI because of
various breakages outside of the driver and in different compilers.
That said, I don't know how much trouble enabling it will cause with
various compilers in the wild.

Alex

>
> Regards,
>    Felix
>
>
> On 2023-05-24 15:41, Russell, Kent wrote:
> >
> > [AMD Official Use Only - General]
> >
> >
> > (Adding Felix in CC)
> >
> > I=E2=80=99m a fan of adding it to KFD as well. Felix, can you foresee a=
ny
> > issues here?
> >
> > Kent
> >
> > *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of
> > *Ho, Kenny
> > *Sent:* Wednesday, May 24, 2023 3:23 PM
> > *To:* Alex Deucher <alexdeucher@gmail.com>; Mahfooz, Hamza
> > <Hamza.Mahfooz@amd.com>
> > *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Wentland, Harry
> > <Harry.Wentland@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira,
> > Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org;
> > dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Daniel
> > Vetter <daniel@ffwll.ch>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Koenig,
> > Christian <Christian.Koenig@amd.com>
> > *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
> > checks
> >
> > [AMD Official Use Only - General]
> >
> > [AMD Official Use Only - General]
> >
> > (+ Felix)
> >
> > Should we do the same for other modules under amd (amdkfd)?  I was
> > going to enable full kernel werror in the kconfig used by my CI but
> > this is probably better.
> >
> > Kenny
> >
> > -----------------------------------------------------------------------=
-
> >
> > *From:*Alex Deucher <alexdeucher@gmail.com>
> > *Sent:* Wednesday, May 24, 2023 3:22 PM
> > *To:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> > *Cc:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>;
> > Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Ho, Kenny <Kenny.Ho@amd.com>;
> > Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo
> > <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org
> > <linux-kernel@vger.kernel.org>; dri-devel@lists.freedesktop.org
> > <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>;
> > Deucher, Alexander <Alexander.Deucher@amd.com>; David Airlie
> > <airlied@gmail.com>; Wentland, Harry <Harry.Wentland@amd.com>; Koenig,
> > Christian <Christian.Koenig@amd.com>
> > *Subject:* Re: [PATCH v2] drm/amd/display: enable more strict compile
> > checks
> >
> > On Wed, May 24, 2023 at 3:20=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@am=
d.com>
> > wrote:
> > >
> > > Currently, there are quite a number of issues that are quite easy for
> > > the CI to catch, that slip through the cracks. Among them, there are
> > > unused variable and indentation issues. Also, we should consider all
> > > warnings to be compile errors, since the community will eventually en=
d
> > > up complaining about them. So, enable -Werror, -Wunused and
> > > -Wmisleading-indentation for all kernel builds.
> > >
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Kenny Ho <kenny.ho@amd.com>
> > > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > ---
> > > v2: fix grammatical error
> > > ---
> > >  drivers/gpu/drm/amd/display/Makefile | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/Makefile
> > b/drivers/gpu/drm/amd/display/Makefile
> > > index 0d610cb376bb..3c44162ebe21 100644
> > > --- a/drivers/gpu/drm/amd/display/Makefile
> > > +++ b/drivers/gpu/drm/amd/display/Makefile
> > > @@ -26,6 +26,8 @@
> > >
> > >  AMDDALPATH =3D $(RELATIVE_AMD_DISPLAY_PATH)
> > >
> > > +subdir-ccflags-y +=3D -Werror -Wunused -Wmisleading-indentation
> > > +
> >
> > Care to enable this for the rest of amdgpu as well?  Or send out an
> > additional patch to do that?  Either way:
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Alex
> >
> > >  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
> > >  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
> > >  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
> > > --
> > > 2.40.1
> > >
> >
