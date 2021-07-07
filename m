Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF33BEA2C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 16:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9B16E170;
	Wed,  7 Jul 2021 14:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541B66E170
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 14:59:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D3FA61CCA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625669951;
 bh=Ld0W/CO5KSH5eewJQxSXvg+l75fMEAzgdAszdXdVTd8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ntguiwzcJYY3n/YJQHFdemX2SZy4jLgEc2m+XLtWj2yf+mglGmuj7yGVYwsotMVHY
 4YX+jk2yx/4W3i/vU5uS/k0DIi2TO1ibA2yJPhdTUFek21HiuOLsFBzYfafnoO/FmZ
 EPKV2wOyHIVaC9cyG0qQk8G204epqC0hbqzNewR7EjTF1idF85IktL4xfl+QUm02qE
 jCfDdxX9HoAhqSfNvRM0kYOMetpYQtX63nl5F0rfpd19sWwCSjoiMxXom6MgzuWNuH
 Vyiz56KknKW3QcGds6h39hMxcnnmqPGwjB7wbn5Z6MQhk+s+ba8LMzODsbDnOgSmCg
 4KtsrUEpijVDA==
Received: by mail-ej1-f42.google.com with SMTP id hc16so3716657ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 07:59:10 -0700 (PDT)
X-Gm-Message-State: AOAM532LOq2fAWG5OlhF9FhIJNyF7GQJGTXZuOD4AEiQKgYprDvq9Agw
 kK3Bny8jhm5tK/H/FhY6CqAcjMZLncpyjcX0rg==
X-Google-Smtp-Source: ABdhPJzBfvKCM1iiYyRCcQ9GQgMtxZexYRJ/jKRyf1Zi5QywB3sD6sNRI8uKuDJN/UVBK3R1sNbCiyOPXTZKczUd5YA=
X-Received: by 2002:a17:906:4745:: with SMTP id
 j5mr4539593ejs.75.1625669949495; 
 Wed, 07 Jul 2021 07:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <YOQ8ktv1MypezrEy@phenom.ffwll.local>
 <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
In-Reply-To: <trinity-9886112a-f7f2-4ae8-8e09-39c73c04b751-1625571632221@3c-app-gmx-bs60>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Jul 2021 22:58:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Qkqx0Ex1ezfWb+55+T1eytJrZXP=J-fwCe_g1U=4qBw@mail.gmail.com>
Message-ID: <CAAOTY__Qkqx0Ex1ezfWb+55+T1eytJrZXP=J-fwCe_g1U=4qBw@mail.gmail.com>
Subject: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Frank:

Frank Wunderlich <frank-w@public-files.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=886=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:54=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Daniel
>
> > Gesendet: Dienstag, 06. Juli 2021 um 13:20 Uhr
> > Von: "Daniel Vetter" <daniel@ffwll.ch>
> > An: "Frank Wunderlich" <frank-w@public-files.de>
> > Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ri=
pard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Dav=
id Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, dri-devel=
@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Chun-Kuang Hu" <chun=
kuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media=
tek@lists.infradead.org, "Matthias Brugger" <matthias.bgg@gmail.com>
> > Betreff: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
> >
> > On Tue, Jul 06, 2021 at 11:54:39AM +0200, Frank Wunderlich wrote:
> > > Hi,
> > >
> > > i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt=
7623) on 5.13.
> > >
> > > after some research i noticed that it is working till
> > >
> > > commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> > > Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > Date:   Tue Mar 30 13:09:02 2021 +0200
> > >
> > >     drm/mediatek: Don't support hdmi connector creation
> > >
> > >
> > > which is the last of mtk-drm-next-5.13 [1] so i guess a problem with =
core-patches
> > >
> > > dmesg shows the following:
> > >
> > > [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (=
ops mtk_dis
> > > p_ovl_component_ops)
> > > [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma =
(ops mtk_di
> > > sp_rdma_component_ops)
> > > [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color=
 (ops mtk_d
> > > isp_color_component_ops)
> > > [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma =
(ops mtk_di
> > > sp_rdma_component_ops)
> > > [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (=
ops mtk_dpi
> > > _component_ops)
> > > [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 =
because com
> > > ponent 9 is disabled or missing
> > > ....
> > > [   38.403957] Console: switching to colour frame buffer device 160x6=
4
> > > [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > > [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* =
[CRTC:41:cr
> > > tc-0] commit wait timed out
> > > [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > > [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* =
[CONNECTOR:
> > > 32:HDMI-A-1] commit wait timed out
> > > [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> > > [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* =
[PLANE:33:p
> > > lane-0] commit wait timed out
> > > [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event whil=
e there is
> > > still a pending event
> > > [   69.106385] ------------[ cut here ]------------
> > > [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_h=
elper.c:151
> > > 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> > > [   69.106414] [CRTC:41:crtc-0] vblank wait timed out
> > >
> > > so i guess the breaking commit may be this:
> > >
> > > $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> > > b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> > >
> > > in drivers/gpu/drm/drm_atomic{,_helper}.c
> > >
> > > but i cannot confirm it because my git bisect does strange things (af=
ter
> > > defining 5.13 as bad and the 2e4773915223 as good, second step is bef=
ore
> > > the good commit till the end, last steps are 5.11...). sorry, i'm sti=
ll
> > > new to bisect.
> >
> > drm history runs in parallel with the main tree, so occasionally the
> > version that's reported as baseline is confusing and older than what yo=
u
> > might expect. Just trust git bisect, it's doing the right thing, and ma=
ke
> > sure you test exactly the kernel you're supposed to test. Compiling wit=
h
> > CONFIG_LOCALVERSION_AUTO helps a lot to make sure you're really booting
> > into the right sha1.
>
> my build-script adds sha1 to filename (for tftp-usage) and kernelinfo (un=
ame -a)
>
> > > the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is ba=
sed
> > > on this...but the fix was not included in 5.12-rc2 (only after
> > > 5.12.0...got it by merging 5.12.14)
> >
> > Yeah that can also happen because of all the non-linear trees involved =
in
> > linux development.
>
> how to find the real breaking commit?
>
> > > maybe you can help me?
> >
> > So now I'm confused, you're talking about a fix, or is it still broken =
in
> > latest upstream?
> > -Daniel
>
> it is still broken, as i did not found the root cause...only a guess base=
d on errors in dmesg...git bisect points me afair to mt76 wifi-driver which=
 is completely unrelated...as i said, the fix i defined as "last good" was =
no more there after 2nd bisect step.
>
> The fix i set as last good was fixing 5.12 issue (handling connector/crea=
ting bridge without it), but 5.13 has a new one (atomic timeout,drivers/gpu=
/drm/drm_atomic{,_helper}.c) which i cannot trace to the breaking commit.
>
> regards Frank
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
