Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363C9851EE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 06:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B3D10E05C;
	Wed, 25 Sep 2024 04:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kErm4Sqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A611F10E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:12:16 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-710e01dd554so3611733a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 21:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727237536; x=1727842336;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCCHOcW6PDYekuFAKP/cXwDkj9QRVyrD+2nvry9Ki8c=;
 b=kErm4Sqk34xXOa0U2Gt5uPc9FfEBIJB6I6ptPTEUpzpImBr/dY7iis1T58FiVzRbxU
 7yxfyjV8I67Ut4Ux//fFL3CDobuIstrRjrXKwRvF/Xh080FvkRNi9o8suuqEPCyQ9mBx
 Pu+DUDig+4gho2i1vesGQQ9Z3QrnIEZ8e455M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727237536; x=1727842336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCCHOcW6PDYekuFAKP/cXwDkj9QRVyrD+2nvry9Ki8c=;
 b=TQpeguDdJjK25v0lqAqqEa51qqDeobQnuwY+kbeje5qGGhu7BVwIfMpSsxz/FaJV+9
 DHjRWPvPhetvmitadVzHw2QEfGFpha+vGc5FJQ9eEGgWt19AXfV5+xZaXGz9bEBCTtN3
 fsZXheOHJUuVYV9+O1YL6ebm8hPw88PZNw1xsacOqdQzqYep/F55c3hOGWUqWSVEqiQy
 LB3YonpBDdUn494rf86wGCbohSp6yfBcqIpzo9ZLgwhoONy03EnCBd7CTYCzddrJTaqD
 6KiByKAnxxZ34/ZEVG6zQom6UEAuEHFhAQ3I0OoHQzsO10syB/zEmo+ylTzhGfjn+Hfl
 0ajQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvwFNXNR1dFkMhQ0CMCedM843kisdG5HEiqfPfK/E9j7+Zz+jXhGg/TxIFfSLT/Ebzcar+9QrgvpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN5I3QqN6jtTPZiLmXQm1Bi5s+NAQSYS8KNOaYmRl0zg/u8rLk
 mStHWzsVMN8VRFqPagAn9lucvNVuX4Z/TYxkDhFiCRrJH/Oa4N39O6rLW/1LzXQzRb9N4AFufmu
 nAohDjg5Mhx2d3LaVGtR6YuTM2GhOP/sac39CdpyIeBjt3yIejQ==
X-Google-Smtp-Source: AGHT+IEen4KEwECA8Pn5n5uArtwXa5aiPy709MZmXOWELSNauMqF45DgHEuB+OYeDI80hjN84eq4La4V59Sb/VriRfA=
X-Received: by 2002:a05:6830:310f:b0:711:3ed:4226 with SMTP id
 46e09a7af769-713c7d96e0dmr1136133a34.7.1727237535820; Tue, 24 Sep 2024
 21:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-3-treapking@chromium.org>
 <CAD=FV=X2V+LQ1XOo_eJ1Vv3Pn+E309kvyY9FOzaZP_j8ToXM2g@mail.gmail.com>
In-Reply-To: <CAD=FV=X2V+LQ1XOo_eJ1Vv3Pn+E309kvyY9FOzaZP_j8ToXM2g@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 25 Sep 2024 12:12:05 +0800
Message-ID: <CAEXTbpfHUfq6rmSZkXdAYZ-W03t7vMcACUmyco6xL5A4T_Ok=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: it6505: Drop EDID cache on bridge power
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

On Wed, Sep 25, 2024 at 1:48=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
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
> > Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> Ah, I guess this answers my question in the previous patch about
> whether caching was important even for external displays since this
> driver only supports external DP and the commit you mention in "Fixes"
> says that caching was important.
>
> So this looks reasonable. One thing I wonder is if you're totally
> guaranteed to get a PM Runtime suspend whenever you get an unplug /
> replug of a display. I tried to dig a little bit but I'm not super
> familiar with this bridge and it looks complicated enough that I guess
> I'll have to trust that it's fine. So...

it6505_remove_edid() is also called when the bridge reads HPD low in
the IRQ handler or the DPCD sink count changes to 0 after a HPD_IRQ
signal. The assumption here is that if the bridge is still powered on,
then it should be aware of the monitor change events and drop the EDID
cache when needed. This patch addresses the scenario where monitor
changes are not communicated to the bridge when it is powered off.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Regards,
Pin-yen
