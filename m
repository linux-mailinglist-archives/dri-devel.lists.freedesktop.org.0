Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C67DFCA8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3010E2C3;
	Thu,  2 Nov 2023 22:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3C10E189;
 Thu,  2 Nov 2023 22:53:22 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1f05247791fso614482fac.0; 
 Thu, 02 Nov 2023 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698965601; x=1699570401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywkZ1ZWfNmiVp7a6UPS372ot5uoGxaI4T7nCnN1k30I=;
 b=H8YvvuO3sGoOkuMF2Tc4+BxQsxX6Vx7oZwaTy92vBhTmnAD1/snqMNFg64F/kOX6zl
 GUmTGN81kDALSWGyukWykoKDUHTLcN8sZE+xjOO7SU77L6XQ1petr0If0r3sKyyfRSS7
 JC4udZK8jnLQ/+NvN0/FUJAtzrAcGc96Z8D+gIH+v93MSqwiZEL+wz+CXDVFpI/N8eKi
 fP8RB+qNxVL6i0HIs3wci9sTf4qFzhw7MfoW4g7PjVJ59y3z9mSoZHRqI1OrjUwDY/KZ
 w/cqdZfBgbgX4GTx7lLYCA4kIQsnPg7ABWaqS8+uPf6D6IAY5snaUMeExBLX8vWxqbXh
 Rjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965601; x=1699570401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywkZ1ZWfNmiVp7a6UPS372ot5uoGxaI4T7nCnN1k30I=;
 b=To6WAKgEu9BX6eL86jmJ4gKIRQPnn4HpU68ZakNrjqryC7rJJRc+kbn4fxAotc7jVM
 2S6NTycrzciXhol/gKivsmCO9AqwCj9Q0CcP5vMtyq6bnJ8UyzjGbC3AdGM5i5JutVjl
 9HeEOKUb5w7w2Fs7f8jNjytqg9a46fqWHvOi5mcOdpamTnLvv+r5+rRIBRzQJuzhywWi
 kGxauHqKQJZrFVcq3umlxp671ffky8ACHzAGySQdp8WbsNglp0xoxmCY5iMkxsERSPqN
 dTwrkZmgTbktKhmEkSUixDoMisTaH0n04IctuYI7EyEdkK0zNyQA5FbL/LF2nge9Iu1V
 odvw==
X-Gm-Message-State: AOJu0YyeISQ/Zf1VZkdSD2PiSz/d3k5fpt2jutEiBkVYAYR2xUMg3x0L
 +AZjTFjRd6sQ4dR8TC9qPQWHBiTPnFAUWX07ldU=
X-Google-Smtp-Source: AGHT+IE1yCCtzM/K8cFr0IT8oP2y3RjE6Uh5RrkvdH5l8sS2cDigljS/xmdpOFoQ2Ifca4c1s8xNpN5SqSINFrPB+PA=
X-Received: by 2002:a05:6870:2007:b0:1dc:c65e:ded2 with SMTP id
 o7-20020a056870200700b001dcc65eded2mr24706945oab.12.1698965601603; Thu, 02
 Nov 2023 15:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian>
 <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
 <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
In-Reply-To: <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 18:53:10 -0400
Message-ID: <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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
Cc: regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "linux-kernel@vger.kernel.orgLinus Torvalds" <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 2, 2023 at 1:07=E2=80=AFPM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Hi All,
> > >
> > > The latest mainline kernel branch fails to build x86_64 allmodconfig
> > > with the error:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In=
 function 'dml_prefetch_check':
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:670=
7:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=
=3Dframe-larger-than=3D]
> > >  6707 | }
> > >       | ^
> > >
> > > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2"=
)
> > >
> > > I will be happy to test any patch or provide any extra log if needed.
> >
> > This was reported earlier and fixed by:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> > but I guess maybe different compiler versions are still hitting this.
>
> Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
> gcc-13 was ok.

Should be fixed with Nathan's patch:
https://patchwork.freedesktop.org/patch/565675/

Alex
