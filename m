Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992267DFA1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 10:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95EA10E42B;
	Fri, 27 Jan 2023 09:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0B10E42B;
 Fri, 27 Jan 2023 09:03:29 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15f64f2791dso5628202fac.7; 
 Fri, 27 Jan 2023 01:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76T4i5lAkwD0ACX7xMWvzVtHQK0XFycwfUwabnWOhPE=;
 b=d/Z5pfAfVLIkd5hWdk3lVn3jfc0yN2KaEfcJ1VW3GZuchOKrKTsvdCYm2C8IKbm9LP
 nACeSiIeRz4r8oqI0Wtb+S9YbQQ5ykDen+IheLU93HkXGGLHaMuEpRVzFRd7BCt69duM
 jF0/5ZPrSvZGhMh07dTupLncAPHU7nT5OFIhDSj19FzFMpnu3EEpT4/76mKYFWsgYKf7
 I91ocfLOdO7gfymY8YVI1T3+6WkcIVP2IQDOHEriDnLjt7N00VRyuN6p5NVWiZ1jH3aT
 312Do4Yy6FhuK5E2aPVM/6W7v2578ivQGGavkZI1ANPIFcVEADyhH/iwsrXQBsL7roiY
 rYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76T4i5lAkwD0ACX7xMWvzVtHQK0XFycwfUwabnWOhPE=;
 b=0wBIyzQdhxpFGrp2Q3izXjRnw4fpKhEP6MlGUKDjoGk12UX8tGXzXTbBrgk+g7bYnI
 W3ImNw8IZrMN3mLKgI0gA75Ao7+6BF4mPn2ETwiFqSna2+GrfHxyfFDpNbBpGCJqvNky
 2W0sAmtTAIZhVkYBRk5On6KFCWAH634r3fXLtKEII1q8pmWVYL5HpdmPjaMv4lKuARPH
 uSwW20W+0O1+/+YG8F+bP/LtPaO6+tpiy/EuxFZyJZIu2bahup0Y5j/suJaeSQhGkb3V
 rcS1wUOXtC8+/5BksYit+9qEngEyTOqzX5o14s+AWddaBpHjhOkKmg3YDmguIOQ9xcT3
 6+zQ==
X-Gm-Message-State: AO0yUKXEAM3PEydot2ihJu0imNhTM5KCzR5cku/JphMqo29Eo7HE/kSt
 SdJOUCdtxqtfC707Yeixj1pm2WrFOohI1TJZTwM=
X-Google-Smtp-Source: AK7set8iBFhpgLtZ6JEHfmMgx6U1ZjCg6HZvxscbahoscQn+jGBkRWwHqZ1Q2rn4Oer9N2U2Nkb3CidgfFjN739FsSw=
X-Received: by 2002:a05:6870:4588:b0:163:3c39:d0c7 with SMTP id
 y8-20020a056870458800b001633c39d0c7mr562061oao.54.1674810208632; Fri, 27 Jan
 2023 01:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop>
 <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
 <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
 <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
In-Reply-To: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Fri, 27 Jan 2023 10:03:17 +0100
Message-ID: <CABr+WTmfQkLoHxpONag4bHEsQtGwmno+84mYF-RzAGw0jqo-gA@mail.gmail.com>
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
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, bskeggs@redhat.com,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le ven. 27 janv. 2023 =C3=A0 07:01, Ben Skeggs <skeggsb@gmail.com> a =C3=A9=
crit :
>
> On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wr=
ote:
> >
> > On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt=
> wrote:
> > > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > > As a quick check can you try changing
> > > > >
> > > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_ta=
rget
> > > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
> >
> > > In addition to Dave's change, can you try changing the
> > > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> > >
> > > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > > sizeof(args), 0, false);
> >
> > Hello!
> >
> > Chiming in just to say that with this change I see the same as Nicolas
> > except that the init message size is 255 instead of 0:
> >
> > [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size =
255 vs 42
> I've attached an entirely untested patch (to go on top of the other
> hacks/fixes so far), that will hopefully get us a little further.
>
> Would be great if you guys could test it out for me.

Hello,

Thanks for the patch. It works for me on: jetson-tx1:
---
[ 1022.814699] nouveau 57000000.gpu: NVIDIA GM20B (12b000a1)
[ 1022.814750] nouveau 57000000.gpu: imem: using IOMMU
[ 1022.893976] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
[ 1022.893988] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
[ 1022.895356] nouveau 57000000.gpu: DRM: MM: using COPY for buffer copies
[ 1022.897046] [drm] Initialized nouveau 1.3.1 20120801 for
57000000.gpu on minor 1
---
I've tried to run glmark2-wayland under weston with DRI_PRIME=3D1, it
seems to work at the beginning, but then I have the following error:

[ 1510.861730] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
[INVALID_OPERATION] ch 3 [04002a2000 glmark2-wayland[2753]] subc 0
class b197 mthd 19d0 data 0000003d
[ 1510.952000] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
[INVALID_OPERATION] ch 3 [04002a2000 glmark2-wayland[2753]] subc 0
class b197 mthd 19d0 data 0000003d
[ 1510.952060] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 3
[04002a2000 glmark2-wayland[2753]] subc 0 class b197 mthd 0d78 data
00000006
I think it's a separate error as I think I can reproduce on kernel
6.1x (I will open a separate thread).

So you can add my
Tested-By: Nicolas Chauvet <kwizart@gmail.com>

Thanks
