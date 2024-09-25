Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C29851B4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 06:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A80310E779;
	Wed, 25 Sep 2024 04:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KaLlC5Yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4810E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:01:21 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-710daaadd9bso3353829a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727236880; x=1727841680;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wv0LNQbODtscukyro5hUsz/iAMlBwMMkYBgi7p9HDmY=;
 b=KaLlC5Yq0Pck2PGWxreciOEZid3LI9VZZcftqgvVLl2LnrWGpgQARTNTot/DF4YNLk
 IJQVpN7h1ELbLEEHkmbLxQeGJKxY3qZEFRHz2tBlKTm70a6A0AhnWW+XlChqjOtLQ3O6
 bh6zbmeJnDo7JGC7SeC5Azy8Jb714+PNeinSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727236880; x=1727841680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wv0LNQbODtscukyro5hUsz/iAMlBwMMkYBgi7p9HDmY=;
 b=jvZrsAcq/EYURjYXDPbGGV4Tou3DDxZtT8Lybu5PGsQMm3iGPJ4Mbyrz4z6f0HY3V6
 PMGV5h9eMvV/2QCfPys3c2wxdkjChiwY6dhxrZXX93+tOzAfqQKe+oMxGZxBc8cJ3RCm
 frJnJZJ3vkhq4QdRdeBr9szeVAKvDOcvW+oK3l1hmnacs7GqrCCRqSGsBLZXDowRCqVc
 eWbmGZXelJ64CLNXE2Mmrb7gvLjRpCMxVGoKQ3isbCVoOfhRC4XGK9Bw9uC7PpJjW3Fd
 0pyUtTiMPYAp+4O+DbgCp70GmiGvQVF2GMVyhN4pfTI5EO14IgjyyHEve3YZkWq4Wlxh
 eGgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV44FHAKfVmIPXJC07rIUu3n/CRmiWmMLWPNtNpUmZULzyfnjVkzL/xx1M3XIlvq/sJBtEfgeH308g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6kHj1ypnletgGHggk19EX23IpE1AwpyvegY1EFRZ+MoIAq/xZ
 0/gw8AtICIV+s2wUEr+gaq7Uy318MOPx9uMri3sYY7R5OQcCId9NxpST6AGZ66YVnBNbY3Ro+fY
 jt7ShStwEmn7F8FIQrg7MX6xNk10KL5RhZrW4
X-Google-Smtp-Source: AGHT+IGgau4syMiJqpfiz+BN973InPoO24YNAxRH9R43N/ngNivhfxeEELeM5iRFh9PG59Y1/XRvme2ovOJhUwuCj+M=
X-Received: by 2002:a05:6830:2d88:b0:710:f76b:350b with SMTP id
 46e09a7af769-713c7d942c7mr1549438a34.5.1727236880259; Tue, 24 Sep 2024
 21:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-2-treapking@chromium.org>
 <CAD=FV=VEMkociw5gyVOtVCPmCyf1b0G7owsAm=o-LxB33YUnjg@mail.gmail.com>
In-Reply-To: <CAD=FV=VEMkociw5gyVOtVCPmCyf1b0G7owsAm=o-LxB33YUnjg@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 25 Sep 2024 12:01:09 +0800
Message-ID: <CAEXTbpe4R8rXHn1+e55RxzryNW-0YexQfr7M5CBz2hP9qneTQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: anx7625: Drop EDID cache on bridge power
 off
To: Doug Anderson <dianders@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
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

Hi,

On Wed, Sep 25, 2024 at 12:43=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Mon, Sep 23, 2024 at 8:53=E2=80=AFPM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > The bridge might miss the display change events when it's powered off.
> > This happens when a user changes the external monitor when the system
> > is suspended and the embedded controller doesn't not wake AP up.
> >
> > It's also observed that one DP-to-HDMI bridge doesn't work correctly
> > when there is no EDID read after it is powered on.
> >
> > Drop the cache to force an EDID read after system resume to fix this.
> >
> > Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to =
DP")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> I'm not totally sure if it matters, but I wonder if you should change
> this to only delete the EDID cache if you're in DP mode and not eDP
> mode? For eDP mode the panel is not allowed to change and re-reading
> it needlessly seems like it would slow down things like
> suspend/resume. I think this would only matter if someone were using
> eDP panels in the "old" way (not under the aux-bus) because we don't
> set the "DRM_BRIDGE_OP_EDID" when we see "aux-bus", so maybe we don't
> care that much but still...

I'll update this in v2.
>
> Other than that, I know that there have been discussions in the past
> about EDID caches but I can't quite remember all the details. I know
> that panel-edp.c still caches it, so we must have concluded that it's
> at least fine/reasonable for panels. I don't remember whether caching
> is encouraged / suggested for external displays, though. Do you happen
> to know if it even makes a difference there (in other words, do you
> actually see multiple calls to read the EDID when you plug in a DP
> display)?

At least on ChromeOS, Chrome triggers two EDID reads when I plug in an
external monitor. I'm not sure if this is common for other DRM masters
though.
>
> -Doug

Regards,
Pin-yen
