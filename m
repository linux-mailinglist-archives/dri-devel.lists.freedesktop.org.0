Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00F28872D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 12:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB126ECB5;
	Fri,  9 Oct 2020 10:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09F56ECB5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 10:45:55 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w12so10059521qki.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0cpbEKjtPzaJVoOgW0q6Pj3F3Hj420G4Ch7pN255UI=;
 b=nN/VctAKgvn6QJ82Y6bjLI4df8yDsvTfqOnOM+4ETQA2M/L0Ldr3GX3k55RSqOxMmr
 CkN4Qm5IMTkwuOinsnEV0BccIWhk3azI78htl98ZRhkt5tOYiGwK22rEmhVorM54gE79
 ipSpwAq/vYiJb/Us3YvJehJRwpYd1kMRNqmlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0cpbEKjtPzaJVoOgW0q6Pj3F3Hj420G4Ch7pN255UI=;
 b=jLLERfHkkc/baTyc5ctbzJvn8EIS8wF/6wU7R5reh8a7exc93djbippcGexwB+KwII
 Qe5ixa40KX7Mw0PCb6fTyLoXPTdz8tBF7NRNBXzzucoFZKp1RT3xmYxBx6oA9ksohaiP
 pzHF2J+I7SXw9YcuYcY5gG4p0eU1wL5ld1ickb+XJBLnYWTjrDk9FWAMpPM1Vgg06pVG
 yCzZa94Y7qHHlw5LNBz368yGyHF47w129AtgqFqGhHcCpDTvkpUurYtNwJsFUeDTwUgk
 YqNvBzfPJHBH5j69Q0f9WeBoB18fkYGV22JWKDPBkx2ggAKQLJjzo51axu5pRPUfzCf2
 v8sQ==
X-Gm-Message-State: AOAM533KeN4T0TKix/jftMrvg/Hqp2ESt9BgU6nfTz+GCdDOuF1cHMfw
 2iqp2ckExWvuKBN1GUy/i28jc3McN8gt9JIZwx4=
X-Google-Smtp-Source: ABdhPJyvdE6tI1tTHbfd7fiFrWmE4zGGdV2gGWypmdymp14fSM3pa8TxlB/nwYthfgW4nLIu2XWfaLZCMIamivNfHGY=
X-Received: by 2002:a05:620a:16aa:: with SMTP id
 s10mr6790978qkj.273.1602240354758; 
 Fri, 09 Oct 2020 03:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-5-tzimmermann@suse.de>
 <CACPK8XcGOAjocCMp9ubgQpfiBaqSj61i_frSU7ZdiKO_uSt-hQ@mail.gmail.com>
 <3df12a74-d8f3-d607-78ff-5a0f21e86cb9@suse.de>
 <CACPK8XcAXrf6ySuWo4izjD4EU6tMSULs0tP4cy-+TA35PSOUgw@mail.gmail.com>
 <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
In-Reply-To: <c3419660-770c-dadd-21bd-9a6dc0e10a8d@suse.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 10:45:42 +0000
Message-ID: <CACPK8Xfx=tip4Xuqdo15P7R2cXSEXPr+LuED8ZJS5tQui+rjvg@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/aspeed: Set driver CMA functions with
 DRM_GEM_CMA_DRIVER_OPS
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 paul@crapouillou.net, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mihail.atanassov@arm.com, Sam Ravnborg <sam@ravnborg.org>,
 Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, xinliang.liu@linaro.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, NXP Linux Team <linux-imx@nxp.com>,
 alexandre.torgue@st.com, puck.chen@hisilicon.com,
 Sascha Hauer <s.hauer@pengutronix.de>, alison.wang@nxp.com, jsarha@ti.com,
 Chen-Yu Tsai <wens@csie.org>, vincent.abriou@st.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 philippe.cornu@st.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, zourongrong@gmail.com,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Oct 2020 at 08:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 09.10.20 um 10:06 schrieb Joel Stanley:
> > On Fri, 9 Oct 2020 at 08:01, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 09.10.20 um 09:54 schrieb Joel Stanley:
> >>> On Fri, 22 May 2020 at 13:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>>
> >>>> DRM_GEM_CMA_DRIVER_OPS sets the functions in struct drm_driver
> >>>> to their defaults. No functional changes are made.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>
> >>> I just found this in my inbox. I assume it has not been applied as you
> >>> were after a review.
> >>
> >> The patchset as a whole got an A-b and was merged a while ago.
> >
> > I'm a bit confused, I couldn't see it in any tree. The aspeed one
> > seemed to have been skipped when applying the series.
> >
> > I looked at today's linux-next and drm-misc-next.
>
> Indeed. The other patches are in drm-misc-next, but not this one. I must
> have lost it during the merge process.
>
> >
> >>>
> >>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >>
> >> Nevertheless thanks for taking a look at the patch.
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> I will apply it to drm-misc-next.
>
> So please ahead and apply it. There's also an ack by Emil, which you may
> want to add as well.
>
>   Acked-by: Emil Velikov <emil.velikov@collabora.com>
>
> Sorry about missing the patch and thanks for taking care.

No problem. Thanks for the cleanup.

Cheers,

Joel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
