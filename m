Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61E5A50E6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D295C10E488;
	Mon, 29 Aug 2022 16:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A8110E488
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 16:02:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id se27so8905071ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=PWMBMRMPN5GhvCOAnnAdFknz4G+9De4RqcsPk0Z1BG4=;
 b=NYJnIKLUJrUZStzT8ciuU41oE7tVij2lLq+s+AiEcOqIZwRO2tVIvUmDN2h0h+krqo
 d1IzFfocFezhlX9U9fk02nHKFeBuuQqrjG5Yixliri9tUNIVf5qacBQipFaZczv6jP4A
 vq9KS79+uIf3t1gDDWkMp9aXUQtbyAvr3/NdRmEG/UJ5blaAxBSEHgjSQRSS2N2TYk0R
 0Yn8HMa9dyg/hOoPn2qBkP1VxMq4+A4RxXM4M9k2ohO+Nup6xhbaGD+0qpjE9I1Pn/gg
 Na7hh1ha8jwnRIXebmeJHDx33e6q7F7H9UpnJ9dQ+Imp4gxiyNPLG8V+wCLbY0aU2FcE
 Mk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=PWMBMRMPN5GhvCOAnnAdFknz4G+9De4RqcsPk0Z1BG4=;
 b=xmUrxzUOQdWLIqpeV6vnIWFoGaRv2XY9TJUgOI1RqGsQpWZmpCOcZ7Jced1NZFs17b
 lHU8oUmXO3l7U6MTv5Hh/yB3kuBef4rowiHAaeLjkW1hzrrABHK5EAOFVgjGLB/OVcNX
 71RB6bIOelTgyYRkwyZzTpecVkmZtIpfKS21awfuuESDxlQYDIsJXsHMq7Uac67ZzY4h
 tbH9gIgTaTOFJ3VZORmFCLFTvfxIqa59FmLKC4u8TMZ2IBn8wjeQpw8SQiMRpkYrjjuB
 Y7w3dtYpHqgCljiJNmn3P01SRdD5wRfUHfdVfqz610fuMzLgg0h5ZZxfntvzQ6wj2ohE
 s/RQ==
X-Gm-Message-State: ACgBeo2LOswsvNGW8hVD65nxhYK17QaJGn5pYOj/gBAU7Pux+GM2Y9Oj
 ihPIpu7uFtyO0cDnpGcO71QjPyo7sZNtdBp6tSQmVw==
X-Google-Smtp-Source: AA6agR6el4xi1uh8MNRyeKzalfI37Tyvgw01vmh8rhtJ4CKqz7iElZwCgeZkvXcMx5FicxZX67QbZ1VGJh0PgF+k3xo=
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr10122140ejb.514.1661788948001; Mon, 29
 Aug 2022 09:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220319151016.983348-1-alvin@pqrs.dk>
In-Reply-To: <20220319151016.983348-1-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 18:02:17 +0200
Message-ID: <CAG3jFyvqPFL4d=s6DsbVZOzkuMwwi-GUZwFYyeajr=jLqmdm4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: bridge: adv7511: CEC support for ADV7535
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alvin,

Sorry about being slow to get to this series.

Can you rebase it on drm-misc-next and send out the next version?

On Sat, 19 Mar 2022 at 16:10, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> We have an ADV7535 which is nominally supported by this driver. These
> two patches fix up the driver to get CEC working too.
>
> The first adds the basic support by correcting some register offsets.
>
> The second addresses an issue we saw with CEC RX on the ADV7535. It
> hasn't been tested with the other chips (e.g. ADV7533), although it
> should be compatible. I'm sending it against drm-misc-next because the
> issue wasn't reported for other chips, and ADV7535 didn't have CEC
> support before. But feel free to take it into -fixes instead.
>
> Alvin =C5=A0ipraga (2):
>   drm: bridge: adv7511: enable CEC support for ADV7535
>   drm: bridge: adv7511: use non-legacy mode for CEC RX
>
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  27 ++++-
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 116 +++++++++++++------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  22 +++-
>  3 files changed, 119 insertions(+), 46 deletions(-)
>
> --
> 2.35.1
>
