Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12C6ECDE5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 15:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31F810E4FA;
	Mon, 24 Apr 2023 13:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF4410E088
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 15:58:14 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-545d82e1a1bso1032407eaf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682265493; x=1684857493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TB7sS0vRaJ2yMh+LCRuJhJdEEsjAZfdxyZZU3tIGV3w=;
 b=nreCZNs4rCLf53m2uxKivjAK5veHlYlfDOgPm2u77TmfMmpK773ntvHeJIEuq09xO5
 xbqGyym8z8wVu+DfFxY2a2BKkaKgR2M3QhT056LbkH+yLapBES5ZkLKfN/FRViucCAnR
 5WU2sbiIP6ZLNPD8zmnLsQZAIoGvHUne4fi4AmJX4oLmpKmNMrCa1/DKv8tkwaHNycoK
 0S9U7oV2kRJAtcSJ1ye/rK7Ulehoxln0KbgZNiLgYIcTs7JakJ+JyDimPGtDa9GXKfmV
 AxoW10nEFOE6ymI8jclGFXUDUfpUYUjKil+8LMVE7Dkicc0oGclKbceTBhWSjLjNlqSZ
 bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682265493; x=1684857493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TB7sS0vRaJ2yMh+LCRuJhJdEEsjAZfdxyZZU3tIGV3w=;
 b=bR1n55FkjUKnLol9xx9k/rexIMXFt7GLiZOYNdFGMKTGGjSU9j4yxxGzoSpKz3XqJ4
 O6JeJcBsGcg5CuahiTr6Efgup7dvm0osyqRQaXWoj8W8dvPTgD75Bey5mo9KIo32Znmr
 siHgAtH5dlhE+PIOXYDiZmj3J60SsR1I7Yt5S3Q7IytcjbpCU6EO+HwOgC4X0FuXmtjO
 DYHld5pWfcN3H5Lz3Pp0ERgPEVAgP0zOVxItRnhOXPErWgIYXCc0Bq1Byje4yca/wyD6
 wDzj2FUwvJQQu2vDpNHO9Snf5Xt6i+AJSrBYY7h9C48SIDQLaueA+qHeUmjz1C0DdLFN
 4fzg==
X-Gm-Message-State: AAQBX9fp533kbl88ppMMKEY4F3k7FioeD5tn/h+ksinxV1RSQV1acxFn
 imzVv4HDhZ+PhajjmsV+PRhMk6HvrrpaIbmH3bw=
X-Google-Smtp-Source: AKy350a6iasbl3Y30SH+Pb3zS0L6cJ79O57apgTOobSuLfzcqdaDbZvPuYRl6XtAFAKRgDNFkDMleBI+oT8sFA5R9g0=
X-Received: by 2002:a05:6808:148c:b0:38d:ec3f:3118 with SMTP id
 e12-20020a056808148c00b0038dec3f3118mr6742551oiw.28.1682265493116; Sun, 23
 Apr 2023 08:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230414181641.8868-1-hymmsx.yu@gmail.com>
 <CAMty3ZD=SVZg=EQO9-mxPp9TZzu2hOpZ8qDP5asE276zbTJ7Zg@mail.gmail.com>
 <CAMpKc0mZ-0tyQTssCpdfByhq1b2uX8WOa=D-CuLrHHooKgz4Nw@mail.gmail.com>
 <CAMty3ZAcg6BXywmQZfk2PMSWyi8-+3i-oFnNETw3fRepDaG0Pw@mail.gmail.com>
In-Reply-To: <CAMty3ZAcg6BXywmQZfk2PMSWyi8-+3i-oFnNETw3fRepDaG0Pw@mail.gmail.com>
From: =?UTF-8?B?5L2Z5rK75Zu9?= <hymmsx.yu@gmail.com>
Date: Sun, 23 Apr 2023 23:57:57 +0800
Message-ID: <CAMpKc0nb5MUkCzz4i+fuVEzpVCM-uF3DBYEacBxCTh-maQ8ZdA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:Fix the panic problem caused by
 bridge->funcs->attach
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: multipart/alternative; boundary="000000000000229bb105fa02f5d0"
X-Mailman-Approved-At: Mon, 24 Apr 2023 13:27:52 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000229bb105fa02f5d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

two separate pipeline:crtc->encoder->bridge->connector->panel

Jagan Teki <jagan@amarulasolutions.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8823=
=E6=97=A5=E5=91=A8=E6=97=A5 19:10=E5=86=99=E9=81=93=EF=BC=9A

> + Bridge Maintainers
>
> On Wed, Apr 19, 2023 at 8:35=E2=80=AFAM =E4=BD=99=E6=B2=BB=E5=9B=BD <hymm=
sx.yu@gmail.com> wrote:
> >
> > The log looks like this:
> > [ 31.723823] Internal error: Oops: 96000004 [#1] SMP\013 \010
> > [ 31.729030] Modules linked in:\013 \010
> > [ 31.733395] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.59+2.0.0
> #250\013
> > \010
> > [ 31.745167] pstate: 60c00005 (nZCv daif +PAN +UAO -TCO BTYPE=3D--)\013
> \010
> > [ 31.752785] pc : drm_bridge_attach+0xdc/0x1a4\013 \010
> > [ 31.757518] lr : drm_bridge_attach+0x40/0x1a4\013 \010
> > [ 31.762104] sp : ffff0000000678f0\013 \010
> > [ 31.765726] x29: ffff0000000678f0 x28: ffff00000031c880 \013 \010
> > [ 31.771599] x27: 0000000000000060 x26: ffff800010539e90 \013 \010
> > [ 31.777340] x25: ffff0000000a6000 x24: ffff000000129c10 \013 \010
> > [ 31.783060] x23: 0000000000000000 x22: ffff0000000131c0 \013 \010
> > [ 31.788770] x21: ffff80001052a5b8 x20: ffff0000003e2c80 \013 \010
> > [ 31.794506] x19: ffff000000017080 x18: 0000000000000010 \013 \010
> > [ 31.800210] x17: 000000005fcfcd6c x16: 00000000d27b105e \013 \010
> > [ 31.805907] x15: 00000000000000c7 x14: ffff0000000675d0 \013 \010
> > [ 31.811599] x13: 00000000ffffffea x12: ffff8000114158c0 \013 \010
> > [ 31.817282] x11: 0000000000000003 x10: ffff800011295880 \013 \010
> > [ 31.823000] x9 : ffff8000112958d8 x8 : 000000000017ffe8 \013 \010
> > [ 31.828731] x7 : c0000000fffeffff x6 : 0000000000000001 \013 \010
> > [ 31.834425] x5 : 000000000057ffa8 x4 : 0000000000000000 \013 \010
> > [ 31.840101] x3 : 0000000000000000 x2 : ffff000000013218 \013 \010
> > [ 31.845787] x1 : ffff0000003e2cf8 x0 : 0000000000000000 \013 \010
> > [ 31.851594] Call trace:\013 \010
> > [ 31.854603] drm_bridge_attach+0xdc/0x1a4\013 \010
> > [ 31.859079] dw_mipi_dsi_bridge_attach+0x98/0xa8\013 \010
> > [ 31.864035] drm_bridge_attach+0x104/0x1a4\013 \010
> > [ 31.869211] dw_mipi_dsi_bind+0x24/0x58\013 \010
> > drm_bridge_attach will call bridge->funcs in many cases, so I think it
> is necessary to check=E3=80=82
>
> I don't think the bridge pointer or bridge->funcs pointer is NULL
> here. It looks like the controlling is attaching the bridge prior to
> registering it. If I remember correctly, I got a similar issue with
> rockchip-drm pipeline. Would you please share your pipeline as well?
>
> Thanks,
> Jagan.
>

--000000000000229bb105fa02f5d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">two separate pipeline:crtc-&gt;encoder-&gt;bridge-&gt;conn=
ector-&gt;panel<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions.=
com">jagan@amarulasolutions.com</a>&gt; =E4=BA=8E2023=E5=B9=B44=E6=9C=8823=
=E6=97=A5=E5=91=A8=E6=97=A5 19:10=E5=86=99=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">+ Bridge Maintainers<br>
<br>
On Wed, Apr 19, 2023 at 8:35=E2=80=AFAM =E4=BD=99=E6=B2=BB=E5=9B=BD &lt;<a =
href=3D"mailto:hymmsx.yu@gmail.com" target=3D"_blank">hymmsx.yu@gmail.com</=
a>&gt; wrote:<br>
&gt;<br>
&gt; The log looks like this:<br>
&gt; [ 31.723823] Internal error: Oops: 96000004 [#1] SMP\013 \010<br>
&gt; [ 31.729030] Modules linked in:\013 \010<br>
&gt; [ 31.733395] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.59+2.0.0 #=
250\013<br>
&gt; \010<br>
&gt; [ 31.745167] pstate: 60c00005 (nZCv daif +PAN +UAO -TCO BTYPE=3D--)\01=
3 \010<br>
&gt; [ 31.752785] pc : drm_bridge_attach+0xdc/0x1a4\013 \010<br>
&gt; [ 31.757518] lr : drm_bridge_attach+0x40/0x1a4\013 \010<br>
&gt; [ 31.762104] sp : ffff0000000678f0\013 \010<br>
&gt; [ 31.765726] x29: ffff0000000678f0 x28: ffff00000031c880 \013 \010<br>
&gt; [ 31.771599] x27: 0000000000000060 x26: ffff800010539e90 \013 \010<br>
&gt; [ 31.777340] x25: ffff0000000a6000 x24: ffff000000129c10 \013 \010<br>
&gt; [ 31.783060] x23: 0000000000000000 x22: ffff0000000131c0 \013 \010<br>
&gt; [ 31.788770] x21: ffff80001052a5b8 x20: ffff0000003e2c80 \013 \010<br>
&gt; [ 31.794506] x19: ffff000000017080 x18: 0000000000000010 \013 \010<br>
&gt; [ 31.800210] x17: 000000005fcfcd6c x16: 00000000d27b105e \013 \010<br>
&gt; [ 31.805907] x15: 00000000000000c7 x14: ffff0000000675d0 \013 \010<br>
&gt; [ 31.811599] x13: 00000000ffffffea x12: ffff8000114158c0 \013 \010<br>
&gt; [ 31.817282] x11: 0000000000000003 x10: ffff800011295880 \013 \010<br>
&gt; [ 31.823000] x9 : ffff8000112958d8 x8 : 000000000017ffe8 \013 \010<br>
&gt; [ 31.828731] x7 : c0000000fffeffff x6 : 0000000000000001 \013 \010<br>
&gt; [ 31.834425] x5 : 000000000057ffa8 x4 : 0000000000000000 \013 \010<br>
&gt; [ 31.840101] x3 : 0000000000000000 x2 : ffff000000013218 \013 \010<br>
&gt; [ 31.845787] x1 : ffff0000003e2cf8 x0 : 0000000000000000 \013 \010<br>
&gt; [ 31.851594] Call trace:\013 \010<br>
&gt; [ 31.854603] drm_bridge_attach+0xdc/0x1a4\013 \010<br>
&gt; [ 31.859079] dw_mipi_dsi_bridge_attach+0x98/0xa8\013 \010<br>
&gt; [ 31.864035] drm_bridge_attach+0x104/0x1a4\013 \010<br>
&gt; [ 31.869211] dw_mipi_dsi_bind+0x24/0x58\013 \010<br>
&gt; drm_bridge_attach will call bridge-&gt;funcs in many cases, so I think=
 it is necessary to check=E3=80=82<br>
<br>
I don&#39;t think the bridge pointer or bridge-&gt;funcs pointer is NULL<br=
>
here. It looks like the controlling is attaching the bridge prior to<br>
registering it. If I remember correctly, I got a similar issue with<br>
rockchip-drm pipeline. Would you please share your pipeline as well?<br>
<br>
Thanks,<br>
Jagan.<br>
</blockquote></div>

--000000000000229bb105fa02f5d0--
