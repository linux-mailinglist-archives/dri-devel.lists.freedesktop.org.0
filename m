Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51258717E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 21:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0CD11A61C;
	Mon,  1 Aug 2022 19:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFEB14A2F9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 19:33:56 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso16309161pjo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 12:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIQ7+JXrdrYLGN1q1Me7ktsamcvlQkAKgR1msuyzHp8=;
 b=Zr9xGgvQLIKPtoSceEYLxu5ZliuYXjZj3RFMXkvfZ/B0BFaOM5vQYIEvB41bbnX+cr
 o7YN3FzdeFZalSlV/4DHmba+2BK2VARCE5gqHEdMXEnutMdi0nnHTjUvQ79plndttEhB
 4qer4oLGY8DCUhbK5ryGtSG5BGKGoa9HFgTpI8ApvWw/01XqkV+yeemz1E5uQGXjlQUA
 SMzOq+sJVSuIE2dt4TKyO81oDrl2UD8FyfF1qACaQvk/Io2s1+3aHwJK6Etam4MPs6c0
 Pl42u7aXWgeqWiCWRQU+8+kDmrGXKM+CT1cEI6Oau2DXJsnWyrifHqZrj5E/IGjG1Wc0
 RABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIQ7+JXrdrYLGN1q1Me7ktsamcvlQkAKgR1msuyzHp8=;
 b=z1awj0O1aPKgicukdaFJcVwcJzfDgbKbzWmdBsZgOde5rrK3w6H+atWKc/46kUB9tT
 2DMXo7Cs/3qgYxai+BL7HT16epYOiOP8LbdX0GT3rl55FXbeWSBOkpajTzFzP7htfZBE
 PfyhzzoZ09TAL4Ra8ncsuddSB9a3mWAEkd3L/KvhWvJprPQ11zYdqwHjHENNj3dTOKFw
 0m9oTERXSE6DdIRnfLmTh3VQsjW/r6wjOVwSWDpbeV+SOYjPcP2ornlz4SolMS13U6ck
 SvUciUrav8lAW4/UxbVo5JA8cI2Wp3oAAsLIHlGyU2ykA296o2JDMatSU5OEYSYKL5TT
 vRmA==
X-Gm-Message-State: ACgBeo3t0UncVFnSjcf8KMx7KkO7isTz56LAcNKk6bbiQg7RjVAbPdWN
 YB2K/JGGGF6kJD6p8GKaDTjGWTxOWyQ/fVoG2io=
X-Google-Smtp-Source: AA6agR4HQvry5Ajx3Fy5wnVubksCNbRGhac65TsiimXdjc0WsMnwPaEhe2wa5OYqmd3KK9fti3CX7kBQ0qQcSjmvQzM=
X-Received: by 2002:a17:902:bc49:b0:16d:ac99:f96f with SMTP id
 t9-20020a170902bc4900b0016dac99f96fmr18038776plz.130.1659382436065; Mon, 01
 Aug 2022 12:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
In-Reply-To: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 1 Aug 2022 16:33:43 -0300
Message-ID: <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Sat, Jul 30, 2022 at 12:16 PM Adam Ford <aford173@gmail.com> wrote:
>
> Hey all,
>
> I am trying to test Jagan's patch series [1] to add support for the
> samsung dsim bridge which is used on the imx8mm to output DSI video.
> The DSIM gets the video from the mxsfb, and in my case, the DSI is
> sent to the adv7535 for connecting to HDMI.

I had to add some extra patches on top of Jagan's imx8mm-dsi-v3 to get
HDMI output functional on a imx8mm-evk via ADV7535:

https://github.com/fabioestevam/kernel/commits/imx8mm-dsi-v3

Does it work on your board?
