Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97315BFEC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 15:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CC16F5E3;
	Thu, 13 Feb 2020 14:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C136F5E3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 14:01:01 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d11so5700551qko.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwvJtBvLYgXHz2Xkjo28kGnQcGUFvmoCc8Tq+skqxFM=;
 b=WoSPPLB6quBGtBpRywwrlPUN/efg7Ughe/HaH3khTmKhm8TtRvn1omHwpi/Uje11Nc
 pJJ434RD5vc6K56AF1flgXq7rGgQL4eIbgy0vNQWX3Ilo6r1XlrPGVcQUkzDZJVdNAqL
 CQWRmZ6MDJKjdXiViv85LIZth9OYzoQf4NKp2R4S9uMoWLn4jAzJvRHErhw/tberXn1U
 afxPCPN8yIbn8R73x0dy1qStRMFKKk0TU7EJIVtQo9A5/go6CKtMqKAybDD7f1leMzbr
 RkHP02AhsZ8v09CuFrX1byfuhGihLXF2U77kvpA2MNTc/JMV0yrMCE7PJN/PnIDh9OCX
 EVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwvJtBvLYgXHz2Xkjo28kGnQcGUFvmoCc8Tq+skqxFM=;
 b=bHfdjTXuFb89C4cJztej3CT1cKJUMCoXrCQYSK8dEF4+2xICW0Gp7tBijQv6J7NQt8
 xAzPbvzGgE14aCynPYCZGzrrEjHQAKD2fCa3ygB2oQQPDY5nuaSTTbGd+asoGlDR6NyX
 2+yPBYaxZWyTH6LdZqoawO4a+cub1hACtGgINMpfJXKQQeytKI00mIDDM+jwwYS7pM1i
 YRQnOzqRdv6FK7+WOjtng95yyZ70br5j4aajYEupguRaJjWQ+OE/jJtJXEg9zyLPWiuW
 RQ/Vxaj9HB0q1d75MIhlO1XEs17j3T24U3V9N6x4jX1UKoZo793zMks/0aE7vbxsmYSg
 J5SQ==
X-Gm-Message-State: APjAAAX04azcz78YzGrxzb1LzeCsTecucXxm/znee6SU5LDLk5Hqd0Eb
 Gz5CBwGkouUPXcHIGZxjiqWpWe4iRLM7sqBMUjw=
X-Google-Smtp-Source: APXvYqyjD4OX/YI4q5ugfE3GeGjRdg6xfub/ylaaIdK2920TyQEJp7ys7DWIVv34YSpAoPAjOFPsF7u/zxzxnLNIOJE=
X-Received: by 2002:a37:a642:: with SMTP id p63mr16214664qke.85.1581602456914; 
 Thu, 13 Feb 2020 06:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
 <20200213012353.26815-2-bibby.hsieh@mediatek.com>
 <1581566763.12071.1.camel@mtksdaap41>
In-Reply-To: <1581566763.12071.1.camel@mtksdaap41>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 13 Feb 2020 15:00:45 +0100
Message-ID: <CAFqH_51r8CvBz3J-TffYaMsZQwX=hdDVjEz9+BmBeC=QurP7Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: add fb swap in async_update
To: CK Hu <ck.hu@mediatek.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Missatge de CK Hu <ck.hu@mediatek.com> del dia dj., 13 de febr. 2020 a les 5:06:
>
> Hi, Bibby:
>
> On Thu, 2020-02-13 at 09:23 +0800, Bibby Hsieh wrote:
> > Besides x, y position, width and height,
> > fb also need updating in async update.
> >
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> > Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---

This patch actually fixes two issues as explained in [1], I send the
patch without seeing that another one was already sent. Both do the
same thing. So,

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

[1] https://lkml.org/lkml/2020/2/13/286

> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > index d32b494ff1de..e084c36fdd8a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -122,6 +122,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> >       plane->state->src_y = new_state->src_y;
> >       plane->state->src_h = new_state->src_h;
> >       plane->state->src_w = new_state->src_w;
> > +     swap(plane->state->fb, new_state->fb);
> >       state->pending.async_dirty = true;
> >
> >       mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
>
> --
> CK Hu <ck.hu@mediatek.com>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
