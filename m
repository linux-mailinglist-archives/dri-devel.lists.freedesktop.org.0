Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1029814D56
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CA810EA54;
	Fri, 15 Dec 2023 16:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C1D10EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 16:40:34 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-28b436f6cb9so103220a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702658434; x=1703263234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P25CbsehI2ZDoWt8jYG9StimuRm4R3IkYru7E52Ud9o=;
 b=LmWKcwXxGBChR9wHX0hLNICstld9Bc2NfnmNl8T3MoSzUGEdcYIEolCCD8j3Sk5Ot5
 4ZG80cF9OjB1Dcffl1B/ynvWD9TnRIk5dJn77nmTnP5t13ljMipzNEV2ewQYx3Kcm7WD
 tfTdiPTXufPvAAIvtjdImp2g1YAyH4ycagMeN8W0n6ULxyMX/lHFKQrg3xCWH1+iG8Jd
 n29RJjKTBbHMvCuuiqO1F7uCYBkxxrh73S4gE70H1PEqLDRt2spyBw3qhvKf8COY936V
 ssDM3CetTi+Je4tZsI9uYV7wX5SpYfQMjmHckWtzrb93N7MwP1+HNIcPu0NofVaOv6dY
 G6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702658434; x=1703263234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P25CbsehI2ZDoWt8jYG9StimuRm4R3IkYru7E52Ud9o=;
 b=axcr3dI7aFZfz5E242LunnKS6Hp/xgp+bEwYqm1NdxAkwP5qTTWPj3vk5yc0e6EGDF
 GJ/uA7Ub0iJZvniK2wcvY/azTAhw9QN11xTE526fFoxa8Hq0tFx4UT0dNqICuGxSMARO
 Yn2z0iRZh+iDhZj65SfgticSpgu7kl5JDbnSxj1o3IOL8cpswoJJpaqb9lfJYwSNZ/sF
 GT3Bd38fVBZh1FlxMPXldxAorhRGzCHVAcqy3T3T8nyfFUjVNr2j8Jpl4nTnpjwWXi+q
 W7VdmNf3IxMDr3rdw1PgTADcoLlK0lYG56kD+WZyYaGvdLLxp7nBjGNzAzN/vdj2o4vA
 Qjjg==
X-Gm-Message-State: AOJu0Yx8COITvbyiM5uWrzF6bg3+Hkn5ikPGFmEOIT9sQZp1xBbJOYYm
 9mmOkXiYRpUIJWgG5/18IgOopeK0AMDIAnwuuIU=
X-Google-Smtp-Source: AGHT+IFuSK9mMYf2tzt4qdasmJNq1qeadzqiV6T7OQnjj9RaK23eMPy4F59kvNXJlhXKl73Qd4YLnG1VowwzUkWhndA=
X-Received: by 2002:a17:90a:578c:b0:285:cc9c:7406 with SMTP id
 g12-20020a17090a578c00b00285cc9c7406mr9402919pji.15.1702658433586; Fri, 15
 Dec 2023 08:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
In-Reply-To: <20231215142308.GL21146@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 15 Dec 2023 10:40:22 -0600
Message-ID: <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 8:23=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Dec 15, 2023 at 10:31:27AM -0300, Fabio Estevam wrote:
> > On Sun, Dec 10, 2023 at 2:35=E2=80=AFPM Adam Ford wrote:
> >
> > > Lucas,
> > >
> > > It's been a few months since there has been any action.  If you want,
> > > I can help apply the suggestions that Laurent has and re-submit with
> > > both of our names if you want.  It would be nice to get this
> > > integrated.
> >
> > It would be nice if you could re-submit the series.
>
> Yes, that would be nice. It shouldn't cause any issue, the patches will
> retain Lucas' authorship.

I started looking into this today, but there appears to be some
dependencies missing because the PVI is just one small portion of
this. The PVI needs to interact with the hdmi_blk_ctrl and the hdmi
transmitter itself.

It looks like there was at least one attempt to push the hdmi driver,
but we're also missing some hdmi power domain information, and the dri
patchwork lists a bunch of proposed patches for the lcdif driver.  I
haven't looked through them all, so I don't know if they are
necessary.  I found a git repo with Lucas' stuff, but it's based on
the 6.0 kernel, so it's fairly old.  Either way it seems like there is
more to the HDMI than just his one series.

adam
>
> --
> Regards,
>
> Laurent Pinchart
