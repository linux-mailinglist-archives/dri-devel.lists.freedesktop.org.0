Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02D7D507A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 14:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5D010E390;
	Tue, 24 Oct 2023 12:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418A10E390
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 12:57:28 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5840bb16101so2597165eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698152248; x=1698757048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnNh0LRnjCLPjE/B6+4yEhPIsqvJNOCipSkYbYzorsc=;
 b=dzmvn2DnZGbtL7hvyzunAnxIQlMiSpLd5Olk5j7hLDuXrep3Yr4BpHYBSNQEekvzAY
 VNcbZ4F/cp60CGIze2nh9Up630e1mtqA974JIK+LKN+SVA6fyockkiWeBsn4bcD0LteY
 J1X1h9yLw3x1loYhtjOLuITRkSF8hJWEhCFVjYtz0de94+bW3RYCCejiVI08M2oI8iuu
 /CnMGZPYBxA6L+z7P4yT7BfC/Upqu6XKjSMW0lojb7SCxl0dfkZeZGFkTLUr18/mliTb
 2mROgd8gy4Yr8XXoDN8IefYmzz25VJKFi5dtqJr/jRTSiMRb2zQXfAzH/c8ulPOwrgQz
 NKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698152248; x=1698757048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnNh0LRnjCLPjE/B6+4yEhPIsqvJNOCipSkYbYzorsc=;
 b=X6LH8p0NvhcscFQ37Rw+Dko9mAr18dkydCRL0qV814BV32LhHfmeDouevx3MxIXUAM
 PbgWG3pXDd7uMzZNatF36mb+cByVdtZYVY6saaHCeeKj30UMuf748ZGjtN33LJku0WU2
 eeziC6ZvFrXp7yPkMeV/RupLlBnrtZSJXitpnInmqAKwJ8LvkgySAAUPC9zZR/ONlY2Q
 BPwlf7GcGNzZujDia4m9yxVJOMluuV34tu7dVgtIJtccQr7uiO9QOS4gguYiVwZjT/Vx
 w38crUPZ2+fkheObY+rvarLHMlDraHvtQuo04Jp0COMOXKPNIKkU4hPIZIz8WNQXO2zu
 Gf7w==
X-Gm-Message-State: AOJu0Yze3EmxLTgi8MfYgtDFk3VVYv//GiJyaWl7hY5SuVV5xn/8bO8u
 XCDK3AcoxxnIavdUD46kY+jtwr5VFAEoLqSX/uk=
X-Google-Smtp-Source: AGHT+IGzsmQgOu7FVSXytUl8xoOGDU4hlcS/YQUZmgz7buw+9C5uBE1jP5997/JEOCTssiaEhiIMBVKRhijVGl2jRaE=
X-Received: by 2002:a05:6870:e2ce:b0:1e9:d8a4:551f with SMTP id
 w14-20020a056870e2ce00b001e9d8a4551fmr14638728oad.17.1698152248003; Tue, 24
 Oct 2023 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231010124357.5251e100@canb.auug.org.au>
 <20231019120618.71424848@canb.auug.org.au>
 <20231024115903.2d73440c@canb.auug.org.au>
In-Reply-To: <20231024115903.2d73440c@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Oct 2023 08:57:16 -0400
Message-ID: <CADnq5_Od1cQFp=5__LexMKzXwtnmcmcAidE-XsLkL3N4oz+5sg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 8:59=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Thu, 19 Oct 2023 12:06:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Tue, 10 Oct 2023 12:43:57 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In=
 function 'dml_core_mode_support':
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:822=
9:1: error: the frame size of 2736 bytes is larger than 2048 bytes [-Werror=
=3Dframe-larger-than=3D]
> > >  8229 | } // dml_core_mode_support
> > >       | ^
> > > cc1: all warnings being treated as errors
> > >
> > > Caused by commit
> > >
> > >   7966f319c66d ("drm/amd/display: Introduce DML2")
> > >
> > > (or maybe something later that changed storage size).
> > >
> > > I have used the amdgpu tree from next-20231009 for today.
> >
> > This build failure now (presumably) exists in the drm tree.  I am still
> > applying the 2 patches from Rodrigo to my tree as a work around.
> >
> > I would have expected that this was fixed in the amdgpu tree before
> > Dave was asked to merge it ...
>
> Any progress here?  I am still applying the 2 patches.

The two patches are in my -next tree and in the PR I sent last week.

Alex
