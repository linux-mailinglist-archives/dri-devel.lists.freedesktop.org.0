Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726943AA572
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF286E05D;
	Wed, 16 Jun 2021 20:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311F46E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:39:50 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so1033877ool.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMcYalmCAHylGdhbg1IVp3Bs2x8m0iHlc/lzRXUM0HU=;
 b=htoR91a3QnMRSu6n34Lez7gNPl5jTDFDopua7XbvonDZMTt0D1/rpVqdZZ3esJ2kLC
 FALEJvTCoI49RoBJFWwAjdVho4tEu59KBmWww0r39Mi42xLCdXCd4i6bU00GeTaMFl0L
 N/TxuTnsj+lK1DJR61Lm8nkI0DHDruodZ/qA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMcYalmCAHylGdhbg1IVp3Bs2x8m0iHlc/lzRXUM0HU=;
 b=jREpX4oKoHl720DW6lO2Hb4oEW6inXDjk5DQfy8ydxswXcm+j0EUOzVK2Uks1ITMIY
 O9O9PYREuCjqatNQvr83AfEXwCX07+rO3B/XmfufSIqA9b2Ydpo0vn4Skr/wPiOCNTPc
 mz/Qjc1fnJxVzhQTZ2sBDpCTTAUv7cUjWDXQMJ246knWkwkXOcxxbvwPqYX1btBUIzBp
 FkOxRskso4J6YnbbKwLtpeIIqc/oqugsaWOF6kSYWO4idD9p8b/ltcQGRfcFBuVrNNQH
 Gn6PwlKLJn4fAn2R+5itihSBslZMbIS2GabeBF8Ec6bAkmfRvBDLDBa7QpAK0GWY6gAw
 C5zA==
X-Gm-Message-State: AOAM532iFDlVr+fR+fdi5RjIRyLinU6LFE5TKhsbY1/cfQR6dlxB2Ot2
 c9hu/T1DnR+HsrIOLDPPTy+ubk2zIrTTlEmXXTd9uw==
X-Google-Smtp-Source: ABdhPJwDD/zT6kJIKvO4ayePA1R6nD7IZD+SzvyTh12qM5egyqQSXfFOwPMoWgmByXCoF0ISXyZzGIwha/OsCv8QQh4=
X-Received: by 2002:a4a:8802:: with SMTP id d2mr1538686ooi.28.1623875989469;
 Wed, 16 Jun 2021 13:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <20210611120309.2b5eb4htupv5ss32@e110455-lin.cambridge.arm.com>
 <20210614174912.15a49336@eldfell>
 <20210614152413.nguqia3s4tlowio4@e110455-lin.cambridge.arm.com>
 <YMeE63G+9DSLPB3N@pendragon.ideasonboard.com>
 <20210615100335.0b8f96d5@eldfell>
 <ouNaZaqkV1d_wPRESVBQHxvMhmJ53xIrgtPfDs8mB88AN3FEWt7cq031k8ZqCva1Ob0TCNTnsWqNDS0l5NXfejXIL7YUky3XGdjmh1_hefk=@emersion.fr>
 <YMh21WBrADbZDcbp@pendragon.ideasonboard.com>
 <20210615131656.2ecefdc4@eldfell>
 <ESSpFFHaoQjjviok-WoxyLRRwcFnRT0XXVAS8mB0jvCxmHNLfJKD9QELUXNs3SEn5Z6IU0j0mQDs3qjvkoOo8QiZP6q3MCQgr2vX8C4x_9Q=@emersion.fr>
In-Reply-To: <ESSpFFHaoQjjviok-WoxyLRRwcFnRT0XXVAS8mB0jvCxmHNLfJKD9QELUXNs3SEn5Z6IU0j0mQDs3qjvkoOo8QiZP6q3MCQgr2vX8C4x_9Q=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 16 Jun 2021 22:39:36 +0200
Message-ID: <CAKMK7uEWYgbugkhEe0iDhpiGj+n+JgYG-Gn_M_H3_JLHJbHzoQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Melissa Wen <melissa.srw@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 Jonathan Corbet <corbet@lwn.net>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chen Feng <puck.chen@hisilicon.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Roland Scheidegger <sroland@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertr e <yannick.fertre@foss.st.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Qiang Yu <yuq825@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 2:09 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, June 15th, 2021 at 12:16, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> > Good reminder about CRCs. CRCs have zero tolerance, so they are not
> > useful for testing properties that have any leeway, are they?
>
> IIRC, IGT's alpha blending test currently computes the CRC for all
> possible roundings, then checks that the hw returns one of the
> acceptable CRCs.
>
> With more complex color management properties, this approach might not
> be possible and write-back support in hw drivers would really help.

Yeah CRC based tests have severe limits, and even if you only try to
test the extreme stuff there's enough busted hw out there that they
will fail. E.g. when scaling I'm sure there's hw that bleeds in pixels
from outside the bounding box and can't be fixed, or there's some
intel hw where the alpha blending gets the mapping between [0, 0xff]
<-> [0.0, 1.0] and you get a nice faint ghost instead of full
transparency or opaqueness.

I think for those broken hw is just broken, nothing we can do.

Also writeback isn't supported by enough display hw, and not everyone
has access to chamelium or similar.

I think best we can do is that relevant igt have an interactive mode
(built-in for crc tests, so you can pause and look at the screen) and
then perhaps compare with the vkms reference implementation manually.
That's not great, and vkms is also not anywhere near close enough for
this either (and like currently you can't even look at it, we'd first
need a v4l output mode).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
