Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07E3D50BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 02:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACF26E50C;
	Mon, 26 Jul 2021 00:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AF66E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:27:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D8B960F38
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627259275;
 bh=5EChaJLtwzbVLsyJuV9buEjUeWDZmjFho5daWXnpViA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MppDXIdsiBMiySzBFpji3JswurhlZiUe4vRlRAsMMDXmb1oOYcXFlnh1ct7FL7/GO
 +yB+20IZLC8fgYfYELzwf+WwfjDSS0/6c3FOxwdHBvChATAFfviwTAaeIpEE5vDTgS
 rJKHJH3lNKZItUrFxKZqoqrJNWuQSbF+JuV/zi74WbTpbmRnV9vr7TYAkMEpSsi4cv
 HLTrYfjOWYcqCwdWMaFYxDMdCJxKnhzWr4S0WEZidBtds36Krmi+BSZ1Abq7iM6bVc
 0JTBxQk8q503JTxwlGg8fYDGpKsClKjfR7UIQHfmZyLSpvi2G3VEb8TXQVMfvMbJ1G
 FQ6UYY3V9bZ7g==
Received: by mail-ed1-f53.google.com with SMTP id x90so2007252ede.8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:27:55 -0700 (PDT)
X-Gm-Message-State: AOAM533DUqLSfVZ+V5Y3IEGtLNTzyNbPONgKFt+wk3JQ4m4upf7evEBs
 NYUwy4pk6PyndT8wemvqXOZIkYptVWWM1p489Q==
X-Google-Smtp-Source: ABdhPJxRxMiVcAhVNADQkv4nKSd6s3qZWXOhXefQlHs2yzs/g7fStJDFNaMTrIHfMGLrgfiBNRfAzU7erf01ulqv+y0=
X-Received: by 2002:a50:d71e:: with SMTP id t30mr6473038edi.72.1627259273649; 
 Sun, 25 Jul 2021 17:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210710132431.265985-1-linux@fw-web.de>
 <456f0611-1fc7-75ac-ff45-9afd94190283@collabora.com>
 <trinity-02bc17fc-b458-4d17-baca-8afe30e4c92c-1626110171249@3c-app-gmx-bs28>
 <dbe23d2a-cd29-0782-1b7d-bcb5c6683607@collabora.com>
 <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
In-Reply-To: <6EF00182-1FF4-4061-BCE4-E2AD7275211B@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 26 Jul 2021 08:27:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
Message-ID: <CAAOTY_-2vJE_v2vV=fJqK9--yx=++P9x53T-g3Cv4qKfHhqbLg@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH] soc: mediatek: mmsys: fix HDMI output on
 mt7623/bananapi-r2
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Frank:

Frank Wunderlich <frank-w@public-files.de> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=8825=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=881:06=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> >On 12.07.21 19:16, Frank Wunderlich wrote:
> >> Hi,
> >>
> >> it turns out that problem is the read+or of the new value
> >>
> >> i reverted my patch and changed
> >>
> >> reg =3D readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
> >> writel_relaxed(reg, mmsys->regs + routes[i].addr);
> >>
> >> to
> >>
> >> writel_relaxed(routes[i].val, mmsys->regs + routes[i].addr);
> >>
> >> and it works too, but maybe it breaks other platforms
>
> A gentle ping. Amy further comments which of both ways is the right one (=
restoring old output select function or write only without read+or)?

As I've discussed in [1], SOUT has many bits and need to be cleared
before set new value. Of course, write only could do the clear, but
for MOUT, it clear the bits that should not be cleared. If you want to
use the table, you need to implement the 'mask'.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/trinity-937eb=
fa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43/

Regards,
Chun-Kuang.

>
> regards Frank
