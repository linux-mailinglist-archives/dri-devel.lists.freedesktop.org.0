Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F261429A51
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 02:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910FB89D9A;
	Tue, 12 Oct 2021 00:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E5289D9A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 00:13:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96D4A60F43
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 00:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633997614;
 bh=OXUvi6G050AJQ4OPBek0ufw7ZKzRxTQhHX/0FYRiCE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4UGSzvjtHyHLu68/g1K/x33KNDmpnLBws9RDs38WRclHkjTS2eXTjUQobHqxsZz5
 XM/G1BYUiNJZ/BT734m29NFQFGzFXy7mrx6mMkOinz/a0ns30M5jxUppddo6Tr3Ueg
 kDfXJghO5wfm5cfqUCAhextUwZIMBqPzGV6crlIWf4Gvgk1O/4cHHqAtvYMJpJd5bv
 0swnGclMpgVPdoVN26pC1p50IML2YtHe6ZiRDbwLKm3vHzBKVW0RwN+YQXsSno9EeN
 LtKWWPmOcpOTNp2IzPQht/gsYxYEf+e715BXi/Sqr55fMoIjGPRN1d304snEK6iwWG
 bqd3Eu9KQuRSg==
Received: by mail-ed1-f48.google.com with SMTP id w19so14046876edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 17:13:34 -0700 (PDT)
X-Gm-Message-State: AOAM530uCf5jUea2VHgPpZbHBvAenpipZX43RiF1a5/gJpcIoiNT7UCP
 oZQM2WlhZF3p7IPIAfDA4ggerQ9x2RpAPe13hA==
X-Google-Smtp-Source: ABdhPJy4tjjmTrFlejaCRoODEcML/sZ2dFjPaUPpY/JaPn4e9sT6cT9XzsRs7SGjmICTqvgKEJcCe3ia86anOYl+97Y=
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr30575894ejb.430.1633997612955; 
 Mon, 11 Oct 2021 17:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
 <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
In-Reply-To: <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Oct 2021 08:13:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L_Pd+EmPVw5yQeZPzLVPkJM681y_uQmCbZ79tfF92AA@mail.gmail.com>
Message-ID: <CAAOTY_8L_Pd+EmPVw5yQeZPzLVPkJM681y_uQmCbZ79tfF92AA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enric Balletbo Serra <eballetbo@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=
=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:33=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Chun-Kuang,
>
> Thank you to take time to send this, for full series
>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> Display is now working again.

Applied to mediatek-drm-fixes [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Thanks,
>   Enric
>
>
> Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dv., 8
> d=E2=80=99oct. 2021 a les 1:53:
> >
> > Commit c1ec54b7b5af
> > ("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
> > would cause numerous mtk cmdq mailbox driver warning:
> >
> > WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
> > cmdq_task_exec_done+0xb8/0xe0
> >
> > So revert that patch and all the patches depend on that patch.
> >
> > Chun-Kuang Hu (5):
> >   Revert "drm/mediatek: Clear pending flag when cmdq packet is done"
> >   Revert "drm/mediatek: Add cmdq_handle in mtk_crtc"
> >   Revert "drm/mediatek: Detect CMDQ execution timeout"
> >   Revert "drm/mediatek: Remove struct cmdq_client"
> >   Revert "drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb=
"
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 157 ++++--------------------
> >  1 file changed, 24 insertions(+), 133 deletions(-)
> >
> > --
> > 2.25.1
> >
