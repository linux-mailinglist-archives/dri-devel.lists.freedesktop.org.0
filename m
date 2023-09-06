Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF7793ED0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6704F10E676;
	Wed,  6 Sep 2023 14:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310510E67B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 14:31:11 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so586133766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694010667; x=1694615467;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+7p6NMsxOjRyL4QMAB/bB/PBWKoduMJyy2zj/3BYKM=;
 b=On/qjycs0rVawfU65hg7g2exBWHjyADElKmrbfOIitMja7g2E5AQ5Q2ee2uSjOZgyK
 jzTXo7Zo61B3z+Dr53bPI3RTbDPxvJbVDPYWHeDzjW5q4PdO/UtCH/Y2FUh3N5qdz7Ns
 do2W2+S6a9P08lS1sTuW1ojSgir4ubQCmhFPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694010667; x=1694615467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+7p6NMsxOjRyL4QMAB/bB/PBWKoduMJyy2zj/3BYKM=;
 b=WIVZwF5MYfKA9ltV3b9eaVm7P+fTscwz1w+uKpVuJl4JZmXzepbcAHhT3bk4I48pea
 HqQ09ry+ShOBnc9Ex1LiiFFpTnKC3VAN+VMH7LipuyMM9cZtGGr5qLDVqe5htyqXFMEv
 WY10xcMuCOgchFdtMaumYsTPaFMKUkHC06bOR31+G4kjnABPPZxhYvY/guFfn0toSA/5
 7eqAER/bjGfGiSfGTkNDuhQlEjWbDRwwVpJdnUfKatD3awH2m+/2BtDeNhcPfc+15OOY
 poCqlZkmrpPFJB35HabeqI6bxROEnYUeaDq0jr25PZQoj8yayPlv5lHner1NCzLua6H2
 DYjg==
X-Gm-Message-State: AOJu0Yz/pl5XGeEfEdGzpbmCAPzdcBdoycKyCDbm8uInuQS5gO8h2+nm
 WRAyRFO9ygW8qTDSwnxiinkH7tEvngZcSyrP+etObdY1
X-Google-Smtp-Source: AGHT+IGlQ0+hqfR7b8jAaZgiPJQpRbdBOIblP8N11Y8cfqM7M/ZGu82GN90yyczA5HhUVgQZUvA7Rw==
X-Received: by 2002:a17:906:5388:b0:9a1:d915:d8dd with SMTP id
 g8-20020a170906538800b009a1d915d8ddmr2527618ejo.10.1694010667449; 
 Wed, 06 Sep 2023 07:31:07 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 i7-20020a170906444700b0099297c99314sm9098658ejp.113.2023.09.06.07.31.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 07:31:06 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso95865e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 07:31:06 -0700 (PDT)
X-Received: by 2002:a05:600c:5493:b0:3fe:eb42:7ec with SMTP id
 iv19-20020a05600c549300b003feeb4207ecmr115838wmb.1.1694010665909; Wed, 06 Sep
 2023 07:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
 <32186b941d6228a102b5e799aadf34206b58ac15.camel@pengutronix.de>
 <CAD=FV=WLw3cAU0nuNuKXiu=Zbv4tVa3aa35GFaxsjO880T0pmw@mail.gmail.com>
 <d56dfb568711b4b932edc9601010feda020c2c22.camel@pengutronix.de>
In-Reply-To: <d56dfb568711b4b932edc9601010feda020c2c22.camel@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Sep 2023 07:30:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ=O5oMKcBSh0qD=ZXUpRgvV8HCheABL7s-T_u+6TsHg@mail.gmail.com>
Message-ID: <CAD=FV=XJ=O5oMKcBSh0qD=ZXUpRgvV8HCheABL7s-T_u+6TsHg@mail.gmail.com>
Subject: Re: [RFT PATCH 13/15] drm/imx/ipuv3: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 5, 2023 at 10:47=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Hi,
>
> On Di, 2023-09-05 at 13:29 -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Sep 4, 2023 at 1:30=E2=80=AFAM Philipp Zabel <p.zabel@pengutron=
ix.de> wrote:
> > >
> > > On Fr, 2023-09-01 at 16:41 -0700, Douglas Anderson wrote:
> > > > Based on grepping through the source code this driver appears to be
> > > > missing a call to drm_atomic_helper_shutdown() at system shutdown t=
ime
> > > > and at driver unbind time. Among other things, this means that if a
> > > > panel is in use that it won't be cleanly powered off at system
> > > > shutdown time.
> > > >
> > > > The fact that we should call drm_atomic_helper_shutdown() in the ca=
se
> > > > of OS shutdown/restart and at driver remove (or unbind) time comes
> > > > straight out of the kernel doc "driver instance overview" in
> > > > drm_drv.c.
> > > >
> > > > A few notes about this fix:
> > > > - When adding drm_atomic_helper_shutdown() to the unbind path, I ad=
ded
> > > >   it after drm_kms_helper_poll_fini() since that's when other drive=
rs
> > > >   seemed to have it.
> > > > - Technically with a previous patch, ("drm/atomic-helper:
> > > >   drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> > > >   actually need to check to see if our "drm" pointer is NULL before
> > > >   calling drm_atomic_helper_shutdown(). We'll leave the "if" test i=
n,
> > > >   though, so that this patch can land without any dependencies. It
> > > >   could potentially be removed later.
> > > > - This patch also makes sure to set the drvdata to NULL in the case=
 of
> > > >   bind errors to make sure that shutdown can't access freed data.
> > > >
> > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Thank you,
> > > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> >
> > Thanks! I notice that:
> >
> > ./scripts/get_maintainer.pl --scm -f drivers/gpu/drm/imx/ipuv3/imx-drm-=
core.c
> >
> > Doesn't say drm-misc but also when I look at the MAINTAINERS file and
> > find the section for "DRM DRIVERS FOR FREESCALE IMX"
>
> That should probably say "IMX5/6" nowadays. There are a lot more i.MX
> that do not use IPUv3 than those that do.
>
> > it doesn't explicitly list a different git tree.
>
> I used to send pull requests from git.pengutronix.de/git/pza/linux,
> same as for the reset controller framework. I might still have to do
> that for changes in drivers/gpu/ipu-v3 that need coordination between
> drm and v4l2, but usually pure drm/imx/ipuv3 changes are pushed to drm-
> misc.
>
> > I guess the "shawnguo" git tree listed by get_maintainer.pl is just
> > from regex matching?
>
> The "N: imx" pattern in "ARM/FREESCALE IMX / MXC ARM ARCHITECTURE", I
> think.
>
> > Would you expect this to go through drm-misc? If so, I'll probably
> > land it sooner rather than later. I can also post up a patch making it
> > obvious that "DRM DRIVERS FOR FREESCALE IMX" goes through drm-misc if
> > you don't object.
>
> Yes, both would be great.

Maintainers update posted at:

https://lore.kernel.org/r/20230906072803.1.Idef7e77e8961cbeb8625183eec9db03=
56b2eccd0@changeid

I'll aim to land ${SUBJECT} patch early next week unless there are any
objections.

-Doug
