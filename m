Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E99A6DFD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652AC10E16B;
	Mon, 21 Oct 2024 15:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=criticallink.com header.i=@criticallink.com header.b="E7C/hNsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B8B10E543
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:21:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so2545711e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1729524104; x=1730128904;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LJXhrYQrk3gwAFgilc+sphvRBz6z5yynh7/PAYChQI=;
 b=E7C/hNsWCeGlh0z/EN/jOrIowaoqIF4gevZA0jD+0Iu3SlWrBprsdjSFhjyJOmcTpM
 XbgBocgorcZitroZA8V6YhKoeS/xOQGOTqvxr1nnpd0acJ1hSq/lWoGXKAid//ghJhw+
 qv28q9PMAU/6bCs/wyC7W38p84NcIBq8OBUXnojtdUn7eaWJHvG9zenkdWz5N7FIGkJy
 he336MckC3wsgARaH7hm6oa7c1db5CLnp2cerYrL4xVqMiclhzej52MP4A69xlquHmAv
 yYU3i4PzbtfOEbQV9NSyFRZO//o1NZX4truMbyM4Eha2N18dl4Fqr75926DwKLvUkKvp
 5UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729524104; x=1730128904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LJXhrYQrk3gwAFgilc+sphvRBz6z5yynh7/PAYChQI=;
 b=DSOjisdum+R/kCx6QhC/jO4u95Of3Sjo1AgzIK+iWFyes5uaRne4KIyTru3TzP8bBY
 E1CWpZkfnGJ9I4d/vYLj00Op8fMYudQlewohmyZ4JnH6bl2sI3RtqDYx778GEJI8lCfR
 BH4tuaO+tPlpKHKEp1Cp+MuB62qoIa1X3hzIPuukg0mxcB/ZWF927mTHwc3QhaQPTEAA
 V0b4ZZzH8DxFY9BLA6XOqgfGIJ40aO3yv7t+MV9Fe/oxzGbL58TtKPWO5IH4B112eXL0
 rFeo9paJfW1LFFyHtUU+mexobPT4b73KXHIiRzyNOftiy4j87k6KnUeECObe3WAzrvLi
 Y1JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZa4Me3G20UfRLtXQfyKvIMDXfjk2TxrwJaKm3gmW8xEo3m1xrIP9733yyeatPTOZIr9oFmKd7oLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyISvxPl//NlawjL7DycFTLXPwETuBhqeXuxcHlaGaVatSD4wfI
 gdfODB/mjLXJxuGr3gWQ83ieLhOHvB72v/++9X2tB8HIWCO7diCuoxBPUci99IhubS8/pHr6dgR
 LHeCB47Ejfgyxzl0SEcxgZEuTb88BCcV/XTRC
X-Google-Smtp-Source: AGHT+IFXYdf/1S8sUivCEKQLffjqH0HbVL7pn9283MDgZzq8osSfS/mtwn0YAPg2ee14WNWmqyFbTcTg/tuCM+FRyAI=
X-Received: by 2002:a05:6512:31c1:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-53a1520bfaemr7096304e87.3.1729524103994; Mon, 21 Oct 2024
 08:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-1-82ddaec94e4a@ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Oct 2024 11:21:32 -0400
Message-ID: <CADL8D3ZcvynQCGLCcbK=U9-2WB758abLcKaNkTtXN8Y7s=dyqQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/tidss: Fix issue in irq handling causing
 irq-flood issue
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bin Liu <b-liu@ti.com>, stable@vger.kernel.org
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

On Mon, Oct 21, 2024 at 10:08=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> It has been observed that sometimes DSS will trigger an interrupt and
> the top level interrupt (DISPC_IRQSTATUS) is not zero, but the VP and
> VID level interrupt-statuses are zero.
>
> As the top level irqstatus is supposed to tell whether we have VP/VID
> interrupts, the thinking of the driver authors was that this particular
> case could never happen. Thus the driver only clears the DISPC_IRQSTATUS
> bits which has corresponding interrupts in VP/VID status. So when this
> issue happens, the driver will not clear DISPC_IRQSTATUS, and we get an
> interrupt flood.
>
> It is unclear why the issue happens. It could be a race issue in the
> driver, but no such race has been found. It could also be an issue with
> the HW. However a similar case can be easily triggered by manually
> writing to DISPC_IRQSTATUS_RAW. This will forcibly set a bit in the
> DISPC_IRQSTATUS and trigger an interrupt, and as the driver never clears
> the bit, we get an interrupt flood.
>
> To fix the issue, always clear DISPC_IRQSTATUS. The concern with this
> solution is that if the top level irqstatus is the one that triggers the
> interrupt, always clearing DISPC_IRQSTATUS might leave some interrupts
> unhandled if VP/VID interrupt statuses have bits set. However, testing
> shows that if any of the irqstatuses is set (i.e. even if
> DISPC_IRQSTATUS =3D=3D 0, but a VID irqstatus has a bit set), we will get=
 an
> interrupt.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Co-developed-by: Bin Liu <b-liu@ti.com>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> Co-developed-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Co-developed-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Disp=
lay SubSystem")
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

I assume a reviewed by doesn't make sense since I co-developed this
patch but adding my tested by, hopefully, that makes sense.

Tested an equivalent patch for several weeks.
Tested-by: Jonathan Cormier <jcormier@criticallink.com>
>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/=
tidss_dispc.c
> index 1ad711f8d2a8..f81111067578 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -780,24 +780,20 @@ static
>  void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t cl=
earmask)
>  {
>         unsigned int i;
> -       u32 top_clear =3D 0;
>
>         for (i =3D 0; i < dispc->feat->num_vps; ++i) {
> -               if (clearmask & DSS_IRQ_VP_MASK(i)) {
> +               if (clearmask & DSS_IRQ_VP_MASK(i))
>                         dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
> -                       top_clear |=3D BIT(i);
> -               }
>         }
>         for (i =3D 0; i < dispc->feat->num_planes; ++i) {
> -               if (clearmask & DSS_IRQ_PLANE_MASK(i)) {
> +               if (clearmask & DSS_IRQ_PLANE_MASK(i))
>                         dispc_k3_vid_write_irqstatus(dispc, i, clearmask)=
;
> -                       top_clear |=3D BIT(4 + i);
> -               }
>         }
>         if (dispc->feat->subrev =3D=3D DISPC_K2G)
>                 return;
>
> -       dispc_write(dispc, DISPC_IRQSTATUS, top_clear);
> +       /* always clear the top level irqstatus */
> +       dispc_write(dispc, DISPC_IRQSTATUS, dispc_read(dispc, DISPC_IRQST=
ATUS));
>
>         /* Flush posted writes */
>         dispc_read(dispc, DISPC_IRQSTATUS);
>
> --
> 2.43.0
>
