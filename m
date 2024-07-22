Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5493B1DD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3D910E6C2;
	Wed, 24 Jul 2024 13:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWbAWe94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B3010E434
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:38:12 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7091558067eso14714a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721637491; x=1722242291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLy2SrIyNS/BtIAkKA6BvJoHkOLVxRWMUEDFd16KBRE=;
 b=mWbAWe94cjE9RAuD+2ubq+zq9XeUueaOd0CO/5fA0u4a24CBKr+4toQZZv35rWsjml
 GrMEwsyE2Xvd3qiqStPismkt29Fa/6rSwFrYmqqADDZZWIT3LI47VqpPl72xFCod8UmH
 lF5H10+OzL+FdZUzihPAJMwizAJ+OdtkZ432mxDSqe7TP6XrGagfR29lJkPxDX4PTBeO
 qvN7W2TaaFgIID+viQeAXGKe34GaHrvAZkYVQbbbD294fNq4jwa7j7OgtJ9BVcOJ7m9r
 o3DWSKEL/eHkgOvSTwFNv4q0rdgBhrob/w1/nsq7Mjy3YaYRrzFlJOfZgVpfkEjTuJf5
 R6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721637491; x=1722242291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLy2SrIyNS/BtIAkKA6BvJoHkOLVxRWMUEDFd16KBRE=;
 b=uCJklGraqfTc1zafdBL+PzDQMEie1iuWNuR/OabFwjaxmXdvYAwgGqSb7cZMuME1WO
 24GfovLsajJfsROSzBrKaWAutMdoAlrwXnQOZCqGGyXNUXCuCXMe3tm+GFjj/jPUUBxL
 dGkUR2FpSf+78btJvyDjWkdzaOV7KZiK9Ta9emhLYvjZ5Pg9R33s7FxJq/wXnYi0dg9s
 L5rwGRXZIye0puidEXmLX17R81VCa+H8hTLd+FSWIyevcRJ9bZqUpKx/YyeqUCdHEqmN
 oJOOhdSc3Xk+G7ML60ykK804prIDpqvAuJf9Lp2tOYIj0BN68JuTR8jDvlbzAiobwHfH
 2yFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3UnKT9uvZ3FgmW7izKLHlcU1EgFEYsq2iHzfJDFDXfd/gbvk4rj1Hu2+voePc3W9SE511QWeyb17rzTTjBOcGnDMdTAtPvebnJ+IDtYVL
X-Gm-Message-State: AOJu0YzTcI0KKa+OdpIYftqorqf2OBgCPoCk1ZGCpv50vI1MV2KIR6AG
 su0IX9RY3hfhyqfDhfe697TgxcINqN45a+eDQ36+/S1tLe6hzIWAvX6z4xxF/lNRVXn9jzc746D
 anbPNerW8BVBH1XRAfuLiCuIvWk8=
X-Google-Smtp-Source: AGHT+IED9sgp0XJRTrLdgRC9+QtNiUQcgpNSQZW++T17WK1mNEKhGIErQwceTSb8Zdl4TwT9yetFMFVBBj0lyMUU2OA=
X-Received: by 2002:a05:6830:6486:b0:704:4c66:b6f3 with SMTP id
 46e09a7af769-708fda82511mr9301123a34.7.1721637491606; Mon, 22 Jul 2024
 01:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
In-Reply-To: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
From: Yanjun Yang <yangyj.ee@gmail.com>
Date: Mon, 22 Jul 2024 16:38:00 +0800
Message-ID: <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
To: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:48 +0000
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

On Fri, Jun 28, 2024 at 8:47=E2=80=AFPM Philippe CORNU
<philippe.cornu@foss.st.com> wrote:
>
>
>
> On 1/29/24 11:41, Raphael Gallais-Pou wrote:
> >
> > This patch series aims to add several features of the dw-mipi-dsi phy
> > driver that are missing or need to be updated.
> >
> > First patch update a PM macro.
> >
> > Second patch adds runtime PM functionality to the driver.
> >
> > Third patch adds a clock provider generated by the PHY itself.  As
> > explained in the commit log of the second patch, a clock declaration is
> > missing.  Since this clock is parent of 'dsi_k', it leads to an orphan
> > clock.  Most importantly this patch is an anticipation for future
> > versions of the DSI PHY, and its inclusion within the display subsystem
> > and the DRM framework.
> >
> > Last patch fixes a corner effect introduced previously.  Since 'dsi' an=
d
> > 'dsi_k' are gated by the same bit on the same register, both reference
> > work as peripheral clock in the device-tree.
> >

This patch (commit id:185f99b614427360) seems to break the dsi of
stm32f469 chip.
I'm not familiar with the drm and the clock framework, maybe it's
because there is no
 "ck_dsi_phy" defined for stm32f469.
PS:  Sorry for receiving multiple copies of this email, I forgot to
use plain text mode last time.

> > ---
> > Changes in v3-resend:
> >       - Removed last patch as it has been merged
> > https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.=
st.com/
> >
> > Changes in v3:
> >       - Fix smatch warning (disable dsi->pclk when clk_register fails)
> >
> > Changes in v2:
> >       - Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS instead of old macro
> >         and removed __maybe_used for accordingly
> >       - Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS
> >
> > Raphael Gallais-Pou (3):
> >    drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
> >    drm/stm: dsi: expose DSI PHY internal clock
> >
> > Yannick Fertre (1):
> >    drm/stm: dsi: add pm runtime ops
> >
> >   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++++++++++---=
-
> >   1 file changed, 238 insertions(+), 41 deletions(-)
> >
>
> Hi Rapha=C3=ABl & Yannick,
> Applied on drm-misc-next.
> Many thanks,
> Philippe :-)
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
