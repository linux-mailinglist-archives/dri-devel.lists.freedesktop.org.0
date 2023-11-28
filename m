Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6157FAFA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 02:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E7E10E40D;
	Tue, 28 Nov 2023 01:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B210E40D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 01:38:01 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so6655074e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701135480; x=1701740280; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N6kokAHXUJv+HlCSPR82UEkh5i4zBVaRZfr1LTFro7w=;
 b=OTbStNezAPxG8+MZV6mlHIjYSA2raE18CKw+x9J2u73DeYRdIeuMAFulkUAGzWbvkg
 83dJyncxbFrR1paXd0Pk4ffkuOjyVm6moa6djDf5q0R6uI84Hs0zPyO3dx2kZaG3bLJk
 xhDk8ImAbmKLR/X69FyOYz2mLtg/mfXHFRuuFD4F3zevDoMYrXuYm8iaci2+QmY2CRI5
 ZmzmxzFGVJM2z29SsZ6fhvNR77EtF5BmKSzPgnkDjKLM+3KvREiiDU97XLlrQozAOVMh
 ZxpTyChFe5dzvozEtBPUprdrDQLU3XFQodKaGyRmmYsyUYRd+KVlMmhmieyZ6rcptqej
 mFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701135480; x=1701740280;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6kokAHXUJv+HlCSPR82UEkh5i4zBVaRZfr1LTFro7w=;
 b=fXWWnYT6tFXk2NDcQHcQEFUUB9NXoKmSr6EQPdmeFu/AnH+VRhFsECh9RE8uFeISlW
 Plbmf5qDGJRUjL/8aI2nMdQgmVqWFuqkbjMUC15DdhLEinbKi9s8j4eiIq20cNFDiuAB
 V+NPOveIJG1Xnpcsj3skhAWiQ9m/MsXoyudnOP1QYWIFY8rP9v9XWkdGlLRR+E2PkJDu
 9nZDtNWy/uULYY5AKfnnLKjsWp1boKG/wt4ha8121KUrA5utj7aI8UTarybwmnzQzLhx
 JvPqzOkikQ5f/qP4p1gHO3DH5NG6E5X4e0lYrseGPgWQOGDiB9POzBUsEAN7HxYWL9dU
 IAJA==
X-Gm-Message-State: AOJu0Ywqw7c4Sfc1lwXFYncADD5dBEbwZGhiR4zgquk1S90QCZf9iZic
 jUQuKJhi7R8AnE+TX+mjtipfwfytytG+4hylgX8=
X-Google-Smtp-Source: AGHT+IHJmNVk/46P3cx1R68VqOfflKovRECF96SXozFXM95kE9+CRrgAPRNQXTvZTco9QexMc//PoCuBlqcn7oGygUU=
X-Received: by 2002:a05:6512:3b0b:b0:509:459b:13ae with SMTP id
 f11-20020a0565123b0b00b00509459b13aemr11404505lfv.53.1701135479567; Mon, 27
 Nov 2023 17:37:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3@epcas1p2.samsung.com>
 <20231120225537.1270358-1-inki.dae@samsung.com>
 <CAPM=9txk2nqYykd5shh3Ux7Jff8hweQnhpNUtYmT9nbcKrHdsA@mail.gmail.com>
In-Reply-To: <CAPM=9txk2nqYykd5shh3Ux7Jff8hweQnhpNUtYmT9nbcKrHdsA@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 28 Nov 2023 10:37:48 +0900
Message-ID: <CAAQKjZPUj0eL_5RcG4s9VnYsFtgB8LjQ_Tg5Kfb1ZLG9ZvP-9w@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-fixes
To: Dave Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f97bb9060b2c77c0"
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
Cc: Dave Airlie <airlied@linux.ie>, linux-samsung-soc@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f97bb9060b2c77c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

2023=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 10:14,=
 Dave Airlie <airlied@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On Tue, 21 Nov 2023 at 09:00, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Hi Dave and Daniel,
> >
> >    Two fixups - fixing a potential error pointer dereference and wrong
> >    error checking.
> Hi Inki,
>
> This fails to build on arm32, and it seems one of the fixes is wrong
>
> [airlied@dreadlord drm-fixes]$ make ARCH=3Darm
> CROSS_COMPILE=3Darm-linux-gnu- O=3D../../arm-build-fixes/  -j16
> make[1]: Entering directory '/home/airlied/devel/kernel/arm-build-fixes'
>   GEN     Makefile
>       CALL
> /home/airlied/devel/kernel/dim/drm-fixes/scripts/checksyscalls.sh
>   CC [M]  drivers/gpu/drm/exynos/exynos_drm_dma.o
>
> /home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_dr=
m_dma.c:
> In function =E2=80=98exynos_drm_register_dma=E2=80=99:
>
> /home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_dr=
m_dma.c:119:40:
> error: passing argument 1 of =E2=80=98PTR_ERR=E2=80=99 makes pointer from=
 integer
> without a cast [-Werror=3Dint-conversion]
>   119 |                         return PTR_ERR(-ENODEV);
> In file included from
> /home/airlied/devel/kernel/dim/drm-fixes/include/linux/string.h:9,
>                  from
> /home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-mapping.h:7,
>                  from
> /home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-map-ops.h:9,
>                  from
>
> /home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_dr=
m_dma.c:7:
> /home/airlied/devel/kernel/dim/drm-fixes/include/linux/err.h:49:61:
> note: expected =E2=80=98const void *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99
>    49 | static inline long __must_check PTR_ERR(__force const void *ptr)
>       |                                                 ~~~~~~~~~~~~^~~
> cc1: all warnings being treated as errors
>
> I think it should just be return -ENODEV, since the function returns an
> int.
>
> Please fix it up and resend.
>

Really sorry for this. Will resend after fixing it.

Thanks,
Inki Dae


> Thanks,
> Dave.
>
>
>
> >
> >    Ps. regarding the first patch, I had sent a GIT-PULL[1] but it seems
> >        you missed.
> >    [1]
> https://lore.kernel.org/dri-devel/20231006040950.4397-1-inki.dae@samsung.=
com/T/#u
> >
> >    Please kindly let me know if there is any problem.
> >
> > Thanks,
> > Inki Dae
> >
> > The following changes since commit
> 98b1cc82c4affc16f5598d4fa14b1858671b2263:
> >
> >   Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
> tags/exynos-drm-fixes-for-v6.7-rc3
> >
> > for you to fetch changes up to a30ba4bd7cdb5726d86a557c5df8df71c7bc7fad=
:
> >
> >   drm/exynos: fix a wrong error checking (2023-11-21 07:41:11 +0900)
> >
> > ----------------------------------------------------------------
> > Two fixups
> > - Fix a potential error pointer dereference by checking the return valu=
e
> >   of exynos_drm_crtc_get_by_type() function before accessing to crtc
> >   object.
> > - Fix a wrong error checking in exynos_drm_dma.c modules, which was
> reported
> >   by Dan[1]
> >
> > [1]
> https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.m=
ountain/
> >
> > ----------------------------------------------------------------
> > Inki Dae (1):
> >       drm/exynos: fix a wrong error checking
> >
> > Xiang Yang (1):
> >       drm/exynos: fix a potential error pointer dereference
> >
> >  drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
> >  drivers/gpu/drm/exynos/exynos_hdmi.c    | 2 ++
> >  2 files changed, 5 insertions(+), 5 deletions(-)
>
>

--000000000000f97bb9060b2c77c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Dave,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">2023=EB=85=84 11=EC=9B=94 24=EC=9D=BC (=EA=B8=
=88) =EC=98=A4=EC=A0=84 10:14, Dave Airlie &lt;<a href=3D"mailto:airlied@gm=
ail.com">airlied@gmail.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Tue, 21 Nov 2023 at 09:00, Inki Da=
e &lt;<a href=3D"mailto:inki.dae@samsung.com" target=3D"_blank" rel=3D"nore=
ferrer">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Dave and Daniel,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Two fixups - fixing a potential error pointer dereference=
 and wrong<br>
&gt;=C2=A0 =C2=A0 error checking.<br>
Hi Inki,<br>
<br>
This fails to build on arm32, and it seems one of the fixes is wrong<br>
<br>
[airlied@dreadlord drm-fixes]$ make ARCH=3Darm<br>
CROSS_COMPILE=3Darm-linux-gnu- O=3D../../arm-build-fixes/=C2=A0 -j16<br>
make[1]: Entering directory &#39;/home/airlied/devel/kernel/arm-build-fixes=
&#39;<br>
=C2=A0 GEN=C2=A0 =C2=A0 =C2=A0Makefile<br>
=C2=A0 =C2=A0 =C2=A0 CALL=C2=A0 =C2=A0 /home/airlied/devel/kernel/dim/drm-f=
ixes/scripts/checksyscalls.sh<br>
=C2=A0 CC [M]=C2=A0 drivers/gpu/drm/exynos/exynos_drm_dma.o<br>
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:<br>
In function =E2=80=98exynos_drm_register_dma=E2=80=99:<br>
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:119:40:<br>
error: passing argument 1 of =E2=80=98PTR_ERR=E2=80=99 makes pointer from i=
nteger<br>
without a cast [-Werror=3Dint-conversion]<br>
=C2=A0 119 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(-ENODEV);<br>
In file included from<br>
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/string.h:9,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from<br>
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-mapping.h:7,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from<br>
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-map-ops.h:9,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from<br>
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:7:<br>
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/err.h:49:61:<br>
note: expected =E2=80=98const void *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99<br>
=C2=A0 =C2=A049 | static inline long __must_check PTR_ERR(__force const voi=
d *ptr)<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~^~~<br>
cc1: all warnings being treated as errors<br>
<br>
I think it should just be return -ENODEV, since the function returns an int=
.<br>
<br>
Please fix it up and resend.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Really sorry for this. Will resend after fixing=
 it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div d=
ir=3D"auto">Inki Dae</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Dave.<br>
<br>
<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Ps. regarding the first patch, I had sent a GIT-PULL[1] b=
ut it seems<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 you missed.<br>
&gt;=C2=A0 =C2=A0 [1] <a href=3D"https://lore.kernel.org/dri-devel/20231006=
040950.4397-1-inki.dae@samsung.com/T/#u" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://lore.kernel.org/dri-devel/20231006040950.4397-1-inki.=
dae@samsung.com/T/#u</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Please kindly let me know if there is any problem.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt;<br>
&gt; The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671=
b2263:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.kernel.org/pub/scm/linux/kerne=
l/git/daeinki/drm-exynos" rel=3D"noreferrer noreferrer" target=3D"_blank">g=
it.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos</a> tags/exynos-d=
rm-fixes-for-v6.7-rc3<br>
&gt;<br>
&gt; for you to fetch changes up to a30ba4bd7cdb5726d86a557c5df8df71c7bc7fa=
d:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0drm/exynos: fix a wrong error checking (2023-11-21 07:41:1=
1 +0900)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Two fixups<br>
&gt; - Fix a potential error pointer dereference by checking the return val=
ue<br>
&gt;=C2=A0 =C2=A0of exynos_drm_crtc_get_by_type() function before accessing=
 to crtc<br>
&gt;=C2=A0 =C2=A0object.<br>
&gt; - Fix a wrong error checking in exynos_drm_dma.c modules, which was re=
ported<br>
&gt;=C2=A0 =C2=A0by Dan[1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5=
c3462bfcf@moroto.mountain/" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moroto.mo=
untain/</a><br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Inki Dae (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm/exynos: fix a wrong error checking<br>
&gt;<br>
&gt; Xiang Yang (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm/exynos: fix a potential error pointer de=
reference<br>
&gt;<br>
&gt;=C2=A0 drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----<br>
&gt;=C2=A0 drivers/gpu/drm/exynos/exynos_hdmi.c=C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
</blockquote></div></div></div>

--000000000000f97bb9060b2c77c0--
