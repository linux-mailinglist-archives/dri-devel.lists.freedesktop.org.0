Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EA7052CA
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 17:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7754310E25E;
	Tue, 16 May 2023 15:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA310E25E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 15:49:57 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-61b79b9f45bso129830606d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684252195; x=1686844195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFGPzaLGza6USyFk2W1xiNgdO9q790qPd9zu8sf1g7E=;
 b=VhoLfrZsWRV5hrL7lwFw2v4CL2xcnV2+9uE7rGefaQdDK6icP0n2NK/wd8TCXF5ogu
 vNxl5ph4qvRgcYFnq2xrRSkxyX7q+oi9uVDGOYz7hfzgp6spDpP8pU/XkGa+2NMUCY15
 MJg7yRQf5bjHhA5js9+ZkSw6dDnNG1V1Ulfek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684252195; x=1686844195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFGPzaLGza6USyFk2W1xiNgdO9q790qPd9zu8sf1g7E=;
 b=l8gzLdOGHSEaVtS3b1Qr3jLhGpmLjr+6Xk+KZsCJnYUAVCiRNra3QnxuWwcZRDocnL
 rGOj4BObvOa5AdfEuhXOwI3+nGTqKXo0GBleheRINDdWgs2mfDOQNF5g0WDJBqPO9eYp
 o+zMhERRChb69YmfEzQOx1gZlRpcIKYUVQuxCg0SGpxIhURXWbq+OINeUpsiOYWzV5Sl
 kRLcl4XLflmRouZs2oqWXgltJ9sRLs5n4iZ17ZD3FTWYrq/WvDxGrcH6aruxtObW5TVI
 gfkEsiQsJ2ejYLg5+wRPFWZ40HEjMnftCz9r60FWIbRhV9AK1e5P3VtG4VpG5QqkA/V0
 Anfw==
X-Gm-Message-State: AC+VfDyImYByAOFGUhWwwDTsr7W4ZXD03OUWgFgraoFltPMTsWVF4SSp
 oNCQKY6aFNmHM9EgwdMaL0U6+y+wb+nNczP5H/Q=
X-Google-Smtp-Source: ACHHUZ6exuogXksHgSP2xU3LAbTbCUF9+zC7kfvtIcO7h1VA2XNZ7BMRcwByLTiuFtOMV/ZwU9hssw==
X-Received: by 2002:a05:6214:20ad:b0:5f5:51c4:fca0 with SMTP id
 13-20020a05621420ad00b005f551c4fca0mr51304838qvd.52.1684252194849; 
 Tue, 16 May 2023 08:49:54 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 w14-20020a0562140b2e00b0061b583b143esm5736951qvj.37.2023.05.16.08.49.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 08:49:53 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3f51ea3a062so597511cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:49:53 -0700 (PDT)
X-Received: by 2002:ac8:574a:0:b0:3ee:d8fe:6f5c with SMTP id
 10-20020ac8574a000000b003eed8fe6f5cmr279415qtx.1.1684252193280; Tue, 16 May
 2023 08:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwB_NLBLEUiu__fE9F=j0KFssq7Lxfz8WUnbR0C6yi=zsboJw@mail.gmail.com>
 <20230509025153.1321446-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Xp_OoxJH38skQswjK_AWwJ5P2OmgjnXLog9bAht0CL6A@mail.gmail.com>
In-Reply-To: <CAD=FV=Xp_OoxJH38skQswjK_AWwJ5P2OmgjnXLog9bAht0CL6A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 May 2023 08:49:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjLVSiT_AD=SBo2mD23rCw_3iJRC4rBPrrMHBV2CCn6w@mail.gmail.com>
Message-ID: <CAD=FV=WjLVSiT_AD=SBo2mD23rCw_3iJRC4rBPrrMHBV2CCn6w@mail.gmail.com>
Subject: Re: [v2] drm/panel: Modify innolux hj110iz panel inital code
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 9, 2023 at 8:42=E2=80=AFAM Doug Anderson <dianders@google.com> =
wrote:
>
> Hi,
>
> On Mon, May 8, 2023 at 7:52=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > There is a problem of screen shake on the old panel. So increase the
> > panel GOP component pull-down circuit size in hardware, and update the
> > initialization code at the same time. The new initialization code mainl=
y
> > modifles the following.
> >
> > a)adjusted for GOP timing. When Display sleep in, raise all GOP signals
> > to VGHO and then drop to GND.
> > b)Increased the Vertical back Porch and Vertical pulse width, so need t=
o
> > update vsync_end and vtotal and CLK in drm_display_mode.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> > v2: Modify commit message
> >
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 397 +++++++++++-------
> >  1 file changed, 235 insertions(+), 162 deletions(-)
>
> Every time I see the opaque changes to the pile of "DCS_CMD" arrays I
> feel obliged to grumble a bit, but as I've said before I guess it's
> OK-ish...
>
> Thus, this patch seems fine to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Just to make sure there are no objections, I'll give this ~1 week and
> then I'll land it to drm-misc-next.

Pushed to drm-misc-next:

519ce291168a drm/panel: Modify innolux hj110iz panel initial code
