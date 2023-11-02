Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AE7DF855
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0359C10E94E;
	Thu,  2 Nov 2023 17:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3417710E94E;
 Thu,  2 Nov 2023 17:07:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so186393066b.2; 
 Thu, 02 Nov 2023 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698944874; x=1699549674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xl4I+HvP3J5ZJKuSb/CouLtm+Hi9ya1nTcmqWDQztKk=;
 b=k9eIHhZ3QjwMneqjVet8LSC/ri0rn6C6dyUTeBKXMSCsIYL4IuajSE3WRrowpvwEjV
 cDQHKHSZ9wHOkOh5oeAP9UPtITdr3Fz0C20uyMRG+mgfWeWgCzD9XWMXKkQdnQoJkSnC
 Aj5OvT3gZ2ak/DE53eojwbMA78Co5oOqdhqxBqd9cCAMayHhfGBj+gIjfsdIbALcrS34
 joSXq37H2zKzkdFO0TbCEfICMZa1d3S+lGLTmf6Cc0OIgb60RBv/GQbubXi30OXhg5c3
 wdMRFWIA1Ijl8vz2TvTRyPV60UkQrEZQw0fG7AOh1/TCaBSxl6/2iv8Nqo9ldsd8HUhf
 PpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944874; x=1699549674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xl4I+HvP3J5ZJKuSb/CouLtm+Hi9ya1nTcmqWDQztKk=;
 b=SBI0FxdekOt18Bl7Fui30Okd9dNGb4wnIXzWNpCWRh1mB96yuagnFWyLMxFCDLP+/v
 fE4ulytdugdBwddzPG6D1SiSsGcv4SpAtSJjzBYtqaEgZubjs+RB0vJe1XhgLYeKhxgB
 Xo+IoAp/If6Nl89aSNylz4/fAKaXWSGUnq2yURPHLdG63lG5bQwvV7Ye/wC7idswRAfP
 TmigKpvK1Jkqiong4BgECd0yOAXbeFDc+7xILlu3fI9qpBOUQvkwwjpITiZd2Ma4jlou
 /UcNpfZ+zifIK0qZcf32p5EfjRsqqYGqDDw9kG4dMMJFE5+7mm+Fr+uI1QuRJ/hbpVAq
 Fmbw==
X-Gm-Message-State: AOJu0Yzbh1NzmyachCWLtQhyw3oav9f7Of4dFCiWhgaPnKM+mt740Z5W
 t5tzAn01N/w0PObEoSW7LGjzSAGFXGoA/bGOFqo=
X-Google-Smtp-Source: AGHT+IELCuRpMJYiWl0Qrpfp672D7mV32NZ7IqUrU0Waf2iuqATWpRIDQA27z7e6YAK1wp9d4NaPJSOdvn5cL7zLluI=
X-Received: by 2002:a17:906:d552:b0:9be:77cd:4c2c with SMTP id
 cr18-20020a170906d55200b009be77cd4c2cmr3767379ejc.28.1698944874378; Thu, 02
 Nov 2023 10:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <ZUNsmJGbYwgPaUpY@debian>
 <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
In-Reply-To: <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 2 Nov 2023 17:07:18 +0000
Message-ID: <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
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

On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Nov 2, 2023 at 5:32=E2=80=AFAM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Hi All,
> >
> > The latest mainline kernel branch fails to build x86_64 allmodconfig
> > with the error:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In f=
unction 'dml_prefetch_check':
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6707:=
1: error: the frame size of 2056 bytes is larger than 2048 bytes [-Werror=
=3Dframe-larger-than=3D]
> >  6707 | }
> >       | ^
> >
> > git bisect pointed to 7966f319c66d ("drm/amd/display: Introduce DML2")
> >
> > I will be happy to test any patch or provide any extra log if needed.
>
> This was reported earlier and fixed by:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D089dbf6a06f1dcaeed4f8b86d619e8d28b235207
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db141fa036c901303ca5659cc22e9c08f8b097892
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D5b2c54e0d0ea09f7a3b500510731878326e1117e
> but I guess maybe different compiler versions are still hitting this.

Yes, I should have mentioned. gcc-11 and gcc-12 failed to build. but
gcc-13 was ok.


--=20
Regards
Sudip
