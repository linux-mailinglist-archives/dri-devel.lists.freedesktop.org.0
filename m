Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE376815F1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 17:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B563010E056;
	Mon, 30 Jan 2023 16:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBAD10E033;
 Mon, 30 Jan 2023 16:05:35 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1636eae256cso11290089fac.0; 
 Mon, 30 Jan 2023 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=51bRkvWujNd4jPcMG9BJhLnAdVGH8Ah/pwvY7OLYBxg=;
 b=L98bAAgAmuX9bFEDS6fk6Q+27l6gFYkFOLbjKNDsS8RTOTjiBEdK702pVpPk8K8v2x
 FZ40wxfCgagdDgLZgDQSMy99FG0HrFXxnw5fTYnrvOwXT+BwXCieEpFIg3/SsmQJP+EC
 kDBQkrBuzGcoU7ndvROuyFWLZFE/ctHdUqpLQ8WEW7ATErXDt8JgWyaIg4+oPKIiIIG2
 E/5aPbIUxghZjhtNR71JXB5xvYRjiu0AUliaWGmF3G0g05pRTLYrCoXS9OGzaRGBOFGs
 DpgHoQDXj4lObIjncle+96AxxcpMoBLOLxT1OwqPpaSjYjWU66vw4Foj9apT1oscVN7h
 RTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=51bRkvWujNd4jPcMG9BJhLnAdVGH8Ah/pwvY7OLYBxg=;
 b=mgNIka54hnXtMzhq3yZbY1/whFq9auPBAvhjqa4lzq+UVXVq2MV72fyE/FJpyDdoFd
 5mQ+TM0h7fbTvE4Vb3yTMlOxi3v9XEN097rLt8mSNBFoKTuQzIQC/8UES/EEV9wrdbPW
 Mggf9jkF55+BQKZde6Y8KQWHvnVVpg6j0ULWROwvLGTBs7XD3fVAPdZMykzTyy2XqOIB
 vH+tsPo7RxJ/t0H+NnEaeai0vvMpUzm/hRzK0+873BrBttmUYl4suuJw+3PTxCGEu1SW
 T6Xea2Ce1pTXVzatzsos/0gjb/9ximmKmd3ihl8Nb1uOn3X9Tv+KvPITYLLtBAFazP38
 P9hw==
X-Gm-Message-State: AO0yUKWl9i2LYh0APk+pkfCsnycK2S2HiAAS6FZAuAqMoR3U1V1rp3QN
 BgjGgffCE26SrdonxjcBMqzryRtGy393BQf9SVc0SlyW/m8=
X-Google-Smtp-Source: AK7set8EqeKjODeZxYSFoNuOQNRomzjZI0eXWH0l8P+aWs8vNWEn7kSRbZqFFz4w7fzpO/miv8K0++Fx3wa5+PLBAtg=
X-Received: by 2002:a05:6870:4588:b0:163:3c39:d0c7 with SMTP id
 y8-20020a056870458800b001633c39d0c7mr1249465oao.54.1675094735057; Mon, 30 Jan
 2023 08:05:35 -0800 (PST)
MIME-Version: 1.0
References: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
 <20230127103959.5nqk57sb7qchtaw6@wslaptop>
 <CACAvsv5sA8pmhYEVhJk9PEAWyKRZYvcsSHa-04CsJxgu7+YEiw@mail.gmail.com>
In-Reply-To: <CACAvsv5sA8pmhYEVhJk9PEAWyKRZYvcsSHa-04CsJxgu7+YEiw@mail.gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Mon, 30 Jan 2023 17:05:23 +0100
Message-ID: <CABr+WT=a3YqyS0VWCoRDE-QGGJrP8AL3CpMPsZXR3Ps-tmjrWQ@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Ben Skeggs <skeggsb@gmail.com>
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
Cc: regressions@lists.linux.dev, kherbst@redhat.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le dim. 29 janv. 2023 =C3=A0 23:36, Ben Skeggs <skeggsb@gmail.com> a =C3=A9=
crit :
>
> On Fri, 27 Jan 2023 at 20:42, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wr=
ote:
> >
> > On Fri, Jan 27, 2023 at 04:00:59PM +1000, Ben Skeggs wrote:
> > > On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt=
> wrote:
> > > >
> > > > On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > > > > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisbo=
a.pt> wrote:
> > > > > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > > > > As a quick check can you try changing
> > > > > > >
> > > > > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_me=
m_target
> > > > > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> > > >
> > > > > In addition to Dave's change, can you try changing the
> > > > > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> > > > >
> > > > > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > > > > sizeof(args), 0, false);
> > > >
> > > > Chiming in just to say that with this change I see the same as Nico=
las
> > > > except that the init message size is 255 instead of 0:
> > > >
> > > > [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message s=
ize 255 vs 42
> > > I've attached an entirely untested patch (to go on top of the other
> > > hacks/fixes so far), that will hopefully get us a little further.
> >
> > Hello,
> >
> > Thank you for the patch! I can confirm that it fixes the problem
> > on the Pixel C, and everything works as before the regression.
> > With this, for the combination of patches
> >
> > Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >
> > which I can resend after testing the final patch version.
> Thank you (both!) for testing!
>
> I've attached a "final" version of a patch that I'll send (assuming it
> still works ;)) after re-testing.  There's only a minor change to
> avoid breaking the non-Tegra path, so I expect it should be fine.

Fine with me.
Tested-By: Nicolas Chauvet <kwizart@gmail.com>

Thanks.
