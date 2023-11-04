Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E97E0EA7
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 10:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A351F10E1FF;
	Sat,  4 Nov 2023 09:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E3010E1FF;
 Sat,  4 Nov 2023 09:42:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso429797566b.1; 
 Sat, 04 Nov 2023 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699090968; x=1699695768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbfL3NkpfKmXRCHooSUmBGmgS2c222w1KL1iym/+IkE=;
 b=GE4zXpmod9A0z06yzSrJugzKOoAwoetzZtpN/9qwSd1xfWaQB9p49wjok2DIQcgb2e
 71wToTRe6ZbP3eFhGhCeJwrpKhbaKgFz5HEQdkXrUh8j5kEZble4wu7Pi52EQxvh/c+F
 kiXcXUukb2mWqSiKvp3aDc5KZuo9Pl4q8SgTHGLyWoNzNESvGGu7OQ0o6JNPbd379hFG
 RYGWyZgNKsRNUzXke3ZniA0Z3+uQe7R4ZdB+rVMSkuHzq/otBoRl7fUCDuupX4S8qPhM
 OSu+IbAxkY938NchlsXg46zwwbNXNzfcBTUdsr40A2J+boUb7iXxGqXF/BZLWVCShWhf
 pGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699090968; x=1699695768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbfL3NkpfKmXRCHooSUmBGmgS2c222w1KL1iym/+IkE=;
 b=DyyfO2/ff5FTvVExjTLCcFLnhQEH4fkb82IC29/pzj1h7kANZLMrWJl7XcXNp6isSg
 ottS2o2i4x2eacKXd6zL2qIXVRzyXKHusGiDb6aljyqI0nuLfuA6+k2FAracJKH15xYo
 N08kSBsPFr0aStkgEFwrnQ2rQp2eYhvr2XklfAlMFi4CBu2cNkjt6FNptko+fei+1m2L
 dsUM0goUqkxbF7Lg+JNQDu99cZXqIFRVtB/iLYbUbxmgj4lDQMqdL5Vm5s5CFl7TkNQK
 S3yPOXD3DMAE/msh5FMhr5jQw5bW+BerniyEC3aeNQ+3QXmf+H16w5tkqeIk1NORKbXj
 Oeuw==
X-Gm-Message-State: AOJu0Yy+axyjhixIg2Sk+WfeIoHECgud/dTbsrg/Zob6QPFYcpwxEz7P
 MDUrRhFP5ddrXpvXWHsjpBBsSrkHgZ133Ii7gnY=
X-Google-Smtp-Source: AGHT+IFAHNDkINjU+Y5YPivroCWJYoBJBuwLvpBetinur2scmP7PDHWMEUo6pHc1DTONAZV4gYyQrLs4lzdWmyR0oUc=
X-Received: by 2002:a17:907:1b02:b0:9ae:82b4:e309 with SMTP id
 mp2-20020a1709071b0200b009ae82b4e309mr9393758ejc.0.1699090967781; Sat, 04 Nov
 2023 02:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian>
 <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
 <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
 <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
In-Reply-To: <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 4 Nov 2023 09:42:11 +0000
Message-ID: <CADVatmN4njCTGxNPjtpX9gdaySUxW07petaRP1uOzHaQNxf7fQ@mail.gmail.com>
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
To: Alex Deucher <alexdeucher@gmail.com>
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

On Thu, 2 Nov 2023 at 22:53, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Nov 2, 2023 at 1:07=E2=80=AFPM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote=
:
> > >
> > > On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> > > <sudipm.mukherjee@gmail.com> wrote:
> > > >
> > > > Hi All,
> > > >
> > > > The latest mainline kernel branch fails to build x86_64 allmodconfi=
g
> > > > with the error:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: =
In function 'dml_prefetch_check':
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6=
707:1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werr=
or=3Dframe-larger-than=3D]
> > > >  6707 | }
> > > >       | ^
> > > >
> > > > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML=
2")
> > > >
> > > > I will be happy to test any patch or provide any extra log if neede=
d.
> > >
> > > This was reported earlier and fixed by:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> > > but I guess maybe different compiler versions are still hitting this.
> >
> > Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
> > gcc-13 was ok.
>
> Should be fixed with Nathan's patch:
> https://patchwork.freedesktop.org/patch/565675/

Yes, it does. Thanks.

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


--=20
Regards
Sudip
