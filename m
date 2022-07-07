Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9056A0B2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 13:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C184914BDF8;
	Thu,  7 Jul 2022 11:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E5814BDF1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 11:01:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sb34so31703674ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sjSXqoI7a+HOTC+YTCSBLGDQWqnl9EwapnigLIHqSzk=;
 b=iG6EIylhIwZjx9zBcet13PJNSBWdfghExcuUmzMef2p0NXrXG2SRh2MepnBv5fUdm7
 Yat1znLxWxiKA7/STWGsDtdiQB1Hglo0LCuZN6Rp2rkDabtLEx0MUspaEPi513ySiBZb
 jRCWSFg9Gu9dtC/FVfKUlFHn1MgqcBceSYIm64vU5r+SGecfH7OOgr3FE+eU7UiI7PsG
 HTI3CcrTEwraENMSI9b4k8hmPoLjhM72MGMZFGLKa7vhu9ej5poBkNGmjIF5rP2lsxBN
 lI72V89qOJwJUgdpuYW9EASdBx+nCIb+RS/+mcAOaC5kCFEwpnKq0AdoLXfFbolYiz1L
 Gtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sjSXqoI7a+HOTC+YTCSBLGDQWqnl9EwapnigLIHqSzk=;
 b=u3j90tDCU6+QkmchFUm258yOXUe4RZmsruMC23oJX/UvV4PpzBg/q2BP9CTKplKszM
 UPCQDagsr1ChsNmYLV9zAkaOTGq/zcxnl2sQkwUI/cKSsbXtTlU5yuGv97hzOLWQUBHF
 B6SLEdIEn/m815n9HQUXpLH5LFzOpt6WxTGDpC9WKveDC+dmZf+8jDzTBLqH48xamc/W
 dGJk5H6ojTtJsn8602EAGVjvESpKKQQ6hDsR1Wov5i52OzCnQArdQUHc+/crTaksAJXt
 s+3SpEkbfX1/Q3RcYxJXFraFk48f+/a2LndBXjjkB4sR4IUoqcIFaTi+tCnNc12vk8h9
 7VmQ==
X-Gm-Message-State: AJIora+rHBqIg4/H3wykzHrMIyre3m7ASa4yHkDGA5TjyUEOK8lGVtzQ
 745rNROkJdeBsR9AjoWCRIqDDvJqTc+AKJUzKCwU8Q==
X-Google-Smtp-Source: AGRyM1tshOPj4suuDXTbEPdKeVduVbjptKtkSRYnKzY+oqKLXU+GQLqXwfPKavWxbr1VVW2HNoT8Hl1TSgM18vZZzGg=
X-Received: by 2002:a17:906:8459:b0:72a:ee63:ca58 with SMTP id
 e25-20020a170906845900b0072aee63ca58mr11472249ejy.487.1657191691742; Thu, 07
 Jul 2022 04:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220612144854.2223873-1-alvin@pqrs.dk>
In-Reply-To: <20220612144854.2223873-1-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 7 Jul 2022 13:01:19 +0200
Message-ID: <CAG3jFyvOBAXxBgv2JtEg=0hOeM0UN5CaOQopzvA2twE6ew6zyA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] drm: bridge: adv7511: two fixes for CEC
To: alvin@pqrs.dk
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Alvin,

On Sun, 12 Jun 2022 at 16:49, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> Previously sent back in March, see here:
>
> https://lore.kernel.org/dri-devel/20220319145939.978087-1-alvin@pqrs.dk/
>
> No changes besides rebasing on today's drm-misc-fixes.
>
> Alvin =C5=A0ipraga (2):
>   drm: bridge: adv7511: fix CEC power down control register offset
>   drm: bridge: adv7511: unregister cec i2c device after cec adapter
>
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 5 +----
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 4 ++--
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 ++---
>  3 files changed, 5 insertions(+), 9 deletions(-)
>
> --
> 2.36.1
>

Sorry about being incredibly slow reviewing & merging this relatively
simple series.

Applied to drm-misc-next.
